unit EditMaterialsRQFKOrderOutE2E;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController
  , RQOrderItemController, FINMaterialsController
  , RQFKOrderController, TB2Item, TB2Dock, TB2Toolbar, ImgList
  ;

type
  TfrmMaterialsRQFKOrderOutE2EEdit = class(TDialogForm)
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
    PanelFINMaterials: TPanel;
    Splitter2: TSplitter;
    gbFINMaterials: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblFINMol: TLabel;
    spbFINMol: TSpeedButton;
    sgFINMaterials: TAdvStringGrid;
    edtNomenclature: TEdit;
    edtMaterialName: TEdit;
    btnFind: TButton;
    edtFINMol: TEdit;
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
    HTTPRIORQFKOrderItem: THTTPRIO;
    actRemove310: TAction;
    edtCFO: TEdit;
    Label3: TLabel;
    chbIsTranzit: TCheckBox;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    chbIsMaster: TCheckBox;
    Label6: TLabel;
    HTTPRIORQFKOrderData2FKParty: THTTPRIO;
    chbIsCNOperative: TCheckBox;
    lblPriConnectionNumber: TLabel;
    edtPriConnectionNumber: TEdit;
    rgSearch: TRadioGroup;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    sgTKMaterials: TAdvStringGrid;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Panel6: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    sgENEstimateItemTranzit: TAdvStringGrid;
    Panel9: TPanel;
    Splitter4: TSplitter;
    Panel10: TPanel;
    Panel11: TPanel;
    sgENFINMaterials: TAdvStringGrid;
    actViewPlanTranzit: TAction;
    pmENEstimateItemTranzit: TPopupMenu;
    N1: TMenuItem;
    actViewPlan: TAction;
    pmENEstimateItem: TPopupMenu;
    MenuItem1: TMenuItem;
    actViewFKOrder: TAction;
    pmENFINMaterials: TPopupMenu;
    N2: TMenuItem;
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

    procedure ShowHideIsCN();


   function makeEstimateCondition(): String;
    procedure sgTKMaterialsDblClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure sgENEstimateItemDblClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure chbIsTranzitClick(Sender: TObject);
    procedure sgFINMaterialsDblClick(Sender: TObject);
    procedure rgSearchClick(Sender: TObject);
    procedure sgFINMaterialsClick(Sender: TObject);

    procedure updateENFINMaterialsGrid();
    procedure sgENEstimateItemTranzitClick(Sender: TObject);
    procedure sgENEstimateItemTranzitCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure actViewPlanTranzitExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actViewFKOrderExecute(Sender: TObject);
  private
    { Private declarations }
    partyCode: Integer;
    frcCode: Integer;
    nn: String;
    procedure createFinMaterialsFilter(var fmFilter: FINMaterialsFilter; estimateItemCode: Integer);
    function getFinMaterialCode(estimateItemCode: Integer): Integer;
  public
    { Public declarations }
    //RQOrderItemObj: RQOrderItem;

    rqFKOrderCode : Integer;
    rqFKOrderObj : RQFKOrder;
    finDoc : Integer;


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
    procedure updateFINMaterialsGrid();
    //procedure updateENFINMaterialsGrid();
    //procedure clearGrids();
  end;

var
  frmMaterialsRQFKOrderOutE2EEdit: TfrmMaterialsRQFKOrderOutE2EEdit;


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
  {FINMaterialsController, }FINDoc2FKOrderController, FINDocTypeController,
  FINMaterialsStatusController, EditFINMaterialCount, FINMolDataController,
  RQFKOrderItemController, RQFKOrderItem2ENEstimateItemController,
  RQFKOrderData2FKPartyController, ENEstimateItem2ENEstimateItemController,
  ENEstimateItem2TypeController, RQFKOrderKindController, EditRQFKOrder;

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
          ,'Номенклатурний №' // НЕ двигать !!! ... берем данные!!!
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
          ,'код ЦФВ'  // НЕ двигать !!! ... берем данные!!!
          ,'ЦФВ'
          ,'Ціна розрахункова'
          ,'ПІБ МОЛа'
          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Балансовий рахунок'
          //-----------------
          ,'mat_id'
          ,'party_id' // НЕ двигать !!! ... берем данные!!!
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

  FINMaterialsShortHeaders: array [1..16] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'код,назва ЦФВ'
          ,'МОЛ'
          ,'Призначення залишку'
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код партії'
          //,'тип строки кошторису'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );

procedure TfrmMaterialsRQFKOrderOutE2EEdit.ShowHideIsCN();
begin
    if budgetCode = 75000011 then // для ВРТУВД
    begin
      // if not chbIsTranzit.Checked then
      HideControls([chbIsCNOperative], chbIsTranzit.Checked);
      HideControls([lblPriConnectionNumber, edtPriConnectionNumber], false);
    end
    else begin
      HideControls([chbIsCNOperative, lblPriConnectionNumber, edtPriConnectionNumber]);
      edtPriConnectionNumber.Text := '';
    end;
end;


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


////////////////////////////////////////////////////////////////////////////////
(*
procedure TfrmMaterialsRQFKOrderOutE2EEdit.updateENFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j{, estimateItemCode}, list1Count: Integer;
  l: FINMaterialsShortList;
  f : FINMaterialsFilter;
  //balansNumberCondition, materialCondition : String;
  estimateCode : Integer;
begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   for i:=1 to sgENFINMaterials.RowCount-1 do
     for j:=0 to sgENFINMaterials.ColCount-1 do
       sgENFINMaterials.Cells[j,i]:='';
   sgENFINMaterials.RowCount := 2;
   sgENFINMaterials.RowColor[1] := clWindow;

   try
     //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
     estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
   except
     on EConvertError do Exit;
   end;

   f := FINMaterialsFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);

   f.estimateItemRef := ENEstimateItemRef.Create;
   f.estimateItemRef.code := estimateCode; //estimateItemCode; //estimateObj.code;

   f.statusRef := FINMaterialsStatusRef.Create;
   f.statusRef.code := FINMATERIALSSTATUS_GOOD;

   f.conditionSQL := 'finmaterials.code in '
                    +'( select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE and RQFKORDERITEM.FKORDERREFCODE = '+ IntToStr(rqFKOrderCode) +')';
   l := TempFINMaterials.getScrollableFilteredList(f,0,-1);

   list1Count := High(l.list) + 1;

  if High(l.list) > -1 then
     sgENFINMaterials.RowCount:=High(l.list)+2
  else
     sgENFINMaterials.RowCount:=2;

   with sgENFINMaterials do
    for i:=0 to High(l.list) do
      begin
        //Application.ProcessMessages;

        if l.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(l.list[i].code)
        else
        Cells[0,i+1] := '';

        Objects[0, i+1] := TObject(1);
        RowColor[i+1] := $0080FF80;

        Cells[1,i+1] := l.list[i].nn;
        Cells[2,i+1] := l.list[i].mat_name;
        Cells[3,i+1] := l.list[i].mu_name;

        if l.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := l.list[i].quantity.DecimalString;

        Cells[5, i+1] := IntToStr(l.list[i].frc_code) + ' ' + l.list[i].frc_name;

        Cells[6,i+1] := l.list[i].div_name;
        Cells[7,i+1] := l.list[i].rest_purpose_name;

        Cells[8,i+1] := l.list[i].partner_name;
        if l.list[i].doc_date = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(l.list[i].doc_date);
        Cells[10,i+1] := l.list[i].party_discription;

        //Cells[15,i+1] := l.list[i].div_name;


        sgENFINMaterials.RowCount:= i + 2;
      end;

   /////////////////
   f.conditionSQL := 'finmaterials.code in '
                    +'( select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM, RQFKORDER o where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE '
                    +' and RQFKORDERITEM.fkorderrefcode = o.code '
                    // +' and substring(o.molincode, 1, 2) = ''' + copy(rqFKOrderObj.molInCode, 1, 2) + ''''
                    +' and RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null '
                    +' and RQFKORDERITEM.FKORDERREFCODE <> '+ IntToStr(rqFKOrderCode) +')';


   l := TempFINMaterials.getScrollableFilteredList(f,0,-1);


    if High(l.list) > -1 then
    begin
       if list1Count > 0 then
         sgENFINMaterials.RowCount:= sgENFINMaterials.RowCount + High(l.list) + 1
       else
         sgENFINMaterials.RowCount:= High(l.list) + 2;
    end;
//  else
//     sgENFINMaterials.RowCount:=2;

  with sgENFINMaterials do
    for j:=0 to High(l.list) do
      begin
        //Application.ProcessMessages;

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
      end;

   /////////////////


   sgENFINMaterials.Row:=1;
end;
*)
////////////////////////////////////////////////////////////////////////////////

procedure TfrmMaterialsRQFKOrderOutE2EEdit.updateFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j : Integer;
  cfoCode : string;
  FINMaterialsList : FINMaterialsList_;
  fmList : FINMaterialsShortList;
  fmFilter : FINMaterialsFilter;

  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  RQFKOrderItem2ENEstimateItemList: RQFKOrderItem2ENEstimateItemShortList;
  f2 : RQFKOrderItem2ENEstimateItemFilter;

  TempRQFKOrderData2FKParty: RQFKOrderData2FKPartyControllerSoapPort;
  RQFKOrderData2FKPartyList: RQFKOrderData2FKPartyShortList;
  f : RQFKOrderData2FKPartyFilter;


  fCondition, partyCondition, condition : String;
  estimateCode : Integer;
  //estimateObj : ENEstimateItem;

  balansNumberCondition, materialCondition : String;
  finFilter : FINMaterialsFilter;
  dateRemains : TXSDate;
  plan : ENPlanWork;

  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  orderItemFilter :  RQFKOrderItemFilter;
  orderItemList : RQFKOrderItemShortList;

begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   {
   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;
   }

   ClearGrids([sgFINMaterials, sgENEstimateItemTranzit, sgENFINMaterials]);

   //SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);

   // ПЕРЕДЕЛАли !!!!!!!!!!! на фильтр ....

      balansNumberCondition := ''; //and rpsc.bal_sch in ("+ balansNumberCondition +")
      //molCode := actObj.finMolCode ;

      // пофтльтруем материалы с недопроведенными статусами ...
      //materialCondition := '';  // and rst.mat_id in ("+ materialCondition +")

      materialCondition := ' and h.op_kind_id not in(''5'',''10'',''310'',''300'',''320'',''321'',''20'',''15'', ''322'')';


{
      if (edtMaterialName.Text <> '') then
      begin
         materialCondition := ' and upper(rst.mat_name) like ' + chr(39) + '%'+ AnsiUpperCase(edtMaterialName.Text) + '%' + chr(39) ;
      end;

      If (edtNomenclature.Text <> '') then
      begin
        materialCondition := materialCondition + ' and upper(rst.nn) like ' + chr(39) + '%'+ AnsiUpperCase(edtNomenclature.Text) + '%' + chr(39) ;
      end;
}

      finFilter := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter);
      SetNullXSProps(finFilter);

      condition := '';
(*
      if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) then
        chbIsTranzit.Checked := False;

if (rgSearch.ItemIndex = 0) then
begin

      // транзит - фильтр по номенклатурам + ПАРТИИ
      if chbIsTranzit.Checked then
      begin

           try
             //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
             estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
            {
            f := RQFKOrderItem2ENEstimateItemFilter.Create;
            SetNullIntProps(f);
            SetNullXSProps(f);
            f.estimateItem := ENEstimateItem.Create;
            f.estimateItem.code := estimateCode;
            f.conditionSQL := 'finmaterialsrefcode is null';
            TempRQFKOrderItem2ENEstimateItem :=  HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
            RQFKOrderItem2ENEstimateItemList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(f, 0, -1);
            fCondition := '';
            for i:=0 to RQFKOrderItem2ENEstimateItemList.totalCount - 1 do
            begin
                AddListPos(fCondition, IntToStr(RQFKOrderItem2ENEstimateItemList.list[i].fkOrderItemRefNomenclatureCode));
            end;
            }
            f := RQFKOrderData2FKPartyFilter.Create;
            SetNullIntProps(f);
            SetNullXSProps(f);
            f.estimateItemRef := ENEstimateItemRef.Create;
            f.estimateItemRef.code := estimateCode;
            //f.conditionSQL := 'finmaterialsrefcode is null';
            TempRQFKOrderData2FKParty :=  HTTPRIORQFKOrderData2FKParty as RQFKOrderData2FKPartyControllerSoapPort;
            RQFKOrderData2FKPartyList := TempRQFKOrderData2FKParty.getScrollableFilteredList(f, 0, -1);
            fCondition := '';
            partyCondition := '';
            for i:=0 to RQFKOrderData2FKPartyList.totalCount - 1 do
            begin
                AddListPos(fCondition, IntToStr(RQFKOrderData2FKPartyList.list[i].fkOrderItemRefNomenclatureCode));
                AddListPos(partyCondition, IntToStr(RQFKOrderData2FKPartyList.list[i].partyCode));
            end;
           except
               on EConvertError do Exit;
           end;

           if (length(fCondition) > 0 ) then
           begin
             AddCondition( condition , ' DAT.MAT_ID in ( ' + fCondition + ')');
           //  AddCondition(condition , 'DAT.party_id in ('+ partyCondition +')');
           end ;


           //if (length(fCondition) > 0 ) then
           //begin
           //  AddCondition( condition , ' DAT.MAT_ID in ( ' + fCondition + ')');
           //  AddCondition(condition , 'DAT.party_id in ('+ partyCondition +')');
           //end
           //else
           begin

               fmFilter := FINMaterialsFilter.Create;
               SetNullXSProps(fmFilter);
               SetNullIntProps(fmFilter);

               fmFilter.estimateItemRef := ENEstimateItemRef.Create;
               fmFilter.estimateItemRef.code := estimateCode;
               //fmFilter.conditionSQL := 'finmaterials.statusrefcode in ('+ IntToStr(FINMATERIALSSTATUS_GOOD)+','+ IntToStr(FINMATERIALSSTATUS_VIRTUAL) +')';
               fmFilter.conditionSQL := 'finmaterials.statusrefcode in ('+ IntToStr(FINMATERIALSSTATUS_VIRTUAL) +')';
               fmList := TempFINMaterials.getScrollableFilteredList(fmFilter, 0, -1);

                //partyCondition := '';
                for i:=0 to fmList.totalCount - 1 do
                begin
                    AddListPos(partyCondition, IntToStr(fmList.list[i].party_id));
                end;

                 if (length(partyCondition) > 0 ) then
                 begin
                   AddCondition( condition , ' DAT.party_id in ( ' + partyCondition + ')');
                 end
                 else
                 begin
                    // совсем ОПЯТЬ НИЧЕ не найдено :( ...
                 end;

{
               // разбивик по партиям типа НЕТУ .. фильтранем хотябы по номенклатурам ...
               f2 := RQFKOrderItem2ENEstimateItemFilter.Create;
                SetNullIntProps(f2);
                SetNullXSProps(f2);
                f2.estimateItem := ENEstimateItem.Create;
                f2.estimateItem.code := estimateCode;
                f2.conditionSQL := 'finmaterialsrefcode is null';
                TempRQFKOrderItem2ENEstimateItem :=  HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
                RQFKOrderItem2ENEstimateItemList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(f2, 0, -1);
                fCondition := '';
                for i:=0 to RQFKOrderItem2ENEstimateItemList.totalCount - 1 do
                begin
                    AddListPos(fCondition, IntToStr(RQFKOrderItem2ENEstimateItemList.list[i].fkOrderItemRefNomenclatureCode));
                end;

                 if (length(fCondition) > 0 ) then
                 begin
                   AddCondition( condition , ' DAT.MAT_ID in ( ' + fCondition + ')');
                 end
                 else
                 begin
                     fCondition := '-1';

                     // и номенклатур НЕТу .. вытяним хоть какие нибудь для такого материала (TKMaterials)...
                     orderItemFilter := RQFKOrderItemFilter.Create;
                     SetNullIntProps(orderItemFilter);
                     SetNullXSProps(orderItemFilter);
                     orderItemFilter.conditionSQL := 'rqfkorderitem.code in ' +
                                                     '(select rqfkorderitem.code from rqfkorderitem, rqfkorder where rqfkorder.code =  rqfkorderitem.fkorderrefcode '+
                                                     ' and rqfkorder.kindcode = ' + IntToStr(RQFKORDER_KIND_PRIHOD_POSTAVKA) +
                                                     ' and rqfkorder.statuscode = '+ IntToStr(RQFKORDER_STATUS_IN_FK) +
                                                     ' and  rqfkorderitem.materialcode = ' +
                                                     '  (select enestimateitem.materialrefcode from enestimateitem where enestimateitem.code = '+ IntToStr(estimateCode) + ')'+
                                                     ')';
                     orderItemFilter.orderBySQL := 'rqfkorderitem.code desc';

                    TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
                    orderItemList := TempRQFKOrderItem.getScrollableFilteredList(orderItemFilter, 0, -1);
                    for i:=0 to orderItemList.totalCount - 1 do
                    begin
                        AddListPos(fCondition, IntToStr(orderItemList.list[i].nomenclatureCode));
                    end;
                     if (length(fCondition) > 0 ) then
                     begin
                         AddCondition( condition , ' DAT.MAT_ID in ( ' + fCondition + ')');
                     end;

                 end;
}
           end;


           //AddCondition(condition, 'DAT.RE');
           //*** 28.09.12 NET-3102
           // finFilter.rest_purpose_id := REST_PURPOSE_ID_TRANZIT;
           finFilter.rest_purpose_type_id := REST_PURPOSE_TYPE_ID_TRANZIT;
           //***
      end
      else
      begin
         //*** 28.09.12 NET-3102
         // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT));
         AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
         //***
      end;

      // если приеднання - фильтруем по нему ... если нет - выкидываем материалы для ПЕ
      //finFilter.conditionSQL := ' isCN '

