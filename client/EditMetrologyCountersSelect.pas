unit EditMetrologyCountersSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls, Grids, BaseGrid,
  AdvGrid, InvokeRegistry, Rio, SOAPHTTPClient, FINExecutorController, AdvObj,
  Generics.Collections;

type
  TfrmMetrologyCountersSelectEdit = class(TDialogForm)
    gbParameters: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtInvNumber: TEdit;
    edtSerialNumber: TEdit;
    edtName: TEdit;
    spbFINMol: TSpeedButton;
    edtFinMolName: TEdit;
    Label4: TLabel;
    edtFinMolCode: TEdit;
    dtpDateIn: TDateTimePicker;
    dtpDateBuild: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCost: TEdit;
    btnSearch: TButton;
    sgENMetrologyCounter: TAdvStringGrid;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    spbFINMolClear: TSpeedButton;
    btnCreatePlans: TButton;
    GroupBox1: TGroupBox;
    lblDateStart: TLabel;
    edtDateStart: TDateTimePicker;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    lblWorkState: TLabel;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    lblCommentGen: TLabel;
    edtCommentGen: TEdit;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    HTTPRIOENPlanWork: THTTPRIO;
    spbTypeClear: TSpeedButton;
    spbENPlanWorkStateClear: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    spbFINExecutorClear: TSpeedButton;
    sgSelectedCounters: TAdvStringGrid;
    BitBtn2: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn1: TBitBtn;
    btnSelect: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    lblEnPlan: TLabel;
    edtParentPlan: TEdit;
    spbParentPlan: TSpeedButton;
    spbParentPlanClear: TSpeedButton;
    HTTPRIOENPlanWorkType: THTTPRIO;
    HTTPRIOENPlanWorkState: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    Button1: TButton;
    btnCheckAll: TBitBtn;
    btnUnCheckAll: TBitBtn;
    procedure spbFINMolClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgENMetrologyCounterTopLeftChanged(Sender: TObject);
    procedure spbFINMolClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCreatePlansClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
    procedure spbENPlanWorkStateClearClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbFINExecutorClearClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure spbParentPlanClick(Sender: TObject);
    procedure spbParentPlanClearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCheckAllClick(Sender: TObject);
    procedure btnUnCheckAllClick(Sender: TObject);
  private
    { Private declarations }
    planTypeCode: Integer;
    planStateCode: Integer;
    departmentCode: Integer;
    parentPlanCode: Integer;
    elementInCode: Integer;
    finExecutorObj: FINExecutor;
    procedure SetSelectedCountersGridEditableColumn();
  public
    { Public declarations }
    isForWriteOff: Boolean;
    function CopyRow(SourceGrid: TAdvStringGrid; DestinationGrid: TAdvStringGrid; RowIndex: Integer;
      UniqueColumnIndex: Integer = -1): Boolean;
    procedure SetCheckBoxesState(Grid: TAdvStringGrid; ColIndex: Integer; State: Boolean{ = false});
  end;

var
  frmMetrologyCountersSelectEdit: TfrmMetrologyCountersSelectEdit;

implementation

uses FINMolController, ShowFINMol, ChildFormUnit, XSBuiltIns,
  ENMetrologyCounterController, GridHeadersUnit, ENElementController,
  ENConsts, EnergyproController, ShowENPlanWorkType,
  ENPlanWorkTypeController, ShowENPlanWorkState, ENPlanWorkStateController,
  ShowENDepartment, ENDepartmentController, ShowFINExecutorTree,
  ENPlanWorkController, DateUtils, ENPlanWorkKindController,
  ENPlanWorkStatusController, ShowENPlanWork, EditENMetrologyPlans,
  ENPlanWorkFormController, EditENMetrologyCountersPhasity
  , DMReportsUnit, ENSettingsConsts, BaseUtilsUnit, TKAccountingTypeController;

{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

  counterFilter: ENMetrologyCounterFilter;

  ENMetrologyCounterHeaders: array [1..13] of String =
        ( 'Код'
          ,'Інв. номер'
          ,'Найменування лічильника'
          ,'Заводський номер'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МОЛа'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Вартість'
          ,'код з ScanCounter'
          ,'Тип лічильника'
          ,'№ Акту поруш./Договору'
        );

procedure TfrmMetrologyCountersSelectEdit.spbFINMolClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

{   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;}
  //plan : ENPlanWork;


  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      //plan := DMReports.getPlanByCode(planCode);
{
   if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
     if ENWorkOrder2ENPlanWorkObj.workOrder.department.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;
}

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFinMolCode.Text := GetReturnValue(sgFINMol,0);
               edtFINMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := GetReturnValue(sgFINMol,0);
               //ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmMetrologyCountersSelectEdit.btnSearchClick(Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  i, j{, ColCount, LastCount}: Integer;
  //counterFilter: ENMetrologyCounterFilter;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
begin
  for i:=1 to sgENMetrologyCounter.RowCount-1 do
    for j:=0 to sgENMetrologyCounter.ColCount-1 do
      sgENMetrologyCounter.Cells[j,i] := '';
  sgENMetrologyCounter.RowCount := 2;
  sgENMetrologyCounter.RemoveCheckBox(1, 1);

  //SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);
  ColCount := 100;
  TempENMetrologyCounter :=  HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

  //////////////////////////////////////////////////////////////////////////////
  counterFilter := ENMetrologyCounterFilter.Create;
  SetNullIntProps(counterFilter);
  SetNullXSProps(counterFilter);

  if edtFinMolCode.Text <> '' then
    counterFilter.molCode := edtFinMolCode.Text;

  if dtpDateIn.Checked then
  begin
    counterFilter.dateIn := TXSDate.Create;
    counterFilter.dateIn.XSToNative(GetXSDate(dtpDateIn.DateTime));
  end;

  if dtpDateBuild.Checked then
  begin
    counterFilter.dateBuild := TXSDate.Create;
    counterFilter.dateBuild.XSToNative(GetXSDate(dtpDateBuild.DateTime));
  end;

  if edtCost.Text <> '' then
  begin
    counterFilter.cost := TXSDecimal.Create;
    counterFilter.cost.DecimalString := edtCost.Text; 
  end;

  if edtSerialNumber.Text <> '' then
    counterFilter.buildNumber := edtSerialNumber.Text;

  if edtInvNumber.Text <> '' then
    counterFilter.invNumber := edtInvNumber.Text;

  if edtName.Text <> '' then
    counterFilter.name := edtName.Text;

  // 22.02.2018 NET-4561 Для списания пломб при проведении экспертизы счетчиков
  if isForWriteOff then
    counterFilter.conditionSQL := 'a.kod_subsch_b in (''1127'', ''0732'')';
  //////////////////////////////////////////////////////////////////////////////


  ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(counterFilter, 0, ColCount, Low(Integer));

  LastCount:=High(ENMetrologyCounterList.list);

  if LastCount > -1 then
     sgENMetrologyCounter.RowCount:=LastCount+2
  else
     sgENMetrologyCounter.RowCount:=2;

   with sgENMetrologyCounter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyCounterList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMetrologyCounterList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMetrologyCounterList.list[i].invNumber;

        AddCheckBox(1, i+1, false, false);

        Cells[2,i+1] := ENMetrologyCounterList.list[i].name;
        Cells[3,i+1] := ENMetrologyCounterList.list[i].buildNumber;
        Cells[4,i+1] := ENMetrologyCounterList.list[i].account;
        Cells[5,i+1] := ENMetrologyCounterList.list[i].departmetFKCode;
        Cells[6,i+1] := ENMetrologyCounterList.list[i].molCode;
        if ENMetrologyCounterList.list[i].dateIn = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENMetrologyCounterList.list[i].dateIn);
        if ENMetrologyCounterList.list[i].dateBuild = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENMetrologyCounterList.list[i].dateBuild);
        if ENMetrologyCounterList.list[i].cost = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENMetrologyCounterList.list[i].cost.DecimalString;
        if ENMetrologyCounterList.list[i].scCode = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(ENMetrologyCounterList.list[i].scCode);
        Cells[11,i+1] := ENMetrologyCounterList.list[i].counterType;

        Objects[0,i+1] := ENMetrologyCounterList.list[i];

        LastRow:=i+1;
        sgENMetrologyCounter.RowCount := LastRow + 1;
      end;
   ColCount:=ColCount+1;
   sgENMetrologyCounter.Row:=1;
