
unit EditENTransportOrder2TransportItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportOrder2TransportItemController ;

type
  TfrmENTransportOrder2TransportItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENTransportOrder2TransportItem: THTTPRIO;

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
  frmENTransportOrder2TransportItemEdit: TfrmENTransportOrder2TransportItemEdit;
  ENTransportOrder2TransportItemObj: ENTransportOrder2TransportItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportOrder2TransportItemController  ;
}
{$R *.dfm}



procedure TfrmENTransportOrder2TransportItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportOrder2TransportItemObj.code);


  end;
end;



procedure TfrmENTransportOrder2TransportItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportOrder2TransportItem := HTTPRIOENTransportOrder2TransportItem as ENTransportOrder2TransportItemControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENTransportOrder2TransportItemObj.code:=low(Integer);
      TempENTransportOrder2TransportItem.add(ENTransportOrder2TransportItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportOrder2TransportItem.save(ENTransportOrder2TransportItemObj);
    end;
  end;
end;


end.