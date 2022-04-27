unit EditRegulatoryAssetBase;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, RegulatoryAssetBaseCalculationController,
  AdvObj ;

type
  TfrmRegulatoryAssetBaseEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    HTTPRIORegulatoryAssetBaseCalculation: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    pgMain: TPageControl;
    tsMain: TTabSheet;
    edtInventoryNumber: TEdit;
    edtUsefulLife: TEdit;
    lblUsefulLife: TLabel;
    edtOriginalValue: TEdit;
    lblOriginalValue: TLabel;
    edtIncomeDate: TDateTimePicker;
    lblIncomeDate: TLabel;
    edtName: TEdit;
    lblName: TLabel;
    lblInventoryNumber: TLabel;
    lblInitial: TLabel;
    edtInitial: TComboBox;
    lblGroup: TLabel;
    edtGroupName: TEdit;
    spbChooseGroup: TSpeedButton;
    spbClearGroup: TSpeedButton;
    tsOutOfUse: TTabSheet;
    tsPartialWriteOff: TTabSheet;
    tsCalculation: TTabSheet;
    sgRegulatoryAssetBaseCalculation: TAdvStringGrid;
    imageList: TImageList;
    actionList: TActionList;
    actViewOutOfUse: TAction;
    actAddOutOfUse: TAction;
    actEditOutOfUse: TAction;
    actRemoveOutOfUse: TAction;
    actRefreshOutOfUse: TAction;
    toolBarOutOfUse: TToolBar;
    btnViewOutOfUse: TToolButton;
    btnAddOutOfUse: TToolButton;
    btnRemoveOutOfUse: TToolButton;
    btnEditOutOfUse: TToolButton;
    btnRefreshOutOfUse: TToolButton;
    sgRegulatoryAssetBaseOutOfUse: TAdvStringGrid;
    toolBarPartialWriteOff: TToolBar;
    btnViewPartialWriteOff: TToolButton;
    btnAddPartialWriteOff: TToolButton;
    btnEditPartialWriteOff: TToolButton;
    btnRemovePartialWriteOff: TToolButton;
    btnRefreshPartialWriteOff: TToolButton;
    sgRegulatoryAssetBasePartialWriteOff: TAdvStringGrid;
    actViewPartialWriteOff: TAction;
    actAddPartialWriteOff: TAction;
    actEditPartialWriteOff: TAction;
    actRemovePartialWriteOff: TAction;
    actRefreshPartialWriteOff: TAction;
    grpWriteOff: TGroupBox;
    edtWriteOffDate: TDateTimePicker;
    lblWriteOffDate: TLabel;
    lblWriteOffNumber: TLabel;
    edtWriteOffNumber: TEdit;
    chkWriteOff: TCheckBox;
    spbClearFundingSource: TSpeedButton;
    spbChooseFundingSource: TSpeedButton;
    lblFundingSource: TLabel;
    edtFundingSourceName: TEdit;
    lblDocumentNumber: TLabel;
    edtDocumentNumber: TEdit;
    edtInvestition: TCheckBox;
    edtConnection: TCheckBox;
    tsInvestitionProgram: TTabSheet;
    tsConnection: TTabSheet;
    edtInvestitionProgramCipher: TEdit;
    Label1: TLabel;
    lblInvestitionProgramYear: TLabel;
    edtInvestitionProgramYear: TEdit;
    edtInvestitionProgramName: TEdit;
    lblInvestitionProgramName: TLabel;
    edtConnectionContragent: TEdit;
    lblConnectionContragent: TLabel;
    edtConnectionDate: TDateTimePicker;
    lblConnectionDate: TLabel;
    edtConnectionNumber: TEdit;
    lblConnectionNumber: TLabel;
    lblCategoryCode: TLabel;
    edtCategoryCode: TComboBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbClearGroupClick(Sender: TObject);
    procedure spbChooseGroupClick(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure actViewOutOfUseExecute(Sender: TObject);
    procedure actAddOutOfUseExecute(Sender: TObject);
    procedure actRefreshOutOfUseExecute(Sender: TObject);
    procedure actRefreshPartialWriteOffExecute(Sender: TObject);
    procedure actAddPartialWriteOffExecute(Sender: TObject);
    procedure actViewPartialWriteOffExecute(Sender: TObject);
    procedure actEditPartialWriteOffExecute(Sender: TObject);
    procedure actEditOutOfUseExecute(Sender: TObject);
    procedure actRemoveOutOfUseExecute(Sender: TObject);
    procedure actRemovePartialWriteOffExecute(Sender: TObject);
    procedure chkWriteOffClick(Sender: TObject);
    procedure spbClearFundingSourceClick(Sender: TObject);
    procedure spbChooseFundingSourceClick(Sender: TObject);
    procedure toggleInvestitionAndConnection(Sender : TObject);


  private
    procedure openPartialWriteOff(DialogState: TDialogState);
    procedure openOutOfUse(DialogState: TDialogState);
    procedure refreshCalculations;
    procedure refreshOutOfUse;
    procedure refreshPartialWriteOff;
    procedure SetFundingSource;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegulatoryAssetBaseEdit: TfrmRegulatoryAssetBaseEdit;
  RegulatoryAssetBaseObj: RegulatoryAssetBase;

  RegulatoryAssetBaseCalculationHeaders: array [1..7] of String =
        ( 'Код'
          , 'Період'
          , 'Первісна вартість на початок періоду, грн.'
          , 'Амортизація, грн.'
          , 'Ліквідовано, грн.'
          , 'Залишкова вартість на кінець періоду, грн.'
          , 'Залишковий СКВ, міс.'
        );
  RegulatoryAssetBaseOutOfUseHeaders: array [1..3] of String =
        ( 'Код'
          , 'Дата початку'
          , 'Дата кінця'
        );
  RegulatoryAssetBasePartialWriteOffHeaders: array [1..4] of String =
        ( 'Код'
          , 'Дата списання'
          , 'Сума, грн.'
          , 'Відсоток, %'
        );

implementation

uses ShowRegulatoryAssetBaseGroup, EditRegulatoryAssetBaseOutOfUse, EditRegulatoryAssetBasePartialWriteOff
  , ShowRegulatoryAssetBaseFundingSource;

{$R *.dfm}

procedure TfrmRegulatoryAssetBaseEdit.FormShow(Sender: TObject);
var
  TempRegulatoryAssetBaseGroup : RegulatoryAssetBaseCalculationControllerSoapPort;
  group : RegulatoryAssetBaseGroup;
begin
  pgMain.ActivePage := tsMain;
  tsConnection.TabVisible := false;
  tsInvestitionProgram.TabVisible := false;
  DisableControls([edtCode, edtInitial, edtGroupName, edtFundingSourceName]);
  SetFloatStyle([edtOriginalValue]);
  SetIntStyle([edtUsefulLife, edtInvestitionProgramYear]);
  TempRegulatoryAssetBaseGroup := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  if DialogState = dsView then begin
      DisableControls([spbChooseGroup, spbClearGroup, spbChooseFundingSource, spbClearFundingSource]);
  end;
  edtInventoryNumber.SetFocus;
  if (DialogState = dsInsert) then begin
    tsOutOfUse.TabVisible := False;
    tsPartialWriteOff.TabVisible := False;
    tsCalculation.TabVisible := False;
    HideControls([lblCode, edtCode, chkWriteOff, grpWriteOff]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then begin
    DenyBlankValues([
      edtInventoryNumber
      ,edtName
      ,edtIncomeDate
      ,edtOriginalValue
      ,edtUsefulLife
      ,edtInitial
      ,edtGroupName
    ]);
  end;
  edtInitial.ItemIndex := 1;
  if (DialogState = dsEdit) or (DialogState = dsView) then begin
    edtCode.Text := IntToStr(RegulatoryAssetBaseObj.code);
    edtInventoryNumber.Text := RegulatoryAssetBaseObj.inventoryNumber;
    edtName.Text := RegulatoryAssetBaseObj.name;
    SetDateFieldForDateTimePicker(edtIncomeDate, RegulatoryAssetBaseObj.incomeDate);
    edtDocumentNumber.Text := RegulatoryAssetBaseObj.documentNumber;
    SetTXSDecimalForTEdit(edtOriginalValue, RegulatoryAssetBaseObj.originalValue);
    SetIntForTEdit(edtUsefulLife, RegulatoryAssetBaseObj.usefulLife);
    if ( RegulatoryAssetBaseObj.initial <> nil ) And ( RegulatoryAssetBaseObj.initial.asBoolean) then begin
      edtInitial.ItemIndex := 0;
    end;

    chkWriteOff.Checked := Assigned(RegulatoryAssetBaseObj.writeOffDate);
    HideControls([grpWriteOff], not chkWriteOff.Checked);
    HideControls([chkWriteOff], ((not chkWriteOff.Checked) and (DialogState = dsView)));

    edtWriteOffNumber.Text := RegulatoryAssetBaseObj.writeOffNumber;
    SetDateFieldForDateTimePicker(edtWriteOffDate, RegulatoryAssetBaseObj.writeOffDate);
    if Assigned(RegulatoryAssetBaseObj) then begin
      group := TempRegulatoryAssetBaseGroup.getGroup(RegulatoryAssetBaseObj.groupRef.code);
      edtGroupName.Text := group.number + ' ' + group.name;
    end;
    edtConnection.Checked := Assigned(RegulatoryAssetBaseObj.connection) and RegulatoryAssetBaseObj.connection.asBoolean;
    edtInvestition.Checked := Assigned(RegulatoryAssetBaseObj.investition) and RegulatoryAssetBaseObj.investition.asBoolean;
    toggleInvestitionAndConnection(nil);
    edtInvestitionProgramName.Text := RegulatoryAssetBaseObj.investitionProgramName;
    SetIntForTEdit(edtInvestitionProgramYear, RegulatoryAssetBaseObj.investitionProgramYear);
    edtInvestitionProgramCipher.Text := RegulatoryAssetBaseObj.investitionProgramCipher;
    edtConnectionNumber.Text := RegulatoryAssetBaseObj.connectionNumber;
    SetDateFieldForDateTimePicker(edtConnectionDate, RegulatoryAssetBaseObj.connectionDate);
    edtConnectionContragent.Text := RegulatoryAssetBaseObj.connectionContragent;
    if RegulatoryAssetBaseObj.categoryCode <> Low(Integer) then
      edtCategoryCode.ItemIndex := RegulatoryAssetBaseObj.categoryCode - 1;
  end;
  SetFundingSource;
end;

procedure TfrmRegulatoryAssetBaseEdit.refreshCalculations;
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  filter : RegulatoryAssetBaseCalculationFilter;
  list : RegulatoryAssetBaseCalculationShortList;
  item : RegulatoryAssetBaseCalculationShort;
  i : Integer;
begin
  sgRegulatoryAssetBaseCalculation.Clear;
  SetGridHeaders(RegulatoryAssetBaseCalculationHeaders, sgRegulatoryAssetBaseCalculation.ColumnHeaders);
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetbaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  filter := RegulatoryAssetBaseCalculationFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.assetRef := RegulatoryAssetBaseRef.Create;
  filter.assetRef.code := RegulatoryAssetBaseObj.code;
  filter.orderBySQL := 'period DESC';
  list := TempRegulatoryAssetBaseCalculation.getScrollableFilteredList(filter, 0, -1);
  if (list.totalCount > 0) then begin
    sgRegulatoryAssetBaseCalculation.RowCount := 1 + list.totalCount;
  end else sgRegulatoryAssetBaseCalculation.RowCount := 2;
  i := 0;
  for item in list.list do begin
    with sgRegulatoryAssetBaseCalculation do begin
      if item.code <> Low(Integer) then
        Cells[0, 1 + i] := IntToStr(item.code)
      else
        Cells[0, 1 + i] := '';
      if item.period <> nil then
        Cells[1, 1 + i] := FormatDateTime('mm.yyyy', item.period.asDate)
      else
        Cells[1, 1 + i] := '';
      if item.originalValue = nil then
        Cells[2, 1 + i] := ''
      else
        Cells[2, 1 + i] := SeparateThousands(item.originalValue.DecimalString);
      if item.depreciation = nil then
        Cells[3, 1 + i] := ''
      else
        Cells[3, 1 + i] := SeparateThousands(item.depreciation.DecimalString);
      if item.writtenOffValue = nil then
        Cells[4, 1 + i] := ''
      else
        Cells[4, 1 + i] := SeparateThousands(item.writtenOffValue.DecimalString);
      if item.residualValue = nil then
        Cells[5, 1 + i] := ''
      else
        Cells[5, 1 + i] := SeparateThousands(item.residualValue.DecimalString);
      if item.usefulLife <> Low(Integer) then
        Cells[6, 1 + i] := IntToStr(item.usefulLife)
      else
        Cells[6, 1 + i] := '';
      Alignments[2, 1 + i] := taRightJustify;
      Alignments[3, 1 + i] := taRightJustify;
      Alignments[4, 1 + i] := taRightJustify;
      Alignments[5, 1 + i] := taRightJustify;
      Alignments[6, 1 + i] := taRightJustify;
    end;
    i := i + 1;
  end;
end;
procedure TfrmRegulatoryAssetBaseEdit.refreshOutOfUse;
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  filter : RegulatoryAssetBaseOutOfUseFilter;
  list : RegulatoryAssetBaseOutOfUseShortList;
  item : RegulatoryAssetBaseOutOfUseShort;
  i : Integer;
begin
  sgRegulatoryAssetBaseOutOfUse.Clear;
  SetGridHeaders(RegulatoryAssetBaseOutOfUseHeaders, sgRegulatoryAssetBaseOutOfUse.ColumnHeaders);
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetbaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  filter := RegulatoryAssetBaseOutOfUseFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.assetRef := RegulatoryAssetBaseRef.Create;
  filter.assetRef.code := RegulatoryAssetBaseObj.code;
  filter.orderBySQL := 'dateStart DESC';
  list := TempRegulatoryAssetBaseCalculation.getListOfOutOfUse(filter, 0, -1);
  if (list.totalCount > 0) then begin
    sgRegulatoryAssetBaseOutOfUse.RowCount := 1 + list.totalCount;
  end else sgRegulatoryAssetBaseOutOfUse.RowCount := 2;
  i := 0;
  for item in list.list do begin
    with sgRegulatoryAssetBaseOutOfUse do begin
      if item.code <> Low(Integer) then
        Cells[0, 1 + i] := IntToStr(item.code)
      else
        Cells[0, 1 + i] := '';
      if item.dateStart <> nil then
        Cells[1, 1 + i] := XSDate2String(item.dateStart)
      else
        Cells[1, 1 + i] := '';
      if item.dateFinish <> nil then
        Cells[2, 1 + i] := XSDate2String(item.dateFinish)
      else
        Cells[2, 1 + i] := '';
    end;
    i := i + 1;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.refreshPartialWriteOff;
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  filter : RegulatoryAssetBasePartialWriteOffFilter;
  list : RegulatoryAssetBasePartialWriteOffShortList;
  item : RegulatoryAssetBasePartialWriteOffShort;
  i : Integer;
begin
  sgRegulatoryAssetBasePartialWriteOff.Clear;
  SetGridHeaders(RegulatoryAssetBasePartialWriteOffHeaders, sgRegulatoryAssetBasePartialWriteOff.ColumnHeaders);
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetbaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  filter := RegulatoryAssetBasePartialWriteOffFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.assetRef := RegulatoryAssetBaseRef.Create;
  filter.assetRef.code := RegulatoryAssetBaseObj.code;
  filter.orderBySQL := 'writeoffdate DESC';
  list := TempRegulatoryAssetBaseCalculation.getListOfPartialWriteOff(filter, 0, -1);
  if (list.totalCount > 0) then begin
    sgRegulatoryAssetBasePartialWriteOff.RowCount := 1 + list.totalCount;
  end else sgRegulatoryAssetBasePartialWriteOff.RowCount := 2;
  i := 0;
  for item in list.list do begin
    with sgRegulatoryAssetBasePartialWriteOff do begin
      if item.code <> Low(Integer) then
        Cells[0, 1 + i] := IntToStr(item.code)
      else
        Cells[0, 1 + i] := '';
      if item.writeOffDate <> nil then
        Cells[1, 1 + i] := XSDate2String(item.writeOffDate)
      else
        Cells[1, 1 + i] := '';
      if item.value <> nil then
        Cells[2, 1 + i] := SeparateThousands(item.value.DecimalString)
      else
        Cells[2, 1 + i] := '';
        if item.percentage <> nil then
        Cells[3, 1 + i] := item.percentage.DecimalString
      else
        Cells[3, 1 + i] := '';
      Alignments[2, 1 + i] := taRightJustify;
      Alignments[3, 1 + i] := taRightJustify;
    end;
    i := i + 1;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.pgMainChange(Sender: TObject);
begin
  inherited;
  if pgMain.ActivePage = tsOutOfUse then begin
    refreshOutOfUse;
  end else if pgMain.ActivePage = tsPartialWriteOff then begin
    refreshPartialWriteOff;
  end else if pgMain.ActivePage = tsCalculation then begin
    refreshCalculations;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.spbChooseFundingSourceClick(
  Sender: TObject);
  var fundingSource : RegulatoryAssetBaseFundingSourceShort;
begin
  inherited;
  fundingSource := TfrmRegulatoryAssetBAseFundingSourceShow.chooseFromList;
  if Assigned(fundingSource) then begin
    if Assigned(RegulatoryAssetBaseObj) then
      RegulatoryAssetBaseObj.fundingSourceRef := RegulatoryAssetBaseFundingSourceRef.Create;
      RegulatoryAssetBaseObj.fundingSourceRef.code := fundingSource.code;
  end;
  Self.SetFundingSource;
end;

procedure TfrmRegulatoryAssetBaseEdit.spbChooseGroupClick(Sender: TObject);
var group : RegulatoryAssetBaseGroupShort;
TempRegulatoryAssetBaseGroup : RegulatoryAssetBaseCalculationControllerSoapPort;
filter : RegulatoryAssetBaseGroupFilter;
preSelected : RegulatoryAssetBaseGroupShortList;
begin
  inherited;
  preSelected := nil;
  if (Assigned(RegulatoryAssetBaseObj.groupRef)) and (RegulatoryAssetBaseObj.groupRef.code <> Low(Integer)) then begin
    TempRegulatoryAssetBaseGroup := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
    filter := RegulatoryAssetBaseGroupFilter.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);
    filter.code := RegulatoryAssetBaseObj.groupRef.code;
    preSelected := TempRegulatoryAssetBaseGroup.getScrollableFilteredListOfGroups(filter, 0, 1);
  end;
  group := TfrmRegulatoryAssetBaseGroupShow.chooseFromList;
  if Assigned(group) then begin
    if not Assigned(RegulatoryAssetBaseObj.groupRef) then
      RegulatoryAssetBaseObj.groupRef := RegulatoryAssetBaseGroupRef.Create;
    RegulatoryAssetBaseObj.groupRef.code := group.code;
    edtGroupName.Text := group.number + ' ' + group.name;
    if Length(edtUsefulLife.Text) = 0 then begin
      edtUsefulLife.Text := IntToStr(group.usefulLife);
    end;

  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.spbClearFundingSourceClick(
  Sender: TObject);
begin
  inherited;
  if Assigned(RegulatoryAssetBaseObj) and Assigned(RegulatoryAssetBaseObj.fundingSourceRef) then begin
    RegulatoryAssetBaseObj.fundingSourceRef.code := Low(Integer);
  end;
  SetFundingSource;
end;

procedure TfrmRegulatoryAssetBaseEdit.spbClearGroupClick(Sender: TObject);
begin
  inherited;
  if (Assigned(RegulatoryAssetBaseObj)) and (Assigned(RegulatoryAssetBaseObj.groupRef)) then begin
    RegulatoryAssetBaseObj.groupRef := nil;
    edtGroupName.Text := '';
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.actAddOutOfUseExecute(Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  inherited;
  frmRegulatoryAssetBaseOutOfUseEdit := TfrmRegulatoryAssetBaseOutOfUseEdit.Create(Application, dsInsert);
  RegulatoryAssetBaseOutOfUseObj := RegulatoryAssetBaseOutOfUse.Create;
  SetNullXSProps(RegulatoryAssetBaseOutOfUseObj);
  SetNullIntProps(RegulatoryAssetBaseOutOfUseObj);
  RegulatoryAssetBaseOutOfUseObj.assetRef := RegulatoryAssetBaseRef.Create;
  RegulatoryAssetBaseOutOfUseObj.assetRef.code := RegulatoryAssetBaseObj.code;
  try
    if frmRegulatoryAssetBaseOutOfUseEdit.ShowModal = mrOk then begin
      actRefreshOutOfUseExecute(Sender);
    end;
  finally
    frmRegulatoryAssetBaseOutOfUseEdit.Free;
    frmRegulatoryAssetBaseOutOfUseEdit := nil;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.actAddPartialWriteOffExecute(
  Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  inherited;
  frmRegulatoryAssetBasePartialWriteOffEdit := TfrmRegulatoryAssetBasePartialWriteOffEdit.Create(Application, dsInsert);
  RegulatoryAssetBasePartialWriteOffObj := RegulatoryAssetBasePartialWriteOff.Create;
  SetNullXSProps(RegulatoryAssetBasePartialWriteOffObj);
  SetNullIntProps(RegulatoryAssetBasePartialWriteOffObj);
  RegulatoryAssetBasePartialWriteOffObj.assetRef := RegulatoryAssetBaseRef.Create;
  RegulatoryAssetBasePartialWriteOffObj.assetRef.code := RegulatoryAssetBaseObj.code;
  try
    if frmRegulatoryAssetBasePartialWriteOffEdit.ShowModal = mrOk then begin
      actRefreshPartialWriteOffExecute(Sender);
    end;
  finally
    frmRegulatoryAssetBasePartialWriteOffEdit.Free;
    frmRegulatoryAssetBasePartialWriteOffEdit := nil;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.actEditOutOfUseExecute(Sender: TObject);
begin
  inherited;
  Self.openOutOfUse(dsEdit);
end;

procedure TfrmRegulatoryAssetBaseEdit.actEditPartialWriteOffExecute(
  Sender: TObject);
begin
  inherited;
  Self.openPartialWriteOff(dsEdit);
end;

procedure TfrmRegulatoryAssetBaseEdit.actRefreshOutOfUseExecute(
  Sender: TObject);
begin
  inherited;
  refreshOutOfUse;
end;

procedure TfrmRegulatoryAssetBaseEdit.actRefreshPartialWriteOffExecute(
  Sender: TObject);
begin
  inherited;
  refreshPartialWriteOff;
end;

procedure TfrmRegulatoryAssetBaseEdit.actRemoveOutOfUseExecute(Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
  code : Integer;
begin
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  try
    code := StrToInt(sgRegulatoryAssetBaseOutOfUse.Cells[0, sgRegulatoryAssetBaseOutOfUse.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
      TempRegulatoryAssetBaseCalculation.removeOutOfUse(code);
      actRefreshOutOfUseExecute(Sender);
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.actRemovePartialWriteOffExecute(
  Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
  code : Integer;
begin
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  try
    code := StrToInt(sgRegulatoryAssetBasePartialWriteOff.Cells[0, sgRegulatoryAssetBasePartialWriteOff.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
      TempRegulatoryAssetBaseCalculation.removePartialWriteOff(code);
      actRefreshPartialWriteOffExecute(Sender);
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.actViewOutOfUseExecute(Sender: TObject);
begin
  Self.openOutOfUse(dsView);
end;

procedure TfrmRegulatoryAssetBaseEdit.openPartialWriteOff(DialogState: TDialogState);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  try
    RegulatoryAssetBasePartialWriteOffObj := TempRegulatoryAssetBaseCalculation.getPartialWriteOff(StrToInt(sgRegulatoryAssetBasePartialWriteOff.Cells[0, sgRegulatoryAssetBasePartialWriteOff.Row]));
  except
    on EConvertError do Exit;
  end;
  frmRegulatoryAssetBasePartialWriteOffEdit := TfrmRegulatoryAssetBasePartialWriteOffEdit.Create(Application, DialogState);
  try
    if (frmRegulatoryAssetBasePartialWriteOffEdit.ShowModal = mrOk) and (DialogState = dsEdit) then begin
      actRefreshPartialWriteOffExecute(nil);
    end;
  finally
    frmRegulatoryAssetBasePartialWriteOffEdit.Free;
    frmRegulatoryAssetBasePartialWriteOffEdit := nil;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.openOutOfUse(DialogState: TDialogState);
var
  TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  try
    RegulatoryAssetBaseOutOfUseObj := TempRegulatoryAssetBaseCalculation.getOutOfUse(StrToInt(sgRegulatoryAssetBaseOutOfUse.Cells[0, sgRegulatoryAssetBaseOutOfUse.Row]));
  except
    on EConvertError do Exit;
  end;
  frmRegulatoryAssetBaseOutOfUseEdit := TfrmRegulatoryAssetBaseOutOfUseEdit.Create(Application, DialogState);
  try
    if (frmRegulatoryAssetBaseOutOfUseEdit.ShowModal = mrOk) and (DialogState = dsEdit) then begin
      actRefreshOutOfUseExecute(nil);
    end;
  finally
    frmRegulatoryAssetBaseOutOfUseEdit.Free;
    frmRegulatoryAssetBaseOutOfUseEdit := nil;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.actViewPartialWriteOffExecute(
  Sender: TObject);
begin
  Self.openPartialWriteOff(dsView);
end;

procedure TfrmRegulatoryAssetBaseEdit.chkWriteOffClick(Sender: TObject);
begin
  inherited;
  HideControls([grpWriteOff], not chkWriteOff.Checked);
end;

procedure TfrmRegulatoryAssetBaseEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRegulatoryAssetBase: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtInventoryNumber
      ,edtName
      ,edtOriginalValue
      ,edtUsefulLife
      , edtIncomeDate
      , edtGroupName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempRegulatoryAssetBase := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;

    RegulatoryAssetBaseObj.inventoryNumber := edtInventoryNumber.Text; 
    RegulatoryAssetBaseObj.name := edtName.Text; 
    RegulatoryAssetBaseObj.incomeDate := GetTXSDateFromTDateTimePicker(edtIncomeDate);
    RegulatoryAssetBaseObj.documentNumber := edtDocumentNumber.Text;
    RegulatoryAssetBaseObj.originalValue := GetTXSDecimalFromTEdit(edtOriginalValue);
    RegulatoryAssetBaseObj.usefulLife := GetIntFromTEdit(edtUsefulLife);
	  if(RegulatoryAssetBaseObj.initial = nil) then RegulatoryAssetBaseObj.initial := TXSBoolean.Create;
    RegulatoryAssetBaseObj.initial.asBoolean := edtInitial.ItemIndex = 0;
    if chkWriteOff.Checked then begin
          RegulatoryAssetBaseObj.writeOffNumber := edtWriteOffNumber.Text;
          edtWriteOffDate.Checked := True;
          RegulatoryAssetBaseObj.writeOffDate := GetTXSDateFromTDateTimePicker(edtWriteOffDate);
    end else begin
          RegulatoryAssetBaseObj.writeOffNumber := '';
          RegulatoryAssetBaseObj.writeOffDate := nil;
    end;
    RegulatoryAssetBaseObj.categoryCode := Low(Integer);
    if edtCategoryCode.ItemIndex > -1 then RegulatoryAssetBaseObj.categoryCode := edtCategoryCode.ItemIndex + 1;


    RegulatoryAssetBaseObj.investition := GetTXSBooleanFromTCheckBox(edtInvestition);
    RegulatoryAssetBaseObj.connection := GetTXSBooleanFromTCheckBox(edtConnection);

    RegulatoryAssetBaseObj.investitionProgramName := '';
    RegulatoryAssetBaseObj.investitionProgramYear := Low(Integer);
    RegulatoryAssetBAseObj.investitionProgramCipher := '';
    if RegulatoryAssetBaseObj.investition.asBoolean then begin
      RegulatoryAssetBaseObj.investitionProgramName := edtInvestitionProgramName.Text;
      RegulatoryAssetBaseObj.investitionProgramYear := GetIntFromTEdit(edtInvestitionProgramYear);
      RegulatoryAssetBaseObj.investitionProgramCipher := edtInvestitionProgramCipher.Text;
    end;

    RegulatoryAssetBaseObj.connectionNumber := '';
    RegulatoryAssetBaseObj.connectionDate := nil;
    RegulatoryAssetBAseObj.connectionContragent := '';
    if RegulatoryAssetBaseObj.connection.asBoolean then begin
      RegulatoryAssetBaseObj.connectionNumber := edtConnectionNumber.Text;
      RegulatoryAssetBaseObj.connectionDate := GetTXSDateFromTDateTimePicker(edtConnectionDate);
      RegulatoryAssetBAseObj.connectionContragent := edtConnectionContragent.Text;
    end;

    if DialogState = dsInsert then begin
      RegulatoryAssetBaseObj.code := Low(Integer);
      TempRegulatoryAssetBase.addAsset(RegulatoryAssetBaseObj);
    end else if DialogState = dsEdit then begin
      TempRegulatoryAssetBase.saveAsset(RegulatoryAssetBaseObj);
    end;
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.SetFundingSource;
var TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
fundingSource : RegulatoryAssetBaseFundingSource;
begin
  if Assigned(RegulatoryAssetBaseObj) and Assigned(RegulatoryAssetBaseObj.fundingSourceRef)
    and (RegulatoryAssetBaseObj.fundingSourceRef.code <> Low(Integer)) then begin
    TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
    fundingSource := TempRegulatoryAssetBaseCalculation.getFundingSource(RegulatoryAssetBaseObj.fundingSourceRef.code);
    if(Assigned(fundingSource)) then edtFundingSourceName.Text := fundingSource.name;
  end else begin
    edtFundingSourceName.Text := '';
  end;
end;

procedure TfrmRegulatoryAssetBaseEdit.toggleInvestitionAndConnection(Sender : TObject);
begin
  if(Sender = edtConnection) and (edtConnection.Checked) then begin
    edtInvestition.Checked := False;
  end;
  if(Sender = edtInvestition) and (edtInvestition.Checked) then begin
    edtConnection.Checked := False;
  end;
  tsInvestitionProgram.TabVisible := edtInvestition.Checked;
  tsConnection.TabVisible := edtConnection.Checked;
end;


end.