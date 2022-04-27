
unit EditENTravelSheet;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetController,
  ENPlanWorkItemController, ENHumenItemController,
  ExtCtrls, TB2Item, TB2Dock, TB2Toolbar
  , TKTransportRealHistoryController, AdvObj, ENTravelSheetFuelRemainsController
  ;

type
  TSpeedometerData = array[1..2] of string;

  TfrmENTravelSheetEdit = class(TDialogForm)

    lblCode : TLabel;
	edtCode : TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    pcTravelSheet: TPageControl;
    tsTravelSheet: TTabSheet;
    lblNumberGen: TLabel;
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    lblSpeedometerStart: TLabel;
    lblSpeedometerFinal: TLabel;
    lblCommentGen: TLabel;
    spbENDepartmentDepartment: TSpeedButton;
    lblENDepartmentDepartmentName: TLabel;
    spbTKTransportRealTransportReal: TSpeedButton;
    lblTKTransportRealTransportRealName: TLabel;
    spbFINWorkerFinWorker: TSpeedButton;
    lblFINWorkerFinWorkerName: TLabel;
    edtNumberGen: TEdit;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    edtSpeedometerStart: TEdit;
    edtSpeedometerFinal: TEdit;
    edtTimeStart: TDateTimePicker;
    edtTimeFinal: TDateTimePicker;
    edtCommentGen: TMemo;
    edtENDepartmentDepartmentName: TEdit;
    edtTKTransportRealTransportRealName: TEdit;
    edtFINWorkerFinWorkerName: TEdit;
    HTTPRIOENTravelSheet: THTTPRIO;
    tsTravelSheetItemPlan: TTabSheet;
    btnOk: TButton;
    btnCancel: TButton;
    cbTravelSheetType: TComboBox;
    lblENTravelSheetType: TLabel;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    HTTPRIOENTravelSheetItem: THTTPRIO;
    ToolBar1: TToolBar;
    tbViewPlan: TToolButton;
    tbEditPlan: TToolButton;
    ToolButton11: TToolButton;
    sgENTravelSheetItemPlan: TAdvStringGrid;
    cbENTravelWorkMode: TComboBox;
    lblENTravelWorkMode: TLabel;
    tsTravelSheetItemFact: TTabSheet;
    ToolBar2: TToolBar;
    tbViewFact: TToolButton;
    tbEditFact: TToolButton;
    tbUpdateFact: TToolButton;
    sgENTravelSheetItemFact: TAdvStringGrid;
    gbTrailter: TGroupBox;
    lblTKTransportRealTrailer1Name: TLabel;
    lblTKTransportRealTrailer2Name: TLabel;
    edtTKTransportRealTrailer2Name: TEdit;
    edtTKTransportRealTrailer1Name: TEdit;
    spbTKTransportRealTrailer1: TSpeedButton;
    spbTKTransportRealTrailer2: TSpeedButton;
    tsFuel: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    tbInsertFuel: TToolButton;
    tbDeleteFuel: TToolButton;
    tbEditFuel: TToolButton;
    ToolButton10: TToolButton;
    sgENTravelSheetFuel: TAdvStringGrid;
    tsFuelRemain: TTabSheet;
    HTTPRIOENTravelSheetFuel: THTTPRIO;
    HTTPRIOENTravelSheetFuelRemains: THTTPRIO;
    ToolBar4: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    sgENTravelSheetFuelRemains: TAdvStringGrid;
    spbTKTransportRealTrailer1Clear: TSpeedButton;
    spbTKTransportRealTrailer2Clear: TSpeedButton;
    HTTPRIOTKTransportReal: THTTPRIO;
    edtTKTransportRealGosNumber: TEdit;
    lblFuelCounterStart: TLabel;
    edtFuelCounterStart: TEdit;
    lblFuelCounterFinal: TLabel;
    edtFuelCounterFinal: TEdit;
    lblGosNumber: TLabel;
    lblDriverSertificateNumber: TLabel;
    edtDriverSertificateNumber: TEdit;
    HTTPRIOTKDriverSertificate: THTTPRIO;
    HTTPRIOENTransportRealFuelRemains: THTTPRIO;
    actAddInClosed: TAction;
    actEditInClosed: TAction;
    fuelSummary: TPanel;
    lblEstimateCount: TLabel;
    edtEstimateCount: TEdit;
    lblFinmaterialsCount: TLabel;
    edtFinmaterialsCount: TEdit;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    lblFINWorkerFinWorkerName2: TLabel;
    edtFINWorkerFinWorkerName2: TEdit;
    spbFINWorkerFinWorker2: TSpeedButton;
    lblFINWorkerFinWorkerName3: TLabel;
    edtFINWorkerFinWorkerName3: TEdit;
    spbFINWorkerFinWorker3: TSpeedButton;
    HTTPRIOENPlanWork: THTTPRIO;
    gbTransportRoutes: TGroupBox;
    sgENTransportRoute: TAdvStringGrid;
    HTTPRIOENTransportRoute: THTTPRIO;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    actEditRouteDistance: TAction;
    actDeleteRouteDistance: TAction;
    TBItem2: TTBItem;
    HTTPRIOTKTransportRealHistory: THTTPRIO;
    edtHeatingTimeCount: TEdit;
    lblHeatingTimeCount: TLabel;
    chkIsMobiliztn: TCheckBox;
    TBItem3: TTBItem;
    actAddRoute: TAction;
    gbENTravelSheetFuelFill: TGroupBox;
    sgENTravelSheetFuelFill: TAdvStringGrid;
    HTTPRIOENTravelSheetFuelFill: THTTPRIO;
    TBItem4: TTBItem;
    actEditRoute: TAction;
    btnPrint: TButton;
    btnPrintDodatok: TButton;
    btnPrintNewVers: TButton;
    btn1: TButton;
    edtUserGen: TEdit;
    lblUserGen: TLabel;
    lblInvNumber: TLabel;
    edtTKTransportRealInvNumber: TEdit;
    edtReg_id: TEdit;
    lblReg_id: TLabel;
    btnCreateTravelOrder: TToolButton;
    actCreateTravelOrder: TAction;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbTKTransportRealTransportRealClick(Sender : TObject);
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);
    procedure edtDateStartChange(Sender: TObject);
    procedure pcTravelSheetChange(Sender: TObject);
    procedure spbTKTransportRealTrailer1Click(Sender: TObject);
    procedure spbTKTransportRealTrailer2Click(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);

    procedure  disableControlsForSheet;
    procedure FormCreate(Sender: TObject);
    procedure cbTravelSheetTypeChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure spbTKTransportRealTrailer1ClearClick(Sender: TObject);
    procedure spbTKTransportRealTrailer2ClearClick(Sender: TObject);

    function checkRemainder(isException : Boolean) : boolean;

    function makeStartSpeedometer(tiCode : Integer; travelOrder: Integer) : TSpeedometerData;
    function makeFinalSpeedometer(tiCode : Integer) : TSpeedometerData;
    procedure btnPrintDodatokClick(Sender: TObject);

    function getDriverSertificateNumber(tabNumber : string) : string;
    procedure btnPrintNewVersClick(Sender: TObject);
    procedure actAddInClosedExecute(Sender: TObject);
    procedure spbFINWorkerFinWorker2Click(Sender: TObject);
    procedure spbFINWorkerFinWorker3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure sgENTravelSheetItemFactClick(Sender: TObject);
    procedure actEditRouteDistanceExecute(Sender: TObject);
    procedure actDeleteRouteDistanceExecute(Sender: TObject);
    procedure edtTimeStartChange(Sender: TObject);
    procedure edtTimeFinalChange(Sender: TObject);
    procedure actAddRouteExecute(Sender: TObject);
    procedure actEditRouteExecute(Sender: TObject);
    procedure printRouteOrder(isNeededMessage : Boolean);
    procedure sgENTravelSheetItemFactColumnSizing(Sender: TObject; ACol,
      ColumnSize: Integer);
    procedure actCreateTravelOrderExecute(Sender: TObject);
  private
    { Private declarations }
    isChange : Boolean;
    function checkPlanIsFilled(showAlertIfEmpty: boolean): boolean;
    procedure recalcSpeedometerFinalGLOBUS;
    procedure fillENTravelSheetFuelFills;
    function getTravelSheetRemains(notZeroOnStart : Boolean) : ENTravelSheetFuelRemainsShortList;
  public
    { Public declarations }
    isLastClosed : boolean;
    transportRealHistoryObj : TKTRansportRealHistory;

end;

var
  frmENTravelSheetEdit: TfrmENTravelSheetEdit;
  ENTravelSheetObj: ENTravelSheet;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowTKTransportReal
  ,TKTransportRealController
  ,ShowFINWorker
  ,FINWorkerController
, ENTravelSheetTypeController
 ,EditENTravelSheetItem
 , EditENTravelSheetItemFilter
, ENTravelSheetItemController, DMReportsUnit, FINWorkerKindController, 
  ENConsts, ENTravelWorkModeController, EditENTravelSheetItemSearch, 
  ENTravelSheetItemKindController, EditENTravelSheetFuel, 
  ENTravelSheetFuelController, TKFuelTypeController, 
  EditENTravelSheetFuelRemains,
  TKDriverSertificateController, ENTransportRealFuelRemainsController,
  ENTravelSheetStatusController, ENPlanWorkController, ENTransportRouteController,
  EditENTransportRoute, ENTravelSheetFuelFillController, ShowTravelOrder;

{uses  
    EnergyproController, EnergyproController2, ENTravelSheetController  ;
}
{$R *.dfm}

var

  ENTravelSheetItemPlanHeaders: array [1..7] of String =
        ( 'Код'
          //,'Маршрут звідки'
          ,'Маршрут куди'
          //,'Час прибуття'
          //,'Час вибуття'
          //,'Показання спідометра при виїзді'
          //,'Показання спідометра при поверненні'
          ,'№ наряд-завдання'
          ,'пробіг, км'
          ,'машиногодини'
          ,'Дата зміни'
          ,'користувач'
        );

  ENTravelSheetItemFactHeaders: array [1..15] of String =
        ( 'Код'
          ,'Маршрут звідки'
          ,'Маршрут куди'
          ,'№ наряд-завдання'
          ,'Дата наряд-завдання'
          //,'Час прибуття'
          //,'Час вибуття'
          ,'Показання спідометра при виїзді'
          ,'Показання спідометра при поверненні'
          ,'пробіг фактичний, км'
          ,'пробіг плановий, км'
          ,'Різниця план/факт, км'
          ,'машиногодини'

          ,'ПММ'
          ,'ПММ з ФК'

          ,'Дата зміни'
          ,'користувач'
        );

  ENTravelSheetFuelHeaders: array [1..8] of String =
        ( 'Код'
          ,'кількість'
          ,'Серія'
          ,'Номера'
          ,'Тип ПММ'
          ,'ВРТУ?'
          ,'Сторонє паливо'
          ,'Тип видачі'
        );

  ENTravelSheetFuelRemainsHeaders: array [1..17] of String =
        ( 'Код'
          ,'Дата'
          ,'кількість на початок'
          ,'ціна на початок'
          ,'вартість на початок'
          ,'кількість виданого'
          ,'ціна виданого'
          ,'вартість виданого'
          //,'кількість списаного'
          ,'кількість витраченого'
          //,'ціна списаного'
          ,'ціна витраченого'
          //,'вартість списаного'
          ,'вартість витраченого'
          ,'кількість на кінець'
          ,'ціна на кінець'
          ,'вартість на кінець'
          ,'Тип палива'
          ,'Сторонє паливо'
          ,'Тип залишку'
        );

  ENTransportRouteHeaders: array [1..14] of String =
        ( 'Код'
          ,'Откуда (код)'
          ,'Откуда (наименование)'
          ,'Куда (код)'
          ,'Куда (наименование)'
          ,'Дистанція, км.'
          ,'Маса, кг.'
          ,'Показання спідометра початкові'
          ,'Показання спідометра кінцеві'
          ,'Дистанція фактична, км.'
          ,'Показання лічільника початкові'
          ,'Показання лічільника кінцеві'
          ,'Дата зміни'
          ,'користувач'
        );

    ENTravelSheetFuelFillHeaders: array [1..4] of String =
        ( 'Код'
          ,'Дата та час заправки (злива)'
          ,'Обсяг, л.'
          ,'Дата та час зміни'
        );


function TfrmENTravelSheetEdit.getDriverSertificateNumber(tabNumber : string) : string;
var
   TempTKDriverSertificate: TKDriverSertificateControllerSoapPort;
   f : TKDriverSertificateFilter;
   l : TKDriverSertificateShortList;
begin

   Result := '';
   f := TKDriverSertificateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.tabNumber := tabNumber;
   TempTKDriverSertificate :=  HTTPRIOTKDriverSertificate as TKDriverSertificateControllerSoapPort;
   l := TempTKDriverSertificate.getScrollableFilteredList(f, 0, -1);
   if (l.totalCount > 0) then Result := Trim(l.list[0].sertificateNumber);
   
end;


