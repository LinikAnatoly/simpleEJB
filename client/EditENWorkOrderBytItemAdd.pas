unit EditENWorkOrderBytItemAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Grids, AdvObj, BaseGrid, AdvGrid, Buttons, StdCtrls,
  ComCtrls, FINExecutorController, InvokeRegistry, Rio, SOAPHTTPClient, XSBuiltIns,
  ENConsts, ENWorkOrderBytItemController, ImgList, Menus, ActnList;

type
  TfrmENWorkOrderBytItemAddEdit = class(TDialogForm)
    sgFINWorker: TAdvStringGrid;
    edtFINExecutor: TEdit;
    lblFINExecutor: TLabel;
    spbFINExecutor: TSpeedButton;
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOFINWorker: THTTPRIO;
    spbFINExecutorClear: TSpeedButton;
    HTTPRIOENWorkOrderBytItem: THTTPRIO;
    btnUpdateHumenItemList: TButton;
    sgENHumenItem: TAdvStringGrid;
    chbRecordPoints: TCheckBox;
    chbServices: TCheckBox;
    chbWithoutFinWorkers: TCheckBox;
    HTTPRIOFINExecutor: THTTPRIO;
    chbCheckAll: TCheckBox;
    chbCheckSelected: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    btnCheckSelected: TButton;
    btnUncheckSelected: TButton;
    btnViewPlan: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    ActionList1: TActionList;
    actViewPlan: TAction;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    ImageList1: TImageList;
    chbServicesGrouped: TCheckBox;
    btnEditENPlanWorkBatch: TButton;
    chbWholeMonth: TCheckBox;
    Label3: TLabel;
    memLog: TMemo;
    actEditPlan: TAction;
    N1: TMenuItem;
    chbAllSites: TCheckBox;
    gbRecordPoints: TGroupBox;
    chbRecordPointsByt: TCheckBox;
    chbRecordPointsProm: TCheckBox;
    Label2: TLabel;
    cbBudget: TComboBox;
    chbPL: TCheckBox;
    chbTP: TCheckBox;
    chbSepo: TCheckBox;
    procedure spbFINExecutorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbFINExecutorClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateHumenItemListClick(Sender: TObject);
    procedure chbCheckAllClick(Sender: TObject);
    procedure chbCheckSelectedClick(Sender: TObject);
    procedure btnCheckSelectedClick(Sender: TObject);
    procedure btnUncheckSelectedClick(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEditENPlanWorkBatchClick(Sender: TObject);
    procedure chbWholeMonthClick(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure chbRecordPointsClick(Sender: TObject);
    procedure sgENHumenItemFilterSelect(Sender: TObject; Column,
      ItemIndex: Integer; FriendlyName: string; var FilterCondition: string);
    procedure sgENHumenItemGetColumnFilter(Sender: TObject; Column: Integer;
      Filter: TStrings);
    procedure cbBudgetChange(Sender: TObject);
    procedure toggleChbButtons();
    procedure toggleChbSepo();
    procedure chbSepoClick(Sender: TObject);
  private
    { Private declarations }
    executor: FINExecutor;
    ENWorkOrderBytItemObj: ENWorkOrderBytItem;
    procedure UpdateFinWorkerList(finDepartmentCode: Integer = LOW_INT; axDepartmentCode: String = '');
    procedure UpdateHumenItemList;
  public
    { Public declarations }
    dateGet: TXSDate;
    workOrderBytCode: Integer;
    departmentCode: Integer;
    departmentName: String;
    finDepartmentCode: Integer;
    axDepartmentCode: String;
    siteCode: Integer;
    siteName: String;
  end;

var
  frmENWorkOrderBytItemAddEdit: TfrmENWorkOrderBytItemAddEdit;

implementation

uses ShowFINExecutorTree, ChildFormUnit, FINWorkerController,
  GridHeadersUnit, FINWorkerKindController, ENWorkOrderBytController,
  ENHumenItemController, ENPlanWorkController, EditENPlanWork,
  EditENPlanWorkBatch, DMReportsUnit;

{$R *.dfm}

const
  FINWORKER_COLUMN_INDEX = 7; // Индекс столбца "Виконавець" в гриде sgENHumenItem
  PLAN_DATE_COLUMN_INDEX = 8; // Индекс столбца "Дата плана" в гриде sgENHumenItem

  WORKLOAD_COLUMN_INDEX = 12; // Индекс столбца "Завантаження (у годинах) на дату завдання" в гриде sgFINWorker

var
  FINWorkerHeaders: array [1..13] of String =
        ( 'Код'
          ,'ПІБ працівника'
          ,'Таб. №'
          ,'Посада'
          ,'Код посади із кадрів'
          ,'Підрозділ'
          ,'Код підрозділу'
          ,'Оклад'
          ,'Код категорії посади'
          ,'Код із кадрів'
          ,'Код штатного'
          ,'Код РЕЗ'
          //,'Завантаження (у годинах) на дату завдання'
          ,'Завантаження (у годинах)' // ПРИ ИЗМЕНЕНИИ ИНДЕКСА ЭТОГО СТОЛБЦА ИЗМЕНИТЬ WORKLOAD_COLUMN_INDEX!!!
        );

{
  ENHumenItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Виконавець'
          ,'Код роботи'
          ,'Робота'
          ,'№ дог. з послуг'
          ,'Особ. рахунок'
          ,'ПІБ абонента'
          ,'Адреса абонента'
          ,'Номер тел. абонента'
          ,'Інв. № лічильника'
          ,'Сер. № лічильника'
          ,'Номери пломб'
        );
}
  ENHumenItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Адреса абонента'
          ,'Особ. рах. / № дог. з послуг'
          ,'ПІБ абонента'
          ,'Код роботи'
          ,'Робота'
          ,'Норм. посада'
          ,'Виконавець' // ПРИ ИЗМЕНЕНИИ ИНДЕКСА ЭТОГО СТОЛБЦА ИЗМЕНИТЬ FINWORKER_COLUMN_INDEX!!!
          ,'Дата плана' // ПРИ ИЗМЕНЕНИИ ИНДЕКСА ЭТОГО СТОЛБЦА ИЗМЕНИТЬ PLAN_DATE_COLUMN_INDEX!!!
        );


