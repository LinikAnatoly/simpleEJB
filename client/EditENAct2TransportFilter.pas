
unit EditENAct2TransportFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2TransportController ;

type
  TfrmENAct2TransportFilterEdit = class(TDialogForm)

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
  frmENAct2TransportFilterEdit: TfrmENAct2TransportFilterEdit;
  ENAct2TransportFilterObj: ENAct2TransportFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAct2TransportController  ;
}
{$R *.dfm}



procedure TfrmENAct2TransportFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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

}

end;



procedure TfrmENAct2TransportFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2Transport: ENAct2TransportControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAct2TransportFilterObj.invNumber := edtInvNumber.Text; 



     ENAct2TransportFilterObj.name := edtName.Text; 



     if (ENAct2TransportFilterObj.expense = nil ) then
       ENAct2TransportFilterObj.expense := TXSDecimal.Create;
     ENAct2TransportFilterObj.expense.decimalString := edtExpense.Text ;



     if (ENAct2TransportFilterObj.depreciationMonth = nil ) then
       ENAct2TransportFilterObj.depreciationMonth := TXSDecimal.Create;
     ENAct2TransportFilterObj.depreciationMonth.decimalString := edtDepreciationMonth.Text ;



     if (ENAct2TransportFilterObj.depreciationHours = nil ) then
       ENAct2TransportFilterObj.depreciationHours := TXSDecimal.Create;
     ENAct2TransportFilterObj.depreciationHours.decimalString := edtDepreciationHours.Text ;



     if (ENAct2TransportFilterObj.timeWork = nil ) then
       ENAct2TransportFilterObj.timeWork := TXSDecimal.Create;
     ENAct2TransportFilterObj.timeWork.decimalString := edtTimeWork.Text ;



     if (ENAct2TransportFilterObj.paysWork = nil ) then
       ENAct2TransportFilterObj.paysWork := TXSDecimal.Create;
     ENAct2TransportFilterObj.paysWork.decimalString := edtPaysWork.Text ;




  end;
end;




end.