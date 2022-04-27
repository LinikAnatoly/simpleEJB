
unit EditENElement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENElementController ;

type
  TfrmENElementEdit = class(TDialogForm)

    lblOrderField : TLabel;
    edtOrderField: TEdit;


    HTTPRIOENElement: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblPK: TLabel;
    edtCode: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENElementEdit: TfrmENElementEdit;
  ENElementObj: ENElement;

implementation


{uses  
    EnergyproController, EnergyproController2, ENElementController  ;
}
{$R *.dfm}



procedure TfrmENElementEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENElementObj.code);

    if ( ENElementObj.orderField <> nil ) then
       edtOrderField.Text := ENElementObj.orderField.decimalString
    else
       edtOrderField.Text := ''; 



  end;


end;



procedure TfrmENElementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENElement: ENElementControllerSoapPort;
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
    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;


     if (ENElementObj.orderField = nil ) then
       ENElementObj.orderField := TXSDecimal.Create;
     ENElementObj.orderField.decimalString := edtOrderField.Text ;




    if DialogState = dsInsert then
    begin
      ENElementObj.code:=low(Integer);
      TempENElement.add(ENElementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENElement.save(ENElementObj);
    end;

  end;
end;


end.