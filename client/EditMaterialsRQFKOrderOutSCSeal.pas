unit EditMaterialsRQFKOrderOutSCSeal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController
  , RQOrderItemController
  , RQFKOrderController, TB2Item, TB2Dock, TB2Toolbar, ImgList, ComCtrls
  ;

type
  TfrmMaterialsRQFKOrderOutSCSealEdit = class(TDialogForm)
    Panel1: TPanel;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
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
    PanelFINMaterials: TPanel;
    Splitter2: TSplitter;
    HTTPRIOFINMaterials: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIOFINDoc2FKOrder: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    HTTPRIORQFKOrderItem: THTTPRIO;
    actRemove310: TAction;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    chbIsMaster: TCheckBox;
    HTTPRIORQFKOrderData2FKParty: THTTPRIO;
    Panel5: TPanel;
    gbSCCounterData: TGroupBox;
    gbParameters: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtInvNumber: TEdit;
    edtSerialNumber: TEdit;
    edtName: TEdit;
    edtFinMolName: TEdit;
    edtFinMolCode: TEdit;
    dtpDateIn: TDateTimePicker;
    btnSearch: TButton;
    panelSCGrid: TPanel;
    sgENMetrologyCounter: TAdvStringGrid;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    HTTPRIO1: THTTPRIO;
    HTTPRIOSCCounter: THTTPRIO;
    lblStorageZoneName: TLabel;
    edtStorageZoneName: TEdit;
    spbStorageZoneName: TSpeedButton;
    spbStorageZoneNameClear: TSpeedButton;
    edtQuant: TEdit;
    lblQuant: TLabel;
    chbCheckAll: TCheckBox;
    Panel4: TPanel;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Panel6: TPanel;
    procedure FormShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddMaterialsClick(Sender: TObject);


    function makeEstimateCondition(): String;
    function getEstimateCode() : Integer;
    procedure sgTKMaterialsDblClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure sgENMetrologyCounterTopLeftChanged(Sender: TObject);
    procedure spbStorageZoneNameClick(Sender: TObject);
    procedure spbStorageZoneNameClearClick(Sender: TObject);
    procedure chbCheckAllClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    //RQOrderItemObj: RQOrderItem;

    rqFKOrderCode : Integer;
    rqFKOrderObj : RQFKOrder;
    finDoc : Integer;
    zoneCode : Integer;


    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    planCodes: String;
    planFilter: ENPlanWorkFilter;
    MOLCode : String;
    masterMOLCode : String;
    departmentCode : Integer;
    departmentName : String;
    materialsINCode : Integer;
    accountingType : Integer;
    
    //procedure UpdateMaterials(planCodes: String); overload;
    procedure UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
    procedure updateEstimateItemGrid_();


    //procedure clearGrids();
  end;

var
  frmMaterialsRQFKOrderOutSCSealEdit: TfrmMaterialsRQFKOrderOutSCSealEdit;


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
  TKMeasurementController, ENPlanWorkFormController,
  FINMaterialsController, FINDoc2FKOrderController, FINDocTypeController,
  FINMaterialsStatusController, EditFINMaterialCount, FINMolDataController,
  RQFKOrderItemController, RQFKOrderItem2ENEstimateItemController,
  RQFKOrderData2FKPartyController, ENMetrologyCounterController,
  TKAccountingTypeController, SCOrderController, ShowSCOrder,
  SCCounterController, SCOrderKindController, SCCounterKindController
  , RQStorageZoneController, ShowRQStorageZone;

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
          ,'Назва'
          ,'Од. вим.'
          ,'Кіл-ть'
          ,'Ціна без ПДВ (індикативна)'
          ,'Вартість без ПДВ'
          ,'Строк постачання'
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


  FINMaterialsHeaders: array [1..24] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниця виміру'
          ,'Кількість матеріалу'
          ,'Призначення залишку'{*** передвинуто ***}
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код ...'
          //,'Призначення залишку'
          ,'код ...'
          ,'код ...'
          ,'код ЦФВ'
          ,'ЦФВ'
          ,'Ціна розрахункова'
          ,'ПІБ МОЛа'
          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Балансовий рахунок'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
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

  ENFINMaterialsHeaders: array [1..25] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниця виміру'
          ,'Кількість матеріалу'
          ,'код,назва ЦФВ'
          ,'ПІБ МОЛа'

          ,'Призначення залишку' {*** передвинуто ***}
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код ...'
          //,'Призначення залишку'
          ,'код ...'
          ,'код ...'
          ,'код ...'
          ,'...'
          ,'Ціна розрахункова'

          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Балансовий рахунок'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
        );

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;        
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
          ,'Місце зберігання'
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


