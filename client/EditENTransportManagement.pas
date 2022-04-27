unit EditENTransportManagement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons,
  DialogFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ChildFormUnit, GridHeadersUnit, XSBuiltIns,
  TB2Item, TB2Dock, TB2Toolbar, TKTransportRealController, FINWorkerController, ENTravelSheetController, ENTransportOrderController,
  ImgList, Menus, ActnList, Planner, DateUtils, treelist, ENPlanWorkController, ENWorkOrderController,
  EditENPlanWorkItem2TKKoefFilter, AdvObj;

type
  TfrmTransportManagement = class(TChildForm)
    gbTransportOrder: TGroupBox;
    gbNotOrderedTransport: TGroupBox;
    sgUnOrderedTransport: TAdvStringGrid;
    Splitter1: TSplitter;
    sgUnorderedTransportDetailed: TAdvStringGrid;
    Panel4: TPanel;
    chbDetailed: TCheckBox;
    btnSetTimeOnTransportOrder: TButton;
    gbParameters: TGroupBox;
    edtDepartment: TEdit;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    edtDateStart: TDateTimePicker;
    lblDates: TLabel;
    btnLookForTransportAndDriver: TButton;
    gbTravelSheetOnDate: TGroupBox;
    sgTravelSheetCurrentDate: TAdvStringGrid;
    GroupBox1: TGroupBox;
    sgTravelSheetsPast: TAdvStringGrid;
    HTTPRIOTKTransport: THTTPRIO;
    HTTPRIOTKTransportReal: THTTPRIO;
    HTTPRIOFINWorker: THTTPRIO;
    HTTPRIOENTravelSheet: THTTPRIO;
    SpeedButton1: TSpeedButton;
    tbTravelSheetsPast: TTBToolbar;
    TBTravelSheetsPastFilter: TTBItem;
    TBTravelSheetsPastWithoutFilter: TTBItem;
    HTTPRIOENTransportOrder: THTTPRIO;
    HTTPRIOENTransportItem: THTTPRIO;
    TBTravelSheetsPastView: TTBItem;
    TBTravelSheetsPastChange: TTBItem;
    tbTravelSheetCurrentDate: TTBToolbar;
    TBTravelSheetCurrentDateView: TTBItem;
    TBTravelSheetCurrentDateEdit: TTBItem;
    alTravelSheetsPast: TActionList;
    actView: TAction;
    actEdit: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    actClose: TAction;
    actUnClose: TAction;
    pmTravelSheetsPast: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    miClose: TMenuItem;
    miUnClose: TMenuItem;
    imgTravelSheetsPast: TImageList;
    actUpdate: TAction;
    alTravelSheetCurrentDate: TActionList;
    actViewCurrent: TAction;
    actEditCurrent: TAction;
    actCloseCurrent: TAction;
    actUnCloseCurrent: TAction;
    actUpdateCurrent: TAction;
    pmTravelSheetCurrentDate: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    gbTransport: TGroupBox;
    gbNormTransport: TGroupBox;
    sgTKTransport: TAdvStringGrid;
    gbRealTransport: TGroupBox;
    sgTKTransportReal: TAdvStringGrid;
    tbTKTransportRealActions: TTBToolbar;
    TBTKTransportRealFilter: TTBItem;
    TBTKTransportRealWithoutFilter: TTBItem;
    gbDrivers: TGroupBox;
    sgDrivers: TAdvStringGrid;
    TBDrivers: TTBToolbar;
    TBDriversFilter: TTBItem;
    TBDriversWithoutFilter: TTBItem;
    TimeLineByRealTransport: TGroupBox;
    RealTransportTimeline: TPlanner;
    gbOrderedTransport: TGroupBox;
    Panel1: TPanel;
    btnDeleteTransportOrder: TButton;
    btnEditTimeOnTransportOrder: TButton;
    btnDeleteTransportOrderItemsFromTravelSheetItem: TButton;
    chbAllTransportOrders: TCheckBox;
    alTransport: TActionList;
    actUnOrderedTransportShowPlan: TAction;
    actOrderedTransportShowPlan: TAction;
    HTTPRIOENPlanWork: THTTPRIO;
    btnPlanView: TButton;
    chbUnordered: TCheckBox;
    btnShowTravelSheetByTransportOrder: TButton;
    TBControlItem1: TTBControlItem;
    chbLastDrivers: TCheckBox;
    TBTravelSheetCurrentDateDelete: TTBItem;
    actDeleteCurrent: TAction;
    TBTravelSheetsPastDelete: TTBItem;
    actDelete: TAction;
    chbOrderedGood: TCheckBox;
    HTTPRIOENTravelSheetItem: THTTPRIO;
    edtDateFinal: TDateTimePicker;
    btnSearchRealTransportByOrder: TButton;
    tbTKTransportActions: TTBToolbar;
    TBTKTransportUpdate: TTBItem;
    HTTPRIOENWorkOrder2ENPlanWork: THTTPRIO;
    HTTPRIOFINMolData: THTTPRIO;
    sgOrderedTransport: TAdvStringGrid;
    TBControlItem2: TTBControlItem;
    chbAvailableTransport: TCheckBox;
    chbNoTravel: TCheckBox;
    TBTravelSheetCurrentDateViewTransportOrder: TTBItem;
    TBItem1: TTBItem;
    HTTPRIO1: THTTPRIO;
    HTTPRIOENTransportOrder2Travel: THTTPRIO;
    pmTransportReal: TPopupMenu;
    miCreateNewTravelSheet: TMenuItem;
    btnReport: TButton;
    spbMOL: TSpeedButton;
    edtFinMolCode: TEdit;
    lblFinMolCode: TLabel;
    Splitter2: TSplitter;
    chbHideUnorderedTransport: TCheckBox;
    btnClearMol: TSpeedButton;
    btnSetRealTransportToTransportOrder: TButton;
    btnSetNullRealTransportToTransportOrder: TButton;
    sgENTransportRealRepair: TAdvStringGrid;
    procedure btnLookForTransportAndDriverClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgTKTransportRealClick(Sender: TObject);
    procedure sgTKTransportClick(Sender: TObject);
    procedure btnEditTimeOnTransportOrderClick(Sender: TObject);
    procedure btnDeleteTransportOrderClick(Sender: TObject);
    procedure TBTKTransportRealFilterClick(Sender: TObject);
    procedure TBTKTransportRealWithoutFilterClick(Sender: TObject);
    procedure TBDriversFilterClick(Sender: TObject);
    procedure TBDriversWithoutFilterClick(Sender: TObject);
    procedure TBTravelSheetsPastFilterClick(Sender: TObject);
    procedure chbDetailedClick(Sender: TObject);
    procedure sgUnOrderedTransportClick(Sender: TObject);
    procedure btnSetTimeOnTransportOrderClick(Sender: TObject);
    procedure TBTravelSheetsPastViewClick(Sender: TObject);
    procedure TBTravelSheetsPastChangeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TBTravelSheetCurrentDateViewClick(Sender: TObject);
    procedure TBTravelSheetCurrentDateEditClick(Sender: TObject);
    procedure btnDeleteTransportOrderItemsFromTravelSheetItemClick(
      Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actUnCloseExecute(Sender: TObject);
    procedure pmTravelSheetsPastPopup(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure actViewCurrentExecute(Sender: TObject);
    procedure actEditCurrentExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actCloseCurrentExecute(Sender: TObject);
    procedure actUnCloseCurrentExecute(Sender: TObject);
    procedure actUpdateCurrentExecute(Sender: TObject);
    procedure pmTravelSheetCurrentDatePopup(Sender: TObject);
    procedure chbAllTransportOrdersClick(Sender: TObject);
    procedure actUnOrderedTransportShowPlanExecute(Sender: TObject);
    procedure actOrderedTransportShowPlanExecute(Sender: TObject);
    procedure chbUnorderedClick(Sender: TObject);
    procedure btnShowTravelSheetByTransportOrderClick(Sender: TObject);
    procedure chbLastDriversClick(Sender: TObject);
    procedure actDeleteCurrentExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure chbOrderedGoodClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDateStartChange(Sender: TObject);
    procedure edtDateFinalChange(Sender: TObject);
    procedure btnSearchRealTransportByOrderClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TBTKTransportUpdateClick(Sender: TObject);
    procedure sgOrderedTransportCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure chbAvailableTransportClick(Sender: TObject);
    procedure sgOrderedTransportClick(Sender: TObject);
    procedure chbNoTravelClick(Sender: TObject);
    procedure TBTravelSheetCurrentDateViewTransportOrderClick(Sender: TObject);
    procedure TBItem1Click(Sender: TObject);
    procedure miCreateNewTravelSheetClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure spbMOLClick(Sender: TObject);
    procedure chbHideUnorderedTransportClick(Sender: TObject);
    procedure btnClearMolClick(Sender: TObject);
    procedure btnSetRealTransportToTransportOrderClick(Sender: TObject);
    procedure btnSetNullRealTransportToTransportOrderClick(Sender: TObject);

  private
    transportMolCode : Integer;
    transportDepartmentCode : Integer;
    transportCode : Integer;
    transportNormCode : Integer;
    orderDateStart : TDate;
    orderDateFinal : TDate;
    toFilter : ENTransportOrderFilter;
    trFilter : ENTravelSheetFilter;
    isGroupByCategory : Boolean;
    orderCodeList : TList; // лист для хранения кодов выбранных флажками заявок
    molCodeList : TStringList; // лист для кодов молов мастеров на планах выбранных флажками заявок
    dateStartList : TList; // лист для хранения времени начала выбранных флажками заявок
    dateFinalList : TList; // лист для хранения времени конца выбранных флажками заявок
    procedure updateTKTransportGrid();
    procedure updateTKTransportRealGrid(realFilter : TKTransportRealFilter);
    procedure updateDriversGrid(workerFilter : FINWorkerFilter);
    procedure updateTravelSheetCurrentDateGrid();
    procedure updateTravelSheetsPastGrid(sheetsFilter : ENTravelSheetFilter);
    procedure updateOrderedTransportGrid(filter : ENTransportOrderFilter);
    procedure updateUnOrderedTransportGrid();
    procedure updateUnOrderedTransportDetailedGrid();
    procedure DisableControls(Controls: array of TControl; Disable: Boolean = true; Color: TColor = clBtnFace);
    function NoBlankValues(Edits: array of TWinControl): Boolean;

    procedure fillRealTransportTimeLine();

    function initializeParameters : Boolean;




  public
    { Public declarations }
  end;

var

    TKTransportHeaders: array [1..4] of String =
        ( 'Код'
          ,'Найменування транспорту'
          ,'П'
          ,'О'
        );

    TKTransportRealHeaders: array [1..5] of String =
        ( 'Код'
          ,'Найменування транспорту'
          ,'Держномер'
          ,'Інвентарний номер'
          ,'МОЛ'
        );

    DriversHeaders: array [1..4] of String =
        ( 'Код'
          ,'ПІБ'
          ,'Табельний номер'
          ,'Посада'
        );

  ENTravelSheetCurrentDateHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер под.листа'
          ,'Дата'
          ,'Водій'
          ,'Статус'
        );

  ENTravelSheetsPastHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер под.листа'
          ,'Дата'
          ,'Водій'
          ,'Статус'
        );
  UnOrderedTransportHeaders: array [1..8] of String =
        ('Код'
          ,'Найменування об''єкту'
          ,'Найменування транспорту'
          ,'№ наряд-завдання'
          ,'Підрозділ Плану'
          ,'Майстер'
          ,'Мобільний номер'
          ,'Виконавець'
        );

  UnOrderedTransportDetailedHeaders: array [1..5] of String =
        ( 'Код'
          ,'Нормативний транспорт'
          ,'Робота (код та найменування)'
          ,'Відстань, км'
          ,'Норма часу'
        );

  OrderedTransportHeaders : array [1..15] of String =
       ('Код'
       ,'Назва'
       ,'Період'
       ,'Об''єкт'
       ,'Підрозділ Плану'
       ,'Мол та Виконавець робіт'
       ,'Мобільний номер'
       ,'Статус'
       ,'Командировка'
       ,'Автотранспорт'
       ,'Подорожній лист'
       ,'Затверджена'
       ,'Відмінена'
       ,'Механік'
       ,'Час в''їзду/виїзду');

implementation

uses
  Main, ENConsts, TKTransportController, ENDepartmentController, ShowENDepartment,
  ShowENTransportDepartment, ENTransportDepartmentController,
  EditSetTimeToTransportItem,
  EditTKTransportRealFilter, ShowFINWorker, EditFINWorkerFilter,
  EditENTravelSheetFilter, ENTransportItemController, EditENTravelSheet,
  DMReportsUnit, EditENPlanWork, ENTransportOrderStatusController, ENTravelSheetItemController,
  ENWorkOrder2ENPlanWorkController, FINMolDataController,
  FINMolTypeController, ENTransportOrder2TravelController, EnergyproController, ReportExaminationTransport,
  ShowFINMol, FINMolController;

{$R *.dfm}

procedure TfrmTransportManagement.updateTKTransportGrid();
 Var
    TempTKTransport: ENTransportOrderControllerSoapPort;
    transportNormList : ENTransportOrderShortList;
    transportNormFilter : ENTransportOrderFilter;
    condition : String;
    i, LastCount, LastRow : Integer;
begin
    TempTKTransport := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
    
    transportNormFilter := ENTransportOrderFilter.Create;
     SetNullIntProps(transportNormFilter);
     SetNullXSProps(transportNormFilter);
    //transportNormFilter.orderBySQL := 'TKTRANSPORT.NAME' ;

    transportNormFilter.dateStart := TXSDateTime.Create;
    transportNormFilter.dateStart.XSToNative(GetXSDate(orderDateStart));
    transportNormFilter.dateFinal := TXSDateTime.Create;
    transportNormFilter.dateFinal.XSToNative(GetXSDate(orderDateFinal));
    transportNormFilter.transport := TKTransportRef.Create;
    transportNormFilter.transport.code := transportNormCode;
    transportNormFilter.transportDepartment := ENTransportDepartmentRef.Create;
    transportNormFilter.transportDepartment.code := transportDepartmentCode;

    transportNormList := TempTKTransport.getListOfNormTransport(transportNormFilter,0,-1);

    {09/02/2012 - заполнение грида sgTKTransport}
    SetGridHeaders(TKTransportHeaders, sgTKTransport.ColumnHeaders);

    LastCount:=High(transportNormList.list);

    if LastCount > -1 then
     sgTKTransport.RowCount:=LastCount+2
    else
     sgTKTransport.RowCount:=2;

    with sgTKTransport do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if transportNormList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(transportNormList.list[i].transportCode)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := transportNormList.list[i].transportName;

          if transportNormList.list[i].unOrderedTransportQty <> Low(Integer) then
            Cells[2,i+1] := IntToStr(transportNormList.list[i].unOrderedTransportQty)
          else
          Cells[2,i+1] := '';

          if transportNormList.list[i].orderedTransportQty <> Low(Integer) then
            Cells[3,i+1] := IntToStr(transportNormList.list[i].orderedTransportQty)
          else
          Cells[3,i+1] := '';

          Objects[0, i+1] :=  TObject(transportNormList.list[i].transportCode);

          LastRow:=i+1;
          sgTKTransport.RowCount:=LastRow+1;
        end;
        //ColCount:=ColCount+1;
        sgTKTransport.Row:=1;


