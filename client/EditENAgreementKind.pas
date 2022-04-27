
unit EditENAgreementKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENAgreementKindController ;

type
    TfrmENAgreementKindEdit = class(TDialogForm)
    lblName : TLabel;
    edtName: TEdit;

    HTTPRIOENAgreementKind: THTTPRIO;

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
  frmENAgreementKindEdit: TfrmENAgreementKindEdit;
  ENAgreementKindObj: ENAgreementKind;

implementation



{$R *.dfm}



procedure TfrmENAgreementKindEdit.FormShow(Sender: TObject);
begin

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENAgreementKindObj.name;
  end;
end;



procedure TfrmENAgreementKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAgreementKind: ENAgreementKindControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENAgreementKind := HTTPRIOENAgreementKind as ENAgreementKindControllerSoapPort;

    ENAgreementKindObj.name := edtName.Text;

    if DialogState = dsInsert then
    begin
      ENAgreementKindObj.code:=low(Integer);
      TempENAgreementKind.add(ENAgreementKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAgreementKind.save(ENAgreementKindObj);
    end;
  end;
end;


end.