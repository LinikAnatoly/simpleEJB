
unit EditSCInvoiceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCInvoiceController ;

type
  TfrmSCInvoiceFilterEdit = class(TDialogForm)

    lblSubAccountCode : TLabel;
    edtSubAccountCode: TEdit;

    lblMolCode : TLabel;
    edtMolCode: TEdit;

    lblPodrCode : TLabel;
    edtPodrCode: TEdit;

    lblSourceCode : TLabel;
    edtSourceCode: TEdit;

    lblCostCode : TLabel;
    edtCostCode: TEdit;

    lblCounterType : TLabel;
    edtCounterType: TEdit;

    lblCharacters : TLabel;
    edtCharacters: TMemo;

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;

    lblDateDoc : TLabel;
    edtDateDoc: TDateTimePicker;
    lblNumberTax : TLabel;
    edtNumberTax: TEdit;

    lblDateBuh : TLabel;
    edtDateBuh: TDateTimePicker;
    lblSupplierCode : TLabel;
    edtSupplierCode: TEdit;

    lblContractCode : TLabel;
    edtContractCode: TEdit;

    lblSumWithNds : TLabel;
    edtSumWithNds: TEdit;

    lblSumNds : TLabel;
    edtSumNds: TEdit;

    lblSumGen : TLabel;
    edtSumGen: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblScCode : TLabel;
    edtScCode: TEdit;



  HTTPRIOSCInvoice: THTTPRIO;

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
  frmSCInvoiceFilterEdit: TfrmSCInvoiceFilterEdit;
  SCInvoiceFilterObj: SCInvoiceFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCInvoiceController  ;
}
{$R *.dfm}



procedure TfrmSCInvoiceFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSubAccountCode
      ,edtMolCode
      ,edtPodrCode
      ,edtSourceCode
      ,edtNumberDoc
      ,edtDateDoc
      ,edtDateBuh
      ,edtSupplierCode
      ,edtContractCode
      ,edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtSubAccountCode.Text := SCInvoiceObj.subAccountCode; 



    edtMolCode.Text := SCInvoiceObj.molCode; 



    edtPodrCode.Text := SCInvoiceObj.podrCode; 



    edtSourceCode.Text := SCInvoiceObj.sourceCode; 



    edtCostCode.Text := SCInvoiceObj.costCode; 



    edtCounterType.Text := SCInvoiceObj.counterType; 



    MakeMultiline(edtCharacters.Lines, SCInvoiceObj.characters);



    edtNumberDoc.Text := SCInvoiceObj.numberDoc; 



      if SCInvoiceObj.dateDoc <> nil then
      begin
        edtDateDoc.DateTime:=EncodeDate(SCInvoiceObj.dateDoc.Year,SCInvoiceObj.dateDoc.Month,SCInvoiceObj.dateDoc.Day);
        edtDateDoc.checked := true;
      end
      else
      begin
        edtDateDoc.DateTime:=SysUtils.Date;
        edtDateDoc.checked := false;
      end;



    edtNumberTax.Text := SCInvoiceObj.numberTax; 



      if SCInvoiceObj.dateBuh <> nil then
      begin
        edtDateBuh.DateTime:=EncodeDate(SCInvoiceObj.dateBuh.Year,SCInvoiceObj.dateBuh.Month,SCInvoiceObj.dateBuh.Day);
        edtDateBuh.checked := true;
      end
      else
      begin
        edtDateBuh.DateTime:=SysUtils.Date;
        edtDateBuh.checked := false;
      end;



    edtSupplierCode.Text := SCInvoiceObj.supplierCode; 



    edtContractCode.Text := SCInvoiceObj.contractCode; 



    if ( SCInvoiceObj.sumWithNds <> nil ) then
       edtSumWithNds.Text := SCInvoiceObj.sumWithNds.decimalString
    else
       edtSumWithNds.Text := ''; 



    if ( SCInvoiceObj.sumNds <> nil ) then
       edtSumNds.Text := SCInvoiceObj.sumNds.decimalString
    else
       edtSumNds.Text := ''; 



    if ( SCInvoiceObj.sumGen <> nil ) then
       edtSumGen.Text := SCInvoiceObj.sumGen.decimalString
    else
       edtSumGen.Text := ''; 



    if ( SCInvoiceObj.countGen <> Low(Integer) ) then
       edtCountGen.Text := IntToStr(SCInvoiceObj.countGen)
    else
       edtCountGen.Text := '';



    if ( SCInvoiceObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCInvoiceObj.scCode)
    else
       edtScCode.Text := '';


  end;

}

end;



procedure TfrmSCInvoiceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCInvoice: SCInvoiceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCInvoiceFilterObj.subAccountCode := edtSubAccountCode.Text; 



     SCInvoiceFilterObj.molCode := edtMolCode.Text; 



     SCInvoiceFilterObj.podrCode := edtPodrCode.Text; 



     SCInvoiceFilterObj.sourceCode := edtSourceCode.Text; 



     SCInvoiceFilterObj.costCode := edtCostCode.Text; 



     SCInvoiceFilterObj.counterType := edtCounterType.Text; 



     SCInvoiceFilterObj.characters := edtCharacters.Text; 



     SCInvoiceFilterObj.numberDoc := edtNumberDoc.Text; 



     if edtdateDoc.checked then
     begin 
       if SCInvoiceFilterObj.dateDoc = nil then
          SCInvoiceFilterObj.dateDoc := TXSDate.Create;
       SCInvoiceFilterObj.dateDoc.XSToNative(GetXSDate(edtdateDoc.DateTime));
     end
     else
       SCInvoiceFilterObj.dateDoc := nil;



     SCInvoiceFilterObj.numberTax := edtNumberTax.Text; 



     if edtdateBuh.checked then
     begin 
       if SCInvoiceFilterObj.dateBuh = nil then
          SCInvoiceFilterObj.dateBuh := TXSDate.Create;
       SCInvoiceFilterObj.dateBuh.XSToNative(GetXSDate(edtdateBuh.DateTime));
     end
     else
       SCInvoiceFilterObj.dateBuh := nil;



     SCInvoiceFilterObj.supplierCode := edtSupplierCode.Text; 



     SCInvoiceFilterObj.contractCode := edtContractCode.Text; 



     if (SCInvoiceFilterObj.sumWithNds = nil ) then
       SCInvoiceFilterObj.sumWithNds := TXSDecimal.Create;
     if edtSumWithNds.Text <> '' then
       SCInvoiceFilterObj.sumWithNds.decimalString := edtSumWithNds.Text 
     else
       SCInvoiceFilterObj.sumWithNds := nil;




     if (SCInvoiceFilterObj.sumNds = nil ) then
       SCInvoiceFilterObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       SCInvoiceFilterObj.sumNds.decimalString := edtSumNds.Text 
     else
       SCInvoiceFilterObj.sumNds := nil;




     if (SCInvoiceFilterObj.sumGen = nil ) then
       SCInvoiceFilterObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       SCInvoiceFilterObj.sumGen.decimalString := edtSumGen.Text 
     else
       SCInvoiceFilterObj.sumGen := nil;




     if ( edtCountGen.Text <> '' ) then
       SCInvoiceFilterObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCInvoiceFilterObj.countGen := Low(Integer) ;




     if ( edtScCode.Text <> '' ) then
       SCInvoiceFilterObj.scCode := StrToInt(edtScCode.Text)
     else
       SCInvoiceFilterObj.scCode := Low(Integer) ;





  end;
end;




end.