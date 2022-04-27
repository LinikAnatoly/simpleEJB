
unit EditFINContracts;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINContractsController, RQOrgController ;

type
  TfrmFINContractsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
  spbRQOrgOrg : TSpeedButton;
  

  HTTPRIOFINContracts: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblRQOrgOrgName: TLabel;
    spbRQOrg: TSpeedButton;
    spbRQOrgClear: TSpeedButton;
    edtRQOrgOrgName: TEdit;
    GroupBox1: TGroupBox;
    lblContractDate: TLabel;
    lblFinDocCode: TLabel;
    lblFinDocID: TLabel;
    lblContractNumber: TLabel;
    spbContractNumber: TSpeedButton;
    spbContractNumberClear: TSpeedButton;
    edtContractDate: TDateTimePicker;
    edtFinDocCode: TEdit;
    edtFinDocID: TEdit;
    edtContractNumber: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbRQOrgOrgClick(Sender : TObject);
    procedure spbRQOrgClick(Sender: TObject);
    procedure spbContractNumberClearClick(Sender: TObject);
    procedure spbContractNumberClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    //org: RQOrg;
    //contractNumber: String;
    //contractDate: TDate;
    //finDocCode: String;
    //finDocID: Integer;
  end;

var
  frmFINContractsEdit: TfrmFINContractsEdit;
  FINContractsObj: FINContracts;

implementation

uses
  ShowRQOrg
//  ,RQOrgController
, ENConsts, ShowFINServicesObject, ENServicesObjectController, DMReportsUnit;

{uses  
    EnergyproController, EnergyproController2, FINContractsController  ;
}
{$R *.dfm}



procedure TfrmFINContractsEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtRQOrgOrgName, edtContractNumber, spbContractNumber,
                   edtCode, edtContractDate, edtFinDocCode, edtFinDocID]);
  /////

  if DialogState = dsView then
  begin
    DisableControls([spbRQOrg, spbRQOrgClear, spbContractNumber, spbContractNumberClear]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtRQOrgOrgName, edtContractNumber]);
  end;

  if DialogState = dsEdit then
    DisableControls([spbRQOrg, spbRQOrgClear, spbContractNumber, spbContractNumberClear]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(FINContractsObj.code);
    edtContractNumber.Text := FINContractsObj.contractNumber;

      if FINContractsObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(FINContractsObj.contractDate.Year,FINContractsObj.contractDate.Month,FINContractsObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;
    edtFinDocCode.Text := FINContractsObj.finDocCode;
    if ( FINContractsObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(FINContractsObj.finDocID)
    else
       edtFinDocID.Text := '';

    edtRQOrgOrgName.Text := FINContractsObj.org.name;
  end;
end;



procedure TfrmFINContractsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINContracts: FINContractsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtRQOrgOrgName, edtContractNumber]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
     {

     FINContractsObj.contractNumber := edtContractNumber.Text;

     if edtcontractDate.checked then
     begin
       if FINContractsObj.contractDate = nil then
          FINContractsObj.contractDate := TXSDate.Create;
       FINContractsObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       FINContractsObj.contractDate := nil;

     FINContractsObj.finDocCode := edtFinDocCode.Text;

     if ( edtFinDocID.Text <> '' ) then
       FINContractsObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       FINContractsObj.finDocID := Low(Integer) ;
     }
     
    if DialogState = dsInsert then
    begin
      FINContractsObj.code:=low(Integer);
      TempFINContracts.add(FINContractsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINContracts.save(FINContractsObj);
    end;
  end;
end;


procedure TfrmFINContractsEdit.spbRQOrgOrgClick(Sender : TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if FINContractsObj.org = nil then FINContractsObj.org := RQOrg.Create();
               FINContractsObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
               edtRQOrgOrgName.Text:=GetReturnValue(sgRQOrg,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;



procedure TfrmFINContractsEdit.spbRQOrgClick(Sender: TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
   //org: RQOrg;
   tmpOrg: RQOrg;
   TempRQOrg: RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
begin
{
   frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if FINContractsObj.org = nil then
               begin
                 FINContractsObj.org := RQOrg.Create();
                 SetNullIntProps(FINContractsObj.org);
                 SetNullXSProps(FINContractsObj.org);
               end;

               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               FINContractsObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               FINContractsObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               FINContractsObj.org.name := GetReturnValue(sgRQOrg,1);
               FINContractsObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               FINContractsObj.org.okpo := GetReturnValue(sgRQOrg,2);
               FINContractsObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               FINContractsObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               FINContractsObj.org.adr := GetReturnValue(sgRQOrg,5);
               FINContractsObj.org.tel := GetReturnValue(sgRQOrg,6);
               FINContractsObj.org.country := GetReturnValue(sgRQOrg,10);
               FINContractsObj.org.region := GetReturnValue(sgRQOrg,11);
               FINContractsObj.org.ministry := GetReturnValue(sgRQOrg,12);
               FINContractsObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               FINContractsObj.org.type_ := GetReturnValue(sgRQOrg,14);
               FINContractsObj.org.master_code := GetReturnValue(sgRQOrg,15);

               //FINContractsObj.org.date_svidet := TXSDate.Create;
               //FINContractsObj.org.likv_date := TXSDate.Create;
               //FINContractsObj.org.dateNalogform := TXSDate.Create;

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    FINContractsObj.org.date_svidet := TXSDate.Create;
                    FINContractsObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    FINContractsObj.org.likv_date := TXSDate.Create;
                    FINContractsObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               FINContractsObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               FINContractsObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               FINContractsObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    FINContractsObj.org.date_nalogform := TXSDate.Create;
                    FINContractsObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               FINContractsObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               FINContractsObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               FINContractsObj.org.Primechan := GetReturnValue(sgRQOrg,7);

               spbContractNumberClearClick(Sender);
               DisableControls([spbContractNumber], false);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
}
  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, FINContractsObj.org) then
  begin
    FINContractsObj.org := tmpOrg;
    edtRQOrgOrgName.Text := FINContractsObj.org.name;
    spbContractNumberClearClick(Sender);
    DisableControls([spbContractNumber], false);
  end;
end;

procedure TfrmFINContractsEdit.spbContractNumberClearClick(
  Sender: TObject);
begin
  //edtContractNumber.Text := '';
  //contractNumber := '';
  //finDocCode := '';
  //finDocID := LOW_INT;
  FINContractsObj.contractNumber := '';
  FINContractsObj.contractDate := nil;
  FINContractsObj.finDocCode := '';
  FINContractsObj.finDocID := LOW_INT;

  ClearControls([edtContractNumber, edtFinDocCode, edtFinDocID]);
  edtContractDate.DateTime := Date;
  edtContractDate.Checked := false;
end;

procedure TfrmFINContractsEdit.spbContractNumberClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f: ENServicesObjectFilter;
begin
  if FINContractsObj.org = nil then
  begin
    Application.MessageBox(PChar('Спочатку оберіть постачальника!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(FINContractsObj.org.id); // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      //frmFINServicesObjectShow.
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
              // edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);

              FINContractsObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
              FINContractsObj.contractDate := TXSDate.Create;
              FINContractsObj.contractDate.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject, 2))));
              FINContractsObj.finDocCode := GetReturnValue(sgFINServicesObject, 5);
              FINContractsObj.finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));

              edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
              edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
              edtContractDate.Checked := true;
              //edtName.Text := GetReturnValue(sgFINServicesObject, 3);
              //edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
              edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
              edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
              //edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);
            except
              on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

end.
