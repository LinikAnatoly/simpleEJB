
unit EditRQActCounterExpertiseFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQActCounterExpertiseController
  , RQActCounterExpertisePurposeController;

type
  TfrmRQActCounterExpertiseFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;



  HTTPRIORQActCounterExpertise: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    gbPersonalAccount: TGroupBox;
    lblPersonalAccountNumber: TLabel;
    lblPersonalAccountName: TLabel;
    edtPersonalAccountNumber: TEdit;
    edtPersonalAccountName: TEdit;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    gpbCounter: TGroupBox;
    lblMolIncome: TLabel;
    lblPhasity: TLabel;
    lblCounterType: TLabel;
    lblSerialNumber: TLabel;
    edtMolIncomeFIO: TEdit;
    edtMolIncomeCode: TEdit;
    cbPhasity: TComboBox;
    edtCounterType: TEdit;
    edtSerialNumber: TEdit;
    spbENDepartmentClear: TSpeedButton;
    edtDateFinalDateGen: TDateTimePicker;
    lblDateFinalDateGen: TLabel;
    edtDateStartDateGen: TDateTimePicker;
    lblDateGen: TLabel;
    lblDateStart: TLabel;
    lblIsByt: TLabel;
    cbIsByt: TComboBox;
    cbPurpose: TComboBox;
    lblPurpose: TLabel;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblCounterAccount: TLabel;
    edtAccount: TEdit;
    lblRQFKOrderStatus: TLabel;
    edtRQFKOrderStatus: TEdit;
    spbRQFKOrderStatus: TSpeedButton;
    spbRQFKOrderStatusClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
    procedure spbRQFKOrderStatusClearClick(Sender: TObject);
    procedure spbRQFKOrderStatusClick(Sender: TObject);
  

  private
     statusCode : Integer;
    { Private declarations }
  public
     isIncome : Boolean;
    { Public declarations }

end;

var
  frmRQActCounterExpertiseFilterEdit: TfrmRQActCounterExpertiseFilterEdit;
  RQActCounterExpertiseFilterObj: RQActCounterExpertiseFilter;

implementation


uses ShowENDepartment, ENDepartmentController
, RQFKOrderStatusController, ShowRQFKOrderStatus, ENConsts;

{$R *.dfm}



procedure TfrmRQActCounterExpertiseFilterEdit.FormShow(Sender: TObject);
begin

  DisableControls([edtENDepartment, edtRQFKOrderStatus]);
  HideControls([lblPurpose, cbPurpose], not Self.isIncome);
  if not Self.isIncome then begin
    lblMolIncome.Caption := 'МВО для передачі';
    gpbCounter.Caption := 'Інформація для передачі лічильника';
    HideControls([edtInvNumber, lblInvNumber], False);
  end;
  statusCode := Low(Integer);
end;

procedure TfrmRQActCounterExpertiseFilterEdit.spbENDepartmentClearClick(
  Sender: TObject);
begin
  inherited;
  if RQActCounterExpertiseFilterObj.department <> nil then begin
    RQActCounterExpertiseFilterObj.department.code := Low(Integer);
    edtENDepartment.Text:= '';
  end;
end;

