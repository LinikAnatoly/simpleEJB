unit EditMaterialsRQFKOrderOSExpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ExtCtrls, StdCtrls, Buttons, Grids, BaseGrid,
  AdvGrid, InvokeRegistry, Rio, SOAPHTTPClient, ENPlanWorkController,
  ActnList, Menus, AdvObj;

type
  TfrmMaterialsRQFKOrderOSExplEdit = class(TDialogForm)
    pnlOS: TPanel;
    pnlPlanFilter: TPanel;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblENBudgetName: TLabel;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    edtENElementName: TEdit;
    edtENBudgetName: TEdit;
    btnSelect: TBitBtn;
    edtDepartment: TEdit;
    btnAddMaterials: TBitBtn;
    chbIsMaster: TCheckBox;
    Splitter2: TSplitter;
    pnlPlans: TPanel;
    sgTKMaterials: TAdvStringGrid;
    Panel5: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    Splitter3: TSplitter;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Panel6: TPanel;
    gbENFINMaterials: TGroupBox;
    Label7: TLabel;
    sgENFINMaterials: TAdvStringGrid;
    pnlLegend: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    gbOS: TGroupBox;
    lblInvNumber: TLabel;
    lblBuhName: TLabel;
    edtInvNumber: TEdit;
    edtBuhName: TEdit;
    sgOSTable: TAdvStringGrid;
    btnFind: TButton;
    HTTPRIOOSTable: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    Label6: TLabel;
    HTTPRIORQFKOrderItem: THTTPRIO;
    pmENEstimateItem: TPopupMenu;
    ActionList1: TActionList;
    actViewPlan: TAction;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure sgTKMaterialsDblClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sgENEstimateItemDblClick(Sender: TObject);
    procedure sgOSTableClick(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
  private
    { Private declarations }
    planFilter: ENPlanWorkFilter;

    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    // planCodes: String;

    procedure updateOSGrid();
    procedure UpdateMaterials(planFilter: ENPlanWorkFilter; mCondition: String);
    procedure UpdateEstimateItemGrid();
    procedure SearchEstimateItem();
    procedure ShowHidePlansFilter(show: Boolean = true);
  public
    { Public declarations }
    departmentCode : Integer;
    departmentName : String;

    rqFKOrderCode: Integer;    
    rqFKOrderKind: Integer;
    MOLCode: String; 
    masterMOLCode: String;
  end;

var
  frmMaterialsRQFKOrderOSExplEdit: TfrmMaterialsRQFKOrderOSExplEdit;

implementation

uses OSTableController, ChildFormUnit, GridHeadersUnit,
  ENConsts, ENDepartmentController, ENPlanWorkKindController,
  ENElementController, ENEstimateItemController, TKMaterialsController,
  ENEstimateItemKindController, ShowENDepartment, ShowENElement,
  ENDepartmentTypeController, RQFKOrderItemController, EditENPlanWork;

{$R *.dfm}

var
  OStableHeaders: array [1..8] of String =
        ( 'Код'
          ,'Найменування'
          ,'Інв. номер'
          ,'Бал. рахунок'
          ,'Дата приходу'
          ,'МВО'
          ,'Код підрозділу'
          ,'Код витрат'
        );

  TKMaterialsHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва'
          ,'Од. вим.'
          ,'Кіл-ть'
          ,'Ціна без ПДВ (індикативна)'
          ,'Вартість без ПДВ'
          ,'Строк постачання'
        );

  ENEstimateItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Дата поч.робіт'
          ,'Підрозділ'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'

          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );


