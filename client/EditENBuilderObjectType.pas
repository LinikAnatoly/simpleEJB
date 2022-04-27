
unit EditENBuilderObjectType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuilderObjectTypeController ;

type
  TfrmENBuilderObjectTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENBuilderObjectType: THTTPRIO;

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
  frmENBuilderObjectTypeEdit: TfrmENBuilderObjectTypeEdit;
  ENBuilderObjectTypeObj: ENBuilderObjectType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBuilderObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENBuilderObjectTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENBuilderObjectTypeObj.name; 


  end;
end;



procedure TfrmENBuilderObjectTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilderObjectType: ENBuilderObjectTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBuilderObjectType := HTTPRIOENBuilderObjectType as ENBuilderObjectTypeControllerSoapPort;


     ENBuilderObjectTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENBuilderObjectTypeObj.code:=low(Integer);
      TempENBuilderObjectType.add(ENBuilderObjectTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuilderObjectType.save(ENBuilderObjectTypeObj);
    end;
  end;
end;


end.