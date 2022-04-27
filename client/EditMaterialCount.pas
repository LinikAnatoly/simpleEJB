unit EditMaterialCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, AdvEdit, DBAdvEd;

type
  TfrmMaterialCountEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtCount: TAdvEdit;
    lblWarning: TLabel;
    lblMaterialName: TLabel;
    lblMaterialCount: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblPlanItemName: TLabel;
    procedure edtCountValueValidate(Sender: TObject; value: String;
      var IsValid: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planItemName: String;
    materialName: String;
    availableCount: Double;
    currentCount: Double;
    enteredCount: Double;
  end;

var
  frmMaterialCountEdit: TfrmMaterialCountEdit;

implementation

{$R *.dfm}

procedure TfrmMaterialCountEdit.edtCountValueValidate(Sender: TObject;
  value: String; var IsValid: Boolean);
var valueCount: Double;
begin
  try
    valueCount := StrToFloat(value);
  except
    on EConvertError do Exit;
  end;

  //if valueCount > availableCount then
  if (valueCount - availableCount) > 0.00000001 then
  begin
    IsValid := false;
    lblWarning.Caption := 'Кількість матеріалу не повинна перевищувати ' + FloatToStr(availableCount) + ' одиниць!'
    //edtCount.SetFocus;
    //ShowMessage('Too much!!!');
  end
  else begin
    IsValid := true;
    lblWarning.Caption := '';
  end;
end;

procedure TfrmMaterialCountEdit.FormCreate(Sender: TObject);
begin
  planItemName := '';
  materialName := '';
  availableCount := 0;
  currentCount := 0;
  enteredCount := 0;
end;

procedure TfrmMaterialCountEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrCancel then Exit;

  enteredCount := 0;

  if edtCount.Text = '' then Exit;

  try
    enteredCount := StrToFloat(edtCount.Text);
  except
    on EConvertError do Exit;
  end;

  if enteredCount > availableCount then
  begin
    Application.MessageBox(PChar('Кількість матеріалу не повинна перевищувати ' + FloatToStr(availableCount) + ' одиниць!'),
                           PChar('Увага!'),
                           MB_ICONWARNING + MB_OK);
    ModalResult := mrNone;
    edtCount.SetFocus;
    Exit;
  end;
end;

procedure TfrmMaterialCountEdit.FormShow(Sender: TObject);
begin
  edtCount.Text := FloatToStr(currentCount);

  availableCount := availableCount + currentCount;

  lblMaterialName.Caption  := materialName;
  lblMaterialCount.Caption := FloatToStr(availableCount);
  lblPlanItemName.Caption  := planItemName;
end;

end.
