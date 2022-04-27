
unit EditRegulatoryAssetBaseCalculationFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RegulatoryAssetBaseCalculationController ;

type
  TfrmRegulatoryAssetBaseCalculationFilterEdit = class(TDialogForm)



  HTTPRIORegulatoryAssetBaseCalculation: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    tsPeriod: TTabSheet;
    tsInvestitionProgram: TTabSheet;
    tsConnection: TTabSheet;
    edtInvNumber: TEdit;
    edtCategoryCode: TComboBox;
    edtWriteOffNumber: TEdit;
    edtGroupsNumbers: TMemo;
    edtInitial: TComboBox;
    edtWriteOffDateTo: TDateTimePicker;
    edtWriteOffDateFrom: TDateTimePicker;
    edtOriginalValueTo: TEdit;
    edtOriginalValueFrom: TEdit;
    edtUsefulLifeTo: TEdit;
    edtUsefulLifeFrom: TEdit;
    edtIncomeDateTo: TDateTimePicker;
    edtIncomeDateFrom: TDateTimePicker;
    edtName: TEdit;
    lblCategoryCode: TLabel;
    lblWriteOffNumber: TLabel;
    lblInitial: TLabel;
    lblWriteOffDateTo: TLabel;
    lblWriteOffDateFrom: TLabel;
    spbChooseGroup: TSpeedButton;
    spbClearGroup: TSpeedButton;
    lblGroups: TLabel;
    lblOriginalValueTo: TLabel;
    lblOriginalValueFrom: TLabel;
    lblUsefulLifeTo: TLabel;
    lblUsefulLife: TLabel;
    lblIncomeDateTo: TLabel;
    lblIncomeDate: TLabel;
    lblInvNumber: TLabel;
    lblName: TLabel;
    edtPeriodUsefulLifeTo: TEdit;
    edtPeriodResidualValueTo: TEdit;
    edtPeriodWrittenOffValueTo: TEdit;
    lblPeriodUsefulLifeTo: TLabel;
    lblPeriodResidualValueTo: TLabel;
    lblPeriodWrittenOffValueTo: TLabel;
    lblPeriodOriginalValueTo: TLabel;
    lblPeriodDepreciationTo: TLabel;
    edtPeriodDepreciationFrom: TEdit;
    edtPeriodWrittenOffValueFrom: TEdit;
    edtPeriodResidualValueFrom: TEdit;
    edtPeriodUsefulLifeFrom: TEdit;
    lblPeriodUsefulLifeFrom: TLabel;
    lblPeriodResidualValueFrom: TLabel;
    lblPeriodWrittenOffValueFrom: TLabel;
    lblPeriodDepreciationFrom: TLabel;
    lblPeriodOriginalValueFrom: TLabel;
    edtPeriodOriginalValueFrom: TEdit;
    edtPeriodOriginalValueTo: TEdit;
    edtPeriodDepreciationTo: TEdit;
    edtInvestition: TCheckBox;
    edtInvestitionProgramName: TEdit;
    lblInvestitionProgramName: TLabel;
    edtInvestitionProgramYearFrom: TEdit;
    lblInvestitionProgramYear: TLabel;
    Label1: TLabel;
    edtInvestitionProgramCipher: TEdit;
    lblConnectionDate: TLabel;
    lblConnectionContragent: TLabel;
    edtConnectionContragent: TEdit;
    edtConnectionNumber: TEdit;
    lblConnectionNumber: TLabel;
    edtConnection: TCheckBox;
    lblInvestitionProgramYearTo: TLabel;
    edtInvestitionProgramYearTo: TEdit;
    lblConnectionDateTo: TLabel;
    edtConnectionDateFrom: TDateTimePicker;
    edtConnectionDateTo: TDateTimePicker;
    lblFundingSource: TLabel;
    edtFundingSourceName: TEdit;
    spbChooseFundingSource: TSpeedButton;
    spbClearFundingSource: TSpeedButton;
    edtDocumentNumber: TEdit;
    lblDocumentNumber: TLabel;
    edtCodeTo: TEdit;
    lblCodeTo: TLabel;
    edtCodeFrom: TEdit;
    lblCodeFrom: TLabel;
    tsPartialWriteOff: TTabSheet;
    lblPartialWriteOffDateTo: TLabel;
    lblPartialWriteOffNumber: TLabel;
    edtPartialWriteOffNumber: TEdit;
    edtPartialWriteOffDateTo: TDateTimePicker;
    edtPartialWriteOffDateFrom: TDateTimePicker;
    lblPartialWriteOffDateFrom: TLabel;
    edtPartialWriteOffPercentageTo: TEdit;
    lblPartialWriteOffPercentageTo: TLabel;
    edtPartialWriteOffPercentageFrom: TEdit;
    lblPartialWriteOffPercentageFrom: TLabel;
    edtPartialWriteOffValueTo: TEdit;
    lblPartialWriteOffValueTo: TLabel;
    edtPartialWriteOffValueFrom: TEdit;
    lblPartialWriteOffValueFrom: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbClearGroupClick(Sender: TObject);
  procedure spbChooseGroupClick(Sender: TObject);
    procedure spbClearFundingSourceClick(Sender: TObject);
    procedure spbChooseFundingSourceClick(Sender: TObject);
  private
    filter : RegulatoryAssetBaseCalculationFilter;
    groupsList : RegulatoryAssetBaseGroupShortList;
    fundingSourceCode : Integer;
    procedure SetGroupsNumbers;
    procedure SetFundingSource;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent;
                       DialogState: TDialogState;
                       AFilter: RegulatoryAssetBaseCalculationFilter); reintroduce; overload;
    function GetFilter : RegulatoryAssetBaseCalculationFilter;

    { Public declarations }

