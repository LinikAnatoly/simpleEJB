unit ReportCostWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls , DialogFormUnit , DateUtils;

type
  TfrmReportCostWork = class(TDialogForm)
    lblReportDataStart: TLabel;
    lblReportDataEnd: TLabel;
    edtReportDataEnd: TDateTimePicker;
    edtReportDataStart: TDateTimePicker;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    GroupBox1: TGroupBox;
    rbkindmonth: TRadioButton;
    rbkindfact: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    chkShortReport: TCheckBox;
    procedure spbFINExecutorClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbkindfactClick(Sender: TObject);
    procedure rbkindmonthClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ax_podrcode : string;
  end;

var
  frmReportCostWork: TfrmReportCostWork;

implementation

uses ShowFINExecutor, ShowFINExecutorTree, DMReportsUnit, EnergyproController,
  FINExecutorController ,  ChildFormUnit;

{$R *.dfm}

procedure TfrmReportCostWork.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName, strBudget : String;
  i : Integer;
begin

  SetLength(argNames, 8);
  SetLength(args, 8);

  argnames[1] := 'pdate1';
  args[1] := DateToStr( edtReportDataStart.date );

  argnames[2] := 'pdate2';
  args[2] := DateToStr( edtReportDataEnd.date );

  argnames[3] := 'ax_podrcode';
  args[3] := ax_podrcode ;

  argnames[4] := 'renname';
  if edtFINExecutorName.text <> '' then
  args[4] := edtFINExecutorName.text
  else
  args[4] := 'Херсонобленерго';


  // reportName := 'CostWork/ax_CostWork';
   argnames[5] := 'plankind';
   if rbkindmonth.Checked = true then
    args[5] := '2'
    else
    args[5] :=  '4';


  if chkShortReport.Checked then
   reportName := 'CostWork/summary/CostWorkMain'
  else
   reportName := 'CostWork/CostWorkMain';

  makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportCostWork.FormShow(Sender: TObject);
var
m,d,y:word;
begin
DecodeDate(now,y,m,d);
  edtReportDataEnd.DateTime := EndOfAMonth(y, m);
  edtReportDataEnd.Checked := true;

  edtReportDataStart.DateTime := EncodeDate(y,m,1);
  edtReportDataStart.Checked := true;

  disablecontrols([edtFINExecutorName]);
end;

procedure TfrmReportCostWork.rbkindfactClick(Sender: TObject);
begin
  inherited;
   if rbkindfact.Checked = true  then
      chkShortReport.Visible := True;
end;

procedure TfrmReportCostWork.rbkindmonthClick(Sender: TObject);
begin
  inherited;
   if rbkindmonth.Checked = true then
      begin
       chkShortReport.Visible:= False;
       chkShortReport.Checked:= False;
      end;
end;

procedure TfrmReportCostWork.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;

begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              // ENPlanWorkObj.finExecutor.name := getFullExecutorName(tvDep.Selected) ; //FINExecutorShort(tvDep.Selected.Data).name;
              // podrcode := FINExecutorShort(tvDep.Selected.Data).finCode;
              ax_podrcode := FINExecutorShort(tvDep.Selected.Data).axOrgId;
              edtFINExecutorName.Text := DMReports.getFullExecutorName(tvDep.Selected);
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

end.
