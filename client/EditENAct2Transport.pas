
unit EditENAct2Transport;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2TransportController ;

type
  TfrmENAct2TransportEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblExpense : TLabel;
    edtExpense: TEdit;
    lblDepreciationMonth : TLabel;
    edtDepreciationMonth: TEdit;
    lblDepreciationHours : TLabel;
    edtDepreciationHours: TEdit;
    lblTimeWork : TLabel;
    edtTimeWork: TEdit;
    lblPaysWork : TLabel;
    edtPaysWork: TEdit;


  HTTPRIOENAct2Transport: THTTPRIO;

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
  frmENAct2TransportEdit: TfrmENAct2TransportEdit;
  ENAct2TransportObj: ENAct2Transport;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAct2TransportController  ;
}
{$R *.dfm}



procedure TfrmENAct2TransportEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtInvNumber.Text := ENAct2TransportObj.invNumber; 
    edtName.Text := ENAct2TransportObj.name; 
    if ( ENAct2TransportObj.expense <> nil ) then
       edtExpense.Text := ENAct2TransportObj.expense.decimalString
    else
       edtExpense.Text := ''; 
    if ( ENAct2TransportObj.depreciationMonth <> nil ) then
       edtDepreciationMonth.Text := ENAct2TransportObj.depreciationMonth.decimalString
    else
       edtDepreciationMonth.Text := ''; 
    if ( ENAct2TransportObj.depreciationHours <> nil ) then
       edtDepreciationHours.Text := ENAct2TransportObj.depreciationHours.decimalString
    else
       edtDepreciationHours.Text := ''; 
    if ( ENAct2TransportObj.timeWork <> nil ) then
       edtTimeWork.Text := ENAct2TransportObj.timeWork.decimalString
    else
       edtTimeWork.Text := ''; 
    if ( ENAct2TransportObj.paysWork <> nil ) then
       edtPaysWork.Text := ENAct2TransportObj.paysWork.decimalString
    else
       edtPaysWork.Text := ''; 


  end;
end;



procedure TfrmENAct2TransportEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2Transport: ENAct2TransportControllerSoapPort;
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
    TempENAct2Transport := HTTPRIOENAct2Transport as ENAct2TransportControllerSoapPort;


     ENAct2TransportObj.invNumber := edtInvNumber.Text; 

     ENAct2TransportObj.name := edtName.Text; 

     if (ENAct2TransportObj.expense = nil ) then
       ENAct2TransportObj.expense := TXSDecimal.Create;
     if edtExpense.Text <> '' then
       ENAct2TransportObj.expense.decimalString := edtExpense.Text 
     else
       ENAct2TransportObj.expense := nil;

     if (ENAct2TransportObj.depreciationMonth = nil ) then
       ENAct2TransportObj.depreciationMonth := TXSDecimal.Create;
     if edtDepreciationMonth.Text <> '' then
       ENAct2TransportObj.depreciationMonth.decimalString := edtDepreciationMonth.Text 
     else
       ENAct2TransportObj.depreciationMonth := nil;

     if (ENAct2TransportObj.depreciationHours = nil ) then
       ENAct2TransportObj.depreciationHours := TXSDecimal.Create;
     if edtDepreciationHours.Text <> '' then
       ENAct2TransportObj.depreciationHours.decimalString := edtDepreciationHours.Text 
     else
       ENAct2TransportObj.depreciationHours := nil;

     if (ENAct2TransportObj.timeWork = nil ) then
       ENAct2TransportObj.timeWork := TXSDecimal.Create;
     if edtTimeWork.Text <> '' then
       ENAct2TransportObj.timeWork.decimalString := edtTimeWork.Text 
     else
       ENAct2TransportObj.timeWork := nil;

     if (ENAct2TransportObj.paysWork = nil ) then
       ENAct2TransportObj.paysWork := TXSDecimal.Create;
     if edtPaysWork.Text <> '' then
       ENAct2TransportObj.paysWork.decimalString := edtPaysWork.Text 
     else
       ENAct2TransportObj.paysWork := nil;

    if DialogState = dsInsert then
    begin
      ENAct2TransportObj.code:=low(Integer);
      TempENAct2Transport.add(ENAct2TransportObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAct2Transport.save(ENAct2TransportObj);
    end;
  end;
end;


end.