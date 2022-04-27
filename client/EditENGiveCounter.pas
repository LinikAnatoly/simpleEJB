
unit EditENGiveCounter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENGiveCounterController, Math, Mask ;

type
  TfrmENGiveCounterEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCounterType : TLabel;
    edtCounterType: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIOENGiveCounter: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    gpbIncomeGiveCounter: TGroupBox;
    edtCostWithVAT: TEdit;
    lblCostWithVAT: TLabel;
    edtVAT: TEdit;
    lblVAT: TLabel;
    edtCost: TEdit;
    lblCost: TLabel;
    edtMolIncomeFIO: TEdit;
    spbMolIncome: TSpeedButton;
    edtMolIncomeCode: TEdit;
    lblMolIncome: TLabel;
    cbPhasity: TComboBox;
    lblPhasity: TLabel;
    edtDateBuild: TDateTimePicker;
    lblDateBuild: TLabel;
    lblSerialNumber: TLabel;
    edtSerialNumber: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtCostChange(Sender: TObject);
    procedure edtVATChange(Sender: TObject);
    procedure spbMolIncomeClick(Sender: TObject);
  
  
  private
    { Private declarations }
   procedure calculateVat;
	 procedure calculateSumWithVat;

  public
    { Public declarations }
    isGiveCounterToBalance: Boolean;
    plan2ctCode: Integer;
  end;

var
  frmENGiveCounterEdit: TfrmENGiveCounterEdit;
  ENGiveCounterObj: ENGiveCounter;

implementation

uses ENConsts, ENPlanWork2ClassificationTypeController, ShowSCMol, SCMolController;


{uses  
    EnergyproController, EnergyproController2, ENGiveCounterController  ;
}
{$R *.dfm}


procedure TfrmENGiveCounterEdit.calculateSumWithVat;
var cost, vat, costWithVat : Extended;
costTxt, vatTxt : String;
begin
	cost := 0;
	vat := 0;
	vatTxt := trim(edtVAT.Text);
	costTxt := trim(edtCost.Text);
	if Length(costTxt) > 0 then begin
    try
      cost := RoundTo(StrToFloat(costTxt), -2);
    except
      on EConvertError do
        cost := 0;
    end;
	end;
	if Length(vatTxt) > 0 then begin
    try
      vat := RoundTo(StrToFloat(vatTxt), -2);
    except
     on EConvertError do
        vat := 0;
    end;
	end;
	costWithVat := RoundTo(cost + vat, -2);
	edtCostWithVAT.Text := FloatToStr(costWithVat);
end;

procedure TfrmENGiveCounterEdit.calculateVat;
var cost, vat : Extended;
costTxt : String;
begin
	cost := 0;
	vat := 0;
	costTxt := trim(edtCost.Text);
	if Length(costTxt) > 0 then begin
		cost := RoundTo(StrToFloat(costTxt), -2);
	end;
	vat := 0;
  edtVAT.Text := FloatToStr(vat);
end;

procedure TfrmENGiveCounterEdit.FormShow(Sender: TObject);
begin
  SetFloatStyle([edtCost, edtVAT, edtCostWithVAT]);

  HideControls([gpbIncomeGiveCounter], (not Self.isGiveCounterToBalance));


  DisableControls([edtCode, edtVat, edtCostWithVat, edtMolIncomeCode, edtMolIncomeFIO]);

	cbPhasity.ItemIndex := 0;

  if DialogState = dsView then
  begin
     DisableControls([spbMolIncome]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCounterType
      ,edtSerialNumber
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENGiveCounterObj.code);
    edtCounterType.Text := ENGiveCounterObj.counterType;
    edtSerialNumber.Text := ENGiveCounterObj.serialNumber;
    edtCommentGen.Text := ENGiveCounterObj.commentGen;

    // SUPP-53893
    if ( ENGiveCounterObj.cost <> nil ) then
       edtCost.Text := ENGiveCounterObj.cost.decimalString
    else
       edtCost.Text := '';

    if ( ENGiveCounterObj.vat <> nil ) then
       edtVAT.Text := ENGiveCounterObj.vat.decimalString
    else
       edtVAT.Text := '';

	  calculateSumWithVat;

    edtMolIncomeCode.Text := ENGiveCounterObj.molCode;
	edtMolIncomeFIO.Text := ENGiveCounterObj.molName;
	
	if(ENGiveCounterObj.phasity <> Low(Integer)) then begin
		if(ENGiveCounterObj.phasity = 1) then begin
			cbPhasity.ItemIndex := 1;
		end else begin
			cbPhasity.ItemIndex := 2;
		end;
	end else cbPhasity.ItemIndex := 0;
  end;
  
	if ENGiveCounterObj.dateBuild <> nil then begin
		edtDateBuild.DateTime:=EncodeDate(ENGiveCounterObj.dateBuild.Year,ENGiveCounterObj.dateBuild.Month,ENGiveCounterObj.dateBuild.Day);
		edtDateBuild.checked := true;
	end else begin
		edtDateBuild.DateTime:=SysUtils.Date;
		edtDateBuild.checked := false;
	end;