procedure  TfrmENTravelSheetEdit.disableControlsForSheet();
begin
     DisableControls(
        [
          spbENDepartmentDepartment, spbTKTransportRealTransportReal
        ]
        , ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD);

        // 04.02.2014 - Юрчик общался с Председателем Правления - надо открыть даты
        // на редактирование в Черновых путевках и со статусом Формування планов
          DisableControls(
        [
          edtDateStart, edtDateFinal
        ]
        , (not (ENTravelSheetObj.statusRef.code in [TRAVEL_STATUS_GOOD, TRAVEL_STATUS_PLAN])));

        DisableControls([spbTKTransportRealTrailer1, spbTKTransportRealTrailer2
          , spbTKTransportRealTrailer1Clear, spbTKTransportRealTrailer2Clear],
           ((ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN))  );

        //DisableControls([edtDateStart, edtDateFinal], ((ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN)));

        DisableControls([spbFINWorkerFinWorker],
         //(ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN)
         //NET-1362
         ((ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN))
         );

         DisableControls([spbFINWorkerFinWorker2, spbFINWorkerFinWorker3],
         ((ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and ((ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN))) );

           DisableActions([actEditRouteDistance, actDeleteRouteDistance, actAddRoute], (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_FACT));

     DisableControls([cbTravelSheetType]);


end;


procedure TfrmENTravelSheetEdit.FormShow(Sender: TObject);
var
  lastSheet , prevSheet : ENTravelSheet;
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  TempTKTransportRealHistory: TKTransportRealHistoryControllerSoapPort;
begin

  pcTravelSheet.ActivePage := tsTravelSheet;
  SetFloatStyle([edtSpeedometerStart, edtSpeedometerFinal, edtFuelCounterStart, edtFuelCounterFinal]);

  {Получение данных про актуальную на дату путевого историю автотранспорта}
  TempTKTransportRealHistory := HTTPRIOTKTransportRealHistory as TKTransportRealHistoryControllerSoapPort;
  if ((ENTravelSheetObj <> nil)
  {SUPP-10114 Не надо вытаскивать транспортную историю при
  открытии формы редактирования путевого листа на вставку, т.к.
  при открытии формы на вставку еще не известна дата окончания путевого, т.е.
  dateFinal}
      and (DialogState <> dsInsert)
      and (ENTravelSheetObj.transportReal <> nil)
      and (ENTravelSheetObj.transportReal.code <> Low(Integer))) then
    Self.transportRealHistoryObj := TempTKTransportRealHistory.getHistory(ENTravelSheetObj.transportReal.code, ENTravelSheetObj.dateFinal);


  DisableControls([
      edtENDepartmentDepartmentName
      ,edtTKTransportRealTransportRealName
      ,edtTKTransportRealGosNumber
      ,edtTKTransportRealInvNumber
      ,edtReg_id
      ,edtFINWorkerFinWorkerName
      ,edtFINWorkerFinWorkerName2
      ,edtFINWorkerFinWorkerName3
      ////////////
      , edtNumberGen
      , edtTKTransportRealTrailer1Name
      , edtTKTransportRealTrailer2Name
      , edtCode
      , cbENTravelWorkMode
  ]);


  HideControls([lblDriverSertificateNumber, edtDriverSertificateNumber], ENTravelSheetObj.finWorker = nil);


  {
  if  (not isLastClosed) or ((ENTravelSheetObj.statusRef.code == TRAVEL_STATUS_PLAN) or (ENTravelSheetObj.statusRef.code == TRAVEL_STATUS_GOOD)) then
  begin
    HideControls([ lblSpeedometerStart, edtSpeedometerStart], not isLastClosed );
    // планы пусть вводят??
    //tsTravelSheetItemPlan.TabVisible := false;
    //tsTravelSheetItemFact.TabVisible := False;
    //tsFuel.TabVisible := false;
    //tsFuelRemain.TabVisible := False;
  end;
  }


  HideControls([lblFuelCounterStart, lblFuelCounterFinal, edtFuelCounterStart, edtFuelCounterFinal]);

  if ENTravelSheetObj.transportReal <> nil then
    if ENTravelSheetObj.transportReal.fuelCalcTypeRef <> nil then
      if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
        HideControls([lblFuelCounterStart, lblFuelCounterFinal, edtFuelCounterStart, edtFuelCounterFinal], false);

  if DialogState = dsInsert then
  begin
     tsTravelSheetItemPlan.TabVisible := False;
     tsTravelSheetItemFact.TabVisible := False;
     tsFuel.TabVisible := False;
     tsFuelRemain.TabVisible := False;

     edtTimeStart.Time := StrToTime('07:30');
     edtTimeStart.Checked := True;
     edtTimeFinal.Time := StrToTime('16:30');
     edtTimeFinal.Checked := True;
     edtNumberGen.Text := 'Auto';
     if (cbTravelSheetType.ItemIndex = 5) then edtSpeedometerStart.Text := '0';
     // залочим авто и водилу - пока не выберут Подразделение
     DisableControls([spbTKTransportRealTransportReal, spbFINWorkerFinWorker, spbFINWorkerFinWorker2, spbFINWorkerFinWorker3]);
     HideControls([btnPrint, lblSpeedometerFinal, edtSpeedometerFinal]);
     HideControls([lblFuelCounterFinal, edtFuelCounterFinal]);
  end;

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDepartmentDepartmentName
      ,spbENDepartmentDepartment
      ,edtTKTransportRealTransportRealName
      ,spbTKTransportRealTransportReal
      ,edtFINWorkerFinWorkerName
      ,spbFINWorkerFinWorker
      ,spbFINWorkerFinWorker2
      ,spbFINWorkerFinWorker3
      ,spbTKTransportRealTrailer1
      ,spbTKTransportRealTrailer2
      ,spbTKTransportRealTrailer1Clear
      ,spbTKTransportRealTrailer2Clear

      , edtDriverSertificateNumber

       ]);
     DisableActions([actInsert, actEdit, actDelete, actEditRouteDistance, actDeleteRouteDistance]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      //edtNumberGen, -
      edtDateStart
      ,edtDateFinal
      ,edtENDepartmentDepartmentName
      ,edtTKTransportRealTransportRealName
      ,edtFINWorkerFinWorkerName
      ,edtFINWorkerFinWorkerName2
      ,edtFINWorkerFinWorkerName3
      , edtDateStart
      , edtDateFinal

      ,edtSpeedometerStart
      ,edtFuelCounterStart

      , edtDriverSertificateNumber
      
     ]);

      // выдеренм последний лист ...
      if (ENTravelSheetObj <> nil) then
        if ENTravelSheetObj.transportReal <> nil then
          if ENTravelSheetObj.transportReal.code <> LOW_INT then
            if ENTravelSheetObj.timeStart <> nil then
            begin
              TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
              prevSheet := TempENTravelSheet.getPrevSheet(ENTravelSheetObj);
              //if (prevSheet = nil) then
              //begin
              lastSheet := TempENTravelSheet.getLastSheet(ENTravelSheetObj);
                //if (prevSheet <> nil) then lastSheet := prevSheet;
              //end;
            end;


     if ENTravelSheetObj.statusRef.code in [TRAVEL_STATUS_PLAN, TRAVEL_STATUS_GOOD] then
      if (prevSheet <> nil) then
      begin
        if (prevSheet.statusRef.code = TRAVEL_STATUS_GOOD) or
           (prevSheet.statusRef.code = TRAVEL_STATUS_PLAN) or
           (prevSheet.statusRef.code = TRAVEL_STATUS_FACT)
        then
          HideControls([ lblSpeedometerStart, edtSpeedometerStart, lblFuelCounterStart, edtFuelCounterStart])
        else
        begin
          DisableControls([edtSpeedometerStart, edtFuelCounterStart]);
          edtSpeedometerStart.Text := prevSheet.speedometerFinal.DecimalString;
          if  prevSheet.fuelCounterFinal <> nil then
            edtFuelCounterStart.Text := prevSheet.fuelCounterFinal.DecimalString;
        end;
      end
      else
      if (lastSheet <> nil) then
      begin
        if (lastSheet.statusRef.code = TRAVEL_STATUS_GOOD) or
           (lastSheet.statusRef.code = TRAVEL_STATUS_PLAN)
        then
          HideControls([ lblSpeedometerStart, edtSpeedometerStart, lblFuelCounterStart, edtFuelCounterStart], false)
        else
        begin

          DisableControls([edtSpeedometerStart, edtFuelCounterStart]);
          if (dialogState = dsInsert ) then
          begin
            if  lastSheet.speedometerFinal <> nil then
              edtSpeedometerStart.Text := lastSheet.speedometerFinal.DecimalString;
            if  lastSheet.fuelCounterFinal <> nil then
              edtFuelCounterStart.Text := lastSheet.fuelCounterFinal.DecimalString;
          end;
        end;
      end
      else
      begin
         HideControls([ lblSpeedometerStart, edtSpeedometerStart], False);
         if ENTravelSheetObj.transportReal <> nil then
          if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
            HideControls([lblFuelCounterStart, lblFuelCounterFinal, edtFuelCounterStart, edtFuelCounterFinal], false);
      end;

   end;

  if (DialogState = dsEdit) then
  begin
     disableControlsForSheet;
  end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      DisableControls([spbTKTransportRealTransportReal, spbENDepartmentDepartment]);

      if (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_PLAN) or (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_GOOD) then
      begin
        tsTravelSheetItemFact.TabVisible := False;
        HideControls([
                      lblSpeedometerFinal, edtSpeedometerFinal
                      //, lblFuelCounterFinal, edtFuelCounterFinal
                     ]);

        HideControls([lblFuelCounterStart, edtFuelCounterStart], (ENTravelSheetObj.transportReal.fuelCalcTypeRef.code <> TKFUELTYPECALC_BY_COUNTER) );

        tsTravelSheetItemPlan.TabVisible := True;
        tsFuel.TabVisible := True;
        tsFuelRemain.TabVisible := True;
      end;

      if (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT) or (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM) then
      begin
        //tsTravelSheetItemFact.TabVisible := False;
        DisableControls([
                           tbEditPlan
                          // нач показания уже залочены ..
                          , edtSpeedometerStart, edtFuelCounterStart
                        ]);
         if ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
                    DisableControls([tbInsertFuel, tbEditFuel, tbDeleteFuel]);

        sgENTravelSheetItemPlan.PopupMenu := nil;
        sgENTravelSheetFuel.PopupMenu := nil;
        HideControls([lblFuelCounterStart, edtFuelCounterStart, lblFuelCounterFinal, edtFuelCounterFinal ]
                      ,(ENTravelSheetObj.transportReal.fuelCalcTypeRef.code <> TKFUELTYPECALC_BY_COUNTER) );

          {NET-2962 Если у машины поставлен номер регистратора с СКТ "Глобус"
            тогда программа берет показатели оттуда и запрещаем редактировать}
          if transportRealHistoryObj <> nil then
          begin
            if (transportRealHistoryObj.reg_id <> Low(Integer)) and (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT) then
              if edtSpeedometerFinal.Visible = True then
              begin
                if edtSpeedometerFinal.Enabled <> False then
                begin
                  edtSpeedometerFinal.Enabled := False;
                end;
                // Если форма открывается для редактирования
                if DialogState = dsEdit then
                begin
                  if TempENTravelSheet = nil then TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
                  edtSpeedometerFinal.Text := TempENTravelSheet.getSpeedometerFinalByGlobus(ENTravelSheetObj).DecimalString;
                end;
            end;
          end;

      end;

      if (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM) then
      begin
        //tsTravelSheetItemFact.TabVisible := False;
        DisableControls([
                           tbEditFact
                          // нач показания уже залочены .. + конечные ...
                          , edtSpeedometerStart, edtFuelCounterStart
                          , edtSpeedometerFinal, edtFuelCounterFinal
                          , edtTimeStart, edtTimeFinal
                        ]);
        sgENTravelSheetItemFact.PopupMenu := nil;
      end;

      // 22.11.2011 NET-969 Для тракторов должны быть недоступны показания спидометра
      if (ENTravelSheetObj.typeRef.code = TRAVEL_TYPE_TRACTOR) then
      begin
        DisableControls([edtSpeedometerStart, edtSpeedometerFinal]);
      end;

      //////
      if ENTravelSheetObj.transportReal <> nil then
      begin
        Caption := 'Подорожній лист для ' + ENTravelSheetObj.transportReal.name+ ' на '
                                 + DateToStr(EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day));
      end;


      edtCode.Text := IntToStr(ENTravelSheetObj.code);

      edtNumberGen.Text := ENTravelSheetObj.numberGen;

      if ENTravelSheetObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if ENTravelSheetObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENTravelSheetObj.dateFinal.Year,ENTravelSheetObj.dateFinal.Month,ENTravelSheetObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;


    if ( ENTravelSheetObj.speedometerStart <> nil ) then
       edtSpeedometerStart.Text := ENTravelSheetObj.speedometerStart.decimalString
    else
       if  ( (ENTravelSheetObj.typeRef.code = TRAVEL_TYPE_TRACTOR)
              and (DialogState = dsEdit) ) then
          edtSpeedometerStart.Text := '0'
       else
          edtSpeedometerStart.Text := '';
    if ( ENTravelSheetObj.speedometerFinal <> nil ) then
       edtSpeedometerFinal.Text := ENTravelSheetObj.speedometerFinal.decimalString
    else
       if ( (ENTravelSheetObj.typeRef.code = TRAVEL_TYPE_TRACTOR)
             and (DialogState = dsEdit) ) then
       begin
          if ENTravelSheetObj.transportReal.reg_id = Low(Integer) then
            edtSpeedometerFinal.Text := '0'
       end
       else
       begin
          if ENTravelSheetObj.transportReal.reg_id = Low(Integer) then
            edtSpeedometerFinal.Text := '';
       end;

    if ( ENTravelSheetObj.fuelCounterStart <> nil ) then
       edtFuelCounterStart.Text := ENTravelSheetObj.fuelCounterStart.decimalString
    else
       edtFuelCounterStart.Text := ''; 
    if ( ENTravelSheetObj.fuelCounterFinal <> nil ) then
       edtFuelCounterFinal.Text := ENTravelSheetObj.fuelCounterFinal.decimalString
    else
       edtFuelCounterFinal.Text := ''; 


      if ENTravelSheetObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:= EncodeTime(ENTravelSheetObj.timeStart.Hour,ENTravelSheetObj.timeStart.Minute, 0, 0);
        //EncodeDate(ENTravelSheetObj.timeStart.Year,ENTravelSheetObj.timeStart.Month,ENTravelSheetObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;

      if ENTravelSheetObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:= EncodeTime(ENTravelSheetObj.timeFinal.Hour,ENTravelSheetObj.timeFinal.Minute, 0, 0);
         //EncodeDate(ENTravelSheetObj.timeFinal.Year,ENTravelSheetObj.timeFinal.Month,ENTravelSheetObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;

      
    MakeMultiline(edtCommentGen.Lines, ENTravelSheetObj.commentGen);
      if ENTravelSheetObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:= EncodeDate(ENTravelSheetObj.dateEdit.Year,ENTravelSheetObj.dateEdit.Month,ENTravelSheetObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
      
    edtUserGen.Text := ENTravelSheetObj.userGen;

    edtENDepartmentDepartmentName.Text := ENTravelSheetObj.department.name;
    edtTKTransportRealTransportRealName.Text := ENTravelSheetObj.transportReal.buhName;
    edtTKTransportRealGosNumber.Text := ENTravelSheetObj.transportReal.gosNumber;
    edtTKTransportRealInvNumber.Text := ENTravelSheetObj.transportReal.invNumber;

    if transportRealHistoryObj <> nil then
     if (transportRealHistoryObj.reg_id <> Low(Integer)) then
     edtReg_id.Text :=  IntToStr(transportRealHistoryObj.reg_id);

    // а вдруг нема еще этого Васи на авто ...
    if ENTravelSheetObj.finWorker <> nil then
    begin
      edtFINWorkerFinWorkerName.Text := ENTravelSheetObj.finWorker.name;
      // выдернем номер прав ...
      edtDriverSertificateNumber.Text := getDriverSertificateNumber(ENTravelSheetObj.finWorker.tabNumber);
      DisableControls([edtDriverSertificateNumber], (edtDriverSertificateNumber.Text <> '') or ( DialogState = dsView));
    end;

    if ENTravelSheetObj.finWorker_additional_1 <> nil then
    begin
      edtFINWorkerFinWorkerName2.Text := ENTravelSheetObj.finWorker_additional_1.name;
    end;

    if ENTravelSheetObj.finWorker_additional_2 <> nil then
    begin
      edtFINWorkerFinWorkerName3.Text := ENTravelSheetObj.finWorker_additional_2.name;
    end;

    edtTKTransportRealTrailer1Name.Text := ENTravelSheetObj.trailer1.name;
    edtTKTransportRealTrailer2Name.Text := ENTravelSheetObj.trailer2.name;


    if ENTravelSheetObj.typeRef <> nil then
    begin
       cbTravelSheetType.ItemIndex := ENTravelSheetObj.typeRef.code - 1;
       //HideControls([gbTrailter], cbTravelSheetType.ItemIndex <> 1); // прицепы только для Грузовиков ;)
       cbTravelSheetTypeChange(Sender);
    end;

    if ENTravelSheetObj.workModeRef <> nil then
    begin
      cbENTravelWorkMode.ItemIndex := ENTravelSheetObj.workModeRef.code - 1;
    end;

    if ENTravelSheetObj.isMobiliztn <> LOW_INT then
      begin
       if  ENTravelSheetObj.isMobiliztn = 1 then  chkIsMobiliztn.Checked := true
       else chkIsMobiliztn.Checked := false
      end;

  end;
end;



procedure TfrmENTravelSheetEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  newCode : Integer;
  driverSertificatNumber : string;
  TempTKDriverSertificate: TKDriverSertificateControllerSoapPort;
  driverSertificate : TKDriverSertificate;
  prevSheet : ENTravelSheet;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtENDepartmentDepartmentName
      ,edtTKTransportRealTransportRealName
      ,edtFINWorkerFinWorkerName
      //,edtFINWorkerFinWorkerName2
      //,edtFINWorkerFinWorkerName3

      , edtDateStart
      , edtDateFinal

      , edtTimeStart
      //, edtSpeedometerStart
      //, edtFuelCounterStart
      , edtDriverSertificateNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    // обязательные показания приборов ТОЛЬКО если закрыт предыдущий план ...

                  {24.05.2012 - Установка времени путевого листа - без которого при
                            вызове метода getPrevSheet возникнет java.lang.NullPointerException}
              if edtTimeStart.checked then
               begin
                 if ENTravelSheetObj.timeStart = nil then
                    ENTravelSheetObj.timeStart := TXSDateTime.Create;
                 ENTravelSheetObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));

                 if ENTravelSheetObj.dateStart <> nil then
                 begin
                      ENTravelSheetObj.timeStart.Day := ENTravelSheetObj.dateStart.Day;
                      ENTravelSheetObj.timeStart.Month := ENTravelSheetObj.dateStart.Month;
                      ENTravelSheetObj.timeStart.Year := ENTravelSheetObj.dateStart.Year;
                 end;
               end
               else
                 ENTravelSheetObj.timeStart := nil;

               if edttimeFinal.checked then
               begin
                 if ENTravelSheetObj.timeFinal = nil then
                    ENTravelSheetObj.timeFinal := TXSDateTime.Create;
                 ENTravelSheetObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));

                 if ENTravelSheetObj.dateFinal <> nil then
                 begin
                      ENTravelSheetObj.timeFinal.Day := ENTravelSheetObj.dateFinal.Day;
                      ENTravelSheetObj.timeFinal.Month := ENTravelSheetObj.dateFinal.Month;
                      ENTravelSheetObj.timeFinal.Year := ENTravelSheetObj.dateFinal.Year;
                 end;
               end
               else
                 ENTravelSheetObj.timeFinal := nil;


    TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
    prevSheet := TempENTravelSheet.getPrevSheet(ENTravelSheetObj);

    if prevSheet <> nil then
    begin

      if prevSheet.statusRef.code in [TRAVEL_STATUS_CLOSED, TRAVEL_STATUS_WRITINGOFF_GSM] then
      begin
          if not NoBlankValues([ edtSpeedometerStart ])  then
          begin
            Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            Action:=caNone;
            Exit;
          end;


        if ENTravelSheetObj.transportReal.fuelCalcTypeRef <> nil then
        begin
          if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
          begin
              if not NoBlankValues([edtFuelCounterStart])  then
              begin
                Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
                Action:=caNone;
                Exit;
              end;

              if ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT then
              begin
                  if not NoBlankValues([edtFuelCounterFinal])  then
                  begin
                    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
                    Action:=caNone;
                    Exit;
                  end
              end;
          end;
        end;

      end;

    end
    else
    begin

          if not NoBlankValues([ edtSpeedometerStart ])  then
          begin
            Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            Action:=caNone;
            Exit;
          end;


        if ENTravelSheetObj.transportReal.fuelCalcTypeRef <> nil then
        begin
          if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
          begin
              if not NoBlankValues([edtFuelCounterStart])  then
              begin
                Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
                Action:=caNone;
                Exit;
              end;

              if ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT then
              begin
                  if not NoBlankValues([edtFuelCounterFinal])  then
                  begin
                    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
                    Action:=caNone;
                    Exit;
                  end
              end;
          end;
        end;
        
    end;

    if ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT then
    begin

        if not NoBlankValues([
           edtTimeFinal
          , edtSpeedometerFinal
          //,edtFuelCounterFinal
         ])  then
        begin
          Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action:=caNone;
          Exit;
        end;

    end;

    //TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;


     ENTravelSheetObj.numberGen := edtNumberGen.Text;

     if edtdateStart.checked then
     begin
       if ENTravelSheetObj.dateStart = nil then
          ENTravelSheetObj.dateStart := TXSDate.Create;
       ENTravelSheetObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENTravelSheetObj.dateStart := nil;

     if edtdateFinal.checked then
     begin
       if ENTravelSheetObj.dateFinal = nil then
          ENTravelSheetObj.dateFinal := TXSDate.Create;
       ENTravelSheetObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENTravelSheetObj.dateFinal := nil;

     if (ENTravelSheetObj.speedometerStart = nil ) then
       ENTravelSheetObj.speedometerStart := TXSDecimal.Create;
     if edtSpeedometerStart.Text <> '' then
       ENTravelSheetObj.speedometerStart.decimalString := edtSpeedometerStart.Text
     else
       ENTravelSheetObj.speedometerStart := nil;

     if (ENTravelSheetObj.speedometerFinal = nil ) then
       ENTravelSheetObj.speedometerFinal := TXSDecimal.Create;
     if edtSpeedometerFinal.Text <> '' then
       ENTravelSheetObj.speedometerFinal.decimalString := edtSpeedometerFinal.Text
     else
       ENTravelSheetObj.speedometerFinal := nil;

     if (ENTravelSheetObj.fuelCounterStart = nil ) then
       ENTravelSheetObj.fuelCounterStart := TXSDecimal.Create;
     if edtFuelCounterStart.Text <> '' then
       ENTravelSheetObj.fuelCounterStart.decimalString := edtFuelCounterStart.Text
     else
       ENTravelSheetObj.fuelCounterStart := nil;

     if (ENTravelSheetObj.fuelCounterFinal = nil ) then
       ENTravelSheetObj.fuelCounterFinal := TXSDecimal.Create;
     if edtFuelCounterFinal.Text <> '' then
       ENTravelSheetObj.fuelCounterFinal.decimalString := edtFuelCounterFinal.Text
     else
       ENTravelSheetObj.fuelCounterFinal := nil;


     if edttimeStart.checked then
     begin
       if ENTravelSheetObj.timeStart = nil then
          ENTravelSheetObj.timeStart := TXSDateTime.Create;
       ENTravelSheetObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
     end
     else
       ENTravelSheetObj.timeStart := nil;

     if edttimeFinal.checked then
     begin
       if ENTravelSheetObj.timeFinal = nil then
          ENTravelSheetObj.timeFinal := TXSDateTime.Create;
       ENTravelSheetObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
     end
     else
       ENTravelSheetObj.timeFinal := nil;

     ENTravelSheetObj.commentGen := edtCommentGen.Text;

     if cbTravelSheetType.ItemIndex = -1 then
     begin
      Application.MessageBox(PChar('Виберіть тип подорожнього листа !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
     end;
     if ENTravelSheetObj.typeRef = nil then
        ENTravelSheetObj.typeRef := ENTravelSheetTypeRef.Create();
     ENTravelSheetObj.typeRef.code := cbTravelSheetType.ItemIndex + 1;

     if cbENTravelWorkMode.ItemIndex = -1 then
     begin
      Application.MessageBox(PChar('Виберіть режим роботи водія !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
     end;
     if ENTravelSheetObj.workModeRef = nil then
        ENTravelSheetObj.workModeRef := ENTravelWorkModeRef.Create();
     ENTravelSheetObj.workModeRef.code := cbENTravelWorkMode.ItemIndex + 1;


     if edtdateEdit.checked then
     begin
       if ENTravelSheetObj.dateEdit = nil then
          ENTravelSheetObj.dateEdit := TXSDateTime.Create;
       ENTravelSheetObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTravelSheetObj.dateEdit := nil;

     ENTravelSheetObj.userGen := edtUserGen.Text;

     if chkIsMobiliztn.Checked then
     ENTravelSheetObj.isMobiliztn := 1
     else ENTravelSheetObj.isMobiliztn := 0;

    // типа сохраняем номер прав ...
    if  ENTravelSheetObj.finWorker <> nil then
    begin
      driverSertificatNumber := '';
      try
        if edtDriverSertificateNumber.Text <> '' then
        begin
           if getDriverSertificateNumber(ENTravelSheetObj.finWorker.tabNumber) = '' then
           begin
             TempTKDriverSertificate :=  HTTPRIOTKDriverSertificate as TKDriverSertificateControllerSoapPort;

             driverSertificate := TKDriverSertificate.Create;
             SetNullIntProps(driverSertificate);
             SetNullXSProps(driverSertificate);

             driverSertificate.name := ENTravelSheetObj.finWorker.name;
             driverSertificate.tabNumber := ENTravelSheetObj.finWorker.tabNumber;
             driverSertificate.sertificateNumber := edtDriverSertificateNumber.Text;

             TempTKDriverSertificate.add(driverSertificate);
           end;
        end;
      except
        on E : Exception do
          Application.MessageBox(PChar('Номер водійського посвідчення не збережено ... !!!' + #13#10 + e.Message),PChar('Увага!'), MB_ICONWARNING+MB_OK);
      end;
    end;


    if DialogState = dsInsert then
    begin
      ENTravelSheetObj.code:=low(Integer);
      newCode := TempENTravelSheet.add(ENTravelSheetObj);
      ENTravelSheetObj := TempENTravelSheet.getObject(newCode);
      DialogState := dsEdit;
      FormShow(Sender);
      Action:=caNone;
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheet.save(ENTravelSheetObj);
    end;
  end;
end;


procedure TfrmENTravelSheetEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

  f:=  ENDepartmentFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.code := 1;
{
  if ENTravelSheetObj.department <> nil then
  begin
    f.code := ENTravelSheetObj.department.code;
  end;
}
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetObj.department = nil then ENTravelSheetObj.department := ENDepartment.Create();
               ENTravelSheetObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;

               tsTravelSheetItemPlan.TabVisible := False;
               tsTravelSheetItemFact.TabVisible := False;

               // изменили подразделение - в САД .. меняем все остальное ;)
               ENTravelSheetObj.transportReal := nil;
               edtTKTransportRealTransportRealName.Text:= '';

               ENTravelSheetObj.finWorker := nil;
               edtFINWorkerFinWorkerName.Text := '';

               ENTravelSheetObj.finWorker_additional_1 := nil;
               edtFINWorkerFinWorkerName2.Text := '';

               ENTravelSheetObj.finWorker_additional_2 := nil;
               edtFINWorkerFinWorkerName3.Text := '';

               ENTravelSheetObj.trailer1 := nil;
               ENTravelSheetObj.trailer2 := nil;
               edtTKTransportRealTrailer1Name.Text := '';
               edtTKTransportRealTrailer2Name.Text := '';


               DisableControls([spbTKTransportRealTransportReal, spbFINWorkerFinWorker, spbFINWorkerFinWorker2, spbFINWorkerFinWorker3], False);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

{
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetObj.department = nil then ENTravelSheetObj.department := ENDepartment.Create();
               //ENTravelSheetObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;



procedure TfrmENTravelSheetEdit.spbTKTransportRealTransportRealClick(Sender : TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   realTransportFilter : TKTransportRealFilter;
   prevTravelSheet : ENTravelSheet;
   str : string;
   TempTKTransportReal: TKTransportRealControllerSoapPort;
   trReal : TKTransportReal;
   isLastClosed : Boolean;
begin

   realTransportFilter := TKTransportRealFilter.Create;
   SetNullXSProps(realTransportFilter);
   SetNullIntProps(realTransportFilter);
   if ENTravelSheetObj.department <> nil then
   begin
      //realTransportFilter.departmentRef := ENDepartmentRef.Create;
      //realTransportFilter.departmentRef.code := ENTravelSheetObj.department.code;
      realTransportFilter.conditionSQL := 'tktransportreal.departmentrefcode in (' + DMReports.getDepartmentCodesDown( ENTravelSheetObj.department.code ) + ')'
   end;


   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal, realTransportFilter);
   try
      with frmTKTransportRealShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetObj.transportReal = nil then ENTravelSheetObj.transportReal := TKTransportReal.Create();
               ENTravelSheetObj.transportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               //edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
               edtTKTransportRealTransportRealName.Text := GetReturnValue(sgTKTransportReal,4);
               edtTKTransportRealGosNumber.Text := GetReturnValue(sgTKTransportReal,3);

               // тип листа из авто ...
               {  как заведут ... }
               try
                TempTKTransportReal := self.HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;
                //trReal := TempTKTransportReal.ge
                ENTravelSheetObj.transportReal := TempTKTransportReal.getObject(ENTravelSheetObj.transportReal.code);
                if ENTravelSheetObj.transportReal.travelSheetTypeRef.code = LOW_INT then
                begin
                   Application.MessageBox(PChar('Цей автомобіль можна використовувти лише як Причеп ...'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                   Self.ModalResult := mrNone;
                   Self.Close;
                   Exit;
                end;
                
                cbTravelSheetType.ItemIndex := ENTravelSheetObj.transportReal.travelSheetTypeRef.code - 1;
                DisableControls([cbTravelSheetType]);
               except
               end;

               if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
               begin
                   HideControls([lblFuelCounterStart, edtFuelCounterStart], False);
               end;
               
               Caption := 'Подорожній лист для ' + ENTravelSheetObj.transportReal.name;


               isLastClosed := true;
               //////////////////
               if edtdateStart.checked then
               begin
                 if ENTravelSheetObj.dateStart = nil then
                    ENTravelSheetObj.dateStart := TXSDate.Create;
                 ENTravelSheetObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
               end
               else
                 ENTravelSheetObj.dateStart := nil;

               if edtdateFinal.checked then
               begin
                 if ENTravelSheetObj.dateFinal = nil then
                    ENTravelSheetObj.dateFinal := TXSDate.Create;
                 ENTravelSheetObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
               end
               else
                 ENTravelSheetObj.dateFinal := nil;
              ////////////////////

              {24.05.2012 - Установка времени путевого листа - без которого при
                            вызове метода getPrevSheet возникнет java.lang.NullPointerException}
              if edttimeStart.checked then
               begin
                 if ENTravelSheetObj.timeStart = nil then
                    ENTravelSheetObj.timeStart := TXSDateTime.Create;
                 ENTravelSheetObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));

                 if ENTravelSheetObj.dateStart <> nil then
                 begin
                      ENTravelSheetObj.timeStart.Day := ENTravelSheetObj.dateStart.Day;
                      ENTravelSheetObj.timeStart.Month := ENTravelSheetObj.dateStart.Month;
                      ENTravelSheetObj.timeStart.Year := ENTravelSheetObj.dateStart.Year;
                 end;
               end
               else
                 ENTravelSheetObj.timeStart := nil;

               if edttimeFinal.checked then
               begin
                 if ENTravelSheetObj.timeFinal = nil then
                    ENTravelSheetObj.timeFinal := TXSDateTime.Create;
                 ENTravelSheetObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));

                 if ENTravelSheetObj.dateFinal <> nil then
                 begin
                      ENTravelSheetObj.timeFinal.Day := ENTravelSheetObj.dateFinal.Day;
                      ENTravelSheetObj.timeFinal.Month := ENTravelSheetObj.dateFinal.Month;
                      ENTravelSheetObj.timeFinal.Year := ENTravelSheetObj.dateFinal.Year;
                 end;
               end
               else
                 ENTravelSheetObj.timeFinal := nil;




               prevTravelSheet := DMReports.getPrevTravelSheet(ENTravelSheetObj);
               if  prevTravelSheet <> nil then
               begin
                 if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) and ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_WRITINGOFF_GSM ) then
                 begin
                   str := prevTravelSheet.numberGen;
                   Application.MessageBox(PChar('Попередній подорожній лист № ' + str + ' не Затверджено ... !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
                   //Self.ModalResult := mrNone;
                   //Self.Close;
                   //Exit;
                   isLastClosed := false;
                 end;

                 if isLastClosed then
                 begin
                   edtSpeedometerStart.Text := prevTravelSheet.speedometerFinal.DecimalString;
                   DisableControls([edtSpeedometerStart]);

                   if prevTravelSheet.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
                   begin
                     if prevTravelSheet.fuelCounterFinal <> nil then
                     begin
                       edtFuelCounterStart.Text := prevTravelSheet.fuelCounterFinal.DecimalString;
                       DisableControls([edtFuelCounterStart]);
                     end;
                   end;
                 end;

                 ENTravelSheetObj.workModeRef := ENTravelWorkModeRef.Create;
                 ENTravelSheetObj.workModeRef.code := prevTravelSheet.workModeRef.code;
                 cbENTravelWorkMode.ItemIndex :=  ENTravelSheetObj.workModeRef.code - 1;

                 { уже берем с марки  см ВЫШЕ ;)
                 ENTravelSheetObj.typeRef := ENTravelSheetTypeRef.Create;
                 ENTravelSheetObj.typeRef.code := prevTravelSheet.typeRef.code;
                 cbTravelSheetType.ItemIndex := ENTravelSheetObj.typeRef.code - 1;
                 }

                 // + типа работника выдернем ...
                 if ENTravelSheetObj.finWorker = nil then
                 begin
                   ENTravelSheetObj.finWorker := FINWorker.Create;
                   ENTravelSheetObj.finWorker.code :=  LOW_INT;
                   ENTravelSheetObj.finWorker.name := prevTravelSheet.finWorker.name ;
                   ENTravelSheetObj.finWorker.tabNumber := prevTravelSheet.finWorker.tabNumber ;
                   ENTravelSheetObj.finWorker.positionName := prevTravelSheet.finWorker.positionName ;
                   ENTravelSheetObj.finWorker.positionCode := prevTravelSheet.finWorker.positionCode ;
                   ENTravelSheetObj.finWorker.departmentName := prevTravelSheet.finWorker.departmentName ;
                   ENTravelSheetObj.finWorker.departmentCode := prevTravelSheet.finWorker.departmentCode ;
                   ENTravelSheetObj.finWorker.categor := prevTravelSheet.finWorker.categor ;
                   ENTravelSheetObj.finWorker.finCode := prevTravelSheet.finWorker.finCode ;
                   ENTravelSheetObj.finWorker.isSentAssignment := prevTravelSheet.finWorker.isSentAssignment ;
                   ENTravelSheetObj.finWorker.kindRef :=  FINWorkerKindRef.Create;
                   ENTravelSheetObj.finWorker.kindRef.code := prevTravelSheet.finWorker.kindRef.code ;
                   ENTravelSheetObj.finWorker.priceGen := TXSDecimal.Create;
                   ENTravelSheetObj.finWorker.priceGen.DecimalString := prevTravelSheet.finWorker.priceGen.DecimalString ;
                   edtFINWorkerFinWorkerName.Text := ENTravelSheetObj.finWorker.name;
                 end;
               end
               else
               begin
                 prevTravelSheet := DMReports.getLastTravelSheet(ENTravelSheetObj);
                 if  prevTravelSheet = nil then
                 begin
                   HideControls([lblSpeedometerStart, edtSpeedometerStart], False);
                   if  ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
                    HideControls([lblFuelCounterStart, edtFuelCounterStart], False);
                 end;
               end;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;



procedure TfrmENTravelSheetEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   condition : string;
begin

      f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

  // + типа только водители ???
  // MDAX-441
  if DMReports.UsesMDAXData then
  begin
    condition := DMReports.getDriversConditionForAX();

    if ENTravelSheetObj.department <> nil then
    begin
      //f.departmentCode := IntToStr(ENTravelSheetObj.department.code);
      AddCondition(condition , ' (hrmorganizationid in (' + DMReports.getAXDepartmentCodesDown(ENTravelSheetObj.department.code) + '))');
    end;
  end
  else begin
    condition := 'ps.post_id in ' + FKVODILA_POST_ID;

    if ENTravelSheetObj.department <> nil then
    begin
      //f.departmentCode := IntToStr(ENTravelSheetObj.department.code);
      AddCondition(condition , ' pd.Podr_Id in (' + DMReports.getDepartmentCodesDown(ENTravelSheetObj.department.code) + ' )');
    end;
  end;

   f.conditionSQL := condition;


   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal, f);
   try
      with frmFINWorkerShow do
      begin
        isShowCEO := true;
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin

            try
              if ENTravelSheetObj.finWorker = nil then
              begin
               ENTravelSheetObj.finWorker := FINWorker.Create;
               ENTravelSheetObj.finWorker.code := low(Integer);
              end;

              ENTravelSheetObj.finWorker.name := GetReturnValue(sgFINWorker,1);
              ENTravelSheetObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);
              ENTravelSheetObj.finWorker.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                ENTravelSheetObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                ENTravelSheetObj.finWorker.positionCode := LOW_INT;

              ENTravelSheetObj.finWorker.departmentName := GetReturnValue(sgFINWorker,5);
              ENTravelSheetObj.finWorker.departmentCode := (GetReturnValue(sgFINWorker,6));
              if ENTravelSheetObj.finWorker.priceGen = nil then ENTravelSheetObj.finWorker.priceGen := TXSDecimal.Create;
              ENTravelSheetObj.finWorker.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              ENTravelSheetObj.finWorker.kindRef := FINWorkerKindRef.Create;

              ENTravelSheetObj.finWorker.categor := LOW_INT;

              //if GetReturnValue(sgFINWorker,8) = '' then
              //begin
                ENTravelSheetObj.finWorker.kindRef.code := FINWORKER_KIND_OTHER;
              //end
              //else
              //begin
                //---if StrToInt(GetReturnValue(sgFINWorker,8)) =
              //  ENHumenItemObj.finWorker.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
              //end;

              if (GetReturnValue(sgFINWorker,9) <> '') then
                ENTravelSheetObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                ENTravelSheetObj.finWorker.finCode := LOW_INT;

              ENTravelSheetObj.finWorker.positionId := GetReturnValue(sgFINWorker,15);

              edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);

              // выдернем номер прав ...
              HideControls([lblDriverSertificateNumber, edtDriverSertificateNumber], ENTravelSheetObj.finWorker = nil);
              edtDriverSertificateNumber.Text := getDriverSertificateNumber(ENTravelSheetObj.finWorker.tabNumber);
              DisableControls([edtDriverSertificateNumber], edtDriverSertificateNumber.Text <> '');

            except
               on EConvertError do Exit;
            end;

          {
            try
               if ENTravelSheetObj.finWorker = nil then ENTravelSheetObj.finWorker := FINWorker.Create();
               ENTravelSheetObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
          }
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;



procedure TfrmENTravelSheetEdit.edtDateStartChange(Sender: TObject);
begin
  inherited;
  edtDateFinal.DateTime := edtDateStart.DateTime;
  tsTravelSheetItemPlan.TabVisible := False;
  tsTravelSheetItemFact.TabVisible := False;
end;

procedure TfrmENTravelSheetEdit.pcTravelSheetChange(Sender: TObject);
var
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  i: Integer;
  ENTravelSheetItemList: ENTravelSheetItemShortList;
  ENTravelSheetItemFilterObj : ENTravelSheetItemFilter;
  delta, distanceFact , finmaterialsCount, estimateCount, heatingTimeCount : Double;

  TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
  ENTravelSheetFuelList: ENTravelSheetFuelShortList;
  ENTravelSheetFuelFilterObj : ENTravelSheetFuelFilter;

  ENTravelSheetFuelRemainsList: ENTravelSheetFuelRemainsShortList;
begin
  inherited;

  if (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT ) and (pcTravelSheet.ActivePage <> tsTravelSheet) then
  begin
     if (((ENTravelSheetObj.speedometerFinal = nil) and (ENTravelSheetObj.typeRef.code <> TRAVEL_TYPE_TRACTOR))
        or (ENTravelSheetObj.timeStart = nil)
        or (ENTravelSheetObj.timeFinal = nil))
        and (DialogState <> dsView)
     then
     begin
          Application.MessageBox(PChar('Введіть показники спідометра при поверненні,  та час, а потім змінюйте строки ... !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          pcTravelSheet.ActivePage := tsTravelSheet;
          Exit;
     end;

     if  (ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER)
          and (ENTravelSheetObj.fuelCounterFinal = nil) then
     begin
          Application.MessageBox(PChar('Введіть показники лічільника палива при поверненні,  та час, а потім змінюйте строки ... !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          pcTravelSheet.ActivePage := tsTravelSheet;
     end;
  end;

  if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) then
  begin
    ClearGrid(sgENTravelSheetItemPlan);
    SetGridHeaders(ENTravelSheetItemPlanHeaders, sgENTravelSheetItemPlan.ColumnHeaders);

    ENTravelSheetItemFilterObj := ENTravelSheetItemFilter.Create;
    SetNullIntProps(ENTravelSheetItemFilterObj);
    SetNullXSProps(ENTravelSheetItemFilterObj);
    ENTravelSheetItemFilterObj.travelSheetRef := ENTravelSheetRef.Create;
    ENTravelSheetItemFilterObj.travelSheetRef.code := ENTravelSheetObj.code;
    ENTravelSheetItemFilterObj.kindRef := ENTravelSheetItemKindRef.Create;
    ENTravelSheetItemFilterObj.kindRef.code := TRAVELITEM_KIND_PLAN;

    TempENTravelSheetItem :=  HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
    ENTravelSheetItemList := TempENTravelSheetItem.getScrollableFilteredList(ENTravelSheetItemFilterObj,0,-1);



  if High(ENTravelSheetItemList.list) > -1 then
     sgENTravelSheetItemPlan.RowCount:=High(ENTravelSheetItemList.list)+2
  else
     sgENTravelSheetItemPlan.RowCount:=2;

   with sgENTravelSheetItemPlan do
    for i:=0 to High(ENTravelSheetItemList.list) do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        //Cells[1,i+1] := ENTravelSheetItemList.list[i].travelFrom;

        Cells[1,i+1] := ENTravelSheetItemList.list[i].travelTo;

        Cells[2, i + 1] := ENTravelSheetItemList.list[i].workOrderNumber;
        {
        if ENTravelSheetItemList.list[i].timeStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].timeStart);
        if ENTravelSheetItemList.list[i].timeFinal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].timeFinal);
        if ENTravelSheetItemList.list[i].speedometerStart = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTravelSheetItemList.list[i].speedometerStart.DecimalString;
        if ENTravelSheetItemList.list[i].speedometerFinal = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTravelSheetItemList.list[i].speedometerFinal.DecimalString;
        }

        if ENTravelSheetItemList.list[i].sumDistances = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENTravelSheetItemList.list[i].sumDistances.DecimalString;

        if ENTravelSheetItemList.list[i].sumMachineHours = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTravelSheetItemList.list[i].sumMachineHours.DecimalString;

        if ENTravelSheetItemList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].dateEdit);
          
        Cells[6,i+1] := ENTravelSheetItemList.list[i].userGen;

        sgENTravelSheetItemPlan.RowCount:=High(ENTravelSheetItemList.list)+2;
      end;
   sgENTravelSheetItemPlan.Row:=1;

  end;

  ////////////////////////////////

  if (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
  begin
    ClearGrid(sgENTravelSheetItemFact);
    SetGridHeaders(ENTravelSheetItemfactHeaders, sgENTravelSheetItemFact.ColumnHeaders);
    SetGridHeaders(ENTransportRouteHeaders, sgENTransportRoute.ColumnHeaders);


    {
    ENTravelSheetItemFilterObj := ENTravelSheetItemFilter.Create;
    SetNullIntProps(ENTravelSheetItemFilterObj);
    SetNullXSProps(ENTravelSheetItemFilterObj);
    ENTravelSheetItemFilterObj.travelSheetRef := ENTravelSheetRef.Create;
    ENTravelSheetItemFilterObj.travelSheetRef.code := ENTravelSheetObj.code;
    ENTravelSheetItemFilterObj.kindRef := ENTravelSheetItemKindRef.Create;
    ENTravelSheetItemFilterObj.kindRef.code := TRAVELITEM_KIND_FACT;
    }

    TempENTravelSheetItem :=  HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
    ENTravelSheetItemList := TempENTravelSheetItem.getListForFact( ENTravelSheetObj.code );

  estimateCount := 0;
  finmaterialsCount := 0;
  heatingTimeCount := 0;

  if High(ENTravelSheetItemList.list) > -1 then
     sgENTravelSheetItemFact.RowCount:=High(ENTravelSheetItemList.list)+2
  else
     sgENTravelSheetItemFact.RowCount:=2;

   with sgENTravelSheetItemFact do
    for i:=0 to High(ENTravelSheetItemList.list) do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetItemList.list[i].travelFrom;
        Cells[2,i+1] := ENTravelSheetItemList.list[i].travelTo;
        Cells[3, i+1] := ENTravelSheetItemList.list[i].workOrderNumber;

        if ENTravelSheetItemList.list[i].planRefDateStart <> nil then
          Cells[4, i+1] := XSDate2String(ENTravelSheetItemList.list[i].planRefDateStart)
        else
           Cells[4, i+1] := '';

        (*
        if ENTravelSheetItemList.list[i].timeStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := {XSDateTimeWithDate2String}XSDateTime2String(ENTravelSheetItemList.list[i].timeStart);
        if ENTravelSheetItemList.list[i].timeFinal = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := {XSDateTimeWithDate2String}XSDateTime2String(ENTravelSheetItemList.list[i].timeFinal);
        *)

        distanceFact := 0;
        delta := 0;

        if ENTravelSheetItemList.list[i].speedometerStart = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTravelSheetItemList.list[i].speedometerStart.DecimalString;
        if ENTravelSheetItemList.list[i].speedometerFinal = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTravelSheetItemList.list[i].speedometerFinal.DecimalString;

        if (ENTravelSheetItemList.list[i].speedometerStart <> nil) and (ENTravelSheetItemList.list[i].speedometerFinal <> nil) then
        begin
          distanceFact := Conv(StrToFloat(ENTravelSheetItemList.list[i].speedometerFinal.DecimalString) - StrToFloat(ENTravelSheetItemList.list[i].speedometerStart.DecimalString), 2);
          if ENTravelSheetItemList.list[i].sumDistances <> nil then
            delta := StrToFloat(ENTravelSheetItemList.list[i].sumDistances.DecimalString) - distanceFact;
        end;

        Cells[7, i + 1] := FloatToStr(distanceFact);

        if ENTravelSheetItemList.list[i].sumDistances = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENTravelSheetItemList.list[i].sumDistances.DecimalString;

        Cells[9,i+1] := FloatToStr(delta);

        if ENTravelSheetItemList.list[i].sumMachineHours = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENTravelSheetItemList.list[i].sumMachineHours.DecimalString;

        //////////////
        if ENTravelSheetItemList.list[i].estimateCount = nil then
          Cells[11,i+1] := ''
        else
        begin
          Cells[11,i+1] := ENTravelSheetItemList.list[i].estimateCount.DecimalString;
          estimateCount := estimateCount + Conv(StrToFloat(ENTravelSheetItemList.list[i].estimateCount.DecimalString), 2);
        end;

        if ENTravelSheetItemList.list[i].heatingTime <> nil then
            heatingTimeCount := heatingTimeCount + Conv(StrToFloat(ENTravelSheetItemList.list[i].heatingTime.DecimalString), 2);

        if ENTravelSheetItemList.list[i].finmaterialsCount = nil then
          Cells[12,i+1] := ''
        else
        begin
          Cells[12,i+1] := ENTravelSheetItemList.list[i].finmaterialsCount.DecimalString;
          finmaterialsCount := finmaterialsCount + Conv(StrToFloat(ENTravelSheetItemList.list[i].finmaterialsCount.DecimalString), 2);
        end;
        /////////////

        if ENTravelSheetItemList.list[i].dateEdit = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].dateEdit);

        Cells[14,i+1] := ENTravelSheetItemList.list[i].userGen;

        sgENTravelSheetItemFact.RowCount:=High(ENTravelSheetItemList.list)+2;
      end;
   sgENTravelSheetItemFact.Row:=1;

   edtEstimateCount.Text := FloatToStr(Conv(estimateCount,2));
   edtFinmaterialsCount.Text := FloatToStr(Conv(finmaterialsCount,2));
   edtHeatingTimeCount.Text := FloatToStr(Conv(heatingTimeCount,2));

   sgENTravelSheetItemFact.AutoSizeRows(True);

   sgENTravelSheetItemFactClick(Sender);

  end;

  /////////////////////////////////

  if pcTravelSheet.ActivePage = tsFuel then
  begin
     ClearGrid(sgENTravelSheetFuel);
     SetGridHeaders(ENTravelSheetFuelHeaders, sgENTravelSheetFuel.ColumnHeaders);
     TempENTravelSheetFuel :=  HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
     ENTravelSheetFuelFilterObj := ENTravelSheetFuelFilter.Create;
     SetNullIntProps(ENTravelSheetFuelFilterObj);
     SetNullXSProps(ENTravelSheetFuelFilterObj);
     ENTravelSheetFuelFilterObj.travelSheetRef := ENTravelSheetRef.Create;
     ENTravelSheetFuelFilterObj.travelSheetRef.code := ENTravelSheetObj.code;
     ENTravelSheetFuelList := TempENTravelSheetFuel.getScrollableFilteredList(ENTravelSheetFuelFilterObj, 0, -1);

  if High(ENTravelSheetFuelList.list) > -1 then
     sgENTravelSheetFuel.RowCount:=High(ENTravelSheetFuelList.list) + 2
  else
     sgENTravelSheetFuel.RowCount:=2;

   with sgENTravelSheetFuel do
    for i:=0 to High(ENTravelSheetFuelList.list) do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetFuelList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTravelSheetFuelList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENTravelSheetFuelList.list[i].countGen.DecimalString;
        Cells[2,i+1] := ENTravelSheetFuelList.list[i].series;
        Cells[3,i+1] := ENTravelSheetFuelList.list[i].numbers;
        
        Cells[4,i+1] := ENTravelSheetFuelList.list[i].fuelTypeName;

         if ENTravelSheetFuelList.list[i].isVRTU <> Low(Integer) then
            if ENTravelSheetFuelList.list[i].isVRTU = 1 then
               Cells[5, i+1] := 'ВРТУ'
            else
               Cells[5, i+1] := '';

         if (Assigned(ENTravelSheetFuelList.list[i].isThirdParty))
          and (ENTravelSheetFuelList.list[i].isThirdParty.AsBoolean) then
          Cells[6, i+1] := 'Так'
         else
          Cells[6, i+1] := '';

        if(transportRealHistoryObj.hasStarter = TKTRANSPORTREAL_HASSTARTER) then
          Cells[7, i+1] := ENTravelSheetFuelList.list[i].travelSheetFuelTypeRefName;

        sgENTravelSheetFuel.RowCount:= i + 2;
      end;
   sgENTravelSheetFuel.Row:=1;

   {SUPP-3605 Если у транспорта на заданный период не стоит признак пускового двигателя, то
     колонка с информацией прячется, дабы в лишний раз не вводить пользователей в заблуждение}
     if (Self.transportRealHistoryObj.hasStarter <> TKTRANSPORTREAL_HASSTARTER) then begin
          sgENTravelSheetFuel.HideColumn(sgENTravelSheetFuel.ColumnHeaders.IndexOf('Тип видачі'));
     end;

   fillENTravelSheetFuelFills;

  end;

  ////////////////////////////////
  if pcTravelSheet.ActivePage = tsFuelRemain then
  begin
      ClearGrid(sgENTravelSheetFuelRemains);
      SetGridHeaders(ENTravelSheetFuelRemainsHeaders, sgENTravelSheetFuelRemains.ColumnHeaders);

      ENTravelSheetFuelRemainsList := Self.getTravelSheetRemains(false);

      if High(ENTravelSheetFuelRemainsList.list) > -1 then
         sgENTravelSheetFuelRemains.RowCount:= High(ENTravelSheetFuelRemainsList.list)+2
      else
         sgENTravelSheetFuelRemains.RowCount:=2;

       with sgENTravelSheetFuelRemains do
        for i:=0 to High(ENTravelSheetFuelRemainsList.list) do
          begin
            Application.ProcessMessages;
            if ENTravelSheetFuelRemainsList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENTravelSheetFuelRemainsList.list[i].code)
            else
            Cells[0,i+1] := '';
            if ENTravelSheetFuelRemainsList.list[i].dateGen = nil then
              Cells[1,i+1] := ''
            else
              Cells[1,i+1] := XSDate2String(ENTravelSheetFuelRemainsList.list[i].dateGen);
            if ENTravelSheetFuelRemainsList.list[i].countGenStart = nil then
              Cells[2,i+1] := ''
            else
              Cells[2,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenStart.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].priceGenStart = nil then
              Cells[3,i+1] := ''
            else
              Cells[3,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenStart.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].sumGenStart = nil then
              Cells[4,i+1] := ''
            else
              Cells[4,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenStart.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].countGenIn = nil then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenIn.DecimalString;

            if ENTravelSheetFuelRemainsList.list[i].priceGenIn = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenIn.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].sumGenIn = nil then
              Cells[7,i+1] := ''
            else
              Cells[7,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenIn.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].countGenOut = nil then
              Cells[8,i+1] := ''
            else
              Cells[8,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenOut.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].priceGenOut = nil then
              Cells[9,i+1] := ''
            else
              Cells[9,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenOut.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].sumGenOut = nil then
              Cells[10,i+1] := ''
            else
              Cells[10,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenOut.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].countGenFinal = nil then
              Cells[11,i+1] := ''
            else
              Cells[11,i+1] := ENTravelSheetFuelRemainsList.list[i].countGenFinal.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].priceGenFinal = nil then
              Cells[12,i+1] := ''
            else
              Cells[12,i+1] := ENTravelSheetFuelRemainsList.list[i].priceGenFinal.DecimalString;
            if ENTravelSheetFuelRemainsList.list[i].sumGenFinal = nil then
              Cells[13,i+1] := ''
            else
              Cells[13,i+1] := ENTravelSheetFuelRemainsList.list[i].sumGenFinal.DecimalString;

            Cells[14,i+1] := ENTravelSheetFuelRemainsList.list[i].fuelTypeRefName;

            if (Assigned(ENTravelSheetFuelRemainsList.list[i].isThirdParty))
              and (ENTravelSheetFuelRemainsList.list[i].isThirdParty.AsBoolean) then
              Cells[15, i+1] := 'Так'
            else
              Cells[15, i+1] := '';

            if(transportRealHistoryObj.hasStarter = TKTRANSPORTREAL_HASSTARTER) then
              Cells[16, i+1] := ENTravelSheetFuelRemainsList.list[i].travelSheetFuelTypeRefName;

            sgENTravelSheetFuelRemains.RowCount:= i + 2;
          end;
       sgENTravelSheetFuelRemains.Row:=1;

      {SUPP-3605 Если у транспорта на заданный период не стоит признак пускового двигателя, то
     колонка с информацией прячется, дабы в лишний раз не вводить пользователей в заблуждение}
     if (Self.transportRealHistoryObj.hasStarter <> TKTRANSPORTREAL_HASSTARTER) then begin
          sgENTravelSheetFuelRemains.HideColumn(sgENTravelSheetFuelRemains.ColumnHeaders.IndexOf('Тип залишку'));
     end;
  end;


