
unit EditENRegForSupplierType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierTypeController ;

type
  TfrmENRegForSupplierTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblDescription : TLabel;
    edtDescription: TEdit;


  HTTPRIOENRegForSupplierType: THTTPRIO;

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
  frmENRegForSupplierTypeEdit: TfrmENRegForSupplierTypeEdit;
  ENRegForSupplierTypeObj: ENRegForSupplierType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierTypeController  ;
}
{$R *.dfm}



procedure TfrmENRegForSupplierTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENRegForSupplierTypeObj.code);
    edtName.Text := ENRegForSupplierTypeObj.name; 
    edtDescription.Text := ENRegForSupplierTypeObj.description; 


  end;
end;



procedure TfrmENRegForSupplierTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
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
    TempENRegForSupplierType := HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;


     ENRegForSupplierTypeObj.name := edtName.Text; 

     ENRegForSupplierTypeObj.description := edtDescription.Text; 

    if DialogState = dsInsert then
    begin
      ENRegForSupplierTypeObj.code:=low(Integer);
      TempENRegForSupplierType.add(ENRegForSupplierTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRegForSupplierType.save(ENRegForSupplierTypeObj);
    end;
  end;
end;


end.