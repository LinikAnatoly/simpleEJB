
unit EditENTravelSheetItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemController,
  TB2Item, TB2Dock, TB2Toolbar, ExtCtrls
  , ENTravelSheetController, AdvObj
   ;

type
  TfrmENTravelSheetItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblTravelFrom : TLabel;
    edtTravelFrom: TEdit;
    lblTravelTo : TLabel;
    edtTravelTo: TEdit;
    lblTimeStart : TLabel;
    lblTimeFinal : TLabel;
    lblSpeedometerStart : TLabel;
    edtSpeedometerStart: TEdit;
    lblSpeedometerFinal : TLabel;
    edtSpeedometerFinal: TEdit;
    lblSumDistances : TLabel;
    edtSumDistances: TEdit;
    lblSumMachineHours : TLabel;
    edtSumMachineHours: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  HTTPRIOENTravelSheetItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENTravelSheetItem2TransportItem: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    HTTPRIOENTransportItem: THTTPRIO;
    actViewPlan: TAction;
    HTTPRIOENPlanWork: THTTPRIO;
    pcTravelSheetItemData: TPageControl;
    tsTransportItem: TTabSheet;
    tsEstimateItem: TTabSheet;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    sgENTransportItem: TAdvStringGrid;
    sgGSM: TAdvStringGrid;
    TBToolbar2: TTBToolbar;
    TBItem7: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    actBindToFK: TAction;
    TBItem8: TTBItem;
    gbFINGSM: TGroupBox;
    sgFINGSM: TAdvStringGrid;
    Splitter1: TSplitter;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOFINMaterials: THTTPRIO;
    lblSumDistanceFact: TLabel;
    edtSumDistanceFact: TEdit;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENTravelSheet: THTTPRIO;
    lblFuelCounterStart: TLabel;
    lblFuelCounterFinal: TLabel;
    edtFuelCounterFinal: TEdit;
    edtFuelCounterStart: TEdit;
    tsDistances: TTabSheet;
    TBToolbar3: TTBToolbar;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    sgENTravelSheetItemDistance: TAdvStringGrid;
    HTTPRIOENTravelSheetItemDistance: THTTPRIO;
    actDeleteDistance: TAction;
    lblHeatingTime: TLabel;
    edtHeatingTime: TEdit;
    HTTPRIOENTransportRoute: THTTPRIO;
    edtTimeStart: TDateTimePicker;
    edtTimeFinal: TDateTimePicker;
    edtTimeStartTime: TDateTimePicker;
    edtTimeFinalTime: TDateTimePicker;
    grpGlobusData: TGroupBox;
    btnGetGlobusData: TButton;
    Label1: TLabel;
    edtHoursByGps: TEdit;
    Label2: TLabel;
    edtDistanceByGps: TEdit;
    edtHoursInMotionByGps: TEdit;
    Label3: TLabel;
    edtHoursStopWorkByGps: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtHoursStopOffByGps: TEdit;
    mmoComm: TMemo;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateENTransportGrid();
  procedure updateDistanceGrid();
    procedure actViewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure pcTravelSheetItemDataChange(Sender: TObject);
    procedure updateFINMaterialsGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid );
    procedure sgGSMClick(Sender: TObject);
    procedure actBindToFKExecute(Sender: TObject);

    procedure calcSumDistanceFact();
    procedure edtSpeedometerFinalChange(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteDistanceExecute(Sender: TObject);
    procedure edtTimeStartChange(Sender: TObject);
    procedure btnGetGlobusDataClick(Sender: TObject);
    procedure edtTimeFinalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    travelSheetStatus : Integer;
    travelSheetObj : ENTravelSheet;
    isGPS : Boolean;
    reg_id : Integer;

end;

var
  frmENTravelSheetItemEdit: TfrmENTravelSheetItemEdit;
  ENTravelSheetItemObj: ENTravelSheetItem;
  prevOrderItem : ENTravelSheetItem;
  nextOrderItem : ENTravelSheetItem;


   ENTransportItemHeaders_: array [1..9] of String =
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Тип транспорту'
          ,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Відстані, км'
          ,'Код роботи'
          ,'Робота'
          ,'Кількість робіт'
          //,'Ціна нормочасу'
          //,'Вартість нормочасу'

          //,'Користувач що вніс зміни'
          //,'Дата останньої зміни'
        );

  ENEstimateItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Код роботи'
          ,'Робота'
          ,'Тип строки кошторису'
          ,'Статус'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );


  FINMaterialsShortHeaders: array [1..15] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
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

          ENTravelSheetItemDistanceHeaders: array [1..4] of String =
        ( 'Код'
          ,'Довжина дистанції, км.'
          ,'Машиногодини'
          ,'Значення коефіціенту'
        );


implementation

uses
  ENTransportItemController, ENTravelSheetItem2TransportItemController, 
  EditENTransportItem
  //, ENTravelSheetController
  , ENConsts, ENPlanWorkController,
  EditENPlanWork, ENEstimateItemController, ENEstimateItemKindController, 
  FINMaterialsController, FINMaterialsStatusController, EditENEstimateItem, 
  EditFINMaterialsData, DMReportsUnit, ENPlanWorkItemController, 
  EditENTransportItemFact, ENTravelSheetItemDistanceController,
  EditENTravelSheetItemDistance, ENTransportRouteController;


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetItemEdit.calcSumDistanceFact();
var
  start, final, sum_ : Double;
begin

  try
    start := StrToFloat(edtSpeedometerStart.Text);
  except
    on EConvertError do
    sum_ := 0;
  end;

  try
    final := StrToFloat(edtSpeedometerFinal.Text);
  except
    on EConvertError do
    sum_ := 0;
  end;

  sum_ := Conv(final - start , 2);
  if (sum_ <= 0) then
    edtSumDistanceFact.Text := ''
  else
    edtSumDistanceFact.Text := FloatToStr(sum_);

end;

