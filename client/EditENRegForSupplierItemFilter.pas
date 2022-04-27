
unit EditENRegForSupplierItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierItemController ;

type
  TfrmENRegForSupplierItemFilterEdit = class(TDialogForm)

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
  frmENRegForSupplierItemFilterEdit: TfrmENRegForSupplierItemFilterEdit;
  ENRegForSupplierItemFilterObj: ENRegForSupplierItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierItemController  ;
}
{$R *.dfm}



procedure TfrmENRegForSupplierItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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

    edtRecordpointEic.Text := ENRegForSupplierItemObj.recordpointEic; 



    edtCustomerUid.Text := ENRegForSupplierItemObj.customerUid; 



      if ENRegForSupplierItemObj.datePlanned <> nil then
      begin
        edtDatePlanned.DateTime:=EncodeDate(ENRegForSupplierItemObj.datePlanned.Year,ENRegForSupplierItemObj.datePlanned.Month,ENRegForSupplierItemObj.datePlanned.Day);
        edtDatePlanned.checked := true;
      end
      else
      begin
        edtDatePlanned.DateTime:=SysUtils.Date;
        edtDatePlanned.checked := false;
      end;



      if ENRegForSupplierItemObj.dateComplete <> nil then
      begin
        edtDateComplete.DateTime:=EncodeDate(ENRegForSupplierItemObj.dateComplete.Year,ENRegForSupplierItemObj.dateComplete.Month,ENRegForSupplierItemObj.dateComplete.Day);
        edtDateComplete.checked := true;
      end
      else
      begin
        edtDateComplete.DateTime:=SysUtils.Date;
        edtDateComplete.checked := false;
      end;



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



      if ENRegForSupplierItemObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENRegForSupplierItemObj.dateAdd.Year,ENRegForSupplierItemObj.dateAdd.Month,ENRegForSupplierItemObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENRegForSupplierItemObj.userGen; 



      if ENRegForSupplierItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENRegForSupplierItemObj.dateEdit.Year,ENRegForSupplierItemObj.dateEdit.Month,ENRegForSupplierItemObj.dateEdit.Day);
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



procedure TfrmENRegForSupplierItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRegForSupplierItemFilterObj.recordpointEic := edtRecordpointEic.Text; 



     ENRegForSupplierItemFilterObj.customerUid := edtCustomerUid.Text; 



     if edtdatePlanned.checked then
     begin 
       if ENRegForSupplierItemFilterObj.datePlanned = nil then
          ENRegForSupplierItemFilterObj.datePlanned := TXSDate.Create;
       ENRegForSupplierItemFilterObj.datePlanned.XSToNative(GetXSDate(edtdatePlanned.DateTime));
     end
     else
       ENRegForSupplierItemFilterObj.datePlanned := nil;



     if edtdateComplete.checked then
     begin 
       if ENRegForSupplierItemFilterObj.dateComplete = nil then
          ENRegForSupplierItemFilterObj.dateComplete := TXSDate.Create;
       ENRegForSupplierItemFilterObj.dateComplete.XSToNative(GetXSDate(edtdateComplete.DateTime));
     end
     else
       ENRegForSupplierItemFilterObj.dateComplete := nil;



     ENRegForSupplierItemFilterObj.description := edtDescription.Text; 



     ENRegForSupplierItemFilterObj.calcNumber := edtCalcNumber.Text; 



     ENRegForSupplierItemFilterObj.calcName := edtCalcName.Text; 



     if (ENRegForSupplierItemFilterObj.costWithoutVAT = nil ) then
       ENRegForSupplierItemFilterObj.costWithoutVAT := TXSDecimal.Create;
     if edtCostWithoutVAT.Text <> '' then
       ENRegForSupplierItemFilterObj.costWithoutVAT.decimalString := edtCostWithoutVAT.Text 
     else
       ENRegForSupplierItemFilterObj.costWithoutVAT := nil;




     if (ENRegForSupplierItemFilterObj.costVAT = nil ) then
       ENRegForSupplierItemFilterObj.costVAT := TXSDecimal.Create;
     if edtCostVAT.Text <> '' then
       ENRegForSupplierItemFilterObj.costVAT.decimalString := edtCostVAT.Text 
     else
       ENRegForSupplierItemFilterObj.costVAT := nil;




     if (ENRegForSupplierItemFilterObj.costWithVAT = nil ) then
       ENRegForSupplierItemFilterObj.costWithVAT := TXSDecimal.Create;
     if edtCostWithVAT.Text <> '' then
       ENRegForSupplierItemFilterObj.costWithVAT.decimalString := edtCostWithVAT.Text 
     else
       ENRegForSupplierItemFilterObj.costWithVAT := nil;




     if ( edtDhDisconnectionCode.Text <> '' ) then
       ENRegForSupplierItemFilterObj.dhDisconnectionCode := StrToInt(edtDhDisconnectionCode.Text)
     else
       ENRegForSupplierItemFilterObj.dhDisconnectionCode := Low(Integer) ;
	   



     ENRegForSupplierItemFilterObj.commentGen := edtCommentGen.Text; 



     ENRegForSupplierItemFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENRegForSupplierItemFilterObj.dateAdd = nil then
          ENRegForSupplierItemFilterObj.dateAdd := TXSDateTime.Create;
       ENRegForSupplierItemFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENRegForSupplierItemFilterObj.dateAdd := nil;



     ENRegForSupplierItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENRegForSupplierItemFilterObj.dateEdit = nil then
          ENRegForSupplierItemFilterObj.dateEdit := TXSDateTime.Create;
       ENRegForSupplierItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENRegForSupplierItemFilterObj.dateEdit := nil;




  end;
end;




end.