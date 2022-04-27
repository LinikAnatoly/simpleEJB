
unit EditENPayment2SOFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPayment2SOController ;

type
  TfrmENPayment2SOFilterEdit = class(TDialogForm)

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


  HTTPRIOENPayment2SO: THTTPRIO;

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
  frmENPayment2SOFilterEdit: TfrmENPayment2SOFilterEdit;
  ENPayment2SOFilterObj: ENPayment2SOFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPayment2SOController  ;
}
{$R *.dfm}



procedure TfrmENPayment2SOFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENPayment2SOObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPayment2SOObj.dateGen.Year,ENPayment2SOObj.dateGen.Month,ENPayment2SOObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENPayment2SOObj.sumTotal <> nil ) then
       edtSumTotal.Text := ENPayment2SOObj.sumTotal.decimalString
    else
       edtSumTotal.Text := ''; 



    if ( ENPayment2SOObj.sumGen <> nil ) then
       edtSumGen.Text := ENPayment2SOObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    if ( ENPayment2SOObj.sumVat <> nil ) then
       edtSumVat.Text := ENPayment2SOObj.sumVat.decimalString
    else
       edtSumVat.Text := ''; 



    edtUserGen.Text := ENPayment2SOObj.userGen; 



      if ENPayment2SOObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPayment2SOObj.dateEdit.Year,ENPayment2SOObj.dateEdit.Month,ENPayment2SOObj.dateEdit.Day);
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



procedure TfrmENPayment2SOFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENPayment2SO: ENPayment2SOControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if ENPayment2SOFilterObj.dateGen = nil then
          ENPayment2SOFilterObj.dateGen := TXSDate.Create;
       ENPayment2SOFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENPayment2SOFilterObj.dateGen := nil;



     if (ENPayment2SOFilterObj.sumTotal = nil ) then
       ENPayment2SOFilterObj.sumTotal := TXSDecimal.Create;
     if edtSumTotal.Text <> '' then
       ENPayment2SOFilterObj.sumTotal.decimalString := edtSumTotal.Text 
     else
       ENPayment2SOFilterObj.sumTotal := nil;




     if (ENPayment2SOFilterObj.sumGen = nil ) then
       ENPayment2SOFilterObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENPayment2SOFilterObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENPayment2SOFilterObj.sumGen := nil;




     if (ENPayment2SOFilterObj.sumVat = nil ) then
       ENPayment2SOFilterObj.sumVat := TXSDecimal.Create;
     if edtSumVat.Text <> '' then
       ENPayment2SOFilterObj.sumVat.decimalString := edtSumVat.Text 
     else
       ENPayment2SOFilterObj.sumVat := nil;




     ENPayment2SOFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENPayment2SOFilterObj.dateEdit = nil then
          ENPayment2SOFilterObj.dateEdit := TXSDateTime.Create;
       ENPayment2SOFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPayment2SOFilterObj.dateEdit := nil;




  end;
end;




end.