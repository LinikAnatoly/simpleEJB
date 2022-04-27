
unit EditENWorkOrderBytType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderBytTypeController ;

type
  TfrmENWorkOrderBytTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENWorkOrderBytType: THTTPRIO;

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
  frmENWorkOrderBytTypeEdit: TfrmENWorkOrderBytTypeEdit;
  ENWorkOrderBytTypeObj: ENWorkOrderBytType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytTypeController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderBytTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENWorkOrderBytTypeObj.code);
    edtName.Text := ENWorkOrderBytTypeObj.name; 


  end;
end;



procedure TfrmENWorkOrderBytTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
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
    TempENWorkOrderBytType := HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;


     ENWorkOrderBytTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENWorkOrderBytTypeObj.code:=low(Integer);
      TempENWorkOrderBytType.add(ENWorkOrderBytTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWorkOrderBytType.save(ENWorkOrderBytTypeObj);
    end;
  end;
end;


end.