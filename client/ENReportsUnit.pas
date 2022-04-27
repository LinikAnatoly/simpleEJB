unit ENReportsUnit;

interface

uses EnergyproController;


const _REPORTS_JAR_PATH = '/com/ksoe/energynetreport/';

procedure makeReport(reportName: String; argNames, args: ArrayOfString; reportType: String);


implementation

uses Windows, Forms, DMReportsUnit;

procedure makeReport(reportName: String; argNames, args: ArrayOfString; reportType: String);
var
  request: EPReportRequestEx;
begin
  request := EPReportRequestEx.Create;
  try
    request.reportCode := 0;
    request.funcName := _REPORTS_JAR_PATH + reportName + '.jasper';

    request.argNames := argNames;
    request.args := args;
    request.resultType := Low(Integer);

    if ((reportType = 'pdf') or (reportType = 'xls')) then
      DMReports.makeGeneralReportPDF(reportName, request, reportType);
  finally
    request.Free;
  end;
end;

end.

