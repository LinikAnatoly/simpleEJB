unit ReportTiresPurchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmReportTiresPurchase = class(TDialogForm)
  lblYearGen: TLabel;
  edtYearGen: TComboBox;
  btnOk: TBitBtn;
  btnCancel: TBitBtn;
  lblMonthStart: TLabel;
  edtMonthStart: TComboBox;
  lblMonthFinal: TLabel;
  edtMonthFinal: TComboBox;
  procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportTiresPurchase: TfrmReportTiresPurchase;

implementation

uses EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportTiresPurchase.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
      SetLength(argNames, 5);
      SetLength(args, 5);

      argNames[0] := 'year';
      args[0] := edtYearGen.Text;

      argNames[1] := 'pmonthstart';
      args[1] := IntToStr(edtMonthStart.ItemIndex + 1);

      argNames[2] := 'pmonthend';
      args[2] := IntToStr(edtMonthFinal.ItemIndex + 1 );

      argNames[3] := 'pmonthstartstr';
      args[3] := edtMonthStart.Text;

      argNames[4] := 'pmonthendstr';
      args[4] := edtMonthFinal.Text;

      reportName := 'AutoTires/tiresPurchase';
      makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmReportTiresPurchase.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
end;

end.
