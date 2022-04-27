unit ReportConnectionFactCost;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, ExtCtrls;

type
  TfrmReportConnectionFactCost = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtDateFrom: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    chbIsWithoutZeroPayment: TCheckBox;
    chbIsWithoutCapitalCosts: TCheckBox;
    rgIsCityVillage: TRadioGroup;
    rgIsStandardNonStandard: TRadioGroup;
    chkConnectionFactCostSUPP84018: TCheckBox;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmReportConnectionFactCost: TfrmReportConnectionFactCost;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportConnectionFactCost.FormShow(Sender: TObject);
begin
  inherited;

  edtDateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;



  end;

procedure TfrmReportConnectionFactCost.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;
  isWithoutCapitalCosts, isWithoutZeroPayment : Integer;
  // Признак необходимо ли выбирать договора с признаком село или город
  // значения:
  //  0 - все договора
  //  1 - город
  //  2 - село
  isCityVillage : Integer;
  // Признак необходимо ли выбирать договора с определнном типом присоединения
  // значения:
  //  0 - все договора
  //  1 - стандартное
  //  2 - нестандартное
  isStandardNonStandard : Integer;
begin

  inherited;

  isWithoutCapitalCosts := 0;
  isWithoutZeroPayment := 0;
  isCityVillage := 0;
  isStandardNonStandard := 0;

if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateFrom.Checked = false then
begin
   Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateTo.Checked = false then
begin
   Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

// Определение село / город
isCityVillage := rgIsCityVillage.ItemIndex;

// Тип приєднання
isStandardNonStandard := rgIsStandardNonStandard.ItemIndex+1;

if chbIsWithoutCapitalCosts.Checked then
  isWithoutCapitalCosts := 1;
if chbIsWithoutZeroPayment.Checked then
  isWithoutZeroPayment := 1;

// Установка параметров
SetLength(argNames, 8);
SetLength(args, 8);

argNames[0] := 'dateStart';
argNames[1] := 'dateFinal';
argNames[2] := 'isWithoutCapitalCosts';
argNames[3] := 'isWithoutZeroPayment';
argNames[4] := 'isCityVillage';
argNames[5] := 'isStandardNonStandard';
argNames[6] := 'tcsCode';
argNames[7] := 'po_date_provodki';
args[0] := DateToStr(edtDateFrom.date);
args[1] := DateToStr(edtDateTo.date);
args[2] := IntToStr(isWithoutCapitalCosts);
args[3] := IntToStr(isWithoutZeroPayment);
args[4] := IntToStr(isCityVillage);
args[5] := IntToStr(isStandardNonStandard);
args[6] := IntToStr(0);

  if RadioButton1.Checked then
  args[7] := IntToStr(0);
  if RadioButton2.Checked then
  args[7] := IntToStr(1);


reportName := 'Services/ConnectionFactCost/ConnectionFactCost';

  if chkConnectionFactCostSUPP84018.Checked = true then
   // tezzzt reportName := 'Services/ConnectionFactCost/ConnectionFactCostSUPP-84018';
   if isStandardNonStandard = 1 then
   reportName := 'Services/ConnectionFactCost/ConnectionFactCostMegaStandart'
   //reportName := 'Services/ConnectionFactCost/ConnectionFactCostMegaStandartSUPP-93318'
   else
     reportName := 'Services/ConnectionFactCost/ConnectionFactCostMegaNotStandart';
   //reportName := 'Services/ConnectionFactCost/ConnectionFactCostMegaNotStandartSUPP-93318';




makeReport(reportName, argNames, args, 'xls');

self.Close;

end;


end.