end;


implementation

uses ShowRegulatoryAssetBaseGroup, ShowRegulatoryAssetBaseFundingSource;
{uses  
    EnergyproController, EnergyproController2, RegulatoryAssetBaseCalculationController  ;
}
{$R *.dfm}

constructor TfrmRegulatoryAssetBaseCalculationFilterEdit.Create(AOwner: TComponent; DialogState: TDialogState;
                              AFilter: RegulatoryAssetBaseCalculationFilter);
begin
  inherited Create(AOwner, DialogState);
  Self.filter := AFilter;
  Self.groupsList := nil;
  fundingSourceCode := Low(Integer);
end;


procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.FormShow(Sender: TObject);
begin
  SetFloatStyle([edtOriginalValueFrom, edtOriginalValueTo, edtPeriodOriginalValueFrom, edtPeriodOriginalValueTo
    , edtPeriodDepreciationFrom, edtPeriodDepreciationTo, edtPeriodResidualValueFrom, edtPeriodResidualValueTo
    , edtPartialWriteOffValueFrom, edtPartialWriteOffValueTo, edtPartialWriteOffPercentageFrom, edtPartialWriteOffPercentageTo]);
  SetIntStyle([edtUsefulLifeFrom, edtUsefulLifeTo, edtInvestitionProgramYearFrom, edtInvestitionProgramYearTo
    , edtCodeFrom, edtCodeTo]);
  if Assigned(filter) then begin
    if Assigned(filter.assetFilter) then begin
      if Assigned(filter.assetFilter.groupsList) then begin
        groupsList := RegulatoryAssetBaseGroupShortList.Create;
        groupsList.totalCount := Length(filter.assetFilter.groupsList);
        groupsList.list := filter.assetFilter.groupsList;
      end;
      edtInvNumber.Text := filter.assetFilter.inventoryNumber;
      edtName.Text := filter.assetFilter.name;
      SetDateFieldForDateTimePicker(edtIncomeDateTo, filter.assetFilter.incomeDateTo);
      SetDateFieldForDateTimePicker(edtIncomeDateFrom, filter.assetFilter.incomeDateFrom);
      edtDocumentNumber.Text := filter.assetFilter.documentNumber;
      SetTXSDecimalForTEdit(edtOriginalValueFrom, filter.assetFilter.originalValueFrom);
      SetTXSDecimalForTEdit(edtOriginalValueTo, filter.assetFilter.originalValueTo);
      SetIntForTEdit(edtUsefulLifeFrom, filter.assetFilter.usefulLifeFrom);
      SetIntForTEdit(edtUsefulLifeTo, filter.assetFilter.usefulLifeTo);
      edtWriteOffNumber.Text := filter.assetFilter.writeOffNumber;
      SetDateFieldForDateTimePicker(edtWriteOffDateFrom, filter.assetFilter.writeOffDateFrom);
      SetDateFieldForDateTimePicker(edtWriteOffDateTo, filter.assetFilter.writeOffDateTo);
      if Assigned(filter.assetFilter.initial) then begin
        if filter.assetFilter.initial.asBoolean then edtInitial.ItemIndex := 1 else edtInitial.ItemIndex := 2;
      end;
      if filter.assetFilter.categoryCode <> Low(Integer) then edtCategoryCode.ItemIndex := filter.assetFilter.categoryCode;
      if Assigned(filter.assetFilter.investition) then edtInvestition.Checked := filter.assetFilter.investition.asBoolean;
      edtInvestitionProgramName.Text := filter.assetFilter.investitionProgramName;
      edtInvestitionProgramCipher.Text := filter.assetFilter.investitionProgramCipher;
      SetIntForTEdit(edtInvestitionProgramYearFrom, filter.assetFilter.investitionProgramYearFrom);
      SetIntForTEdit(edtInvestitionProgramYearTo, filter.assetFilter.investitionProgramYearTo);
      if Assigned(filter.assetFilter.connection) then edtConnection.Checked := filter.assetFilter.connection.asBoolean;
      edtConnectionNumber.Text := filter.assetFilter.connectionNumber;
      SetDateFieldForDateTimePicker(edtConnectionDateFrom, filter.assetFilter.connectionDateFrom);
      SetDateFieldForDateTimePicker(edtConnectionDateTo, filter.assetFilter.connectionDateTo);
      edtConnectionContragent.Text := filter.assetFilter.connectionContragent;
      if Assigned(filter.assetFilter.fundingSourceRef)
        and (filter.assetFilter.fundingSourceRef.code <> Low(Integer)) then begin
        Self.fundingSourceCode := filter.assetFilter.fundingSourceRef.code;
      end;
      SetFundingSource;
      SetIntForTEdit(edtCodeFrom, filter.assetFilter.codeFrom);
      SetIntForTEdit(edtCodeTo, filter.assetFilter.codeTo);
    end;
    if Assigned(filter.partialWriteOffFilter) then begin
      edtPartialWriteOffNumber.Text := filter.partialWriteOffFilter.writeOffNumber;
      SetDateFieldForDateTimePicker(edtPartialWriteOffDateFrom, filter.partialWriteOffFilter.writeOffDateFrom);
      SetDateFieldForDateTimePicker(edtPartialWriteOffDateTo, filter.partialWriteOffFilter.writeOffDateTo);
      SetTXSDecimalForTEdit(edtPartialWriteOffValueFrom, filter.partialWriteOffFilter.valueFrom);
      SetTXSDecimalForTEdit(edtPartialWriteOffValueTo, filter.partialWriteOffFilter.valueTo);
      SetTXSDecimalForTEdit(edtPartialWriteOffPercentageFrom, filter.partialWriteOffFilter.percentageFrom);
      SetTXSDecimalForTEdit(edtPartialWriteOffPercentageTo, filter.partialWriteOffFilter.percentageTo);
    end;
    SetIntForTEdit(edtPeriodUsefulLifeFrom, filter.usefulLifeFrom);
    SetIntForTEdit(edtPeriodUsefulLifeTo, filter.usefulLifeTo);
    SetTXSDecimalForTEdit(edtPeriodOriginalValueFrom, filter.originalValueFrom);
    SetTXSDecimalForTEdit(edtPeriodOriginalValueTo, filter.originalValueTo);
    SetTXSDecimalForTEdit(edtPeriodDepreciationFrom, filter.depreciationFrom);
    SetTXSDecimalForTEdit(edtPeriodDepreciationTo, filter.depreciationTo);
    SetTXSDecimalForTEdit(edtPeriodResidualValueFrom, filter.residualValueFrom);
    SetTXSDecimalForTEdit(edtPeriodResidualValueTo, filter.residualValueTo);
  end;
  DisableControls([edtGroupsNumbers, edtFundingSourceName]);
  SetGroupsNumbers;
