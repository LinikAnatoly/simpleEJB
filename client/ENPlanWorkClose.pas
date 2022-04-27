unit ENPlanWorkClose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, ComCtrls , ENPlanWorkController,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmPlanWorkClose = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    gbWorkOrderMOL: TGroupBox;
    Label5: TLabel;
    spbMaster: TSpeedButton;
    spbMasterClear: TSpeedButton;
    lblMolMech: TLabel;
    spbMechanic: TSpeedButton;
    spbMechanicClear: TSpeedButton;
    edtMasterName: TEdit;
    edtMechanicName: TEdit;
    edtDateGen: TDateTimePicker;
    lblDateGen: TLabel;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    gbSMS: TGroupBox;
    edtTimeStart: TDateTimePicker;
    edtTimeFinal: TDateTimePicker;
    chbSecondHalf: TCheckBox;
    chbFirstHalf: TCheckBox;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    spbFINExecutor: TSpeedButton;
    edtFINExecutorName: TEdit;
    lblExecuter: TLabel;
    lblResponsibility: TLabel;
    edtResponsibility: TEdit;
    spbResponsibility: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    edtCode: TEdit;
    lblPK: TLabel;
    HTTPRIOENDepartment: THTTPRIO;
    procedure spbMasterClick(Sender: TObject);
    procedure chbFirstHalfClick(Sender: TObject);
    procedure chbSecondHalfClick(Sender: TObject);
    procedure spbMechanicClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbResponsibilityClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMasterClearClick(Sender: TObject);
    procedure spbMechanicClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    elementCode : String;
    departmentCode : Integer;
    masterName,  mechanicName, masterCode, mechanicCode : string;
    plan: ENPlanWork;

  end;

var
  frmPlanWorkClose: TfrmPlanWorkClose;

implementation

{$R *.dfm}
uses ChildFormUnit , EnergyproController , DMReportsUnit, FINMolController,
  ShowFINMol, ENDepartment2EPRenController, ENDepartmentController, ENConsts,
  ShowENDepartment, ShowFINExecutorTree, FINExecutorController, XSBuiltIns;


procedure TfrmPlanWorkClose.chbFirstHalfClick(Sender: TObject);
begin
     if edtTimeStart.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeStart.DateTime := StrToTime('08:30');
     if edtTimeFinal.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeFinal.DateTime := StrToTime('12:30');
     chbSecondHalf.Checked := False;
end;

procedure TfrmPlanWorkClose.chbSecondHalfClick(Sender: TObject);
begin
     if edtTimeStart.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeStart.DateTime := StrToTime('13:30');
     if edtTimeFinal.Checked = False then
     edtTimeStart.Checked := True;
     edtTimeFinal.DateTime := StrToTime('16:30');
     chbFirstHalf.Checked := False;
end;

procedure TfrmPlanWorkClose.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
	TempENPlanWork : ENPlanWorkControllerSoapPort;
  timeStart, timeFinal : TXSDate;
  planDate : TXSDate;
  planWorkItemArr: ArrayOfENPlanWorkItemShort;
  planWorkShort : ENPlanWorkItemShort;
