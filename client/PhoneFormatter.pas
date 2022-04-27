unit PhoneFormatter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, ExtCtrls, Mask;

type
  TfrmPhoneFormatter = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    medtMobilePhone: TMaskEdit;
    lblMobilePhone: TLabel;
    mmoAdditionalPhones: TMemo;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    mobilePhoneNumber, additionalPhone : String;
  end;

var
  frmPhoneFormatter: TfrmPhoneFormatter;

implementation

{$R *.dfm}

procedure TfrmPhoneFormatter.FormClose(Sender: TObject; var Action: TCloseAction);
var phone : String;
begin
if (ModalResult = mrOk) and (DialogState = dsEdit) then
  if not NoBlankValues([
       medtMobilePhone
     ])
     then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
     phone := medtMobilePhone.Text;
     phone := StringReplace(phone,'(','',[rfReplaceAll, rfIgnoreCase]);
     phone := StringReplace(phone,')','',[rfReplaceAll, rfIgnoreCase]);
     mobilePhoneNumber := phone;
     if Length(mmoAdditionalPhones.Text)>0 then
     additionalPhone := mmoAdditionalPhones.Text;
  end;

end;

end.
