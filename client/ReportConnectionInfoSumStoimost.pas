unit ReportConnectionInfoSumStoimost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls , DialogFormUnit;

type
  TfrmReportConnectionInfoSumStoimost = class(TDialogForm)
    Label1: TLabel;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateFrom: TDateTimePicker;
    edtDateTo: TDateTimePicker;
    miConnectionInfoSum: TBitBtn;
    btnCancel: TBitBtn;
    procedure miConnectionInfoSumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportConnectionInfoSumStoimost: TfrmReportConnectionInfoSumStoimost;

implementation

{$R *.dfm}
uses EnergyproController, DMReportsUnit;

procedure TfrmReportConnectionInfoSumStoimost.miConnectionInfoSumClick(
  Sender: TObject);
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


reportName := 'Services/ConnectionInfoSum/ConnectionInfoSumStoimost';


makeReport(reportName, argNames, args, 'xls');

self.Close;

end;

end.
