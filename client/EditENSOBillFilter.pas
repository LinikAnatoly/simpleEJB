
unit EditENSOBillFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOBillController ;

type
  TfrmENSOBillFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblSumTotal : TLabel;
    edtSumTotal: TEdit;

    lblSumGen : TLabel;
    edtSumGen: TEdit;

    lblSumVat : TLabel;
    edtSumVat: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSOBill: THTTPRIO;

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
  frmENSOBillFilterEdit: TfrmENSOBillFilterEdit;
  ENSOBillFilterObj: ENSOBillFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOBillController  ;
}
{$R *.dfm}



procedure TfrmENSOBillFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENSOBillObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENSOBillObj.dateGen.Year,ENSOBillObj.dateGen.Month,ENSOBillObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENSOBillObj.sumTotal <> nil ) then
       edtSumTotal.Text := ENSOBillObj.sumTotal.decimalString
    else
       edtSumTotal.Text := ''; 



    if ( ENSOBillObj.sumGen <> nil ) then
       edtSumGen.Text := ENSOBillObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    if ( ENSOBillObj.sumVat <> nil ) then
       edtSumVat.Text := ENSOBillObj.sumVat.decimalString
    else
       edtSumVat.Text := ''; 



    edtUserGen.Text := ENSOBillObj.userGen; 



      if ENSOBillObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSOBillObj.dateEdit.Year,ENSOBillObj.dateEdit.Month,ENSOBillObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENSOBillFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENSOBill: ENSOBillControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if ENSOBillFilterObj.dateGen = nil then
          ENSOBillFilterObj.dateGen := TXSDate.Create;
       ENSOBillFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENSOBillFilterObj.dateGen := nil;



     if (ENSOBillFilterObj.sumTotal = nil ) then
       ENSOBillFilterObj.sumTotal := TXSDecimal.Create;
     if edtSumTotal.Text <> '' then
       ENSOBillFilterObj.sumTotal.decimalString := edtSumTotal.Text 
     else
       ENSOBillFilterObj.sumTotal := nil;




     if (ENSOBillFilterObj.sumGen = nil ) then
       ENSOBillFilterObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENSOBillFilterObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENSOBillFilterObj.sumGen := nil;




     if (ENSOBillFilterObj.sumVat = nil ) then
       ENSOBillFilterObj.sumVat := TXSDecimal.Create;
     if edtSumVat.Text <> '' then
       ENSOBillFilterObj.sumVat.decimalString := edtSumVat.Text 
     else
       ENSOBillFilterObj.sumVat := nil;




     ENSOBillFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSOBillFilterObj.dateEdit = nil then
          ENSOBillFilterObj.dateEdit := TXSDateTime.Create;
       ENSOBillFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSOBillFilterObj.dateEdit := nil;




  end;
end;




end.