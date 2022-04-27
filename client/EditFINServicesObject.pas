unit EditFINServicesObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, FINContractsController, StdCtrls, ComCtrls, Buttons,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, ActnList, TB2Item,
  TB2Dock, TB2Toolbar, Grids, AdvObj, BaseGrid, AdvGrid;

type
  TfrmFINServicesObjectEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ImageList1: TImageList;
    HTTPRIORQOrg: THTTPRIO;
    gbPartners: TGroupBox;
    sgRQOrg: TAdvStringGrid;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    tsAdditional: TTabSheet;
    lblInNum: TLabel;
    lblInDate: TLabel;
    lblPartnerName: TLabel;
    lblPartnerCode: TLabel;
    lblNotes: TLabel;
    spbDivision: TSpeedButton;
    lblDivision: TLabel;
    spbAcc_Obj_Types: TSpeedButton;
    lblAcc_Obj_Types: TLabel;
    lblCode: TLabel;
    lblRegNum: TLabel;
    lblRegDate: TLabel;
    spbGk_kategory: TSpeedButton;
    lblGk_kategory: TLabel;
    lblCloseDate: TLabel;
    spbOrg: TSpeedButton;
    lblDescription: TLabel;
    lblNums: TLabel;
    lblEd_izm: TLabel;
    spbEd_izm: TSpeedButton;
    lblRschet: TLabel;
    spbRschet: TSpeedButton;
    spbGetNewCode: TSpeedButton;
    edtInNum: TEdit;
    dtpInDate: TDateTimePicker;
    edtPartnerName: TEdit;
    edtPartnerCode: TEdit;
    memNotes: TMemo;
    edtDivision: TEdit;
    edtAcc_Obj_Types: TEdit;
    edtCode: TEdit;
    edtRegNum: TEdit;
    dtpRegDate: TDateTimePicker;
    rgDirection: TRadioGroup;
    gbSum: TGroupBox;
    lblSumma: TLabel;
    lblCurrency: TLabel;
    spbCurrency: TSpeedButton;
    lblCsumm_start_date: TLabel;
    lblCurr_summ: TLabel;
    edtSumma: TEdit;
    edtCurrency: TEdit;
    edtCurr_summ: TEdit;
    edtCsumm_start_date: TEdit;
    edtGk_kategory: TEdit;
    dtpCloseDate: TDateTimePicker;
    memDescription: TMemo;
    edtNums: TEdit;
    edtEd_izm: TEdit;
    edtRschet: TEdit;
    gbTerms: TGroupBox;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    lblProlongMonth: TLabel;
    lblCurrEndDate: TLabel;
    lblProlongNo: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    edtProlongMonth: TEdit;
    chbNotLimited: TCheckBox;
    dtpCurrEndDate: TDateTimePicker;
    edtProlongNo: TEdit;
    lblPayForm: TLabel;
    edtPayForm: TEdit;
    spbPayForm: TSpeedButton;
    lblSumm_note: TLabel;
    edtSumm_note: TEdit;
    spbSumm_note: TSpeedButton;
    gbPayCondition: TGroupBox;
    lblPay_after_event: TLabel;
    edtPay_after_event: TEdit;
    spbPay_after_event: TSpeedButton;
    lblPayPeriod: TLabel;
    edtPayPeriod: TEdit;
    cbPayType: TComboBox;
    lblFKService: TLabel;
    edtFKService: TEdit;
    spbFKService: TSpeedButton;
    lblResponsible: TLabel;
    edtResponsible: TEdit;
    spbResponsible: TSpeedButton;
    lblResponsibleTabNum: TLabel;
    edtResponsibleTabNum: TEdit;
    lblNote1: TLabel;
    dtpSupervisoryDate: TDateTimePicker;
    Label1: TLabel;
    edtSupervisoryNumber: TEdit;
    Label2: TLabel;
    chbAddSum: TCheckBox;
    chbReplaceSum: TCheckBox;
    HTTPRIOFINContracts: THTTPRIO;
    procedure spbDivisionClick(Sender: TObject);
    procedure spbAcc_Obj_TypesClick(Sender: TObject);
    procedure spbCurrencyClick(Sender: TObject);
    procedure spbOrgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spbRschetClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure spbGk_kategoryClick(Sender: TObject);
    procedure spbEd_izmClick(Sender: TObject);
    procedure chbNotLimitedClick(Sender: TObject);
    procedure dtpEndDateChange(Sender: TObject);
    procedure spbGetNewCodeClick(Sender: TObject);
    procedure spbPayFormClick(Sender: TObject);
    procedure spbFKServiceClick(Sender: TObject);
    procedure spbResponsibleClick(Sender: TObject);
    procedure spbSumm_noteClick(Sender: TObject);
    procedure spbPay_after_eventClick(Sender: TObject);
    procedure chbAddSumClick(Sender: TObject);
    procedure chbReplaceSumClick(Sender: TObject);
  private
    { Private declarations }
    divId: Integer;
    agree_group_id: Integer;
    gk_kategory: Integer;
    edizm_id: Integer;
    id_payform: Integer;
    service_id: Integer;
    axPaymTerm: String;
    axVendPaymMode: String;
    currency_code: String;

    //orgId: Integer;
    //codeOrg: String;
    //axOrgAccount: String;
    rschet_id: Integer;

    procedure SetFieldsByObject(aFINContractsObj: FINContracts);
    procedure UpdatePartnersList;
    procedure getNewAgreeCode();
  public
    { Public declarations }
    orgId: Integer;
    codeOrg: String;
    axOrgAccount: String;

    new_agree_id: Integer;
    parent_id: Integer;
    source_id: Integer;
    isAdditionalAgreement: Boolean;
    FINContractsObj: FINContracts;
  end;

