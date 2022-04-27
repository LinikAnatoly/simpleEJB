
unit EditRQOrgRschet;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgRschetController ;

type
  TfrmRQOrgRschetEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblId : TLabel;
    edtId: TEdit;
    lblRschet : TLabel;
    edtRschet: TEdit;
    HTTPRIORQOrgRschet: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    gbBank: TGroupBox;
    lblMfo: TLabel;
    edtMfo: TEdit;
    lblBankName: TLabel;
    edtBankName: TEdit;
    spbBank: TSpeedButton;
    lblRschet_type: TLabel;
    edtRschet_type: TEdit;
    spbRschet_type: TSpeedButton;
    chbIsTransit: TCheckBox;
    gbCurrency: TGroupBox;
    lblCurrencyCode: TLabel;
    lblCurrencyName: TLabel;
    spbCurrencyCode: TSpeedButton;
    edtCurrencyCode: TEdit;
    edtCurrencyName: TEdit;
    lblLikv_date: TLabel;
    dtpLikv_date: TDateTimePicker;
    lblPrimechan: TLabel;
    edtPrimechan: TEdit;
    gbTransitOrg: TGroupBox;
    lblTransitOrgCode: TLabel;
    lblTransitOrgName: TLabel;
    spbTransitOrgCode: TSpeedButton;
    edtTransitOrgCode: TEdit;
    edtTransitOrgName: TEdit;
    lblTransitOrgOKPO: TLabel;
    edtTransitOrgOKPO: TEdit;
    spbRschet: TSpeedButton;
    HTTPRIORQOrgBank: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbRschet_typeClick(Sender: TObject);
    procedure spbBankClick(Sender: TObject);
    procedure spbCurrencyCodeClick(Sender: TObject);
    procedure chbIsTransitClick(Sender: TObject);
    procedure spbTransitOrgCodeClick(Sender: TObject);
    procedure spbRschetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtRschetExit(Sender: TObject);
  private
    { Private declarations }
    procedure SetDefaultCurrency;
    procedure SetBankCode(bankCode : String; bankName : String);
  public
    { Public declarations }
    RQOrgRschetObj: RQOrgRschet;
    //contrAgentType: Integer;
    orgId, transitOrgId: Integer;
    orgCodeFK, axOrgAccount, transitAxOrgAccount: String;
  end;

var
  frmRQOrgRschetEdit: TfrmRQOrgRschetEdit;
  //RQOrgRschetObj: RQOrgRschet;

implementation

uses ShowRschet_type, ShowRQOrgBank, ShowCurrency, RQOrgBankController,
  ShowRQOrg, ShowRQOrgRschet, ENConsts, RQOrgController, FinancialUtilsUnit;


{uses  
    EnergyproController, EnergyproController2, RQOrgRschetController  ;
}
{$R *.dfm}


procedure TfrmRQOrgRschetEdit.SetBankCode(bankCode : String; bankName : String);
begin
  RQOrgRschetObj.mfo := bankCode;
  edtMfo.Text := bankCode;
  edtBankName.Text := bankName;
end;

procedure TfrmRQOrgRschetEdit.FormShow(Sender: TObject);
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtRschet_type, edtMfo, edtBankName, edtCurrencyCode, edtCurrencyName,
                     edtTransitOrgCode, edtTransitOrgOKPO, edtTransitOrgName]);

    DenyBlankValues([
      //edtId
      edtRschet
      ,edtRschet_type
      ,edtMfo
      ,edtBankName
      ,edtCurrencyCode
      ,edtCurrencyName
      ,edtTransitOrgCode,
      edtTransitOrgOKPO,
      edtTransitOrgName
     ]);
  end;

  // Валюта по умолчанию при создании нового р/счета
  if DialogState = dsInsert then
    SetDefaultCurrency;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQOrgRschetObj.code);
    if ( RQOrgRschetObj.id <> Low(Integer) ) then
      edtId.Text := IntToStr(RQOrgRschetObj.id)
    else
      edtId.Text := '';
    edtMfo.Text := RQOrgRschetObj.mfo;
    edtRschet.Text := RQOrgRschetObj.rschet;
  end;
end;



procedure TfrmRQOrgRschetEdit.SetDefaultCurrency;
begin
  edtCurrencyCode.Text := '980';
  edtCurrencyName.Text := 'ГРН.';
end;

procedure TfrmRQOrgRschetEdit.spbBankClick(Sender: TObject);
var
  frmRQOrgBankShow: TfrmRQOrgBankShow;
