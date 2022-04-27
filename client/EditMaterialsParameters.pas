unit EditMaterialsParameters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController;

type
  TfrmMaterialsParametersEdit = class(TDialogForm)
    Panel1: TPanel;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblENBudgetName: TLabel;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    edtEPRenName: TEdit;
    chbWholeYear: TCheckBox;
    edtENElementName: TEdit;
    edtENBudgetName: TEdit;
    GroupBox2: TGroupBox;
    rbYear: TRadioButton;
    rbCurrent: TRadioButton;
    chkkindrefcodemat: TCheckBox;
    btnSelect: TBitBtn;
    HTTPRIOTKMaterials: THTTPRIO;
    sgTKMaterials: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    sgENPlanWork: TAdvStringGrid;
    pmMaterials: TPopupMenu;
    ActionList1: TActionList;
    actEdit: TAction;
    N1: TMenuItem;
    actViewPlan: TAction;
    aeExcel: TAdvGridExcelIO;
    actExcel: TAction;
    Excel1: TMenuItem;
    sgENPlanWorkItem: TAdvStringGrid;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    actViewPlanItem: TAction;
    HTTPRIOENEstimateItem: THTTPRIO;
    pmPlans: TPopupMenu;
    actEditPlan: TAction;
    N2: TMenuItem;
    actEditPlanItem: TAction;
    pmPlanItems: TPopupMenu;
    N3: TMenuItem;
    cbENPlanWorkFormName: TComboBox;
    lblPlanWorkForm: TLabel;
    lblEstimateStatus: TLabel;
    cbEstimateItemStatus: TComboBox;
    chbPlanned: TCheckBox;
    chbNoPlanned: TCheckBox;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure chbWholeYearClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actEditExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure sgTKMaterialsClick(Sender: TObject);
    procedure sgENPlanWorkClick(Sender: TObject);
    procedure actViewPlanItemExecute(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure actEditPlanItemExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    planCodes: String;
    planFilter: ENPlanWorkFilter;
    materialCondition : String;
    procedure UpdateMaterials(planCodes: String); overload;
    procedure UpdateMaterials(planFilter: ENPlanWorkFilter; materialCondition : String); overload;
    function GenerateEstimateItemStatusCondition: String;
  end;

var
  frmMaterialsParametersEdit: TfrmMaterialsParametersEdit;

implementation

{$R *.dfm}

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, TKMaterialsController, GridHeadersUnit,
  {ENPlanWorkController, }ENPlanWorkKindController, EditTKMaterials,
  EditENPlanWork, DMReportsUnit, ShellAPI, Globals,
  ENPlanWorkItemController, EditENPlanWorkItem, ENEstimateItemController,
  XSBuiltIns, ENPlanWorkFormController;

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
  TKMaterialsHeaders: array [1..7] of String =
        ( 'Код'
          ,'Наименование'
          ,'Ед. изм.'
          ,'Кол-во'
          ,'Цена'
          ,'Стоимость'
          ,'Срок поставки'
        );

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

  MonthesNames: array [1..12] of String =
        (
          'січень',
          'лютий',
          'березень',
          'квітень',
          'травень',
          'червень',
          'липень',
          'серпень',
          'вересень',
          'жовтень',
          'листопад',
          'грудень'
        );

procedure TfrmMaterialsParametersEdit.spbEPRenClick(Sender: TObject);
var
  frmEPRenShow: TfrmENEPRenShow;
begin
  frmEPRenShow := TfrmENEPRenShow.Create(Application, fmNormal);
  try
    with frmEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          renCode := StrToInt(GetReturnValue(sgEPRen,0));
          renName := GetReturnValue(sgEPRen,1);
          edtEPRenName.Text := renName;
          ///
          //if renCode > 0 then chbByRENs.Checked := false;
          //HideControls([chbByRENs], (renCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmEPRenShow.Free;
 end;
end;

procedure TfrmMaterialsParametersEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := 'typerefcode';

  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // А для ХОЭ (renCode = 0) выбираем все объекты

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

procedure TfrmMaterialsParametersEdit.spbENBudgetClick(Sender: TObject);
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

procedure TfrmMaterialsParametersEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtEPRenName, edtENElementName, edtENBudgetName]);

  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);

  materialCondition := '';
