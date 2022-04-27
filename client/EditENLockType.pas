
unit EditENLockType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLockTypeController ;

type
  TfrmENLockTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENLockType: THTTPRIO;

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
  frmENLockTypeEdit: TfrmENLockTypeEdit;
  ENLockTypeObj: ENLockType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLockTypeController  ;
}
{$R *.dfm}



procedure TfrmENLockTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENLockTypeObj.code);
    edtName.Text := ENLockTypeObj.name; 


  end;
end;



procedure TfrmENLockTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLockType: ENLockTypeControllerSoapPort;
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
    TempENLockType := HTTPRIOENLockType as ENLockTypeControllerSoapPort;


     ENLockTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENLockTypeObj.code:=low(Integer);
      TempENLockType.add(ENLockTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLockType.save(ENLockTypeObj);
    end;
  end;
end;


end.