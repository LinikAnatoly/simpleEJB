
unit EditENRegForSupplierItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierItemController ;

type
  TfrmENRegForSupplierItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblRecordpointEic : TLabel;
    edtRecordpointEic: TEdit;
    lblCustomerUid : TLabel;
    edtCustomerUid: TEdit;
    lblDatePlanned : TLabel;
    edtDatePlanned: TDateTimePicker;
    lblDateComplete : TLabel;
    edtDateComplete: TDateTimePicker;
    lblDescription : TLabel;
    edtDescription: TEdit;
    lblCalcNumber : TLabel;
    edtCalcNumber: TEdit;
    lblCalcName : TLabel;
    edtCalcName: TMemo;
    lblCostWithoutVAT : TLabel;
    edtCostWithoutVAT: TEdit;
    lblCostVAT : TLabel;
    edtCostVAT: TEdit;
    lblCostWithVAT : TLabel;
    edtCostWithVAT: TEdit;
    lblDhDisconnectionCode : TLabel;
    edtDhDisconnectionCode: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserAdd : TLabel;
    edtUserAdd: TEdit;
    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENRegForSupplierItem: THTTPRIO;

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
  frmENRegForSupplierItemEdit: TfrmENRegForSupplierItemEdit;
  ENRegForSupplierItemObj: ENRegForSupplierItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierItemController  ;
}
{$R *.dfm}



procedure TfrmENRegForSupplierItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtRecordpointEic
      ,edtDatePlanned
      ,edtDateComplete
      ,edtCalcNumber
      ,edtCalcName
      ,edtCostWithoutVAT
      ,edtCostVAT
      ,edtCostWithVAT
      ,edtDhDisconnectionCode
      ,edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENRegForSupplierItemObj.code);
    edtRecordpointEic.Text := ENRegForSupplierItemObj.recordpointEic; 
    edtCustomerUid.Text := ENRegForSupplierItemObj.customerUid; 
      SetDateFieldForDateTimePicker(edtDatePlanned, ENRegForSupplierItemObj.datePlanned);
      SetDateFieldForDateTimePicker(edtDateComplete, ENRegForSupplierItemObj.dateComplete);
    edtDescription.Text := ENRegForSupplierItemObj.description; 
    edtCalcNumber.Text := ENRegForSupplierItemObj.calcNumber; 
    MakeMultiline(edtCalcName.Lines, ENRegForSupplierItemObj.calcName);
    if ( ENRegForSupplierItemObj.costWithoutVAT <> nil ) then
       edtCostWithoutVAT.Text := ENRegForSupplierItemObj.costWithoutVAT.decimalString
    else
       edtCostWithoutVAT.Text := '';
    if ( ENRegForSupplierItemObj.costVAT <> nil ) then
       edtCostVAT.Text := ENRegForSupplierItemObj.costVAT.decimalString
    else
       edtCostVAT.Text := '';
    if ( ENRegForSupplierItemObj.costWithVAT <> nil ) then
       edtCostWithVAT.Text := ENRegForSupplierItemObj.costWithVAT.decimalString
    else
       edtCostWithVAT.Text := '';
    if ( ENRegForSupplierItemObj.dhDisconnectionCode <> Low(Integer) ) then
       edtDhDisconnectionCode.Text := IntToStr(ENRegForSupplierItemObj.dhDisconnectionCode)
    else
       edtDhDisconnectionCode.Text := '';
    MakeMultiline(edtCommentGen.Lines, ENRegForSupplierItemObj.commentGen);
    edtUserAdd.Text := ENRegForSupplierItemObj.userAdd; 
      SetDateFieldForDateTimePicker(edtDateAdd, ENRegForSupplierItemObj.dateAdd);
    edtUserGen.Text := ENRegForSupplierItemObj.userGen; 
      SetDateFieldForDateTimePicker(edtDateEdit, ENRegForSupplierItemObj.dateEdit);


  end;
end;



procedure TfrmENRegForSupplierItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtRecordpointEic
      ,edtCalcNumber
      ,edtCalcName
      ,edtCostWithoutVAT
      ,edtCostVAT
      ,edtCostWithVAT
      ,edtDhDisconnectionCode
      ,edtUserAdd
      ,edtUserGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENRegForSupplierItem := HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;


     ENRegForSupplierItemObj.recordpointEic := edtRecordpointEic.Text; 

     ENRegForSupplierItemObj.customerUid := edtCustomerUid.Text; 

     ENRegForSupplierItemObj.datePlanned := GetTXSDateFromTDateTimePicker(edtdatePlanned);

     ENRegForSupplierItemObj.dateComplete := GetTXSDateFromTDateTimePicker(edtdateComplete);

     ENRegForSupplierItemObj.description := edtDescription.Text; 

     ENRegForSupplierItemObj.calcNumber := edtCalcNumber.Text; 

     ENRegForSupplierItemObj.calcName := edtCalcName.Text; 

     if (ENRegForSupplierItemObj.costWithoutVAT = nil ) then
       ENRegForSupplierItemObj.costWithoutVAT := TXSDecimal.Create;
     if edtCostWithoutVAT.Text <> '' then
       ENRegForSupplierItemObj.costWithoutVAT.decimalString := edtCostWithoutVAT.Text 
     else
       ENRegForSupplierItemObj.costWithoutVAT := nil;

     if (ENRegForSupplierItemObj.costVAT = nil ) then
       ENRegForSupplierItemObj.costVAT := TXSDecimal.Create;
     if edtCostVAT.Text <> '' then
       ENRegForSupplierItemObj.costVAT.decimalString := edtCostVAT.Text 
     else
       ENRegForSupplierItemObj.costVAT := nil;

     if (ENRegForSupplierItemObj.costWithVAT = nil ) then
       ENRegForSupplierItemObj.costWithVAT := TXSDecimal.Create;
     if edtCostWithVAT.Text <> '' then
       ENRegForSupplierItemObj.costWithVAT.decimalString := edtCostWithVAT.Text 
     else
       ENRegForSupplierItemObj.costWithVAT := nil;

     if ( edtDhDisconnectionCode.Text <> '' ) then
       ENRegForSupplierItemObj.dhDisconnectionCode := StrToInt(edtDhDisconnectionCode.Text)
     else
       ENRegForSupplierItemObj.dhDisconnectionCode := Low(Integer) ;

     ENRegForSupplierItemObj.commentGen := edtCommentGen.Text; 

     ENRegForSupplierItemObj.userAdd := edtUserAdd.Text; 

     ENRegForSupplierItemObj.dateAdd := GetTXSDateTimeFromTDateTimePicker(edtdateAdd);	   

     ENRegForSupplierItemObj.userGen := edtUserGen.Text; 

     ENRegForSupplierItemObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);	   

    if DialogState = dsInsert then
    begin
      ENRegForSupplierItemObj.code:=low(Integer);
      TempENRegForSupplierItem.add(ENRegForSupplierItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRegForSupplierItem.save(ENRegForSupplierItemObj);
    end;
  end;
end;


end.