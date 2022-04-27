
unit EditENTravelSheetFuelRemainsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetFuelRemainsController ;

type
  TfrmENTravelSheetFuelRemainsFilterEdit = class(TDialogForm)

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

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKTransportRealRealTransportClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTravelSheetFuelRemainsFilterEdit: TfrmENTravelSheetFuelRemainsFilterEdit;
  ENTravelSheetFuelRemainsFilterObj: ENTravelSheetFuelRemainsFilter;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTravelSheetFuelRemainsController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetFuelRemainsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
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
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

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


  end;

}

end;



procedure TfrmENTravelSheetFuelRemainsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetFuelRemains: ENTravelSheetFuelRemainsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if ENTravelSheetFuelRemainsFilterObj.dateGen = nil then
          ENTravelSheetFuelRemainsFilterObj.dateGen := TXSDate.Create;
       ENTravelSheetFuelRemainsFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTravelSheetFuelRemainsFilterObj.dateGen := nil;



     if (ENTravelSheetFuelRemainsFilterObj.countGenStart = nil ) then
       ENTravelSheetFuelRemainsFilterObj.countGenStart := TXSDecimal.Create;
     if edtCountGenStart.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.countGenStart.decimalString := edtCountGenStart.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.countGenStart := nil;




     if (ENTravelSheetFuelRemainsFilterObj.priceGenStart = nil ) then
       ENTravelSheetFuelRemainsFilterObj.priceGenStart := TXSDecimal.Create;
     if edtPriceGenStart.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.priceGenStart.decimalString := edtPriceGenStart.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.priceGenStart := nil;




     if (ENTravelSheetFuelRemainsFilterObj.sumGenStart = nil ) then
       ENTravelSheetFuelRemainsFilterObj.sumGenStart := TXSDecimal.Create;
     if edtSumGenStart.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.sumGenStart.decimalString := edtSumGenStart.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.sumGenStart := nil;




     if (ENTravelSheetFuelRemainsFilterObj.countGenIn = nil ) then
       ENTravelSheetFuelRemainsFilterObj.countGenIn := TXSDecimal.Create;
     if edtCountGenIn.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.countGenIn.decimalString := edtCountGenIn.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.countGenIn := nil;




     if (ENTravelSheetFuelRemainsFilterObj.priceGenIn = nil ) then
       ENTravelSheetFuelRemainsFilterObj.priceGenIn := TXSDecimal.Create;
     if edtPriceGenIn.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.priceGenIn.decimalString := edtPriceGenIn.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.priceGenIn := nil;




     if (ENTravelSheetFuelRemainsFilterObj.sumGenIn = nil ) then
       ENTravelSheetFuelRemainsFilterObj.sumGenIn := TXSDecimal.Create;
     if edtSumGenIn.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.sumGenIn.decimalString := edtSumGenIn.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.sumGenIn := nil;




     if (ENTravelSheetFuelRemainsFilterObj.countGenOut = nil ) then
       ENTravelSheetFuelRemainsFilterObj.countGenOut := TXSDecimal.Create;
     if edtCountGenOut.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.countGenOut.decimalString := edtCountGenOut.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.countGenOut := nil;




     if (ENTravelSheetFuelRemainsFilterObj.priceGenOut = nil ) then
       ENTravelSheetFuelRemainsFilterObj.priceGenOut := TXSDecimal.Create;
     if edtPriceGenOut.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.priceGenOut.decimalString := edtPriceGenOut.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.priceGenOut := nil;




     if (ENTravelSheetFuelRemainsFilterObj.sumGenOut = nil ) then
       ENTravelSheetFuelRemainsFilterObj.sumGenOut := TXSDecimal.Create;
     if edtSumGenOut.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.sumGenOut.decimalString := edtSumGenOut.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.sumGenOut := nil;




     if (ENTravelSheetFuelRemainsFilterObj.countGenFinal = nil ) then
       ENTravelSheetFuelRemainsFilterObj.countGenFinal := TXSDecimal.Create;
     if edtCountGenFinal.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.countGenFinal.decimalString := edtCountGenFinal.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.countGenFinal := nil;




     if (ENTravelSheetFuelRemainsFilterObj.priceGenFinal = nil ) then
       ENTravelSheetFuelRemainsFilterObj.priceGenFinal := TXSDecimal.Create;
     if edtPriceGenFinal.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.priceGenFinal.decimalString := edtPriceGenFinal.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.priceGenFinal := nil;




     if (ENTravelSheetFuelRemainsFilterObj.sumGenFinal = nil ) then
       ENTravelSheetFuelRemainsFilterObj.sumGenFinal := TXSDecimal.Create;
     if edtSumGenFinal.Text <> '' then
       ENTravelSheetFuelRemainsFilterObj.sumGenFinal.decimalString := edtSumGenFinal.Text 
     else
       ENTravelSheetFuelRemainsFilterObj.sumGenFinal := nil;





  end;
end;

procedure TfrmENTravelSheetFuelRemainsFilterEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFuelRemainsFilterObj.realTransport = nil then ENTravelSheetFuelRemainsFilterObj.realTransport := TKTransportReal.Create();
               ENTravelSheetFuelRemainsFilterObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
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