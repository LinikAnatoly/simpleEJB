unit EditENMetrologyObjectsSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, FINExecutorController,
  InvokeRegistry, Rio, SOAPHTTPClient, Grids, BaseGrid, AdvGrid, AdvObj;

type
  TfrmENMetrologyObjectsSelectEdit = class(TDialogForm)
    GroupBox1: TGroupBox;
    lblTypeName: TLabel;
    spbType: TSpeedButton;
    lblWorkState: TLabel;
    spbENPlanWorkState: TSpeedButton;
    lblCommentGen: TLabel;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    lblExecuter: TLabel;
    spbFINExecutor: TSpeedButton;
    spbTypeClear: TSpeedButton;
    spbENPlanWorkStateClear: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    spbFINExecutorClear: TSpeedButton;
    edtTypeName: TEdit;
    edtWorkState: TEdit;
    edtCommentGen: TEdit;
    edtDepartment: TEdit;
    edtFINExecutorName: TEdit;
    HTTPRIOENDepartment: THTTPRIO;
    sgENMetrologyObject: TAdvStringGrid;
    HTTPRIOENMetrologyObject: THTTPRIO;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    lblDateStart: TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal: TLabel;
    edtDateFinal: TDateTimePicker;
    btnCreatePlans: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    btnCheckAll: TBitBtn;
    btnUnCheckAll: TBitBtn;
    Label8: TLabel;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    gpbBudget: TGroupBox;
    rbBudgetMetrology: TRadioButton;
    rbBudgetEnergosbyt: TRadioButton;
    procedure spbTypeClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
    procedure spbENPlanWorkStateClearClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbFINExecutorClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgENMetrologyObjectTopLeftChanged(Sender: TObject);
    procedure edtMonthGenChange(Sender: TObject);
    procedure btnCreatePlansClick(Sender: TObject);
    procedure btnCheckAllClick(Sender: TObject);
    procedure btnUnCheckAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planTypeCode: Integer;
    planStateCode: Integer;
    departmentCode: Integer;
    finExecutorObj: FINExecutor;
    FilterObject: TObject;
    isForWriteOff: Boolean;
  end;

var
  frmENMetrologyObjectsSelectEdit: TfrmENMetrologyObjectsSelectEdit;

implementation

uses ShowENPlanWorkType, ShowENPlanWorkState, ShowENDepartment,
  ShowFINExecutorTree, ENPlanWorkTypeController, ENPlanWorkStateController,
  ENDepartmentController, ChildFormUnit, ENElementController, ENConsts,
  GridHeadersUnit, ENMetrologyObjectController, DateUtils, Math, XSBuiltIns,
  ENPlanWorkController, ENPlanWorkKindController, EnergyproController,
  ENPlanWorkStatusController, ENPlanWorkFormController, DMReportsUnit;

{$R *.dfm}

const
  ENMetrologyObjectHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування  об''єкту (тип лічильника)'
        );
        
var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

procedure TfrmENMetrologyObjectsSelectEdit.spbTypeClick(Sender: TObject);
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