end;

function TfrmENTravelSheetEdit.getTravelSheetRemains(notZeroOnStart : Boolean) : ENTravelSheetFuelRemainsShortList;
var
  TempENTravelSheetFuelRemains : ENTravelSheetFuelRemainsControllerSoapPort;
  ENTravelSheetFuelRemainsFilterObj : ENTravelSheetFuelRemainsFilter;
  ENTravelSheetFuelRemainsList : ENTravelSheetFuelRemainsShortList;
begin
  TempENTravelSheetFuelRemains :=  HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
  ENTravelSheetFuelRemainsFilterObj := ENTravelSheetFuelRemainsFilter.Create;
  SetNullIntProps(ENTravelSheetFuelRemainsFilterObj);
  SetNullXSProps(ENTravelSheetFuelRemainsFilterObj);
  ENTravelSheetFuelRemainsFilterObj.travelSheetRef := ENTravelSheetRef.Create;
  ENTravelSheetFuelRemainsFilterObj.travelSheetRef.code := ENTravelSheetObj.code;
  if(notZeroOnStart) then ENTravelSheetFuelRemainsFilterObj.conditionSQL := 'countgenstart <> 0';
  ENTravelSheetFuelRemainsList := TempENTravelSheetFuelRemains.getScrollableFilteredList(ENTravelSheetFuelRemainsFilterObj, 0, -1);
  Result := ENTravelSheetFuelRemainsList;
