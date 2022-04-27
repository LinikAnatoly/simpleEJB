
unit EditENManagement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENManagementController ;

type
  TfrmENManagementEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENManagement: THTTPRIO;

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
  frmENManagementEdit: TfrmENManagementEdit;
  ENManagementObj: ENManagement;

implementation


{uses  
    EnergyproController, EnergyproController2, ENManagementController  ;
}
{$R *.dfm}



procedure TfrmENManagementEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENManagementObj.code);
    edtName.Text := ENManagementObj.name; 


  end;
end;



procedure TfrmENManagementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENManagement: ENManagementControllerSoapPort;
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
    TempENManagement := HTTPRIOENManagement as ENManagementControllerSoapPort;


     ENManagementObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENManagementObj.code:=low(Integer);
      TempENManagement.add(ENManagementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENManagement.save(ENManagementObj);
    end;
  end;
end;


end.