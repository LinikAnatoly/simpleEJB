
unit EditENTravelSheetFuel;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetFuelController
  , ENTravelSheetFuelTypeController
  , TKTransportRealController
  , TKTransportRealHistoryController
  ;

type
  TfrmENTravelSheetFuelEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblSeries : TLabel;
    edtSeries: TEdit;
    lblNumbers : TLabel;
    edtNumbers: TMemo;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  
  lblTKFuelTypeFuelTypeName : TLabel;
  edtTKFuelTypeFuelTypeName : TEdit;
  spbTKFuelTypeFuelType : TSpeedButton;
  

  HTTPRIOENTravelSheetFuel: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENTravelSheetFuelType: TLabel;
    edtENTravelSheetFuelType: TEdit;
    spbENTravelSheetFuelType: TSpeedButton;
    HTTPRIOENTravelSheetFuelType: THTTPRIO;
    chkIsVRTU: TCheckBox;
    chkIsThirdParty: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);
  procedure spbTKFuelTypeFuelTypeClick(Sender : TObject);
    procedure spbENTravelSheetFuelTypeClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
    transportRealHistoryObj : TKTransportRealHistory;

end;

var
  frmENTravelSheetFuelEdit: TfrmENTravelSheetFuelEdit;
  ENTravelSheetFuelObj: ENTravelSheetFuel
  ;

implementation

uses
  ShowTKTransportReal
  ,ShowTKFuelType
  ,TKFuelTypeController
  ,ShowENTravelSheetFuelType
  ,ENConsts
, Math;