begin
  inherited;
   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  /// сохраним реквизиты мес€чного плана, если он черновой
  if ((ModalResult = mrOk)) then

  if not NoBlankValues([
      edtDateGen
//      ,edtMasterName

     ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else

  begin
    if (plan.status.code = ENPLANWORKSTATUS_GOOD) then
    TempENPlanWork.saveAttributes(plan, true);

    plan := TempENPlanWork.getObject(plan.code);

    if edtDateGen.Checked then
    begin
      planDate := TXSDate.Create;
      planDate.XSToNative(GetXSDate(edtDateGen.DateTime));
    end;

    if plan.stateRef.code = ENPLANWORKSTATE_SIDEWORKS then
    begin
        if not NoBlankValues([
        edtTimeStart
        ,edtTimeFinal])  then
        begin
            Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
            Action:=caNone;
        end
        else
        begin
            if edtTimeStart.Checked then
            begin
                if timeStart = nil then
                timeStart := TXSDate.Create;
                timeStart.XSToNative(GetXSDateTimeSeparated(edtDateGen.Date, edtTimeStart.Time));
            end;

            if edtTimeFinal.Checked then
            begin
                if timeFinal = nil then
                timeFinal := TXSDate.Create;
                timeFinal.XSToNative(GetXSDateTimeSeparated(edtDateGen.Date, edtTimeFinal.Time));
            end;
                TempENPlanWork.closePlanWorkWithParams(plan.code, planDate, timeStart, timeFinal,
                        masterCode, masterName, mechanicCode, mechanicName)
          end
    end
    else
    TempENPlanWork.closePlanWorkWithParams(plan.code, planDate,
                masterCode, masterName, mechanicCode, mechanicName);

  end;

end;

procedure TfrmPlanWorkClose.FormShow(Sender: TObject);
var
  TempENDepartment : ENDepartmentControllerSoapPort;
  department, budget, responsibility : ENDepartment;

begin
  inherited;
  DisableControls([edtCode, edtENBudgetName, edtResponsibility, edtDepartment, edtFINExecutorName]);
  HideControls([gbSMS , gbWorkOrderMOL]);

  edtCode.Text := IntToStr(plan.code);

  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

  if ((plan.departmentRef <> nil) and (plan.departmentRef.code <> LOW_INT)) then
  begin
   department := TempENDepartment.getObject(plan.departmentRef.code);
   edtDepartment.Text := department.shortName;
  end;

  if ((plan.budgetRef <> nil) and (plan.budgetRef.code <> LOW_INT)) then
  begin
    budget := TempENDepartment.getObject(plan.budgetRef.code);
    edtENBudgetName.Text := budget.shortName;
  end;

  if ((plan.responsibilityRef <> nil) and (plan.responsibilityRef.code <> LOW_INT)) then
  begin
    responsibility := TempENDepartment.getObject(plan.responsibilityRef.code);
    edtResponsibility.Text := responsibility.shortName;
  end;

  if ((plan.finExecutor <> nil) and (plan.finExecutor.code <> LOW_INT)) then
  begin
    edtFINExecutorName.Text := plan.finExecutor.name;
  end;

  if plan.status.code <> ENPLANWORKSTATUS_GOOD then
  begin
     DisableControls([spbDepartment, spbFINExecutor, spbENBudget, spbResponsibility]);
  end;

  if plan.stateRef.code in [ENPLANWORKSTATE_SIDEWORKS
    , ENPLANWORKSTATE_BUFET_REALIZATION, ENPLANWORKSTATE_BUFET_NONEREALIZATION
    , ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL] then
  begin
     HideControls([gbSMS , gbWorkOrderMOL],false);
  end;

end;

procedure TfrmPlanWorkClose.spbDepartmentClick(Sender: TObject);
begin
    inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
           edtDepartment.Text := selectedObj.shortName;
		   if plan.departmentRef = nil then plan.departmentRef := ENDepartmentRef.Create;
		   plan.departmentRef.code := selectedObj.code;
  end);
end;

procedure TfrmPlanWorkClose.spbENBudgetClick(Sender: TObject);
begin
  TfrmENDepartmentShow.chooseFromListBudgets(procedure(selectedObj : ENDepartmentShort)
  begin
		   edtENBudgetName.Text := selectedObj.shortName;
		   if plan.budgetRef = nil then plan.budgetRef := ENDepartmentRef.Create;
		   plan.budgetRef.code := selectedObj.code;
  end);
end;

procedure TfrmPlanWorkClose.spbFINExecutorClick(Sender: TObject);
begin
    inherited;
  TfrmFINExecutorTreeShow.chooseFromList(procedure(selectedObj : FINExecutorShort; node : TTreeNode)
  begin
		         plan.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(selectedObj,
                                                        DMReports.getFullExecutorName(node));

               edtFINExecutorName.Text := plan.finExecutor.name;

  end);
end;

procedure TfrmPlanWorkClose.spbMasterClearClick(Sender: TObject);
begin
  masterCode := '';
  masterName := '';
  edtMasterName.Text := '';
end;

procedure TfrmPlanWorkClose.spbMasterClick(Sender: TObject);
var
  f: FINMolFilter;
  frmFINMolShow: TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  //ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter: ENDepartment2EPRenFilter;
  renList: ENDepartment2EPRenShortList;

  //molSel: boolean;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  if departmentCode <> LOW_INT then
  begin
    renFilter := ENDepartment2EPRenFilter.Create;
    SetNullXSProps(renFilter);
    SetNullIntProps(renFilter);

    renFilter.departmentRef := ENDepartmentRef.Create;
    renFilter.departmentRef.code := departmentCode;

    TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;

    renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);

    if renList.totalCount > 0 then
      f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode);
  end;

  frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
  try
    if Length(f.conditionSQL) > 0 then
      frmFINMolShow.isFiltered := true;

    with frmFINMolShow do
    begin
      DisableActions([frmFINMolShow.actEdit, frmFINMolShow.actInsert]);
      if ShowModal = mrOk then
      begin
        masterCode := GetReturnValue(sgFINMol, 0);
        masterName := GetReturnValue(sgFINMol, 1);

        edtMasterName.Text := masterCode + ' ' + masterName;

      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

procedure TfrmPlanWorkClose.spbMechanicClearClick(Sender: TObject);
begin
  mechanicCode := '';
  mechanicName := '';
  edtMechanicName.Text := '';
end;

procedure TfrmPlanWorkClose.spbMechanicClick(Sender: TObject);
var
  f: FINMolFilter;
  frmFINMolShow: TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  //ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter: ENDepartment2EPRenFilter;
  renList: ENDepartment2EPRenShortList;

  //molSel: boolean;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  if departmentCode <> LOW_INT then
  begin
    renFilter := ENDepartment2EPRenFilter.Create;
    SetNullXSProps(renFilter);
    SetNullIntProps(renFilter);

    renFilter.departmentRef := ENDepartmentRef.Create;
    renFilter.departmentRef.code := departmentCode;

    TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;

    renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);

    if renList.totalCount > 0 then
      f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode);
  end;

  frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
  try
    if Length(f.conditionSQL) > 0 then
      frmFINMolShow.isFiltered := true;

    with frmFINMolShow do
    begin
      DisableActions([frmFINMolShow.actEdit, frmFINMolShow.actInsert]);
      if ShowModal = mrOk then
      begin
        mechanicCode := GetReturnValue(sgFINMol, 0);
        mechanicName := GetReturnValue(sgFINMol, 1);

        edtMechanicName.Text := mechanicCode + ' ' + mechanicName;
      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

procedure TfrmPlanWorkClose.spbResponsibilityClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromListResponsibility(procedure(selectedObj : ENDepartmentShort)
  begin
		   edtResponsibility.Text := selectedObj.shortName;
		   if plan.responsibilityRef = nil then plan.responsibilityRef := ENDepartmentRef.Create;
		   plan.responsibilityRef.code := selectedObj.code;
  end);
end;

end.