{
      if planWork.typeRef.code = ENPLANWORKTYPE_CN then
      begin
        if planWork.priConnectionNumber <> '' then
          finFilter.conditionSQL := ' isCN is not null and trim(rest_purpose_name) like ''%' + planWork.priConnectionNumber + ''''
        else
          finFilter.conditionSQL := ' isCN is not null';
      end
      else
}

  // договора ПРИЭДНАНЬ
      if chbIsTranzit.Checked then
      begin
        AddCondition(condition, ' isCN is null');
      end
      else
      begin
        try
          estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
        except
            on EConvertError do Exit;
        end;

        // все шо есть на запасе
        if not chbIsCNOperative.Checked then
        begin
            plan := DMReports.getPlanByEstimateCode(estimateCode);
            if plan.typeRef.code = ENPLANWORKTYPE_CN then
            begin
                if plan.priConnectionNumber <> '' then
                   AddCondition(condition, ' isCN is not null and trim(rest_purpose_name) like ''%' + plan.priConnectionNumber + '''')
                else
                   AddCondition(condition,' isCN is not null');
             end
             else
               AddCondition(condition, ' isCN is null');
         end
         else
         begin

         end;

      end;

end // поиск из планов ...
else
if (rgSearch.ItemIndex = 1 ) then // разноска из ОСТАТКОВ ...
begin

end;
*)

      //finFilter.conditionSQL := ' isCN is null';

      //*** 28.09.12 NET-3102
      // finFilter.rest_purpose_id := REST_PURPOSE_ID_TRANZIT;
      finFilter.rest_purpose_type_id := REST_PURPOSE_TYPE_ID_TRANZIT;
      //***

      // исщем с фильтрами ...
      if (edtMaterialName.Text <> '') then
        finFilter.mat_name := '*' + edtMaterialName.Text + '*';
      If (edtNomenclature.Text <> '') then
        finFilter.nn := '*' + edtNomenclature.Text + '*';

      //AddCondition(condition, '');
      AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''15'', ''20'', ''22'') ) ');


