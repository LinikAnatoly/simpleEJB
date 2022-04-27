
unit EditENTransportOrderStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportOrderStatusController ;

type
  TfrmENTransportOrderStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;


  HTTPRIOENTransportOrderStatus: THTTPRIO;

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
  frmENTransportOrderStatusEdit: TfrmENTransportOrderStatusEdit;
  ENTransportOrderStatusObj: ENTransportOrderStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmENTransportOrderStatusEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportOrderStatusObj.code);
    MakeMultiline(edtName.Lines, ENTransportOrderStatusObj.name);


  end;
end;



procedure TfrmENTransportOrderStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
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
    TempENTransportOrderStatus := HTTPRIOENTransportOrderStatus as ENTransportOrderStatusControllerSoapPort;


     ENTransportOrderStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTransportOrderStatusObj.code:=low(Integer);
      TempENTransportOrderStatus.add(ENTransportOrderStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportOrderStatus.save(ENTransportOrderStatusObj);
    end;
  end;
end;


end.