end;

procedure TfrmMaterialsParametersEdit.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmMaterialsParametersEdit.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
end;

procedure TfrmMaterialsParametersEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
end;

procedure TfrmMaterialsParametersEdit.chbWholeYearClick(Sender: TObject);
begin
  HideControls([lblMonthGen, edtMonthGen], chbWholeYear.Checked);
end;

procedure TfrmMaterialsParametersEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;
    //materialCondition : String;
    
    ///
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    
    //planFilter: ENPlanWorkFilter;
    //planCodes: String;

    ENMaterialsList: ENMaterialsShortList;
begin
    if (not chbPlanned.Checked) and (not chbNoPlanned.Checked) then
    begin
      Application.MessageBox(PChar('Оберіть вид робіт!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;    
    end;

    for i := 1 to sgTKMaterials.RowCount - 1 do
      for j := 0 to sgTKMaterials.ColCount - 1 do
        sgTKMaterials.Cells[j, i] := '';

    sgTKMaterials.RowCount := 2;

{    for i := 1 to sgENPlanWork.RowCount - 1 do
      for j := 0 to sgENPlanWork.ColCount - 1 do
        sgENPlanWork.Cells[j, i] := '';

    sgENPlanWork.RowCount := 2;}

    ////////////////////////////////////////////////////////////////////////////
    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planCodes := '';

    if renCode > 0 then
    begin
      planFilter.renRef := EPRenRef.Create;
      planFilter.renRef.code := renCode;
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
    if rbYear.Checked then
      planFilter.kind.code := ENPLANWORKKIND_YEAR
    else
      planFilter.kind.code := ENPLANWORKKIND_CURRENT;


    try
      planFilter.yearGen := StrToInt(edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    end;

    if not chbWholeYear.Checked then
      planFilter.monthGen := edtMonthGen.ItemIndex + 1;

    planFilter.conditionSQL := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';


    ///// DL 27.12.10 Заменили на чекбоксы
    {***
    /// AS
    if cbENPlanWorkFormName.ItemIndex > 0 then
    begin
      planFilter.formRef := ENPlanWorkFormRef.Create;
      planFilter.formRef.code := cbENPlanWorkFormName.ItemIndex;
    end;
    ***}

    if (not chbPlanned.Checked) or (not chbNoPlanned.Checked) then
    begin
      if chbPlanned.Checked then
      begin
        planFilter.formRef := ENPlanWorkFormRef.Create;
        planFilter.formRef.code := ENPLANWORKFORM_PLANNED;
      end
      else if chbNoPlanned.Checked then
      begin
        planFilter.formRef := ENPlanWorkFormRef.Create;
        planFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;
      end;
    end;
    /////

    ///
    {
    materialCondition := '';
    if cbEstimateItemStatus.ItemIndex > 0 then
    begin
      if cbEstimateItemStatus.ItemIndex = 1 then
        materialCondition := ' and ei.statusrefcode in ( '+ IntToStr(ENESTIMATEITEMSTATUS_TMP) +','+ IntToStr(ENESTIMATEITEMSTATUS_PLANNED) +') ';

      if cbEstimateItemStatus.ItemIndex = 2 then
        materialCondition := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_ORDERED );

      if cbEstimateItemStatus.ItemIndex = 3 then
        materialCondition := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_IN_SKLAD_OE );
    end;
    }
    materialCondition := GenerateEstimateItemStatusCondition;

(*
    TempENPlanWork :=  HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
    //if ENPlanWorkList <> nil then
    //  ShowMessage(IntToStr(ENPlanWorkList.totalCount));

    LastCount:=High(ENPlanWorkList.list);

    if LastCount > -1 then
       sgENPlanWork.RowCount:=LastCount+2
    else
       sgENPlanWork.RowCount:=2;

     with sgENPlanWork do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;

          n := 0;

          if ENPlanWorkList.list[i].code <> Low(Integer) then
          begin
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code);
            AddListPos(planCodes, IntToStr(ENPlanWorkList.list[i].code));
          end
          else
            Cells[n,i+1] := '';
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
          inc(n);

          if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
            //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
            Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].dateStart = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
          inc(n);


          Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
          inc(n);

  {
          if ENPlanWorkList.list[i].dateGen = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateGen);
          inc(n);
  }
          Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
          inc(n);

          if ENPlanWorkList.list[i].dateEdit = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
          inc(n);

          //Objects[0,i+1] := ENPlanWorkShort.Create;
          //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

          sgENPlanWork.RowCount := i + 2;
        end;

    sgENPlanWork.Row := 1;

    //ShowMessage(planCodes);
