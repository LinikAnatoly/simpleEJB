unit UpdateDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls;

type
  TfrmUpdateDate = class(TDialogForm)
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdateDate: TfrmUpdateDate;

implementation

{$R *.dfm}

procedure TfrmUpdateDate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if (ModalResult = mrOk) and (DialogState = dsEdit) then
  if not NoBlankValues([
       edtDateGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end

end;

procedure TfrmUpdateDate.FormShow(Sender: TObject);
begin
  SetCurrentDate;
end;

end.
