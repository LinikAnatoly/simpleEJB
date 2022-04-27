unit EntechConditionsServicesEditSumBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, AdvEdit ;

type
  TfrmEntechConditionsServicesEditSumBill = class(TDialogForm)
    edtSum: TAdvEdit;
    btnOk: TButton;
    btnCancel: TButton;
    lbl1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    enteredSum: Double;
  end;

var
  frmEntechConditionsServicesEditSumBill: TfrmEntechConditionsServicesEditSumBill;

implementation

{$R *.dfm}

procedure TfrmEntechConditionsServicesEditSumBill.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrCancel then Exit;

   enteredSum := 0;

  if edtSum.Text = '' then Exit;

  try
    enteredSum := StrToFloat(edtSum.Text);
  except
    on EConvertError do Exit;
  end;
end;

procedure TfrmEntechConditionsServicesEditSumBill.FormCreate(
  Sender: TObject);
begin
   enteredSum := 0;
end;

end.
