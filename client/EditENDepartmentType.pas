
unit EditENDepartmentType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDepartmentTypeController ;

type
  TfrmENDepartmentTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDepartmentType: THTTPRIO;

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
  frmENDepartmentTypeEdit: TfrmENDepartmentTypeEdit;
  ENDepartmentTypeObj: ENDepartmentType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDepartmentTypeController  ;
}
{$R *.dfm}



procedure TfrmENDepartmentTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENDepartmentTypeObj.name; 


  end;
end;



procedure TfrmENDepartmentTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
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
    TempENDepartmentType := HTTPRIOENDepartmentType as ENDepartmentTypeControllerSoapPort;


     ENDepartmentTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDepartmentTypeObj.code:=low(Integer);
      TempENDepartmentType.add(ENDepartmentTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDepartmentType.save(ENDepartmentTypeObj);
    end;
  end;
end;


end.