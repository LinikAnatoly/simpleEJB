unit ReportPercentPremDriver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit  , ChildFormUnit ;

type
  TfrmReportPercentPremDriver = class(TDialogForm)
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    spbFINExecutorClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure spbFINExecutorClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
  { Public declarations }
    transportDepartmentCode : Integer;
    transportDepartmentName : String;

    fin_departmentCode: String;
    fin_departmentName: String;
    ////
    reportLoadType : Integer; // 1 - transport_load; 2 - drivers_load
    ////

    TransportClassification : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportPercentPremDriver: TfrmReportPercentPremDriver;

implementation

uses DMReportsUnit, ShowFINExecutorTree, FINExecutorController,
  EnergyproController;

{$R *.dfm}

procedure TfrmReportPercentPremDriver.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin


      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'fin_department';
      args[0] := fin_departmentCode;

      argNames[1] := 'transportdepartmentname';
      args[1] := fin_departmentName;

      argNames[2] := 'monthGen';
      args[2] :=  IntToStr(edtMonthGen.ItemIndex + 1);

      argNames[3] := 'yearGen';
      args[3] := edtYearGen.Text;


      reportName := 'transport/forPrem/ax_drivers_percent_load';

      makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportPercentPremDriver.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow:TfrmFINExecutorTreeShow;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        ForDriversReport := True;
        if ShowModal = mrOk then
        begin
            try
              if DMReports.UsesMDAXDataForReport = false then
               fin_departmentCode := IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode)
              else
               fin_departmentCode := FINExecutorShort(tvDep.Selected.Data).axOrgId;

               fin_departmentName := DMReports.getFullExecutorName(tvDep.Selected);
               edtFINExecutorName.Text := fin_departmentName;
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
