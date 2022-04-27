unit EditRQWarehouseMaterialsMovement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons,
  DialogFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ChildFormUnit, GridHeadersUnit, XSBuiltIns,
  TB2Item, TB2Dock, TB2Toolbar,
  ImgList, Menus, ActnList, Planner, DateUtils, treelist, CheckLst
    , RQFKOrderController
    , ENConsts
    , ENPlanWorkController, ToolWin
    , RQPackingListController
    , RQPackingListItemController
    , RQPackingListStatusController, AdvObj
;

type
  TfrmRQWarehouseMaterialsMovement = class(TChildForm)
    imgRQWarehouseMaterialsMovement: TImageList;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    alRQFKOrder: TActionList;
    actOrderView: TAction;
    actOrderInsert: TAction;
    actOrderChange: TAction;
    actOrderRemove: TAction;
    actOrderUpdate: TAction;
    actOrderFilter: TAction;
    actOrderWithoutFilter: TAction;
    actOrderAddToWarehouseOrder: TAction;
    pmRQFKOrder: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actOrderChange1: TMenuItem;
    actOrderRemove1: TMenuItem;
    actOrderUpdate1: TMenuItem;
    actOrderFilter1: TMenuItem;
    actOrderWithoutFilter1: TMenuItem;
    N3: TMenuItem;
    actCreatedPrihod: TAction;
    actUnCreatedPrihod: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    actPrintPrihodStatement: TAction;
    N10: TMenuItem;
    PageControl1: TPageControl;
    tsOrders: TTabSheet;
    gbParameters: TGroupBox;
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    lblMOLSklad: TLabel;
    spbMOLSclad: TSpeedButton;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    btnSearch: TButton;
    edtMOLSclad: TEdit;
    chbRashod: TCheckBox;
    chbPrihod: TCheckBox;
    gbRQFKOrder: TGroupBox;
    sgRQFKOrder: TAdvStringGrid;
    TBRQFKOrder: TTBToolbar;
    TBRQFKOrderView: TTBItem;
    TBRQFKOrderAdd: TTBItem;
    TBRQFKOrderChange: TTBItem;
    TBRQFKOrderRemove: TTBItem;
    TBRQFKOrderUpdate: TTBItem;
    TBRQFKOrderFilter: TTBItem;
    TBRQFKOrderWithoutFilter: TTBItem;
    tsPackingList: TTabSheet;
    gbStatements: TGroupBox;
    btnPrintIncomeStatement: TButton;
    btnfrmRestRepByPlaces: TButton;
    btnFreePlaces: TButton;
    gbPackingListFilter: TGroupBox;
    lblPackingListFilterDateStart: TLabel;
    lblPackingListFilterDateFinal: TLabel;
    lblPackingListMol: TLabel;
    spbPackingListMol: TSpeedButton;
    edtPackingListFilterDateStart: TDateTimePicker;
    edtPackingListFilterDateFinal: TDateTimePicker;
    btnPackingListSearch: TButton;
    edtPackingListMol: TEdit;
    gbPackingList: TGroupBox;
    sgRQPackingList: TAdvStringGrid;
    pmRQPackingList: TPopupMenu;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    alRQPackingList: TActionList;
    actRQPackingListView: TAction;
    actRQPackingListInsert: TAction;
    actRQPackingListDelete: TAction;
    actRQPackingListEdit: TAction;
    actRQPackingListUpdate: TAction;
    HTTPRIORQPackingList: THTTPRIO;
    gbPackingListItem: TGroupBox;
    sgRQPackingListItem: TAdvStringGrid;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    HTTPRIOFINMol: THTTPRIO;
    HTTPRIORQPackingListItem: THTTPRIO;
    btnUnMovedOrders: TButton;
    Button1: TButton;
    chbOnlyGood: TCheckBox;
    Button2: TButton;
    GroupBox1: TGroupBox;
    chbPackingListIncome: TCheckBox;
    chbPackingListOutcome: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMOLScladClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtDateStartChange(Sender: TObject);
    procedure edtDateFinalChange(Sender: TObject);
    procedure actOrderViewExecute(Sender: TObject);
    procedure actOrderInsertExecute(Sender: TObject);
    procedure actOrderChangeExecute(Sender: TObject);
    procedure actOrderRemoveExecute(Sender: TObject);
    procedure actOrderUpdateExecute(Sender: TObject);
    procedure actOrderFilterExecute(Sender: TObject);
    procedure actOrderWithoutFilterExecute(Sender: TObject);
    procedure actCreatedPrihodExecute(Sender: TObject);
    procedure actUnCreatedPrihodExecute(Sender: TObject);
    procedure pmRQFKOrderPopup(Sender: TObject);
    procedure actPrintPrihodStatementExecute(Sender: TObject);
    procedure btnfrmRestRepByPlacesClick(Sender: TObject);
    procedure chbPrihodClick(Sender: TObject);
    procedure chbRashodClick(Sender: TObject);
    procedure btnFreePlacesClick(Sender: TObject);
    procedure spbPackingListMolClick(Sender: TObject);
    procedure btnPackingListSearchClick(Sender: TObject);
    procedure actRQPackingListViewExecute(Sender: TObject);
    procedure actRQPackingListEditExecute(Sender: TObject);
    procedure actRQPackingListInsertExecute(Sender: TObject);
    procedure actRQPackingListDeleteExecute(Sender: TObject);
    procedure sgRQPackingListClick(Sender: TObject);
    procedure actRQPackingListUpdateExecute(Sender: TObject);
    procedure btnUnMovedOrdersClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sgRQPackingListDblClick(Sender: TObject);
    procedure btnPrintIncomeStatementClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
    orderFilter : RQFKOrderFilter;

    packingListFilter : RQPackingListFilter;

    procedure DisableControls(Controls: array of TControl; Disable: Boolean = true; Color: TColor = clBtnFace);
    procedure updateRQFKOrderGrid;
    procedure updatePackingList;
    procedure updatePackingListItem;
    function getStrKindCodes : String;
  public
    { Public declarations }
    isToFind, isPrihod, isRashod : Boolean; // Необходимо ли нажать кнопку Пошук
    MolCode, MolName : String; // Код и наименование МОЛ центрального склада
    PackingListMolCode, PackingListMolName : String; // МОЛ для упаковочной ведомости
    dateStart, dateFinal : TDate; // дата начала и дата конца выборки документов
    PackingListDateStart, PackingListDateFinal : TDate; // даты для выборки упаковочной ведомости
    renCode : Integer; // код подразделения для ведомости
    materialCode : Integer; // код материала для ведомости

  end;

  const
    kindsCount = 4;
    kindCodes: array [1..kindsCount] of Integer =
        (
        RQFKORDER_KIND_PRIHOD_POSTAVKA,
        RQFKORDER_KIND_RASHOD_TO_STORAGE,
        RQFKORDER_KIND_RASHOD_OE2REM,
        RQFKORDER_KIND_RASHOD_MNMA
        );

    kindPrihodCodes: array [1..2] of Integer =
        (
        RQFKORDER_KIND_PRIHOD_POSTAVKA,
        RQFKORDER_KIND_RASHOD_TO_STORAGE
        );
    kindRashodCodes: array [1..2] of Integer =
        (
        RQFKORDER_KIND_RASHOD_OE2REM,
        RQFKORDER_KIND_RASHOD_MNMA
        );
  var
  RQPackingListHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата ведомости'
          ,'Відправник'
          ,'Одержувач'
          ,'Статус'
          ,'Тип обліку'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  RQPackingListItemHeaders: array [1..16] of String =
        ( 'Код'
          ,'Наименование материала'
          ,'Зона хранения'
          ,'Наименование единицы изменения'
          ,'Необходимое количество'
          ,'Фактическое количество'
          ,'П1'
          ,'П1, кол-во'
          ,'П2'
          ,'П2, кол-во'
          ,'П3'
          ,'П3, кол-во'
          ,'П4'
          ,'П4, кол-во'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

    RQFKOrderHeaders: array [1..19] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Вид'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Загальна вага, кг'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
        );

