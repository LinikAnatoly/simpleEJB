
unit EditENAct2Humen;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2HumenController ;

type
  TfrmENAct2HumenEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblOrederNum : TLabel;
    edtOrederNum: TEdit;
    lblTabNumber : TLabel;
    edtTabNumber: TEdit;
    lblFio : TLabel;
    edtFio: TEdit;
    lblSalary : TLabel;
    edtSalary: TEdit;
    lblTimeMonth : TLabel;
    edtTimeMonth: TEdit;
    lblSalaryHours : TLabel;
    edtSalaryHours: TEdit;
    lblTimeWork : TLabel;
    edtTimeWork: TEdit;
    lblTimeObjectWork : TLabel;
    edtTimeObjectWork: TEdit;
    lblTimeDelivery : TLabel;
    edtTimeDelivery: TEdit;
    lblPaysWork : TLabel;
    edtPaysWork: TEdit;


  HTTPRIOENAct2Humen: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAct2HumenEdit: TfrmENAct2HumenEdit;
  ENAct2HumenObj: ENAct2Humen;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAct2HumenController  ;
}
{$R *.dfm}



procedure TfrmENAct2HumenEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENAct2HumenObj.code);
    if ( ENAct2HumenObj.orederNum <> Low(Integer) ) then
       edtOrederNum.Text := IntToStr(ENAct2HumenObj.orederNum)
    else
       edtOrederNum.Text := '';
    edtTabNumber.Text := ENAct2HumenObj.tabNumber; 
    edtFio.Text := ENAct2HumenObj.fio; 
    if ( ENAct2HumenObj.salary <> nil ) then
       edtSalary.Text := ENAct2HumenObj.salary.decimalString
    else
       edtSalary.Text := ''; 
    if ( ENAct2HumenObj.timeMonth <> nil ) then
       edtTimeMonth.Text := ENAct2HumenObj.timeMonth.decimalString
    else
       edtTimeMonth.Text := ''; 
    if ( ENAct2HumenObj.salaryHours <> nil ) then
       edtSalaryHours.Text := ENAct2HumenObj.salaryHours.decimalString
    else
       edtSalaryHours.Text := ''; 
    if ( ENAct2HumenObj.timeWork <> nil ) then
       edtTimeWork.Text := ENAct2HumenObj.timeWork.decimalString
    else
       edtTimeWork.Text := ''; 
    if ( ENAct2HumenObj.timeObjectWork <> nil ) then
       edtTimeObjectWork.Text := ENAct2HumenObj.timeObjectWork.decimalString
    else
       edtTimeObjectWork.Text := ''; 
    if ( ENAct2HumenObj.timeDelivery <> nil ) then
       edtTimeDelivery.Text := ENAct2HumenObj.timeDelivery.decimalString
    else
       edtTimeDelivery.Text := ''; 
    if ( ENAct2HumenObj.paysWork <> nil ) then
       edtPaysWork.Text := ENAct2HumenObj.paysWork.decimalString
    else
       edtPaysWork.Text := ''; 


  end;
end;



procedure TfrmENAct2HumenEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2Humen: ENAct2HumenControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAct2Humen := HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;


     if ( edtOrederNum.Text <> '' ) then
       ENAct2HumenObj.orederNum := StrToInt(edtOrederNum.Text)
     else
       ENAct2HumenObj.orederNum := Low(Integer) ;

     ENAct2HumenObj.tabNumber := edtTabNumber.Text; 

     ENAct2HumenObj.fio := edtFio.Text; 

     if (ENAct2HumenObj.salary = nil ) then
       ENAct2HumenObj.salary := TXSDecimal.Create;
     if edtSalary.Text <> '' then
       ENAct2HumenObj.salary.decimalString := edtSalary.Text 
     else
       ENAct2HumenObj.salary := nil;

     if (ENAct2HumenObj.timeMonth = nil ) then
       ENAct2HumenObj.timeMonth := TXSDecimal.Create;
     if edtTimeMonth.Text <> '' then
       ENAct2HumenObj.timeMonth.decimalString := edtTimeMonth.Text 
     else
       ENAct2HumenObj.timeMonth := nil;

     if (ENAct2HumenObj.salaryHours = nil ) then
       ENAct2HumenObj.salaryHours := TXSDecimal.Create;
     if edtSalaryHours.Text <> '' then
       ENAct2HumenObj.salaryHours.decimalString := edtSalaryHours.Text 
     else
       ENAct2HumenObj.salaryHours := nil;

     if (ENAct2HumenObj.timeWork = nil ) then
       ENAct2HumenObj.timeWork := TXSDecimal.Create;
     if edtTimeWork.Text <> '' then
       ENAct2HumenObj.timeWork.decimalString := edtTimeWork.Text 
     else
       ENAct2HumenObj.timeWork := nil;

     if (ENAct2HumenObj.timeObjectWork = nil ) then
       ENAct2HumenObj.timeObjectWork := TXSDecimal.Create;
     if edtTimeObjectWork.Text <> '' then
       ENAct2HumenObj.timeObjectWork.decimalString := edtTimeObjectWork.Text 
     else
       ENAct2HumenObj.timeObjectWork := nil;

     if (ENAct2HumenObj.timeDelivery = nil ) then
       ENAct2HumenObj.timeDelivery := TXSDecimal.Create;
     if edtTimeDelivery.Text <> '' then
       ENAct2HumenObj.timeDelivery.decimalString := edtTimeDelivery.Text 
     else
       ENAct2HumenObj.timeDelivery := nil;

     if (ENAct2HumenObj.paysWork = nil ) then
       ENAct2HumenObj.paysWork := TXSDecimal.Create;
     if edtPaysWork.Text <> '' then
       ENAct2HumenObj.paysWork.decimalString := edtPaysWork.Text 
     else
       ENAct2HumenObj.paysWork := nil;

    if DialogState = dsInsert then
    begin
      ENAct2HumenObj.code:=low(Integer);
      TempENAct2Humen.add(ENAct2HumenObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAct2Humen.save(ENAct2HumenObj);
    end;
  end;
end;


end.