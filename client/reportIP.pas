unit reportIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit, StdCtrls, ComCtrls, Buttons;

type
  TfrmReportIP = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtDateGen: TDateTimePicker;
    lblDate: TLabel;
    cbPlanWorkKind: TComboBox;
    lblReportKvartal: TLabel;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   enipObjectCode : Integer;
   reportvid : Integer;
   IPyear : Integer; //דמה ָֿ
   inform_nkre:Integer;
   byIpItemParent : Integer;
  end;

var
  frmReportIP: TfrmReportIP;


implementation

uses EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportIP.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName, strTabNumbers : String;
begin


   SetLength(argNames, 7);
   SetLength(args, 7);

  argNames[0] := 'ipcode';
  argNames[1] := 'kvartal';
  argNames[2] := 'datereport';
  argNames[3] := 'monthgen';
  argNames[4] := 'yeargen';
  argNames[5] := 'inform_nkre';
  argNames[6] := 'byIpItemParent';


  args[0] := IntToStr(enipObjectCode);
  args[1] := IntToStr(cbPlanWorkKind.ItemIndex+1 );
  args[2] := DateToStr(edtDateGen.date);

  if reportvid = 4 then
  begin
    if (edtMonthGen.ItemIndex >= 1 ) then
     begin
       args[3] := IntToStr(edtMonthGen.ItemIndex);
     end;

    args[4]:= IntToStr(IPyear);
  end;

  args[5]:= IntToStr(inform_nkre);

  args[6]:= IntToStr(byIpItemParent) ;

  if reportvid = 4  then
  reportName := 'Invest/PlanPay/planpay'
  else
  // reportName := 'Invest/StageBuyAndExecution/main';
  reportName := 'Invest/StageBuyAndExecution2/main';

  if inform_nkre = 1 then
  reportName := 'Invest/StageBuyAndExecution2NKRE/main';

  makeReport(reportName, argNames, args, 'xlsx');


end;

procedure TfrmReportIP.FormShow(Sender: TObject);
var y, m, d : Word;
begin
  edtDateGen.DateTime := Date;



  DecodeDate(Date,y,m,d);

    if ((m = 1 ) or (m = 2 ) or (m = 3 )) then
    cbPlanWorkKind.ItemIndex:= 0;
    if ((m = 4 ) or (m = 5 ) or (m = 6 )) then
    cbPlanWorkKind.ItemIndex:= 1;
    if ((m = 7 ) or (m = 8 ) or (m = 9 )) then
    cbPlanWorkKind.ItemIndex:= 2;
    if ((m = 10 ) or (m = 11 ) or (m = 12 )) then
    cbPlanWorkKind.ItemIndex:= 3;


    if reportvid = 4  then
    begin
      HideControls([lblDate, edtDateGen , lblReportKvartal , cbPlanWorkKind ]);
      HideControls([lblMonthGen, edtMonthGen ],false );
      edtMonthGen.ItemIndex:=1;

    end
    else
    HideControls([lblMonthGen, edtMonthGen ]);



end;

end.
