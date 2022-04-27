
unit EditENLoadSwitchType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLoadSwitchTypeController ;

type
  TfrmENLoadSwitchTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENLoadSwitchType: THTTPRIO;

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
  frmENLoadSwitchTypeEdit: TfrmENLoadSwitchTypeEdit;
  ENLoadSwitchTypeObj: ENLoadSwitchType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLoadSwitchTypeController  ;
}
{$R *.dfm}



procedure TfrmENLoadSwitchTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENLoadSwitchTypeObj.code);
    edtName.Text := ENLoadSwitchTypeObj.name; 


  end;
end;



procedure TfrmENLoadSwitchTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
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
    TempENLoadSwitchType := HTTPRIOENLoadSwitchType as ENLoadSwitchTypeControllerSoapPort;


     ENLoadSwitchTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENLoadSwitchTypeObj.code:=low(Integer);
      TempENLoadSwitchType.add(ENLoadSwitchTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLoadSwitchType.save(ENLoadSwitchTypeObj);
    end;
  end;
end;


end.