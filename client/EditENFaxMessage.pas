unit EditENFaxMessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit;

type
  TfrmEditENFaxMessage = class(TDialogForm)
    ChBxQuickly: TCheckBox;
    ChBxAcquaintance: TCheckBox;
    ChBxConfirmReceipt: TCheckBox;
    ChBxReturnMarks: TCheckBox;
    lblSigner: TLabel;
    edtSigner: TEdit;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    edtContactTel: TEdit;
    lblContactTel: TLabel;
    edtFaxNum: TEdit;
    lblFaxNum: TLabel;
    memRegNumContract_SPL_PP: TMemo;
    lblRegNumContract_SPL_PP: TLabel;
    memPost: TMemo;
    lblPost: TLabel;
    lblRemark: TLabel;
    memRemark: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditENFaxMessage: TfrmEditENFaxMessage;

implementation

{$R *.dfm}

procedure TfrmEditENFaxMessage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if ModalResult = mrOk then
    begin
      if edtFaxNum.Text = '' then
        begin
          Application.MessageBox(
            PChar('Надо указать № Факсограммы'), PChar('Внимание!'), MB_ICONWARNING);
          Action:=caNone;
          edtFaxNum.SetFocus;
          Exit;
        end;

      if memPost.Lines.Text = '' then
        begin
          Application.MessageBox(
            PChar('Надо указать Должность подписанта'), PChar('Внимание!'), MB_ICONWARNING);
          Action:=caNone;
          memPost.SetFocus;
          Exit;
        end;

      if edtSigner.Text = '' then
        begin
          Application.MessageBox(
            PChar('Надо указать Подписанта'), PChar('Внимание!'), MB_ICONWARNING);
          Action:=caNone;
          edtSigner.SetFocus;
          Exit;
        end;

    end //if ModalResult = mrOk then
end;

procedure TfrmEditENFaxMessage.FormShow(Sender: TObject);
begin
  SetIntStyle([edtFaxNum]);
  SetIntStyle([edtContactTel]);
end;

end.
