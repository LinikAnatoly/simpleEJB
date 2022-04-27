
unit EditENTravelSheetFuelRemains;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetFuelRemainsController
  , TKTransportRealHistoryController ;

type
  TfrmENTravelSheetFuelRemainsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCountGenStart : TLabel;
    edtCountGenStart: TEdit;
    lblPriceGenStart : TLabel;
    edtPriceGenStart: TEdit;
    lblSumGenStart : TLabel;
    edtSumGenStart: TEdit;
    lblCountGenIn : TLabel;
    edtCountGenIn: TEdit;
    lblPriceGenIn : TLabel;
    edtPriceGenIn: TEdit;
    lblSumGenIn : TLabel;
    edtSumGenIn: TEdit;
    lblCountGenOut : TLabel;
    edtCountGenOut: TEdit;
    lblPriceGenOut : TLabel;
    edtPriceGenOut: TEdit;
    lblSumGenOut : TLabel;
    edtSumGenOut: TEdit;
    lblCountGenFinal : TLabel;
    edtCountGenFinal: TEdit;
    lblPriceGenFinal : TLabel;
    edtPriceGenFinal: TEdit;
    lblSumGenFinal : TLabel;
    edtSumGenFinal: TEdit;

  lblTKTransportRealRealTransportName : TLabel;
  edtTKTransportRealRealTransportName : TEdit;
  spbTKTransportRealRealTransport : TSpeedButton;
  

  HTTPRIOENTravelSheetFuelRemains: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblFuelType: TLabel;
    edtTKFuelTypeFuelTypeName: TEdit;
    spbTKFuelTypeFuelType: TSpeedButton;
    HTTPRIOTKFuelType: THTTPRIO;
    lblENTravelSheetFuelType: TLabel;
    spbENTravelSheetFuelType: TSpeedButton;
    edtENTravelSheetFuelType: TEdit;
    HTTPRIOENTravelSheetFuelType: THTTPRIO;
    chkIsThirdParty: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);
    procedure spbTKFuelTypeFuelTypeClick(Sender: TObject);
    procedure CalcSum;
    procedure edtCountGenStartChange(Sender: TObject);
    procedure spbENTravelSheetFuelTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    transportRealHistoryObj : TKTransportRealHistory;
end;

var
  frmENTravelSheetFuelRemainsEdit: TfrmENTravelSheetFuelRemainsEdit;
  ENTravelSheetFuelRemainsObj: ENTravelSheetFuelRemains;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
, ShowTKFuelType, TKFuelTypeController
, ShowENTravelSheetFuelType
, ENTravelSheetFuelTypeController
, ENConsts
;

{uses  
    EnergyproController, EnergyproController2, ENTravelSheetFuelRemainsController  ;
}
{$R *.dfm}


procedure TfrmENTravelSheetFuelRemainsEdit.CalcSum;
var
  count_, sum_, price_ : Double;
begin

  try
    count_ := StrToFloat(edtCountGenStart.Text);
  except
    on EConvertError do
    count_ := 0;
  end;

  try
    price_ := StrToFloat(edtPriceGenStart.Text);
  except
    on EConvertError do
    price_ := 0;
  end;

  sum_ := Conv(count_ * price_ , 2);
  edtSumGenStart.Text := FloatToStr(sum_);

end;

procedure TfrmENTravelSheetFuelRemainsEdit.FormShow(Sender: TObject);
var TempTKFuelType: TKFuelTypeControllerSoapPort;
    TempENTravelSheetFuelType : ENTravelSheetFuelTypeControllerSoapPort;
    fuelTypeObj: TKFuelType;
    ENTravelSheetFuelTypeObj : ENTravelSheetFuelType;
