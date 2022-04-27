
unit EditRQPlanItemBankDetail;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
	  EnergyproController, EnergyproController2, RQPlanItemBankDetailController ;

type
  TfrmRQPlanItemBankDetailEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIORQPlanItemBankDetail: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    grpplat: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtOurAccount: TEdit;
    edtOurMFO: TEdit;
    grppoluch: TGroupBox;
    lblOrgOkpo: TLabel;
    edtOrgOkpo: TEdit;
    lblOrgName: TLabel;
    edtOrgName: TEdit;
    lblOrgAccount: TLabel;
    edtOrgAccount: TEdit;
    lblBankMfo: TLabel;
    edtBankMfo: TEdit;
    btnBankingDetails: TSpeedButton;
    btnbankingDetailsClear: TSpeedButton;
    spbRQOrgOrg: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBankingDetailsClick(Sender: TObject);
    procedure spbRQOrgOrgClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  bankingDetailsCode : Integer;
  editByRqBill : Boolean; // изменить реквизиты по строке second (false) , изменить реквизиты по всему счету (true)
  planItemSecondRefCode : Integer;
end;

var
  frmRQPlanItemBankDetailEdit: TfrmRQPlanItemBankDetailEdit;
  RQPlanItemBankDetailObj: RQPlanItemBankDetail;

implementation

uses ShowENBankingDetails, ENBankingDetailsController, ShowRQOrg,
  RQOrgController, RQOrgRschetController, EditRQOrgRschetFilter,
  ShowRQOrgRschet, RQPlanPayItemSecondController;


{uses  
    EnergyproController, EnergyproController2, RQPlanItemBankDetailController  ;
}
{$R *.dfm}



procedure TfrmRQPlanItemBankDetailEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
     DisableControls([edtOurAccount , edtOurMFO ,  edtOrgOkpo , edtOrgAccount , edtBankMfo  ,  edtCode]);
  end;
  if DialogState = dsEdit then
  begin
     DisableControls([edtOurAccount , edtOurMFO ,  edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtOurMFO
      ,edtOurAccount
      ,edtOrgOkpo
      ,edtOrgName
      ,edtOrgAccount
      ,edtBankMfo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPlanItemBankDetailObj.code);
    edtOrgOkpo.Text := RQPlanItemBankDetailObj.orgOkpo; 
    edtOrgName.Text := RQPlanItemBankDetailObj.orgName;
    edtOrgAccount.Text := RQPlanItemBankDetailObj.orgAccount; 
    edtBankMfo.Text := RQPlanItemBankDetailObj.bankMfo; 


  end;
end;



procedure TfrmRQPlanItemBankDetailEdit.spbRQOrgOrgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   org : RQOrg;
   TempRQOrg : RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
   frmRQOrgRschetShow : TfrmRQOrgRschetShow;
   TempRQOrgRschet : RQOrgRschetControllerSoapPort;
   orgid : integer;
   partnerCode: String;
begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
              edtOrgName.Text := GetReturnValue(sgRQOrg,1);

              edtOrgOkpo.Text := GetReturnValue(sgRQOrg,2);
              orgid := strtoint(GetReturnValue(sgRQOrg,0));
              //partnerCode := GetReturnValue(sgRQOrg,8);
              partnerCode := GetReturnValue(sgRQOrg,25);
            except
              on EConvertError do Exit;
            end;
        end;

        if edtOrgName.Text <> '' then
        begin
          frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application,fmNormal);
          try
             frmRQOrgRschetShow.FilterObject := RQOrgRschetFilter.Create;
             SetNullIntProps(frmRQOrgRschetShow.FilterObject);
             SetNullXSProps(frmRQOrgRschetShow.FilterObject);
             RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).orgId := orgid;
             RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := partnerCode;
             frmRQOrgRschetShow.Caption := 'Розрахункові рахунки';
             DisableActions([frmRQOrgRschetShow.actNoFilter], true);

             with frmRQOrgRschetShow do
                if ShowModal = mrOk then
                begin
                    try

                       edtBankMfo.Text := GetReturnValue(sgRQOrgRschet,3);
                       edtOrgAccount.Text := GetReturnValue(sgRQOrgRschet,1);

                    except
                       on EConvertError do Exit;
                    end;
                end;
          finally
             frmRQOrgRschetShow.Free;
          end;
        end
        else
        begin
          Application.MessageBox(PChar('Виберіть постачальника!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
          Exit;
        end;

   finally
      frmRQOrgShow.Free;
   end;


end;

procedure TfrmRQPlanItemBankDetailEdit.btnBankingDetailsClick(Sender: TObject);
var
 frmENBankingDetailsShow :  TfrmENBankingDetailsShow;
 filter : ENBankingDetailsFilter;
  MyClass: TComponent;
begin
    filter := ENBankingDetailsFilter.create();
     SetNullIntProps(filter);
     SetNullXSProps(filter);

   filter.conditionSQL := ' ENBANKINGBILLTYPE.CODE in (2,3,4,5)';

   frmENBankingDetailsShow := TfrmENBankingDetailsShow.Create(Application,fmNormal, filter);

   try
    with frmENBankingDetailsShow do
      begin
      DisableActions([ actEdit, actInsert, actDelete ]);
         if ShowModal = mrOk then
        begin
            try
              edtOurMFO.Text := GetReturnValue(sgENBankingDetails,3);
              edtOurAccount.Text := GetReturnValue(sgENBankingDetails,4);
              bankingDetailsCode := StrToInt(GetReturnValue(sgENBankingDetails,0));
              
            except
               on EConvertError do Exit;
            end;
        end;
      end;

   finally
      frmENBankingDetailsShow.Free;
   end;

end;

procedure TfrmRQPlanItemBankDetailEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanItemBankDetail: RQPlanItemBankDetailControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtOrgOkpo
      ,edtOrgName
      ,edtOrgAccount
      ,edtBankMfo
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPlanItemBankDetail := HTTPRIORQPlanItemBankDetail as RQPlanItemBankDetailControllerSoapPort;


     RQPlanItemBankDetailObj.orgOkpo := edtOrgOkpo.Text; 

     RQPlanItemBankDetailObj.orgName := edtOrgName.Text; 

     RQPlanItemBankDetailObj.orgAccount := edtOrgAccount.Text; 

     RQPlanItemBankDetailObj.bankMfo := edtBankMfo.Text;

    // RQPlanItemBankDetailObj.planItemSecondRef := RQPlanPayItemSecondRef.Create;
    // RQPlanItemBankDetailObj.planItemSecondRef.code := planItemSecondRefCode;


     if bankingDetailsCode = 0 then
     begin
      Application.MessageBox(PChar('Неизвестны реквизиты плательщика !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
     end;

     RQPlanItemBankDetailObj.bankingRef := ENBankingDetailsRef.Create;
     RQPlanItemBankDetailObj.bankingRef.code :=  bankingDetailsCode;

    if DialogState = dsInsert then
    begin
      RQPlanItemBankDetailObj.code:=low(Integer);
      TempRQPlanItemBankDetail.add(RQPlanItemBankDetailObj);
    end
    else
    if DialogState = dsEdit then
    begin
      if not editByRqBill then
      TempRQPlanItemBankDetail.save(RQPlanItemBankDetailObj)
      else
      TempRQPlanItemBankDetail.saveByRqBill(RQPlanItemBankDetailObj);

    end;
  end;
end;


end.