procedure TfrmENWorkOrderBytItemAddEdit.toggleChbButtons();
begin
  if Integer(cbBudget.Items.Objects[cbBudget.ItemIndex]) = ENBUDGET_VRTUVD then
  begin
    //HideControls([chbServices]);
    chbSepo.Checked := False;
    toggleChbSepo();
    HideControls([chbPL, chbTP], false);
    HideControls([chbSepo], true);
  end
  else begin
    //HideControls([chbServices], false);
    HideControls([chbPL, chbTP]);
    HideControls([chbSepo], false);
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.toggleChbSepo();
begin
  if chbSepo.Checked then begin
     chbServicesGrouped.Checked := False;
     chbServicesGrouped.Enabled := False;
  end else begin
      chbServicesGrouped.Enabled := True;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.btnUncheckSelectedClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENHumenItem.RowCount - 1 do
  begin
    if sgENHumenItem.SelectedCells[1, i] then
      sgENHumenItem.SetCheckBoxState(1, i, false);
  end;

  chbCheckAll.OnClick := nil;
  try
    chbCheckAll.Checked := false;
  finally
    chbCheckAll.OnClick := chbCheckAllClick;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.btnUpdateHumenItemListClick(Sender: TObject);
begin
  UpdateHumenItemList;
end;