begin
  frmRQOrgBankShow := TfrmRQOrgBankShow.Create(Application, fmNormal);
  try
    with frmRQOrgBankShow do
      if ShowModal = mrOk then
      begin
        try
          SetBankCode(GetReturnValue(sgRQOrgBank, 2), GetReturnValue(sgRQOrgBank, 3));
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgBankShow.Free;
  end;
end;

procedure TfrmRQOrgRschetEdit.spbCurrencyCodeClick(Sender: TObject);
var
  frmCurrencyShow: TfrmCurrencyShow;
begin
  frmCurrencyShow := TfrmCurrencyShow.Create(Application, fmNormal);
  try
    with frmCurrencyShow do
      if ShowModal = mrOk then
      begin
        try
          RQOrgRschetObj.currency_code := GetReturnValue(sgCurrency, 2);
          edtCurrencyCode.Text := GetReturnValue(sgCurrency, 2);
          edtCurrencyName.Text := GetReturnValue(sgCurrency, 4);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmCurrencyShow.Free;
  end;
end;

procedure TfrmRQOrgRschetEdit.spbRschetClick(Sender: TObject);
var
  frmRQOrgRschetShow: TfrmRQOrgRschetShow;
  rschetFilter: RQOrgRschetFilter;
begin
  if (transitOrgId = LOW_INT) and (transitAxOrgAccount = '') then
  begin
    Application.MessageBox(PChar('Сначала выберите организацию-владельца!'), PChar('Внимание!'), MB_ICONWARNING);
    if edtTransitOrgCode.CanFocus then edtTransitOrgCode.SetFocus;
    Exit;
  end;

  rschetFilter := RQOrgRschetFilter.Create;
  SetNullIntProps(rschetFilter);
  SetNullXSProps(rschetFilter);

  rschetFilter.orgId := transitOrgId;
  rschetFilter.axOrgAccount := transitAxOrgAccount;

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
          RQOrgRschetObj.id := StrToInt(GetReturnValue(sgRQOrgRschet, 0));
          edtRschet.Text := GetReturnValue(sgRQOrgRschet, 1);

          RQOrgRschetObj.mfo := GetReturnValue(sgRQOrgRschet, 3);
          edtMfo.Text := GetReturnValue(sgRQOrgRschet, 3);
          edtBankName.Text := GetReturnValue(sgRQOrgRschet, 2);

          edtCurrencyCode.Text := GetReturnValue(sgRQOrgRschet, 5);
          edtCurrencyName.Text := GetReturnValue(sgRQOrgRschet, 6);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgRschetShow.Free;
  end;
end;

procedure TfrmRQOrgRschetEdit.spbRschet_typeClick(Sender: TObject);
var
  frmRschet_typeShow: TfrmRschet_typeShow;
begin
  frmRschet_typeShow := TfrmRschet_typeShow.Create(Application, fmNormal);
  try
    with frmRschet_typeShow do
      if ShowModal = mrOk then
      begin
        try
          RQOrgRschetObj.rschet_type_id := StrToInt(GetReturnValue(sgRschet_type, 1));
          edtRschet_type.Text := GetReturnValue(sgRschet_type, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRschet_typeShow.Free;
  end;
end;

procedure TfrmRQOrgRschetEdit.spbTransitOrgCodeClick(Sender: TObject);
var
  frmRQOrgShow: TfrmRQOrgShow;
  orgFilter: RQOrgFilter;
begin
  if orgId = LOW_INT then Exit;

  orgFilter := RQOrgFilter.Create;
  SetNullIntProps(orgFilter);
  SetNullXSProps(orgFilter);

  orgFilter.conditionSQL := 'ORG.ID <> ' + IntToStr(orgId);

  frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal, orgFilter);
  try
    {
    if (contrAgentType = AX_CONTRAGENT_TYPE_CUSTOMER) or
       (contrAgentType = AX_CONTRAGENT_TYPE_VENDOR) then
      frmRQOrgShow.contrAgentType := contrAgentType
    else
      raise Exception.Create('Некорректный тип контрагента!');
    }

    with frmRQOrgShow do
      if ShowModal = mrOk then
      begin
        try
          transitOrgId := StrToInt(GetReturnValue(sgRQOrg, 0));
          transitAxOrgAccount := GetReturnValue(sgRQOrg, 25);

          edtTransitOrgCode.Text := GetReturnValue(sgRQOrg, 8);
          edtTransitOrgOKPO.Text := GetReturnValue(sgRQOrg, 2);
          edtTransitOrgName.Text := GetReturnValue(sgRQOrg, 1);

          ClearControls([edtRschet, edtMfo, edtBankName, edtCurrencyCode, edtCurrencyName]);
          RQOrgRschetObj.mfo := '';
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrgShow.Free;
  end;