*)
    
    ////////////////////////////////////////////////////////////////////////////
    //ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter);
    //if ENMaterialsList <> nil then
    //  ShowMessage(IntToStr(ENMaterialsList.totalCount));

    //UpdateMaterials(planCodes);


    
    UpdateMaterials(planFilter, materialCondition);



(*
    TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

    materialsFilter := TKMaterialsFilter.Create;
    SetNullIntProps(materialsFilter);
    SetNullXSProps(materialsFilter);

    {if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := ENPlanWorkObj.code;

    estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;}

    ////
    //estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
    ////

    //materialsFilter.name := '*Провід*';

    materialsFilter.conditionSQL :=
      ' tk1.code in ' +
      ' (select enestimateitem.materialrefcode ' +
      '  from enestimateitem where enestimateitem.planrefcode in (' + planCodes + '))';

    materialsFilter.orderBySQL := 'TK1.NAME'; 

    TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsFilter, 0, -1);

    LastCount := High(TKMaterialsList.list);

    if LastCount > -1 then
      sgTKMaterials.RowCount := LastCount + 2
    else
      sgTKMaterials.RowCount := 2;

     with sgTKMaterials do
       for i := 0 to LastCount do
       begin
         Application.ProcessMessages;

         if TKMaterialsList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(TKMaterialsList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := TKMaterialsList.list[i].name;

         Cells[2,i+1] := TKMaterialsList.list[i].measurementName;

         if TKMaterialsList.list[i].cost = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := TKMaterialsList.list[i].cost.DecimalString;

         if TKMaterialsList.list[i].deliveryDate = Low(Integer) then
           Cells[4,i+1] := ''
         else
           Cells[4,i+1] := IntToStr(TKMaterialsList.list[i].deliveryDate);


         sgTKMaterials.RowCount := i + 2;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     sgTKMaterials.Row := 1;
*)     
end;

procedure TfrmMaterialsParametersEdit.FormCreate(Sender: TObject);
begin
  inherited;
  {SUPP-74738}SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, true);
end;

procedure TfrmMaterialsParametersEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmMaterialsParametersEdit.UpdateMaterials(planCodes: String);
var i, j, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;
begin
  if planCodes = '' then Exit;

  for i := 1 to sgTKMaterials.RowCount - 1 do
    for j := 0 to sgTKMaterials.ColCount - 1 do
      sgTKMaterials.Cells[j, i] := '';

  sgTKMaterials.RowCount := 2;

  //SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);

  TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

  materialsFilter := TKMaterialsFilter.Create;
  SetNullIntProps(materialsFilter);
  SetNullXSProps(materialsFilter);

  {if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
  estimateItemFilter.planRef.code := ENPlanWorkObj.code;

  estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
  estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;}

  ////
  //estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
  ////

  //materialsFilter.name := '*Провід*';

  materialsFilter.conditionSQL :=
    ' tk1.code in ' +
    ' (select enestimateitem.materialrefcode ' +
    '  from enestimateitem where enestimateitem.planrefcode in (' + planCodes + '))';

  materialsFilter.orderBySQL := 'TK1.NAME'; 

  TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsFilter, 0, -1);

  LastCount := High(TKMaterialsList.list);

  if LastCount > -1 then
    sgTKMaterials.RowCount := LastCount + 2
  else
    sgTKMaterials.RowCount := 2;

   with sgTKMaterials do
     for i := 0 to LastCount do
     begin
       Application.ProcessMessages;

       if TKMaterialsList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(TKMaterialsList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := TKMaterialsList.list[i].name;

       Cells[2,i+1] := TKMaterialsList.list[i].measurementName;

       if TKMaterialsList.list[i].cost = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := TKMaterialsList.list[i].cost.DecimalString;

       if TKMaterialsList.list[i].deliveryDate = Low(Integer) then
         Cells[4,i+1] := ''
       else
         Cells[4,i+1] := IntToStr(TKMaterialsList.list[i].deliveryDate);


       sgTKMaterials.RowCount := i + 2;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   sgTKMaterials.Row := 1;

end;

procedure TfrmMaterialsParametersEdit.UpdateMaterials(planFilter: ENPlanWorkFilter; materialCondition : String);
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

  ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, materialCondition, LOW_INT);
  if ENMaterialsList = nil then Exit;

  LastCount := High(ENMaterialsList.list);

  if LastCount > -1 then
    sgTKMaterials.RowCount := LastCount + 2
  else
    sgTKMaterials.RowCount := 2;