procedure TfrmENWorkOrderBytItemAddEdit.actEditPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    planCode: Integer;
begin
  planCode := Integer(sgENHumenItem.Objects[1, sgENHumenItem.Row]);

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
    begin
      UpdateHumenItemList;
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.actViewPlanExecute(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planCode: Integer;
begin
  planCode := Integer(sgENHumenItem.Objects[1, sgENHumenItem.Row]);

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

procedure TfrmENWorkOrderBytItemAddEdit.btnCheckSelectedClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENHumenItem.RowCount - 1 do
  begin
    if sgENHumenItem.SelectedCells[1, i] then
      sgENHumenItem.SetCheckBoxState(1, i, true);
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

procedure TfrmENWorkOrderBytItemAddEdit.btnEditENPlanWorkBatchClick(
  Sender: TObject);
begin
  frmENPlanWorkBatchEdit := TfrmENPlanWorkBatchEdit.Create(Application, dsInsert);
  try
    frmENPlanWorkBatchEdit.departmentCode := departmentCode;
    frmENPlanWorkBatchEdit.departmentName := departmentName;

    if dateGet <> nil then
      frmENPlanWorkBatchEdit.strDate := DateToStr(EncodeDate(dateGet.Year, dateGet.Month, dateGet.Day));

    if siteCode <> LOW_INT then
    begin
      frmENPlanWorkBatchEdit.siteCode := siteCode;
      frmENPlanWorkBatchEdit.siteName := siteName;
    end;

    frmENPlanWorkBatchEdit.ShowModal;
  finally
    frmENPlanWorkBatchEdit.Free;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.cbBudgetChange(Sender: TObject);
begin
  toggleChbButtons();
end;

procedure TfrmENWorkOrderBytItemAddEdit.chbCheckAllClick(Sender: TObject);
begin
  CheckGrid(sgENHumenItem, 1, chbCheckAll.Checked);

  chbCheckSelected.OnClick := nil;
  try
    chbCheckSelected.Checked := chbCheckAll.Checked; //false;
  finally
    chbCheckSelected.OnClick := chbCheckSelectedClick;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.chbCheckSelectedClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENHumenItem.RowCount - 1 do
  begin
    if sgENHumenItem.SelectedCells[1, i] then
      sgENHumenItem.SetCheckBoxState(1, i, chbCheckSelected.Checked);
  end;

  chbCheckAll.OnClick := nil;
  try
    chbCheckAll.Checked := false;
  finally
    chbCheckAll.OnClick := chbCheckAllClick;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.chbRecordPointsClick(Sender: TObject);
begin
  gbRecordPoints.Visible := chbRecordPoints.Checked;
end;

procedure TfrmENWorkOrderBytItemAddEdit.chbSepoClick(Sender: TObject);
begin
  inherited;
  toggleChbSepo();
end;

procedure TfrmENWorkOrderBytItemAddEdit.chbWholeMonthClick(Sender: TObject);
begin
  if chbWholeMonth.Checked then
  begin
    sgENHumenItem.ColWidths[FINWORKER_COLUMN_INDEX] := sgENHumenItem.ColWidths[FINWORKER_COLUMN_INDEX] - 65;
    sgENHumenItem.ColWidths[PLAN_DATE_COLUMN_INDEX] := 65;
  end
  else begin
    sgENHumenItem.ColWidths[PLAN_DATE_COLUMN_INDEX] := 0;
    sgENHumenItem.ColWidths[FINWORKER_COLUMN_INDEX] := sgENHumenItem.ColWidths[FINWORKER_COLUMN_INDEX] + 65;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
    ENWorkOrderBytItemShortObj: ENWorkOrderBytItemShort;
    i, humenItemCode, planCode, tcCode, positionCode: Integer;
    state: Boolean;
    accountNumber, contragentName: String;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     // edtName
     // ,edtAddress
     ])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
    Exit;
  end
  else
  begin
    if (workOrderBytCode = LOW_INT) then
      raise Exception.Create('Не вказано код Змінного завдання!');

    sgENHumenItem.FilterActive := True;


    state := false;
    for i := 1 to sgENHumenItem.RowCount - 1 do
    begin
      sgENHumenItem.GetCheckBoxState(1, i, state);
      if state then
        break;
    end;

    if not state then
    begin
      Application.MessageBox(PChar('Оберіть хоча б одну строку з планів!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

    ENWorkOrderBytItemObj := ENWorkOrderBytItem.Create;

    ENWorkOrderBytItemObj.code := LOW_INT;
    SetNullIntProps(ENWorkOrderBytItemObj);
    SetNullXSProps(ENWorkOrderBytItemObj);

    ENWorkOrderBytItemObj.workOrderBytRef := ENWorkOrderBytRef.Create;
    ENWorkOrderBytItemObj.workOrderBytRef.code := workOrderBytCode;

    ENWorkOrderBytItemObj.finWorker := FINWorker.Create;
    ENWorkOrderBytItemObj.finWorker.code := LOW_INT;
    ENWorkOrderBytItemObj.finWorker.name := GetReturnValue(sgFINWorker,1);
    try
      ENWorkOrderBytItemObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);

      if ENWorkOrderBytItemObj.finWorker.tabNumber = '' then
      begin
        Application.MessageBox(PChar('Оберіть виконавця робіт!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
        Exit;
      end;
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Оберіть виконавця робіт!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
        Exit;
      end;
    end;

    ENWorkOrderBytItemObj.finWorker.positionName := GetReturnValue(sgFINWorker,3);
    if GetReturnValue(sgFINWorker,4) <> '' then
      ENWorkOrderBytItemObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
    else
      ENWorkOrderBytItemObj.finWorker.positionCode := LOW_INT;

    ENWorkOrderBytItemObj.finWorker.departmentName := GetReturnValue(sgFINWorker,5);
    ENWorkOrderBytItemObj.finWorker.departmentCode := (GetReturnValue(sgFINWorker,6));
    if ENWorkOrderBytItemObj.finWorker.priceGen = nil then ENWorkOrderBytItemObj.finWorker.priceGen := TXSDecimal.Create;
    ENWorkOrderBytItemObj.finWorker.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

    ENWorkOrderBytItemObj.finWorker.kindRef := FINWorkerKindRef.Create;

    ENWorkOrderBytItemObj.finWorker.categor := LOW_INT;

    if GetReturnValue(sgFINWorker,8) = '' then
    begin
      ENWorkOrderBytItemObj.finWorker.kindRef.code := FINWORKER_KIND_OTHER;
    end
    else
    begin
      //if StrToInt(GetReturnValue(sgFINWorker,8)) =
      ENWorkOrderBytItemObj.finWorker.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
    end;

    if GetReturnValue(sgFINWorker,9) <> '' then
      ENWorkOrderBytItemObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
    else
      ENWorkOrderBytItemObj.finWorker.finCode := LOW_INT;

    if (GetReturnValue(sgFINWorker,13) <> '') then
      ENWorkOrderBytItemObj.finWorker.categorId := StrToInt(GetReturnValue(sgFINWorker,13))
    else
      ENWorkOrderBytItemObj.finWorker.categorId := LOW_INT;

    ENWorkOrderBytItemObj.finWorker.categorName := GetReturnValue(sgFINWorker,14);
    ENWorkOrderBytItemObj.finWorker.workTimeId := GetReturnValue(sgFINWorker,15);

    ENWorkOrderBytItemObj.finWorker.positionId := GetReturnValue(sgFINWorker,16);

    if Application.MessageBox(PChar('Працівника ' + ENWorkOrderBytItemObj.finWorker.name + ' буде підв''язано до ВСІХ вибраних робіт.' + #13#10 +
                                    'Продовжити ?'),
                      PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    begin
      Action := caNone;
      Exit;
    end;

    memLog.Clear;

    for i := 1 to sgENHumenItem.RowCount - 1 do
    begin
      sgENHumenItem.GetCheckBoxState(1, i, state);

      {
      if state then
      begin
        try
          humenItemCode := StrToInt(sgENHumenItem.Cells[0, i]);
        except
          on EConvertError do continue;
        end;

        ENWorkOrderBytItemObj.code := LOW_INT;
        ENWorkOrderBytItemObj.humenItemRef := ENHumenItemRef.Create;
        ENWorkOrderBytItemObj.humenItemRef.code := humenItemCode;

        TempENWorkOrderBytItem.add(ENWorkOrderBytItemObj);
      end;
      }

      if state then
      begin
        try
          humenItemCode := StrToInt(sgENHumenItem.Cells[0, i]);
        except
          on EConvertError do humenItemCode := LOW_INT;
        end;

        planCode     := Integer(sgENHumenItem.Objects[1, i]);
        tcCode       := Integer(sgENHumenItem.Objects[2, i]);
        positionCode := Integer(sgENHumenItem.Objects[3, i]);

        //accountNumber  := sgENHumenItem.Cells[2, i];
        //contragentName := sgENHumenItem.Cells[3, i];
        accountNumber  := sgENHumenItem.Cells[10, i];
        contragentName := sgENHumenItem.Cells[11, i];

        try
          // Если добавляют строку из развернутого списка работ
          if humenItemCode <> LOW_INT then
          begin
            ENWorkOrderBytItemObj.humenItemRef := ENHumenItemRef.Create;
            ENWorkOrderBytItemObj.humenItemRef.code := humenItemCode;

            TempENWorkOrderBytItem.add(ENWorkOrderBytItemObj);
          end
          // Если добавляют строку из списка работ, свернутого по калькуляциям (для услуг на сторону)
          else begin
            ENWorkOrderBytItemObj.humenItemRef := ENHumenItemRef.Create;
            ENWorkOrderBytItemObj.humenItemRef.code := LOW_INT;

            ENWorkOrderBytItemShortObj := ENWorkOrderBytItemShort.Create;
            ENWorkOrderBytItemShortObj.planRefCode := planCode;
            ENWorkOrderBytItemShortObj.kartaRefCode := tcCode;
            ENWorkOrderBytItemShortObj.positionCode := positionCode;

            TempENWorkOrderBytItem.addFromShort(ENWorkOrderBytItemObj, ENWorkOrderBytItemShortObj);
          end;
        except
          on E: Exception do
          begin
            memLog.Lines.Add('[ Особ. рах./дог. № ' + accountNumber + ' (' + contragentName +
                             '), код плану: ' + IntToStr(planCode) + ' ]: ' + E.Message + #13#10);
            Action := caNone;
            continue;
          end;
        end;

      end;
    end;

    // Перечитаем грид с планами в случае, если были ошибки при добавлении строк
    if Action = caNone then
      UpdateHumenItemList;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.FormCreate(Sender: TObject);
begin
  executor := nil;
  dateGet := nil;
  ENWorkOrderBytItemObj := nil;
  workOrderBytCode := LOW_INT;
  departmentCode := LOW_INT;
  departmentName := '';
  finDepartmentCode := LOW_INT;
  axDepartmentCode := '';
  siteCode := LOW_INT;
  siteName := '';
end;

procedure TfrmENWorkOrderBytItemAddEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(executor) then
    executor.Free;

  if Assigned(dateGet) then
    dateGet.Free;
end;

procedure TfrmENWorkOrderBytItemAddEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmENWorkOrderBytItemAddEdit.FormShow(Sender: TObject);
var
  TempFINExecutor: FINExecutorControllerSoapPort;
  executorFilter: FINExecutorFilter;
  executorList: FINExecutorShortList;
begin
  SetGridHeaders(FINWorkerHeaders, sgFINWorker.ColumnHeaders);
  SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);

  if dateGet <> nil then
    sgFINWorker.ColumnHeaders[WORKLOAD_COLUMN_INDEX] := sgFINWorker.ColumnHeaders[WORKLOAD_COLUMN_INDEX] +
      //' (' + DateToStr(EncodeDate(dateGet.Year, dateGet.Month, dateGet.Day)) + ')';
      ' на ' + DateToStr(EncodeDate(dateGet.Year, dateGet.Month, dateGet.Day));

  // По умолчанию прячем столбец "Дата плана"
  sgENHumenItem.ColWidths[PLAN_DATE_COLUMN_INDEX] := 0;
  sgENHumenItem.ColWidths[FINWORKER_COLUMN_INDEX] := sgENHumenItem.ColWidths[FINWORKER_COLUMN_INDEX] + 65;

  DisableControls([edtFINExecutor, memLog]);
  DenyBlankValues([edtFINExecutor]);

  // SUPP-106021 sgENHumenItem.SortSettings.Show := false;

  HideControls([chbPL, chbTP]);

  cbBudget.Items.Clear;
  cbBudget.Items.AddObject('(усі припустимі)', TObject(-1));
  cbBudget.Items.AddObject('Енергозбут', TObject(ENBUDGET_ENERGOSBYT));
  cbBudget.Items.AddObject('Метрологія', TObject(ENBUDGET_METROLOGY));
  cbBudget.Items.AddObject('ВРТУВД', TObject(ENBUDGET_VRTUVD));
  cbBudget.ItemIndex := 0;

  if (finDepartmentCode > LOW_INT) then
  begin
    executorFilter := FINExecutorFilter.Create;
    SetNullIntProps(executorFilter);
    SetNullXSProps(executorFilter);

    executorFilter.finCode := finDepartmentCode;

    TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
    executorList := TempFINExecutor.getFINExecutorList(executorFilter, 0, -1);

    if executorList.totalCount > 0 then
      edtFINExecutor.Text := executorList.list[0].name;

    UpdateFinWorkerList(finDepartmentCode);
  end
  else if (axDepartmentCode <> '') then
  begin
    executorFilter := FINExecutorFilter.Create;
    SetNullIntProps(executorFilter);
    SetNullXSProps(executorFilter);

    executorFilter.axOrgId := axDepartmentCode;

    TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
    executorList := TempFINExecutor.getFINExecutorList(executorFilter, 0, -1);

    if executorList.totalCount > 0 then
      edtFINExecutor.Text := executorList.list[0].name;

    UpdateFinWorkerList(LOW_INT, axDepartmentCode);
  end;
  toggleChbButtons();
end;

procedure TfrmENWorkOrderBytItemAddEdit.sgENHumenItemFilterSelect(
  Sender: TObject; Column, ItemIndex: Integer; FriendlyName: string;
  var FilterCondition: string);
  var
  cond : String;
  d : TFilterData;
begin
  inherited;
  if FilterCondition = GRID_FILTER_CONDITION_DEFINE then begin
    cond := InputBox('EnergyNet', sgENHumenItem.ColumnHeaders[Column], '*');
  end;

  sgENHumenItem.FilterActive := False;
  if FilterCondition = GRID_FILTER_CONDITION_ALL then begin
    FilterCondition := '*'
  end else begin
    FilterCondition := '';
    d:= sgENHumenItem.Filter.Add;
    d.Condition := cond;
    d.Column := Column;
    d.CaseSensitive := False;
    sgENHumenItem.FilterActive := True;
  end;
end;


procedure TfrmENWorkOrderBytItemAddEdit.sgENHumenItemGetColumnFilter(
  Sender: TObject; Column: Integer; Filter: TStrings);
begin
  inherited;
  sgENHumenItem.Filter.Clear;
  if Column in [1, 2, 3, 4, 5, 6, 7] then  begin
    Filter.Add(GRID_FILTER_CONDITION_ALL);
    Filter.Add(GRID_FILTER_CONDITION_DEFINE);
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.spbFINExecutorClearClick(
  Sender: TObject);
begin
  executor := nil;
  edtFINExecutor.Text := '';

  UpdateFinWorkerList;
end;

procedure TfrmENWorkOrderBytItemAddEdit.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter

 //  executorFilter: FINExecutorFilter;
begin
  {
  if (finDepartmentCode > LOW_INT) then
  begin
    executorFilter := FINExecutorFilter.Create;
    SetNullIntProps(executorFilter);
    SetNullXSProps(executorFilter);

    executorFilter.finCode := finDepartmentCode;
    frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application, fmNormal, executorFilter);
  end
  else
    frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application, fmNormal);
  }
  frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application, fmNormal);
  try
    with frmFINExecutorTreeShow do
    begin
      DisableActions([actEdit, actInsert]);
      if ShowModal = mrOk then
      begin
        try
          executor :=
            DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                   DMReports.getFullExecutorName(tvDep.Selected));
          edtFINExecutor.Text := executor.name;
        except
          on EConvertError do Exit;
        end;

        UpdateFinWorkerList;
      end;
    end;
  finally
    frmFINExecutorTreeShow.Free;
  end;
