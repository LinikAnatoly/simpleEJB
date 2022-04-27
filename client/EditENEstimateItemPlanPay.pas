
unit EditENEstimateItemPlanPay;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemPlanPayController ;

type
  TfrmENEstimateItemPlanPayEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblPercentPay : TLabel;
    edtPercentPay: TEdit;
    lblDatePay : TLabel;
    edtDatePay: TDateTimePicker;


  HTTPRIOENEstimateItemPlanPay: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtTypePayName: TEdit;
    spbTypePay: TSpeedButton;
    lblTypePayName: TLabel;
    HTTPRIORQOrderItemTypePay: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTypePayClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENEstimateItemPlanPayEdit: TfrmENEstimateItemPlanPayEdit;
  ENEstimateItemPlanPayObj: ENEstimateItemPlanPay;

implementation

uses ShowRQOrderItemTypePay, RQOrderItemTypePayController, ENConsts;


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemPlanPayController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemPlanPayEdit.FormShow(Sender: TObject);
var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
		RQOrderItemTypePayObj : RQOrderItemTypePay;
begin
  DisableControls([edtCode, edtTypePayName]);
  SetFloatStyle([edtPercentPay]);

  if DialogState = dsView then
  begin
    DisableControls([spbTypePay]);
  end;

  if DialogState = dsEdit then
  begin
    DisableControls([spbTypePay]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtTypePayName, edtPercentPay, edtDatePay]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENEstimateItemPlanPayObj.code);

    if ENEstimateItemPlanPayObj.percentPay <> nil then
      edtPercentPay.Text := ENEstimateItemPlanPayObj.percentPay.DecimalString
    else
      edtPercentPay.Text := '';

    if ENEstimateItemPlanPayObj.datePay <> nil then
    begin
      edtDatePay.DateTime := EncodeDate(ENEstimateItemPlanPayObj.datePay.Year, ENEstimateItemPlanPayObj.datePay.Month, ENEstimateItemPlanPayObj.datePay.Day);
      edtDatePay.Checked := true;
    end
    else begin
      edtDatePay.DateTime := SysUtils.Date;
      edtDatePay.Checked := false;
    end;

    if ENEstimateItemPlanPayObj.typePayRef <> nil then
    begin
      if ENEstimateItemPlanPayObj.typePayRef.code > LOW_INT then
      begin
        TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;

        RQOrderItemTypePayObj := TempRQOrderItemTypePay.getObject(ENEstimateItemPlanPayObj.typePayRef.code);

        if RQOrderItemTypePayObj <> nil then
          edtTypePayName.Text := RQOrderItemTypePayObj.name;
      end;
    end;
  end;
end;



procedure TfrmENEstimateItemPlanPayEdit.spbTypePayClick(Sender: TObject);
var frmRQOrderItemTypePayShow: TfrmRQOrderItemTypePayShow;
begin
	frmRQOrderItemTypePayShow := TfrmRQOrderItemTypePayShow.Create(Application, fmNormal);
	try
    frmRQOrderItemTypePayShow.DisableActions([frmRQOrderItemTypePayShow.actInsert, frmRQOrderItemTypePayShow.actEdit, frmRQOrderItemTypePayShow.actDelete]);

    with frmRQOrderItemTypePayShow do
      if ShowModal = mrOk then
      begin
        try
          if ENEstimateItemPlanPayObj.typePayRef = nil then ENEstimateItemPlanPayObj.typePayRef := RQOrderItemTypePayRef.Create();
          ENEstimateItemPlanPayObj.typePayRef.code := StrToInt(GetReturnValue(sgRQOrderItemTypePay, 0));
          edtTypePayName.Text := GetReturnValue(sgRQOrderItemTypePay, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
		frmRQOrderItemTypePayShow.Free;
  end;
end;

procedure TfrmENEstimateItemPlanPayEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemPlanPay: ENEstimateItemPlanPayControllerSoapPort;
    percentPay: Double;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtTypePayName, edtPercentPay]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    if not edtDatePay.Checked then
    begin
      Application.MessageBox(PChar('Вкажіть дату сплати !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    TempENEstimateItemPlanPay := HTTPRIOENEstimateItemPlanPay as ENEstimateItemPlanPayControllerSoapPort;

    try
      percentPay := StrToFloat(edtPercentPay.Text);
      if (percentPay > 100) or (percentPay <= 0) then
      begin
        Application.MessageBox(PChar('Неприпустиме значення для відсотка сплати !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
        edtPercentPay.SetFocus;
        Action := caNone;
        Exit;
      end;
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Неприпустиме значення для відсотка сплати !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
        edtPercentPay.SetFocus;
        Action := caNone;
        Exit;
      end;
    end;


    if ENEstimateItemPlanPayObj.percentPay = nil then
      ENEstimateItemPlanPayObj.percentPay := TXSDecimal.Create;
    if edtPercentPay.Text <> '' then
      ENEstimateItemPlanPayObj.percentPay.DecimalString := edtPercentPay.Text
    else
      ENEstimateItemPlanPayObj.percentPay := nil;

    if edtDatePay.Checked then
    begin
      if ENEstimateItemPlanPayObj.datePay = nil then
        ENEstimateItemPlanPayObj.datePay := TXSDate.Create;
      ENEstimateItemPlanPayObj.datePay.XSToNative(GetXSDate(edtDatePay.DateTime));
    end
    else
      ENEstimateItemPlanPayObj.datePay := nil;

    if DialogState = dsInsert then
    begin
      ENEstimateItemPlanPayObj.code := Low(Integer);
      TempENEstimateItemPlanPay.add(ENEstimateItemPlanPayObj);
    end
    else if DialogState = dsEdit then
    begin
      TempENEstimateItemPlanPay.save(ENEstimateItemPlanPayObj);
    end;
  end;
end;


end.