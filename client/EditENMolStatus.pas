
unit EditENMolStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolStatusController ;

type
  TfrmENMolStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMolStatus: THTTPRIO;

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
  frmENMolStatusEdit: TfrmENMolStatusEdit;
  ENMolStatusObj: ENMolStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolStatusController  ;
}
{$R *.dfm}



procedure TfrmENMolStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENMolStatusObj.code);
    edtName.Text := ENMolStatusObj.name; 


  end;
end;



procedure TfrmENMolStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolStatus: ENMolStatusControllerSoapPort;
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
    TempENMolStatus := HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;


     ENMolStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENMolStatusObj.code:=low(Integer);
      TempENMolStatus.add(ENMolStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMolStatus.save(ENMolStatusObj);
    end;
  end;
end;


end.