
unit EditRQPlanPayItemFirst;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayItemFirstController ;

type
  TfrmRQPlanPayItemFirstEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDdscode : TLabel;
    edtDdscode: TEdit;
    lblProject : TLabel;
    edtProject: TEdit;
    lblNumberdoc : TLabel;
    edtNumberdoc: TEdit;
    lblOrderdate : TLabel;
    edtOrderdate: TDateTimePicker;
    lblStatussymbol : TLabel;
    edtStatussymbol: TEdit;
    lblMname : TLabel;
    edtMname: TMemo;
    lblContract : TLabel;
    edtContract: TMemo;
    lblOrgokpo : TLabel;
    edtOrgokpo: TEdit;
    lblOrg : TLabel;
    edtOrg: TMemo;
    lblMeas : TLabel;
    edtMeas: TMemo;
    lblCountfact : TLabel;
    edtCountfact: TEdit;
    lblPricewithnds : TLabel;
    edtPricewithnds: TEdit;
    lblSumma : TLabel;
    edtSumma: TEdit;
    lblPostavka_date : TLabel;
    edtPostavka_date: TDateTimePicker;
    lblDeliverytime : TLabel;
    edtDeliverytime: TEdit;
    lblBillitemcodes : TLabel;
    edtBillitemcodes: TMemo;
    lblMin_postavka_date : TLabel;
    edtMin_postavka_date: TDateTimePicker;
    lblPlaneddatepays : TLabel;
    edtPlaneddatepays: TDateTimePicker;
    lblPaymenttypename : TLabel;
    edtPaymenttypename: TEdit;
    lblPaymentvalue : TLabel;
    edtPaymentvalue: TEdit;
    lblPlansumpay : TLabel;
    edtPlansumpay: TEdit;
    lblReestr_date : TLabel;
    edtReestr_date: TDateTimePicker;
    lblPaymenttypename_initial : TLabel;
    edtPaymenttypename_initial: TEdit;
    lblPaymentvalue_initial : TLabel;
    edtPaymentvalue_initial: TEdit;
    lblBudgetrefname : TLabel;
    edtBudgetrefname: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQPlanPayItemFirst: THTTPRIO;

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
  frmRQPlanPayItemFirstEdit: TfrmRQPlanPayItemFirstEdit;
  RQPlanPayItemFirstObj: RQPlanPayItemFirst;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayItemFirstController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayItemFirstEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPlanPayItemFirstObj.code);
    edtDdscode.Text := RQPlanPayItemFirstObj.ddscode; 
    edtProject.Text := RQPlanPayItemFirstObj.project; 
    edtNumberdoc.Text := RQPlanPayItemFirstObj.numberdoc; 
      if RQPlanPayItemFirstObj.orderdate <> nil then
      begin
        edtOrderdate.DateTime:=EncodeDate(RQPlanPayItemFirstObj.orderdate.Year,RQPlanPayItemFirstObj.orderdate.Month,RQPlanPayItemFirstObj.orderdate.Day);
        edtOrderdate.checked := true;
      end
      else
      begin
        edtOrderdate.DateTime:=SysUtils.Date;
        edtOrderdate.checked := false;
      end;
    edtStatussymbol.Text := RQPlanPayItemFirstObj.statussymbol; 
    MakeMultiline(edtMname.Lines, RQPlanPayItemFirstObj.mname);
    MakeMultiline(edtContract.Lines, RQPlanPayItemFirstObj.contract);
    edtOrgokpo.Text := RQPlanPayItemFirstObj.orgokpo; 
    MakeMultiline(edtOrg.Lines, RQPlanPayItemFirstObj.org);
    MakeMultiline(edtMeas.Lines, RQPlanPayItemFirstObj.meas);
    if ( RQPlanPayItemFirstObj.countfact <> nil ) then
       edtCountfact.Text := RQPlanPayItemFirstObj.countfact.decimalString
    else
       edtCountfact.Text := ''; 
    if ( RQPlanPayItemFirstObj.pricewithnds <> nil ) then
       edtPricewithnds.Text := RQPlanPayItemFirstObj.pricewithnds.decimalString
    else
       edtPricewithnds.Text := ''; 
    if ( RQPlanPayItemFirstObj.summa <> nil ) then
       edtSumma.Text := RQPlanPayItemFirstObj.summa.decimalString
    else
       edtSumma.Text := ''; 
      if RQPlanPayItemFirstObj.postavka_date <> nil then
      begin
        edtPostavka_date.DateTime:=EncodeDate(RQPlanPayItemFirstObj.postavka_date.Year,RQPlanPayItemFirstObj.postavka_date.Month,RQPlanPayItemFirstObj.postavka_date.Day);
        edtPostavka_date.checked := true;
      end
      else
      begin
        edtPostavka_date.DateTime:=SysUtils.Date;
        edtPostavka_date.checked := false;
      end;
    if ( RQPlanPayItemFirstObj.deliverytime <> Low(Integer) ) then
       edtDeliverytime.Text := IntToStr(RQPlanPayItemFirstObj.deliverytime)
    else
       edtDeliverytime.Text := '';
    MakeMultiline(edtBillitemcodes.Lines, RQPlanPayItemFirstObj.billitemcodes);
      if RQPlanPayItemFirstObj.min_postavka_date <> nil then
      begin
        edtMin_postavka_date.DateTime:=EncodeDate(RQPlanPayItemFirstObj.min_postavka_date.Year,RQPlanPayItemFirstObj.min_postavka_date.Month,RQPlanPayItemFirstObj.min_postavka_date.Day);
        edtMin_postavka_date.checked := true;
      end
      else
      begin
        edtMin_postavka_date.DateTime:=SysUtils.Date;
        edtMin_postavka_date.checked := false;
      end;
      if RQPlanPayItemFirstObj.planeddatepays <> nil then
      begin
        edtPlaneddatepays.DateTime:=EncodeDate(RQPlanPayItemFirstObj.planeddatepays.Year,RQPlanPayItemFirstObj.planeddatepays.Month,RQPlanPayItemFirstObj.planeddatepays.Day);
        edtPlaneddatepays.checked := true;
      end
      else
      begin
        edtPlaneddatepays.DateTime:=SysUtils.Date;
        edtPlaneddatepays.checked := false;
      end;
    edtPaymenttypename.Text := RQPlanPayItemFirstObj.paymenttypename; 
    if ( RQPlanPayItemFirstObj.paymentvalue <> Low(Integer) ) then
       edtPaymentvalue.Text := IntToStr(RQPlanPayItemFirstObj.paymentvalue)
    else
       edtPaymentvalue.Text := '';
    if ( RQPlanPayItemFirstObj.plansumpay <> nil ) then
       edtPlansumpay.Text := RQPlanPayItemFirstObj.plansumpay.decimalString
    else
       edtPlansumpay.Text := ''; 
      if RQPlanPayItemFirstObj.reestr_date <> nil then
      begin
        edtReestr_date.DateTime:=EncodeDate(RQPlanPayItemFirstObj.reestr_date.Year,RQPlanPayItemFirstObj.reestr_date.Month,RQPlanPayItemFirstObj.reestr_date.Day);
        edtReestr_date.checked := true;
      end
      else
      begin
        edtReestr_date.DateTime:=SysUtils.Date;
        edtReestr_date.checked := false;
      end;
    edtPaymenttypename_initial.Text := RQPlanPayItemFirstObj.paymenttypename_initial; 
    if ( RQPlanPayItemFirstObj.paymentvalue_initial <> Low(Integer) ) then
       edtPaymentvalue_initial.Text := IntToStr(RQPlanPayItemFirstObj.paymentvalue_initial)
    else
       edtPaymentvalue_initial.Text := '';
    edtBudgetrefname.Text := RQPlanPayItemFirstObj.budgetrefname; 
    edtUserGen.Text := RQPlanPayItemFirstObj.userGen; 
      if RQPlanPayItemFirstObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQPlanPayItemFirstObj.dateEdit.Year,RQPlanPayItemFirstObj.dateEdit.Month,RQPlanPayItemFirstObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmRQPlanPayItemFirstEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtUserGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPlanPayItemFirst := HTTPRIORQPlanPayItemFirst as RQPlanPayItemFirstControllerSoapPort;


     RQPlanPayItemFirstObj.ddscode := edtDdscode.Text; 

     RQPlanPayItemFirstObj.project := edtProject.Text; 

     RQPlanPayItemFirstObj.numberdoc := edtNumberdoc.Text; 

     if edtorderdate.checked then
     begin 
       if RQPlanPayItemFirstObj.orderdate = nil then
          RQPlanPayItemFirstObj.orderdate := TXSDate.Create;
       RQPlanPayItemFirstObj.orderdate.XSToNative(GetXSDate(edtorderdate.DateTime));
     end
     else
       RQPlanPayItemFirstObj.orderdate := nil;

     RQPlanPayItemFirstObj.statussymbol := edtStatussymbol.Text; 

     RQPlanPayItemFirstObj.mname := edtMname.Text; 

     RQPlanPayItemFirstObj.contract := edtContract.Text; 

     RQPlanPayItemFirstObj.orgokpo := edtOrgokpo.Text; 

     RQPlanPayItemFirstObj.org := edtOrg.Text; 

     RQPlanPayItemFirstObj.meas := edtMeas.Text; 

     if (RQPlanPayItemFirstObj.countfact = nil ) then
       RQPlanPayItemFirstObj.countfact := TXSDecimal.Create;
     if edtCountfact.Text <> '' then
       RQPlanPayItemFirstObj.countfact.decimalString := edtCountfact.Text 
     else
       RQPlanPayItemFirstObj.countfact := nil;

     if (RQPlanPayItemFirstObj.pricewithnds = nil ) then
       RQPlanPayItemFirstObj.pricewithnds := TXSDecimal.Create;
     if edtPricewithnds.Text <> '' then
       RQPlanPayItemFirstObj.pricewithnds.decimalString := edtPricewithnds.Text 
     else
       RQPlanPayItemFirstObj.pricewithnds := nil;

     if (RQPlanPayItemFirstObj.summa = nil ) then
       RQPlanPayItemFirstObj.summa := TXSDecimal.Create;
     if edtSumma.Text <> '' then
       RQPlanPayItemFirstObj.summa.decimalString := edtSumma.Text 
     else
       RQPlanPayItemFirstObj.summa := nil;

     if edtpostavka_date.checked then
     begin 
       if RQPlanPayItemFirstObj.postavka_date = nil then
          RQPlanPayItemFirstObj.postavka_date := TXSDate.Create;
       RQPlanPayItemFirstObj.postavka_date.XSToNative(GetXSDate(edtpostavka_date.DateTime));
     end
     else
       RQPlanPayItemFirstObj.postavka_date := nil;

     if ( edtDeliverytime.Text <> '' ) then
       RQPlanPayItemFirstObj.deliverytime := StrToInt(edtDeliverytime.Text)
     else
       RQPlanPayItemFirstObj.deliverytime := Low(Integer) ;

     RQPlanPayItemFirstObj.billitemcodes := edtBillitemcodes.Text; 

     if edtmin_postavka_date.checked then
     begin 
       if RQPlanPayItemFirstObj.min_postavka_date = nil then
          RQPlanPayItemFirstObj.min_postavka_date := TXSDate.Create;
       RQPlanPayItemFirstObj.min_postavka_date.XSToNative(GetXSDate(edtmin_postavka_date.DateTime));
     end
     else
       RQPlanPayItemFirstObj.min_postavka_date := nil;

     if edtplaneddatepays.checked then
     begin 
       if RQPlanPayItemFirstObj.planeddatepays = nil then
          RQPlanPayItemFirstObj.planeddatepays := TXSDate.Create;
       RQPlanPayItemFirstObj.planeddatepays.XSToNative(GetXSDate(edtplaneddatepays.DateTime));
     end
     else
       RQPlanPayItemFirstObj.planeddatepays := nil;

     RQPlanPayItemFirstObj.paymenttypename := edtPaymenttypename.Text; 

     if ( edtPaymentvalue.Text <> '' ) then
       RQPlanPayItemFirstObj.paymentvalue := StrToInt(edtPaymentvalue.Text)
     else
       RQPlanPayItemFirstObj.paymentvalue := Low(Integer) ;

     if (RQPlanPayItemFirstObj.plansumpay = nil ) then
       RQPlanPayItemFirstObj.plansumpay := TXSDecimal.Create;
     if edtPlansumpay.Text <> '' then
       RQPlanPayItemFirstObj.plansumpay.decimalString := edtPlansumpay.Text 
     else
       RQPlanPayItemFirstObj.plansumpay := nil;

     if edtreestr_date.checked then
     begin 
       if RQPlanPayItemFirstObj.reestr_date = nil then
          RQPlanPayItemFirstObj.reestr_date := TXSDate.Create;
       RQPlanPayItemFirstObj.reestr_date.XSToNative(GetXSDate(edtreestr_date.DateTime));
     end
     else
       RQPlanPayItemFirstObj.reestr_date := nil;

     RQPlanPayItemFirstObj.paymenttypename_initial := edtPaymenttypename_initial.Text; 

     if ( edtPaymentvalue_initial.Text <> '' ) then
       RQPlanPayItemFirstObj.paymentvalue_initial := StrToInt(edtPaymentvalue_initial.Text)
     else
       RQPlanPayItemFirstObj.paymentvalue_initial := Low(Integer) ;

     RQPlanPayItemFirstObj.budgetrefname := edtBudgetrefname.Text; 

     RQPlanPayItemFirstObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if RQPlanPayItemFirstObj.dateEdit = nil then
          RQPlanPayItemFirstObj.dateEdit := TXSDate.Create;
       RQPlanPayItemFirstObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQPlanPayItemFirstObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      RQPlanPayItemFirstObj.code:=low(Integer);
      TempRQPlanPayItemFirst.add(RQPlanPayItemFirstObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPlanPayItemFirst.save(RQPlanPayItemFirstObj);
    end;
  end;
end;


end.