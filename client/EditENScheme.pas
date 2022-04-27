
unit EditENScheme;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSchemeController ;

type
  TfrmENSchemeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENScheme: THTTPRIO;

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
  frmENSchemeEdit: TfrmENSchemeEdit;
  ENSchemeObj: ENScheme;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSchemeController  ;
}
{$R *.dfm}



procedure TfrmENSchemeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSchemeObj.code);
    edtName.Text := ENSchemeObj.name; 


  end;
end;



procedure TfrmENSchemeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENScheme: ENSchemeControllerSoapPort;
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
    TempENScheme := HTTPRIOENScheme as ENSchemeControllerSoapPort;


     ENSchemeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSchemeObj.code:=low(Integer);
      TempENScheme.add(ENSchemeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENScheme.save(ENSchemeObj);
    end;
  end;
end;

end.
