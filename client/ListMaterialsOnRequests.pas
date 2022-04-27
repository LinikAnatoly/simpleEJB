unit ListMaterialsOnRequests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit, ComCtrls, ExtCtrls;

type
  TfrmListMaterialsOnRequests = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListMaterialsOnRequests: TfrmListMaterialsOnRequests;

implementation

{$R *.dfm}
uses EnergyproController , DMReportsUnit ;

procedure TfrmListMaterialsOnRequests.btnOkClick(Sender: TObject);
  var
  argNames, args : ArrayOfString;
  reportName : String;

begin

     SetLength(argNames, 2);
     SetLength(args, 2);

      argNames[0] := 'pdatestart';
      args[0] := DateToStr( edtDateStart.date );

      argNames[1] := 'pdateend';
      args[1] := DateToStr( edtDateFinal.date );

       reportName := 'ListMaterialsOnRequests';

    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');

end;

end.
