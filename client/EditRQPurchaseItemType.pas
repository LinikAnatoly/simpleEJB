
unit EditRQPurchaseItemType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItemTypeController ;

type
  TfrmRQPurchaseItemTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQPurchaseItemType: THTTPRIO;

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
  frmRQPurchaseItemTypeEdit: TfrmRQPurchaseItemTypeEdit;
  RQPurchaseItemTypeObj: RQPurchaseItemType;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItemTypeController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItemTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPurchaseItemTypeObj.code);
    edtName.Text := RQPurchaseItemTypeObj.name; 


  end;
end;



procedure TfrmRQPurchaseItemTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPurchaseItemType := HTTPRIORQPurchaseItemType as RQPurchaseItemTypeControllerSoapPort;


     RQPurchaseItemTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQPurchaseItemTypeObj.code:=low(Integer);
      TempRQPurchaseItemType.add(RQPurchaseItemTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPurchaseItemType.save(RQPurchaseItemTypeObj);
    end;
  end;
end;


end.