end;

procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  if (ModalResult = mrOk)  then
  begin
    if not Assigned(filter) then
      filter := RegulatoryAssetBaseCalculationFilter.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);
    if Assigned(filter.assetFilter) then begin
      filter.assetFilter := RegulatoryAssetBaseFilter.Create;
      SetNullXSProps(filter.assetFilter);
      SetNullIntProps(filter.assetFilter);
    end;
    if Assigned(filter.partialWriteOffFilter) then begin
      filter.partialWriteOffFilter := RegulatoryAssetBasePartialWriteOffFilter.Create;
      SetNullXSProps(filter.partialWriteOffFilter);
      SetNullIntProps(filter.partialWriteOffFilter);
    end;
    if (Length(Trim(edtInvNumber.Text)) > 0)
      or (Length(Trim(edtName.Text)) > 0)
      or (Length(Trim(edtWriteOffNumber.Text)) > 0)
      or edtIncomeDateFrom.Checked or edtIncomeDateTo.Checked
      or (Length(Trim(edtDocumentNumber.Text)) > 0)
      or edtWriteOffDateFrom.Checked or edtWriteOffDateTo.Checked
      or (Length(Trim(edtOriginalValueFrom.Text)) > 0) or (Length(Trim(edtOriginalValueTo.Text)) > 0)
      or (Length(Trim(edtUsefulLifeFrom.Text)) > 0) or (Length(Trim(edtUsefulLifeTo.Text)) > 0)
      or (edtInitial.ItemIndex > 0)
      or (edtCategoryCode.ItemIndex > 0)
      or (Assigned(Self.groupsList) and (Self.groupsList.totalCount > 0))
      or edtInvestition.Checked or edtConnection.Checked
      or (Length(Trim(edtInvestitionProgramName.Text)) > 0)
      or (Length(Trim(edtInvestitionProgramYearFrom.Text)) > 0)
      or (Length(Trim(edtInvestitionProgramYearTo.Text)) > 0)
      or (Length(Trim(edtInvestitionProgramCipher.Text)) > 0)
      or (Length(Trim(edtConnectionNumber.Text)) > 0)
      or (Length(Trim(edtConnectionContragent.Text)) > 0)
      or edtConnectionDateFrom.Checked or edtConnectionDateTo.Checked
      or (Self.fundingSourceCode <> Low(Integer))
      or (Length(Trim(edtCodeFrom.Text)) > 0) or (Length(Trim(edtCodeTo.Text)) > 0)
    then begin
      filter.assetFilter := RegulatoryAssetBaseFilter.Create;
      SetNullXSProps(filter.assetFilter);
      SetNullIntProps(filter.assetFilter);
      if Assigned(Self.groupsList) then filter.assetFilter.groupsList := Self.groupsList.list;

      filter.assetFilter.inventoryNumber := edtInvNumber.Text;
      filter.assetFilter.name := edtName.Text;
      filter.assetFilter.incomeDateFrom := GetTXSDateFromTDateTimePicker(edtIncomeDateFrom);
      filter.assetFilter.incomeDateTo := GetTXSDateFromTDateTimePicker(edtIncomeDateTo);
      filter.assetFilter.documentNumber := edtDocumentNumber.Text;
      filter.assetFilter.originalValueFrom := GetTXSDecimalFromTEdit(edtOriginalValueFrom);
      filter.assetFilter.originalValueTo := GetTXSDecimalFromTEdit(edtOriginalValueTo);
      filter.assetFilter.usefulLifeFrom := GetIntFromTEdit(edtUsefulLifeFrom);
      filter.assetFilter.usefulLifeTo := GetIntFromTEdit(edtUsefulLifeTo);
      filter.assetFilter.writeOffNumber := edtWriteOffNumber.Text;
      filter.assetFilter.writeOffDateFrom := GetTXSDateFromTDateTimePicker(edtWriteOffDateFrom);
      filter.assetFilter.writeOffDateTo := GetTXSDateFromTDateTimePicker(edtWriteOffDateTo);
      if edtInitial.ItemIndex > 0 then begin
        filter.assetFilter.initial := TXSBoolean.Create;
        filter.assetFilter.initial.asBoolean := edtInitial.ItemIndex = 1;
      end;
      if (edtCategoryCode.ItemIndex > 0) then
        filter.assetFilter.categoryCode := edtCategoryCode.ItemIndex
      else filter.assetFilter.categoryCode := Low(Integer);
      if edtInvestition.Checked then begin
        filter.assetFilter.investition := TXSBoolean.Create;
        filter.assetFilter.investition.asBoolean := True;
      end;
      filter.assetFilter.investitionProgramName := edtInvestitionProgramName.Text;
      filter.assetFilter.investitionProgramYearFrom := GetIntFromTEdit(edtInvestitionProgramYearFrom);
      filter.assetFilter.investitionProgramYearTo := GetIntFromTEdit(edtInvestitionProgramYearTo);
      filter.assetFilter.investitionProgramCipher := edtInvestitionProgramCipher.Text;
      if edtConnection.Checked then begin
        filter.assetFilter.connection := TXSBoolean.Create;
        filter.assetFilter.connection.asBoolean := True;
      end;
      filter.assetFilter.connectionNumber := edtConnectionNumber.Text;
      filter.assetFilter.connectionDateFrom := GetTXSDateFromTDateTimePicker(edtConnectionDateFrom);
      filter.assetFilter.connectionDateTo := GetTXSDateFromTDateTimePicker(edtConnectionDateTo);
      filter.assetFilter.connectionContragent := edtConnectionContragent.Text;
      if Self.fundingSourceCode <> Low(Integer) then begin
        filter.assetFilter.fundingSourceRef := RegulatoryAssetBaseFundingSourceRef.Create;
        filter.assetFilter.fundingSourceRef.code := Self.fundingSourceCode;
      end;
      filter.assetFilter.codeFrom := GetIntFromTEdit(edtCodeFrom);
      filter.assetFilter.codeTo := GetIntFromTEdit(edtCodeTo);
    end;
    if (Length(Trim(edtPartialWriteOffNumber.Text)) > 0)
        or (edtPartialWriteOffDateFrom.Checked) or (edtPartialWriteOffDateTo.Checked)
        or (Length(Trim(edtPartialWriteOffValueFrom.Text)) > 0) or (Length(Trim(edtPartialWriteOffValueTo.Text)) > 0)
        or (Length(Trim(edtPartialWriteOffPercentageFrom.Text)) > 0) or (Length(Trim(edtPartialWriteOffPercentageTo.Text)) > 0) then begin
      filter.partialWriteOffFilter := RegulatoryAssetBasePartialWriteOffFilter.Create;
      SetNullXSProps(filter.partialWriteOffFilter);
      SetNullIntProps(filter.partialWriteOffFilter);
      filter.partialWriteOffFilter.writeOffNumber := edtPartialWriteOffNumber.Text;
      filter.partialWriteOffFilter.writeOffDateFrom := GetTXSDateFromTDateTimePicker(edtPartialWriteOffDateFrom);
      filter.partialWriteOffFilter.writeOffDateTo := GetTXSDateFromTDateTimePicker(edtPartialWriteOffDateTo);
      filter.partialWriteOffFilter.valueFrom := GetTXSDecimalFromTEdit(edtPartialWriteOffValueFrom);
      filter.partialWriteOffFilter.valueTo := GetTXSDecimalFromTEdit(edtPartialWriteOffValueTo);
      filter.partialWriteOffFilter.percentageFrom := GetTXSDecimalFromTEdit(edtPartialWriteOffPercentageFrom);
      filter.partialWriteOffFilter.percentageTo := GetTXSDecimalFromTEdit(edtPartialWriteOffPercentageTo);
    end;
    filter.originalValueFrom := GetTXSDecimalFromTEdit(edtPeriodOriginalValueFrom);
    filter.originalValueTo := GetTXSDecimalFromTEdit(edtPeriodOriginalValueTo);
    filter.depreciationFrom := GetTXSDecimalFromTEdit(edtPeriodDepreciationFrom);
    filter.depreciationTo := GetTXSDecimalFromTEdit(edtPeriodDepreciationTo);
    filter.residualValueFrom := GetTXSDecimalFromTEdit(edtPeriodResidualValueFrom);
    filter.residualValueTo := GetTXSDecimalFromTEdit(edtPeriodResidualValueTo);
    filter.writtenOffValueFrom := GetTXSDecimalFromTEdit(edtPeriodWrittenOffValueFrom);
    filter.writtenOffValueTo := GetTXSDecimalFromTEdit(edtPeriodWrittenOffValueTo);
    filter.usefulLifeFrom := GetIntFromTEdit(edtPeriodUsefulLifeFrom);
    filter.usefulLifeTo := GetIntFromTEdit(edtPeriodUsefulLifeTo);
  end;