begin

  SetFloatStyle([edtCountGenStart, edtSumGenStart, edtPriceGenStart]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKTransportRealRealTransportName
      ,spbTKTransportRealRealTransport
      , edtTKFuelTypeFuelTypeName
      , spbTKFuelTypeFuelType
      , edtENTravelSheetFuelType
      , spbENTravelSheetFuelType
       ]);
  end;

  if DialogState = dsInsert
  then
  begin
        TempENTravelSheetFuelType := HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
        ENTravelSheetFuelTypeObj := TempENTravelSheetFuelType.getObject(ENTRAVELSHEETFUELTYPE_MAIN);
        If ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef = nil then
          ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef := ENTravelSheetFuelTypeRef.Create;
        ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef.code := ENTRAVELSHEETFUELTYPE_MAIN;
        edtENTravelSheetFuelType.Text := ENTravelSheetFuelTypeObj.name;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtTKFuelTypeFuelTypeName, edtENTravelSheetFuelType]);
    DenyBlankValues([
      edtDateGen
      ,edtCountGenStart
      ,edtPriceGenStart
      ,edtSumGenStart
      ,edtCountGenIn
      ,edtPriceGenIn
      ,edtSumGenIn
      ,edtCountGenOut
      ,edtPriceGenOut
      ,edtSumGenOut
      ,edtCountGenFinal
      ,edtPriceGenFinal
      ,edtSumGenFinal
      , edtTKFuelTypeFuelTypeName
      , edtENTravelSheetFuelType
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTravelSheetFuelRemainsObj.code);
      if ENTravelSheetFuelRemainsObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTravelSheetFuelRemainsObj.dateGen.Year,ENTravelSheetFuelRemainsObj.dateGen.Month,ENTravelSheetFuelRemainsObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    if ( ENTravelSheetFuelRemainsObj.countGenStart <> nil ) then
       edtCountGenStart.Text := ENTravelSheetFuelRemainsObj.countGenStart.decimalString
    else
       edtCountGenStart.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.priceGenStart <> nil ) then
       edtPriceGenStart.Text := ENTravelSheetFuelRemainsObj.priceGenStart.decimalString
    else
       edtPriceGenStart.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.sumGenStart <> nil ) then
       edtSumGenStart.Text := ENTravelSheetFuelRemainsObj.sumGenStart.decimalString
    else
       edtSumGenStart.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.countGenIn <> nil ) then
       edtCountGenIn.Text := ENTravelSheetFuelRemainsObj.countGenIn.decimalString
    else
       edtCountGenIn.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.priceGenIn <> nil ) then
       edtPriceGenIn.Text := ENTravelSheetFuelRemainsObj.priceGenIn.decimalString
    else
       edtPriceGenIn.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.sumGenIn <> nil ) then
       edtSumGenIn.Text := ENTravelSheetFuelRemainsObj.sumGenIn.decimalString
    else
       edtSumGenIn.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.countGenOut <> nil ) then
       edtCountGenOut.Text := ENTravelSheetFuelRemainsObj.countGenOut.decimalString
    else
       edtCountGenOut.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.priceGenOut <> nil ) then
       edtPriceGenOut.Text := ENTravelSheetFuelRemainsObj.priceGenOut.decimalString
    else
       edtPriceGenOut.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.sumGenOut <> nil ) then
       edtSumGenOut.Text := ENTravelSheetFuelRemainsObj.sumGenOut.decimalString
    else
       edtSumGenOut.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.countGenFinal <> nil ) then
       edtCountGenFinal.Text := ENTravelSheetFuelRemainsObj.countGenFinal.decimalString
    else
       edtCountGenFinal.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.priceGenFinal <> nil ) then
       edtPriceGenFinal.Text := ENTravelSheetFuelRemainsObj.priceGenFinal.decimalString
    else
       edtPriceGenFinal.Text := ''; 
    if ( ENTravelSheetFuelRemainsObj.sumGenFinal <> nil ) then
       edtSumGenFinal.Text := ENTravelSheetFuelRemainsObj.sumGenFinal.decimalString
    else
       edtSumGenFinal.Text := ''; 

    edtTKTransportRealRealTransportName.Text := ENTravelSheetFuelRemainsObj.realTransport.name;

    chkIsThirdParty.Checked := (Assigned(ENTravelSheetFuelRemainsObj.isThirdParty)) and (ENTravelSheetFuelRemainsObj.isThirdParty.AsBoolean);

    if ENTravelSheetFuelRemainsObj.fuelTypeRef <> nil then
    begin
      TempTKFuelType := HTTPRIOTKFuelType as TKFuelTypeControllerSoapPort;
      fuelTypeObj := TempTKFuelType.getObject(ENTravelSheetFuelRemainsObj.fuelTypeRef.code);
      if fuelTypeObj <> nil then
        edtTKFuelTypeFuelTypeName.Text := fuelTypeObj.name;
    end;
    
    if(ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef.code <> Low(Integer)) then
    begin
        TempENTravelSheetFuelType := HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
        ENTravelSheetFuelTypeObj := TempENTravelSheetFuelType.getObject(ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef.code);
        edtENTravelSheetFuelType.Text := ENTravelSheetFuelTypeObj.name;
    end;
  end;
