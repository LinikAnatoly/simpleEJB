
unit EditENDeliveryKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryKindController ;

type
  TfrmENDeliveryKindEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDeliveryKind: THTTPRIO;

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
  frmENDeliveryKindEdit: TfrmENDeliveryKindEdit;
  ENDeliveryKindObj: ENDeliveryKind;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDeliveryKindController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryKindEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENDeliveryKindObj.name; 


  end;
end;



procedure TfrmENDeliveryKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
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
    TempENDeliveryKind := HTTPRIOENDeliveryKind as ENDeliveryKindControllerSoapPort;


     ENDeliveryKindObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDeliveryKindObj.code:=low(Integer);
      TempENDeliveryKind.add(ENDeliveryKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDeliveryKind.save(ENDeliveryKindObj);
    end;
  end;
end;


end.