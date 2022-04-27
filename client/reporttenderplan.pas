unit reporttenderplan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons,DMReportsUnit, EnergyproController;

type
  Tfrmreporttenderplan = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreporttenderplan: Tfrmreporttenderplan;

implementation

{$R *.dfm}

procedure Tfrmreporttenderplan.btnOkClick(Sender: TObject);
 var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  SetLength(argNames, 1);
		SetLength(args, 1);

    argNames[0] := 'YEAR';
    args[0] := edtYearGen.Text;
    reportName := 'tenderplan/tenderplan2014';

    makeReport(reportName, argNames, args, 'xls')

end;

end.