end;



procedure TfrmENTravelSheetFuelRemainsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGenStart
      ,edtPriceGenStart
      ,edtSumGenStart
      ,edtTKFuelTypeFuelTypeName
      {
      ,edtCountGenIn
      ,edtPriceGenIn
      ,edtSumGenIn
      ,edtCountGenOut
      ,edtPriceGenOut
      ,edtSumGenOut
      ,edtCountGenFinal
      ,edtPriceGenFinal
      ,edtSumGenFinal
      }
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTravelSheetFuelRemains := HTTPRIOENTravelSheetFuelRemains as ENTravelSheetFuelRemainsControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENTravelSheetFuelRemainsObj.dateGen = nil then
          ENTravelSheetFuelRemainsObj.dateGen := TXSDate.Create;
       ENTravelSheetFuelRemainsObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTravelSheetFuelRemainsObj.dateGen := nil;

     if (ENTravelSheetFuelRemainsObj.countGenStart = nil ) then
       ENTravelSheetFuelRemainsObj.countGenStart := TXSDecimal.Create;
     if edtCountGenStart.Text <> '' then
       ENTravelSheetFuelRemainsObj.countGenStart.decimalString := edtCountGenStart.Text 
     else
       ENTravelSheetFuelRemainsObj.countGenStart := nil;

     if (ENTravelSheetFuelRemainsObj.priceGenStart = nil ) then
       ENTravelSheetFuelRemainsObj.priceGenStart := TXSDecimal.Create;
     if edtPriceGenStart.Text <> '' then
       ENTravelSheetFuelRemainsObj.priceGenStart.decimalString := edtPriceGenStart.Text 
     else
       ENTravelSheetFuelRemainsObj.priceGenStart := nil;

     if (ENTravelSheetFuelRemainsObj.sumGenStart = nil ) then
       ENTravelSheetFuelRemainsObj.sumGenStart := TXSDecimal.Create;
     if edtSumGenStart.Text <> '' then
       ENTravelSheetFuelRemainsObj.sumGenStart.decimalString := edtSumGenStart.Text 
     else
       ENTravelSheetFuelRemainsObj.sumGenStart := nil;

     if (ENTravelSheetFuelRemainsObj.countGenIn = nil ) then
       ENTravelSheetFuelRemainsObj.countGenIn := TXSDecimal.Create;
     if edtCountGenIn.Text <> '' then
       ENTravelSheetFuelRemainsObj.countGenIn.decimalString := edtCountGenIn.Text 
     else
       ENTravelSheetFuelRemainsObj.countGenIn := nil;

     if (ENTravelSheetFuelRemainsObj.priceGenIn = nil ) then
       ENTravelSheetFuelRemainsObj.priceGenIn := TXSDecimal.Create;
     if edtPriceGenIn.Text <> '' then
       ENTravelSheetFuelRemainsObj.priceGenIn.decimalString := edtPriceGenIn.Text 
     else
       ENTravelSheetFuelRemainsObj.priceGenIn := nil;

     if (ENTravelSheetFuelRemainsObj.sumGenIn = nil ) then
       ENTravelSheetFuelRemainsObj.sumGenIn := TXSDecimal.Create;
     if edtSumGenIn.Text <> '' then
       ENTravelSheetFuelRemainsObj.sumGenIn.decimalString := edtSumGenIn.Text 
     else
       ENTravelSheetFuelRemainsObj.sumGenIn := nil;

     if (ENTravelSheetFuelRemainsObj.countGenOut = nil ) then
       ENTravelSheetFuelRemainsObj.countGenOut := TXSDecimal.Create;
     if edtCountGenOut.Text <> '' then
       ENTravelSheetFuelRemainsObj.countGenOut.decimalString := edtCountGenOut.Text 
     else
       ENTravelSheetFuelRemainsObj.countGenOut := nil;

     if (ENTravelSheetFuelRemainsObj.priceGenOut = nil ) then
       ENTravelSheetFuelRemainsObj.priceGenOut := TXSDecimal.Create;
     if edtPriceGenOut.Text <> '' then
       ENTravelSheetFuelRemainsObj.priceGenOut.decimalString := edtPriceGenOut.Text 
     else
       ENTravelSheetFuelRemainsObj.priceGenOut := nil;

     if (ENTravelSheetFuelRemainsObj.sumGenOut = nil ) then
       ENTravelSheetFuelRemainsObj.sumGenOut := TXSDecimal.Create;
     if edtSumGenOut.Text <> '' then
       ENTravelSheetFuelRemainsObj.sumGenOut.decimalString := edtSumGenOut.Text 
     else
       ENTravelSheetFuelRemainsObj.sumGenOut := nil;

     if (ENTravelSheetFuelRemainsObj.countGenFinal = nil ) then
       ENTravelSheetFuelRemainsObj.countGenFinal := TXSDecimal.Create;
     if edtCountGenFinal.Text <> '' then
       ENTravelSheetFuelRemainsObj.countGenFinal.decimalString := edtCountGenFinal.Text 
     else
       ENTravelSheetFuelRemainsObj.countGenFinal := nil;

     if (ENTravelSheetFuelRemainsObj.priceGenFinal = nil ) then
       ENTravelSheetFuelRemainsObj.priceGenFinal := TXSDecimal.Create;
     if edtPriceGenFinal.Text <> '' then
       ENTravelSheetFuelRemainsObj.priceGenFinal.decimalString := edtPriceGenFinal.Text 
     else
       ENTravelSheetFuelRemainsObj.priceGenFinal := nil;

     if (ENTravelSheetFuelRemainsObj.sumGenFinal = nil ) then
       ENTravelSheetFuelRemainsObj.sumGenFinal := TXSDecimal.Create;
     if edtSumGenFinal.Text <> '' then
       ENTravelSheetFuelRemainsObj.sumGenFinal.decimalString := edtSumGenFinal.Text 
     else
       ENTravelSheetFuelRemainsObj.sumGenFinal := nil;

    if DialogState = dsInsert then
    begin
      ENTravelSheetFuelRemainsObj.code:=low(Integer);
      TempENTravelSheetFuelRemains.add(ENTravelSheetFuelRemainsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetFuelRemains.save(ENTravelSheetFuelRemainsObj);
    end;
  end;
end;


procedure TfrmENTravelSheetFuelRemainsEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFuelRemainsObj.realTransport = nil then ENTravelSheetFuelRemainsObj.realTransport := TKTransportReal.Create();
               ENTravelSheetFuelRemainsObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;



procedure TfrmENTravelSheetFuelRemainsEdit.spbTKFuelTypeFuelTypeClick(
  Sender: TObject);
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
               if ENTravelSheetFuelRemainsObj.fuelTypeRef = nil then ENTravelSheetFuelRemainsObj.fuelTypeRef := TKFuelTypeRef.Create();
               ENTravelSheetFuelRemainsObj.fuelTypeRef.code := StrToInt(GetReturnValue(sgTKFuelType,0));
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
procedure TfrmENTravelSheetFuelRemainsEdit.edtCountGenStartChange(
  Sender: TObject);
begin
  inherited;
  CalcSum;
end;

procedure TfrmENTravelSheetFuelRemainsEdit.spbENTravelSheetFuelTypeClick(
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
               if ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef = nil then ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef := ENTravelSheetFuelTypeRef.Create();
               ENTravelSheetFuelRemainsObj.travelSheetFuelTypeRef.code := StrToInt(GetReturnValue(sgENTravelSheetFuelType,0));
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