unit EditMaterialsParametersOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController
  , RQOrderItemController
  ;

type
  TfrmMaterialsParametersOutEdit = class(TDialogForm)
    Panel1: TPanel;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblENBudgetName: TLabel;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    edtENElementName: TEdit;
    edtENBudgetName: TEdit;
    chkkindrefcodemat: TCheckBox;
    btnSelect: TBitBtn;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtMolName: TEdit;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    btnAddMaterials: TBitBtn;
    HTTPRIORQOrderItem: THTTPRIO;
    Panel2: TPanel;
    sgTKMaterials: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    chbOnlyOtherPurchases: TCheckBox;
    Label1: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    btnShowEstimates: TButton;
    lblPlanCode: TLabel;
    edtPlanCode: TEdit;
    procedure spbENElementClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure sgTKMaterialsClick(Sender: TObject);

    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddMaterialsClick(Sender: TObject);




   function makeEstimateCondition(): String;
    procedure sgTKMaterialsDblClick(Sender: TObject);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure edtPlanCodeChange(Sender: TObject);
    procedure sgTKMaterialsColumnMove(Sender: TObject; ACol: Integer;
      var Allow: Boolean);
         
  private
    { Private declarations }
  public
    { Public declarations }
    //RQOrderItemObj: RQOrderItem;

    orderCode : Integer;
    orderKind : Integer;
    orderType : Integer;
    
    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    planCodes: String;
    planFilter: ENPlanWorkFilter;
    MOLCode : String;
    departmentCode : Integer;
    departmentName : String;
    materialsINCode : Integer;
    materialsINName: String;

    materialCode_ : Integer;
    
    //procedure UpdateMaterials(planCodes: String); overload;
    procedure UpdateMaterials_(planFilter: ENPlanWorkFilter);
    procedure updateEstimateItemGrid_();
  end;

var
  frmMaterialsParametersOutEdit: TfrmMaterialsParametersOutEdit;


implementation

{$R *.dfm}

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, TKMaterialsController, GridHeadersUnit,
  {ENPlanWorkController, }ENPlanWorkKindController, EditTKMaterials,
  EditENPlanWork, DMReportsUnit, ShellAPI, Globals,
  ENPlanWorkItemController, EditENPlanWorkItem, ENEstimateItemController,
  XSBuiltIns, FINMolController, ShowFINMol, ENDepartment2EPRenController,
  ENEstimateItemKindController, EditRQOrderItem, RQOrderController,
  TKMeasurementController, ENPlanWorkFormController, ENPlanWorkStateController,
  ENPlanWorkTypeController,ShowTKMaterials, RQPurchaseItemController;


var


  
{
  TKMaterialsHeaders: array [1..5] of String =
        ( 'Код'
          ,'Наименование '
          ,'Ед. изм.'
          ,'Цена'
          ,'Срок поставки'
        );
}
  TKMaterialsHeaders: array [1..8] of String =
        ( 'Код'
          ,'Назва'
          ,'Од. вим.'
          ,'Кіл-ть'
          ,'Ціна без ПДВ (індикативна)'
          ,'Вартість без ПДВ'
          ,'Строк постачання'
          ,'код строки плана закупівлі' // не чипати
        );
{
  ENPlanWorkHeaders: array [1..17] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          ,'Вид робіт'
          ,'Тип робіт'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  ENPlanWorkItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'Кільк. м-лу'
          ,'Джерело нормативу'
          ,'Кільк. робіт'
          ,'Норма часу на од.'
          ,'Всього часу'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );
}

  ENEstimateItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Інв. №'
          ,'Назва об`єкту'
          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'
          ,'код. б.тр.'
          ,'код АВЗ'
        );
                
procedure TfrmMaterialsParametersOutEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := 'typerefcode';
{
  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // А для ХОЭ (renCode = 0) выбираем все объекты
}

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
    frmENElementShow.isFiltered := true;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := elementName;
          ///
          //if elementCode > 0 then chbByObjects.Checked := false;
          //HideControls([chbByObjects], (elementCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmMaterialsParametersOutEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgetName;
              ///
              //if budgetCode > 0 then chbByBudgets.Checked := false;
              //HideControls([chbByBudgets], (budgetCode > 0));
              ///
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmMaterialsParametersOutEdit.FormShow(Sender: TObject);
begin
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);
  DisableControls([edtDepartment, edtENElementName, edtENBudgetName , edtMaterialName]);

  DisableControls([spbENElement, spbENElementClear
                   ,spbENBudget, spbENBudgetClear
                   ,spbDepartment, spbDepartmentClear
                   ]);

  SetFloatStyle([edtPlanCode]);

  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

  if (orderKind in [RQORDER_KIND_OE_PLANNED_SERVICES, RQORDER_KIND_OE_NOPLANNED_SERVICES]) then
  begin
    sgENEstimateItem.ColumnHeaders[1] := 'Послуга';
    HideControls([Label1, edtMaterialName, spbMaterialName, spbMaterialClear]);
  end;

  ///
  edtDepartment.Text:= departmentName;
  edtENBudgetName.Text := budgetName;

  edtMonthGen.ItemIndex := -1;

  if (materialsINCode <> LOW_INT) then
  begin
      //btnSelectClick(Sender);
    if materialsINName <> '' then
    begin
      edtMaterialName.Text := materialsINName;
      DisableControls([spbMaterialName, spbMaterialClear]);
    end;
  end;

  sgTKMaterials.Options :=  sgTKMaterials.Options - [goColMoving];
  sgENEstimateItem.Options :=  sgENEstimateItem.Options - [goColMoving];

end;

procedure TfrmMaterialsParametersOutEdit.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
end;

procedure TfrmMaterialsParametersOutEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
end;

function TfrmMaterialsParametersOutEdit.makeEstimateCondition(): String;
var
  str, conditionSQL, planCondition : String;

begin
    planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';

    if departmentCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.departmentrefcode = ' + IntToStr(departmentCode));
    end;