{
        ( 'Код'
          ,'Наименование'
          ,'Ед. изм.'
          ,'Кол-во'
          ,'Цена'
          ,'Стоимость'
          ,'Срок поставки'
        );
}

   with sgTKMaterials do
     for i := 0 to LastCount do
     begin
       Application.ProcessMessages;

       if ENMaterialsList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENMaterialsList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := ENMaterialsList.list[i].name;

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

   sgTKMaterialsClick(sgTKMaterials);
   //sgENPlanWorkClick(sgENPlanWork);
end;

procedure TfrmMaterialsParametersEdit.actEditExecute(Sender: TObject);
var TempTKMaterials: TKMaterialsControllerSoapPort;
begin
  TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
  try
    TKMaterialsObj := TempTKMaterials.getObject(StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]));
  except
    on EConvertError do Exit;
  end;

  frmTKMaterialsEdit := TfrmTKMaterialsEdit.Create(Application, dsEdit);
  try
    frmTKMaterialsEdit.HideControls([frmTKMaterialsEdit.CheckBox1, frmTKMaterialsEdit.spbTKParentName]);

    if frmTKMaterialsEdit.ShowModal= mrOk then
    begin
      //TempTKMaterials.save(TKMaterialsObj);
      //UpdateGrid(Sender);
      //UpdateMaterials(planCodes);
      UpdateMaterials(planFilter, materialCondition);
    end;
  finally
    frmTKMaterialsEdit.Free;
    frmTKMaterialsEdit := nil;
  end;
end;

procedure TfrmMaterialsParametersEdit.actViewPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode, selectedRow : Integer;
begin

  try
    objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
  except
    on EConvertError do Exit;
  end;


  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
  try

    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmMaterialsParametersEdit.actExcelExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('materials') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmMaterialsParametersEdit.sgTKMaterialsClick(Sender: TObject);
