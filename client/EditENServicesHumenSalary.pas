
unit EditENServicesHumenSalary;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesHumenSalaryController, TKCalcHumenSalaryController;

type
  TfrmENServicesHumenSalaryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblTimeGen : TLabel;
    edtTimeGen: TEdit;
    lblSalary : TLabel;
    edtSalary: TEdit;
    lblSalaryBonus : TLabel;
    edtSalaryBonus: TEdit;
    lblSalarySurcharge : TLabel;
    edtSalarySurcharge: TEdit;
    lblSalaryPremium : TLabel;
    edtSalaryPremium: TEdit;
    lblSalaryAdditional : TLabel;
    edtSalaryAdditional: TEdit;
    lblSalaryTotalBonus : TLabel;
    edtSalaryTotalBonus: TEdit;
    lblSalaryTotal : TLabel;
    edtSalaryTotal: TEdit;


  HTTPRIOENServicesHumenSalary: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOTKCalcHumenSalary: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    calc : TKCalcHumenSalary;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENServicesHumenSalaryEdit: TfrmENServicesHumenSalaryEdit;
  ENServicesHumenSalaryObj: ENServicesHumenSalary;

implementation

uses
EditTKCalcHumenSalary;
{$R *.dfm}



procedure TfrmENServicesHumenSalaryEdit.FormShow(Sender: TObject);
var
  TempTKCalcHumenSalary : TKCalcHumenSalaryControllerSoapPort;
begin

  TempTKCalcHumenSalary := HTTPRIOTKCalcHumenSalary as TKCalcHumenSalaryControllerSoapPort;
  
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtTimeGen
      ,edtSalary
      ,edtSalaryTotalBonus
      ,edtSalaryTotal
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      calc := TempTKCalcHumenSalary.getObject(ENServicesHumenSalaryObj.calcHumenSalaryRef.code);  
      edtCode.Text := IntToStr(ENServicesHumenSalaryObj.code);
    if ( ENServicesHumenSalaryObj.timeGen <> nil ) then
       edtTimeGen.Text := ENServicesHumenSalaryObj.timeGen.decimalString
    else
       edtTimeGen.Text := '';
    if ( ENServicesHumenSalaryObj.salary <> nil ) then
       edtSalary.Text := ENServicesHumenSalaryObj.salary.decimalString
    else
       edtSalary.Text := '';
    if ( ENServicesHumenSalaryObj.salaryBonus <> nil ) then
       edtSalaryBonus.Text := ENServicesHumenSalaryObj.salaryBonus.decimalString
    else
       edtSalaryBonus.Text := '';
    if ( ENServicesHumenSalaryObj.salarySurcharge <> nil ) then
       edtSalarySurcharge.Text := ENServicesHumenSalaryObj.salarySurcharge.decimalString
    else
       edtSalarySurcharge.Text := '';
    if ( ENServicesHumenSalaryObj.salaryPremium <> nil ) then
       edtSalaryPremium.Text := ENServicesHumenSalaryObj.salaryPremium.decimalString
    else
       edtSalaryPremium.Text := '';
    if ( ENServicesHumenSalaryObj.salaryAdditional <> nil ) then
       edtSalaryAdditional.Text := ENServicesHumenSalaryObj.salaryAdditional.decimalString
    else
       edtSalaryAdditional.Text := '';
    if ( ENServicesHumenSalaryObj.salaryTotalBonus <> nil ) then
       edtSalaryTotalBonus.Text := ENServicesHumenSalaryObj.salaryTotalBonus.decimalString
    else
       edtSalaryTotalBonus.Text := '';
    if ( ENServicesHumenSalaryObj.salaryTotal <> nil ) then
       edtSalaryTotal.Text := ENServicesHumenSalaryObj.salaryTotal.decimalString
    else
       edtSalaryTotal.Text := '';


  end;
end;



procedure TfrmENServicesHumenSalaryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesHumenSalary: ENServicesHumenSalaryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtTimeGen
      ,edtSalary
      ,edtSalaryTotalBonus
      ,edtSalaryTotal
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesHumenSalary := HTTPRIOENServicesHumenSalary as ENServicesHumenSalaryControllerSoapPort;


     if (ENServicesHumenSalaryObj.timeGen = nil ) then
       ENServicesHumenSalaryObj.timeGen := TXSDecimal.Create;
     if edtTimeGen.Text <> '' then
       ENServicesHumenSalaryObj.timeGen.decimalString := edtTimeGen.Text 
     else
       ENServicesHumenSalaryObj.timeGen := nil;

     if (ENServicesHumenSalaryObj.salary = nil ) then
       ENServicesHumenSalaryObj.salary := TXSDecimal.Create;
     if edtSalary.Text <> '' then
       ENServicesHumenSalaryObj.salary.decimalString := edtSalary.Text 
     else
       ENServicesHumenSalaryObj.salary := nil;

     if (ENServicesHumenSalaryObj.salaryBonus = nil ) then
       ENServicesHumenSalaryObj.salaryBonus := TXSDecimal.Create;
     if edtSalaryBonus.Text <> '' then
       ENServicesHumenSalaryObj.salaryBonus.decimalString := edtSalaryBonus.Text 
     else
       ENServicesHumenSalaryObj.salaryBonus := nil;

     if (ENServicesHumenSalaryObj.salarySurcharge = nil ) then
       ENServicesHumenSalaryObj.salarySurcharge := TXSDecimal.Create;
     if edtSalarySurcharge.Text <> '' then
       ENServicesHumenSalaryObj.salarySurcharge.decimalString := edtSalarySurcharge.Text 
     else
       ENServicesHumenSalaryObj.salarySurcharge := nil;

     if (ENServicesHumenSalaryObj.salaryPremium = nil ) then
       ENServicesHumenSalaryObj.salaryPremium := TXSDecimal.Create;
     if edtSalaryPremium.Text <> '' then
       ENServicesHumenSalaryObj.salaryPremium.decimalString := edtSalaryPremium.Text 
     else
       ENServicesHumenSalaryObj.salaryPremium := nil;

     if (ENServicesHumenSalaryObj.salaryAdditional = nil ) then
       ENServicesHumenSalaryObj.salaryAdditional := TXSDecimal.Create;
     if edtSalaryAdditional.Text <> '' then
       ENServicesHumenSalaryObj.salaryAdditional.decimalString := edtSalaryAdditional.Text 
     else
       ENServicesHumenSalaryObj.salaryAdditional := nil;

     if (ENServicesHumenSalaryObj.salaryTotalBonus = nil ) then
       ENServicesHumenSalaryObj.salaryTotalBonus := TXSDecimal.Create;
     if edtSalaryTotalBonus.Text <> '' then
       ENServicesHumenSalaryObj.salaryTotalBonus.decimalString := edtSalaryTotalBonus.Text 
     else
       ENServicesHumenSalaryObj.salaryTotalBonus := nil;

     if (ENServicesHumenSalaryObj.salaryTotal = nil ) then
       ENServicesHumenSalaryObj.salaryTotal := TXSDecimal.Create;
     if edtSalaryTotal.Text <> '' then
       ENServicesHumenSalaryObj.salaryTotal.decimalString := edtSalaryTotal.Text 
     else
       ENServicesHumenSalaryObj.salaryTotal := nil;

    if DialogState = dsInsert then
    begin
      ENServicesHumenSalaryObj.code:=low(Integer);
      TempENServicesHumenSalary.add(ENServicesHumenSalaryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesHumenSalary.save(ENServicesHumenSalaryObj);
    end;
  end;
end;


end.