end;

function TfrmRegulatoryAssetBaseCalculationFilterEdit.GetFilter : RegulatoryAssetBaseCalculationFilter;
begin
  Result := Self.filter;
end;

procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.spbChooseFundingSourceClick(
  Sender: TObject);
  var fundingSource : RegulatoryAssetBaseFundingSourceShort;
begin
  inherited;
  fundingSource := TfrmRegulatoryAssetBAseFundingSourceShow.chooseFromList;
  if Assigned(fundingSource) then Self.fundingSourceCode := fundingSource.code;
  Self.SetFundingSource;
end;

procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.spbChooseGroupClick(
  Sender: TObject);
var
  assetGroups : RegulatoryAssetBaseGroupShortList;
  item : RegulatoryAssetBaseGroupShort;
begin
  inherited;
  assetGroups := TfrmRegulatoryAssetBaseGroupShow.chooseFromListMultiple(Self.groupsList);
  if Assigned(assetGroups) then begin
    Self.groupsList := assetGroups;
    setGroupsNumbers;
  end;
end;

procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.spbClearFundingSourceClick(
  Sender: TObject);
begin
  inherited;
  Self.fundingSourceCode := Low(Integer);
  Self.SetFundingSource;
end;

procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.spbClearGroupClick(
  Sender: TObject);