{
    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;
}
    if budgetCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.budgetrefcode = ' + IntToStr(budgetCode));
    end;

    //planFilter.kind := ENPlanWorkKind.Create;
    AddCondition(planCondition, 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT));


    try
      //planFilter.yearGen := StrToInt(edtYearGen.Text);
       AddCondition(planCondition, 'enplanwork.yeargen = ' + edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    end;


      //planFilter.monthGen := edtMonthGen.ItemIndex + 1;
      AddCondition(planCondition, 'enplanwork.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1));

    //condition := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';
{
    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;

    planFilter.conditionSQL := condition;


    AddCondition(conditionSQL, planFilter.conditionSQL);
}

    AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    // может условие по СТАТУСАМ !!!
    planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    AddCondition(conditionSQL, planCondition);

    Result := conditionSQL;
end;


procedure TfrmMaterialsParametersOutEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;

    ///
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    
    //planFilter: ENPlanWorkFilter;
    //planCodes: String;
    condition, msg : String;
    ENMaterialsList: ENMaterialsShortList;
    plan : ENPlanwork;
    department : ENDepartment;

begin
{
    for i := 1 to sgTKMaterials.RowCount - 1 do
      for j := 0 to sgTKMaterials.ColCount - 1 do
        sgTKMaterials.Cells[j, i] := '';

    sgTKMaterials.RowCount := 2;
}

    ////////////////////////////////////////////////////////////////////////////
    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planCodes := '';


    if (edtPlanCode.Text <> '') then
    begin
      planFilter.code := StrToInt(edtPlanCode.Text);

      //  31.05.2012 +++
      //  проверка подразделения и бюджетодержателя заявки с планом
      plan := DMReports.getPlanByCode(StrToInt(edtPlanCode.Text));

      if (plan.departmentRef.code <> LOW_INT) and (departmentCode > 0) then
      begin
        department := DMReports.getDepartmentByCode(plan.departmentRef.code);

        if (departmentCode <> plan.departmentRef.code) then
        begin
          msg := 'Не співпадає підрозділ у плані!!! ' + department.shortName + '.';
          Application.MessageBox(PChar(msg), PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;

      end;

      if (plan.budgetRef.code <> LOW_INT) and (budgetCode > 0) then
      begin
        department := DMReports.getDepartmentByCode(plan.budgetRef.code);

        if (budgetCode <> plan.budgetRef.code) then
        begin
          msg := 'Не співпадає бюджетотримач у плані!!! ' + department.shortName + '.';
          Application.MessageBox(PChar(msg), PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;

      end;

    end
    else
    begin

        try
          planFilter.yearGen := StrToInt(edtYearGen.Text);
        except
          on EConvertError do
          begin
            Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
            Exit;
          end;
        end;

        if edtMonthGen.ItemIndex = -1 then
        begin
          Application.MessageBox(PChar('Выберите месяц!'), PChar('Внимание!'), MB_ICONWARNING);
          Exit;
        end;

        planFilter.monthGen := edtMonthGen.ItemIndex + 1;
    end;

    if departmentCode > 0 then
    begin
      planFilter.departmentRef := ENDepartmentRef.Create;
      planFilter.departmentRef.code := departmentCode;
    end;


    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;

    if budgetCode > 0 then
    begin
      planFilter.budgetRef := ENDepartmentRef.Create;
      planFilter.budgetRef.code := budgetCode;
    end;

    planFilter.kind := ENPlanWorkKind.Create;

    planFilter.kind.code := ENPLANWORKKIND_CURRENT;

    planFilter.formRef :=  ENPlanWorkFormRef.Create;
    planFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;


    condition := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';

    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;

    /////
    if chbOnlyOtherPurchases.Checked then
    begin
       AddCondition(condition,
                    'enplanwork.elementrefcode in ' +
                    '(select enelement.code from enelement where enelement.typerefcode in (' +
                    IntToStr(EN_PURCHASES_OBJECT) + ', ' + IntToStr(EN_PURCHASES_NO_OBJECT) + '))');
    end;
    /////

    if orderKind = RQORDER_KIND_PRODUCTION then
    begin
      if planFilter.stateRef = nil then planFilter.stateRef := ENPlanWorkStateRef.Create();
      planFilter.stateRef.code := ENPLANWORKSTATE_PRODUCTION;
    end;

     if orderKind = RQORDER_KIND_OE_NOPLANNED_SERVICES then
    begin
      if planFilter.typeRef = nil then planFilter.typeRef := ENPlanWorkTypeRef.Create();
      if orderType = RQORDER_TYPE_INVEST then
      planFilter.typeRef.code := ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST
      else
      planFilter.typeRef.code := ENPLANWORKTYPE_SERVICES_FROM_SIDE;
    end;


    AddCondition(condition,
                 'enplanwork.statuscode not in (' +
                 IntToStr(ENPLANWORKSTATUS_CANCELED_) + ', ' +
                 IntToStr(ENPLANWORKSTATUS_OLDER) + ', ' +
                 IntToStr(ENPLANWORKSTATUS_WORKS_FINISHED) +
                 ')'
                );

    planFilter.conditionSQL := condition;

    UpdateMaterials_(planFilter);

end;

procedure TfrmMaterialsParametersOutEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmMaterialsParametersOutEdit.UpdateMaterials_(planFilter: ENPlanWorkFilter);
var i, j, LastCount: Integer;
    //TempTKMaterials: TKMaterialsControllerSoapPort;
    //TKMaterialsList: TKMaterialsShortList;
    //materialsFilter: TKMaterialsFilter;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENMaterialsList: ENMaterialsShortList;
begin
  if planFilter = nil then Exit;

  for i := 1 to sgTKMaterials.RowCount - 1 do
    for j := 0 to sgTKMaterials.ColCount - 1 do
      sgTKMaterials.Cells[j, i] := '';

  sgTKMaterials.RowCount := 2;

  //SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (orderKind = RQORDER_KIND_PRODUCTION) then
    ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, materialCode_)
  else
  if (orderKind = RQORDER_KIND_OE_NOPLANNED_SERVICES) then
    ENMaterialsList := TempENPlanWork.getServicesFromPlans(planFilter, materialsINCode)
  else
    ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, materialsINCode);

  if ENMaterialsList = nil then Exit;

  LastCount := High(ENMaterialsList.list);

  if LastCount > -1 then
    sgTKMaterials.RowCount := LastCount + 2
  else
    sgTKMaterials.RowCount := 2;


   with sgTKMaterials do
     for i := 0 to LastCount do
     begin
       Application.ProcessMessages;

       if ENMaterialsList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENMaterialsList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := ENMaterialsList.list[i].name;

       //AddCheckBox(1, i+1, false, false);

       Cells[2,i+1] := ENMaterialsList.list[i].measurementName;

       if ENMaterialsList.list[i].countFact = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := ENMaterialsList.list[i].countFact.DecimalString;

       if ENMaterialsList.list[i].cost = nil then
         Cells[4,i+1] := ''
       else
         Cells[4,i+1] := ENMaterialsList.list[i].cost.DecimalString;

       if ENMaterialsList.list[i].sumCost = nil then
         Cells[5,i+1] := ''
       else
         Cells[5,i+1] := ENMaterialsList.list[i].sumCost.DecimalString;

       if ENMaterialsList.list[i].deliveryDate = Low(Integer) then
         Cells[6,i+1] := ''
       else
         Cells[6,i+1] := IntToStr(ENMaterialsList.list[i].deliveryDate);

       if ENMaterialsList.list[i].purchaseItemRefCode = Low(Integer) then
         Cells[7,i+1] := ''
       else
         Cells[7,i+1] := IntToStr(ENMaterialsList.list[i].purchaseItemRefCode);


       sgTKMaterials.RowCount := i + 2;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   sgTKMaterials.Row := 1;

   sgTKMaterialsClick(sgTKMaterials);
   //sgENPlanWorkClick(sgENPlanWork);
end;



procedure TfrmMaterialsParametersOutEdit.updateEstimateItemGrid_();
var
  i, j : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  eFilter : ENEstimateItemFilter;
  pFilter : ENPlanWorkFilter;
  materialCode : Integer;
  conditionSQL, planCondition : String;

    condition, msg : String;

    plan : ENPlanwork;
    department : ENDepartment;

begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);

    

  try
    materialCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    pFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(pFilter);
    SetNullXSProps(pFilter);

    eFilter.materialRef := TKMaterialsRef.Create;
    eFilter.materialRef.code := materialCode;

    eFilter.kindRef := ENEstimateItemKindRef.Create;

    if orderKind = RQORDER_KIND_OE_NOPLANNED_SERVICES then
        eFilter.kindRef.code := ENESTIMATEITEMKIND_SERVICES
    else
    eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    eFilter.conditionSQL := 'ENESTIMATEITEM.statusrefcode  in ('+ IntToStr(ENESTIMATEITEMSTATUS_TMP_) + ', ' + IntToStr(ENESTIMATEITEMSTATUS_PLANNED) +') ';
    //planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';

    if departmentCode > 0 then
    begin
      //AddCondition(planCondition, 'enplanwork.departmentrefcode = ' + IntToStr(departmentCode));
      pFilter.departmentRef := ENDepartmentRef.Create;
      pFilter.departmentRef.code := departmentCode;
    end;



{
    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;
}
    if budgetCode > 0 then
    begin
      //AddCondition(planCondition, 'enplanwork.budgetrefcode = ' + IntToStr(budgetCode));
      pFilter.budgetRef := ENDepartmentRef.Create;
      pFilter.budgetRef.code := budgetCode;
    end;

    //planFilter.kind := ENPlanWorkKind.Create;
    // в самом запросе  AddCondition(planCondition, 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT));


    // 01.06.2012 +++
    // если ищем по коду плана месяц и год не берём
    if (edtPlanCode.Text = '') then
    begin
      try
        //planFilter.yearGen := StrToInt(edtYearGen.Text);
        // AddCondition(planCondition, 'enplanwork.yeargen = ' + edtYearGen.Text);
        pFilter.yearGen := StrToInt(edtYearGen.Text);
      except
        on EConvertError do
        begin
          Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
          Exit;
        end;
      end;

        //planFilter.monthGen := edtMonthGen.ItemIndex + 1;
        //AddCondition(planCondition, 'enplanwork.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1));
        pFilter.monthGen := edtMonthGen.ItemIndex + 1 ;
    end
    else begin
      //////////////////////////////////////////////////////////////////////////
      //  31.05.2012 +++
      //  проверка подразделения и бюджетодержателя заявки с планом
      plan := DMReports.getPlanByCode(StrToInt(edtPlanCode.Text));

      if (plan.departmentRef.code <> LOW_INT) and (departmentCode > 0) then
      begin
        department := DMReports.getDepartmentByCode(plan.departmentRef.code);

        if (departmentCode <> plan.departmentRef.code) then
        begin
          msg := 'Не співпадає підрозділ у плані!!! ' + department.shortName + '.';
          Application.MessageBox(PChar(msg), PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;

      end;

      if (plan.budgetRef.code <> LOW_INT) and (budgetCode > 0) then
      begin
        department := DMReports.getDepartmentByCode(plan.budgetRef.code);

        if (budgetCode <> plan.budgetRef.code) then
        begin
          msg := 'Не співпадає бюджетотримач у плані!!! ' + department.shortName + '.';
          Application.MessageBox(PChar(msg), PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;

      end;

      pFilter.code := StrToInt(edtPlanCode.Text);
      //////////////////////////////////////////////////////////////////////////
    end;

      // выбираем ТОЛЬКО не плановые !!!!
      pFilter.formRef := ENPlanWorkFormRef.Create;
      pFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;

      if orderKind = RQORDER_KIND_OE_NOPLANNED_SERVICES then
      begin
         pFilter.typeRef := ENPlanWorkTypeRef.Create;
         if orderType = RQORDER_TYPE_INVEST then
            pFilter.typeRef.code := ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST
         else
            pFilter.typeRef.code := ENPLANWORKTYPE_SERVICES_FROM_SIDE;
      end;


    // 24.09.2015 +++ планы отфильтровали раньше, а метериал опять весь......
    if (chbOnlyOtherPurchases.Checked) then
    begin
      pFilter.conditionSQL := 'enplanwork.elementrefcode in ' +
        '(select enelement.code from enelement where enelement.typerefcode in (' +
        IntToStr(EN_PURCHASES_OBJECT) + ', ' + IntToStr(EN_PURCHASES_NO_OBJECT) + '))';
    end;



    //condition := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';
{
    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;

    planFilter.conditionSQL := condition;


    AddCondition(conditionSQL, planFilter.conditionSQL);
}

    //AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    // может условие по СТАТУСАМ !!!
    //planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    //AddCondition(conditionSQL, planCondition);
//    ENESTIMATEITEMSTATUS_TMP = 0;
//ENESTIMATEITEMSTATUS_PLANED = 1;
    //AddCondition(conditionSQL, 'enestimateitem.statusrefcode in ('+ IntToStr(ENESTIMATEITEMSTATUS_TMP) +', ' + IntToStr(ENESTIMATEITEMSTATUS_PLANED) +') ');
    //eFilter.conditionSQL := conditionSQL;

    eFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    Application.ProcessMessages;

    ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, pFilter);



    //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

    if High(ENEstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         AddCheckBox(1, i+1, false, false);

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;
         {
         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;
         }

         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!
         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!
         
         Cells[3,i+1] := ENEstimateItemList.list[i].measureType;
         Cells[4,i+1] := ENEstimateItemList.list[i].invNumber ;
         Cells[5,i+1] := ENEstimateItemList.list[i].elementName ;

         Cells[6,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[7,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[8,i+1] := ENEstimateItemList.list[i].planType;
         Cells[9,i+1] := ENEstimateItemList.list[i].planState;

         // для определения ДДС кода  (пополнение аварийного запаса)
         if ENEstimateItemList.list[i].budgetRefCode <> Low(Integer) then
           Cells[10,i+1] := IntToStr(ENEstimateItemList.list[i].budgetRefCode)
         else
           Cells[10,i+1] := '';

         if ENEstimateItemList.list[i].ddsCodeAvz <> Low(Integer) then
           Cells[11,i+1] := IntToStr(ENEstimateItemList.list[i].ddsCodeAvz)
         else
           Cells[11,i+1] := '';


         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;

end;


procedure TfrmMaterialsParametersOutEdit.sgTKMaterialsClick(Sender: TObject);
var
  i, j : integer;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);
end;



procedure TfrmMaterialsParametersOutEdit.sgTKMaterialsColumnMove(
  Sender: TObject; ACol: Integer; var Allow: Boolean);
begin
  inherited;
    Exit;
end;

procedure TfrmMaterialsParametersOutEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  //TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  //ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  //ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;

  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...


     if departmentCode <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := departmentCode;  // ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;


// пока подразделения - это РЭС ... надо Подразделение !!!

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               edtMolName.Text := GetReturnValue(sgFINMol,0) + ' ' +GetReturnValue(sgFINMol,1); //ENMOL2PlanWorkObj.molName;
               MOLCode := GetReturnValue(sgFINMol,0);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmMaterialsParametersOutEdit.spbDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);


   f.code := 1;
{
   if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > LOW_INT then
         if ENPlanWorkObj.renRef <> nil then
            /// Если код РЭСа > 0 (т.е. это не ХОЭ), то фильтруем подразделения по РЭСу,
            /// иначе выводим все
            //if ENPlanWorkObj.renRef.code > low(Integer) then
            // можно переделать из ДМРепорта ...
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
               //if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               //ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentName := ENDepartmentShort(tvDep.Selected.Data).shortName;
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

procedure TfrmMaterialsParametersOutEdit.FormCreate(Sender: TObject);
begin
  inherited;
  MOLCode := '';
  materialsINName := '';
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  budgetCode := LOW_INT;
  materialsINCode := LOW_INT;
  orderKind := LOW_INT;
  materialCode_ := LOW_INT;

end;

procedure TfrmMaterialsParametersOutEdit.btnAddMaterialsClick(
  Sender: TObject);
var
   TempRQOrderItem: RQOrderItemControllerSoapPort;
   obj : RQOrderItem;
   i, n, materialCode : Integer;
   //eList : ENEstimateItemShortList;
   eArr :  ArrayOfENEstimateItemShort;
   eObj :  ENEstimateItemShort;
   state : boolean;
begin
   try
     materialCode := StrToInt(sgTKMaterials.Cells[0, sgTKMaterials.Row]);
   except
     on EConvertError do Exit;
   end;

   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   obj := RQOrderItem.Create;
   SetNullIntProps(obj);
   SetNullXSProps(obj);

   obj.orderRef := RQOrderRef.Create;
   obj.orderRef.code := orderCode;

   obj.material := TKMaterials.Create;
   if materialsINCode = LOW_INT then
      //obj.material.code := strToInt( sgTKMaterials.Cells[0, sgTKMaterials.Row] )
      obj.material.code := materialCode
   else
      obj.material.code := materialsINCode;

   obj.purchaseItemRef := RQPurchaseItemRef.Create;
   if ( sgTKMaterials.Cells[7, sgTKMaterials.Row]  <> '' ) then
    obj.purchaseItemRef.code := strToInt( sgTKMaterials.Cells[7, sgTKMaterials.Row] )
   else
    obj.purchaseItemRef.code :=LOW_INT;



  n := 0;
  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       n := n + 1;
    end;
  end;

  //eList :=  ENEstimateItemShortList.Create;
  //eList.totalCount := 0;
  SetLength(eArr, n);
  n := 0;
  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       eObj := ENEstimateItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       if sgENEstimateItem.Cells[12, i] <> '' then
       eObj.purchaseItemRefCode :=  StrToInt( sgENEstimateItem.Cells[12, i] );
       eObj.code :=  StrToInt( sgENEstimateItem.Cells[0, i] ); // запишим код строки плана закупки , если естимейт в плане закупок находится
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgENEstimateItem.Cells[2, i];

       eObj.budgetRefCode := StrToInt(sgENEstimateItem.Cells[10, i]);

       try
         eObj.ddsCodeAvz := StrToInt(sgENEstimateItem.Cells[11, i]);
       except
         on EConvertError do;
       end;

       //eList.list[n] := ;
       eArr[n] := eObj;
       n := n + 1;
    end;
  end;
  //eList.list := eArr;
  if (High(eArr) >= 0) then
    TempRQOrderItem.addWithEstimateList(obj, eArr)
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  
  //materialsINCode := obj.material.code;
  materialsINCode := LOW_INT;
  
  btnSelectClick(Sender);
  
  //FormShow(Sender);
  //Close;

{
  n := 0;
  for i := 1 to sgTKMaterials.RowCount - 1 do
  begin
    sgTKMaterials.GetCheckBoxState(1, i, state);
    if state then
    begin
       n := n + 1;
    end;
  end;

  eList :=  ENEstimateItemShortList.Create;
  eList.totalCount := 0;
  SetLength(eArr, n);
  n := 0;
  for i := 1 to sgTKMaterials.RowCount - 1 do
  begin
    sgTKMaterials.GetCheckBoxState(1, i, state);
    //if state then
    begin
       //n := n + 1;
       eObj := ENEstimateItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       eObj.code :=  sgENEstimateItem.Cells[0, sgENEstimateItem.row];
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgENEstimateItem.Cells[3, sgENEstimateItem.row]
       //eList.list[n] := ;
       eArr[i] := eObj;
       //n := n + 1;
    end;
  end;
  eList.list := eArr;
  TempRQOrderItem.addWithEstimateList( ,eList);
}
end;


procedure TfrmMaterialsParametersOutEdit.sgTKMaterialsDblClick(
  Sender: TObject);
var materialCode: Integer;
    oldPlanCondition, planCondition, materialCondition: String;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;
    state : boolean;
begin
  if materialsINCode = LOW_INT then
  begin
    try
      materialCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
    except
      on EConvertError do
      begin
        for i := 1 to sgENEstimateItem.RowCount - 1 do
          for j := 0 to sgENEstimateItem.ColCount - 1 do
            sgENEstimateItem.Cells[j, i] := '';
        sgENEstimateItem.RowCount := 2;
        sgENEstimateItem.RemoveCheckBox(1, 1);
        Exit;
      end;
    end;
  end;

  updateEstimateItemGrid_();
end;

procedure TfrmMaterialsParametersOutEdit.spbMaterialNameClick(
  Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  {
  mtFilter := TKMaterialsFilter.Create;
  SetNullIntProps(mtFilter);
  SetNullXSProps(mtFilter);

  mtFilter.conditionSQL := 'parentrefcode is null';
  mtFilter.orderBySQL := ' tk1.name'; // в ДАО в запросе пробит алиас tk1 !!!
  }
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
          //*** if ENEstimateItemObj.materialRef = nil then ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
          //*** ENEstimateItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
          materialCode_ := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
          //lblMeasurement.Caption := {'од.виміру : '+ }TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
          //lblDeliveryDate.Caption := {'строк постачання : '+ } IntToStr(TKMaterialsShort(tvDep.Selected.Data).deliveryDate){ + ' днів'}; //GetReturnValue(sgSpr_matherial, 2);
          ClearGrid(sgTKMaterials);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmMaterialsParametersOutEdit.spbMaterialClearClick(
  Sender: TObject);
begin
  edtMaterialName.Text := '';

  materialCode_ := LOW_INT;
  
  ClearGrid(sgTKMaterials);
end;

procedure TfrmMaterialsParametersOutEdit.edtPlanCodeChange(
  Sender: TObject);
begin
  inherited;

  if (edtPlanCode.Text <> '') then
    DisableControls([edtYearGen, edtMonthGen])
  else
    DisableControls([edtYearGen, edtMonthGen], False);
end;

end.
