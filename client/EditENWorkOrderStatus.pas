
unit EditENWorkOrderStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderStatusController ;

type
  TfrmENWorkOrderStatusEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENWorkOrderStatus: THTTPRIO;

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
  frmENWorkOrderStatusEdit: TfrmENWorkOrderStatusEdit;
  ENWorkOrderStatusObj: ENWorkOrderStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderStatusEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENWorkOrderStatusObj.name; 


  end;
end;



procedure TfrmENWorkOrderStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
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
    TempENWorkOrderStatus := HTTPRIOENWorkOrderStatus as ENWorkOrderStatusControllerSoapPort;


     ENWorkOrderStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENWorkOrderStatusObj.code:=low(Integer);
      TempENWorkOrderStatus.add(ENWorkOrderStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWorkOrderStatus.save(ENWorkOrderStatusObj);
    end;
  end;
end;


end.