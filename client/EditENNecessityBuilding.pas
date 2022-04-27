
unit EditENNecessityBuilding;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENNecessityBuildingController;

type
    TfrmENNecessityBuildingEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblDescription : TLabel;
    lblEPVoltageNominalValue: TLabel;
    edtEPVoltageNominalValue: TEdit;
    spbEPVoltageNominalValue: TSpeedButton;

    HTTPRIOENNecessityBuilding: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtDescription: TMemo;
    lblElementType: TLabel;
    edtElementType: TEdit;
    spbElementType: TSpeedButton;
    lblSummaGen: TLabel;
    edtSummaGen: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbEPVoltageNominalValueClick(Sender : TObject);
    procedure spbElementTypeClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENNecessityBuildingEdit: TfrmENNecessityBuildingEdit;
  ENNecessityBuildingObj: ENNecessityBuilding;

implementation

uses
  ShowEPVoltageNominal, ShowENElementType, ENElementTypeController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENNecessityBuildingController  ;
}
{$R *.dfm}



procedure TfrmENNecessityBuildingEdit.FormShow(Sender: TObject);
var
  TempENNecessityBuilding: ENNecessityBuildingControllerSoapPort;
  necessityBuildingShort: ENNecessityBuildingShort;
begin
  TempENNecessityBuilding := HTTPRIOENNecessityBuilding as ENNecessityBuildingControllerSoapPort;
  edtCode.Visible := (DialogState <> dsInsert);
  lblCode.Visible := (DialogState <> dsInsert);
  DisableControls([edtCode, edtEPVoltageNominalValue, edtElementType]);
  SetFloatStyle([edtCountGen, edtSummaGen]);
  HideControls([lblEPVoltageNominalValue, edtEPVoltageNominalValue, spbEPVoltageNominalValue]);

  if DialogState = dsView then
  begin
    DisableControls([edtEPVoltageNominalValue, spbEPVoltageNominalValue, edtElementType, spbElementType]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtCountGen, edtSummaGen, edtDescription, edtEPVoltageNominalValue, edtElementType]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if (ENNecessityBuildingObj.elementTypeRef.code = ENELEMENTTYPE_ENSUBSTATION150) then
      HideControls([lblEPVoltageNominalValue, edtEPVoltageNominalValue, spbEPVoltageNominalValue], False);

    edtCode.Text := IntToStr(ENNecessityBuildingObj.code);

    if (ENNecessityBuildingObj.countGen <> nil ) then
      edtCountGen.Text := ENNecessityBuildingObj.countGen.decimalString
    else
      edtCountGen.Text := '';

    if (ENNecessityBuildingObj.summaGen <> nil ) then
      edtSummaGen.Text := ENNecessityBuildingObj.summaGen.decimalString
    else
      edtSummaGen.Text := '';

    edtDescription.Text := ENNecessityBuildingObj.description;

    necessityBuildingShort := TempENNecessityBuilding.getShortObject(ENNecessityBuildingObj.code);

    edtElementType.Text := necessityBuildingShort.elementTypeRefName;
    edtEPVoltageNominalValue.Text := necessityBuildingShort.voltageNominalValue;
  end;
end;


procedure TfrmENNecessityBuildingEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENNecessityBuilding: ENNecessityBuildingControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtElementType, edtCountGen]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else

  if not NoBlankValues([edtEPVoltageNominalValue])
      and ((ENNecessityBuildingObj.elementTypeRef.code = ENELEMENTTYPE_PL35_150)
         or (ENNecessityBuildingObj.elementTypeRef.code = ENELEMENTTYPE_ENSUBSTATION150)) then
  begin
    Application.MessageBox(PChar('Ви не вказали номінальну напругу!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else

  begin
    TempENNecessityBuilding := HTTPRIOENNecessityBuilding as ENNecessityBuildingControllerSoapPort;

    if (ENNecessityBuildingObj.countGen = nil ) then
      ENNecessityBuildingObj.countGen := TXSDecimal.Create;
    if edtCountGen.Text <> '' then
      ENNecessityBuildingObj.countGen.decimalString := edtCountGen.Text
    else
      ENNecessityBuildingObj.countGen := nil;

    if (ENNecessityBuildingObj.summaGen = nil ) then
      ENNecessityBuildingObj.summaGen := TXSDecimal.Create;
    if edtSummaGen.Text <> '' then
      ENNecessityBuildingObj.summaGen.decimalString := edtSummaGen.Text
    else
      ENNecessityBuildingObj.summaGen := nil;

    ENNecessityBuildingObj.description := edtDescription.Text;

    if DialogState = dsInsert then
    begin
      ENNecessityBuildingObj.code:=low(Integer);
      TempENNecessityBuilding.add(ENNecessityBuildingObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENNecessityBuilding.save(ENNecessityBuildingObj);
    end;
  end;
end;


procedure TfrmENNecessityBuildingEdit.spbElementTypeClick(Sender: TObject);
var
  frmENElementTypeShow: TfrmENElementTypeShow;
  f: ENElementTypeFilter;
begin
  inherited;
  f := ENElementTypeFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := ' code in (' + IntToStr(ENELEMENTTYPE_PL6_10) + ','
    + IntToStr(ENELEMENTTYPE_PL04) + ',' + IntToStr(ENELEMENTTYPE_ENSUBSTATION04) + ','
    + IntToStr(ENELEMENTTYPE_PL35_150) + ',' + IntToStr(ENELEMENTTYPE_ENSUBSTATION150) + ')';

  try
    frmENElementTypeShow := TfrmENElementTypeShow.Create(Application, fmNormal, f);
    DisableActions([frmENElementTypeShow.actInsert, frmENElementTypeShow.actEdit,
      frmENElementTypeShow.actFilter, frmENElementTypeShow.actNoFilter, frmENElementTypeShow.actDelete]);

    with frmENElementTypeShow do
    if ShowModal = mrOk then
    begin
      try
        if ENNecessityBuildingObj.elementTypeRef = nil then ENNecessityBuildingObj.elementTypeRef := ENElementTypeRef.Create;
        ENNecessityBuildingObj.elementTypeRef.code := StrToInt(GetReturnValue(sgENElementType,0));
        edtElementType.Text := GetReturnValue(sgENElementType,1);

        if (ENNecessityBuildingObj.elementTypeRef.code = ENELEMENTTYPE_PL35_150)
            or (ENNecessityBuildingObj.elementTypeRef.code = ENELEMENTTYPE_ENSUBSTATION150) then
          HideControls([lblEPVoltageNominalValue, edtEPVoltageNominalValue, spbEPVoltageNominalValue], False)
        else
        begin
          HideControls([lblEPVoltageNominalValue, edtEPVoltageNominalValue, spbEPVoltageNominalValue]);
          ENNecessityBuildingObj.voltageNominal := nil;
        end;

        edtEPVoltageNominalValue.Text := '';
        edtCountGen.Text := '';
        edtSummaGen.Text := '';
        edtDescription.Text := '';

      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementTypeShow.Free;
  end;
end;


procedure TfrmENNecessityBuildingEdit.spbEPVoltageNominalValueClick(Sender : TObject);
var 
  frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
begin
  frmEPVoltageNominalShow := TfrmEPVoltageNominalShow.Create(Application,fmNormal);
  try
    with frmEPVoltageNominalShow do
    if ShowModal = mrOk then
    begin
      try
        if ENNecessityBuildingObj.voltageNominal = nil then ENNecessityBuildingObj.voltageNominal := EPVoltageNominal.Create();
        ENNecessityBuildingObj.voltageNominal.code := StrToInt(GetReturnValue(sgMain,0));
        edtEPVoltageNominalValue.Text := GetReturnValue(sgMain,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmEPVoltageNominalShow.Free;
  end;
end;


end.