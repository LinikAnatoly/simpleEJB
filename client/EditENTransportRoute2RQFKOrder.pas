
unit EditENTransportRoute2RQFKOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRoute2RQFKOrderController ;

type
  TfrmENTransportRoute2RQFKOrderEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENTransportRoute2RQFKOrder: THTTPRIO;

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
  frmENTransportRoute2RQFKOrderEdit: TfrmENTransportRoute2RQFKOrderEdit;
  ENTransportRoute2RQFKOrderObj: ENTransportRoute2RQFKOrder;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportRoute2RQFKOrderController  ;
}
{$R *.dfm}



procedure TfrmENTransportRoute2RQFKOrderEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTransportRoute2RQFKOrderObj.code);


  end;
end;



procedure TfrmENTransportRoute2RQFKOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort;
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
    TempENTransportRoute2RQFKOrder := HTTPRIOENTransportRoute2RQFKOrder as ENTransportRoute2RQFKOrderControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENTransportRoute2RQFKOrderObj.code:=low(Integer);
      TempENTransportRoute2RQFKOrder.add(ENTransportRoute2RQFKOrderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportRoute2RQFKOrder.save(ENTransportRoute2RQFKOrderObj);
    end;
  end;
end;


end.