
unit ShowRegulatoryAssetBaseCalculation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RegulatoryAssetBaseCalculationController, AdvObj, StdCtrls, Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit ;

const START_YEAR = 2021;
type
    TfrmRegulatoryAssetBaseCalculationShow = class(TChildForm)  
    HTTPRIORegulatoryAssetBaseCalculation: THTTPRIO;
    ImageList1: TImageList;
    sgRegulatoryAssetBaseCalculation: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    grpPeriod: TGroupBox;
    lblPeriod: TLabel;
    edtMonthGen: TComboBox;
    edtYearGen: TComboBox;
    btnCalculate: TToolButton;
    actCalculate: TAction;
    btnSorting: TToolButton;
    actSorting: TAction;
    edtYearGenTo: TComboBox;
    edtMonthGenTo: TComboBox;
    btnExport: TToolButton;
    actExport: TAction;
    btnReports: TToolButton;
    pmReports: TPopupMenu;
    ActionListReports: TActionList;
    actReportAssetsInitial: TAction;
    actReportAssetsNotInitial: TAction;
    mniReportAssetsInitiial: TMenuItem;
    mniReportAssetsNotInitial: TMenuItem;
    actReportInvestmentProgram: TAction;
    actReportConnection: TAction;
    mniReportInvestmentProgram: TMenuItem;
    mniReportConnection: TMenuItem;
    btnSynchronize: TToolButton;
    actSynchronize: TAction;

    procedure FormShow(Sender: TObject);
    procedure sgRegulatoryAssetBaseCalculationTopLeftChanged(Sender: TObject);
    procedure sgRegulatoryAssetBaseCalculationDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function SetPeriod : Boolean;
    procedure refresh(reset : Boolean = true);
    function SetByMaxPeriod : Boolean;
    procedure edtMonthGenChange(Sender: TObject);
    procedure edtYearGenChange(Sender: TObject);
    procedure actCalculateExecute(Sender: TObject);
    procedure sgRegulatoryAssetBaseCalculationCanSort(Sender: TObject;
      ACol: Integer; var DoSort: Boolean);
    procedure actSortingExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actReportAssetsInitialExecute(Sender: TObject);
    procedure actReportAssetsNotInitialExecute(Sender: TObject);
    procedure actReportInvestmentProgramExecute(Sender: TObject);
    procedure actReportConnectionExecute(Sender: TObject);
    procedure actSynchronizeExecute(Sender: TObject);
  private
   { Private declarations }
   selectedRow: Integer;
   function getIpAddressOfWorkingServer : String;
 public
   class function chooseFromList : RegulatoryAssetBaseCalculationShort; stdcall; static;
 end;
  
implementation

uses Main, DateUtils, EditRegulatoryAssetBaseCalculationFilter, EditChooseTXSDate, EditSorting
  , Generics.Collections, EnergyproController, DMReportsUnit, RegularExpressions, EditRegulatoryAssetBase
  , RABSynchronize;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RegulatoryAssetBaseCalculationHeaders: array [1..13] of String =
        ( 'Код'
          , 'Інвентарний номер'
          , 'Найменування'
          , 'Дата прибуткування активу'
          , 'Вартість, грн.'
          , 'СКВ, міс.'
          , 'Ліквідація активу'
          , 'Первісна вартість на початок періоду, грн.'
          , 'Амортизація, грн.'
          , 'Ліквідовано, грн.'
          , 'Залишкова вартість на кінець періоду, грн.'
          , 'Залишковий СКВ, міс.'
          , 'Группа'
        );
  period, periodTo : TDateTime;

class function TfrmRegulatoryAssetBaseCalculationShow.chooseFromList : RegulatoryAssetBaseCalculationShort;
var
  f1 : RegulatoryAssetBaseCalculationFilter;
  frmRegulatoryAssetBaseCalculationShow : TfrmRegulatoryAssetBaseCalculationShow;
  selected : RegulatoryAssetBaseCalculationShort;