end;

procedure TfrmENTravelSheetEdit.spbTKTransportRealTrailer1Click(
  Sender: TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   realTransportFilter : TKTransportRealFilter;
   sql : String;
begin

   realTransportFilter := TKTransportRealFilter.Create;
   SetNullXSProps(realTransportFilter);
   SetNullIntProps(realTransportFilter);
   // типа только ПРИЦЕПЫ ;) .. из ТКТранспортРеал ...
   // но тип ОЧЕЕЕНЬ далеко ...
   sql := 'tktransportreal.transportmarkcode in ' +
          '(select tktransportmark.code from tktransportmark where tktransportmark.transporttypecode = 75000011)';
   if ENTravelSheetObj.department <> nil then
   begin
      //realTransportFilter.departmentRef := ENDepartmentRef.Create;
      //realTransportFilter.departmentRef.code := ENTravelSheetObj.department.code;
      //realTransportFilter.conditionSQL := 'tktransportreal.departmentrefcode in (' + DMReports.getDepartmentCodesDown( ENTravelSheetObj.department.code ) + ')'
      AddCondition(sql, 'tktransportreal.departmentrefcode in (' + DMReports.getDepartmentCodesDown( ENTravelSheetObj.department.code ) + ')');
   end;

   realTransportFilter.conditionSQL := sql;
   
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal, realTransportFilter);
   try
      with frmTKTransportRealShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetObj.trailer1 = nil then ENTravelSheetObj.trailer1 := TKTransportReal.Create();
               ENTravelSheetObj.trailer1.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealTrailer1Name.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;

