
unit EditFINContractsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINContractsController ;

type
  TfrmFINContractsFilterEdit = class(TDialogForm)
  

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
    procedure spbRQOrgClick(Sender: TObject);
    procedure spbContractNumberClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmFINContractsFilterEdit: TfrmFINContractsFilterEdit;
  FINContractsFilterObj: FINContractsFilter;

implementation

uses
  ShowRQOrg
  ,RQOrgController
, ShowFINServicesObject, ENServicesObjectController, ENConsts, DMReportsUnit;

{uses
    EnergyproController, EnergyproController2, FINContractsController  ;
}
{$R *.dfm}



procedure TfrmFINContractsFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtRQOrgOrgName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

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


  end;

}

end;



procedure TfrmFINContractsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINContracts: FINContractsControllerSoapPort;
    condition: String;
begin
  if (ModalResult = mrOk)  then
  begin

     FINContractsFilterObj.contractNumber := edtContractNumber.Text;



     if edtcontractDate.checked then
     begin
       if FINContractsFilterObj.contractDate = nil then
          FINContractsFilterObj.contractDate := TXSDate.Create;
       FINContractsFilterObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       FINContractsFilterObj.contractDate := nil;



     FINContractsFilterObj.finDocCode := edtFinDocCode.Text;



     if ( edtFinDocID.Text <> '' ) then
       FINContractsFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       FINContractsFilterObj.finDocID := Low(Integer) ;


     if FINContractsFilterObj.org <> nil then
       if FINContractsFilterObj.org.id <> LOW_INT then
       begin
         condition := FINContractsFilterObj.conditionSQL;
         AddCondition(condition, 'FINCONTRACTS.ORGCODE IN (SELECT RQORG.CODE FROM RQORG WHERE RQORG.ID = ' +
                                 IntToStr(FINContractsFilterObj.org.id) + ')');
         FINContractsFilterObj.conditionSQL := condition;
       end;

  end;
end;

procedure TfrmFINContractsFilterEdit.spbRQOrgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   tmpOrg: RQOrg;
begin
{
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if FINContractsFilterObj.org = nil then
               begin
                 FINContractsFilterObj.org := RQOrg.Create();
                 SetNullIntProps(FINContractsFilterObj.org);
                 SetNullXSProps(FINContractsFilterObj.org);
               end;
               //FINContractsFilterObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
               FINContractsFilterObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0));
               edtRQOrgOrgName.Text:=GetReturnValue(sgRQOrg,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
}
  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, FINContractsFilterObj.org) then
  begin
    FINContractsFilterObj.org := tmpOrg;
    edtRQOrgOrgName.Text := FINContractsFilterObj.org.name;
  end;
end;

procedure TfrmFINContractsFilterEdit.spbContractNumberClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f: ENServicesObjectFilter;
begin
  if FINContractsFilterObj.org = nil then
  begin
    Application.MessageBox(PChar('Спочатку оберіть постачальника!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(FINContractsFilterObj.org.id); // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      //frmFINServicesObjectShow.
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
              // edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);

              {
              FINContractsObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
              FINContractsObj.contractDate := TXSDate.Create;
              FINContractsObj.contractDate.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject, 2))));
              FINContractsObj.finDocCode := GetReturnValue(sgFINServicesObject, 5);
              FINContractsObj.finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));
              }
              
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