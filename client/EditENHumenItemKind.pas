
unit EditENHumenItemKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHumenItemKindController ;

type
  TfrmENHumenItemKindEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENHumenItemKind: THTTPRIO;

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
  frmENHumenItemKindEdit: TfrmENHumenItemKindEdit;
  ENHumenItemKindObj: ENHumenItemKind;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHumenItemKindController  ;
}
{$R *.dfm}



procedure TfrmENHumenItemKindEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENHumenItemKindObj.name; 


  end;
end;



procedure TfrmENHumenItemKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
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
    TempENHumenItemKind := HTTPRIOENHumenItemKind as ENHumenItemKindControllerSoapPort;


     ENHumenItemKindObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENHumenItemKindObj.code:=low(Integer);
      TempENHumenItemKind.add(ENHumenItemKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENHumenItemKind.save(ENHumenItemKindObj);
    end;
  end;
end;


end.