begin
  inherited;
     selected := nil;
     f1 := RegulatoryAssetBaseCalculationFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmRegulatoryAssetBaseCalculationShow := TfrmRegulatoryAssetBaseCalculationShow.Create(Application, fmNormal, f1);
       try
          with frmRegulatoryAssetBaseCalculationShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := RegulatoryAssetBaseCalculationShort(sgRegulatoryAssetBaseCalculation.Objects[0, sgRegulatoryAssetBaseCalculation.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmRegulatoryAssetBaseCalculationShow.Free;
       end;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.edtMonthGenChange(
  Sender: TObject);
begin
  inherited;
  if not SetPeriod then begin
    if (Sender = edtMonthGen) then begin
      edtMonthGen.ItemIndex := StrToInt(FormatDateTime('m', period)) - 1;
    end else if (Sender = edtMonthGenTo) then begin
     edtMonthGenTo.ItemIndex := StrToInt(FormatDateTime('m', periodTo)) - 1;
    end;
  end;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.edtYearGenChange(
  Sender: TObject);
begin
  inherited;
  if not SetPeriod then begin
    if (Sender = edtYearGen) then begin
      edtYearGen.ItemIndex := StrToInt(FormatDateTime('yyyy', period)) - START_YEAR;
    end else if (Sender = edtYearGenTo) then begin
     edtYearGenTo.ItemIndex := StrToInt(FormatDateTime('yyyy', periodTo)) - START_YEAR;
    end;
  end;
  SetPeriod;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
  end;


procedure TfrmRegulatoryAssetBaseCalculationShow.FormShow(Sender: TObject);
begin
  if not SetByMaxPeriod then begin
    SetComboBoxCurrentMonth(edtMonthGen);
    SetComboBoxCurrentYearWithStart(edtYearGen, START_YEAR, 2);
    SetComboBoxCurrentMonth(edtMonthGenTo);
    SetComboBoxCurrentYearWithStart(edtYearGenTo, START_YEAR, 2);
  end;
  SetPeriod;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.sgRegulatoryAssetBaseCalculationTopLeftChanged(Sender: TObject);
begin
  refresh(false);
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.sgRegulatoryAssetBaseCalculationCanSort(
  Sender: TObject; ACol: Integer; var DoSort: Boolean);
begin
  inherited;
  DoSort := false;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.sgRegulatoryAssetBaseCalculationDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:= RegulatoryAssetBaseCalculationShort(sgRegulatoryAssetBaseCalculation.Objects[0, sgRegulatoryAssetBaseCalculation.Row]).assetRefCode;
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;



procedure TfrmRegulatoryAssetBaseCalculationShow.actViewExecute(Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  try
    RegulatoryAssetBaseObj := TempRegulatoryAssetBaseCalculation.getAsset(RegulatoryAssetBaseCalculationShort(sgRegulatoryAssetBaseCalculation.Objects[0, sgRegulatoryAssetBaseCalculation.Row]).assetRefCode);
  except
    on EConvertError do Exit;
  end;

  frmRegulatoryAssetBaseEdit := TfrmRegulatoryAssetBaseEdit.Create(Application, dsView);
  try
    frmRegulatoryAssetBaseEdit.ShowModal;
  finally
    frmRegulatoryAssetBaseEdit.Free;
    frmRegulatoryAssetBaseEdit := nil;
  end;
end;


procedure TfrmRegulatoryAssetBaseCalculationShow.actEditExecute(Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  try
    RegulatoryAssetBaseObj := TempRegulatoryAssetBaseCalculation.getAsset(RegulatoryAssetBaseCalculationShort(sgRegulatoryAssetBaseCalculation.Objects[0,sgRegulatoryAssetBaseCalculation.Row]).assetRefCode);
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRegulatoryAssetBaseCalculation.Row;
  frmRegulatoryAssetBaseEdit := TfrmRegulatoryAssetBaseEdit.Create(Application, dsEdit);
  
  try
    if frmRegulatoryAssetBaseEdit.ShowModal= mrOk then
      begin
        refresh;
      end;
  finally
    frmRegulatoryAssetBaseEdit.Free;
    frmRegulatoryAssetBaseEdit := nil;
  end;

  if sgRegulatoryAssetBaseCalculation.RowCount > selectedRow then
    sgRegulatoryAssetBaseCalculation.Row := selectedRow
  else
    sgRegulatoryAssetBaseCalculation.Row := sgRegulatoryAssetBaseCalculation.RowCount - 1;
end;


procedure TfrmRegulatoryAssetBaseCalculationShow.actExportExecute(
  Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  keyId : Int64;
  argNames, args : ArrayOfString;
begin
  inherited;
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation
    as RegulatoryAssetBaseCalculationControllerSoapPort;
  if Assigned(FilterObject) then begin
    keyId := TempRegulatoryAssetBaseCalculation.setFilter(RegulatoryAssetBaseCalculationFilter(FilterObject));
  end;
  SetLength(argNames, 3);
  SetLength(args, 3);
  argNames[0] := 'filterKeyId';
  args[0] := IntToStr(keyId);
  argNames[1] := 'periodTo';
  args[1] := FormatDateTime('dd.mm.yyyy', periodTo);

  argNames[2] := 'ipAddress';
  args[2] := Self.getIpAddressOfWorkingServer;

  makeReport('RAB/export_wrapper', argNames, args, 'xlsx');
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actCalculateExecute(
  Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
  calculationPeriod : TXSDate;
begin
  inherited;
  calculationPeriod := TXSDate.Create;
  calculationPeriod.XSToNative(GetXSDate(period));
  calculationPeriod := TfrmChooseTXSDate.choose('Період для розрахунку'
    , 'Оберіть період', calculationPeriod);
  if not Assigned(calculationPeriod) then Exit;
  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте порахувати дані на %s?', [XSDate2String(calculationPeriod)])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDNO then Exit;
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  TempRegulatoryAssetBaseCalculation.calculate(calculationPeriod);
  if SetByMaxPeriod then SetPeriod else refresh;
  Application.MessageBox(PChar(Format('Розрахунок на %s виконано!', [XSDate2String(calculationPeriod)]))
    , PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actDeleteExecute(Sender: TObject);
Var TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
  ObjCode: Integer;
begin
TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
   try
     ObjCode := RegulatoryAssetBaseCalculationShort(sgRegulatoryAssetBaseCalculation.Objects[0, sgRegulatoryAssetBaseCalculation.Row]).assetRefCode;
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRegulatoryAssetBaseCalculation.removeAsset(ObjCode);
      refresh;
  end;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actInsertExecute(Sender: TObject);
Var TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;  /// Это здесь уже лишнее!!!
  RegulatoryAssetBaseObj := RegulatoryAssetBase.Create;
  SetNullIntProps(RegulatoryAssetBaseObj);
  SetNullXSProps(RegulatoryAssetBaseObj);
  try
    frmRegulatoryAssetBaseEdit := TfrmRegulatoryAssetBaseEdit.Create(Application, dsInsert);
    try
      if frmRegulatoryAssetBaseEdit.ShowModal = mrOk then
      begin
        if RegulatoryAssetBaseObj <> nil then
            refresh;
      end;
    finally
      frmRegulatoryAssetBaseEdit.Free;
      frmRegulatoryAssetBaseEdit := nil;
    end;
  finally
    RegulatoryAssetBaseObj.Free;
  end;
end;


procedure TfrmRegulatoryAssetBaseCalculationShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  refresh;
end;


procedure TfrmRegulatoryAssetBaseCalculationShow.actFilterExecute(Sender: TObject);
var
   filterForm : TfrmRegulatoryAssetBaseCalculationFilterEdit;
begin
  filterForm := TfrmRegulatoryAssetBaseCalculationFilterEdit.Create(Application, dsInsert, RegulatoryAssetBaseCalculationFilter(FilterObject));
  try
    if filterForm.ShowModal = mrOk then
    begin
      selectedRow := 1;
      FilterObject := filterForm.GetFilter;
      refresh;
    end;
  finally
    filterForm.Free;
    filterForm:=nil;
  end;

end;


procedure TfrmRegulatoryAssetBaseCalculationShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  refresh;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actReportAssetsInitialExecute(
  Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  keyId : Int64;
  argNames, args : ArrayOfString;
  filter : RegulatoryAssetBaseCalculationFilter;
begin
  inherited;
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation
    as RegulatoryAssetBaseCalculationControllerSoapPort;
  if Assigned(FilterObject) then begin
    filter := RegulatoryAssetBaseCalculationFilter.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);
    filter.period := RegulatoryAssetBaseCalculationFilter(FilterObject).period;
    filter.assetFilter := RegulatoryAssetBaseFilter.Create;
    SetNullXSProps(filter.assetFilter);
    SetNullIntProps(filter.assetFilter);
    filter.assetFilter.initial := TXSBoolean.Create;
    filter.assetFilter.initial.AsBoolean := true;
    keyId := TempRegulatoryAssetBaseCalculation.setFilter(filter);
  end;
  SetLength(argNames, 3);
  SetLength(args, 3);
  argNames[0] := 'filterKeyId';
  args[0] := IntToStr(keyId);
  argNames[1] := 'periodTo';
  args[1] := FormatDateTime('dd.mm.yyyy', periodTo);

  argNames[2] := 'ipAddress';
  args[2] := Self.getIpAddressOfWorkingServer;
  makeReport('RAB/AssetsInitial_wrapper', argNames, args, 'xlsx');
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actReportAssetsNotInitialExecute(
  Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  keyId : Int64;
  argNames, args : ArrayOfString;
  filter : RegulatoryAssetBaseCalculationFilter;
begin
  inherited;
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation
    as RegulatoryAssetBaseCalculationControllerSoapPort;
  if Assigned(FilterObject) then begin
    filter := RegulatoryAssetBaseCalculationFilter.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);
    filter.period := RegulatoryAssetBaseCalculationFilter(FilterObject).period;
    filter.assetFilter := RegulatoryAssetBaseFilter.Create;
    SetNullXSProps(filter.assetFilter);
    SetNullIntProps(filter.assetFilter);
    filter.assetFilter.initial := TXSBoolean.Create;
    filter.assetFilter.initial.AsBoolean := false;
    keyId := TempRegulatoryAssetBaseCalculation.setFilter(filter);
  end;
  SetLength(argNames, 3);
  SetLength(args, 3);
  argNames[0] := 'filterKeyId';
  args[0] := IntToStr(keyId);
  argNames[1] := 'periodTo';
  args[1] := FormatDateTime('dd.mm.yyyy', periodTo);

  argNames[2] := 'ipAddress';
  args[2] := Self.getIpAddressOfWorkingServer;
  makeReport('RAB/AssetsNotInitial_wrapper', argNames, args, 'xlsx');
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actReportConnectionExecute(
  Sender: TObject);
var
  args, argNames : ArrayOfString;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);
  makeReport('RAB/Connection_wrapper', argNames, args, 'xlsx');
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actReportInvestmentProgramExecute(
  Sender: TObject);
var
  args, argNames : ArrayOfString;
begin
  inherited;
  SetLength(argNames, 1);
  SetLength(args, 1);
  makeReport('RAB/InvestmentProgram_wrapper', argNames, args, 'xlsx');
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actSortingExecute(
  Sender: TObject);
  var
  frmSorting : TfrmSortingEdit;
  fields : TList<TSortingRecord>;
  selected : string;
begin
  inherited;
    if Assigned(Self.FilterObject) then selected := RegulatoryAssetBaseCalculationFilter(FilterObject).orderBySQL;
    if(Length(Trim(selected)) = 0) then selected := 'regulatoryassetbase.inventorynumber asc';
    fields := TList<TSortingRecord>.Create;
    fields.AddRange([TSortingRecord.Create('regulatoryassetbase.code','asc', 'Код')
      , TSortingRecord.Create('regulatoryassetbase.inventoryNumber','asc', 'Інвентарний №')
      , TSortingRecord.Create('regulatoryassetbase.name','asc', 'Найменування')
      , TSortingRecord.Create('regulatoryassetbase.incomeDate','asc', 'Дата прибуткування')
      , TSortingRecord.Create('regulatoryassetbase.originalvalue','asc', 'Первісна вартість, грн.')
      , TSortingRecord.Create('regulatoryassetbase.usefullife','asc', 'СКВ, міс.')
      , TSortingRecord.Create('regulatoryassetbase.writeoffnumber','asc', 'Номер ліквідації')
      , TSortingRecord.Create('regulatoryassetbase.writeoffdate','asc', 'Дата ліквідації')
      , TSortingRecord.Create('regulatoryasstbsclcltn.originalvalue','asc', 'Первісна вартість на початок періоду, грн.')
      , TSortingRecord.Create('regulatoryasstbsclcltn.depreciation','asc', 'Амортизація, грн.')
      , TSortingRecord.Create('regulatoryasstbsclcltn.writtenoffvalue','asc', 'Ліквідовано, грн.')
      , TSortingRecord.Create('regulatoryasstbsclcltn.residualvalue','asc', 'Залишкова вартість на кінець періоду, грн.')
      , TSortingRecord.Create('regulatoryasstbsclcltn.usefullife','asc', 'Залишковий СКВ, міс.')
      , TSortingRecord.Create('regulatoryassetbasegrp.number','asc', 'Номер групи')
      , TSortingRecord.Create('regulatoryassetbasegrp.name','asc', 'Найменування групи')
      ]);

    frmSorting := TfrmSortingEdit.Create(Application, dsInsert, fields, selected);
  try
    if frmSorting.ShowModal = mrOk then begin
      if not Assigned(FilterObject) then begin
        FilterObject := RegulatoryAssetBaseCalculationFilter.Create;
      end;
      RegulatoryAssetBaseCalculationFilter(FilterObject).orderBySQL := frmSorting.GetString;
      refresh;
    end;
  finally
    frmSorting.Free;
    frmSorting := nil;
  end;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.actSynchronizeExecute(
  Sender: TObject);
var
  frmRABSynchronize : TfrmRABSynchronize;
  xsPeriod, xsPeriodTo : TXSDate;
begin
  inherited;
  frmRABSynchronize := TfrmRABSynchronize.Create(Application, dsView);
  xsPeriod := TXSDate.Create;
  xsPeriodTo := TXSDate.Create;
  xsPeriod.XSToNative(GetXSDate(period));
  xsPeriodTo.XSToNative(GetXSDate(periodTo));
  frmRABSynchronize.SetStartPeriod(xsPeriod);
  frmRABSynchronize.SetFinishPeriod(xsPeriodTo);
  frmRABSynchronize.ShowModal;
end;

function TfrmRegulatoryAssetBaseCalculationShow.SetPeriod : Boolean;
var month, year, monthTo, yearTo : Integer;
res : Boolean;
previousPeriod, previousPeriodTo : TDateTime;
begin
  res := True;
  previousPeriod := period; previousPeriodTo := periodTo;
  month := edtMonthGen.ItemIndex + 1;
  monthTo := edtMonthGenTo.ItemIndex + 1;
  year := StrToInt(edtYearGen.Text);
  yearTo := StrToInt(edtYearGenTo.Text);
  period := EncodeDate(year, month, 1);
  periodTo := EncodeDate(yearTo, monthTo, 1);
  res := periodTo >= period;
  if res then begin
    refresh;
    Self.Caption := 'РБА ' + FormatDateTime('mm.yyyy', periodTo);
    Self.UpdateCaption;
  end else begin
    period := previousPeriod;
    periodTo := previousPeriodTo;
    Application.MessageBox(PChar('Період повинен бути в хронологічній послідовності!'), PChar('Помилка'), MB_ICONERROR);
  end;
  Result := res;
end;

function TfrmRegulatoryAssetBaseCalculationShow.SetByMaxPeriod : Boolean;
var
  TempRegulatoryAssetBaseCalculationController : RegulatoryAssetBaseCalculationControllerSoapPort;
  filter : RegulatoryAssetBaseCalculationFilter;
  codes : RegulatoryAssetBaseCalculationController.ArrayOfInteger;
  obj : RegulatoryAssetBaseCalculation;
  month, year, currentYear, startYear, yearsToAppend : Integer;
  wasSet : Boolean;
begin
  wasSet := False;
  filter := RegulatoryAssetBaseCalculationFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.orderBySQL := 'period DESC';
  TempRegulatoryAssetBaseCalculationController :=  HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  codes := TempRegulatoryAssetBaseCalculationController.getScrollableFilteredCodeArray(filter, 0, 1);
  if Length(codes) > 0 then begin
    obj := TempRegulatoryAssetBaseCalculationController.getObject(codes[0]);
    month := MonthOf(obj.period.asDate);
    year := YearOf(obj.period.asDate);
    edtMonthGen.ItemIndex := month - 1;
    edtMonthGenTo.ItemIndex := month - 1;
    startYear := START_YEAR;
    currentYear := YearOf(Now);
    if year > currentYear then yearsToAppend := year - currentYear else yearsToAppend := 0;
    SetComboBoxCurrentYearWithStart(edtYearGen, startYear, yearsToAppend);
    SetComboBoxCurrentYearWithStart(edtYearGenTo, startYear, yearsToAppend);
    edtYearGen.ItemIndex := year - START_YEAR;
    edtYearGenTo.ItemIndex := year - START_YEAR;
    wasSet := True;
  end;
  Result := wasSet;
end;

procedure TfrmRegulatoryAssetBaseCalculationShow.refresh(reset : Boolean = true);
const PAGE_SIZE : Integer = 100;
var
  i, pageNum, currentRow : Integer;
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  RegulatoryAssetBaseCalculationList : RegulatoryAssetBaseCalculationShortList;
  xsPeriod, xsPeriodTo : TXSDate;
begin
  xsPeriod := TXSDate.Create;
  xsPeriodTo := TXSDate.Create;
  xsPeriod.XSToNative(GetXSDate(period));
  xsPeriodTo.XSToNative(GetXSDate(periodTo));
  if reset then begin
    sgRegulatoryAssetBaseCalculation.Clear;
    SetGridHeaders(RegulatoryAssetBaseCalculationHeaders, sgRegulatoryAssetBaseCalculation.ColumnHeaders);
    sgRegulatoryAssetBaseCalculation.RowCount := 3;
    sgRegulatoryAssetBaseCalculation.Row := 1;
    pageNum := 0;
    currentRow := 1;
  end else begin
    pageNum := Trunc(sgRegulatoryAssetBaseCalculation.RowCount / PAGE_SIZE);
    currentRow := sgRegulatoryAssetBaseCalculation.RowCount - 1;
    if (sgRegulatoryAssetBaseCalculation.RowCount - 2) Mod PAGE_SIZE <> 0 then begin
      Exit;
    end;
    if (sgRegulatoryAssetBaseCalculation.TopRow + sgRegulatoryAssetBaseCalculation.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  if FilterObject = nil then begin
    FilterObject := RegulatoryAssetBaseCalculationFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;
  RegulatoryAssetBaseCalculationFilter(FilterObject).period := xsPeriod;

  TempRegulatoryAssetBaseCalculation :=  HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  RegulatoryAssetBaseCalculationList := TempRegulatoryAssetBaseCalculation.getListOnPeriod(RegulatoryAssetBaseCalculationFilter(FilterObject), xsPeriodTo
	  , pageNum * PAGE_SIZE, PAGE_SIZE);

  sgRegulatoryAssetBaseCalculation.RowCount := sgRegulatoryAssetBaseCalculation.RowCount + RegulatoryAssetBaseCalculationList.totalCount;

  if (reset) and (RegulatoryAssetBaseCalculationList.totalCount > 0) then
    sgRegulatoryAssetBaseCalculation.RowCount := sgRegulatoryAssetBaseCalculation.RowCount - 1;

  with sgRegulatoryAssetBaseCalculation do begin
    for i := 0 to RegulatoryAssetBaseCalculationList.totalCount - 1 do begin
      //Application.ProcessMessages;

      if RegulatoryAssetBaseCalculationList.list[i].assetRefCode <> Low(Integer) then
        Cells[0, i + currentRow] := IntToStr(RegulatoryAssetBaseCalculationList.list[i].assetRefCode)
      else
        Cells[0, i + currentRow] := '';
      Cells[1, i + currentRow] := RegulatoryAssetBaseCalculationList.list[i].assetRefInventoryNumber;
      Cells[2, i + currentRow] := RegulatoryAssetBaseCalculationList.list[i].assetRefName;
      if RegulatoryAssetBaseCalculationList.list[i].assetRefIncomeDate = nil then
        Cells[3, i + currentRow] := ''
      else
        Cells[3, i + currentRow] := XSDate2String(RegulatoryAssetBaseCalculationList.list[i].assetRefIncomeDate);
      if RegulatoryAssetBaseCalculationList.list[i].assetRefOriginalValue = nil then
        Cells[4, i + currentRow] := ''
      else
        Cells[4, i + currentRow] := SeparateThousands(RegulatoryAssetBaseCalculationList.list[i].assetRefOriginalValue.DecimalString);
      if RegulatoryAssetBaseCalculationList.list[i].assetRefUsefulLife <> Low(Integer) then
        Cells[5, i + currentRow] := IntToStr(RegulatoryAssetBaseCalculationList.list[i].assetRefUsefulLife)
      else
        Cells[5, i + currentRow] := '';
      if RegulatoryAssetBaseCalculationList.list[i].assetRefWriteOffDate = nil then
        Cells[6, i + currentRow] := ''
      else
        Cells[6, i + currentRow] := Format('№ %s від %s'
          , [RegulatoryAssetBaseCalculationList.list[i].assetRefWriteOffNumber
            , XSDate2String(RegulatoryAssetBaseCalculationList.list[i].assetRefWriteOffDate)]);
      if RegulatoryAssetBaseCalculationList.list[i].originalValue = nil then
        Cells[7, i + currentRow] := ''
      else
        Cells[7, i + currentRow] := SeparateThousands(RegulatoryAssetBaseCalculationList.list[i].originalValue.DecimalString);
      if RegulatoryAssetBaseCalculationList.list[i].depreciation = nil then
        Cells[8, i + currentRow] := ''
      else
        Cells[8, i + currentRow] := SeparateThousands(RegulatoryAssetBaseCalculationList.list[i].depreciation.DecimalString);
      if RegulatoryAssetBaseCalculationList.list[i].writtenOffValue = nil then
        Cells[9, i + currentRow] := ''
      else
        Cells[9, i + currentRow] := SeparateThousands(RegulatoryAssetBaseCalculationList.list[i].writtenOffValue.DecimalString);
      if RegulatoryAssetBaseCalculationList.list[i].residualValue = nil then
        Cells[10, i + currentRow] := ''
      else
        Cells[10, i + currentRow] := SeparateThousands(RegulatoryAssetBaseCalculationList.list[i].residualValue.DecimalString);
      if RegulatoryAssetBaseCalculationList.list[i].usefulLife <> Low(Integer) then
        Cells[11, i + currentRow] := IntToStr(RegulatoryAssetBaseCalculationList.list[i].usefulLife)
      else
        Cells[11, i + currentRow] := '';
      if RegulatoryAssetBaseCalculationList.list[i].assetRefGroupRefCode <> Low(Integer) then
        Cells[12, i + currentRow] := RegulatoryAssetBaseCalculationList.list[i].assetRefGroupRefNumber
          + ' ' + RegulatoryAssetBaseCalculationList.list[i].assetRefGroupRefName
      else
        Cells[12, i + currentRow] := '';

      Alignments[2, i + currentRow] := taLeftJustify;
      Alignments[4, i + currentRow] := taRightJustify;
      Alignments[5, i + currentRow] := taRightJustify;
      Alignments[7, i + currentRow] := taRightJustify;
      Alignments[8, i + currentRow] := taRightJustify;
      Alignments[9, i + currentRow] := taRightJustify;
      Alignments[10, i + currentRow] := taRightJustify;
      Alignments[11, i + currentRow] := taRightJustify;

      Objects[0, i + currentRow] := RegulatoryAssetBaseCalculationList.list[i];
    end;
    // Итоговые значения
    if (Assigned(RegulatoryAssetBaseCalculationList)) and (Assigned(RegulatoryAssetBaseCalculationList.summaryValues)) then begin
      Cells[1, RowCount - 1] := 'Ітоги';
      with RegulatoryAssetBaseCalculationList.summaryValues do begin
        Cells[2, RowCount - 1] := assetRefName;
        if assetRefOriginalValue = nil then
          Cells[4, RowCount - 1] := ''
        else
          Cells[4, RowCount - 1] := SeparateThousands(assetRefOriginalValue.decimalString);
        if originalValue = nil then
          Cells[7, RowCount - 1] := ''
        else
          Cells[7, RowCount - 1] := SeparateThousands(originalValue.decimalString);
        if depreciation = nil then
          Cells[8, RowCount - 1] := ''
        else
          Cells[8, RowCount - 1] := SeparateThousands(depreciation.decimalString);
        if writtenOffValue = nil then
          Cells[9, RowCount - 1] := ''
        else
          Cells[9, RowCount - 1] := SeparateThousands(writtenOffValue.decimalString);
        if residualValue = nil then
          Cells[10, RowCount - 1] := ''
        else
          Cells[10, RowCount - 1] := SeparateThousands(residualValue.decimalString);
      end;
      Alignments[2, RowCount - 1] := taRightJustify;
      Alignments[4, RowCount - 1] := taRightJustify;
      Alignments[7, RowCount - 1] := taRightJustify;
      Alignments[8, RowCount - 1] := taRightJustify;
      Alignments[9, RowCount - 1] := taRightJustify;
      Alignments[10, RowCount - 1] := taRightJustify;
    end;

  end;
  if reset then sgRegulatoryAssetBaseCalculation.Row := currentRow else sgRegulatoryAssetBaseCalculation.Row := currentRow - 2;
end;

function TfrmRegulatoryAssetBaseCalculationShow.getIpAddressOfWorkingServer : String;
var
  ipAddress : String;
  regExForIpAddress : TRegEx;
begin
  regExForIpAddress := TRegEx.Create('(?:http://)([^:]+)');
  ipAddress := regExForIpAddress.Match(HTTPRIORegulatoryAssetBaseCalculation.URL, 1).Groups[1].Value;
  Result := ipAddress;
end;

end.