{procedure  TfrmMaterialsRQFKOrderOutEdit.clearGrids();
var
 i, j : Integer;
begin

for i := 1 to sgTKMaterials.RowCount - 1 do
  for j := 0 to sgTKMaterials.ColCount - 1 do
      sgTKMaterials.Cells[j, i] := '';
  sgTKMaterials.RowCount := 2;

   for i:=1 to sgENFINMaterials.RowCount-1 do
     for j:=0 to sgENFINMaterials.ColCount-1 do
       sgENFINMaterials.Cells[j,i]:='';
   sgENFINMaterials.RowCount := 2;

   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;

end; }







procedure TfrmMaterialsRQFKOrderOutSCSealEdit.FormShow(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;

begin
  DisableControls([edtDepartment,  edtFinMolCode, edtFinMolName, spbDepartment, spbDepartmentClear, edtStorageZoneName]);

  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);

  edtDepartment.Text:= departmentName;

  HideControls([edtMonthGen, edtYearGen]);
  edtMonthGen.ItemIndex := -1;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  rqFKOrderObj := TempRQFKOrder.getObject(rqFKOrderCode);


end;

function TfrmMaterialsRQFKOrderOutSCSealEdit.makeEstimateCondition(): String;
var
  str, conditionSQL, planCondition : String;

begin
    planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';

    if departmentCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.departmentrefcode = ' + IntToStr(departmentCode));
    end;

    if budgetCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.budgetrefcode = ' + IntToStr(budgetCode));
    end;

    AddCondition(planCondition, 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT));

    try
       AddCondition(planCondition, 'enplanwork.yeargen = ' + edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    end;

      AddCondition(planCondition, 'enplanwork.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1));

    AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    AddCondition(conditionSQL, planCondition);

    Result := conditionSQL;
end;


procedure TfrmMaterialsRQFKOrderOutSCSealEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;

    condition , mCondition: String;
    ENMaterialsList: ENMaterialsShortList;

    TempENDepartment: ENDepartmentControllerSoapPort;
    depCodes, molOutCode : String;

    code : Integer;
begin

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planCodes := '';

    molOutCode := copy(rqFKOrderObj.molOutCode, 1, 2);
    planFilter.code := 0;


    mCondition := ' and ei.accountingtyperefcode = ' + IntToStr(accountingType);
    
    UpdateMaterials_(planFilter, mCondition);
    sgTKMaterialsDblClick(Sender);

end;

procedure TfrmMaterialsRQFKOrderOutSCSealEdit.chbCheckAllClick(Sender: TObject);
begin
  inherited;
  CheckGrid(sgENMetrologyCounter, 1, chbCheckAll.Checked);
end;

procedure TfrmMaterialsRQFKOrderOutSCSealEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmMaterialsRQFKOrderOutSCSealEdit.UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
var i, j, LastCount: Integer;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENMaterialsList: ENMaterialsShortList;
begin
  if planFilter = nil then Exit;

  for i := 1 to sgTKMaterials.RowCount - 1 do
    for j := 0 to sgTKMaterials.ColCount - 1 do
      sgTKMaterials.Cells[j, i] := '';

  sgTKMaterials.RowCount := 2;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, mCondition, materialsINCode);
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

   sgTKMaterials.Row := 1;
   sgTKMaterialsDblClick(sgTKMaterials);
end;



procedure TfrmMaterialsRQFKOrderOutSCSealEdit.updateEstimateItemGrid_();
var
  i, j , code : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  eFilter : ENEstimateItemFilter;
  materialCode : Integer;
  conditionSQL, planCondition , eCondition : String;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;

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

    eFilter.materialRef := TKMaterialsRef.Create;
    eFilter.materialRef.code := materialCode;

    eFilter.kindRef := ENEstimateItemKindRef.Create;
    eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    eCondition := ' enestimateitem.accountingtyperefcode in (' + TK_ACCOUNTINGTYPE_ALL_SEALS + ')';

    if  ( Length(eCondition) > 0 ) then eFilter.conditionSQL := eCondition;

    eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    Application.ProcessMessages;

   ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, planFilter);

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

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

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