procedure TfrmENTravelSheetItemEdit.FormShow(Sender: TObject);
var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
parentItem : ENTravelSheetItem;
begin

 if travelSheetStatus = TRAVEL_STATUS_FACT then
 begin

  TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
  parentItem := TempENTravelSheetItem.getObject(ENTravelSheetItemObj.parentItemRef.code);

  if ENTravelSheetItemObj.travelOrder <> 1 then
  prevOrderItem := TempENTravelSheetItem.getContiguosItem(ENTravelSheetItemObj.code, ENTravelSheetItemObj.travelOrder-1);
  nextOrderItem := TempENTravelSheetItem.getContiguosItem(ENTravelSheetItemObj.code, ENTravelSheetItemObj.travelOrder+1);

 end;

  pcTravelSheetItemData.ActivePage := tsTransportItem;


  SetGridHeaders(ENTransportItemHeaders_, sgENTransportItem.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgGSM.ColumnHeaders);
  SetGridHeaders(FINMaterialsShortHeaders, sgFINGSM.ColumnHeaders);

  SetFloatStyle([edtSpeedometerStart, edtSpeedometerFinal]);

  HideControls([ lblSumDistanceFact ,edtSumDistanceFact

                  , lblSpeedometerStart, edtSpeedometerStart
                  , lblSpeedometerFinal, edtSpeedometerFinal
                  , lblFuelCounterStart, edtFuelCounterStart
                  , lblFuelCounterFinal, edtFuelCounterFinal
                ], travelSheetStatus = TRAVEL_STATUS_PLAN);

  HideControls([grpGlobusData], travelSheetStatus < TRAVEL_STATUS_FACT);

  if(travelSheetStatus in [TRAVEL_STATUS_PLAN, TRAVEL_STATUS_GOOD]) then tsDistances.TabVisible := False;


  HideControls([lblFuelCounterStart, lblFuelCounterFinal, edtFuelCounterStart, edtFuelCounterFinal], travelSheetObj.transportReal.fuelCalcTypeRef.code <> TKFUELTYPECALC_BY_COUNTER);

  DisableControls([edtSumDistanceFact, edtHoursByGps, edtDistanceByGps, edtHoursInMotionByGps,
                   edtHoursStopWorkByGps, edtHoursStopOffByGps]);

  DisableActions([actBindToFK]);
  actBindToFK.Visible := False;

  if (travelSheetStatus = TRAVEL_STATUS_WRITINGOFF_GSM) then
  begin
     actBindToFK.Visible := True;
     DisableActions([actBindToFK], False);
  end;

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableActions([actInsert, actEdit, actDelete, actDeleteDistance]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSumDistances
      ,edtSumMachineHours
     ]);

  if (travelSheetStatus = TRAVEL_STATUS_FACT) then
      DenyBlankValues([
      //edtSumDistances
      //,edtSumMachineHours
      edtTravelFrom
      , edtTravelTo
      , edtTimeStart
      , edtTimeFinal
      , edtSpeedometerStart
      , edtSpeedometerFinal
     ]) ;

     if travelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
        DenyBlankValues([edtFuelCounterStart, edtFuelCounterFinal]);

     if reg_id <> LOW_INT then
        DenyBlankValues([edtHoursByGps, edtDistanceByGps, edtHoursInMotionByGps, edtHoursStopWorkByGps, edtHoursStopOffByGps]);
  end;




  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    // 22.11.2011 NET-969 Для тракторов должны быть недоступны показания спидометра
    if (travelSheetObj.typeRef.code = TRAVEL_TYPE_TRACTOR) then
    begin
      DisableControls([edtSpeedometerStart, edtSpeedometerFinal, edtSumDistanceFact]);
    end;

    if reg_id <> LOW_INT then
    begin
       DisableControls([edtSpeedometerStart, edtSpeedometerFinal, edtSumDistanceFact]);
       DisableControls([edtHoursByGps, edtDistanceByGps, edtHoursInMotionByGps, edtHoursStopWorkByGps, edtHoursStopOffByGps]);
    end;

    // маш часы и расстояния не трогаем ....
    DisableControls([ edtSumDistances, edtSumMachineHours ]);

    edtCode.Text := IntToStr(ENTravelSheetItemObj.code);
    
    if  ENTravelSheetItemObj.travelFrom = '' then
      edtTravelFrom.Text := 'РЕМ'
    else
      edtTravelFrom.Text := ENTravelSheetItemObj.travelFrom;

    edtTravelTo.Text := ENTravelSheetItemObj.travelTo;

     SetCurrentDate;

      if ENTravelSheetItemObj.timeStart <> nil then
      begin
        edtTimeStartTime.Time:= EncodeTime(ENTravelSheetItemObj.timeStart.Hour,ENTravelSheetItemObj.timeStart.Minute, 0, 0);
        edtTimeStartTime.checked := true;
        edtTimeStart.Date:= EncodeDate(ENTravelSheetItemObj.timeStart.Year,ENTravelSheetItemObj.timeStart.Month,ENTravelSheetItemObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      if (travelSheetStatus = TRAVEL_STATUS_PLAN) then
      begin
        edtTimeStartTime.Time := StrToTime('08:00');
        edtTimeStartTime.Checked := True;
      end
      else
      if (travelSheetStatus = TRAVEL_STATUS_FACT) and (ENTravelSheetItemObj.timeStart = nil) and (Assigned(parentItem)) then
      begin
        edtTimeStartTime.Time:= EncodeTime(parentItem.timeStart.Hour,parentItem.timeStart.Minute, 0, 0);
        edtTimeStartTime.checked := true;
        edtTimeStart.Date:= EncodeDate(parentItem.timeStart.Year,parentItem.timeStart.Month,parentItem.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
         begin
          edtTimeStartTime.Checked := False;
          edtTimeStart.Checked := False;
         end;



      if ENTravelSheetItemObj.timeFinal <> nil then
      begin
        edtTimeFinalTime.Time:= EncodeTime(ENTravelSheetItemObj.timeFinal.Hour,ENTravelSheetItemObj.timeFinal.Minute, 0, 0);
        edtTimeFinalTime.checked := true;
        edtTimeFinal.Date := EncodeDate(ENTravelSheetItemObj.timeFinal.Year,ENTravelSheetItemObj.timeFinal.Month,ENTravelSheetItemObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      if (travelSheetStatus = TRAVEL_STATUS_PLAN) then
      begin
        edtTimeFinalTime.Time := StrToTime('16:00');
        edtTimeFinalTime.Checked := True;
      end
      else
      if (travelSheetStatus = TRAVEL_STATUS_FACT) and (ENTravelSheetItemObj.timeFinal = nil) and (Assigned(parentItem)) then
      begin
        edtTimeFinalTime.Time:= EncodeTime(parentItem.timeFinal.Hour,parentItem.timeFinal.Minute, 0, 0);
        edtTimeFinalTime.checked := true;
        edtTimeFinal.Date:= EncodeDate(parentItem.timeFinal.Year,parentItem.timeFinal.Month,parentItem.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
       edtTimeFinal.Checked := False;
       edtTimeFinalTime.Checked := False;
      end;

    // тут уже может быть НАЧАЛЬНОЕ показание ...
    if edtSpeedometerStart.Text = '' then
    begin
      if ( ENTravelSheetItemObj.speedometerStart <> nil ) then
         edtSpeedometerStart.Text := ENTravelSheetItemObj.speedometerStart.decimalString
      else
         if ( (travelSheetObj.statusRef.code <> TRAVEL_TYPE_TRACTOR)
              and (DialogState = dsEdit) ) then
            edtSpeedometerStart.Text := '0'
         else
            edtSpeedometerStart.Text := '';
    end;

     // если есть показания предыдущей строки, то возьмем их
     if prevOrderItem <> nil then
       begin
       if ( prevOrderItem.speedometerFinal <> nil ) then
         edtSpeedometerStart.Text := prevOrderItem.speedometerFinal.decimalString;
       end;

    if edtSpeedometerFinal.Text = '' then
    begin
      if ( ENTravelSheetItemObj.speedometerFinal <> nil ) then
         edtSpeedometerFinal.Text := ENTravelSheetItemObj.speedometerFinal.decimalString
      else
         if ( (travelSheetObj.statusRef.code <> TRAVEL_TYPE_TRACTOR)
              and (DialogState = dsEdit) ) then
            edtSpeedometerFinal.Text := '0'
         else
            edtSpeedometerFinal.Text := '';
    end;

    // тоже может быть ЗАПОЛНЕНО ..
    if edtFuelCounterStart.Text = '' then
    begin
      if ( ENTravelSheetItemObj.fuelCounterStart <> nil ) then
         edtFuelCounterStart.Text := ENTravelSheetItemObj.fuelCounterStart.decimalString
      else
         edtFuelCounterStart.Text := '';
    end;

    if edtFuelCounterFinal.Text = '' then
    begin
      if ( ENTravelSheetItemObj.fuelCounterFinal <> nil ) then
         edtFuelCounterFinal.Text := ENTravelSheetItemObj.fuelCounterFinal.decimalString
      else
         edtFuelCounterFinal.Text := '';
    end;

    if ( ENTravelSheetItemObj.sumDistances <> nil ) then
       edtSumDistances.Text := ENTravelSheetItemObj.sumDistances.decimalString
    else
       edtSumDistances.Text := '';
    if ( ENTravelSheetItemObj.sumMachineHours <> nil ) then
       edtSumMachineHours.Text := ENTravelSheetItemObj.sumMachineHours.decimalString
    else
       edtSumMachineHours.Text := '';
    MakeMultiline(edtCommentGen.Lines, ENTravelSheetItemObj.commentGen);

    if ( ENTravelSheetItemObj.heatingTime <> nil ) then
       edtHeatingTime.Text := ENTravelSheetItemObj.heatingTime.decimalString
    else
       edtHeatingTime.Text := '';

    if ( ENTravelSheetItemObj.hoursByGPS <> nil ) then
       edtHoursByGps.Text := ENTravelSheetItemObj.hoursByGPS.decimalString
    else
       edtHoursByGps.Text := '';

    if ( ENTravelSheetItemObj.distanceByGPS <> nil ) then
       edtDistanceByGps.Text := ENTravelSheetItemObj.distanceByGPS.decimalString
    else
       edtDistanceByGps.Text := '';

    if ( ENTravelSheetItemObj.hoursInMotionByGPS <> nil ) then
       edtHoursInMotionByGps.Text := ENTravelSheetItemObj.hoursInMotionByGPS.decimalString
    else
       edtHoursInMotionByGps.Text := '';

    if ( ENTravelSheetItemObj.hoursStopWorkByGPS <> nil ) then
       edtHoursStopWorkByGps.Text := ENTravelSheetItemObj.hoursStopWorkByGPS.decimalString
    else
       edtHoursStopWorkByGps.Text := '';

    if ( ENTravelSheetItemObj.hoursStopOffByGPS <> nil ) then
       edtHoursStopOffByGps.Text := ENTravelSheetItemObj.hoursStopOffByGPS.decimalString
    else
       edtHoursStopOffByGps.Text := '';


    pcTravelSheetItemDataChange(Sender);
    calcSumDistanceFact();
    btnGetGlobusDataClick(Sender);
  end;
end;



procedure TfrmENTravelSheetItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  {
  if not NoBlankValues([
      edtSumDistances
      ,edtSumMachineHours
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  }

  if (travelSheetStatus = TRAVEL_STATUS_FACT) and
      (not NoBlankValues([
      //edtSumDistances
      //,edtSumMachineHours
      edtTravelFrom
      , edtTravelTo
      , edtTimeStart
      , edtTimeFinal
      , edtSpeedometerStart
      , edtSpeedometerFinal
     ]))  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if (travelSheetStatus = TRAVEL_STATUS_FACT) and ( travelSheetObj.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER)
       and (not NoBlankValues([
          edtFuelCounterStart
          , edtFuelCounterFinal
       ]))  then
    begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
    end;

    if prevOrderItem <> nil then
    begin
    if (travelSheetStatus = TRAVEL_STATUS_FACT) and ( prevOrderItem.statusRef.code = ENConsts.ENTRAVELSHEETITEMSTATUS_GOOD)
    then
    begin
        Application.MessageBox(PChar('Треба спочатку закрити попередню строку!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
    end;
    end;

    TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;


     ENTravelSheetItemObj.travelFrom := edtTravelFrom.Text; 

     ENTravelSheetItemObj.travelTo := edtTravelTo.Text; 

     if edttimeStart.checked then
     begin
       if ENTravelSheetItemObj.timeStart = nil then
          ENTravelSheetItemObj.timeStart := TXSDateTime.Create;
       ENTravelSheetItemObj.timeStart.XSToNative(GetXSDateTimeSeparated(edttimeStart.DateTime,edttimeStartTime.DateTime));
     end
     else
       ENTravelSheetItemObj.timeStart := nil;

     if edttimeFinal.checked then
     begin 
       if ENTravelSheetItemObj.timeFinal = nil then
          ENTravelSheetItemObj.timeFinal := TXSDateTime.Create;
       ENTravelSheetItemObj.timeFinal.XSToNative(GetXSDateTimeSeparated(edttimeFinal.DateTime, edttimeFinalTime.DateTime));
     end
     else
       ENTravelSheetItemObj.timeFinal := nil;

     if (ENTravelSheetItemObj.speedometerStart = nil ) then
       ENTravelSheetItemObj.speedometerStart := TXSDecimal.Create;
     if edtSpeedometerStart.Text <> '' then
       ENTravelSheetItemObj.speedometerStart.decimalString := edtSpeedometerStart.Text 
     else
       ENTravelSheetItemObj.speedometerStart := nil;

     if (ENTravelSheetItemObj.speedometerFinal = nil ) then
       ENTravelSheetItemObj.speedometerFinal := TXSDecimal.Create;
     if edtSpeedometerFinal.Text <> '' then
       ENTravelSheetItemObj.speedometerFinal.decimalString := edtSpeedometerFinal.Text 
     else
       ENTravelSheetItemObj.speedometerFinal := nil;

    if (ENTravelSheetItemObj.fuelCounterStart = nil ) then
       ENTravelSheetItemObj.fuelCounterStart := TXSDecimal.Create;
     if edtFuelCounterStart.Text <> '' then
       ENTravelSheetItemObj.fuelCounterStart.decimalString := edtFuelCounterStart.Text 
     else
       ENTravelSheetItemObj.fuelCounterStart := nil;

     if (ENTravelSheetItemObj.fuelCounterFinal = nil ) then
       ENTravelSheetItemObj.fuelCounterFinal := TXSDecimal.Create;
     if edtFuelCounterFinal.Text <> '' then
       ENTravelSheetItemObj.fuelCounterFinal.decimalString := edtFuelCounterFinal.Text 
     else
       ENTravelSheetItemObj.fuelCounterFinal := nil;

       
     if (ENTravelSheetItemObj.sumDistances = nil ) then
       ENTravelSheetItemObj.sumDistances := TXSDecimal.Create;
     if edtSumDistances.Text <> '' then
       ENTravelSheetItemObj.sumDistances.decimalString := edtSumDistances.Text 
     else
       ENTravelSheetItemObj.sumDistances := nil;

     if (ENTravelSheetItemObj.sumMachineHours = nil ) then
       ENTravelSheetItemObj.sumMachineHours := TXSDecimal.Create;
     if edtSumMachineHours.Text <> '' then
       ENTravelSheetItemObj.sumMachineHours.decimalString := edtSumMachineHours.Text 
     else
       ENTravelSheetItemObj.sumMachineHours := nil;

     if (ENTravelSheetItemObj.heatingTime = nil ) then
       ENTravelSheetItemObj.heatingTime := TXSDecimal.Create;
     if edtHeatingTime.Text <> '' then
       ENTravelSheetItemObj.heatingTime.decimalString := edtHeatingTime.Text
     else
       ENTravelSheetItemObj.heatingTime := nil;

     if (ENTravelSheetItemObj.hoursByGPS = nil ) then
       ENTravelSheetItemObj.hoursByGPS := TXSDecimal.Create;
     if edtHoursByGps.Text <> '' then
       ENTravelSheetItemObj.hoursByGPS.decimalString := edtHoursByGps.Text
     else
       ENTravelSheetItemObj.hoursByGPS := nil;

     if (ENTravelSheetItemObj.distanceByGPS = nil ) then
       ENTravelSheetItemObj.distanceByGPS := TXSDecimal.Create;
     if edtDistanceByGps.Text <> '' then
       ENTravelSheetItemObj.distanceByGPS.decimalString := edtDistanceByGps.Text
     else
       ENTravelSheetItemObj.distanceByGPS := nil;

     if (ENTravelSheetItemObj.hoursInMotionByGPS = nil ) then
       ENTravelSheetItemObj.hoursInMotionByGPS := TXSDecimal.Create;
     if edtHoursInMotionByGps.Text <> '' then
       ENTravelSheetItemObj.hoursInMotionByGPS.decimalString := edtHoursInMotionByGps.Text
     else
       ENTravelSheetItemObj.hoursInMotionByGPS := nil;

     if (ENTravelSheetItemObj.hoursStopWorkByGPS = nil ) then
       ENTravelSheetItemObj.hoursStopWorkByGPS := TXSDecimal.Create;
     if edtHoursStopWorkByGps.Text <> '' then
       ENTravelSheetItemObj.hoursStopWorkByGPS.decimalString := edtHoursStopWorkByGps.Text
     else
       ENTravelSheetItemObj.hoursStopWorkByGPS := nil;

     if (ENTravelSheetItemObj.hoursStopOffByGPS = nil ) then
       ENTravelSheetItemObj.hoursStopOffByGPS := TXSDecimal.Create;
     if edtHoursStopOffByGps.Text <> '' then
       ENTravelSheetItemObj.hoursStopOffByGPS.decimalString := edtHoursStopOffByGps.Text
     else
       ENTravelSheetItemObj.hoursStopOffByGPS := nil;

     ENTravelSheetItemObj.commentGen := edtCommentGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENTravelSheetItemObj.dateEdit = nil then
          ENTravelSheetItemObj.dateEdit := TXSDateTime.Create;
       ENTravelSheetItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTravelSheetItemObj.dateEdit := nil;	   

     ENTravelSheetItemObj.userGen := edtUserGen.Text; 

    if DialogState = dsInsert then
    begin
      ENTravelSheetItemObj.code:=low(Integer);
      TempENTravelSheetItem.add(ENTravelSheetItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetItem.save(ENTravelSheetItemObj);
    end;
  end;
end;


procedure TfrmENTravelSheetItemEdit.updateENTransportGrid();
var
    TempENTransportItem: ENTransportItemControllerSoapPort;
    TempENTravelSheetItem2TransportItem: ENTravelSheetItem2TransportItemControllerSoapPort;

    ENTravelSheetItem2TransportItemList: ENTravelSheetItem2TransportItemShortList;

    ENTransportItemList: ENTransportItemShortList;

    transportItemFilter : ENTransportItemFilter;
    t2tFilter : ENTravelSheetItem2TransportItemFilter;
    i : integer;
    sql, sql1 : string;
    state_ : Boolean;

    TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
    tsi : ENTravelSheetItem;
begin

  ClearGrid(sgENTransportItem);

  TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  TempENTravelSheetItem2TransportItem :=  HTTPRIOENTravelSheetItem2TransportItem as ENTravelSheetItem2TransportItemControllerSoapPort;
  t2tFilter := ENTravelSheetItem2TransportItemFilter.Create;
  SetNullIntProps(t2tFilter);
  SetNullXSProps(t2tFilter);
  t2tFilter.travelSheetItemRef := ENTravelSheetItemRef.Create;
  t2tFilter.travelSheetItemRef.code := ENTravelSheetItemObj.code;
  ENTravelSheetItem2TransportItemList := TempENTravelSheetItem2TransportItem.getScrollableFilteredList(t2tFilter, 0, -1);
  sql := '';
  for i:=0 to  High(ENTravelSheetItem2TransportItemList.list) do
  begin
      AddListPos(sql, IntToStr(ENTravelSheetItem2TransportItemList.list[i].transportItemRefCode));
  end;

  if Length(sql) = 0 then Exit;

  TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
  tsi := TempENTravelSheetItem.getObject(ENTravelSheetItemObj.code);
  if tsi <> nil then
  begin
    edtSumDistances.Text := tsi.sumDistances.DecimalString;
    edtSumMachineHours.Text := tsi.sumMachineHours.DecimalString;
  end
  else
  begin
    ClearControls([edtSumDistances, edtSumMachineHours]);
  end;

  transportItemFilter := ENTransportItemFilter.Create;
  SetNullIntProps(transportItemFilter);
  SetNullXSProps(transportItemFilter);

  //transportItemFilter.planRef := ENPlanWorkRef.Create;
  //transportItemFilter.planRef.code := ENPlanWorkObj.code;


  //transportItemFilter.conditionSQL := 'entransportitem.code in (select entravlshttm2trnsprttm.transportitemrefcode from entravlshttm2trnsprttm where entravlshttm2trnsprttm.travelsheetitemrefcode = '+ IntToStr(ENTravelSheetItemObj.code) +')';
  transportItemFilter.conditionSQL := 'entransportitem.code in ('+ sql +')';

  transportItemFilter.orderBySQL := ' entransportitem.planitemrefcode';

  ENTransportItemList := TempENTransportItem.getScrollableFilteredList(transportItemFilter,0,-1);

  if High(ENTransportItemList.list) > -1 then
    sgENTransportItem.RowCount := High(ENTransportItemList.list) + 2
  else
    sgENTransportItem.RowCount := 2;


  with sgENTransportItem do
     for i := 0 to High(ENTransportItemList.list) do
     begin
        Application.ProcessMessages;
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := ENTransportItemList.list[i].transportName;
        AddCheckBox(1, i +1, false, false);
{
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Тип транспорту'
          ,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Відстані, км'
          ,'Код роботи'
          ,'Робота'
          ,'Кількість робіт'

}
        //Cells[2, i+1] := ENTransportItemList.list[i].transportRealName;
        Cells[2, i +1] := ENTransportItemList.list[i].tktransportTypeName;

        //Cells[3, i+1] := ENTransportItemList.list[i].workerFactName;
        //Cells[3, i+1] := ENTransportItemList.list[i].finWorkerName + ' ' + ENTransportItemList.list[i].finWorkerPositionName;

        if ENTransportItemList.list[i].countWorkGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENTransportItemList.list[i].countWorkGen.DecimalString;

        if ENTransportItemList.list[i].countWorkFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].countWorkFact.DecimalString;


        if ENTransportItemList.list[i].distance = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].distance.DecimalString;

        Cells[6, i+1] := ENTransportItemList.list[i].kartaNum;
        Cells[7,i + 1] := ENTransportItemList.list[i].kartaRefName;

        if ENTransportItemList.list[i].planItemRefCountGen <> nil then
            Cells[8,i+1] :=  ENTransportItemList.list[i].planItemRefCountGen.DecimalString
        else
            Cells[8,i+1] := '';

        //Cells[10,i+1] := ENTransportItemList.list[i].userGen;
        {
        if ENTransportItemList.list[i].dateEdit = nil then
          Cells[11,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(ENTransportItemList.list[i].dateEdit);
          }
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;
{
        // Выделяем цветом ручной ввод
       if ENTransportItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENTransportItem.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENTransportItem.RowColor[i+1] := clWindow;

       Objects[0,i+1] := TObject(ENTransportItemList.list[i].typeRefCode);
}
    end;

    sgENTransportItem.Row := 1;
end;


procedure TfrmENTravelSheetItemEdit.actViewExecute(Sender: TObject);
var
  objCode : Integer;
  TempENTransportItem: ENTransportItemControllerSoapPort;
  TempENEstimateItem : ENEstimateItemControllerSoapPort;
  TempENTravelSheetItemDistance : ENTravelSheetItemDistanceControllerSoapPort;
begin
  inherited;

  if pcTravelSheetItemData.ActivePage = tsTransportItem then
  begin
      try
       ObjCode := StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row])
      except
       on EConvertError do Exit;
      end;

      TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

      frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsView);
      ENTransportItemObj := TempENTransportItem.getObject(objCode);
      try
        frmENTransportItemEdit.ShowModal;
      finally
        frmENTransportItemEdit.Free;
        frmENTransportItemEdit:=nil;
      end;
  end;

  ////////////////
  if pcTravelSheetItemData.ActivePage = tsEstimateItem then
  begin
      try
       ObjCode := StrToInt(sgGSM.Cells[0,sgGSM.Row])
      except
       on EConvertError do Exit;
      end;

      TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
      ENEstimateItemObj := TempENEstimateItem.getObject(objCode);

      frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsView);
      try
        frmENEstimateItemEdit.ShowModal;
      finally
        frmENEstimateItemEdit.Free;
        frmENEstimateItemEdit:=nil;
      end;
  end;

  if pcTravelSheetItemData.ActivePage = tsDistances then
  begin
      try
       ObjCode := StrToInt(sgENTravelSheetItemDistance.Cells[0,sgENTravelSheetItemDistance.Row]);
      except
       on EConvertError do Exit;
      end;

      TempENTravelSheetItemDistance := HTTPRIOENTravelSheetItemDistance as ENTravelSheetItemDistanceControllerSoapPort;
      ENTravelSheetItemDistanceObj := TempENTravelSheetItemDistance.getObject(objCode);

      frmENTravelSheetItemDistanceEdit:=TfrmENTravelSheetItemDistanceEdit.Create(Application, dsView);
      try
        frmENTravelSheetItemDistanceEdit.ShowModal;
      finally
        frmENTravelSheetItemDistanceEdit.Free;
        frmENTravelSheetItemDistanceEdit:=nil;
      end;
  end;

  //////////////////
  
end;

procedure TfrmENTravelSheetItemEdit.actDeleteExecute(Sender: TObject);
var
   TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
   i, n, objCode: Integer;
   state, selected: Boolean;
   trCodes : ENTravelSheetItemController.ArrayOfInteger;
begin
  /// Проверяем, чтобы был выбран хотя бы один материал
  selected := false;
  n:=0;
  for i := 1 to sgENTransportItem.RowCount - 1 do
  begin
    sgENTransportItem.GetCheckBoxState(1, i, selected);
    if selected then n := n + 1;
  end;

  if n = 0 then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть хоча б один нормативний транспорт !'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  ///



  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити обрані строки з маршрутного листа ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;

    SetLength(trCodes, n);

    state := false;
    n:= 0;
    for i := 1 to sgENTransportItem.RowCount - 1 do
    begin
      sgENTransportItem.GetCheckBoxState(1, i, state);

      if state then
      begin
        try
          objCode := StrToInt(sgENTransportItem.Cells[0, i]);
        except
          on EConvertError do Continue;
        end;

        trCodes[n] := objCode;
        n:= n + 1;
        //TempENTravelSheetItem.removeByEstimateCode(objCode);
      end;
    end;

    TempENTravelSheetItem.removeByTransportCodes(ENTravelSheetItemObj.code, trCodes);

    if ( n = (sgENTransportItem.RowCount - 1) ) then
    begin
      ModalResult := mrCancel;
      Exit;
    end
    else
    begin
      //ENTravelSheetItemObj :=  TempENTravelSheetItem.getObject(ENTravelSheetItemObj.code);
      //FormShow(Sender);
      updateENTransportGrid();
    end;

  end;



end;

procedure TfrmENTravelSheetItemEdit.FormCreate(Sender: TObject);
begin
  inherited;
  travelSheetStatus := LOW_INT;
  reg_id := LOW_INT;
  prevOrderItem := nil;
  nextOrderItem := nil;
end;

procedure TfrmENTravelSheetItemEdit.actViewPlanExecute(Sender: TObject);
var
 //plan : ENPlanWork;
 TempENPlanWork: ENPlanWorkControllerSoapPort;

  TempENTransportRoute : ENTransportRouteControllerSoapPort;
  TempENTravelSheetItem : ENTravelSheetItemControllerSoapPort;
  transportRouteFilter : ENTransportRouteFilter;
  transportRouteList : ENTransportRouteShortList;

  hasRoutes : Boolean;
begin
  inherited;

    hasRoutes := false;
    TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;

    transportRouteFilter := ENTransportRouteFilter.Create;
    SetNullIntProps(transportRouteFilter);
    SetNullXSProps(transportRouteFilter);

    transportRouteFilter.planRef := ENPlanWorkRef.Create;

    transportRouteFilter.planRef.code := ENTravelSheetItemObj.planRef.code;
    transportRouteList := TempENTransportRoute.getScrollableFilteredList(transportRouteFilter, 0, -1);

    if High(transportRouteList.list) > -1 then
       hasRoutes := True;

   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   if hasRoutes then
   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit)
   else
   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);

   if ENTravelSheetItemObj.planRef.code = LOW_INT then Exit;

   try
     frmENPlanWorkEdit.ENPlanWorkObj :=  TempENPlanWork.getObject(ENTravelSheetItemObj.planRef.code);
     frmENPlanWorkEdit.ShowModal;
   finally
     frmENPlanWorkEdit.Free;
     frmENPlanWorkEdit:=nil;
   end;

end;

procedure TfrmENTravelSheetItemEdit.btnGetGlobusDataClick(Sender: TObject);
var TempENTravelSheetItem : ENTravelSheetItemControllerSoapPort;
 travelData : ENTravelSheetItemShort;
 travelItemForRequest : ENTravelSheetItem;
 timeStart, timeFinal : TXSDateTime;

begin
  inherited;

 if reg_id = LOW_INT then Exit;
  
 if travelSheetObj = nil then Exit;

 TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
   travelItemForRequest := ENTravelSheetItem.Create;
   travelItemForRequest := ENTravelSheetItemObj;

   if edttimeStart.checked then
     begin
          timeStart := TXSDateTime.Create;
          timeStart.XSToNative(GetXSDateTimeSeparated(edttimeStart.DateTime,edttimeStartTime.DateTime));
     end
     else
        timeStart := nil;

     if edttimeFinal.checked then
     begin
          timeFinal := TXSDateTime.Create;
          timeFinal.XSToNative(GetXSDateTimeSeparated(edttimeFinal.DateTime, edttimeFinalTime.DateTime));
     end
     else
        timeFinal := nil;

   travelItemForRequest.timeStart := TXSDateTime.Create;
   travelItemForRequest.timeStart := timeStart;

   travelItemForRequest.timeFinal := TXSDateTime.Create;
   travelItemForRequest.timeFinal := timeFinal;

   travelData := TempENTravelSheetItem.getGlobusData(travelItemForRequest);
   edtHoursStopWorkByGps.Text := travelData.hoursStopWorkByGPS.DecimalString;

   if prevOrderItem = nil then
   begin
      timeStart := travelSheetObj.timeStart;
   end
   else
      timeStart := prevOrderItem.timeFinal;

   if nextOrderItem = nil then
   begin
      timeFinal := travelSheetObj.timeFinal;
   end;

   travelItemForRequest.timeStart := TXSDateTime.Create;
   travelItemForRequest.timeStart := timeStart;

   travelItemForRequest.timeFinal := TXSDateTime.Create;
   travelItemForRequest.timeFinal := timeFinal;

   travelData := TempENTravelSheetItem.getGlobusData(travelItemForRequest);

   edtHoursByGps.Text := travelData.hoursByGPS.DecimalString;
   edtDistanceByGps.Text := travelData.distanceByGPS.DecimalString;
   edtHoursInMotionByGps.Text := travelData.hoursInMotionByGPS.DecimalString;
   edtHoursStopOffByGps.Text := travelData.hoursStopOffByGPS.DecimalString;


   if nextOrderItem = nil then
      edtSpeedometerFinal.Text := travelSheetObj.speedometerFinal.DecimalString
   else
   edtSpeedometerFinal.Text := FloatToStr(Conv(StrToFloat(travelData.distanceByGPS.DecimalString)
                               + StrToFloat(edtSpeedometerStart.Text),2));

   mmoComm.Lines.Clear;
   mmoComm.Lines.Add('Дата та час початку:');
   mmoComm.Lines.Add(XSDateTimeWithDate2String(travelItemForRequest.timeStart));
   mmoComm.Lines.Add('Дата та час кінця:');
   mmoComm.Lines.Add(XSDateTimeWithDate2String(travelItemForRequest.timeFinal));


end;

procedure TfrmENTravelSheetItemEdit.pcTravelSheetItemDataChange(
  Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;

  estimateItemFilter : ENEstimateItemFilter;
  sql : string;
  i , eCode : Integer;
begin
  inherited;

  /////////////////////
  if pcTravelSheetItemData.ActivePage = tsTransportItem then
  begin
      updateENTransportGrid();
  end;
  //////////////////////////////////////

  /////////////////////
  if pcTravelSheetItemData.ActivePage = tsEstimateItem then
  begin

    ClearGrid(sgGSM);

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    //if estimateItemFilter = nil then
    //begin
       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);
    //end;

    if ENTravelSheetItemObj.statusRef.code = TRAVELITEM_STATUS_DELETED then Exit;

    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := ENTravelSheetItemObj.planRef.code;

    if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_GSM;

    sql := ' ENESTIMATEITEM.COUNTFACT <> 0 ';
    AddCondition(sql, 'code in ( '+

                     'select t2e.estimaterefcode from entransport2enestimate t2e , entravlshttm2trnsprttm ti2t '+
                     'where t2e.transportrefcode = ti2t.transportitemrefcode and ti2t.travelsheetitemrefcode = ' +
                     IntToStr(ENTravelSheetItemObj.code) +
                  ')'
                );

    estimateItemFilter.conditionSQL := sql;
    ////
    estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
    ////

    ///
    //pnlLegend.Visible := (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]);
    ///

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

    if High(ENEstimateItemList.list) > -1 then
      sgGSM.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgGSM.RowCount := 2;
    eCode := LOW_INT;
     with sgGSM do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

         Cells[5,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[6,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;

         Cells[8,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[9,i+1] := ''
         else
           Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);

         { QQQ
         if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
         begin
           // Если к нормативному материалу привязаны материалы из ФК, выделяем строку цветом
           //if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
           if ENEstimateItemList.list[i].countFINMaterials > 0 then
           begin
             RowColor[i+1] := Shape1.Brush.Color; //$0080FF80; //$EBFFF5
             Objects[1,i+1] := TObject(1); // признак (разнесенный)
           end
           else begin
             RowColor[i+1] := clWindow;
             Objects[1,i+1] := TObject(0);
           end;
           //else
           //  RowColor[i+1] := clYellow;
         end
         else begin
           RowColor[i+1] := clWindow;

           // Выделяем цветом ручной ввод
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
             RowColor[i+1] := clMoneyGreen; //$EBFFF5

           // Выделяем цветом строки, относящиеся ко всей смете
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
             RowColor[i+1] := clYellow;
         end;
         }
         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

         sgGSM.RowCount := High(ENEstimateItemList.list) + 2;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;


     sgGSM.Row := 1;
     sgGSMClick(Sender);
     //updateFINMaterialsGrid();
  end;
  //////////////////////////////////////

  if pcTravelSheetItemData.ActivePage = tsDistances then
  begin
    updateDistanceGrid();
  end;

end;


procedure TfrmENTravelSheetItemEdit.updateFINMaterialsGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid );
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  j,i: Integer;
  finList: FINMaterialsShortList; //List_;
  finFilter : FINMaterialsFilter;
begin

  ClearGrid(sgFINGSM);



  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);
  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := estimateItemCode;

  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  {
  if ENPlanWorkObj.kind.code = ENPLANWORKKIND_CURRENT then
  begin

  end;
  }

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     stringGrid.RowCount:=High(finList.list)+2
  else
     stringGrid.RowCount:=2;

   with stringGrid do
    for i:=0 to High(finList.list) do
      begin
        Application.ProcessMessages;
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


        Cells[7,i+1] := finList.list[i].div_name;

        Cells[8,i+1] := finList.list[i].rest_purpose_name;

        Cells[9,i+1] := finList.list[i].partner_name;

        if finList.list[i].doc_date = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(finList.list[i].doc_date);

        Cells[11,i+1] := finList.list[i].party_discription;

        Cells[12,i+1] := IntToStr(finList.list[i].party_id);

        Cells[13, i+1] := finList.list[i].userGen ;

        if finList.list[i].dateEdit <> nil then
          Cells[14, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
        else
          Cells[14, i+1] := '';

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
        stringGrid.RowCount:= i + 2;
      end;
   //ColCount:=ColCount+1;
   stringGrid.Row:=1;



end;

procedure TfrmENTravelSheetItemEdit.sgGSMClick(Sender: TObject);
var
  ObjCode : Integer;
begin
  inherited;

      try
       ObjCode := StrToInt(sgGSM.Cells[0,sgGSM.Row])
      except
       on EConvertError do Exit;
      end;

      updateFINMaterialsGrid(ObjCode, sgFINGSM);
end;

procedure TfrmENTravelSheetItemEdit.actBindToFKExecute(Sender: TObject);
var
temp   : Integer;
begin

   frmFINMaterialsDataEdit:= TfrmFINMaterialsDataEdit.Create(Application,dsInsert);
   try
      frmFINMaterialsDataEdit.planCode := ENTravelSheetItemObj.planRef.code; // ENEstimateItemObj.planRef.code;

     // выведем список ФИН материалов .... если они есть ВААЩЕ ...
    try
        temp := StrToInt( sgGSM.Cells[0, sgGSM.Row ]); //   (sgENEstimateItem,0));
        frmFINMaterialsDataEdit.estimateItemKind := ENESTIMATEITEMKIND_MATERIALS;
    except
      on EConvertError do Exit;
    end;

    frmFINMaterialsDataEdit.estimateCode := temp; //ENEstimateItemObj.code;

    workOrder := DMReports.getWorkOrderByPlanCode(ENTravelSheetItemObj.planRef.code);

    molData := DMReports.getMOLData(workOrder.code, FINMOLTYPE_MECHANIC);
    frmFINMaterialsDataEdit.estimateItemKind := ENESTIMATEITEMKIND_GSM;
    
      {
      frmFINMaterialsDataEdit.edtTKMaterial.Text := edtMaterialName.Text ;

      frmFINMaterialsDataEdit.edtTKCount.Text := ENEstimateItemObj.countGen.DecimalString ;
      }

      with frmFINMaterialsDataEdit do
      begin
        ShowModal ;// = mrOk then
        //begin
        {
            try
            except
               on EConvertError do Exit;
            end;
         }
            //pcPlanWorkChange(Sender);

           { уехало в АпдейтГрид ..
          if checkMaterialsBinding(temp) then
          begin
            sgENEstimateItem.RowColor[sgENEstimateItem.Row] := Shape1.Brush.Color;
            sgENEstimateItem.Objects[1, sgENEstimateItem.Row] := TObject(1); // признак (разнесенный)
          end
          else begin
            sgENEstimateItem.RowColor[sgENEstimateItem.Row] := clWindow;
            sgENEstimateItem.Objects[1, sgENEstimateItem.Row] := TObject(0);
          end;
           }
          //frmENPlanWorkEdit.updateFINMaterialsGrid(temp);
          //self.UpdateGrid(sender);
        end;
   finally
      frmFINMaterialsDataEdit.Free;
   end;

   pcTravelSheetItemDataChange(Sender);
end;

procedure TfrmENTravelSheetItemEdit.edtSpeedometerFinalChange(
  Sender: TObject);
begin
  inherited;
  calcSumDistanceFact();
end;

procedure TfrmENTravelSheetItemEdit.edtTimeFinalChange(Sender: TObject);
begin

  if (edtTimeStart.Checked and edtTimeStartTime.Checked
      and edtTimeFinal.Checked and edtTimeFinalTime.Checked)
  then
     begin
        btnGetGlobusDataClick(Sender);
     end;

end;

procedure TfrmENTravelSheetItemEdit.edtTimeStartChange(Sender: TObject);

begin
  inherited;

  if (edtTimeStart.Checked and edtTimeStartTime.Checked
      and edtTimeFinal.Checked and edtTimeFinalTime.Checked)
  then
     begin
        btnGetGlobusDataClick(Sender);
     end;

end;

procedure TfrmENTravelSheetItemEdit.actEditExecute(Sender: TObject);
var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  TempENTransportItem: ENTransportItemControllerSoapPort;
  TempENTravelSheetItemDistance : ENTravelSheetItemDistanceControllerSoapPort;

  travelSheet : ENTravelSheet;
  pi : ENPlanWorkItem;

  objCode : Integer;


begin

  if pcTravelSheetItemData.ActivePage = tsTransportItem then
  begin

      TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
      travelSheet := TempENTravelSheet.getObject(ENTravelSheetItemObj.travelSheetRef.code);

      TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
      try
       ObjCode := StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row])
      except
       on EConvertError do Exit;
      end;

      ENTransportItemObj := TempENTransportItem.getObject(objCode);

      TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
      pi :=  TempENPlanWorkItem.getObject(ENTransportItemObj.planItemRef.code);

       // AS 11.03.2011 теперь меняем все что угодно .. на сервере проверим ...
      //if ((travelSheet.typeRef.code in [TRAVEL_TYPE_KRAN, TRAVEL_TYPE_TRACTOR]) or (pi.kartaRef.code = TK_KARTA_CODE_POGRUZKA_RAZGRUZKA))
      //    and (travelSheet.statusRef.code = TRAVEL_STATUS_FACT)
      if  travelSheet.statusRef.code = TRAVEL_STATUS_FACT then
      begin
              frmENTransportItemFactEdit:= TfrmENTransportItemFactEdit.Create(Application, dsEdit);
              try
                frmENTransportItemFactEdit.transportItemCode := ENTransportItemObj.code;
                frmENTransportItemFactEdit.edtCountFact.Text := ENTransportItemObj.countWorkFact.DecimalString;
                if frmENTransportItemFactEdit.ShowModal = mrOk then
                  pcTravelSheetItemDataChange(Sender);
              finally
                frmENTransportItemFactEdit.Free;
                frmENTransportItemFactEdit:=nil;
              end;
      end
      else
        ShowMessage('Ця строка не коригується ...');
  end
  else
  if pcTravelSheetItemData.ActivePage = tsDistances then
  begin

      try
       ObjCode := StrToInt(sgENTravelSheetItemDistance.Cells[0,sgENTravelSheetItemDistance.Row])
      except
       on EConvertError do Exit;
      end;

      TempENTravelSheetItemDistance := HTTPRIOENTravelSheetItemDistance as ENTravelSheetItemDistanceControllerSoapPort;
      frmENTravelSheetItemDistanceEdit:=TfrmENTravelSheetItemDistanceEdit.Create(Application, dsEdit);
      ENTravelSheetItemDistanceObj := TempENTravelSheetItemDistance.getObject(objCode);
      try
        frmENTravelSheetItemDistanceEdit.ShowModal;
      finally
        frmENTravelSheetItemDistanceEdit.Free;
        frmENTravelSheetItemDistanceEdit:=nil;
        updateDistanceGrid();
      end;
  end;

end;

procedure TfrmENTravelSheetItemEdit.updateDistanceGrid();
var
  TempENTravelSheetItemDistance: ENTravelSheetItemDistanceControllerSoapPort;
  i, LastCount, LastRow : Integer;
  ENTravelSheetItemDistanceList: ENTravelSheetItemDistanceShortList;
  itemDistanceFilter :  ENTravelSheetItemDistanceFilter;

begin

  ClearGrid(sgENTravelSheetItemDistance);
  SetGridHeaders(ENTravelSheetItemDistanceHeaders, sgENTravelSheetItemDistance.ColumnHeaders);
  TempENTravelSheetItemDistance :=  HTTPRIOENTravelSheetItemDistance as ENTravelSheetItemDistanceControllerSoapPort;
  itemDistanceFilter := ENTravelSheetItemDistanceFilter.Create;
  SetNullIntProps(itemDistanceFilter);
  SetNullXSProps(itemDistanceFilter);
  itemDistanceFilter.travelSheetItemRef := ENTravelSheetItemRef.Create;
  itemDistanceFilter.travelSheetItemRef.code := ENTravelSheetItemObj.code;

  ENTravelSheetItemDistanceList := TempENTravelSheetItemDistance.getScrollableFilteredList(itemDistanceFilter,0,-1);

  LastCount:=High(ENTravelSheetItemDistanceList.list);

  if LastCount > -1 then
     sgENTravelSheetItemDistance.RowCount:=LastCount+2
  else
     sgENTravelSheetItemDistance.RowCount:=2;

     with sgENTravelSheetItemDistance do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemDistanceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetItemDistanceList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTravelSheetItemDistanceList.list[i].distance = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENTravelSheetItemDistanceList.list[i].distance.DecimalString;
        if ENTravelSheetItemDistanceList.list[i].sumMachineHours = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENTravelSheetItemDistanceList.list[i].sumMachineHours.DecimalString;
        if ENTravelSheetItemDistanceList.list[i].koef = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENTravelSheetItemDistanceList.list[i].koef.DecimalString;
        LastRow:=i+1;
        sgENTravelSheetItemDistance.RowCount:=LastRow+1;
      end;
   sgENTravelSheetItemDistance.Row:=1;

end;


procedure TfrmENTravelSheetItemEdit.actInsertExecute(Sender: TObject);
begin
  inherited;
  if pcTravelSheetItemData.ActivePage = tsDistances then
  begin
      frmENTravelSheetItemDistanceEdit:=TfrmENTravelSheetItemDistanceEdit.Create(Application, dsInsert);
      ENTravelSheetItemDistanceObj := ENTravelSheetItemDistance.Create;
      ENTravelSheetItemDistanceObj.travelSheetItemRef := ENTravelSheetItemRef.Create;
      ENTravelSheetItemDistanceObj.travelSheetItemRef.code := ENTravelSheetItemObj.code;
      try
        //frmENTravelSheetItemDistanceEdit.
        frmENTravelSheetItemDistanceEdit.ShowModal;
      finally
        frmENTravelSheetItemDistanceEdit.Free;
        frmENTravelSheetItemDistanceEdit:=nil;
        updateDistanceGrid();
      end;
  end;
end;

procedure TfrmENTravelSheetItemEdit.actDeleteDistanceExecute(
  Sender: TObject);
  var
TempENTravelSheetItemDistance : ENTravelSheetItemDistanceControllerSoapPort;
objCode : Integer;
begin
  inherited;
  try
    objCode := StrToInt(sgENTravelSheetItemDistance.Cells[0,sgENTravelSheetItemDistance.Row])
  except
  on EConvertError do Exit;
  end;

  TempENTravelSheetItemDistance := HTTPRIOENTravelSheetItemDistance as ENTravelSheetItemDistanceControllerSoapPort;
  TempENTravelSheetItemDistance.remove(objCode);
  updateDistanceGrid();
end;

end.
