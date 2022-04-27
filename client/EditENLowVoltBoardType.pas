
unit EditENLowVoltBoardType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLowVoltBoardTypeController ;

type
  TfrmENLowVoltBoardTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENLowVoltBoardType: THTTPRIO;

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
  frmENLowVoltBoardTypeEdit: TfrmENLowVoltBoardTypeEdit;
  ENLowVoltBoardTypeObj: ENLowVoltBoardType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLowVoltBoardTypeController  ;
}
{$R *.dfm}



procedure TfrmENLowVoltBoardTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENLowVoltBoardTypeObj.code);
    edtName.Text := ENLowVoltBoardTypeObj.name; 


  end;
end;



procedure TfrmENLowVoltBoardTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
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
    TempENLowVoltBoardType := HTTPRIOENLowVoltBoardType as ENLowVoltBoardTypeControllerSoapPort;


     ENLowVoltBoardTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENLowVoltBoardTypeObj.code:=low(Integer);
      TempENLowVoltBoardType.add(ENLowVoltBoardTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLowVoltBoardType.save(ENLowVoltBoardTypeObj);
    end;
  end;
end;


end.