{uses  
    EnergyproController, EnergyproController2, ENTravelSheetFuelController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetFuelEdit.FormShow(Sender: TObject);
var
TempENTravelSheetFuelType : ENTravelSheetFuelTypeControllerSoapPort;
ENTravelSheetFuelTypeObj : ENTravelSheetFuelType;

begin

  SetFloatStyle([edtCountGen]);

  DisableControls([edtCode]);

  // Скрытие типа топлива (Основной и пр.), если у машины не стоит признак, что
  // у нее есть пусковой двигатель
  HideControls([lblENTravelSheetFuelType, edtENTravelSheetFuelType, spbENTravelSheetFuelType], transportRealHistoryObj.hasStarter <> TKTRANSPORTREAL_HASSTARTER);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKTransportRealRealTransportName
      ,spbTKTransportRealRealTransport
      ,edtTKFuelTypeFuelTypeName
      , spbTKFuelTypeFuelType
      , edtENTravelSheetFuelType
      , spbENTravelSheetFuelType
      , chkIsVRTU
       ]);
  end;

  if DialogState = dsInsert
  then
  begin
        TempENTravelSheetFuelType := HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
        ENTravelSheetFuelTypeObj := TempENTravelSheetFuelType.getObject(ENTRAVELSHEETFUELTYPE_MAIN);
        If ENTravelSheetFuelObj.travelSheetFuelTypeRef = nil then
          ENTravelSheetFuelObj.travelSheetFuelTypeRef := ENTravelSheetFuelTypeRef.Create;
        ENTravelSheetFuelObj.travelSheetFuelTypeRef.code := ENTRAVELSHEETFUELTYPE_MAIN;
        edtENTravelSheetFuelType.Text := ENTravelSheetFuelTypeObj.name;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

    DisableControls([edtTKFuelTypeFuelTypeName, edtENTravelSheetFuelType]);

    DenyBlankValues([
      edtCountGen
      ,edtDateGen
      ,edtTKFuelTypeFuelTypeName
      , edtSeries, edtNumbers
      , edtENTravelSheetFuelType
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTravelSheetFuelObj.code);
    if ( ENTravelSheetFuelObj.countGen <> nil ) then
       edtCountGen.Text := ENTravelSheetFuelObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    edtSeries.Text := ENTravelSheetFuelObj.series;

    if (ENTravelSheetFuelObj.isVRTU <> ENConsts.LOW_INT) then
    if ((ENTravelSheetFuelObj.isVRTU = ENConsts.LOW_INT) or
        (ENTravelSheetFuelObj.isVRTU = 0) ) then
    chkIsVRTU.Checked := False
    else
    if ENTravelSheetFuelObj.isVRTU = 1 then
    chkIsVRTU.Checked := True;

    chkIsThirdParty.Checked := (Assigned(ENTravelSheetFuelObj.isThirdParty)) and (ENTravelSheetFuelObj.isThirdParty.AsBoolean);

    MakeMultiline(edtNumbers.Lines, ENTravelSheetFuelObj.numbers);
      if ENTravelSheetFuelObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTravelSheetFuelObj.dateGen.Year,ENTravelSheetFuelObj.dateGen.Month,ENTravelSheetFuelObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    edtTKTransportRealRealTransportName.Text := ENTravelSheetFuelObj.realTransport.name;
    edtTKFuelTypeFuelTypeName.Text := ENTravelSheetFuelObj.fuelType.name;

    if(ENTravelSheetFuelObj.travelSheetFuelTypeRef.code <> Low(Integer)) then
    begin
        TempENTravelSheetFuelType := HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
        ENTravelSheetFuelTypeObj := TempENTravelSheetFuelType.getObject(ENTravelSheetFuelObj.travelSheetFuelTypeRef.code);
        edtENTravelSheetFuelType.Text := ENTravelSheetFuelTypeObj.name;
    end;

  end;
end;



procedure TfrmENTravelSheetFuelEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetFuel: ENTravelSheetFuelControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      ,edtTKFuelTypeFuelTypeName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTravelSheetFuel := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;


     if (ENTravelSheetFuelObj.countGen = nil ) then
       ENTravelSheetFuelObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENTravelSheetFuelObj.countGen.decimalString := edtCountGen.Text 
     else
       ENTravelSheetFuelObj.countGen := nil;

     ENTravelSheetFuelObj.series := edtSeries.Text;
     ENTravelSheetFuelObj.numbers := edtNumbers.Text;
     ENTravelSheetFuelObj.isThirdParty := GetTXSBooleanFromTCheckBox(chkIsThirdParty);

     if chkIsVRTU.Checked then
        ENTravelSheetFuelObj.isVRTU := 1
        else
        ENTravelSheetFuelObj.isVRTU := 0;

{
     if edtdateGen.checked then
     begin
       if ENTravelSheetFuelObj.dateGen = nil then
          ENTravelSheetFuelObj.dateGen := TXSDate.Create;
       ENTravelSheetFuelObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTravelSheetFuelObj.dateGen := nil;
}

    if DialogState = dsInsert then
    begin
      ENTravelSheetFuelObj.code:=low(Integer);
      TempENTravelSheetFuel.add(ENTravelSheetFuelObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetFuel.save(ENTravelSheetFuelObj);
    end;
  end;
end;


procedure TfrmENTravelSheetFuelEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFuelObj.realTransport = nil then ENTravelSheetFuelObj.realTransport := TKTransportReal.Create();
               ENTravelSheetFuelObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;



procedure TfrmENTravelSheetFuelEdit.spbTKFuelTypeFuelTypeClick(Sender : TObject);
var
   frmTKFuelTypeShow: TfrmTKFuelTypeShow;
   f : TKFuelTypeFilter;
begin

   f := TKFuelTypeFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.conditionSQL := 'code <> 75000004';

   frmTKFuelTypeShow:=TfrmTKFuelTypeShow.Create(Application,fmNormal, f);
   try
      with frmTKFuelTypeShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFuelObj.fuelType = nil then ENTravelSheetFuelObj.fuelType := TKFuelType.Create();
               ENTravelSheetFuelObj.fuelType.code := StrToInt(GetReturnValue(sgTKFuelType,0));
               edtTKFuelTypeFuelTypeName.Text:=GetReturnValue(sgTKFuelType,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmTKFuelTypeShow.Free;
   end;
end;



procedure TfrmENTravelSheetFuelEdit.spbENTravelSheetFuelTypeClick(
  Sender: TObject);
var
   frmENTravelSheetFuelTypeShow: TfrmENTravelSheetFuelTypeShow;
begin

   frmENTravelSheetFuelTypeShow:=TfrmENTravelSheetFuelTypeShow.Create(Application, fmNormal);
   try
      with frmENTravelSheetFuelTypeShow do
      begin
        DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFuelObj.travelSheetFuelTypeRef = nil then ENTravelSheetFuelObj.travelSheetFuelTypeRef := ENTravelSheetFuelTypeRef.Create();
               ENTravelSheetFuelObj.travelSheetFuelTypeRef.code := StrToInt(GetReturnValue(sgENTravelSheetFuelType,0));
               edtENTravelSheetFuelType.Text:=GetReturnValue(sgENTravelSheetFuelType,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTravelSheetFuelTypeShow.Free;
   end;
end;

end.