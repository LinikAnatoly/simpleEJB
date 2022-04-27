unit EditMaterialsRQFKOrderOutSCCounter;

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
  TfrmMaterialsRQFKOrderOutSCCounterEdit = class(TDialogForm)
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
    Panel4: TPanel;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Splitter3: TSplitter;
    gbENFINMaterials: TGroupBox;
    HTTPRIORQFKOrderItem: THTTPRIO;
    actRemove310: TAction;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    chbIsMaster: TCheckBox;
    Label7: TLabel;
    HTTPRIORQFKOrderData2FKParty: THTTPRIO;
    pnlLegend: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Panel5: TPanel;
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
    lblSCOrder: TLabel;
    edtSCOrderNum: TEdit;
    panelSCGrid: TPanel;
    sgENMetrologyCounter: TAdvStringGrid;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    cbAccount: TComboBox;
    lblAccount: TLabel;
    spbSCOrder: TSpeedButton;
    spbSCOrderNumClear: TSpeedButton;
    HTTPRIO1: THTTPRIO;
    sgSCCounter: TAdvStringGrid;
    HTTPRIOSCCounter: THTTPRIO;
    lblCountInOrder: TLabel;
    rgSide: TRadioGroup;
    chkIsPlanZamena: TCheckBox;
    lblStorageZoneName: TLabel;
    edtStorageZoneName: TEdit;
    spbStorageZoneName: TSpeedButton;
    spbStorageZoneNameClear: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure sgTKMaterialsClick(Sender: TObject);

    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddMaterialsClick(Sender: TObject);


    function makeEstimateCondition(): String;
    function getEstimateCode() : Integer;
    procedure sgTKMaterialsDblClick(Sender: TObject);
    procedure actRemove310Execute(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure spbSCOrderClick(Sender: TObject);
    procedure spbSCOrderNumClearClick(Sender: TObject);
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure rgSideClick(Sender: TObject);
    procedure cbAccountChange(Sender: TObject);
    procedure sgENMetrologyCounterTopLeftChanged(Sender: TObject);
    procedure chkIsPlanZamenaClick(Sender: TObject);
    procedure spbStorageZoneNameClick(Sender: TObject);
    procedure spbStorageZoneNameClearClick(Sender: TObject);

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
    
    //procedure UpdateMaterials(planCodes: String); overload;
    procedure UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
    procedure updateEstimateItemGrid_();


    //procedure clearGrids();
  end;

var
  frmMaterialsRQFKOrderOutSCCounterEdit: TfrmMaterialsRQFKOrderOutSCCounterEdit;


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







procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.FormShow(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;

begin
  DisableControls([edtDepartment, edtSCOrderNum, edtFinMolCode, edtFinMolName, spbDepartment, spbDepartmentClear, edtStorageZoneName]);

  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);
  SetGridHeaders(SCCounterHeaders, sgSCCounter.ColumnHeaders);

  edtDepartment.Text:= departmentName;

  HideControls([edtMonthGen, edtYearGen]);
  edtMonthGen.ItemIndex := -1;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  rqFKOrderObj := TempRQFKOrder.getObject(rqFKOrderCode);

  if rqFKOrderObj.kind.code  = RQFKORDER_KIND_WRITEOFFCOUNTERS then
    begin
     HideControls([rgSide , lblSCOrder , edtSCOrderNum  ,  spbSCOrder  , spbSCOrderNumClear ]);
     // очищаем лист по счетам и инсертим счета под списание (1126 , 2096)
     cbAccount.Clear;
     cbAccount.AddItem('1126' ,cbAccount);
     cbAccount.AddItem('2096' ,cbAccount);
     cbAccount.ItemIndex:= 0;

     //прячем инфу по счетчикам из планов т.к у нас один план месячный и одна строка естимейта на нем (можно автоматом подставлять не напрягая пользователя)
     HideControls([Splitter2,Splitter1,Panel6,Panel5,gbENFINMaterials, Splitter3 , sgTKMaterials , sgENEstimateItem , sgSCCounter , Panel2 , Panel3 , btnSelect]);
     
    end;


end;

function TfrmMaterialsRQFKOrderOutSCCounterEdit.makeEstimateCondition(): String;
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


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;

    ///
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    
    //planFilter: ENPlanWorkFilter;
    //planCodes: String;
    condition , mCondition: String;
    ENMaterialsList: ENMaterialsShortList;

    TempENDepartment: ENDepartmentControllerSoapPort;
    depCodes, molOutCode : String;

    code : Integer;
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
    
    {

    planFilter.kind := ENPlanWorkKind.Create;

    planFilter.kind.code := ENPLANWORKKIND_CURRENT;

    planFilter.budgetRef := ENDepartmentRef.Create;


    if rgSide.ItemIndex = 0 then
      planFilter.budgetRef.code := ENBUDGET_ENERGOSBYT
    else
    //if rgSide.ItemIndex = 1 then
      planFilter.budgetRef.code := ENBUDGET_METROLOGY;


    AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');


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

      TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      depCodes := TempENDepartment.getDepartmentCodesDown(departmentCode);
      AddCondition(condition, 'departmentrefcode in (' + depCodes + ')');
    end;
    }

  if edtSCOrderNum.Text <> '' then
  begin
     //planFilter.elementRef.
  end
  else
  begin
    if rqFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then // для списания счетчиков
       planFilter.code := 1017016115
    else
     //  planFilter.code := 0; // :)


    molOutCode := copy(rqFKOrderObj.molOutCode, 1, 2);

    if ((cbAccount.Text = '1532') or (cbAccount.Text = '1126'))
          and (not (DMReports.isMetrologyDepartment('0' + molOutCode))) and (chkIsPlanZamena.Checked = True) then
    begin
      planFilter.conditionSQL := ' enplanwork.code in (select pl.code from enplanwork pl, enestimateitem ei ' +
         ' where pl.code = ei.planrefcode ' +
         //' and pl.monthgen >= (select to_char(current_date,''MM'')::numeric) ' +
         ' and pl.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1) +
         ' and pl.yeargen = ' + edtYearGen.Text +
         ' and ei.accountingtyperefcode = 2 ' +
         ' and pl.departmentrefcode = ' + IntToStr(departmentCode) +
         ' and pl.kindcode = 2 and pl.typerefcode = 100 ' +
         ' and ei.statusrefcode in (1, 5) ' +

         (*' and ((ei.statusrefcode in (1, 5)) ' +
         '   or (ei.statusrefcode = 3 and ei.planrefcode in ( ' +
         '     select pw.code from enplanwork as pw ' +
         '       where pw.elementrefcode in (select code from enelement ' +
         '         where typerefcode in ('
                     + IntToStr(EN_PURCHASES_OBJECT) + ', '
                     + IntToStr(EN_PURCHASES_NO_OBJECT) + '))))) ' +*)

         ' and ei.code not in (select rqfkorderitem2enstmttm.estimateitemcode ' +
         ' from rqfkorderitem2enstmttm, rqfkorderitem ' +
         ' where rqfkorderitem2enstmttm.fkorderitemrefcode = rqfkorderitem.code ' +
         ' and rqfkorderitem.fkorderrefcode = '+ IntToStr(rqFKOrderCode) +'))'
    end
    else
      planFilter.code := 0;


   (*
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

    {
    if chbIsMaster.Checked then
    begin
      AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ masterMOLCode+''')');
    end;
    }

    // искать только в инших закупивлях БЫТ/ПРОМ
    {
    if rgSide.ItemIndex in [ 0, 1 ] then
      AddCondition(condition, 'enplanwork.elementrefcode in (select enelement.code from enelement where enelement.typerefcode in (' + IntToStr(EN_PURCHASES_OBJECT) + ') )')
    else
      AddCondition(condition, 'enplanwork.elementrefcode in (select enelement.code from enelement where enelement.typerefcode = ' + IntToStr(EN_METROLOGY_OBJECT) + ')');
    }

    planFilter.conditionSQL := condition;


    *)
    end; // выбрана разнарядка ...

    mCondition := ' and ei.accountingtyperefcode = ' + IntToStr(TK_ACCOUNTINGTYPE_COUNTER);
    
    UpdateMaterials_(planFilter, mCondition);

end;

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
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

   //sgTKMaterialsClick(sgTKMaterials);
   sgTKMaterialsDblClick(sgTKMaterials);
end;



procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.updateEstimateItemGrid_();
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


   if (cbAccount.Text <> '1532') and (cbAccount.Text <> '1126')
       then sgENEstimateItem.RemoveCheckBox(1,1);


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

    eFilter.accountingTypeRef := TKAccountingTypeRef.Create;
    eFilter.accountingTypeRef.code := TK_ACCOUNTINGTYPE_COUNTER;


    if  ( Length(eCondition) > 0 ) then eFilter.conditionSQL := eCondition;

    eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    Application.ProcessMessages;
    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!

    // 16.06.2012 +++ для передачи счетчиков Метрологии под плановые работы
    if (cbAccount.Text = '1532') or (cbAccount.Text = '1126') and (chkIsPlanZamena.Checked = True) then
        ENEstimateItemList := TempENEstimateItem.getDetailedEstimateBySCCountersList(eFilter, planFilter)
    else ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, planFilter);

    //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

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

         if (cbAccount.Text = '1532') or (cbAccount.Text = '1126')
            then AddCheckBox(1, i+1, false, false);

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

     sgENEstimateItemClick(nil);
end;


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.sgTKMaterialsClick(Sender: TObject);
var
  i, j : integer;
begin
  {
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);
  }

  {
  ClearGrid(sgENEstimateItem);
  ClearGrid(sgSCCounter);
  lblCountInOrder.Caption := '';
  }
  
end;




procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.spbPlanMOLClick(Sender: TObject);
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

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.spbDepartmentClick(
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

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.FormCreate(Sender: TObject);
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

function TfrmMaterialsRQFKOrderOutSCCounterEdit.getEstimateCode() : Integer;
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

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.btnAddMaterialsClick(
  Sender: TObject);
var i, cntCount, estCount, p, m: Integer;
   estimateCode, isAvar: Integer;
   state, estState: boolean;
   scObj: ENMetrologyCounter;
   counterArr: ArrayOfENMetrologyCounters;
   TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
   RQFKOrderObj: RQFKOrder;
   TempRQFKOrder: RQFKOrderControllerSoapPort;
   estArr: ArrayOfInteger;
   molOutCode, s: string;
   Tempenestimateitemcontroller : ENEstimateItemControllerSoapPort;
   manualMoveCounterForServicesParametrized : Boolean;  // ручное перемещение параметризированного счетчика под план услуги на сторону
begin
  TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  Tempenestimateitemcontroller := HTTPRIOENEstimateItem as  ENEstimateItemControllerSoapPort;
  RQFKOrderObj:= TempRQFKOrder.getObject(rqFKOrderCode);

  manualMoveCounterForServicesParametrized := false;
  if (  (cbAccount.Text = '1533' )
   and ((not (DMReports.isMetrologyDepartment('0' + copy(RQFKOrderObj.molOutCode,1,2 ), true)))
    and (not (DMReports.isMetrologyDepartment('0' + copy(RQFKOrderObj.molInCode,1,2 )))))
     )   then    // типа с метролигии перемещают на склад не под конкретный план
     // с кладовщики уже передают со счета 1533 только под план
  manualMoveCounterForServicesParametrized := true;

 if ( (edtSCOrderNum.Text = '' )  and (manualMoveCounterForServicesParametrized = false)  ) then
    begin
      estimateCode := LOW_INT;
      try
        if rqFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
          estimateCode := 1017012300
        else
          estimateCode :=
            StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
      except
        on EConvertError do
          begin
            Application.MessageBox(
              PChar('Не обрано жодного Матеріалу з плану ...'),
              PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
      end;
    end;

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

  if ((cbAccount.Text = '1532') or (cbAccount.Text = '1126')) 
  and (cntCount > 0) and (chkIsPlanZamena.Checked = True) then
    begin
      for i := 1 to sgENEstimateItem.RowCount - 1 do
        sgENEstimateItem.SetCheckBoxState(1, i, false);
      for i := 1 to cntCount do
        sgENEstimateItem.SetCheckBoxState(1, i, true);
    end;

  if ( cntCount = 0 ) then
    begin
      if rqFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
        Application.MessageBox(
          PChar('Не обрано не один лічільник для списання ...'),
          PChar('Увага!'), MB_ICONWARNING)
      else
        Application.MessageBox(
        PChar('Не обрано не один лічільник для переміщення ...'),
        PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

  if ( (edtSCOrderNum.Text = '') and (manualMoveCounterForServicesParametrized = false) ) then
    begin
      if Application.MessageBox(PChar('Обрані ' + IntToStr(cntCount) +
          ' лічильників дійсно "'
          + sgENEstimateItem.Cells[1, sgENEstimateItem.Row] + '" ?? ' ),
        PChar('Внимание !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2)
        <> IDOK
      then
        begin
          Exit;
        end;
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
          scObj.counterType := sgENMetrologyCounter.Cells[12, i];
          if (edtSCOrderNum.Text = '') then
            begin
               // Для счетчиков в аварийном запасе нам не нужно вызывать метод ниже (getEstimateCodeFromMonthPlanByMovingCounterFromStorekeeper2Master)
               isAvar := Integer(sgENMetrologyCounter.Objects[2, i]);

               // NET-4445 если счет 1533 - так будут передавать парметризированые счетчики
               // кладовщики подразделений на мастера и под конкретный план должен быть прийти
               // этот счетчик (ордер на перемещение параметризированного счетчика генерится
               //  автоматом при подписании или предоплате услуг на сторону если там нужен этот счетчик )
               // ----  estimateCode найдем по текущему значению выбранного счетчика
               //       по полю parent_num_un найдем в sccounter поле sccode в енерджинете запись на перемещение со склада метрологии на
               //       кладовщика, который обозначен в этом ордере как МОЛ отправитель .
               //       если нашли месячный план то проверить совпадает ли МОЛ получатель указанный на данном ордере с МОЛом
               //       который указали в пллане месячном если нет МОЛ-а на плане или МОЛ другой то
               //       выдадим сообщение что переместитть такое не можем т.к если МОЛ на плане другой и мы
               //       проведем этот ордер то счетчик окажется на другом МОЛе но под нужный план и это херня
              if (manualMoveCounterForServicesParametrized = true) and (isAvar <> 1) then
                 estimateCode:= Tempenestimateitemcontroller.getEstimateCodeFromMonthPlanByMovingCounterFromStorekeeper2Master(scObj,rqFKOrderObj.molOutCode)
              else if isAvar = 1 then
                 estimateCode := 1017012300;

              scObj.element := ENElement.Create;
              scObj.element.code := estimateCode;
            end;
          scObj.zoneRef := RQStorageZoneRef.Create;
          scObj.zoneRef.code := Integer(sgENMetrologyCounter.Objects[1, i]);
          counterArr[cntCount] := scObj;
          cntCount := cntCount + 1;
          {
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
          }

          //      scObj.name := ;

          //      invNumber := sgENMetrologyCounter.Cells[1, i];
          //      departmentFKCode := sgENMetrologyCounter.Cells[5, i];
          //      molCode := sgENMetrologyCounter.Cells[6, i];

          ///// 09.06.10 ///////////////////////////////////////////////////////////
          // Теперь будем проверять нахождение счетчика не просто в Метрологии,
          // а на подотчете мастера (в данный момент это мастер ЦРПУ Перевезенцева Н.А. (код МОЛа 2729)).
          // А вообще, в будущем нужно будет сделать таблицу и хранить в ней коды МОЛов, на которых можно
          // перемещать счетчики

          // пока что оставляем (на Перевезенцевой еще ничего нет)
          {
          if departmentFKCode <> '027' then
          begin
            Application.MessageBox(PChar('Лічильник "' + invNumber + '" знаходиться НЕ в Метрології!'), PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
           }

          {
          if molCode <> '2729' then
          begin
            Application.MessageBox(PChar('Лічильник "' + invNumber + '" знаходиться НЕ на підзвіті майстра!'), PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;
          }
          //////////////////////////////////////////////////////////////////////////

          { AS
          if CopyRow(sgENMetrologyCounter, sgSelectedCounters, i, 1) then
            sgSelectedCounters.AddCheckBox(1, sgSelectedCounters.RowCount - 1, true, false);
          //sgSelectedCounters.Refresh;
          AS }
        end;
    end;

  molOutCode := copy(rqFKOrderObj.molOutCode, 1, 2);

  if ((cbAccount.Text = '1532') or (cbAccount.Text = '1126'))
  and (not (DMReports.isMetrologyDepartment('0' + molOutCode))) and (chkIsPlanZamena.Checked = true) then
    begin
      estState := false;
      estCount := 0;
         for i := 1 to sgENEstimateItem.RowCount - 1 do
      begin
        sgENEstimateItem.GetCheckBoxState(1, i, estState);

        if estState then
        begin
          estCount := estCount + 1;
        end;
      end;

      if (cntCount <> estCount) then
        begin
          Application.MessageBox(
            PChar('Не співпадає кількість лічільників... Обрано = '
              + IntToStr(cntCount) + ', у планах = ' + IntToStr(estCount)),
            PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;

      SetLength(estArr, estCount);
      estCount := 0;
      estState := false;
      for i := 1 to sgENEstimateItem.RowCount - 1 do
        begin
          sgENEstimateItem.GetCheckBoxState(1, i, estState);
          if estState then
            begin
              estArr[estCount] := StrToInt(sgENEstimateItem.Cells[0, i]);
              estCount := estCount + 1;
            end;
        end;

      for i := 0 to High(counterArr) do
        begin
          counterArr[i].element := ENElement.Create;
          counterArr[i].element.code := estArr[i];
        end;

    end;

  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  if (edtSCOrderNum.Text <> '') then
    begin
      TempRQFKOrderItem.addCSCounters(
        rqFKOrderCode, StrToInt(edtSCOrderNum.Text), counterArr);
    end
  else
    begin
      if RQFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
        TempRQFKOrderItem.addCSCountersForWriteOff(
          rqFKOrderCode, LOW_INT, counterArr)
      else
        TempRQFKOrderItem.addCSCounters(rqFKOrderCode, LOW_INT, counterArr);
    end;

  if ((cbAccount.Text = '1532') or (cbAccount.Text = '1126'))
  and (not (DMReports.isMetrologyDepartment('0' + molOutCode))) and (chkIsPlanZamena.Checked = True) then
    begin
      btnSearchClick(Sender);
      btnSelectClick(Sender);
    end
  else
    begin
      spbSCOrderNumClearClick(Sender);
      sgENEstimateItemClick(Sender);
    end;

  {++++
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

  eList :=  ENEstimateItemShortList.Create;
  eList.totalCount := 0;
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
     eObj.code :=  StrToInt( sgENEstimateItem.Cells[0, i] );
     eObj.countFact := TXSDecimal.Create;
     eObj.countFact.DecimalString := sgENEstimateItem.Cells[2, i];
     //eList.list[n] := ;
     eArr[n] := eObj;
     n := n + 1;
  end;
  end;
  eList.list := eArr;
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
  +++++}

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


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.sgTKMaterialsDblClick(
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

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.actRemove310Execute(
  Sender: TObject);
var
  objCode, objSign : Integer;

  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
  inherited;

  objCode := LOW_INT;
  try
    objCode := StrToInt(sgSCCounter.Cells[0, sgSCCounter.Row]);
  except
    on EConvertError do Exit;
  end;

  objSign := Integer(sgSCCounter.Objects[0, sgSCCounter.Row]);

  if (objSign = 1) then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити прив''язку?'),
                              PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

      if  (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM ) and (rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER) then
        TempRQFKOrderItem.removeCSCountersByCounterCode(objCode, rqFKOrderObj.code)
      else
      if  (rqFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS ) and (rqFKOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER) then
        TempRQFKOrderItem.removeCSCountersByCounterCode(objCode, rqFKOrderObj.code)
      else
        ShowMessage('На таком ордере непонятно что делать ....');

      sgENEstimateItemClick(Sender);
    end;
  end
  else
  begin
    Application.MessageBox(PChar('Ця строка відноситься к іншому видатковому ОЗ ! ' + #13#10 +
                                 'Видаляти можна тільки строки цього ОЗ !'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.btnSearchClick(Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  i, j{, ColCount, LastCount}, isAvar: Integer;
  counterFilter: ENMetrologyCounterFilter;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
  sql : string;
  isSCOrder : Boolean;
begin

{28.10.2011 проверка на выбранный счет}
if (cbAccount.ItemIndex = -1) and (Self.edtSCOrderNum.Text = '') then
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

  //SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);

  TempENMetrologyCounter :=  HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

  if edtSCOrderNum.Text <> '' then ColCount := 10000
    else ColCount := 100;

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

  if edtSCOrderNum.Text <> '' then
  begin
    // что бы не брали один и тотже ... + залоченые ;)
    AddCondition(sql, '  ((nvl(a.energy_lock, -1) < 0) or (nvl(a.energy_lock, -1) = ' + IntToStr(SC_COUNTER_LOCK_NEW_COUNTERS_LOCK) +')) ');

    AddCondition( sql, ' a.num_un in (select oo11.num_un from countersread.nakladnie n111, countersread.draftraznar dr11, countersread.temp_counters tc11, countersread.ostable oo11 ' +
            ' where n111.id = dr11.idnaklad and dr11.id = tc11.id_raznaryadka and tc11.id = oo11.id_temp_counters ' +
            ' and dr11.id = ' + edtSCOrderNum.Text + ')');
  end
  else
  begin



       // NET-4443 - при перемещении счетчиков по счету 1533 отобразим также залоченные
      if ((cbAccount.Text = '1533')
       and (rqFKOrderObj.kind.code = ENConsts.RQFKORDER_KIND_RASHOD_OE2REM )
       and (rqFKOrderObj.accountingTypeRef.code = ENConsts.TK_ACCOUNTINGTYPE_COUNTER)) then
       AddCondition( sql, ' (nvl(a.energy_lock, -1) < 0 or nvl(a.energy_lock, -1) =  '
              + IntToStr( ENConsts.SC_COUNTER_LOCK_SERVICES_COUNTERS_LOCK) + ')' )
       else
        // что бы не брали один и тотже ... + залоченые ;)
      AddCondition(sql, ' nvl(a.energy_lock, -1) < 0 ');



      counterFilter.account := cbAccount.Text;

      if dtpDateIn.Checked then
      begin
        counterFilter.dateIn := TXSDate.Create;
        counterFilter.dateIn.XSToNative(GetXSDate(dtpDateIn.DateTime));
      end;
    {
      if dtpDateBuild.Checked then
      begin
        counterFilter.dateBuild := TXSDate.Create;
        counterFilter.dateBuild.XSToNative(GetXSDate(dtpDateBuild.DateTime));
      end;
    }

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

      counterFilter.zoneRef := RQStorageZoneRef.Create;
      counterFilter.zoneRef.code := zoneCode;

  end;
  //////////////////////////////////////////////////////////////////////////////


    counterFilter.conditionSQL := sql;

    ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(counterFilter, 0, ColCount);

    LastCount := High(ENMetrologyCounterList.list);

    if LastCount > -1 then
       sgENMetrologyCounter.RowCount := LastCount + 2
    else
       sgENMetrologyCounter.RowCount := 2;

    isSCOrder := False;
    if edtSCOrderNum.Text <> '' then
      isSCOrder := True;

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

          /////
          isAvar := 0;
          if ENMetrologyCounterList.list[i].isEmergency <> nil then
            if ENMetrologyCounterList.list[i].isEmergency.AsBoolean then
              isAvar := 1;
          Objects[2, i+1] := TObject(isAvar);
          /////

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


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.spbSCOrderClick(
  Sender: TObject);
var
   frmSCOrderShow :  TfrmSCOrderShow;
   f : SCOrderFilter;
   podrIN , podrOUT : string;
begin
  inherited;

   spbSCOrderNumClearClick(Sender);

   f := SCOrderFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   podrIN := '0' + Copy(edtFinMolCode.Text, 0, 2);
   podrOUT := '0' + Copy(masterMOLCode, 0, 2);


   f.kindRef := SCOrderKindRef.create;
   f.kindRef.code := SCORDERKIND_FOR_PRIHOD;

   f.podrCode := podrOUT ;

   // бортануть уже переданные ?? как??
   f.conditionSQL := 'sccode not in (select so.sccode from scinvoice i, rqfkorderitem oi, rqfkorder o, scorder so ' +
                     ' where o.code = oi.fkorderrefcode and o.kindcode in (' + IntToStr(RQFKORDER_KIND_RASHOD_OE2REM) + ', ' + IntToStr(RQFKORDER_KIND_PACKING_ORDER) + ') and i.fkorderitemrefcode = oi.code ' +
                     ' and i.code = so.invoicerefcode ' +
                     ' and so.kindrefcode = ' + IntToStr(SCORDERKIND_FOR_MOVE) +
                     ' and so.sccode is not null ' + // 07.09.11 Из-за наллов (непроведенные накладные) ничего не выбирается вообще!!!
                     ' and so.podrcode = ''' + podrOUT + ''')';

   frmSCOrderShow:=TfrmSCOrderShow.Create(Application,fmNormal, f);
   try
      frmSCOrderShow.DisableActions([frmSCOrderShow.actInsert, frmSCOrderShow.actDelete, frmSCOrderShow.actEdit,
                                     frmSCOrderShow.actFilter, frmSCOrderShow.actNoFilter]);
      with frmSCOrderShow do
      begin
        if ShowModal = mrOk then
        begin
            try
              edtSCOrderNum.Text := GetReturnValue(sgSCOrder,5);
              cbAccount.ItemIndex := -1;
              DisableControls([cbAccount]);
              HideControls([btnSelect]);
              //ClearGrid(sgENMetrologyCounter);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmSCOrderShow.Free;
   end;

end;

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.spbSCOrderNumClearClick(
  Sender: TObject);
begin
  inherited;
  edtSCOrderNum.Text := '';
  cbAccount.ItemIndex := 0;
  DisableControls([cbAccount], False);
  if rqFKOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
      HideControls([btnSelect])
   else
      HideControls([btnSelect], False);
  ClearGrid(sgENMetrologyCounter);
end;

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.spbStorageZoneNameClearClick(
  Sender: TObject);
begin
  inherited;
  edtStorageZoneName.Text := '';
  zoneCode := LOW_INT;
end;

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.spbStorageZoneNameClick(
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


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.sgENEstimateItemClick(
  Sender: TObject);
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
    objCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;


    counterFilter := SCCounterFilter.Create;
    SetNullIntProps(counterFilter);
    SetNullXSProps(counterFilter);
    counterFilter.kindRef := SCCounterKindRef.Create;
    counterFilter.kindRef.code := 1;


    if (cbAccount.ItemIndex <> 2) then
    begin
      counterFilter.estimateItemRef := ENEstimateItemRef.Create;
      counterFilter.estimateItemRef.code := objCode;
    end;

    //counterFilter.estimateItemRef := ENEstimateItemRef.Create;
    //counterFilter.estimateItemRef.code := estimateItemCode;

    counterFilter.conditionSQL := 'code in '
    //(select qq.sccounterrefcode from rqfkorderitem2enstmttm qq where qq.fkorderitemrefcode = ' + IntToStr(objCode) + ')';
                    +'( select RQFKORDERITEM2ENSTMTTM.sccounterrefcode from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE and RQFKORDERITEM.FKORDERREFCODE = '+ IntToStr(rqFKOrderCode) +')';

    
    {
    counterFilter.conditionSQL := 'sccounter.code in ' +
                                  '(select scusageinputtmz2sccntr.sccounterrefcode from scusageinputtmz2sccntr ' +
                                  ' where scusageinputtmz2sccntr.ozrefcode = ' + IntToStr(SCUsageInputItemOZObj.code) + ')';
    }

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
          RowColor[i+1] := $0080FF80;

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
     //ColCount:=ColCount+1;
     //stringGrid.Row:=1;

   (*
   /////////////////
   counterFilter.conditionSQL := 'code in '
                    +'( select RQFKORDERITEM2ENSTMTTM.sccounterrefcode from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE '
                    //+' and RQFKORDERITEM.fkorderrefcode = '
                    // +' and substring(o.molincode, 1, 2) = ''' + copy(rqFKOrderObj.molInCode, 1, 2) + ''''
                    +' and RQFKORDERITEM2ENSTMTTM.sccounterrefcode is not null '
                    +' and RQFKORDERITEM.FKORDERREFCODE <> '+ IntToStr(rqFKOrderCode) +')';


   SCCounterList := TempSCCounter.getScrollableFilteredList(counterFilter,0,-1);


    if High(SCCounterList.list) > -1 then
    begin
       if list1Count > 0 then
         stringGrid.RowCount:= stringGrid.RowCount + High(SCCounterList.list) + 1
       else
         stringGrid.RowCount:= High(SCCounterList.list) + 2;
    end;
//  else
//     sgENFINMaterials.RowCount:=2;

  with stringGrid do
    for j:=0 to High(SCCounterList.list) do
      begin

        Objects[0, j + list1Count + 1] := TObject(2);
        RowColor[j + list1Count + 1] := clYellow;

          if SCCounterList.list[i].code <> Low(Integer) then
            Cells[0,j + list1Count + 1] := IntToStr(SCCounterList.list[j].code)
          else
            Cells[0,j + list1Count + 1] := '';
          Cells[1,j + list1Count + 1] := SCCounterList.list[j].invNumber;
          Cells[2,j + list1Count + 1] := SCCounterList.list[j].name;
          Cells[3,j + list1Count + 1] := SCCounterList.list[j].buildNumber;
          Cells[4,j + list1Count + 1] := SCCounterList.list[j].account;
          Cells[5,j + list1Count + 1] := SCCounterList.list[j].departmetFKCode;
          Cells[6,j + list1Count + 1] := SCCounterList.list[j].molCode;
          if SCCounterList.list[j].dateIn = nil then
            Cells[7,j + list1Count + 1] := ''
          else
            Cells[7,j + list1Count + 1] := XSDate2String(SCCounterList.list[j].dateIn);
          if SCCounterList.list[i].dateBuild = nil then
            Cells[8,j + list1Count + 1] := ''
          else
            Cells[8,j + list1Count + 1] := XSDate2String(SCCounterList.list[j].dateBuild);
          if SCCounterList.list[i].dateCheck = nil then
            Cells[9,j + list1Count + 1] := ''
          else
            Cells[9,j + list1Count + 1] := XSDate2String(SCCounterList.list[j].dateCheck);
          if SCCounterList.list[i].cost = nil then
            Cells[10,j + list1Count + 1] := ''
          else
            Cells[10,j + list1Count + 1] := SCCounterList.list[j].cost.DecimalString;
          if SCCounterList.list[i].scCode = Low(Integer) then
            Cells[11,j + list1Count + 1] := ''
          else
            Cells[11,j + list1Count + 1] := IntToStr(SCCounterList.list[j].scCode);
          Cells[12,j + list1Count + 1] := SCCounterList.list[j].counterType;
          Cells[13,j + list1Count + 1] := SCCounterList.list[j].installOrderNumber;
          Cells[14,j + list1Count + 1] := SCCounterList.list[j].reading;
          if SCCounterList.list[j].dateEdit = nil then
            Cells[15,j + list1Count + 1] := ''
          else
            Cells[15,j + list1Count + 1] := XSDateTimeWithDate2String(SCCounterList.list[j].dateEdit);
         {
        Application.ProcessMessages;

        if l.list[j].code <> Low(Integer) then
        Cells[0, j + list1Count + 1] := IntToStr(l.list[j].code)
        else
        Cells[0, j + list1Count + 1] := '';

        Objects[0, j + list1Count + 1] := TObject(2);
        RowColor[j + list1Count + 1] := clYellow;

        Cells[1, j + list1Count + 1] := l.list[j].nn;

        Cells[2,j + list1Count + 1] := l.list[j].mat_name;
        Cells[3,j + list1Count + 1] := l.list[j].mu_name;

        if l.list[j].quantity = nil then
          Cells[4,j + list1Count + 1] := ''
        else
          Cells[4,j + list1Count + 1] := l.list[j].quantity.DecimalString;

        Cells[5, j + list1Count + 1] := IntToStr(l.list[j].frc_code) + ' ' + l.list[j].frc_name;

        Cells[6,j + list1Count + 1] := l.list[j].div_name;
        Cells[7,j + list1Count + 1] := l.list[j].rest_purpose_name;

        Cells[8,j + list1Count + 1] := l.list[j].partner_name;
        if l.list[j].doc_date = nil then
          Cells[9,j + list1Count + 1] := ''
        else
          Cells[9,j + list1Count + 1] := XSDate2String(l.list[j].doc_date);
        Cells[10,j + list1Count + 1] := l.list[j].party_discription;

        //Cells[15,i+1] := l.list[i].div_name;


        //sgENFINMaterials.RowCount:= i + 2;
        }
      end;

   /////////////////
   *)

   stringGrid.Row:=1;

end;

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.rgSideClick(
  Sender: TObject);
begin
  inherited;
  DisableControls([spbSCOrder, spbSCOrderNumClear], (rgSide.ItemIndex <> 0) );
{
  if (rgSide.ItemIndex = 0) then
  begin
    DisableControls([spbSCOrder, spbSCOrderNumClear]);
  end;
}
end;

procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.cbAccountChange(Sender: TObject);
var
  molOutCode : String;
  molInCode : String;
begin
  molOutCode := copy(rqFKOrderObj.molOutCode, 1, 2);
  molInCode := copy(rqFKOrderObj.molInCode, 1, 2);

  if ((cbAccount.Text = '1532') or (cbAccount.Text = '1126')) and (not (DMReports.isMetrologyDepartment('0' + molOutCode))) then
   chkIsPlanZamena.Visible := True
   else
   chkIsPlanZamena.Visible := False;


  if ((cbAccount.Text = '1532') or (cbAccount.Text = '1126'))
        and (not (DMReports.isMetrologyDepartment('0' + molOutCode)))  then
  begin
     HideControls([edtMonthGen, edtYearGen], False);
     edtMonthGen.ItemIndex := 7;
  end
  else
  begin
     HideControls([edtMonthGen, edtYearGen]);
     edtMonthGen.ItemIndex := -1;
  end;

   if ((cbAccount.Text = '1533')
   and ((not (DMReports.isMetrologyDepartment('0' + molInCode) ) )
    and (not (DMReports.isMetrologyDepartment('0' + molOutCode, true) ) ))
   ) then
     begin
     btnSelect.Visible := false;
     Panel2.Visible := false;
     Panel4.Visible := false;

     end
  else
     begin
     btnSelect.Visible := true;
     Panel2.Visible := true;
     Panel4.Visible := true;
     end;


  ClearGrids([sgTKMaterials, sgENEstimateItem, sgSCCounter]);
end;


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.sgENMetrologyCounterTopLeftChanged(Sender: TObject);
var
  TempENMetrologyCounter : ENMetrologyCounterControllerSoapPort;
  i, n, CurrentRow, isAvar : Integer;
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

      if edtSCOrderNum.Text <> '' then
      begin
        // что бы не брали один и тотже ... + залоченые ;)
        AddCondition(sql, '  ((nvl(a.energy_lock, -1) < 0) or (nvl(a.energy_lock, -1) = ' + IntToStr(SC_COUNTER_LOCK_NEW_COUNTERS_LOCK) +')) ');

        AddCondition( sql, ' a.num_un in (select oo11.num_un from countersread.nakladnie n111, countersread.draftraznar dr11, countersread.temp_counters tc11, countersread.ostable oo11 ' +
                ' where n111.id = dr11.idnaklad and dr11.id = tc11.id_raznaryadka and tc11.id = oo11.id_temp_counters ' +
                ' and dr11.id = ' + edtSCOrderNum.Text + ')');
      end
      else
      begin

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

      end;

      counterFilter.conditionSQL := sql;

      ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(counterFilter, ColCount-1, 100);

      isSCOrder := False;
         if edtSCOrderNum.Text <> '' then
      isSCOrder := True;

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

              /////
              isAvar := 0;
              if ENMetrologyCounterList.list[i].isEmergency <> nil then
                if ENMetrologyCounterList.list[i].isEmergency.AsBoolean then
                  isAvar := 1;
              Objects[2, i+CurrentRow] := TObject(isAvar);
              /////

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


procedure TfrmMaterialsRQFKOrderOutSCCounterEdit.chkIsPlanZamenaClick(
  Sender: TObject);
begin
  // inherited;
  ClearGrids([sgTKMaterials, sgENEstimateItem, sgSCCounter]);


  if chkIsPlanZamena.Checked = True  then
  begin
     HideControls([edtMonthGen, edtYearGen], False);
     edtMonthGen.ItemIndex := 7;
  end
  else
  begin
     HideControls([edtMonthGen, edtYearGen]);
     edtMonthGen.ItemIndex := -1;
  end;

end;

end.