end;

procedure TfrmRQOrgRschetEdit.chbIsTransitClick(Sender: TObject);
begin
  HideControls([spbRschet, gbTransitOrg], not chbIsTransit.Checked);
  if chbIsTransit.Checked then
  begin
    ClearControls([edtRschet, edtMfo, edtBankName,
                   edtCurrencyCode, edtCurrencyName]);
  end
  else begin
    transitOrgId := LOW_INT;
    transitAxOrgAccount := '';
    ClearControls([edtRschet, edtMfo, edtBankName,
                   edtTransitOrgCode, edtTransitOrgOKPO, edtTransitOrgName]);
    SetDefaultCurrency;
  end;

  DisableControls([edtRschet, gbBank, gbCurrency], chbIsTransit.Checked);
  DenyBlankValues([edtRschet, gbBank, gbCurrency]);
end;

procedure TfrmRQOrgRschetEdit.edtRschetExit(Sender: TObject);
var
  bankCode : String;
  TempRQOrgbank : RQOrgBankControllerSoapPort;
  filter : RQOrgBankFilter;
  list : RQOrgBankShortList;
begin
  inherited;
  if FinancialUtilsUnit.IsAccountIBANSimilar(Trim(edtRschet.Text)) then begin
    try
       bankCode := FinancialUtilsUnit.GetBankCodeFromIBAN(Trim(edtRschet.Text));
       if Length(Trim(bankCode)) = 0 then Exit;
    except on Exception do Exit;
    end;
    TempRQOrgbank := HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;
    filter := RQOrgBankFilter.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);
    filter.mfo := bankCode;
    list := TempRQOrgBank.getScrollableFilteredList(filter, 0, -1);
    if list.totalCount > 0 then begin
      SetBankCode(list.list[0].mfo, list.list[0].name);
    end;
  end;

end;

procedure TfrmRQOrgRschetEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempRQOrgRschet: RQOrgRschetControllerSoapPort;
  //isCustomer: Boolean;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      //edtId
      edtRschet
      ,edtRschet_type
      ,edtMfo
      ,edtBankName
      ,edtCurrencyCode
      ,edtCurrencyName
     ])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
    Exit;
  end
  else
  begin
    {
    if (contrAgentType = AX_CONTRAGENT_TYPE_CUSTOMER) then
      isCustomer := true
    else if (contrAgentType = AX_CONTRAGENT_TYPE_VENDOR) then
      isCustomer := false
    else
      raise Exception.Create('Некорректный тип контрагента!');
    }

    TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

    RQOrgRschetObj.orgCodeFK := orgCodeFK;

    {
    if ( edtId.Text <> '' ) then
      RQOrgRschetObj.id := StrToInt(edtId.Text)
    else
      RQOrgRschetObj.id := Low(Integer);
    }

    RQOrgRschetObj.mfo := edtMfo.Text;
    RQOrgRschetObj.bank := RQOrgBank.Create;
    RQOrgRschetObj.bank.name := edtBankName.Text;

    RQOrgRschetObj.rschet := edtRschet.Text;
    RQOrgRschetObj.currency_code := edtCurrencyCode.Text;
    RQOrgRschetObj.primechan := edtPrimechan.Text;

    if dtpLikv_date.Checked then
    begin
      if RQOrgRschetObj.likv_date = nil then
        RQOrgRschetObj.likv_date := TXSDate.Create;
      RQOrgRschetObj.likv_date.XSToNative(GetXSDate(dtpLikv_date.DateTime));
    end
    else
      RQOrgRschetObj.likv_date := nil;

    if chbIsTransit.Checked then
      RQOrgRschetObj.rschet_type := 1
    else
      RQOrgRschetObj.rschet_type := 0;

    if DialogState = dsInsert then
    begin
      RQOrgRschetObj.code := Low(Integer);
      //TempRQOrgRschet.addOrgRschet(RQOrgRschetObj, isCustomer);
      TempRQOrgRschet.addOrgRschet(RQOrgRschetObj);
    end
    else
    if DialogState = dsEdit then
    begin
      //TempRQOrgRschet.save(RQOrgRschetObj);
    end;
  end;
end;


procedure TfrmRQOrgRschetEdit.FormCreate(Sender: TObject);
begin
  inherited;

  //contrAgentType := LOW_INT;
  orgId := LOW_INT;
  orgCodeFK := '';
  axOrgAccount := '';
  transitOrgId := LOW_INT;
  transitAxOrgAccount := '';
end;

end.