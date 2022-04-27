
unit EditENAct2HumenFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAct2HumenController ;

type
  TfrmENAct2HumenFilterEdit = class(TDialogForm)

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
  frmENAct2HumenFilterEdit: TfrmENAct2HumenFilterEdit;
  ENAct2HumenFilterObj: ENAct2HumenFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAct2HumenController  ;
}
{$R *.dfm}



procedure TfrmENAct2HumenFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

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

}

end;



procedure TfrmENAct2HumenFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct2Humen: ENAct2HumenControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtOrederNum.Text <> '' ) then
       ENAct2HumenFilterObj.orederNum := StrToInt(edtOrederNum.Text)
     else
       ENAct2HumenFilterObj.orederNum := Low(Integer) ;




     ENAct2HumenFilterObj.tabNumber := edtTabNumber.Text; 



     ENAct2HumenFilterObj.fio := edtFio.Text; 



     if (ENAct2HumenFilterObj.salary = nil ) then
       ENAct2HumenFilterObj.salary := TXSDecimal.Create;
     if edtSalary.Text <> '' then
       ENAct2HumenFilterObj.salary.decimalString := edtSalary.Text 
     else
       ENAct2HumenFilterObj.salary := nil;




     if (ENAct2HumenFilterObj.timeMonth = nil ) then
       ENAct2HumenFilterObj.timeMonth := TXSDecimal.Create;
     if edtTimeMonth.Text <> '' then
       ENAct2HumenFilterObj.timeMonth.decimalString := edtTimeMonth.Text 
     else
       ENAct2HumenFilterObj.timeMonth := nil;




     if (ENAct2HumenFilterObj.salaryHours = nil ) then
       ENAct2HumenFilterObj.salaryHours := TXSDecimal.Create;
     if edtSalaryHours.Text <> '' then
       ENAct2HumenFilterObj.salaryHours.decimalString := edtSalaryHours.Text 
     else
       ENAct2HumenFilterObj.salaryHours := nil;




     if (ENAct2HumenFilterObj.timeWork = nil ) then
       ENAct2HumenFilterObj.timeWork := TXSDecimal.Create;
     if edtTimeWork.Text <> '' then
       ENAct2HumenFilterObj.timeWork.decimalString := edtTimeWork.Text 
     else
       ENAct2HumenFilterObj.timeWork := nil;




     if (ENAct2HumenFilterObj.timeObjectWork = nil ) then
       ENAct2HumenFilterObj.timeObjectWork := TXSDecimal.Create;
     if edtTimeObjectWork.Text <> '' then
       ENAct2HumenFilterObj.timeObjectWork.decimalString := edtTimeObjectWork.Text 
     else
       ENAct2HumenFilterObj.timeObjectWork := nil;




     if (ENAct2HumenFilterObj.timeDelivery = nil ) then
       ENAct2HumenFilterObj.timeDelivery := TXSDecimal.Create;
     if edtTimeDelivery.Text <> '' then
       ENAct2HumenFilterObj.timeDelivery.decimalString := edtTimeDelivery.Text 
     else
       ENAct2HumenFilterObj.timeDelivery := nil;




     if (ENAct2HumenFilterObj.paysWork = nil ) then
       ENAct2HumenFilterObj.paysWork := TXSDecimal.Create;
     if edtPaysWork.Text <> '' then
       ENAct2HumenFilterObj.paysWork.decimalString := edtPaysWork.Text 
     else
       ENAct2HumenFilterObj.paysWork := nil;





  end;
end;




end.