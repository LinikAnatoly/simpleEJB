
unit EditRQPlanPayItemFirstFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayItemFirstController ;

type
  TfrmRQPlanPayItemFirstFilterEdit = class(TDialogForm)

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
  frmRQPlanPayItemFirstFilterEdit: TfrmRQPlanPayItemFirstFilterEdit;
  RQPlanPayItemFirstFilterObj: RQPlanPayItemFirstFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayItemFirstController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayItemFirstFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

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

}

end;



procedure TfrmRQPlanPayItemFirstFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPlanPayItemFirstFilterObj.ddscode := edtDdscode.Text; 



     RQPlanPayItemFirstFilterObj.project := edtProject.Text; 



     RQPlanPayItemFirstFilterObj.numberdoc := edtNumberdoc.Text; 



     if edtorderdate.checked then
     begin 
       if RQPlanPayItemFirstFilterObj.orderdate = nil then
          RQPlanPayItemFirstFilterObj.orderdate := TXSDate.Create;
       RQPlanPayItemFirstFilterObj.orderdate.XSToNative(GetXSDate(edtorderdate.DateTime));
     end
     else
       RQPlanPayItemFirstFilterObj.orderdate := nil;



     RQPlanPayItemFirstFilterObj.statussymbol := edtStatussymbol.Text; 



     RQPlanPayItemFirstFilterObj.mname := edtMname.Text; 



     RQPlanPayItemFirstFilterObj.contract := edtContract.Text; 



     RQPlanPayItemFirstFilterObj.orgokpo := edtOrgokpo.Text; 



     RQPlanPayItemFirstFilterObj.org := edtOrg.Text; 



     RQPlanPayItemFirstFilterObj.meas := edtMeas.Text; 



     if (RQPlanPayItemFirstFilterObj.countfact = nil ) then
       RQPlanPayItemFirstFilterObj.countfact := TXSDecimal.Create;
     if edtCountfact.Text <> '' then
       RQPlanPayItemFirstFilterObj.countfact.decimalString := edtCountfact.Text 
     else
       RQPlanPayItemFirstFilterObj.countfact := nil;




     if (RQPlanPayItemFirstFilterObj.pricewithnds = nil ) then
       RQPlanPayItemFirstFilterObj.pricewithnds := TXSDecimal.Create;
     if edtPricewithnds.Text <> '' then
       RQPlanPayItemFirstFilterObj.pricewithnds.decimalString := edtPricewithnds.Text 
     else
       RQPlanPayItemFirstFilterObj.pricewithnds := nil;




     if (RQPlanPayItemFirstFilterObj.summa = nil ) then
       RQPlanPayItemFirstFilterObj.summa := TXSDecimal.Create;
     if edtSumma.Text <> '' then
       RQPlanPayItemFirstFilterObj.summa.decimalString := edtSumma.Text 
     else
       RQPlanPayItemFirstFilterObj.summa := nil;




     if edtpostavka_date.checked then
     begin 
       if RQPlanPayItemFirstFilterObj.postavka_date = nil then
          RQPlanPayItemFirstFilterObj.postavka_date := TXSDate.Create;
       RQPlanPayItemFirstFilterObj.postavka_date.XSToNative(GetXSDate(edtpostavka_date.DateTime));
     end
     else
       RQPlanPayItemFirstFilterObj.postavka_date := nil;



     if ( edtDeliverytime.Text <> '' ) then
       RQPlanPayItemFirstFilterObj.deliverytime := StrToInt(edtDeliverytime.Text)
     else
       RQPlanPayItemFirstFilterObj.deliverytime := Low(Integer) ;




     RQPlanPayItemFirstFilterObj.billitemcodes := edtBillitemcodes.Text; 



     if edtmin_postavka_date.checked then
     begin 
       if RQPlanPayItemFirstFilterObj.min_postavka_date = nil then
          RQPlanPayItemFirstFilterObj.min_postavka_date := TXSDate.Create;
       RQPlanPayItemFirstFilterObj.min_postavka_date.XSToNative(GetXSDate(edtmin_postavka_date.DateTime));
     end
     else
       RQPlanPayItemFirstFilterObj.min_postavka_date := nil;



     if edtplaneddatepays.checked then
     begin 
       if RQPlanPayItemFirstFilterObj.planeddatepays = nil then
          RQPlanPayItemFirstFilterObj.planeddatepays := TXSDate.Create;
       RQPlanPayItemFirstFilterObj.planeddatepays.XSToNative(GetXSDate(edtplaneddatepays.DateTime));
     end
     else
       RQPlanPayItemFirstFilterObj.planeddatepays := nil;



     RQPlanPayItemFirstFilterObj.paymenttypename := edtPaymenttypename.Text; 



     if ( edtPaymentvalue.Text <> '' ) then
       RQPlanPayItemFirstFilterObj.paymentvalue := StrToInt(edtPaymentvalue.Text)
     else
       RQPlanPayItemFirstFilterObj.paymentvalue := Low(Integer) ;




     if (RQPlanPayItemFirstFilterObj.plansumpay = nil ) then
       RQPlanPayItemFirstFilterObj.plansumpay := TXSDecimal.Create;
     if edtPlansumpay.Text <> '' then
       RQPlanPayItemFirstFilterObj.plansumpay.decimalString := edtPlansumpay.Text 
     else
       RQPlanPayItemFirstFilterObj.plansumpay := nil;




     if edtreestr_date.checked then
     begin 
       if RQPlanPayItemFirstFilterObj.reestr_date = nil then
          RQPlanPayItemFirstFilterObj.reestr_date := TXSDate.Create;
       RQPlanPayItemFirstFilterObj.reestr_date.XSToNative(GetXSDate(edtreestr_date.DateTime));
     end
     else
       RQPlanPayItemFirstFilterObj.reestr_date := nil;



     RQPlanPayItemFirstFilterObj.paymenttypename_initial := edtPaymenttypename_initial.Text; 



     if ( edtPaymentvalue_initial.Text <> '' ) then
       RQPlanPayItemFirstFilterObj.paymentvalue_initial := StrToInt(edtPaymentvalue_initial.Text)
     else
       RQPlanPayItemFirstFilterObj.paymentvalue_initial := Low(Integer) ;




     RQPlanPayItemFirstFilterObj.budgetrefname := edtBudgetrefname.Text; 



     RQPlanPayItemFirstFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQPlanPayItemFirstFilterObj.dateEdit = nil then
          RQPlanPayItemFirstFilterObj.dateEdit := TXSDate.Create;
       RQPlanPayItemFirstFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQPlanPayItemFirstFilterObj.dateEdit := nil;




  end;
end;




end.