
unit EditENTransportRealFuelRemainsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRealFuelRemainsController ;

type
  TfrmENTransportRealFuelRemainsFilterEdit = class(TDialogForm)

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
  frmENTransportRealFuelRemainsFilterEdit: TfrmENTransportRealFuelRemainsFilterEdit;
  ENTransportRealFuelRemainsFilterObj: ENTransportRealFuelRemainsFilter;

implementation

uses
  ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTransportRealFuelRemainsController  ;
}
{$R *.dfm}



procedure TfrmENTransportRealFuelRemainsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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


  end;

}

end;



procedure TfrmENTransportRealFuelRemainsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRealFuelRemains: ENTransportRealFuelRemainsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateStart.checked then
     begin 
       if ENTransportRealFuelRemainsFilterObj.dateStart = nil then
          ENTransportRealFuelRemainsFilterObj.dateStart := TXSDate.Create;
       ENTransportRealFuelRemainsFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENTransportRealFuelRemainsFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if ENTransportRealFuelRemainsFilterObj.dateFinal = nil then
          ENTransportRealFuelRemainsFilterObj.dateFinal := TXSDate.Create;
       ENTransportRealFuelRemainsFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENTransportRealFuelRemainsFilterObj.dateFinal := nil;



     if (ENTransportRealFuelRemainsFilterObj.countGenStart = nil ) then
       ENTransportRealFuelRemainsFilterObj.countGenStart := TXSDecimal.Create;
     if edtCountGenStart.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.countGenStart.decimalString := edtCountGenStart.Text 
     else
       ENTransportRealFuelRemainsFilterObj.countGenStart := nil;




     if (ENTransportRealFuelRemainsFilterObj.priceGenStart = nil ) then
       ENTransportRealFuelRemainsFilterObj.priceGenStart := TXSDecimal.Create;
     if edtPriceGenStart.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.priceGenStart.decimalString := edtPriceGenStart.Text 
     else
       ENTransportRealFuelRemainsFilterObj.priceGenStart := nil;




     if (ENTransportRealFuelRemainsFilterObj.sumGenStart = nil ) then
       ENTransportRealFuelRemainsFilterObj.sumGenStart := TXSDecimal.Create;
     if edtSumGenStart.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.sumGenStart.decimalString := edtSumGenStart.Text 
     else
       ENTransportRealFuelRemainsFilterObj.sumGenStart := nil;




     if (ENTransportRealFuelRemainsFilterObj.countGenIn = nil ) then
       ENTransportRealFuelRemainsFilterObj.countGenIn := TXSDecimal.Create;
     if edtCountGenIn.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.countGenIn.decimalString := edtCountGenIn.Text 
     else
       ENTransportRealFuelRemainsFilterObj.countGenIn := nil;




     if (ENTransportRealFuelRemainsFilterObj.priceGenIn = nil ) then
       ENTransportRealFuelRemainsFilterObj.priceGenIn := TXSDecimal.Create;
     if edtPriceGenIn.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.priceGenIn.decimalString := edtPriceGenIn.Text 
     else
       ENTransportRealFuelRemainsFilterObj.priceGenIn := nil;




     if (ENTransportRealFuelRemainsFilterObj.sumGenIn = nil ) then
       ENTransportRealFuelRemainsFilterObj.sumGenIn := TXSDecimal.Create;
     if edtSumGenIn.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.sumGenIn.decimalString := edtSumGenIn.Text 
     else
       ENTransportRealFuelRemainsFilterObj.sumGenIn := nil;




     if (ENTransportRealFuelRemainsFilterObj.countGenOut = nil ) then
       ENTransportRealFuelRemainsFilterObj.countGenOut := TXSDecimal.Create;
     if edtCountGenOut.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.countGenOut.decimalString := edtCountGenOut.Text 
     else
       ENTransportRealFuelRemainsFilterObj.countGenOut := nil;




     if (ENTransportRealFuelRemainsFilterObj.priceGenOut = nil ) then
       ENTransportRealFuelRemainsFilterObj.priceGenOut := TXSDecimal.Create;
     if edtPriceGenOut.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.priceGenOut.decimalString := edtPriceGenOut.Text 
     else
       ENTransportRealFuelRemainsFilterObj.priceGenOut := nil;




     if (ENTransportRealFuelRemainsFilterObj.sumGenOut = nil ) then
       ENTransportRealFuelRemainsFilterObj.sumGenOut := TXSDecimal.Create;
     if edtSumGenOut.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.sumGenOut.decimalString := edtSumGenOut.Text 
     else
       ENTransportRealFuelRemainsFilterObj.sumGenOut := nil;




     if (ENTransportRealFuelRemainsFilterObj.countGenFinal = nil ) then
       ENTransportRealFuelRemainsFilterObj.countGenFinal := TXSDecimal.Create;
     if edtCountGenFinal.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.countGenFinal.decimalString := edtCountGenFinal.Text 
     else
       ENTransportRealFuelRemainsFilterObj.countGenFinal := nil;




     if (ENTransportRealFuelRemainsFilterObj.priceGenFinal = nil ) then
       ENTransportRealFuelRemainsFilterObj.priceGenFinal := TXSDecimal.Create;
     if edtPriceGenFinal.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.priceGenFinal.decimalString := edtPriceGenFinal.Text 
     else
       ENTransportRealFuelRemainsFilterObj.priceGenFinal := nil;




     if (ENTransportRealFuelRemainsFilterObj.sumGenFinal = nil ) then
       ENTransportRealFuelRemainsFilterObj.sumGenFinal := TXSDecimal.Create;
     if edtSumGenFinal.Text <> '' then
       ENTransportRealFuelRemainsFilterObj.sumGenFinal.decimalString := edtSumGenFinal.Text 
     else
       ENTransportRealFuelRemainsFilterObj.sumGenFinal := nil;





  end;
end;

procedure TfrmENTransportRealFuelRemainsFilterEdit.spbTKTransportRealRealTransportClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportRealFuelRemainsFilterObj.realTransport = nil then ENTransportRealFuelRemainsFilterObj.realTransport := TKTransportReal.Create();
               ENTransportRealFuelRemainsFilterObj.realTransport.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
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