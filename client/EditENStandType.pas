
unit EditENStandType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENStandTypeController ;

type
  TfrmENStandTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENStandType: THTTPRIO;

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
  frmENStandTypeEdit: TfrmENStandTypeEdit;
  ENStandTypeObj: ENStandType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENStandTypeController  ;
}
{$R *.dfm}



procedure TfrmENStandTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENStandTypeObj.code);
    edtName.Text := ENStandTypeObj.name; 


  end;
end;



procedure TfrmENStandTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENStandType: ENStandTypeControllerSoapPort;
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
    TempENStandType := HTTPRIOENStandType as ENStandTypeControllerSoapPort;


     ENStandTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENStandTypeObj.code:=low(Integer);
      TempENStandType.add(ENStandTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENStandType.save(ENStandTypeObj);
    end;
  end;
end;


end.