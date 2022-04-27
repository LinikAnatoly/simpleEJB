unit EditParamPays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, ComCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient,ChildFormUnit,RQOrderItemController,XSBuiltIns ;

type
  TfrmEditParamPays = class(TDialogForm)
    lblPlannedDateDelivery: TLabel;
    edtPlannedDateDelivery: TDateTimePicker;
    lblPlannedDatePays: TLabel;
    edtPlannedDatePays: TDateTimePicker;
    grpTypePay: TGroupBox;
    spbTypePay: TSpeedButton;
    lblValue: TLabel;
    spbValue: TSpeedButton;
    edtTypePayName: TEdit;
    edtValue: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQBillItem: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTypePayClick(Sender: TObject);
    procedure spbValueClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    typePayRefcode : Integer;
    paymentValue : Integer;
  public
    { Public declarations }
    billitemCode : Integer;
  end;

var
  frmEditParamPays: TfrmEditParamPays;

implementation

{$R *.dfm}
uses RQBillItemController , ShowRQOrderItemTypePay, ShowRQTypePayValue,
  RQTypePayValueController, RQOrderItemTypePayController;

procedure TfrmEditParamPays.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
  TempRQBillItem: RQBillItemControllerSoapPort;
  plannedDateDelivery : TXSDate;
  PlannedDatePays : TXSDate;
begin
     if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
       edtPlannedDateDelivery , edtPlannedDatePays , edtTypePayName , edtValue
     ])  then
  begin
			Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
			Action:=caNone;
  end
  else
  begin
       TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;



     if edtplannedDateDelivery.checked then
     begin
       //if plannedDateDelivery = nil then
          plannedDateDelivery := TXSDate.Create;
          plannedDateDelivery.XSToNative(GetXSDate(edtplannedDateDelivery.DateTime));
     end
     else
          plannedDateDelivery := nil;

      if edtPlannedDatePays.checked then
     begin
       // if PlannedDatePays = nil then
          PlannedDatePays := TXSDate.Create;
          PlannedDatePays.XSToNative(GetXSDate(edtPlannedDatePays.DateTime));
     end
     else
          PlannedDatePays := nil;

      TempRQBillItem.changePaysParamOnRqOrder(billitemCode , plannedDateDelivery,PlannedDatePays,typePayRefcode,paymentValue);


  end;
end;

procedure TfrmEditParamPays.FormShow(Sender: TObject);
begin
  typePayRefcode := -1;
  paymentValue := -1;
  DisableControls([edtTypePayName , edtValue]);
end;

procedure TfrmEditParamPays.spbTypePayClick(Sender: TObject);
var
	 frmRQOrderItemTypePayShow :  TfrmRQOrderItemTypePayShow;
begin
	 frmRQOrderItemTypePayShow:=TfrmRQOrderItemTypePayShow.Create(Application,fmNormal);
	 try
			with frmRQOrderItemTypePayShow do
				if ShowModal = mrOk then
				begin
						try

							 typePayRefcode := StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
							 edtTypePayName.Text:=GetReturnValue(sgRQOrderItemTypePay,1);

							 // чистим значение вида оплат для того что бы выбрали его по новой для нового вида оплат
							 edtValue.Text := '';
            except
               on EConvertError do Exit;
						end;
        end;
   finally
			frmRQOrderItemTypePayShow.Free;
   end;
end;

procedure TfrmEditParamPays.spbValueClick(Sender: TObject);
var
	 frmRQTypePayValueShow :  TfrmRQTypePayValueShow;
	 RQTypePayValueFilterObj : RQTypePayValueFilter;
   isTypePaySet: Boolean;
begin
  isTypePaySet := false;

  RQTypePayValueFilterObj := RQTypePayValueFilter.Create;
  SetNullIntProps(RQTypePayValueFilterObj);
  SetNullXSProps(RQTypePayValueFilterObj);

    if typePayRefcode > 0 then
    begin
      RQTypePayValueFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
      RQTypePayValueFilterObj.typePayRef.code := typePayRefcode;
      isTypePaySet := true;
    end;

   if not isTypePaySet then
   begin
     Application.MessageBox(PChar('Спочатку оберіть Вид оплат!'),
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
							 paymentValue := StrToInt(GetReturnValue(sgRQTypePayValue,1));
							 edtValue.Text:=GetReturnValue(sgRQTypePayValue,1);
						except
							 on EConvertError do Exit;
						end;
        end;
   finally
			frmRQTypePayValueShow.Free;
   end;
end;

end.
