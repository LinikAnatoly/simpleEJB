unit EditMaterialsSCCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController, TB2Item, TB2Dock, TB2Toolbar, ImgList, ComCtrls
  ;

type
  TfrmMaterialsSCCounterEdit = class(TDialogForm)
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIORQOrderItem: THTTPRIO;
    Splitter1: TSplitter;
    PanelFINMaterials: TPanel;
    Splitter2: TSplitter;
    HTTPRIOFINMaterials: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    Panel4: TPanel;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Splitter3: TSplitter;
    gbENFINMaterials: TGroupBox;
    actRemove310: TAction;
    HTTPRIOENDepartment: THTTPRIO;
    Label7: TLabel;
    pnlLegend: TPanel;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    gbSCCounterData: TGroupBox;
    gbParameters: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    edtInvNumber: TEdit;
    edtSerialNumber: TEdit;
    edtName: TEdit;
    edtFinMolName: TEdit;
    edtFinMolCode: TEdit;
    dtpDateIn: TDateTimePicker;
    edtCost: TEdit;
    btnSearch: TButton;
    panelSCGrid: TPanel;
    sgENMetrologyCounter: TAdvStringGrid;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    cbAccount: TComboBox;
    lblAccount: TLabel;
    sgSCCounter: TAdvStringGrid;
    HTTPRIOSCCounter: THTTPRIO;
    lblCountInOrder: TLabel;
    Panel1: TPanel;
    btnAddMaterials: TBitBtn;
    spbDepartmentClear: TSpeedButton;
    spbUndoAllForAdd: TSpeedButton;
    spbSelectAllForAdd: TSpeedButton;
    actSelectAllForAdd: TAction;
    actUndoSelectAllForAdd: TAction;
    spbSelectAllForRemove: TSpeedButton;
    spbUndoSelectAllForRemove: TSpeedButton;
    actSelectAllForRemove: TAction;
    actUndoSelectAllForRemove: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddMaterialsClick(Sender: TObject);


    function makeEstimateCondition(): String;
    function getEstimateCode() : Integer;
    procedure actRemove310Execute(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure sgENMetrologyCounterTopLeftChanged(Sender: TObject);

    procedure updateSCCounterGrid;
    procedure actSelectAllForAddExecute(Sender: TObject);
    procedure actUndoSelectAllForAddExecute(Sender: TObject);
    procedure actSelectAllForRemoveExecute(Sender: TObject);
    procedure actUndoSelectAllForRemoveExecute(Sender: TObject);

  private
    { Private declarations }
  public

    plan : ENPlanWork;
    molCode : String;
    molName : String;
    estimateItemCode : Integer;

    {elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    planCodes: String;
    planFilter: ENPlanWorkFilter;
    MOLCode : String;
    masterMOLCode : String;
    departmentCode : Integer;
    departmentName : String;
    materialsINCode : Integer;}

    procedure UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
    procedure updateEstimateItemGrid_();


    //procedure clearGrids();
  end;

var
  frmMaterialsSCCounterEdit: TfrmMaterialsSCCounterEdit;


implementation

{$R *.dfm}

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, TKMaterialsController, GridHeadersUnit,
  ENPlanWorkKindController, EditTKMaterials,
  EditENPlanWork, DMReportsUnit, ShellAPI, Globals,
  ENPlanWorkItemController, EditENPlanWorkItem, ENEstimateItemController,
  XSBuiltIns, FINMolController, ShowFINMol, ENDepartment2EPRenController,
  ENEstimateItemKindController, EditRQOrderItem, RQOrderController,
  TKMeasurementController, ENPlanWorkFormController,
  FINMaterialsController, FINDoc2FKOrderController, FINDocTypeController,
  FINMaterialsStatusController, EditFINMaterialCount, FINMolDataController,
  RQFKOrderItemController, RQFKOrderItem2ENEstimateItemController,
  RQFKOrderData2FKPartyController, ENMetrologyCounterController,
  TKAccountingTypeController, SCOrderController, ShowSCOrder,
  SCCounterController, SCOrderKindController, SCCounterKindController
  , SCCounterStatusController;

var


  ENEstimateItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'
          ,'Од. виміру'
          ,'Дата поч.робіт'
          ,'Підрозділ'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'
        );

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMetrologyCounterHeaders: array [1..12] of String =
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
        );

  SCCounterHeaders: array [1..16] of String =
        ( 'Код'
          ,'Інв. №'
          ,'Найменування'
          ,'Заводський №'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МВО'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Дата повірки'
          ,'Вартість'
          ,'Код зі ScanCounters'
          ,'Тип лічильника'
          ,'№ наряду на встановлення'
          ,'Показники'
          ,'Дата останньої зміни'
        );

