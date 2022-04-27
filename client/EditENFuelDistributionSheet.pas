
unit EditENFuelDistributionSheet;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelDistributionSheetController,
  TKFuelTypeController, AdvObj, TB2Item, TB2Dock, TB2Toolbar, tmsAdvGridExcel;

const
ENFUELDISTRIBUTIONSHEET_SERVICES = 1;
ENFUELDISTRIBUTIONSHEET_GENERAL_WORK = 2;
ENFUELDISTRIBUTIONSHEET_VKB_IP = 3;
ENFUELDISTRIBUTIONSHEET_VKB_OTHER = 4;
ENFUELDISTRIBUTIONSHEET_VRTU = 5;
ENFUELDISTRIBUTIONSHEET_AVAR = 6;
ENFUELDISTRIBUTIONSHEET_OVB = 7;

type
  TfrmENFuelDistributionSheetEdit = class(TDialogForm)

    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENFuelDistributionSheet: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcENFuelDistributionSheet: TPageControl;
    tbENFuelDistributionSheet: TTabSheet;
    tbItems: TTabSheet;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    edtYearGen: TComboBox;
    GroupBox1: TGroupBox;
    rbbenzin92: TRadioButton;
    rbdp: TRadioButton;
    lblYearGen: TLabel;
    sgENFuelDistributionSheetItem: TAdvStringGrid;
    HTTPRIOENFuelDistributionSheetItem: THTTPRIO;
    edtSum1: TEdit;
    lblFreePMMByDecades: TLabel;
    lbSumsByDecades: TLabel;
    edtSum5Dec3: TEdit;
    edtQty5Dec3: TEdit;
    edtQty5Dec2: TEdit;
    edtQty5Dec1: TEdit;
    edtSum5Dec2: TEdit;
    edtSum5Dec1: TEdit;
    edtSum4Dec3: TEdit;
    edtQty4Dec3: TEdit;
    edtQty4Dec2: TEdit;
    edtQty4Dec1: TEdit;
    edtSum4Dec2: TEdit;
    edtSum4Dec1: TEdit;
    edtSum3Dec3: TEdit;
    edtQty3Dec3: TEdit;
    edtQty3Dec2: TEdit;
    edtQty3Dec1: TEdit;
    edtSum3Dec2: TEdit;
    edtSum3Dec1: TEdit;
    edtSum2Dec1: TEdit;
    edtSum2Dec2: TEdit;
    edtQty2Dec1: TEdit;
    edtQty2Dec2: TEdit;
    edtQty2Dec3: TEdit;
    edtSum2Dec3: TEdit;
    edtQty1Dec3: TEdit;
    edtQty1Dec2: TEdit;
    edtQty1Dec1: TEdit;
    edtSum1Dec3: TEdit;
    edtSum1Dec2: TEdit;
    edtSum1Dec1: TEdit;
    edtSum5: TEdit;
    edtSum4: TEdit;
    edtSum3: TEdit;
    edtSum2: TEdit;
    lblConfirmedSums: TLabel;
    btnRecalcSum2: TButton;
    btnRecalcSum3: TButton;
    btnRecalcSum4: TButton;
    btnRecalcSum5: TButton;
    btnRecalcSum1: TButton;
    alENFuelDistributionSheet: TActionList;
    actENFuelDistributionSheetUpdate: TAction;
    barENFuelDistributionSheetItems: TTBToolbar;
    TBItem3: TTBItem;
    imageList1 : TImageList;
    edtSum6: TEdit;
    edtSum6Dec1: TEdit;
    edtSum6Dec2: TEdit;
    edtSum6Dec3: TEdit;
    edtQty6Dec1: TEdit;
    edtQty6Dec2: TEdit;
    edtQty6Dec3: TEdit;
    btnRecalcSum6: TButton;
    tbUpdateItems: TTBItem;
    actUpdateItems: TAction;
    tbExport: TTBItem;
    actExcelExport: TAction;
    aeExcel: TAdvGridExcelIO;
    edtSum7: TEdit;
    edtSum7Dec1: TEdit;
    edtSum7Dec2: TEdit;
    edtSum7Dec3: TEdit;
    edtQty7Dec1: TEdit;
    edtQty7Dec2: TEdit;
    edtQty7Dec3: TEdit;
    btnRecalcSum7: TButton;
    lblDecadesToCalculate: TLabel;
    chbSecondDecade: TCheckBox;
    chbFirstDecade: TCheckBox;
    chbThirdDecade: TCheckBox;
    rbbenzin95: TRadioButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateItems;
  procedure pcENFuelDistributionSheetChange(Sender: TObject);
  procedure recalcApprovedPmmByTypeActivity(activityType : Integer; Sender: TObject);
    procedure btnRecalcSum1Click(Sender: TObject);
    procedure btnRecalcSum2Click(Sender: TObject);
    procedure btnRecalcSum3Click(Sender: TObject);
    procedure btnRecalcSum4Click(Sender: TObject);
    procedure btnRecalcSum5Click(Sender: TObject);
    procedure actENFuelDistributionSheetUpdateExecute(Sender: TObject);
    procedure btnRecalcSum6Click(Sender: TObject);
    procedure actUpdateItemsExecute(Sender: TObject);
    procedure sgENFuelDistributionSheetItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure actExcelExportExecute(Sender: TObject);
    procedure btnRecalcSum7Click(Sender: TObject);

  private
    { Private declarations }
    selectedItemIndex : Integer;
  public
    { Public declarations }



end;

