
unit EditENSITEquipState;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITEquipStateController ;

type
  TfrmENSITEquipStateEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSITEquipState: THTTPRIO;

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
  frmENSITEquipStateEdit: TfrmENSITEquipStateEdit;
  ENSITEquipStateObj: ENSITEquipState;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSITEquipStateController  ;
}
{$R *.dfm}



procedure TfrmENSITEquipStateEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENSITEquipStateObj.name; 


  end;
end;



procedure TfrmENSITEquipStateEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITEquipState: ENSITEquipStateControllerSoapPort;
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
    TempENSITEquipState := HTTPRIOENSITEquipState as ENSITEquipStateControllerSoapPort;


     ENSITEquipStateObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSITEquipStateObj.code:=low(Integer);
      TempENSITEquipState.add(ENSITEquipStateObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSITEquipState.save(ENSITEquipStateObj);
    end;
  end;
end;


end.