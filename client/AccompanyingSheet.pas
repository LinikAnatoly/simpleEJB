unit AccompanyingSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmAccompanyingSheet = class(TForm)
    spbPerformerClear: TSpeedButton;
    spbPerformerWrite: TSpeedButton;
    lblPerformerPhone: TLabel;
    mmoPerformerPhone: TMemo;
    lblPerformer: TLabel;
    mmoPerformer: TMemo;
    lblSignerPost: TLabel;
    spbSignerClear: TSpeedButton;
    mmoSignerPost: TMemo;
    mmoSigner: TMemo;
    btnCancel: TButton;
    btnOk: TButton;
    lblSignerName: TLabel;
    procedure spbSignerClearClick(Sender: TObject);
    procedure spbPerformerClearClick(Sender: TObject);
    procedure spbPerformerWriteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAccompanyingSheet: TfrmAccompanyingSheet;

implementation

{$R *.dfm}

procedure TfrmAccompanyingSheet.spbPerformerClearClick(Sender: TObject);
begin //http://10.77.11.28:8080/browse/SUPP-33449
  mmoPerformer.Text := ''; //Очистка Исполнителя и телефона
  mmoPerformerPhone.Text := '';
end;

procedure TfrmAccompanyingSheet.spbPerformerWriteClick(Sender: TObject);
begin //http://10.77.11.28:8080/browse/SUPP-33449
  mmoPerformer.Text := 'Губка Є.П.'; //Исполнитель и телефон по умолчанию
  mmoPerformerPhone.Text := '480-266';
end;

procedure TfrmAccompanyingSheet.spbSignerClearClick(Sender: TObject);
begin //http://10.77.11.28:8080/browse/SUPP-33449
  mmoSignerPost.Text := ''; //Очистка должности и ФИО подписанта
  mmoSigner.Text := '';
end;

end.