end;

procedure TfrmENWorkOrderBytItemAddEdit.UpdateFinWorkerList(finDepartmentCode: Integer = LOW_INT; axDepartmentCode: String = '');
var
  TempFINWorker: FINWorkerControllerSoapPort;
  i, LastCount: Integer;
  FINWorkerList: FINWorkerShortList;
  condition: String;
  f: FINWorkerFilter;
begin
  ClearGrid(sgFINWorker);

  if dateGet = nil then
    raise Exception.Create('NET-4350 Не вказано дату виконання робіт!');

  if (finDepartmentCode = LOW_INT) and (axDepartmentCode = '') then
  begin
    if (executor = nil) then
    begin
      //Application.MessageBox(PChar('Спочатку вкажіть виконавця (бригаду або дільницю)!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      //edtFINExecutor.SetFocus;
      Exit;
    end;

    if {(executor.code = LOW_INT) or }(executor.finCode = LOW_INT) and (executor.axOrgId = '') then
    begin
      //Application.MessageBox(PChar('Спочатку вкажіть виконавця (бригаду або дільницю)!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      //edtFINExecutor.SetFocus;
      Exit;
    end;
  end;

  TempFINWorker := HTTPRIOFINWorker as FINWorkerControllerSoapPort;

  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if (finDepartmentCode > LOW_INT) then
    f.departmentCode := IntToStr(finDepartmentCode)
  else if (axDepartmentCode <> '') then
    f.departmentCode := axDepartmentCode
  else begin
    if (executor.finCode > LOW_INT) then
      f.departmentCode := IntToStr(executor.finCode)
    else
      f.departmentCode := executor.axOrgId;
  end;

  //FINWorkerList := TempFINWorker.getWorkerList(f, 0, -1, dateGet, false);
  FINWorkerList := TempFINWorker.getFINWorkerListWithWorkLoad(f, 0, -1, dateGet, false);

  LastCount := High(FINWorkerList.list);

  if LastCount > -1 then
    sgFINWorker.RowCount := LastCount + 2
  else
    sgFINWorker.RowCount := 2;

  with sgFINWorker do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;
      if FINWorkerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINWorkerList.list[i].code)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := FINWorkerList.list[i].name;

      if FINWorkerList.list[i].tabNumber = '' then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := FINWorkerList.list[i].tabNumber;

      Cells[3,i+1] := FINWorkerList.list[i].positionName;
      if FINWorkerList.list[i].positionCode = Low(Integer) then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := IntToStr(FINWorkerList.list[i].positionCode);
      Cells[5,i+1] := FINWorkerList.list[i].departmentName;
      Cells[6,i+1] := FINWorkerList.list[i].departmentCode;
      if FINWorkerList.list[i].priceGen = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := ''; //FINWorkerList.list[i].priceGen.DecimalString;
      if FINWorkerList.list[i].categor = Low(Integer) then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := IntToStr(FINWorkerList.list[i].categor);
      if FINWorkerList.list[i].finCode = Low(Integer) then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := IntToStr(FINWorkerList.list[i].finCode);

      if FINWorkerList.list[i].doljnostid = Low(Integer) then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := IntToStr(FINWorkerList.list[i].doljnostid);

      if FINWorkerList.list[i].cehid = Low(Integer) then
        Cells[11,i+1] := ''
      else
        Cells[11,i+1] := IntToStr(FINWorkerList.list[i].cehid);

      if FINWorkerList.list[i].workLoad = nil then
        Cells[12,i+1] := ''
      else
        Cells[12,i+1] := FINWorkerList.list[i].workLoad.DecimalString;

     // припрячем оклад ...
      Objects[0, i+1] :=  TObject(FINWorkerList.list[i].priceGen.DecimalString);

      if FINWorkerList.list[i].categorId = Low(Integer) then
        Cells[13,i+1] := ''
      else
        Cells[13,i+1] := IntToStr(FINWorkerList.list[i].categorId);

      Cells[14,i+1] := FINWorkerList.list[i].categorName;
      Cells[15,i+1] := FINWorkerList.list[i].workTimeId;
      Cells[16,i+1] := FINWorkerList.list[i].positionId;

      sgFINWorker.RowCount := i + 2;
    end;

  sgFINWorker.Row := 1;
