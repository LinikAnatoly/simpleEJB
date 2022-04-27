
unit EditRQTndIt2PrsIt2CntrctIt;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQTndIt2PrsIt2CntrctItController ;

type
  TfrmRQTndIt2PrsIt2CntrctItEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;


  HTTPRIORQTndIt2PrsIt2CntrctIt: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblPriceWithoutNds: TLabel;
    edtPrice: TEdit;
    lblinfo: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQTndIt2PrsIt2CntrctItEdit: TfrmRQTndIt2PrsIt2CntrctItEdit;
  RQTndIt2PrsIt2CntrctItObj: RQTndIt2PrsIt2CntrctIt;

implementation


{uses  
    EnergyproController, EnergyproController2, RQTndIt2PrsIt2CntrctItController  ;
}
{$R *.dfm}



procedure TfrmRQTndIt2PrsIt2CntrctItEdit.FormShow(Sender: TObject);

begin
  SetFloatStyle(edtCountGen );
  SetFloatStyle(edtPrice );

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen  , edtPrice
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQTndIt2PrsIt2CntrctItObj.code);
    if ( RQTndIt2PrsIt2CntrctItObj.countGen <> nil ) then
       edtCountGen.Text := RQTndIt2PrsIt2CntrctItObj.countGen.decimalString
    else
       edtCountGen.Text := '';


  end;
end;



procedure TfrmRQTndIt2PrsIt2CntrctItEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQTndIt2PrsIt2CntrctIt: RQTndIt2PrsIt2CntrctItControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen , edtPrice
     ])  then
      begin
          Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
          Action:=caNone;
      end
  else
  begin
    TempRQTndIt2PrsIt2CntrctIt := HTTPRIORQTndIt2PrsIt2CntrctIt as RQTndIt2PrsIt2CntrctItControllerSoapPort;


//    RQTndIt2PrsIt2CntrctItObj.countGen:= TXSDecimal.Create;
//  RQTndIt2PrsIt2CntrctItObj.countGen.decimalString :=  sgRQPurchaseItem.Cells[9 , sgRQPurchaseItem.Row];
//
//  RQTndIt2PrsIt2CntrctItObj.price:= TXSDecimal.Create;
//  RQTndIt2PrsIt2CntrctItObj.price.decimalString :=  sgRQPurchaseItem.Cells[8 , sgRQPurchaseItem.Row];

     if (RQTndIt2PrsIt2CntrctItObj.countGen = nil ) then
       RQTndIt2PrsIt2CntrctItObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQTndIt2PrsIt2CntrctItObj.countGen.decimalString := edtCountGen.Text 
     else
       RQTndIt2PrsIt2CntrctItObj.countGen := nil;


     if (RQTndIt2PrsIt2CntrctItObj.price = nil ) then
       RQTndIt2PrsIt2CntrctItObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       RQTndIt2PrsIt2CntrctItObj.price.decimalString := edtPrice.Text
     else
       RQTndIt2PrsIt2CntrctItObj.price := nil;

    if DialogState = dsInsert then
    begin
      RQTndIt2PrsIt2CntrctItObj.code:=low(Integer);
      TempRQTndIt2PrsIt2CntrctIt.add(RQTndIt2PrsIt2CntrctItObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQTndIt2PrsIt2CntrctIt.save(RQTndIt2PrsIt2CntrctItObj);
    end;
  end;
end;


end.