end;

procedure TfrmMetrologyCountersSelectEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);
  SetGridHeaders(ENMetrologyCounterHeaders, sgSelectedCounters.ColumnHeaders);
  SetFloatStyle(edtCost);

  DisableControls([edtFinMolName, edtTypeName, edtWorkState, edtDepartment, edtFINExecutorName, edtParentPlan]);
  //DisableControls([spbENPlanWorkState]);
  DenyBlankValues([edtTypeName, edtWorkState, edtDepartment, edtFINExecutorName, edtParentPlan]);

  sgENMetrologyCounter.Options := sgENMetrologyCounter.Options - [goColMoving];
  sgSelectedCounters.Options := sgSelectedCounters.Options - [goColMoving];

  if not isForWriteOff then
  begin
    sgENMetrologyCounter.ColCount := 12;
    sgSelectedCounters.ColCount := 12;
  end
  else begin
    sgSelectedCounters.Options := sgSelectedCounters.Options + [goEditing];
    sgSelectedCounters.Options := sgSelectedCounters.Options - [goRowSelect];
  end;
end;

procedure TfrmMetrologyCountersSelectEdit.sgENMetrologyCounterTopLeftChanged(
  Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  i,CurrentRow: Integer;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENMetrologyCounter.TopRow + sgENMetrologyCounter.VisibleRowCount) = ColCount
  then
    begin
      TempENMetrologyCounter :=  HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
      CurrentRow:=sgENMetrologyCounter.RowCount;

  {if FilterObject = nil then
  begin
     FilterObject := ENMetrologyCounterFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end; }

  //ENMetrologyCounterList := TempENMetrologyCounter.getScrollableFilteredList(ENMetrologyCounterFilter(FilterObject),ColCount-1, 100);
  ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(counterFilter,ColCount-1, 100);

  sgENMetrologyCounter.RowCount:=sgENMetrologyCounter.RowCount+100;
  LastCount:=High(ENMetrologyCounterList.list);
  with sgENMetrologyCounter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyCounterList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMetrologyCounterList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMetrologyCounterList.list[i].invNumber;

        AddCheckBox(1, i+CurrentRow, false, false);

        Cells[2,i+CurrentRow] := ENMetrologyCounterList.list[i].name;
        Cells[3,i+CurrentRow] := ENMetrologyCounterList.list[i].buildNumber;
        Cells[4,i+CurrentRow] := ENMetrologyCounterList.list[i].account;
        Cells[5,i+CurrentRow] := ENMetrologyCounterList.list[i].departmetFKCode;
        Cells[6,i+CurrentRow] := ENMetrologyCounterList.list[i].molCode;
        if ENMetrologyCounterList.list[i].dateIn = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDate2String(ENMetrologyCounterList.list[i].dateIn);
        if ENMetrologyCounterList.list[i].dateBuild = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENMetrologyCounterList.list[i].dateBuild);
        if ENMetrologyCounterList.list[i].cost = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENMetrologyCounterList.list[i].cost.DecimalString;
        if ENMetrologyCounterList.list[i].scCode = Low(Integer) then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := IntToStr(ENMetrologyCounterList.list[i].scCode);
        Cells[11,i+CurrentRow] := ENMetrologyCounterList.list[i].counterType;

        Objects[0,i+CurrentRow] := ENMetrologyCounterList.list[i];

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMetrologyCounter.Row:=CurrentRow-5;
   sgENMetrologyCounter.RowCount:=LastRow+1;
  end;
end;

procedure TfrmMetrologyCountersSelectEdit.spbFINMolClearClick(
  Sender: TObject);
begin
  ClearControls([edtFinMolCode, edtFinMolName]);
end;

procedure TfrmMetrologyCountersSelectEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
  inherited;
end;

procedure TfrmMetrologyCountersSelectEdit.btnCreatePlansClick(Sender: TObject);
var i, counterCode, newPlanCode, indexAccountForActDefect : Integer;
    state, found, generated: Boolean;
    invNumber, departmentFKCode, planCodes,
    wrongInvNumbers, molCode, account, accountsForParametrization,
    comment: String;

    counterFilter: ENMetrologyCounterFilter;
    TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
    ENMetrologyCounterList: ENMetrologyCounterShortList;
    ENMetrologyCounterObj: ENMetrologyCounter;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkObj, planObj : ENPlanWork;
    dict : TDictionary<String, Integer>;
    dictCountersNames : TDictionary<String, String>;
    dictCountersZones : TDictionary<String, Integer>;
    formPhasity : TfrmENMetrologyCountersPhasityEdit;
    accountsForVerification : TList<String>;
	accountsForExpertise : TList<String>;
	  accountsForActDefect : TStringList;
    counterAccountingTypeRefCode : Integer;
