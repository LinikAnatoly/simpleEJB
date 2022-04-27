unit EditENEstimateItemChangeCountFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls;

type
  TfrmENEstimateItemChangeCountFactEdit = class(TDialogForm)
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    edtCountFact: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENEstimateItemChangeCountFactEdit: TfrmENEstimateItemChangeCountFactEdit;

implementation

{$R *.dfm}


procedure TfrmENEstimateItemChangeCountFactEdit.FormCreate(
  Sender: TObject);
begin
  inherited;
  SetFloatStyle(edtCountFact);
  DenyBlankValues([edtCountFact]);
  edtCountFact.Text := '0';
end;

procedure TfrmENEstimateItemChangeCountFactEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not NoBlankValues([edtCountFact]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end;
end;

end.
