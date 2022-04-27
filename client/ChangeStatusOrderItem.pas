unit ChangeStatusOrderItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DialogFormUnit;

type
  TfrmChangeStatusOrderItem = class(TDialogForm)
    edtStatusReason: TEdit;
    lblStatusReason: TLabel;
    cbRQOrderItemStatus: TComboBox;
    lblStatusRef: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject;
      var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangeStatusOrderItem: TfrmChangeStatusOrderItem;

implementation

{$R *.dfm}

procedure TfrmChangeStatusOrderItem.FormClose(
  Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

       if (ModalResult = mrOk) then
         if frmChangeStatusOrderItem.edtStatusReason.Text = ''  then
          begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
               Action:=caNone;
              Exit;
          end;

end;

end.
