
unit EditENDamageRecoveryStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDamageRecoveryStatusController ;

type
  TfrmENDamageRecoveryStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDamageRecoveryStatus: THTTPRIO;

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
  frmENDamageRecoveryStatusEdit: TfrmENDamageRecoveryStatusEdit;
  ENDamageRecoveryStatusObj: ENDamageRecoveryStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDamageRecoveryStatusController  ;
}
{$R *.dfm}



procedure TfrmENDamageRecoveryStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENDamageRecoveryStatusObj.code);
    edtName.Text := ENDamageRecoveryStatusObj.name; 


  end;
end;



procedure TfrmENDamageRecoveryStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort;
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
    TempENDamageRecoveryStatus := HTTPRIOENDamageRecoveryStatus as ENDamageRecoveryStatusControllerSoapPort;


     ENDamageRecoveryStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDamageRecoveryStatusObj.code:=low(Integer);
      TempENDamageRecoveryStatus.add(ENDamageRecoveryStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDamageRecoveryStatus.save(ENDamageRecoveryStatusObj);
    end;
  end;
end;


end.