procedure TfrmENMetrologyObjectsSelectEdit.spbENPlanWorkStateClick(
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

procedure TfrmENMetrologyObjectsSelectEdit.spbDepartmentClick(
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

   // Списывать пломбы могут еще и РЭСы
   if isForWriteOff then
     f.code := 1
   else
     f.conditionSQL := 'code in (75000050,665)'; //665; {1;} // Метрологічна служба

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

procedure TfrmENMetrologyObjectsSelectEdit.spbFINExecutorClick(
  Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
   f: FINExecutorFilter;
begin
   f := FINExecutorFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   //f.conditionSQL := 'p.Podr_Id = 665'; // Метрологічна служба

   // Списывать пломбы могут еще и РЭСы
   if isForWriteOff then
     f.finCehCode := 1
   else begin
     // f.finCehCode := StrToInt('665');
     {SUPP-47459 Добавление исполнителей СЕПО}
     f.axParentOrgId :=  '027,401'; //'027,042'; // 15.10.15 Для выбора из Axapt'ы
   end;

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

procedure TfrmENMetrologyObjectsSelectEdit.spbTypeClearClick(
  Sender: TObject);
begin
  planTypeCode := LOW_INT;
  edtTypeName.Text := '';
end;

procedure TfrmENMetrologyObjectsSelectEdit.spbENPlanWorkStateClearClick(
  Sender: TObject);
begin
  planStateCode := LOW_INT;
  edtWorkState.Text := '';
end;

procedure TfrmENMetrologyObjectsSelectEdit.spbDepartmentClearClick(
  Sender: TObject);
begin
  departmentCode := LOW_INT;
  edtDepartment.Text := '';
end;

procedure TfrmENMetrologyObjectsSelectEdit.spbFINExecutorClearClick(
  Sender: TObject);
begin
  finExecutorObj := nil;
  edtFINExecutorName.Text := '';
end;

procedure TfrmENMetrologyObjectsSelectEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
  inherited;
end;

procedure TfrmENMetrologyObjectsSelectEdit.FormCreate(Sender: TObject);
begin
  planTypeCode := LOW_INT;
  planStateCode := LOW_INT;
  departmentCode := LOW_INT;
  finExecutorObj := nil;

  isForWriteOff := false;
end;

procedure TfrmENMetrologyObjectsSelectEdit.FormShow(Sender: TObject);
var TempENDepartment: ENDepartmentControllerSoapPort;
    departmentObj: ENDepartment;

    TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
    i, yearIndex: Integer;
    ENMetrologyObjectList: ENMetrologyObjectShortList;
begin
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);
  SetGridHeaders(ENMetrologyObjectHeaders, sgENMetrologyObject.ColumnHeaders);

  DisableControls([edtTypeName, edtWorkState, edtDepartment, edtFINExecutorName]);
  //DisableControls([spbENPlanWorkState]);
  DenyBlankValues([edtTypeName, edtWorkState, edtDepartment, edtFINExecutorName]);

  if isForWriteOff then
    Caption := 'Списання пломб (експертиза лічильників) - Місячні плани';

  ///// Подставляем подразделение по умолчанию
  // Т.к. списывать пломбы могут еще и РЭСы, не будем подставлять подразделение автоматом
  {
  if isForWriteOff then
    departmentCode := 667 // Група метрологічного контролю
  else
    departmentCode := 671; // Цех з ремонту приладів обліку
  }
  if not isForWriteOff then
  begin
    departmentCode := 75000050; // СКО // Цех з ремонту приладів обліку

    TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    departmentObj := TempENDepartment.getObject(departmentCode);

    if departmentObj <> nil then
      edtDepartment.Text := departmentObj.shortName;
  end;
  /////

  ///// Выберем текущий год
  yearIndex := YearOf(Date) - 2009;

  if (yearIndex < 0) or (yearIndex > edtYearGen.Items.Count - 1) then
    edtYearGen.ItemIndex := 0
  else
    edtYearGen.ItemIndex := yearIndex;
  /////

  ColCount:=100;
  TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if isForWriteOff then
    ENMetrologyObjectFilter(FilterObject).conditionSQL := 'ENMETROLOGYOBJECT.CODE = ' + IntToStr(EN_METROLOGY_OBJECT_WRITEOFF)
  else
    ENMetrologyObjectFilter(FilterObject).conditionSQL := 'ENMETROLOGYOBJECT.CODE <> ' + IntToStr(EN_METROLOGY_OBJECT_WRITEOFF);

  ENMetrologyObjectList := TempENMetrologyObject.getScrollableFilteredList(ENMetrologyObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMetrologyObjectList.list);

  if LastCount > -1 then
     sgENMetrologyObject.RowCount:=LastCount+2
  else
     sgENMetrologyObject.RowCount:=2;

  with sgENMetrologyObject do
    for i:=0 to LastCount do
    begin
      Application.ProcessMessages;
      if ENMetrologyObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMetrologyObjectList.list[i].code)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := ENMetrologyObjectList.list[i].name;

      AddCheckBox(1, i+1, false, false);

      LastRow := i+1;
      sgENMetrologyObject.RowCount := LastRow+1;
    end;

  ColCount := ColCount+1;
  sgENMetrologyObject.Row := 1;

  if isForWriteOff then
  begin
    sgENMetrologyObject.AddCheckBox(1, 1, true, false);

    planTypeCode := ENPLANWORKTYPE_WRITING_OFF;
    edtTypeName.Text := 'Списання матеріалів';

    planStateCode := ENPLANWORKSTATE_MATERIALS_TMC;
    edtWorkState.Text := 'Списання використаних матеріальних цінностей';

    DisableControls([spbType, spbTypeClear, spbENPlanWorkState, spbENPlanWorkStateClear]);
  end;
end;

procedure TfrmENMetrologyObjectsSelectEdit.sgENMetrologyObjectTopLeftChanged(
  Sender: TObject);
var
  TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENMetrologyObjectList: ENMetrologyObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMetrologyObject.TopRow + sgENMetrologyObject.VisibleRowCount) = ColCount
  then
    begin
      TempENMetrologyObject :=  HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
      CurrentRow:=sgENMetrologyObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMetrologyObjectList := TempENMetrologyObject.getScrollableFilteredList(ENMetrologyObjectFilter(FilterObject),ColCount-1, 100);

  sgENMetrologyObject.RowCount:=sgENMetrologyObject.RowCount+100;
  LastCount:=High(ENMetrologyObjectList.list);
  with sgENMetrologyObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMetrologyObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMetrologyObjectList.list[i].name;

        AddCheckBox(1, i+CurrentRow, false, false);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMetrologyObject.Row:=CurrentRow-5;
   sgENMetrologyObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMetrologyObjectsSelectEdit.edtMonthGenChange(
  Sender: TObject);
