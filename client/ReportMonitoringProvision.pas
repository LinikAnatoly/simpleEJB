unit ReportMonitoringProvision;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, ExtCtrls;

type
  TfrmReportMonitoringProvision = class(TDialogForm)
    lblFromDate: TLabel;
    edtDateFrom: TDateTimePicker;
    edtDateTill: TDateTimePicker;
    lblTillDate: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    rgPeriod: TRadioGroup;
    rgConnectionType: TRadioGroup;
    rgPlace: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportMonitoringProvision: TfrmReportMonitoringProvision;

implementation

uses ChildFormUnit, ENConsts, EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportMonitoringProvision.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  inherited;

  if edtDateFrom.Date > edtDateTill.Date then
  begin
    Application.MessageBox('Дати повинні бути в хронологічній послідовності',
      'Помилка', MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if edtDateFrom.Checked = false then
  begin
    Application.MessageBox('Оберить дату початку', 'Помилка',
      MB_ICONWARNING + MB_OK);
    Exit;
  end;

  if edtDateTill.Checked = false then
  begin
    Application.MessageBox('Оберить дату закінчення', 'Помилка',
      MB_ICONWARNING + MB_OK);
    Exit;
  end;

  SetLength(argNames, 5);
  SetLength(args, 5);

  argNames[0] := 'datestart';
  argNames[1] := 'datefinal';
  argNames[2] := 'isstandardnonstandard';
  argNames[3] := 'iscityvillage';
  argNames[4] := 'po_date_provodki';
  args[0] := DateToStr(edtDateFrom.Date);
  args[1] := DateToStr(edtDateTill.Date);
  args[2] := IntToStr(rgConnectionType.ItemIndex);
  args[3] := IntToStr(rgPlace.ItemIndex - 1);
  // -1 - все, остальное как в базе (0 - город, 1 - село)
  args[4] := IntToStr(rgPeriod.ItemIndex);
  if rgPeriod.ItemIndex = 2
  then reportName := 'Services/connectionServicesMonitoringProvision/connectionServicesMonitoringProvisionNoTU'
  else reportName := 'Services/connectionServicesMonitoringProvision/connectionServicesMonitoringProvision';

  makeReport(reportName, argNames, args, 'xls');

  self.Close;

end;

procedure TfrmReportMonitoringProvision.FormShow(Sender: TObject);
begin
  inherited;

  edtDateTill.Date := Now;
  edtDateFrom.Date := IncMonth(Now, -1);

  // edtDateTill.Checked := true;
  // edtDateFrom.Checked := true;

end;

end.