var materialCode: Integer;
    oldPlanCondition, planCondition, materialCondition_, materialCondition2: String;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
    for j := 0 to sgENPlanWork.ColCount - 1 do
      sgENPlanWork.Cells[j, i] := '';

  sgENPlanWork.RowCount := 2;

  try
    materialCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  oldPlanCondition := planFilter.conditionSQL;
  try
    planCondition := planFilter.conditionSQL;

    materialCondition_ :=
      ' (enplanwork.code in ' +
      '   (select ei.planrefcode from enestimateitem ei ' +
      '    where ei.materialrefcode = ' + IntToStr(materialCode) ;

     {
     materialCondition2 := '';
     if cbEstimateItemStatus.ItemIndex > 0 then
     begin

      if cbEstimateItemStatus.ItemIndex = 1 then
        materialCondition2 := ' and ei.statusrefcode in ( '+ IntToStr(ENESTIMATEITEMSTATUS_TMP) +','+ IntToStr(ENESTIMATEITEMSTATUS_PLANNED) +') ';

      if cbEstimateItemStatus.ItemIndex = 2 then
        materialCondition2 := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_ORDERED );

      if cbEstimateItemStatus.ItemIndex = 3 then
        materialCondition2 := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_IN_SKLAD_OE );
     end;
     }
     materialCondition2 := GenerateEstimateItemStatusCondition;

     // !!!!!!!!!!!!!!!!!!!
     materialCondition_ := materialCondition_ + materialCondition2 +
      '      and ei.countfact > 0) ' +
      '  ) ';
    // !!!!!!!!!!!!!!!!!!!!!!!!!


    AddCondition(planCondition, materialCondition_);
    planFilter.conditionSQL := planCondition;

    TempENPlanWork :=  HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
    //if ENPlanWorkList <> nil then
    //  ShowMessage(IntToStr(ENPlanWorkList.totalCount));

    LastCount:=High(ENPlanWorkList.list);

    if LastCount > -1 then
       sgENPlanWork.RowCount:=LastCount+2
    else
       sgENPlanWork.RowCount:=2;

     with sgENPlanWork do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;

          n := 0;

          if ENPlanWorkList.list[i].code <> Low(Integer) then
          begin
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code);
            AddListPos(planCodes, IntToStr(ENPlanWorkList.list[i].code));
          end
          else
            Cells[n,i+1] := '';
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
          inc(n);

          if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
            //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
            Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].dateStart = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
          inc(n);


          Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
          inc(n);

  {
          if ENPlanWorkList.list[i].dateGen = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateGen);
          inc(n);
  }
          Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
          inc(n);

          if ENPlanWorkList.list[i].dateEdit = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
          inc(n);

          //Objects[0,i+1] := ENPlanWorkShort.Create;
          //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

          sgENPlanWork.RowCount := i + 2;
        end;

    sgENPlanWork.Row := 1;

    sgENPlanWorkClick(sgENPlanWork);

  finally
    planFilter.conditionSQL := oldPlanCondition;
  end;
end;

procedure TfrmMaterialsParametersEdit.sgENPlanWorkClick(Sender: TObject);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemList: ENPlanWorkItemShortList;
    i, i1, i2 , j, k, n, iLastCount, planCode, materialCode: Integer;
    planItemFilter: ENPlanWorkItemFilter;
    //condition: String;
    vNormOfTime, vCountGen, vMaterialCount: Double;

    ///
    TempENEstimateItem: ENEstimateitemControllerSoapPort;
    ENEstimateItemList, ENEstimateItemList2 : ENEstimateItemShortList;
    estimateFilter: ENEstimateItemFilter;
    condition, materialCondition_ , materialCondition2: String;
begin
  for i := 1 to sgENPlanWorkItem.RowCount - 1 do
    for j := 0 to sgENPlanWorkItem.ColCount - 1 do
      sgENPlanWorkItem.Cells[j, i] := '';

  sgENPlanWorkItem.RowCount := 2;

  try
    materialCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  planItemFilter := ENPlanWorkItemFilter.Create;
  SetNullIntProps(planItemFilter);
  SetNullXSProps(planItemFilter);

  planItemFilter.planRef := ENPlanWorkRef.Create;
  planItemFilter.planRef.code := planCode;

  {QQQQ
  condition := ' (enplanworkitem.code in ' +
    '   (select ei.planitemrefcode from enestimateitem ei ' +
    '    where ei.materialrefcode = ' + IntToStr(materialCode) +
    '      and ei.countfact > 0) ' +
    '  ) ';
}


    materialCondition_ :=
      ' (enplanworkitem.code in ' +
      '   (select ei.planitemrefcode from enestimateitem ei ' +
      '    where ei.materialrefcode = ' + IntToStr(materialCode) ;

     // такаж фигня ниже в выборке мат-лов без работ ...
     materialCondition2 := '';
     if cbEstimateItemStatus.ItemIndex > 0 then
     begin

      if cbEstimateItemStatus.ItemIndex = 1 then
        materialCondition2 := ' and ei.statusrefcode in ( '+ IntToStr(ENESTIMATEITEMSTATUS_TMP_) +','+ IntToStr(ENESTIMATEITEMSTATUS_PLANNED) +') ';

      if cbEstimateItemStatus.ItemIndex = 2 then
        materialCondition2 := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_ORDERED );
     end;

     // !!!!!!!!!!!!!!!!!!!
     materialCondition_ := materialCondition_ + materialCondition2 +
      '      and ei.countfact > 0) ' +
      '  ) ';
    // !!!!!!!!!!!!!!!!!!!!!!!!!

