
unit EditENActFailureReason;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActFailureReasonController ;

type
  TfrmENActFailureReasonEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENActFailureReason: THTTPRIO;

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
  frmENActFailureReasonEdit: TfrmENActFailureReasonEdit;
  ENActFailureReasonObj: ENActFailureReason;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActFailureReasonController  ;
}
{$R *.dfm}



procedure TfrmENActFailureReasonEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENActFailureReasonObj.code);
    edtName.Text := ENActFailureReasonObj.name; 


  end;
end;



procedure TfrmENActFailureReasonEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActFailureReason: ENActFailureReasonControllerSoapPort;
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
    TempENActFailureReason := HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;


     ENActFailureReasonObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENActFailureReasonObj.code:=low(Integer);
      TempENActFailureReason.add(ENActFailureReasonObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActFailureReason.save(ENActFailureReasonObj);
    end;
  end;
end;


end.