end;

procedure TfrmTransportManagement.updateTKTransportRealGrid(realFilter : TKTransportRealFilter);
 Var
    TempTKTransportReal: TKTransportRealControllerSoapPort;
    TempENTransportOrder : ENTransportOrderControllerSoapPort;
    transportRealList : TKTransportRealShortList;
    transportRealFilter : TKTransportRealFilter;
    condition, strTimeStart, strTimeFinal, availableCondition,
    NoTravelCondition, strDateStart, strDateFinal: String;
    i, LastCount, LastRow : Integer;
    transportOrderCode, transportClassificationCode : Integer;
    transportOrder : ENTransportOrder;
begin

    sgTKTransportReal.Clear;

    TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;

    if realFilter = nil then
    begin
      realFilter := TKTransportRealFilter.Create;
      SetNullIntProps(realFilter);
      SetNullXSProps(realFilter);

    end;

      transportRealFilter := TKTransportRealFilter.Create;
      SetNullIntProps(transportRealFilter);
      SetNullXSProps(transportRealFilter);

    condition := 'select tktransportreal.code from tktransportreal where ' +
                ' tktransportreal.transportdepartmntrfcd = ' + IntToStr(transportDepartmentCode);

    transportRealFilter := realFilter;

            try
      transportClassificationCode := Integer(sgTKTransport.Objects[0,sgTKTransport.Row]);
    except
      on EConvertError do transportClassificationCode := Low(Integer);
    end;

    {21.05.2012 Свободные машины по времени заявки}
  if chbAvailableTransport.Checked = True then
  begin
    try
      transportOrderCode := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);
    except
      on EConvertError do transportOrderCode := Low(Integer);
    end;

    
  TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
    transportOrder := TempENTransportOrder.getObject(transportOrderCode);

    strTimeStart := 'to_timestamp('''+XSDateTimeWithDate2String(transportOrder.timeStart)+''',''dd.mm.yyyy hh24:mi:ss'')';
    strTimeFinal := 'to_timestamp('''+XSDateTimeWithDate2String(transportOrder.timeFinal)+''',''dd.mm.yyyy hh24:mi:ss'')';

    availableCondition := 'select code from tktransportreal except ' +
                        ' select tor.transportrealcode from entransportorder tor ' +
                 'where ((tor.timestart <= ' + strTimeStart + 'and tor.timefinal >= '+ strTimeFinal +') ' +
                 'or (tor.timestart >= ' + strTimeStart + ' and tor.timefinal <= ' + strTimeFinal + ') ' +
                 'or (tor.timestart between ' +  strTimeStart + ' and ' + strTimeFinal + ') ' +
                 'or (tor.timefinal between ' + strTimeStart + ' and ' + strTimeFinal + ')) ' +
                 ' and tor.transportrealcode is not null ';

    if transportOrderCode <> Low(Integer) then
      transportRealFilter.conditionSQL := 'TKTRANSPORTREAL.CODE IN (' + availableCondition+')';


  end;

  ////
  if chbNoTravel.Checked = True then
  begin

    strDateStart := 'to_date('''+  DateToStr(edtDateStart.Date) + ''',''dd.MM.yyyy'')';
    strDateFinal := 'to_date('''+  DateToStr(edtDateFinal.Date) + ''',''dd.MM.yyyy'')';

    NoTravelCondition := 'select code from tktransportreal except ' +
                        ' select ts.transportrealcode from entravelsheet ts ' +
                 'where ((ts.datestart <= ' + strDateStart + 'and ts.datefinal >= '+ strDateFinal +') ' +
                 'or (ts.datestart >= ' + strDateStart + ' and ts.datefinal <= ' + strDateFinal + ') ' +
                 'or (ts.datestart between ' +  strDateStart + ' and ' + strDateFinal + ') ' +
                 'or (ts.datefinal between ' + strDateStart + ' and ' + strDateFinal + ')) ' +
                 ' and ts.transportrealcode is not null ';

    transportRealFilter.conditionSQL := 'TKTRANSPORTREAL.CODE IN (' + NoTravelCondition+')';

  end;

  ////

    if Length(transportRealFilter.conditionSQL) > 0 then
      transportRealFilter.conditionSQL := transportRealFilter.conditionSQL +' AND (TKTRANSPORTREAL.CODE IN (' + condition+'))'
    else
			transportRealFilter.conditionSQL := 'TKTRANSPORTREAL.CODE IN (' + condition+')';

    if Length(transportRealFilter.conditionSQL) > 0 then
      if (transportClassificationCode <> Low(Integer)) and (isGroupByCategory = True) then
      begin
        transportRealFilter.conditionSQL := transportRealFilter.conditionSQL +' AND TKTRANSPORT.transportclassifictncd = ' + IntToStr(transportClassificationCode);
      end
    else
      if (transportClassificationCode <> Low(Integer)) and (isGroupByCategory = True) then
      begin
        transportRealFilter.conditionSQL := transportRealFilter.conditionSQL +' TKTRANSPORT.transportclassifictncd = ' + IntToStr(transportClassificationCode);
			end;

	 transportRealFilter.conditionSQL := transportRealFilter.conditionSQL + ' and TKTRANSPORTREAL.transportstatuscode in (75000000,75000002)';

   if transportMolCode <> LOW_INT then
      transportRealFilter.finMolCode := IntToStr(transportMolCode);

		transportRealList := TempTKTransportReal.getScrollableFilteredList(transportRealFilter,0,-1);

    {09/02/2012 - заполнение грида sgTKTransportReal}
    SetGridHeaders(TKTransportRealHeaders, sgTKTransportReal.ColumnHeaders);

		LastCount:=High(transportRealList.list);

    if LastCount > -1 then
     sgTKTransportReal.RowCount:=LastCount+2
    else
     sgTKTransportReal.RowCount:=2;

    with sgTKTransportReal do
      for i:=0 to LastCount do
        begin
          // Application.ProcessMessages;
          if transportRealList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(transportRealList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := transportRealList.list[i].buhName;
          Cells[2,i+1] := transportRealList.list[i].gosNumber;
          Cells[3,i+1] := transportRealList.list[i].invNumber;
          Cells[4,i+1] := transportRealList.list[i].finMolCode;

          Objects[0,i+1] := TObject(transportRealList.list[i].code);
          Objects[1,i+1] := TObject(transportRealList.list[i].transportstatusCode);
          LastRow:=i+1;
          sgTKTransportReal.RowCount:=LastRow+1;
        end;
        //ColCount:=ColCount+1;
        sgTKTransportReal.Row:=1;


end;

procedure TfrmTransportManagement.updateTravelSheetCurrentDateGrid();
 Var
    TempENTravelSheet:  ENTravelSheetControllerSoapPort;
    travelsheetList : ENTravelSheetShortList;
    travelsheetFilter : ENTravelSheetFilter;
    condition : String;
    i, LastCount, LastRow : Integer;
begin

    sgTravelSheetCurrentDate.Clear;

    TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

    condition := 'select entravelsheet.code from entravelsheet where entravelsheet.transportrealcode = ' + IntToStr(transportCode) +
                 ' and ((entravelsheet.datestart >= '' ' + DateToStr(orderDateStart) +  ' '' and entravelsheet.datefinal <='' '+ DateToStr(orderDateFinal)+ ' '' ) ' +
                      ' or ' +
                      '(''' + DateToStr(orderDateStart) + ''' >= entravelsheet.datestart and ''' + DateToStr(orderDateFinal) + ''' <= entravelsheet.datefinal)' + ')';

    travelsheetFilter := EnTravelSheetFilter.Create;
     SetNullIntProps(travelsheetFilter);
     SetNullXSProps(travelsheetFilter);
    travelsheetFilter.conditionSQL := 'ENTRAVELSHEET.CODE IN (' + condition+')';

    travelsheetList := TempENTravelSheet.getScrollableFilteredList(travelsheetFilter,0,-1);

    {09/02/2012 - заполнение грида sgTravelSheetCurrentDate}
    SetGridHeaders(ENTravelSheetCurrentDateHeaders, sgTravelSheetCurrentDate.ColumnHeaders);

    LastCount:=High(travelsheetList.list);

    if LastCount > -1 then
     sgTravelSheetCurrentDate.RowCount:=LastCount+2
    else
     sgTravelSheetCurrentDate.RowCount:=2;

    with sgTravelSheetCurrentDate do
      for i:=0 to LastCount do
        begin
          // Application.ProcessMessages;
          if travelsheetList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(travelsheetList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := travelsheetList.list[i].numberGen;

           if travelsheetList.list[i].dateStart = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := XSDate2String(travelsheetList.list[i].dateStart);

         Cells[3,i+1] := travelsheetList.list[i].finWorkerName;

         Cells[4,i+1] := travelsheetlist.list[i].statusRefName;

          LastRow:=i+1;
          sgTravelSheetCurrentDate.RowCount:=LastRow+1;
        end;
        //ColCount:=ColCount+1;
        sgTravelSheetCurrentDate.Row:=1;


end;

procedure TfrmTransportManagement.updateTravelSheetsPastGrid(sheetsFilter : ENTravelSheetFilter);
 Var
    TempENTravelSheet:  ENTravelSheetControllerSoapPort;
    travelsheetList : ENTravelSheetShortList;
    travelsheetFilter : ENTravelSheetFilter;
    condition : String;
    i, LastCount, LastRow : Integer;
    dateStart : TXSDate;
begin

  condition := 'select entravelsheet.code where entravelsheet.transportrealcode = ' + IntToStr(transportCode) +
                 ' and entravelsheet.datefinal < '' ' + DateToStr(orderDateFinal) +  ' '' ' +
                 ' and entravelsheet.datestart > (first_day(to_date('''+DateToStr(orderDateStart)+''',''dd.mm.yyyy''))-interval ''1 month'')';


   if sheetsFilter = nil then
    begin
     sheetsFilter := ENTravelSheetFilter.Create;
     SetNullIntProps(sheetsFilter);
     SetNullXSProps(sheetsFilter);
     sheetsFilter.transportReal := TKTransportReal.Create;
     sheetsFilter.transportReal.code := transportCode;
     sheetsFilter.conditionSQL := 'ENTRAVELSHEET.CODE IN (' + condition+')';
    end;

    sgTravelSheetsPast.Clear;

    TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

    travelsheetFilter := sheetsFilter;

    travelsheetFilter.orderBySQL := 'datestart desc, cast(numbergen as integer) desc';



    travelsheetList := TempENTravelSheet.getScrollableFilteredList(travelsheetFilter,0,100);

    {09/02/2012 - заполнение грида sgTravelSheetsPast}
    SetGridHeaders(ENTravelSheetsPastHeaders, sgTravelSheetsPast.ColumnHeaders);

    LastCount:=High(travelsheetList.list);

    if LastCount > -1 then
     sgTravelSheetsPast.RowCount:=LastCount+2
    else
     sgTravelSheetsPast.RowCount:=2;

    with sgTravelSheetsPast do
      for i:=0 to LastCount do
        begin
          // Application.ProcessMessages;
          if travelsheetList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(travelsheetList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := travelsheetList.list[i].numberGen;


         if travelsheetList.list[i].dateStart = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := XSDate2String(travelsheetList.list[i].dateStart);

         Cells[3,i+1] := travelsheetList.list[i].finWorkerName;

         Cells[4,i+1] := travelsheetList.list[i].statusRefName;

          LastRow:=i+1;
          sgTravelSheetsPast.RowCount:=LastRow+1;
        end;
        //ColCount:=ColCount+1;
        sgTravelSheetsPast.Row:=1;


end;

procedure TfrmTransportManagement.updateDriversGrid(workerFilter : FINWorkerFilter);
 Var
   i, LastCount, LastRow : Integer;
   TempFINWorker: FINWorkerControllerSoapPort;
   FINWFilter: FINWorkerFilter;
   FINWorkerList: FINWorkerShortList;
   condition : String;
   date : TXSDate;
   UsesMDAXData: Boolean;
begin


condition := '';

TempFINWorker :=  HTTPRIOFINWorker as FINWorkerControllerSoapPort;

   if workerFilter = nil then
   begin

      if chbLastDrivers.Checked = true then
      begin

  if transportCode = Low(Integer) then Exit;

  condition := 'select entravelsheet.finworkercode from entravelsheet where entravelsheet.transportrealcode = '+ IntToStr(transportCode) + ' order by entravelsheet.datefinal desc limit 10';

  FINWFilter := FINWorkerFilter.Create;
  SetNullIntProps(FINWFilter);
  SetNullXSProps(FINWFilter);

  FINWFilter.conditionSQL := ' FINWORKER.CODE IN ('+condition+')';

  FINWorkerList := TempFINWorker.getScrollableFilteredList(FINWFilter,0,-1);

  condition := '';

  {
  for i := 0 to High(FINWorkerList.list) do
  begin
       if Length(condition) > 0 then
        condition := condition+', '+FINWorkerList.list[i].tabNumber
       else
        condition := FINWorkerList.list[i].tabNumber;
  end;
  }

  UsesMDAXData := DMReports.UsesMDAXData;

  for i := 0 to High(FINWorkerList.list) do
  begin
    // MDAX-441
    if UsesMDAXData then
      AddListPos(condition, FINWorkerList.list[i].tabNumber, ';')
    else
      AddListPos(condition, FINWorkerList.list[i].tabNumber);
  end;


  if Length(condition) = 0 then condition := 'null';

end;
      workerFilter := FINWorkerFilter.Create;
     SetNullIntProps(workerFilter);
     SetNullXSProps(workerFilter);


//     workerFilter.conditionSQL := 'ps.post_id in (23,25,26,27,28,29,30,178,179,181,182,185,186,259,260,261,272,273,274,282,' +
//                    '283,284,285,286,289,297,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,' +
//                    '634,635,636,637,639,640,641,642,643,644,645,646,647,648,649,650,651,677,720,721,726,727,' +
//                    '735,737,742,982,983,985,991,998,999,1000,1002,1009,1013,1016,1019,1021,1030,1035,1036,1038,' +
//                    '1048,1089,1115,1144,1184,1273,1356,1357,1358,1360,1387,1390,1391,1393,1409,1426,1470,1474,1475,' +
//                    '1491,1492,1503,1504,1511,1512,1514,1591,1600,1648,1651,1713,1781,1806,1839,1999,2031,2038,2075,2114,2115)';

    if Length(condition) > 0 then
    begin
         // MDAX-441
         if UsesMDAXData then
           workerFilter.tabNumber := condition
         else
           workerFilter.conditionSQL := ' kr.TabN in ('+condition+')';
    end;
   end;

   sgDrivers.Clear;


    FINWFilter := workerFilter;

    date := TXSDate.Create;
    date.XSToNative(GetXSDate(orderDateStart));

    FINWorkerList := TempFINWorker.getWorkerList(FINWFilter,0,-1,date, true);

    SetGridHeaders(DriversHeaders, sgDrivers.ColumnHeaders);

    LastCount:=High(FINWorkerList.list);

    if LastCount > -1 then
     sgDrivers.RowCount:=LastCount+2
    else
     sgDrivers.RowCount:=2;

    with sgDrivers do
      for i:=0 to LastCount do
        begin
          // Application.ProcessMessages;
          if FINWorkerList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(FINWorkerList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := FINWorkerList.list[i].name;
          Cells[2,i+1] := FINWorkerList.list[i].tabNumber;
          Cells[3,i+1] := FINWorkerList.list[i].positionName;

          Objects[0,i+1] := TObject(StrToInt(FINWorkerList.list[i].tabNumber));

          LastRow:=i+1;
          sgDrivers.RowCount:=LastRow+1;
        end;
        //ColCount:=ColCount+1;
        sgDrivers.Row:=1;


end;


procedure TfrmTransportManagement.updateOrderedTransportGrid(filter : ENTransportOrderFilter);
 Var
   i, LastCount, LastRow : Integer;
   TempENTransportOrder: ENTransportOrderControllerSoapPort;
   ENTOFilter: ENTransportOrderFilter;
   ENTransportOrderList: ENTransportOrderShortList;
   condition, isAssignment : String;
begin

   TempENTransportOrder :=  HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;

   sgOrderedTransport.Clear;

   if (filter = nil) then
   begin
      filter := ENTransportOrderFilter.Create;
      SetNullIntProps(filter);
      SetNullXSProps(filter);
      filter.conditionSQL := 'ENTRANSPORTORDER.transportCode in ('+
            'select tktransport.code from tktransport where tktransport.transportclassifictncd =' +
              IntToStr(transportNormCode) + ')';
      filter.transportDepartment := ENTransportDepartmentRef.Create;
      filter.transportDepartment.code := transportDepartmentCode;

   end;

//   condition:= 'to_date(to_char(ENTRANSPORTORDER.DATESTART,''dd.mm.yyyy''),''dd.mm.yyyy'') >= ''' +DateToStr(orderDateStart)+'''' +
//   ' AND to_date(to_char(ENTRANSPORTORDER.DATEFINAL,''dd.mm.yyyy''),''dd.mm.yyyy'') <= ''' +DateToStr(orderDateFinal)+'''' +
//                ' AND ENTRANSPORTORDER.PARENTREFCODE is null ';

   /////
   if filter.code <> -1 then
 condition := ' ((to_date(to_char(ENTRANSPORTORDER.DATESTART,''dd.mm.yyyy''),''dd.mm.yyyy'') >= '''+DateToStr(orderDateStart)+'''' +
 ' AND to_date(to_char(ENTRANSPORTORDER.DATEFINAL,''dd.mm.yyyy''),''dd.mm.yyyy'') <= '''+DateToStr(orderDateFinal)+'''' + ')' +
 ' OR (to_date(to_char(ENTRANSPORTORDER.DATESTART,''dd.mm.yyyy''),''dd.mm.yyyy'') <= '''+DateToStr(orderDateStart)+'''' +
 ' AND to_date(to_char(ENTRANSPORTORDER.DATEFINAL,''dd.mm.yyyy''),''dd.mm.yyyy'') >= '''+DateToStr(orderDateFinal)+'''' + ')' +
 ' OR (to_date(to_char(ENTRANSPORTORDER.DATESTART,''dd.mm.yyyy''),''dd.mm.yyyy'') between '''+DateToStr(orderDateStart)+'''' +
 ' and '''+DateToStr(orderDateFinal) + '''' + ')' +
 ' OR (to_date(to_char(ENTRANSPORTORDER.DATEFINAL,''dd.mm.yyyy''),''dd.mm.yyyy'') between '''+DateToStr(orderDateStart)+'''' +
 ' and '''+DateToStr(orderDateFinal) + '''' + ')' +
 ') AND ENTRANSPORTORDER.PARENTREFCODE is null';

    ENTOFilter := filter;
    if ((Length(ENTOFilter.conditionSQL) > 0) and (ENTOFilter.code <> -1)) then
    begin
        ENTOFilter.conditionSQL := ENTOFilter.conditionSQL + ' AND ' + condition;
    end
    else if (ENTOFilter.code = -1) then
       ENTOFilter.conditionSQL := filter.conditionSQL
    else
        ENTOFilter.conditionSQL := condition;

    ENTOFilter.code := LOW_INT;

    ENTOFilter.orderBySQL := ' ENTRANSPORTORDER.TRANSPORTREALCODE, ENTRANSPORTORDER.NUMBERGEN ';

    if transportMolCode <> LOW_INT then
       ENTOFilter.conditionSQL := ENTOFilter.conditionSQL + ' and enworkorder.code in (select finmoldata.workordercode ' +
                                            ' from finmoldata ' +
                                            ' where finmoldata.moltyperefcode = 2 ' +
                                            ' and finmoldata.actcode is null ' +
                                            ' and finmoldata.finmolcode = ''' + IntToStr(transportMolCode) + ''')';

    ENTransportOrderList := TempENTransportOrder.getScrollableFilteredList(ENTOFilter, 0,-1);

     SetGridHeaders(OrderedTransportHeaders, sgOrderedTransport.ColumnHeaders);

    LastCount:=High(ENTransportOrderList.list);

    if LastCount > -1 then
     sgOrderedTransport.RowCount:=LastCount+2
    else
     sgOrderedTransport.RowCount:=2;

     //  массивы с заявками и ордерами
      orderCodeList := nil;
      molCodeList := nil;
      dateStartList := nil;
      dateFinalList := nil;

    with sgOrderedTransport do
      for i:=0 to LastCount do
        begin
   
          if ENTransportOrderList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENTransportOrderList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENTransportOrderList.list[i].numbergen;

          if(GetXSDate(ENTransportOrderList.list[i].dateStart.AsDateTime) = GetXSDate(ENTransportOrderList.list[i].dateFinal.AsDateTime)) then
          begin
            Cells[2,i+1] := XSDateTimeWithoutTime2String(ENTransportOrderList.list[i].dateStart) + ' ' +
                          XSTimeWithoutSeconds2String(ENTransportOrderList.list[i].timeStart) + ' - ' +
                          XSTimeWithoutSeconds2String(ENTransportOrderList.list[i].timeFinal);

          end else begin
            Cells[2,i+1] := XSDateTimeWithoutTime2String(ENTransportOrderList.list[i].dateStart) + ' ' +
                          XSTimeWithoutSeconds2String(ENTransportOrderList.list[i].timeStart) + ' - ' +
                          XSDateTimeWithoutTime2String(ENTransportOrderList.list[i].dateFinal) + ' ' +
                          XSTimeWithoutSeconds2String(ENTransportOrderList.list[i].timeFinal);

          end;


          Cells[3,i+1] := ENTransportOrderList.list[i].elementName;

          Cells[4,i+1] := ENTransportOrderList.list[i].planRefDepartmentName;

          Cells[5,i+1] := ENTransportOrderList.list[i].finMOLName + ' ' + ENTransportOrderList.list[i].finExecutor;

          Cells[6,i+1] := ENTransportOrderList.list[i].finMolPhoneNumber;

          Cells[7,i+1] := ENTransportOrderList.list[i].transportOrderStatusName;


         if (ENTransportOrderList.list[i].isAssignment = 1) then
         isAssignment := 'Командировка'
         else isAssignment := '';

          Cells[8,i+1] := isAssignment;
          Cells[9,i+1] := ENTransportOrderList.list[i].transportRealGosNumber + ' ' +
                          ENTransportOrderList.list[i].transportRealName;
          Cells[10,i+1] := ENTransportOrderList.list[i].travelSheetNumber;

          if (ENTransportOrderList.list[i].isApproved = 1)  then
          sgOrderedTransport.AddCheckBox(11,i+1,true,false)
          else sgOrderedTransport.AddCheckBox(11,i+1,false,false);

          if (ENTransportOrderList.list[i].isRejected = 1)  then
          sgOrderedTransport.AddCheckBox(12,i+1,true,false)
          else sgOrderedTransport.AddCheckBox(12,i+1,false,false);

          Cells[13,i+1] := ENTransportOrderList.list[i].mechanicFinMolCode;

        if ((ENTransportOrderList.list[i].minRideOut <> nil) and (ENTransportOrderList.list[i].maxRideIn <> nil)) then
           begin
             if(GetXSDate(ENTransportOrderList.list[i].minRideOut.AsDateTime) = GetXSDate(ENTransportOrderList.list[i].maxRideIn.AsDateTime)) then
                  begin
                    Cells[14,i+1] := XSDateTimeWithoutTime2String(ENTransportOrderList.list[i].minRideOut) + ' ' +
                                  XSTimeWithoutSeconds2String(ENTransportOrderList.list[i].minRideOut) + ' - ' +
                                  XSTimeWithoutSeconds2String(ENTransportOrderList.list[i].maxRideIn);

                  end else begin
                    Cells[14,i+1] := XSDateTimeWithDate2String(ENTransportOrderList.list[i].minRideOut) + ' - ' +
                                  XSDateTimeWithDate2String(ENTransportOrderList.list[i].maxRideIn);
                  end;
           end
           else
           if ((ENTransportOrderList.list[i].minRideOut = nil) and (ENTransportOrderList.list[i].maxRideIn <> nil)) then
           begin
              Cells[14,i+1] := 'Въезд:' + XSDateTimeWithDate2String(ENTransportOrderList.list[i].maxRideIn)
           end
           else
           if ((ENTransportOrderList.list[i].minRideOut <> nil) and (ENTransportOrderList.list[i].maxRideIn = nil)) then
           begin
              Cells[14,i+1] := 'Выезд:' + XSDateTimeWithDate2String(ENTransportOrderList.list[i].minRideOut)
           end
           else
              Cells[14,i+1] := '';

          Objects[0, i+1] :=  TObject(ENTransportOrderList.list[i].transportRealCode);
          Objects[1, i+1] :=  TObject(ENTransportOrderList.list[i].planRefCode);
          Objects[2, i+1] :=  TObject(ENTransportOrderList.list[i].travelSheetCode);
          Objects[3, i+1] :=  TObject(ENTransportOrderList.list[i].code);

          // Добавляем галочку для выбора нескольких транспортных заявок
          if ENTransportOrderList.list[i].transportOrderStatusCode = ENTRANSPORTORDERSTATUS_GOOD then
            sgOrderedTransport.AddCheckBox(1,i+1,false,false);

          LastRow:=i+1;
          sgOrderedTransport.RowCount:=LastRow+1;
        end;
        sgOrderedTransport.Row:=1;

end;

procedure TfrmTransportManagement.updateUnOrderedTransportGrid();
Var
    TempENTransportOrder : ENTransportOrderControllerSoapPort;
    unOrderedTransportList : ENTransportOrderShortList;
    unOrderedTransportFilter : ENTransportOrderFilter;
    i, LastCount, LastRow : Integer;
    dateStart, dateFinal : TXSDateTime;
begin
    TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;

    sgUnOrderedTransport.Clear;

    dateStart := TXSDateTime.Create;
    dateStart.XSToNative(GetXSDateTime(orderDateStart));

    dateFinal := TXSDateTime.Create;
    dateFinal.XSToNative(GetXSDateTime(orderDateFinal));

    if chbUnordered.Checked then
      unOrderedTransportList := TempENTransportOrder.getGroupedTransportListByDateAndDepartment(dateStart, dateFinal, transportDepartmentCode)
    else
    unOrderedTransportList := TempENTransportOrder.getGroupedTransportListByTransportCode(transportNormCode, dateStart, dateFinal, transportDepartmentCode);


    {09/02/2012 - заполнение грида sgUNOrderedTransport}
    SetGridHeaders(UnOrderedTransportHeaders, sgUNOrderedTransport.ColumnHeaders);

    LastCount:=High(unOrderedTransportList.list);

    if LastCount > -1 then
     sgUnOrderedTransport.RowCount:=LastCount+2
    else
     sgUnOrderedTransport.RowCount:=2;



    with sgUnOrderedTransport do
      for i:=0 to LastCount do
        begin
         // Application.ProcessMessages;
          if unOrderedTransportList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(unOrderedTransportList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := unOrderedTransportList.list[i].elementName;

          Cells[2,i+1] := unOrderedTransportList.list[i].transportName;

          Cells[3,i+1] := unOrderedTransportList.list[i].planRefWorkOrderNumber;

          Cells[4,i+1] := unOrderedTransportList.list[i].planRefDepartmentName;

          Cells[5,i+1] := unOrderedTransportList.list[i].finMOLName;
          Cells[6,i+1] := unOrderedTransportList.list[i].finMolPhoneNumber;

          Cells[7,i+1] := unOrderedTransportList.list[i].finExecutor;


          Objects[0, i+1] :=  TObject(unOrderedTransportList.list[i].transportCode);
          Objects[1, i+1] :=  TObject(unOrderedTransportList.list[i].planRefCode);

          LastRow:=i+1;
          sgUnOrderedTransport.RowCount:=LastRow+1;
        end;
        //ColCount:=ColCount+1;
        sgUnOrderedTransport.Row:=1;

   sgUnOrderedTransportClick(nil);

end;


procedure TfrmTransportManagement.updateUnOrderedTransportDetailedGrid();
var
  TempENTransportItem: ENTransportItemControllerSoapPort;
  ENTransportItemList: ENTransportItemShortList;
  transportItemFilter: ENTransportItemFilter;
  tiLastCount, tiLastRow, tiColCount, i,j: Integer;
begin
    tiColCount := 1;

    sgUnorderedTransportDetailed.Clear;

    SetGridHeaders(UnOrderedTransportDetailedHeaders, sgUnOrderedTransportDetailed.ColumnHeaders);

    transportItemFilter := ENTransportItemFilter.Create;
       SetNullIntProps(transportItemFilter);
       SetNullXSProps(transportItemFilter);

    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;



    if  sgUnOrderedTransport.Cells[1, sgUnOrderedTransport.Row]  = '' then exit;

    transportItemFilter.conditionSQL := ' and tr.TRANSPORTCODE = ' + IntToStr(Integer(sgUnOrderedTransport.Objects[0, sgUnOrderedTransport.Row])) +
                                        ' and p.code = ' + IntToStr(Integer(sgUnOrderedTransport.Objects[1, sgUnOrderedTransport.Row])) +
                                              ' and tr.code not in ' +
                                              ' (select entrnsprtrdr2trnsprttm.transportitemcode from entrnsprtrdr2trnsprttm ' +
                                              ' where entrnsprtrdr2trnsprttm.transportordercode in ' +
                                              ' (select entransportorder.code from entransportorder ' +
                                              ' where entransportorder.transportcode = ' + IntToStr(Integer(sgUnOrderedTransport.Objects[0, sgUnOrderedTransport.Row])) +
                                              ' and entransportorder.planrefcode = ' + IntToStr(Integer(sgUnOrderedTransport.Objects[1, sgUnOrderedTransport.Row])) + '))';

    ENTransportItemList := TempENTransportItem.getListDetailedForTravelSheetItem(transportItemFilter);

     tiLastCount := High(ENTransportItemList.list);

    if tiLastCount > -1 then
      sgUnOrderedTransportDetailed.RowCount := tiLastCount + 2
    else
      sgUnOrderedTransportDetailed.RowCount := 2;

     with sgUnOrderedTransportDetailed do
       for i := 0 to tiLastCount do
       begin
       //  Application.ProcessMessages;

         if ENTransportItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
         else
           Cells[0,i+1] := '';

           Cells[1,i+1] := ENTransportItemList.list[i].transportName;
           AddCheckBox(1, i+1, false, false);

           Cells[2,i+1] := ENTransportItemList.list[i].kartaNum + ' ' + ENTransportItemList.list[i].kartaRefName;

        if ENTransportItemList.list[i].distance <> nil then
           Cells[3,i+1] :=  ENTransportItemList.list[i].distance.DecimalString
        else
           Cells[3,i+1] := '';

        if ENTransportItemList.list[i].countWorkFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].countWorkFact.DecimalString;

         tiLastRow := i + 1;
         sgUnOrderedTransportDetailed.RowCount := tiLastRow + 1;

         Objects[0,i+1] := TObject(ENTransportItemList.list[i].transportCode);
         Objects[1,i+1] := TObject(ENTransportItemList.list[i].planRefCode);

       end;

     tiColCount := tiColCount + 1;
     sgUnOrderedTransportDetailed.Row := 1;
end;

procedure TfrmTransportManagement.btnLookForTransportAndDriverClick(
  Sender: TObject);
begin

  if not initializeParameters then Exit;

  {27/03/2012 - Если галочка Останні водії не стоит - поставить, чтобы не выбиралась}
  if chbLastDrivers.Checked = False then
    chbLastDrivers.Checked := True;

  sgTravelSheetCurrentDate.Clear;
  sgTravelSheetsPast.Clear;
  sgUnOrderedTransport.Clear;
  sgOrderedTransport.Clear;
  sgUnOrderedTransportDetailed.Clear;

  updateTKTransportGrid();
  sgTKTransport.OnClick(sgTKTransport);
  updateUnOrderedTransportGrid();
  updateTKTransportRealGrid(nil);
  sgTKTransportReal.OnClick(sgTKTransportReal);
  updateDriversGrid(nil);

end;

procedure TfrmTransportManagement.btnReportClick(Sender: TObject);
var
  reportName : String;
  args, argNames : ArrayOfString;
  reportTransport : TfrmReportExaminationTransport;
begin
  inherited;

  reportTransport := TfrmReportExaminationTransport.Create(Application, dsInsert);

  if transportDepartmentCode <> LOW_INT then
  begin
      reportTransport.setTransportCode(transportDepartmentCode, edtDepartment.Text);
      //reportTransport.edtTransportDepartmentName.Text := edtDepartment.Text;
  end;
  if edtDateStart.Checked then reportTransport.setDateStart(edtDateStart.Date);
  if edtDateFinal.Checked then reportTransport.setDateFinal(edtDateFinal.Date);


  try
    reportTransport.ShowModal;
  finally
    reportTransport.Free;
 end;

end;

procedure TfrmTransportManagement.FormShow(Sender: TObject);
begin
   DisableControls([edtDepartment]);
   HideControls([sgUnOrderedTransportDetailed]);
end;

procedure TfrmTransportManagement.miCreateNewTravelSheetClick(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
  transportRealCode: Integer;
begin
  inherited;
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     transportRealCode := StrToInt(sgTKTransportReal.Cells[0,sgTKTransportReal.Row]);
   except
   on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите создать новый ПЛ для дежурного транспорта?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheet.createNewTravelSheetForTransportOnDuty(transportRealCode);
      updateTravelSheetCurrentDateGrid();
  end;      /////
end;

procedure TfrmTransportManagement.spbDepartmentClick(Sender: TObject);
var
   frmENTransportDepartmentShow : TfrmENTransportDepartmentShow;

begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin

        if ShowModal = mrOk then
        begin
            try
               edtDepartment.Text := GetReturnValue(sgENTransportDepartment,1);
               transportDepartmentCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;


end;

procedure TfrmTransportManagement.spbMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  molSel : boolean;

begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               transportMolCode := StrToInt(GetReturnValue(sgFINMol,0));
               edtFinMolCode.Text := IntToStr(transportMolCode) + ' ' + GetReturnValue(sgFINMol,1);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmTransportManagement.FormCreate(Sender: TObject);
begin
      transportDepartmentCode := LOW_INT;
      transportCode := LOW_INT;
      transportNormCode := LOW_INT;
      transportMolCode := LOW_INT;

      toFilter := nil;
      trFilter := nil;

      edtDateStart.Date := Date();
      edtDateFinal.Date := Date();

      orderCodeList := nil;
      molCodeList := nil;
      dateStartList := nil;
      dateFinalList := nil;



      // Признак нужно ли отбирать реальный транспорт по категории.
      isGroupByCategory:= True;
end;

procedure TfrmTransportManagement.sgTKTransportRealClick(Sender: TObject);
begin

transportCode := Integer(sgTKTransportReal.Objects[0, sgTKTransportReal.Row]);
updateTravelSheetCurrentDateGrid();

if chbLastDrivers.Checked = True then
begin
  updateDriversGrid(nil);
end;

fillRealTransportTimeLine();

end;

procedure TfrmTransportManagement.sgTKTransportClick(Sender: TObject);
begin
  inherited;

  transportNormCode := Integer(sgTKTransport.Objects[0, sgTKTransport.Row]);
  toFilter := nil;
  chbAllTransportOrders.Checked := False;
  updateOrderedTransportGrid(toFilter);
  updateUnOrderedTransportGrid();
  updateTKTransportRealGrid(nil);
  chbDetailedClick(Sender);

end;

procedure TfrmTransportManagement.btnEditTimeOnTransportOrderClick(
  Sender: TObject);
var
    i, eCode, n, transportCode, transportOrderCode : integer;
    dateStart, dateFinal : TXSDateTime;
    timeStart, timeFinal : TXSDateTime;
    TempENTransportOrder :  ENTransportOrderControllerSoapPort;
    ENTransportOrderObj : ENTransportOrder;

begin
  inherited;

  if  Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]) = 0 then Exit;

  transportOrderCode := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);

     TempENTransportOrder := HTTPRIOENTransportOrder as  ENTransportOrderControllerSoapPort;

     ENTransportOrderObj := ENTransportOrder.Create;
     ENTransportOrderObj := TempENTransportOrder.getObject(transportOrderCode);

  if chbDetailed.Checked then
  chbDetailed.Checked := false;

   frmSetTimeToTransportItem := TfrmSetTimeToTransportItem.Create(Application, dsEdit);
   frmSetTimeToTransportItem.Caption := 'Редагування часу роботи транспорта';
   frmSetTimeToTransportItem.ENTransportOrderObj := TempENTransportOrder.getObject(transportOrderCode);

  try
    if frmSetTimeToTransportItem.ShowModal = mrOK then
       begin
            dateStart := TXSDateTime.Create;
            dateStart.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtDateStart.Date));
            dateFinal := TXSDateTime.Create;
            dateFinal.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtDateFinal.Date));
            timeStart := TXSDateTime.Create;
            timeStart.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeStart.DateTime));
            timeFinal := TXSDateTime.Create;
            timeFinal.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeFinal.DateTime));


            {24/03/2012 - Определение признака командировки}
            ENTransportOrderObj.isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_FALSE;
             if frmSetTimeToTransportItem.chbIsAssignment.Checked = true then
              ENTransportOrderObj.isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_TRUE;

            ENTransportOrderObj.timeStart := timeStart;
            ENTransportOrderObj.timeFinal := timeFinal;
            ENTransportOrderObj.dateStart := dateStart;
            ENTransportOrderObj.dateFinal := dateFinal;
            ENTransportOrderObj.transportDepartment.code := frmSetTimeToTransportItem.transportDepartmentCode;
            ENTransportOrderObj.parentRef.code := frmSetTimeToTransportItem.ENTransportOrderObj.parentRef.code;


            TempENTransportOrder.save(ENTransportOrderObj);

         end;

       UpdateOrderedTransportGrid(toFilter);
  finally
     frmSetTimeToTransportItem.Free;
  end;
end;


procedure TfrmTransportManagement.btnClearMolClick(Sender: TObject);
begin
  inherited;
  transportMolCode := LOW_INT;
  edtFinMolCode.Text := '';
end;

procedure TfrmTransportManagement.btnDeleteTransportOrderClick(
  Sender: TObject);
var
    i, eCode, n, transportCode, transportOrderCode : integer;
    dateStart, dateFinal : TXSDate;
    timeStart, timeFinal : TXSDateTime;
    TempENTransportOrder :  ENTransportOrderControllerSoapPort;
    ENTransportOrderObj : ENTransportOrder;


begin
  inherited;

  if Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]) = 0 then Exit;

  transportOrderCode := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);

  if chbDetailed.Checked then
  chbDetailed.Checked := false;


    TempENTransportOrder := HTTPRIOENTransportOrder as  ENTransportOrderControllerSoapPort;

   if Application.MessageBox(PChar('Ви дійсно бажаєте видалити заявку?'),
                           PChar('Внимание'), MB_OKCANCEL + MB_ICONQUESTION) <> IDOK then Exit;


    TempENTransportOrder.removeTransportOrderWithTransportItems(transportOrderCode);

    {27/03/2012 - обновление грида с нормативным транспортом}
    updateTKTransportGrid;

    UpdateOrderedTransportGrid(toFilter);
    UpdateUnOrderedTransportGrid;
    UpdateUnOrderedTransportDetailedGrid;
    fillRealTransportTimeLine;




end;

procedure TfrmTransportManagement.TBTKTransportRealFilterClick(
  Sender: TObject);
var
  realFilter : TKTransportRealFilter;
begin
  inherited;
  realFilter := TKTransportRealFilter.Create;
  SetNullIntProps(realFilter);
  SetNullXSProps(realFilter);

  TKTransportRealFilterObj := TKTransportRealFilter.Create;
  SetNullIntProps(TKTransportRealFilterObj);
  SetNullXSProps(TKTransportRealFilterObj);



frmTKTransportRealFilterEdit:=TfrmTKTransportRealFilterEdit.Create(Application, dsEdit);
  try
    if frmTKTransportRealFilterEdit.ShowModal = mrOk then
    begin
      realFilter := TKTransportRealFilterObj;
      isGroupByCategory:= False;
      UpdateTKTransportRealGrid(realFilter);
    end;
  finally
    frmTKTransportRealFilterEdit.Free;
    frmTKTransportRealFilterEdit:=nil;
  end;
end;

procedure TfrmTransportManagement.TBTKTransportRealWithoutFilterClick(
  Sender: TObject);
begin
  inherited;
  chbAvailableTransport.Checked := False;
    isGroupByCategory := false;
  UpdateTKTransportRealGrid(nil);
end;

procedure TfrmTransportManagement.TBDriversFilterClick(Sender: TObject);
var
workerFilter : FINWorkerFilter;
begin
  inherited;
frmFINWorkerFilterEdit:=TfrmFINWorkerFilterEdit.Create(Application, dsEdit);
  try
    FINWorkerFilterObj := FINWorkerFilter.Create;
    SetNullIntProps(FINWorkerFilterObj);
    SetNullXSProps(FINWorkerFilterObj);

    workerFilter := FINWorkerFilter.Create;
    SetNullIntProps(workerFilter);
    SetNullXSProps(workerFilter);

    if frmFINWorkerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINWorkerFilter.Create;
      workerFilter := FINWorkerFilterObj;
      UpdateDriversGrid(workerFilter);
    end;
  finally
    frmFINWorkerFilterEdit.Free;
    frmFINWorkerFilterEdit:=nil;
  end;
end;

procedure TfrmTransportManagement.TBDriversWithoutFilterClick(
  Sender: TObject);
begin
  inherited;
  UpdateDriversGrid(nil);
end;

procedure TfrmTransportManagement.TBItem1Click(Sender: TObject);
 var
  fil : ENTransportOrderFilter;
  TempENTransportOrder2Travel : ENTransportOrder2TravelControllerSoapPort;
  order2travelFil : ENTransportOrder2TravelFilter;
  order2travelList : ENTransportOrder2TravelShortList;
  i : Integer;
  orderCodes : String;
begin
  inherited;

   if sgTravelSheetsPast.Cells[1,sgTravelSheetsPast.Row] = '' then Exit;

  TempENTransportOrder2Travel :=  HTTPRIOENTransportOrder2Travel as ENTransportOrder2TravelControllerSoapPort;
  order2travelFil :=   ENTransportOrder2TravelFilter.Create;
  SetNullIntProps(order2travelFil);
  SetNullXSProps(order2travelFil);
  order2travelFil.travelsheet := ENTravelSheet.Create;
  order2travelFil.travelsheet.code := StrTOInt(sgTravelSheetsPast.Cells[0, sgTravelSheetsPast.Row]);

  order2travelList := TempENTransportOrder2Travel.getScrollableFilteredList(order2travelFil,0,-1);

  if (High(order2travelList.list) = -1) then  exit;

  orderCodes := '';

 for i:=0 to High(order2travelList.list) do
      begin
        if order2travelList.list[i].transportorderCode <> Low(Integer) then
        orderCodes := orderCodes + IntToStr(order2travelList.list[i].transportorderCode);

        if i < High(order2travelList.list) then
        orderCodes := orderCodes + ',';
      end;

  fil := ENTransportOrderFilter.Create;
  SetNullIntProps(fil);
  SetNullXSProps(fil);
  fil.code := -1;
  fil.conditionSQL := ' entransportorder.code in (' + orderCodes + ')';
  updateOrderedTransportGrid(fil);
end;

procedure TfrmTransportManagement.TBTravelSheetsPastFilterClick(
  Sender: TObject);
 var
  sheetsFilter: ENTravelSheetFilter;
begin
 inherited;
  frmENTravelSheetFilterEdit:=TfrmENTravelSheetFilterEdit.Create(Application, dsInsert);
  try
    sheetsFilter := ENTravelSheetFilter.Create;
    SetNullIntProps(sheetsFilter);
    SetNullXSProps(sheetsFilter);

     ENTravelSheetFilterObj := ENTravelSheetFilter.Create;
    SetNullIntProps(ENTravelSheetFilterObj);
    SetNullXSProps(ENTravelSheetFilterObj);

    if frmENTravelSheetFilterEdit.ShowModal = mrOk then
    begin

      sheetsFilter := ENTravelSheetFilterObj;
      sheetsFilter.orderBySQL := 'datestart desc, cast(numbergen as integer) desc'; //'cast(numbergen as integer) desc, datestart desc';
      updateTravelSheetsPastGrid(sheetsFilter);
    end;
  finally
    frmENTravelSheetFilterEdit.Free;
    frmENTravelSheetFilterEdit:=nil;
  end;
end;

procedure TfrmTransportManagement.chbDetailedClick(Sender: TObject);
begin
  inherited;
 HideControls([sgUnOrderedTransportDetailed], not chbDetailed.Checked);
 if chbDetailed.Checked then sgUnOrderedTransportClick(Sender);
end;

procedure TfrmTransportManagement.sgUnOrderedTransportClick(
  Sender: TObject);
begin
  inherited;
  UpdateUnOrderedTransportDetailedGrid;
end;

procedure TfrmTransportManagement.btnSetNullRealTransportToTransportOrderClick(
  Sender: TObject);
var
  TempENTransportOrder : ENTransportOrderControllerSoapPort;
  transportReal, transportRealStatus : Integer;
  numberGen, strQuestion : String;
  state_ : Boolean;
  i, count : Integer;
  orderCodes : ArrayOfInteger;

begin
  inherited;

  count := 0;
  i := 0;
  state_ := false;

    for i:=1 to sgOrderedTransport.RowCount - 1 do
  begin
      sgOrderedTransport.GetCheckBoxState(1,i,state_);
     if state_ then
       count := count + 1;
     end;

     SetLength(orderCodes, count);

     {Если checkbox'ами выбрана только одна заявка, то
     напишем, что пусть выбирают checkbox'ами больше чем
     одну заявку, т.к. непонятно какую брать активную или
     где установлен checkbox}
     if(count = 1) then
     begin
         Application.MessageBox(PChar('За допомогою флажків, обирайте більше ніж одну заявку, ' + chr(10) +
            ' для того, щоб обробити одну заявку її необхідно просто виділити !'),PChar('Внимание !'),
            MB_ICONWARNING+MB_OK);
         Exit;
     end;

     {Если не было выбрано флажками не одной заявки, то все равно массив
     создаётся и в него записывается код заявки выбранной}
     if count = 0 then
      count := 1;
     SetLength(orderCodes, count);
     if(count = 1) then
      orderCodes[0] := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);

      state_ := false;
      count := 0;

     {Прохождение грида и запись кодов выделенных заявок
     в массив}
     for i:=1 to sgOrderedTransport.RowCount - 1 do
     begin
      sgOrderedTransport.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       orderCodes[count] := Integer(sgOrderedTransport.Objects[3,i]);
       count := count + 1;
     end;
  end;

    if count = 0 then count := 1;
    TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;

    if ( (Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]) = 0) )
  then
  begin
    Application.MessageBox(PChar('Не обрана заявка !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;


     if(count = 1) then
        strQuestion := ' з заявки - ' + numberGen
     else
        strQuestion := ' з обраних заявок';

     for i := 0 to count - 1 do
     begin


      if transportRealStatus = ENConsts.TKTRANSPORTSTATUS_WORK then
        begin
  // Спрашиваем надо ли привязывать - если нет, то выходим
  // Вопрос задается один раз за весь цикл
            if i = 0 then
              if Application.MessageBox(PChar('Ви дійсно бажаєти відв''язати транспорт - ' +
                                  strQuestion + '?'),
                                  PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then Exit;

            TempENTransportOrder.setNullTransportRealToTransportOrder(orderCodes[i]);
        end;

     end;

  updateOrderedTransportGrid(toFilter);
end;

procedure TfrmTransportManagement.btnSetRealTransportToTransportOrderClick(
  Sender: TObject);
var
  TempENTransportOrder : ENTransportOrderControllerSoapPort;
  transportReal, transportRealStatus : Integer;
  numberGen, strQuestion : String;
  state_ : Boolean;
  i, count : Integer;
  orderCodes : ArrayOfInteger;

begin
  inherited;

  count := 0;
  i := 0;
  state_ := false;

    for i:=1 to sgOrderedTransport.RowCount - 1 do
  begin
      sgOrderedTransport.GetCheckBoxState(1,i,state_);
     if state_ then
       count := count + 1;
     end;

     SetLength(orderCodes, count);

     {Если checkbox'ами выбрана только одна заявка, то
     напишем, что пусть выбирают checkbox'ами больше чем
     одну заявку, т.к. непонятно какую брать активную или
     где установлен checkbox}
     if(count = 1) then
     begin
         Application.MessageBox(PChar('За допомогою флажків, обирайте більше ніж одну заявку, ' + chr(10) +
            ' для того, щоб обробити одну заявку її необхідно просто виділити !'),PChar('Внимание !'),
            MB_ICONWARNING+MB_OK);
         Exit;
     end;

     {Если не было выбрано флажками не одной заявки, то все равно массив
     создаётся и в него записывается код заявки выбранной}
     if count = 0 then
      count := 1;
     SetLength(orderCodes, count);
     if(count = 1) then
      orderCodes[0] := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);

      state_ := false;
      count := 0;

     {Прохождение грида и запись кодов выделенных заявок
     в массив}
     for i:=1 to sgOrderedTransport.RowCount - 1 do
     begin
      sgOrderedTransport.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       orderCodes[count] := Integer(sgOrderedTransport.Objects[3,i]);
       count := count + 1;
     end;
  end;

    if count = 0 then count := 1;
    TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
    transportRealStatus := Integer(sgTKTransportReal.Objects[1,sgTKTransportReal.Row]);
    numberGen := sgOrderedTransport.Cells[1,sgOrderedTransport.Row];
    transportReal := Integer(sgTKTransportReal.Objects[0,sgTKTransportReal.Row]);

    if ( (Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]) = 0) )
  or ((transportRealStatus <> ENConsts.TKTRANSPORTSTATUS_WORK))
  or (sgTKTransportReal.Cells[0, sgTKTransportReal.Row] = '') then
  begin
    Application.MessageBox(PChar('Не обран один з необхідних параметрів !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

    if transportRealStatus = ENConsts.TKTRANSPORTSTATUS_REPAIR then
  Application.MessageBox(PChar('Транспорт - '+ sgTKTransportReal.Cells[1, sgTKTransportReal.Row] +
                                  ' з номером - ' + sgTKTransportReal.Cells[2, sgTKTransportReal.Row] +
                                  ' знаходиться в ремонті! Оберіть інший транспорт!'),
                                  PChar('Внимание !'),MB_OK);


     if(count = 1) then
        strQuestion := ' до заявки - ' + numberGen
     else
        strQuestion := ' до обраних заявок';

     for i := 0 to count - 1 do
     begin


      if transportRealStatus = ENConsts.TKTRANSPORTSTATUS_WORK then
        begin
  // Спрашиваем надо ли привязывать - если нет, то выходим
  // Вопрос задается один раз за весь цикл
            if i = 0 then
              if Application.MessageBox(PChar('Ви дійсно бажаєти прив''язати транспорт - '+ sgTKTransportReal.Cells[1, sgTKTransportReal.Row] +
                                  ' з номером - ' + sgTKTransportReal.Cells[2, sgTKTransportReal.Row] +
                                  strQuestion + '?'),
                                  PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then Exit;

            TempENTransportOrder.setTransportRealToTransportOrder(orderCodes[i], transportReal);
        end;

     end;

  updateOrderedTransportGrid(toFilter);
end;

procedure TfrmTransportManagement.btnSetTimeOnTransportOrderClick(
  Sender: TObject);
var
    i, eCode, n, transportCode, planCode, isAssignment : integer;
    transportName : String;
    state_, isSel : boolean;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemObj : ENTransportItem;
    transportItemFilter : ENTransportItemFilter;
    tiList : ENTransportItemShortList;
    tiShort : ENTransportItemShort;
    tiArr : ArrayOfENTransportItemShort;
    dateStart, dateFinal : TXSDate;
    timeStart, timeFinal : TXSDateTime;
    TempENTransportOrder :  ENTransportOrderControllerSoapPort;
    wopwList : ENWorkOrder2ENPlanWorkShortList;
    wopwFilter : ENWorkOrder2ENPlanWorkFilter;
    TempWOPW : ENWorkOrder2ENPlanWorkControllerSoapPort;
    TempFINMolData : FINMolDataControllerSoapPort;
    fmdList : FINMolDataShortList;
    fmdFilter : FINMolDataFilter;

begin
  inherited;

  wopwFilter := ENWorkOrder2ENPlanWorkFilter.Create;
  SetNullIntProps(wopwFilter);
  SetNullXSProps(wopwFilter);

  wopwFilter.plan := ENPlanWork.Create;
  wopwFilter.plan.code := Integer(sgUnOrderedTransport.Objects[1,sgUnOrderedTransport.Row]);

  TempWOPW := HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;

  wopwList := TempWOPW.getScrollableFilteredList(wopwFilter, 0, -1);

  fmdFilter := FINMolDataFilter.Create;
  SetNullIntProps(fmdFilter);
  SetNullXSProps(fmdFilter);

  fmdFilter.workOrder := ENWorkOrder.Create;
  fmdFilter.workOrder.code := wopwList.list[0].workOrderCode;

  fmdFilter.molTypeRef := FINMolTypeRef.Create;
  fmdFilter.molTypeRef.code := ENConsts.FINMOLTYPE_MASTER;

  TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;

  fmdList := TempFINMolData.getScrollableFilteredList(fmdFilter, 0, -1);



  if sgUnOrderedTransport.Cells[1, sgUnOrderedTransport.Row] = '' then Exit;

  if chbDetailed.Checked then
  begin

  state_ := false;
  isSel := false;

  n:= 0;

  for i:=1 to sgUnorderedTransportDetailed.RowCount - 1 do
  begin
     sgUnorderedTransportDetailed.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
       n:= n+1;
     end;

  end;

    if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б один транспорт!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  transportCode := Integer(sgUnorderedTransportDetailed.Objects[0, sgUnorderedTransportDetailed.Row]);
  planCode := Integer(sgUnorderedTransportDetailed.Objects[1, sgUnorderedTransportDetailed.Row]);

  tiList := ENTransportItemShortList.Create;
  tiList.totalCount := 0;
  SetLength(tiArr, n);
  state_ := false;
  n:= 0;
  for i := 1 to sgUnorderedTransportDetailed.RowCount - 1 do
  begin
    sgUnorderedTransportDetailed.GetCheckBoxState(1, i, state_);
    if state_ then
    begin
       tiShort := ENTransportItemShort.Create;
       SetNullIntProps(tiShort);
       SetNullXSProps(tiShort);
       tiShort.code :=  StrToInt(sgUnorderedTransportDetailed.Cells[0, i]);
       tiShort.planRefCode := planCode;
       tiShort.transportCode := transportCode;
       tiShort.transportName := sgUnorderedTransportDetailed.Cells[1, i];
       tiArr[n] := tiShort;
       n := n + 1;
    end;
  end;

  end;

  if chbDetailed.Checked = False then
    begin
    transportItemFilter := ENTransportItemFilter.Create;
    SetNullIntProps(transportItemFilter);
    SetNullXSProps(transportItemFilter);

    transportCode := Integer(sgUnorderedTransport.Objects[0, sgUnorderedTransport.Row]);
    planCode := Integer(sgUnorderedTransport.Objects[1, sgUnorderedTransport.Row]);

    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;


    transportItemFilter.conditionSQL := ' and tr.TRANSPORTCODE = ' + IntToStr(transportCode) +
                                        ' and p.code = ' + IntToStr(planCode) +
                                        ' and tr.code not in ' +
                                        ' (select entrnsprtrdr2trnsprttm.transportitemcode from entrnsprtrdr2trnsprttm ' +
                                        ' where entrnsprtrdr2trnsprttm.transportordercode in ' +
                                        ' (select entransportorder.code from entransportorder ' +
                                        ' where entransportorder.transportcode = ' + IntToStr(transportCode) +
                                        ' and entransportorder.planrefcode = ' + IntToStr(planCode) + '))';

    tiList := TempENTransportItem.getListDetailedForTravelSheetItem(transportItemFilter);
    tiArr := tiList.list;
   end;

  frmSetTimeToTransportItem := TfrmSetTimeToTransportItem.Create(Application, dsInsert);

       {Дата наряда}
   frmSetTimeToTransportItem.edtDateStart.Date := StrToDate(XSDate2String(fmdList.list[0].workOrderDateGen));
   frmSetTimeToTransportItem.edtDateFinal.Date := StrToDate(XSDate2String(fmdList.list[0].workOrderDateGen));

  frmSetTimeToTransportItem.Caption := 'Встановлення часу роботи транспорта';
  try
    if frmSetTimeToTransportItem.ShowModal = mrOK then
       begin
            dateStart := TXSDate.Create;
            dateStart.XSToNative(GetXSDate(frmSetTimeToTransportItem.edtDateStart.Date));
            dateFinal := TXSDate.Create;
            dateFinal.XSToNative(GetXSDate(frmSetTimeToTransportItem.edtDateFinal.Date));
            timeStart := TXSDateTime.Create;
            timeStart.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeStart.DateTime));
            timeFinal := TXSDateTime.Create;
            timeFinal.XSToNative(GetXSDateTime(frmSetTimeToTransportItem.edtTimeFinal.DateTime));

            {24/03/2012 - Определение признака командировки}
            isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_FALSE;
             if frmSetTimeToTransportItem.chbIsAssignment.Checked = true then
              isAssignment := ENConsts.ENTRANSPORTORDER_ISASSIGNMENT_TRUE;



            TempENTransportOrder := HTTPRIOENTransportOrder as  ENTransportOrderControllerSoapPort;
            TempENTransportOrder.addTransportOrderWithTransportItems(tiArr,
                                                                    timeStart,
                                                                    dateStart,
                                                                    timeFinal,        
                                                                    dateFinal,
                                                                    frmSetTimeToTransportItem.transportDepartmentCode,
                                                                    isAssignment);
         end;
       updateUnOrderedTransportGrid();
       updateUnOrderedTransportDetailedGrid();
       updateOrderedTransportGrid(toFilter);
  finally
     frmSetTimeToTransportItem.Free;
  end;

end;

procedure TfrmTransportManagement.TBTravelSheetsPastViewClick(
  Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsView);
  try
    frmENTravelSheetEdit.ShowModal;
  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;

procedure TfrmTransportManagement.TBTravelSheetsPastChangeClick(
  Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
prevTravelSheet : ENTravelSheet;
isLastClosed : boolean;
begin
inherited;
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]));
   except
   on EConvertError do Exit;
  end;

  if  ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
     Application.MessageBox(PChar('Подорожній лист затверджений ... !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

        prevTravelSheet := DMReports.getPrevTravelSheet(ENTravelSheetObj);
        if prevTravelSheet <> nil then
        begin
          //if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) and ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_WRITINGOFF_GSM ) then
          if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) then
            isLastClosed := False
          else
            isLastClosed := True;
       end
       else
        isLastClosed := True;
  //selectedRow := sgENTravelSheet.Row;

  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsEdit);
  try
    frmENTravelSheetEdit.isLastClosed := isLastClosed;
    if frmENTravelSheetEdit.ShowModal= mrOk then
      begin

       UpdateTravelSheetsPastGrid(trFilter);

      end;

  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;


procedure TfrmTransportManagement.SpeedButton1Click(Sender: TObject);
var
  TempENTransportOrder : ENTransportOrderControllerSoapPort;
  transportReal, transportRealStatus : Integer;
  numberGen, strQuestion, tabNumber : String;
  state_ : Boolean;
  i, count : Integer;
  orderCodes : ArrayOfInteger;

begin
  inherited;

  count := 0;
  i := 0;
  state_ := false;

    for i:=1 to sgOrderedTransport.RowCount - 1 do
  begin
      sgOrderedTransport.GetCheckBoxState(1,i,state_);
     if state_ then
       count := count + 1;
     end;

     SetLength(orderCodes, count);

     {Если checkbox'ами выбрана только одна заявка, то
     напишем, что пусть выбирают checkbox'ами больше чем
     одну заявку, т.к. непонятно какую брать активную или
     где установлен checkbox}
     if(count = 1) then
     begin
         Application.MessageBox(PChar('За допомогою флажків, обирайте більше ніж одну заявку, ' + chr(10) +
            ' для того, щоб обробити одну заявку її необхідно просто виділити !'),PChar('Внимание !'),
            MB_ICONWARNING+MB_OK);
         Exit;
     end;

     {Если не было выбрано флажками не одной заявки, то все равно массив
     создаётся и в него записывается код заявки выбранной}
     if count = 0 then
      count := 1;
     SetLength(orderCodes, count);
     if(count = 1) then
      orderCodes[0] := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);

      state_ := false;
      count := 0;

     {Прохождение грида и запись кодов выделенных заявок
     в массив}
     for i:=1 to sgOrderedTransport.RowCount - 1 do
     begin
      sgOrderedTransport.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       orderCodes[count] := Integer(sgOrderedTransport.Objects[3,i]);
       count := count + 1;
     end;
  end;

    if count = 0 then count := 1;
    TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
    transportRealStatus := Integer(sgTKTransportReal.Objects[1,sgTKTransportReal.Row]);
    numberGen := sgOrderedTransport.Cells[1,sgOrderedTransport.Row];
    tabNumber := sgDrivers.Cells[2,sgDrivers.Row];
    transportReal := Integer(sgTKTransportReal.Objects[0,sgTKTransportReal.Row]);

    if ( (Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]) = 0) )
  or ((sgDrivers.Cells[2, sgDrivers.Row] = '') and (transportRealStatus = ENConsts.TKTRANSPORTSTATUS_WORK))
  or (sgTKTransportReal.Cells[0, sgTKTransportReal.Row] = '') then
  begin
    Application.MessageBox(PChar('Не обран один з необхідних параметрів !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

    if transportRealStatus = ENConsts.TKTRANSPORTSTATUS_REPAIR then
  Application.MessageBox(PChar('Транспорт - '+ sgTKTransportReal.Cells[1, sgTKTransportReal.Row] +
                                  ' з номером - ' + sgTKTransportReal.Cells[2, sgTKTransportReal.Row] +
                                  ' знаходиться в ремонті! Оберіть інший транспорт!'),
                                  PChar('Внимание !'),MB_OK);


     if(count = 1) then
        strQuestion := ' до заявки - ' + numberGen
     else
        strQuestion := ' до обраних заявок';

     for i := 0 to count - 1 do
     begin

       if transportRealStatus = ENConsts.TKTRANSPORTSTATUS_FROM_SIDE then
        begin
          if i = 0 then
            if Application.MessageBox(PChar('Ви дійсно бажаєти прив''язати сторонній транспорт - '+ sgTKTransportReal.Cells[1, sgTKTransportReal.Row] +
                                  ' з номером - ' + sgTKTransportReal.Cells[2, sgTKTransportReal.Row] +
                                  strQuestion + '?'),
                                  PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then Exit;

            TempENTransportOrder.addTransportFromSideOnTransportOrder(orderCodes[i], transportReal);
        end;

      if transportRealStatus = ENConsts.TKTRANSPORTSTATUS_WORK then
        begin
  // Спрашиваем надо ли привязывать - если нет, то выходим
  // Вопрос задается один раз за весь цикл
            if i = 0 then
              if Application.MessageBox(PChar('Ви дійсно бажаєти прив''язати обраного водія - ' +  sgDrivers.Cells[1, sgDrivers.Row] +
                                  ' з табельним номером - ' + sgDrivers.Cells[2, sgDrivers.Row] +
                                  ' та транспорт - '+ sgTKTransportReal.Cells[1, sgTKTransportReal.Row] +
                                  ' з номером - ' + sgTKTransportReal.Cells[2, sgTKTransportReal.Row] +
                                  strQuestion + '?'),
                                  PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDCANCEL then Exit;

            TempENTransportOrder.addTransportWithWorker(orderCodes[i], tabNumber, transportReal);
        end;

     end;

  updateOrderedTransportGrid(toFilter);
  updateUnOrderedTransportGrid;
  updateTravelSheetCurrentDateGrid;
  updateTKTransportGrid;
  fillRealTransportTimeLine;
end;

procedure TfrmTransportManagement.TBTravelSheetCurrentDateViewClick(
  Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsView);
  try
    frmENTravelSheetEdit.ShowModal;
  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;

procedure TfrmTransportManagement.TBTravelSheetCurrentDateViewTransportOrderClick(
  Sender: TObject);
  var
  fil : ENTransportOrderFilter;
  TempENTransportOrder2Travel : ENTransportOrder2TravelControllerSoapPort;
  order2travelFil : ENTransportOrder2TravelFilter;
  order2travelList : ENTransportOrder2TravelShortList;
  i : Integer;
  orderCodes : String;
begin
  inherited;

     if sgTravelSheetCurrentDate.Cells[1,sgTravelSheetCurrentDate.Row] = '' then Exit;


  TempENTransportOrder2Travel :=  HTTPRIOENTransportOrder2Travel as ENTransportOrder2TravelControllerSoapPort;
  order2travelFil :=   ENTransportOrder2TravelFilter.Create;
  SetNullIntProps(order2travelFil);
  SetNullXSProps(order2travelFil);
  order2travelFil.travelsheet := ENTravelSheet.Create;
  order2travelFil.travelsheet.code := StrTOInt(sgTravelSheetCurrentDate.Cells[0, sgTravelSheetCurrentDate.Row]);

  order2travelList := TempENTransportOrder2Travel.getScrollableFilteredList(order2travelFil,0,-1);

  if (High(order2travelList.list) = -1) then  exit;


  orderCodes := '';

 for i:=0 to High(order2travelList.list) do
      begin
        if order2travelList.list[i].transportorderCode <> Low(Integer) then
        orderCodes := orderCodes + IntToStr(order2travelList.list[i].transportorderCode);

        if i < High(order2travelList.list) then
        orderCodes := orderCodes + ',';
      end;

  fil := ENTransportOrderFilter.Create;
  SetNullIntProps(fil);
  SetNullXSProps(fil);
  fil.code := -1;
  fil.conditionSQL := ' entransportorder.code in (' + orderCodes + ')';
  updateOrderedTransportGrid(fil);
end;

procedure TfrmTransportManagement.TBTravelSheetCurrentDateEditClick(
  Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
prevTravelSheet : ENTravelSheet;
isLastClosed : boolean;
begin
inherited;
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]));
   except
   on EConvertError do Exit;
  end;

  if  ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
     Application.MessageBox(PChar('Подорожній лист затверджений ... !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

        prevTravelSheet := DMReports.getPrevTravelSheet(ENTravelSheetObj);
        if prevTravelSheet <> nil then
        begin
          if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) then
            isLastClosed := False
          else
            isLastClosed := True;
       end
       else
        isLastClosed := True;

  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsEdit);
  try
    frmENTravelSheetEdit.isLastClosed := isLastClosed;
    if frmENTravelSheetEdit.ShowModal= mrOk then
      begin

       updateTravelSheetCurrentDateGrid;

      end;

  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;

procedure TfrmTransportManagement.btnDeleteTransportOrderItemsFromTravelSheetItemClick(
  Sender: TObject);
var
    i, eCode, n, transportCode, transportOrderCode : integer;
    dateStart, dateFinal : TXSDate;
    timeStart, timeFinal : TXSDateTime;
    TempENTransportOrder :  ENTransportOrderControllerSoapPort;
    ENTransportOrderObj : ENTransportOrder;


begin
  inherited;

  if Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]) = 0 then Exit;

  transportOrderCode := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);

  if chbDetailed.Checked then
  chbDetailed.Checked := false;


    TempENTransportOrder := HTTPRIOENTransportOrder as  ENTransportOrderControllerSoapPort;

   if Application.MessageBox(PChar('Ви дійсно бажаєте видалити заявку з подорожнього листа?'),
                           PChar('Внимание'), MB_OKCANCEL + MB_ICONQUESTION) <> IDOK then Exit;


    TempENTransportOrder.removeTransportOrderItemsFromTravelSheet(transportOrderCode);
    UpdateOrderedTransportGrid(toFilter);
    UpdateUnOrderedTransportGrid;
    UpdateUnOrderedTransportDetailedGrid;
    UpdateTravelSheetCurrentDateGrid;
    updateTKTransportGrid;
    fillRealTransportTimeLine;


end;

procedure TfrmTransportManagement.actViewExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
        ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsView);
  try
    frmENTravelSheetEdit.ShowModal;
  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;



procedure TfrmTransportManagement.actCloseExecute(Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
        objCode := StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]);
   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  if (obj.statusRef.code = TRAVEL_STATUS_GOOD) or (obj.statusRef.code = TRAVEL_STATUS_PLAN ) then
    TempENTravelSheet.closePlan(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_FACT then
    TempENTravelSheet.closeFact(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
     TempENTravelSheet.closeWritingOff(Obj.code)
  else
  begin
    ShowMessage('Error on status TS');
  end;
        updateTravelSheetsPastGrid(trFilter);
end;


procedure TfrmTransportManagement.actUnCloseExecute(Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
        objCode := StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]);

   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  if obj.statusRef.code = TRAVEL_STATUS_FACT then
    TempENTravelSheet.unClosePlan(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
    TempENTravelSheet.unCloseWritingOff(obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_CLOSED then
    TempENTravelSheet.unCloseTravelSheet(Obj.code)
  else
     ShowMessage('Error on status TS');

    updateTravelSheetsPastGrid(trFilter);

end;


procedure TfrmTransportManagement.pmTravelSheetsPastPopup(Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
        objCode := StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]);
   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  DisableActions([actClose, actUnClose]);

  //actClose.Visible := actClose.Enabled;
  //actUnClose.Visible := actUnClose.Enabled;

  miClose.Visible := False;
  miUnClose.Visible := False;

  if (obj.statusRef.code = TRAVEL_STATUS_PLAN) then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Скласти Факт';
      miClose.Visible := actClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_FACT then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Затвердити';
      miClose.Visible := actClose.Enabled;

      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у План';
      miUnClose.Visible := actUnClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Затвердити';
      miClose.Visible := actClose.Enabled;

      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у Факт';
      miUnClose.Visible := actUnClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у Списання ПММ';
      miUnClose.Visible := actUnClose.Enabled;
  end;

end;




procedure TfrmTransportManagement.actUpdateExecute(Sender: TObject);
begin
  inherited;
        updateTravelSheetsPastGrid(trFilter);
end;

procedure TfrmTransportManagement.actEditExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
prevTravelSheet : ENTravelSheet;
isLastClosed : boolean;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
        ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]));
   except
   on EConvertError do Exit;
  end;

  if  ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
     Application.MessageBox(PChar('Подорожній лист затверджений ... !'),PChar('Увагв !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

        prevTravelSheet := DMReports.getPrevTravelSheet(ENTravelSheetObj);
        if prevTravelSheet <> nil then
        begin
          //if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) and ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_WRITINGOFF_GSM ) then
          if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) then
            isLastClosed := False
          else
            isLastClosed := True;
       end
       else
        isLastClosed := True;
  //selectedRow := sgENTravelSheet.Row;

  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsEdit);
  try
    frmENTravelSheetEdit.isLastClosed := isLastClosed;
    if frmENTravelSheetEdit.ShowModal= mrOk then
      begin
        //updateTravelSheetsPastGrid(nil);
      end;

  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;


procedure TfrmTransportManagement.N8Click(Sender: TObject);
begin
  inherited;
  updateTravelSheetsPastGrid(nil);
end;

procedure TfrmTransportManagement.actViewCurrentExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
        ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsView);
  try
    frmENTravelSheetEdit.ShowModal;
  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;


procedure TfrmTransportManagement.actEditCurrentExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
prevTravelSheet : ENTravelSheet;
isLastClosed : boolean;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
        ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]));
   except
   on EConvertError do Exit;
  end;

  if  ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
     Application.MessageBox(PChar('Подорожній лист затверджений ... !'),PChar('Увагв !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

        prevTravelSheet := DMReports.getPrevTravelSheet(ENTravelSheetObj);
        if prevTravelSheet <> nil then
        begin
          //if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) and ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_WRITINGOFF_GSM ) then
          if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) then
            isLastClosed := False
          else
            isLastClosed := True;
       end
       else
        isLastClosed := True;
  //selectedRow := sgENTravelSheet.Row;

  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsEdit);
  try
    frmENTravelSheetEdit.isLastClosed := isLastClosed;
    if frmENTravelSheetEdit.ShowModal= mrOk then
      begin
        updateTravelSheetCurrentDateGrid;
      end;

  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;

procedure TfrmTransportManagement.actFilterExecute(Sender: TObject);
begin
  frmENTravelSheetFilterEdit:=TfrmENTravelSheetFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetFilterObj := ENTravelSheetFilter.Create;
    SetNullIntProps(ENTravelSheetFilterObj);
    SetNullXSProps(ENTravelSheetFilterObj);

    trFilter := ENTravelSheetFilter.Create;
    SetNullIntProps(trFilter);
    SetNullXSProps(trFilter);

    if frmENTravelSheetFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetFilter.Create;
      trFilter := ENTravelSheetFilterObj;
      trFilter.orderBySQL := 'datestart desc, cast(numbergen as integer) desc'; //'cast(numbergen as integer) desc, datestart desc';
      updateTravelSheetsPastGrid(trFilter);
    end;
  finally
    frmENTravelSheetFilterEdit.Free;
    frmENTravelSheetFilterEdit:=nil;
  end;
end;


procedure TfrmTransportManagement.actCloseCurrentExecute(Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
        objCode := StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]);
   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  if (obj.statusRef.code = TRAVEL_STATUS_GOOD) or (obj.statusRef.code = TRAVEL_STATUS_PLAN ) then
    TempENTravelSheet.closePlan(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_FACT then
    TempENTravelSheet.closeFact(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
     TempENTravelSheet.closeWritingOff(Obj.code)
  else
  begin
    ShowMessage('Error on status TS');
  end;
        updateTravelSheetCurrentDateGrid;
end;


procedure TfrmTransportManagement.actUnCloseCurrentExecute(
  Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
        objCode := StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]);

   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  if obj.statusRef.code = TRAVEL_STATUS_FACT then
    TempENTravelSheet.unClosePlan(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
    TempENTravelSheet.unCloseWritingOff(obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_CLOSED then
    TempENTravelSheet.unCloseTravelSheet(Obj.code)
  else
     ShowMessage('Error on status TS');

    updateTravelSheetCurrentDateGrid;
  
end;


procedure TfrmTransportManagement.actUpdateCurrentExecute(Sender: TObject);
begin
  inherited;
  updateTravelSheetCurrentDateGrid;
end;

procedure TfrmTransportManagement.pmTravelSheetCurrentDatePopup(
  Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
        objCode := StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]);
   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  DisableActions([actClose, actUnClose]);

  //actClose.Visible := actClose.Enabled;
  //actUnClose.Visible := actUnClose.Enabled;

  miClose.Visible := False;
  miUnClose.Visible := False;

  if (obj.statusRef.code = TRAVEL_STATUS_PLAN) then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Скласти Факт';
      miClose.Visible := actClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_FACT then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Затвердити';
      miClose.Visible := actClose.Enabled;

      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у План';
      miUnClose.Visible := actUnClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Затвердити';
      miClose.Visible := actClose.Enabled;

      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у Факт';
      miUnClose.Visible := actUnClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у Списання ПММ';
      miUnClose.Visible := actUnClose.Enabled;
  end;

end;

procedure TfrmTransportManagement.fillRealTransportTimeLine();
var
TempENTransportOrder : ENTransportOrderControllerSoapPort;
toList : ENTransportOrderShortList;
toFilter : ENTransportOrderFilter;
i, transportRealStatus: Integer;
TempENTravelSheetItem : ENTravelSheetItemControllerSoapPort;
tsiFilter : ENTravelSheetItemFilter;
tsiList : ENTravelSheetItemShortList;
Days : Integer;
condition : String;
begin
       RealTransportTimeLine.Items.Clear;
       RealTransportTimeLine.Positions:= 3;
       RealTransportTimeLine.Header.Captions.Clear;
       RealTransportTimeLine.ItemGap:= -1;

       RealTransportTimeLine.Mode.PeriodStartDay := DayOf(orderDateStart);
       RealTransportTimeLine.Mode.PeriodStartMonth := MonthOf(orderDateStart);
       RealTransportTimeLine.Mode.PeriodStartYear := YearOf(orderDateStart);

       RealTransportTimeLine.Mode.PeriodEndDay := DayOf(orderDateFinal);
       RealTransportTimeLine.Mode.PeriodEndMonth := MonthOf(orderDateFinal);
       RealTransportTimeLine.Mode.PeriodEndYear := YearOf(orderDateFinal);

       RealTransportTimeLine.Mode.TimeLineStart := EncodeDate(YearOf(orderDateStart),
                                                              MonthOf(orderDateStart),
                                                              DayOf(orderDateStart));


       Days := DaysBetween(orderDateStart, orderDateFinal) + 1;

       RealTransportTimeLine.Display.DisplayEnd := Days*1440;


       RealTransportTimeLine.Header.Captions.Add('Час дня');
       RealTransportTimeLine.Header.Captions.Add('Планова загрузка');
       RealTransportTimeLine.Header.Captions.Add('Фактична загрузка');

       TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;

       toFilter := ENTransportOrderFilter.Create;
       SetNullIntProps(toFilter);
       SetNullXSProps(toFilter);

       transportRealStatus := Integer(sgTKTransportReal.Objects[1,sgTKTransportReal.Row]);

       toFilter.transportReal := TKTransportReal.Create;
       toFilter.transportReal.code := transportCode;

       condition := ' ((to_date(to_char(ENTRANSPORTORDER.DATESTART,''dd.mm.yyyy''),''dd.mm.yyyy'') >= ''' +DateToStr(orderDateStart)+'''' +
                                ' AND to_date(to_char(ENTRANSPORTORDER.DATESTART,''dd.mm.yyyy''),''dd.mm.yyyy'') <= ''' +DateToStr(orderDateFinal)+''')' +
                                ' OR (to_date(to_char(ENTRANSPORTORDER.DATEFINAL,''dd.mm.yyyy''),''dd.mm.yyyy'') >= ''' +DateToStr(orderDateStart)+'''' +
                                ' AND to_date(to_char(ENTRANSPORTORDER.DATEFINAL,''dd.mm.yyyy''),''dd.mm.yyyy'') <= ''' +DateToStr(orderDateFinal)+'''))' +
                                ' AND ENTRANSPORTORDER.PARENTREFCODE is null ';
                                if transportRealStatus <> ENConsts.TKTRANSPORTSTATUS_FROM_SIDE then
                                condition := condition + ' AND ENTRANSPORTORDER.CODE in (select entransportorder2travl.transportordercode from entransportorder2travl) ';

       toFilter.conditionSQL := condition;
       toList := TempENTransportOrder.getScrollableFilteredList(toFilter, 0, -1);

       for i := 0 to High(toList.list) do
       begin
            if  ((FormatDateTime('hh:mm',toList.list[i].timeStart.AsDateTime) <> '00:00' )
                                 and ( FormatDateTime('hh:mm',toList.list[i].timeFinal.AsDateTime) <> '00:00' )) then
            begin
                with RealTransportTimeLine.CreateItem do
                begin
                      ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;
                                    itempos := 0;
                                    ItemStartTime :=  EncodeDateTime( toList.list[i].timeStart.Year,
                                                                      toList.list[i].timeStart.Month,
                                                                      toList.list[i].timeStart.Day,
                                                                      toList.list[i].timeStart.Hour,
                                                                      toList.list[i].timeStart.Minute,
                                                                     0,0);
                                    ItemEndTime :=  EncodeDateTime( toList.list[i].timeFinal.Year,
                                                                      toList.list[i].timeFinal.Month,
                                                                      toList.list[i].timeFinal.Day,
                                                                      toList.list[i].timeFinal.Hour,
                                                                      toList.list[i].timeFinal.Minute,
                                                                      0,0);
                                    Text.Text := toList.list[i].numbergen;
                                    Font.Size:= 4;
                                    Color:= clGreen;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                    AutoSize:= False;
                                    Hint := toList.list[i].numbergen + ' ' +
                                                   XSDateTimeWithDate2String(toList.list[i].timeStart) + ' - ' +
                                                   XSDateTimeWithDate2String(toList.list[i].timeFinal);

                end;
            end;
       end;



TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;

tsiFilter := ENTravelSheetItemFilter.Create;
SetNullIntProps(tsiFilter);
SetNullXSProps(tsiFilter);

tsiFilter.conditionSQL := 'ENTRAVELSHEETITEM.CODE IN (select entravelsheetitem.code from entravelsheetitem, entravelsheet ' +
' where ' +
'	entravelsheetitem.travelsheetrefcode = entravelsheet.code ' +
' and ((''' +DateToStr(orderDateStart)+''' >= to_date(to_char(entravelsheet.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') ' +
' and ''' +DateToStr(orderDateStart)+''' <= to_date(to_char(entravelsheet.datefinal,''dd.mm.yyyy''),''dd.mm.yyyy'') ' +
' and ''' +DateToStr(orderDateFinal)+''' >= to_date(to_char(entravelsheet.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') ' +
' and ''' +DateToStr(orderDateFinal)+''' <= to_date(to_char(entravelsheet.datefinal,''dd.mm.yyyy''),''dd.mm.yyyy'') )' +
' OR ( to_date(to_char(entravelsheet.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') >= ''' +DateToStr(orderDateStart)+'''' +
' AND  to_date(to_char(entravelsheet.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') <= ''' +DateToStr(orderDateFinal)+'''' + ')'+
' OR ( to_date(to_char(entravelsheet.datefinal,''dd.mm.yyyy''),''dd.mm.yyyy'') >= ''' +DateToStr(orderDateStart)+'''' +
' AND  to_date(to_char(entravelsheet.datefinal,''dd.mm.yyyy''),''dd.mm.yyyy'') <= ''' +DateToStr(orderDateFinal)+'''' + ')'+
' )' +
'    and entravelsheet.transportrealcode = ' + IntToStr(transportCode) +
'    and entravelsheetitem.kindrefcode = ' + IntToStr(ENConsts.TRAVELITEM_KIND_FACT)+')';

tsiList := TempENTravelSheetItem.getScrollableFilteredList(tsiFilter, 0, -1);



for i := 0 to High(tsiList.list) do
       begin
            if (tsiList.list[i].timeStart <> nil) and (tsiList.list[i].timeFinal <> nil)  then
            begin
            if  ((FormatDateTime('hh:mm',tsiList.list[i].timeStart.AsDateTime) <> '00:00' )
                                 and ( FormatDateTime('hh:mm',tsiList.list[i].timeFinal.AsDateTime) <> '00:00' )) then
            begin
                with RealTransportTimeLine.CreateItem do
                begin
                      ReadOnly := true;
                                    FixedPos := true;
                                    FixedPosition := true;
                                    FixedSize := true;
                                    FixedTime := true;
                                    itempos := 1;
                                    ItemStartTime :=  EncodeDateTime( tsiList.list[i].timeStart.Year,
                                                                      tsiList.list[i].timeStart.Month,
                                                                      tsiList.list[i].timeStart.Day,
                                                                      tsiList.list[i].timeStart.Hour,
                                                                      tsiList.list[i].timeStart.Minute,
                                                                     0,0);
                                    ItemEndTime :=  EncodeDateTime( tsiList.list[i].timeFinal.Year,
                                                                      tsiList.list[i].timeFinal.Month,
                                                                      tsiList.list[i].timeFinal.Day,
                                                                      tsiList.list[i].timeFinal.Hour,
                                                                      tsiList.list[i].timeFinal.Minute,
                                                                      0,0);
                                    Text.Text := tsiList.list[i].workOrderNumber;
                                    Font.Size:= 4;
                                    Color:= clBlue;
                                    CaptionType:= ctTimeText;
                                    CaptionFont.Size:= 6;
                                    Shape:= psRect;
                                    TrackVisible:= False;
                                    Shadow:= False;
                                    AutoSize:= False;
                                    Hint := tsiList.list[i].workOrderNumber + ' ' +
                                                  XSDateTimeWithDate2String(tsiList.list[i].timeStart) + ' - ' +
                                                  XSDateTimeWithDate2String(tsiList.list[i].timeFinal);
                end;
            end;
       end;
 end;


end;

procedure TfrmTransportManagement.chbAllTransportOrdersClick(
  Sender: TObject);
begin
  inherited;
      {03/03/2012 - Проверка на заполненность полей Підрозділ и Дата заявок}
    if (not NoBlankValues([edtDateStart, edtDateFinal, edtDepartment])) then Exit;
    chbOrderedGood.state := cbUnchecked;

    {20/03/2012 - Проверка на корректность дат}
      if orderDateFinal < orderDateStart then
  begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  if chbAllTransportOrders.Checked then
  begin
    toFilter := ENTransportOrderFilter.Create;
    SetNullIntProps(toFilter);
    SetNullXSProps(toFilter);
    toFilter.transportDepartment := ENTransportDepartmentRef.Create;
    toFilter.transportDepartment.code := transportDepartmentCode;
  end
  else
    toFilter := nil;

    updateOrderedTransportGrid(toFilter);
end;

procedure TfrmTransportManagement.actUnOrderedTransportShowPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    planCode : Integer;
begin
 TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  try
   planCode :=  Integer(sgUnOrderedTransport.Objects[1,sgUnOrderedTransport.Row]);
  except
     on EConvertError do Exit;
  end;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
  try

    try
      frmENPlanWorkEdit.ENPlanWorkObj := DMReports.getPlanByCode(planCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

  updateOrderedTransportGrid(toFilter);
  updateUnOrderedTransportGrid();

end;


procedure TfrmTransportManagement.actOrderedTransportShowPlanExecute(
  Sender: TObject);
  Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    planCode : Integer;
begin
 TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  try
   planCode :=  Integer(sgOrderedTransport.Objects[1,sgOrderedTransport.Row]);
  except
     on EConvertError do Exit;
  end;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try

    try
      frmENPlanWorkEdit.ENPlanWorkObj := DMReports.getPlanByCode(planCode);
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

    updateOrderedTransportGrid(toFilter);
  updateUnOrderedTransportGrid();

end;

procedure TfrmTransportManagement.chbUnorderedClick(Sender: TObject);
begin
  updateUnOrderedTransportGrid();
end;

procedure TfrmTransportManagement.chbHideUnorderedTransportClick(
  Sender: TObject);
begin
  inherited;
 HideControls([gbNotOrderedTransport], not chbHideUnorderedTransport.Checked);
end;

procedure TfrmTransportManagement.btnShowTravelSheetByTransportOrderClick(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
travelSheetCode : Integer;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
        travelSheetCode := Integer(sgOrderedTransport.Objects[2,sgOrderedTransport.Row]);
        if travelSheetCode = 0 then Exit
        else
        ENTravelSheetObj := TempENTravelSheet.getObject(travelSheetCode);
   except
   on EConvertError do Exit;
  end;

  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsView);
  try
    frmENTravelSheetEdit.ShowModal;
  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;

    updateOrderedTransportGrid(toFilter);
  updateUnOrderedTransportGrid();
end;

procedure TfrmTransportManagement.chbLastDriversClick(Sender: TObject);
begin
  inherited;

  updateDriversGrid(nil);
end;

procedure TfrmTransportManagement.actDeleteCurrentExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
  ObjCode: Integer;
  ENTravelSheetObj : ENTravelSheet;
begin
  inherited;
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ObjCode := StrToInt(sgTravelSheetCurrentDate.Cells[0,sgTravelSheetCurrentDate.Row]);
   except
   on EConvertError do Exit;
  end;

  try
     ENTravelSheetObj := TempENTravelSheet.getObject(ObjCode);
   except
   on EConvertError do Exit;
  end;

  if  (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and
      (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN)
  then
  begin
     Application.MessageBox(PChar('Видаляти можна тільки Черновий подорожній лист або подорожный лист з видаленими нарядами... !'),PChar('Увагa !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Подорожній лист) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheet.remove(ObjCode);
      updateTravelSheetCurrentDateGrid;
  end;
end;


procedure TfrmTransportManagement.actDeleteExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
  ObjCode: Integer;
  ENTravelSheetObj : ENTravelSheet;
begin
  inherited;
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ObjCode := StrToInt(sgTravelSheetsPast.Cells[0,sgTravelSheetsPast.Row]);
   except
   on EConvertError do Exit;
  end;

  try
     ENTravelSheetObj := TempENTravelSheet.getObject(ObjCode);
   except
   on EConvertError do Exit;
  end;

  if  (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and
      (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN)
  then
  begin
     Application.MessageBox(PChar('Видаляти можна тільки Черновий подорожній лист або подорожный лист з видаленими нарядами... !'),PChar('Увагa !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Подорожній лист) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheet.remove(ObjCode);
      updateTravelSheetsPastGrid(trFilter);
  end;
end;

procedure TfrmTransportManagement.chbOrderedGoodClick(Sender: TObject);
begin
  inherited;
      {03/03/2012 - Проверка на заполненность полей Підрозділ и Дата заявок}
    if (not NoBlankValues([edtDateStart, edtDateFinal, edtDepartment])) then Exit;
    chbAllTransportOrders.State := cbUnchecked;

        {20/03/2012 - Проверка на корректность дат}
      if orderDateFinal < orderDateStart then 
  begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  if chbOrderedGood.Checked then
  begin
    toFilter := ENTransportOrderFilter.Create;
    SetNullIntProps(toFilter);
    SetNullXSProps(toFilter);
    toFilter.transportDepartment := ENTransportDepartmentRef.Create;
    toFilter.transportDepartment.code := transportDepartmentCode;
    toFilter.transportOrderStatus := ENTransportOrderStatus.Create;
    toFilter.transportOrderStatus.code := ENConsts.ENTRANSPORTORDERSTATUS_GOOD;
  end
  else
    toFilter := nil;

    updateOrderedTransportGrid(toFilter);
end;

procedure TfrmTransportManagement.DisableControls(Controls: array of TControl; Disable: Boolean = true; Color: TColor = clBtnFace);
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

function TfrmTransportManagement.NoBlankValues(Edits: array of TWinControl): Boolean;
Var i, tabIdx: Integer;
    tab: TTabSheet;
begin
  Result:=true;
  for i:=Low(Edits) to High(Edits) do
  begin
    if Edits[i] is TCustomEdit then
    begin
      if TCustomEdit(Edits[i]).Text='' then
      begin
        // Активизируем таб с пустым Edit'ом
        if TCustomEdit(Edits[i]).Parent <> nil then
        begin
          if TCustomEdit(Edits[i]).Parent is TTabSheet then
          begin
            tab:=TTabSheet(TCustomEdit(Edits[i]).Parent);
            tabIdx:=tab.TabIndex;
            if tab.Parent <> nil then
              if tab.Parent is TPageControl then
                TPageControl(tab.Parent).TabIndex:=tabIdx;
          end;
          if TCustomEdit(Edits[i]).Parent is TGroupBox then
            if TCustomEdit(Edits[i]).Parent.Parent <> nil then
              if TCustomEdit(Edits[i]).Parent.Parent is TTabSheet then
              begin
                tab:=TTabSheet(TCustomEdit(Edits[i]).Parent.Parent);
                tabIdx:=tab.TabIndex;
                if tab.Parent <> nil then
                  if tab.Parent is TPageControl then
                    TPageControl(tab.Parent).TabIndex:=tabIdx;
              end;
        end;
        if Edits[i].CanFocus then
          Edits[i].SetFocus;

        Result:=false;
        break;

      end;
    end;   // if TCustomeEdit


    if Edits[i] is TComboBox then
    begin
      if TComboBox(Edits[i]).Text='' then
      begin
        // Активизируем таб с пустым Edit'ом
        if TComboBox(Edits[i]).Parent <> nil then
        begin
          if TComboBox(Edits[i]).Parent is TTabSheet then
          begin
            tab:=TTabSheet(TComboBox(Edits[i]).Parent);
            tabIdx:=tab.TabIndex;
            if tab.Parent <> nil then
              if tab.Parent is TPageControl then
                TPageControl(tab.Parent).TabIndex:=tabIdx;
          end;
          if TComboBox(Edits[i]).Parent is TGroupBox then
            if TComboBox(Edits[i]).Parent.Parent <> nil then
              if TComboBox(Edits[i]).Parent.Parent is TTabSheet then
              begin
                tab:=TTabSheet(TComboBox(Edits[i]).Parent.Parent);
                tabIdx:=tab.TabIndex;
                if tab.Parent <> nil then
                  if tab.Parent is TPageControl then
                    TPageControl(tab.Parent).TabIndex:=tabIdx;
              end;
        end;
        if Edits[i].CanFocus then
          Edits[i].SetFocus;

        Result:=false;
        break;

      end;
    end;   // if TComboBox



    if Edits[i] is TDateTimePicker then
    begin
      if TDateTimePicker(Edits[i]).ShowCheckbox then
          if not TDateTimePicker(Edits[i]).Checked then
          begin

            if Edits[i].CanFocus then
              Edits[i].SetFocus;

            Result:=false;
            break;
          end;
    end; // DateTime ..

    end; // FORa
end;




procedure TfrmTransportManagement.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmTransportManagement := nil;

   orderCodeList.Free;
   molCodeList.Free;
   dateStartList.Free;
   dateFinalList.Free;

   orderCodeList := nil;
   molCodeList := nil;
   dateStartList := nil;
   dateFinalList := nil;
  inherited;

end;

procedure TfrmTransportManagement.edtDateStartChange(Sender: TObject);
begin
  inherited;
  edtDateFinal.Date := edtDateStart.Date;

  // При изменении даты отчистим все гриды, чтобы
  // пользователи нажимали кнопку Пошук транспорту
  sgUnOrderedTransport.Clear;
  sgOrderedTransport.Clear;
  sgTKTransport.Clear;
  sgTKTransportReal.Clear;
  sgDrivers.Clear;
  sgTravelSheetCurrentDate.Clear;
  sgTravelSheetsPast.Clear;
  chbUnordered.Checked := false;
  RealTransportTimeLine.Items.Clear;



end;

procedure TfrmTransportManagement.edtDateFinalChange(Sender: TObject);
begin
  inherited;
  // При изменении даты отчистим все гриды, чтобы
  // пользователи нажимали кнопку Пошук транспорту
  sgUnOrderedTransport.Clear;
  sgOrderedTransport.Clear;
  sgTKTransport.Clear;
  sgTKTransportReal.Clear;
  sgDrivers.Clear;
  sgTravelSheetCurrentDate.Clear;
  sgTravelSheetsPast.Clear;
  chbUnordered.Checked := false;
  RealTransportTimeLine.Items.Clear;
  
end;

procedure TfrmTransportManagement.btnSearchRealTransportByOrderClick(
  Sender: TObject);
Var
transportRealCode : Integer;
transportRealFilter : TKTransportRealFilter;
begin
   try
        transportRealCode := Integer(sgOrderedTransport.Objects[0,sgOrderedTransport.Row]);
        isGroupByCategory := False;
        if transportRealCode = 0 then Exit
        else
        begin
       transportRealFilter := TKTransportRealFilter.Create;
      SetNullIntProps(transportRealFilter);
      SetNullXSProps(transportRealFilter);
      transportRealFilter.code :=  transportRealCode;
      updateTKTransportRealGrid(transportRealFilter);
      sgTKTransportRealClick(Sender);
      end;
   except
   on EConvertError do Exit;
  end;
end;

procedure TfrmTransportManagement.Button1Click(Sender: TObject);
begin
  inherited;
      updateTKTransportGrid();
end;

procedure TfrmTransportManagement.TBTKTransportUpdateClick(
  Sender: TObject);
begin
  inherited;
  updateTKTransportGrid;
end;

procedure TfrmTransportManagement.sgOrderedTransportCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
  var
   TempENTransportOrder : ENTransportOrderControllerSoapPort;
   transportOrderCode, orderCodeIndex, i : Integer;
   selectedOrder : ENTransportOrder;
   selectedWorkOrder : ENWorkOrder;
   dateStartPtr, dateFinalPtr : PDateTime;
   dateStartTime, dateFinalTime : TDateTime;
   orderNumberGen : String;
begin
     inherited;

  TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
  transportOrderCode := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);

  try

  begin



  if (ACol = 11) then
  begin
    if State then
    TempENTransportOrder.setApprove(transportOrderCode)
    else
    TempENTransportOrder.undoApprove(transportOrderCode);
  end;

    if (ACol = 12) then
  begin
    if State then
    TempENTransportOrder.setReject(transportOrderCode)
    else
    TempENTransportOrder.undoReject(transportOrderCode);
  end;

    if (ACol = 1) then
    begin
          if orderCodeList = nil then
              orderCodeList := TList.Create;
          if molCodeList = nil then
              molCodeList := TStringList.Create;
          if dateStartList = nil then
              dateStartList := TList.Create;
          if dateFinalList = nil then
              dateFinalList := TList.Create;
          if State then
          begin
            selectedOrder := TempENTransportOrder.getObject(transportOrderCode);
            selectedWorkOrder := DMReports.getWorkOrderByPlanCode(selectedOrder.planRef.code);

            {Проверка - если заявка не в статусе "Черновая", то
              не дать её выделить}
            if selectedOrder.transportOrderStatus.code <> ENTRANSPORTORDERSTATUS_GOOD then
            begin
              Application.MessageBox(PChar('Обирати можна тільки чорнові заявки!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
              sgOrderedTransport.SetCheckBoxState(ACol, ARow, false);
              Exit;
            end;

            {Запись дат заявки}
            dateStartTime:= EncodeDateTime(selectedOrder.timeStart.Year,
                                                  selectedOrder.timeStart.Month,
                                                  selectedOrder.timeStart.Day,
                                                  selectedOrder.timeStart.Hour,
                                                  selectedOrder.timeStart.Minute,
                                                  selectedOrder.timeStart.Second,
                                                  0);
            dateFinalTime := EncodeDateTime(selectedOrder.timeFinal.Year,
                                                  selectedOrder.timeFinal.Month,
                                                  selectedOrder.timeFinal.Day,
                                                  selectedOrder.timeFinal.Hour,
                                                  selectedOrder.timeFinal.Minute,
                                                  selectedOrder.timeFinal.Second,
                                                  0);


            if orderCodeList.Count > 0 then
            begin
                {Проверка периодов выбранных заявок и добавляемой}
                for i := 0 to orderCodeList.Count - 1 do
                begin
                    if
                    (
                    (dateFinalTime <= TDateTime(dateFinalList[i]^)) and
                    (dateStartTime >= TDateTime(dateStartList[i]^))
                    ) or
                    (
                    (dateFinalTime >= TDateTime(dateFinalList[i]^)) and
                    (dateStartTime <= TDateTime(dateStartList[i]^))
                    ) or
                    (
                    (dateFinalTime < TDateTime(dateFinalList[i]^)) and
                    (dateFinalTime > TDateTime(dateStartList[i]^))
                    ) or
                    (
                    (dateStartTime < TDateTime(dateFinalList[i]^)) and
                    (dateStartTime > TDateTime(dateStartList[i]^))
                    )or
                    (
                    (TDateTime(dateFinalList[i]^) < dateFinalTime) and
                    (TDateTime(dateFinalList[i]^) > dateStartTime)
                    )or
                    (
                    (TDateTime(dateStartList[i]^) < dateFinalTime) and
                    (TDateTime(dateStartList[i]^) > dateStartTime)
                    ) then
                    begin
                        orderNumberGen := selectedOrder.numbergen;
                        Application.MessageBox(PChar('Заявка № ' + orderNumberGen + ' перетинається з іншими виділеними заявками за часовим періодом'),
                              PChar('Увага!'),MB_ICONWARNING+MB_OK);
                        sgOrderedTransport.SetCheckBoxState(ACol, ARow, false);
                        Exit;
                    end;
                end;
            end;


            {Добавление сведений о заявке если флажок поставлен}
            orderCodeList.Add(Ptr(transportOrderCode));
            molCodeList.Add(selectedWorkOrder.finMolCode);
            New(dateStartPtr);
            dateStartPtr^ := dateStartTime;
            dateStartList.Add(dateStartPtr);
            New(dateFinalPtr);
            dateFinalPtr^ := dateFinalTime;
            dateFinalList.Add(dateFinalPtr);
          end
          else
          begin
            {Удаление сведений о заявке если флажок убран}
            orderCodeIndex := orderCodeList.IndexOf(Ptr(transportOrderCode));
            orderCodeList.Delete(orderCodeIndex);
            molCodeList.Delete(orderCodeIndex);
            dateStartList.Delete(orderCodeIndex);
            dateFinalList.Delete(orderCodeIndex);
          end;
    end;
  end;
  finally
  if ACol <> 1 then
    updateOrderedTransportGrid(toFilter);
 end;

end;

procedure TfrmTransportManagement.chbAvailableTransportClick(
  Sender: TObject);
begin
  inherited;
  isGroupByCategory := True;
  updateTKTransportRealGrid(nil);
end;

procedure TfrmTransportManagement.sgOrderedTransportClick(Sender: TObject);
var
    transportOrderCode : Integer;
begin
  inherited;
  if chbAvailableTransport.Checked = true then
    begin
      try
        transportOrderCode := Integer(sgOrderedTransport.Objects[3,sgOrderedTransport.Row]);
      except
        on EConvertError do Exit;
      end;

      updateTKTransportRealGrid(nil);
    end;


end;

procedure TfrmTransportManagement.chbNoTravelClick(Sender: TObject);
begin
  inherited;
  isGroupByCategory := True;
  updateTKTransportRealGrid(nil);
end;

function TfrmTransportManagement.initializeParameters : Boolean;
begin
  inherited;

  Result := true;

  {09/02/2012 - Проверка на заполненность полей Підрозділ и Дата заявок}
  if (not NoBlankValues([edtDateStart, edtDateFinal, edtDepartment])) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Result := false;
  end;

  orderDateStart := edtDateStart.Date;
  orderDateFinal := edtDateFinal.Date;

  if (orderDateFinal < orderDateStart) and (Result) then
  begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Result := false;
  end;

  if (transportDepartmentCode = LOW_INT) and (Result) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Result := false;
  end;
end;

end.
