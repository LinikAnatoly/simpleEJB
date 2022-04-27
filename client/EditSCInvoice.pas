
unit EditSCInvoice;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCInvoiceController ;

type
  TfrmSCInvoiceEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
  frmSCInvoiceEdit: TfrmSCInvoiceEdit;
  SCInvoiceObj: SCInvoice;

implementation


{uses  
    EnergyproController, EnergyproController2, SCInvoiceController  ;
}
{$R *.dfm}



procedure TfrmSCInvoiceEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

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
      edtCode.Text := IntToStr(SCInvoiceObj.code);
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
end;



procedure TfrmSCInvoiceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCInvoice: SCInvoiceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSubAccountCode
      ,edtMolCode
      ,edtPodrCode
      ,edtSourceCode
      ,edtNumberDoc
      ,edtSupplierCode
      ,edtContractCode
      ,edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;


     SCInvoiceObj.subAccountCode := edtSubAccountCode.Text; 

     SCInvoiceObj.molCode := edtMolCode.Text; 

     SCInvoiceObj.podrCode := edtPodrCode.Text; 

     SCInvoiceObj.sourceCode := edtSourceCode.Text; 

     SCInvoiceObj.costCode := edtCostCode.Text; 

     SCInvoiceObj.counterType := edtCounterType.Text; 

     SCInvoiceObj.characters := edtCharacters.Text; 

     SCInvoiceObj.numberDoc := edtNumberDoc.Text; 

     if edtdateDoc.checked then
     begin 
       if SCInvoiceObj.dateDoc = nil then
          SCInvoiceObj.dateDoc := TXSDate.Create;
       SCInvoiceObj.dateDoc.XSToNative(GetXSDate(edtdateDoc.DateTime));
     end
     else
       SCInvoiceObj.dateDoc := nil;

     SCInvoiceObj.numberTax := edtNumberTax.Text; 

     if edtdateBuh.checked then
     begin 
       if SCInvoiceObj.dateBuh = nil then
          SCInvoiceObj.dateBuh := TXSDate.Create;
       SCInvoiceObj.dateBuh.XSToNative(GetXSDate(edtdateBuh.DateTime));
     end
     else
       SCInvoiceObj.dateBuh := nil;

     SCInvoiceObj.supplierCode := edtSupplierCode.Text; 

     SCInvoiceObj.contractCode := edtContractCode.Text; 

     if (SCInvoiceObj.sumWithNds = nil ) then
       SCInvoiceObj.sumWithNds := TXSDecimal.Create;
     if edtSumWithNds.Text <> '' then
       SCInvoiceObj.sumWithNds.decimalString := edtSumWithNds.Text 
     else
       SCInvoiceObj.sumWithNds := nil;

     if (SCInvoiceObj.sumNds = nil ) then
       SCInvoiceObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       SCInvoiceObj.sumNds.decimalString := edtSumNds.Text 
     else
       SCInvoiceObj.sumNds := nil;

     if (SCInvoiceObj.sumGen = nil ) then
       SCInvoiceObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       SCInvoiceObj.sumGen.decimalString := edtSumGen.Text 
     else
       SCInvoiceObj.sumGen := nil;

     if ( edtCountGen.Text <> '' ) then
       SCInvoiceObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCInvoiceObj.countGen := Low(Integer) ;

     if ( edtScCode.Text <> '' ) then
       SCInvoiceObj.scCode := StrToInt(edtScCode.Text)
     else
       SCInvoiceObj.scCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      SCInvoiceObj.code:=low(Integer);
      TempSCInvoice.add(SCInvoiceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCInvoice.save(SCInvoiceObj);
    end;
  end;
end;


end.