procedure TfrmENTravelSheetEdit.spbTKTransportRealTrailer2Click(
  Sender: TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   realTransportFilter : TKTransportRealFilter;
   sql : String;
begin

   realTransportFilter := TKTransportRealFilter.Create;
   SetNullXSProps(realTransportFilter);
   SetNullIntProps(realTransportFilter);
   // типа только ПРИЦЕПЫ ;) .. из ТКТранспортРеал ...
   // но тип ОЧЕЕЕНЬ далеко ...
   sql := 'tktransportreal.transportmarkcode in ' +
          '(select tktransportmark.code from tktransportmark where tktransportmark.transporttypecode = 75000011)';
   if ENTravelSheetObj.department <> nil then
   begin
      //realTransportFilter.departmentRef := ENDepartmentRef.Create;
      //realTransportFilter.departmentRef.code := ENTravelSheetObj.department.code;
      //realTransportFilter.conditionSQL := 'tktransportreal.departmentrefcode in (' + DMReports.getDepartmentCodesDown( ENTravelSheetObj.department.code ) + ')'
      AddCondition(sql, 'tktransportreal.departmentrefcode in (' + DMReports.getDepartmentCodesDown( ENTravelSheetObj.department.code ) + ')');
   end;

   realTransportFilter.conditionSQL := sql;

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal, realTransportFilter);
   try
      with frmTKTransportRealShow do
       begin
          DisableActions([actInsert, actEdit, actDelete]);
          if ShowModal = mrOk then
          begin
              try
                 if ENTravelSheetObj.trailer2 = nil then ENTravelSheetObj.trailer2 := TKTransportReal.Create();
                 ENTravelSheetObj.trailer2.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
                 edtTKTransportRealTrailer2Name.Text:=GetReturnValue(sgTKTransportReal,1);
              except
                 on EConvertError do Exit;
              end;
          end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;


function TfrmENTravelSheetEdit.checkRemainder(isException : Boolean) : boolean;
var
  TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
  remFilter :  ENTravelSheetFuelRemainsFilter;
  remArr : ENTravelSheetFuelRemainsController.ArrayOfInteger;

  TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
  trRemFilter : ENTransportRealFuelRemainsFilter;
  trRemArr : ENTransportRealFuelRemainsController.ArrayOfInteger;
  
begin
    Result := true;
    TempENTravelSheetFuelRemains :=  HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
    remFilter := ENTravelSheetFuelRemainsFilter.Create;
    SetNullIntProps(remFilter);
    SetNullXSProps(remFilter);
    remFilter.realTransport := TKTransportReal.Create;
    remFilter.realTransport.code := ENTravelSheetObj.transportReal.code;

    remFilter.travelSheetRef := ENTravelSheetRef.Create;
    remFilter.travelSheetRef.code := ENTravelSheetObj.code;

    remArr := TempENTravelSheetFuelRemains.getScrollableFilteredCodeArray(remFilter, 0, 1);
    if High(remArr) = -1 then
    begin
      // если вообще небыло путевых - остаток полюбому ввести ...
      TempENTransportRealFuelRemains :=  HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;
      trRemFilter := ENTransportRealFuelRemainsFilter.Create;
      
      SetNullIntProps(trRemFilter);
      SetNullXSProps(trRemFilter);
      trRemFilter.realTransport := TKTransportReal.Create;
      trRemFilter.realTransport.code := ENTravelSheetObj.transportReal.code;
      trRemArr := TempENTransportRealFuelRemains.getScrollableFilteredCodeArray(trRemFilter, 0, 1);

      if ( High(trRemArr) = -1 )   then
      begin
        Result := false;
        if ( isException ) then
        begin
          Application.MessageBox(PChar('Не знайдено початковий залишок палива на цьому транспортному засобі!'),
                  PChar('Увага !'),MB_ICONWARNING);
          pcTravelSheet.ActivePage := tsFuelRemain;
          actInsertExecute(nil);
        end;
      end;
      //Exit;

    end;

end;


procedure TfrmENTravelSheetEdit.actInsertExecute(Sender: TObject);
var
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  TempENTravelSheet: ENTravelSheetControllerSoapPort;

  TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;

  TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
  remFilter :  ENTravelSheetFuelRemainsFilter;
  remArr : ArrayOfInteger;
  prevSheet : ENTravelSheet;
  isClosed : boolean;
  remainsList : ENTravelSheetFuelRemainsShortList;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

    isClosed := false;
    prevSheet := TempENTravelSheet.getPrevSheet(ENTravelSheetObj);
    if (prevSheet = nil) then
      isClosed:= true
    else
    begin
       if (prevSheet.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM) or (prevSheet.statusRef.code = TRAVEL_STATUS_CLOSED) then
        isClosed := True;
    end;

  ///////////////////////////////////////////////////////////
  if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) or (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
  begin
  
		Application.MessageBox(PChar('Звідси заборонено додавати наряд-завдання у подорожні листи. Скористайтеся інтерфейсом "Управління транспортом"'),
                    PChar('Увага !'),MB_ICONWARNING);
		Exit;

    if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) then
    begin
      if not checkRemainder(isClosed) then
      begin
        if (prevSheet = nil) then
        begin
          ShowMessage('Залишки не знайдено !!!');
          Exit;
        end;
      end;
    end;

    {
    // проверим есть ли первоначальный ОСТАТОК ...
    // и закрыт ли предыдущий лист ...
    if (not checkRemainder(isLastClosed)) and ( isLastClosed ) then
    //if ()
    begin
      ShowMessage('Попередній лист не затверджено або залишки вже є ...');
      Exit;
    end;
    /////////////////
    }

        TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
        //ENTravelSheetItemObj:=ENTravelSheetItem.Create;

        try
          frmENTravelSheetItemEditSearch:=TfrmENTravelSheetItemEditSearch.Create(Application, dsInsert);

          frmENTravelSheetItemEditSearch.departmentCode := ENTravelSheetObj.department.code;
          frmENTravelSheetItemEditSearch.edtENDepartmentDepartmentName.Text := ENTravelSheetObj.department.name;

          frmENTravelSheetItemEditSearch.edtDateStart.Date := edtDateStart.Date;
          frmENTravelSheetItemEditSearch.edtDateFinal.Date := edtDateFinal.Date;

          if  (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_GOOD) or (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_PLAN) then
            frmENTravelSheetItemEditSearch.itemKind := TRAVELITEM_KIND_PLAN // ????
          else
          if  ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT then
          begin
            if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) then
            begin
              Application.MessageBox(PChar('Додавати можна тільки ФАКТИ ...'), PChar('Увага !'),MB_ICONWARNING);
              Exit;
            end;
            frmENTravelSheetItemEditSearch.itemKind := TRAVELITEM_KIND_FACT;
          end
          else
          begin
            Application.MessageBox(PChar('Подорожній лист затверджено ...'),
                    PChar('Увага !'),MB_ICONWARNING);
            Exit;
          end;

          frmENTravelSheetItemEditSearch.travelSheetObj := ENTravelSheetObj;

          frmENTravelSheetItemEditSearch.travelSheetCode := ENTravelSheetObj.code;
          frmENTravelSheetItemEditSearch.Caption := 'Пошук строк маршрутного листу для ' + ENTravelSheetObj.transportReal.name+ ' на '
                                 + DateToStr(EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day));
          try
            if frmENTravelSheetItemEditSearch.ShowModal = mrOk then
            begin
              //if ENTravelSheetItemObj<>nil then
              //    pcTravelSheetChange(Sender);
            end;
          finally
            frmENTravelSheetItemEditSearch.Free;
            frmENTravelSheetItemEditSearch:=nil;
          end;
        finally
          //ENTravelSheetItemObj.Free;
        end;
  end;

  ////////////////////////////////////////////
  if pcTravelSheet.ActivePage = tsFuel then
  begin
    // проверим есть ли первоначальный ОСТАТОК ...
    //if (not checkRemainder(isLastClosed)) and (isLastClosed) then Exit;

    if (prevSheet = nil) then
      if not checkRemainder(True) then Exit;

    /////////////////
      
      ENTravelSheetFuelObj:=ENTravelSheetFuel.Create;

      ENTravelSheetFuelObj.travelSheetRef := ENTravelSheetRef.Create;
      ENTravelSheetFuelObj.travelSheetRef.code := ENTravelSheetObj.code;

      ENTravelSheetFuelObj.realTransport := TKTransportReal.Create;
      ENTravelSheetFuelObj.realTransport.code := ENTravelSheetObj.transportReal.code;

      ENTravelSheetFuelObj.fuelType := TKFuelType.Create;
      remainsList := Self.getTravelSheetRemains(true);
      if(remainsList.totalCount > 0) then begin
        ENTravelSheetFuelObj.fuelType.code := remainsList.list[0].fuelTypeRefCode;
        ENTravelSheetFuelObj.fuelType.name := remainsList.list[0].fuelTypeRefName;
      end else begin
        ENTravelSheetFuelObj.fuelType := ENTravelSheetObj.transportReal.fuelType;
      end;

      ENTravelSheetFuelObj.dateGen := TXSDate.Create;

      ENTravelSheetFuelObj.dateGen.XSToNative(
        GetXSDate(
          EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day)
        )
      );

      
      try
        frmENTravelSheetFuelEdit:=TfrmENTravelSheetFuelEdit.Create(Application, dsInsert);
        try

          frmENTravelSheetFuelEdit.edtTKFuelTypeFuelTypeName.Text := ENTravelSheetFuelObj.fuelType.name;
          frmENTravelSheetFuelEdit.Caption := 'Видача ПММ на подорожній лист ' + ENTravelSheetObj.transportReal.name+ ' на '
                                 + DateToStr(EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day));
          frmENTravelSheetFuelEdit.transportRealHistoryObj := Self.transportRealHistoryObj;
          if frmENTravelSheetFuelEdit.ShowModal = mrOk then
          begin
            if ENTravelSheetFuelObj<>nil then
                //TempENTravelSheetFuel.add(ENTravelSheetFuelObj);
                //UpdateGrid(Sender);
          end;
        finally
          frmENTravelSheetFuelEdit.Free;
          frmENTravelSheetFuelEdit:=nil;
        end;
      finally
        ENTravelSheetFuelObj.Free;
      end;
  end;

  ///////////////////////////////

  ////////////////////////////////////////////
  if pcTravelSheet.ActivePage = tsFuelRemain then
  begin

    //if ( not isLastClosed) then Exit;
    if checkRemainder(false) then
    begin
      ShowMessage('Залишки вже введено ... закрийте попередній подорожній лист ...');
      Exit;
    end;

    ENTravelSheetFuelRemainsObj:=ENTravelSheetFuelRemains.Create;
    SetNullIntProps(ENTravelSheetFuelRemainsObj);
    ENTravelSheetFuelRemainsObj.travelSheetRef := ENTravelSheetRef.Create;
    ENTravelSheetFuelRemainsObj.travelSheetRef.code := ENTravelSheetObj.code;

    ENTravelSheetFuelRemainsObj.realTransport := TKTransportReal.Create;
    ENTravelSheetFuelRemainsObj.realTransport.code := ENTravelSheetObj.transportReal.code;

    ENTravelSheetFuelRemainsObj.fuelTypeRef := TKFuelTypeRef.Create;
    ENTravelSheetFuelRemainsObj.fuelTypeRef.code := ENTravelSheetObj.transportReal.transportmark.fueltype.code;


    try
      frmENTravelSheetFuelRemainsEdit:=TfrmENTravelSheetFuelRemainsEdit.Create(Application, dsInsert);
      try
        frmENTravelSheetFuelRemainsEdit.Caption := 'Залишки палива для ' + ENTravelSheetObj.transportReal.name;
        //frmENTravelSheetFuelRemainsEdit.cbFuelType.Text := ENTravelSheetObj.transportReal.transportmark.fueltype.name;
        frmENTravelSheetFuelRemainsEdit.edtTKFuelTypeFuelTypeName.Text := ENTravelSheetObj.transportReal.transportmark.fueltype.name;
        if frmENTravelSheetFuelRemainsEdit.ShowModal = mrOk then
        begin
          //if ENTravelSheetFuelRemainsObj<>nil then
              //TempENTravelSheetFuelRemains.add(ENTravelSheetFuelRemainsObj);
              //UpdateGrid(Sender);
        end
        else
        begin
          // нах если е ввелм остатки ...
          Application.MessageBox(PChar('Без залишків ПММ неможна формувати подорожні листи ...'),
                  PChar('Увага !'),MB_ICONWARNING);
          Self.ModalResult := mrNone;
          Exit;
        end;
      finally
        frmENTravelSheetFuelRemainsEdit.Free;
        frmENTravelSheetFuelRemainsEdit:=nil;
      end;
    finally
      ENTravelSheetFuelRemainsObj.Free;
    end;
  end;

  ///////////////////////////////


  ENTravelSheetObj := TempENTravelSheet.getObject(ENTravelSheetObj.code);
  disableControlsForSheet;
  pcTravelSheetChange(Sender);
  
end;

procedure TfrmENTravelSheetEdit.actViewExecute(Sender: TObject);
Var
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
  TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
