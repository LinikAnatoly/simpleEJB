
unit EditENConnectionTariffType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionTariffTypeController ;

type
  TfrmENConnectionTariffTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENConnectionTariffType: THTTPRIO;

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
  frmENConnectionTariffTypeEdit: TfrmENConnectionTariffTypeEdit;
  ENConnectionTariffTypeObj: ENConnectionTariffType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionTariffTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionTariffTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENConnectionTariffTypeObj.code);
    edtName.Text := ENConnectionTariffTypeObj.name; 


  end;
end;



procedure TfrmENConnectionTariffTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort;
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
    TempENConnectionTariffType := HTTPRIOENConnectionTariffType as ENConnectionTariffTypeControllerSoapPort;


     ENConnectionTariffTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENConnectionTariffTypeObj.code:=low(Integer);
      TempENConnectionTariffType.add(ENConnectionTariffTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionTariffType.save(ENConnectionTariffTypeObj);
    end;
  end;
end;


end.