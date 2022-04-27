unit reportControInstallationCountersEEConnection;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DateUtils, DMReportsUnit,DialogFormUnit,
  CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, ExtCtrls, ChildFormUnit;

type
  TfrmControInstallationCountersEEConnection = class(TDialogForm)
    edtDateServicesFrom: TDateTimePicker;
    edtlEnpayment2sodateTo: TDateTimePicker;
    edtlEnpayment2sodateFrom: TDateTimePicker;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    edtDateServicesTo: TDateTimePicker;
    lbllEnpayment2sodateTo: TLabel;
    lbllEnpayment2sodateFrom: TLabel;
    lblEnpayment2sodate: TLabel;
    lblDateTo: TLabel;
    lblDateFrom: TLabel;
    lblDateServices: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControInstallationCountersEEConnection: TfrmControInstallationCountersEEConnection;

implementation

uses EnergyproController , ENConsts;

{$R *.dfm}

procedure TfrmControInstallationCountersEEConnection.btnOkClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;
  connectionKind : Integer;
begin
      if edtDateServicesFrom.Date > edtDateServicesTo.Date then
      begin
        Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

      if edtlEnpayment2sodateFrom.Date > edtlEnpayment2sodateTo.Date then
      begin
        Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

      // Установка параметров
      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'start_date_services';
      argNames[1] := 'end_date_services';
      argNames[2] := 'start_enpayment2sodate';
      argNames[3] := 'end_enpayment2sodate';


      //args[0] := '15.03.2020';

      if edtDateServicesFrom.Checked then
          args[0] := DateToStr(edtDateServicesFrom.date)
      else
          args[0] := '';
      if edtDateServicesTo.Checked then
          args[1] := DateToStr(edtDateServicesTo.date)
      else
          args[1] := '';
      if edtlEnpayment2sodateFrom.Checked then
          args[2] := DateToStr(edtlEnpayment2sodateFrom.date)
      else
          args[2] := '';
      if edtlEnpayment2sodateTo.Checked then
          args[3] := DateToStr(edtlEnpayment2sodateTo.date)
      else
          args[3] := '';


      reportName := 'Services/controInstallationCountersEEAfterPerformanceOfWorksOnConnection';
      makeReport(reportName, argNames, args, 'xlsx');
      self.Close;
end;

procedure TfrmControInstallationCountersEEConnection.FormShow(Sender: TObject);
begin
      edtDateServicesTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
      edtDateServicesFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
      edtlEnpayment2sodateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
      edtlEnpayment2sodateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

      edtDateServicesTo.Checked := false;
      edtDateServicesFrom.Checked := false;
      edtlEnpayment2sodateTo.Checked := false;
      edtlEnpayment2sodateFrom.Checked := false;
end;

end.