end;



procedure TfrmENGiveCounterEdit.spbMolIncomeClick(Sender: TObject);
var selectedMol : SCMolShort;
begin
  selectedMol := TfrmSCMolShow.chooseFromList();
  if(Assigned(selectedMol)) then begin
    edtMolIncomeCode.Text := selectedMol.kod_mol;
    edtMolIncomeFIO.Text := selectedMol.name_mol;
  end
end;

procedure TfrmENGiveCounterEdit.edtCostChange(Sender: TObject);
begin
  inherited;
  calculateVat;
  calculateSumWithVat;
end;

procedure TfrmENGiveCounterEdit.edtVATChange(Sender: TObject);
begin
  inherited;
  calculateSumWithVat;
end;

procedure TfrmENGiveCounterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGiveCounter: ENGiveCounterControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCounterType
      ,edtSerialNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    {
    if plan2ctCode = LOW_INT then
      raise Exception.Create('NET-4159 Невідомий код зв''язки класифікації з планом для договору!');

    if ENGiveCounterObj.plan2ClTypeRef = nil then
      ENGiveCounterObj.plan2ClTypeRef := ENPlanWork2ClassificationTypeRef.Create;
    if ENGiveCounterObj.plan2ClTypeRef
    }
    if ENGiveCounterObj.servicesObjectRef = nil then
      raise Exception.Create('NET-4159 Невідомий код договору!');

    if ENGiveCounterObj.servicesObjectRef.code = LOW_INT then
      raise Exception.Create('NET-4159 Невідомий код договору!');

    if ENGiveCounterObj.plan2ClTypeRef = nil then
      raise Exception.Create('NET-4159 Невідомий код зв''язки класифікації з планом для договору!');

    if ENGiveCounterObj.plan2ClTypeRef.code = LOW_INT then
      raise Exception.Create('NET-4159 Невідомий код зв''язки класифікації з планом для договору!');

    ENGiveCounterObj.counterType := edtCounterType.Text;

    ENGiveCounterObj.serialNumber := edtSerialNumber.Text;

    ENGiveCounterObj.commentGen := edtCommentGen.Text;
	
	// SUPP-53893
	if ENGiveCounterObj.cost = nil then ENGiveCounterObj.cost := TXSDecimal.Create;
	if Length(edtCost.Text) > 0 then ENGiveCounterObj.cost.DecimalString := edtCost.Text
  else ENGiveCounterObj.cost := nil;

	if ENGiveCounterObj.vat = nil then ENGiveCounterObj.vat := TXSDecimal.Create;
	if Length(edtVAT.Text) > 0 then ENGiveCounterObj.vat.DecimalString := edtVAT.Text
  else ENGiveCounterObj.vat := nil;

  ENGiveCounterObj.molCode := edtMolIncomeCode.Text;
  ENGiveCounterObj.molName := edtMolIncomeFIO.Text;
  
    case cbPhasity.ItemIndex of
    0: ENGiveCounterObj.phasity := Low(Integer);
    1: ENGiveCounterObj.phasity := 1;
	  2: ENGiveCounterObj.phasity := 3;
    Else 
    begin
		Application.MessageBox(PChar('Неможливо встановити фазність лічильника'), PChar('Увага!'), MB_ICONWARNING);
		Action:=caNone;
		Exit;
    end;
	end;

  if edtDateBuild.checked then begin
		if ENGiveCounterObj.dateBuild = nil then ENGiveCounterObj.dateBuild := TXSDate.Create;
    ENGiveCounterObj.dateBuild.XSToNative(GetXSDate(edtDateBuild.DateTime));
  end else ENGiveCounterObj.dateBuild := nil;

    TempENGiveCounter := HTTPRIOENGiveCounter as ENGiveCounterControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENGiveCounterObj.code:=low(Integer);
      TempENGiveCounter.add(ENGiveCounterObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENGiveCounter.save(ENGiveCounterObj);
    end;
  end;
end;


procedure TfrmENGiveCounterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  plan2ctCode := LOW_INT;
end;

end.