begin
  if edtMonthGen.ItemIndex < 0 then Exit;
  
  edtDateStart.DateTime := EncodeDate(edtYearGen.ItemIndex + 2009, edtMonthGen.ItemIndex + 1, 1);
  edtDateFinal.DateTime := EncodeDate(edtYearGen.ItemIndex + 2009, edtMonthGen.ItemIndex + 1, DaysInMonth(edtDateStart.DateTime));
end;

procedure TfrmENMetrologyObjectsSelectEdit.btnCreatePlansClick(
  Sender: TObject);
var selected, generated, state: Boolean;
    i, counterTypeCode, newPlanCode: Integer;
    allowedStartDate, allowedFinalDate: TDate;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkObj: ENPlanWork;
    
    TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
    counterTypeObj: ENMetrologyObject;
begin
  selected := false;
  generated := false;
  state := false;

  for i := 1 to sgENMetrologyObject.RowCount - 1 do
  begin
    sgENMetrologyObject.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбран ни один тип счетчиков
  begin
    Application.MessageBox(PChar('Необхідно вибрати типи лічильників, для яких потрібно сформувати плани!'),
                           PChar('Увага!'), MB_ICONWARNING);
    sgENMetrologyObject.SetFocus;
    Exit;
  end;

  if edtMonthGen.ItemIndex < 0 then
  begin
    Application.MessageBox(PChar('Вкажіть місяць виконання робіт!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtMonthGen.SetFocus;
    Exit;  
  end;

  if not edtDateStart.Checked then
  begin
    Application.MessageBox(PChar('Вкажіть дату початку виконання робіт!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtDateStart.SetFocus;
    Exit;  
  end;

  if not edtDateFinal.Checked then
  begin
    Application.MessageBox(PChar('Вкажіть дату закінчення виконання робіт!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtDateFinal.SetFocus;
    Exit;
  end;

  allowedStartDate := EncodeDate(edtYearGen.ItemIndex + 2009, edtMonthGen.ItemIndex + 1, 1);
  allowedFinalDate := EncodeDate(edtYearGen.ItemIndex + 2009,
                                 edtMonthGen.ItemIndex + 1,
                                 DaysInAMonth(edtYearGen.ItemIndex + 2009, edtMonthGen.ItemIndex + 1));

  if (edtDateStart.DateTime < allowedStartDate) or (edtDateStart.DateTime > allowedFinalDate) then
  begin
    Application.MessageBox(PChar('Дата початку виконання робіт повинна знаходитись в інтервалі з ' +
                                 DateToStr(allowedStartDate) + ' по ' + DateToStr(allowedFinalDate) + ' !'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtDateStart.SetFocus;
    Exit;
  end;

  if (edtDateFinal.DateTime < allowedStartDate) or (edtDateFinal.DateTime > allowedFinalDate) then
  begin
    Application.MessageBox(PChar('Дата закінчення виконання робіт повинна знаходитись в інтервалі з ' +
                                 DateToStr(allowedStartDate) + ' по ' + DateToStr(allowedFinalDate) + ' !'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtDateFinal.SetFocus;
    Exit;
  end;

  if edtDateStart.DateTime > edtDateFinal.DateTime then
  begin
    Application.MessageBox(PChar('Дата початку виконання робіт не може бути більшою за дату закінчення!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtDateStart.SetFocus;
    Exit;  
  end;

  if not NoBlankValues([edtTypeName, edtWorkState, edtDepartment, edtFINExecutorName]) then
  begin
    Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага !'), MB_ICONWARNING+MB_OK);
    Exit;
  end;

  TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

////////////////////////////////////////////////////////////////////////////////
  for i := 1 to sgENMetrologyObject.RowCount - 1 do
  begin
    sgENMetrologyObject.GetCheckBoxState(1, i, state);

    if state then
    begin
      //////////////////////////////////////////////////////////////////////////
      // Генерим Текущий План для каждого выбранного типа счетчиков
      try
        counterTypeCode := StrToInt(sgENMetrologyObject.Cells[0, i]);
      except
        on EConvertError do Continue;
      end;

      counterTypeObj := TempENMetrologyObject.getObject(counterTypeCode);

      if counterTypeObj = nil then
      begin
        Application.MessageBox(PChar('Помилка при отриманні типу лічильника! (<obj>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      if counterTypeObj.code = LOW_INT then
      begin
        Application.MessageBox(PChar('Помилка при отриманні типу лічильника! (<obj.code>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      if counterTypeObj.element = nil then
      begin
        Application.MessageBox(PChar('Помилка при отриманні типу лічильника! (<element>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      if counterTypeObj.element.code = LOW_INT then
      begin
        Application.MessageBox(PChar('Помилка при отриманні типу лічильника! (<element.code>)'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      if (counterTypeCode = EN_METROLOGY_OBJECT_WRITEOFF) and (planStateCode <> ENPLANWORKSTATE_MATERIALS_TMC) then
      begin
        Application.MessageBox(PChar('Тип акту для об''єкту "' + counterTypeObj.name +
                               '" може бути тільки "Списання ТМЦ"!'), PChar('Увага !'), MB_ICONERROR);
        Exit;
      end;

      ENPlanWorkObj := ENPlanWork.Create;
      SetNullIntProps(ENPlanWorkObj);
      SetNullXSProps(ENPlanWorkObj);

      if edtDateStart.checked then
      begin
        if ENPlanWorkObj.dateStart = nil then
          ENPlanWorkObj.dateStart := TXSDate.Create;
        ENPlanWorkObj.dateStart.XSToNative(GetXSDate(edtDateStart.DateTime));
      end
      else
        ENPlanWorkObj.dateStart := nil;

      if edtDateFinal.checked then
      begin
        if ENPlanWorkObj.dateFinal = nil then
          ENPlanWorkObj.dateFinal := TXSDate.Create;
        ENPlanWorkObj.dateFinal.XSToNative(GetXSDate(edtDateFinal.DateTime));
      end
      else
        ENPlanWorkObj.dateFinal := nil;

      if ENPlanWorkObj.kind = nil then ENPlanWorkObj.kind := ENPlanWorkKind.Create;
      ENPlanWorkObj.kind.code := ENPLANWORKKIND_CURRENT;

      if (edtYearGen.ItemIndex >= 0) then
        ENPlanWorkObj.yearGen := edtYearGen.ItemIndex + 2009
      else
        ENPlanWorkObj.yearGen := Low(Integer);

      if (edtMonthGen.ItemIndex >= 0) then
        ENPlanWorkObj.monthGen := edtMonthGen.ItemIndex + 1
      else
        ENPlanWorkObj.monthGen := Low(Integer);

      ENPlanWorkObj.commentGen := edtCommentGen.Text;

      ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
      ENPlanWorkObj.formRef.code := cbENPlanWorkFormName.ItemIndex + 1;
      
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
      ENPlanWorkObj.elementRef.code := counterTypeObj.element.code;

      if ENPlanWorkObj.renRef = nil then ENPlanWorkObj.renRef := EPRenRef.Create;
      ENPlanWorkObj.renRef.code := counterTypeObj.element.renRef.code;

      if ENPlanWorkObj.typeRef = nil then ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create();
      ENPlanWorkObj.typeRef.code := planTypeCode;

      if ENPlanWorkObj.stateRef = nil then ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create();
      ENPlanWorkObj.stateRef.code := planStateCode;

      if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
      ENPlanWorkObj.departmentRef.code := departmentCode;

      if finExecutorObj <> nil then
      begin
        if ENPlanWorkObj.finExecutor = nil then ENPlanWorkObj.finExecutor := FINExecutor.Create();
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

      if ENPlanWorkObj.budgetRef = nil then ENPlanWorkObj.budgetRef := ENDepartmentRef.Create();
      if ENPlanWorkObj.responsibilityRef = nil then ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create();

      if rbBudgetMetrology.Checked then begin
        ENPlanWorkObj.budgetRef.code := ENBUDGET_METROLOGY; // Метрологія
        ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_METROLOGY; // Метрологія
      end else begin
        ENPlanWorkObj.budgetRef.code := ENBUDGET_ENERGOSBYT; // Енергозбут
        ENPlanWorkObj.responsibilityRef.code := ENRESPONSIBILITY_ENERGOSBYT; // Енергозбут
      end;

      newPlanCode := LOW_INT;
            
      //AddListPos(planCodes, IntToStr(TempENPlanWork.addByMetrology(ENPlanWorkObj)));
      //newPlanCode := TempENPlanWork.addByMetrology(ENPlanWorkObj);
      newPlanCode := TempENPlanWork.add(ENPlanWorkObj);

      generated := true;
      //////////////////////////////////////////////////////////////////////////

    end; // if state

  end; // for

////////////////////////////////////////////////////////////////////////////////

  if generated then
  begin
    Application.MessageBox(PChar('Формування планів завершено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
  end;
end;

procedure TfrmENMetrologyObjectsSelectEdit.btnCheckAllClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENMetrologyObject.RowCount - 1 do
    sgENMetrologyObject.SetCheckBoxState(1, i, true);
end;

procedure TfrmENMetrologyObjectsSelectEdit.btnUnCheckAllClick(
  Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENMetrologyObject.RowCount - 1 do
    sgENMetrologyObject.SetCheckBoxState(1, i, false);
end;

end.