end;

procedure TfrmENWorkOrderBytItemAddEdit.UpdateHumenItemList;
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  i, LastCount, planCode, budgetCode: Integer;
  ENWorkOrderBytItemList: ENWorkOrderBytItemShortList;
  itemFilter: ENWorkOrderBytItemFilter;
  plansCondition, planDatesCondition, condition, strElementTypes: String;
begin
  ClearGrid(sgENHumenItem);

  chbCheckAll.Checked := false;
  chbCheckSelected.Checked := false;

  if departmentCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не вказано підрозділ!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

  itemFilter := ENWorkOrderBytItemFilter.Create;
  SetNullIntProps(itemFilter);
  SetNullXSProps(itemFilter);

  ///// TEMP!!!!!
  //itemFilter.conditionSQL := 'ENPLANWORK.code in (1017142226, 1017156512)';

  budgetCode := Integer(cbBudget.Items.Objects[cbBudget.ItemIndex]);

  strElementTypes := '';

  if chbRecordPoints.Checked then
  begin
    if chbRecordPointsByt.Checked then
      AddListPos(strElementTypes, IntToStr(EN_BYT));

    if chbRecordPointsProm.Checked then
      AddListPos(strElementTypes, IntToStr(EN_PROM));
  end;

  if chbServices.Checked {and (budgetCode <> ENBUDGET_VRTUVD)} then
    AddListPos(strElementTypes, IntToStr(EN_SERVICES_OBJECT));

  if budgetCode = ENBUDGET_VRTUVD then
  begin
    if chbPL.Checked then
    begin
      AddListPos(strElementTypes, IntToStr(EN_LINE04));
      // 20.12.2016 SUPP-57283 Добавлены кабельные линии
      AddListPos(strElementTypes, IntToStr(EN_LINE_CABLE));
    end;

    if chbTP.Checked then
      AddListPos(strElementTypes, IntToStr(EN_SUBSTATION04));

  end;

  if chbSepo.Checked then begin
    AddListPos(strElementTypes, IntToStr(EN_METROLOGY_COUNTER));
  end;

  if strElementTypes = '' then
  begin
    Application.MessageBox(PChar('Оберіть, будь ласка, тип об''єкту планування (точки обліку або послуги на сторону)!'),
                           PChar('Увага !'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  // SUPP-16785 Выбор планов за весь месяц
  if chbWholeMonth.Checked then
  begin
    planDatesCondition := 'ENPLANWORK.yeargen = '  + IntToStr(dateGet.Year) + ' and ' +
                          'ENPLANWORK.monthgen = ' + IntToStr(dateGet.Month);
  end
  else
    planDatesCondition := 'ENPLANWORK.datestart = ''' + DateToStr(EncodeDate(dateGet.Year, dateGet.Month, dateGet.Day)) + '''';

  //****************************************************************************
  // Условие выбора планов
  plansCondition :=
               //'ENPLANWORK.datestart = ''' + DateToStr(EncodeDate(dateGet.Year, dateGet.Month, dateGet.Day)) + '''' +

               planDatesCondition +

               ' and ENPLANWORK.departmentrefcode = ' + IntToStr(departmentCode) +

               //// SUPP-16988 Планы в технических лицевых счетах по новым абонентам
               //' and ENPLANWORK.budgetrefcode = ' + IntToStr(ENBUDGET_ENERGOSBYT) +
               // Если тип элемента - точка учета, то выбираем планы не только Энергосбыта, но и ВРТУВД
               {
               ' and ' +
               '   ( ' +
               '      ENPLANWORK.budgetrefcode = ' + IntToStr(ENBUDGET_ENERGOSBYT) + ' or ' +
               '      (ENELEMENT.typerefcode = ' + IntToStr(EN_BYT) +
               '       and ENPLANWORK.budgetrefcode in (' + IntToStr(ENBUDGET_ENERGOSBYT) + ', ' + IntToStr(ENBUDGET_VRTUVD) + ')) ' +
               '   ) ' +
               }
               // NET-4530 Для привязки пломб нужно выбирать также планы ВРТУ на ПЛ и ТП
               ' and ' +
               '   ( ' +
               '      ENPLANWORK.budgetrefcode = ' + IntToStr(ENBUDGET_ENERGOSBYT) + ' or ' +
               '      ENPLANWORK.budgetrefcode = ' + IntToStr(ENBUDGET_METROLOGY) + ' or ' +

               '      ENPLANWORK.budgetrefcode = ' + IntToStr(ENBUDGET_VRTUVD) +
               '   ) ' +
               ////

               ' and ENPLANWORK.kindcode = ' + IntToStr(ENPLANWORKKIND_NPZ) +
               ' and ENPLANWORK.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) +
               ' and ENELEMENT.typerefcode in (' + strElementTypes + ')';

  if (budgetCode > 0) then
  begin
    plansCondition := plansCondition + ' and ENPLANWORK.budgetrefcode = ' + IntToStr(budgetCode);
  end;
  //****************************************************************************

  condition := plansCondition;

  // Фильтр по участку
  if (siteCode <> LOW_INT) and (not chbAllSites.Checked) then
  begin
    AddCondition(condition,
                 '(case ' +
                 '  when ENELEMENT.typerefcode = ' + IntToStr(EN_BYT) + ' then ' +
                 '    (select rb.siterefcode from enrecordpointbyt rb where rb.elementcode = ENELEMENT.code) ' +
                 '  else ' + IntToStr(siteCode) +
                 'end) = ' + IntToStr(siteCode));
  end;

  if chbWithoutFinWorkers.Checked then
    AddCondition(condition, 'ENHUMENITEM.FINWORKERCODE is null');

  itemFilter.conditionSQL := condition;

  if chbServicesGrouped.Checked then
    ENWorkOrderBytItemList := TempENWorkOrderBytItem.getScrollableFilteredListForAdd2(itemFilter, 0, -1)
  else
    ENWorkOrderBytItemList := TempENWorkOrderBytItem.getScrollableFilteredListForAdd(itemFilter, 0, -1);

  LastCount := High(ENWorkOrderBytItemList.list);

  if LastCount > -1 then
    sgENHumenItem.RowCount := LastCount + 2
  else
    sgENHumenItem.RowCount := 2;

  planCode := LOW_INT;

  with sgENHumenItem do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

{
        ( 'Код'
          ,'Адреса абонента'
          ,'Особ. рах. / № дог. з послуг'
          ,'ПІБ абонента'
          ,'Код роботи'
          ,'Робота'
          ,'Норм. посада'
          ,'Виконавець'
        );
}

      {
      if ENWorkOrderBytItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytItemList.list[i].code)
      else
        Cells[0,i+1] := '';
      }
      if ENWorkOrderBytItemList.list[i].humenItemRefCode <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytItemList.list[i].humenItemRefCode)
      else
        Cells[0,i+1] := '';

      // Если в списке несколько строк с одного плана, то данные по абоненту
      // выводим только один раз (в первой строке, для остальных строк - пусто)
      if ENWorkOrderBytItemList.list[i].planRefCode <> planCode then
      begin
        planCode := ENWorkOrderBytItemList.list[i].planRefCode;

        Cells[1,i+1] := ENWorkOrderBytItemList.list[i].address;

        if ENWorkOrderBytItemList.list[i].contractNumberServices <> '' then
          Cells[2,i+1] := ENWorkOrderBytItemList.list[i].contractNumberServices
        else
          Cells[2,i+1] := ENWorkOrderBytItemList.list[i].accountNumber;

        Cells[3,i+1] := ENWorkOrderBytItemList.list[i].name;
      end
      else begin
        Cells[1,i+1] := '';
        Cells[2,i+1] := '';
        Cells[3,i+1] := '';
      end;

      AddCheckBox(1, i + 1, false, false);

      Cells[4,i+1] := ENWorkOrderBytItemList.list[i].kartaRefNum;
      Cells[5,i+1] := ENWorkOrderBytItemList.list[i].kartaRefName;

      Cells[6,i+1] := ENWorkOrderBytItemList.list[i].positionName;

      if ENWorkOrderBytItemList.list[i].finWorkerTabNumber <> '' then
        Cells[7,i+1] := ENWorkOrderBytItemList.list[i].finWorkerName +
          ' (таб. №' + ENWorkOrderBytItemList.list[i].finWorkerTabNumber + ')';

      if ENWorkOrderBytItemList.list[i].planRefDateStart <> nil then
        Cells[8,i+1] := XSDate2String(ENWorkOrderBytItemList.list[i].planRefDateStart)
      else
        Cells[8,i+1] := '';

      ///// Невидимые ячейки для вывода данных из них в лог (memLog) в случае exception'а
      Cells[9,i+1] := ENWorkOrderBytItemList.list[i].address;

      if ENWorkOrderBytItemList.list[i].contractNumberServices <> '' then
        Cells[10,i+1] := ENWorkOrderBytItemList.list[i].contractNumberServices
      else
        Cells[10,i+1] := ENWorkOrderBytItemList.list[i].accountNumber;

      Cells[11,i+1] := ENWorkOrderBytItemList.list[i].name;
      /////

      Objects[1,i+1] := TObject(ENWorkOrderBytItemList.list[i].planRefCode);
      Objects[2,i+1] := TObject(ENWorkOrderBytItemList.list[i].kartaRefCode);
      Objects[3,i+1] := TObject(ENWorkOrderBytItemList.list[i].positionCode);

      sgENHumenItem.RowCount := i + 2;
    end;

  sgENHumenItem.Row := 1;
end;

end.

