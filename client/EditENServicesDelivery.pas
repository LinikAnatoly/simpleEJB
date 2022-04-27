
unit EditENServicesDelivery;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesDeliveryController, TKCalcDeliveryController;

type
  TfrmENServicesDeliveryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENServicesDelivery: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblPriceHour: TLabel;
    edtPriceHour: TEdit;
    edtTimeGen: TEdit;
    lblTimeGen: TLabel;
    lblCostGen: TLabel;
    edtCostGen: TEdit;
    edtChargeCostGen: TEdit;
    lblChargeCostGen: TLabel;
    lblCostTotal: TLabel;
    edtCostTotal: TEdit;
    HTTPRIOTKCalcDelivery: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    calc : TKCalcDelivery;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesDeliveryEdit: TfrmENServicesDeliveryEdit;
  ENServicesDeliveryObj: ENServicesDelivery;

implementation


uses EditTKCalcDelivery;
{$R *.dfm}



procedure TfrmENServicesDeliveryEdit.FormShow(Sender: TObject);
var
  TempTKCalcDelivery : TKCalcDeliveryControllerSoapPort;
begin

  TempTKCalcDelivery := HTTPRIOTKCalcDelivery as TKCalcDeliveryControllerSoapPort;
	  
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtTimeGen
      ,edtCostGen
      ,edtChargeCostGen
      ,edtCostTotal
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      calc := TempTKCalcDelivery.getObject(ENServicesDeliveryObj.calcDeliveryRef.code);
      edtCode.Text := IntToStr(ENServicesDeliveryObj.code);
    if (calc.priceHour <> nil ) then
       edtPriceHour.Text := calc.priceHour.decimalString
    else
       edtPriceHour.Text := '';
    if ( ENServicesDeliveryObj.timeGen <> nil ) then
       edtTimeGen.Text := ENServicesDeliveryObj.timeGen.decimalString
    else
       edtTimeGen.Text := '';
    if ( ENServicesDeliveryObj.costGen <> nil ) then
       edtCostGen.Text := ENServicesDeliveryObj.costGen.decimalString
    else
       edtCostGen.Text := '';
    if ( ENServicesDeliveryObj.chargeCostGen <> nil ) then
       edtChargeCostGen.Text := ENServicesDeliveryObj.chargeCostGen.decimalString
    else
       edtChargeCostGen.Text := '';
    if ( ENServicesDeliveryObj.costTotal <> nil ) then
       edtCostTotal.Text := ENServicesDeliveryObj.costTotal.decimalString
    else
       edtCostTotal.Text := '';


  end;
end;



procedure TfrmENServicesDeliveryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesDelivery: ENServicesDeliveryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtTimeGen
      ,edtCostGen
      ,edtChargeCostGen
      ,edtCostTotal
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesDelivery := HTTPRIOENServicesDelivery as ENServicesDeliveryControllerSoapPort;


     if (ENServicesDeliveryObj.timeGen = nil ) then
       ENServicesDeliveryObj.timeGen := TXSDecimal.Create;
     if edtTimeGen.Text <> '' then
       ENServicesDeliveryObj.timeGen.decimalString := edtTimeGen.Text 
     else
       ENServicesDeliveryObj.timeGen := nil;

     if (ENServicesDeliveryObj.costGen = nil ) then
       ENServicesDeliveryObj.costGen := TXSDecimal.Create;
     if edtCostGen.Text <> '' then
       ENServicesDeliveryObj.costGen.decimalString := edtCostGen.Text 
     else
       ENServicesDeliveryObj.costGen := nil;

     if (ENServicesDeliveryObj.chargeCostGen = nil ) then
       ENServicesDeliveryObj.chargeCostGen := TXSDecimal.Create;
     if edtChargeCostGen.Text <> '' then
       ENServicesDeliveryObj.chargeCostGen.decimalString := edtChargeCostGen.Text 
     else
       ENServicesDeliveryObj.chargeCostGen := nil;

     if (ENServicesDeliveryObj.costTotal = nil ) then
       ENServicesDeliveryObj.costTotal := TXSDecimal.Create;
     if edtCostTotal.Text <> '' then
       ENServicesDeliveryObj.costTotal.decimalString := edtCostTotal.Text 
     else
       ENServicesDeliveryObj.costTotal := nil;

    if DialogState = dsInsert then
    begin
      ENServicesDeliveryObj.code:=low(Integer);
      TempENServicesDelivery.add(ENServicesDeliveryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesDelivery.save(ENServicesDeliveryObj);
    end;
  end;
end;


end.