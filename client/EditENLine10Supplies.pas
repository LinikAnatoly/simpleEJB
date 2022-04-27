
unit EditENLine10Supplies;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLine10SuppliesController ;

type
  TfrmENLine10SuppliesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENLine10Supplies: THTTPRIO;

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
  frmENLine10SuppliesEdit: TfrmENLine10SuppliesEdit;
  ENLine10SuppliesObj: ENLine10Supplies;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLine10SuppliesController  ;
}
{$R *.dfm}



procedure TfrmENLine10SuppliesEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENLine10SuppliesObj.code);
    edtName.Text := ENLine10SuppliesObj.name; 


  end;
end;



procedure TfrmENLine10SuppliesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLine10Supplies: ENLine10SuppliesControllerSoapPort;
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
    TempENLine10Supplies := HTTPRIOENLine10Supplies as ENLine10SuppliesControllerSoapPort;


     ENLine10SuppliesObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENLine10SuppliesObj.code:=low(Integer);
      TempENLine10Supplies.add(ENLine10SuppliesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLine10Supplies.save(ENLine10SuppliesObj);
    end;
  end;
end;


end.