procedure TfrmMaterialsSCCounterEdit.FormShow(Sender: TObject);
begin

  edtFinMolCode.Text := molCode;
  edtFinMolName.Text := molName;

  DisableControls([edtFinMolCode, edtFinMolName]);

  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);
  SetGridHeaders(SCCounterHeaders, sgSCCounter.ColumnHeaders);

  // Обновление грида с материалом на плане
  updateEstimateItemGrid_;
  updateSCCounterGrid;
end;

function TfrmMaterialsSCCounterEdit.makeEstimateCondition(): String;
var
  str, conditionSQL, planCondition : String;

begin

    conditionSQL := 'ENESTIMATEITEM.CODE = ' + IntToStr(Self.estimateItemCode);
    planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';

      //planFilter.monthGen := edtMonthGen.ItemIndex + 1;
      AddCondition(planCondition, 'enplanwork.code = ' + IntToStr(plan.code));

    AddCondition(conditionSQL, planCondition);

    Result := conditionSQL;
end;


procedure TfrmMaterialsSCCounterEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmMaterialsSCCounterEdit.UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
var i, j, LastCount: Integer;
    //TempTKMaterials: TKMaterialsControllerSoapPort;
    //TKMaterialsList: TKMaterialsShortList;
    //materialsFilter: TKMaterialsFilter;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENMaterialsList: ENMaterialsShortList;
begin
  if planFilter = nil then Exit;


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  //ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, mCondition, materialsINCode);
  if ENMaterialsList = nil then Exit;

  LastCount := High(ENMaterialsList.list);

end;



procedure TfrmMaterialsSCCounterEdit.updateEstimateItemGrid_();
var
  i, j , code : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  eFilter : ENEstimateItemFilter;
  //pFilter : ENPlanWorkFilter;
  materialCode : Integer;
  conditionSQL, planCondition , eCondition : String;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;

   eCondition := '';


    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    eFilter.planRef := ENPlanWorkRef.Create;
    eFilter.planRef.code := plan.code;
    eFilter.code := Self.estimateItemCode;

    eFilter.kindRef := ENEstimateItemKindRef.Create;
    eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    //eFilter.accountingTypeRef := TKAccountingTypeRef.Create;
    //eFilter.accountingTypeRef.code := TK_ACCOUNTINGTYPE_COUNTER;


    if  ( Length(eCondition) > 0 ) then eFilter.conditionSQL := eCondition;

    eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

    Application.ProcessMessages;

    if High(ENEstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         //Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!
         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!
         
         Cells[3,i+1] := ENEstimateItemList.list[i].measureType;

        if ENEstimateItemList.list[i].planRefDateStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENEstimateItemList.list[i].planRefDateStart);

         Cells[5, i+1] := ENEstimateItemList.list[i].planRefDepartmentName;

         Cells[6,i+1] := ENEstimateItemList.list[i].invNumber ;
         Cells[7,i+1] := ENEstimateItemList.list[i].elementName ;

         Cells[8,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[9,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[10,i+1] := ENEstimateItemList.list[i].planType;
         Cells[11,i+1] := ENEstimateItemList.list[i].planState;

         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;
end;


function TfrmMaterialsSCCounterEdit.getEstimateCode() : Integer;
var
  state : Boolean;
  eCode , i : Integer;
begin
  eCode := LOW_INT;

  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
      if eCode <> LOW_INT then
      begin
        Application.MessageBox(PChar('Оберіть ТІЛЬКИ один матеріал ...'),
                    PChar('Увагв !'),MB_ICONERROR + MB_OK);
        Result := 0;
      end;

      try
        eCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
      except
        on EConvertError do Exit;
      end;

    end;
  end;
  Result := eCode;
end;

procedure TfrmMaterialsSCCounterEdit.actSelectAllForAddExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgENMetrologyCounter, 1, true);
end;

procedure TfrmMaterialsSCCounterEdit.actSelectAllForRemoveExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgSCCounter, 1, true);
end;

