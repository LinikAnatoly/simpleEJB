
unit EditENActStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActStatusController ;

type
  TfrmENActStatusEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENActStatus: THTTPRIO;

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
  frmENActStatusEdit: TfrmENActStatusEdit;
  ENActStatusObj: ENActStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActStatusController  ;
}
{$R *.dfm}



procedure TfrmENActStatusEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENActStatusObj.name; 


  end;
end;



procedure TfrmENActStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActStatus: ENActStatusControllerSoapPort;
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
    TempENActStatus := HTTPRIOENActStatus as ENActStatusControllerSoapPort;


     ENActStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENActStatusObj.code:=low(Integer);
      TempENActStatus.add(ENActStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActStatus.save(ENActStatusObj);
    end;
  end;
end;


end.