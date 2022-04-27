
unit EditENAdditionalAgreement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAdditionalAgreementController ;

type
  TfrmENAdditionalAgreementEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblSumWithoutVAT : TLabel;
    edtSumWithoutVAT: TEdit;
    lblSumVAT : TLabel;
    edtSumVAT: TEdit;
    edtCalcSumsByCalculations: TCheckBox;


  HTTPRIOENAdditionalAgreement: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSumWithoutVATChange(Sender: TObject);
    procedure edtCalcSumsByCalculationsClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAdditionalAgreementEdit: TfrmENAdditionalAgreementEdit;
  ENAdditionalAgreementObj: ENAdditionalAgreement;

implementation


uses FinancialUtilsUnit;
{$R *.dfm}



procedure TfrmENAdditionalAgreementEdit.FormShow(Sender: TObject);
begin

  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENAdditionalAgreementObj.code);
    edtNumberGen.Text := ENAdditionalAgreementObj.numberGen; 
      SetDateFieldForDateTimePicker(edtDateGen, ENAdditionalAgreementObj.dateGen);
    if ( ENAdditionalAgreementObj.sumWithoutVAT <> nil ) then
       edtSumWithoutVAT.Text := ENAdditionalAgreementObj.sumWithoutVAT.decimalString
    else
       edtSumWithoutVAT.Text := '';
    if ( ENAdditionalAgreementObj.sumVAT <> nil ) then
       edtSumVAT.Text := ENAdditionalAgreementObj.sumVAT.decimalString
    else
       edtSumVAT.Text := '';
    if ( ENAdditionalAgreementObj.calcSumsByCalculations <> nil ) then
       edtCalcSumsByCalculations.Checked := ENAdditionalAgreementObj.calcSumsByCalculations.asBoolean
    else
       edtCalcSumsByCalculations.Checked := false;

  end;
end;

procedure TfrmENAdditionalAgreementEdit.edtCalcSumsByCalculationsClick(
  Sender: TObject);
begin
  inherited;
  if edtCalcSumsByCalculations.Checked then begin
   DisableControls([edtSumWithoutVAT, edtSumVAT], True);
   if DialogState = dsInsert then begin
     edtSumWithoutVAT.Text := '';
     edtSumVAT.Text := '';
   end;
  end else begin
   DisableControls([edtSumWithoutVAT, edtSumVAT], False);
  end;
end;

procedure TfrmENAdditionalAgreementEdit.edtSumWithoutVATChange(Sender: TObject);
var
 date : TDateTime;
begin
  inherited;
  date := Now();
  if edtDateGen.Checked then date := edtDateGen.DateTime;
  FinancialUtilsUnit.calculateVat(edtSumWithoutVAT, edtSumVAT, date);
end;

procedure TfrmENAdditionalAgreementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAdditionalAgreement: ENAdditionalAgreementControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen,
      edtDateGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if not edtCalcSumsByCalculations.Checked then begin
      if (Length(Trim(edtSumWithoutVAT.Text)) = 0) or
         (Length(Trim(edtSumVAT.Text)) = 0) then begin
        Application.MessageBox(PChar('Введіть сумму за договором та сумму ПДВ!'),PChar('Увага!'), MB_ICONWARNING);
        Action := caNone;
        Exit;
      end;
    end;

    TempENAdditionalAgreement := HTTPRIOENAdditionalAgreement as ENAdditionalAgreementControllerSoapPort;


     ENAdditionalAgreementObj.numberGen := edtNumberGen.Text; 

     ENAdditionalAgreementObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);

     if (ENAdditionalAgreementObj.sumWithoutVAT = nil ) then
       ENAdditionalAgreementObj.sumWithoutVAT := TXSDecimal.Create;
     if edtSumWithoutVAT.Text <> '' then
       ENAdditionalAgreementObj.sumWithoutVAT.decimalString := edtSumWithoutVAT.Text
     else
       ENAdditionalAgreementObj.sumWithoutVAT := nil;

     if (ENAdditionalAgreementObj.sumVAT = nil ) then
       ENAdditionalAgreementObj.sumVAT := TXSDecimal.Create;
     if edtSumVAT.Text <> '' then
       ENAdditionalAgreementObj.sumVAT.decimalString := edtSumVAT.Text
     else
       ENAdditionalAgreementObj.sumVAT := nil;

	if(ENAdditionalAgreementObj.calcSumsByCalculations = nil) then ENAdditionalAgreementObj.calcSumsByCalculations := TXSBoolean.Create;
     ENAdditionalAgreementObj.calcSumsByCalculations.asBoolean := edtCalcSumsByCalculations.Checked;

    if DialogState = dsInsert then begin
      ENAdditionalAgreementObj.code:=low(Integer);
      TempENAdditionalAgreement.add(ENAdditionalAgreementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAdditionalAgreement.save(ENAdditionalAgreementObj);
    end;
  end;
end;


end.