
unit EditENTransportRoute;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts, DMReportsUnit,
  	EnergyproController, EnergyproController2, ENTransportRouteController;

type
  TfrmENTransportRouteEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;
    lblDistance : TLabel;
    edtDistance: TEdit;
    lblWeight : TLabel;
    edtWeight: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  HTTPRIOENTransportRoute: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENDestinationPointStart: TLabel;
    edtENDestinationPointStart: TEdit;
    spbENDestinationPointStart: TSpeedButton;
    lblENDestinationPointEnd: TLabel;
    edtENDestinationPointEnd: TEdit;
    spbENDestinationPointEnd: TSpeedButton;
    HTTPRIOENElement: THTTPRIO;
    lblSpeedometerStart: TLabel;
    edtSpeedometerStart: TEdit;
    lblSpeedometerFinal: TLabel;
    edtSpeedometerFinal: TEdit;
    edtSumDistanceFact: TEdit;
    lblSumDistanceFact: TLabel;
    lblFuelCounterStart: TLabel;
    edtFuelCounterStart: TEdit;
    lblFuelCounterFinal: TLabel;
    edtFuelCounterFinal: TEdit;
    btnAddDistanceWithKoefs: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENDestinationPointStartClick(Sender: TObject);
  procedure spbENDestinationPointEndClick(Sender: TObject);
  procedure calcSumDistanceFact();
  procedure calcSpeedometerFinal();
    procedure edtSpeedometerFinalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbAddTransportRouteDistanceClick(Sender: TObject);
    procedure btnAddDistanceWithKoefsClick(Sender: TObject);
    procedure edtSumDistanceFactChange(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
    ENPlanWorkCode : Integer;
    isTravelSheet, fuelCalcByCounter : Boolean;

end;

var
  frmENTransportRouteEdit: TfrmENTransportRouteEdit;
  ENTransportRouteObj: ENTransportRoute;

implementation


uses ShowENDestinationPoint, ENDestinationPointController, ENElementController,
     ENDestinationPoint2PointController,
     ENTransportRouteDistanceController, ShowENTransportRouteDistance;

{$R *.dfm}


var
  invNum : String = '';
  objName : String = '';
  buhName : String = '';


procedure TfrmENTransportRouteEdit.FormShow(Sender: TObject);
var
  TempENElement : ENElementControllerSoapPort;
  elObj : ENElement;
  ENElementList : ENElementShortList;
  f : ENElementFilter;
  TempENDestinationPoint : ENDestinationPointControllerSoapPort;
  pointList : ENDestinationPointShort;

begin
  SetFloatStyle([edtDistance, edtWeight]);

  DisableControls([edtWeight]);

  // если не из путевого листа открывается форма, то прячется кнопка для разнесения дистанций с коэффициентами
  if(not isTravelSheet) then
            HideControls([btnAddDistanceWithKoefs]);

  if DialogState = dsView then
  begin
    DisableControls([spbENDestinationPointStart, spbENDestinationPointEnd]);
  end;

  //if DialogState = dsInsert then btnAddTransportRouteDistance.Visible := False;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENDestinationPointStart, edtENDestinationPointEnd]);
    DenyBlankValues([edtDistance, edtWeight, edtENDestinationPointStart, edtENDestinationPointEnd]);
  end;

  if (DialogState = dsInsert) then edtWeight.Text := '0';

  if (DialogState = dsInsert) then
  begin
    pointList := DMReports.getLastDestinationPointByPlan(ENPlanWorkCode);
    if (pointList <> nil) then
    begin
      if ENTransportRouteObj.elementInRef = nil then ENTransportRouteObj.elementInRef := ENElementRef.Create();

      ENTransportRouteObj.elementInRef.code := pointList.elementRefCode;
      edtENDestinationPointStart.Text := pointList.name;
      DisableControls([spbENDestinationPointStart]);

      ENTransportRouteObj.parentRouteRef := ENTransportRouteRef.Create;
      ENTransportRouteObj.parentRouteRef.code := DMReports.getLastRouteCodeByPlan(ENPlanWorkCode);
    end;
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportRouteObj.code);
    if ( ENTransportRouteObj.distance <> nil ) then
       edtDistance.Text := ENTransportRouteObj.distance.decimalString
    else
       edtDistance.Text := ''; 
    if ( ENTransportRouteObj.weight <> nil ) then
       edtWeight.Text := ENTransportRouteObj.weight.decimalString
    else
       edtWeight.Text := ''; 

    MakeMultiline(edtCommentGen.Lines, ENTransportRouteObj.commentGen);
      if ENTransportRouteObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTransportRouteObj.dateEdit.Year,ENTransportRouteObj.dateEdit.Month,ENTransportRouteObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtUserGen.Text := ENTransportRouteObj.userGen;

    if (ENTransportRouteObj.elementInRef <> nil) and (ENTransportRouteObj.elementInRef.code <> LOW_INT) then
    begin
      try
        f := ENElementFilter.Create;
        SetNullIntProps(f);
        SetNullXSProps(f);
        f.code := ENTransportRouteObj.elementInRef.code;

        ENElementList := DMReports.searchElements(ENElementFilter(f), 0, 100, invNum, objName, buhName);
        if ENElementList <> nil then
        begin
          edtENDestinationPointStart.Text := ENElementList.list[0].objectName;
        end;
        
      finally
      end;
    end;

    if (ENTransportRouteObj.elementOutRef <> nil) and (ENTransportRouteObj.elementOutRef.code <> LOW_INT) then
    begin
      try
        f := ENElementFilter.Create;
        SetNullIntProps(f);
        SetNullXSProps(f);
        f.code := ENTransportRouteObj.elementOutRef.code;

        ENElementList := DMReports.searchElements(ENElementFilter(f), 0, 100, invNum, objName, buhName);
        if ENElementList <> nil then
        begin
          edtENDestinationPointEnd.Text := ENElementList.list[0].objectName;
        end;
        
      finally
      end;
    end;

  end;
