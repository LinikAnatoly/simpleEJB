unit reportGSMLimit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,XSBuiltIns,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls,  ChildFormUnit, ENConsts,
     EnergyproController , DMReportsUnit;

type
  TfrmReportGSMLimit = class(TDialogForm)
    edtYearGen: TComboBox;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    cbbFuelType: TComboBox;
    lblFuelType: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportGSMLimit: TfrmReportGSMLimit;

implementation

{$R *.dfm}


procedure TfrmReportGSMLimit.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;

begin
      SetLength(argNames, 3);
      SetLength(args, 3);

      argNames[0] := 'pYear';
      args[0] := edtYearGen.Text;

      argNames[1] := 'pMonth';
      args[1] := IntToStr(edtMonthGen.ItemIndex + 1);

      argNames[2] := 'pFuelType';
      args[2] := IntToStr(cbbFuelType.ItemIndex + 1);

      reportName := 'fuel/gsm_limit/gsm_report_main';

      makeReport(reportName, argNames, args, 'xls');

      self.Close;
end;



procedure TfrmReportGSMLimit.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);
end;

end.
