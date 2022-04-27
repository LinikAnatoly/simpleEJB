
unit EditENContactBreakerType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContactBreakerTypeController ;

type
  TfrmENContactBreakerTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENContactBreakerType: THTTPRIO;

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
  frmENContactBreakerTypeEdit: TfrmENContactBreakerTypeEdit;
  ENContactBreakerTypeObj: ENContactBreakerType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENContactBreakerTypeController  ;
}
{$R *.dfm}



procedure TfrmENContactBreakerTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENContactBreakerTypeObj.code);
    edtName.Text := ENContactBreakerTypeObj.name; 


  end;
end;



procedure TfrmENContactBreakerTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
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
    TempENContactBreakerType := HTTPRIOENContactBreakerType as ENContactBreakerTypeControllerSoapPort;


     ENContactBreakerTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENContactBreakerTypeObj.code:=low(Integer);
      TempENContactBreakerType.add(ENContactBreakerTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENContactBreakerType.save(ENContactBreakerTypeObj);
    end;
  end;
end;


end.