{
  if (cbENPlanWorkFormName.ItemIndex > 0) then
  begin
      AddCondition(condition, 'enplanworkitem.code in (select enplanwork.code from enplanwork where enplanwork.formrefcode = ' + IntToStr(cbENPlanWorkFormName.ItemIndex) + ')');
  end;
}

  planItemFilter.conditionSQL := materialCondition_; //condition;


  planItemFilter.orderBySQL := ' enplanworkitem.kartarefcode';

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

  iLastCount:=High(ENPlanWorkItemList.list);

  if iLastCount > -1 then
     sgENPlanWorkItem.RowCount:=iLastCount+2
  else
     sgENPlanWorkItem.RowCount:=2;

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateitemControllerSoapPort;

  //i := 0;

   with sgENPlanWorkItem do
    for i:=0 to iLastCount do
      begin
        //Application.ProcessMessages;
        
        if ENPlanWorkItemList.list[i].code <> Low(Integer) then
          Cells[0, i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
        else
          Cells[0, i+1] := '';

        Cells[1, i+1] := ENPlanWorkItemList.list[i].kartaNum;
        Cells[2, i+1] := ENPlanWorkItemList.list[i].kartaRefName;

        ///// Кол-во выбранного материала в каждой из работ выбранного плана
        //TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateitemControllerSoapPort;
        estimateFilter := ENEstimateItemFilter.Create;
        SetNullIntProps(estimateFilter);
        SetNullXSProps(estimateFilter);

        // AS 28/02/2011
        // выводим ВСЕ эстимэйты с этим мат-лом на этом плане ...
        estimateFilter.planItemRef := ENPlanWorkItemRef.Create;
        estimateFilter.planItemRef.code := ENPlanWorkItemList.list[i].code;

        estimateFilter.materialRef := TKMaterialsRef.Create;
        estimateFilter.materialRef.code := materialCode;

        ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateFilter, 0, -1);
        if ENEstimateItemList <> nil then
        begin
          {if ENEstimateItemList.list[0] <> nil then
            if ENEstimateItemList.list[0].countFact <> nil then
              Cells[3,i+1] := ENEstimateItemList.list[0].countFact.DecimalString;}

          vMaterialCount := 0;

          for k := 0 to High(ENEstimateItemList.list) do
          begin
            if ENEstimateItemList.list[k] <> nil then
              if ENEstimateItemList.list[k].countFact <> nil then
                try
                  vMaterialCount := vMaterialCount + StrToFloat(ENEstimateItemList.list[k].countFact.DecimalString);
                except
                  on EConvertError do Continue;
                end;
          end;

          Cells[3, i+1] := FloatToStr(vMaterialCount);
        end;
        /////

        Cells[4, i+1] := ENPlanWorkItemList.list[i].sourceName;

        vCountGen := 0;

        if ENPlanWorkItemList.list[i].countGen = nil then
          Cells[5, i+1] := ''
        else begin
          Cells[5, i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;
          try
            vCountGen := StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString);
          except
            vCountGen := 0;
          end;
        end;

        vNormOfTime := 0;

        if ENPlanWorkItemList.list[i].normOfTime = nil then
          Cells[6, i+1] := ''
        else begin
          Cells[6, i+1] := ENPlanWorkItemList.list[i].normOfTime.DecimalString;
          try
            vNormOfTime := StrToFloat(ENPlanWorkItemList.list[i].normOfTime.DecimalString);
          except
            vNormOfTime := 0;
          end;
        end;

        Cells[7, i+1] := FloatToStr(Conv(vNormOfTime * vCountGen, 3));

        Cells[8, i+1] := ENPlanWorkItemList.list[i].meter;
        Cells[9, i+1] := ENPlanWorkItemList.list[i].measurementUnit;

        Cells[10, i+1] := ENPlanWorkItemList.list[i].userGen;

        {if ENPlanWorkItemList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);}

        //Cells[9,i+1] := FloatToStr(Conv(vNormOfTime * vCountGen, 3));

        /////
        try
          RowColor[i+1] := clWindow;

          // Если работа с нулевым кол-вом, выделяем строку красным цветом
          if ENPlanWorkItemList.list[i].countGen <> nil then
            if StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString) = 0 then
              RowColor[i+1] := clRed;
        except
        end;
        /////

        //iLastRow:=i+1;
        sgENPlanWorkItem.RowCount := i+2;
      end;

    // AS 28/02/2011 вывод мат - лов БЕЗ работ ...
  estimateFilter.Free;  
  estimateFilter := nil;
  estimateFilter := ENEstimateItemFilter.Create;
  SetNullIntProps(estimateFilter);
  SetNullXSProps(estimateFilter);

  estimateFilter.planRef := ENPlanWorkRef.Create;
  estimateFilter.planRef.code := planCode;

  estimateFilter.materialRef := TKMaterialsRef.Create;
  estimateFilter.materialRef.code := materialCode;

       // такаж фигня ниже в выборке мат-лов без работ ...
     materialCondition2 := '';
     if cbEstimateItemStatus.ItemIndex > 0 then
     begin

      if cbEstimateItemStatus.ItemIndex = 1 then
        AddCondition(materialCondition2,' enestimateitem.statusrefcode = '+ IntToStr(ENESTIMATEITEMSTATUS_PLANNED));

      if cbEstimateItemStatus.ItemIndex = 2 then
        AddCondition(materialCondition2, ' enestimateitem.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_ORDERED ));
        
     end;

     AddCondition(materialCondition2, 'enestimateitem.planitemrefcode is null and enestimateitem.countfact <> 0 ');

     estimateFilter.conditionSQL := materialCondition2;

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateitemControllerSoapPort;

  ENEstimateItemList2 := TempENEstimateItem.getScrollableFilteredList(estimateFilter, 0, -1);

  //iLastCount:=High(ENPlanWorkItemList.list);
  {
  if High(ENEstimateItemList2.list) > -1 then
     sgENPlanWorkItem.RowCount:= sgENPlanWorkItem.RowCount + High(ENEstimateItemList2.list)
  else
     sgENPlanWorkItem.RowCount:=2;
  }

   //if i = 0 then i := 1;
   if iLastCount = -1 then
     i2 := 1
   else
     i2 := sgENPlanWorkItem.RowCount  ;

   with sgENPlanWorkItem do
    for i1:=0 to High(ENEstimateItemList2.list) do
      begin
        //Application.ProcessMessages;

        if ENEstimateItemList2.list[i1].code <> Low(Integer) then
          Cells[0, i2 + i1 ] := IntToStr(ENEstimateItemList2.list[i1].code)
        else
          Cells[0, i2 + i1 ] := '';

        Cells[1, i2 + i1] := '----';
        Cells[2, i2 + i1] := 'без робіт';

        vMaterialCount := 0;

        if ENEstimateItemList2.list[i1].countFact <> nil then
          vMaterialCount := StrToFloat(ENEstimateItemList2.list[i1].countFact.DecimalString);

        Cells[3, i2 + i1] := FloatToStr(vMaterialCount);
        /////


        Cells[4, i2 + i1] := '';


        Cells[5, i2 + i1] := '';
        Cells[6, i + i1] := '';

        Cells[8, i2 + i1] := '';
        Cells[9, i2 + i1] := '';


        Cells[10, i + i1] := ''; //ENPlanWorkItemList.list[i].userGen;

        /////

        //iLastRow:=i+1;
        sgENPlanWorkItem.RowCount := i2 + i1 + 1 ;//sgENPlanWorkItem.RowCount + 1;
      end;
  ///////////////////////////////////////////


   //iColCount:=iColCount+1;
   sgENPlanWorkItem.Row := 1;
end;

procedure TfrmMaterialsParametersEdit.actViewPlanItemExecute(
  Sender: TObject);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENPlanWorkItem.Cells[0, sgENPlanWorkItem.row]);
  except
    on EConvertError do Exit;
  end;

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  try
    ENPlanWorkItemObj := TempENPlanWorkItem.getObject(objCode);
  except
    on EConvertError do Exit;
  end;

  frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsView);
  try
    //frmENPlanWorkItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
    frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[7,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row];
    if frmENPlanWorkItemEdit.ShowModal= mrOk then
    begin
      //TempENLine04.save(ENLine04Obj);
      //UpdateGrid(Sender);
    end;
  finally
    frmENPlanWorkItemEdit.Free;
    frmENPlanWorkItemEdit:=nil;
  end;