procedure TfrmMaterialsSCCounterEdit.actUndoSelectAllForAddExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgENMetrologyCounter, 1, false);
end;

procedure TfrmMaterialsSCCounterEdit.actUndoSelectAllForRemoveExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgSCCounter, 1, false);
end;

procedure TfrmMaterialsSCCounterEdit.btnAddMaterialsClick(
  Sender: TObject);
var i, cntCount, estCount, p, m: Integer;
   estimateCode: Integer;
   state, estState: boolean;
   scObj: ENMetrologyCounter;
   counterArr: ArrayOfENMetrologyCounters;
   TempSCCounter : SCCounterControllerSoapPort;
begin

  state := false;
  cntCount := 0;
  for i := 1 to sgENMetrologyCounter.RowCount - 1 do
  begin
    sgENMetrologyCounter.GetCheckBoxState(1, i, state);

    if state then
    begin
      cntCount := cntCount + 1;
    end;
  end;

    if ( cntCount = 0 ) then
    begin
        Application.MessageBox(
          PChar('Не обрано лічильників для списання ...'),
          PChar('Увага!'), MB_ICONWARNING);
          Exit;
    end;

    if Application.MessageBox(PChar('Ви дійсно бажаєте прив''язати ' + IntToStr(cntCount) + ' лічильників ?'),
                              PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
    begin
          Exit;
    end;



  SetLength(counterArr, cntCount);
  cntCount := 0;
  state := false;
  for i := 1 to sgENMetrologyCounter.RowCount - 1 do
    begin
      sgENMetrologyCounter.GetCheckBoxState(1, i, state);
      if state then
        begin
          scObj := ENMetrologyCounter.Create;
          SetNullIntProps(scObj);
          SetNullXSProps(scObj);
          scObj.invNumber := sgENMetrologyCounter.Cells[1, i];
          scObj.name := sgENMetrologyCounter.Cells[2, i];
          scObj.buildNumber := sgENMetrologyCounter.Cells[3, i];
          scObj.account := sgENMetrologyCounter.Cells[4, i];
          scObj.departmetFKCode := sgENMetrologyCounter.Cells[5, i];
          scObj.molCode := sgENMetrologyCounter.Cells[6, i];
          scObj.dateIn := TXSDate.Create;
          scObj.dateIn.XSToNative(GetXSDate(StrToDate(
            sgENMetrologyCounter.Cells[7, i])));
          // может быть пустой ...
          if ( Length(sgENMetrologyCounter.Cells[8, i]) <> 0 ) then
            begin
              scObj.dateBuild := TXSDate.Create;
              scObj.dateBuild.XSToNative(GetXSDate(StrToDate(
                sgENMetrologyCounter.Cells[8, i])));
            end;
          scObj.cost := TXSDecimal.Create;
          scObj.cost.DecimalString := sgENMetrologyCounter.Cells[9, i];
          scObj.scCode := StrToInt(sgENMetrologyCounter.Cells[10, i]);
          scObj.counterType := sgENMetrologyCounter.Cells[11, i];

          scObj.element := ENElement.Create;
          scObj.element.code := Self.estimateItemCode;

          counterArr[cntCount] := scObj;
          cntCount := cntCount + 1;

        end;
    end;

    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
    TempSCCounter.addCountersForWriteOff(counterArr);

    btnSearchClick(Sender);
    updateSCCounterGrid;
end;


procedure TfrmMaterialsSCCounterEdit.actRemove310Execute(
  Sender: TObject);
var
  objCode, objSign : Integer;
  // коды позиций (0-й столбец)
  codes : SCCounterController.ArrayOfInteger;
  // isHere - Переменная для определения есть ли в выделенных
  //          флажками позициях код позиций выделенный курсором
  isChosenHere, state : Boolean;

  // cntCount - Количество выделенных строк флажками
  cntCount, i : Integer;

  TempSCCounter : SCCounterControllerSoapPort;

  strInvNumber : String;
begin
  inherited;

  TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;

  isChosenHere := false;
  state := false;
  cntCount := 0;

  for i := 1 to sgSCCounter.RowCount - 1 do
  begin
       sgSCCounter.GetCheckBoxState(1, i, state);

       if state then
       begin
         cntCount := cntCount + 1;
       end;
  end;



  objCode := LOW_INT;
  try
    objCode := StrToInt(sgSCCounter.Cells[0, sgSCCounter.Row]);
  except
    on EConvertError do Exit;
  end;

    if ( cntCount = 0 ) and (objCode = LOW_INT) then
  begin
    Application.MessageBox(
      PChar('Не обрано лічильників для списання ...'),
      PChar('Увага!'), MB_ICONWARNING);
      Exit;
  end;

  if cntCount > 0 then
  begin
    SetLength(codes, cntCount);
    cntCount := 0;
    for i := 1 to sgSCCounter.RowCount - 1 do
    begin
       sgSCCounter.GetCheckBoxState(1, i, state);

       if state then
       begin
           codes[cntCount] := StrToInt(sgSCCounter.Cells[0, i]);

           if (objCode <> LOW_INT) and (not isChosenHere) and (objCode = codes[cntCount]) then
            isChosenHere := true;

            cntCount := cntCount + 1;

       end;
    end;
  end
  else
  begin
    cntCount := 1;
    isChosenHere := true;
    SetLength(codes, cntCount);
    codes[0] := objCode;
  end;

  if(cntCount = 1) then
  begin
          strInvNumber := TempSCCounter.getObject(codes[0]).invNumber;
           if Application.MessageBox(PChar('Ви дійсно бажаєте видалити прив''язку для лічильника інв. № ' + strInvNumber + ' ?'),
                              PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
                              begin
                                Exit;
                              end;
  end
  else
  begin
          strInvNumber := IntToStr(cntCount);
           if Application.MessageBox(PChar('Ви дійсно бажаєте видалити прив''язку для ' + strInvNumber + ' лічильників ?'),
                              PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
                              begin
                                Exit;
                              end;
  end;


  TempSCCounter.removeCountersForWriteOff(codes);

  btnSearchClick(Sender);
  updateSCCounterGrid;

end;

procedure TfrmMaterialsSCCounterEdit.btnSearchClick(Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  i, j{, ColCount, LastCount}: Integer;
  counterFilter: ENMetrologyCounterFilter;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
  sql : string;
begin

{28.10.2011 проверка на выбранный счет}
if (cbAccount.ItemIndex = -1) then
begin
     MessageBox(0, PCHAR('Оберить рахунок!'),
'Error', +mb_OK +mb_ICONERROR);
  exit;

end;

  for i:=1 to sgENMetrologyCounter.RowCount-1 do
    for j:=0 to sgENMetrologyCounter.ColCount-1 do
      sgENMetrologyCounter.Cells[j,i] := '';
  sgENMetrologyCounter.RowCount := 2;
  sgENMetrologyCounter.RemoveCheckBox(1, 1);

  ColCount := 100;

  TempENMetrologyCounter :=  HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

  //////////////////////////////////////////////////////////////////////////////
  counterFilter := ENMetrologyCounterFilter.Create;
  SetNullIntProps(counterFilter);
  SetNullXSProps(counterFilter);

  /////////////////

  if edtFinMolCode.Text <> '' then
    counterFilter.molCode := edtFinMolCode.Text;

  // если выбрана разнарядка - пофиг все остальное ...
  sql := '';

  // что бы не брали один и тотже ... + залоченые ;)
  // уехало ниже ... AddCondition(sql, 'a.energy_lock is null');

  // что бы не брали один и тотже ... + залоченые ;)
  AddCondition(sql, ' nvl(a.energy_lock, -1) < 0 ');

  counterFilter.account := cbAccount.Text;

  if dtpDateIn.Checked then
  begin
    counterFilter.dateIn := TXSDate.Create;
    counterFilter.dateIn.XSToNative(GetXSDate(dtpDateIn.DateTime));
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

  counterFilter.conditionSQL := sql;

  ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(counterFilter, 0, ColCount);

  LastCount := High(ENMetrologyCounterList.list);

  if LastCount > -1 then
    sgENMetrologyCounter.RowCount := LastCount + 2
  else
    sgENMetrologyCounter.RowCount := 2;

     with sgENMetrologyCounter do
      for i := 0 to LastCount do
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

          LastRow := i + 1;
          sgENMetrologyCounter.RowCount := LastRow + 1;
      end;

    ColCount := ColCount + 1;
    sgENMetrologyCounter.Row := 1;

end;

procedure TfrmMaterialsSCCounterEdit.sgENMetrologyCounterTopLeftChanged(Sender: TObject);
var
  TempENMetrologyCounter : ENMetrologyCounterControllerSoapPort;
  i, n, CurrentRow : Integer;
  ENMetrologyCounterList : ENMetrologyCounterShortList;
  counterFilter : ENMetrologyCounterFilter;
  isSCOrder : Boolean;
  sql : string;

begin
  if LastCount < 99 then Exit;
  if (sgENMetrologyCounter.TopRow + sgENMetrologyCounter.VisibleRowCount) = ColCount
  then
    begin
      TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
      CurrentRow := sgENMetrologyCounter.RowCount;

      counterFilter := ENMetrologyCounterFilter.Create;
      SetNullIntProps(counterFilter);
      SetNullXSProps(counterFilter);

      if edtFinMolCode.Text <> '' then
        counterFilter.molCode := edtFinMolCode.Text;

      sql := '';

      // что бы не брали один и тотже ... + залоченые ;)
      AddCondition(sql, ' nvl(a.energy_lock, -1) < 0 ');

      counterFilter.account := cbAccount.Text;

      if dtpDateIn.Checked then
      begin
        counterFilter.dateIn := TXSDate.Create;
        counterFilter.dateIn.XSToNative(GetXSDate(dtpDateIn.DateTime));
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

      counterFilter.conditionSQL := sql;

      ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(counterFilter, ColCount-1, 100);

      try
        sgENMetrologyCounter.RowCount := sgENMetrologyCounter.RowCount + 100;
        LastCount := High(ENMetrologyCounterList.list);

        with sgENMetrologyCounter do
          for i := 0 to LastCount do
            begin
              Application.ProcessMessages;

              if ENMetrologyCounterList.list[i].code <> Low(Integer) then
                Cells[0,i+CurrentRow] := IntToStr(ENMetrologyCounterList.list[i].code)
              else
                Cells[0,i+CurrentRow] := '';

              Cells[1,i+CurrentRow] := ENMetrologyCounterList.list[i].invNumber;

              AddCheckBox(1, i+CurrentRow, isSCOrder, false);

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

              LastRow := i + CurrentRow;
            end;

         ColCount := ColCount + 100;

         sgENMetrologyCounter.RowCount := LastRow + 1;

         if (sgENMetrologyCounter.RowCount > 5) then
           sgENMetrologyCounter.Row := CurrentRow - 5;

      finally
        ENMetrologyCounterList.Free;
      end;

    end;
end;

procedure TfrmMaterialsSCCounterEdit.updateSCCounterGrid;
var i, j, list1Count: Integer;
    TempSCCounter: SCCounterControllerSoapPort;
    SCCounterList: SCCounterShortList;
    counterFilter: SCCounterFilter;
    stringGrid : TAdvStringGrid;
    objCode : Integer;
begin

  stringGrid := sgSCCounter;

  SetGridHeaders(SCCounterHeaders, sgSCCounter.ColumnHeaders);

  stringGrid.RowColor[1] := clWindow;

  ClearGrid(stringGrid);

  try
    objCode := Self.estimateItemCode;
  except
    on EConvertError do Exit;
  end;


    counterFilter := SCCounterFilter.Create;
    SetNullIntProps(counterFilter);
    SetNullXSProps(counterFilter);
    counterFilter.kindRef := SCCounterKindRef.Create;
    counterFilter.kindRef.code := SCCOUNTERKIND_FOR_WRITINGOFF;
	counterFilter.statusRef := SCCounterStatusRef.Create;
	counterFilter.statusRef.code := SCCOUNTERSTATUS_GOOD;

	counterFilter.estimateItemRef := ENEstimateItemRef.Create;
	counterFilter.estimateItemRef.code := objCode;

    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;

    SCCounterList := TempSCCounter.getScrollableFilteredList(counterFilter, 0, -1);

    if High(SCCounterList.list) > -1 then
       stringGrid.RowCount := High(SCCounterList.list) + 2
    else
       stringGrid.RowCount := 2;

     list1Count := High(SCCounterList.list) + 1;

     lblCountInOrder.Caption := 'Кількість прив_язаних до строки плану : ' + IntToStr(list1Count);

     with stringGrid do
      for i:=0 to High(SCCounterList.list) do
        begin
          Application.ProcessMessages;

          Objects[0, i+1] := TObject(1);
          AddCheckBox(1, i+1, false, false);


          if SCCounterList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(SCCounterList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := SCCounterList.list[i].invNumber;
          Cells[2,i+1] := SCCounterList.list[i].name;
          Cells[3,i+1] := SCCounterList.list[i].buildNumber;
          Cells[4,i+1] := SCCounterList.list[i].account;
          Cells[5,i+1] := SCCounterList.list[i].departmetFKCode;
          Cells[6,i+1] := SCCounterList.list[i].molCode;
          if SCCounterList.list[i].dateIn = nil then
            Cells[7,i+1] := ''
          else
            Cells[7,i+1] := XSDate2String(SCCounterList.list[i].dateIn);
          if SCCounterList.list[i].dateBuild = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDate2String(SCCounterList.list[i].dateBuild);
          if SCCounterList.list[i].dateCheck = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := XSDate2String(SCCounterList.list[i].dateCheck);
          if SCCounterList.list[i].cost = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := SCCounterList.list[i].cost.DecimalString;
          if SCCounterList.list[i].scCode = Low(Integer) then
            Cells[11,i+1] := ''
          else
            Cells[11,i+1] := IntToStr(SCCounterList.list[i].scCode);
          Cells[12,i+1] := SCCounterList.list[i].counterType;
          Cells[13,i+1] := SCCounterList.list[i].installOrderNumber;
          Cells[14,i+1] := SCCounterList.list[i].reading;
          if SCCounterList.list[i].dateEdit = nil then
            Cells[15,i+1] := ''
          else
            Cells[15,i+1] := XSDateTimeWithDate2String(SCCounterList.list[i].dateEdit);
          //LastRow:=i+1;
          stringGrid.RowCount := i + 2;
        end;

   stringGrid.Row:=1;

end;



end.