begin
  inherited;
  Self.groupsList := nil;
  setGroupsNumbers;
end;

procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.SetGroupsNumbers;
var item : RegulatoryAssetBaseGroupShort;
begin
  inherited;
  edtGroupsNumbers.Text := '';
  if Assigned(Self.groupsList) then begin
    for item in Self.groupsList.list do begin
      if Length(edtGroupsNumbers.Text) > 0 then begin
        edtGroupsNumbers.Text := edtGroupsNumbers.Text + ', '
      end;
      edtGroupsNumbers.Text := edtGroupsNumbers.Text + item.number;
    end;
  end;
end;

procedure TfrmRegulatoryAssetBaseCalculationFilterEdit.SetFundingSource;
var TempRegulatoryAssetBaseCalculation: RegulatoryAssetBaseCalculationControllerSoapPort;
fundingSource : RegulatoryAssetBaseFundingSource;
begin
  if Self.fundingSourceCode <> Low(Integer) then begin
    TempRegulatoryAssetBaseCalculation := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
    fundingSource := TempRegulatoryAssetBaseCalculation.getFundingSource(Self.fundingSourceCode);
    if(Assigned(fundingSource)) then edtFundingSourceName.Text := fundingSource.name;
  end else begin
    edtFundingSourceName.Text := '';
  end;
end;

end.