procedure TfrmMaterialsRQFKOrderOSExplEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtDepartment, edtENElementName, edtENBudgetName{, edtFINMol}]);
{
  DisableControls([spbENElement, spbENElementClear
                   ,spbENBudget, spbENBudgetClear
                   ,spbDepartment, spbDepartmentClear
                   ]);
}
  SetGridHeaders(OStableHeaders, sgOStable.ColumnHeaders);
  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  //SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);
  //SetGridHeaders(ENFINMaterialsHeaders, sgENFINMaterials.ColumnHeaders);
  ///
  edtDepartment.Text:= departmentName;
  edtENBudgetName.Text := budgetName;

  edtMonthGen.ItemIndex := -1;

  /////
  HideControls([gbENFINMaterials, Splitter3]);
  Panel3.Align := alClient;

  {
  HideControls([pnlPlanFilter]);
  DisableControls([btnSelect]);

  HideControls([pnlPlans]);
  }
  ShowHidePlansFilter(false);
  /////
  
  if rqFKOrderKind = RQFKORDER_KIND_OS_EXPL then
    Self.Caption := 'Введення в експлуатацію ОЗ';

  if rqFKOrderKind = RQFKORDER_KIND_OS_MOVEMENT then
    Self.Caption := 'Внутрішнє переміщення ОЗ';
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.updateOSGrid();
var f: OSTableFilter;
    TempOSTable: OSTableControllerSoapPort;
    OSTableList: OSTableShortList;
    i, LastCount: Integer;
    condition: String;
begin
  ClearGrid(sgOStable);

  if MOLCode = '' then
    raise Exception.Create('Не вказано МВО!');

  TempOSTable := HTTPRIOOSTable as OSTableControllerSoapPort;

  f := OStableFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if edtInvNumber.Text <> '' then
    f.kod_inv := edtInvNumber.Text;

  if edtBuhName.Text <> '' then
    f.str_name := edtBuhName.Text;

  f.kod_mol := MOLCode;

  /////
  //f.conditionSQL := 'OSTABLE.SHOW_ = ''Y'' and OSTABLE.kod_subsch_b like ''15%'' and nvl(OSTABLE.energy_lock, 0) <= 0';
  condition := 'OSTABLE.SHOW_ = ''Y'' and nvl(OSTABLE.energy_lock, 0) <= 0';

  if rqFKOrderKind = RQFKORDER_KIND_OS_EXPL then
    AddCondition(condition, 'OSTABLE.kod_subsch_b like ''15%''');

  f.conditionSQL := condition;
  /////

  f.orderBySQL := 'OSTABLE.STR_NAME';

  OSTableList := TempOStable.getScrollableFilteredList(f, 0, -1);

  LastCount := High(OSTableList.list);

  if LastCount > -1 then
    sgOStable.RowCount := LastCount + 2
  else
    sgOStable.RowCount := 2;

  with sgOStable do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;
      if OStableList.list[i].num_un <> Low(Integer) then
        Cells[0,i+1] := IntToStr(OStableList.list[i].num_un)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := OStableList.list[i].str_name;
      Cells[2,i+1] := OStableList.list[i].kod_inv;
      Cells[3,i+1] := OStableList.list[i].bal_sch;
      if OStableList.list[i].dt_doc = nil then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := XSDate2String(OStableList.list[i].dt_doc);
      Cells[5,i+1] := OStableList.list[i].kod_mol;
      Cells[6,i+1] := OStableList.list[i].kod_podr;
      Cells[7,i+1] := OStableList.list[i].kod_zatr;
      //LastRow:=i+1;
      sgOStable.RowCount := i + 2; //LastRow+1;
    end;

 sgOStable.Row:=1;
 sgOSTableClick(Self);
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.btnFindClick(Sender: TObject);
begin
  updateOSGrid();
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.FormCreate(Sender: TObject);
begin
  MOLCode := '';
  masterMOLCode := '';
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  budgetCode := LOW_INT;
  //materialsINCode := LOW_INT;

  rqFKOrderCode := LOW_INT;
  rqFKOrderKind := LOW_INT;
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.UpdateMaterials(
  planFilter: ENPlanWorkFilter; mCondition: String);
var i, j, LastCount: Integer;
    //TempTKMaterials: TKMaterialsControllerSoapPort;
    //TKMaterialsList: TKMaterialsShortList;
    //materialsFilter: TKMaterialsFilter;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENMaterialsList: ENMaterialsShortList;
