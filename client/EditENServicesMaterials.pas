unit EditENServicesMaterials;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesMaterialsController, TKCalcMaterialsController ;

type
  TfrmENServicesMaterialsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENServicesMaterials: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtMaterialName: TEdit;
    edtSumGen: TEdit;
    edtCountGen: TEdit;
    edtPriceGen: TEdit;
    edtMeasureUnitName: TEdit;
    lblSumGen: TLabel;
    lblCountGen: TLabel;
    lblPriceGen: TLabel;
    lblMaterialName: TLabel;
    HTTPRIOTKCalcMaterials: THTTPRIO;
    lblTKTechCardNumber: TLabel;
    edtTKTechCardNumber: TEdit;
    edtTKTechCardName: TEdit;
    lblTKTechCardName: TLabel;
    spbTKTechCard: TSpeedButton;
    spbTKMaterials: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOTKTechCard: THTTPRIO;
    HTTPRIOTKCalcCost: THTTPRIO;
    HTTPRIOENServicesCost: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKTechCardClick(Sender: TObject);
    procedure spbTKMaterialsClick(Sender: TObject);
    procedure edtPriceGenChange(Sender: TObject);
    procedure edtCountGenChange(Sender: TObject);
  
  
  private
    calc : TKCalcMaterials;
	procedure CalculateSum;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesMaterialsEdit: TfrmENServicesMaterialsEdit;
  ENServicesMaterialsObj: ENServicesMaterials;

implementation


uses Math,EditTKCalcMaterials, TKTechCardController, ENServicesCostController
, TKCalcCostController, TKClassificationTypeController, ShowTKTechCard, ShowTKMaterials
, TKMaterialsController;
{$R *.dfm}


procedure TfrmENServicesMaterialsEdit.CalculateSum;
var
count, price, sum : Double;
begin
  count := 0;
  price := 0;
  try
    if Length(Trim(edtPriceGen.Text)) > 0 then price := StrToFloat(edtPriceGen.Text);
    if Length(Trim(edtCountGen.Text)) > 0 then count := StrToFloat(edtCountGen.Text);
  except on EConvertError do Exit;
  end;
  
  sum := count * price;
  if (sum > 0) then edtSumGen.Text := FloatToStr(RoundTo(sum, -2));
end;

procedure TfrmENServicesMaterialsEdit.FormShow(Sender: TObject);
var
isTechCard : Boolean;
TempTKTechCard : TKTechCardControllerSoapPort;
techCard : TKTechCard; 
begin

  DisableControls([edtCode, edtMaterialName, edtMeasureUnitName, edtTKTechCardNumber, edtTKTechCardName]);
  
  HideControls([spbTKMaterials, spbTKTechCard, lblTKTechCardNumber
    , lblTKTechCardName, edtTKTechCardNumber, edtTKTechCardName], (DialogState <> dsInsert));

  if DialogState = dsView then
  begin
     DisableControls([spbTKMaterials, spbTKTechCard]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtSumGen
      , edtPriceGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENServicesMaterialsObj.code);
    if ( ENServicesMaterialsObj.countGen <> nil ) then
       edtCountGen.Text := ENServicesMaterialsObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    if ( ENServicesMaterialsObj.sumGen <> nil ) then
       edtSumGen.Text := ENServicesMaterialsObj.sumGen.decimalString
    else
       edtSumGen.Text := '';
	   
    if ( ENServicesMaterialsObj.priceGen <> nil ) then
       edtPriceGen.Text := ENServicesMaterialsObj.priceGen.decimalString
    else
       edtPriceGen.Text := '';
	   
	edtMaterialName.Text := ENServicesMaterialsObj.materialName;
	edtMeasureUnitName.Text := ENServicesMaterialsObj.measureUnitName;
	
	isTechCard := ((Assigned(ENServicesMaterialsObj.kartaRef)) and (ENServicesMaterialsObj.kartaRef.code <> Low(Integer)));

    HideControls([spbTKMaterials, spbTKTechCard, lblTKTechCardNumber
      , lblTKTechCardName, edtTKTechCardNumber, edtTKTechCardName], (not isTechCard));
	  
	if(isTechCard) then begin
	  TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;
	  techCard := TempTKTechCard.getObject(ENServicesMaterialsObj.kartaRef.code);
	  edtTKTechCardNumber.Text := techCard.techKartNumber;
	  edtTKTechCardName.Text := techCard.name;
	end;

  end;