end;



procedure TfrmENTransportRouteEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRoute: ENTransportRouteControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtDistance, edtWeight, edtENDestinationPointStart, edtENDestinationPointEnd])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else

  if ((isTravelSheet) and (DialogState <> dsInsert)) and (not NoBlankValues([edtSpeedometerFinal])) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else

  if (fuelCalcByCounter) and (not NoBlankValues([edtFuelCounterFinal])) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else

  begin
    TempENTransportRoute := HTTPRIOENTransportRoute as ENTransportRouteControllerSoapPort;


     if (ENTransportRouteObj.distance = nil ) then
       ENTransportRouteObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENTransportRouteObj.distance.decimalString := edtDistance.Text 
     else
       ENTransportRouteObj.distance := nil;

     if (ENTransportRouteObj.weight = nil ) then
       ENTransportRouteObj.weight := TXSDecimal.Create;
     if edtWeight.Text <> '' then
       ENTransportRouteObj.weight.decimalString := edtWeight.Text 
     else
       ENTransportRouteObj.weight := nil;

     ENTransportRouteObj.commentGen := edtCommentGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENTransportRouteObj.dateEdit = nil then
          ENTransportRouteObj.dateEdit := TXSDateTime.Create;
       ENTransportRouteObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTransportRouteObj.dateEdit := nil;	   

     ENTransportRouteObj.userGen := edtUserGen.Text;

     if (isTravelSheet) then
     begin
       if (ENTransportRouteObj.speedometerStart = nil) then
         ENTransportRouteObj.speedometerStart := TXSDecimal.Create;
       if edtSpeedometerStart.Text <> '' then
         ENTransportRouteObj.speedometerStart.decimalString := edtSpeedometerStart.Text
       else
         ENTransportRouteObj.speedometerStart := nil;

       if (ENTransportRouteObj.speedometerFinal = nil) then
         ENTransportRouteObj.speedometerFinal := TXSDecimal.Create;
       if edtSpeedometerFinal.Text <> '' then
         ENTransportRouteObj.speedometerFinal.decimalString := edtSpeedometerFinal.Text
       else
         ENTransportRouteObj.speedometerFinal := nil;

       if (ENTransportRouteObj.distanceNew = nil) then
         ENTransportRouteObj.distanceNew := TXSDecimal.Create;
       if edtSumDistanceFact.Text <> '' then
         ENTransportRouteObj.distanceNew.decimalString := edtSumDistanceFact.Text
       else
         ENTransportRouteObj.distanceNew := nil;
     end;

     if (fuelCalcByCounter) then
     begin
       if edtFuelCounterStart.Text <> '' then
       begin
         ENTransportRouteObj.fuelCounterStart := TXSDecimal.Create;
         ENTransportRouteObj.fuelCounterStart.decimalString := edtFuelCounterStart.Text;
       end
       else
         ENTransportRouteObj.fuelCounterStart := nil;

       if edtFuelCounterFinal.Text <> '' then
       begin
         ENTransportRouteObj.fuelCounterFinal := TXSDecimal.Create;
         ENTransportRouteObj.fuelCounterFinal.decimalString := edtFuelCounterFinal.Text;
       end
       else
         ENTransportRouteObj.fuelCounterFinal := nil;
     end;

    if DialogState = dsInsert then
    begin
      ENTransportRouteObj.code:=low(Integer);
      if (isTravelSheet) then
         TempENTransportRoute.add(ENTransportRouteObj,true)
         else
         TempENTransportRoute.add(ENTransportRouteObj);
    end
    else
    if DialogState = dsEdit then
    begin
      if (isTravelSheet) then
        TempENTransportRoute.saveRoute2TravelSheetItem(ENTransportRouteObj)
      else
        TempENTransportRoute.save(ENTransportRouteObj);
    end;
  end;
