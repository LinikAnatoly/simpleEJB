unit EditMaterialsForRQOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ENPlanWorkController, AdvObj;

type
  TfrmMaterialsForRQOrderEdit = class(TDialogForm)
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Panel6: TPanel;
    Panel2: TPanel;
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
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    edtTotalCount: TEdit;
    edtInOrder: TEdit;
    edtRest: TEdit;
    btnAutoAllocateMaterialCount: TButton;
    btnAddMaterials: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    edtMaterialName: TEdit;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIORQOrderItem: THTTPRIO;
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSelectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAutoAllocateMaterialCountClick(Sender: TObject);
    procedure edtTotalCountChange(Sender: TObject);
    procedure sgENEstimateItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btnAddMaterialsClick(Sender: TObject);
  private
    { Private declarations }
    departmentCode: Integer;
    elementCode: Integer;

    //eFilter: ENEstimateItemFilter;
    planFilter: ENPlanWorkFilter;

    procedure UpdateEstimateItemGrid();
    procedure AutoAllocateMaterialCount();
    function GetCheckedMaterialsCount(): Double;
  public
    { Public declarations }
    materialCode: Integer;
    budgetCode: Integer;
    //orderCode: Integer;
    orderItemCode: Integer;
    finDocID: Integer;
  end;

var
  frmMaterialsForRQOrderEdit: TfrmMaterialsForRQOrderEdit;

implementation

uses ShowENDepartment, ShowENElement, ENDepartmentController,
  ENElementController, ChildFormUnit, ENConsts, ENDepartmentTypeController,
  GridHeadersUnit, ENEstimateItemController, ENPlanWorkKindController,
  ENPlanWorkFormController, TKMaterialsController,
  ENEstimateItemKindController, ENEstimateItemStatusController,
  XSBuiltIns, RQOrderItemController;

{$R *.dfm}

var
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

procedure TfrmMaterialsForRQOrderEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application, fmNormal, f);
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
               //departmentName := ENDepartmentShort(tvDep.Selected.Data).shortName;
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

procedure TfrmMaterialsForRQOrderEdit.spbDepartmentClearClick(
  Sender: TObject);
begin
  edtDepartment.Text := '';
  departmentCode := LOW_INT;
end;

procedure TfrmMaterialsForRQOrderEdit.spbENElementClick(Sender: TObject);
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

  frmENElementShow:=TfrmENElementShow.Create(Application, fmNormal, f);
  try
    frmENElementShow.isFiltered := true;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          //elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := GetReturnValue(sgENElement,1); //elementName;
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

procedure TfrmMaterialsForRQOrderEdit.spbENElementClearClick(
  Sender: TObject);
begin
  edtENElementName.Text := '';
  elementCode := LOW_INT;
end;

procedure TfrmMaterialsForRQOrderEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   EXIT; // БЮДЖЕТОДЕРЖАТЕЛЬ БУДЕТ ПОДСТАВЛЯТЬСЯ СТАТИЧЕСКИ - ИЗ СТРОКИ ЗАЯВКИ!!!

   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              //budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName; //budgetName;
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

procedure TfrmMaterialsForRQOrderEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  EXIT; // БЮДЖЕТОДЕРЖАТЕЛЬ БУДЕТ ПОДСТАВЛЯТЬСЯ СТАТИЧЕСКИ - ИЗ СТРОКИ ЗАЯВКИ!!!
  edtENBudgetName.Text := '';
  budgetCode := LOW_INT;
end;

procedure TfrmMaterialsForRQOrderEdit.FormCreate(Sender: TObject);
begin
  orderItemCode := LOW_INT;
  materialCode := LOW_INT;
  finDocID := LOW_INT;
  planFilter := nil;
  
  spbDepartmentClearClick(Sender);
  spbENElementClearClick(Sender);
  spbENBudgetClearClick(Sender);
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
end;

procedure TfrmMaterialsForRQOrderEdit.FormShow(Sender: TObject);
var TempENDepartment: ENDepartmentControllerSoapPort;
    depObj: ENDepartment;
begin
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetFloatStyle([edtTotalCount, edtInOrder, edtRest]);

  DisableControls([edtMaterialName, edtDepartment, edtENElementName, edtENBudgetName,
                   edtRest, edtInOrder]);

  if (DialogState = dsEdit) or (DialogState = dsInsert) then
  begin
    DenyBlankValues([edtTotalCount]);
  end;

  if budgetCode > LOW_INT then
  begin
    TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    depObj := TempENDepartment.getObject(budgetCode);
    if depObj <> nil then
      edtENBudgetName.Text := depObj.shortName;
  end;
end;

procedure TfrmMaterialsForRQOrderEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmMaterialsForRQOrderEdit.UpdateEstimateItemGrid;
var i, j, n, LastCount: Integer;

    ///
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    
    //planFilter: ENPlanWorkFilter;
    //planCodes: String;
    condition , mCondition: String;
    // ENMaterialsList: ENMaterialsShortList;

    TempENDepartment: ENDepartmentControllerSoapPort;
    depCodes : String;

    code : Integer;

    ////
    //i, j , code : Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eFilter : ENEstimateItemFilter;
    //pFilter : ENPlanWorkFilter;
    //materialCode : Integer;
    conditionSQL, planCondition , eCondition : String;
    ////
