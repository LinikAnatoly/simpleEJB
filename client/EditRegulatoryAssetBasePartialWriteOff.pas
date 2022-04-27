unit EditRegulatoryAssetBasePartialWriteOff;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, RegulatoryAssetBaseCalculationController ;

type
  TfrmRegulatoryAssetBasePartialWriteOffEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblWriteOffDate : TLabel;
    edtWriteOffDate: TDateTimePicker;
    edtValue: TEdit;
    edtPercentage: TEdit;
    HTTPRIORegulatoryAssetBaseCalculation: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblWriteOffNumber: TLabel;
    edtWriteOffNumber: TEdit;
    rbValue: TRadioButton;
    rbPercentage: TRadioButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbValueClick(Sender: TObject);
    procedure rbPercentageClick(Sender: TObject);
    procedure edtWriteOffDateChange(Sender: TObject);
    procedure edtValueOrPercentChange(Sender : TObject);

  private
    calc : RegulatoryAssetBaseCalculationShort;
    asset : RegulatoryAssetBase;
    procedure toggleValueOrPercent;
    procedure refreshCalc;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegulatoryAssetBasePartialWriteOffEdit: TfrmRegulatoryAssetBasePartialWriteOffEdit;
  RegulatoryAssetBasePartialWriteOffObj: RegulatoryAssetBasePartialWriteOff;

implementation

uses Math;


{$R *.dfm}

procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.toggleValueOrPercent;
begin
  DisableControls([edtValue], not rbValue.Checked);
  DisableControls([edtPercentage], rbValue.Checked);
  if rbValue.Checked then begin
    DenyBlankValues([edtValue]);
    edtValue.SetFocus;
  end else begin
    DenyBlankValues([edtPercentage]);
    edtPercentage.SetFocus;
  end;

end;

procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.FormShow(Sender: TObject);
var
  TempRegulatoryAssetBasePartialWriteOff: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  DisableControls([edtCode]);
  SetFloatStyle([edtValue, edtPercentage]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtWriteOffDate
      ,edtValue
      ,edtPercentage
    ]);
    rbValue.Checked := true;
    toggleValueOrPercent;
  end;

  TempRegulatoryAssetBasePartialWriteOff := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  asset := TempRegulatoryAssetBasePartialWriteOff.getAsset(RegulatoryAssetBasePartialWriteOffObj.assetRef.code);

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RegulatoryAssetBasePartialWriteOffObj.code);
    edtWriteOffNumber.Text := RegulatoryAssetBasePartialWriteOffObj.writeOffNumber;
    SetDateFieldForDateTimePicker(edtWriteOffDate, RegulatoryAssetBasePartialWriteOffObj.writeOffDate);
    edtValue.OnChange := nil;
    edtPercentage.OnChange := nil;
    SetTXSDecimalForTEdit(edtValue, RegulatoryAssetBasePartialWriteOffObj.value);
    SetTXSDecimalForTEdit(edtPercentage, RegulatoryAssetBasePartialWriteOffObj.percentage);
    edtValue.OnChange := edtValueOrPercentChange;
    edtPercentage.OnChange := edtValueOrPercentChange;

  end;
  refreshCalc;
  if Assigned(calc) then begin
    if DialogState = dsInsert then begin
      edtValue.Text := calc.originalValue.DecimalString;
      edtPercentage.Text := '100';
    end;
  end;
end;



procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.rbPercentageClick(
  Sender: TObject);
begin
  inherited;
  toggleValueOrPercent;
end;

procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.rbValueClick(
  Sender: TObject);
begin
  inherited;
  toggleValueOrPercent;
end;

procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRegulatoryAssetBasePartialWriteOff: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtValue
      ,edtPercentage
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else begin
    TempRegulatoryAssetBasePartialWriteOff := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;

    RegulatoryAssetBasePartialWriteOffObj.writeOffNumber := edtWriteOffNumber.Text;
    edtWriteOffDate.Checked := True;
    RegulatoryAssetBasePartialWriteOffObj.writeOffDate := GetTXSDateFromTDateTimePicker(edtWriteOffDate);
    RegulatoryAssetBasePartialWriteOffObj.value := GetTXSDecimalFromTEdit(edtValue);
    RegulatoryAssetBasePartialWriteOffObj.percentage := GetTXSDecimalFromTEdit(edtPercentage);

    if DialogState = dsInsert then
    begin
      RegulatoryAssetBasePartialWriteOffObj.code := Low(Integer);
      TempRegulatoryAssetBasePartialWriteOff.addPartialWriteOff(RegulatoryAssetBasePartialWriteOffObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRegulatoryAssetBasePartialWriteOff.savePartialWriteOff(RegulatoryAssetBasePartialWriteOffObj);
    end;
  end;
end;

procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.edtValueOrPercentChange(
  Sender: TObject);
  var value, percent, originalValue : Double;
  edit : TEdit;
begin
  inherited;
  edit := TEdit(Sender);
  if edit = edtValue then begin
    edtPercentage.OnChange := nil;
  end else begin
    edtValue.OnChange := nil;
  end;

  try
    if edit = edtValue then if (Length(Trim(edtValue.Text)) = 0) then Exit else value := RoundTo(StrToFloat(edtValue.Text), -2);
    if edit = edtPercentage then if (Length(Trim(edtPercentage.Text)) = 0) then Exit else percent := RoundTo(StrToFloat(edtPercentage.Text), -2);
    if Assigned(calc) then begin
      originalValue := RoundTo(StrToFloat(calc.originalValue.DecimalString), -2);
      if edit = edtValue then if originalValue > 0 then percent := RoundTo((value / originalValue) * 100, -2) else percent := 100
      else value := RoundTo(originalValue * (percent / 100), -2);

    end;
    if (edit = edtValue) then edtPercentage.Text := FloatToStr(percent);
    if (edit = edtPercentage) then edtValue.Text := FloatToStr(value);
  finally
    if not Assigned(edtPercentage.OnChange) then edtPercentage.OnChange := edtValueOrPercentChange;
    if not Assigned(edtValue.OnChange) then edtValue.OnChange := edtValueOrPercentChange;
  end;
end;

procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.edtWriteOffDateChange(
  Sender: TObject);
var TempRegulatoryAssetBasePartialWriteOff: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  inherited;
  if DialogState = dsView then Exit;
  refreshCalc;
  if rbValue.Checked then Self.edtValueOrPercentChange(edtValue);
  if rbPercentage.Checked then Self.edtValueOrPercentChange(edtPercentage);
  

end;

procedure TfrmRegulatoryAssetBasePartialWriteOffEdit.refreshCalc;
var TempRegulatoryAssetBasePartialWriteOff: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  TempRegulatoryAssetBasePartialWriteOff := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
  edtWriteOffDate.Checked := True;
  calc := TempRegulatoryAssetBasePartialWriteOff.getShortObjectOnPeriod(asset, GetTXSDateFromTDateTimePicker(edtWriteOffDate));
end;

end.