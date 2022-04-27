unit reportServicesRelaxation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls , DialogFormUnit ;

type
  TfrmServicesRelaxationReport = class(TDialogForm)
    lblDateStart: TLabel;
    lblDateFinish: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinish: TDateTimePicker;
    btnCancel: TButton;
    btnOk: TButton;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    report_vid : Integer;
  end;

var
  frmServicesRelaxationReport: TfrmServicesRelaxationReport;

implementation

uses EnergyproController , DMReportsUnit;



{$R *.dfm}

procedure TfrmServicesRelaxationReport.btnOkClick(Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
begin
      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'contractdateservicesStart';
      args[0] := DateToStr(edtDateStart.Date);

      argNames[1] := 'contractdateservicesFinish';
      args[1] := DateToStr(edtDateFinish.Date);

      if report_vid = 1  then

      makeReport('Services/contractLivingInCottage/reestr', argNames, args, 'xls');


      if report_vid = 2  then

      makeReport('Services/contractLivingInCottage/reestrInfo', argNames, args, 'xls');
end;

end.
