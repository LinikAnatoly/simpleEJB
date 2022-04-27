
unit EditENMetrologyDeviceType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyDeviceTypeController ;

type
  TfrmENMetrologyDeviceTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMetrologyDeviceType: THTTPRIO;

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
  frmENMetrologyDeviceTypeEdit: TfrmENMetrologyDeviceTypeEdit;
  ENMetrologyDeviceTypeObj: ENMetrologyDeviceType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMetrologyDeviceTypeController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyDeviceTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENMetrologyDeviceTypeObj.name; 


  end;
end;



procedure TfrmENMetrologyDeviceTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
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
    TempENMetrologyDeviceType := HTTPRIOENMetrologyDeviceType as ENMetrologyDeviceTypeControllerSoapPort;


     ENMetrologyDeviceTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENMetrologyDeviceTypeObj.code:=low(Integer);
      TempENMetrologyDeviceType.add(ENMetrologyDeviceTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMetrologyDeviceType.save(ENMetrologyDeviceTypeObj);
    end;
  end;
end;


end.