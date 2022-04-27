
unit EditENHookType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHookTypeController ;

type
  TfrmENHookTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENHookType: THTTPRIO;

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
  frmENHookTypeEdit: TfrmENHookTypeEdit;
  ENHookTypeObj: ENHookType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHookTypeController  ;
}
{$R *.dfm}



procedure TfrmENHookTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENHookTypeObj.code);
    edtName.Text := ENHookTypeObj.name; 


  end;
end;



procedure TfrmENHookTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHookType: ENHookTypeControllerSoapPort;
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
    TempENHookType := HTTPRIOENHookType as ENHookTypeControllerSoapPort;


     ENHookTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENHookTypeObj.code:=low(Integer);
      TempENHookType.add(ENHookTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENHookType.save(ENHookTypeObj);
    end;
  end;
end;


end.