begin
  inherited;

  if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) or (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
  begin

      TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
      try
         if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) then
           ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItemPlan.Cells[0,sgENTravelSheetItemPlan.Row]))
         else
         if (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
           ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItemFact.Cells[0,sgENTravelSheetItemFact.Row]))
         else
          Exit;

       except
       on EConvertError do Exit;
      end;

      frmENTravelSheetItemEdit:=TfrmENTravelSheetItemEdit.Create(Application, dsView);
      try
      
        frmENTravelSheetItemEdit.travelSheetStatus := ENTravelSheetObj.statusRef.code;
        frmENTravelSheetItemEdit.Caption := 'Строка маршрутного листу для ' + ENTravelSheetObj.transportReal.name + ' на '
                                 + DateToStr(EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day)) ;

        frmENTravelSheetItemEdit.travelSheetObj := ENTravelSheetObj;

        if frmENTravelSheetItemEdit.ShowModal= mrOk then
          begin
            //TempENTravelSheetItem.save(ENTravelSheetItemObj);
            //UpdateGrid(Sender);
            pcTravelSheetChange(Sender);
          end;
      finally
        frmENTravelSheetItemEdit.Free;
        frmENTravelSheetItemEdit:=nil;
      end;

  end;

  //////////////////////////////////
  if pcTravelSheet.ActivePage = tsFuel then
  begin

     TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
       try
         ENTravelSheetFuelObj := TempENTravelSheetFuel.getObject(StrToInt(sgENTravelSheetFuel.Cells[0,sgENTravelSheetFuel.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENTravelSheetFuelEdit:=TfrmENTravelSheetFuelEdit.Create(Application, dsView);
      frmENTravelSheetFuelEdit.transportRealHistoryObj := Self.transportRealHistoryObj;
      try
        if frmENTravelSheetFuelEdit.ShowModal= mrOk then
          begin
            //TempENTravelSheetFuel.save(ENTravelSheetFuelObj);
            //UpdateGrid(Sender);
          end;
      finally
        frmENTravelSheetFuelEdit.Free;
        frmENTravelSheetFuelEdit:=nil;
      end;

  end;


  if pcTravelSheet.ActivePage = tsFuelRemain then
  begin
    TempENTravelSheetFuelRemains := HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
    try
      ENTravelSheetFuelRemainsObj := TempENTravelSheetFuelRemains.getObject(StrToInt(sgENTravelSheetFuelRemains.Cells[0, sgENTravelSheetFuelRemains.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENTravelSheetFuelRemainsEdit := TfrmENTravelSheetFuelRemainsEdit.Create(Application, dsView);
    //frmENTravelSheetFuelRemainsEdit.
    try
      if frmENTravelSheetFuelRemainsEdit.ShowModal= mrOk then
      begin
      end;
    finally
      frmENTravelSheetFuelRemainsEdit.Free;
      frmENTravelSheetFuelRemainsEdit := nil;
    end;
  end;

  pcTravelSheetChange(Sender);
  
end;

procedure TfrmENTravelSheetEdit.actEditExecute(Sender: TObject);
Var
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
  speedometerStart, speedometerFinal  : string;
  fuelCounterStart, fuelCounterFinal  : string;
  TempENTransportRoute : ENTransportRouteControllerSoapPort;

begin
  inherited;

  if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) or (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
  begin
      TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
       try
         if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) then
           ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItemPlan.Cells[0,sgENTravelSheetItemPlan.Row]))
         else
         if (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
         begin
             ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItemFact.Cells[0,sgENTravelSheetItemFact.Row]));
             if ENTravelSheetItemObj.travelOrder = LOW_INT then
             begin
              Application.MessageBox(PChar('Встановіть порядок слідування!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
             end;
         end
         else
          Exit;

       except
       on EConvertError do Exit;
      end;

      ENTransportRouteObj := nil;
      TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
      try
        ENTransportRouteObj := TempENTransportRoute.getObject(StrToInt(sgENTransportRoute.Cells[0,sgENTransportRoute.Row]));
      except
        on EConvertError do;
      end;


      frmENTravelSheetItemEdit:=TfrmENTravelSheetItemEdit.Create(Application, dsEdit);
      try
        // reg_id
        if (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
        frmENTravelSheetItemEdit.reg_id := transportRealHistoryObj.reg_id;

        // лочим конечные показания спидометра и счетчика топлива если есть маршрут
        // показания разносятся на маршруте
        if (ENTransportRouteObj <> nil) and (ENTransportRouteObj.code <> Low_int) then
           DisableControls([frmENTravelSheetItemEdit.edtSpeedometerFinal, frmENTravelSheetItemEdit.edtFuelCounterFinal]);

        frmENTravelSheetItemEdit.travelSheetStatus := ENTravelSheetObj.statusRef.code;
        frmENTravelSheetItemEdit.Caption := 'Строка маршрутного листу для ' + ENTravelSheetObj.transportReal.name + ' на '
                                 + DateToStr(EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day)) ;

        if  ENTravelSheetItemObj.speedometerStart = nil then
        begin
          speedometerStart := makeStartSpeedometer(ENTravelSheetItemObj.code, ENTravelSheetItemObj.travelOrder)[1];
          if speedometerStart <> '' then
          begin
            frmENTravelSheetItemEdit.edtSpeedometerStart.Text := speedometerStart;
            frmENTravelSheetItemEdit.DisableControls([frmENTravelSheetItemEdit.edtSpeedometerStart]);
          end;
        end;

        if  ENTravelSheetItemObj.fuelCounterStart = nil then
        begin
          fuelCounterStart := makeStartSpeedometer(ENTravelSheetItemObj.code, ENTravelSheetItemObj.travelOrder)[2];
          if fuelCounterStart <> '' then
          begin
            frmENTravelSheetItemEdit.edtFuelCounterStart.Text := fuelCounterStart;
            frmENTravelSheetItemEdit.DisableControls([frmENTravelSheetItemEdit.edtFuelCounterStart]);
          end;
        end;

        if  ENTravelSheetItemObj.speedometerFinal = nil then
        begin
          speedometerFinal := makeFinalSpeedometer(ENTravelSheetItemObj.code)[1];
          if speedometerFinal <> '' then
          begin
            frmENTravelSheetItemEdit.edtSpeedometerFinal.Text := speedometerFinal;
            frmENTravelSheetItemEdit.DisableControls([frmENTravelSheetItemEdit.edtSpeedometerFinal]);
          end;
        end;

        if  ENTravelSheetItemObj.fuelCounterFinal = nil then
        begin
          fuelCounterFinal := makeFinalSpeedometer(ENTravelSheetItemObj.code)[2];
          if fuelCounterFinal <> '' then
          begin
            frmENTravelSheetItemEdit.edtFuelCounterFinal.Text := fuelCounterFinal;
            frmENTravelSheetItemEdit.DisableControls([frmENTravelSheetItemEdit.edtFuelCounterFinal]);
          end;
        end;

        //TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
        //frmENTravelSheetItemEdit.travelSheetObj := TempENTravelSheet.getObject(ENTravelSheetObj.code);
        frmENTravelSheetItemEdit.travelSheetObj := ENTravelSheetObj;

        if frmENTravelSheetItemEdit.ShowModal= mrOk then
          begin
            //TempENTravelSheetItem.save(ENTravelSheetItemObj);
            //UpdateGrid(Sender);
            //pcTravelSheetChange(Sender);
          end;
      finally
        frmENTravelSheetItemEdit.Free;
        frmENTravelSheetItemEdit:=nil;
      end;

  end;

  //////////////////////////////////
  if pcTravelSheet.ActivePage = tsFuel then
  begin

     TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
       try
         ENTravelSheetFuelObj := TempENTravelSheetFuel.getObject(StrToInt(sgENTravelSheetFuel.Cells[0,sgENTravelSheetFuel.Row]));
       except
       on EConvertError do Exit;
      end;
      frmENTravelSheetFuelEdit:=TfrmENTravelSheetFuelEdit.Create(Application, dsEdit);
      try
          frmENTravelSheetFuelEdit.Caption := 'Видача ПММ на подорожній лист ' + ENTravelSheetObj.transportReal.name+ ' на '
                                 + DateToStr(EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day));
          frmENTravelSheetFuelEdit.transportRealHistoryObj := Self.transportRealHistoryObj;
        if frmENTravelSheetFuelEdit.ShowModal= mrOk then
          begin
            //TempENTravelSheetFuel.save(ENTravelSheetFuelObj);
            //UpdateGrid(Sender);
          end;
      finally
        frmENTravelSheetFuelEdit.Free;
        frmENTravelSheetFuelEdit:=nil;
      end;

  end;


  ///////////////////////////////
  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  ENTravelSheetObj := TempENTravelSheet.getObject(ENTravelSheetObj.code);
  disableControlsForSheet;
  pcTravelSheetChange(Sender);
  
end;



procedure TfrmENTravelSheetEdit.actAddRouteExecute(Sender: TObject);
var   TempENTransportRoute : ENTransportRouteControllerSoapPort;
      TempEnTravelSheetItem : ENTravelSheetItemControllerSoapPort;
begin

    TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
    try
      ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItemFact.Cells[0,sgENTravelSheetItemFact.Row]))
    except
      on EConvertError do Exit;
    end;

    TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
    ENTransportRouteObj := ENTransportRoute.Create;

    ENTransportRouteObj.distance := TXSDecimal.Create;
    ENTransportRouteObj.weight := TXSDecimal.Create;
    ENTransportRouteObj.dateEdit := TXSDateTime.Create;

    ENTransportRouteObj.planRef := ENPlanWorkRef.Create;
    ENTransportRouteObj.planRef.code := ENTravelSheetItemObj.planRef.code;

    try
      frmENTransportRouteEdit := TfrmENTransportRouteEdit.Create(Application, dsInsert);
      frmENTransportRouteEdit.ENPlanWorkCode := ENTravelSheetItemObj.planRef.code;
      frmENTransportRouteEdit.isTravelSheet := True;
      try
        if frmENTransportRouteEdit.ShowModal = mrOk then
        begin
          if ENTransportRouteObj <> nil then
            //TempENEstimateItem.add(ENEstimateItemObj);
             sgENTravelSheetItemFactClick(Sender);
        end;
      finally
        frmENTransportRouteEdit.Free;
        frmENTransportRouteEdit := nil;
      end;
    finally
      ENTransportRouteObj.Free;
    end;

end;

procedure TfrmENTravelSheetEdit.actCreateTravelOrderExecute(Sender: TObject);
var
   frmTravelOrderShow: TfrmTravelOrderShow;
   travelOrderFilter : ENTravelSheetItemFilter;
   TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;

   unOrderedItemsFilter : ENTravelSheetItemFilter;
   unOrderedItemsList : ENTravelSheetItemShortList;
   hasUnorderedItems : Boolean;
begin

   TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;

   hasUnorderedItems := False;

   unOrderedItemsFilter := ENTravelSheetItemFilter.Create;
   SetNullXSProps(unOrderedItemsFilter);
   SetNullIntProps(unOrderedItemsFilter);
   unOrderedItemsFilter.conditionSQL := ' ENTRAVELSHEETITEM.STATUSREFCODE <> 4' +
                                     ' and ENTRAVELSHEETITEM.travelorder is null' +
                                     ' and coalesce(entravelsheetitem.commentgen,'''') <> ''сумісна доставка''';
   unOrderedItemsFilter.travelSheetRef := ENTravelSheetRef.Create;
   unOrderedItemsFilter.travelSheetRef.code := ENTravelSheetObj.code;
   unOrderedItemsFilter.kindRef := ENTravelSheetItemKindRef.Create;
   unOrderedItemsFilter.kindRef.code := ENConsts.ENTRAVELSHEETKIND_FACT;
   unOrderedItemsList := TempENTravelSheetItem.getScrollableFilteredList(unOrderedItemsFilter, 0, -1);
   if (unOrderedItemsList.totalCount > 0) then
      hasUnorderedItems := True;

   if hasUnorderedItems then
   TempENTravelSheetItem.setOrder(ENTravelSheetObj.code);

   travelOrderFilter := ENTravelSheetItemFilter.Create;
   SetNullXSProps(travelOrderFilter);
   SetNullIntProps(travelOrderFilter);

   travelOrderFilter.conditionSQL := ' ENTRAVELSHEETITEM.STATUSREFCODE <> 4' +
                                     ' and coalesce(entravelsheetitem.commentgen,'''') <> ''сумісна доставка''';
   travelOrderFilter.travelSheetRef := ENTravelSheetRef.Create;
   travelOrderFilter.travelSheetRef.code := ENTravelSheetObj.code;
   travelOrderFilter.kindRef := ENTravelSheetItemKindRef.Create;
   travelOrderFilter.kindRef.code := ENConsts.ENTRAVELSHEETKIND_FACT;
   travelOrderFilter.orderBySQL := ' ENTRAVELSHEETITEM.travelorder';

    frmTravelOrderShow:= TfrmTravelOrderShow.Create(Application,fmNormal, travelOrderFilter);
   try
      with frmTravelOrderShow do
      begin
      if ShowModal = mrCancel then
        pcTravelSheetChange(Sender);
      end;
   finally
      frmTravelOrderShow.Free;
   end;

end;

procedure TfrmENTravelSheetEdit.actDeleteExecute(Sender: TObject);
Var
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
  TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
  ObjCode : Integer;
begin
  inherited;

  if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) or (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
  begin
      TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
      try

        if (pcTravelSheet.ActivePage = tsTravelSheetItemPlan) then
           ObjCode := StrToInt(sgENTravelSheetItemPlan.Cells[0,sgENTravelSheetItemPlan.Row])
        else
        if (pcTravelSheet.ActivePage = tsTravelSheetItemFact) then
           ObjCode := StrToInt(sgENTravelSheetItemFact.Cells[0,sgENTravelSheetItemFact.Row])
        else
          Exit;

       except
       on EConvertError do Exit;
      end;
      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити Строку маршрутного листа ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENTravelSheetItem.remove(ObjCode);
          //UpdateGrid(Sender);
      end;
  end;
  ////////////////////

  if pcTravelSheet.ActivePage = tsFuel then
  begin

     TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;
       try
         ObjCode := StrToInt(sgENTravelSheetFuel.Cells[0,sgENTravelSheetFuel.Row]);
       except
       on EConvertError do Exit;
      end;
      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити строку Видачі ПММ на подорожній лист ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENTravelSheetFuel.remove(ObjCode);
          //UpdateGrid(Sender);
      end;
  end;

  /////////////////////////////////

  if pcTravelSheet.ActivePage = tsFuelRemain then
  begin
      TempENTravelSheetFuelRemains := HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;
      try
         ObjCode := StrToInt(sgENTravelSheetFuelRemains.Cells[0,sgENTravelSheetFuelRemains.Row]);
       except
       on EConvertError do Exit;
      end;

      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити Залишок ПММ ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENTravelSheetFuelRemains.remove(ObjCode);
          //UpdateGrid(Sender);
      end;
  end;

  ///////////////////////////////
  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  ENTravelSheetObj := TempENTravelSheet.getObject(ENTravelSheetObj.code);
  disableControlsForSheet;
  pcTravelSheetChange(Sender);


end;

procedure TfrmENTravelSheetEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  pcTravelSheetChange(Sender);
end;


procedure TfrmENTravelSheetEdit.FormCreate(Sender: TObject);
begin
  inherited;
  isChange := False;
  isLastClosed := True;
  transportRealHistoryObj := nil;
end;

procedure TfrmENTravelSheetEdit.cbTravelSheetTypeChange(Sender: TObject);
begin
  inherited;
  HideControls([gbTrailter], cbTravelSheetType.ItemIndex <> 1); // прицепы только для Грузовиков ;)
  if cbTravelSheetType.ItemIndex <> 1 then
  begin
    spbTKTransportRealTrailer1ClearClick(Sender);
    spbTKTransportRealTrailer2ClearClick(Sender);
  end;
end;

procedure TfrmENTravelSheetEdit.btnPrintClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  tmp , tmp2 , tmpt, tmpt2 : string;
begin
  inherited;

  // Проверка, заполнены ли EnPlanWorkItem и ENHumenItem
  if not checkPlanIsFilled(true) then exit;

  SetLength(argNames, 1);
  SetLength(args, 1);
  argNames[0] := 'TravelSheet';
  args[0] := IntToStr(ENTravelSheetObj.code);
  tmp := '';
  tmp2 := '';
  tmpt := '';
  tmpt2 := '';
  case ENTravelSheetObj.typeRef.code of
  1: begin tmp := 'Automobile'; end;
  2 , 5, 7 : begin tmp := 'gruzovoy-vishka'; tmp2 := 'gruzovoy-vishka1'; end;
  3: begin tmp := 'kran'; tmp2 := 'kran1'; tmpt := 'kran-talon'; end;
  4: begin tmp := 'Automobile'; end;
  //5: begin tmp := 'gruzovoy-vishka'; tmp2 := 'gruzovoy-vishka1'; end;
  6: begin tmp := 'tractor'; tmp2 := 'tractor1'; end;
  // вышка?
  //7: begin tmp := 'gruzovoy-vishka'; tmp2 := 'gruzovoy-vishka1'; end;
  end;

  reportName := 'TravelSheets/';

  makeReport(reportName + tmp, argNames, args, 'pdf');
  if Length(tmp2) > 0 then
    makeReport(reportName + tmp2, argNames, args, 'pdf');
  if Length(tmpt) > 0 then
    makeReport(reportName + tmpt, argNames, args, 'pdf');
  if Length(tmpt2) > 0 then
    makeReport(reportName + tmpt2, argNames, args, 'pdf');

end;

procedure TfrmENTravelSheetEdit.spbTKTransportRealTrailer1ClearClick(
  Sender: TObject);
begin
  ENTravelSheetObj.trailer1 := nil;
  edtTKTransportRealTrailer1Name.Text := '';
end;

procedure TfrmENTravelSheetEdit.spbTKTransportRealTrailer2ClearClick(
  Sender: TObject);
begin
  ENTravelSheetObj.trailer2 := nil;
  edtTKTransportRealTrailer2Name.Text := '';
end;


function TfrmENTravelSheetEdit.makeStartSpeedometer(tiCode : Integer; travelOrder : Integer) : TSpeedometerData;
var
  i : integer;
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  tsiFilter : ENTravelSheetItemFilter;
  tsiList : ENTravelSheetItemShortList;
begin

  Result[1] := '';
  Result[2] := '';

  tsiFilter := ENTravelSheetItemFilter.Create;
  SetNullXSProps(tsiFilter);
  SetNullIntProps(tsiFilter);

  tsiFilter.travelSheetRef := ENTravelSheetRef.Create;
  tsiFilter.travelSheetRef.code := ENTravelSheetObj.code;
  tsiFilter.kindRef := ENTravelSheetItemKindRef.Create;
  tsiFilter.kindRef.code := TRAVELITEM_KIND_FACT;
  tsiFilter.conditionSQL := 'code <> '+ IntToStr(tiCode) + ' and speedometerstart is not null and travelorder is not null and travelorder < ' + IntToStr(travelOrder);
  tsiFilter.orderBySQL := 'travelorder asc';

  TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
  tsiList := TempENTravelSheetItem.getScrollableFilteredList(tsiFilter, 0, 1);
  if (tsiList.totalCount > 0) then
  begin
      Result[1] :=  tsiList.list[0].speedometerFinal.DecimalString;

      if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
        Result[2] := tsiList.list[0].fuelCounterFinal.DecimalString;
  end
  else
  begin
    if (ENTravelSheetObj.speedometerStart <> nil) then
       Result[1] := ENTravelSheetObj.speedometerStart.DecimalString;

    if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
    begin
        if ENTravelSheetObj.fuelCounterStart <> nil then
          Result[2] := ENTravelSheetObj.fuelCounterStart.DecimalString;
    end;
  end;
end;

function TfrmENTravelSheetEdit.makeFinalSpeedometer(tiCode : Integer) : TSpeedometerData;
var
  i : integer;
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  tsiFilter : ENTravelSheetItemFilter;
  tsiList : ENTravelSheetItemShortList;
begin

  Result[1] := '';
  Result[2] := '';

  tsiFilter := ENTravelSheetItemFilter.Create;
  SetNullXSProps(tsiFilter);
  SetNullIntProps(tsiFilter);

  tsiFilter.travelSheetRef := ENTravelSheetRef.Create;
  tsiFilter.travelSheetRef.code := ENTravelSheetObj.code;
  tsiFilter.kindRef := ENTravelSheetItemKindRef.Create;
  tsiFilter.kindRef.code := TRAVELITEM_KIND_FACT;
  tsiFilter.conditionSQL := 'code <> ' + IntToStr(tiCode) + ' and speedometerfinal is null';
  //tsiFilter.orderBySQL := 'speedometerfinal desc';

  TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
  tsiList := TempENTravelSheetItem.getScrollableFilteredList(tsiFilter, 0, 1);
  if High( tsiList.list) = -1 then
  begin
    if  ENTravelSheetObj.speedometerFinal <> nil then
      Result[1] :=  ENTravelSheetObj.speedometerFinal.DecimalString;

      if ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
      begin
          if ENTravelSheetObj.fuelCounterFinal <> nil then
            Result[2] := ENTravelSheetObj.fuelCounterFinal.DecimalString;
      end;
  end;
  
end;


procedure TfrmENTravelSheetEdit.btnPrintDodatokClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
begin

  // Проверка, заполнены ли EnPlanWorkItem и ENHumenItem
  if not checkPlanIsFilled(true) then exit;

  SetLength(argNames, 1);
  SetLength(args, 1);
  argNames[0] := 'TravelSheet';
  args[0] := IntToStr(ENTravelSheetObj.code);
    makeReport('TravelSheets/Dodatok/Dodatok_travelsheet', argNames, args, 'pdf');
end;

procedure TfrmENTravelSheetEdit.btnPrintNewVersClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  tmp , tmp2 , tmpt, tmpt2 : string;
  TempENTravelSheet : ENTravelSheetControllerSoapPort;
begin
  inherited;

  // Проверка, заполнены ли EnPlanWorkItem и ENHumenItem
  if not checkPlanIsFilled(true) then exit;

  SetLength(argNames, 1);
  SetLength(args, 1);
  argNames[0] := 'TravelSheet';
  args[0] := IntToStr(ENTravelSheetObj.code);
  tmp := '';
  tmp2 := '';
  tmpt := '';
  tmpt2 := '';
  case ENTravelSheetObj.typeRef.code of
  1: begin tmp := 'Automobile'; end;
  2 , 5, 7 : begin tmp := 'gruzovoy-vishka'; tmp2 := 'gruzovoy-vishka1'; end;
  3: begin tmp := 'kran'; tmp2 := 'kran1'; tmpt := 'kran-talon'; end;
  4: begin tmp := 'Automobile'; end;
  //5: begin tmp := 'gruzovoy-vishka'; tmp2 := 'gruzovoy-vishka1'; end;
  6: begin tmp := 'tractor'; tmp2 := 'tractor1'; end;
  // вышка?
  //7: begin tmp := 'gruzovoy-vishka'; tmp2 := 'gruzovoy-vishka1'; end;
  end;

  if ENTravelSheetObj.code = 500290031 then
     reportName := '!_services_92569/travel/'
  else reportName := 'TravelSheets/new/';

  makeReport(reportName + tmp, argNames, args, 'pdf');
  if Length(tmp2) > 0 then
    makeReport(reportName + tmp2, argNames, args, 'pdf');
  if Length(tmpt) > 0 then
    makeReport(reportName + tmpt, argNames, args, 'pdf');
  if Length(tmpt2) > 0 then
    makeReport(reportName + tmpt2, argNames, args, 'pdf');

    printRouteOrder(false);

    TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
    TempENTravelSheet.setIsPrinted(ENTravelSheetObj.code);

end;

procedure TfrmENTravelSheetEdit.actAddInClosedExecute(Sender: TObject);
begin

  frmENTravelSheetItemEditSearch:=TfrmENTravelSheetItemEditSearch.Create(Application, dsInsert);
  try
          frmENTravelSheetItemEditSearch.departmentCode := ENTravelSheetObj.department.code;
          frmENTravelSheetItemEditSearch.edtENDepartmentDepartmentName.Text := ENTravelSheetObj.department.name;

          frmENTravelSheetItemEditSearch.edtDateStart.Date := edtDateStart.Date;
          frmENTravelSheetItemEditSearch.edtDateFinal.Date := edtDateFinal.Date;

          if  (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_CLOSED) or (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM) then
            frmENTravelSheetItemEditSearch.itemKind := 1000 // ????
          else
          begin
             Application.MessageBox(PChar('Додавати можна тільки на затверджені ПЛ ...'), PChar('Увага !'),MB_ICONWARNING);
             Exit;
          end;

          frmENTravelSheetItemEditSearch.travelSheetObj := ENTravelSheetObj;

          frmENTravelSheetItemEditSearch.travelSheetCode := ENTravelSheetObj.code;
          frmENTravelSheetItemEditSearch.Caption := 'Пошук строк маршрутного листу для ' + ENTravelSheetObj.transportReal.name+ ' на '
                                 + DateToStr(EncodeDate(ENTravelSheetObj.dateStart.Year,ENTravelSheetObj.dateStart.Month,ENTravelSheetObj.dateStart.Day));


          if frmENTravelSheetItemEditSearch.ShowModal = mrOk then
          begin
              pcTravelSheetChange(Sender);
          end;

  finally
    frmENTravelSheetItemEditSearch.Free;
    frmENTravelSheetItemEditSearch:=nil;
  end;

end;

function TfrmENTravelSheetEdit.checkPlanIsFilled(showAlertIfEmpty: boolean): boolean;
var
   tempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
   fltrENPlanWorkItem: ENPlanWorkItemFilter;
   lstENPlanWorkItem: ENPlanWorkItemShortList;

   tempENHumenItem: ENHumenItemControllerSoapPort;
   fltrENHumenItem: ENHumenItemFilter;
   lstENHumenItem: ENHumenItemShortList;

begin

    tempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    fltrENPlanWorkItem := ENPlanWorkItemFilter.Create;
    SetNullIntProps(fltrENPlanWorkItem);
    SetNullXSProps(fltrENPlanWorkItem);
    fltrENPlanWorkItem.conditionSQL := 'ENPLANWORKITEM.CODE in (select pwi.code from entravelsheetitem tsi' +
        ' inner join enplanworkitem pwi on tsi.planrefcode = pwi.planrefcode' +
        ' where (tsi.kindrefcode = 1) and (pwi.countgen > 0) and (tsi.travelsheetrefcode = '
        + IntToStr(ENTravelSheetObj.code) + '))';
    lstENPlanWorkItem := tempENPlanWorkItem.getScrollableFilteredList(fltrENPlanWorkItem, 0, -1);

    if lstENPlanWorkItem.totalCount = 0 then
    begin
      if showAlertIfEmpty then
        Application.MessageBox(PChar('Перелік робіт не може бути порожнім! Завершіть формування завдання-плану!'), PChar('Скасовано!'), mb_iconerror);
      Result := false;
      exit;
    end;

    // Вторую проверку пока включать не нужно (21.12.2011)
    {tempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
    fltrENHumenItem := ENHumenItemFilter.Create;
    SetNullIntProps(fltrENHumenItem);
    SetNullXSProps(fltrENHumenItem);
    fltrENHumenItem.conditionSQL := 'ENHUMENITEM.CODE in (select hi.code from entravelsheetitem tsi' +
        ' inner join enhumenitem hi on tsi.planrefcode = hi.planrefcode' +
        ' inner join enplanworkitem pwi on hi.planitemrefcode = pwi.code' +
        ' where (tsi.kindrefcode = 1) and (hi.finworkercode is null)' +
        ' and (pwi.countgen > 0) and (tsi.travelsheetrefcode = '
        + IntToStr(ENTravelSheetObj.code) + '))';
    lstENHumenItem := tempENHumenItem.getScrollableFilteredList(fltrENHumenItem, 0, -1);

    if lstENHumenItem.totalCount <> 0 then
    begin
      if showAlertIfEmpty then
        Application.MessageBox(PChar('До всіх нормативних посад повинні бути прив"язані фактичні працівники! Завершіть формування завдання-плану!'), PChar('Скасовано!'), mb_iconerror);
      Result := false;
      exit;
    end;}

    Result := true;
end;

procedure TfrmENTravelSheetEdit.spbFINWorkerFinWorker2Click(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   condition : string;
begin

      f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

  // + типа только водители ???
  // MDAX-441
  if DMReports.UsesMDAXData then
  begin
    condition := DMReports.getDriversConditionForAX();

    if ENTravelSheetObj.department <> nil then
    begin
      //f.departmentCode := IntToStr(ENTravelSheetObj.department.code);
      AddCondition(condition , ' (hrmorganizationid in (' + DMReports.getAXDepartmentCodesDown(ENTravelSheetObj.department.code) + '))');
    end;
  end
  else begin
    condition := 'ps.post_id in ' + FKVODILA_POST_ID;

    if ENTravelSheetObj.department <> nil then
    begin
      //f.departmentCode := IntToStr(ENTravelSheetObj.department.code);
      AddCondition(condition , ' pd.Podr_Id in (' + DMReports.getDepartmentCodesDown(ENTravelSheetObj.department.code) + ' )');
    end;
  end;

   f.conditionSQL := condition;


   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal, f);
   try
      with frmFINWorkerShow do
      begin
        isShowCEO := true;
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin

            try
              if ENTravelSheetObj.finWorker_additional_1 = nil then
              begin
               ENTravelSheetObj.finWorker_additional_1 := FINWorker.Create;
               ENTravelSheetObj.finWorker_additional_1.code := low(Integer);
              end;

              ENTravelSheetObj.finWorker_additional_1.name := GetReturnValue(sgFINWorker,1);
              ENTravelSheetObj.finWorker_additional_1.tabNumber := GetReturnValue(sgFINWorker,2);
              ENTravelSheetObj.finWorker_additional_1.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                ENTravelSheetObj.finWorker_additional_1.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                ENTravelSheetObj.finWorker_additional_1.positionCode := LOW_INT;

              ENTravelSheetObj.finWorker_additional_1.departmentName := GetReturnValue(sgFINWorker,5);
              ENTravelSheetObj.finWorker_additional_1.departmentCode := (GetReturnValue(sgFINWorker,6));
              if ENTravelSheetObj.finWorker_additional_1.priceGen = nil then ENTravelSheetObj.finWorker_additional_1.priceGen := TXSDecimal.Create;
              ENTravelSheetObj.finWorker_additional_1.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              ENTravelSheetObj.finWorker_additional_1.kindRef := FINWorkerKindRef.Create;

              ENTravelSheetObj.finWorker_additional_1.categor := LOW_INT;

              //if GetReturnValue(sgFINWorker,8) = '' then
              //begin
                ENTravelSheetObj.finWorker_additional_1.kindRef.code := FINWORKER_KIND_OTHER;
              //end
              //else
              //begin
                //---if StrToInt(GetReturnValue(sgFINWorker,8)) =
              //  ENHumenItemObj.finWorker.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
              //end;

              if (GetReturnValue(sgFINWorker,9) <> '') then
                ENTravelSheetObj.finWorker_additional_1.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                ENTravelSheetObj.finWorker_additional_1.finCode := LOW_INT;

              ENTravelSheetObj.finWorker_additional_1.positionId := GetReturnValue(sgFINWorker,15);

              edtFINWorkerFinWorkerName2.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;

          {
            try
               if ENTravelSheetObj.finWorker = nil then ENTravelSheetObj.finWorker := FINWorker.Create();
               ENTravelSheetObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
          }
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENTravelSheetEdit.spbFINWorkerFinWorker3Click(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   condition : string;
begin

      f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

   // + типа только водители ???
  // MDAX-441
  if DMReports.UsesMDAXData then
  begin
    condition := DMReports.getDriversConditionForAX();

    if ENTravelSheetObj.department <> nil then
    begin
      //f.departmentCode := IntToStr(ENTravelSheetObj.department.code);
      AddCondition(condition , ' (hrmorganizationid in (' + DMReports.getAXDepartmentCodesDown(ENTravelSheetObj.department.code) + '))');
    end;
  end
  else begin
    condition := 'ps.post_id in ' + FKVODILA_POST_ID;

    if ENTravelSheetObj.department <> nil then
    begin
      //f.departmentCode := IntToStr(ENTravelSheetObj.department.code);
      AddCondition(condition , ' pd.Podr_Id in (' + DMReports.getDepartmentCodesDown(ENTravelSheetObj.department.code) + ' )');
    end;
  end;

   f.conditionSQL := condition;


   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal, f);
   try
      with frmFINWorkerShow do
      begin
        isShowCEO := true;
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin

            try
              if ENTravelSheetObj.finWorker_additional_2 = nil then
              begin
               ENTravelSheetObj.finWorker_additional_2 := FINWorker.Create;
               ENTravelSheetObj.finWorker_additional_2.code := low(Integer);
              end;

              ENTravelSheetObj.finWorker_additional_2.name := GetReturnValue(sgFINWorker,1);
              ENTravelSheetObj.finWorker_additional_2.tabNumber := GetReturnValue(sgFINWorker,2);
              ENTravelSheetObj.finWorker_additional_2.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                ENTravelSheetObj.finWorker_additional_2.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                ENTravelSheetObj.finWorker_additional_2.positionCode := LOW_INT;

              ENTravelSheetObj.finWorker_additional_2.departmentName := GetReturnValue(sgFINWorker,5);
              ENTravelSheetObj.finWorker_additional_2.departmentCode := (GetReturnValue(sgFINWorker,6));
              if ENTravelSheetObj.finWorker_additional_2.priceGen = nil then ENTravelSheetObj.finWorker_additional_2.priceGen := TXSDecimal.Create;
              ENTravelSheetObj.finWorker_additional_2.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              ENTravelSheetObj.finWorker_additional_2.kindRef := FINWorkerKindRef.Create;

              ENTravelSheetObj.finWorker_additional_2.categor := LOW_INT;

              //if GetReturnValue(sgFINWorker,8) = '' then
              //begin
                ENTravelSheetObj.finWorker_additional_2.kindRef.code := FINWORKER_KIND_OTHER;
              //end
              //else
              //begin
                //---if StrToInt(GetReturnValue(sgFINWorker,8)) =
              //  ENHumenItemObj.finWorker.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
              //end;

              if (GetReturnValue(sgFINWorker,9) <> '') then
                ENTravelSheetObj.finWorker_additional_2.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                ENTravelSheetObj.finWorker_additional_2.finCode := LOW_INT;

              ENTravelSheetObj.finWorker_additional_2.positionId := GetReturnValue(sgFINWorker,15);

              edtFINWorkerFinWorkerName3.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;

          {
            try
               if ENTravelSheetObj.finWorker = nil then ENTravelSheetObj.finWorker := FINWorker.Create();
               ENTravelSheetObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
          }
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENTravelSheetEdit.btn1Click(Sender: TObject);
begin
  printRouteOrder(true);
end;

procedure TfrmENTravelSheetEdit.sgENTravelSheetItemFactClick(Sender: TObject);
var
  i : Integer;
  TempENTransportRoute : ENTransportRouteControllerSoapPort;
  TempENTravelSheetItem : ENTravelSheetItemControllerSoapPort;
  transportRouteFilter : ENTransportRouteFilter;
  transportRouteList : ENTransportRouteShortList;
begin

    ClearGrid(sgENTransportRoute);
    TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
    SetGridHeaders(ENTransportRouteHeaders, sgENTransportRoute.ColumnHeaders);

    transportRouteFilter := ENTransportRouteFilter.Create;
    SetNullIntProps(transportRouteFilter);
    SetNullXSProps(transportRouteFilter);

    transportRouteFilter.planRef := ENPlanWorkRef.Create;

    TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
    try
       ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItemFact.Cells[0,sgENTravelSheetItemFact.Row]))
    except
       on EConvertError do Exit;
    end;

    if ENTravelSheetItemObj.planRef.code = LOW_INT then Exit;

    transportRouteFilter.planRef.code := ENTravelSheetItemObj.planRef.code;
    transportRouteList := TempENTransportRoute.getScrollableFilteredList(transportRouteFilter, 0, -1);

    if High(transportRouteList.list) > -1 then
       sgENTransportRoute.RowCount := High(transportRouteList.list) + 2
    else
       sgENTransportRoute.RowCount := 2;

     with sgENTransportRoute do
      for i := 0 to High(transportRouteList.list) do
        begin
          Application.ProcessMessages;

          if transportRouteList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(transportRouteList.list[i].code)
          else
          Cells[0,i+1] := '';

          if transportRouteList.list[i].elementInRefCode <> Low(Integer) then
          Cells[1,i+1] := IntToStr(transportRouteList.list[i].elementInRefCode)
          else
          Cells[1,i+1] := '';

          Cells[2,i+1] := transportRouteList.list[i].destinationPointStart;

          if transportRouteList.list[i].elementOutRefCode <> Low(Integer) then
          Cells[3,i+1] := IntToStr(transportRouteList.list[i].elementOutRefCode)
          else
          Cells[3,i+1] := '';

          Cells[4,i+1] := transportRouteList.list[i].destinationPointEnd;

          if transportRouteList.list[i].distance = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := transportRouteList.list[i].distance.DecimalString;

          if transportRouteList.list[i].weight = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := transportRouteList.list[i].weight.DecimalString;

          if transportRouteList.list[i].speedometerStart = nil then
            Cells[7,i+1] := ''
          else
            Cells[7,i+1] := transportRouteList.list[i].speedometerStart.DecimalString;

          if transportRouteList.list[i].speedometerFinal = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := transportRouteList.list[i].speedometerFinal.DecimalString;

          if transportRouteList.list[i].distanceNew = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := transportRouteList.list[i].distanceNew.DecimalString;

          if transportRouteList.list[i].fuelCounterStart = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := transportRouteList.list[i].fuelCounterStart.DecimalString;

          if transportRouteList.list[i].fuelCounterFinal = nil then
            Cells[11,i+1] := ''
          else
            Cells[11,i+1] := transportRouteList.list[i].fuelCounterFinal.DecimalString;

          sgENTransportRoute.RowCount := i + 2;
        end;

     sgENTransportRoute.Row := 1;