var
  frmENFuelDistributionSheetEdit: TfrmENFuelDistributionSheetEdit;
  ENFuelDistributionSheetObj: ENFuelDistributionSheet;


  ENFuelDistributionSheetItemHeaders: array [1..12] of String =
        ( 'Код'
        , 'Номер декади'
        , 'Підрозділ'
        , 'Кількість палива (послуги на сторону), л.'
        , 'Кількість палива (загальні роботи), л.'
        , 'Кількість палива (ВКБ ІП), л.'
        , 'Кількість палива (ВКБ Інше), л.'
        , 'Кількість палива (Приєднання), л.'
        , 'Кількість палива (Аварійний запас), л.'
        , 'Кількість палива (ОВБ), л.'
        ,'Змінив'
        ,'Дата зміни'
        );


implementation

uses ENConsts, ENFuelDistributionSheetItemController, EditENFuelDistributionSheetItem, Globals, ShellAPI,
  DMReportsUnit;


{uses  
    EnergyproController, EnergyproController2, ENFuelDistributionSheetController  ;
}
{$R *.dfm}

procedure TfrmENFuelDistributionSheetEdit.recalcApprovedPmmByTypeActivity(activityType: Integer; Sender: TObject);
var
  TempENFuelDistributionSheet : ENFuelDistributionSheetControllerSoapPort;
  TempENFuelDistributionSheetItem : ENFuelDistributionSheetItemControllerSoapPort;
  checkItemsFilter : ENFuelDistributionSheetItemFilter;
  countNum : String;
  OverallSum, SumDec1, SumDec2, SumDec3 : Single;
  decadesToCalculate : ENFuelDistributionSheetController.ArrayOfInteger;
  countDecades : Integer;
