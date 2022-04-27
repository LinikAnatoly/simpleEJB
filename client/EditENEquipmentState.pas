
unit EditENEquipmentState;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEquipmentStateController ;

type
  TfrmENEquipmentStateEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENEquipmentState: THTTPRIO;

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
  frmENEquipmentStateEdit: TfrmENEquipmentStateEdit;
  ENEquipmentStateObj: ENEquipmentState;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEquipmentStateController  ;
}
{$R *.dfm}



procedure TfrmENEquipmentStateEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENEquipmentStateObj.code);
    edtName.Text := ENEquipmentStateObj.name; 


  end;
end;



procedure TfrmENEquipmentStateEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEquipmentState: ENEquipmentStateControllerSoapPort;
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
    TempENEquipmentState := HTTPRIOENEquipmentState as ENEquipmentStateControllerSoapPort;


     ENEquipmentStateObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENEquipmentStateObj.code:=low(Integer);
      TempENEquipmentState.add(ENEquipmentStateObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENEquipmentState.save(ENEquipmentStateObj);
    end;
  end;
end;


end.