end;


procedure TfrmENTravelSheetEdit.sgENTravelSheetItemFactColumnSizing(
  Sender: TObject; ACol, ColumnSize: Integer);
begin
  inherited;
  sgENTravelSheetItemFact.AutoSizeRows(True);
end;

procedure TfrmENTravelSheetEdit.actEditRouteDistanceExecute(Sender: TObject);
var 
  TempENTransportRoute : ENTransportRouteControllerSoapPort;
  transportRouteList :  ENTransportRouteShortList;
  transportRouteFilter : ENTransportRouteFilter;
  TempENTravelSheetItem : ENTravelSheetItemControllerSoapPort;
  parentRouteCode : Integer;
  speedometerStart, fuelCounterStart : string;

  travelSheetItemList : ENTravelSheetItemShortList;
  travelSheetItemFilter : ENTravelSheetItemFilter;

begin

    TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
    try
      ENTransportRouteObj := TempENTransportRoute.getObject(StrToInt(sgENTransportRoute.Cells[0,sgENTransportRoute.Row]));
    except
      on EConvertError do Exit;
    end;

    TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
    try
      ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItemFact.Cells[0,sgENTravelSheetItemFact.Row]))
    except
      on EConvertError do Exit;
    end;


    //  пока непонятки с разноской !!!!!!!!!
    ///////////////////////////
    //parentRouteCode := DMReports.getParentRouteCode(ENTransportRouteObj.code);
    //
    //if (ENTransportRouteObj.speedometerFinal <> nil) and (parentRouteCode <> Low_int) then
    //begin
    //  Application.MessageBox(PChar('Есть маршруты !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    //  Exit;
    //end;
    ///////////////////////////


    transportRouteFilter := ENTransportRouteFilter.Create;
    SetNullIntProps(transportRouteFilter);
    SetNullXSProps(transportRouteFilter);

    transportRouteFilter.planRef := ENPlanWorkRef.Create;
    transportRouteFilter.planRef.code := ENTransportRouteObj.planRef.code;
    transportRouteFilter.conditionSQL := ' entransportroute.speedometerfinal = ' +
			 ' (select max(tr.speedometerfinal) from entransportroute tr where tr.planrefcode = ' + IntToStr(ENTransportRouteObj.planRef.code) + ')';

    transportRouteList := TempENTransportRoute.getScrollableFilteredList(transportRouteFilter, 0, -1);

    frmENTransportRouteEdit := TfrmENTransportRouteEdit.Create(Application, dsEdit);

    SetFloatStyle([frmENTransportRouteEdit.edtSpeedometerStart, frmENTransportRouteEdit.edtSpeedometerFinal]);
    DenyBlankValues([frmENTransportRouteEdit.edtSpeedometerStart, frmENTransportRouteEdit.edtSpeedometerFinal, frmENTransportRouteEdit.edtSumDistanceFact]);
    HideControls([frmENTransportRouteEdit.lblCommentGen, frmENTransportRouteEdit.edtCommentGen]);
    DisableControls([frmENTransportRouteEdit.spbENDestinationPointStart, frmENTransportRouteEdit.spbENDestinationPointEnd,
        frmENTransportRouteEdit.edtENDestinationPointStart, frmENTransportRouteEdit.edtENDestinationPointEnd,
        frmENTransportRouteEdit.edtDistance, frmENTransportRouteEdit.edtWeight,
        frmENTransportRouteEdit.edtSpeedometerStart, frmENTransportRouteEdit.edtSpeedometerFinal {, frmENTransportRouteEdit.edtSumDistanceFact}]);

    frmENTransportRouteEdit.lblSpeedometerStart.Top := 170;
    frmENTransportRouteEdit.lblSpeedometerFinal.Top := 170;
    frmENTransportRouteEdit.edtSpeedometerStart.Top := 175;
    frmENTransportRouteEdit.edtSpeedometerFinal.Top := 175;
    frmENTransportRouteEdit.lblSumDistanceFact.Top := 100;
    frmENTransportRouteEdit.edtSumDistanceFact.Top := 130;


    // если расчет топлива по счетчику
    if (ENTravelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER) then
    begin

      frmENTransportRouteEdit.fuelCalcByCounter := True;

      SetFloatStyle([frmENTransportRouteEdit.edtFuelCounterStart, frmENTransportRouteEdit.edtFuelCounterFinal]);
      DenyBlankValues([frmENTransportRouteEdit.edtFuelCounterStart, frmENTransportRouteEdit.edtFuelCounterFinal]);
      DisableControls([frmENTransportRouteEdit.edtFuelCounterStart]);

      frmENTransportRouteEdit.lblFuelCounterStart.Top := 210;
      frmENTransportRouteEdit.lblFuelCounterFinal.Top := 210;
      frmENTransportRouteEdit.edtFuelCounterStart.Top := 215;
      frmENTransportRouteEdit.edtFuelCounterFinal.Top := 215;

      if (ENTransportRouteObj.fuelCounterFinal <> nil) then
      begin
        frmENTransportRouteEdit.edtFuelCounterStart.Text := ENTransportRouteObj.fuelCounterStart.DecimalString;
        frmENTransportRouteEdit.edtFuelCounterFinal.Text := ENTransportRouteObj.fuelCounterFinal.DecimalString;
      end
      else
      begin
        if (transportRouteList.totalCount > 0) then
          frmENTransportRouteEdit.edtFuelCounterStart.Text := transportRouteList.list[0].fuelCounterFinal.DecimalString
        else

        if ENTravelSheetItemObj.fuelCounterStart = nil then
        begin
          fuelCounterStart := makeStartSpeedometer(ENTravelSheetItemObj.code, ENTravelSheetItemObj.travelOrder)[2];
          if fuelCounterStart <> '' then
          begin
            frmENTransportRouteEdit.edtFuelCounterStart.Text := fuelCounterStart;
          end;
        end
        else
          frmENTransportRouteEdit.edtFuelCounterStart.Text := ENTravelSheetItemObj.fuelCounterStart.DecimalString;
      end;

    end;


    if (ENTransportRouteObj.speedometerFinal <> nil) then
    begin
      frmENTransportRouteEdit.edtSpeedometerStart.Text := ENTransportRouteObj.speedometerStart.DecimalString;
      frmENTransportRouteEdit.edtSpeedometerFinal.Text := ENTransportRouteObj.speedometerFinal.DecimalString;
    end
    else
    begin
      if (transportRouteList.totalCount > 0) then
        frmENTransportRouteEdit.edtSpeedometerStart.Text := transportRouteList.list[0].speedometerFinal.DecimalString
      else

      if ENTravelSheetItemObj.speedometerStart = nil then
      begin
        speedometerStart := makeStartSpeedometer(ENTravelSheetItemObj.code, ENTravelSheetItemObj.travelOrder)[1];
        if speedometerStart <> '' then
        begin
          frmENTransportRouteEdit.edtSpeedometerStart.Text := speedometerStart;
        end;
      end
      else
        frmENTransportRouteEdit.edtSpeedometerStart.Text := ENTravelSheetItemObj.speedometerStart.DecimalString;
    end;


    frmENTransportRouteEdit.isTravelSheet := True;

    ///   если последняя строка маршрута и единственная строка путевого,
    ///   то подставим фактический пробег из разницы финальных показаний спидометра
    ///   и стартовых показаний последней строки маршрута

    transportRouteFilter := ENTransportRouteFilter.Create;
    SetNullIntProps(transportRouteFilter);
    SetNullXSProps(transportRouteFilter);

    transportRouteFilter.planRef := ENPlanWorkRef.Create;
    transportRouteFilter.planRef.code := ENTransportRouteObj.planRef.code;
    transportRouteFilter.conditionSQL := ' entransportroute.speedometerfinal is null ';

    transportRouteList := TempENTransportRoute.getScrollableFilteredList(transportRouteFilter, 0, -1);

    travelSheetItemFilter := ENTravelSheetItemFilter.Create;
    SetNullIntProps(travelSheetItemFilter);
    SetNullXSProps(travelSheetItemFilter);

    travelSheetItemFilter.travelSheetRef := ENTravelSheetRef.Create;
    travelSheetItemFilter.travelSheetRef.code := ENTravelSheetObj.code;
    travelSheetItemFilter.kindRef := ENTravelSheetItemKindRef.Create;
    travelSheetItemFilter.kindRef.code := TRAVELITEM_KIND_FACT;
    travelSheetItemList := TempENTravelSheetItem.getScrollableFilteredList(travelSheetItemFilter, 0, -1);

    if ((transportRouteList.totalCount = 1) and (travelSheetItemList.totalCount = 1) and
         (ENTransportRouteObj.code = transportRouteList.list[0].code)) then
       begin
         frmENTransportRouteEdit.edtSumDistanceFact.Text :=
         FloatToStr(StrToFloat(ENTravelSheetObj.speedometerFinal.DecimalString) - StrToFloat(frmENTransportRouteEdit.edtSpeedometerStart.Text));

       end;

    ///
    ///

    try
      if frmENTransportRouteEdit.ShowModal = mrOk then
      begin
        sgENTravelSheetItemFactClick(Sender);
      end;
    finally
      frmENTransportRouteEdit.Free;
      frmENTransportRouteEdit := nil;
    end;

    pcTravelSheetChange(Sender);
    
