unit EditRQPayDoc;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls,
  Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid, XSBuiltIns,
  GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, RQPayDocController,
  FINWorkerController, RQPaymentMethodController;

type
  TfrmRQPayDocEdit = class(TDialogForm)

    lblCode: TLabel;
    edtCode: TEdit;
    lblSummaGen: TLabel;
    edtSummaGen: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TEdit;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    lblPayOrder: TLabel;
    edtPayOrder: TEdit;

    HTTPRIORQPayDoc: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblRQBillItem: TLabel;
    edtRQBillItem: TEdit;
    spbRQBillItem: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    lblBudget: TLabel;
    edtBudget: TEdit;
    spbBudget: TSpeedButton;
    HTTPRIOConfig: THTTPRIO;
    HTTPRIORQBudget: THTTPRIO;
    lblPaymentMethod: TLabel;
    cmbPaymentMethod: TComboBox;
    edtAccountablePerson: TEdit;
    spbAccountablePerson: TSpeedButton;
    lblAccountablePerson: TLabel;
    edtAccountablePersonName: TEdit;
    HTTPRIOFINWorker: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbRQBillItemClick(Sender: TObject);
    procedure spbBudgetClick(Sender: TObject);
    procedure setAccountablePersonActivated;
    procedure cmbPaymentMethodSelect(Sender: TObject);
    procedure spbAccountablePersonClick(Sender: TObject);

  private
    { Private declarations }
    chkPaymentByBudget: Boolean;
    budgcode: Integer;
    selectedAccountablePerson: FINWorker;
  public
    { Public declarations }

  end;

var
  frmRQPayDocEdit: TfrmRQPayDocEdit;
  RQPayDocObj: RQPayDoc;

implementation

uses ShowRQBill, AuthorizationController, ENConsts, RQBudgetController,
  ShowRQBudget, ShowFINWorker, DMReportsUnit, User2StaffingController;

{ uses
  EnergyproController, EnergyproController2, RQPayDocController  ;
}
{$R *.dfm}

procedure TfrmRQPayDocEdit.setAccountablePersonActivated;
var
  arr: array [0 .. 3] of TControl;
begin
  arr[0] := lblAccountablePerson;
  arr[1] := edtAccountablePerson;
  arr[2] := edtAccountablePersonName;
  arr[3] := spbAccountablePerson;
  if (cmbPaymentMethod.ItemIndex + 1) = RQPAYMENTMETHOD_EXCHANGING then
  begin
    HideControls(arr, false);
    if selectedAccountablePerson <> nil then
    begin
      edtAccountablePerson.Text := selectedAccountablePerson.tabNumber;
      edtAccountablePersonName.Text := selectedAccountablePerson.name;
    end else begin
      edtAccountablePerson.Text := '';
      edtAccountablePersonName.Text := '';
    end;
  end
  else
  begin
    HideControls(arr, true);
  end;
end;

procedure TfrmRQPayDocEdit.FormShow(Sender: TObject);
var
  TempConfig: ConfigControllerSoapPort;
  ConfigObj: Config;

  TempRQBudget: RQBudgetControllerSoapPort;
  TempFINWorker: FINWorkerControllerSoapPort;
  rqbudgFilter: RQBudgetFilter;
  RQBudgetList: RQBudgetShortList;
  i: Integer;

