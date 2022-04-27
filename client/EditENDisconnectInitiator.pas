
unit EditENDisconnectInitiator;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectInitiatorController ;

type
  TfrmENDisconnectInitiatorEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDisconnectInitiator: THTTPRIO;

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
  frmENDisconnectInitiatorEdit: TfrmENDisconnectInitiatorEdit;
  ENDisconnectInitiatorObj: ENDisconnectInitiator;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDisconnectInitiatorController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectInitiatorEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENDisconnectInitiatorObj.code);
    edtName.Text := ENDisconnectInitiatorObj.name; 


  end;
end;



procedure TfrmENDisconnectInitiatorEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort;
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
    TempENDisconnectInitiator := HTTPRIOENDisconnectInitiator as ENDisconnectInitiatorControllerSoapPort;


     ENDisconnectInitiatorObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDisconnectInitiatorObj.code:=low(Integer);
      TempENDisconnectInitiator.add(ENDisconnectInitiatorObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDisconnectInitiator.save(ENDisconnectInitiatorObj);
    end;
  end;
end;


end.