end;


procedure TfrmENTravelSheetEdit.actEditRouteExecute(Sender: TObject);
var
   TempENTransportRoute : ENTransportRouteControllerSoapPort;
begin
  inherited;
    TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;
    try
      ENTransportRouteObj := TempENTransportRoute.getObject(StrToInt(sgENTransportRoute.Cells[0,sgENTransportRoute.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENTransportRouteEdit := TfrmENTransportRouteEdit.Create(Application, dsEdit);

    try
      if frmENTransportRouteEdit.ShowModal= mrOk then
      begin
         sgENTravelSheetItemFactClick(Sender);
      end;
    finally
      frmENTransportRouteEdit.Free;
      frmENTransportRouteEdit := nil;
    end;
end;

procedure TfrmENTravelSheetEdit.actDeleteRouteDistanceExecute(Sender: TObject);
var 
  TempENTransportRoute : ENTransportRouteControllerSoapPort;
begin
  TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;

  try
    ENTransportRouteObj := TempENTransportRoute.getObject(StrToInt(sgENTransportRoute.Cells[0,sgENTransportRoute.Row]));
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити показання на маршруті?'),
             PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    ENTransportRouteObj.speedometerStart := nil;
    ENTransportRouteObj.speedometerFinal := nil;
    ENTransportRouteObj.distanceNew := nil;
    ENTransportRouteObj.fuelCounterStart := nil;
    ENTransportRouteObj.fuelCounterFinal := nil;

    TempENTransportRoute.save(ENTransportRouteObj, true);
  end;

  sgENTravelSheetItemFactClick(Sender);

end;

procedure TfrmENTravelSheetEdit.edtTimeStartChange(Sender: TObject);
begin
  inherited;
  if DialogState <> dsInsert then
    Self.recalcSpeedometerFinalGLOBUS;

end;

procedure TfrmENTravelSheetEdit.recalcSpeedometerFinalGLOBUS;
var
 TempTKTransportRealHistory : TKTransportRealHistoryControllerSoapPort;
 TempENTravelSheet : ENTravelSheetControllerSoapPort;
begin
  inherited;
          if transportRealHistoryObj <> nil then
          begin
            if (transportRealHistoryObj.reg_id <> Low(Integer)) and (ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_FACT) then
              if edtSpeedometerFinal.Visible = True then
              begin
                if edtSpeedometerFinal.Enabled <> False then
                begin
                  edtSpeedometerFinal.Enabled := False;
                end;
                // Если форма открывается для редактирования
                if DialogState = dsEdit then
                begin
                  if ENTravelSheetObj.timeFinal = nil then
                    ENTravelSheetObj.timeFinal := TXSDateTime.Create;
                  ENTravelSheetObj.timeFinal.XSToNative(GetXSDateTime(edttimeFinal.DateTime));
                  if ENTravelSheetObj.timeStart = nil then
                    ENTravelSheetObj.timeStart := TXSDateTime.Create;
                  ENTravelSheetObj.timeStart.XSToNative(GetXSDateTime(edttimeStart.DateTime));
                  if TempENTravelSheet = nil then TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
                  edtSpeedometerFinal.Text := TempENTravelSheet.getSpeedometerFinalByGlobus(ENTravelSheetObj).DecimalString;
                end;
            end;
          end;

end;

procedure TfrmENTravelSheetEdit.edtTimeFinalChange(Sender: TObject);
begin
  inherited;
  if DialogState <> dsInsert then
    Self.recalcSpeedometerFinalGLOBUS;
end;

procedure TfrmENTravelSheetEdit.fillENTravelSheetFuelFills;
var
  TempENTravelSheetFuelFill: ENTravelSheetFuelFillControllerSoapPort;
  i, LastCount, LastRow: Integer;
  ENTravelSheetFuelFillList: ENTravelSheetFuelFillShortList;
  fuelFillFilter : ENTravelSheetFuelFillFilter;
begin

  if ENTravelSheetObj.statusRef.code < TRAVEL_STATUS_FACT then begin
    gbENTravelSheetFuelFill.Visible := False;
    sgENTravelSheetFuel.Align := alClient;
    Exit;
  end;
  SetGridHeaders(ENTravelSheetFuelFillHeaders, sgENTravelSheetFuelFill.ColumnHeaders);
  TempENTravelSheetFuelFill :=  HTTPRIOENTravelSheetFuelFill as ENTravelSheetFuelFillControllerSoapPort;
  fuelFillFilter := ENTravelSheetFuelFillFilter.Create;
  SetNullIntProps(fuelFillFilter);
  SetNullXSProps(fuelFillFilter);
  fuelFillFilter.travelSheetRef := ENTravelSheetRef.Create;
  fuelFillFilter.travelSheetRef.code := ENTravelSheetObj.code;
  ENTravelSheetFuelFillList := TempENTravelSheetFuelFill.getScrollableFilteredList(fuelFillFilter,0,-1);
  LastCount:=High(ENTravelSheetFuelFillList.list);

  gbENTravelSheetFuelFill.Visible := LastCount >= 0;

  if not gbENTravelSheetFuelFill.Visible then begin
    sgENTravelSheetFuel.Align := AlClient;
    Exit;
  end;


  if LastCount > -1 then
     sgENTravelSheetFuelFill.RowCount:=LastCount+2
  else
     sgENTravelSheetFuelFill.RowCount:=2;

  with sgENTravelSheetFuelFill do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelFillList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetFuelFillList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTravelSheetFuelFillList.list[i].timeGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDateTimeWithDate2String(ENTravelSheetFuelFillList.list[i].timeGen);
        if ENTravelSheetFuelFillList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENTravelSheetFuelFillList.list[i].countGen.DecimalString;
        if ENTravelSheetFuelFillList.list[i].timeReceived = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENTravelSheetFuelFillList.list[i].timeReceived);
        LastRow:=i+1;
        sgENTravelSheetFuelFill.RowCount:=LastRow+1;
      end;
   sgENTravelSheetFuelFill.Row:=1;

end;

procedure TfrmENTravelSheetEdit.printRouteOrder(isNeededMessage : Boolean);
var
  argNames, args: ArrayOfString;
  reportName: String;
  tmp , tmp2 , tmpt, tmpt2 : string;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  ENPlanWorkFilterObj: ENPlanWorkFilter;
  ENPlanWorkList: ENPlanWorkShortList;
  intCodesList: ENPlanWorkController.ArrayOfInteger;
begin
  // проверить если под вид работ "Перевезення" тогда печатаем еще и наряд задание
  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
  try
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);
    ENPlanWorkFilterObj.conditionSQL := ' EXISTS (  Select p.code from entravelsheet tw , entravelsheetitem twi , enplanwork p, entransportroute rt ' +
                                              ' where  tw.code = '  + IntToStr(ENTravelSheetObj.code)  +
                                              ' and tw.code = twi.travelsheetrefcode ' +
                                              ' and twi.planrefcode =  p.code ' +
                                              ' and p.code = rt.planrefcode ' +
                                              ' and p.code = ENPLANWORK.CODE ' +
                             ' ) ';
    intCodesList := TempENPlanWork.getFilteredCodeArray(ENPlanWorkFilterObj);
    if High(intCodesList) > -1 then begin
      // печатаем накладную для перевезення
      SetLength(argNames, 1);
      SetLength(args, 1);
      argNames[0] := 'TravelSheet';
      args[0] := IntToStr(ENTravelSheetObj.code);
      makeReport('Auto/route_order' , argNames, args, 'pdf');
    end else begin
      if isNeededMessage then begin
        Application.MessageBox(PChar('Наряд-завдання на перевезення можливо роздрукувати тільки якщо є плани на перевезення у подорожньому листі !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);

      end;
    end;
  finally
    ENPlanWorkFilterObj.Free;
  end;
end;

end.
