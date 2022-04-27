
unit EditENDisconnectorDriveType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectorDriveTypeController ;

type
  TfrmENDisconnectorDriveTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDisconnectorDriveType: THTTPRIO;

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
  frmENDisconnectorDriveTypeEdit: TfrmENDisconnectorDriveTypeEdit;
  ENDisconnectorDriveTypeObj: ENDisconnectorDriveType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDisconnectorDriveTypeController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectorDriveTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENDisconnectorDriveTypeObj.code);
    edtName.Text := ENDisconnectorDriveTypeObj.name; 


  end;
end;



procedure TfrmENDisconnectorDriveTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
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
    TempENDisconnectorDriveType := HTTPRIOENDisconnectorDriveType as ENDisconnectorDriveTypeControllerSoapPort;


     ENDisconnectorDriveTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDisconnectorDriveTypeObj.code:=low(Integer);
      TempENDisconnectorDriveType.add(ENDisconnectorDriveTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDisconnectorDriveType.save(ENDisconnectorDriveTypeObj);
    end;
  end;
end;


end.