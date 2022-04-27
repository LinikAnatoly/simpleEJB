
unit EditENDamageRecovery2ENAct;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDamageRecovery2ENActController ;

type
  TfrmENDamageRecovery2ENActEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENDamageRecovery2ENAct: THTTPRIO;

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
  frmENDamageRecovery2ENActEdit: TfrmENDamageRecovery2ENActEdit;
  ENDamageRecovery2ENActObj: ENDamageRecovery2ENAct;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDamageRecovery2ENActController  ;
}
{$R *.dfm}



procedure TfrmENDamageRecovery2ENActEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENDamageRecovery2ENActObj.code);
    edtUserGen.Text := ENDamageRecovery2ENActObj.userGen; 
      SetDateFieldForDateTimePicker(edtDateEdit, ENDamageRecovery2ENActObj.dateEdit);


  end;
end;



procedure TfrmENDamageRecovery2ENActEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtUserGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDamageRecovery2ENAct := HTTPRIOENDamageRecovery2ENAct as ENDamageRecovery2ENActControllerSoapPort;


     ENDamageRecovery2ENActObj.userGen := edtUserGen.Text; 

     ENDamageRecovery2ENActObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);	   

    if DialogState = dsInsert then
    begin
      ENDamageRecovery2ENActObj.code:=low(Integer);
      TempENDamageRecovery2ENAct.add(ENDamageRecovery2ENActObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDamageRecovery2ENAct.save(ENDamageRecovery2ENActObj);
    end;
  end;
end;


end.