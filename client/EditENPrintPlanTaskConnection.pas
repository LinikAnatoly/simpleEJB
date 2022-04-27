unit EditENPrintPlanTaskConnection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit, ComCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient, ENSettingsValuesController, ExtCtrls;

type
  TfrmEditENPrintPlanTaskConnection = class(TDialogForm)
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    grpVerifed: TGroupBox;
    mmoVerifedPost: TMemo;
    edtVerifed: TEdit;
    grpSigners: TGroupBox;
    mmoSignerPost: TMemo;
    edtSigner: TEdit;
    mmoSignerPost2: TMemo;
    mmoSignerPost3: TMemo;
    dtpStartWorkDate: TDateTimePicker;
    lblStartWorkDate: TLabel;
    dtpFinishWorkDate: TDateTimePicker;
    lblFinishWorkDate: TLabel;
    btnClearSignerPost: TBitBtn;
    btnClearSignerPostAndName: TBitBtn;
    btnClearSignerName: TBitBtn;
    btnClearSignerPostAndName2: TBitBtn;
    btnClearSignerPost2: TBitBtn;
    btnClearSignerPostAndName3: TBitBtn;
    btnClearSignerPost3: TBitBtn;
    btnClearSignerName3: TBitBtn;
    btnClearVerifed: TBitBtn;
    btnClearVerifedPost: TBitBtn;
    btnClearVerifedName: TBitBtn;
    edtSigner3: TEdit;
    cbNames: TComboBox;
    lblOther: TLabel;
    mmoOtherText: TMemo;
    cbPermitDocumentation: TComboBox;
    HTTPRIOENSettingsValues: THTTPRIO;
    rgSelectionSignatories: TRadioGroup;
    cbVerifiedPost: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearVerifedPostClick(Sender: TObject);
    procedure btnClearVerifedNameClick(Sender: TObject);
    procedure btnClearVerifedClick(Sender: TObject);
    procedure btnClearSignerPostClick(Sender: TObject);
    procedure btnClearSignerPostAndNameClick(Sender: TObject);
    procedure btnClearSignerNameClick(Sender: TObject);
    procedure btnClearSignerPostAndName2Click(Sender: TObject);
    procedure btnClearSignerPost2Click(Sender: TObject);
    procedure btnClearSignerPostAndName3Click(Sender: TObject);
    procedure btnClearSignerPost3Click(Sender: TObject);
    procedure btnClearSignerName3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgSelectionSignatoriesClick(Sender: TObject);
    procedure cbVerifiedPostClick(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var frmEditENPrintPlanTaskConnection: TfrmEditENPrintPlanTaskConnection;

const
    SELECTION_SIGNATORIES_ALL = 0; // Усі
    SELECTION_SIGNATORIES_BOSS_POSITTION = 1; //  Начальник ВРТУ
    VERIFIED_POST_YES = 0;
    VERIFIED_POST_NO = 1;
implementation

{$R *.dfm}

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerName3Click(Sender: TObject);
begin
  edtSigner3.Text := '';
  edtSigner3.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerNameClick(Sender: TObject);
begin
  edtSigner.Text := '';
  edtSigner.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerPostClick(Sender: TObject);
begin
  mmoSignerPost.Text := '';
  mmoSignerPost.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerPost2Click(Sender: TObject);
begin
  mmoSignerPost2.Text := '';
  mmoSignerPost2.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerPost3Click(Sender: TObject);
begin
  mmoSignerPost3.Text := '';
  mmoSignerPost3.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerPostAndName2Click(
  Sender: TObject);
begin
  mmoSignerPost2.Text := '';
  mmoSignerPost2.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerPostAndName3Click(
  Sender: TObject);
begin
  mmoSignerPost3.Text := '';
  edtSigner3.Text := '';
  mmoSignerPost3.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearSignerPostAndNameClick(
  Sender: TObject);
begin
  mmoSignerPost.Text := '';
  edtSigner.Text := '';
  mmoSignerPost.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearVerifedClick(Sender: TObject);
begin
  mmoVerifedPost.Text := '';
  edtVerifed.Text := '';
  edtVerifed.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearVerifedNameClick(Sender: TObject);
begin
  edtVerifed.Text := '';
  edtVerifed.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.btnClearVerifedPostClick(Sender: TObject);
begin
  mmoVerifedPost.Text := '';
  mmoVerifedPost.SetFocus;
end;

procedure TfrmEditENPrintPlanTaskConnection.cbVerifiedPostClick(
  Sender: TObject);
var
    TempENSettingsValues : ENSettingsValuesControllerSoapPort;
    value : WideString;
begin
      TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;
    if cbVerifiedPost.Checked then
    begin
        value  := TempENSettingsValues.getValue('tech.dir.position.up');
        mmoVerifedPost.Lines.Add(value);
        value  := TempENSettingsValues.getValue('tech.dir.initials.and.surname');
        edtVerifed.Text := value;
    end else
    begin
        mmoVerifedPost.Clear;
        edtVerifed.Text := '';
    end;
end;

procedure TfrmEditENPrintPlanTaskConnection.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then
    begin
      if (not dtpStartWorkDate.Checked) then //PRIC-618
        begin //Предшествующий выводу плана-задания контроль заполнения данных
          Application.MessageBox( //после их сохранения
            PChar('Надо указать запланированную дату начала ' +
              'выполнения работ.'), PChar('Внимание!'), MB_ICONWARNING);
          //ModalResult := mrNone;
          //ShowModal;
          Action:=caNone;
          dtpStartWorkDate.SetFocus;
          Exit;
        end; //if (not dtpStartWorkDate.Checked) then

      if (not dtpFinishWorkDate.Checked) then //PRIC-618
        begin //Предшествующий выводу плана-задания контроль заполнения данных
          Application.MessageBox( //после их сохранения
            PChar('Надо указать запланированную дату окончания ' +
              'выполнения работ.'), PChar('Внимание!'), MB_ICONWARNING);
          //ModalResult := mrNone;
          //ShowModal;
          Action:=caNone;
          dtpFinishWorkDate.SetFocus;
          Exit;
        end; //if (not dtpFinishWorkDate.Checked) then

    end //if ModalResult = mrOk then
end;

procedure TfrmEditENPrintPlanTaskConnection.FormShow(Sender: TObject);
var
    TempENSettingsValues : ENSettingsValuesControllerSoapPort;
    value : WideString;
begin

    TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;
    if cbVerifiedPost.Checked then
    begin
        value  := TempENSettingsValues.getValue('tech.dir.position.up');
        mmoVerifedPost.Lines.Add(value);
        value  := TempENSettingsValues.getValue('tech.dir.initials.and.surname');
        edtVerifed.Text := value;
    end else
    begin
        mmoVerifedPost.Clear;
        edtVerifed.Text := '';
    end;
    value  := TempENSettingsValues.getValue('vrtu.permit.documentation.list.name');
    split(cbPermitDocumentation.Items, value, ',');

    if rgSelectionSignatories.ItemIndex = SELECTION_SIGNATORIES_ALL then
    begin
        value  := TempENSettingsValues.getValue('vrtu.boss.position');
        mmoSignerPost.Lines.Add(value);
        value  := TempENSettingsValues.getValue('vrtu.boss.position.initials.and.surname');
        edtSigner.Text := value;
        value  := TempENSettingsValues.getValue('vrtu.leading.engineer.position');
        mmoSignerPost2.Lines.Add(value);
        value  := TempENSettingsValues.getValue('vrtu.leading.engineer.position.initials.and.surname');
        split(cbNames.Items,value,',');
        value  := TempENSettingsValues.getValue('deputy.tech.dir.position');
        mmoSignerPost3.Lines.Add(value);
        value  := TempENSettingsValues.getValue('deputy.tech.dir.position.initials.and.surname');
        edtSigner3.Text := value;
    end
    else if rgSelectionSignatories.ItemIndex = SELECTION_SIGNATORIES_BOSS_POSITTION then
    begin
        value  := TempENSettingsValues.getValue('vrtu.boss.position');
        mmoSignerPost.Lines.Add(value);
        value  := TempENSettingsValues.getValue('vrtu.boss.position.initials.and.surname');
        edtSigner.Text := value;
        mmoSignerPost2.Clear;
        cbNames.Items.Clear;
        mmoSignerPost3.Clear;
        edtSigner3.Text := '';
    end;

end;

procedure TfrmEditENPrintPlanTaskConnection.rgSelectionSignatoriesClick(
  Sender: TObject);
var
    TempENSettingsValues : ENSettingsValuesControllerSoapPort;
    value : WideString;
begin
    TempENSettingsValues := HTTPRIOENSettingsValues as ENSettingsValuesControllerSoapPort;

    if rgSelectionSignatories.ItemIndex = SELECTION_SIGNATORIES_ALL then
    begin
        mmoSignerPost.Clear;
        value  := TempENSettingsValues.getValue('vrtu.boss.position');
        mmoSignerPost.Lines.Add(value);
        value  := TempENSettingsValues.getValue('vrtu.boss.position.initials.and.surname');
        edtSigner.Text := value;
        value  := TempENSettingsValues.getValue('vrtu.leading.engineer.position');
        mmoSignerPost2.Lines.Add(value);
        value  := TempENSettingsValues.getValue('vrtu.leading.engineer.position.initials.and.surname');
        split(cbNames.Items,value,',');
        value  := TempENSettingsValues.getValue('deputy.tech.dir.position');
        mmoSignerPost3.Lines.Add(value);
        value  := TempENSettingsValues.getValue('deputy.tech.dir.position.initials.and.surname');
        edtSigner3.Text := value;
    end
    else if rgSelectionSignatories.ItemIndex = SELECTION_SIGNATORIES_BOSS_POSITTION then
    begin
        mmoSignerPost.Clear;
        value  := TempENSettingsValues.getValue('vrtu.boss.position');
        mmoSignerPost.Lines.Add(value);
        value  := TempENSettingsValues.getValue('vrtu.boss.position.initials.and.surname');
        edtSigner.Text := value;
        mmoSignerPost2.Clear;
        cbNames.Items.Clear;
        mmoSignerPost3.Clear;
        edtSigner3.Text := '';
    end;

end;

end.
