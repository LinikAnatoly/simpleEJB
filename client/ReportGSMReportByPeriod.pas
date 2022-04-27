unit ReportGSMReportByPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls ,XSBuiltIns,
  CheckLst, InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmReportGSMReportByPeriod = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    dtpDateStart: TDateTimePicker;
    dtpDateFinal: TDateTimePicker;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmReportGSMReportByPeriod : TfrmReportGSMReportByPeriod;
  
implementation

{$R *.dfm}
 uses  ChildFormUnit , EnergyproController , DMReportsUnit, ENConsts, 
  TKMaterialsController;


procedure TfrmReportGSMReportByPeriod.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;

begin

      SetLength(argNames, 2);
      SetLength(args, 2);

      argNames[0] := 'dateStart';
      args[0] :=  DateToStr(dtpDateStart.Date);

      argNames[1] := 'dateFinal';
      args[1] := DateToStr(dtpDateFinal.Date);

      reportName := 'transport/gsm_report_by_period';

      makeReport(reportName, argNames, args, 'xls')

end;

end.
