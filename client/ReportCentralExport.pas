unit ReportCentralExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit ;

type
  TfrmReportCentralExport = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportCentralExport: TfrmReportCentralExport;

implementation

uses EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportCentralExport.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

    SetLength(argNames, 2);
    SetLength(args, 2);

    argNames[0] := 'datestart';
    args[0] :=  '01.'+ IntToStr(edtMonthGen.ItemIndex + 1) + '.' + edtYearGen.Text ;

    argNames[1] := 'datefinal'; // на стороне репорта проставится последний день месяца
    args[1] := '01.'+ IntToStr(edtMonthGen.ItemIndex + 1) + '.' + edtYearGen.Text ;

    reportName := 'material/export/centralExport/exportMaterial';

    makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportCentralExport.FormCreate(Sender: TObject);
begin
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);
end;

end.
