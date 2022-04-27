unit ReportConnectionInfoSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, Buttons, ComCtrls ;

type
  TfrmReportConnectionInfoSum = class(TDialogForm)
    lblDateFrom: TLabel;
    edtDateFrom: TDateTimePicker;
    edtDateTo: TDateTimePicker;
    lblDateTo: TLabel;
    miConnectionInfoSum: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    procedure miConnectionInfoSumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportConnectionInfoSum: TfrmReportConnectionInfoSum;

implementation

{$R *.dfm}
uses EnergyproController, DMReportsUnit;

procedure TfrmReportConnectionInfoSum.miConnectionInfoSumClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;

begin

  inherited;

if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateFrom.Checked = false then
begin
   Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateTo.Checked = false then
begin
   Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

// Установка параметров
SetLength(argNames, 7);
SetLength(args, 7);

argNames[0] := 'dateStart';
argNames[1] := 'dateFinal';

args[0] := DateToStr(edtDateFrom.date);
args[1] := DateToStr(edtDateTo.date);


reportName := 'Services/ConnectionInfoSum/ConnectionInfoSum';


makeReport(reportName, argNames, args, 'xls');

self.Close;

end;

end.
