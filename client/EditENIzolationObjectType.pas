
unit EditENIzolationObjectType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIzolationObjectTypeController ;

type
  TfrmENIzolationObjectTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENIzolationObjectType: THTTPRIO;

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
  frmENIzolationObjectTypeEdit: TfrmENIzolationObjectTypeEdit;
  ENIzolationObjectTypeObj: ENIzolationObjectType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIzolationObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENIzolationObjectTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENIzolationObjectTypeObj.name; 


  end;
end;



procedure TfrmENIzolationObjectTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
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
    TempENIzolationObjectType := HTTPRIOENIzolationObjectType as ENIzolationObjectTypeControllerSoapPort;


     ENIzolationObjectTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENIzolationObjectTypeObj.code:=low(Integer);
      TempENIzolationObjectType.add(ENIzolationObjectTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIzolationObjectType.save(ENIzolationObjectTypeObj);
    end;
  end;
end;


end.