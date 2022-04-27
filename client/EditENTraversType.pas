
unit EditENTraversType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTraversTypeController ;

type
  TfrmENTraversTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTraversType: THTTPRIO;

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
  frmENTraversTypeEdit: TfrmENTraversTypeEdit;
  ENTraversTypeObj: ENTraversType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTraversTypeController  ;
}
{$R *.dfm}



procedure TfrmENTraversTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTraversTypeObj.code);
    edtName.Text := ENTraversTypeObj.name; 


  end;
end;



procedure TfrmENTraversTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTraversType: ENTraversTypeControllerSoapPort;
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
    TempENTraversType := HTTPRIOENTraversType as ENTraversTypeControllerSoapPort;


     ENTraversTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTraversTypeObj.code:=low(Integer);
      TempENTraversType.add(ENTraversTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTraversType.save(ENTraversTypeObj);
    end;
  end;
end;


end.