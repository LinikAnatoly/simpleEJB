
unit EditENHighVoltageSellType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHighVoltageSellTypeController ;

type
  TfrmENHighVoltageSellTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENHighVoltageSellType: THTTPRIO;

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
  frmENHighVoltageSellTypeEdit: TfrmENHighVoltageSellTypeEdit;
  ENHighVoltageSellTypeObj: ENHighVoltageSellType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHighVoltageSellTypeController  ;
}
{$R *.dfm}



procedure TfrmENHighVoltageSellTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENHighVoltageSellTypeObj.code);
    edtName.Text := ENHighVoltageSellTypeObj.name; 


  end;
end;



procedure TfrmENHighVoltageSellTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHighVoltageSellType: ENHighVoltageSellTypeControllerSoapPort;
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
    TempENHighVoltageSellType := HTTPRIOENHighVoltageSellType as ENHighVoltageSellTypeControllerSoapPort;


     ENHighVoltageSellTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENHighVoltageSellTypeObj.code:=low(Integer);
      TempENHighVoltageSellType.add(ENHighVoltageSellTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENHighVoltageSellType.save(ENHighVoltageSellTypeObj);
    end;
  end;
end;


end.