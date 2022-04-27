unit EditENTransportItemFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, InvokeRegistry, Rio, SOAPHTTPClient, XSBuiltIns;

type
  TfrmENTransportItemFactEdit = class(TDialogForm)
    lblCountFact: TLabel;
    edtCountFact: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENTransportItem: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    transportItemCode : Integer;
  end;

var
  frmENTransportItemFactEdit: TfrmENTransportItemFactEdit;

implementation

uses
  ENTransportItemController;

{$R *.dfm}

procedure TfrmENTransportItemFactEdit.FormShow(Sender: TObject);
begin
  SetFloatStyle(edtCountFact);
  DenyBlankValues([edtCountFact]);
end;

procedure TfrmENTransportItemFactEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempENTransportItem: ENTransportItemControllerSoapPort;
   countFact : TXSDecimal;
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountFact
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
    countFact := TXSDecimal.Create;
    countFact.DecimalString := edtCountFact.Text;
    TempENTransportItem.saveTimeFact(transportItemCode, countFact);

  end;

end;

end.
