unit ReportOutRealiztnUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DialogFormUnit;

type
  TfrmReportOutRealiztn = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportOutRealiztn: TfrmReportOutRealiztn;

implementation

{$R *.dfm}

uses ChildFormUnit,EnergyproController , DMReportsUnit;

procedure TfrmReportOutRealiztn.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
      /////// Parameters
      SetLength(argNames, 1);
      SetLength(args, 1);

      argNames[0] := 'dateOut';
      args[0] := DateToStr(edtDateGen.Date);

      reportName := 'RepEnergozbyt/out_date_realiztn';

      makeReport(reportName, argNames, args, 'xls');

end;

end.