end;


procedure TfrmENTransportRouteEdit.spbENDestinationPointStartClick(
  Sender: TObject);
var
   frmENDestinationPointShow: TfrmENDestinationPointShow;
   f : ENDestinationPointFilter;
   point2point : ENDestinationPoint2Point;
begin
   f := ENDestinationPointFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENDestinationPointShow := TfrmENDestinationPointShow.Create(Application,fmNormal, f);

   try
      with frmENDestinationPointShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENTransportRouteObj.elementInRef = nil then ENTransportRouteObj.elementInRef := ENElementRef.Create();
               ENTransportRouteObj.elementInRef.code := StrToInt(GetReturnValue(sgENDestinationPoint,4));
               edtENDestinationPointStart.Text := GetReturnValue(sgENDestinationPoint,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDestinationPointShow.Free;
   end;

   if (ENTransportRouteObj.elementOutRef <> nil) and (ENTransportRouteObj.elementOutRef.code <> Low_int) and
   (ENTransportRouteObj.elementInRef <> nil) and (ENTransportRouteObj.elementInRef.code <> Low_int) then
   begin
     point2point := ENDestinationPoint2Point.Create;
     point2point := DMReports.getDistanceByPoint2Point(ENTransportRouteObj.elementInRef.code, ENTransportRouteObj.elementOutRef.code);
     if (point2point.code <> Low_int) then
       edtDistance.Text := point2point.distance.DecimalString;
   end;

end;


procedure TfrmENTransportRouteEdit.spbENDestinationPointEndClick(
  Sender: TObject);
var
   frmENDestinationPointShow: TfrmENDestinationPointShow;
   f : ENDestinationPointFilter;
   point2point : ENDestinationPoint2Point;
begin
   f := ENDestinationPointFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENDestinationPointShow := TfrmENDestinationPointShow.Create(Application,fmNormal, f);

   try
      with frmENDestinationPointShow do begin
        if ShowModal = mrOk then
        begin
            try
               if ENTransportRouteObj.elementOutRef = nil then ENTransportRouteObj.elementOutRef := ENElementRef.Create();
               ENTransportRouteObj.elementOutRef.code := StrToInt(GetReturnValue(sgENDestinationPoint,4));
               edtENDestinationPointEnd.Text:= GetReturnValue(sgENDestinationPoint,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDestinationPointShow.Free;
   end;

   if (ENTransportRouteObj.elementInRef <> nil) and (ENTransportRouteObj.elementInRef.code <> Low_int) and
   (ENTransportRouteObj.elementOutRef <> nil) and (ENTransportRouteObj.elementOutRef.code <> Low_int) then
   begin
     point2point := ENDestinationPoint2Point.Create;
     point2point := DMReports.getDistanceByPoint2Point(ENTransportRouteObj.elementInRef.code, ENTransportRouteObj.elementOutRef.code);
     if (point2point.code <> Low_int) then
       edtDistance.Text := point2point.distance.DecimalString;
   end;

end;


procedure TfrmENTransportRouteEdit.edtSpeedometerFinalChange(
  Sender: TObject);
begin
  inherited;
  calcSumDistanceFact();
end;


procedure TfrmENTransportRouteEdit.edtSumDistanceFactChange(Sender: TObject);
begin
  inherited;
calcSpeedometerFinal();
end;

procedure TfrmENTransportRouteEdit.calcSumDistanceFact();
var
  start, final, sum_ : Double;
begin

  sum_ := 0;
  
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
    edtSumDistanceFact.Text := '0'
  else
    edtSumDistanceFact.Text := FloatToStr(sum_);

end;


procedure TfrmENTransportRouteEdit.FormCreate(Sender: TObject);
begin
  isTravelSheet := False;
  fuelCalcByCounter := False;
end;



procedure TfrmENTransportRouteEdit.calcSpeedometerFinal();
var
  start, distance, sum_ : Double;
begin

  sum_ := 0;

  try
    start := StrToFloat(edtSpeedometerStart.Text);
  except
    on EConvertError do
    sum_ := 0;
  end;

  try
    distance := StrToFloat(edtSumDistanceFact.Text);
  except
    on EConvertError do
    sum_ := 0;
  end;

  sum_ := Conv(distance + start , 2);
  if (sum_ <= 0) then
    edtSpeedometerFinal.Text := '0'
  else
    edtSpeedometerFinal.Text := FloatToStr(sum_);

end;


{
procedure TfrmENTransportRouteEdit.calcSumDistanceFact();
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
}

procedure TfrmENTransportRouteEdit.spbAddTransportRouteDistanceClick(
  Sender: TObject);
var
frmENTransportRouteDistanceShow : TfrmENTransportRouteDistanceShow;
//ENTransportRouteDistanceFilterObj : ENTransportRouteDistanceFilter;
objCode : Integer;

begin
  inherited;
  //if ENTransportRouteDistanceFilterObj = nil then ENTransportRouteDistanceFilterObj := ENTransportRouteDistanceFilter.Create;
  //SetNullXSProps(ENTransportRouteDistanceFilterObj);
  //SetNullIntProps(ENTransportRouteDistanceFilterObj);
  //if ENTransportRouteDistanceFilterObj.transportRouteRef = nil then ENTransportRouteDistanceFilterObj.transportRouteRef := ENTransportRouteRef.Create;
  //ENTransportRouteDistanceFilterObj.transportRouteRef.code := ENTransportRouteObj.code;
  frmENTransportRouteDistanceShow := TfrmENTransportRouteDistanceShow.Create(Application, fmNormal {, ENTransportRouteDistanceFilterObj});
    try
      with frmENTransportRouteDistanceShow do
      begin

        transportRouteCode := ENTransportRouteObj.code;
        DisableActions([ actNoFilter,actFilter]);
        if ShowModal = mrOk then
        begin
           try
            objCode := StrToInt(GetReturnValue(sgENTransportRouteDistance,0));
           except
        on EConvertError do
          Exit;
        end;
        end;
      end;
   finally
      frmENTransportRouteDistanceShow.Free;
   end;


end;

procedure TfrmENTransportRouteEdit.btnAddDistanceWithKoefsClick(
  Sender: TObject);
var
frmENTransportRouteDistanceShow : TfrmENTransportRouteDistanceShow;
//ENTransportRouteDistanceFilterObj : ENTransportRouteDistanceFilter;
objCode : Integer;

begin
  inherited;
  //if ENTransportRouteDistanceFilterObj = nil then ENTransportRouteDistanceFilterObj := ENTransportRouteDistanceFilter.Create;
  //SetNullXSProps(ENTransportRouteDistanceFilterObj);
  //SetNullIntProps(ENTransportRouteDistanceFilterObj);
  //if ENTransportRouteDistanceFilterObj.transportRouteRef = nil then ENTransportRouteDistanceFilterObj.transportRouteRef := ENTransportRouteRef.Create;
  //ENTransportRouteDistanceFilterObj.transportRouteRef.code := ENTransportRouteObj.code;
  frmENTransportRouteDistanceShow := TfrmENTransportRouteDistanceShow.Create(Application, fmNormal {, ENTransportRouteDistanceFilterObj});
    try
      with frmENTransportRouteDistanceShow do
      begin

        transportRouteCode := ENTransportRouteObj.code;
        DisableActions([ actNoFilter,actFilter]);
        if ShowModal = mrOk then
        begin
           try
            objCode := StrToInt(GetReturnValue(sgENTransportRouteDistance,0));
           except
        on EConvertError do
          Exit;
        end;
        end;
      end;
   finally
      frmENTransportRouteDistanceShow.Free;
   end;


end;


end.
