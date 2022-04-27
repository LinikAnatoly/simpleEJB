
unit EditENWorkOrderBytStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderBytStatusController ;

type
  TfrmENWorkOrderBytStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENWorkOrderBytStatus: THTTPRIO;

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
  frmENWorkOrderBytStatusEdit: TfrmENWorkOrderBytStatusEdit;
  ENWorkOrderBytStatusObj: ENWorkOrderBytStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytStatusController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderBytStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENWorkOrderBytStatusObj.code);
    edtName.Text := ENWorkOrderBytStatusObj.name; 


  end;
end;



procedure TfrmENWorkOrderBytStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
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
    TempENWorkOrderBytStatus := HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;


     ENWorkOrderBytStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENWorkOrderBytStatusObj.code:=low(Integer);
      TempENWorkOrderBytStatus.add(ENWorkOrderBytStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWorkOrderBytStatus.save(ENWorkOrderBytStatusObj);
    end;
  end;
end;


end.