begin

  // вычитаем параметр проверять или нет, оплаты относительно принятого бюджета
  TempConfig := HTTPRIOConfig as ConfigControllerSoapPort;
  ConfigObj := TempConfig.getObject(CONFIG_CHKPAYMENTBYBUDGET);

  chkPaymentByBudget := false;
  if ConfigObj <> nil then
  begin
    if ConfigObj.value <> null then
      if ConfigObj.value = '1' then
        chkPaymentByBudget := true;
  end;

  budgcode := LOW_INT;

  DisableControls([edtBudget, edtCode, edtAccountablePerson,
    edtAccountablePersonName]);

  if chkPaymentByBudget then
  begin
    TempRQBudget := HTTPRIORQBudget as RQBudgetControllerSoapPort;

    if rqbudgFilter = nil then
    begin
      rqbudgFilter := RQBudgetFilter.Create;
      SetNullIntProps(rqbudgFilter);
      SetNullXSProps(rqbudgFilter);
    end;

    rqbudgFilter.conditionSQL :=
      ' rqbudget.code in ( select q.budgetrefcode from rqpaydoc2rqbudget q where q.paydocrefcode = '
      + IntToStr(RQPayDocObj.code) + ' )';

    RQBudgetList := TempRQBudget.getScrollableFilteredList(rqbudgFilter, 0, -1);

    if RQBudgetList.list <> nil then
      if RQBudgetList.list[i].dateGen <> nil then
      begin
        edtBudget.Text := XSDate2String(RQBudgetList.list[i].dateGen);
        budgcode := RQBudgetList.list[i].code;
      end;
  end;

  HideControls([lblBudget, edtBudget, spbBudget], not chkPaymentByBudget);

  if DialogState = dsInsert then begin
    cmbPaymentMethod.ItemIndex := 0;
  end;

  if DialogState = dsView then begin
    DisableControls([spbBudget, spbAccountablePerson]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then begin
    DenyBlankValues([edtSummaGen, edtNumberGen, edtDateGen, edtPayOrder]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQPayDocObj.code);
    if (RQPayDocObj.summaGen <> nil) then
      edtSummaGen.Text := RQPayDocObj.summaGen.decimalString
    else
      edtSummaGen.Text := '';
    edtCommentGen.Text := RQPayDocObj.commentGen;
    edtNumberGen.Text := RQPayDocObj.numberGen;
    if RQPayDocObj.dateGen <> nil then
    begin
      edtDateGen.DateTime := EncodeDate(RQPayDocObj.dateGen.Year,
        RQPayDocObj.dateGen.Month, RQPayDocObj.dateGen.Day);
      edtDateGen.checked := true;
    end
    else
    begin
      edtDateGen.DateTime := SysUtils.Date;
      edtDateGen.checked := false;
    end;
    edtPayOrder.Text := RQPayDocObj.payOrder;

    if RQPayDocObj.paymentMethodRef.code <> Low(Integer) then
    begin
      cmbPaymentMethod.ItemIndex := RQPayDocObj.paymentMethodRef.code - 1;
    end;

    if (RQPayDocObj.accountablePersonRef <> nil) and
      (RQPayDocObj.accountablePersonRef.code <> Low(Integer)) then
    begin
      TempFINWorker := HTTPRIOFINWorker as FINWorkerControllerSoapPort;
      selectedAccountablePerson := TempFINWorker.getObject
        (RQPayDocObj.accountablePersonRef.code);
    end;

  end;

  // SUPP-70369 Отображение/сокрытие полей показывающих подотчетное лицо
  setAccountablePersonActivated;
end;

procedure TfrmRQPayDocEdit.cmbPaymentMethodSelect(Sender: TObject);
begin
  inherited;
  if cmbPaymentMethod.ItemIndex + 1 = RQPAYMENTMETHOD_PROVISIONING then begin
    selectedAccountablePerson := nil;
  end;

  // SUPP-70369 Отображение/сокрытие полей показывающих подотчетное лицо
  setAccountablePersonActivated;
end;

procedure TfrmRQPayDocEdit.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TempRQPayDoc: RQPayDocControllerSoapPort;
begin
  if (ModalResult = mrOk) and
    ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtSummaGen, edtNumberGen, edtPayOrder]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),
        PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
    end
    else
    begin
      TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;

      if (RQPayDocObj.summaGen = nil) then
        RQPayDocObj.summaGen := TXSDecimal.Create;
      if edtSummaGen.Text <> '' then
        RQPayDocObj.summaGen.decimalString := edtSummaGen.Text
      else
        RQPayDocObj.summaGen := nil;

      RQPayDocObj.commentGen := edtCommentGen.Text;

      RQPayDocObj.numberGen := edtNumberGen.Text;

      if edtDateGen.checked then
      begin
        if RQPayDocObj.dateGen = nil then
          RQPayDocObj.dateGen := TXSDate.Create;
        RQPayDocObj.dateGen.XSToNative(GetXSDate(edtDateGen.DateTime));
      end
      else
        RQPayDocObj.dateGen := nil;

      RQPayDocObj.payOrder := edtPayOrder.Text;

      if cmbPaymentMethod.ItemIndex >= 0 then
      begin
        if RQPayDocObj.paymentMethodRef = nil then
          RQPayDocObj.paymentMethodRef := RQPaymentMethodRef.Create;
        RQPayDocObj.paymentMethodRef.code := cmbPaymentMethod.ItemIndex + 1;
      end;

      if DialogState = dsInsert then
      begin
        RQPayDocObj.code := low(Integer);

        if chkPaymentByBudget then
        begin
          if ((budgcode = LOW_INT) or (budgcode = 0)) then
          begin
            Application.MessageBox(PChar('Необхідно обрати бюджет!'),
              PChar('Внимание !'), MB_ICONWARNING + MB_OK);
            Exit;
          end;
          if selectedAccountablePerson = nil then
          begin
            TempRQPayDoc.add(RQPayDocObj, budgcode);
          end
          else
          begin
            TempRQPayDoc.add(RQPayDocObj, budgcode, selectedAccountablePerson.tabNumber);
          end;

        end
        else
          TempRQPayDoc.add(RQPayDocObj, LOW_INT);
      end
      else if DialogState = dsEdit then
      begin
        if chkPaymentByBudget then
        begin
          if ((budgcode = LOW_INT) or (budgcode = 0)) then
          begin
            Application.MessageBox(PChar('Необхідно обрати бюджет!'),
              PChar('Внимание !'), MB_ICONWARNING + MB_OK);
            Exit;
          end;
          if selectedAccountablePerson = nil then
          begin
            TempRQPayDoc.save(RQPayDocObj, budgcode);
          end
          else
          begin
            TempRQPayDoc.save(RQPayDocObj, budgcode, selectedAccountablePerson.tabNumber);
          end;
        end
        else
        begin
          if selectedAccountablePerson = nil then
          begin
            TempRQPayDoc.save(RQPayDocObj, LOW_INT);
          end
          else
          begin
            TempRQPayDoc.save(RQPayDocObj, LOW_INT, selectedAccountablePerson.tabNumber);
          end;
        end;
      end;
    end;
