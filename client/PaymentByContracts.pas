unit PaymentByContracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls,DialogFormUnit,ChildFormUnit, ComCtrls;

type
  TfrmPaymentByContracts = class(TDialogForm)
    lblRQOrgOrgName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrgOrg: TSpeedButton;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    spbContractNumberSelect: TSpeedButton;
    grp1: TGroupBox;
    edtPeriodContractsStart: TDateTimePicker;
    lbperiodContractsStart: TLabel;
    lbperiodContractsFinal: TLabel;
    edPeriodContractsFinal: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    chkvalidateContracts: TCheckBox;
    procedure spbRQOrgOrgClick(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
  private
    { Private declarations }
    orgid , podrid : Integer;
    orgcode, orgname : string;

    contractNumber  , contractFinDocCode : string;
    contractFinDocID : Integer;
  public
    { Public declarations }
  end;

var
  frmPaymentByContracts: TfrmPaymentByContracts;

implementation

uses
  ShowRQOrg, ShowFINServicesObject, ENServicesObjectController, 
  EnergyproController, DMReportsUnit, ShowENDepartmentFromSprav, 
  ENDepartmentController, ENConsts;

{$R *.dfm}

procedure TfrmPaymentByContracts.spbRQOrgOrgClick(Sender: TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
   sDate, lDate, nDate: String;

begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try

               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               orgid:= StrToInt(GetReturnValue(sgRQOrg,0)); 
               orgcode:= GetReturnValue(sgRQOrg,8);
               orgname := GetReturnValue(sgRQOrg,1);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;

procedure TfrmPaymentByContracts.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
   conditionDateContract : String;
   conditionPartner : String;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   if edtPeriodContractsStart.Checked then
      conditionDateContract:= ' and  a.in_date >= ' + 'to_date('+''''+DateToStr(edtPeriodContractsStart.DateTime)+''''+',''dd.mm.yyyy'') ';
   if edPeriodContractsFinal.Checked then
      conditionDateContract:= conditionDateContract + ' and  a.in_date <= ' + 'to_date('+''''+DateToStr(edPeriodContractsFinal.DateTime)+''''+',''dd.mm.yyyy'') ';
   if orgid <> -1 then
      conditionPartner := ' and p.id = ' + IntToStr(orgid);
   f.conditionSQL := ' a.io_flag = ''B'' ' +  conditionPartner + conditionDateContract ; // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
                contractNumber := GetReturnValue(sgFINServicesObject, 1);
                contractFinDocCode  := GetReturnValue(sgFINServicesObject, 5);
                contractFinDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));


            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


procedure TfrmPaymentByContracts.FormCreate(Sender: TObject);
begin
  inherited;
   orgid := -1;
   contractFinDocID := -1;
   podrid := -1;
end;

procedure TfrmPaymentByContracts.FormShow(Sender: TObject);
begin
  inherited;
                 DisableControls([edtRQOrgOrgName , edtContractNumber , edtEPRenName]);
end;

procedure TfrmPaymentByContracts.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;

begin
//   inherited;

          if (((edtPeriodContractsStart.Checked = false) or (edPeriodContractsFinal.Checked = false ))  and ( contractFinDocID = -1 ) )then
          begin
          Application.MessageBox(PChar('Необхідно період заключення договору !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          ModalResult := mrNone;
          Exit;
          end;

      SetLength(argNames, 6);
      SetLength(args, 6);

      argNames[0] := 'contractdatestart';
      args[0]:= DateToStr( edtPeriodContractsStart.date );
      argNames[1] := 'contractdatefinal';
      args[1]:= DateToStr( edPeriodContractsFinal.date );
      argNames[2] := 'partnerid';
      args[2] := IntToStr(orgid);
      argNames[3] := 'contractid';
      args[3]:= IntToStr(contractFinDocID);
      argNames[4] := 'podrid';
      args[4]:= IntToStr(podrid);
      argNames[5] := 'isValidateContract';
      if chkvalidateContracts.Checked = true  then
      args[5]:= '1'
      else
      args[5]:= '0';



      if contractFinDocID <> -1 then
      begin
      args[0]:= '01.01.1900';
      args[1]:= '01.01.3000';
      end;



      reportName := 'PaymentByContracts/payContrGen';
      makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmPaymentByContracts.spbEPRenClick(Sender: TObject);
var
   frmENDepartmentFromSpravShow: TfrmENDepartmentFromSpravShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentFromSpravShow:=TfrmENDepartmentFromSpravShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentFromSpravShow do begin

        if ShowModal = mrOk then
        begin

          podrid := ENDepartmentShort(tvDep.Selected.Data).code;
          edtEPRenName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
           
        end;
      end;
   finally
      frmENDepartmentFromSpravShow.Free;
   end;
 end;
procedure TfrmPaymentByContracts.spbEPRenClearClick(Sender: TObject);
begin
  // inherited;
   podrid:= -1;
   edtEPRenName.Text := '';
end;

end.
