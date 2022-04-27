unit ReportCallCenterByDatesUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DialogFormUnit;

type
  TReportCallCenterByDates = class(TDialogForm)
    edtDateStart: TDateTimePicker;
    lblDateGen: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDateEnd: TDateTimePicker;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportCallCenterByDates: TReportCallCenterByDates;

implementation

{$R *.dfm}

uses ChildFormUnit,EnergyproController , DMReportsUnit;

procedure TReportCallCenterByDates.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
      /////// Parameters
      SetLength(argNames, 2);
      SetLength(args, 2);

      argNames[0] := 'dateStart';
      args[0] := DateToStr(edtDateStart.Date);

      argNames[1] := 'dateEnd';
      args[1] := DateToStr(edtDateEnd.Date);

      reportName := 'CallCenter/rep_saidi';

      makeReport(reportName, argNames, args, 'xls');
end;

end.