procedure TfrmMaterialsRQFKOrderOutSCSealEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;


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

        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := departmentCode;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;



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

procedure TfrmMaterialsRQFKOrderOutSCSealEdit.spbDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

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

procedure TfrmMaterialsRQFKOrderOutSCSealEdit.FormCreate(Sender: TObject);
begin
  inherited;
  MOLCode := '';
  masterMOLCode := '';
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  budgetCode := LOW_INT;
  materialsINCode := LOW_INT;
  finDoc := LOW_INT;
  zoneCode := LOW_INT;
end;

function TfrmMaterialsRQFKOrderOutSCSealEdit.getEstimateCode() : Integer;
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

procedure TfrmMaterialsRQFKOrderOutSCSealEdit.btnAddMaterialsClick(
  Sender: TObject);
var i, cntCount, estCount, p, m: Integer;
   estimateCode: Integer;
   state, estState: boolean;
   scObj: ENMetrologyCounter;
   counterArr: ArrayOfENMetrologyCounters;
   TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
   RQFKOrderObj: RQFKOrder;
   TempRQFKOrder: RQFKOrderControllerSoapPort;
   estArr: ArrayOfInteger;
   molOutCode, s: string;
   Tempenestimateitemcontroller : ENEstimateItemControllerSoapPort;
begin
  TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  Tempenestimateitemcontroller := HTTPRIOENEstimateItem as  ENEstimateItemControllerSoapPort;
  RQFKOrderObj:= TempRQFKOrder.getObject(rqFKOrderCode);

  estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);

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
      PChar('Не обрана жодна пломба для переміщення ...'),
      PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте прив''язати обрані ' + IntToStr(cntCount) +
       ' пломби?' ),
    PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2)
    <> IDOK
  then Exit;


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
          scObj.counterType := sgENMetrologyCounter.Cells[12, i];

          scObj.element := ENElement.Create;
          scObj.element.code := estimateCode;

          scObj.zoneRef := RQStorageZoneRef.Create;
          scObj.zoneRef.code := Integer(sgENMetrologyCounter.Objects[1, i]);
          counterArr[cntCount] := scObj;
          cntCount := cntCount + 1;

        end;

    end;

  molOutCode := copy(rqFKOrderObj.molOutCode, 1, 2);


  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  TempRQFKOrderItem.addSCSeals(rqFKOrderCode, counterArr);

      Application.MessageBox(
      PChar('Пломби додані!'),
      PChar('Увага!'), MB_ICONINFORMATION);

  btnSearchClick(Sender);

end;


