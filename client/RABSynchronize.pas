unit RABSynchronize;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolController, TB2Item,
  TB2Dock, TB2Toolbar, AdvObj, HTMLabel, Generics.Collections, RegulatoryAssetBaseCalculationController,
  tmsAdvGridExcel, Globals, ShellAPI;

type
  TfrmRABSynchronize = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    pcSynchronization: TPageControl;
    tsIncomeAssets: TTabSheet;
    tsCompletelyWrittenOffAssets: TTabSheet;
    tsPartiallyWriteOffs: TTabSheet;
    tbIncomeAssetsActions: TTBToolbar;
    tbCompletelyWrittenOffAssetsActions: TTBToolbar;
    tbPartiallyWriteOffsActions: TTBToolbar;
    sgIncomeAssets: TAdvStringGrid;
    sgCompletelyWrittenOffAssets: TAdvStringGrid;
    sgPartialWriteOffs: TAdvStringGrid;
    HTTPRIORegulatoryAssetBaseCalculation: THTTPRIO;
    lblOverallCount: TLabel;
    ImageList1: TImageList;
    btnExcelIncomeAssets: TTBItem;
    aeExcelIncomeAssets: TAdvGridExcelIO;
    ActionList1: TActionList;
    actExportExcel: TAction;
    aeExcelCompletelyWrittenOffAssets: TAdvGridExcelIO;
    aeExcelPartialWriteOffs: TAdvGridExcelIO;
    btnExcelCompletelyWrittenOffAssets: TTBItem;
    btnExcelPartialWriteOff: TTBItem;
    actCheckedAll: TAction;
    actUncheckedAll: TAction;
    btnCheckedAllIncomeAssets: TTBItem;
    btnUncheckedAllIncomeAssets: TTBItem;
    btnCheckedAllCompletelyWrittenOffAssets: TTBItem;
    btnUnCheckedAllCompletelyWrittenOffAssets: TTBItem;
    btnCheckedAllPartialWriteOffs: TTBItem;
    btnUncheckedAllPartialWriteOffs: TTBItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcSynchronizationChange(Sender: TObject);
    procedure sgStringGridCheckBoxChange(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure actExportExcelExecute(Sender: TObject);
    procedure actCheckedAllExecute(Sender: TObject);
    procedure actUncheckedAllExecute(Sender: TObject);
  private
    data : RegulatoryAssetBaseSynchronizationData;
    startPeriod : TXSDate;
    finishPeriod : TXSDate;
    procedure fillIncomeAssetsGrid;
    procedure fillCompletelyWrittenOffAssetsGrid;
    procedure fillPartialWriteOffsGrid;
    procedure SetIncomeAssetInGrid(asset : RegulatoryAssetBase; rowIndex : Integer; checked : Boolean);
    procedure SetOverallCount;
    function GetGridByPage : TAdvStringGrid;
    procedure SetStateForColumnOfGrid(state : Boolean);
  public
    procedure SetStartPeriod(period : TXSDate);
    procedure SetFinishPeriod(period : TXSDate);
    { Public declarations }
  end;

var
  frmRABSynchronize: TfrmRABSynchronize;


implementation
uses Generics.Defaults, BaseUtilsUnit;

{$R *.dfm}

var
  incomeAssetsHeaders: array [1..7] of String =
        ('№'
        ,'Інвентарний №'
          , 'Найменування'
          , 'Дата прибуткування активу'
          , 'Первісна вартість, грн.'
          , 'Група'
          , 'СКВ, міс.'
        );

  completelyWrittenOffAssetsHeaders: array [1..5] of String =
        ( 'Код'
          , 'Інвентарний №'
          , 'Найменування'
          , 'Документ №'
          , 'Дата списання'
        );

  partialWriteOffsHeaders : array [1..7] of String =
        ( 'Код'
          , 'Інвентарний №'
          , 'Найменування'
          , 'Номер'
          , 'Дата'
          , 'Сума, грн.'
          , 'Відсоток, %'
        );
function TfrmRABSynchronize.GetGridByPage : TAdvStringGrid;
var grid : TAdvStringGrid;
begin
    grid := nil;
    if pcSynchronization.ActivePage = Self.tsIncomeAssets then begin
      grid := sgIncomeAssets;
    end else if pcSynchronization.ActivePage = Self.tsCompletelyWrittenOffAssets then begin
      grid := sgCompletelyWrittenOffAssets;
    end else if pcSynchronization.ActivePage = Self.tsPartiallyWriteOffs then begin
      grid := Self.sgPartialWriteOffs;
    end;
    Result := grid;
end;
procedure TfrmRABSynchronize.SetOverallCount;
var
count, countSelected : Integer;
begin
    count := 0; countSelected := 0;
    if not Assigned(data) then begin
      Self.lblOverallCount.Caption := 'Всього: 0';
      Exit;
    end;
    if pcSynchronization.ActivePage = Self.tsIncomeAssets then begin
          if(Assigned(data.incomeAssets)) then count := Length(Self.data.incomeAssets);
          countSelected := BaseUtils.getCheckedIndexes(Self.sgIncomeAssets, 1).Count;
    end else if pcSynchronization.ActivePage = Self.tsCompletelyWrittenOffAssets then begin
          if(Assigned(data.completelyWrittenOffAssets)) then count := Length(Self.data.incomeAssets);
          countSelected := BaseUtils.getCheckedIndexes(Self.sgCompletelyWrittenOffAssets, 1).Count;
    end else if pcSynchronization.ActivePage = Self.tsPartiallyWriteOffs then begin
          if(Assigned(data.partialWriteOffs)) then count := Length(Self.data.partialWriteOffs);
          countSelected := BaseUtils.getCheckedIndexes(Self.sgPartialWriteOffs, 1).Count;
    end;
    if countSelected > 0 then begin
      Self.lblOverallCount.Caption := Format('Всього: %d (виділено: %d)', [count, countSelected]);
    end else begin
      Self.lblOverallCount.Caption := Format('Всього: %d', [count]);
    end;
end;
procedure TfrmRABSynchronize.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  syncData : RegulatoryAssetBaseSynchronizationData;
  rowsIncomeAssets, rowsCompletelyWrittenOffAssets, rowsPartialWriteOffs : TList<Integer>;
  incomeAssets, completelyWrittenOffAssets : ArrayOfRegulatoryAssetBase;
  partialWriteOffs : ArrayOfRegulatoryAssetBasePartialWriteOff;
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  index, i : Integer;
begin
  inherited;
  if (ModalResult = mrOk) then begin
    TempRegulatoryAssetBaseCalculation := Self.HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
    rowsIncomeAssets := BaseUtils.getCheckedIndexes(Self.sgIncomeAssets, 1);
    rowsCompletelyWrittenOffAssets := BaseUtils.getCheckedIndexes(Self.sgCompletelyWrittenOffAssets, 1);
    rowsPartialWriteOffs := BaseUtils.getCheckedIndexes(Self.sgPartialWriteOffs, 1);
    syncData := RegulatoryAssetBaseSynchronizationData.Create;
    SetLength(incomeAssets, rowsIncomeAssets.Count);
    SetLength(completelyWrittenOffAssets, rowsCompletelyWrittenOffAssets.Count);
    SetLength(partialWriteOffs, rowsPartialWriteOffs.Count);
    i := 0;
    for index in rowsIncomeAssets do begin
      incomeAssets[i] := RegulatoryAssetBase(sgIncomeAssets.Objects[0, index]);
      i := i + 1;
    end;
    i := 0;
    for index in rowsCompletelyWrittenOffAssets do begin
      completelyWrittenOffAssets[i] := RegulatoryAssetBase(sgCompletelyWrittenOffAssets.Objects[0, index]);
      i := i + 1;
    end;
    i := 0;
    for index in rowsPartialWriteOffs do begin
      partialWriteOffs[i] := RegulatoryAssetBasePartialWriteOff(sgPartialWriteOffs.Objects[0, index]);
      i := i + 1;
    end;
    syncData.incomeAssets := incomeAssets;
    syncData.completelyWrittenOffAssets := completelyWrittenOffAssets;
    syncData.partialWriteOffs := partialWriteOffs;
    if (Length(incomeAssets) > 0) or (Length(completelyWrittenOffAssets) > 0) or (Length(partialWriteOffs) > 0) then begin
      if Application.MessageBox(PChar(Format('Ви дійсно бажаєте провести синхронізацію та оприбуткувати %d активів, списати %d активів ' +
      ' та додати %d часткових ліквідацій?', [Length(incomeAssets), Length(completelyWrittenOffAssets), Length(partialWriteOffs)])),
                        PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then begin
          TempRegulatoryAssetBaseCalculation.synchronize(syncData);
      end else begin
        Action := caNone;
        Exit;
      end;
    end;


  end;
end;

procedure TfrmRABSynchronize.FormShow(Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  inherited;
  TempRegulatoryAssetBaseCalculation := Self.HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  data := TempRegulatoryAssetBaseCalculation.getDataForSynchronization(Self.startPeriod, Self.finishPeriod);
  if Assigned(data) then begin
    Self.fillIncomeAssetsGrid;
    Self.fillCompletelyWrittenOffAssetsGrid;
    Self.fillPartialWriteOffsGrid;
  end;
  SetOverallCount;
end;

procedure TfrmRABSynchronize.pcSynchronizationChange(Sender: TObject);
begin
  inherited;
  SetOverallCount;
end;

procedure TfrmRABSynchronize.SetStartPeriod(period : TXSDate);
begin
  Self.startPeriod := period;
end;
procedure TfrmRABSynchronize.SetFinishPeriod(period : TXSDate);
begin
  Self.finishPeriod := period;
end;

procedure TfrmRABSynchronize.fillIncomeAssetsGrid;
var i, itemCode : Integer;
item : RegulatoryAssetBase;
begin
  sgIncomeAssets.Clear;
  sgIncomeAssets.RowCount := 2;
  SetGridHeaders(incomeAssetsHeaders, sgIncomeAssets.ColumnHeaders);
  if Assigned(data.incomeAssets) then begin
    for i := 0 to Length(data.incomeAssets) - 1 do begin
      item := data.incomeAssets[i];
      itemCode := i + 1;
      with sgIncomeAssets do begin
        Self.SetIncomeAssetInGrid(item, itemCode, true);
        if i > 0 then RowCount := RowCount + 1;
      end;
    end;
  end;
end;
procedure TfrmRABSynchronize.SetIncomeAssetInGrid(asset : RegulatoryAssetBase; rowIndex : Integer; checked : Boolean);
begin
  with sgIncomeAssets do begin
        AddCheckBox(1, rowIndex, checked, false);
        Cells[0, rowIndex] := IntToStr(rowIndex);
        Cells[1, rowIndex] := asset.inventoryNumber;
        Cells[2, rowIndex] := asset.name;
        Cells[3, rowIndex] := XSDate2String(asset.incomeDate);
        Cells[4, rowIndex] := SeparateThousands(asset.originalValue.DecimalString);
        Cells[5, rowIndex] := '';
        if asset.usefulLife <> Low(Integer) then Cells[5, rowIndex] := IntToStr(asset.usefulLife);
        Objects[0, rowIndex] := asset;
  end;
end;

procedure TfrmRABSynchronize.actCheckedAllExecute(Sender: TObject);
begin
  inherited;
  SetStateForColumnOfGrid(true);
end;
procedure TfrmRABSynchronize.SetStateForColumnOfGrid(state : Boolean);
var grid : TAdvStringGrid;
begin
  grid := Self.GetGridByPage;
  if Assigned(grid) then checkGrid(grid, 1, state);
end;

procedure TfrmRABSynchronize.actExportExcelExecute(Sender: TObject);
  var AppPath, FileName: String;
      OldCursor: TCursor;
      exp : TAdvGridExcelIO;
      str : string;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then CreateDir(AppPath + TempReportsPath);
    if pcSynchronization.ActivePage = Self.tsIncomeAssets then begin
      exp := aeExcelIncomeAssets;
      str := 'IncomeAssets';
    end else if pcSynchronization.ActivePage = Self.tsCompletelyWrittenOffAssets then begin
      exp := aeExcelCompletelyWrittenOffAssets;
      str := 'CompletelyWrittenOffAssets';
    end else if pcSynchronization.ActivePage = Self.tsPartiallyWriteOffs then begin
      exp := aeExcelPartialWriteOffs;
      str := 'PartialWriteOffs';
    end;
    FileName := AppPath + TempReportsPath + GetFileName(str) + '.xls';

    exp.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;
procedure TfrmRABSynchronize.actUncheckedAllExecute(Sender: TObject);
begin
  inherited;
  SetStateForColumnOfGrid(false);
end;

procedure TfrmRABSynchronize.fillCompletelyWrittenOffAssetsGrid;
var i, itemCode : Integer;
item : RegulatoryAssetBase;
begin
  sgCompletelyWrittenOffAssets.Clear;
  sgCompletelyWrittenOffAssets.RowCount := 2;
  SetGridHeaders(completelyWrittenOffAssetsHeaders, sgCompletelyWrittenOffAssets.ColumnHeaders);
  if Assigned(data.completelyWrittenOffAssets) then begin
    for i := 0 to Length(data.completelyWrittenOffAssets) - 1 do begin
      item := data.completelyWrittenOffAssets[i];
      itemCode := i + 1;
      with sgCompletelyWrittenOffAssets do begin
        AddCheckBox(1, itemCode, true, false);
        Cells[0, itemCode] := IntToStr(item.code);
        Cells[1, itemCode] := item.inventoryNumber;
        Cells[2, itemCode] := item.name;
        Cells[3, itemCode] := item.writeOffNumber;
        Cells[4, itemCode] := XSDate2String(item.writeOffDate);
        Objects[0, itemCode] := item;
        if i > 0 then RowCount := RowCount + 1;
      end;
    end;
  end;
end;

procedure TfrmRABSynchronize.fillPartialWriteOffsGrid;
var i, itemCode : Integer;
item : RegulatoryAssetBasePartialWriteOff;
asset : RegulatoryAssetBase;
TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  sgPartialWriteOffs.Clear;
  sgPartialWriteOffs.RowCount := 2;
  SetGridHeaders(partialWriteOffsHeaders, sgPartialWriteOffs.ColumnHeaders);
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  if Assigned(data.partialWriteOffs) then begin
    for i := 0 to Length(data.partialWriteOffs) - 1 do begin
      item := data.partialWriteOffs[i];
      itemCode := i + 1;
      with sgPartialWriteOffs do begin
        asset := TempRegulatoryAssetBaseCalculation.getAsset(item.assetRef.code);
        AddCheckBox(1, itemCode, true, false);
        Cells[0, itemCode] := IntToStr(item.assetRef.code);
        Cells[1, itemCode] := asset.inventoryNumber;
        Cells[2, itemCode] := asset.name;
        Cells[3, itemCode] := item.writeOffNumber;
        Cells[4, itemCode] := XSDate2String(item.writeOffDate);
        Cells[5, itemCode] := item.value.DecimalString;
        Cells[6, itemCode] := item.percentage.DecimalString;
        Objects[0, itemCode] := item;
        if i > 0 then RowCount := RowCount + 1;
      end;
    end;
  end;
end;
procedure TfrmRABSynchronize.sgStringGridCheckBoxChange(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  Self.SetOverallCount;
end;

end.
