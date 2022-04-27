
unit EditRQPlanPayItemSecondFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayItemSecondController,
  Lucombo, dblucomb, EditBtn, AdvEdit,
  AdvEdBtn, AdvMoneyEdit,
  DBAdvMoneyEdit, AdvDBLookupComboBox,
  DBAdvEdBtn, clisted ;

type
  TfrmRQPlanPayItemSecondFilterEdit = class(TDialogForm)

    lblBill_num : TLabel;
    edtBill_num: TEdit;

    lblPay_type_name : TLabel;
    edtPay_type_name_initial: TEdit;
    lblPay_sign : TLabel;
    edtPay_sign: TEdit;


  HTTPRIORQPlanPayItemSecond: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtMname: TEdit;
    Label1: TLabel;
    lblPay_type_value: TLabel;
    edtPay_type_value: TEdit;
    edtDdscode: TEdit;
    Label2: TLabel;
    edtOrgokpo: TEdit;
    Label3: TLabel;
    edtOrg: TEdit;
    Label4: TLabel;
    lblDatePlanPayStart: TLabel;
    edtDatePlanPayStart: TDateTimePicker;
    lblDatePlanPayFinal: TLabel;
    edtDatePlanPayFinal: TDateTimePicker;
    UnitEditBtn1: TUnitEditBtn;
    lblPlan_sum_pay: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UnitEditBtn1UnitChanged(
      Sender: TObject; NewUnit: string);
  

  private
    { Private declarations }
  public
    { Public declarations }

    mname,  ddscode , orgokpo , org: String;

end;

var
  frmRQPlanPayItemSecondFilterEdit: TfrmRQPlanPayItemSecondFilterEdit;
  RQPlanPayItemSecondFilterObj: RQPlanPayItemSecondFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayItemSecondController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayItemSecondFilterEdit.FormShow(Sender: TObject);

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

}

UnitEditBtn1.Text:= '';

end;



procedure TfrmRQPlanPayItemSecondFilterEdit.UnitEditBtn1UnitChanged(
  Sender: TObject; NewUnit: string);
begin
  inherited;
    UnitEditBtn1.ButtonCaption := NewUnit;
end;

procedure TfrmRQPlanPayItemSecondFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


     RQPlanPayItemSecondFilterObj.bill_num := edtBill_num.Text;

     if ( edtPay_type_value.Text <> '' ) then
       RQPlanPayItemSecondFilterObj.pay_type_value := StrToInt(edtPay_type_value.Text)
     else
       RQPlanPayItemSecondFilterObj.pay_type_value := Low(Integer) ;


     if ( edtPay_sign.Text <> '' ) then
       RQPlanPayItemSecondFilterObj.pay_sign := StrToInt(edtPay_sign.Text)
     else
       RQPlanPayItemSecondFilterObj.pay_sign := Low(Integer) ;


     RQPlanPayItemSecondFilterObj.pay_type_name_initial := edtPay_type_name_initial.Text;



     mname := edtMname.Text;
     ddscode := edtDdscode.Text;
     org := edtOrg.Text;
     orgokpo := edtOrgokpo.Text;

  end;
end;




end.