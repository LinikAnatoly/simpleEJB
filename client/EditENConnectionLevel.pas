
unit EditENConnectionLevel;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionLevelController ;

type
  TfrmENConnectionLevelEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENConnectionLevel: THTTPRIO;

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
  frmENConnectionLevelEdit: TfrmENConnectionLevelEdit;
  ENConnectionLevelObj: ENConnectionLevel;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionLevelController  ;
}
{$R *.dfm}



procedure TfrmENConnectionLevelEdit.FormShow(Sender: TObject);

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
    edtCode.Text := IntToStr(ENConnectionLevelObj.code);
    edtName.Text := ENConnectionLevelObj.name;
  end;
end;



procedure TfrmENConnectionLevelEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionLevel: ENConnectionLevelControllerSoapPort;
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
    TempENConnectionLevel := HTTPRIOENConnectionLevel as ENConnectionLevelControllerSoapPort;


     ENConnectionLevelObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENConnectionLevelObj.code:=low(Integer);
      TempENConnectionLevel.add(ENConnectionLevelObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionLevel.save(ENConnectionLevelObj);
    end;
  end;
end;


end.