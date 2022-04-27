
unit EditENTCOValuesType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENTCOValuesTypeController ;

type
  TfrmENTCOValuesTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTCOValuesType: THTTPRIO;

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
  frmENTCOValuesTypeEdit: TfrmENTCOValuesTypeEdit;
  ENTCOValuesTypeObj: ENTCOValuesType;

implementation



{$R *.dfm}



procedure TfrmENTCOValuesTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTCOValuesTypeObj.code);
    edtName.Text := ENTCOValuesTypeObj.name; 


  end;
end;



procedure TfrmENTCOValuesTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTCOValuesType: ENTCOValuesTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTCOValuesType := HTTPRIOENTCOValuesType as ENTCOValuesTypeControllerSoapPort;

     ENTCOValuesTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTCOValuesTypeObj.code:=low(Integer);
      TempENTCOValuesType.add(ENTCOValuesTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTCOValuesType.save(ENTCOValuesTypeObj);
    end;
  end;
end;


end.