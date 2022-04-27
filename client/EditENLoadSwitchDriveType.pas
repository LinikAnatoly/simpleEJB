
unit EditENLoadSwitchDriveType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLoadSwitchDriveTypeController ;

type
  TfrmENLoadSwitchDriveTypeEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;
  lblName : TLabel;
  edtName: TEdit;


  HTTPRIOENLoadSwitchDriveType: THTTPRIO;

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
  frmENLoadSwitchDriveTypeEdit: TfrmENLoadSwitchDriveTypeEdit;
  ENLoadSwitchDriveTypeObj: ENLoadSwitchDriveType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLoadSwitchDriveTypeController  ;
}
{$R *.dfm}



procedure TfrmENLoadSwitchDriveTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENLoadSwitchDriveTypeObj.code);
    edtName.Text := ENLoadSwitchDriveTypeObj.name; 


  end;
end;



procedure TfrmENLoadSwitchDriveTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
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
    TempENLoadSwitchDriveType := HTTPRIOENLoadSwitchDriveType as ENLoadSwitchDriveTypeControllerSoapPort;


     ENLoadSwitchDriveTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENLoadSwitchDriveTypeObj.code:=low(Integer);
      TempENLoadSwitchDriveType.add(ENLoadSwitchDriveTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLoadSwitchDriveType.save(ENLoadSwitchDriveTypeObj);
    end;
  end;
end;


end.