
unit EditENBranchType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBranchTypeController ;

type
  TfrmENBranchTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBranchType: THTTPRIO;

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
  frmENBranchTypeEdit: TfrmENBranchTypeEdit;
  ENBranchTypeObj: ENBranchType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBranchTypeController  ;
}
{$R *.dfm}



procedure TfrmENBranchTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENBranchTypeObj.code);
    edtName.Text := ENBranchTypeObj.name; 


  end;
end;



procedure TfrmENBranchTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBranchType: ENBranchTypeControllerSoapPort;
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
    TempENBranchType := HTTPRIOENBranchType as ENBranchTypeControllerSoapPort;


     ENBranchTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENBranchTypeObj.code:=low(Integer);
      TempENBranchType.add(ENBranchTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBranchType.save(ENBranchTypeObj);
    end;
  end;
end;


end.