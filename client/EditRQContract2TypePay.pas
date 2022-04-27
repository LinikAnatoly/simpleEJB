
unit EditRQContract2TypePay;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQContract2TypePayController ;

type
  TfrmRQContract2TypePayEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblContractNumber : TLabel;
    edtContractNumber: TEdit;
    lblContractDate : TLabel;
    edtContractDate: TDateTimePicker;
    lblFinDocCode : TLabel;
    edtFinDocCode: TEdit;
    lblFinDocID : TLabel;
    edtFinDocID: TEdit;
    lblPartnerID : TLabel;
    edtPartnerID: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIORQContract2TypePay: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    grpTypePay: TGroupBox;
    spbTypePay: TSpeedButton;
    lblPaymentValue: TLabel;
    spbValue: TSpeedButton;
    edtTypePayName: TEdit;
    edtPaymentValue: TEdit;
    spbContractNumber: TSpeedButton;
    HTTPRIORQOrderItemTypePay: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbContractNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbTypePayClick(Sender: TObject);
    procedure spbValueClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    orgID: Integer;
  end;

var
  frmRQContract2TypePayEdit: TfrmRQContract2TypePayEdit;
  RQContract2TypePayObj: RQContract2TypePay;

implementation

uses ShowFINServicesObject, ENServicesObjectController,
  ShowRQOrderItemTypePay, ShowRQTypePayValue, RQOrderItemTypePayController,
  RQTypePayValueController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, RQContract2TypePayController  ;
}
{$R *.dfm}



procedure TfrmRQContract2TypePayEdit.FormShow(Sender: TObject);
var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
    orderItemTypePayObj: RQOrderItemTypePay;
