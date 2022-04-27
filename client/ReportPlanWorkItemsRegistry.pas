unit ReportPlanWorkItemsRegistry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, CheckLst, ComCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmReportPlanWorkItemsRegistry = class(TDialogForm)
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lblDateStart: TLabel;
    lblMonthRaznar: TLabel;
    Label1: TLabel;
    dtpDateStart: TDateTimePicker;
    dtpDateFinal: TDateTimePicker;
    spbEPRenClear: TSpeedButton;
    spbEPRen: TSpeedButton;
    lblDepName: TLabel;
    lblFINExecutorName: TLabel;
    spbFINExecutor: TSpeedButton;
    spbFINExetutorClear: TSpeedButton;
    Label4: TLabel;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    edtDepName: TEdit;
    edtFINExecutorName: TEdit;
    ListBudget: TCheckListBox;
    HTTPRIOTENDepartment: THTTPRIO;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbFINExetutorClearClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    depCode: Integer;
    depName: String;
    budgCode: Integer;
    budgName: String;
    finExecutorName: String;
    finExecutorFinCode: String;
  end;

var
  frmReportPlanWorkItemsRegistry: TfrmReportPlanWorkItemsRegistry;

implementation

uses DMReportsUnit, EnergyproController, ENDepartmentController,
  ShowENDepartment, ChildFormUnit, ShowFINExecutorTree, FINExecutorController,
  ENConsts;

{$R *.dfm}

procedure TfrmReportPlanWorkItemsRegistry.btnCheckListAllClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to ListBudget.Count - 1 do
    ListBudget.Checked[i] := true;
end;

procedure TfrmReportPlanWorkItemsRegistry.btnClearCleckListClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 0 to ListBudget.Count - 1 do
    ListBudget.Checked[i] := false;
end;

procedure TfrmReportPlanWorkItemsRegistry.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  //i, n : integer;
  //state_, isSel : Boolean;
begin
  if (not dtpDateStart.Checked) or (not dtpDateFinal.Checked) then
  begin
    Application.MessageBox(PChar('¬каж≥ть пер≥од план≥в!'), PChar('”вага!'), MB_ICONWARNING + MB_OK);
    ModalResult := mrNone;
    Exit;
  end;

  if (depCode = 0) and (finExecutorFinCode = '') then
  begin
    Application.MessageBox(PChar('ќбер≥ть п≥дрозд≥л або виконавц€!'), PChar('”вага!'), MB_ICONWARNING + MB_OK);
    ModalResult := mrNone;
    Exit;
  end;

  SetLength(argNames, 6);
  SetLength(args, 6);

  argNames[0] := 'depCode';
  args[0] := IntToStr(depCode);

  argNames[1] := 'depName';
  args[1] := depName;

  argNames[2] := 'finExecutorFinCode';
  args[2] := finExecutorFinCode;

  argNames[3] := 'finExecutorName';
  args[3] := finExecutorName;

  argNames[4] := 'dateStart';
  args[4] := DateToStr(dtpDateStart.Date);

  argNames[5] := 'dateFinal';
  args[5] := DateToStr(dtpDateFinal.Date);

  reportName := 'PlanWorkItemsRegistry';

  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmReportPlanWorkItemsRegistry.FormCreate(Sender: TObject);
begin
  depCode := 0;
  depName := '';
  budgCode := 0;
  budgName := '';
  finExecutorFinCode := '';
  finExecutorName := '';
end;

procedure TfrmReportPlanWorkItemsRegistry.FormShow(Sender: TObject);
var
  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter: ENDepartmentFilter;
begin
  dtpDateStart.Date := Date;
  dtpDateStart.Checked := true;
  dtpDateFinal.Date := Date;
  dtpDateFinal.Checked := true;

  DisableControls([edtDepName, edtFINExecutorName]);

  {
  // заполн€ем список бюджетодержателей
  departmentfilter := ENDepartmentFilter.Create;
  SetNullIntProps(departmentfilter);
  SetNullXSProps(departmentfilter);

  departmentfilter.conditionSQL := 'typerefcode = 200 and parentrefcode is not null';

  TempTKBudget := HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
  ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter, 0, -1);
  ListBudget.Items.Clear;

  for bi := 0 to High(ENDepartmentList.list) do
    ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName, TObject(ENDepartmentList.list[bi].code));
  }
end;

procedure TfrmReportPlanWorkItemsRegistry.spbEPRenClearClick(Sender: TObject);
begin
  depCode := 0;
  depName := '';
  edtDepName.Text := '';
end;

procedure TfrmReportPlanWorkItemsRegistry.spbEPRenClick(Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f: ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.code := 1;

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
  try
    with frmENDepartmentShow do
    begin
      if ShowModal = mrOk then
      begin
        depCode := ENDepartmentShort(tvDep.Selected.Data).code;
        depName := ENDepartmentShort(tvDep.Selected.Data).shortName;
        edtDepName.Text := depName;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

procedure TfrmReportPlanWorkItemsRegistry.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do
      begin
        DisableActions([actEdit, actInsert]);
        if ShowModal = mrOk then
        begin
            try
              // if ENPlanWorkObj.finExecutor = nil then ENPlanWorkObj.finExecutor := FINExecutor.Create();
              finExecutorName := {getFullExecutorName(tvDep.Selected);} FINExecutorShort(tvDep.Selected.Data).name;
              finExecutorFinCode := InttoStr(FINExecutorShort(tvDep.Selected.Data).finCode);
              if FINExecutorShort(tvDep.Selected.Data).finCode = LOW_INT then
              finExecutorFinCode := FINExecutorShort(tvDep.Selected.Data).axOrgId;


              edtFINExecutorName.Text := DMReports.getFullExecutorName(tvDep.Selected); //finExecutorName;
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmReportPlanWorkItemsRegistry.spbFINExetutorClearClick(
  Sender: TObject);
begin
  edtFINExecutorName.Text := '';
  finExecutorFinCode := '';
  finExecutorName := '';
end;

end.
