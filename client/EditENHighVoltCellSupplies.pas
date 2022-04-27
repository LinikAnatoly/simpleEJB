
unit EditENHighVoltCellSupplies;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHighVoltCellSuppliesController ;

type
  TfrmENHighVoltCellSuppliesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENHighVoltCellSupplies: THTTPRIO;

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
  frmENHighVoltCellSuppliesEdit: TfrmENHighVoltCellSuppliesEdit;
  ENHighVoltCellSuppliesObj: ENHighVoltCellSupplies;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHighVoltCellSuppliesController  ;
}
{$R *.dfm}



procedure TfrmENHighVoltCellSuppliesEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENHighVoltCellSuppliesObj.code);
    edtName.Text := ENHighVoltCellSuppliesObj.name; 


  end;
end;



procedure TfrmENHighVoltCellSuppliesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
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
    TempENHighVoltCellSupplies := HTTPRIOENHighVoltCellSupplies as ENHighVoltCellSuppliesControllerSoapPort;


     ENHighVoltCellSuppliesObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENHighVoltCellSuppliesObj.code:=low(Integer);
      TempENHighVoltCellSupplies.add(ENHighVoltCellSuppliesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENHighVoltCellSupplies.save(ENHighVoltCellSuppliesObj);
    end;
  end;
end;


end.