
unit EditENRegForSupplierStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierStatusController ;

type
  TfrmENRegForSupplierStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENRegForSupplierStatus: THTTPRIO;

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
  frmENRegForSupplierStatusEdit: TfrmENRegForSupplierStatusEdit;
  ENRegForSupplierStatusObj: ENRegForSupplierStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierStatusController  ;
}
{$R *.dfm}



procedure TfrmENRegForSupplierStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENRegForSupplierStatusObj.code);
    edtName.Text := ENRegForSupplierStatusObj.name; 


  end;
end;



procedure TfrmENRegForSupplierStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
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
    TempENRegForSupplierStatus := HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;


     ENRegForSupplierStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENRegForSupplierStatusObj.code:=low(Integer);
      TempENRegForSupplierStatus.add(ENRegForSupplierStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRegForSupplierStatus.save(ENRegForSupplierStatusObj);
    end;
  end;
end;


end.