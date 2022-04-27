
unit EditENConnectionPhasity;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionPhasityController ;

type
  TfrmENConnectionPhasityEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENConnectionPhasity: THTTPRIO;

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
  frmENConnectionPhasityEdit: TfrmENConnectionPhasityEdit;
  ENConnectionPhasityObj: ENConnectionPhasity;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionPhasityController  ;
}
{$R *.dfm}



procedure TfrmENConnectionPhasityEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName]);
   end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENConnectionPhasityObj.code);
    edtName.Text := ENConnectionPhasityObj.name;
  end;
end;



procedure TfrmENConnectionPhasityEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionPhasity: ENConnectionPhasityControllerSoapPort;
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
    TempENConnectionPhasity := HTTPRIOENConnectionPhasity as ENConnectionPhasityControllerSoapPort;


     ENConnectionPhasityObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENConnectionPhasityObj.code:=low(Integer);
      TempENConnectionPhasity.add(ENConnectionPhasityObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionPhasity.save(ENConnectionPhasityObj);
    end;
  end;
end;


end.