procedure TfrmRQActCounterExpertiseFilterEdit.spbENDepartmentClick(
  Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(procedure(selectedObj : ENDepartmentShort)
  begin
    if RQActCounterExpertiseFilterObj.department = nil then RQActCounterExpertiseFilterObj.department := ENDepartmentRef.Create();
    RQActCounterExpertiseFilterObj.department.code := selectedObj.code;
    edtENDepartment.Text:= selectedObj.shortName;
  end);
end;

procedure TfrmRQActCounterExpertiseFilterEdit.spbRQFKOrderStatusClearClick(
  Sender: TObject);
begin
  inherited;
  statusCode := Low(Integer);
    edtRQFKOrderStatus.Text := '';
end;

procedure TfrmRQActCounterExpertiseFilterEdit.spbRQFKOrderStatusClick(
  Sender: TObject);
  var filter : RQFKOrderStatusFilter;
begin
  inherited;
  filter := RQFKOrderStatusFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.conditionSQL := Format('RQFKORDERSTATUS.CODE in (%d, %d)'
        , [RQFKORDER_STATUS_CREATED
        , RQFKORDER_STATUS_COUNTER_IN_FK]);
  TfrmRQFKOrderStatusShow.chooseFromList(filter, procedure(selectedObj : RQFKOrderStatusShort)
  begin
    statusCode := selectedObj.code;
    edtRQFKOrderStatus.Text := selectedObj.name;
  end);
end;

procedure TfrmRQActCounterExpertiseFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort;
condition : String;
begin
  if (ModalResult = mrOk)  then
  begin

     RQActCounterExpertiseFilterObj.numberGen := edtNumberGen.Text;

     condition := '';

     if cbIsByt.ItemIndex > 0 then
     begin
       if RQActCounterExpertiseFilterObj.isByt = nil then RQActCounterExpertiseFilterObj.isByt := TXSBoolean.Create;
	   if cbIsByt.ItemIndex = 1 then RQActCounterExpertiseFilterObj.isByt.asBoolean := true else RQActCounterExpertiseFilterObj.isByt.asBoolean := false;
     end
     else
       RQActCounterExpertiseFilterObj.isByt := nil;
	 
     if cbPurpose.ItemIndex > 0 then begin
        RQActCounterExpertiseFilterObj.purpose := RQActCounterExpertisePurposeRef.Create;
        RQActCounterExpertiseFilterObj.purpose.code := cbPurpose.ItemIndex;	
     end else
        RQActCounterExpertiseFilterObj.purpose := nil;
	 

     if edtDateStartDateGen.Checked then
       AddCondition(condition, ' RQACTCOUNTEREXPERTISE.dategen >= to_date(''' + DateToStr(edtDateStartDateGen.Date) + ''', ''dd.MM.yyyy'')');

     if edtDateFinalDateGen.Checked then
       AddCondition(condition, ' RQACTCOUNTEREXPERTISE.dategen <= to_date(''' + DateToStr(edtDateFinalDateGen.Date) + ''', ''dd.MM.yyyy'')');

     RQActCounterExpertiseFilterObj.personalAccountNumber := edtPersonalAccountNumber.Text;
     RQActCounterExpertiseFilterObj.personalAccountName := edtPersonalAccountName.Text;

     if cbPhasity.ItemIndex > 0 then begin
       AddCondition(condition, 'SCCOUNTER.phasity = ' + cbPhasity.Text);
     end;

     if Length(Trim(edtCounterType.Text)) > 0 then begin
      AddCondition(condition, 'upper(SCCOUNTER.COUNTERTYPE) like upper(''%' + StringReplace(edtCounterType.Text, '*', '%', [rfReplaceAll, rfIgnoreCase]) + '%'')');
     end;

     if Length(Trim(edtSerialNumber.Text)) > 0 then begin
      AddCondition(condition, 'upper(SCCOUNTER.BUILDNUMBER) like upper(''%' + StringReplace(edtSerialNumber.Text, '*', '%', [rfReplaceAll, rfIgnoreCase]) + '%'')');
     end;

	  if Length(Trim(edtMolIncomeCode.Text)) > 0 then begin
      AddCondition(condition, 'upper(RQFKORDER.MOLOUTCODE) like upper(''%' + StringReplace(edtMolIncomeCode.Text, '*', '%', [rfReplaceAll, rfIgnoreCase]) + '%'')');
    end;

	  if Length(Trim(edtMolIncomeFIO.Text)) > 0 then begin
      AddCondition(condition, 'upper(RQFKORDER.MOLOUTNAME) like upper(''%' + StringReplace(edtMolIncomeFIO.Text, '*', '%', [rfReplaceAll, rfIgnoreCase]) + '%'')');
    end;

    if Length(Trim(edtAccount.Text)) > 0 then begin
      AddCondition(condition, 'SCCOUNTER.ACCOUNT like ''' + StringReplace(edtAccount.Text, '*', '%', [rfReplaceAll, rfIgnoreCase]) + '''');
    end;

     if Length(Trim(edtInvNumber.Text)) > 0 then begin
      AddCondition(condition, 'SCCOUNTER.INVNUMBER like ''' + StringReplace(edtInvNumber.Text, '*', '%', [rfReplaceAll, rfIgnoreCase]) + '''');
     end;

     if Self.statusCode <> Low(Integer) then begin
      AddCondition(condition, 'RQFKORDER.STATUSCODE = ' + IntToStr(statusCode));
     end;

    RQActCounterExpertiseFilterObj.conditionSQL := condition;


  end;
end;




end.