
unit EditENSORItems2Post10;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSORItems2Post10Controller ;

type
  TfrmENSORItems2Post10Edit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENSORItems2Post10: THTTPRIO;

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
  frmENSORItems2Post10Edit: TfrmENSORItems2Post10Edit;
  ENSORItems2Post10Obj: ENSORItems2Post10;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSORItems2Post10Controller  ;
}
{$R *.dfm}



procedure TfrmENSORItems2Post10Edit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSORItems2Post10Obj.code);


  end;
end;



procedure TfrmENSORItems2Post10Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort;
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
    TempENSORItems2Post10 := HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENSORItems2Post10Obj.code:=low(Integer);
      TempENSORItems2Post10.add(ENSORItems2Post10Obj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSORItems2Post10.save(ENSORItems2Post10Obj);
    end;
  end;
end;


end.