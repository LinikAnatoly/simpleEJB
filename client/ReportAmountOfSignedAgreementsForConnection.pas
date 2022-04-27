unit ReportAmountOfSignedAgreementsForConnection;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils;

type
  TfrmReportAmountOfSignedAgreementsForConnection = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDate: TLabel;
    edtDateFrom: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    chbIsWithoutZeroPayment: TCheckBox;
    chbIsWithoutCapitalCosts: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmReportAmountOfSignedAgreementsForConnection: TfrmReportAmountOfSignedAgreementsForConnection;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportAmountOfSignedAgreementsForConnection.FormShow(Sender: TObject);
begin
  inherited;

  edtDateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;



  end;

procedure TfrmReportAmountOfSignedAgreementsForConnection.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;
  isWithoutCapitalCosts, isWithoutZeroPayment : Integer;
begin

  inherited;

  isWithoutCapitalCosts := 0;
  isWithoutZeroPayment := 0;


if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('���� ������� ���� � ������������ �����������', '�������', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateFrom.Checked = false then
begin
   Application.MessageBox('������� ���� �������', '�������', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateTo.Checked = false then
begin
   Application.MessageBox('������� ���� ���������', '�������', MB_ICONWARNING + MB_OK);
  Exit;
end;

if chbIsWithoutCapitalCosts.Checked then
  isWithoutCapitalCosts := 1;
if chbIsWithoutZeroPayment.Checked then
  isWithoutZeroPayment := 1;

// ��������� ����������
SetLength(argNames, 4);
SetLength(args, 4);

argNames[0] := 'dateStart';
argNames[1] := 'dateFinal';
argNames[2] := 'isWithoutCapitalCosts';
argNames[3] := 'isWithoutZeroPayment';
args[0] := DateToStr(edtDateFrom.date);
args[1] := DateToStr(edtDateTo.date);
args[2] := IntToStr(isWithoutCapitalCosts);
args[3] := IntToStr(isWithoutZeroPayment);

reportName := 'Services/AmountOfSignedAgreementsForConnection/AmountOfSignedAgreementsForConnection';

makeReport(reportName, argNames, args, 'xls');

self.Close;

end;


end.
