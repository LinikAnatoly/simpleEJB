unit EditItemDivider;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, RQFKOrderItemController,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmItemDivider = class(TDialogForm)
    lblNumberInKorobkas: TLabel;
    edtNumberInKorobkas: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    lblQuantity: TLabel;
    edtQuantity: TEdit;
    HTTPRIORQFKOrderItem: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    RQFKOIObj: RQFKOrderItem;
  end;

var
  frmItemDivider: TfrmItemDivider;


implementation



{$R *.dfm}

procedure TfrmItemDivider.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;

begin
  if (ModalResult = mrOk) and (DialogState = dsEdit) then

  if  not NoBlankValues([edtNumberInKorobkas])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else
  if (StrToInt(edtNumberInKorobkas.Text) > Round(StrToFloat(edtQuantity.Text))) then
    begin
       Application.MessageBox(PChar('Кількість у коробці більше ніж загальна кількість!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
    end
  else
  begin
    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
    TempRQFKOrderItem.divideItem(RQFKOIObj.code, StrToInt(edtNumberInKorobkas.Text));
  end

end;



procedure TfrmItemDivider.FormShow(Sender: TObject);
begin
   SetIntStyle(edtNumberInKorobkas);
   edtQuantity.Text := RQFKOIObj.countGen.DecimalString;
end;

end.