begin
  DisableControls([edtCode,
                   edtContractNumber, edtContractDate,
                   edtFinDocCode, edtFinDocID, edtPartnerID,
                   edtTypePayName, edtPaymentValue]);
                   
  if DialogState = dsView then
  begin
    DisableControls([spbContractNumber, spbTypePay, spbValue]);
  end;

  if DialogState = dsEdit then
    DisableControls([spbContractNumber]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContractNumber
      ,edtContractDate
      ,edtFinDocCode
      ,edtFinDocID
      ,edtPartnerID
      ,edtTypePayName
      ,edtPaymentValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQContract2TypePayObj.code);
    edtContractNumber.Text := RQContract2TypePayObj.contractNumber; 
      if RQContract2TypePayObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(RQContract2TypePayObj.contractDate.Year,RQContract2TypePayObj.contractDate.Month,RQContract2TypePayObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;
    edtFinDocCode.Text := RQContract2TypePayObj.finDocCode; 
    if ( RQContract2TypePayObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(RQContract2TypePayObj.finDocID)
    else
       edtFinDocID.Text := '';
    if ( RQContract2TypePayObj.partnerID <> Low(Integer) ) then
       edtPartnerID.Text := IntToStr(RQContract2TypePayObj.partnerID)
    else
       edtPartnerID.Text := '';
    if ( RQContract2TypePayObj.paymentValue <> Low(Integer) ) then
       edtPaymentValue.Text := IntToStr(RQContract2TypePayObj.paymentValue)
    else
       edtPaymentValue.Text := '';
    edtCommentGen.Text := RQContract2TypePayObj.commentGen; 

    if RQContract2TypePayObj.typePayRef <> nil then
      if RQContract2TypePayObj.typePayRef.code <> LOW_INT then
      begin
        TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;
        orderItemTypePayObj := TempRQOrderItemTypePay.getObject(RQContract2TypePayObj.typePayRef.code);
        if orderItemTypePayObj <> nil then
          edtTypePayName.Text := orderItemTypePayObj.name;
      end;
  end;
end;



procedure TfrmRQContract2TypePayEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQContract2TypePay: RQContract2TypePayControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtContractNumber
      ,edtFinDocCode
      ,edtFinDocID
      ,edtPartnerID
      ,edtTypePayName
      ,edtPaymentValue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQContract2TypePay := HTTPRIORQContract2TypePay as RQContract2TypePayControllerSoapPort;


     RQContract2TypePayObj.contractNumber := edtContractNumber.Text;

     if edtcontractDate.checked then
     begin 
       if RQContract2TypePayObj.contractDate = nil then
          RQContract2TypePayObj.contractDate := TXSDate.Create;
       RQContract2TypePayObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       RQContract2TypePayObj.contractDate := nil;

     RQContract2TypePayObj.finDocCode := edtFinDocCode.Text; 

     if ( edtFinDocID.Text <> '' ) then
       RQContract2TypePayObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       RQContract2TypePayObj.finDocID := Low(Integer) ;

     if ( edtPartnerID.Text <> '' ) then
       RQContract2TypePayObj.partnerID := StrToInt(edtPartnerID.Text)
     else
       RQContract2TypePayObj.partnerID := Low(Integer) ;

     if ( edtPaymentValue.Text <> '' ) then
       RQContract2TypePayObj.paymentValue := StrToInt(edtPaymentValue.Text)
     else
       RQContract2TypePayObj.paymentValue := Low(Integer) ;

     RQContract2TypePayObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      RQContract2TypePayObj.code:=low(Integer);
      TempRQContract2TypePay.add(RQContract2TypePayObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQContract2TypePay.save(RQContract2TypePayObj);
    end;
  end;
end;


procedure TfrmRQContract2TypePayEdit.spbContractNumberClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   if orgID = LOW_INT then
     raise Exception.Create('Не визначено постачальника!');

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(orgID) ; // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application, fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
          try
            edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
            edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
            edtFinDocCode.Text := GetReturnValue(sgFINServicesObject, 5);
            edtFinDocID.Text := GetReturnValue(sgFINServicesObject, 6);
            edtPartnerID.Text := GetReturnValue(sgFINServicesObject, 10);
          except
             on EConvertError do Exit;
          end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmRQContract2TypePayEdit.FormCreate(Sender: TObject);
begin
  inherited;
  orgID := LOW_INT;
end;

procedure TfrmRQContract2TypePayEdit.spbTypePayClick(Sender: TObject);
var
	 frmRQOrderItemTypePayShow :  TfrmRQOrderItemTypePayShow;
begin
	 frmRQOrderItemTypePayShow:=TfrmRQOrderItemTypePayShow.Create(Application,fmNormal);
	 try
			with frmRQOrderItemTypePayShow do
				if ShowModal = mrOk then
				begin
						try
							 if RQContract2TypePayObj.typePayRef = nil then RQContract2TypePayObj.typePayRef := RQOrderItemTypePayRef.Create();
							 RQContract2TypePayObj.typePayRef.code := StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
							 edtTypePayName.Text:=GetReturnValue(sgRQOrderItemTypePay,1);
							 edtPaymentValue.Text := '';
            except
               on EConvertError do Exit;
						end;
        end;
   finally
			frmRQOrderItemTypePayShow.Free;
   end;
end;

procedure TfrmRQContract2TypePayEdit.spbValueClick(Sender: TObject);
var
	 frmRQTypePayValueShow :  TfrmRQTypePayValueShow;
	 RQTypePayValueFilterObj : RQTypePayValueFilter;
   isTypePaySet: Boolean;
begin
  isTypePaySet := false;

  RQTypePayValueFilterObj := RQTypePayValueFilter.Create;
  SetNullIntProps(RQTypePayValueFilterObj);
  SetNullXSProps(RQTypePayValueFilterObj);

  if RQContract2TypePayObj.typePayRef <> nil then
    if RQContract2TypePayObj.typePayRef.code > LOW_INT then
    begin
      RQTypePayValueFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
      RQTypePayValueFilterObj.typePayRef.code := RQContract2TypePayObj.typePayRef.code;
      isTypePaySet := true;
    end;

   if not isTypePaySet then
   begin
     Application.MessageBox(PChar('Спочатку оберіть Вид сплати!'),
                         PChar('Увага!'), MB_ICONWARNING);
     edtTypePayName.SetFocus;
     Exit;
   end;

	 frmRQTypePayValueShow:= TfrmRQTypePayValueShow.Create(Application,fmNormal , RQTypePayValueFilterObj);
	 try
			with frmRQTypePayValueShow do
				if ShowModal = mrOk then
				begin
            try
							 RQContract2TypePayObj.paymentValue := StrToInt(GetReturnValue(sgRQTypePayValue,0));
							 edtPaymentValue.Text:=GetReturnValue(sgRQTypePayValue,1);
						except
							 on EConvertError do Exit;
						end;
        end;
   finally
			frmRQTypePayValueShow.Free;
   end;
end;

end.