begin
  //ShowMessage('UNDER CONSTRUCTION!');
  //Exit;
  
  //SUPP-75627
  accountsForActDefect := TStringList.Create;
  accountsForActDefect.CommaText := DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNTS_FOR_COUNTERS_ACT_DEFECT);
  accountsForActDefect.Sort;
  accountsForVerification := TList<String>.Create();
  accountsForExpertise := TList<String>.Create;
  // 03.07.2019 SUPP-83740 добавляется возможность выберать счетчики со счета 1127 для поверке
  accountsForVerification.AddRange(['1126', '1127'
  , DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_CUSTOMER_COUNTER_VERIFICATION)
  // 05.07.2018 Также разрешаем делать поверку на счетчики, которые были приняты на экспертизу
  //(счет 0732) после общения со Столяровым А.Н. приказ № 404
  , DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_CUSTOMER_COUNTER_EXPERTISE)]);
  
  accountsForExpertise.AddRange(['1126', '1127'
  , DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_CUSTOMER_COUNTER_VERIFICATION)
  // 05.07.2018 Также разрешаем делать поверку на счетчики, которые были приняты на экспертизу
  //(счет 0732) после общения со Столяровым А.Н. приказ № 404
  , DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNT_FOR_CUSTOMER_COUNTER_EXPERTISE)]);

  if (parentPlanCode < 0) or (elementInCode < 0) then
  begin
    Application.MessageBox(PChar('Необхідно вказати місячний план, на основі якого формуються завдання-плани!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtParentPlan.SetFocus;
    Exit;
  end;

  state := false;
  generated := false;
  planCodes := '';
  wrongInvNumbers := '';

  
  TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  

  ///// 23.06.10 Перенес сюда из цикла
  if not edtDateStart.Checked then
  begin
    Application.MessageBox(PChar('Введіть дату виконання робіт!'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if not NoBlankValues([edtTypeName, edtWorkState, edtDepartment, edtFINExecutorName]) then
  begin
    Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
    Exit;
  end;

  planObj := TempENPlanWork.getObject(parentPlanCode);
  if planObj <> nil then
    if planObj.dateStart <> nil then
    begin
      if (YearOf(edtDateStart.DateTime) <> planObj.dateStart.Year) or
         (MonthOf(edtDateStart.DateTime) <> planObj.dateStart.Month) then
      begin
        edtDateStart.DateTime := EncodeDate(planObj.dateStart.Year, planObj.dateStart.Month, planObj.dateStart.Day);
        edtDateStart.Checked := false;
        Application.MessageBox(PChar('Дата виконання робіт повинна попадати в період обраного Вами поточного плану!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;
  /////

  if planStateCode in [ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION, ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE] then begin
    formPhasity := TfrmENMetrologyCountersPhasityEdit.Create(Application, dsInsert);
    dict := TDictionary<String, Integer>.Create;
    dictCountersNames := TDictionary<String, String>.Create;
    dictCountersZones := TDictionary<String, Integer>.Create;
    for i := 1 to sgSelectedCounters.RowCount - 1 do begin
      sgSelectedCounters.GetCheckBoxState(1, i, state);
      if state then begin
        invNumber := sgSelectedCounters.Cells[1, i];
        if invNumber <> '' then begin
          dict.Add(invNumber, Low(Integer));
          dictCountersNames.Add(invNumber, sgSelectedCounters.Cells[2, i]);
          dictCountersZones.Add(invNumber, Low(Integer));
        end;
      end;
    end;
    if(dict.Count > 0) then begin
      formPhasity.counters := dict;
      formPhasity.countersNames := dictCountersNames;
      formPhasity.countersZones := dictCountersZones;
      if formPhasity.ShowModal = mrOk then begin
        dict := formPhasity.counters;
        dictCountersZones := formPhasity.countersZones;
        formPhasity.countersNames.Free;
        formPhasity.countersNames := nil;
        formPhasity.Free;
        formPhasity := nil;
      end;

      for invNumber in dict.Keys do begin
      if (dict[invNumber] = Low(Integer)) then begin
        Application.MessageBox(PChar('Необрана фазність для інвентарного номеру ' + invNumber), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
      if (dictCountersZones[invNumber]  = Low(Integer)) then begin
        Application.MessageBox(PChar('Необрана зонність для інвентарного номеру ' + invNumber), PChar('Увага!'), MB_ICONWARNING);
      end;
    end;
  end;
end;

  if isForWriteOff then
  begin
    for i := 1 to sgSelectedCounters.RowCount - 1 do
    begin
      sgSelectedCounters.GetCheckBoxState(1, i, state);

      if state then
      begin
        comment := Trim(sgSelectedCounters.Cells[12, i]);
        if not IsComment(comment) then
        begin
          Application.MessageBox(PChar('Введіть № Акта порушення або № Договору для всіх обраних лічильників!'), PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;
      end;
    end;
  end;

  state := false;

  for i := 1 to sgSelectedCounters.RowCount - 1 do
  begin
    sgSelectedCounters.GetCheckBoxState(1, i, state);

    if state then
    begin
      invNumber := sgSelectedCounters.Cells[1, i];
      if invNumber = '' then
      begin
        Application.MessageBox(PChar('Обирати пусті інв. номери неприпустимо!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;

      account := sgSelectedCounters.Cells[4, i];
      departmentFKCode := sgSelectedCounters.Cells[5, i];
      molCode := sgSelectedCounters.Cells[6, i];
      comment := Trim(sgSelectedCounters.Cells[12, i]);
      counterAccountingTypeRefCode := ENMetrologyCounterShort(sgSelectedCounters.Objects[0, i]).accountingTypeRefCode;

      ///// 09.06.10 ///////////////////////////////////////////////////////////
      // Теперь будем проверять нахождение счетчика не просто в Метрологии,
      // а на подотчете мастера (в данный момент это мастер ЦРПУ Перевезенцева Н.А. (код МОЛа 2729)).
      // А вообще, в будущем нужно будет сделать таблицу и хранить в ней коды МОЛов, на которых можно
      // перемещать счетчики

      // пока что оставляем (на Перевезенцевой еще ничего нет)
      if not TDMReports.isMetrologyDepartment(departmentFKCode) then
      begin
        Application.MessageBox(PChar('Лічильник "' + invNumber + '" знаходиться НЕ в Метрології!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;

      {
      if molCode <> '2729' then
      begin
        Application.MessageBox(PChar('Лічильник "' + invNumber + '" знаходиться НЕ на підзвіті майстра!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
      }
      //////////////////////////////////////////////////////////////////////////

      ///// 23.06.10 NET-199 ///////////////////////////////////////////////////
      // При формировании планов необходимо выполнять проверку: если указан тип работы "Доработка",
      // давать формировать планы только для счетчиков, находящихся на счете 2096,
      // для всех остальных типов работ - только для счетчиков на счете 1126.
      // *** 25.05.11 Перебросили все счетчики со счета 1126 на 1532 !!!
      if planStateCode = ENPLANWORKSTATE_REFINEMENT then
      begin
        if account <> '2096' then
        begin
          Application.MessageBox(PChar('Для типа робіт "Доробка" можливо обирати тільки лічильники на рахунку 2096!' + #13#10 +
                                       'Лічильник "' + invNumber + '" знаходиться на рахунку ' + account + '!'),
                                 PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;
      end
      else begin

        if not isForWriteOff then
        begin

          // *** 25.05.11 Перебросили все счетчики со счета 1126 на 1532 !!!
          if (account <> '1126') and (not (planStateCode in [ENPLANWORKSTATE_COUNTERS_STATE_VERIFICATION
          , ENPLANWORKSTATE_TECHNICALSERVICE, ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION
		  , ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE, ENPLANWORKSTATE_COUNTERS_ACT_DEFECT
		  , ENPLANWORKSTATE_COUNTERS_EXPERTISE])) then
          //AS 2011.07.22 опять уехало на 1126 if (account <> '1532') and (planStateCode <> ENPLANWORKSTATE_TECHNICALSERVICE) then
          // ***
          begin
            Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + '" можливо обирати тільки лічильники на рахунку 1126!' + #13#10 +
            //AS Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + '" можливо обирати тільки лічильники на рахунку 1532!' + #13#10 +
                                         'Лічильник "' + invNumber + '" знаходиться на рахунку ' + account + '!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
		  
		  if ((planStateCode = ENPLANWORKSTATE_COUNTERS_ACT_DEFECT)
		  and (not accountsForActDefect.Find(account, indexAccountForActDefect))) then begin
		              Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + Format ('" можливо обирати тільки лічильники на рахунках %s!', [BaseUtils.stringList2String(accountsForActDefect, ',')]) + #13#10 +
                                         'Лічильник "' + invNumber + '" знаходиться на рахунку ' + account + '!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
		  end;

          if ((planStateCode in [ENPLANWORKSTATE_COUNTERS_STATE_VERIFICATION])
          and (not (accountsForVerification.Contains(account)))
          and (counterAccountingTypeRefCode <> TK_ACCOUNTINGTYPE_OS)) then begin
            Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + Format ('" можливо обирати тільки лічильники на рахунках %s!', [BaseUtils.stringList2String(accountsForVerification, ',')]) + #13#10 +
                                         'Лічильник "' + invNumber + '" знаходиться на рахунку ' + account + '!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
		  
		  if ((planStateCode in [ENPLANWORKSTATE_COUNTERS_EXPERTISE])
          and (not (accountsForExpertise.Contains(account)))
          and (counterAccountingTypeRefCode <> TK_ACCOUNTINGTYPE_OS)) then begin
            Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + Format ('" можливо обирати тільки лічильники на рахунках %s!', [BaseUtils.stringList2String(accountsForExpertise, ',')]) + #13#10 +
                                         'Лічильник "' + invNumber + '" знаходиться на рахунку ' + account + '!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
		  
        end
        else begin
          if (account <> '1127') and (account <> '0732') then
          begin
            Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + '" можливо обирати тільки лічильники на рахунках 1127 або 0732!' + #13#10 +
            //AS Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + '" можливо обирати тільки лічильники на рахунку 1532!' + #13#10 +
                                         'Лічильник "' + invNumber + '" знаходиться на рахунку ' + account + '!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
        end;

        if (not TempENMetrologyCounter.isAccountForParametrization(account).asBoolean)  and (planStateCode in [ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION, ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE]) then begin
           
		    accountsForParametrization := TempENMetrologyCounter.getStringAccountsForParametrization();
		    Application.MessageBox(PChar('Для типа робіт "' + edtWorkState.Text + '" можливо обирати тільки лічильники на рахунку ' + accountsForParametrization + '!' + #13#10 +
                                     'Лічильник "' + invNumber + '" знаходиться на рахунку ' + account + '!'),
                               PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;

      end;
      //////////////////////////////////////////////////////////////////////////

      //ShowMessage(invNumber);

      ///// Проверяем, есть ли уже этот счетчик в наших объектах
      counterFilter := ENMetrologyCounterFilter.Create;
      SetNullIntProps(counterFilter);
      SetNullXSProps(counterFilter);

      counterFilter.invNumber := invNumber;

      ///
      if elementInCode = ENELEMENT_METROLOGY_OBJECT_WRITEOFF then
        counterFilter.conditionSQL :=
          ' ENMETROLOGYCOUNTER.CODE in ' +
          ' ( ' +
          '   select mc.code ' +
          '   from enmetrologycounter mc, enelement e ' +
          '   where mc.elementcode = e.code ' +
          '     and e.elementinrefcode = ' + IntToStr(ENELEMENT_METROLOGY_OBJECT_WRITEOFF) +
          ' ) '
      else
        counterFilter.conditionSQL :=
          ' ENMETROLOGYCOUNTER.CODE not in ' +
          ' ( ' +
          '   select mc.code ' +
          '   from enmetrologycounter mc, enelement e ' +
          '   where mc.elementcode = e.code ' +
          '     and e.elementinrefcode = ' + IntToStr(ENELEMENT_METROLOGY_OBJECT_WRITEOFF) +
          ' ) ';
      ///

      found := false;

      ENMetrologyCounterList := TempENMetrologyCounter.getScrollableFilteredList(counterFilter, 0, -1);

      if ENMetrologyCounterList <> nil then
        if ENMetrologyCounterList.list <> nil then
          if High(ENMetrologyCounterList.list) > -1 then
          begin
            found := true;
            // Счетчик уже есть, добавлять новый объект НЕ НАДО !!!

            counterCode := ENMetrologyCounterList.list[0].code;

            // Проверим, есть ли у счетчика ТИП (elementIn - ссылка на абстрактный объект)
            // Если нет, добавим и сохраним
            ENMetrologyCounterObj := TempENMetrologyCounter.getObject(counterCode);

            if sgSelectedCounters.Cells[10, i] <> '' then
            begin
              try
                ENMetrologyCounterObj.scCode := StrToInt(sgSelectedCounters.Cells[10, i]);
              except
                on EConvertError do
                  ENMetrologyCounterObj.scCode := LOW_INT;
              end;
            end;

            if planStateCode in [ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION, ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE]  then begin
                ENMetrologyCounterObj.phasity := dict[invNumber];
                ENMetrologyCounterObj.zones := dictCountersZones[invNumber];
            end;
            
            if ENMetrologyCounterObj.element <> nil then
              if ENMetrologyCounterObj.element.elementInRef <> nil then
              begin
                if ENMetrologyCounterObj.element.elementInRef.code = LOW_INT then
                begin
                  ENMetrologyCounterObj.element.elementInRef.code := elementInCode;
                  //TempENMetrologyCounter.save(ENMetrologyCounterObj);
                end;
              end
              else begin
                ENMetrologyCounterObj.element.elementInRef := ENElementRef.Create;
                ENMetrologyCounterObj.element.elementInRef.code := elementInCode;
                //TempENMetrologyCounter.save(ENMetrologyCounterObj);
              end;

            TempENMetrologyCounter.save(ENMetrologyCounterObj);
          end;

      if not found then
      begin
        // Счетчика в объектах нет, нужно создать новый объект под него

        ENMetrologyCounterObj := ENMetrologyCounter.Create;
        SetNullIntProps(ENMetrologyCounterObj);
        SetNullXSProps(ENMetrologyCounterObj);

        ENMetrologyCounterObj.element := ENElement.Create;
        ENMetrologyCounterObj.element.renRef := EPRenRef.Create;
        ENMetrologyCounterObj.element.renRef.code := 0;   
        ENMetrologyCounterObj.element.elementInRef := ENElementRef.Create;
        //ENMetrologyCounterObj.element.elementInRef.code := LOW_INT;
        ENMetrologyCounterObj.element.elementInRef.code := elementInCode;
        ENMetrologyCounterObj.element.elementOutRef := ENElementRef.Create;
        ENMetrologyCounterObj.element.elementOutRef.code := LOW_INT;

        ENMetrologyCounterObj.accountingTypeRef := TKAccountingTypeRef.Create;
        ENMetrologyCounterObj.accountingTypeRef.code := ENMetrologyCounterShort(sgSelectedCounters.Objects[0, i]).accountingTypeRefCode;

        if planStateCode in [ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION, ENPLANWORKSTATE_COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE]  then begin
          ENMetrologyCounterObj.phasity := dict[invNumber];
          ENMetrologyCounterObj.zones := dictCountersZones[invNumber];
        end;

{
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer;
    FcounterType : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
}
        ENMetrologyCounterObj.invNumber := invNumber;
        ENMetrologyCounterObj.name := sgSelectedCounters.Cells[2, i];
        ///// Допишем коммент в названии, чтобы отличать от объекта на ремонт
        if elementInCode = ENELEMENT_METROLOGY_OBJECT_WRITEOFF then
          ENMetrologyCounterObj.name := ENMetrologyCounterObj.name + ' (списання пломб)';
        /////
        ENMetrologyCounterObj.buildNumber := sgSelectedCounters.Cells[3, i];
        ENMetrologyCounterObj.account := sgSelectedCounters.Cells[4, i];
        ENMetrologyCounterObj.departmetFKCode := sgSelectedCounters.Cells[5, i];
        ENMetrologyCounterObj.molCode := sgSelectedCounters.Cells[6, i];

        if sgSelectedCounters.Cells[7, i] <> '' then
        begin
          ENMetrologyCounterObj.dateIn := TXSDate.Create;
          try
            ENMetrologyCounterObj.dateIn.XSToNative(GetXSDate(StrToDate(sgSelectedCounters.Cells[7, i])));
          except
            on EConvertError do
              ENMetrologyCounterObj.dateIn := nil;
          end;
        end;

        if sgSelectedCounters.Cells[8, i] <> '' then
        begin
          ENMetrologyCounterObj.dateBuild := TXSDate.Create;
          try
            ENMetrologyCounterObj.dateBuild.XSToNative(GetXSDate(StrToDate(sgSelectedCounters.Cells[8, i])));
          except
            on EConvertError do
              ENMetrologyCounterObj.dateBuild := nil;
          end;
        end;

        if sgSelectedCounters.Cells[9, i] <> '' then
        begin
          ENMetrologyCounterObj.cost := TXSDecimal.Create;
          try
            ENMetrologyCounterObj.cost.DecimalString := sgSelectedCounters.Cells[9, i];
          except
            on EConvertError do
              ENMetrologyCounterObj.cost := nil;
          end;
        end;

        if sgSelectedCounters.Cells[10, i] <> '' then
        begin
          try
            ENMetrologyCounterObj.scCode := StrToInt(sgSelectedCounters.Cells[10, i]);
          except
            on EConvertError do
              ENMetrologyCounterObj.scCode := LOW_INT;
          end;
        end;

        ENMetrologyCounterObj.counterType := sgSelectedCounters.Cells[11, i];
{
        Cells[2,i+1] := ENMetrologyCounterList.list[i].name;
        Cells[3,i+1] := ENMetrologyCounterList.list[i].buildNumber;
        Cells[4,i+1] := ENMetrologyCounterList.list[i].account;
        Cells[5,i+1] := ENMetrologyCounterList.list[i].departmetFKCode;
        Cells[6,i+1] := ENMetrologyCounterList.list[i].molCode;
        if ENMetrologyCounterList.list[i].dateIn = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENMetrologyCounterList.list[i].dateIn);
        if ENMetrologyCounterList.list[i].dateBuild = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENMetrologyCounterList.list[i].dateBuild);
        if ENMetrologyCounterList.list[i].cost = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENMetrologyCounterList.list[i].cost.DecimalString;
        if ENMetrologyCounterList.list[i].scCode = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(ENMetrologyCounterList.list[i].scCode);
        Cells[11,i+1] := ENMetrologyCounterList.list[i].counterType;
}
        counterCode := TempENMetrologyCounter.add(ENMetrologyCounterObj);
      end; // if not found

      //ShowMessage(IntToStr(counterCode));

      ENMetrologyCounterObj := TempENMetrologyCounter.getObject(counterCode);
      
      if ENMetrologyCounterObj = nil then
      begin
        Application.MessageBox(PChar('Помилка в додаванні лічильника! (<obj>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      if ENMetrologyCounterObj.code = LOW_INT then
      begin
        Application.MessageBox(PChar('Помилка в додаванні лічильника! (<obj.code>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      if ENMetrologyCounterObj.element = nil then
      begin
        Application.MessageBox(PChar('Помилка в додаванні лічильника! (<element>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      if ENMetrologyCounterObj.element.code = LOW_INT then
      begin
        Application.MessageBox(PChar('Помилка в додаванні лічильника! (<element.code>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      // ***
      if ENMetrologyCounterObj.element.elementInRef = nil then
      begin
        Application.MessageBox(PChar('Помилка в додаванні лічильника! (<elementInRef>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      // В этом месте у счетчика уже по-любому должен быть тип (т.е. elementInRef с непустым кодом).
      // Если нет, значит, это явный глюк
      if ENMetrologyCounterObj.element.elementInRef.code = LOW_INT then
      begin
        Application.MessageBox(PChar('Помилка в додаванні лічильника! (<elementInRef.code>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;
      // ***

      // Проверяем, а совпадает ли тип счетчика (если он у него уже был задан раньше)
      // с нашим абстрактным типом из выбранного текущего плана.
      // Если нет, то добавляем его инв. номер в список ошибочных, НЕ создаем
      // план на этот счетчик, а в конце выведем список таких ошибочно выбранных счетчиков
      if ENMetrologyCounterObj.element.elementInRef.code <> elementInCode then
      begin
        AddListPos(wrongInvNumbers, ENMetrologyCounterObj.invNumber);
        continue; // переходим к следующему счетчику
      end;
      
      //////////////////////////////////////////////////////////////////////////
      // Генерим Задание-План для каждого выбранного счетчика

      { Нафига это надо было впихивать в цикл ???
      if not edtDateStart.Checked then
      begin
        Application.MessageBox(PChar('Введіть дату виконання робіт!'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
        Exit;
      end;

      if not NoBlankValues([edtTypeName, edtWorkState, edtDepartment, edtFINExecutorName]) then 
      begin
        Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
        Exit;
      end;

      planObj := TempENPlanWork.getObject(parentPlanCode);
      if planObj <> nil then
        if planObj.dateStart <> nil then
        begin
          if (YearOf(edtDateStart.DateTime) <> planObj.dateStart.Year) or
             (MonthOf(edtDateStart.DateTime) <> planObj.dateStart.Month) then
          begin
            edtDateStart.DateTime := EncodeDate(planObj.dateStart.Year, planObj.dateStart.Month, planObj.dateStart.Day);
            edtDateStart.Checked := false;
            Application.MessageBox(PChar('Дата виконання робіт повинна попадати в період обраного Вами поточного плану!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
        end;
      }

      ENPlanWorkObj := ENPlanWork.Create;
      SetNullIntProps(ENPlanWorkObj);
      SetNullXSProps(ENPlanWorkObj);

      if edtdateStart.checked then
      begin
        if ENPlanWorkObj.dateStart = nil then
          ENPlanWorkObj.dateStart := TXSDate.Create;
        ENPlanWorkObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
      end
      else
        ENPlanWorkObj.dateStart := nil;

      if ENPlanWorkObj.dateFinal = nil then
        ENPlanWorkObj.dateFinal := TXSDate.Create;
      ENPlanWorkObj.dateFinal.XSToNative(GetXSDate(EncodeDate(ENPlanWorkObj.dateStart.Year,
                                                              ENPlanWorkObj.dateStart.Month,
                                                              ENPlanWorkObj.dateStart.Day)));
       {if edtdateFinal.checked then
       begin
         if ENPlanWorkObj.dateFinal = nil then
            ENPlanWorkObj.dateFinal := TXSDate.Create;
         ENPlanWorkObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
       end
       else
         ENPlanWorkObj.dateFinal := nil;}

      if ENPlanWorkObj.kind = nil then ENPlanWorkObj.kind := ENPlanWorkKind.Create;
      ENPlanWorkObj.kind.code := ENPLANWORKKIND_NPZ;

       {
       //if ( edtYearGen.Text <> '' ) then
       //  ENPlanWorkObj.yearGen := StrToInt(edtYearGen.Text)
       if (edtYearGen.ItemIndex >= 0) then
         ENPlanWorkObj.yearGen := edtYearGen.ItemIndex + 2009
       else
         ENPlanWorkObj.yearGen := Low(Integer) ;
       }
       ENPlanWorkObj.yearGen := YearOf(edtDateStart.Date);

       {
       //if ( edtMonthGen.Text <> '' ) then
         //ENPlanWorkObj.monthGen := StrToInt(edtMonthGen.Text)
       if (edtMonthGen.ItemIndex >= 0) then
         ENPlanWorkObj.monthGen := edtMonthGen.ItemIndex + 1
       else
         ENPlanWorkObj.monthGen := Low(Integer) ;
       }
       ENPlanWorkObj.monthGen := MonthOf(edtDateStart.Date);

       ENPlanWorkObj.commentGen := edtCommentGen.Text;

       {
       ENPlanWorkObj.distanceTo := TXSDecimal.Create;
       if edtDistanceTo.Text <> '' then
         ENPlanWorkObj.distanceTo.decimalString := edtDistanceTo.Text
       else
         ENPlanWorkObj.distanceTo := nil;

       ENPlanWorkObj.distanceAlong := TXSDecimal.Create;
       if edtDistanceAlong.Text <> '' then
         ENPlanWorkObj.distanceAlong.decimalString := edtDistanceAlong.Text
       else
         ENPlanWorkObj.distanceAlong := nil;
       }

      if ENPlanWorkObj.elementRef = nil then ENPlanWorkObj.elementRef := ENElementRef.Create();
      ENPlanWorkObj.elementRef.code := ENMetrologyCounterObj.element.code;

      if ENPlanWorkObj.renRef = nil then ENPlanWorkObj.renRef := EPRenRef.Create;
      ENPlanWorkObj.renRef.code := ENMetrologyCounterObj.element.renRef.code;

      if ENPlanWorkObj.typeRef = nil then ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create();
      ENPlanWorkObj.typeRef.code := planTypeCode;

      if ENPlanWorkObj.stateRef = nil then ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create();
      ENPlanWorkObj.stateRef.code := planStateCode;

      if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
      ENPlanWorkObj.departmentRef.code := departmentCode;

      if finExecutorObj <> nil then
      begin
        if ENPlanWorkObj.finExecutor = nil then ENPlanWorkObj.finExecutor := FINExecutor.Create();
        SetNullIntProps(ENPlanWorkObj.finExecutor);
        ENPlanWorkObj.finExecutor.name := finExecutorObj.name;
        ENPlanWorkObj.finExecutor.finCode := finExecutorObj.finCode;
        ENPlanWorkObj.finExecutor.finTypeName := finExecutorObj.finTypeName;
        ENPlanWorkObj.finExecutor.finTypeCode := finExecutorObj.finTypeCode;
        ENPlanWorkObj.finExecutor.finKindName := finExecutorObj.finKindName;
        ENPlanWorkObj.finExecutor.finKindCode := finExecutorObj.finKindCode;
        ENPlanWorkObj.finExecutor.finCehName  := finExecutorObj.finCehName;
        ENPlanWorkObj.finExecutor.finCehCode  := finExecutorObj.finCehCode;

        ENPlanWorkObj.finExecutor.axOrgId := finExecutorObj.axOrgId;
        ENPlanWorkObj.finExecutor.axParentOrgId := finExecutorObj.axParentOrgId;
        ENPlanWorkObj.finExecutor.axParentOrgName := finExecutorObj.axParentOrgName;
        ENPlanWorkObj.finExecutor.axOrgTypeId := finExecutorObj.axOrgTypeId;
        ENPlanWorkObj.finExecutor.axOrgTypeName := finExecutorObj.axOrgTypeName;
      end;

      if ENPlanWorkObj.status = nil then ENPlanWorkObj.status := ENPlanWorkStatus.Create();
      ENPlanWorkObj.status.code := ENPLANWORKSTATUS_GOOD;

      {SUPP-48578 Проверки на бюдежтодержателя и ЦФО}
      if not ((planObj.budgetRef.code = ENBUDGET_ENERGOSBYT)
        or ( planObj.budgetRef.code = ENBUDGET_METROLOGY)) then begin
        Application.MessageBox(PChar('Неправильний бюджетотримач'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;
      if not ((planObj.responsibilityRef.code = ENRESPONSIBILITY_METROLOGY) or ( planObj.responsibilityRef.code = ENRESPONSIBILITY_ENERGOSBYT)) then begin
        Application.MessageBox(PChar('Неправильний ЦФО'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;


      if ENPlanWorkObj.budgetRef = nil then ENPlanWorkObj.budgetRef := ENDepartmentRef.Create();
      ENPlanWorkObj.budgetRef.code := planObj.budgetRef.code; {SUPP-48564 Теперь будет браться непосредственно с выбранного плана}

      if ENPlanWorkObj.responsibilityRef = nil then ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create();
      ENPlanWorkObj.responsibilityRef.code := planObj.responsibilityRef.code; {SUPP-48564 Теперь будет браться непосредственно с выбранного плана}

      newPlanCode := LOW_INT;
            
      //AddListPos(planCodes, IntToStr(TempENPlanWork.addByMetrology(ENPlanWorkObj)));
      //newPlanCode := TempENPlanWork.addByMetrology(ENPlanWorkObj);

      // План/НЕ план from parent ...
      //if (planObj <> nil)
      ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create();
      ENPlanWorkObj.formRef.code := planObj.formRef.code;

      // 26.02.2018 NET-4561 Номер Акта нарушения или Договора на услугу при экспертизе счетчиков
      if isForWriteOff then
        ENPlanWorkObj.commentGen := comment;

      newPlanCode := TempENPlanWork.addByParent(ENPlanWorkObj, parentPlanCode);

      // Добавляем код нового сгенеренного плана в список планов 
      if newPlanCode > LOW_INT then
        AddListPos(planCodes, IntToStr(newPlanCode));

      generated := true;
      //////////////////////////////////////////////////////////////////////////

    end; // if state

  end; // for  

if generated then
  begin
    Application.MessageBox(PChar('Формування планів завершено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    btnDeleteClick(Sender); // убираем из списка счетчики, на которые уже сформировали планы
    SetCheckBoxesState(sgENMetrologyCounter, 1, false); // сбрасываем все чекбоксы в гриде со списком найденных по фильтру счетчиков

    if wrongInvNumbers <> '' then
      Application.MessageBox(PChar('Лічильники з вказаними нижче інвентарними номерами мають тип, що відрізняється від "' +
                                   edtParentPlan.Text + '":' + #13#10 + wrongInvNumbers + #13#10#13#10 +
                                   'Плани на ці лічильники НЕ були сформовані, для них потрібно вибрати інший місячний план ' +
                                   '(на відповідний тип)!'),
                             PChar('Увага!'), MB_ICONWARNING);

    if planCodes = '' then Exit;
    //ShowMessage(planCodes);

    /// 20.05.10 ///////////////////////////////////////////////////////////////
    // Если были сформированы какие-то планы, открываем форму для работы с этими планами
    frmENMetrologyPlansEdit := TfrmENMetrologyPlansEdit.Create(Application, dsInsert);
    try
      frmENMetrologyPlansEdit.planCodes := planCodes;
      frmENMetrologyPlansEdit.parentPlanCode := parentPlanCode;
      frmENMetrologyPlansEdit.isForWriteOff := isForWriteOff;
      if frmENMetrologyPlansEdit.ShowModal = mrOk then
      begin
      end;
    finally
      frmENMetrologyPlansEdit.Free;
    end;
    ////////////////////////////////////////////////////////////////////////////

  end
  else begin
    if wrongInvNumbers <> '' then
      Application.MessageBox(PChar('Лічильники з вказаними нижче інвентарними номерами мають тип, що відрізняється від "' +
                                   edtParentPlan.Text + '":' + #13#10 + wrongInvNumbers + #13#10#13#10 +
                                   'Плани на ці лічильники НЕ були сформовані, для них потрібно вибрати інший місячний план ' +
                                   '(на відповідний тип)!'),
                             PChar('Увага!'), MB_ICONWARNING)
    else
      Application.MessageBox(PChar('Для формування планів необхідно вибрати лічильники!'), PChar('Увага!'), MB_ICONWARNING);
  end;

end;

procedure TfrmMetrologyCountersSelectEdit.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f : ENPlanWorkTypeFilter;
begin
   f:= ENPlanWorkTypeFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.orderBySQL := 'ordered';
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal,f);
   try
      with frmENPlanWorkTypeShow do begin
        DisableActions([ actEdit, actInsert , actDelete]);
        if ShowModal = mrOk then
        begin
            try
               planTypeCode := StrToInt(GetReturnValue(sgENPlanWorkType,0));
               edtTypeName.Text := GetReturnValue(sgENPlanWorkType,1);

               //edtWorkState.Text := '';
               //planStateCode := LOW_INT;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;
end;

procedure TfrmMetrologyCountersSelectEdit.FormCreate(Sender: TObject);
begin
  planTypeCode := LOW_INT;
  planStateCode := LOW_INT;
  departmentCode := LOW_INT;
  parentPlanCode := LOW_INT;
  elementInCode := LOW_INT;
  finExecutorObj := nil;

  isForWriteOff := false;
end;

procedure TfrmMetrologyCountersSelectEdit.spbENPlanWorkStateClick(
  Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
   f : ENPlanWorkStateFilter;
   e : ENElement;
begin
   if planTypeCode < 0 then
   begin
     Application.MessageBox(PChar('Спочатку оберіть вид робіт!'), PChar('Увага!'), MB_ICONWARNING);
     Exit;
   end;

   f:= ENPlanWorkStateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.orderBySQL := 'ordered';
   f.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode from enplantype2planstate where enplantype2planstate.typerefcode = '+ IntToStr(planTypeCode) +')';

   {
   // AS .. нфиг логику без ЭЛЕМЕНТА !!!
   if ENPlanWorkObj.elementRef <> nil then
     if  ENPlanWorkObj.elementRef.code <> LOW_INT then
     begin
       e := DMReports.getElementByCode(ENPlanWorkObj.elementRef.code);
       if (e.typeRef.code <> EN_SUBSTATION150) and (e.typeRef.code <> EN_BUILDER) then
          f.conditionSQL := f.conditionSQL + ' and enplanworkstate.code <> ' + IntToStr(ENPLANWORKSTATE_CURRENTREPAIR);
   end;
   }

   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal,f);
   try
      with frmENPlanWorkStateShow do begin
        DisableActions([ actEdit, actInsert, actDelete, actNoFilter, actFilter ]);
        if ShowModal = mrOk then
        begin
            try
               planStateCode := StrToInt(GetReturnValue(sgENPlanWorkState,0));
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmMetrologyCountersSelectEdit.spbDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   // f.code := 75000050;//665; {1;} // Метрологічна служба
   f.conditionSQL := 'code in (75000050,665)';
   {
   if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > LOW_INT then
         if ENPlanWorkObj.renRef <> nil then
            /// Если код РЭСа > 0 (т.е. это не ХОЭ), то фильтруем подразделения по РЭСу,
            /// иначе выводим все
            //if ENPlanWorkObj.renRef.code > low(Integer) then
            if ENPlanWorkObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkObj.renRef.code) +')';
               f.code := Low(integer);
            end;
   }

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmMetrologyCountersSelectEdit.spbFINExecutorClick(
  Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
   f: FINExecutorFilter;
begin
   f := FINExecutorFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   //f.finCehCode := StrToInt('665');
   {SUPP-47459 Добавление исполнителей СЕПО}
   f.axParentOrgId := '027,096'; // 15.10.15 Для выбора из Axapt'ы

   //frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal,f);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
          try
            finExecutorObj :=
              DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                     DMReports.getFullExecutorName(tvDep.Selected));
            edtFINExecutorName.Text := finExecutorObj.name;
          except
            on EConvertError do Exit;
          end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmMetrologyCountersSelectEdit.spbTypeClearClick(
  Sender: TObject);
begin
  planTypeCode := LOW_INT;
  edtTypeName.Text := '';
end;

procedure TfrmMetrologyCountersSelectEdit.spbENPlanWorkStateClearClick(
  Sender: TObject);
begin
  planStateCode := LOW_INT;
  edtWorkState.Text := '';
end;

procedure TfrmMetrologyCountersSelectEdit.spbDepartmentClearClick(
  Sender: TObject);
begin
  departmentCode := LOW_INT;
  edtDepartment.Text := '';
end;

procedure TfrmMetrologyCountersSelectEdit.spbFINExecutorClearClick(
  Sender: TObject);
begin
  finExecutorObj := nil;
  edtFINExecutorName.Text := '';
end;

procedure TfrmMetrologyCountersSelectEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(finExecutorObj) then
    finExecutorObj.Free;
end;

////////////////////////////////////////////////////////////////////////////////
// Процедуры CopyRow и SetCheckBoxesState надо будет перенести в DialogFormUnit
function TfrmMetrologyCountersSelectEdit.CopyRow(SourceGrid, DestinationGrid: TAdvStringGrid;
  RowIndex: Integer; UniqueColumnIndex: Integer = -1): Boolean;
var i, DestinationRowIndex: Integer;
begin
  Result := false;
  
  if SourceGrid.ColCount <> DestinationGrid.ColCount then
  begin
    Application.MessageBox(PChar('Копирование строки невозможно, т.к. не совпадает количество столбцов!'),
                           PChar('Ошибка!'), MB_ICONERROR);
    Exit;
  end;

  // Проверяем, не добавлена ли уже в грид-приемник строка
  // с таким же значением в уникальном столбце, что и в гриде-источнике
  // (параметр UniqueColumnIndex - индекс уникального столбца, т.е.
  // фактически столбца с первичным ключом списка))
  if UniqueColumnIndex > -1 then
  begin
    for i := 1 to DestinationGrid.RowCount - 1 do
    begin
      if SourceGrid.Cells[UniqueColumnIndex, RowIndex] = DestinationGrid.Cells[UniqueColumnIndex, i] then
        Exit;
    end;
  end;

  // Если грид-приемник уже непустой, то добавляем новую строку
  if not ((DestinationGrid.RowCount = 2) and (DestinationGrid.Cells[0, 1] = '')) then
  begin
    //DestinationRowIndex := DestinationGrid.RowCount;
    DestinationGrid.RowCount := DestinationGrid.RowCount + 1;
    DestinationRowIndex := DestinationGrid.RowCount - 1;
  end
  else // если пустой
    DestinationRowIndex := 1;

	
  DestinationGrid.Objects[0, DestinationRowIndex] := SourceGrid.Objects[0, RowIndex];
  
  for i := 0 to SourceGrid.ColCount - 1 do begin
    DestinationGrid.Cells[i, DestinationRowIndex] := SourceGrid.Cells[i, RowIndex];
  end;
  Result := true; // если строка скопирована
end;

procedure TfrmMetrologyCountersSelectEdit.SetCheckBoxesState(Grid: TAdvStringGrid;
  ColIndex: Integer; State: Boolean{ = false});
var i: Integer;
begin
  for i := 0 to Grid.RowCount - 1 do
    Grid.SetCheckBoxState(ColIndex, i, State);
end;
////////////////////////////////////////////////////////////////////////////////

procedure TfrmMetrologyCountersSelectEdit.SetSelectedCountersGridEditableColumn;
var i, j: Integer;
begin
  for i := 1 to sgSelectedCounters.RowCount - 1 do
    for j := 0 to sgSelectedCounters.ColCount - 1 do
    begin
      if (j = 1) or (j = sgSelectedCounters.ColCount - 1) then
        sgSelectedCounters.CellProperties[j, i].ReadOnly := false
      else
        sgSelectedCounters.CellProperties[j, i].ReadOnly := true;
    end;
end;

procedure TfrmMetrologyCountersSelectEdit.btnSelectClick(Sender: TObject);
var i: Integer;
    state: Boolean;
    invNumber, departmentFKCode, molCode: String;
begin
  state := false;

  for i := 1 to sgENMetrologyCounter.RowCount - 1 do
  begin
    sgENMetrologyCounter.GetCheckBoxState(1, i, state);

    if state then
    begin
      invNumber := sgENMetrologyCounter.Cells[1, i];
      departmentFKCode := sgENMetrologyCounter.Cells[5, i];
      molCode := sgENMetrologyCounter.Cells[6, i];

      ///// 09.06.10 ///////////////////////////////////////////////////////////
      // Теперь будем проверять нахождение счетчика не просто в Метрологии,
      // а на подотчете мастера (в данный момент это мастер ЦРПУ Перевезенцева Н.А. (код МОЛа 2729)).
      // А вообще, в будущем нужно будет сделать таблицу и хранить в ней коды МОЛов, на которых можно
      // перемещать счетчики

      // пока что оставляем (на Перевезенцевой еще ничего нет)
      if not  TDMReports.isMetrologyDepartment(departmentFKCode) then
      begin
        Application.MessageBox(PChar('Лічильник "' + invNumber + '" знаходиться НЕ в Метрології!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
      
      {
      if molCode <> '2729' then
      begin
        Application.MessageBox(PChar('Лічильник "' + invNumber + '" знаходиться НЕ на підзвіті майстра!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
      }
      //////////////////////////////////////////////////////////////////////////


      if CopyRow(sgENMetrologyCounter, sgSelectedCounters, i, 1) then
        sgSelectedCounters.AddCheckBox(1, sgSelectedCounters.RowCount - 1, true, false);
      //sgSelectedCounters.Refresh;
    end;
  end;

  if isForWriteOff then
    SetSelectedCountersGridEditableColumn;
end;

procedure TfrmMetrologyCountersSelectEdit.btnDeleteClick(Sender: TObject);
var i, j: Integer;
    state, checked: Boolean;
begin
  state := false;
  checked := false;

{
  for i := 1 to sgSelectedCounters.RowCount - 1 do
  begin
    sgSelectedCounters.GetCheckBoxState(1, i, state);

    if state then
      if sgSelectedCounters.RowCount > 2 then
        sgSelectedCounters.RemoveRows(i, 1)
      else
      begin
        for j := 0 to sgSelectedCounters.ColCount - 1 do
          sgSelectedCounters.Cells[j, 1] := '';
        sgSelectedCounters.RemoveCheckBox(1, 1);
      end;
  end;
}

  i := 1;

  while i < sgSelectedCounters.RowCount do
  begin
    sgSelectedCounters.GetCheckBoxState(1, i, state);

    if state then
    begin
      checked := true;
      
      if sgSelectedCounters.RowCount > 2 then
      begin
        sgSelectedCounters.RemoveRows(i, 1);
        Continue;
      end
      else
      begin
        for j := 0 to sgSelectedCounters.ColCount - 1 do
          sgSelectedCounters.Cells[j, 1] := '';
        sgSelectedCounters.RemoveCheckBox(1, 1);
        break;
      end;
    end;

    i := i + 1;
  end;

  if not checked then
  begin
    Application.MessageBox(PChar('Оберіть лічильники, які необхідно видалити, з переліку праворуч!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if isForWriteOff then
    SetSelectedCountersGridEditableColumn;
end;

procedure TfrmMetrologyCountersSelectEdit.spbParentPlanClick(
  Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planObj: ENPlanWork;
  planFilter: ENPlanWorkFilter;
  frmENPlanWorkShow: TfrmENPlanWorkShow;

  TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
  ENPlanWorkTypeObj: ENPlanWorkType;
  TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
  ENPlanWorkStateObj: ENPlanWorkState;
  TempENDepartment: ENDepartmentControllerSoapPort;
  ENDepartmentObj: ENDepartment;
begin
  // пересоздаеться в ФормШов ...  по disableControlsType := dtMetrology;
  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  planFilter.kind := ENPlanWorkKind.Create;
  planFilter.kind.code := ENPLANWORKKIND_CURRENT; // на всякий случай
  planFilter.conditionSQL := 'enplanwork.elementrefcode in ' +
                               '(select enelement.code from enelement where typerefcode = ' + IntToStr(EN_METROLOGY_OBJECT) + ')';

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
  TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

  frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);
  frmENPlanWorkShow.viewPlanWork := 1;
  try
    with frmENPlanWorkShow do
    begin
      // Пока что фильтр лочим, а потом просто не будем давать выбирать
      // неподходящие планы, но будем давать им возможность искать свои
      DisableActions([frmENPlanWorkShow.actInsert,
                      frmENPlanWorkShow.actDelete,
                      frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actAddPlanItems
                      //,frmENPlanWorkShow.actFilter
                      , frmENPlanWorkShow.actNoFilter
                      ]);

      disableControlsType := dtMetrology;
      isFiltered := false;

      if isForWriteOff then
      begin
        elementCode := ENELEMENT_METROLOGY_OBJECT_WRITEOFF;
        elementName := 'Списання пломб при пакуванні лічильників на експертизу';
      end;

      if ShowModal = mrOk then
      begin
        try
          parentPlanCode := StrToInt(GetReturnValue(sgENPlanWork, 0));
          planObj := TempENPlanWork.getObject(parentPlanCode);
          if planObj <> nil then
          begin
            if planObj.elementRef <> nil then
              elementInCode := planObj.elementRef.code;

            ////////////////////////////////////////////////////////////////////
            // ЗАПОЛНЯЕМ ПАРАМЕТРЫ РАБОТ (ВИД, ТИП РАБОТ И Т.Д.) С ВЫБРАННОГО ТЕКУЩЕГО ПЛАНА
            if planObj.dateStart <> nil then
            begin
              edtDateStart.DateTime := EncodeDate(planObj.dateStart.Year, planObj.dateStart.Month, planObj.dateStart.Day);
              edtDateStart.Checked := false;
            end;

            if planObj.typeRef <> nil then
            begin
              planTypeCode := planObj.typeRef.code;
              ENPlanWorkTypeObj := TempENPlanWorkType.getObject(planTypeCode);
              if ENPlanWorkTypeObj <> nil then
                edtTypeName.Text := ENPlanWorkTypeObj.name
              else
                edtTypeName.Text := '';
              DisableControls([spbType, spbTypeClear]);
            end
            else begin
              planTypeCode := LOW_INT;
              edtTypeName.Text := '';
            end;

            if planObj.stateRef <> nil then
            begin
              planStateCode := planObj.stateRef.code;
              ENPlanWorkStateObj := TempENPlanWorkState.getObject(planStateCode);
              if ENPlanWorkStateObj <> nil then
                edtWorkState.Text := ENPlanWorkStateObj.name
              else
                edtWorkState.Text := '';
              DisableControls([spbENPlanWorkState, spbENPlanWorkStateClear]);
            end
            else begin
              planStateCode := LOW_INT;
              edtWorkState.Text := '';
            end;

            if planObj.departmentRef <> nil then
            begin
              departmentCode := planObj.departmentRef.code;
              ENDepartmentObj := TempENDepartment.getObject(departmentCode);
              if ENDepartmentObj <> nil then
                edtDepartment.Text := ENDepartmentObj.name
              else
                edtDepartment.Text := '';
              DisableControls([spbDepartment, spbDepartmentClear]);
            end
            else begin
              departmentCode := LOW_INT;
              edtDepartment.Text := '';
            end;

            /// 21.06.10
            if planObj.finExecutor <> nil then
            begin
              if finExecutorObj = nil then finExecutorObj := FINExecutor.Create();
              finExecutorObj.name := planObj.finExecutor.name;
              finExecutorObj.finCode := planObj.finExecutor.finCode;
              finExecutorObj.finTypeName := planObj.finExecutor.finTypeName;
              finExecutorObj.finTypeCode := planObj.finExecutor.finTypeCode;
              finExecutorObj.finKindName := planObj.finExecutor.finKindName;
              finExecutorObj.finKindCode := planObj.finExecutor.finKindCode;
              finExecutorObj.finCehName := planObj.finExecutor.finCehName;
              finExecutorObj.finCehCode := planObj.finExecutor.finCehCode;

              finExecutorObj.axOrgId := planObj.finExecutor.axOrgId;
              finExecutorObj.axParentOrgId := planObj.finExecutor.axParentOrgId;
              finExecutorObj.axParentOrgName := planObj.finExecutor.axParentOrgName;
              finExecutorObj.axOrgTypeId := planObj.finExecutor.axOrgTypeId;
              finExecutorObj.axOrgTypeName := planObj.finExecutor.axOrgTypeName;

              edtFINExecutorName.Text := planObj.finExecutor.name;
            end;
            ///
            ////////////////////////////////////////////////////////////////////
          end
          else
            parentPlanCode := LOW_INT;
        except
          on EConvertError do Exit;
        end;
        edtParentPlan.Text := GetReturnValue(sgENPlanWork, 1);

        Application.MessageBox(PChar('Зверніть увагу, що усім вибраним для планування лічильникам, у яких ще не встановлений тип, ' + #13#10 +
                                     'буде автоматично присвоєний тип "' + edtParentPlan.Text + '" !'),
                               PChar('Увага!'), MB_ICONWARNING);
      end;
    end;
  finally
    frmENPlanWorkShow.Free;
  end;
end;

procedure TfrmMetrologyCountersSelectEdit.spbParentPlanClearClick(
  Sender: TObject);
begin
  parentPlanCode := LOW_INT;
  elementInCode := LOW_INT;
  edtParentPlan.Text := '';

  spbTypeClearClick(Sender);
  spbENPlanWorkStateClearClick(Sender);
  spbDepartmentClearClick(Sender);

  DisableControls([spbType, spbTypeClear,
                   spbENPlanWorkState, spbENPlanWorkStateClear,
                   spbDepartment, spbDepartmentClear], false);
end;

procedure TfrmMetrologyCountersSelectEdit.Button1Click(Sender: TObject);
begin
  frmENMetrologyPlansEdit := TfrmENMetrologyPlansEdit.Create(Application, dsInsert);
  try
    //frmENMetrologyPlansEdit.planCodes := '500017562, 500017563, 500017564, 500017565, 500017566';
    //frmENMetrologyPlansEdit.planCodes := '500017582, 500017583, 500017584, /*facts*/500017585, 500017586/**/';
    frmENMetrologyPlansEdit.planCodes := '500017604, 500017605 /*facts*//**/';
    //frmENMetrologyPlansEdit.parentPlanCode := 500017547;
    frmENMetrologyPlansEdit.parentPlanCode := 500017597;
    if frmENMetrologyPlansEdit.ShowModal = mrOk then
    begin
    end;
  finally
    frmENMetrologyPlansEdit.Free;
  end;
end;

procedure TfrmMetrologyCountersSelectEdit.btnCheckAllClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgSelectedCounters.RowCount - 1 do
    sgSelectedCounters.SetCheckBoxState(1, i, true);
end;

procedure TfrmMetrologyCountersSelectEdit.btnUnCheckAllClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgSelectedCounters.RowCount - 1 do
    sgSelectedCounters.SetCheckBoxState(1, i, false);
end;

end.
