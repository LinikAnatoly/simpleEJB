unit CorrectCountForWriteOffSZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls;

type
  TfrmCorrectCountForWriteOffSZ = class(TDialogForm)
    edtCount: TEdit;
    lbl1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCorrectCountForWriteOffSZ: TfrmCorrectCountForWriteOffSZ;

implementation

uses
  ChildFormUnit;

{$R *.dfm}

procedure TfrmCorrectCountForWriteOffSZ.FormShow(Sender: TObject);
begin
  inherited;
  SetFloatStyle(edtCount);
end;

end.
