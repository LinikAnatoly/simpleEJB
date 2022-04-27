
unit EditRQFKOrderStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderStatusController ;

type
  TfrmRQFKOrderStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQFKOrderStatus: THTTPRIO;

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
  frmRQFKOrderStatusEdit: TfrmRQFKOrderStatusEdit;
  RQFKOrderStatusObj: RQFKOrderStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQFKOrderStatusObj.code);
    edtName.Text := RQFKOrderStatusObj.name; 


  end;
end;



procedure TfrmRQFKOrderStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
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
    TempRQFKOrderStatus := HTTPRIORQFKOrderStatus as RQFKOrderStatusControllerSoapPort;


     RQFKOrderStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQFKOrderStatusObj.code:=low(Integer);
      TempRQFKOrderStatus.add(RQFKOrderStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKOrderStatus.save(RQFKOrderStatusObj);
    end;
  end;
end;


end.