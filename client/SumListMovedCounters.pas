unit SumListMovedCounters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit;

type
  TfrmSumListMovedCounters = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSumListMovedCounters: TfrmSumListMovedCounters;

implementation

{$R *.dfm}
uses EnergyproController , DMReportsUnit  ;
procedure TfrmSumListMovedCounters.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin


    SetLength(argNames, 24);
    SetLength(args, 24);


    argNames[0] := 'codeoz';
    args[0] := Edit1.text;

    reportName := 'Counters/SumListMovedCounters';


    makeReport(reportName, argNames, args, 'xls')

end;

end.
