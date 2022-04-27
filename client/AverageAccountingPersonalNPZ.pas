unit AverageAccountingPersonalNPZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit, ComCtrls;

type
  TfrmAverageAccountingPersonalNPZ = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblReportDataStart: TLabel;
    lblReportDataEnd: TLabel;
    edtReportDataEnd: TDateTimePicker;
    edtReportDataStart: TDateTimePicker;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    GroupBox1: TGroupBox;
    rbWorkerNPZ: TRadioButton;
    rbWorkerAll: TRadioButton;
    procedure btnOkClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    podrcode : Integer;
    ax_podrcode : String;
  public
  reportForBrigade : boolean;
    { Public declarations }
  end;

var
  frmAverageAccountingPersonalNPZ: TfrmAverageAccountingPersonalNPZ;

implementation

uses DMReportsUnit, EnergyproController, ShowFINExecutorTree,
  FINExecutorController, ChildFormUnit, ENConsts;

{$R *.dfm}

procedure TfrmAverageAccountingPersonalNPZ.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName, strBudget : String;
  i : Integer;
begin

  SetLength(argNames, 8);
  SetLength(args, 8);

  argnames[1] := 'dateStart';
  args[1] := DateToStr( edtReportDataStart.date );

  argnames[2] := 'dateFinal';
  args[2] := DateToStr( edtReportDataEnd.date );

  argnames[3] := 'podr';
  args[3] :=InttoStr(podrcode) ;

  argnames[4] := 'onlyNPZ'; // учитывать работников только тех у которых был признак нвз и нвз_е(1)
                             // или учитывать всех работников из задания фактов
  if rbWorkerNPZ.Checked then
     args[4] := '1'
  else
     args[4] := '0';

  argnames[5] := 'ax_podrcode';
  args[5] := ax_podrcode ;

  if reportForBrigade = true  then
    if DMReports.UsesMDAXDataForReport = false then
     reportName := 'workTeams/AccountingBrigadeNPZ/mainAccountingBrigade'
    else
     reportName := 'workTeams/AccountingBrigadeNPZ/ax_mainAccountingBrigade'

  else
     reportName := 'AverageAccountingPersonalNPZ/mainAccounting';

  makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmAverageAccountingPersonalNPZ.FormShow(Sender: TObject);
begin
  inherited;
   podrcode:= 0;
   ax_podrcode := '';
   DisableControls([edtFINExecutorName]);

   rbWorkerNPZ.Checked:= true;

   if reportForBrigade = true  then
   HideControls([GroupBox1]);


end;

procedure TfrmAverageAccountingPersonalNPZ.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              // ENPlanWorkObj.finExecutor.name := getFullExecutorName(tvDep.Selected) ; //FINExecutorShort(tvDep.Selected.Data).name;
              podrcode := FINExecutorShort(tvDep.Selected.Data).finCode;
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