implementation

uses
  Main, ShowFINMol, FINMolController, ShowENDepartment
  , ENDepartmentController
  , TKMaterialsController
  , ShowTKMaterials
  , EnergyproController
  , DMReportsUnit
  , EditRQFKOrder
  , ShowRQFKOrderKind
  , RQFKOrderKindController
  , TKAccountingTypeController
  , EditRQFKOrderFilter
  , EditENPlanWork
  , RepRestByPlaces
  , EditRQPackingList
  , ReportUnMovedOrders
, EditRQPackingListCounters;
{$R *.dfm}

procedure TfrmRQWarehouseMaterialsMovement.updatePackingList;
  var
  TempRQPackingList: RQPackingListControllerSoapPort;
  i, LastCount, LastRow: Integer;
  RQPackingListList: RQPackingListShortList;
  begin

  ClearGrid(sgRQPackingList);

  SetGridHeaders(RQPackingListHeaders, sgRQPackingList.ColumnHeaders);
  TempRQPackingList :=  HTTPRIORQPackingList as RQPackingListControllerSoapPort;

  RQPackingListList := TempRQPackingList.getScrollableFilteredList(packingListFilter,0,-1);

  LastCount:=High(RQPackingListList.list);

  if LastCount > -1 then
     sgRQPackingList.RowCount:=LastCount+2
  else
     sgRQPackingList.RowCount:=2;

   with sgRQPackingList do
    for i:=0 to LastCount do
      begin
        // Application.ProcessMessages;
        if RQPackingListList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPackingListList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPackingListList.list[i].numberGen;
        if RQPackingListList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQPackingListList.list[i].dateGen);
        Cells[3,i+1] := RQPackingListList.list[i].molFromCode + ' ' + RQPackingListList.list[i].molFromName;
        Cells[4,i+1] := RQPackingListList.list[i].molToCode + ' ' + RQPackingListList.list[i].molToName;

        Cells[5,i+1] := RQPackingListList.list[i].statusRefName;