begin
    TempENFuelDistributionSheet := HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;
    TempENFuelDistributionSheetItem := HTTPRIOENFuelDistributionSheetItem as ENFuelDistributionSheetItemControllerSoapPort;
    checkItemsFilter := ENFuelDistributionSheetItemFilter.Create;
    SetNullXSProps(checkItemsFilter);
    SetNullIntProps(checkItemsFilter);
    countDecades := 0;
    if (chbFirstDecade.Checked) then begin
      countDecades := countDecades + 1;
    end;
    if (chbSecondDecade.Checked) then begin
      countDecades := countDecades + 1;
    end;
    if (chbThirdDecade.Checked) then begin
      countDecades := countDecades + 1;
    end;

    if countDecades = 0 then begin
      Application.MessageBox(PChar('Оберіть хоча б одну декаду'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
    end;

    SetLength(decadesToCalculate, countDecades);

    countDecades := 0;
    if (chbFirstDecade.Checked) then begin
      decadesToCalculate[countDecades] := 1;
      countDecades := countDecades + 1;
    end;
    if (chbSecondDecade.Checked) then begin
      decadesToCalculate[countDecades] := 2;
      countDecades := countDecades + 1;
    end;
    if (chbThirdDecade.Checked) then begin
      decadesToCalculate[countDecades] := 3;
      countDecades := countDecades + 1;
    end;

    if(activityType = ENFUELDISTRIBUTIONSHEET_SERVICES) then begin
      countNum := '1';
      if(not NoBlankValues([edtSum1, edtSum1Dec1, edtSum1Dec2, edtSum1Dec3])) then begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
      end;
      if edtSum1.Text <> '' then
        ENFuelDistributionSheetObj.sum1.decimalString := edtSum1.Text
      else
        ENFuelDistributionSheetObj.sum1 := nil;

    if edtSum1Dec1.Text <> '' then
       ENFuelDistributionSheetObj.sum1dec1.decimalString := edtSum1Dec1.Text
     else
       ENFuelDistributionSheetObj.sum1dec1 := nil;
    if edtSum1Dec2.Text <> '' then
       ENFuelDistributionSheetObj.sum1dec2.decimalString := edtSum1Dec2.Text
     else
       ENFuelDistributionSheetObj.sum1dec2 := nil;
     if edtSum1Dec3.Text <> '' then
       ENFuelDistributionSheetObj.sum1dec3.decimalString := edtSum1Dec3.Text
     else
       ENFuelDistributionSheetObj.sum1dec3 := nil;

     OverallSum := StrToFloat(edtSum1.Text);
     SumDec1 :=  StrToFloat(edtSum1Dec1.Text);
     SumDec2 := StrToFloat(edtSum1Dec2.Text);
     SumDec3 := StrToFloat(edtSum1Dec3.Text);

    end;

    if(activityType = ENFUELDISTRIBUTIONSHEET_GENERAL_WORK) then begin
    countNum := '2';
      if(not NoBlankValues([edtSum2, edtSum2Dec1, edtSum2Dec2, edtSum2Dec3])) then begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
      end;
      if edtSum2.Text <> '' then
        ENFuelDistributionSheetObj.sum2.decimalString := edtSum2.Text
      else
        ENFuelDistributionSheetObj.sum2 := nil;

      if edtSum2Dec1.Text <> '' then
        ENFuelDistributionSheetObj.sum2dec1.decimalString := edtSum2Dec1.Text
      else
        ENFuelDistributionSheetObj.sum2dec1 := nil;
      if edtSum2Dec2.Text <> '' then
        ENFuelDistributionSheetObj.sum2dec2.decimalString := edtSum2Dec2.Text
      else
        ENFuelDistributionSheetObj.sum2dec2 := nil;
      if edtSum2Dec3.Text <> '' then
        ENFuelDistributionSheetObj.sum2dec3.decimalString := edtSum2Dec3.Text
      else
        ENFuelDistributionSheetObj.sum2dec3 := nil;

     OverallSum := StrToFloat(edtSum2.Text);
     SumDec1 :=  StrToFloat(edtSum2Dec1.Text);
     SumDec2 := StrToFloat(edtSum2Dec2.Text);
     SumDec3 := StrToFloat(edtSum2Dec3.Text);

    end;

    if (activityType = ENFUELDISTRIBUTIONSHEET_VKB_IP) then begin
      countNum := '3';
    if(not NoBlankValues([edtSum3, edtSum3Dec1, edtSum3Dec2, edtSum3Dec3])) then begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
      end;
      if edtSum3.Text <> '' then
        ENFuelDistributionSheetObj.sum3.decimalString := edtSum3.Text
      else
        ENFuelDistributionSheetObj.sum3 := nil;

    if edtSum3Dec1.Text <> '' then
       ENFuelDistributionSheetObj.sum3dec1.decimalString := edtSum3Dec1.Text
     else
       ENFuelDistributionSheetObj.sum3dec1 := nil;
    if edtSum3Dec2.Text <> '' then
       ENFuelDistributionSheetObj.sum3dec2.decimalString := edtSum3Dec2.Text
     else
       ENFuelDistributionSheetObj.sum3dec2 := nil;
     if edtSum3Dec3.Text <> '' then
       ENFuelDistributionSheetObj.sum3dec3.decimalString := edtSum3Dec3.Text
     else
       ENFuelDistributionSheetObj.sum3dec3 := nil;

     OverallSum := StrToFloat(edtSum3.Text);
     SumDec1 :=  StrToFloat(edtSum3Dec1.Text);
     SumDec2 := StrToFloat(edtSum3Dec2.Text);
     SumDec3 := StrToFloat(edtSum3Dec3.Text);
    end;

    if (activityType = ENFUELDISTRIBUTIONSHEET_VKB_OTHER) then begin
      countNum := '4';
          if(not NoBlankValues([edtSum4, edtSum4Dec1, edtSum4Dec2, edtSum4Dec3])) then begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
      end;
      if edtSum4.Text <> '' then
        ENFuelDistributionSheetObj.sum4.decimalString := edtSum4.Text
      else
        ENFuelDistributionSheetObj.sum4 := nil;

     if edtSum4Dec1.Text <> '' then
       ENFuelDistributionSheetObj.sum4dec1.decimalString := edtSum4Dec1.Text
     else
       ENFuelDistributionSheetObj.sum4dec1 := nil;
    if edtSum4Dec2.Text <> '' then
       ENFuelDistributionSheetObj.sum4dec2.decimalString := edtSum4Dec2.Text
     else
       ENFuelDistributionSheetObj.sum4dec2 := nil;
     if edtSum4Dec3.Text <> '' then
       ENFuelDistributionSheetObj.sum4dec3.decimalString := edtSum4Dec3.Text
     else
       ENFuelDistributionSheetObj.sum4dec3 := nil;

     OverallSum := StrToFloat(edtSum4.Text);
     SumDec1 :=  StrToFloat(edtSum4Dec1.Text);
     SumDec2 := StrToFloat(edtSum4Dec2.Text);
     SumDec3 := StrToFloat(edtSum4Dec3.Text);

    end;

    if (activityType = ENFUELDISTRIBUTIONSHEET_VRTU) then begin
        countNum := '5';
          if(not NoBlankValues([edtSum5, edtSum5Dec1, edtSum5Dec2, edtSum5Dec3])) then begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
      end;
      if edtSum5.Text <> '' then
        ENFuelDistributionSheetObj.sum5.decimalString := edtSum5.Text
      else
        ENFuelDistributionSheetObj.sum5 := nil;

      if edtSum5Dec1.Text <> '' then
        ENFuelDistributionSheetObj.sum5dec1.decimalString := edtSum5Dec1.Text
      else
        ENFuelDistributionSheetObj.sum5dec1 := nil;
      if edtSum5Dec2.Text <> '' then
        ENFuelDistributionSheetObj.sum5dec2.decimalString := edtSum5Dec2.Text
      else
        ENFuelDistributionSheetObj.sum5dec2 := nil;
      if edtSum5Dec3.Text <> '' then
        ENFuelDistributionSheetObj.sum5dec3.decimalString := edtSum5Dec3.Text
      else
        ENFuelDistributionSheetObj.sum5dec3 := nil;

     OverallSum := StrToFloat(edtSum5.Text);
     SumDec1 :=  StrToFloat(edtSum5Dec1.Text);
     SumDec2 := StrToFloat(edtSum5Dec2.Text);
     SumDec3 := StrToFloat(edtSum5Dec3.Text);
    end;

    if(activityType = ENFUELDISTRIBUTIONSHEET_AVAR) then begin
      countNum := '6';
      if(not NoBlankValues([edtSum6, edtSum6Dec1, edtSum6Dec2, edtSum6Dec3])) then begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
      end;
      if edtSum6.Text <> '' then
        ENFuelDistributionSheetObj.sum6.decimalString := edtSum6.Text
      else
        ENFuelDistributionSheetObj.sum6 := nil;

    if edtSum6Dec1.Text <> '' then
       ENFuelDistributionSheetObj.sum6dec1.decimalString := edtSum6Dec1.Text
     else
       ENFuelDistributionSheetObj.sum6dec1 := nil;
    if edtSum6Dec2.Text <> '' then
       ENFuelDistributionSheetObj.sum6dec2.decimalString := edtSum6Dec2.Text
     else
       ENFuelDistributionSheetObj.sum6dec2 := nil;
     if edtSum6Dec3.Text <> '' then
       ENFuelDistributionSheetObj.sum6dec3.decimalString := edtSum6Dec3.Text
     else
       ENFuelDistributionSheetObj.sum6dec3 := nil;

     OverallSum := StrToFloat(edtSum6.Text);
     SumDec1 :=  StrToFloat(edtSum6Dec1.Text);
     SumDec2 := StrToFloat(edtSum6Dec2.Text);
     SumDec3 := StrToFloat(edtSum6Dec3.Text);

    end;

    if(activityType = ENFUELDISTRIBUTIONSHEET_OVB) then begin
      countNum := '7';
      if(not NoBlankValues([edtSum7, edtSum7Dec1, edtSum7Dec2, edtSum7Dec3])) then begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
      end;
      if edtSum7.Text <> '' then
        ENFuelDistributionSheetObj.sum7.decimalString := edtSum7.Text
      else
        ENFuelDistributionSheetObj.sum7 := nil;

    if edtSum7Dec1.Text <> '' then
       ENFuelDistributionSheetObj.sum7dec1.decimalString := edtSum7Dec1.Text
     else
       ENFuelDistributionSheetObj.sum7dec1 := nil;
    if edtSum7Dec2.Text <> '' then
       ENFuelDistributionSheetObj.sum7dec2.decimalString := edtSum7Dec2.Text
     else
       ENFuelDistributionSheetObj.sum7dec2 := nil;
     if edtSum7Dec3.Text <> '' then
       ENFuelDistributionSheetObj.sum7dec3.decimalString := edtSum7Dec3.Text
     else
       ENFuelDistributionSheetObj.sum7dec3 := nil;

     OverallSum := StrToFloat(edtSum7.Text);
     SumDec1 :=  StrToFloat(edtSum7Dec1.Text);
     SumDec2 := StrToFloat(edtSum7Dec2.Text);
     SumDec3 := StrToFloat(edtSum7Dec3.Text);

    end;

    if((SumDec1 + SumDec2 + SumDec3) <> OverallSum) then begin
              Application.MessageBox(PChar('Не співпадає загальна сума (' + FloatToStr(OverallSum) +' грн.) з сумами по декадах (' + FloatToStr(SumDec1 + SumDec2 + SumDec3) + ' грн.)'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Exit;
    end;

    checkItemsFilter.conditionSQL := 'count' + countNum + ' > 0';

    if(Length(TempENFuelDistributionSheetItem.getScrollableFilteredCodeArray(checkItemsFilter, 0, -1)) > 0) then
    begin
          if Application.MessageBox(PChar('Ви бажаєте перерахувати строки, що вже були розраховані ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
          begin
            Exit;
          end;
    end;

    ENFuelDistributionSheetObj := TempENFuelDistributionSheet.recalcApprovedPmmByTypeActivity(ENFuelDistributionSheetObj, activityType, decadesToCalculate);
    updateItems;
    Self.FormShow(Sender);
    pcENFuelDistributionSheet.ActivePage := tbItems;
    Application.MessageBox(PChar('Строки розраховані!'),
        PChar('Увага !'),MB_OK);

end;

procedure TfrmENFuelDistributionSheetEdit.sgENFuelDistributionSheetItemCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
var
itemCode : Integer;
TempENFuelDistributionSheet : ENFuelDistributionSheetItemControllerSoapPort;
begin
  inherited;
  try
    itemCode := StrToInt(sgENFuelDistributionSheetItem.Cells[0, sgENFuelDistributionSheetItem.Row]);
  except
    on EConvertError do Exit;
  end;


  try
    TempENFuelDistributionSheet := HTTPRIOENFuelDistributionSheetItem as ENFuelDistributionSheetItemControllerSoapPort;
    TempENFuelDistributionSheet.setConfirmed(itemCode, State);
  Except on e : Exception do begin
    Application.MessageBox(PChar(e.Message),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    sgENFuelDistributionSheetItem.SetCheckBoxState(ACol, ARow, not State);

  end;
  end;

end;

procedure TfrmENFuelDistributionSheetEdit.updateItems;
var
TempFuelDistItems: ENFuelDistributionSheetItemControllerSoapPort;
LastCount, LastRow, i : Integer;
fuelDistItemList : ENFuelDistributionSheetItemShortList;
fuelDistItemFilter : ENFuelDistributionSheetItemFilter;

freePMMItemsList : ENFuelDistributionSheetItemShortList;
totalcount1,totalcount2,totalcount3,totalcount4,totalcount5,totalcount6  : Double;
begin
  sgENFuelDistributionSheetItem.Clear;
  SetGridHeaders(ENFuelDistributionSheetItemHeaders, sgENFuelDistributionSheetItem.ColumnHeaders);

  TempFuelDistItems := HTTPRIOENFuelDistributionSheetItem as ENFuelDistributionSheetItemControllerSoapPort;

  fuelDistItemFilter := ENFuelDistributionSheetItemFilter.Create;
  SetNullXSProps(fuelDistItemFilter);
  SetNullIntProps(fuelDistItemFilter);
  fuelDistItemFilter.fuelDistributionRef := ENFuelDistributionSheetRef.Create;
  fuelDistItemFilter.fuelDistributionRef.code := ENFuelDistributionSheetObj.code;
  fuelDistItemFilter.orderBySQL := 'decadenumber asc, code asc';

  fuelDistItemList := TempFuelDistItems.getScrollableFilteredList(fuelDistItemFilter, 0, -1);

  LastCount := High(fuelDistItemList.list);

  totalcount1:= 0;
  totalcount2:= 0;
  totalcount3:= 0;
  totalcount4:= 0;
  totalcount5:= 0;
  totalcount6:= 0;

  if LastCount > -1 then
    sgENFuelDistributionSheetItem.RowCount:=LastCount+2
  else
    sgENFuelDistributionSheetItem.RowCount:=2;

  with sgENFuelDistributionSheetItem do
    for i:=0 to LastCount do
      begin
        //Application.ProcessMessages;

      if fuelDistItemList.list[i].code <> Low(Integer) then
          Cells[0,i + 1] := IntToStr(fuelDistItemList.list[i].code)
        else
          Cells[0,i + 1] := '';
        if(fuelDistItemList.list[i].decadeNumber = Low(Integer)) then
           Cells[1, i + 1] := ''
        else
        Cells[1, i + 1] := IntToStr(fuelDistItemList.list[i].decadeNumber);

        if fuelDistItemList.list[i].decadeNumber = 1 then
              RowColor[i + 1] := $0097D7EC
        else if fuelDistItemList.list[i].decadeNumber = 2 then
              RowColor[i + 1] := $009AE9C9
        else if fuelDistItemList.list[i].decadeNumber = 3 then
              RowColor[i + 1] := $00D5E89B;

        Cells[2, i + 1] := fuelDistItemList.list[i].departmentRefShortName;
        if fuelDistItemList.list[i].count1 = nil then
          Cells[3, i + 1] := ''
        else
          begin
           Cells[3, i + 1] := fuelDistItemList.list[i].count1.DecimalString;
           totalcount1 := totalcount1 + StrToFloat(fuelDistItemList.list[i].count1.DecimalString);
          end;
        if fuelDistItemList.list[i].count2 = nil then
          Cells[4, i + 1] := ''
        else
          begin
          Cells[4, i + 1] := fuelDistItemList.list[i].count2.DecimalString;
          totalcount2 := totalcount2 + StrToFloat(fuelDistItemList.list[i].count2.DecimalString);
          end;
        if fuelDistItemList.list[i].count3 = nil then
          Cells[5, i + 1] := ''
        else
          begin
          Cells[5, i + 1] := fuelDistItemList.list[i].count3.DecimalString;
          totalcount3 := totalcount3 + StrToFloat(fuelDistItemList.list[i].count3.DecimalString);
          end;
        if fuelDistItemList.list[i].count4 = nil then
          Cells[6, i + 1] := ''
        else
          begin
          Cells[6, i + 1] := fuelDistItemList.list[i].count4.DecimalString;
          totalcount4 := totalcount4 + StrToFloat(fuelDistItemList.list[i].count4.DecimalString);
          end;
        if fuelDistItemList.list[i].count5 = nil then
          Cells[7, i + 1] := ''
        else
         begin
          Cells[7, i + 1] := fuelDistItemList.list[i].count5.DecimalString;
          totalcount5 := totalcount5 + StrToFloat(fuelDistItemList.list[i].count5.DecimalString);
         end;
        if fuelDistItemList.list[i].count6 = nil then
          Cells[8, i + 1] := ''
        else
          begin
          Cells[8, i + 1] := fuelDistItemList.list[i].count6.DecimalString;
          totalcount6 := totalcount6 + StrToFloat(fuelDistItemList.list[i].count6.DecimalString);
          end;

        if fuelDistItemList.list[i].count7 = nil then
          Cells[9, i + 1] := ''
        else
          Cells[9, i + 1] := fuelDistItemList.list[i].count7.DecimalString;

        Cells[10, i + 1] := fuelDistItemList.list[i].userGen;






        if(fuelDistItemList.list[i].isConfirmed = ENFUELDISTRIBUTIONSHEETITEM_CONFIRMED) then begin
          AddCheckBox(2,i+1, true, false);
        end else begin
         AddCheckBox(2,i+1, false, false);
        end;

        LastRow:=i+1;
        sgENFuelDistributionSheetItem.RowCount:=LastRow+1;
      end;

      sgENFuelDistributionSheetItem.RowCount:=LastRow+2;
      sgENFuelDistributionSheetItem.Cells[0,LastRow+1] := '';
      sgENFuelDistributionSheetItem.Cells[1,LastRow+1] := 'Всього літрів';
      sgENFuelDistributionSheetItem.Cells[2,LastRow+1] := 'за місяць';
      sgENFuelDistributionSheetItem.Cells[3,LastRow+1] := FloatToSTr(totalcount1);
      sgENFuelDistributionSheetItem.Cells[4,LastRow+1] := FloatToSTr(totalcount2);
      sgENFuelDistributionSheetItem.Cells[5,LastRow+1] := FloatToSTr(totalcount3);
      sgENFuelDistributionSheetItem.Cells[6,LastRow+1] := FloatToSTr(totalcount4);
      sgENFuelDistributionSheetItem.Cells[7,LastRow+1] := FloatToSTr(totalcount5);
      sgENFuelDistributionSheetItem.Cells[8,LastRow+1] := FloatToSTr(totalcount6);
      sgENFuelDistributionSheetItem.RowColor[LastRow+1] := clOlive;

      sgENFuelDistributionSheetItem.Row := 1;

      freePMMItemsList := TempFuelDistItems.getFreePMM(ENFuelDistributionSheetObj.code);

      // Всего 3 декады
      for i := 0 to 2 do begin
        if freePMMItemsList.list[i].decadeNumber = 1 then begin
          edtQty1Dec1.Text := freePMMItemsList.list[i].count1.DecimalString;
          edtQty2Dec1.Text := freePMMItemsList.list[i].count2.DecimalString;
          edtQty3Dec1.Text := freePMMItemsList.list[i].count3.DecimalString;
          edtQty4Dec1.Text := freePMMItemsList.list[i].count4.DecimalString;
          edtQty5Dec1.Text := freePMMItemsList.list[i].count5.DecimalString;
          edtQty6Dec1.Text := freePMMItemsList.list[i].count6.DecimalString;
          edtQty7Dec1.Text := freePMMItemsList.list[i].count7.DecimalString;
        end;
        if freePMMItemsList.list[i].decadeNumber = 2 then begin
          edtQty1Dec2.Text := freePMMItemsList.list[i].count1.DecimalString;
          edtQty2Dec2.Text := freePMMItemsList.list[i].count2.DecimalString;
          edtQty3Dec2.Text := freePMMItemsList.list[i].count3.DecimalString;
          edtQty4Dec2.Text := freePMMItemsList.list[i].count4.DecimalString;
          edtQty5Dec2.Text := freePMMItemsList.list[i].count5.DecimalString;
          edtQty6Dec2.Text := freePMMItemsList.list[i].count6.DecimalString;
          edtQty7Dec2.Text := freePMMItemsList.list[i].count7.DecimalString;
        end;
        if freePMMItemsList.list[i].decadeNumber = 3 then begin
          edtQty1Dec3.Text := freePMMItemsList.list[i].count1.DecimalString;
          edtQty2Dec3.Text := freePMMItemsList.list[i].count2.DecimalString;
          edtQty3Dec3.Text := freePMMItemsList.list[i].count3.DecimalString;
          edtQty4Dec3.Text := freePMMItemsList.list[i].count4.DecimalString;
          edtQty5Dec3.Text := freePMMItemsList.list[i].count5.DecimalString;
          edtQty6Dec3.Text := freePMMItemsList.list[i].count6.DecimalString;
          edtQty7Dec3.Text := freePMMItemsList.list[i].count7.DecimalString;
        end;
      end;

    if selectedItemIndex <> 0 then
        begin
        if sgENFuelDistributionSheetItem.RowCount > selectedItemIndex then
           sgENFuelDistributionSheetItem.Row := selectedItemIndex
        else
           sgENFuelDistributionSheetItem.Row := sgENFuelDistributionSheetItem.RowCount - 1;
        end
        else
        sgENFuelDistributionSheetItem.Row:=1;

end;

procedure TfrmENFuelDistributionSheetEdit.actENFuelDistributionSheetUpdateExecute(
  Sender: TObject);
Var
  itemCode : Integer;
  TempENFuelDistributionSheetItem : ENFuelDistributionSheetItemControllerSoapPort;
  formEdit : TfrmENFuelDistributionSheetItemEdit;

begin
  inherited;

  selectedItemIndex := sgENFuelDistributionSheetItem.Row;

    try
      itemCode := StrToInt(sgENFuelDistributionSheetItem.Cells[0,sgENFuelDistributionSheetItem.Row]);
    except
      on EConvertError do Exit;
    end;

    TempENFuelDistributionSheetItem := HTTPRIOENFuelDistributionSheetItem as ENFuelDistributionSheetItemControllerSoapPort;



    formEdit := TfrmENFuelDistributionSheetItemEdit.Create(Application, dsEdit);
    formEdit.ENFuelDistributionSheetItemObj := TempENFuelDistributionSheetItem.getObject(itemCode);

    if formEdit.ShowModal = mrOk then begin
      updateItems;
    end;

end;

procedure TfrmENFuelDistributionSheetEdit.actExcelExportExecute(
  Sender: TObject);
//var AppPath, FileName: String;
//    OldCursor: TCursor;
  var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  {OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName(Self.Caption + ' (фільтр) ') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar(FileName),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end; }
      SetLength(argNames, 1);
      SetLength(args, 1);

      argNames[0] := 'enfueldistributionshetcode';
      args[0] := IntTostr(ENFuelDistributionSheetObj.code );

      reportName := 'fuel/approved_fuel';

      makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmENFuelDistributionSheetEdit.actUpdateItemsExecute(
  Sender: TObject);
begin
  inherited;
  updateItems;
end;

procedure TfrmENFuelDistributionSheetEdit.btnRecalcSum1Click(Sender: TObject);
begin
  inherited;
  recalcApprovedPmmByTypeActivity(ENFUELDISTRIBUTIONSHEET_SERVICES, Sender);
end;

procedure TfrmENFuelDistributionSheetEdit.btnRecalcSum2Click(Sender: TObject);
begin
  inherited;
  recalcApprovedPmmByTypeActivity(ENFUELDISTRIBUTIONSHEET_GENERAL_WORK, Sender);
end;

procedure TfrmENFuelDistributionSheetEdit.btnRecalcSum3Click(Sender: TObject);
begin
  inherited;
  recalcApprovedPmmByTypeActivity(ENFUELDISTRIBUTIONSHEET_VKB_IP, Sender);
end;

procedure TfrmENFuelDistributionSheetEdit.btnRecalcSum4Click(Sender: TObject);
begin
  inherited;
  recalcApprovedPmmByTypeActivity(ENFUELDISTRIBUTIONSHEET_VKB_OTHER, Sender);
end;

procedure TfrmENFuelDistributionSheetEdit.btnRecalcSum5Click(Sender: TObject);
begin
  inherited;
  recalcApprovedPmmByTypeActivity(ENFUELDISTRIBUTIONSHEET_VRTU, Sender);
end;

procedure TfrmENFuelDistributionSheetEdit.btnRecalcSum6Click(Sender: TObject);
begin
  inherited;
  recalcApprovedPmmByTypeActivity(ENFUELDISTRIBUTIONSHEET_AVAR, Sender);
end;

procedure TfrmENFuelDistributionSheetEdit.btnRecalcSum7Click(Sender: TObject);
begin
  inherited;
  recalcApprovedPmmByTypeActivity(ENFUELDISTRIBUTIONSHEET_OVB, Sender);
end;

procedure TfrmENFuelDistributionSheetEdit.FormShow(Sender: TObject);

begin

  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);

  DisableControls([edtCode]);

  DisableControls([edtQty1Dec1, edtQty2Dec1, edtQty3Dec1, edtQty4Dec1, edtQty5Dec1, edtQty6Dec1, edtQty7Dec1]);
  DisableControls([edtQty1Dec2, edtQty2Dec2, edtQty3Dec2, edtQty4Dec2, edtQty5Dec2, edtQty6Dec2, edtQty7Dec2]);
  DisableControls([edtQty1Dec3, edtQty2Dec3, edtQty3Dec3, edtQty4Dec3, edtQty5Dec3, edtQty6Dec3, edtQty7Dec3]);

  pcENFuelDistributionSheet.ActivePage := tbENFuelDistributionSheet;

  if DialogState = dsInsert then
  begin
      tbItems.TabVisible := False;

  end;

  if DialogState = dsView then
  begin
     DisableControls([GroupBox1, btnRecalcSum1, btnRecalcSum2, btnRecalcSum3, btnRecalcSum4, btnRecalcSum5, btnRecalcSum6, btnRecalcSum7]);
     DisableActions([actENFuelDistributionSheetUpdate]);
     sgENFuelDistributionSheetItem.Options := sgENFuelDistributionSheetItem.Options - [goEditing];
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMonthGen
      ,edtYearGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENFuelDistributionSheetObj.code);

      DisableControls([edtYearGen, edtMonthGen, GroupBox1]);
    edtYearGen.Text := IntToStr(ENFuelDistributionSheetObj.yearGen);
    edtMonthGen.ItemIndex := ENFuelDistributionSheetObj.monthGen - 1;

    if ( ENFuelDistributionSheetObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(ENFuelDistributionSheetObj.monthGen)
    else
       edtMonthGen.Text := '';
    if ( ENFuelDistributionSheetObj.yearGen <> Low(Integer) ) then
      // edtYearGen.Text := IntToStr(ENFuelDistributionSheetObj.yearGen)
       edtYearGen.ItemIndex := ENFuelDistributionSheetObj.yearGen - 2009
    else
       edtYearGen.Text := '';

    if(ENFuelDistributionSheetObj.fuelTypeRef.code = ENConsts.TKFUELTYPE_95) then begin
       rbbenzin95.Checked := True;
    end
    else if(ENFuelDistributionSheetObj.fuelTypeRef.code = ENConsts.TKFUELTYPE_92) then begin
       rbbenzin92.Checked := True;
    end
    else begin
       rbdp.Checked := True;
    end;

    // Суммы
    if ENFuelDistributionSheetObj.sum1 = nil then
      edtSum1.Text := ''
    else
      edtSum1.Text := ENFuelDistributionSheetObj.sum1.DecimalString;

    if ENFuelDistributionSheetObj.sum2 = nil then
      edtSum2.Text := ''
    else
      edtSum2.Text := ENFuelDistributionSheetObj.sum2.DecimalString;

    if ENFuelDistributionSheetObj.sum3 = nil then
      edtSum3.Text := ''
    else
      edtSum3.Text := ENFuelDistributionSheetObj.sum3.DecimalString;

    if ENFuelDistributionSheetObj.sum4 = nil then
      edtSum4.Text := ''
    else
      edtSum4.Text := ENFuelDistributionSheetObj.sum4.DecimalString;

    if ENFuelDistributionSheetObj.sum5 = nil then
      edtSum5.Text := ''
    else
      edtSum5.Text := ENFuelDistributionSheetObj.sum5.DecimalString;

    if ENFuelDistributionSheetObj.sum6 = nil then
      edtSum6.Text := ''
    else
      edtSum6.Text := ENFuelDistributionSheetObj.sum6.DecimalString;

    if ENFuelDistributionSheetObj.sum7 = nil then
      edtSum7.Text := ''
    else
      edtSum7.Text := ENFuelDistributionSheetObj.sum7.DecimalString;

    // Подекадно

    if ENFuelDistributionSheetObj.sum1dec1 = nil then
      edtSum1Dec1.Text := ''
    else
      edtSum1Dec1.Text := ENFuelDistributionSheetObj.sum1dec1.DecimalString;

    if ENFuelDistributionSheetObj.sum1dec2 = nil then
      edtSum1Dec2.Text := ''
    else
      edtSum1Dec2.Text := ENFuelDistributionSheetObj.sum1dec2.DecimalString;

    if ENFuelDistributionSheetObj.sum1dec3 = nil then
      edtSum1Dec3.Text := ''
    else
      edtSum1Dec3.Text := ENFuelDistributionSheetObj.sum1dec3.DecimalString;

    if ENFuelDistributionSheetObj.sum2dec1 = nil then
      edtSum2Dec1.Text := ''
    else
      edtSum2Dec1.Text := ENFuelDistributionSheetObj.sum2dec1.DecimalString;

    if ENFuelDistributionSheetObj.sum2dec2 = nil then
      edtSum2Dec2.Text := ''
    else
      edtSum2Dec2.Text := ENFuelDistributionSheetObj.sum2dec2.DecimalString;

    if ENFuelDistributionSheetObj.sum2dec3 = nil then
      edtSum2Dec3.Text := ''
    else
      edtSum2Dec3.Text := ENFuelDistributionSheetObj.sum2dec3.DecimalString;

    if ENFuelDistributionSheetObj.sum3dec1 = nil then
      edtSum3Dec1.Text := ''
    else
      edtSum3Dec1.Text := ENFuelDistributionSheetObj.sum3dec1.DecimalString;

    if ENFuelDistributionSheetObj.sum3dec2 = nil then
      edtSum3Dec2.Text := ''
    else
      edtSum3Dec2.Text := ENFuelDistributionSheetObj.sum3dec2.DecimalString;

    if ENFuelDistributionSheetObj.sum3dec3 = nil then
      edtSum3Dec3.Text := ''
    else
      edtSum3Dec3.Text := ENFuelDistributionSheetObj.sum3dec3.DecimalString;

    if ENFuelDistributionSheetObj.sum4dec1 = nil then
      edtSum4Dec1.Text := ''
    else
      edtSum4Dec1.Text := ENFuelDistributionSheetObj.sum4dec1.DecimalString;

    if ENFuelDistributionSheetObj.sum4dec2 = nil then
      edtSum4Dec2.Text := ''
    else
      edtSum4Dec2.Text := ENFuelDistributionSheetObj.sum4dec2.DecimalString;

    if ENFuelDistributionSheetObj.sum4dec3 = nil then
      edtSum4Dec3.Text := ''
    else
      edtSum4Dec3.Text := ENFuelDistributionSheetObj.sum4dec3.DecimalString;

      if ENFuelDistributionSheetObj.sum5dec1 = nil then
      edtSum5Dec1.Text := ''
    else
      edtSum5Dec1.Text := ENFuelDistributionSheetObj.sum5dec1.DecimalString;

    if ENFuelDistributionSheetObj.sum5dec2 = nil then
      edtSum5Dec2.Text := ''
    else
      edtSum5Dec2.Text := ENFuelDistributionSheetObj.sum5dec2.DecimalString;

    if ENFuelDistributionSheetObj.sum5dec3 = nil then
      edtSum5Dec3.Text := ''
    else
      edtSum5Dec3.Text := ENFuelDistributionSheetObj.sum5dec3.DecimalString;

    if ENFuelDistributionSheetObj.sum6dec1 = nil then
      edtSum6Dec1.Text := ''
    else
      edtSum6Dec1.Text := ENFuelDistributionSheetObj.sum6dec1.DecimalString;

    if ENFuelDistributionSheetObj.sum6dec2 = nil then
      edtSum6Dec2.Text := ''
    else
      edtSum6Dec2.Text := ENFuelDistributionSheetObj.sum6dec2.DecimalString;

    if ENFuelDistributionSheetObj.sum6dec3 = nil then
      edtSum6Dec3.Text := ''
    else
      edtSum6Dec3.Text := ENFuelDistributionSheetObj.sum6dec3.DecimalString;

    if ENFuelDistributionSheetObj.sum7dec1 = nil then
      edtSum7Dec1.Text := ''
    else
      edtSum7Dec1.Text := ENFuelDistributionSheetObj.sum7dec1.DecimalString;

    if ENFuelDistributionSheetObj.sum7dec2 = nil then
      edtSum7Dec2.Text := ''
    else
      edtSum7Dec2.Text := ENFuelDistributionSheetObj.sum7dec2.DecimalString;

    if ENFuelDistributionSheetObj.sum7dec3 = nil then
      edtSum7Dec3.Text := ''
    else
      edtSum7Dec3.Text := ENFuelDistributionSheetObj.sum7dec3.DecimalString;

  end;
end;



procedure TfrmENFuelDistributionSheetEdit.pcENFuelDistributionSheetChange(
  Sender: TObject);
begin
  inherited;
  if pcENFuelDistributionSheet.ActivePage = tbItems then
  begin
    updateItems;
  end;

end;

procedure TfrmENFuelDistributionSheetEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelDistributionSheet: ENFuelDistributionSheetControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMonthGen
      ,edtYearGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFuelDistributionSheet := HTTPRIOENFuelDistributionSheet as ENFuelDistributionSheetControllerSoapPort;

  if (not rbbenzin95.Checked) and (not rbbenzin92.Checked) and (not rbdp.Checked) then begin
      Application.MessageBox(PChar('Оберіть тип палива !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
   end;

   ENFuelDistributionSheetObj.fuelTypeRef := TKFuelTypeRef.Create;
   if(rbbenzin95.Checked) then
    ENFuelDistributionSheetObj.fuelTypeRef.code := ENConsts.TKFUELTYPE_95
   else if(rbbenzin92.Checked) then
    ENFuelDistributionSheetObj.fuelTypeRef.code := ENConsts.TKFUELTYPE_92
   else
    if (rbdp.Checked) then
      ENFuelDistributionSheetObj.fuelTypeRef.code := ENConsts.TKFUELTYPE_DIESEL;


     if ( edtMonthGen.Text <> '' ) then
       ENFuelDistributionSheetObj.monthGen := edtMonthGen.ItemIndex + 1
     else
       ENFuelDistributionSheetObj.monthGen := Low(Integer) ;

     if ( edtYearGen.Text <> '' ) then
       ENFuelDistributionSheetObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENFuelDistributionSheetObj.yearGen := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENFuelDistributionSheetObj.code:=low(Integer);
      TempENFuelDistributionSheet.add(ENFuelDistributionSheetObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelDistributionSheet.save(ENFuelDistributionSheetObj);
    end;
  end;
end;


end.