begin
  if materialCode < 0 then
  begin
    Application.MessageBox(PChar('Оберіть матеріал!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtMaterialName.SetFocus;
    Exit;
  end;

  ClearGrid(sgENEstimateItem);


    ////////////////////////////////////////////////////////////////////////////
    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    //planCodes := '';


    planFilter.kind := ENPlanWorkKind.Create;

    planFilter.kind.code := ENPLANWORKKIND_CURRENT;

    AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');


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

    planFilter.formRef := ENPlanWorkFormRef.Create;
    planFilter.formRef.code := ENPLANWORKFORM_PLANNED;

    try
      planFilter.yearGen := StrToInt(edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    end;


    //if edtMonthGen.ItemIndex = -1 then
    if edtMonthGen.ItemIndex <= 0 then
    begin
      //Application.MessageBox(PChar('Выберите месяц!'), PChar('Внимание!'), MB_ICONWARNING);
      //Exit;
    end
    else
      planFilter.monthGen := edtMonthGen.ItemIndex; //+ 1;

    //AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');
    AddCondition(condition, ' (statuscode not in (' +
                               IntToStr(ENPLANWORKSTATUS_CANCELED_) + ', ' +
                               IntToStr(ENPLANWORKSTATUS_OLDER) + ', ' +
                               IntToStr(ENPLANWORKSTATUS_WORKS_FINISHED) + ', ' +
                               IntToStr(ENPLANWORKSTATUS_UNUSED) + 
                            '))');


    planFilter.conditionSQL := condition;

   // UpdateMaterials_(planFilter, mCondition);



   ////// ESTIMATE'ы ///////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////////////
   eCondition := '';

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

    eFilter.statusRef := ENEstimateItemStatusRef.Create;
    eFilter.statusRef.code := ENESTIMATEITEMSTATUS_PLANNED;

    if finDocID > 0 then
      eCondition := 'enestimateitem.countfact > 0 and ' +
                    'enestimateitem.code not in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct' +
                                                ' where coalesce(enestimateitem2contrct.findocid, -1) <> ' + IntToStr(finDocID) + ')'
    else
      eCondition := 'enestimateitem.countfact > 0 and ' +
                    'enestimateitem.code not in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct)';

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

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         AddCheckBox(1, i+1, false, false);
         
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

     ClearControls([{edtTotalCount, }edtInOrder, edtRest]);
     //edtTotalCountChange(Self);
     AutoAllocateMaterialCount();

     //sgENEstimateItemClick(nil);
   /////////////////////////////////////////////////////////////////////////////
end;

procedure TfrmMaterialsForRQOrderEdit.btnSelectClick(Sender: TObject);
begin
  UpdateEstimateItemGrid;
end;

procedure TfrmMaterialsForRQOrderEdit.FormDestroy(Sender: TObject);
begin
  //if Assigned(eFilter) then
  //  eFilter.Free;
  if Assigned(planFilter) then
    planFilter.Free;
  inherited;
end;

procedure TfrmMaterialsForRQOrderEdit.AutoAllocateMaterialCount;
var i, tmp: Integer;
    totalCount, estimateCount, rest: Double;
    tmpSum: Double;
begin
  CheckGrid(sgENEstimateItem, 1, false);

  edtRest.Text := '';
  edtInOrder.Text := '';
    
  if edtTotalCount.Text = '' then Exit;

  try
    totalCount := StrToFloat(edtTotalCount.Text);
  except
    on EConvertError do Exit;
  end;

  //CheckGrid(sgENEstimateItem, 1, false);

  try
    tmp := StrToInt(sgENEstimateItem.Cells[0, 1]);
  except
    on EConvertError do Exit;
  end;

  rest := totalCount;

  tmpSum := 0;
  
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    //if rest <= 0 then Exit;
    
    //sgSelectedCounters.GetCheckBoxState(1, i, state);
    try
      estimateCount := StrToFloat(sgENEstimateItem.Cells[2, i]);
    except
      on EConvertError do Continue;
    end;

    //estimateCount := Conv(estimateCount, 6);

    if rest < estimateCount then break;

    sgENEstimateItem.SetCheckBoxState(1, i, true);

    //tmpSum := tmpSum + estimateCount;

    rest := rest - estimateCount;
    //rest := Conv(rest - estimateCount, 6);
  end;

  ///// 22.01.13
  {
  edtRest.Text := FloatToStr(rest);
  edtInOrder.Text := FloatToStr(totalCount - rest);
  }
  
  //ShowMessage('rest: ' + FloatToStr(rest) + #13#10 +
  //            'tmpSum: ' + FloatToStr(tmpSum));
  
  edtRest.Text := FloatToStr(Conv(rest, 6));
  edtInOrder.Text := FloatToStr(Conv(totalCount - rest, 6));
  /////
end;

procedure TfrmMaterialsForRQOrderEdit.btnAutoAllocateMaterialCountClick(
  Sender: TObject);
begin
  AutoAllocateMaterialCount();
end;

procedure TfrmMaterialsForRQOrderEdit.edtTotalCountChange(
  Sender: TObject);
begin
  AutoAllocateMaterialCount();
end;

function TfrmMaterialsForRQOrderEdit.GetCheckedMaterialsCount: Double;
var i: Integer;
    state: Boolean;
    estimateCount, totalCount: Double;
begin
  Result := 0;

  totalCount := 0;
  state := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    //if rest <= 0 then Exit;
    
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
      try
        estimateCount := StrToFloat(sgENEstimateItem.Cells[2, i]);
      except
        on EConvertError do Continue;
      end;

      totalCount := totalCount + estimateCount;
    end;
  end;

  Result := totalCount;
end;

procedure TfrmMaterialsForRQOrderEdit.sgENEstimateItemCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
var checkedCount, checkedCountNew, totalCount: Double;
begin
  edtRest.Text := '';
  edtInOrder.Text := '';
  
  if edtTotalCount.Text = '' then
  begin
    Application.MessageBox(PChar('Введіть кількість матеріалу, яку необхідно додати в заявку!'), PChar('Увага!'), MB_ICONWARNING);
    edtTotalCount.SetFocus;
    if State then
      sgENEstimateItem.SetCheckBoxState(ACol, ARow, false);    
    Exit;
  end;

  try
    totalCount := StrToFloat(edtTotalCount.Text);
  except
    on EConvertError do Exit;
  end;

  checkedCount := GetCheckedMaterialsCount();
  //ShowMessage(FloatToStr(checkedCount));

  if checkedCount > totalCount then
  begin
    Application.MessageBox(PChar('Кількість обраних Вами матеріалів з плану перевищує кількість, яку необхідно додати в заявку!'),
                           PChar('Увага!'), MB_ICONWARNING);
    if State then
      sgENEstimateItem.SetCheckBoxState(ACol, ARow, false);

    checkedCountNew := GetCheckedMaterialsCount();

    edtInOrder.Text := FloatToStr(checkedCountNew);
    edtRest.Text := FloatToStr(totalCount - checkedCountNew);

    Exit;
  end;

  edtInOrder.Text := FloatToStr(checkedCount);
  edtRest.Text := FloatToStr(totalCount - checkedCount);
end;

procedure TfrmMaterialsForRQOrderEdit.btnAddMaterialsClick(
  Sender: TObject);
var
   TempRQOrderItem: RQOrderItemControllerSoapPort;
   obj: RQOrderItem;
   i, n, eArrCount : Integer;
   eList : ENEstimateItemShortList;
   eArr :  ArrayOfENEstimateItemShort;
   eObj :  ENEstimateItemShort;
   state, selected : boolean;
begin
  if materialCode < 0 then
  begin
    Application.MessageBox(PChar('Не задано матеріал!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtMaterialName.SetFocus;
    ClearGrid(sgENEstimateItem);
    Exit;
  end;

  if orderItemCode < 0 then
  begin
    Application.MessageBox(PChar('Не задано позицію заявки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    ClearGrid(sgENEstimateItem);
    Exit;
  end;

  /// Проверяем, чтобы был выбран хотя бы один материал
  selected := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал у переліку матеріалів з планів!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  ///

  {
   obj := ENEstimateItem2Contract.Create;
   SetNullIntProps(obj);
   SetNullXSProps(obj);
  }


  if Application.MessageBox(PChar('Ви дійсно бажаєте додати матеріали в заявку?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

    
  eList := ENEstimateItemShortList.Create;
  eList.totalCount := 0;
  SetLength(eArr, 0);
  //SetLength(eArr, n);
  //n := 0;

  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       eObj := ENEstimateItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       eObj.code := StrToInt(sgENEstimateItem.Cells[0, i]);
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgENEstimateItem.Cells[2, i];
       eArrCount := High(eArr) + 1;
       SetLength(eArr, eArrCount + 1);
       eArr[eArrCount] := eObj;
       //eArr[n] := eObj;
       //n := n + 1;
    end;
  end;

  eList.list := eArr;
  eList.totalCount := High(eArr) + 1;

  if (High(eArr) >= 0) then
  begin
    // TempENEstimateItem2Contract := HTTPRIOENEstimateItem2Contract as ENEstimateItem2ContractControllerSoapPort;
    // TempENEstimateItem2Contract.addWithEstimateList(obj, eArr);

    TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
    obj := TempRQOrderItem.getObject(orderItemCode);
    if obj = nil then
      raise Exception.Create('NET-4204 Не задано позицію заявки!');

    TempRQOrderItem.addWithEstimateListForAutoOrder(obj, eArr);

    //ShowMessage(IntToStr(eList.totalCount));
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  
  //materialsINCode := obj.material.code;
  //materialsINCode := LOW_INT;

  Application.MessageBox(PChar('Матеріали додано!'),
                         PChar('Повідомлення'), MB_ICONINFORMATION);

  ClearControls([edtTotalCount, edtInOrder, edtRest]);

  btnSelectClick(Sender);
end;

end.
