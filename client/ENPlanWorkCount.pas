unit ENPlanWorkCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, ComCtrls , ENPlanWorkController;

type
  TfrmPlanWorkCount = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    elementCode : String;

  end;

var
  frmPlanWorkCount: TfrmPlanWorkCount;

implementation

{$R *.dfm}
uses ChildFormUnit , EnergyproController , DMReportsUnit;


procedure TfrmPlanWorkCount.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
Begin

      SetLength(argNames, 3);
      SetLength(args, 3);

      argNames[0] := 'pdatestart';
      args[0] := dateToStr(edtDateStart.date);

      argNames[1] := 'pdatefinal';
      args[1] := dateToStr(edtDateFinal.date);


      reportName := 'ENPlanWorkCount';


    //  makeReport(reportName, argNames, args, 'xls');

    makeReportAuth(reportName, argNames, args, 'xls');

end;

end.