end;

procedure TfrmMaterialsParametersEdit.actEditPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    ObjCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(ObjCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
begin
  try
      TempENPlanWork.editPreConfirm(tPlan.code);
  except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;
end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

      //and
      //not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  //selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    if frmENPlanWorkEdit.ShowModal= mrOk then
      begin
        //TempENPlanWork.save(ENPlanWorkObj);
        //UpdateGrid(Sender);
        {
          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;

            ColCount := ColCount - 99;

            if selectedRow > 100 then
              //CounterGridTopLeftChanged(Sender)
              sgENPlanWorkTopLeftChanged(Sender)
            else
            begin
              //SetGridHeaders(TMPCounterHeaders, CounterGrid.ColumnHeaders);
              //btnSearchNomenclatureClick(Sender);
              //FormShow(Sender);
              UpdateGrid(Sender);
            end;
         }
      end;
       {
        if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;
        }

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmMaterialsParametersEdit.actEditPlanItemExecute(
  Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    //TempENEstimateItem: ENEstimateItemControllerSoapPort;
    tPlan : ENPlanWork;
begin
  //if ENPlanWorkObj.status.code <> ENPLANWORKSTATUS_GOOD then
{  if not (ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;}

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

  tPlan := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);

  if tPlan = nil then
  begin
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;


if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
begin
  try
      TempENPlanWork.editPreConfirm(tPlan.code);
  except on E: Exception do begin
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      exit;
    end;
  end;
end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

      //and
      //not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;


    //selectedRow := sgENPlanWorkItem.Row;
    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsEdit);
    try
      //frmENPlanWorkItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];
      
      if frmENPlanWorkItemEdit.ShowModal= mrOk then
        begin
          //TempENLine04.save(ENLine04Obj);
          //UpdateGrid(Sender);
        end;

        {
        if  sgENPlanWorkItem.RowCount > selectedRow then
           sgENPlanWorkItem.Row := selectedRow
        else
           sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;
        }
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;

  
end;

function TfrmMaterialsParametersEdit.GenerateEstimateItemStatusCondition: String;
begin
  Result := '';

  if cbEstimateItemStatus.ItemIndex > 0 then
  begin
    if cbEstimateItemStatus.ItemIndex = 1 then
      Result := ' and ei.statusrefcode = '+ IntToStr(ENESTIMATEITEMSTATUS_PLANNED) ;

    if cbEstimateItemStatus.ItemIndex = 2 then
      Result := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_ORDERED );

    if cbEstimateItemStatus.ItemIndex = 3 then
      Result := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_PRESENT );

    { Это на будущее. Пока показывать не будем...
    if cbEstimateItemStatus.ItemIndex = 4 then
      Result := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_IN_SKLAD_REM );

    if cbEstimateItemStatus.ItemIndex = 5 then
      Result := ' and ei.statusrefcode = ' + IntToStr( ENESTIMATEITEMSTATUS_IN_MOL );
    }
  end;

  Result := Result + ' and ei.kindrefcode <> ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT);

end;

end.