//        if ((RQPackingListList.list[i].packerFIO = '') or
//           (RQPackingListList.list[i].packerTabNumber = '') or
//           (RQPackingListList.list[i].packerPosition = '')) then
//        Cells[6,i+1] := '' else
//        Cells[6,i+1] := RQPackingListList.list[i].packerFIO +
//                        ' таб.№' + RQPackingListList.list[i].packerTabNumber +
//                        ' посада:' + RQPackingListList.list[i].packerPosition;

        Cells[6,i+1] := RQPackingListList.list[i].accountingTypeRefName;

        Cells[7,i+1] := RQPackingListList.list[i].userGen;;
        if RQPackingListList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(RQPackingListList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQPackingList.RowCount:=LastRow+1;
      end;
   sgRQPackingList.Row:=1;

end;

procedure TfrmRQWarehouseMaterialsMovement.updatePackingListItem;
  var
  TempRQPackingListItem: RQPackingListItemControllerSoapPort;
  i, LastCount, LastRow: Integer;
  pliList: RQPackingListItemShortList;
  pliFilter : RQPackingListItemFilter;
  begin

  ClearGrid(sgRQPackingListItem);

  SetGridHeaders(RQPackingListItemHeaders, sgRQPackingListItem.ColumnHeaders);
  try
    begin
  pliFilter := RQPackingListItemFilter.Create;
  SetNullIntProps(pliFilter);
  SetNullXSProps(pliFilter);
  pliFilter.packingListRef := RQPackingListRef.Create;
  pliFilter.packingListRef.code := StrToInt(sgRQPackingList.Cells[0, sgRQPackingList.Row]);

  TempRQPackingListitem :=  HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  pliList := TempRQPackingListItem.getScrollableFilteredListForEdit(pliFilter,0,-1);

  LastCount:=High(pliList.list);

  if LastCount > -1 then
     sgRQPackingListItem.RowCount:=LastCount+2
  else
     sgRQPackingListItem.RowCount:=2;

   with sgRQPackingListItem do
    for i:=0 to LastCount do
      begin
        // Application.ProcessMessages;
        if pliList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(pliList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := pliList.list[i].materialName;

        Cells[2,i+1] := pliList.list[i].storageZoneRefName;

        Cells[3,i+1] := pliList.list[i].measurementName;

        if pliList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := pliList.list[i].countGen.DecimalString;

         if pliList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := pliList.list[i].countFact.DecimalString;

          Cells[6,i+1] := pliList.list[i].namePaletCol1;

        if pliList.list[i].countPaletCol1 = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := pliList.list[i].countPaletCol1.DecimalString;

          Cells[8,i+1] := pliList.list[i].namePaletCol2;

        if pliList.list[i].countpaletcol2 = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := pliList.list[i].countPaletCol2.DecimalString;

          Cells[10,i+1] := pliList.list[i].namePaletCol3;

        if pliList.list[i].countPaletCol3 = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := pliList.list[i].countPaletCol3.DecimalString;

          Cells[12,i+1] := pliList.list[i].namePaletCol4;

        if pliList.list[i].countPaletCol4 = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := pliList.list[i].countPaletCol4.DecimalString;

        Cells[14,i+1] := pliList.list[i].userGen;;
        if pliList.list[i].dateEdit = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDate2String(pliList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQPackingListItem.RowCount:=LastRow+1;
      end;
   sgRQPackingListItem.Row:=1;
    end;
    except on EConvertError do Exit;
    end;
end;

procedure TfrmRQWarehouseMaterialsMovement.FormCreate(Sender: TObject);
var
  fList : FINMolShortList;
  f: FINMolFilter;
  TempFINMol: FINMolControllerSoapPort;
begin
  inherited;
  MolCode := '';
  MolName := '';
  renCode := 0;
  materialCode := -1;
  // по-умолчанию включена работа и с приходами и с расходами
  chbRashod.Checked := true;
  chbPrihod.Checked := true;

  isToFind := true;

  // по-умолчанию дата - сегодня
  edtDateStart.Date := Date();
  edtDateFinal.Date := Date();

  // очистка фильтров
  orderFilter := nil;

  // вкладка "Упаковочные ведомости"

  // поставим сегодняшнюю дату
  edtPackingListFilterDateStart.Date := Date();
  edtPackingListFilterDateFinal.Date := Date();

  // поставим МОЛа по-умолчанию
  TempFINMol := HTTPRIOFINMol as  FINMolControllerSoapPort;
  f := FINMolFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.id := '1889';
  fList := TempFINMol.getScrollableFilteredList(f,0,1);

  PackingListMolCode := fList.list[0].id;
  PackingListMolName := fList.list[0].text;
  edtPackingListMol.Text := PackingListMolCode + ' ' + PackingListMolName;

  // тут же выберем ведомости на сегодня по дефоултному МОЛу
  Self.btnPackingListSearchClick(Sender);


  // заодно подставим МОЛа и для вкладки с ордерами
  MolCode := PackingListMolCode;
  MolName := PackingListMolName;
  edtMOLSclad.Text := edtPackingListMol.Text;



end;

procedure TfrmRQWarehouseMaterialsMovement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmRQWarehouseMaterialsMovement := nil;

  inherited;

end;

procedure TfrmRQWarehouseMaterialsMovement.spbMOLScladClick(
  Sender: TObject);
var
  f : FINMolFilter;
  frmFINMolShow : TfrmFINMolShow;
begin
  inherited;
    f := FINMolFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.state := 1; // ???? ?????? ?????????? ...

     //f.text := edtMolOutCode.Text;
     //f.id := edtMolOutCode.Text;

       frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

       try
            frmFINMolShow.isFiltered := true;

          with frmFINMolShow do begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try
                    {Если менялся МОЛ центрального склада то кнопка Пошук становится активной}
                   if MolCode <> GetReturnValue(sgFINMol,0) then
                   begin
                    isToFind := true;
                    btnSearch.Enabled := isToFind;
                   end;
                   MolCode := GetReturnValue(sgFINMol,0);
                   MolName := GetReturnValue(sgFINMol,1);
                   edtMolSclad.Text := GetReturnValue(sgFINMol,0) + ' ' + GetReturnValue(sgFINMol,1);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINMolShow.Free;
       end;
end;

procedure TfrmRQWarehouseMaterialsMovement.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtMOLSclad, edtPackingListMol]);
end;

procedure TfrmRQWarehouseMaterialsMovement.DisableControls(Controls: array of TControl; Disable: Boolean = true; Color: TColor = clBtnFace);
Var i: Integer;
begin
  for i:=Low(Controls) to High(Controls) do
  begin
    //Controls[i].Enabled:=not Disable;
    if (Controls[i] is TEdit) or (Controls[i] is TMemo) then
    begin
      if (Controls[i] is TEdit) then
        TEdit(Controls[i]).ReadOnly:=Disable;
      if (Controls[i] is TMemo) then
        TMemo(Controls[i]).ReadOnly:=Disable;
    end
    else
      Controls[i].Enabled:=not Disable;
    if (Controls[i] is TEdit) and Disable then
      TEdit(Controls[i]).Color:=Color;
    if (Controls[i] is TEdit) and not Disable then
      TEdit(Controls[i]).Color:=clWindow;
    if (Controls[i] is TMemo) and Disable then
      TMemo(Controls[i]).Color:=Color;
    if (Controls[i] is TMemo) and not Disable then
      TMemo(Controls[i]).Color:=clWindow;
    if (Controls[i] is TTreeView) and Disable then
      TTreeView(Controls[i]).Color:=Color;
    if (Controls[i] is TTreeView) and not Disable then
      TTreeView(Controls[i]).Color:=clWindow;
    if (Controls[i] is TAdvStringGrid) and Disable then
      TAdvStringGrid(Controls[i]).Color:=Color;
    if (Controls[i] is TAdvStringGrid) and not Disable then
      TAdvStringGrid(Controls[i]).Color:=clWindow;
    if (Controls[i] is TDateTimePicker) and Disable then
      TDateTimePicker(Controls[i]).Color:=Color;
    if (Controls[i] is TDateTimePicker) and not Disable then
      TDateTimePicker(Controls[i]).Color:=clWindow;
  end;
end;




procedure TfrmRQWarehouseMaterialsMovement.btnSearchClick(Sender: TObject);
var
strDateStart, strDateFinal : String;
begin
  inherited;

  {Приходы и расходы}
  isPrihod := chbPrihod.Checked;
  isRashod := chbRashod.Checked;

  if (isPrihod = false) and (isRashod = false) then begin
      Application.MessageBox(PChar('Необхідно поставити прапорець Приход (або Расход) '),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;
  {Добавление ограничений}
  if not edtDateStart.Checked then begin
      Application.MessageBox(PChar('Оберіть дату початку'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;
  if not edtDateFinal.Checked then begin
      Application.MessageBox(PChar('Оберіть дату закінчення'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;
  if MolCode = '' then begin
      Application.MessageBox(PChar('Оберіть комірника центрального складу'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  dateStart := edtDateStart.Date;
  dateFinal := edtDateFinal.Date;

  strDateStart := IntToStr(DayOf(dateStart)) + '.' + IntToStr(MonthOf(dateStart)) + '.' + IntToStr(YearOf(dateStart));
  strDateFinal := IntToStr(DayOf(dateFinal)) + '.' + IntToStr(MonthOf(dateFinal)) + '.' + IntToStr(YearOf(dateFinal));

  {Построение фильтра для ордеров}
  orderFilter := RQFKOrderFilter.Create;
  SetNullXSProps(orderFilter);
  SetNullIntProps(orderFilter);

  orderFilter.conditionSQL := ' RQFKORDER.DATEGEN >= ''' + strDateStart + '''' + ' AND RQFKORDER.DATEGEN <= ''' + strDateFinal + '''';
  orderFilter.conditionSQL := orderFilter.conditionSQL + ' AND RQFKORDER.KINDCODE IN (' + getStrKindCodes + ')';
  orderFilter.conditionSQL := orderFilter.conditionSQL + ' AND ((RQFKORDER.KINDCODE IN (' + IntToStr(RQFKORDER_KIND_PRIHOD_POSTAVKA) + ', ' + IntToStr(RQFKORDER_KIND_RASHOD_TO_STORAGE) + ') AND RQFKORDER.MOLOUTCODE = ''' + MolCode + ''') OR (RQFKORDER.MOLINCODE = ''' + MolCode + '''))';

  isToFind := false;

  updateRQFKOrderGrid;

  btnSearch.Enabled := isToFind;

end;

procedure TfrmRQWarehouseMaterialsMovement.updateRQFKOrderGrid;
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  i, LastCount, LastRow : Integer;
  RQFKOrderList: RQFKOrderShortList;
begin


   if isToFind then begin
      Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
   end;

   sgRQFKOrder.Clear;
   SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
   TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

   RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(orderFilter,0,-1);

   LastCount := High(RQFKOrderList.list);

   if LastCount > -1 then
     sgRQFKOrder.RowCount:=LastCount+2
   else
     sgRQFKOrder.RowCount:=2;

      with sgRQFKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderList.list[i].numberDoc;
        if RQFKOrderList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

        Cells[3, i+1] := RQFKOrderList.list[i].kindName;

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[4,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[4,i+1] := RQFKOrderList.list[i].molInCode;

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[5,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[5,i+1] := RQFKOrderList.list[i].molInName;

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[6,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else if (RQFKOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[6,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[6,i+1] := RQFKOrderList.list[i].molOutCode;

        if (RQFKOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[7,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[7,i+1] := RQFKOrderList.list[i].molOutName;


        Cells[8, i+1] := RQFKOrderList.list[i].statusName;
        Cells[9,i+1] := RQFKOrderList.list[i].expeditorCode;
        Cells[10,i+1] := RQFKOrderList.list[i].expeditorName;

        Cells[11,i+1] := RQFKOrderList.list[i].warrantNumber;
        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);
        Cells[13,i+1] := RQFKOrderList.list[i].warrantFIO;

        if RQFKOrderList.list[i].totalWeight = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := RQFKOrderList.list[i].totalWeight.DecimalString;

        Cells[15,i+1] := RQFKOrderList.list[i].userAdd;

        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[17,i+1] := RQFKOrderList.list[i].userGen;

        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

        Objects[0, i+1] :=  TObject(RQFKOrderList.list[i].departmentCode);

          {Добавление checkbox'a для выбора расходных ордеров, включаемых в складской заказ}
          if (RQFKOrderList.list[i].kindCode <> RQFKORDER_KIND_PRIHOD_POSTAVKA)
          and (RQFKOrderList.list[i].statusCode in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE]) then
                      AddCheckBox(1, i+1, false, false);

        LastRow:=i+1;
        sgRQFKOrder.RowCount:=LastRow+1;
      end;
      sgRQFKOrder.Row := 1;

end;


procedure TfrmRQWarehouseMaterialsMovement.edtDateStartChange(
  Sender: TObject);
begin
  inherited;
  {Если дата начала была изменена то кнопка Пошук становится активной}
  if (dateStart <> edtDateStart.Date) then begin
      isToFind := true;
      btnSearch.Enabled := isToFind;
  end;
end;

procedure TfrmRQWarehouseMaterialsMovement.edtDateFinalChange(
  Sender: TObject);
begin
  inherited;
  {Если дата окончания была изменена то кнопка Пошук становится активной}
  if (dateFinal <> edtDateFinal.Date) then begin
      isToFind := true;
      btnSearch.Enabled := isToFind;
  end;
end;

function TfrmRQWarehouseMaterialsMovement.getStrKindCodes : String;
var
outRes : String;
i : Integer;
begin
outRes := '';

if(isPrihod) then
begin
  for i := Low(kindPrihodCodes) to High(kindPrihodCodes) do begin
    if Length(outRes) = 0 then
      outRes := IntToStr(kindPrihodCodes[i])
    else
      outRes := outRes + ', ' + IntToStr(kindPrihodCodes[i]);
  end;
end;

if(isRashod) then
begin
  for i := Low(kindRashodCodes) to High(kindRashodCodes) do begin
    if Length(outRes) = 0 then
      outRes := IntToStr(kindRashodCodes[i])
    else
      outRes := outRes + ', ' + IntToStr(kindRashodCodes[i]);
  end;
end;

if Length(outRes) = 0 then
begin
    outRes := 'null';
end;

result := outRes;

end;


procedure TfrmRQWarehouseMaterialsMovement.actOrderViewExecute(
  Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
begin

  if isToFind then begin
    {Если не была нажата кнопка Пошук или изменены параметры}
    Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsView);

  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmRQFKOrderEdit.ShowModal = mrOk) then
      begin
      end;

  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;


procedure TfrmRQWarehouseMaterialsMovement.actOrderInsertExecute(
  Sender: TObject);
var
  frmRQFKOrderKindShow: TfrmRQFKOrderKindShow;
  orderKind : Integer;
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  orderKindFilter : RQFKOrderKindFilter;
begin
  inherited;

  if isToFind then begin
    {Если не была нажата кнопка Пошук или изменены параметры}
    Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;
  {Выбор вида ордера}
  orderKind := Low(Integer);

  orderKindFilter := RQFKOrderKindFilter.Create;
  SetNullXSProps(orderKindFilter);
  SetNullIntProps(orderKindFilter);
  orderKindFilter.conditionSQL := ' RQFKORDERKIND.CODE IN (' + getStrKindCodes + ')';

  frmRQFKOrderKindShow := TfrmRQFKOrderKindShow.Create(Application, fmNormal, orderKindFilter);
  try
    with frmRQFKOrderKindShow do begin
      DisableActions([ActEdit, ActUpdate, actInsert, actDelete,actView,actFilter,actNoFilter]);
      if ShowModal = mrOk then
      begin
        try
          orderKind := StrToInt(GetReturnValue(sgRQFKOrderKind,0));
        except
        on EConvertError do Exit;
        end;
    end;
    end;
  finally
  end;
  {Если не выбран вид ордера - то процедура покидается}
  if orderKind = Low(Integer) then Exit;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsInsert);

  try
    frmRQFKOrderEdit.RQFKOrderObj:=RQFKOrder.Create;
    frmRQFKOrderEdit.RQFKOrderObj.kind := RQFKOrderKind.Create;

    {Установка параметров формы редактирование ордеров}
    if frmRQFKOrderEdit.RQFKOrderObj.kind = nil then frmRQFKOrderEdit.RQFKOrderObj.kind := RQFKOrderKind.Create;
    frmRQFKOrderEdit.RQFKOrderObj.kind.code := orderKind;

    if frmRQFKOrderEdit.RQFKOrderObj.accountingTypeRef = nil then frmRQFKOrderEdit.RQFKOrderObj.accountingTypeRef := TKAccountingTypeRef.Create;
      frmRQFKOrderEdit.RQFKOrderObj.accountingTypeRef.code := TK_ACCOUNTINGTYPE_TMC;
      frmRQFKOrderEdit.cbTKAccountingType.ItemIndex := frmRQFKOrderEdit.RQFKOrderObj.accountingTypeRef.code - 1;

    if orderKind in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_RASHOD_TO_STORAGE] then
    begin
      frmRQFKOrderEdit.edtMolOutCode.Text := MolCode;
      frmRQFKOrderEdit.edtMolOutName.Text := MolName;
      frmRQFKOrderEdit.RQFKOrderObj.molOutCode := MolCode;
      frmRQFKOrderEdit.RQFKOrderObj.molOutName := MolName;

    end
    else
    begin
      frmRQFKOrderEdit.edtMolInCode.Text := MolCode;
      frmRQFKOrderEdit.edtMOLInName.Text := MolName;
      frmRQFKOrderEdit.RQFKOrderObj.molInCode := MolCode;
      frmRQFKOrderEdit.RQFKOrderObj.molInName := MolName;
    end;

    if frmRQFKOrderEdit.ShowModal = mrOk then
    begin
      if frmRQFKOrderEdit.RQFKOrderObj<>nil then
        updateRQFKOrderGrid;
    end;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;

procedure TfrmRQWarehouseMaterialsMovement.actOrderChangeExecute(
  Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  if isToFind then begin
    {Если не была нажата кнопка Пошук или изменены параметры}
    Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsEdit);

  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmRQFKOrderEdit.RQFKOrderObj.status.code <> RQFKORDER_STATUS_GOOD) then
    begin
        Application.MessageBox(PChar('Цей ордер не редагується ... відмініть проведення або затвердження ...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end;

    if frmRQFKOrderEdit.ShowModal= mrOk then
      begin
        updateRQFKOrderGrid;
      end;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;


procedure TfrmRQWarehouseMaterialsMovement.actOrderRemoveExecute(
  Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
  ObjCode: Integer;
begin
  if isToFind then begin
    {Если не была нажата кнопка Пошук или изменены параметры}
    Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;
 TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
   except
   on EConvertError do Exit;
  end;

    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ордер ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
              TempRQFKOrder.remove(ObjCode);
              updateRQFKOrderGrid;
  end;
end;


procedure TfrmRQWarehouseMaterialsMovement.actOrderUpdateExecute(
  Sender: TObject);
begin
  inherited;
  updateRQFKOrderGrid;
end;

procedure TfrmRQWarehouseMaterialsMovement.actOrderFilterExecute(
  Sender: TObject);
var
condition : String;
begin
  inherited;
  frmRQFKOrderFilterEdit:=TfrmRQFKOrderFilterEdit.Create(Application, dsInsert);
  try

    if isToFind then begin
      {Если не была нажата кнопка Пошук или изменены параметры}
      Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;
    
    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    {Деактивация элементов управления для выборка дат ордеров на форме формирования фильтра}
    frmRQFKOrderFilterEdit.edtDateGenFrom.Enabled := False;
    frmRQFKOrderFilterEdit.edtDateGenTo.Enabled := False;

    if frmRQFKOrderFilterEdit.ShowModal = mrOk then
    begin
      condition := orderFilter.conditionSQL;
      orderFilter := RQFKOrderFilterObj;
      orderFilter.conditionSQL := condition;
      updateRQFKOrderGrid;
    end;
  finally
    frmRQFKOrderFilterEdit.Free;
    frmRQFKOrderFilterEdit:=nil;
  end;
end;


procedure TfrmRQWarehouseMaterialsMovement.actOrderWithoutFilterExecute(
  Sender: TObject);
var
condition : String;
begin
  inherited;
  if isToFind then begin
    {Если не была нажата кнопка Пошук или изменены параметры}
    Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;
  condition := orderFilter.conditionSQL;
  orderFilter := RQFKOrderFilter.Create;
  SetNullXSProps(orderFilter);
  SetNullIntProps(orderFilter);
  orderFilter.conditionSQL := condition;
  updateRQFKOrderGrid;

end;

procedure TfrmRQWarehouseMaterialsMovement.actCreatedPrihodExecute(
  Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
begin

  if isToFind then begin
    {Если не была нажата кнопка Пошук или изменены параметры}
    Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

      try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Складений" у накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin

      TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
      TempRQFKOrder.createdPrihod(ObjCode);
      updateRQFKOrderGrid;
    end;

end;

procedure TfrmRQWarehouseMaterialsMovement.actUnCreatedPrihodExecute(
  Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
begin

  if isToFind then begin
    {Если не была нажата кнопка Пошук или изменены параметры}
    Application.MessageBox(PChar('Нажміть Пошук!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

    try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити складання накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin


  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  TempRQFKOrder.unCreatedPrihod(ObjCode);

  updateRQFKOrderGrid;
end;

end;

procedure TfrmRQWarehouseMaterialsMovement.pmRQFKOrderPopup(
  Sender: TObject);
var
  fkOrder : RQFKOrder;
  ObjCode : Integer;

begin
  inherited;

  try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
     on EConvertError do Exit;
  end;

  fkOrder := DMReports.getRQFKOrderByCode(ObjCode);

  if  fkOrder = nil  then Exit;

  {Деактивирование действий}
  actCreatedPrihod.Visible := (fkOrder.status.code = RQFKORDER_STATUS_GOOD);
  actCreatedPrihod.Enabled := (fkOrder.status.code = RQFKORDER_STATUS_GOOD);
  actUnCreatedPrihod.Visible := (fkOrder.status.code = RQFKORDER_STATUS_CREATED);
  actUnCreatedPrihod.Enabled := (fkOrder.status.code = RQFKORDER_STATUS_CREATED);

  actPrintPrihodStatement.Visible := False;
  actPrintPrihodStatement.Enabled := False;
  //actPrintPrihodStatement.Visible := (fkOrder.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA);
  //actPrintPrihodStatement.Enabled := (fkOrder.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA);

end;

procedure TfrmRQWarehouseMaterialsMovement.actPrintPrihodStatementExecute(
  Sender: TObject);
var
argNames : ArrayOfString;
args : ArrayOfString;
reportName : String;

fkOrder : RQFKOrder;
ObjCode : Integer;

TempRQFKOrder : RQFKOrderControllerSoapPort;

begin
 inherited;

  try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
     on EConvertError do Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  fkOrder := TempRQFKOrder.getObject(ObjCode);

  if(fkOrder.kind.code <> RQFKORDER_KIND_PRIHOD_POSTAVKA) then
  begin
        Application.MessageBox(PChar('Цей звіт друкується тільки для прибуткового ордеру!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        Exit;
  end;

  {Определение параметров}
  SetLength(argNames, 1);
  SetLength(args, 1);
  argNames[0] := 'orderCode';
  args[0] := IntToStr(ObjCode);
  {Определение отчета}
  reportName := 'warehouseMaterialsMovement/incomeSlipFromRQFKOrder';

  {Формирование отчета}
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQWarehouseMaterialsMovement.btnfrmRestRepByPlacesClick(
  Sender: TObject);
begin
  inherited;
   frmRepRestByPlaces := TfrmRepRestByPlaces.Create(Application, dsInsert);
  try
    if (MolCode <> '') then
    begin
        frmRepRestByPlaces.edtMolName.Text := edtMOLSclad.Text;
        frmRepRestByPlaces.divcode := MolCode;
        frmRepRestByPlaces.divname := edtMOLSclad.Text;
    end;
    frmRepRestByPlaces.ShowModal;
  finally
    frmRepRestByPlaces.Free;
  end;
end;

procedure TfrmRQWarehouseMaterialsMovement.chbPrihodClick(Sender: TObject);
begin
  inherited;
  isPrihod := chbPrihod.Checked;
  isToFind := true;
  btnSearch.Enabled := isToFind;
end;

procedure TfrmRQWarehouseMaterialsMovement.chbRashodClick(Sender: TObject);
begin
  inherited;
  isRashod := chbRashod.Checked;
  isToFind := true;
  btnSearch.Enabled := isToFind;
end;

procedure TfrmRQWarehouseMaterialsMovement.btnFreePlacesClick(
  Sender: TObject);
var
argNames : ArrayOfString;
args : ArrayOfString;
reportName : String;
begin
  inherited;
  {Определение параметров}
  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'dategen';
  args[0] := DateToStr(Date);

  argNames[1] := 'storagecode';
  args[1] := '500000000';
  {Определение отчета}
  reportName := 'warehouseMaterialsMovement/freePlaces';

  {Формирование отчета}
  makeReport(reportName, argNames, args, 'xls');


end;

procedure TfrmRQWarehouseMaterialsMovement.spbPackingListMolClick(
  Sender: TObject);
var
  f : FINMolFilter;
  frmFINMolShow : TfrmFINMolShow;
begin
  inherited;
    f := FINMolFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.state := 1;

       frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

       try
            frmFINMolShow.isFiltered := true;

          with frmFINMolShow do begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try
                   PackingListMolCode := GetReturnValue(sgFINMol,0);
                   PackingListMolName := GetReturnValue(sgFINMol,1);
                   edtPackingListMol.Text := GetReturnValue(sgFINMol,0) + ' ' + GetReturnValue(sgFINMol,1);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINMolShow.Free;
       end;

end;

procedure TfrmRQWarehouseMaterialsMovement.btnPackingListSearchClick(
  Sender: TObject);
  var
  strDateStart, strDateFinal : String;
begin

  {Добавление ограничений}
  if not edtPackingListFilterDateStart.Checked then begin
      Application.MessageBox(PChar('Оберіть дату початку'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;
  if not edtPackingListFilterDateFinal.Checked then begin
      Application.MessageBox(PChar('Оберіть дату закінчення'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;
  if PackingListMolCode = '' then begin
      Application.MessageBox(PChar('Оберіть комірника центрального складу'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  PackingListDateStart := edtPackingListFilterDateStart.Date;
  PackingListDateFinal := edtPackingListFilterDateFinal.Date;

  strDateStart := IntToStr(DayOf(PackingListDateStart)) + '.' + IntToStr(MonthOf(PackingListDateStart)) + '.' + IntToStr(YearOf(PackingListDateStart));
  strDateFinal := IntToStr(DayOf(PackingListDateFinal)) + '.' + IntToStr(MonthOf(PackingListDateFinal)) + '.' + IntToStr(YearOf(PackingListDateFinal));

{Построение фильтра для паковочной ведомости}
  packingListFilter := RQPackingListFilter.Create;
  SetNullXSProps(packingListFilter);
  SetNullIntProps(packingListFilter);

  if chbOnlyGood.Checked then
  begin
  packingListFilter.statusRef := RQPackingListStatusRef.Create;
  packingListFilter.statusRef.code :=  RQPACKINGLIST_STATUS_GOOD;
  end;

  packingListFilter.conditionSQL := ' RQPACKINGLIST.DATEGEN >= ''' + strDateStart + '''' + ' AND RQPACKINGLIST.DATEGEN <= ''' + strDateFinal + '''';

  if (not chbPackingListIncome.Checked) and (not chbPackingListOutcome.Checked)  then begin
      Application.MessageBox(PChar('Необхідно поставити прапорець Приход (або Расход) '),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;
  if (chbPackingListIncome.Checked) and (not chbPackingListOutcome.Checked)  then begin
    packingListFilter.conditionSQL := packingListFilter.conditionSQL  +  ' and RQPACKINGLIST.MOLTOCODE = ''' + PackingListMolCode + '''';
  end;
  if (not chbPackingListIncome.Checked) and (chbPackingListOutcome.Checked)  then begin
    packingListFilter.conditionSQL := packingListFilter.conditionSQL  +  ' and RQPACKINGLIST.MOLFROMCODE = ''' + PackingListMolCode + '''';
  end;
  if (chbPackingListIncome.Checked) and (chbPackingListOutcome.Checked)  then begin
    packingListFilter.conditionSQL := packingListFilter.conditionSQL  +  ' and (RQPACKINGLIST.MOLFROMCODE = ''' + PackingListMolCode + '''';
    packingListFilter.conditionSQL := packingListFilter.conditionSQL  +  ' or RQPACKINGLIST.MOLTOCODE = ''' + PackingListMolCode + ''')';
  end;

  updatePackingList;
  sgRQPackingListClick(Sender);

end;

procedure TfrmRQWarehouseMaterialsMovement.actRQPackingListViewExecute(
  Sender: TObject);
var
  TempRQPackingList : RQPackingListControllerSoapPort;
  packingList : RQPackingList;
  frmPackingList : TDialogForm;
begin
 TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;

   try
     packingList := TempRQPackingList.getObject(StrToInt(sgRQPackingList.Cells[0,sgRQPackingList.Row]));
   except
   on EConvertError do Exit;
  end;

    if packingList.accountingTypeRef.code = ENConsts.TK_ACCOUNTINGTYPE_COUNTER
   then begin
       frmPackingList:= TfrmRQPackingListCountersEdit.Create(Application, dsView);
       TfrmRQPackingListCountersEdit(frmPackingList).RQPackingListObj := packingList;
   end
   else begin
       frmPackingList:= TfrmRQPackingListEdit.Create(Application, dsView);
       TfrmRQPackingListEdit(frmPackingList).RQPackingListObj := packingList;
   end;

  try
    if (frmPackingList.ShowModal = mrOk) then
      begin
      end;

  finally
    frmPackingList.Free;
    frmPackingList:=nil;
  end;
end;

procedure TfrmRQWarehouseMaterialsMovement.actRQPackingListEditExecute(
  Sender: TObject);
var
  TempRQPackingList : RQPackingListControllerSoapPort;
  frmPackingList : TDialogForm;
  packingList : RQPackingList;
begin
 TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;

   try
     packingList := TempRQPackingList.getObject(StrToInt(sgRQPackingList.Cells[0,sgRQPackingList.Row]));
   except
   on EConvertError do Exit;
  end;

  if packingList.accountingTypeRef.code = ENConsts.TK_ACCOUNTINGTYPE_COUNTER
   then begin
       frmPackingList:= TfrmRQPackingListCountersEdit.Create(Application, dsEdit);
       TfrmRQPackingListCountersEdit(frmPackingList).RQPackingListObj := packingList;
   end
   else begin
       frmPackingList:= TfrmRQPackingListEdit.Create(Application, dsEdit);
       TfrmRQPackingListEdit(frmPackingList).RQPackingListObj := packingList;
   end;

  try
    if (frmPackingList.ShowModal = mrOk) then
      begin
          updatePackingList;
      end;

  finally
    frmPackingList.Free;
    frmPackingList:=nil;
  end;


end;

procedure TfrmRQWarehouseMaterialsMovement.actRQPackingListInsertExecute(
  Sender: TObject);
  var packingList : RQPackingList;
begin

  packingList:=RQPackingList.Create;

  try
    frmRQPackingListEdit:=TfrmRQPackingListEdit.Create(Application, dsInsert);
    frmRQPackingListEdit.RQPackingListObj := packingList;
    frmRQPackingListEdit.molFromCode := PackingListMolCode;
    frmRQPackingListEdit.molFromName := PackingListMolName;
    frmRQPackingListEdit.edtMolFrom.Text := PackingListMolCode + ' ' + PackingListMolName;
    try
      if frmRQPackingListEdit.ShowModal = mrOk then
      begin
        if RQPackingList<>nil then

            updatePackingList;
      end;
    finally
      frmRQPackingListEdit.Free;
      frmRQPackingListEdit:=nil;
    end;
  finally
    packingList.Free;
  end;
end;

procedure TfrmRQWarehouseMaterialsMovement.actRQPackingListDeleteExecute(
  Sender: TObject);
Var TempRQPackingList: RQPackingListControllerSoapPort;
  ObjCode: Integer;
begin

 TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPackingList.Cells[0,sgRQPackingList.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пакувальну Відомість) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPackingList.remove(ObjCode);
      updatePackingList;
  end;
end;

procedure TfrmRQWarehouseMaterialsMovement.sgRQPackingListClick(
  Sender: TObject);
begin
  inherited;
    updatePackingListItem;
end;

procedure TfrmRQWarehouseMaterialsMovement.actRQPackingListUpdateExecute(
  Sender: TObject);
begin
btnPackingListSearchClick(Sender);
end;

procedure TfrmRQWarehouseMaterialsMovement.btnUnMovedOrdersClick(
  Sender: TObject);
var
  frmReportUnMovedOrders : TfrmReportUnMovedOrders;
begin
  inherited;
  frmReportUnMovedOrders := TfrmReportUnMovedOrders.Create(Application, dsInsert);
  try
    frmReportUnMovedOrders.ShowModal;
  finally
    frmReportUnMovedOrders.Free;
  end;
end;

procedure TfrmRQWarehouseMaterialsMovement.Button1Click(Sender: TObject);
var
  argNames : ArrayOfString;
  args : ArrayOfString;
  reportName : String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'param1';
  args[0] := '';

  reportName := 'sklad/ListPallet';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmRQWarehouseMaterialsMovement.sgRQPackingListDblClick(
  Sender: TObject);
begin
  inherited;
   actRQPackingListViewExecute(Sender);
end;

procedure TfrmRQWarehouseMaterialsMovement.btnPrintIncomeStatementClick(
  Sender: TObject);
var
  argNames : ArrayOfString;
  args : ArrayOfString;
  reportName : String;
begin
  inherited;
  reportName := 'warehouseMaterialsMovement/incomeSlip';
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'dull_parameter';
  args[0] := '1';

  makeReport(reportName, argNames, args, 'xls');
end;
procedure TfrmRQWarehouseMaterialsMovement.Button2Click(Sender: TObject);
var
  argNames : ArrayOfString;
  args : ArrayOfString;
  reportName : String;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'param1';
  args[0] := '';

  reportName := 'sklad/ListWithoutPallet';
  makeReport(reportName, argNames, args, 'pdf');
end;


end.
