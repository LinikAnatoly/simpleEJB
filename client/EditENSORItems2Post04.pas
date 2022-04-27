
unit EditENSORItems2Post04;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSORItems2Post04Controller ;

type
  TfrmENSORItems2Post04Edit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENSORItems2Post04: THTTPRIO;

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
  frmENSORItems2Post04Edit: TfrmENSORItems2Post04Edit;
  ENSORItems2Post04Obj: ENSORItems2Post04;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSORItems2Post04Controller  ;
}
{$R *.dfm}



procedure TfrmENSORItems2Post04Edit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSORItems2Post04Obj.code);


  end;
end;



procedure TfrmENSORItems2Post04Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort;
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
    TempENSORItems2Post04 := HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENSORItems2Post04Obj.code:=low(Integer);
      TempENSORItems2Post04.add(ENSORItems2Post04Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSORItems2Post04.save(ENSORItems2Post04Obj);
    end;
  end;
end;


end.