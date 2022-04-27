
unit EditRQOrderStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderStatusController ;

type
  TfrmRQOrderStatusEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderStatus: THTTPRIO;

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
  frmRQOrderStatusEdit: TfrmRQOrderStatusEdit;
  RQOrderStatusObj: RQOrderStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmRQOrderStatusEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := RQOrderStatusObj.name; 


  end;
end;



procedure TfrmRQOrderStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderStatus: RQOrderStatusControllerSoapPort;
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
    TempRQOrderStatus := HTTPRIORQOrderStatus as RQOrderStatusControllerSoapPort;


     RQOrderStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderStatusObj.code:=low(Integer);
      TempRQOrderStatus.add(RQOrderStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderStatus.save(RQOrderStatusObj);
    end;
  end;
end;


end.