{
      if not chbIsCNOperative.Checked then
      begin
          plan := DMReports.getPlanByEstimateCode(estimateCode);
          if plan.typeRef.code = ENPLANWORKTYPE_CN then
          begin
              if plan.priConnectionNumber <> '' then
                 AddCondition(condition, ' isCN is not null and trim(rest_purpose_name) like ''%' + plan.priConnectionNumber + '''')
              else
                 AddCondition(condition,' isCN is not null');
           end
           else
             AddCondition(condition, ' isCN is null');
       end;
}

      finFilter.conditionSQL := condition;
      finFilter.orderBySQL := ' dat.mat_name';


      dateRemains := TXSDate.Create;
      dateRemains.XSToNative(GetXSDate( StrToDate('31.01.3000') ));

      //finDocCode := actObj.finDocCode ;//low(Integer);
      //dateDoc := TXSDate.Create;
      //frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));
      //frmFINMaterialsDataShow.dateDoc := actObj.dateGen;
      
{
пока уберем ...

      if  budgetCode > 0 then begin
        cfoCode := DMReports.getCFOByBudgetCode(budgetCode);
        if cfoCode > LOW_INT then
        begin
        // !!!
          AddCondition(materialCondition, ' and rst.budget_core_id = ' + IntToStr(cfoCode));
        end;
      end;
}

      if  edtCFO.Text <> '' then begin
        cfoCode := edtCFO.Text;//DMReports.getCFOByBudgetCode(budgetCode);
        if StrToInt(cfoCode) > LOW_INT then
        begin
        // !!!
          AddCondition(materialCondition, ' rst.budget_core_id = (' +
                                          ' SELECT c.id FROM sprav.budget_core c, sprav.frc_list f ' +
                                          ' WHERE c.frc_list_id = f.id ' +
                                          ' AND f.code = ' + chr(39) + cfoCode + chr(39) + ')');

        end;
      end;

   FINMaterialsList := TempFINMaterials.getMaterialsList(
                  finFilter,
                  balansNumberCondition,
                  // actObj.finMolCode,
                  molCode, //
                  materialCondition,
                  //actObj.dateGen,
                  //dateRemains,
                  rqFKOrderObj.dateGen,
                  //* actObj.finDocCode
                  finDoc
                  );

  if High(FINMaterialsList.list) > -1 then
     sgFINMaterials.RowCount:=High(FINMaterialsList.list)+2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to High(FINMaterialsList.list) do
      begin
        Application.ProcessMessages;

        if FINMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := FINMaterialsList.list[i].nn;
        Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;

        if FINMaterialsList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := FINMaterialsList.list[i].quantity.DecimalString;

        Cells[5,i+1] := FINMaterialsList.list[i].rest_purpose_name;


        Cells[6,i+1] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[8,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        //Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);

        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+1] := FINMaterialsList.list[i].frc_name;

        if FINMaterialsList.list[i].calc_price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;

        Cells[15,i+1] := FINMaterialsList.list[i].div_name;

        if FINMaterialsList.list[i].price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;

// ---------------------------------------

        if FINMaterialsList.list[i].mat_id = Low(Integer) then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := IntToStr(FINMaterialsList.list[i].mat_id);

        if FINMaterialsList.list[i].party_id = Low(Integer) then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);  // НЕ двигать !!! ... берем данные!!!

         Cells[21, i+1] := FINMaterialsList.list[i].partner;

         Cells[22, i+1] := IntToStr(FINMaterialsList.list[i].mu_id) ;

         Cells[23, i+1] := FINMaterialsList.list[i].doc_num;

        sgFINMaterials.RowCount:= i + 2;
      end;

   sgFINMaterials.Row:=1;
end;




procedure TfrmMaterialsRQFKOrderOutE2EEdit.spbENElementClick(Sender: TObject);
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

procedure TfrmMaterialsRQFKOrderOutE2EEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   cfoCode : string;
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
              //HideControls([], (budgetCode <> 75000011) an ) // для ВРТУВД
              {
              if budgetCode = 75000011 then // для ВРТУВД
              begin
                // if not chbIsTranzit.Checked then
                HideControls([chbIsCNOperative], chbIsTranzit.Checked)
              end
              else
                HideControls([chbIsCNOperative]);
              }
              ShowHideIsCN;

              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgetName;

              cfoCode := DMReports.getCFOByBudgetCode(budgetCode);
              if StrToInt(cfoCode) > LOW_INT then
                 edtCFO.Text := cfoCode;
               //clearGrids();
               ClearGrids([sgTKMaterials, sgENEstimateItem, sgFINMaterials{, sgENFINMaterials}]);
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

procedure TfrmMaterialsRQFKOrderOutE2EEdit.FormShow(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
  FINDoc2FKOrderList: FINDoc2FKOrderShortList;
  FINDoc2FKOrderFilterObj: FINDoc2FKOrderFilter;

begin
  DisableControls([edtDepartment, edtENElementName, edtENBudgetName, edtFINMol]);

  HideControls([chbIsTranzit, chbIsCNOperative, rgSearch]);
{
  DisableControls([spbENElement, spbENElementClear
                   ,spbENBudget, spbENBudgetClear
                   ,spbDepartment, spbDepartmentClear
                   ]);
}
  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);
//  SetGridHeaders(ENFINMaterialsHeaders, sgENFINMaterials.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItemTranzit.ColumnHeaders);
  SetGridHeaders(FINMaterialsShortHeaders, sgENFINMaterials.ColumnHeaders);  

  ///
  edtDepartment.Text:= departmentName;
  edtENBudgetName.Text := budgetName;

  edtMonthGen.ItemIndex := -1;

  if (materialsINCode <> LOW_INT) then
  begin
      //btnSelectClick(Sender);
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  rqFKOrderObj := TempRQFKOrder.getObject(rqFKOrderCode);

  FINDoc2FKOrderFilterObj := FINDoc2FKOrderFilter.Create;
  SetNullIntProps(FINDoc2FKOrderFilterObj);
  SetNullXSProps(FINDoc2FKOrderFilterObj);

  FINDoc2FKOrderFilterObj.fkOrderRef := RQFKOrderRef.Create;
  FINDoc2FKOrderFilterObj.fkOrderRef.code := rqFKOrderObj.code;
  FINDoc2FKOrderFilterObj.finDocTypeRef := FINDocTypeRef.Create;
  // Уже 312 ;) FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_310;
  FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_312;

  TempFINDoc2FKOrder :=  HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
  FINDoc2FKOrderList := TempFINDoc2FKOrder.getScrollableFilteredList(FINDoc2FKOrderFilterObj,0,-1);
  if   FINDoc2FKOrderList.totalCount > 0 then
  begin
     finDoc := FINDoc2FKOrderList.list[0].finDocCode;
  end
  else
  begin
      ShowMessage('Страшная ошибка при работе с ФинКоллекцией ... удалите Ордер !!!');
      exit;
  end;

end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  //clearGrids();
  ClearGrids([sgTKMaterials, sgENEstimateItem, sgFINMaterials{, sgENFINMaterials}]);
  ShowHideIsCN;
end;

function TfrmMaterialsRQFKOrderOutE2EEdit.makeEstimateCondition(): String;
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


procedure TfrmMaterialsRQFKOrderOutE2EEdit.btnSelectClick(Sender: TObject);
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
    depCodes : String;

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




    planFilter.kind := ENPlanWorkKind.Create;

    planFilter.kind.code := ENPLANWORKKIND_CURRENT;

    AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');

    {
    if ( rgSearch.ItemIndex = 1) then
    begin

          try
            code :=  StrToInt( sgFINMaterials.Cells[20 , sgFINMaterials.Row ]);
          except on EConvertError do Exit;
          end;

         mCondition := 'and ei.code in (select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         +' rqfkorderdata2fkparty.partycode = '+ IntToStr(code) +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code)
         +' and finmaterials.statusrefcode not in ('+ IntToStr(FINMATERIALSSTATUS_CANCELED) +','+ IntToStr(FINMATERIALSSTATUS_MOVED) +'))';

         condition := 'enplanwork.code in (select planrefcode from enestimateitem where enestimateitem.code in ('
         +'  select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         +' rqfkorderdata2fkparty.partycode = '+ IntToStr(code) +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code)
         +' and finmaterials.statusrefcode not in ('+ IntToStr(FINMATERIALSSTATUS_CANCELED) +','+ IntToStr(FINMATERIALSSTATUS_MOVED) +'))'
         +')';

         planFilter.conditionSQL := condition;
         //planFilter.code := -1; // шоб ниче не нашли ...
         UpdateMaterials_(planFilter, mCondition);

         Exit;
    end;
    }

   if budgetCode <= 0 then
   begin
       ShowMessage('Виберіть Бюджетотримача ...');
       exit;
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

      TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
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

    { это НЕ ТОТ мОЛ !!!!
    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;
    }


    /////
    {
    if chbOnlyOtherPurchases.Checked then
    begin
       AddCondition(condition,
                    'enplanwork.elementrefcode in ' +
                    '(select enelement.code from enelement where enelement.typerefcode in (' +
                    IntToStr(EN_PURCHASES_OBJECT) + ', ' + IntToStr(EN_PURCHASES_NO_OBJECT) + '))');
    end;
    }
    /////


    //mCondition := ' and ei.kindrefcode <> ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT);

    if chkkindrefcodemat.Checked then
        mCondition := ' and ei.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_GSM)
    else
        mCondition := ' and ei.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_MATERIALS);

    ///////
    if budgetCode = 75000011 then
      if edtPriConnectionNumber.Text <> '' then
        planFilter.priConnectionNumber := edtPriConnectionNumber.Text;
    ///////


    
    //if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL) then

    {
    if ( rgSearch.ItemIndex = 0) then
    begin
      if chbIsTranzit.Checked then
      begin
          mCondition := mCondition + '  and ei.statusrefcode = ' + IntToStr(ENESTIMATEITEMSTATUS_PRESENT) ;
      end
      else
      begin
         mCondition := mCondition + ' and ei.code not in (select RQFKORDERITEM2ENSTMTTM.ESTIMATEITEMCODE from RQFKORDERITEM2ENSTMTTM where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null)';
      end;
    end;
    }
    
    //else
    //    ShowMessage('Непонятный статус материалов ... нот RQFKORDER_KIND_RASHOD_OE2REM');

    planFilter.conditionSQL := condition;

    UpdateMaterials_(planFilter, mCondition);

end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmMaterialsRQFKOrderOutE2EEdit.UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
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

   sgTKMaterialsClick(sgTKMaterials);

   if rgSearch.ItemIndex = 1 then
   begin
      sgTKMaterialsDblClick(sgTKMaterials);
   end;



   //sgENPlanWorkClick(sgENPlanWork);
end;



procedure TfrmMaterialsRQFKOrderOutE2EEdit.updateEstimateItemGrid_();
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
   //sgENEstimateItem.RemoveCheckBox(1,1);


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
    //eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    /////
    if chkkindrefcodemat.Checked then
        eFilter.kindRef.code := ENESTIMATEITEMKIND_GSM
    else
        eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;
    /////

    //planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';
    {
    if departmentCode > 0 then
    begin
      //AddCondition(planCondition, 'enplanwork.departmentrefcode = ' + IntToStr(departmentCode));
      pFilter.departmentRef := ENDepartmentRef.Create;
      pFilter.departmentRef.code := departmentCode;
    end;
    }


{
    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;
}
{
    if budgetCode > 0 then
    begin
      //AddCondition(planCondition, 'enplanwork.budgetrefcode = ' + IntToStr(budgetCode));
      pFilter.budgetRef := ENDepartmentRef.Create;
      pFilter.budgetRef.code := budgetCode;
    end;
}
    //planFilter.kind := ENPlanWorkKind.Create;
    // в самом запросе  AddCondition(planCondition, 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT));

{

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
}
      //planFilter.monthGen := edtMonthGen.ItemIndex + 1;
      //AddCondition(planCondition, 'enplanwork.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1));
      //pFilter.monthGen := edtMonthGen.ItemIndex + 1 ;

      // выбираем ТОЛЬКО не плановые !!!!
      //pFilter.formRef := ENPlanWorkFormRef.Create;
      //pFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;


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

    //if rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then


{ AS !!!
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL) then
    begin
      //eFilter.conditionSQL := 'enestimateitem.statusrefcode in ('+ IntToStr(ENESTIMATEITEMSTATUS_TMP) +', ' + IntToStr(ENESTIMATEITEMSTATUS_PLANNED) +') ';
      eFilter.conditionSQL := 'enestimateitem.statusrefcode = '+ IntToStr(ENESTIMATEITEMSTATUS_PRESENT) ;
    end
    else
      ShowMessage('Unknown fkorder kind ... not RQFKORDER_KIND_RASHOD_OE2REM');
}

{
if ( rgSearch.ItemIndex = 0) then
begin

    if chbIsTranzit.Checked then
    begin
        //eFilter.conditionSQL := ' enestimateitem.statusrefcode = ' + IntToStr(ENESTIMATEITEMSTATUS_PRESENT) ;
        AddCondition( eCondition , ' enestimateitem.statusrefcode = ' + IntToStr(ENESTIMATEITEMSTATUS_PRESENT) );
    end
    else
    begin
       //eFilter.conditionSQL := ' enestimateitem.code not in (select RQFKORDERITEM2ENSTMTTM.ESTIMATEITEMCODE from RQFKORDERITEM2ENSTMTTM where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null)';
       AddCondition( eCondition, ' enestimateitem.code not in (select RQFKORDERITEM2ENSTMTTM.ESTIMATEITEMCODE from RQFKORDERITEM2ENSTMTTM where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null)');
    end;

end
else
if ( rgSearch.ItemIndex = 1) then
begin

          try
            code :=  StrToInt( sgFINMaterials.Cells[20 , sgFINMaterials.Row ]);
          except on EConvertError do Exit;
          end;

         //eFilter.conditionSQL := 'enestimateitem.code in (select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         //+' rqfkorderdata2fkparty.partycode = '+ IntToStr(code) +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code) +')';

         AddCondition( eCondition , 'enestimateitem.code in (select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         +' rqfkorderdata2fkparty.partycode = '+ IntToStr(code) +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code) +')');



         //planFilter.conditionSQL := condition;

         //UpdateMaterials_(planFilter, mCondition);

         //Exit;
end;
}

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

     sgENEstimateItemClick(nil);

end;


procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgTKMaterialsClick(Sender: TObject);
var
  i, j : integer;
begin
{
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);


if (rgSearch.ItemIndex = 0) then
begin

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;

end;

   sgENEstimateItemClick(Sender);
}

  ClearGrid(sgENEstimateItem);

{
if  (rgSearch.ItemIndex = 0) then
begin
   if chbIsTranzit.Checked then
     btnFindClick(Sender);
end;
}
end;




procedure TfrmMaterialsRQFKOrderOutE2EEdit.spbPlanMOLClick(Sender: TObject);
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

procedure TfrmMaterialsRQFKOrderOutE2EEdit.spbDepartmentClick(
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

procedure TfrmMaterialsRQFKOrderOutE2EEdit.FormCreate(Sender: TObject);
begin
  inherited;
  MOLCode := '';
  masterMOLCode := '';
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  budgetCode := LOW_INT;
  materialsINCode := LOW_INT;
  finDoc := LOW_INT;

  ///
  partyCode := -1; // !!! Не LOW_INT, чтобы случайно не выгрести все подряд
  frcCode := -1;   // !!! Не LOW_INT, чтобы случайно не выгрести все подряд
  nn := '';
  ///
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.btnAddMaterialsClick(
  Sender: TObject);
var
   TempRQOrderItem: RQOrderItemControllerSoapPort;
   obj : RQOrderItem;
   i, n, materialCode : Integer;
   eList : ENEstimateItemShortList;
   eArr :  ArrayOfENEstimateItemShort;
   eObj :  ENEstimateItemShort;
   state : boolean;
begin
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


procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgTKMaterialsDblClick(
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

{
if  (rgSearch.ItemIndex = 0) then
begin

  if chbIsTranzit.Checked then
     btnFindClick(Sender);

end;
}

end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.btnFindClick(Sender: TObject);
begin
  inherited;

if rgSearch.ItemIndex = 0 then
begin
   if budgetCode <= 0 then
   begin
       ShowMessage('Виберіть Бюджетотримача ...');
       exit;
   end;
end;

  updateFINMaterialsGrid;
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgENEstimateItemClick(
  Sender: TObject);
begin
//  inherited;
//  updateENFINMaterialsGrid();
{
   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;
}
//  updateFINMaterialsGrid();
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgENEstimateItemDblClick(
  Sender: TObject);
var
  //TempFINMaterials: FINMaterialsControllerSoapPort;
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  m : FINMaterials;
  counnt, temp2 : real;

  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempTKMaterials: TKMaterialsControllerSoapPort;

  materialObj : TKMaterials;
  estimateObj : ENEstimateItem;
  estimateCode : Integer;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  oi2eFilter : RQFKOrderItem2ENEstimateItemFilter;
  oi2eList : RQFKOrderItem2ENEstimateItemShortList;
  order : RQFKOrder;
  orderItem : RQFKOrderItem;
  i: Integer;
  oi2eData , tmp : String;

  ENEstimateItem2ENEstimateItemObj: ENEstimateItem2ENEstimateItem;
  cState: Boolean;
  eCodeIN, eCodeOUT, fCode: Integer;
  finCount: TXSDecimal;
begin
  eCodeIN := LOW_INT;
  eCodeOUT := LOW_INT;
  fCode := LOW_INT;

  if sgFINMaterials.Cells[4,sgFINMaterials.Row] = '' then
  begin
      ShowMessage('Оберіть матеріали з підзвіту відправника ...');
      Exit;
  end;

  temp2 := 0;
  try
    temp2 := StrToFloat(sgENEstimateItem.Cells[2, sgENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;


  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  if temp2 < 0.00000001 then
  begin
    Application.MessageBox(PChar('Кол-во материалов = 0... Откорректируйте кол-во материалов в работе!'), PChar('Внимание!'), MB_ICONWARNING);
    Exit;
  end;

  estimateCode := LOW_INT;
  try
    estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;

 TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
 estimateObj := TempENEstimateItem.getObject( estimateCode );

  if estimateObj = nil then
  begin
    ShowMessage('estimateObj не найден ..');
    Close;
    exit;
  end;

  // проверим наличие уже развязанных на этот Эстимайт ..
  // только когда вібирают из НЕ ТРАНЗИТА
  //if not chbIsTranzit.Checked then
  //begin
    TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
    oi2eFilter :=  RQFKOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(oi2eFilter);
    SetNullXSProps(oi2eFilter);
    oi2eFilter.estimateItem := ENEstimateItem.Create;
    oi2eFilter.estimateItem.code :=  estimateObj.code;

    //if (rqFKOrderObj.molInCode = '1850') or (rqFKOrderObj.molInCode = '1851') then
    //  oi2eFilter.conditionSQL := ' RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null'
    //else
{
      oi2eFilter.conditionSQL := ' RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null and ' +
                                 'RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE in (select i.code from RQFKORDER o, RQFKORDERITEM i where '+
                                 ' o.code = i.fkorderrefcode and o.molincode = ''' + rqFKOrderObj.molInCode + ''' )' ;
}
    oi2eFilter.conditionSQL := ' RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null and ' +
                               ' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE in (select i.code from RQFKORDER o, RQFKORDERITEM i where '+
                               ' o.code = i.fkorderrefcode and substring(o.molincode, 1, 2) = ''' + copy(rqFKOrderObj.molInCode, 1, 2) + ''' )' ;

    oi2eList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(oi2eFilter, 0, 30);
    oi2eData := '';
    for i:=0 to High(oi2eList.list) do  //oi2eList.totalCount-1 do
    begin
      tmp := oi2eList.list[i].fkOrderItemRefNomenclatureName + ', ' + oi2eList.list[i].finMaterialsRefQuantity.DecimalString + ' ' + oi2eList.list[i].fkOrderItemRefNomenclatureUnitName;

      orderItem := TempRQFKOrderItem.getObject(oi2eList.list[i].fkOrderItemRefCode);


      TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

      order := TempRQFKOrder.getObject( orderItem.fkOrderRef.code );
      if order <> nil then
        tmp := '№' + order.numberDoc + ', ' + tmp
      else
        tmp := 'неизвестный , ' + tmp; 
{
      if Application.MessageBox(PChar('Цей матеріал вже розданий у видатковому ордері :' + #13#10 +
                                      tmp + #13#10 + #13#10 + 'Продовжити ??'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;
}
      oi2eData := oi2eData + #13#10 + tmp;
    end;

    if Length(oi2eData) > 0 then
    begin
      if Application.MessageBox(PChar('Цей матеріал вже розданий у видаткових ордерах : ' +
                                oi2eData + #13#10 + #13#10 + 'Продовжити ??'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;
    end;

  //end;  // транзит не чекнутый ..
  //////////////////////////////////////////

  frmFINMaterialCountEdit := TfrmFINMaterialCountEdit.Create(Application, dsEdit);

  try

    try
      frmFINMaterialCountEdit.tkMaterialName := sgENEstimateItem.Cells[1,sgENEstimateItem.Row] + ', ' + sgENEstimateItem.Cells[3,sgENEstimateItem.Row];
      frmFINMaterialCountEdit.tkMeasurementName := sgENEstimateItem.Cells[3,sgENEstimateItem.Row];
      frmFINMaterialCountEdit.nn := sgFINMaterials.Cells[1,sgFINMaterials.Row];
      frmFINMaterialCountEdit.materialName := sgFINMaterials.Cells[2,sgFINMaterials.Row];
      frmFINMaterialCountEdit.measurementName := sgFINMaterials.Cells[3,sgFINMaterials.Row];
      frmFINMaterialCountEdit.availableCount := StrToFloat(sgFINMaterials.Cells[4,sgFINMaterials.Row]);

      // проверяем нормативный мат-л и номенклатуры ... и предупреждаем ...
      if ( AnsiUpperCase(sgENEstimateItem.Cells[3,sgENEstimateItem.Row]) = AnsiUpperCase(sgFINMaterials.Cells[3,sgFINMaterials.Row]) ) then
        //frmFINMaterialCountEdit.edtCount.Text := sgENEstimateItem.Cells[2,sgENEstimateItem.Row];
        frmFINMaterialCountEdit.currentCount := StrToFloat(sgENEstimateItem.Cells[2,sgENEstimateItem.Row])
      else
      begin
        if Application.MessageBox(PChar('Не співпадають назви матеріалів !!!' 
                                  + #13#10 + '"' + AnsiUpperCase(sgENEstimateItem.Cells[3,sgENEstimateItem.Row]) + '" та "' + AnsiUpperCase(sgFINMaterials.Cells[3,sgFINMaterials.Row])+'"'
                                  + #13#10 + 'Продовжити ??'),
                                  PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
        begin
            Exit;
        end;
      end;

      frmFINMaterialCountEdit.planItemName := '';////sgENPlanWorkItem.Cells[1, sgENPlanWorkItem.Row] + '  ' +
                                           //sgENPlanWorkItem.Cells[2, sgENPlanWorkItem.Row];
    except
      on EConvertError do Exit;
    end;

    if frmFINMaterialCountEdit.ShowModal = mrOK then
    begin
  // перечитаем грид ;)
  // йудет кол-во в ФК

  // сохраним связку и кол-во в естимате ...

////////////////////////////////////////////////////////////////////////////////
// разрулим материал !!
// + подменить МОЛа если материал -ГСМ ...





TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
materialObj := TempTKMaterials.getObject( estimateObj.materialRef.code );

if materialObj = nil then
begin
  ShowMessage('... materialObj не найден ..');
  Close;
  exit;
end;

//QQQ edtTKMaterial.Text := materialObj.name ; //+ ' ('+ materialObj.measurement.name+')';
//edtTKCount.Text := estimateObj.countFact.DecimalString + ' estimateObj.countFact'; // estimateObj.countGEN?? смотря для чего ... у ФАКТА это ...
//QQQ edtTKCount.Text := estimateObj.countFact.DecimalString ; // estimateObj.countGEN?? смотря для чего ... у ФАКТА это ...
//QQQ lblMeasurementUnit.Caption := materialObj.measurement.name;
////////////////////////////////////////////////////////////////////////////////

               m := FINMaterials.Create;
               SetNullIntProps(m);
               SetNullXSProps(m);
               m.estimateItemRef := ENEstimateItemRef.Create;
               m.estimateItemRef.code := estimateCode; // !!!!!!!!!!!!!!!!!!!!!! а если несколько !!!
               m.div_code := molCode; //* actObj.finMolCode;
               m.finDocItemCode := -1; //* actObj.finDocCode; // пока этот код ... на сервере его поменяем - это код ИТЕМА в ФК

               m.quantity := TXSDecimal.Create;
               m.quantity.DecimalString :=  FloatToStr(frmFINMaterialCountEdit.enteredCount); //edtGettingCount.Text ; //!!!!!!!!! kol-vo ....//'1';// sgFINMaterials.Cells[15, sgFINMaterials.Row];

               if frmFINMaterialCountEdit.axFactor > 0 then
               begin
                 m.axFactor := TXSDecimal.Create;
                 m.axFactor.DecimalString := FloatToStr(frmFINMaterialCountEdit.axFactor);
               end;

               m.nn := sgFINMaterials.Cells[1, sgFINMaterials.Row];
               m.mat_name := sgFINMaterials.Cells[2, sgFINMaterials.Row];
               m.mu_name := sgFINMaterials.Cells[3, sgFINMaterials.Row];

               // чего он стал4-м??? НАДО 15 !!!! m.div_name := sgFINMaterials.Cells[4, sgFINMaterials.Row];
               m.div_name := sgFINMaterials.Cells[15, sgFINMaterials.Row];

               m.rest_purpose_name := sgFINMaterials.Cells[5, sgFINMaterials.Row];

               m.partner_name := sgFINMaterials.Cells[6, sgFINMaterials.Row];
               m.doc_date  := TXSDate.Create;
               m.doc_date.XSToNative(GetXSDate( StrToDate(sgFINMaterials.Cells[7, sgFINMaterials.Row])));
               m.party_discription :=  sgFINMaterials.Cells[8, sgFINMaterials.Row];
               m.rest_purpose_id := StrToInt( sgFINMaterials.Cells[9, sgFINMaterials.Row] );
               //m.rest_purpose_name := sgFINMaterials.Cells[9, sgFINMaterials.Row];
               m.rest_purpose_type_id := StrToInt(sgFINMaterials.Cells[10, sgFINMaterials.Row]);
               m.budget_core_id := StrToInt(sgFINMaterials.Cells[11, sgFINMaterials.Row]);

               m.frc_code := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
               m.frc_name := sgFINMaterials.Cells[13, sgFINMaterials.Row];

               m.calc_price := TXSDecimal.Create;
               m.calc_price.DecimalString := sgFINMaterials.Cells[16, sgFINMaterials.Row];



               m.price := TXSDecimal.Create;
               m.price.DecimalString := sgFINMaterials.Cells[14, sgFINMaterials.Row];
               m.cost := TXSDecimal.Create;
               m.cost.DecimalString := sgFINMaterials.Cells[17, sgFINMaterials.Row]; //  она же в ! m.fullCost
               m.bal_sch := sgFINMaterials.Cells[18, sgFINMaterials.Row];
//-----------------
               m.mat_id := StrToInt(sgFINMaterials.Cells[19, sgFINMaterials.Row]);
               m.party_id := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);
               m.partner := (sgFINMaterials.Cells[21, sgFINMaterials.Row]);
               m.mu_id := strToInt(sgFINMaterials.Cells[22, sgFINMaterials.Row]);
               m.doc_num := sgFINMaterials.Cells[23, sgFINMaterials.Row];

               ///////////////
               /////// общиее кол-во и стоимость для правильного округления ...
               //////////////
               m.fullQuantity := TXSDecimal.Create;
               m.fullCost := TXSDecimal.Create;
               m.fullQuantity.DecimalString := sgFINMaterials.Cells[4, sgFINMaterials.Row];
               m.fullCost.DecimalString :=  sgFINMaterials.Cells[17, sgFINMaterials.Row]; // по идее она есть еще и в ! m.cost
               ////////////////////

               // развязка с молом ...
               m.molDataRef := FINMolDataRef.Create;
               m.molDataRef.code := LOW_INT;


        {
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) then
            TempRQFKOrderItem.addOE2REM(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL)  then
            TempRQFKOrderItem.addREM2MOL(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT)  then
            TempRQFKOrderItem.addOperative2Tranzit(m, rqFKOrderCode)
        }
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E) then
        begin
          ////////////////
          cState := false;
          for i:=1 to sgENEstimateItemTranzit.RowCount - 1 do
          begin
            sgENEstimateItemTranzit.GetCheckBoxState(1, i, cState);
            if cState then
            begin
              //matIN := sg
              try
                eCodeIN := StrToInt( sgENEstimateItemTranzit.Cells[0, i] );
                //matOUT := sgENEstimateItemOUT.Cells[1, i];
              except
                on EConvertError do Exit;
              end;
            end;
          end;

          eCodeOUT := estimateCode;

          if eCodeIN = LOW_INT then
          begin
            Application.MessageBox(PChar('Оберіть матеріал з плану, який потрібно перенести!'), PChar('Увага'), MB_ICONWARNING);
            Exit;
          end;

          if eCodeOUT = LOW_INT then
          begin
            Application.MessageBox(PChar('Оберіть план, під який потрібно перенести матеріал!'), PChar('Увага'), MB_ICONWARNING);
            Exit;
          end;

          fCode := getFinMaterialCode(eCodeIN);

          if fCode = LOW_INT then
          begin
            Application.MessageBox(PChar('Немає матеріалу для переносу!'), PChar('Увага'), MB_ICONWARNING);
            Exit;
          end;

          ENEstimateItem2ENEstimateItemObj := ENEstimateItem2ENEstimateItem.Create;

          ENEstimateItem2ENEstimateItemObj.estimateItemInRef := ENEstimateItemRef.Create;
          ENEstimateItem2ENEstimateItemObj.estimateItemInRef.code := eCodeIN;

          ENEstimateItem2ENEstimateItemObj.estimateItemOutRef := ENEstimateItemRef.Create;
          ENEstimateItem2ENEstimateItemObj.estimateItemOutRef.code := eCodeOUT;
          ENEstimateItem2ENEstimateItemObj.typeRef := ENEstimateItem2TypeRef.Create;
          ENEstimateItem2ENEstimateItemObj.typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;

          {
           if (ENEstimateItem2ENEstimateItemObj.countGen = nil ) then
             ENEstimateItem2ENEstimateItemObj.countGen := TXSDecimal.Create;

           if edtCountGen.Text <> '' then
             ENEstimateItem2ENEstimateItemObj.countGen.decimalString := edtCountGen.Text
           else
             ENEstimateItem2ENEstimateItemObj.countGen := nil;


           if edtFinCount.Text <> '' then
           begin
             finCount := TXSDecimal.Create;
             finCount.decimalString := edtFinCount.Text;
           end
           else
             finCount := nil;
           }

           if (ENEstimateItem2ENEstimateItemObj.countGen = nil ) then
             ENEstimateItem2ENEstimateItemObj.countGen := TXSDecimal.Create;
           ENEstimateItem2ENEstimateItemObj.countGen.DecimalString := FloatToStr(frmFINMaterialCountEdit.enteredCount); //edtCountGen.Text

           finCount := TXSDecimal.Create;
           finCount.DecimalString := FloatToStr(frmFINMaterialCountEdit.enteredCount); //edtFinCount.Text;

          //TempENEstimateItem2ENEstimateItem.add(ENEstimateItem2ENEstimateItemObj, fCode, finCount);

          ////////////////

          TempRQFKOrderItem.addE2E(m, rqFKOrderCode, ENEstimateItem2ENEstimateItemObj, fCode, finCount);
        end
        else
          ShowMessage('Error in Kind');

      updateFINMaterialsGrid;
      updateENFINMaterialsGrid;

    end;

    //UpdateEstimateItems(planCode, estimateItemKind);
    // может пока размышлял ктото другой разнес ....
    //updateFINMaterialsGrid;
    //updateENFINMaterialsGrid;

  finally
    frmFINMaterialCountEdit.Free;
  end;

end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.spbDepartmentClearClick(
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

procedure TfrmMaterialsRQFKOrderOutE2EEdit.chbIsTranzitClick(Sender: TObject);
begin
  inherited;

  ShowHideIsCN;

end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgFINMaterialsDblClick(
  Sender: TObject);
begin
{
  inherited;

  if rgSearch.ItemIndex = 1 then
    btnSelectClick(Sender);
}
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.rgSearchClick(Sender: TObject);
var i, j: Integer;
begin
  HideControls([panel1, chbIsTranzit], rgSearch.ItemIndex = 1);
  ClearGrids([sgTKMaterials, sgENEstimateItem, sgFINMaterials{, sgENFINMaterials}]);
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgFINMaterialsClick(
  Sender: TObject);
var {partyCode, frcCode, }i, z: Integer;
    //nn: String;
    finFilter: FINMaterialsFilter;
    finList: FINMaterialsShortList;
    eFilter: ENEstimateItemFilter;
    ENEstimateItemList: ENEstimateItemShortList;
    pFilter: ENPlanWorkFilter;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    condition, depCodes, estimateCodes : String;
    TempENDepartment: ENDepartmentControllerSoapPort;
    TempFinMaterials : FINMaterialsControllerSoapPort;

begin
  ClearGrids([sgENEstimateItemTranzit, sgENFINMaterials]);
     
  try
    partyCode := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  nn := sgFINMaterials.Cells[1, sgFINMaterials.Row];

  // Код ЦФО
  try
    frcCode := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  condition := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';


  pFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(pFilter);
  SetNullXSProps(pFilter);

  pFilter.kind := ENPlanWorkKind.Create;
  pFilter.kind.code := ENPLANWORKKIND_CURRENT;

  pFilter.conditionSQL := condition;


  eFilter := ENEstimateItemFilter.Create;
  SetNullIntProps(eFilter);
  SetNullXSProps(eFilter);

  eFilter.kindRef := ENEstimateItemKindRef.Create;
  eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

  // Сбор id єстимейтов
  TempFinMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
  finFilter := FINMaterialsFilter.Create;
  SetNullXSProps(finFilter);
  SetNullIntProps(finFilter);
  finFilter.conditionSQL := ' FINMATERIALS.CODE IN (' +
    '   select fm.code from finmaterials fm  ' +
    '   where fm.code in ' +
    '   ( ' +
    '   select oie.finmaterialsrefcode  ' +
    '   from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o  ' +
    '   where oie.fkorderitemrefcode = oi.code  ' +
    '     and oi.fkorderrefcode = o.code  ' +
    '     and substr(o.moloutcode, 1, 2) = ''' + Copy(rqFKOrderObj.molOutCode, 1, 2) + '''' +
    '     and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '   )  ' +
    '   and fm.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '   and fm.nn = ''' + nn + ''' ' +
    '   and fm.party_id = ' + IntToStr(partyCode) +
    '  ' +
    '   union all ' +
    '  ' +
    '   select fm.code from finmaterials fm  ' +
    '   where fm.parentrefcode in  ' +
    '   ( ' +
    '   select fm1.code  ' +
    '   from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o, finmaterials fm1 ' +
    '   where oie.fkorderitemrefcode = oi.code  ' +
    '     and oi.fkorderrefcode = o.code  ' +
    '     and substr(o.moloutcode, 1, 2) = ''' + Copy(rqFKOrderObj.molOutCode, 1, 2) + '''' +
    '     and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '     and oie.finmaterialsrefcode = fm1.code ' +
    '     and fm1.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_MOVED) +
    '     and fm1.nn = ''' + nn + ''' ' +
    '     and fm1.party_id = ' + IntToStr(partyCode) +
    '   ) ' +
    '   and fm.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '   and fm.nn = ''' + nn + ''' ' +
    '   and fm.party_id = ' + IntToStr(partyCode) +
    '  ' +
    '   union all ' +
    '  ' +
    '   select fm.code from finmaterials fm  ' +
    '   where fm.code in  ' +
    '   ( ' +
    '   select fm2.code  ' +
    '   from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o,  ' +
    '        finmaterials fm1, finmaterials fm2 ' +
    '   where oie.fkorderitemrefcode = oi.code  ' +
    '     and oi.fkorderrefcode = o.code  ' +
    '     and substr(o.moloutcode, 1, 2) = ''' + Copy(rqFKOrderObj.molOutCode, 1, 2) + '''' +
    '     and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '     and oie.finmaterialsrefcode = fm1.code ' +
    '     and fm1.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_MOVED) +
    '     and fm2.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '     and fm2.code not in  ' +
    '     (select oie1.finmaterialsrefcode from rqfkorderitem2enstmttm oie1  ' +
    '      where oie1.finmaterialsrefcode is not null) ' +
    '     and fm2.estimateitemrefcode = fm1.estimateitemrefcode ' +
    '     and fm1.nn = fm2.nn ' +
    '     and fm1.party_id = fm2.party_id ' +
    '     and fm1.frc_code = fm2.frc_code ' +
    '     and fm1.price = fm2.price ' +
    '     and fm1.fullcost = fm2.fullcost ' +
    '     and fm1.nn = ''' + nn + ''' ' +
    '     and fm1.party_id = ' + IntToStr(partyCode) +
    '   ) ' +
    '   and fm.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '   and fm.nn = ''' + nn + ''' ' +
    '   and fm.party_id = ' + IntToStr(partyCode) + ')';

    estimateCodes := '';

    finList := TempFinMaterials.getScrollableFilteredList(finFilter, 0, -1);
    for z := 0 to finList.totalCount - 1 do
    begin
         if Length(estimateCodes) = 0 then estimateCodes := IntToStr(finList.list[z].estimateItemRefCode)
         else estimateCodes := estimateCodes + ', ' + IntToStr(finList.list[z].estimateItemRefCode);
    end;

    if Length(estimateCodes) = 0 then estimateCodes := 'null';


  eFilter.conditionSQL :=
    ' enestimateitem.code in ' +
    ' ( ' +  estimateCodes + ' ) ';



  eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, pFilter);

  //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

  //eiLastCount := High(ENEstimateItemList.list);

  if High(ENEstimateItemList.list) > -1 then
    sgENEstimateItemTranzit.RowCount := High(ENEstimateItemList.list) + 2
  else
    sgENEstimateItemTranzit.RowCount := 2;

  with sgENEstimateItemTranzit do
     for i := 0 to High(ENEstimateItemList.list) do
     begin
       /////***** Application.ProcessMessages;

       if ENEstimateItemList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

       AddCheckBox(1, i+1, false, false);

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
       sgENEstimateItemTranzit.RowCount := i + 2;
     end;

   sgENEstimateItemTranzit.Row := 1;
//   sgENEstimateItemTranzitClick(Sender);
   updateENFINMaterialsGrid();
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.updateENFINMaterialsGrid;
var estimateItemCode, {partyCode, frcCode, }i: Integer;
    //nn: String;
    finFilter: FINMaterialsFilter;
    finList: FINMaterialsShortList;
    TempFINMaterials: FINMaterialsControllerSoapPort;
begin
  ClearGrid(sgENFINMaterials);
  
  try
    estimateItemCode := StrToInt(sgENEstimateItemTranzit.Cells[0, sgENEstimateItemTranzit.Row]);
  except
    on EConvertError do Exit;
  end;

  { // Возьмем из глобальных переменных
  try
    partyCode := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  nn := sgFINMaterials.Cells[1, sgFINMaterials.Row];

  // Код ЦФО
  try
    frcCode := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;
  }

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);

  {
  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := estimateItemCode;
  finFilter.nn := nn;
  finFilter.party_id := partyCode;
  finFilter.frc_code := frcCode;

  finFilter.conditionSQL :=
    'FINMATERIALS.code in (' +
    'select oie.finmaterialsrefcode ' +
    'from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o ' +
    'where oie.fkorderitemrefcode = oi.code ' +
    '  and oi.fkorderrefcode = o.code ' +
    '  and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '  and o.moloutcode = ''' + rqFKOrderObj.molOutCode + ''' ' +
    ') or ' +
    'FINMATERIALS.parentrefcode in (' +
    'select oie.finmaterialsrefcode ' +
    'from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o ' +
    'where oie.fkorderitemrefcode = oi.code ' +
    '  and oi.fkorderrefcode = o.code ' +
    '  and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '  and o.moloutcode = ''' + rqFKOrderObj.molOutCode + ''' ' +
    ') ';

  finFilter.orderBySQL := ' FINMATERIALS.modify_time desc';
  }
  createFinMaterialsFilter(finFilter, estimateItemCode);

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     sgENFINMaterials.RowCount:=High(finList.list)+2
  else
     sgENFINMaterials.RowCount:=2;

   with sgENFINMaterials do
    for i:=0 to High(finList.list) do  
      begin
        /////***** Application.ProcessMessages;
        
        if finList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(finList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := finList.list[i].mat_name;
        Cells[2,i+1] := finList.list[i].mu_name;
        Cells[3,i+1] := finList.list[i].nn;

        if finList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := finList.list[i].quantity.DecimalString;

{перенесено в калк_прайс

        if finList.list[i].price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].price.DecimalString;
}
        if finList.list[i].calc_price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].calc_price.DecimalString;

        if finList.list[i].cost = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := finList.list[i].cost.DecimalString;

        Cells[7, i+1] := IntToStr(finList.list[i].frc_code) + ' ' + finList.list[i].frc_name;

        Cells[8,i+1] := finList.list[i].div_name;

        Cells[9,i+1] := finList.list[i].rest_purpose_name;

        Cells[10,i+1] := finList.list[i].partner_name;

        if finList.list[i].doc_date = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(finList.list[i].doc_date);

        Cells[12,i+1] := finList.list[i].party_discription;

        Cells[13,i+1] := IntToStr(finList.list[i].party_id);

        Cells[14, i+1] := finList.list[i].userGen ;

        if finList.list[i].dateEdit <> nil then
          Cells[15, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
        else
          Cells[15, i+1] := '';

        {
        Cells[5,i+1] := finList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);
        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+1] := FINMaterialsList.list[i].frc_name;
        if FINMaterialsList.list[i].calc_price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;
        LastRow:=i+1;
        }
        sgENFINMaterials.RowCount:= i + 2;
      end;
   //ColCount:=ColCount+1;
   sgENFINMaterials.Row:=1;

end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgENEstimateItemTranzitClick(
  Sender: TObject);
begin
  updateENFINMaterialsGrid();
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.sgENEstimateItemTranzitCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  CheckGrid(sgENEstimateItemTranzit, ACol, false);
  sgENEstimateItemTranzit.SetCheckBoxState(ACol, ARow, State);
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.actViewPlanTranzitExecute(
  Sender: TObject);
var planCode: Integer;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  planCode := Integer(sgENEstimateItemTranzit.Objects[1, sgENEstimateItemTranzit.Row]);

  if planCode <= 0 then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ShowModal= mrOk then
    begin
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

function TfrmMaterialsRQFKOrderOutE2EEdit.getFinMaterialCode(estimateItemCode: Integer): Integer;
var {partyCode, frcCode, }i: Integer;
    //nn: String;
    finFilter: FINMaterialsFilter;
    finList: FINMaterialsShortList;
    TempFINMaterials: FINMaterialsControllerSoapPort;
begin
  Result := LOW_INT;

  { // Возьмем из глобальных переменных
  try
    partyCode := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  nn := sgFINMaterials.Cells[1, sgFINMaterials.Row];

  // Код ЦФО
  try
    frcCode := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;
  }

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);

  {
  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := estimateItemCode;
  finFilter.nn := nn;
  finFilter.party_id := partyCode;
  finFilter.frc_code := frcCode;

  finFilter.conditionSQL := 'FINMATERIALS.code in (' +
    'select oie.finmaterialsrefcode ' +
    'from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o ' +
    'where oie.fkorderitemrefcode = oi.code ' +
    '  and oi.fkorderrefcode = o.code ' +
    '  and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '  and o.moloutcode = ''' + rqFKOrderObj.molOutCode + ''' ' +
    ')';

  finFilter.orderBySQL := ' FINMATERIALS.modify_time desc';
  }
  createFinMaterialsFilter(finFilter, estimateItemCode);

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter, 0, -1);

  if High(finList.list) > -1 then
    Result := finList.list[0].code;
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.actViewPlanExecute(
  Sender: TObject);
var planCode: Integer;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  planCode := Integer(sgENEstimateItem.Objects[1, sgENEstimateItem.Row]);

  if planCode <= 0 then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ShowModal= mrOk then
    begin
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.actViewFKOrderExecute(
  Sender: TObject);
var fmCode, oldCode: Integer;
    TempRQFKOrder: RQFKOrderControllerSoapPort;
    fkOrderFilter: RQFKOrderFilter;
    fkOrderList: RQFKOrderShortList;
    TempFINMaterials: FINMaterialsControllerSoapPort;
    fmObj: FINMaterials;
    frmRQFKOrderView: TfrmRQFKOrderEdit;
begin
  try
    fmCode := StrToInt(sgENFINMaterials.Cells[0, sgENFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  fkOrderFilter := RQFKOrderFilter.Create;
  SetNullIntProps(fkOrderFilter);
  SetNullXSProps(fkOrderFilter);

  fkOrderFilter.conditionSQL :=
    'RQFKORDER.code in ' +
    '(select o.code ' +
    ' from rqfkorderitem2enstmttm oe, ' +
    '      rqfkorderitem oi, rqfkorder o ' +
    ' where oe.finmaterialsrefcode = ' + IntToStr(fmCode) +
    '   and oe.fkorderitemrefcode = oi.code ' +
    '   and oi.fkorderrefcode = o.code )';

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  fkOrderList := TempRQFKOrder.getScrollableFilteredList(fkOrderFilter, 0, -1);

  if High(fkOrderList.list) = -1 then
  begin
    TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
    fmObj := TempFINMaterials.getObject(fmCode);

    if fmObj <> nil then
      if fmObj.parentRef <> nil then
        if fmObj.parentRef.code <> LOW_INT then
        begin
          fkOrderFilter.conditionSQL :=
            'RQFKORDER.code in ' +
            '(select o.code ' +
            ' from rqfkorderitem2enstmttm oe, ' +
            '      rqfkorderitem oi, rqfkorder o ' +
            ' where oe.finmaterialsrefcode = ' + IntToStr(fmObj.parentRef.code) +
            '   and oe.fkorderitemrefcode = oi.code ' +
            '   and oi.fkorderrefcode = o.code )';
          fkOrderList := TempRQFKOrder.getScrollableFilteredList(fkOrderFilter, 0, -1);

          if High(fkOrderList.list) = -1 then
          begin
            Application.MessageBox(PChar('Видатковий ордер не знайдено!'), PChar('Помилка'), MB_ICONERROR);
            Exit;
          end;
        end;
  end;

  if High(fkOrderList.list) = -1 then
  begin
    Application.MessageBox(PChar('Видатковий ордер не знайдено!'), PChar('Помилка'), MB_ICONERROR);
    Exit;
  end;

  if fkOrderList.list[0] = nil then
  begin
    Application.MessageBox(PChar('Видатковий ордер не знайдено!'), PChar('Помилка'), MB_ICONERROR);
    Exit;
  end;

  if fkOrderList.list[0].code = LOW_INT then
  begin
    Application.MessageBox(PChar('Видатковий ордер не знайдено!'), PChar('Помилка'), MB_ICONERROR);
    Exit;
  end;

  oldCode := LOW_INT;

  frmRQFKOrderView := TfrmRQFKOrderEdit.Create(Application, dsView);

  try
    //if EditRQFKOrder.RQFKOrderObj <> nil then
    //  oldCode := EditRQFKOrder.RQFKOrderObj.code;

    frmRQFKOrderView.RQFKOrderObj := TempRQFKOrder.getObject(fkOrderList.list[0].code);
    frmRQFKOrderView.ShowModal;
  finally
    frmRQFKOrderView.Free;
    frmRQFKOrderView := nil;
  end;

    // Возвращаем старый объект, который там был
  //  if oldCode > LOW_INT then
  //    EditRQFKOrder.RQFKOrderObj := TempRQFKOrder.getObject(oldCode);
end;

procedure TfrmMaterialsRQFKOrderOutE2EEdit.createFinMaterialsFilter(
  var fmFilter: FINMaterialsFilter; estimateItemCode: Integer);
begin
  fmFilter.statusRef := FINMaterialsStatusRef.Create;
  fmFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  fmFilter.estimateItemRef := ENEstimateItemRef.Create;
  fmFilter.estimateItemRef.code := estimateItemCode;
  fmFilter.nn := nn;
  fmFilter.party_id := partyCode;
  //fmFilter.frc_code  := frcCode;

{
  fmFilter.conditionSQL :=
    'FINMATERIALS.code in (' +
    'select oie.finmaterialsrefcode ' +
    'from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o ' +
    'where oie.fkorderitemrefcode = oi.code ' +
    '  and oi.fkorderrefcode = o.code ' +
    '  and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    //'  and o.moloutcode = ''' + rqFKOrderObj.molOutCode + ''' ' +
    ') or ' +
    'FINMATERIALS.parentrefcode in (' +
    'select oie.finmaterialsrefcode ' +
    'from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o ' +
    'where oie.fkorderitemrefcode = oi.code ' +
    '  and oi.fkorderrefcode = o.code ' +
    '  and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    //'  and o.moloutcode = ''' + rqFKOrderObj.molOutCode + ''' ' +
    ') ';
}

  fmFilter.conditionSQL :=
    ' finmaterials.estimateitemrefcode in (select finmaterials1.estimateitemrefcode  ' +
    ' from finmaterials as finmaterials1 ' +
    ' where finmaterials1.code in  ' +
    ' ( ' +
    '   select fm.code from finmaterials fm  ' +
    '   where fm.code in ' +
    '   ( ' +
    '   select oie.finmaterialsrefcode  ' +
    '   from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o  ' +
    '   where oie.fkorderitemrefcode = oi.code  ' +
    '     and oi.fkorderrefcode = o.code  ' +
    '     and substr(o.moloutcode, 1, 2) = ''' + Copy(rqFKOrderObj.molOutCode, 1, 2) + '''' +
    '     and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '   )  ' +
    '   and fm.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '   and fm.nn = ''' + nn + ''' ' +
    '   and fm.party_id = ' + IntToStr(partyCode) +
    '  ' +
    '   union all ' +
    '  ' +
    '   select fm.code from finmaterials fm  ' +
    '   where fm.parentrefcode in  ' +
    '   ( ' +
    '   select fm1.code  ' +
    '   from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o, finmaterials fm1 ' +
    '   where oie.fkorderitemrefcode = oi.code  ' +
    '     and oi.fkorderrefcode = o.code  ' +
    '     and substr(o.moloutcode, 1, 2) = ''' + Copy(rqFKOrderObj.molOutCode, 1, 2) + '''' +
    '     and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '     and oie.finmaterialsrefcode = fm1.code ' +
    '     and fm1.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_MOVED) +
    '     and fm1.nn = ''' + nn + ''' ' +
    '     and fm1.party_id = ' + IntToStr(partyCode) +
    '   ) ' +
    '   and fm.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '   and fm.nn = ''' + nn + ''' ' +
    '   and fm.party_id = ' + IntToStr(partyCode) +
    '  ' +
    '   union all ' +
    '  ' +
    '   select fm.code from finmaterials fm  ' +
    '   where fm.code in  ' +
    '   ( ' +
    '   select fm2.code  ' +
    '   from rqfkorderitem2enstmttm oie, rqfkorderitem oi, rqfkorder o,  ' +
    '        finmaterials fm1, finmaterials fm2 ' +
    '   where oie.fkorderitemrefcode = oi.code  ' +
    '     and oi.fkorderrefcode = o.code  ' +
    '     and substr(o.moloutcode, 1, 2) = ''' + Copy(rqFKOrderObj.molOutCode, 1, 2) + '''' +
    '     and o.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) +
    '     and oie.finmaterialsrefcode = fm1.code ' +
    '     and fm1.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_MOVED) +
    '     and fm2.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '     and fm2.code not in  ' +
    '     (select oie1.finmaterialsrefcode from rqfkorderitem2enstmttm oie1  ' +
    '      where oie1.finmaterialsrefcode is not null) ' +
    '     and fm2.estimateitemrefcode = fm1.estimateitemrefcode ' +
    '     and fm1.nn = fm2.nn ' +
    '     and fm1.party_id = fm2.party_id ' +
    '     and fm1.frc_code = fm2.frc_code ' +
    '     and fm1.price = fm2.price ' +
    '     and fm1.fullcost = fm2.fullcost ' +
    '     and fm1.nn = ''' + nn + ''' ' +
    '     and fm1.party_id = ' + IntToStr(partyCode) +
    '   ) ' +
    '   and fm.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
    '   and fm.nn = ''' + nn + ''' ' +
    '   and fm.party_id = ' + IntToStr(partyCode) +
    ' ) ' +
    ' and finmaterials1.nn = ''' + nn + ''' ' +
    ' and finmaterials1.party_id = ' + IntToStr(partyCode) +
    '  ' +
    ' /*order by finmaterials1.modify_time desc ' +
    ' limit 1*/) ';

  fmFilter.orderBySQL := ' FINMATERIALS.modify_time desc';
end;

end.
