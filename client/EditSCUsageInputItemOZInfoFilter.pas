
unit EditSCUsageInputItemOZInfoFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemOZInfoController ;

type
  TfrmSCUsageInputItemOZInfoFilterEdit = class(TDialogForm)

    lblSourceCode : TLabel;
    edtSourceCode: TEdit;

    lblAccount : TLabel;
    edtAccount: TEdit;

    lblExpensesCode : TLabel;
    edtExpensesCode: TEdit;

    lblSumWithNds : TLabel;
    edtSumWithNds: TEdit;

    lblSumNds : TLabel;
    edtSumNds: TEdit;

    lblSumGen : TLabel;
    edtSumGen: TEdit;



  HTTPRIOSCUsageInputItemOZInfo: THTTPRIO;

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
  frmSCUsageInputItemOZInfoFilterEdit: TfrmSCUsageInputItemOZInfoFilterEdit;
  SCUsageInputItemOZInfoFilterObj: SCUsageInputItemOZInfoFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCUsageInputItemOZInfoController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputItemOZInfoFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSourceCode
      ,edtAccount
      ,edtExpensesCode
      ,edtSumWithNds
      ,edtSumNds
      ,edtSumGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtSourceCode.Text := SCUsageInputItemOZInfoObj.sourceCode; 



    edtAccount.Text := SCUsageInputItemOZInfoObj.account; 



    edtExpensesCode.Text := SCUsageInputItemOZInfoObj.expensesCode; 



    if ( SCUsageInputItemOZInfoObj.sumWithNds <> nil ) then
       edtSumWithNds.Text := SCUsageInputItemOZInfoObj.sumWithNds.decimalString
    else
       edtSumWithNds.Text := ''; 



    if ( SCUsageInputItemOZInfoObj.sumNds <> nil ) then
       edtSumNds.Text := SCUsageInputItemOZInfoObj.sumNds.decimalString
    else
       edtSumNds.Text := ''; 



    if ( SCUsageInputItemOZInfoObj.sumGen <> nil ) then
       edtSumGen.Text := SCUsageInputItemOZInfoObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 


  end;

}

end;



procedure TfrmSCUsageInputItemOZInfoFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCUsageInputItemOZInfoFilterObj.sourceCode := edtSourceCode.Text; 



     SCUsageInputItemOZInfoFilterObj.account := edtAccount.Text; 



     SCUsageInputItemOZInfoFilterObj.expensesCode := edtExpensesCode.Text; 



     if (SCUsageInputItemOZInfoFilterObj.sumWithNds = nil ) then
       SCUsageInputItemOZInfoFilterObj.sumWithNds := TXSDecimal.Create;
     if edtSumWithNds.Text <> '' then
       SCUsageInputItemOZInfoFilterObj.sumWithNds.decimalString := edtSumWithNds.Text 
     else
       SCUsageInputItemOZInfoFilterObj.sumWithNds := nil;




     if (SCUsageInputItemOZInfoFilterObj.sumNds = nil ) then
       SCUsageInputItemOZInfoFilterObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       SCUsageInputItemOZInfoFilterObj.sumNds.decimalString := edtSumNds.Text 
     else
       SCUsageInputItemOZInfoFilterObj.sumNds := nil;




     if (SCUsageInputItemOZInfoFilterObj.sumGen = nil ) then
       SCUsageInputItemOZInfoFilterObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       SCUsageInputItemOZInfoFilterObj.sumGen.decimalString := edtSumGen.Text 
     else
       SCUsageInputItemOZInfoFilterObj.sumGen := nil;





  end;
end;




end.