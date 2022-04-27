unit ReportExecutionOfPlanMetrology;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit;

type
  TfrmReportExecutionOfPlanMetrology = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportExecutionOfPlanMetrology: TfrmReportExecutionOfPlanMetrology;

implementation
uses EnergyProController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportExecutionOfPlanMetrology.btnOkClick(Sender: TObject);
var
argNames, args: ArrayOfString;
begin
SetLength(argNames, 1);
SetLength(args, 1);
argNames[0] := 'YearGen';
args[0] := edtYearGen.Text;
makeReport('ExecutionOfPlanMetrology', argNames, args, 'xls');
Close;
end;

end.
