
unit EditRQFKOrder2FKOrderType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrder2FKOrderTypeController ;

type
  TfrmRQFKOrder2FKOrderTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQFKOrder2FKOrderType: THTTPRIO;

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
  frmRQFKOrder2FKOrderTypeEdit: TfrmRQFKOrder2FKOrderTypeEdit;
  RQFKOrder2FKOrderTypeObj: RQFKOrder2FKOrderType;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrder2FKOrderTypeController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrder2FKOrderTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQFKOrder2FKOrderTypeObj.code);
    edtName.Text := RQFKOrder2FKOrderTypeObj.name; 


  end;
end;



procedure TfrmRQFKOrder2FKOrderTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
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
    TempRQFKOrder2FKOrderType := HTTPRIORQFKOrder2FKOrderType as RQFKOrder2FKOrderTypeControllerSoapPort;


     RQFKOrder2FKOrderTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQFKOrder2FKOrderTypeObj.code:=low(Integer);
      TempRQFKOrder2FKOrderType.add(RQFKOrder2FKOrderTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKOrder2FKOrderType.save(RQFKOrder2FKOrderTypeObj);
    end;
  end;
end;


end.