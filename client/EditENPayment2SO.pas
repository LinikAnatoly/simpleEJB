
unit EditENPayment2SO;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPayment2SOController ;

type
  TfrmENPayment2SOEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblSumTotal : TLabel;
    edtSumTotal: TEdit;
    lblSumGen : TLabel;
    edtSumGen: TEdit;
    lblSumVat : TLabel;
    edtSumVat: TEdit;


  HTTPRIOENPayment2SO: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtName: TEdit;
    lblName: TLabel;
    btPaymentType: TSpeedButton;
    HTTPRIOENPayment2SOType: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btPaymentTypeClick(Sender: TObject);
    procedure edtSumTotalChange(Sender: TObject);
  
  
  private
		{ Private declarations }
	public
		{ Public declarations }
		calctyperefcode : Integer;


end;

var
  frmENPayment2SOEdit: TfrmENPayment2SOEdit;
  ENPayment2SOObj: ENPayment2SO;

implementation

uses Math, ENPayment2SOTypeController, ShowENPayment2SOType, ENConsts;


{uses  
    EnergyproController, EnergyproController2, ENPayment2SOController  ;
}
{$R *.dfm}

                                             

procedure TfrmENPayment2SOEdit.FormShow(Sender: TObject);
 var  TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
 ENPayment2SOTypeobj : ENPayment2SOType;
begin

  DisableControls([edtName , edtCode]);
  SetFloatStyle([edtSumTotal , edtSumGen , edtSumVat ]);
  TempENPayment2SOType :=  HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;
  if (DialogState = dsView) or (DialogState = dsEdit)  then
  begin

  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

   if (DialogState = dsView) then
     DisableControls([btPaymentType]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPayment2SOObj.code);
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

    ENPayment2SOTypeobj :=    TempENPayment2SOType.getObject(ENPayment2SOObj.paymentTypeRef.code);
    edtName.Text :=  ENPayment2SOTypeobj.name;
  end;
end;



procedure TfrmENPayment2SOEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPayment2SO: ENPayment2SOControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([  edtName , edtSumTotal  , edtSumGen , edtSumVat ])  then
  begin
      Application.MessageBox(PChar('ѕустые пол€ недопустимы !'),PChar('¬нимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPayment2SO := HTTPRIOENPayment2SO as ENPayment2SOControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENPayment2SOObj.dateGen = nil then
          ENPayment2SOObj.dateGen := TXSDate.Create;
       ENPayment2SOObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENPayment2SOObj.dateGen := nil;

     if (ENPayment2SOObj.sumTotal = nil ) then
       ENPayment2SOObj.sumTotal := TXSDecimal.Create;
     if edtSumTotal.Text <> '' then
       ENPayment2SOObj.sumTotal.decimalString := edtSumTotal.Text 
     else
       ENPayment2SOObj.sumTotal := nil;

     if (ENPayment2SOObj.sumGen = nil ) then
       ENPayment2SOObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENPayment2SOObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENPayment2SOObj.sumGen := nil;

     if (ENPayment2SOObj.sumVat = nil ) then
       ENPayment2SOObj.sumVat := TXSDecimal.Create;
     if edtSumVat.Text <> '' then
       ENPayment2SOObj.sumVat.decimalString := edtSumVat.Text 
     else
       ENPayment2SOObj.sumVat := nil;

    if DialogState = dsInsert then
    begin
      ENPayment2SOObj.code:=low(Integer);
      TempENPayment2SO.add(ENPayment2SOObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPayment2SO.save(ENPayment2SOObj);
    end;
  end;
end;


procedure TfrmENPayment2SOEdit.btPaymentTypeClick(Sender: TObject);
var
	 frmENPayment2SOTypeShow : TfrmENPayment2SOTypeShow;
	 ENPayment2SOTypeFilterObj: ENPayment2SOTypeFilter;
begin

		 frmENPayment2SOTypeShow := TfrmENPayment2SOTypeShow.Create(Application,fmNormal);

			IF calctyperefcode = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then // если договор по старой методике то фильтруем тип оплат (оставим только погашение задолженности и возврат денег )
			begin
			 frmENPayment2SOTypeShow.FilterObject := ENPayment2SOTypeFilter.Create;

			 SetNullIntProps(frmENPayment2SOTypeShow.FilterObject);
			 SetNullXSProps(frmENPayment2SOTypeShow.FilterObject);
			 ENPayment2SOTypeFilterObj := ENPayment2SOTypeFilter.Create;
			 SetNullIntProps(ENPayment2SOTypeFilterObj);
			 SetNullXSProps(ENPayment2SOTypeFilterObj);
			 ENPayment2SOTypeFilterObj.conditionSQL  := ' ENPayment2SOType.code <> ' + IntToStr(ENPAYMENT2SOTYPE_PREPAYMENT)  ;

			 frmENPayment2SOTypeShow.FilterObject := ENPayment2SOTypeFilterObj;
		 end;
   try
      with frmENPayment2SOTypeShow do
        if ShowModal = mrOk then
        begin
            try
							 If ENPayment2SOObj.PaymentTypeRef = nil then
									ENPayment2SOObj.PaymentTypeRef := ENPayment2SOTypeRef.Create;
               ENPayment2SOObj.PaymentTypeRef.code := StrToInt(GetReturnValue(sgENPayment2SOType,0));
               edtName.Text := GetReturnValue(sgENPayment2SOType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPayment2SOTypeShow.Free;
   end;
end;

procedure TfrmENPayment2SOEdit.edtSumTotalChange(Sender: TObject);
begin

  if edtSumTotal.Text <> '' then
   begin
    edtSumGen.Text:= FloatToStr(RoundTo(StrToFloat(edtSumTotal.text) / 6 * 5 , -2));
    edtSumVat.Text:= FloatToStr(RoundTo(StrToFloat(edtSumTotal.text) / 6  , -2 ));
   end
   else
   begin
     edtSumGen.Text:= '';
     edtSumVat.Text:= '';
   end;


end;

end.