procedure TfrmMaterialsRQFKOrderOutSCSealEdit.sgTKMaterialsDblClick(
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

procedure TfrmMaterialsRQFKOrderOutSCSealEdit.btnSearchClick(Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  i, j{, ColCount, LastCount}: Integer;
  counterFilter: ENMetrologyCounterFilter;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
  sql : string;
  isSCOrder : Boolean;
begin

  for i:=1 to sgENMetrologyCounter.RowCount-1 do
    for j:=0 to sgENMetrologyCounter.ColCount-1 do
      sgENMetrologyCounter.Cells[j,i] := '';
  sgENMetrologyCounter.RowCount := 2;
  sgENMetrologyCounter.RemoveCheckBox(1, 1);

  //SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);

  TempENMetrologyCounter :=  HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;


  if Length(edtQuant.Text) > 0 then
  ColCount := StrToInt(edtQuant.Text)
  else
  ColCount := 100;

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

  begin

      AddCondition(sql, ' nvl(a.energy_lock, -1) < 0 ');
      AddCondition(sql, ' a.type_object = ' + IntToStr(accountingType-3));


      counterFilter.account := '2013';

      if dtpDateIn.Checked then
      begin
        counterFilter.dateIn := TXSDate.Create;
        counterFilter.dateIn.XSToNative(GetXSDate(dtpDateIn.DateTime));
      end;

      if edtSerialNumber.Text <> '' then
        counterFilter.buildNumber := edtSerialNumber.Text;

      if edtInvNumber.Text <> '' then
        counterFilter.invNumber := edtInvNumber.Text;

      if edtName.Text <> '' then
        counterFilter.name := edtName.Text;

      counterFilter.zoneRef := RQStorageZoneRef.Create;
      counterFilter.zoneRef.code := zoneCode;

  end;
  //////////////////////////////////////////////////////////////////////////////


    counterFilter.conditionSQL := sql;

    ENMetrologyCounterList := TempENMetrologyCounter.getSealsList(counterFilter, 0, ColCount);

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

          AddCheckBox(1, i+1, isSCOrder, false);

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

          Cells[11,i+1] := ENMetrologyCounterList.list[i].zoneRefName;
          Cells[12,i+1] := ENMetrologyCounterList.list[i].counterType;

          Objects[1, i+1] := TObject(ENMetrologyCounterList.list[i].zoneRefCode);

          LastRow := i + 1;
          sgENMetrologyCounter.RowCount := LastRow + 1;
      end;

    ColCount := ColCount + 1;
    sgENMetrologyCounter.Row := 1;

  //if isSCOrder then
  begin
     DisableControls([sgENMetrologyCounter], isSCOrder);
  end;

  
end;


procedure TfrmMaterialsRQFKOrderOutSCSealEdit.spbStorageZoneNameClearClick(
  Sender: TObject);
begin
  inherited;
  edtStorageZoneName.Text := '';
  zoneCode := LOW_INT;
end;

procedure TfrmMaterialsRQFKOrderOutSCSealEdit.spbStorageZoneNameClick(
  Sender: TObject);
var zoneFilter: RQStorageZoneFilter;
    frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin

  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

  zoneFilter.conditionSQL :=
    ' rqstoragezone.code in ' +
    ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
    '  where sm.molrefcode in ' +
    '    (select m.code from enmol m where m.fincode = ''' + MOLCode + ''')) ';
  zoneFilter.orderBySQL := 'rqstoragezone.name';

  frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
  try
    frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                         frmRQStorageZoneShow.actDelete,
                                         frmRQStorageZoneShow.actEdit]);
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
          zoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          edtStorageZoneName.Text := GetReturnValue(sgRQStorageZone, 2);
        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;


procedure TfrmMaterialsRQFKOrderOutSCSealEdit.sgENMetrologyCounterTopLeftChanged(Sender: TObject);
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


      begin

            // что бы не брали один и тотже ... + залоченые ;)
          AddCondition(sql, ' nvl(a.energy_lock, -1) < 0 ');
          AddCondition(sql, ' a.type_object = ' + IntToStr(accountingType-3));

          counterFilter.account := '2013';

          if dtpDateIn.Checked then
          begin
            counterFilter.dateIn := TXSDate.Create;
            counterFilter.dateIn.XSToNative(GetXSDate(dtpDateIn.DateTime));
          end;

          if edtSerialNumber.Text <> '' then
            counterFilter.buildNumber := edtSerialNumber.Text;

          if edtInvNumber.Text <> '' then
            counterFilter.invNumber := edtInvNumber.Text;

          if edtName.Text <> '' then
            counterFilter.name := edtName.Text;

      end;

      counterFilter.conditionSQL := sql;

      ENMetrologyCounterList := TempENMetrologyCounter.getSealsList(counterFilter, ColCount-1, 100);


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

              Cells[11,i+CurrentRow] := ENMetrologyCounterList.list[i].zoneRefName;
              Cells[12,i+CurrentRow] := ENMetrologyCounterList.list[i].counterType;

              Objects[1, i+CurrentRow] := TObject(ENMetrologyCounterList.list[i].zoneRefCode);

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


end.
