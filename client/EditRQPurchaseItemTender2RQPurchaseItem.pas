
unit EditRQPurchaseItemTender2RQPurchaseItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItemTender2RQPurchaseItemController ;

type
  TfrmRQPurchaseItemTender2RQPurchaseItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;


  HTTPRIORQPurchaseItemTender2RQPurchaseItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQPurchaseItemTender2RQPurchaseItemEdit: TfrmRQPurchaseItemTender2RQPurchaseItemEdit;
  RQPurchaseItemTender2RQPurchaseItemObj: RQPurchaseItemTender2RQPurchaseItem;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItemTender2RQPurchaseItemController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItemTender2RQPurchaseItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPurchaseItemTender2RQPurchaseItemObj.code);
    if ( RQPurchaseItemTender2RQPurchaseItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPurchaseItemTender2RQPurchaseItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';


  end;
end;



procedure TfrmRQPurchaseItemTender2RQPurchaseItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPurchaseItemTender2RQPurchaseItem := HTTPRIORQPurchaseItemTender2RQPurchaseItem as RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;


     if (RQPurchaseItemTender2RQPurchaseItemObj.countGen = nil ) then
       RQPurchaseItemTender2RQPurchaseItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQPurchaseItemTender2RQPurchaseItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQPurchaseItemTender2RQPurchaseItemObj.countGen := nil;

    if DialogState = dsInsert then
    begin
      RQPurchaseItemTender2RQPurchaseItemObj.code:=low(Integer);
      TempRQPurchaseItemTender2RQPurchaseItem.add(RQPurchaseItemTender2RQPurchaseItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPurchaseItemTender2RQPurchaseItem.save(RQPurchaseItemTender2RQPurchaseItemObj);
    end;
  end;
end;


end.