begin
  if planFilter = nil then Exit;

  ClearGrid(sgTKMaterials);
  ClearGrid(sgENEstimateItem);

  //SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  //ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, mCondition, materialsINCode);
  ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, mCondition, LOW_INT);
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

       sgTKMaterials.RowCount := i + 2;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   sgTKMaterials.Row := 1;

   // sgTKMaterialsClick(sgTKMaterials);

   {
   if rgSearch.ItemIndex = 1 then
   begin
      sgTKMaterialsDblClick(sgTKMaterials);
   end;
   }


   //sgENPlanWorkClick(sgENPlanWork);
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    //TempTKMaterials: TKMaterialsControllerSoapPort;
    //TKMaterialsList: TKMaterialsShortList;
    //materialsFilter: TKMaterialsFilter;

    ///
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    
    //planFilter: ENPlanWorkFilter;
    //planCodes: String;
    condition, mCondition, invNum: String;
    //ENMaterialsList: ENMaterialsShortList;

    TempENDepartment: ENDepartmentControllerSoapPort;
    depCodes : String;

    code : Integer;
begin
  ClearGrids([sgTKMaterials, sgENEstimateItem]);
  
  invNum := sgOSTable.Cells[2, sgOSTable.Row];

  if invNum = '' then
  begin
    Application.MessageBox(PChar('Спочатку оберіть Основний Засіб!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

    ////////////////////////////////////////////////////////////////////////////
    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    //planCodes := '';

    planFilter.kind := ENPlanWorkKind.Create;

    planFilter.kind.code := ENPLANWORKKIND_CURRENT;

    AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');

   if budgetCode <= 0 then
   begin
       ShowMessage('Виберіть Бюджетотримача ...');
       Exit;
   end;

   if departmentCode <= 0 then
   begin
      if Application.MessageBox(PChar('Не обраний Підрозділ ... УВАЖНО обирайте матеріали на планах !!!  Продовжити ??'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;
   end;


    if departmentCode > 0 then
    begin
      //planFilter.departmentRef := ENDepartmentRef.Create;
      //planFilter.departmentRef.code := departmentCode;

      TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      depCodes := TempENDepartment.getDepartmentCodesDown(departmentCode);
      AddCondition(condition, 'departmentrefcode in (' + depCodes + ')');
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

       
    //planFilter.formRef :=  ENPlanWorkFormRef.Create;
    //planFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;

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

    AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');

    if chbIsMaster.Checked then
    begin
      AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ masterMOLCode+''')');
    end;

    mCondition := ' and ei.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_MATERIALS);

    planFilter.conditionSQL := condition;

    UpdateMaterials(planFilter, mCondition);

end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.UpdateEstimateItemGrid;
var
  i, j , code : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  eFilter : ENEstimateItemFilter;
  //pFilter : ENPlanWorkFilter;
  materialCode : Integer;
  conditionSQL, planCondition , eCondition : String;
begin
  ClearGrid(sgENEstimateItem);


  eCondition := '';

  try
    materialCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    //pFilter := ENPlanWorkFilter.Create;
    //SetNullIntProps(pFilter);
    //SetNullXSProps(pFilter);

    eFilter.materialRef := TKMaterialsRef.Create;
    eFilter.materialRef.code := materialCode;

    eFilter.kindRef := ENEstimateItemKindRef.Create;
    eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    
    if  ( Length(eCondition) > 0 ) then eFilter.conditionSQL := eCondition;

    eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    Application.ProcessMessages;
    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!
    ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, planFilter);



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

         //AddCheckBox(1, i+1, false, false);

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].planRefCode);

         {
         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;
         }

         // ПОЛЕ не двигать ... !!! выгребаются данные из колонки !!!!
         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
         // ПОЛЕ не двигать ... !!! выгребаются данные из колонки !!!!

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

         //Cells[9,i+1] := ENEstimateItemList.list[i].typeRefName;



        // Cells[8,i+1] := ENEstimateItemList.list[i].userGen;



        { if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[9,i+1] := ''
         else
           Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);
         }
         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;

     //sgENEstimateItemClick(nil);

end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.sgTKMaterialsDblClick(
  Sender: TObject);
begin
  UpdateEstimateItemGrid;
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.spbDepartmentClick(
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

procedure TfrmMaterialsRQFKOrderOSExplEdit.spbENElementClick(
  Sender: TObject);
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

procedure TfrmMaterialsRQFKOrderOSExplEdit.spbENBudgetClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   //cfoCode : Integer;
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

        {
        cfoCode := DMReports.getCFOByBudgetCode(budgetCode);
        if cfoCode > LOW_INT then
          edtCFO.Text := IntToStr(cfoCode);
        }
               //clearGrids();
               ClearGrids([sgTKMaterials, sgENEstimateItem, {sgFINMaterials, } sgENFINMaterials]);
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

procedure TfrmMaterialsRQFKOrderOSExplEdit.spbDepartmentClearClick(
  Sender: TObject);
begin
  inherited;
      if Application.MessageBox(PChar('Після очистки Підрозділу будуть вибиратися плани усіх Підрозділів ОЕ !!!  Продовжити ??'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;

               departmentCode := LOW_INT; //ENDepartmentShort(tvDep.Selected.Data).code;
               departmentName := ''; //ENDepartmentShort(tvDep.Selected.Data).shortName;
               edtDepartment.Text:= ''; //ENDepartmentShort(tvDep.Selected.Data).shortName;

end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  //clearGrids();
  ClearGrids([sgTKMaterials, sgENEstimateItem, {sgFINMaterials, }sgENFINMaterials]);
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.sgENEstimateItemDblClick(
  Sender: TObject);
var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
    fkOrderItem: RQFKOrderItem;
    num_un, estimateCode: Integer;
    str_name, kod_inv, bal_sch: String;
begin
  if rqFKOrderCode = LOW_INT then
    raise Exception.Create('Помилка при отриманні коду ордера!');

  try
    num_un := StrToInt(sgOSTable.Cells[0, sgOSTable.Row]);
  except
    on EConvertError do
    begin
      Application.MessageBox(PChar('Спочатку оберіть Основний Засіб!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  try
    estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
  except
    on EConvertError do
    begin
      Application.MessageBox(PChar('Спочатку оберіть матеріал на плані!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  if Application.MessageBox(PChar('Додати строку в документ ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  str_name := sgOSTable.Cells[1, sgOSTable.Row];
  kod_inv := sgOSTable.Cells[2, sgOSTable.Row];
  bal_sch := sgOSTable.Cells[3, sgOSTable.Row];
  //kod_zatr := sgOSTable.Cells[7, sgOSTable.Row];

  fkOrderItem := RQFKOrderItem.Create;
  SetNullIntProps(fkOrderItem);
  SetNullXSProps(fkOrderItem);

  fkOrderItem.nomenclatureCode := num_un;
  fkOrderItem.nomenclatureName := str_name;
  fkOrderItem.nomenclatureNum := kod_inv;
  fkOrderItem.nomenclatureBalSch := bal_sch;

  {
  ShowMessage('num_un: ' + IntToStr(num_un) + #13#10 +
              'str_name: ' + str_name + #13#10 +
              'kod_inv: ' + kod_inv + #13#10 +
              'bal_sch: ' + bal_sch + #13#10 +
              'estimateCode: ' + IntToStr(estimateCode) + #13#10 +
              'rqFKOrderCode: ' + IntToStr(rqFKOrderCode));
  }
  
  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  if rqFKOrderKind = RQFKORDER_KIND_OS_EXPL then
    TempRQFKOrderItem.addOSExpl(fkOrderItem, estimateCode, rqFKOrderCode)
  else
  if rqFKOrderKind in [RQFKORDER_KIND_OS_MOVEMENT, RQFKORDER_KIND_RASHOD_OE2OUT] then
    TempRQFKOrderItem.addOSMovement(fkOrderItem, estimateCode, rqFKOrderCode)
  else
    raise Exception.Create('NET-2689 Невідомий тип ордеру!');

  Application.MessageBox(PChar('Строку додано в документ (осн. засіб з інв. № ' + kod_inv + ')!'),
                         PChar('Інформація'), MB_ICONINFORMATION);
  updateOSGrid();
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.SearchEstimateItem();
var i, j, n, LastCount: Integer;
    invNum: String;

    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eFilter: ENEstimateItemFilter;
begin
  ClearGrids([sgTKMaterials, sgENEstimateItem]);

  invNum := sgOSTable.Cells[2, sgOSTable.Row];

  if invNum = '' then
  begin
    // Application.MessageBox(PChar('Спочатку оберіть Основний Засіб!'), PChar('Увага!'), MB_ICONWARNING);

    {
    /////
    HideControls([pnlPlanFilter]);
    DisableControls([btnSelect]);

    HideControls([pnlPlans]);
    /////
    }
    ShowHidePlansFilter(false);

    Exit;
  end;

  eFilter := ENEstimateItemFilter.Create;
  SetNullIntProps(eFilter);
  SetNullXSProps(eFilter);

  //planCodes := '';
  eFilter.kindRef := ENEstimateItemKindRef.Create;
  eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

  eFilter.conditionSQL := 'code in ( ' +
      'select ie.estimateitemcode ' +
      'from rqfkorderitem2osdata od, rqfkorderitem2enstmttm ie, ' +
      '     rqfkorderitem oi, rqfkorder o ' +
      'where od.fkorderitemrefcode = ie.fkorderitemrefcode ' +
      '  and ie.fkorderitemrefcode = oi.code ' +
      '  and oi.fkorderrefcode = o.code ' +
      '  and o.kindcode = ' + IntToStr(RQFKORDER_KIND_PRIHOD_POSTAVKA) +
      '  and od.kod_inv = ''' + invNum + ''')';

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);
  ENEstimateItemList := TempENEstimateItem.getShortListForOSExpl(eFilter, 0, -1);

  if High(ENEstimateItemList.list) > -1 then
  begin
    {
    HideControls([pnlPlanFilter]);
    DisableControls([btnSelect]);

    HideControls([pnlPlans]);
    //Panel3.Align := alClient;
    }
    ShowHidePlansFilter(false);
    
    sgENEstimateItem.RowCount := High(ENEstimateItemList.list) + 2;
  end
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

       //AddCheckBox(1, i+1, false, false);

       Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

       Objects[1,i+1] := TObject(ENEstimateItemList.list[i].planRefCode);

       // ПОЛЕ не двигать ... !!! выгребаются данные из колонки !!!!
       if ENEstimateItemList.list[i].countFact = nil then
         Cells[2,i+1] := ''
       else
         Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
       // ПОЛЕ не двигать ... !!! выгребаются данные из колонки !!!!

       Cells[3,i+1] := ENEstimateItemList.list[i].measureType;

       if ENEstimateItemList.list[i].planRefDateStart = nil then
         Cells[4,i+1] := ''
       else
         Cells[4,i+1] := XSDate2String(ENEstimateItemList.list[i].planRefDateStart);

       Cells[5, i+1] := ENEstimateItemList.list[i].planRefDepartmentName;

       Cells[6,i+1] := ENEstimateItemList.list[i].invNumber;
       Cells[7,i+1] := ENEstimateItemList.list[i].elementName;

       Cells[8,i+1] := ENEstimateItemList.list[i].kartaNum;
       Cells[9,i+1] := ENEstimateItemList.list[i].kartaRefName;

       Cells[10,i+1] := ENEstimateItemList.list[i].planType;
       Cells[11,i+1] := ENEstimateItemList.list[i].planState;

       sgENEstimateItem.RowCount := i + 2;
     end;

   sgENEstimateItem.Row := 1;

  if High(ENEstimateItemList.list) = -1 then
  begin
    {
    HideControls([pnlPlanFilter], false);
    DisableControls([btnSelect], false);

    //Panel3.Align := alTop;
    HideControls([pnlPlans], false);
    }
    ShowHidePlansFilter(true);
  end;
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.sgOSTableClick(Sender: TObject);
begin
  SearchEstimateItem();
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.actViewPlanExecute(
  Sender: TObject);
var planCode: Integer;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  planCode := Integer(sgENEstimateItem.Objects[1, sgENEstimateItem.Row]);

  if planCode <= 0 then
  begin
    Application.MessageBox(PChar('План не знайдено!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);
    frmENPlanWorkEdit.ShowModal;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmMaterialsRQFKOrderOSExplEdit.ShowHidePlansFilter(
  show: Boolean);
begin
  if not show then
  begin
    /////
    HideControls([pnlPlanFilter]);
    DisableControls([btnSelect]);

    HideControls([pnlPlans]);
    /////
  end
  else begin
    HideControls([pnlPlanFilter], false);
    DisableControls([btnSelect], false);

    HideControls([pnlPlans], false);
  end;
end;

end.
