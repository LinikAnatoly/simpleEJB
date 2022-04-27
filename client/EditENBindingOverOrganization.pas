
unit EditENBindingOverOrganization;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBindingOverOrganizationController ;

type
  TfrmENBindingOverOrganizationEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBindingOverOrganization: THTTPRIO;

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
  frmENBindingOverOrganizationEdit: TfrmENBindingOverOrganizationEdit;
  ENBindingOverOrganizationObj: ENBindingOverOrganization;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBindingOverOrganizationController  ;
}
{$R *.dfm}



procedure TfrmENBindingOverOrganizationEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENBindingOverOrganizationObj.code);
    edtName.Text := ENBindingOverOrganizationObj.name; 


  end;
end;



procedure TfrmENBindingOverOrganizationEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
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
    TempENBindingOverOrganization := HTTPRIOENBindingOverOrganization as ENBindingOverOrganizationControllerSoapPort;


     ENBindingOverOrganizationObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENBindingOverOrganizationObj.code:=low(Integer);
      TempENBindingOverOrganization.add(ENBindingOverOrganizationObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBindingOverOrganization.save(ENBindingOverOrganizationObj);
    end;
  end;
end;


end.