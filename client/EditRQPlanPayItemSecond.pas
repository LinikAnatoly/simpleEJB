
unit EditRQPlanPayItemSecond;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayItemSecondController ;

type
  TfrmRQPlanPayItemSecondEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblPrihod_count : TLabel;
    edtPrihod_count: TEdit;
    lblPrihod_price : TLabel;
    edtPrihod_price: TEdit;
    lblPrihod_summa : TLabel;
    edtPrihod_summa: TEdit;
    lblPrihod_date : TLabel;
    edtPrihod_date: TDateTimePicker;
    lblPay_plan_summa : TLabel;
    edtPay_plan_summa: TEdit;
    lblPay_plan_date : TLabel;
    edtPay_plan_date: TDateTimePicker;
    lblPay_fact_date : TLabel;
    edtPay_fact_date: TDateTimePicker;
    lblPay_fact_price : TLabel;
    edtPay_fact_price: TEdit;
    lblPay_fact_summa : TLabel;
    edtPay_fact_summa: TEdit;
    lblPay_fact_count : TLabel;
    edtPay_fact_count: TEdit;
    lblBill_num : TLabel;
    edtBill_num: TEdit;
    lblBudget_name : TLabel;
    edtBudget_name: TEdit;
    lblPay_type_name : TLabel;
    edtPay_type_name: TEdit;
    lblPay_type_value : TLabel;
    edtPay_type_value: TEdit;
    lblPay_date : TLabel;
    edtPay_date: TDateTimePicker;
    lblPay_sign : TLabel;
    edtPay_sign: TEdit;
    lblPay_type_name_initial : TLabel;
    edtPay_type_name_initial: TEdit;
    lblPay_type_value_initial : TLabel;
    edtPay_type_value_initial: TEdit;
    lblBillitemcodes : TLabel;
    edtBillitemcodes: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQPlanPayItemSecond: THTTPRIO;

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
  frmRQPlanPayItemSecondEdit: TfrmRQPlanPayItemSecondEdit;
  RQPlanPayItemSecondObj: RQPlanPayItemSecond;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayItemSecondController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayItemSecondEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQPlanPayItemSecondObj.code);
    if ( RQPlanPayItemSecondObj.prihod_count <> nil ) then
       edtPrihod_count.Text := RQPlanPayItemSecondObj.prihod_count.decimalString
    else
       edtPrihod_count.Text := ''; 
    if ( RQPlanPayItemSecondObj.prihod_price <> nil ) then
       edtPrihod_price.Text := RQPlanPayItemSecondObj.prihod_price.decimalString
    else
       edtPrihod_price.Text := ''; 
    if ( RQPlanPayItemSecondObj.prihod_summa <> nil ) then
       edtPrihod_summa.Text := RQPlanPayItemSecondObj.prihod_summa.decimalString
    else
       edtPrihod_summa.Text := ''; 
      if RQPlanPayItemSecondObj.prihod_date <> nil then
      begin
        edtPrihod_date.DateTime:=EncodeDate(RQPlanPayItemSecondObj.prihod_date.Year,RQPlanPayItemSecondObj.prihod_date.Month,RQPlanPayItemSecondObj.prihod_date.Day);
        edtPrihod_date.checked := true;
      end
      else
      begin
        edtPrihod_date.DateTime:=SysUtils.Date;
        edtPrihod_date.checked := false;
      end;
    if ( RQPlanPayItemSecondObj.pay_plan_summa <> nil ) then
       edtPay_plan_summa.Text := RQPlanPayItemSecondObj.pay_plan_summa.decimalString
    else
       edtPay_plan_summa.Text := ''; 
      if RQPlanPayItemSecondObj.pay_plan_date <> nil then
      begin
        edtPay_plan_date.DateTime:=EncodeDate(RQPlanPayItemSecondObj.pay_plan_date.Year,RQPlanPayItemSecondObj.pay_plan_date.Month,RQPlanPayItemSecondObj.pay_plan_date.Day);
        edtPay_plan_date.checked := true;
      end
      else
      begin
        edtPay_plan_date.DateTime:=SysUtils.Date;
        edtPay_plan_date.checked := false;
      end;
      if RQPlanPayItemSecondObj.pay_fact_date <> nil then
      begin
        edtPay_fact_date.DateTime:=EncodeDate(RQPlanPayItemSecondObj.pay_fact_date.Year,RQPlanPayItemSecondObj.pay_fact_date.Month,RQPlanPayItemSecondObj.pay_fact_date.Day);
        edtPay_fact_date.checked := true;
      end
      else
      begin
        edtPay_fact_date.DateTime:=SysUtils.Date;
        edtPay_fact_date.checked := false;
      end;
    if ( RQPlanPayItemSecondObj.pay_fact_price <> nil ) then
       edtPay_fact_price.Text := RQPlanPayItemSecondObj.pay_fact_price.decimalString
    else
       edtPay_fact_price.Text := ''; 
    if ( RQPlanPayItemSecondObj.pay_fact_summa <> nil ) then
       edtPay_fact_summa.Text := RQPlanPayItemSecondObj.pay_fact_summa.decimalString
    else
       edtPay_fact_summa.Text := ''; 
    if ( RQPlanPayItemSecondObj.pay_fact_count <> nil ) then
       edtPay_fact_count.Text := RQPlanPayItemSecondObj.pay_fact_count.decimalString
    else
       edtPay_fact_count.Text := ''; 
    edtBill_num.Text := RQPlanPayItemSecondObj.bill_num; 
    edtBudget_name.Text := RQPlanPayItemSecondObj.budget_name; 
    edtPay_type_name.Text := RQPlanPayItemSecondObj.pay_type_name; 
    if ( RQPlanPayItemSecondObj.pay_type_value <> Low(Integer) ) then
       edtPay_type_value.Text := IntToStr(RQPlanPayItemSecondObj.pay_type_value)
    else
       edtPay_type_value.Text := '';
      if RQPlanPayItemSecondObj.pay_date <> nil then
      begin
        edtPay_date.DateTime:=EncodeDate(RQPlanPayItemSecondObj.pay_date.Year,RQPlanPayItemSecondObj.pay_date.Month,RQPlanPayItemSecondObj.pay_date.Day);
        edtPay_date.checked := true;
      end
      else
      begin
        edtPay_date.DateTime:=SysUtils.Date;
        edtPay_date.checked := false;
      end;
    if ( RQPlanPayItemSecondObj.pay_sign <> Low(Integer) ) then
       edtPay_sign.Text := IntToStr(RQPlanPayItemSecondObj.pay_sign)
    else
       edtPay_sign.Text := '';
    edtPay_type_name_initial.Text := RQPlanPayItemSecondObj.pay_type_name_initial; 
    if ( RQPlanPayItemSecondObj.pay_type_value_initial <> Low(Integer) ) then
       edtPay_type_value_initial.Text := IntToStr(RQPlanPayItemSecondObj.pay_type_value_initial)
    else
       edtPay_type_value_initial.Text := '';
    MakeMultiline(edtBillitemcodes.Lines, RQPlanPayItemSecondObj.billitemcodes);
    edtUserGen.Text := RQPlanPayItemSecondObj.userGen; 
      if RQPlanPayItemSecondObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQPlanPayItemSecondObj.dateEdit.Year,RQPlanPayItemSecondObj.dateEdit.Month,RQPlanPayItemSecondObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmRQPlanPayItemSecondEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
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
    TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;


     if (RQPlanPayItemSecondObj.prihod_count = nil ) then
       RQPlanPayItemSecondObj.prihod_count := TXSDecimal.Create;
     if edtPrihod_count.Text <> '' then
       RQPlanPayItemSecondObj.prihod_count.decimalString := edtPrihod_count.Text 
     else
       RQPlanPayItemSecondObj.prihod_count := nil;

     if (RQPlanPayItemSecondObj.prihod_price = nil ) then
       RQPlanPayItemSecondObj.prihod_price := TXSDecimal.Create;
     if edtPrihod_price.Text <> '' then
       RQPlanPayItemSecondObj.prihod_price.decimalString := edtPrihod_price.Text 
     else
       RQPlanPayItemSecondObj.prihod_price := nil;

     if (RQPlanPayItemSecondObj.prihod_summa = nil ) then
       RQPlanPayItemSecondObj.prihod_summa := TXSDecimal.Create;
     if edtPrihod_summa.Text <> '' then
       RQPlanPayItemSecondObj.prihod_summa.decimalString := edtPrihod_summa.Text 
     else
       RQPlanPayItemSecondObj.prihod_summa := nil;

     if edtprihod_date.checked then
     begin 
       if RQPlanPayItemSecondObj.prihod_date = nil then
          RQPlanPayItemSecondObj.prihod_date := TXSDate.Create;
       RQPlanPayItemSecondObj.prihod_date.XSToNative(GetXSDate(edtprihod_date.DateTime));
     end
     else
       RQPlanPayItemSecondObj.prihod_date := nil;

     if (RQPlanPayItemSecondObj.pay_plan_summa = nil ) then
       RQPlanPayItemSecondObj.pay_plan_summa := TXSDecimal.Create;
     if edtPay_plan_summa.Text <> '' then
       RQPlanPayItemSecondObj.pay_plan_summa.decimalString := edtPay_plan_summa.Text 
     else
       RQPlanPayItemSecondObj.pay_plan_summa := nil;

     if edtpay_plan_date.checked then
     begin 
       if RQPlanPayItemSecondObj.pay_plan_date = nil then
          RQPlanPayItemSecondObj.pay_plan_date := TXSDate.Create;
       RQPlanPayItemSecondObj.pay_plan_date.XSToNative(GetXSDate(edtpay_plan_date.DateTime));
     end
     else
       RQPlanPayItemSecondObj.pay_plan_date := nil;

     if edtpay_fact_date.checked then
     begin 
       if RQPlanPayItemSecondObj.pay_fact_date = nil then
          RQPlanPayItemSecondObj.pay_fact_date := TXSDate.Create;
       RQPlanPayItemSecondObj.pay_fact_date.XSToNative(GetXSDate(edtpay_fact_date.DateTime));
     end
     else
       RQPlanPayItemSecondObj.pay_fact_date := nil;

     if (RQPlanPayItemSecondObj.pay_fact_price = nil ) then
       RQPlanPayItemSecondObj.pay_fact_price := TXSDecimal.Create;
     if edtPay_fact_price.Text <> '' then
       RQPlanPayItemSecondObj.pay_fact_price.decimalString := edtPay_fact_price.Text 
     else
       RQPlanPayItemSecondObj.pay_fact_price := nil;

     if (RQPlanPayItemSecondObj.pay_fact_summa = nil ) then
       RQPlanPayItemSecondObj.pay_fact_summa := TXSDecimal.Create;
     if edtPay_fact_summa.Text <> '' then
       RQPlanPayItemSecondObj.pay_fact_summa.decimalString := edtPay_fact_summa.Text 
     else
       RQPlanPayItemSecondObj.pay_fact_summa := nil;

     if (RQPlanPayItemSecondObj.pay_fact_count = nil ) then
       RQPlanPayItemSecondObj.pay_fact_count := TXSDecimal.Create;
     if edtPay_fact_count.Text <> '' then
       RQPlanPayItemSecondObj.pay_fact_count.decimalString := edtPay_fact_count.Text 
     else
       RQPlanPayItemSecondObj.pay_fact_count := nil;

     RQPlanPayItemSecondObj.bill_num := edtBill_num.Text; 

     RQPlanPayItemSecondObj.budget_name := edtBudget_name.Text; 

     RQPlanPayItemSecondObj.pay_type_name := edtPay_type_name.Text; 

     if ( edtPay_type_value.Text <> '' ) then
       RQPlanPayItemSecondObj.pay_type_value := StrToInt(edtPay_type_value.Text)
     else
       RQPlanPayItemSecondObj.pay_type_value := Low(Integer) ;

     if edtpay_date.checked then
     begin 
       if RQPlanPayItemSecondObj.pay_date = nil then
          RQPlanPayItemSecondObj.pay_date := TXSDate.Create;
       RQPlanPayItemSecondObj.pay_date.XSToNative(GetXSDate(edtpay_date.DateTime));
     end
     else
       RQPlanPayItemSecondObj.pay_date := nil;

     if ( edtPay_sign.Text <> '' ) then
       RQPlanPayItemSecondObj.pay_sign := StrToInt(edtPay_sign.Text)
     else
       RQPlanPayItemSecondObj.pay_sign := Low(Integer) ;

     RQPlanPayItemSecondObj.pay_type_name_initial := edtPay_type_name_initial.Text; 

     if ( edtPay_type_value_initial.Text <> '' ) then
       RQPlanPayItemSecondObj.pay_type_value_initial := StrToInt(edtPay_type_value_initial.Text)
     else
       RQPlanPayItemSecondObj.pay_type_value_initial := Low(Integer) ;

     RQPlanPayItemSecondObj.billitemcodes := edtBillitemcodes.Text; 

     RQPlanPayItemSecondObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if RQPlanPayItemSecondObj.dateEdit = nil then
          RQPlanPayItemSecondObj.dateEdit := TXSDateTime.Create;
       RQPlanPayItemSecondObj.dateEdit.XSToNative(GetXSDateTime(edtdateEdit.DateTime));
     end
     else
       RQPlanPayItemSecondObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      RQPlanPayItemSecondObj.code:=low(Integer);
      TempRQPlanPayItemSecond.add(RQPlanPayItemSecondObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPlanPayItemSecond.save(RQPlanPayItemSecondObj);
    end;
  end;
end;


end.