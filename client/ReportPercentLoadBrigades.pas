unit ReportPercentLoadBrigades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons;

type
  TFrmReportPercentLoadBrigades = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtPercent: TEdit;
    Label2: TLabel;
    chkWithZadaniePlan: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReportPercentLoadBrigades: TFrmReportPercentLoadBrigades;

implementation

uses EnergyproController, DMReportsUnit, ENConsts;

{$R *.dfm}

procedure TFrmReportPercentLoadBrigades.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  var ys,ms,ds,yf,mf,df: Word;

begin

      SetLength(argNames, 5);
      SetLength(args, 5);

      argNames[0] := 'Year';
      if edtYearGen.Visible = True then
       args[0] := edtYearGen.Text
      else
       args[0] := '';

      argNames[1] := 'month';
      args[1] := IntToStr(edtMonthGen.ItemIndex + 1);

      argNames[2] := 'plankind';
      args[2] := '2';

      argNames[3] := 'persentLoadFilter';
      args[3] := edtPercent.Text;


      argNames[4] := 'withZadaniePlan';
      if chkWithZadaniePlan.Checked = false  then
      args[4] := '0'
      else
      args[4] := '1';


      if DMReports.UsesMDAXDataForReport = false  then
        reportName := 'NPZ_with_otpusk_pl_fact/main'  // для нпз с процентом загрузки по месячн планам с отображением план факт отпусков  по персоналу
      else
        reportName := 'NPZ_with_otpusk_pl_fact/ax_main';


      makeReport(reportName , argNames , args , 'xls');


end;

procedure TFrmReportPercentLoadBrigades.FormShow(Sender: TObject);
begin

   SetFloatStyle([edtPercent]);
   edtPercent.Text:= '50';

end;

end.
