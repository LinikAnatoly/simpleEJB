unit reportOnDohovoryPidryadu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls , DialogFormUnit ,ChildFormUnit, DateUtils ;

type
   TfrmReportOnDohovoryPidryadu = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDateServices: TLabel;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateServicesFrom: TDateTimePicker;
    edtDateServicesTo: TDateTimePicker;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportOnDohovoryPidryadu: TfrmReportOnDohovoryPidryadu;

implementation

{$R *.dfm}
uses EnergyproController, DMReportsUnit;


procedure TfrmReportOnDohovoryPidryadu.btnCancelClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmReportOnDohovoryPidryadu.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName, strTabNumbers : String;
begin
  if edtDateServicesFrom.Date > edtDateServicesTo.Date then
  begin
       Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
       Exit;
  end;

  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'start_date_services';
  argNames[1] := 'end_date_services';

  if edtDateServicesFrom.Checked then
        args[0] := DateToStr(edtDateServicesFrom.date)
  else
        args[0] := '';
  if edtDateServicesTo.Checked then
        args[1] := DateToStr(edtDateServicesTo.date)
  else
        args[1] := '';

  reportName := 'Services/reportOnDohovoryPidryadu';

  makeReport(reportName, argNames, args, 'xls');
  self.Close;
end;

procedure TfrmReportOnDohovoryPidryadu.FormShow(Sender: TObject);
begin
  edtDateServicesTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateServicesFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

  edtDateServicesTo.Checked := false;
  edtDateServicesFrom.Checked := false;
end;

end.
