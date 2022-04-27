unit ShutdownConsumersReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, Buttons, ComCtrls ;

type
  TfrmShutdownConsumers = class(TDialogForm)
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtDateFrom: TDateTimePicker;
    edtDateTo: TDateTimePicker;
    edtEPRenName: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkwithout_prizn_skasovano_postach: TCheckBox;
    Label1: TLabel;
    edtRegNumber: TEdit;
    chbOnlyPriority: TCheckBox;
    edtDisconnectDate: TDateTimePicker;
    lblDisconnectDate: TLabel;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtRegNumberChange(Sender: TObject);
    procedure chbOnlyPriorityClick(Sender: TObject);
  private
    { Private declarations }
     renCode : Integer;
  public
    { Public declarations }
  end;

var
  frmShutdownConsumers: TfrmShutdownConsumers;

implementation

uses ShowCCRen, CCRenController , DMReportsUnit  , EnergyproController ,
  ChildFormUnit, ShowENEPRen;

{$R *.dfm}

procedure TfrmShutdownConsumers.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  i: Integer;
  today: TDateTime;
begin
  today := Now;

  SetLength(argNames, 8);
  SetLength(args, 8);

  argNames[0] := 'renCode';
  args[0] := IntToStr(renCode);

  if Length(edtRegNumber.Text) > 0 then
  begin
    argNames[1] := 'startDate';
    args[1] := '01.01.2001';
    argNames[2] := 'endDate';
    args[2] := '01.01.2101';

    argNames[3] := 'regNum';
    args[3] := edtRegNumber.Text;
  end else
  begin
    argNames[1] := 'startDate';
    args[1] := DateToStr(edtDateFrom.Date);
    argNames[2] := 'endDate';
    args[2] := DateToStr(edtDateTo.Date);
    argNames[3] := 'regNum';
    args[3] := '-1';
  end;

  argNames[4] := 'without_prizn_skasovano_postach';
  if chkwithout_prizn_skasovano_postach.Checked = true then
    args[4] := '1'
  else
    args[4] := '0';

  if (chbOnlyPriority.Checked) then
  begin
    argNames[5] := 'disconnectDate';

    if edtDisconnectDate.Checked then
      args[5] := DateToStr(edtDisconnectDate.Date)
    else
      args[5] := DateToStr(today);

    reportName := 'Datahub/ShutdownConsumersCompact';

  end else
  begin
    reportName := 'Datahub/ShutdownConsumers';
  end;

  makeReport(reportName, argNames, args, 'xls');

  self.Close;
end;


procedure TfrmShutdownConsumers.chbOnlyPriorityClick(Sender: TObject);
begin
  inherited;
  if (chbOnlyPriority.Checked) then
  begin
    HideControls([lblDisconnectDate, edtDisconnectDate], False);
    DisableControls([edtDateFrom, edtDateTo, edtRegNumber, chkwithout_prizn_skasovano_postach]);
    chkwithout_prizn_skasovano_postach.Checked := True;
  end else
  begin
    HideControls([lblDisconnectDate, edtDisconnectDate]);
    DisableControls([edtDateFrom, edtDateTo, edtRegNumber, chkwithout_prizn_skasovano_postach], False);
    chkwithout_prizn_skasovano_postach.Checked := False;
  end;
end;


procedure TfrmShutdownConsumers.edtRegNumberChange(Sender: TObject);
begin
  inherited;
   if Length(edtRegNumber.Text) > 0 then
      HideControls([edtDateFrom, edtDateTo, lblDateFrom, lblDateTo])
   else
      HideControls([edtDateFrom, edtDateTo, lblDateFrom, lblDateTo],false);
end;


procedure TfrmShutdownConsumers.FormShow(Sender: TObject);
begin
  HideControls([lblDisconnectDate, edtDisconnectDate]);
  RenCode := -1;
  edtEPRenName.Text := '';
end;


procedure TfrmShutdownConsumers.spbEPRenClearClick(Sender: TObject);
begin
  RenCode := -1;
  edtEPRenName.Text := '';
end;

procedure TfrmShutdownConsumers.spbEPRenClick(Sender: TObject);
var
   frmENEPRenShow: TfrmENEPRenShow;
begin
   frmENEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal, nil);
  try
  with frmENEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          renCode := StrToInt(GetReturnValue(sgEPRen,0));
          edtEPRenName.Text := GetReturnValue(sgEPRen,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENEPRenShow.Free;
  end;
end;

end.