end;

procedure TfrmRQPayDocEdit.spbAccountablePersonClick(Sender: TObject);
var
  chooseDate: TXSDate;
  user2StaffingObj : User2Staffing;
  selectedObj: FINWorkerShort;
begin
  inherited;
  chooseDate := nil;
  if (RQPayDocObj <> nil) and (RQPayDocObj.dateGen <> nil) then begin
    chooseDate := RQPayDocObj.dateGen;
  end;
  user2StaffingObj := DMReports.getUser2StaffingOfCurrentUser;

  if (Assigned(user2StaffingObj)) and (Length(Trim(user2StaffingObj.podrCod)) > 0) then begin
    selectedObj := TfrmFINWorkerShow.chooseFromList(chooseDate, user2StaffingObj.podrCod);
  end else begin
    selectedObj := TfrmFINWorkerShow.chooseFromList(chooseDate);
  end;
  if Assigned(selectedObj) then begin
    selectedAccountablePerson := FINWorker.Create;
    selectedAccountablePerson.tabNumber := selectedObj.tabNumber;
    selectedAccountablePerson.name := selectedObj.name;
    setAccountablePersonActivated;
  end;
end;

procedure TfrmRQPayDocEdit.spbBudgetClick(Sender: TObject);
var
  f: RQBudgetFilter;
  frmRQBudgetShow: TfrmRQBudgetShow;

begin

  f := RQBudgetFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := '  dategen desc  ';

  frmRQBudgetShow := TfrmRQBudgetShow.Create(Application, fmNormal, f);

  DisableActions([frmRQBudgetShow.actView, frmRQBudgetShow.actInsert,
    frmRQBudgetShow.actDelete, frmRQBudgetShow.actEdit,
    frmRQBudgetShow.actUpdate, frmRQBudgetShow.actApprove,
    frmRQBudgetShow.actUnApprove]);
  try

    with frmRQBudgetShow do
    begin

      if ShowModal = mrOk then
      begin
        try
          budgcode := StrToInt(frmRQBudgetShow.sgRQBudget.Cells[0,
            frmRQBudgetShow.sgRQBudget.Row]);
          edtBudget.Text := frmRQBudgetShow.sgRQBudget.Cells[2, sgRQBudget.Row];
        except
          on EConvertError do
            Exit;
        end;
      end;
    end;
  finally
    frmRQBudgetShow.Free;
  end;

end;

procedure TfrmRQPayDocEdit.spbRQBillItemClick(Sender: TObject);
var
  frmRQBillShow: TfrmRQBillShow;
begin
  { frmRQBillShow:=TfrmRQBillShow.Create(Application,fmNormal);
    try
    with frmRQBillShow do
    if ShowModal = mrOk then
    begin
    try
    if ENSITEquipmentObj.element = nil then ENSITEquipmentObj.element := ENElement.Create();
    if ENSITEquipmentObj.element.renRef = nil then ENSITEquipmentObj.element.renRef := EPRenRef.Create();
    ENSITEquipmentObj.element.renRef.code := StrToInt(GetReturnValue(sgEPRen,0));
    edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
    except
    on EConvertError do Exit;
    end;
    end;
    finally
    frmEPRenShow.Free;
    end; }
end;

end.
