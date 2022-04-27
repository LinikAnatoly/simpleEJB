unit ReportPmmNeeded;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils;

type
  TfrmReportPmmNeeded = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDate: TLabel;
    edtDateFrom: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmReportPmmNeeded: TfrmReportPmmNeeded;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportPmmNeeded.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  argNames, args: ArrayOfString;
  reportName : String;
begin

  inherited;

if (ModalResult <> mrOk) then
begin
  Exit;
end;

if edtDateFrom.Checked = false then
begin
   Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
   Action := caNone;
  Exit;
end;

if edtDateTo.Checked = false then
begin
  Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
  Action := caNone;
  Exit;
end;

if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
  Action := caNone;
  Exit;
end;

if edtDateFrom.Date < EncodeDate(YearOf(Now), MonthOf(Now), DayOf(Now)) then
begin
  Application.MessageBox('Цей звіт не можливо формувати на попередні періоди', 'Помилка', MB_ICONWARNING + MB_OK);
  Action := caNone;
  Exit;
end;


// Установка параметров
SetLength(argNames, 3);
SetLength(args, 3);

argNames[0] := 'dateStart';
args[0] := DateToStr(edtDateFrom.Date);
argNames[1] := 'dateFinal';
args[1] := DateToStr(edtDateTo.Date);

reportName := 'Auto/pmmNeeded/pmmNeeded';

makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportPmmNeeded.FormShow(Sender: TObject);
begin
  inherited;

  edtDateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DayOf(Now));
  edtDateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), DayOf(Now));

  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;

  DisableControls([edtDateFrom]);

  end;

end.
