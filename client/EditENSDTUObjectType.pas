
unit EditENSDTUObjectType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSDTUObjectTypeController ;

type
  TfrmENSDTUObjectTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSDTUObjectType: THTTPRIO;

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
  frmENSDTUObjectTypeEdit: TfrmENSDTUObjectTypeEdit;
  ENSDTUObjectTypeObj: ENSDTUObjectType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSDTUObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENSDTUObjectTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENSDTUObjectTypeObj.name; 


  end;
end;



procedure TfrmENSDTUObjectTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSDTUObjectType: ENSDTUObjectTypeControllerSoapPort;
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
    TempENSDTUObjectType := HTTPRIOENSDTUObjectType as ENSDTUObjectTypeControllerSoapPort;


     ENSDTUObjectTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSDTUObjectTypeObj.code:=low(Integer);
      TempENSDTUObjectType.add(ENSDTUObjectTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSDTUObjectType.save(ENSDTUObjectTypeObj);
    end;
  end;
end;


end.