end;



procedure TfrmENServicesMaterialsEdit.spbTKMaterialsClick(Sender: TObject);
var
material : TKMaterialsShort;
begin
  inherited;
  material := TfrmTKMaterialsShow.chooseFromList();
  if Assigned(material) then begin
    if not Assigned(ENservicesMaterialsObj.materialRef) then 
     ENservicesMaterialsObj.materialRef := TKMaterialsRef.Create;
    ENservicesMaterialsObj.materialRef.code := material.code;
	edtMaterialName.Text := material.name;
	edtMeasureUnitName.Text := material.measurementName;
    if Length(Trim(edtCountGen.Text)) = 0 then edtCountGen.Text := '1';
    if ((Length(Trim(edtPriceGen.Text)) = 0) and (Assigned(material.cost))) then 
      edtPriceGen.Text := material.cost.DecimalString;
  end;
end;

procedure TfrmENServicesMaterialsEdit.spbTKTechCardClick(Sender: TObject);
var
TempENServicesCost : ENServicesCostControllerSoapPort;
TempTKCalcCost : TKCalcCostControllerSoapPort;
servicesCost : ENServicesCost;
calcCost : TKCalcCost;
tkTechCard : TKTechCardShort;
filter : TKTechCardFilter;
begin
TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;

servicesCost := TempENServicesCost.getObject(ENServicesMaterialsObj.servicesCostRef.code);
calcCost := TempTKCalcCost.getObject(servicesCost.tkCalcCostRef.code);

filter := TKTechCardFilter.Create;
SetNullXSProps(filter);
SetNullIntProps(filter);

filter.classificationType := TKClassificationType.Create;
filter.classificationType.code := calcCost.classificationTypeRef.code;

tkTechCard := TfrmTKTechCardShow.chooseFromList(filter);

if(Assigned(tkTechCard)) then begin
  edtTKTechCardNumber.Text := tkTechCard.techKartNumber;
  edtTKTechCardName.Text := tkTechCard.name;
  if not Assigned(ENServicesMaterialsObj.kartaRef) then ENServicesMaterialsObj.kartaRef := TKTechCardRef.Create;
  ENServicesMaterialsObj.kartaRef.code := tkTechCard.code;
end;
end;

procedure TfrmENServicesMaterialsEdit.edtCountGenChange(Sender: TObject);
begin
  inherited;
  Self.CalculateSum;
end;

procedure TfrmENServicesMaterialsEdit.edtPriceGenChange(Sender: TObject);
begin
  inherited;
  Self.CalculateSum;
end;

procedure TfrmENServicesMaterialsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesMaterials: ENServicesMaterialsControllerSoapPort;
components : TArray<TWinControl>;
isTechCard : Boolean;
begin
 isTechCard := ((Assigned(ENServicesMaterialsObj.kartaRef)) and (ENServicesMaterialsObj.kartaRef.code <> Low(Integer)));
 if ((isTechCard) or (DialogState = dsInsert)) then begin
    components := TArray<TWinControl>.Create(edtCountGen, edtSumGen, edtPriceGen, edtMaterialName, edtTKTechCardName);
  end else begin
    components := TArray<TWinControl>.Create(edtCountGen, edtSumGen, edtPriceGen, edtMaterialName);
  end;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues(components)  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesMaterials := HTTPRIOENServicesMaterials as ENServicesMaterialsControllerSoapPort;


     if (ENServicesMaterialsObj.countGen = nil ) then
       ENServicesMaterialsObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENServicesMaterialsObj.countGen.decimalString := edtCountGen.Text 
     else
       ENServicesMaterialsObj.countGen := nil;
	   
	if (ENServicesMaterialsObj.priceGen = nil ) then
       ENServicesMaterialsObj.priceGen := TXSDecimal.Create;
     if edtPriceGen.Text <> '' then
       ENServicesMaterialsObj.priceGen.decimalString := edtPriceGen.Text 
     else
       ENServicesMaterialsObj.priceGen := nil;

     if (ENServicesMaterialsObj.sumGen = nil ) then
       ENServicesMaterialsObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENServicesMaterialsObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENServicesMaterialsObj.sumGen := nil;

    if DialogState = dsInsert then
    begin
      ENServicesMaterialsObj.code:=low(Integer);
      TempENServicesMaterials.add(ENServicesMaterialsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesMaterials.save(ENServicesMaterialsObj);
    end;
  end;
end;


end.