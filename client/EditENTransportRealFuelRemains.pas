
unit EditENTransportRealFuelRemains;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRealFuelRemainsController ;

type
  TfrmENTransportRealFuelRemainsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
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
  

  HTTPRIOENTransportRealFuelRemains: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportRealFuelRemainsEdit: TfrmENTransportRealFuelRemainsEdit;
  ENTransportRealFuelRemainsObj: ENTransportRealFuelRemains;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTransportRealFuelRemainsController  ;
}
{$R *.dfm}



procedure TfrmENTransportRealFuelRemainsEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKTransportRealRealTransportName
      ,spbTKTransportRealRealTransport
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      ,edtDateFinal
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
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportRealFuelRemainsObj.code);
      if ENTransportRealFuelRemainsObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENTransportRealFuelRemainsObj.dateStart.Year,ENTransportRealFuelRemainsObj.dateStart.Month,ENTransportRealFuelRemainsObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if ENTransportRealFuelRemainsObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENTransportRealFuelRemainsObj.dateFinal.Year,ENTransportRealFuelRemainsObj.dateFinal.Month,ENTransportRealFuelRemainsObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;
    if ( ENTransportRealFuelRemainsObj.countGenStart <> nil ) then
       edtCountGenStart.Text := ENTransportRealFuelRemainsObj.countGenStart.decimalString
    else
       edtCountGenStart.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.priceGenStart <> nil ) then
       edtPriceGenStart.Text := ENTransportRealFuelRemainsObj.priceGenStart.decimalString
    else
       edtPriceGenStart.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.sumGenStart <> nil ) then
       edtSumGenStart.Text := ENTransportRealFuelRemainsObj.sumGenStart.decimalString
    else
       edtSumGenStart.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.countGenIn <> nil ) then
       edtCountGenIn.Text := ENTransportRealFuelRemainsObj.countGenIn.decimalString
    else
       edtCountGenIn.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.priceGenIn <> nil ) then
       edtPriceGenIn.Text := ENTransportRealFuelRemainsObj.priceGenIn.decimalString
    else
       edtPriceGenIn.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.sumGenIn <> nil ) then
       edtSumGenIn.Text := ENTransportRealFuelRemainsObj.sumGenIn.decimalString
    else
       edtSumGenIn.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.countGenOut <> nil ) then
       edtCountGenOut.Text := ENTransportRealFuelRemainsObj.countGenOut.decimalString
    else
       edtCountGenOut.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.priceGenOut <> nil ) then
       edtPriceGenOut.Text := ENTransportRealFuelRemainsObj.priceGenOut.decimalString
    else
       edtPriceGenOut.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.sumGenOut <> nil ) then
       edtSumGenOut.Text := ENTransportRealFuelRemainsObj.sumGenOut.decimalString
    else
       edtSumGenOut.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.countGenFinal <> nil ) then
       edtCountGenFinal.Text := ENTransportRealFuelRemainsObj.countGenFinal.decimalString
    else
       edtCountGenFinal.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.priceGenFinal <> nil ) then
       edtPriceGenFinal.Text := ENTransportRealFuelRemainsObj.priceGenFinal.decimalString
    else
       edtPriceGenFinal.Text := ''; 
    if ( ENTransportRealFuelRemainsObj.sumGenFinal <> nil ) then
       edtSumGenFinal.Text := ENTransportRealFuelRemainsObj.sumGenFinal.decimalString
    else
       edtSumGenFinal.Text := ''; 

    edtTKTransportRealRealTransportName.Text := ENTransportRealFuelRemainsObj.realTransport.name;

  end;
end;



procedure TfrmENTransportRealFuelRemainsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGenStart
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
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportRealFuelRemains := HTTPRIOENTransportRealFuelRemains as ENTransportRealFuelRemainsControllerSoapPort;


     if edtdateStart.checked then
     begin 
       if ENTransportRealFuelRemainsObj.dateStart = nil then
          ENTransportRealFuelRemainsObj.dateStart := TXSDate.Create;
       ENTransportRealFuelRemainsObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENTransportRealFuelRemainsObj.dateStart := nil;

     if edtdateFinal.checked then
     begin 
       if ENTransportRealFuelRemainsObj.dateFinal = nil then
          ENTransportRealFuelRemainsObj.dateFinal := TXSDate.Create;
       ENTransportRealFuelRemainsObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENTransportRealFuelRemainsObj.dateFinal := nil;

     if (ENTransportRealFuelRemainsObj.countGenStart = nil ) then
       ENTransportRealFuelRemainsObj.countGenStart := TXSDecimal.Create;
     if edtCountGenStart.Text <> '' then
       ENTransportRealFuelRemainsObj.countGenStart.decimalString := edtCountGenStart.Text 
     else
       ENTransportRealFuelRemainsObj.countGenStart := nil;

     if (ENTransportRealFuelRemainsObj.priceGenStart = nil ) then
       ENTransportRealFuelRemainsObj.priceGenStart := TXSDecimal.Create;
     if edtPriceGenStart.Text <> '' then
       ENTransportRealFuelRemainsObj.priceGenStart.decimalString := edtPriceGenStart.Text 
     else
       ENTransportRealFuelRemainsObj.priceGenStart := nil;

     if (ENTransportRealFuelRemainsObj.sumGenStart = nil ) then
       ENTransportRealFuelRemainsObj.sumGenStart := TXSDecimal.Create;
     if edtSumGenStart.Text <> '' then
       ENTransportRealFuelRemainsObj.sumGenStart.decimalString := edtSumGenStart.Text 
     else
       ENTransportRealFuelRemainsObj.sumGenStart := nil;

     if (ENTransportRealFuelRemainsObj.countGenIn = nil ) then
       ENTransportRealFuelRemainsObj.countGenIn := TXSDecimal.Create;
     if edtCountGenIn.Text <> '' then
       ENTransportRealFuelRemainsObj.countGenIn.decimalString := edtCountGenIn.Text 
     else
       ENTransportRealFuelRemainsObj.countGenIn := nil;

     if (ENTransportRealFuelRemainsObj.priceGenIn = nil ) then
       ENTransportRealFuelRemainsObj.priceGenIn := TXSDecimal.Create;
     if edtPriceGenIn.Text <> '' then
       ENTransportRealFuelRemainsObj.priceGenIn.decimalString := edtPriceGenIn.Text 
     else
       ENTransportRealFuelRemainsObj.priceGenIn := nil;

     if (ENTransportRealFuelRemainsObj.sumGenIn = nil ) then
       ENTransportRealFuelRemainsObj.sumGenIn := TXSDecimal.Create;
     if edtSumGenIn.Text <> '' then
       ENTransportRealFuelRemainsObj.sumGenIn.decimalString := edtSumGenIn.Text 
     else
       ENTransportRealFuelRemainsObj.sumGenIn := nil;

     if (ENTransportRealFuelRemainsObj.countGenOut = nil ) then
       ENTransportRealFuelRemainsObj.countGenOut := TXSDecimal.Create;
     if edtCountGenOut.Text <> '' then
       ENTransportRealFuelRemainsObj.countGenOut.decimalString := edtCountGenOut.Text 
     else
       ENTransportRealFuelRemainsObj.countGenOut := nil;

     if (ENTransportRealFuelRemainsObj.priceGenOut = nil ) then
       ENTransportRealFuelRemainsObj.priceGenOut := TXSDecimal.Create;
     if edtPriceGenOut.Text <> '' then
       ENTransportRealFuelRemainsObj.priceGenOut.decimalString := edtPriceGenOut.Text 
     else
       ENTransportRealFuelRemainsObj.priceGenOut := nil;

     if (ENTransportRealFuelRemainsObj.sumGenOut = nil ) then
       ENTransportRealFuelRemainsObj.sumGenOut := TXSDecimal.Create;
     if edtSumGenOut.Text <> '' then
       ENTransportRealFuelRemainsObj.sumGenOut.decimalString := edtSumGenOut.Text 
     else
       ENTransportRealFuelRemainsObj.sumGenOut := nil;

     if (ENTransportRealFuelRemainsObj.countGenFinal = nil ) then
       ENTransportRealFuelRemainsObj.countGenFinal := TXSDecimal.Create;
     if edtCountGenFinal.Text <> '' then
       ENTransportRealFuelRemainsObj.countGenFinal.decimalString := edtCountGenFinal.Text 
     else
       ENTransportRealFuelRemainsObj.countGenFinal := nil;

     if (ENTransportRealFuelRemainsObj.priceGenFinal = nil ) then
       ENTransportRealFuelRemainsObj.priceGenFinal := TXSDecimal.Create;
     if edtPriceGenFinal.Text <> '' then
       ENTransportRealFuelRemainsObj.priceGenFinal.decimalString := edtPriceGenFinal.Text 
     else
       ENTransportRealFuelRemainsObj.priceGenFinal := nil;

     if (ENTransportRealFuelRemainsObj.sumGenFinal = nil ) then
       ENTransportRealFuelRemainsObj.sumGenFinal := TXSDecimal.Create;
     if edtSumGenFinal.Text <> '' then
       ENTransportRealFuelRemainsObj.sumGenFinal.decimalString := edtSumGenFinal.Text 
     else
       ENTransportRealFuelRemainsObj.sumGenFinal := nil;

    if DialogState = dsInsert then
    begin
      ENTransportRealFuelRemainsObj.code:=low(Integer);
      TempENTransportRealFuelRemains.add(ENTransportRealFuelRemainsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportRealFuelRemains.save(ENTransportRealFuelRemainsObj);
    end;
  end;
end;


procedure TfrmENTransportRealFuelRemainsEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportRealFuelRemainsObj.realTransport = nil then ENTransportRealFuelRemainsObj.realTransport := TKTransportReal.Create();
               ENTransportRealFuelRemainsObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealRealTransportName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;



end.