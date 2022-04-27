
unit EditENFuelInvResultType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInvResultTypeController ;

type
  TfrmENFuelInvResultTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENFuelInvResultType: THTTPRIO;

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
  frmENFuelInvResultTypeEdit: TfrmENFuelInvResultTypeEdit;
  ENFuelInvResultTypeObj: ENFuelInvResultType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInvResultTypeController  ;
}
{$R *.dfm}



procedure TfrmENFuelInvResultTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENFuelInvResultTypeObj.code);
    edtName.Text := ENFuelInvResultTypeObj.name; 


  end;
end;



procedure TfrmENFuelInvResultTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('������ ���� ����������� !'),PChar('�������� !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFuelInvResultType := HTTPRIOENFuelInvResultType as ENFuelInvResultTypeControllerSoapPort;


     ENFuelInvResultTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENFuelInvResultTypeObj.code:=low(Integer);
      TempENFuelInvResultType.add(ENFuelInvResultTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelInvResultType.save(ENFuelInvResultTypeObj);
    end;
  end;
end;


end.