unit EditSealInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, RQFKOrderController, RQFKOrderItemController,
  InvokeRegistry, Rio, SOAPHTTPClient, ComCtrls;

type
  TfrmSealInfo = class(TDialogForm)
    edtSealSeries: TEdit;
    lblSealSeries: TLabel;
    lblNumberStart: TLabel;
    edtSealNumberStart: TEdit;
    edtSealName: TEdit;
    lblSealName: TLabel;
    lblSealColor: TLabel;
    edtSealColor: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    spbENSealName: TSpeedButton;
    spbENSealColor: TSpeedButton;
    spbENSealNameClear: TSpeedButton;
    spbENSealColorClear: TSpeedButton;
    lblQuantity: TLabel;
    edtQuantity: TEdit;
    HTTPRIORQFKOrderItem: THTTPRIO;
    lblProductionDate: TLabel;
    edtProductionDate: TDateTimePicker;
    edtExpirationDate: TDateTimePicker;
    lblExpirationDate: TLabel;
    procedure spbENSealNameClick(Sender: TObject);
    procedure spbENSealColorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtProductionDateChange(Sender: TObject);
  private
    expirationPeriodInYears : Integer;
    { Private declarations }
  public
    { Public declarations }
    fkOrderObj : RQFKOrder;
    RQFKOIObj: RQFKOrderItem;
  end;

var
  frmSealInfo: TfrmSealInfo;


implementation

uses ENConsts, ShowENSealNames, ChildFormUnit, ShowENSealColors, ENSealColorsController,
  TKMaterialsController, ENSealNamesController, DMReportsUnit, ENSettingsConsts, DateUtils;


{$R *.dfm}

procedure TfrmSealInfo.edtProductionDateChange(Sender: TObject);
begin
  inherited;
  if edtProductionDate.Checked then begin
    edtExpirationDate.Checked := True;
    edtExpirationDate.Date := IncYear(edtProductionDate.Date, expirationPeriodInYears);
  end else begin
    edtExpirationDate.Checked := False;
  end;
end;

procedure TfrmSealInfo.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and (DialogState = dsEdit) then

  if  not NoBlankValues([edtSealSeries, edtSealName, edtSealNumberStart]) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end;

  if (Assigned(Self.fkOrderObj))
    and (Self.fkOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_IMP)
    and (not NoBlankValues([edtProductionDate, edtExpirationDate]) ) then begin
      Application.MessageBox(PChar('Для типу обліку ІМП необхідно заповнити дату виготовлення ' +
      ' та строк придатності!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end;


    RQFKOIObj.sealSeriesStart := edtSealSeries.Text;
    if (edtSealNumberStart.Text <> '') then
      RQFKOIObj.sealNumberStart := StrToInt(edtSealNumberStart.Text)
    else
      RQFKOIObj.sealNumberStart := Low(Integer);
    RQFKOIObj.sealName := edtSealName.Text;
    RQFKOIObj.sealColor := edtSealColor.Text;

    RQFKOIObj.productionDate := GetTXSDateFromTDateTimePicker(edtProductionDate);
    RQFKOIObj.expirationDate := GetTXSDateFromTDateTimePicker(edtExpirationDate);

    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
    TempRQFKOrderItem.save(RQFKOIObj);
end;

procedure TfrmSealInfo.FormShow(Sender: TObject);
begin

  Self.expirationPeriodInYears := 0;

   edtSealSeries.Text := RQFKOIObj.sealSeriesStart;

   if RQFKOIObj.sealNumberStart <> Low(Integer) then
   edtSealNumberStart.Text := IntToStr(RQFKOIObj.sealNumberStart)
   else
   edtSealNumberStart.Text := '';
   SetIntStyle(edtSealNumberStart);

   edtSealName.Text := RQFKOIObj.sealName;
   edtSealColor.Text := RQFKOIObj.sealColor;
   edtQuantity.Text := RQFKOIObj.countGen.DecimalString;

   SetDateFieldForDateTimePicker(edtProductionDate, RQFKOIObj.productionDate);
   SetDateFieldForDateTimePicker(edtExpirationDate, RQFKOIObj.expirationDate);

   Self.expirationPeriodInYears := DMReports.getSettingIntValueByKey(ENSettingsConsts.SEALS_DEFAULT_TERM_OF_USE_IN_YEARS);

end;

procedure TfrmSealInfo.spbENSealColorClick(Sender: TObject);
var
   frmENSealColorsShow: TfrmENSealColorsShow;
   colorFilter : ENSealColorsFilter;
begin
   colorFilter := ENSealColorsFilter.Create;
   SetNullXSProps(colorFilter);
   SetNullIntProps(colorFilter);
   colorFilter.materialRef := TKMaterialsRef.Create;
   colorFilter.materialRef.code := RQFKOIObj.material.code;

   frmENSealColorsShow:=TfrmENSealColorsShow.Create(Application,fmNormal,colorFilter);
   try
      with frmENSealColorsShow do
      begin
      DisableActions([actInsert, actDelete, actEdit]);
        if ShowModal = mrOk then
        begin
            try
               edtSealColor.Text:=GetReturnValue(sgENSealColors,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENSealColorsShow.Free;
   end;
end;


procedure TfrmSealInfo.spbENSealNameClick(Sender: TObject);
var
   frmENSealNamesShow: TfrmENSealNamesShow;
   nameFilter : ENSealNamesFilter;
begin
   nameFilter := ENSealNamesFilter.Create;
   SetNullXSProps(nameFilter);
   SetNullIntProps(nameFilter);
   nameFilter.materialRef := TKMaterialsRef.Create;
   nameFilter.materialRef.code := RQFKOIObj.material.code;

   frmENSealNamesShow:=TfrmENSealNamesShow.Create(Application,fmNormal, nameFilter);
   try
      with frmENSealNamesShow do
        begin
        DisableActions([actDelete, actInsert, actEdit]);
          if ShowModal = mrOk then
          begin
              try
                 edtSealName.Text:=GetReturnValue(sgENSealNames,1);
              except
                 on EConvertError do Exit;
              end;
          end;
        end;
   finally
      frmENSealNamesShow.Free;
   end;
end;

end.
