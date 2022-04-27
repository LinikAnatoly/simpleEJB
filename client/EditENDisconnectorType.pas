
unit EditENDisconnectorType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectorTypeController ;

type
  TfrmENDisconnectorTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDisconnectorType: THTTPRIO;

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
  frmENDisconnectorTypeEdit: TfrmENDisconnectorTypeEdit;
  ENDisconnectorTypeObj: ENDisconnectorType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDisconnectorTypeController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectorTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENDisconnectorTypeObj.code);
    edtName.Text := ENDisconnectorTypeObj.name; 


  end;
end;



procedure TfrmENDisconnectorTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnectorType: ENDisconnectorTypeControllerSoapPort;
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
    TempENDisconnectorType := HTTPRIOENDisconnectorType as ENDisconnectorTypeControllerSoapPort;


     ENDisconnectorTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDisconnectorTypeObj.code:=low(Integer);
      TempENDisconnectorType.add(ENDisconnectorTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDisconnectorType.save(ENDisconnectorTypeObj);
    end;
  end;
end;


end.