var
  frmFINServicesObjectEdit: TfrmFINServicesObjectEdit;

implementation

uses ShowDivision, ShowAcc_Obj_Types, ShowCurrency, ChildFormUnit, ShowRQOrg,
  ENServicesObjectController, XSBuiltIns, ENConsts, RQOrgController,
  GridHeadersUnit, RQOrgRschetController, ShowRQOrgRschet, EditAgreePartnerLink,
  ShowEdIzm, ShowAgree_gk_kategoryTree, Agree_gk_kategoryController,
  ShowPayForm, ShowFKService, ShowFINWorker, FINWorkerController,
  ShowAXPaymTerm, ShowAXVendPaymMode;

{$R *.dfm}

var
  RQOrgHeaders: array [1..9] of String =
        ( 'Код'
          ,'Код'
          ,'Наименование'
          ,'ОКПО'
          ,'Р/счет'
          ,'МФО'
          ,'Банк'
          ,'Форма налогообложения'
          ,'Налог. номер'
        );

procedure TfrmFINServicesObjectEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  finContract: FINContracts;
begin
  if (ModalResult = mrOk) and ({(DialogState = dsEdit) or }(DialogState = dsInsert)) then
    if not NoBlankValues([edtDivision, edtAcc_Obj_Types, edtCurrency, edtPartnerCode, edtPartnerName,
                          edtCode, edtInNum, edtRegNum, memDescription]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
    end
    else begin
      if not dtpInDate.Checked then
      begin
        Application.MessageBox(PChar('Введите дату договора!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        if dtpInDate.CanFocus then dtpInDate.SetFocus;
        Action := caNone;
        Exit;
      end;

      if not dtpRegDate.Checked then
      begin
        Application.MessageBox(PChar('Введите дату регистрации договора!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        if dtpRegDate.CanFocus then dtpRegDate.SetFocus;
        Action := caNone;
        Exit;
      end;

      if not dtpStartDate.Checked then
      begin
        Application.MessageBox(PChar('Введите дату начала договора!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        if dtpStartDate.CanFocus then dtpStartDate.SetFocus;
        Action := caNone;
        Exit;
      end;

      finContract := FINContracts.Create;
      SetNullIntProps(finContract);
      SetNullXSProps(finContract);

      finContract.finDocCode := edtCode.Text;

      finContract.contractNumber := edtInNum.Text;

      if dtpInDate.Checked then
      begin
        finContract.contractDate := TXSDate.Create;
        finContract.contractDate.XSToNative(GetXSDate(dtpInDate.DateTime));
      end
      else
        finContract.contractDate := nil;

      finContract.reg_num := edtRegNum.Text;

      if dtpRegDate.Checked then
      begin
        finContract.reg_date := TXSDate.Create;
        finContract.reg_date.XSToNative(GetXSDate(dtpRegDate.DateTime));
      end
      else
        finContract.reg_date := nil;

      /////
      if dtpStartDate.Checked then
      begin
        finContract.start_date := TXSDate.Create;
        finContract.start_date.XSToNative(GetXSDate(dtpStartDate.DateTime));
      end
      else
        finContract.start_date := nil;

      if dtpEndDate.Checked then
      begin
        finContract.end_date := TXSDate.Create;
        finContract.end_date.XSToNative(GetXSDate(dtpEndDate.DateTime));
      end
      else
        finContract.end_date := nil;

      if chbNotLimited.Checked then
        finContract.notlimited := 'Y';

      if edtProlongMonth.Text <> '' then
        finContract.prolong_month := StrToInt(edtProlongMonth.Text);

      //if edtProlongNo.Text <> '' then
      //  finContract.prolong_no := StrToInt(edtProlongNo.Text);

      /////

      if edtSumma.Text <> '' then
      begin
        finContract.summa := TXSDecimal.Create;
        finContract.summa.DecimalString := edtSumma.Text;
      end
      else
        finContract.summa := nil;

      if edtNums.Text <> '' then
      begin
        finContract.nums := TXSDecimal.Create;
        finContract.nums.DecimalString := edtNums.Text;
      end
      else
        finContract.nums := nil;

      finContract.description := memDescription.Text;

      if dtpCloseDate.Checked then
      begin
        finContract.close_date := TXSDate.Create;
        finContract.close_date.XSToNative(GetXSDate(dtpCloseDate.DateTime));
      end
      else
        finContract.close_date := nil;

      finContract.notes := memNotes.Text;

      case rgDirection.ItemIndex of
        0:
          finContract.io_flag := 'S';
        1:
          finContract.io_flag := 'B';
        else
          begin
            Application.MessageBox(PChar('Выберите направление договора!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
            Action := caNone;
            Exit;
          end;
      end;

      finContract.division_id := divId;
      finContract.agree_group_id := agree_group_id;

      finContract.currency_code := currency_code;

      ///// Условие оплаты
      // Значения по умолчанию
      finContract.pay_period := 0;
      finContract.pay_type := 1;

      if edtPayPeriod.Text <> '' then
        try
          finContract.pay_period := StrToInt(edtPayPeriod.Text);
        except on EConvertError do
          raise Exception.Create('Некорректное значение в поле "Период" (Условие оплаты)!');
        end;

      if cbPayType.ItemIndex > -1 then
        finContract.pay_type := cbPayType.ItemIndex + 1;
      /////

      finContract.gk_kategory := gk_kategory;

      finContract.edizm_id := edizm_id;

      finContract.id_payform := id_payform;
      finContract.service_id := service_id;

      if edtResponsibleTabNum.Text <> '' then
        finContract.tabn_otvlico := edtResponsibleTabNum.Text;

      /////
      if dtpSupervisoryDate.Checked then
      begin
        finContract.supervisoryDate := TXSDate.Create;
        finContract.supervisoryDate.XSToNative(GetXSDate(dtpSupervisoryDate.DateTime));
      end
      else
        finContract.supervisoryDate := nil;

      finContract.supervisoryNumber := edtSupervisoryNumber.Text;
      /////

      // Способ оплаты
      finContract.summ_note := edtSumm_note.Text;
      finContract.axVendPaymMode := axVendPaymMode;
      // Условие оплаты
      finContract.pay_after_event := edtPay_after_event.Text;
      finContract.axPaymTerm := axPaymTerm;

      finContract.status := 'A';

      /////
      if edtPartnerCode.Text <> '' then
      begin
        finContract.org := RQOrg.Create;

        SetNullIntProps(finContract.org);
        SetNullXSProps(finContract.org);

        try
          finContract.org.id := StrToInt(edtPartnerCode.Text);
          finContract.org.codeorg := codeOrg;
        except
          on EConvertError do
            raise Exception.Create('Некорректный код организации!');
        end;
      end;
      /////

      ///// Поля для доп. соглашений
      if isAdditionalAgreement then
      begin
        if parent_id = LOW_INT then
          raise Exception.Create('Не задан код основного договора для доп. соглашения!');

        finContract.parent_id := parent_id;

        // Способ корректировки суммы осн. договора для доп.согл.: NULL-без корректировки/0-дополнение/1-замещение
        if chbAddSum.Checked then
          finContract.summ_changemode := 0
        else if chbReplaceSum.Checked then
          finContract.summ_changemode := 1
        else begin
          Application.MessageBox(PChar('Выберите способ корректировки суммы осн. договора (Дополнить/Заменить)!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
          Action := caNone;
          Exit;
        end;

      end;
      /////

      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

      if DialogState = dsInsert then
      begin
        new_agree_id := TempENServicesObject.addAgree(finContract, rschet_id);
      end
      else if DialogState = dsEdit then
      begin

      end;

    end;
end;

procedure TfrmFINServicesObjectEdit.actInsertExecute(Sender: TObject);
begin
  if DialogState = dsInsert then Exit;
  if FINContractsObj = nil then Exit;
  if FINContractsObj.finDocID = LOW_INT then Exit;

  frmAgreePartnerLinkEdit := TfrmAgreePartnerLinkEdit.Create(Application, dsInsert);
  try
    frmAgreePartnerLinkEdit.agree_id := FINContractsObj.finDocID;

    // Статус партнера ("S" - продавец (исполнитель), "C" - покупатель (заказчик), "P" - соисполнитель (подрядчик), "U" - не определен)
    if FINContractsObj.io_flag = 'S' then
      // Покупатель
      frmAgreePartnerLinkEdit.partner_status := 'C'
    else if FINContractsObj.io_flag = 'B' then
      // Продавец
      frmAgreePartnerLinkEdit.partner_status := 'S'
    else
      // Прочий
      frmAgreePartnerLinkEdit.partner_status := 'U';

    if frmAgreePartnerLinkEdit.ShowModal = mrOk then
    begin
      UpdatePartnersList;
    end;
  finally
    frmAgreePartnerLinkEdit.Free;
    frmAgreePartnerLinkEdit := nil;
  end;
end;

procedure TfrmFINServicesObjectEdit.actUpdateExecute(Sender: TObject);
begin
  UpdatePartnersList;
end;

procedure TfrmFINServicesObjectEdit.chbAddSumClick(Sender: TObject);
begin
  DisableControls([chbReplaceSum], chbAddSum.Checked);
end;

procedure TfrmFINServicesObjectEdit.chbNotLimitedClick(Sender: TObject);
begin
  DisableControls([dtpEndDate, edtProlongMonth], chbNotLimited.Checked);
end;

procedure TfrmFINServicesObjectEdit.chbReplaceSumClick(Sender: TObject);
begin
  DisableControls([chbAddSum], chbReplaceSum.Checked);
end;

procedure TfrmFINServicesObjectEdit.dtpEndDateChange(Sender: TObject);
begin
  DisableControls([chbNotLimited], dtpEndDate.Checked);
  if dtpEndDate.Checked then
    chbNotLimited.Checked := false;
end;

procedure TfrmFINServicesObjectEdit.FormCreate(Sender: TObject);
begin
  inherited;

  divId := LOW_INT;
  agree_group_id := LOW_INT;
  new_agree_id := LOW_INT;
  gk_kategory := LOW_INT;
  edizm_id := LOW_INT;
  id_payform := LOW_INT;
  service_id := LOW_INT;
  axPaymTerm := '';
  axVendPaymMode := '';
  currency_code := '';

  orgId := LOW_INT;
  codeOrg := '';
  axOrgAccount := '';
  rschet_id := LOW_INT;

  parent_id := LOW_INT;
  isAdditionalAgreement := false;

  source_id := LOW_INT;
end;

procedure TfrmFINServicesObjectEdit.FormShow(Sender: TObject);
var
  TempFINContracts: FINContractsControllerSoapPort;
  tmpFINContractsObj: FINContracts;
  finDocId: Integer;
begin
  inherited;

  SetFloatStyle([edtSumma, edtCurr_summ, edtCsumm_start_date, edtNums]);
  SetIntStyle([edtProlongMonth, edtPayPeriod]);
  SetGridHeaders(RQOrgHeaders, sgRQOrg.ColumnHeaders);

  DisableControls([edtDivision, edtAcc_Obj_Types, edtGk_kategory, edtCode,
                   edtCurr_summ, edtCsumm_start_date,
                   edtCurrency, spbCurrency, edtEd_izm,
                   dtpCurrEndDate, edtProlongNo,
                   edtPartnerCode, edtPartnerName, edtRschet,
                   // Доп. реквизиты
                   edtPayForm, edtSumm_note, edtPay_after_event,
                   edtFKService, edtResponsible, edtResponsibleTabNum]);

  // Для доп. соглашений организация присваивается автоматически из осн. договора
  if isAdditionalAgreement then
    DisableControls([spbOrg]);

  DenyBlankValues([edtDivision, edtAcc_Obj_Types, edtCurrency, edtPartnerCode, edtPartnerName,
                   edtCode, edtInNum, edtRegNum, memDescription]);

  HideControls([chbAddSum, chbReplaceSum], not isAdditionalAgreement);

  pcMain.ActivePage := tsMain;

  //tsAdditional.TabVisible := (HTTPRIOENServicesObject.HTTPWebNode.UserName = 'energynet');

  if DialogState = dsInsert then
  begin
    HideControls([gbPartners]);

    // Валюта всегда статикой - "Гривна"!
    currency_code := '980';
    edtCurrency.Text := '980';

    edtPayPeriod.Text := '0';

    { У Скороход не влазят кнопки
    btnOk.Top := 428;
    btnCancel.Top := 428;
    Self.Height := 508;
    }
    //btnOk.Top := 610;
    //btnCancel.Top := 610;
    //Self.Height := 690;

    //TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    //edtCode.Text := TempENServicesObject.getAgreeCode(1);

    finDocId := LOW_INT;

    if parent_id <> LOW_INT then
      finDocId := parent_id
    else if source_id <> LOW_INT then
      finDocId := source_id;

    if finDocId <> LOW_INT then
    begin
      TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
      tmpFINContractsObj := TempFINContracts.getObjectFromFK(finDocId);

      if tmpFINContractsObj <> nil then
        SetFieldsByObject(tmpFINContractsObj)
      else
        raise Exception.Create('Не удалось получить договор из ФК по коду ' + IntToStr(finDocId));

      // Сбросим на всякий случай код, полученный в SetFieldsByObject
      edtCode.Text := '';
    end;

    getNewAgreeCode();
  end;

  // На редактирование откроем только партнеров
  if DialogState = dsEdit then
  begin
    DisableControlChildren(Self);
    DisableControls([gbPartners, btnOk, btnCancel], false);
  end;

  if (DialogState = dsView) then
    DisableActions([actInsert]);

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    HideControls([lblPartnerCode, edtPartnerCode, lblPartnerName, edtPartnerName, spbOrg,
                  lblRschet, edtRschet, spbRschet]);
    DisableControls([spbGetNewCode]);

    SetFieldsByObject(FINContractsObj);

    UpdatePartnersList;
  end; // if (DialogState = dsEdit) or (DialogState = dsView)
end;

procedure TfrmFINServicesObjectEdit.getNewAgreeCode();
var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  edtCode.Text := TempENServicesObject.getAgreeCode(1);
end;

procedure TfrmFINServicesObjectEdit.SetFieldsByObject(aFINContractsObj: FINContracts);
begin
  divId := aFINContractsObj.division_id;
  edtDivision.Text := aFINContractsObj.division_name;

  agree_group_id := aFINContractsObj.agree_group_id;
  edtAcc_Obj_Types.Text := aFINContractsObj.agree_group_name;

  edtCode.Text := aFINContractsObj.finDocCode;
  edtInNum.Text := aFINContractsObj.contractNumber;
  edtRegNum.Text := aFINContractsObj.reg_num;

  if aFINContractsObj.contractDate <> nil then
  begin
    dtpInDate.DateTime := EncodeDate(aFINContractsObj.contractDate.Year,
                                     aFINContractsObj.contractDate.Month,
                                     aFINContractsObj.contractDate.Day);
    dtpInDate.Checked := true;
  end
  else begin
    dtpInDate.DateTime := SysUtils.Date;
    dtpInDate.Checked := false;
  end;

  if aFINContractsObj.reg_date <> nil then
  begin
    dtpRegDate.DateTime := EncodeDate(aFINContractsObj.reg_date.Year,
                                      aFINContractsObj.reg_date.Month,
                                      aFINContractsObj.reg_date.Day);
    dtpRegDate.Checked := true;
  end
  else begin
    dtpRegDate.DateTime := SysUtils.Date;
    dtpRegDate.Checked := false;
  end;

  /////
  if aFINContractsObj.start_date <> nil then
  begin
    dtpStartDate.DateTime := EncodeDate(aFINContractsObj.start_date.Year,
                                        aFINContractsObj.start_date.Month,
                                        aFINContractsObj.start_date.Day);
    dtpStartDate.Checked := true;
  end
  else begin
    dtpStartDate.DateTime := SysUtils.Date;
    dtpStartDate.Checked := false;
  end;

  if aFINContractsObj.end_date <> nil then
  begin
    dtpEndDate.DateTime := EncodeDate(aFINContractsObj.end_date.Year,
                                      aFINContractsObj.end_date.Month,
                                      aFINContractsObj.end_date.Day);
    dtpEndDate.Checked := true;
  end
  else begin
    dtpEndDate.DateTime := SysUtils.Date;
    dtpEndDate.Checked := false;
  end;

  chbNotLimited.Checked := (aFINContractsObj.notlimited = 'Y');

  if aFINContractsObj.prolong_month <> LOW_INT then
    edtProlongMonth.Text := IntToStr(aFINContractsObj.prolong_month);

  if aFINContractsObj.curr_end_date <> nil then
  begin
    dtpCurrEndDate.DateTime := EncodeDate(aFINContractsObj.curr_end_date.Year,
                                          aFINContractsObj.curr_end_date.Month,
                                          aFINContractsObj.curr_end_date.Day);
    dtpCurrEndDate.Checked := true;
  end
  else begin
    dtpCurrEndDate.DateTime := SysUtils.Date;
    dtpCurrEndDate.Checked := false;
  end;

  if aFINContractsObj.prolong_no <> LOW_INT then
    edtProlongNo.Text := IntToStr(aFINContractsObj.prolong_no);
  /////

  if aFINContractsObj.close_date <> nil then
  begin
    dtpCloseDate.DateTime := EncodeDate(aFINContractsObj.close_date.Year,
                                        aFINContractsObj.close_date.Month,
                                        aFINContractsObj.close_date.Day);
    dtpCloseDate.Checked := true;
  end
  else begin
    dtpCloseDate.DateTime := SysUtils.Date;
    dtpCloseDate.Checked := false;
  end;

  if aFINContractsObj.summa <> nil then
    edtSumma.Text := aFINContractsObj.summa.DecimalString
  else
    edtSumma.Text := '';

  if aFINContractsObj.curr_summ <> nil then
    edtCurr_summ.Text := aFINContractsObj.curr_summ.DecimalString
  else
    edtCurr_summ.Text := '';

  if aFINContractsObj.csumm_start_date <> nil then
  begin
    edtCsumm_start_date.Text := DateToStr(EncodeDate(aFINContractsObj.csumm_start_date.Year,
                                                     aFINContractsObj.csumm_start_date.Month,
                                                     aFINContractsObj.csumm_start_date.Day));
  end else
    edtCsumm_start_date.Text := '';

  currency_code := aFINContractsObj.currency_code;
  edtCurrency.Text := aFINContractsObj.currency_code;

  if aFINContractsObj.nums <> nil then
    edtNums.Text := aFINContractsObj.nums.DecimalString
  else
    edtNums.Text := '';

  gk_kategory := aFINContractsObj.gk_kategory;
  edtGk_kategory.Text := aFINContractsObj.gk_kategory_name;

  edIzm_id := aFINContractsObj.edizm_id;
  edtEd_izm.Text := aFINContractsObj.edizm_name;

  if aFINContractsObj.io_flag = 'S' then
    rgDirection.ItemIndex := 0
  else if aFINContractsObj.io_flag = 'B' then
    rgDirection.ItemIndex := 1
  else
    rgDirection.ItemIndex := -1;

  MakeMultiline(memDescription.Lines, aFINContractsObj.description);
  MakeMultiline(memNotes.Lines, aFINContractsObj.notes);

  id_payform := aFINContractsObj.id_payform;
  edtPayForm.Text := aFINContractsObj.name_payform;

  axVendPaymMode := aFINContractsObj.axVendPaymMode;
  edtSumm_note.Text := aFINContractsObj.summ_note;

  service_id := aFINContractsObj.service_id;
  edtFKService.Text := aFINContractsObj.service_name;

  edtResponsible.Text := aFINContractsObj.fio_otvlico;
  edtResponsibleTabNum.Text := '0' + aFINContractsObj.tabn_otvlico;

  axPaymTerm := aFINContractsObj.axPaymTerm;
  edtPay_after_event.Text := aFINContractsObj.pay_after_event;

  edtPayPeriod.Text := IntToStr(aFINContractsObj.pay_period);

  if aFINContractsObj.pay_type in [1, 2] then
    cbPayType.ItemIndex := aFINContractsObj.pay_type - 1
  else
    cbPayType.ItemIndex := 0;
end;

procedure TfrmFINServicesObjectEdit.spbAcc_Obj_TypesClick(Sender: TObject);
var
  frmAcc_Obj_TypesShow: TfrmAcc_Obj_TypesShow;
begin
  frmAcc_Obj_TypesShow := TfrmAcc_Obj_TypesShow.Create(Application, fmNormal);
  try
    frmAcc_Obj_TypesShow.isForAgree := true;

    with frmAcc_Obj_TypesShow do
      if ShowModal = mrOk then
      begin
        try
          agree_group_id := StrToInt(GetReturnValue(sgAcc_Obj_Types, 1));
          edtAcc_Obj_Types.Text := GetReturnValue(sgAcc_Obj_Types, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmAcc_Obj_TypesShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbCurrencyClick(Sender: TObject);
var
  frmCurrencyShow: TfrmCurrencyShow;
begin
  frmCurrencyShow := TfrmCurrencyShow.Create(Application, fmNormal);
  try
    with frmCurrencyShow do
      if ShowModal = mrOk then
      begin
        try
          currency_code := GetReturnValue(sgCurrency, 2);
          edtCurrency.Text := GetReturnValue(sgCurrency, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmCurrencyShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbDivisionClick(Sender: TObject);
var
  frmDivisionShow: TfrmDivisionShow;
begin
  frmDivisionShow := TfrmDivisionShow.Create(Application, fmNormal);
  try
    with frmDivisionShow do
      if ShowModal = mrOk then
      begin
        try
          divId := StrToInt(GetReturnValue(sgDivision, 1));
          edtDivision.Text := GetReturnValue(sgDivision, 3);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmDivisionShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbEd_izmClick(Sender: TObject);
var
  frmEdIzmShow: TfrmEdIzmShow;
begin
  frmEdIzmShow := TfrmEdIzmShow.Create(Application, fmNormal);
  try
    with frmEdIzmShow do
      if ShowModal = mrOk then
      begin
        try
          edIzm_id := StrToInt(GetReturnValue(sgEdIzm, 1));
          edtEd_izm.Text := GetReturnValue(sgEdIzm, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmEdIzmShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbFKServiceClick(Sender: TObject);
var
  frmFKServiceShow: TfrmFKServiceShow;
begin
  frmFKServiceShow := TfrmFKServiceShow.Create(Application, fmNormal);
  try
    DisableActions([frmFKServiceShow.actInsert,
                    frmFKServiceShow.actEdit,
                    frmFKServiceShow.actDelete,
                    frmFKServiceShow.actView]);

    with frmFKServiceShow do
      if ShowModal = mrOk then
      begin
        try
          service_id := StrToInt(GetReturnValue(sgFKService, 0));
          edtFKService.Text := GetReturnValue(sgFKService, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmFKServiceShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbGetNewCodeClick(Sender: TObject);
begin
  getNewAgreeCode();
end;

procedure TfrmFINServicesObjectEdit.spbGk_kategoryClick(Sender: TObject);
var
  frmAgree_gk_kategoryTreeShow: TfrmAgree_gk_kategoryTreeShow;
begin
  frmAgree_gk_kategoryTreeShow := TfrmAgree_gk_kategoryTreeShow.Create(Application, fmNormal);
  try
    with frmAgree_gk_kategoryTreeShow do
      if ShowModal = mrOk then
      begin
        try
          gk_kategory := Agree_gk_kategoryShort(tvAgree_gk_kategory.Selected.Data).id;
          edtGk_kategory.Text := Agree_gk_kategoryShort(tvAgree_gk_kategory.Selected.Data).name;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmAgree_gk_kategoryTreeShow.Free;
  end;
end;


procedure TfrmFINServicesObjectEdit.spbOrgClick(Sender: TObject);
var
  frmRQOrgShow: TfrmRQOrgShow;
begin
  frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
  try
    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
          orgId := StrToInt(GetReturnValue(sgRQOrg, 0));
          codeOrg := GetReturnValue(sgRQOrg, 8);
          axOrgAccount := GetReturnValue(sgRQOrg, 25);

          edtPartnerCode.Text := GetReturnValue(sgRQOrg, 0);
          edtPartnerName.Text := GetReturnValue(sgRQOrg, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbPayFormClick(Sender: TObject);
var
  frmPayFormShow: TfrmPayFormShow;
begin
  frmPayFormShow := TfrmPayFormShow.Create(Application, fmNormal);
  try
    DisableActions([frmPayFormShow.actInsert,
                    frmPayFormShow.actEdit,
                    frmPayFormShow.actDelete,
                    frmPayFormShow.actView]);

    with frmPayFormShow do
      if ShowModal = mrOk then
      begin
        try
          id_payform := StrToInt(GetReturnValue(sgPayForm, 0));
          edtPayForm.Text := GetReturnValue(sgPayForm, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmPayFormShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbPay_after_eventClick(Sender: TObject);
var
  frmAXPaymTermShow: TfrmAXPaymTermShow;
begin
  frmAXPaymTermShow := TfrmAXPaymTermShow.Create(Application, fmNormal);
  try
    DisableActions([frmAXPaymTermShow.actInsert,
                    frmAXPaymTermShow.actEdit,
                    frmAXPaymTermShow.actDelete,
                    frmAXPaymTermShow.actView]);

    with frmAXPaymTermShow do
      if ShowModal = mrOk then
      begin
        //pay_after_event := GetReturnValue(sgAXPaymTerm, 1);
        axPaymTerm := GetReturnValue(sgAXPaymTerm, 1);
        edtPay_after_event.Text := GetReturnValue(sgAXPaymTerm, 2);
      end;
  finally
    frmAXPaymTermShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbResponsibleClick(Sender: TObject);
var
  frmFINWorkerShow: TfrmFINWorkerShow;
  f: FINWorkerFilter;
begin
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);

  try
    frmFINWorkerShow.dateGet := nil;

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        try
          edtResponsible.Text := GetReturnValue(sgFINWorker, 1);
          edtResponsibleTabNum.Text := GetReturnValue(sgFINWorker, 2);
        except
          on EConvertError do Exit;
        end;
      end;
   finally
     frmFINWorkerShow.Free;
   end;
end;

procedure TfrmFINServicesObjectEdit.spbRschetClick(Sender: TObject);
var
  frmRQOrgRschetShow: TfrmRQOrgRschetShow;
  rschetFilter: RQOrgRschetFilter;
begin
  if (orgId = LOW_INT) and (axOrgAccount = '') then
  begin
    Application.MessageBox(PChar('Сначала выберите организацию!'), PChar('Внимание!'), MB_ICONWARNING);
    if edtPartnerName.CanFocus then edtPartnerName.SetFocus;
    Exit;
  end;

  rschetFilter := RQOrgRschetFilter.Create;
  SetNullIntProps(rschetFilter);
  SetNullXSProps(rschetFilter);

  rschetFilter.orgId := orgId;
  rschetFilter.axOrgAccount := axOrgAccount;

  frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application, fmNormal, rschetFilter);
  try
    frmRQOrgRschetShow.DisableActions([frmRQOrgRschetShow.actInsert,
                                       frmRQOrgRschetShow.actEdit,
                                       frmRQOrgRschetShow.actDelete,
                                       frmRQOrgRschetShow.actFilter,
                                       frmRQOrgRschetShow.actNoFilter]);
    with frmRQOrgRschetShow do
      if ShowModal = mrOk then
      begin
        try
          rschet_id := StrToInt(GetReturnValue(sgRQOrgRschet, 0));
          edtRschet.Text := GetReturnValue(sgRQOrgRschet, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgRschetShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.spbSumm_noteClick(Sender: TObject);
var
  frmAXVendPaymModeShow: TfrmAXVendPaymModeShow;
begin
  frmAXVendPaymModeShow := TfrmAXVendPaymModeShow.Create(Application, fmNormal);
  try
    DisableActions([frmAXVendPaymModeShow.actInsert,
                    frmAXVendPaymModeShow.actEdit,
                    frmAXVendPaymModeShow.actDelete,
                    frmAXVendPaymModeShow.actView]);

    with frmAXVendPaymModeShow do
      if ShowModal = mrOk then
      begin
        //summ_note := StrToInt(GetReturnValue(sgAXVendPaymMode, 1));
        axVendPaymMode := GetReturnValue(sgAXVendPaymMode, 1);
        edtSumm_note.Text := GetReturnValue(sgAXVendPaymMode, 2);
      end;
  finally
    frmAXVendPaymModeShow.Free;
  end;
end;

procedure TfrmFINServicesObjectEdit.UpdatePartnersList;
var
  TempRQOrg: RQOrgControllerSoapPort;
  i, LastCount: Integer;
  RQOrgList: RQOrgShortList;
begin
  ClearGrid(sgRQOrg);

  if DialogState = dsInsert then Exit;
  if FINContractsObj = nil then Exit;
  if FINContractsObj.finDocID = LOW_INT then Exit;

  TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;

  RQOrgList := TempRQOrg.getPartnersListForAgree(FINContractsObj.finDocID);

  LastCount := High(RQOrgList.list);

  if LastCount > -1 then
     sgRQOrg.RowCount := LastCount + 2
  else
     sgRQOrg.RowCount := 2;

  with sgRQOrg do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if RQOrgList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrgList.list[i].id)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := RQOrgList.list[i].codeorg;
      Cells[2,i+1] := RQOrgList.list[i].name;
      Cells[3,i+1] := RQOrgList.list[i].okpo;
      Cells[4,i+1] := RQOrgList.list[i].rschet;
      Cells[5,i+1] := RQOrgList.list[i].mfo;
      Cells[6,i+1] := RQOrgList.list[i].bank_name;
      Cells[7,i+1] := RQOrgList.list[i].name_nalogform;
      Cells[8,i+1] := RQOrgList.list[i].nalog_num;

      sgRQOrg.RowCount := i + 2;
    end;

   sgRQOrg.Row := 1;
end;

end.
