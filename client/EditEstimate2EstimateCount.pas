unit EditEstimate2EstimateCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, AdvEdit, DBAdvEd;

type
  TfrmEstimate2EstimateCountEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label5: TLabel;
    edtEstimateCount: TEdit;
    edtFinCount: TEdit;
    lblEstimateMeasurement: TLabel;
    lblFinMeasurement: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    estimateCount: Double;
    finCount: Double;
  end;

var
  frmEstimate2EstimateCountEdit: TfrmEstimate2EstimateCountEdit;

implementation

{$R *.dfm}

procedure TfrmEstimate2EstimateCountEdit.FormCreate(Sender: TObject);
begin
  estimateCount := 0;
  finCount := 0;
  edtEstimateCount.Text := '';
  edtFinCount.Text := '';
  lblEstimateMeasurement.Caption := '';
  lblFinMeasurement.Caption := '';
end;

procedure TfrmEstimate2EstimateCountEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var tmp: Double;
begin
  if ModalResult = mrCancel then Exit;

  if not NoBlankValues([edtEstimateCount, edtFinCount]) then
  begin
    Application.MessageBox(PChar('Введіть усі необхідні дані!'), PChar('Увага!'), MB_ICONWARNING);
    Action := caNone;
    //ModalResult := mrNone;
    Exit;
  end;

  try
    tmp := StrToFloat(edtEstimateCount.Text);
  except
    on EConvertError do
    begin
      Application.MessageBox(PChar('Неприпустиме значення!'), PChar('Помилка!'), MB_ICONERROR);
      edtEstimateCount.SetFocus;
      Action := caNone;
      Exit;
    end;
  end;

  try
    tmp := StrToFloat(edtFinCount.Text);
  except
    on EConvertError do
    begin
      Application.MessageBox(PChar('Неприпустиме значення!'), PChar('Помилка!'), MB_ICONERROR);
      edtFinCount.SetFocus;
      Action := caNone;
      Exit;
    end;
  end;
end;

procedure TfrmEstimate2EstimateCountEdit.FormShow(Sender: TObject);
begin
  //edtEstimateCount.Text := FloatToStr(estimateCount);
  //edtFinCount.Text := FloatToStr(finCount);

  SetFloatStyle([edtEstimateCount, edtFinCount]);
  DenyBlankValues([edtEstimateCount, edtFinCount]);
end;

end.
