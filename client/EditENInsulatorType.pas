
unit EditENInsulatorType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInsulatorTypeController ;

type
  TfrmENInsulatorTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENInsulatorType: THTTPRIO;

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
  frmENInsulatorTypeEdit: TfrmENInsulatorTypeEdit;
  ENInsulatorTypeObj: ENInsulatorType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENInsulatorTypeController  ;
}
{$R *.dfm}



procedure TfrmENInsulatorTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENInsulatorTypeObj.code);
    edtName.Text := ENInsulatorTypeObj.name; 


  end;
end;



procedure TfrmENInsulatorTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInsulatorType: ENInsulatorTypeControllerSoapPort;
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
    TempENInsulatorType := HTTPRIOENInsulatorType as ENInsulatorTypeControllerSoapPort;


     ENInsulatorTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENInsulatorTypeObj.code:=low(Integer);
      TempENInsulatorType.add(ENInsulatorTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENInsulatorType.save(ENInsulatorTypeObj);
    end;
  end;
end;


end.