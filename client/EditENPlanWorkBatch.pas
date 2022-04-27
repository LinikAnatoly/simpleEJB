unit EditENPlanWorkBatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, Grids, AdvObj, BaseGrid,
  AdvGrid, InvokeRegistry, Rio, SOAPHTTPClient, CheckLst, ImgList, Menus,
  ActnList, FINExecutorController;

type
  TfrmENPlanWorkBatchEdit = class(TDialogForm)
    pcMain: TPageControl;
    tsClosePlans: TTabSheet;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOTKVirtualBrigade: THTTPRIO;
    HTTPRIOENTimeLine: THTTPRIO;
    ActionList1: TActionList;
    actViewPlan: TAction;
    pmServices: TPopupMenu;
    N5: TMenuItem;
    ImageList1: TImageList;
    actEditPlan: TAction;
    HTTPRIOENPlanWork: THTTPRIO;
    N1: TMenuItem;
    actViewServicesObject: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    HTTPRIOENServicesObject: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    btnClearCleckList: TSpeedButton;
    btnClosePlans: TBitBtn;
    btnSelectPlans: TButton;
    CheckListBox1: TCheckListBox;
    edtDateGen: TDateTimePicker;
    edtENDepartment: TEdit;
    edtFINExecutorName: TEdit;
    edtMolName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblDateGen: TLabel;
    lblDeselectAll: TLabel;
    lblENDepartmentDepartmentRefName: TLabel;
    lblExecutor: TLabel;
    lblMolName: TLabel;
    lblSelectAll: TLabel;
    memLog: TMemo;
    spbENDepartment: TSpeedButton;
    spbFINExecutor: TSpeedButton;
    spbFINExecutorClear: TSpeedButton;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    SpeedButton1: TSpeedButton;
    pcPlans: TPageControl;
    tsRecordPoints: TTabSheet;
    tsServices: TTabSheet;
    Label1: TLabel;
    chbNotClosedPlans: TCheckBox;
    sgServices: TAdvStringGrid;
    chbCheckAllServices: TCheckBox;
    btnCheckSelectedServices: TButton;
    btnUncheckSelectedServices: TButton;
    btnViewPlanServices: TButton;
    btnEditPlanServices: TButton;
    sgRecordPoints: TAdvStringGrid;
    Label4: TLabel;
    chbCheckAllRecordPoints: TCheckBox;
    btnCheckSelectedRecordPoints: TButton;
    btnUncheckSelectedRecordPoints: TButton;
    btnViewPlanRecordPoints: TButton;
    btnEditPlanRecordPoints: TButton;
    HTTPRIOENWorkOrderBytItem: THTTPRIO;
    pmRecordPoints: TPopupMenu;
    N4: TMenuItem;
    N6: TMenuItem;
    chbIncludeClosedPlans: TCheckBox;
    lblSite: TLabel;
    edtSite: TEdit;
    spbSite: TSpeedButton;
    spbSiteClear: TSpeedButton;
    gbWorkOrderMOL: TGroupBox;
    Label5: TLabel;
    spbMaster: TSpeedButton;
    spbMasterClear: TSpeedButton;
    lblMolMech: TLabel;
    spbMechanic: TSpeedButton;
    spbMechanicClear: TSpeedButton;
    edtMasterName: TEdit;
    edtMechanicName: TEdit;
    rbRecordPointsByt: TRadioButton;
    rbRecordPointsProm: TRadioButton;
    spbClearAllENPlanWorkType: TSpeedButton;
    ListENPlanWorkType: TCheckListBox;
    lblENPlanWorkType: TLabel;
    spbSelectAllENPlanWorkType: TSpeedButton;
    HTTPRIOENPlanWorkType: THTTPRIO;
    chbNotPlannedPlansOnly: TCheckBox;
    tsDatesChange: TTabSheet;
    lblENDepartment1: TLabel;
    edtENDepartment1: TEdit;
    spbENDepartment1: TSpeedButton;
    lblYearGen: TLabel;
    cbYearGen: TComboBox;
    lblMonthGen: TLabel;
    cbMonthGen: TComboBox;
    sgENPlanWork: TAdvStringGrid;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    btnSelectPlans1: TButton;
    lblSite1: TLabel;
    edtSite1: TEdit;
    spbSite1: TSpeedButton;
    spbSiteClear1: TSpeedButton;
    actViewPlan1: TAction;
    actEditPlan1: TAction;
    btnSave: TBitBtn;
    Label6: TLabel;
    memLogDatesChange: TMemo;
    gbOrderBy: TGroupBox;
    rdbOrderByInvNumber: TRadioButton;
    rdbOrderByObjectName: TRadioButton;
    gbChangeDateStart: TGroupBox;
    lblDateStart: TLabel;
    dtpDateStart: TDateTimePicker;
    btnChangeDateStart: TButton;
    GroupBox1: TGroupBox;
    chbCheckAll: TCheckBox;
    btnCheckSelected: TButton;
    btnUncheckSelected: TButton;
    GroupBox2: TGroupBox;
    btnViewPlan: TButton;
    btnEditPlan: TButton;
    lblPersonalAccount: TLabel;
    edtPersonalAccount: TEdit;
    edtDateStartFilter: TDateTimePicker;
    lblDateStartFilter: TLabel;
    Label7: TLabel;
    edtCountPlanFil: TEdit;
    procedure spbENDepartmentClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelectPlansClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chbCheckAllServicesClick(Sender: TObject);
    procedure btnCheckSelectedServicesClick(Sender: TObject);
    procedure btnUncheckSelectedServicesClick(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actViewServicesObjectExecute(Sender: TObject);
    procedure btnClosePlansClick(Sender: TObject);
    procedure edtDateGenChange(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbFINExecutorClearClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chbCheckAllRecordPointsClick(Sender: TObject);
    procedure btnCheckSelectedRecordPointsClick(Sender: TObject);
    procedure btnUncheckSelectedRecordPointsClick(Sender: TObject);
    procedure spbSiteClick(Sender: TObject);
    procedure spbSiteClearClick(Sender: TObject);
    procedure spbMasterClick(Sender: TObject);
    procedure spbMasterClearClick(Sender: TObject);
    procedure spbMechanicClearClick(Sender: TObject);
    procedure spbMechanicClick(Sender: TObject);
    procedure fillENPlanWorkType;
    procedure spbClearAllENPlanWorkTypeClick(Sender: TObject);
    procedure spbSelectAllENPlanWorkTypeClick(Sender: TObject);
    function getSelectedENPlanWorkType() : String;
    function getCountSelectedENPlanWorkType() : Integer;
    procedure sgRecordPointsGetColumnFilter(Sender: TObject; Column: Integer;
      Filter: TStrings);
    procedure sgRecordPointsFilterSelect(Sender: TObject; Column,
      ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
    procedure sgServicesGetColumnFilter(Sender: TObject; Column: Integer;
      Filter: TStrings);
    procedure sgServicesFilterSelect(Sender: TObject; Column,
      ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
    procedure btnSelectPlans1Click(Sender: TObject);
    procedure spbENDepartment1Click(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure actViewPlan1Execute(Sender: TObject);
    procedure actEditPlan1Execute(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure rdbOrderByObjectNameClick(Sender: TObject);
    procedure btnChangeDateStartClick(Sender: TObject);
    procedure chbCheckAllClick(Sender: TObject);
    procedure btnCheckSelectedClick(Sender: TObject);
    procedure btnUncheckSelectedClick(Sender: TObject);

    procedure plansGridDateValueChange(Sender: TObject);
    procedure sgRecordPointsTopLeftChanged(Sender: TObject);


    const GRID_ACCOUNT_COLUMN_NUMBER = 1;
    const GRID_FIO_COLUMN_NUMBER = 2;
    const GRID_ADDRESS_COLUMN_NUMBER = 3;
    const GRID_WORK_COLUMN_NUMBER = 4;

    const PLANS_GRID_OBJECT_COLUMN_NUMBER = 1;
    const PLANS_GRID_DATE_COLUMN_NUMBER = 5;
  private
    { Private declarations }
    executor: FINExecutor;
    //departmentCode: Integer;
    molCode, molName: String;
    masterCode, masterName: String;
    mechanicCode, mechanicName: String;
    procedure UpdateServicesList;
    procedure UpdateRecordPointsList;
    procedure UpdatePlansList;
    procedure UpdatePlansListForDatesChanging;
    procedure SetDefaultPlanType;
  public
    { Public declarations }
    // Для вкладки "Затвердження планів"
    departmentCode: Integer;
    departmentName: String;
    siteCode: Integer;
    siteName: String;
    strDate: String;
    // Для вкладки "Зміна дати початки робіт"
    departmentCode1: Integer;
    departmentName1: String;
    planTypeCode: Integer;
  end;

var
  frmENPlanWorkBatchEdit: TfrmENPlanWorkBatchEdit;

implementation

uses ShowENDepartment, ENDepartmentController, ChildFormUnit, XSBuiltIns,
  ENTimeLineController, GridHeadersUnit, ENConsts, ENPlanWorkController,
  EditENPlanWork, DMReportsUnit, EditENServicesCalculation,
  ENServicesObjectController, ShowFINExecutorTree, FINMolController, ShowFINMol,
  ENDepartment2EPRenController, ENWorkOrderBytItemController, DateUtils,
  ShowENSite, ENPlanWorkTypeController, ENPlanWorkKindController,
  ShowENPlanWorkType;

{$R *.dfm}

var
  ENServicesHeaders: array [1..11] of String =
        ( 'Код'
          //,'Дата'
          ,'№ договору'
          ,'Замовник'
          ,'Адреса об''єкту'
          ,'Калькуляції'
          ,'Виконавець'
          ,'Статус'
          ,'Бух. статус'
          ,'Час виїзду'
          ,'Час початку виконання робіт'
          ,'Час закінчення виконання робіт'
          //,'Час перевезення з объекту'
        );

  ENRecordPointHeaders: array [1..6] of String =
        ( 'Код'
          ,'Особ. рах.'
          ,'ПІБ абонента'
          ,'Адреса абонента'
          ,'Перелік робіт'
          ,'Дата плана'
        );

  ENPlanWorkHeaders: array [1..10] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Особ. рахунок'
          ,'Рік'
          ,'Місяць'
          ,'Дата початку робіт'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
        );

 ColCountsgsgRecordPoints, LastCountsgRecordPoints: Integer;
 LastRowsgRecordPoints: Integer = 1;
 workOrderBytItemFilter: ENWorkOrderBytItemFilter;

procedure TfrmENPlanWorkBatchEdit.actEditPlan1Execute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    planCode: Integer;
begin
  planCode := LOW_INT;

  try
    planCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.row]);
  except
    on EConvertError do Exit;
  end;

  if planCode <= 0 then Exit;

  tPlan := DMReports.getPlanByCode(planCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED) then
  begin
    try
      TempENPlanWork.editPreConfirm(tPlan.code);
    except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      Exit;
    end;
  end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  then
  begin
    Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ShowModal = mrOk then
      UpdatePlansListForDatesChanging;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.actEditPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    planCode: Integer;
begin
  planCode := LOW_INT;

  if pcPlans.ActivePage = tsRecordPoints then
    planCode := Integer(sgRecordPoints.Objects[1, sgRecordPoints.Row]);

  if pcPlans.ActivePage = tsServices then
    planCode := Integer(sgServices.Objects[1, sgServices.Row]);

  if planCode <= 0 then Exit;

  tPlan := DMReports.getPlanByCode(planCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED) then
  begin
    try
      TempENPlanWork.editPreConfirm(tPlan.code);
    except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      Exit;
    end;
  end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  then
  begin
    Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ShowModal = mrOk then
      UpdatePlansList;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.actViewPlan1Execute(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planCode: Integer;
begin
  planCode := LOW_INT;

  try
    planCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.row]);
  except
    on EConvertError do Exit;
  end;

  if planCode <= 0 then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ENPlanWorkObj = nil then Exit;

    frmENPlanWorkEdit.ShowModal;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.actViewPlanExecute(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planCode: Integer;
begin
  planCode := LOW_INT;

  if pcPlans.ActivePage = tsRecordPoints then
    planCode := Integer(sgRecordPoints.Objects[1, sgRecordPoints.Row]);

  if pcPlans.ActivePage = tsServices then
    planCode := Integer(sgServices.Objects[1, sgServices.Row]);

  if planCode <= 0 then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ENPlanWorkObj = nil then Exit;

    frmENPlanWorkEdit.ShowModal;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.actViewServicesObjectExecute(Sender: TObject);
var
  TempENServicesCalculation: ENServicesObjectControllerSoapPort;
  servicesObjectCode: Integer;
begin
  servicesObjectCode := Integer(sgServices.Objects[2, sgServices.Row]);

  if servicesObjectCode <= 0 then Exit;

  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesObjectObj := TempENServicesCalculation.getObject(servicesObjectCode);
  except
    on EConvertError do Exit;
  end;

  frmENServicesCalculationEdit := TfrmENServicesCalculationEdit.Create(Application, dsView);
//  frmENServicesCalculationEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
  try
    frmENServicesCalculationEdit.ShowModal;
  finally
    frmENServicesCalculationEdit.Free;
    frmENServicesCalculationEdit := nil;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.btnChangeDateStartClick(Sender: TObject);
var
  state, isDateChanged: Boolean;
  i: Integer;
  dtpTemp: TDateTimePicker;
begin
  state := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один план!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  state := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, state);

    if state then
    begin
      dtpTemp := TDateTimePicker(sgENPlanWork.CellControls[PLANS_GRID_DATE_COLUMN_NUMBER, i]);
      dtpTemp.Date := dtpDateStart.Date;
      plansGridDateValueChange(dtpTemp);
    end;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.btnCheckSelectedClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    if sgENPlanWork.SelectedCells[1, i] then
    //if sgENPlanWork.SelectedRow[i] then
      sgENPlanWork.SetCheckBoxState(1, i, true);
  end;
end;

procedure TfrmENPlanWorkBatchEdit.btnCheckSelectedRecordPointsClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgRecordPoints.RowCount - 1 do
  begin
    if sgRecordPoints.SelectedCells[1, i] then
      sgRecordPoints.SetCheckBoxState(1, i, true);
  end;
end;

procedure TfrmENPlanWorkBatchEdit.btnCheckSelectedServicesClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgServices.RowCount - 1 do
  begin
    if sgServices.SelectedCells[1, i] then
      sgServices.SetCheckBoxState(1, i, true);
  end;

  {
  chbCheckAll.OnClick := nil;
  try
    chbCheckAll.Checked := false;
  finally
    chbCheckAll.OnClick := chbCheckAllClick;
  end;
  }
end;

procedure TfrmENPlanWorkBatchEdit.btnClosePlansClick(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, planCode: Integer;
  state: Boolean;
  planDate: TXSDate;
  contractNumber, strContract, strMessage1, strMessage2: String;
  grid: TAdvStringGrid;
begin
  if pcPlans.ActivePage = tsRecordPoints then
  begin
    grid := sgRecordPoints;
    strContract := ' Особ. рах. № ';
    strMessage1 := 'особовий рахунок';
    strMessage2 := 'особових рахунків';
  end
  else if pcPlans.ActivePage = tsServices then
  begin
    grid := sgServices;
    strContract := ' Договір № ';
    strMessage1 := 'договір';
    strMessage2 := 'договорів';
  end
  else
    raise Exception.Create('Невідомий тип об''єкту планування!');

  state := false;

  for i := 1 to grid.RowCount - 1 do
  begin
    grid.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один ' + strMessage1 + '!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  //if Application.MessageBox(PChar('Для ВСІХ обраних договорів будуть створені Завдання-Плани на ' + DateToStr(edtDateGen.DateTime) + ' !' + #13#10 +
  if Application.MessageBox(PChar('Для ВСІХ обраних ' + strMessage2 + ' будуть створені Завдання-Плани на ' + DateToStr(edtDateGen.DateTime) + ' !' + #13#10 +
                                  'Продовжити ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
  begin
    Exit;
  end;

  memLog.Clear;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  planDate := TXSDate.Create;
  planDate.XSToNative(GetXSDate(edtDateGen.DateTime));

  for i := 1 to grid.RowCount - 1 do
  begin
    grid.GetCheckBoxState(1, i, state);

    if state then
    begin
      planCode := Integer(grid.Objects[1, i]);

      if planCode <= 0 then continue;

      contractNumber := grid.Cells[1, i];

      if executor = nil then
      begin
        executor := FINExecutor.Create;
        executor.code := LOW_INT;
        executor.finCode := LOW_INT;
      end;

      try
        //TempENPlanWork.closePlanWorkWithDate(planCode, planDate);
        TempENPlanWork.closePlanWorkForByt(planCode, molCode, molName, executor, planDate,
                                           masterCode, masterName, mechanicCode, mechanicName);
      except
        on E: Exception do
        begin
          //memLog.Lines.Add('[ Договір № ' + contractNumber + ', код Міс. плану: ' + IntToStr(planCode) + ' ]: ' + E.Message + #13#10);
          memLog.Lines.Add('[' + strContract + contractNumber + ', код Міс. плану: ' + IntToStr(planCode) + ' ]: ' + E.Message + #13#10);
          continue;
        end;
      end;
    end;
  end;

  UpdatePlansList;
end;

procedure TfrmENPlanWorkBatchEdit.btnSaveClick(Sender: TObject);
var
  dtpTemp: TDateTimePicker;
  strOriginalDate, strNewDate, personalAccount: String;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, planCode: Integer;
  newDate: TXSDate;
  state, isDateChanged: Boolean;
begin
{
  state := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один план!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;
}
  isDateChanged := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    strOriginalDate := sgENPlanWork.Cells[PLANS_GRID_DATE_COLUMN_NUMBER, i];

    dtpTemp := TDateTimePicker(sgENPlanWork.CellControls[PLANS_GRID_DATE_COLUMN_NUMBER, i]);

    if dtpTemp = nil then continue;

    strNewDate := DateToStr(dtpTemp.Date);

    if strNewDate <> strOriginalDate then
    begin
      isDateChanged := true;
      break;
    end;
  end;

  if not isDateChanged then
  begin
    Application.MessageBox(PChar('Жодну дату плану не було змінено!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if Application.MessageBox(PChar('Зберегти зміни (усі дати планів, що були змінені, буде збережено) ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
  begin
    Exit;
  end;

  memLogDatesChange.Clear;

  //state := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    //sgENPlanWork.GetCheckBoxState(1, i, state);

    //if state then
    //begin
      planCode := LOW_INT;

      try
        planCode := StrToInt(sgENPlanWork.Cells[0, i]);
      except
        on EConvertError do continue;
      end;

      if planCode <= 0 then continue;

      personalAccount := sgENPlanWork.Cells[2, i];

      try
        strOriginalDate := sgENPlanWork.Cells[PLANS_GRID_DATE_COLUMN_NUMBER, i];
        dtpTemp := TDateTimePicker(sgENPlanWork.CellControls[PLANS_GRID_DATE_COLUMN_NUMBER, i]);

        if dtpTemp = nil then continue;

        strNewDate := DateToStr(dtpTemp.Date);

        // Если дата не изменилась, пропускаем этот план
        if strNewDate = strOriginalDate then
          continue;

        newDate := TXSDate.Create;
        newDate.XSToNative(GetXSDate(dtpTemp.DateTime));

        TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
          TempENPlanWork.changePlanDateForByt(planCode, newDate);
      except
        on E: Exception do
        begin
          memLogDatesChange.Lines.Add('[ Особ. рах. № ' + personalAccount + ', код Міс. плану: ' + IntToStr(planCode) + ' ]: ' + E.Message + #13#10);
          continue;
        end;
      end;
    //end;
  end;

  Application.MessageBox(PChar('Зміни збережено!'), PChar('Увага!'), MB_ICONINFORMATION + MB_OK);

  UpdatePlansListForDatesChanging;
end;

procedure TfrmENPlanWorkBatchEdit.btnSelectPlans1Click(Sender: TObject);
begin
  UpdatePlansListForDatesChanging;
end;

procedure TfrmENPlanWorkBatchEdit.btnSelectPlansClick(Sender: TObject);
var
d : TFilterData;
begin
  UpdatePlansList;
end;

procedure TfrmENPlanWorkBatchEdit.btnUncheckSelectedClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    if sgENPlanWork.SelectedCells[1, i] then
      sgENPlanWork.SetCheckBoxState(1, i, false);
  end;

  chbCheckAll.OnClick := nil;
  try
    chbCheckAll.Checked := false;
  finally
    chbCheckAll.OnClick := chbCheckAllClick;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.btnUncheckSelectedRecordPointsClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgRecordPoints.RowCount - 1 do
  begin
    if sgRecordPoints.SelectedCells[1, i] then
      sgRecordPoints.SetCheckBoxState(1, i, false);
  end;

  chbCheckAllRecordPoints.OnClick := nil;
  try
    chbCheckAllRecordPoints.Checked := false;
  finally
    chbCheckAllRecordPoints.OnClick := chbCheckAllRecordPointsClick;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.btnUncheckSelectedServicesClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgServices.RowCount - 1 do
  begin
    if sgServices.SelectedCells[1, i] then
      sgServices.SetCheckBoxState(1, i, false);
  end;

  chbCheckAllServices.OnClick := nil;
  try
    chbCheckAllServices.Checked := false;
  finally
    chbCheckAllServices.OnClick := chbCheckAllServicesClick;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.chbCheckAllClick(Sender: TObject);
begin
  CheckGrid(sgENPlanWork, 1, chbCheckAll.Checked);
end;

procedure TfrmENPlanWorkBatchEdit.chbCheckAllRecordPointsClick(Sender: TObject);
begin
  CheckGrid(sgRecordPoints, 1, chbCheckAllRecordPoints.Checked);
end;

procedure TfrmENPlanWorkBatchEdit.chbCheckAllServicesClick(Sender: TObject);
begin
  CheckGrid(sgServices, 1, chbCheckAllServices.Checked);
end;

procedure TfrmENPlanWorkBatchEdit.edtDateGenChange(Sender: TObject);
begin
  ClearGrids([sgServices, sgRecordPoints]);
end;

procedure TfrmENPlanWorkBatchEdit.FormCreate(Sender: TObject);
begin
  departmentCode := LOW_INT;
  departmentName := '';
  siteCode := LOW_INT;
  siteName := '';
  strDate := '';
  executor := nil;
  molCode := '';
  molName := '';
  masterCode := '';
  masterName := '';
  mechanicCode := '';
  mechanicName := '';

  departmentCode1 := LOW_INT;
  departmentName1 := '';
  planTypeCode := LOW_INT;
end;

procedure TfrmENPlanWorkBatchEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmENPlanWorkBatchEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(ENRecordPointHeaders, sgRecordPoints.ColumnHeaders);
  SetGridHeaders(ENServicesHeaders, sgServices.ColumnHeaders);
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);

  pcMain.ActivePage := tsClosePlans;
  pcPlans.ActivePage := tsRecordPoints;

  //tsDatesChange.TabVisible := (HTTPRIOENPlanWork.HTTPWebNode.UserName = 'energynet');

  SetDefaultPlanType;

  // tsClosePlans
  DisableControls([edtENDepartment, edtSite, edtFINExecutorName,
                   edtMolName, edtMasterName, edtMechanicName,
                   memLog]);
  DenyBlankValues([edtENDepartment]);

  // tsRecordPoints
  DisableControls([edtENDepartment1, edtSite1, edtTypeName,
                   memLogDatesChange]);
  DenyBlankValues([edtENDepartment1, edtTypeName]);

  if departmentCode <> LOW_INT then
    edtENDepartment.Text := departmentName;

  if siteCode <> LOW_INT then
    edtSite.Text := siteName;

  if strDate <> '' then
    try
      edtDateGen.DateTime := StrToDate(strDate);
    except
      on EConvertError do
      begin
        edtDateGen.DateTime := Date;
        edtDateGen.Checked := false;
      end;
    end;
    fillENPlanWorkType;

    sgRecordPoints.Options :=  sgRecordPoints.Options - [goColMoving];

    SetComboBoxCurrentYear(cbYearGen, 3, 1);
    SetComboBoxCurrentMonth(cbMonthGen);

    edtCountPlanFil.Text:= '';
    SetFloatStyle([edtCountPlanFil]);
end;

procedure TfrmENPlanWorkBatchEdit.sgRecordPointsFilterSelect(Sender: TObject;
  Column, ItemIndex: Integer; FriendlyName: string;
  var FilterCondition: string);
  var d : TFilterData;
  var cond : String;
begin
  inherited;
  if FilterCondition = GRID_FILTER_CONDITION_DEFINE then begin
    cond := InputBox('EnergyNet', sgRecordPoints.ColumnHeaders[Column], '*');
  end;

  sgRecordPoints.FilterActive := False;
  if FilterCondition = GRID_FILTER_CONDITION_ALL then begin
    FilterCondition := '*'
  end else begin
    FilterCondition := '';
    d:= sgRecordPoints.Filter.Add;
    d.Condition := cond;
    d.Column := Column;
    d.CaseSensitive := False;
    sgRecordPoints.FilterActive := True;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.sgRecordPointsGetColumnFilter(Sender: TObject;
  Column: Integer; Filter: TStrings);
begin
  inherited;

  sgRecordPoints.Filter.Clear;

  if Column in [GRID_ACCOUNT_COLUMN_NUMBER, GRID_FIO_COLUMN_NUMBER, GRID_ADDRESS_COLUMN_NUMBER,
      GRID_WORK_COLUMN_NUMBER] then  begin

    Filter.Add(GRID_FILTER_CONDITION_ALL);
    Filter.Add(GRID_FILTER_CONDITION_DEFINE);
  end;
  
end;

procedure TfrmENPlanWorkBatchEdit.sgRecordPointsTopLeftChanged(Sender: TObject);
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  i, elementType , CurrentRow : Integer;

  ENWorkOrderBytItemList: ENWorkOrderBytItemShortList;
  condition, customerName: String;
begin
  inherited;
  if pcPlans.ActivePage = tsRecordPoints then
  begin
    if LastCountsgRecordPoints < 99 then Exit;
    if (sgRecordPoints.TopRow + sgRecordPoints.VisibleRowCount) = ColCountsgsgRecordPoints
      then
        begin
          TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
          CurrentRow:=sgRecordPoints.RowCount;

//          if workOrderBytItemFilter = nil then
//          begin
//             workOrderBytItemFilter := ENPlanWorkFilter.Create;
//             SetNullIntProps(workOrderBytItemFilter);
//             SetNullXSProps(workOrderBytItemFilter);
//             workOrderBytItemFilter(workOrderBytItemFilter).conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER);
//          end;

           elementType := LOW_INT;

          if rbRecordPointsByt.Checked then
            elementType := EN_BYT
          else if rbRecordPointsProm.Checked then
            elementType := EN_PROM;

           ENWorkOrderBytItemList := TempENWorkOrderBytItem.getScrollableFilteredListForPlanning(workOrderBytItemFilter,
           ColCountsgsgRecordPoints-1,
           100, elementType);

      try
        sgRecordPoints.RowCount:= sgRecordPoints.RowCount+100;
        LastCountsgRecordPoints:=High(ENWorkOrderBytItemList.list);

      with sgRecordPoints do
        for i:=0 to LastCountsgRecordPoints do
          begin
            Application.ProcessMessages;

            if ENWorkOrderBytItemList.list[i].code <> Low(Integer) then
              Cells[0,i+CurrentRow] := IntToStr(ENWorkOrderBytItemList.list[i].code)
            else
              Cells[0,i+CurrentRow] := '';

            AddCheckBox(1, i + CurrentRow, false, false);

            Cells[1,i+CurrentRow] := ENWorkOrderBytItemList.list[i].accountNumber;

            //Cells[2,i+1] := ENWorkOrderBytItemList.list[i].name;
            customerName := ENWorkOrderBytItemList.list[i].name;
            if elementType = EN_PROM then
              customerName := customerName + ' (' + ENWorkOrderBytItemList.list[i].recordPointName + ')';
            Cells[2,i+CurrentRow] := customerName;

            Cells[3,i+CurrentRow] := ENWorkOrderBytItemList.list[i].address;

            Cells[4,i+CurrentRow] := ENWorkOrderBytItemList.list[i].kartaRefNum;

            if ENWorkOrderBytItemList.list[i].planRefDateStart = nil then
              Cells[5,i+CurrentRow] := ''
            else
              Cells[5,i+CurrentRow] := XSDate2String(ENWorkOrderBytItemList.list[i].planRefDateStart);

            Objects[1,i+CurrentRow] := TObject(ENWorkOrderBytItemList.list[i].planRefCode);




            LastRowsgRecordPoints:=i+CurrentRow;
          end;
       ColCountsgsgRecordPoints:=ColCountsgsgRecordPoints+100;

       sgRecordPoints.RowCount:=LastRowsgRecordPoints+1;

//       if (sgENPlanWork.RowCount > 5) then
//         sgENPlanWork.Row:=CurrentRow-5;

        finally
        ENWorkOrderBytItemList.Free;
        end;

      end;

  end;
end;

procedure TfrmENPlanWorkBatchEdit.sgServicesFilterSelect(Sender: TObject;
  Column, ItemIndex: Integer; FriendlyName: string;
  var FilterCondition: string);
  var
  cond : String;
  d : TFilterData;
begin
  inherited;
  if FilterCondition = GRID_FILTER_CONDITION_DEFINE then begin
    cond := InputBox('EnergyNet', sgServices.ColumnHeaders[Column], '*');
  end;

  sgServices.FilterActive := False;
  if FilterCondition = GRID_FILTER_CONDITION_ALL then begin
    FilterCondition := '*'
  end else begin
    FilterCondition := '';
    d:= sgServices.Filter.Add;
    d.Condition := cond;
    d.Column := Column;
    d.CaseSensitive := False;
    sgServices.FilterActive := True;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.sgServicesGetColumnFilter(Sender: TObject;
  Column: Integer; Filter: TStrings);
begin
  inherited;
  sgServices.Filter.Clear;

  if Column in [1, 2, 3, 4, 5, 6] then  begin

    Filter.Add(GRID_FILTER_CONDITION_ALL);
    Filter.Add(GRID_FILTER_CONDITION_DEFINE);
  end;
end;

procedure TfrmENPlanWorkBatchEdit.spbClearAllENPlanWorkTypeClick(
  Sender: TObject);
var
  i : Integer;
begin
  inherited;
     For i:=0 to ListENPlanWorkType.Count -1  do
    Begin
       if  ListENPlanWorkType.Checked[i] = True then
           ListENPlanWorkType.Checked[i] := False;

    End;
end;

procedure TfrmENPlanWorkBatchEdit.spbENDepartment1Click(Sender: TObject);
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
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               //if ENWorkOrderBytObj.departmentRef = nil then ENWorkOrderBytObj.departmentRef := ENDepartmentRef.Create();
               //ENWorkOrderBytObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentCode1 := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartment1.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
               //ClearGrids([sgENPlanWork]);
               //spbSiteClear1Click(Sender);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPlanWorkBatchEdit.spbENDepartmentClick(Sender: TObject);
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
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               //if ENWorkOrderBytObj.departmentRef = nil then ENWorkOrderBytObj.departmentRef := ENDepartmentRef.Create();
               //ENWorkOrderBytObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
               ClearGrids([sgServices, sgRecordPoints]);
               spbSiteClearClick(Sender);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPlanWorkBatchEdit.spbFINExecutorClearClick(Sender: TObject);
begin
  executor := nil;
  edtFINExecutorName.Text := '';
end;

procedure TfrmENPlanWorkBatchEdit.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
begin
  frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application, fmNormal);
  try
    with frmFINExecutorTreeShow do
    begin
      DisableActions([frmFINExecutorTreeShow.actEdit, frmFINExecutorTreeShow.actInsert]);
      if ShowModal = mrOk then
      begin
        executor :=
          DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                 DMReports.getFullExecutorName(tvDep.Selected));
        edtFINExecutorName.Text := executor.name;
      end;
    end;
  finally
    frmFINExecutorTreeShow.Free;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.spbMasterClearClick(Sender: TObject);
begin
  masterCode := '';
  masterName := '';
  edtMasterName.Text := '';
end;

procedure TfrmENPlanWorkBatchEdit.spbMasterClick(Sender: TObject);
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

        ///// Если МОЛ для разнарядки еще не выбран, подставим его из МОЛа-мастера
        if molCode = '' then
        begin
          molCode := masterCode;
          molName := masterName;

          edtMolName.Text := molCode + ' ' + molName;
        end;
        /////
      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.spbMechanicClearClick(Sender: TObject);
begin
  mechanicCode := '';
  mechanicName := '';
  edtMechanicName.Text := '';
end;

procedure TfrmENPlanWorkBatchEdit.spbMechanicClick(Sender: TObject);
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

procedure TfrmENPlanWorkBatchEdit.spbPlanMOLClearClick(Sender: TObject);
begin
  molCode := '';
  molName := '';
  edtMolName.Text := '';
end;

procedure TfrmENPlanWorkBatchEdit.spbPlanMOLClick(Sender: TObject);
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
        molCode := GetReturnValue(sgFINMol, 0);
        molName := GetReturnValue(sgFINMol, 1);

        edtMolName.Text := molCode + ' ' + molName;

        ///// Если МОЛ-мастер еще не выбран, подставим его из МОЛа для разнарядки
        if masterCode = '' then
        begin
          masterCode := molCode;
          masterName := molName;

          edtMasterName.Text := masterCode + ' ' + masterName;
        end;
        /////
      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.spbSelectAllENPlanWorkTypeClick(
  Sender: TObject);
var
  i : Integer;
begin
  inherited;
     For i:=0 to ListENPlanWorkType.Count -1  do
    Begin
       if  ListENPlanWorkType.Checked[i] = false then
           ListENPlanWorkType.Checked[i] := true;
    End;
end;

procedure TfrmENPlanWorkBatchEdit.spbSiteClearClick(Sender: TObject);
begin
  siteCode := LOW_INT;
  edtSite.Text := '';
  ClearGrid(sgRecordPoints);
end;

procedure TfrmENPlanWorkBatchEdit.spbSiteClick(Sender: TObject);
var frmENSiteShow: TfrmENSiteShow;
begin
  frmENSiteShow := TfrmENSiteShow.Create(Application, fmNormal);
  try
    frmENSiteShow.DisableActions([frmENSiteShow.actInsert,
                                  frmENSiteShow.actEdit,
                                  frmENSiteShow.actDelete]);
    with frmENSiteShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          siteCode := StrToInt(GetReturnValue(sgENSite, 0));
          edtSite.Text := GetReturnValue(sgENSite, 1);
          ClearGrid(sgRecordPoints);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENSiteShow.Free;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.spbTypeClick(Sender: TObject);
var
  frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
  f: ENPlanWorkTypeFilter;
begin
  f := ENPlanWorkTypeFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := 'code between ' + IntToStr(ENPLANWORKTYPE_ESBYT_PZ) +
                    ' and ' + IntToStr(ENPLANWORKTYPE_ESBYT_PO_113);

  frmENPlanWorkTypeShow := TfrmENPlanWorkTypeShow.Create(Application, fmNormal, f);
  try
    with frmENPlanWorkTypeShow do
    begin
      DisableActions([actEdit, actInsert, actDelete]);
      if ShowModal = mrOk then
      begin
        try
          planTypeCode := StrToInt(GetReturnValue(sgENPlanWorkType, 0)); //ENDepartmentShort(tvDep.Selected.Data).code;
          edtTypeName.Text := GetReturnValue(sgENPlanWorkType, 1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENPlanWorkTypeShow.Free;
  end;
end;

procedure TfrmENPlanWorkBatchEdit.UpdatePlansList;
begin
  if pcPlans.ActivePage = tsRecordPoints then
    UpdateRecordPointsList;

  if pcPlans.ActivePage = tsServices then
    UpdateServicesList;
end;

procedure TfrmENPlanWorkBatchEdit.UpdatePlansListForDatesChanging;
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, j, plansCount: Integer;
  planFilter: ENPlanWorkFilter;
  ENPlanWorkList: ENPlanWorkShortList;
  statusName, conditionSQL: String;
  dtpTemp: TDateTimePicker;
  CountPlanFil: Integer;
begin
{
  sgENPlanWork.Cells[1, 1] := DateToStr(Date);
  //sgENPlanWork.CellProperties[1, 1].Editor := edDateEdit;
  //sgENPlanWork.CellProperties[1, 1].Control := dtpTest;
  sgENPlanWork.CellControls[1, 1] := TDateTimePicker.Create(sgENPlanWork); //dtpTest;
  //sgENPlanWork.CellControls[1, 2] := dtpTest;
}
  ClearGrid(sgENPlanWork);

  chbCheckAll.Checked := false;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  planFilter.kind := ENPlanWorkKind.Create;
  planFilter.kind.code := ENPLANWORKKIND_CURRENT;

  planFilter.budgetRef := ENDepartmentRef.Create;
  planFilter.budgetRef.code := ENBUDGET_ENERGOSBYT;

  //planFilter.conditionSQL := ' statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ' and TYPEREFCODE <> ' + IntToStr(ENPLANWORKTYPE_SIDEWORKS);
  conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER)
      + ' and enplanwork.TYPEREFCODE <> ' + IntToStr(ENPLANWORKTYPE_SIDEWORKS);

  if Trim(edtPersonalAccount.Text) <> '' then
    AddCondition(conditionSQL, 'ENELEMENTDATA.INVNUMBER = ''' + edtPersonalAccount.Text + '''');

  planFilter.conditionSQL := conditionSQL;

  if cbYearGen.ItemIndex > -1 then
    planFilter.yearGen := StrToInt(cbYearGen.Text)
  else begin
    Application.MessageBox(PChar('Вкажіть, будь ласка, рік для пошуку планів!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if cbMonthGen.ItemIndex > -1 then
    planFilter.monthGen := cbMonthGen.ItemIndex + 1
  else begin
    Application.MessageBox(PChar('Вкажіть, будь ласка, місяць для пошуку планів!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if departmentCode1 > 0 then
  begin
    planFilter.departmentRef := ENDepartmentRef.Create;
    planFilter.departmentRef.code := departmentCode1;
  end
  else begin
    Application.MessageBox(PChar('Вкажіть, будь ласка, підрозділ для пошуку планів!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    if edtENDepartment1.CanFocus then
      edtENDepartment1.SetFocus;
    Exit;
  end;

  if planTypeCode > 0 then
  begin
    planFilter.typeRef := ENPlanWorkTypeRef.Create;
    planFilter.typeRef.code := planTypeCode;
  end
  else begin
    Application.MessageBox(PChar('Вкажіть, будь ласка, підвид робіт для пошуку планів!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    if edtTypeName.CanFocus then
      edtTypeName.SetFocus;
    Exit;
  end;

  if edtDateStartFilter.Checked then begin
    if planFilter.dateStart = nil then begin
          planFilter.dateStart := TXSDate.Create;
    end;
    planFilter.dateStart.XSToNative(GetXSDate(edtDateStartFilter.DateTime));

  end;


  //planFilter.orderBySQL := 'datestart';
  if rdbOrderByObjectName.Checked then
    planFilter.orderBySQL := 'objectname'
  else if rdbOrderByInvNumber.Checked then
    planFilter.orderBySQL := 'invnumber';

    if edtCountPlanFil.Text <> '' then
    CountPlanFil := StrToInt(edtCountPlanFil.Text)
    else
    CountPlanFil := -1;

  //ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
  ENPlanWorkList := TempENPlanWork.getScrollableFilteredListForEnergosbyt(planFilter, 0, CountPlanFil);

  plansCount := High(ENPlanWorkList.list);

  if plansCount > -1 then
    sgENPlanWork.RowCount := plansCount + 2
  else
    sgENPlanWork.RowCount := 2;

{
        ( 'Код'
          ,'Об''єкт планування'
          ,'Особ. рахунок'
          ,'Рік'
          ,'Місяць'
          ,'Дата початку робіт'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
        );
}

   with sgENPlanWork do
     for i := 0 to plansCount do
     begin
        Application.ProcessMessages;

        if ENPlanWorkList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENPlanWorkList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENPlanWorkList.list[i].objectName;
        AddCheckBox(1, i+1, false, false);
        //CellProperties[1, i+1].FontStyle := CellProperties[1, i+1].FontStyle - [fsBold];

        Cells[2,i+1] := ENPlanWorkList.list[i].invNumber;

        if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
          Cells[3,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
        else
          Cells[3,i+1] := '';

        if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
          //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
          Cells[4,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
        else
          Cells[4,i+1] := '';

        if ENPlanWorkList.list[i].dateStart = nil then
          Cells[5,i+1] := ''
        else begin
          Cells[5,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
          //CellControls[5, i+1] := TDateTimePicker.Create(Self);
          //TDateTimePicker(CellControls[5, i+1]).Date := StrToDate(Cells[5,i+1]);
          dtpTemp := TDateTimePicker.Create(sgENPlanWork);
          dtpTemp.Date := StrToDate(Cells[5,i+1]);
          dtpTemp.Tag := i + 1; // Запоминаем строку грида в Tag'е контрола
          dtpTemp.OnChange := plansGridDateValueChange;
          CellControls[5, i+1] := dtpTemp;
        end;

        Cells[6,i+1] := ENPlanWorkList.list[i].typeRefName;

        Cells[7,i+1] := ENPlanWorkList.list[i].stateRefShortName;

        Cells[8,i+1] := ENPlanWorkList.list[i].kindName;

        Cells[9,i+1] := ENPlanWorkList.list[i].statusName;

        //Cells[10,i+1] := ENPlanWorkList.list[i].departmentRefShortName;

        //Objects[0,i+1] := ENPlanWorkShort.Create;
        //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

        sgENPlanWork.RowCount := i + 2;

        for j := 0 to sgENPlanWork.ColCount - 1 do
        begin
          if (j = PLANS_GRID_OBJECT_COLUMN_NUMBER) or (j = PLANS_GRID_DATE_COLUMN_NUMBER) then
            CellProperties[j, i + 1].ReadOnly := false
          else
            CellProperties[j, i + 1].ReadOnly := true;

          CellProperties[j, i + 1].FontStyle := CellProperties[j, i + 1].FontStyle - [fsBold];
        end;
     end;

  sgENPlanWork.Row := sgENPlanWork.RowCount - 1;
  sgENPlanWork.Row := 1;

  //sgENPlanWork.Repaint;
  //SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
end;

procedure TfrmENPlanWorkBatchEdit.UpdateRecordPointsList;
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  i, elementType: Integer;
  ENWorkOrderBytItemList: ENWorkOrderBytItemShortList;
  condition, customerName: String;
begin
  ClearGrid(sgRecordPoints);

  if not edtDateGen.Checked then
  begin
    Application.MessageBox(PChar('Спочатку вкажіть дату виконання робіт!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    if edtDateGen.CanFocus then
      edtDateGen.SetFocus;
    Exit;
  end;

  if departmentCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    if edtENDepartment.CanFocus then
      edtENDepartment.SetFocus;
    Exit;
  end;

  if (not rbRecordPointsByt.Checked) and (not rbRecordPointsProm.Checked) then
  begin
    Application.MessageBox(PChar('Спочатку оберіть вид точок обліку (побутові/юридичні)!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    if rbRecordPointsByt.CanFocus then
      rbRecordPointsByt.SetFocus;
    Exit;
  end;

  /////
  elementType := LOW_INT;

  if rbRecordPointsByt.Checked then
    elementType := EN_BYT
  else if rbRecordPointsProm.Checked then
    elementType := EN_PROM;
  /////

  workOrderBytItemFilter := ENWorkOrderBytItemFilter.Create;
  SetNullIntProps(workOrderBytItemFilter);
  SetNullXSProps(workOrderBytItemFilter);

  condition := 'ENPLANWORK.departmentrefcode = ' + IntToStr(departmentCode);

  // Фильтр по участку - только для бытовых точек учета
  if rbRecordPointsByt.Checked then
    if siteCode <> LOW_INT then
      AddCondition(condition, 'rb.siterefcode = ' + IntToStr(siteCode));

  // По умолчанию выбираем только Черновые Месячные планы (ограничение по kind'у - в сервере)!!!
  // Либо при чекнутом чекбоксе выбираем еще и утвержденные Мес. планы без Заданий-Планов (а таких у Энергосбыта много)
  if chbIncludeClosedPlans.Checked then
    AddCondition(condition,
                 '( ' +
                 '  not exists ' +
                 '    (select pch.plannewrefcode ' +
                 '     from enplancorrecthistory pch ' +
                 '     where pch.planoldrefcode = ENPLANWORK.code ' +
                 '       and pch.reasoncode = ' + IntToStr(CORRECTREASON_MOVE_TO_NPW) + ') ' +
                 ') '
                )
  else
    AddCondition(condition, 'ENPLANWORK.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD));

  // Выбираем планы на месяц, который определяем по дате выполнения работ
  AddCondition(condition, 'ENPLANWORK.yeargen =  ' + IntToStr(YearOf(edtDateGen.DateTime)) +
                     ' and ENPLANWORK.monthgen = ' + IntToStr(MonthOf(edtDateGen.DateTime)));

  if getCountSelectedENPlanWorkType() = 0 then begin
    Application.MessageBox(PChar('Оберіть хоча б один вид робіт!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;
  if ListENPlanWorkType.Count <> getCountSelectedENPlanWorkType() then begin
    AddCondition(condition, 'ENPLANWORK.TYPEREFCODE IN  (' + getSelectedENPlanWorkType() + ')');
  end;


  if chbNotPlannedPlansOnly.Checked then begin
    AddCondition(condition, 'ENPLANWORK.FORMREFCODE = ' + IntToStr(ENPLANWORKFORM_NOPLANNED));
  end;

  workOrderBytItemFilter.conditionSQL := condition;

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

  ColCountsgsgRecordPoints :=100;

  //ENWorkOrderBytItemList := TempENWorkOrderBytItem.getScrollableFilteredListForPlanning(workOrderBytItemFilter, 0, -1);
  ENWorkOrderBytItemList := TempENWorkOrderBytItem.getScrollableFilteredListForPlanning(workOrderBytItemFilter, 0,
      ColCountsgsgRecordPoints, elementType);

  LastCountsgRecordPoints :=High(ENWorkOrderBytItemList.list);

  if High(ENWorkOrderBytItemList.list) > -1 then
    sgRecordPoints.RowCount := High(ENWorkOrderBytItemList.list) + 2
  else
    sgRecordPoints.RowCount := 2;

{
        ( 'Код'
          ,'Особ. рах.'
          ,'ПІБ абонента'
          ,'Адреса абонента'
          ,'Перелік робіт'
          ,'Дата плана'
        );
}

  with sgRecordPoints do
    for i := 0 to High(ENWorkOrderBytItemList.list) do
    begin
      Application.ProcessMessages;

      if ENWorkOrderBytItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      AddCheckBox(1, i + 1, false, false);

      Cells[1,i+1] := ENWorkOrderBytItemList.list[i].accountNumber;

      //Cells[2,i+1] := ENWorkOrderBytItemList.list[i].name;
      customerName := ENWorkOrderBytItemList.list[i].name;
      if elementType = EN_PROM then
        customerName := customerName + ' (' + ENWorkOrderBytItemList.list[i].recordPointName + ')';
      Cells[2,i+1] := customerName;

      Cells[3,i+1] := ENWorkOrderBytItemList.list[i].address;

      Cells[4,i+1] := ENWorkOrderBytItemList.list[i].kartaRefNum;

      if ENWorkOrderBytItemList.list[i].planRefDateStart = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := XSDate2String(ENWorkOrderBytItemList.list[i].planRefDateStart);

      Objects[1,i+1] := TObject(ENWorkOrderBytItemList.list[i].planRefCode);

      sgRecordPoints.RowCount := i + 2;
      LastRowsgRecordPoints :=i+1;
    end;
   ColCountsgsgRecordPoints:=ColCountsgsgRecordPoints+1;
   sgRecordPoints.Row := 1;
end;

procedure TfrmENPlanWorkBatchEdit.UpdateServicesList;
var
  TempENTimeLine: ENTimeLineControllerSoapPort;
  i: Integer;
  timeLineFilter: ENTimeLineFilter;
  ENTimeLineList: ENTimeLineShortList;
  condition: String;
begin
  ClearGrid(sgServices);

  if not edtDateGen.Checked then
  begin
    Application.MessageBox(PChar('Спочатку вкажіть дату виконання робіт!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    if edtDateGen.CanFocus then
      edtDateGen.SetFocus;
    Exit;
  end;

  if departmentCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Спочатку оберіть підрозділ!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    if edtENDepartment.CanFocus then
      edtENDepartment.SetFocus;
    Exit;
  end;

  timeLineFilter := ENTimeLineFilter.Create;
  SetNullIntProps(timeLineFilter);
  SetNullXSProps(timeLineFilter);

  timeLineFilter.dateGen := TXSDate.Create;
  timeLineFilter.dateGen.XSToNative(GetXSDate(edtDateGen.DateTime));

  // Бюджетодержатель может еще быть не выбран на Месячном плане, поэтому по нему не будем фильтровать
  //condition := 'ENSERVICESOBJECT.departmentcode = ' + IntToStr(departmentCode) +
  //        ' and ENPLANWORK.budgetrefcode = ' + IntToStr(ENBUDGET_ENERGOSBYT);

  condition := 'ENSERVICESOBJECT.departmentcode = ' + IntToStr(departmentCode);

  // Выбираем только Черновые Месячные планы (ограничение по kind'у - в сервере)!!!
  if chbNotClosedPlans.Checked then
    AddCondition(condition, 'ENPLANWORK.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD));

  {
  timeLineFilter.conditionSQL := 'ENSERVICESOBJECT.departmentcode = ' + IntToStr(departmentCode) +
                            ' and ENPLANWORK.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) +
                            ' and ENPLANWORK.budgetrefcode = ' + IntToStr(ENBUDGET_ENERGOSBYT);
  }

  if getCountSelectedENPlanWorkType() = 0 then begin
    Application.MessageBox(PChar('Оберіть хоча б один вид робіт!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;
  if ListENPlanWorkType.Count <> getCountSelectedENPlanWorkType() then begin
    AddCondition(condition, 'ENPLANWORK.TYPEREFCODE IN  (' + getSelectedENPlanWorkType() + ')');
  end;

  if chbNotPlannedPlansOnly.Checked then begin
    AddCondition(condition, 'ENPLANWORK.FORMREFCODE = ' + IntToStr(ENPLANWORKFORM_NOPLANNED));
  end;


  timeLineFilter.conditionSQL := condition;

  TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;

  ENTimeLineList := TempENTimeLine.getScrollableFilteredListForPlanning(timeLineFilter, 0, -1);

  if High(ENTimeLineList.list) > -1 then
    sgServices.RowCount := High(ENTimeLineList.list) + 2
  else
    sgServices.RowCount := 2;

{
        ( 'Код'
          //,'Дата'
          ,'№ договору'
          ,'Замовник'
          ,'Адреса об''єкту'
          ,'Калькуляції'
          ,'Виконавець'
          ,'Статус'
          ,'Бух. статус'
          ,'Час виїзду'
          ,'Час початку виконання робіт'
          ,'Час закінчення виконання робіт'
          //,'Час перевезення з объекту'
        );
}


  with sgServices do
    for i := 0 to High(ENTimeLineList.list) do
    begin
      Application.ProcessMessages;

      if ENTimeLineList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTimeLineList.list[i].code)
      else
        Cells[0,i+1] := '';

      AddCheckBox(1, i + 1, false, false);

      {
      if ENTimeLineList.list[i].dateGen = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(ENTimeLineList.list[i].dateGen);
      }

      Cells[1,i+1] := ENTimeLineList.list[i].servicesObjectRefContractNumberServices;
      Cells[2,i+1] := ENTimeLineList.list[i].servicesObjectRefContragentName;
      Cells[3,i+1] := ENTimeLineList.list[i].servicesObjectRefContragentAddressWork;

      Cells[4,i+1] := ENTimeLineList.list[i].classifications; // 'Калькуляції'

      Cells[5,i+1] := ENTimeLineList.list[i].virtualBrigadeRefNameCompound;

      Cells[6,i+1] := ENTimeLineList.list[i].servicesObjectRefContractStatusName; // 'Статус'
      Cells[7,i+1] := ENTimeLineList.list[i].servicesObjectRefBuhStatusName; // 'Бух. статус'

      if ENTimeLineList.list[i].timeMoveToObject = nil then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := XSTimeWithoutSeconds2String(ENTimeLineList.list[i].timeMoveToObject);

      if ENTimeLineList.list[i].timeStart = nil then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := XSTimeWithoutSeconds2String(ENTimeLineList.list[i].timeStart);

      if ENTimeLineList.list[i].timeFinal = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := XSTimeWithoutSeconds2String(ENTimeLineList.list[i].timeFinal);

      {
      if ENTimeLineList.list[i].timeMoveOfObject = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeMoveOfObject);
      }

      Objects[1,i+1] := TObject(ENTimeLineList.list[i].planCode);
      Objects[2,i+1] := TObject(ENTimeLineList.list[i].servicesObjectRefCode);

      sgServices.RowCount := i + 2;
    end;

   sgServices.Row := 1;
end;

procedure TfrmENPlanWorkBatchEdit.fillENPlanWorkType;
var
  TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
  typeList: ENPlanWorkTypeShortList;
  typeFilter : ENPlanWorkTypeFilter;
  i : Integer;
begin
  // заполняем список бюджетодержателей

     typeFilter := ENPlanWorkTypeFilter.Create;
     SetNullIntProps(typeFilter);
     SetNullXSProps(typeFilter);

     TempENPlanWorkType:= HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
     typeList := TempENPlanWorkType.getScrollableFilteredList(typeFilter,0,-1);
     ListENPlanWorkType.Items.Clear;

     for i:= 0 to High(typeList.list) do
      begin

        ListENPlanWorkType.Items.AddObject(typeList.list[i].name  , TObject( typeList.list[i].code )  );
        ListENPlanWorkType.Checked[i] := True;
      end;

end;

function TfrmENPlanWorkBatchEdit.getSelectedENPlanWorkType() : String;
var
i : Integer;
strArray : String;
begin

strArray := '';
for i := 0 to ListENPlanWorkType.Count - 1 do begin
    if ListENPlanWorkType.Checked[i] then begin
      if Length(strArray) > 0 then begin
        strArray := strArray + ', ' + IntToStr(Integer(ListENPlanWorkType.Items.Objects[i]));
      end else begin
        strArray := IntToStr(Integer(ListENPlanWorkType.Items.Objects[i]));
      end;
    end;


end;

Result := strArray;

end;

procedure TfrmENPlanWorkBatchEdit.plansGridDateValueChange(Sender: TObject);
var
  currentRow: Integer;
  dtpTemp: TDateTimePicker;
  strOriginalDate, strNewDate: String;
begin
  // Определяем активную строку грида по ранее сохраненному в контроле Tag'у
  try
    currentRow := (Sender as TDateTimePicker).Tag;
  except
    Exit;
  end;

  strOriginalDate := sgENPlanWork.Cells[PLANS_GRID_DATE_COLUMN_NUMBER, currentRow];

  dtpTemp := TDateTimePicker(sgENPlanWork.CellControls[PLANS_GRID_DATE_COLUMN_NUMBER, currentRow]);
  strNewDate := DateToStr(dtpTemp.Date);

  // Если дата изменилась, выделим строку желтым цветом
  if strNewDate <> strOriginalDate then
    sgENPlanWork.RowColor[currentRow] := clYellow
  else
    sgENPlanWork.RowColor[currentRow] := clWindow;
end;

procedure TfrmENPlanWorkBatchEdit.rdbOrderByObjectNameClick(Sender: TObject);
begin
  UpdatePlansListForDatesChanging;
end;

procedure TfrmENPlanWorkBatchEdit.SetDefaultPlanType;
begin
  planTypeCode := ENPLANWORKTYPE_ESBYT_PZ;
  edtTypeName.Text := 'ЕЗ - Планова заміна лічильника';
  // DisableControls([spbType]); 08.05.2019 по заданию Юрковского А , нужно дать доступ на выбор и других подвидов работ енергосбыта.
end;

function TfrmENPlanWorkBatchEdit.getCountSelectedENPlanWorkType() : Integer;
var
i : Integer;
count : Integer;
begin
count := 0;
for i := 0 to ListENPlanWorkType.Count - 1 do begin
    if ListENPlanWorkType.Checked[i] then begin
      count := count + 1;
    end;
end;

Result := count;

end;

end.
