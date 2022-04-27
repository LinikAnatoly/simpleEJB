unit EditOSData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, ComCtrls, RQFKOrderItem2OSDataController,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmOSDataEdit = class(TDialogForm)
    lblOSIstCode: TLabel;
    edtOSIstCode: TEdit;
    edtOSIst: TEdit;
    spbOSIst: TSpeedButton;
    spbOSIstClear: TSpeedButton;
    lblOSPrimechan: TLabel;
    lblOSSubschCode: TLabel;
    edtOSSubschCode: TEdit;
    edtOSSubsch: TEdit;
    spbOSSubsch: TSpeedButton;
    spbOSSubschClear: TSpeedButton;
    edtOSPrimechan: TEdit;
    lblOSVidCode: TLabel;
    edtOSVidCode: TEdit;
    edtOSVid: TEdit;
    spbOSVid: TSpeedButton;
    spbOSVidClear: TSpeedButton;
    lblOSCharacters: TLabel;
    lblOSPrivatCode: TLabel;
    edtOSPrivatCode: TEdit;
    edtOSPrivat: TEdit;
    spbOSPrivat: TSpeedButton;
    spbOSPrivatClear: TSpeedButton;
    memOSCharacters: TMemo;
    lblOSGrCode: TLabel;
    edtOSGrCode: TEdit;
    edtOSGr: TEdit;
    spbOSGr: TSpeedButton;
    spbOSGrClear: TSpeedButton;
    lblOSKlassCode: TLabel;
    edtOSKlassCode: TEdit;
    edtOSKlass: TEdit;
    spbOSKlass: TSpeedButton;
    spbOSKlassClear: TSpeedButton;
    lblOSF_amort: TLabel;
    rdbOSF_amortY: TRadioButton;
    rdbOSF_amortN: TRadioButton;
    lblOSKod_zatr: TLabel;
    edtOSKod_zatr: TEdit;
    lblOSDt_vypusk: TLabel;
    dtpOSDt_vypusk: TDateTimePicker;
    lblOSKod_oborud: TLabel;
    edtOSKod_oborud: TEdit;
    lblOSSum_izn_perv: TLabel;
    edtOSSum_izn_perv: TEdit;
    lblOSKod_nal_nakl: TLabel;
    edtOSKod_nal_nakl: TEdit;
    lblOSSum_izn_perv_n: TLabel;
    edtOSSum_izn_perv_n: TEdit;
    lblOSSum_st_perv_n: TLabel;
    edtOSSum_st_perv_n: TEdit;
    lblOSNum_un: TLabel;
    edtOSNum_un: TEdit;
    lblOSKod_inv: TLabel;
    edtOSKod_inv: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQFKOrderItem2OSData: THTTPRIO;
    gbAdditional: TGroupBox;
    spbOSGrNalog: TSpeedButton;
    spbOSGrNalogClear: TSpeedButton;
    spbOSMetAm: TSpeedButton;
    spbOSMetAmClear: TSpeedButton;
    lblOSGrNalog: TLabel;
    edtOSGrNalogCode: TEdit;
    edtOSGrNalog: TEdit;
    lblOSMetAm: TLabel;
    edtOSMetAmCode: TEdit;
    edtOSMetAm: TEdit;
    spbOSMetAm_n: TSpeedButton;
    spbOSMetAmClear_n: TSpeedButton;
    lblOSMetAm_n: TLabel;
    edtOSMetAmCode_n: TEdit;
    edtOSMetAm_n: TEdit;
    lblOSUseLimit: TLabel;
    edtOSUseLimit: TEdit;
    lblOSUseLimit_n: TLabel;
    edtOSUseLimit_n: TEdit;
    edtOSGrNalogId: TEdit;
    HTTPRIOOSIst: THTTPRIO;
    edtOSPrimechan_vyb: TEdit;
    lblOSPrimechan_vyb: TLabel;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIOOSGrNalog: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbOSIstClick(Sender: TObject);
    procedure spbOSSubschClick(Sender: TObject);
    procedure spbOSVidClick(Sender: TObject);
    procedure spbOSPrivatClick(Sender: TObject);
    procedure spbOSGrClick(Sender: TObject);
    procedure spbOSKlassClick(Sender: TObject);
    procedure spbOSIstClearClick(Sender: TObject);
    procedure spbOSSubschClearClick(Sender: TObject);
    procedure spbOSVidClearClick(Sender: TObject);
    procedure spbOSPrivatClearClick(Sender: TObject);
    procedure spbOSGrClearClick(Sender: TObject);
    procedure spbOSKlassClearClick(Sender: TObject);
    procedure spbOSGrNalogClick(Sender: TObject);
    procedure spbOSMetAmClick(Sender: TObject);
    procedure spbOSGrNalogClearClick(Sender: TObject);
    procedure spbOSMetAmClearClick(Sender: TObject);
    procedure spbOSMetAmClear_nClick(Sender: TObject);
    procedure spbOSMetAm_nClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadOSData();
    procedure LockUnlockOSData(lock: Boolean = true);
    procedure ClearAdditionalData;
  public
    { Public declarations }
    OSData: RQFKOrderItem2OSData;
    buhDate: String;
    sumWithoutNds, numberDoc: String;
    orderStatusCode: Integer;
    orderKindCode: Integer;
    num_un: Integer;
    itemCodesArr: RQFKOrderItem2OSDataController.ArrayOfInteger;
  end;

var
  frmOSDataEdit: TfrmOSDataEdit;

implementation

uses ENConsts, ShowOSIst, OSIstController, ChildFormUnit, ShowOSSubsch,
  OSSubschController, ShowOSVid, ShowOSPrivat, OSPrivatController, ShowOSGr,
  ShowOSKlass, RQFKOrderItemController, XSBuiltIns, ShowOSGrNalog, ShowOSMetAm,
  OSGrNalogController, OSMetAmController, RQFKOrderController;

{$R *.dfm}

{ TfrmOSDataEdit }

procedure TfrmOSDataEdit.ClearAdditionalData;
begin
  ClearControlChildren(gbAdditional);
end;

procedure TfrmOSDataEdit.FormClose(Sender: TObject; var Action: TCloseAction);
var TempRQFKOrderItem2OSData: RQFKOrderItem2OSDataControllerSoapPort;
    newOSDataCode: Integer;
    str, strMessage: String;

    TempOSGrNalog: OSGrNalogControllerSoapPort;
    min_spi: Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin
    ////////////////////////////////////////////////////////////////////////////
    // Проверки на заполнение обязательных полей для каждого типа ордера
    if orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    begin
      if not NoBlankValues([edtOSIstCode, edtOSSubschCode, edtOSVidCode, edtOSPrivatCode,
                            edtOSGrCode, {edtOSKod_nal_nakl,}
                            edtOSKod_zatr]) then
      begin
        Application.MessageBox(PChar('Заповніть, будь ласка, обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING);
        Action := caNone;
        Exit;
      end;
    end
    else if orderKindCode = RQFKORDER_KIND_OS_EXPL then
    begin
      if not NoBlankValues([edtOSIstCode, edtOSSubschCode, edtOSKod_zatr]) then
      begin
        Application.MessageBox(PChar('Заповніть, будь ласка, обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING);
        Action := caNone;
        Exit;
      end;
    end;

    if (orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (orderKindCode = RQFKORDER_KIND_OS_EXPL) then
    begin
      ///// 29.11.12 Пожелания бухгалтерии
      // Если 10-й или 12-й счет - то "Код затрат №1" <> 15 нулей
      str := Copy(edtOSSubschCode.Text, 1, 2);
      // Должно быть указано 15 символов. Незаполненное дополняется нулями
      while (Length(edtOSKod_zatr.Text) < 15) do
        edtOSKod_zatr.Text := edtOSKod_zatr.Text + '0';
      if (str <> '15') and (edtOSKod_zatr.Text = '000000000000000') then
      begin
        Application.MessageBox(PChar('Неприпустиме значення в полі "Код витрат №1" для рахунку ' + edtOSSubschCode.Text + '!'),
                               PChar('Увага!'), MB_ICONWARNING);
        edtOSKod_zatr.SetFocus;
        Action := caNone;
        Exit;
      end;
    end;
    ////////////////////////////////////////////////////////////////////////////


    ////////////////////////////////////////////////////////////////////////////
    // Общие проверки
    if High(itemCodesArr) = -1 then
    begin
      Application.MessageBox(PChar('Виберіть хоча б одну строку !'), PChar('Увага !'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Создание связки
    TempRQFKOrderItem2OSData := HTTPRIORQFKOrderItem2OSData as RQFKOrderItem2OSDataControllerSoapPort;

    if OSData = nil then
    begin
      OSData := RQFKOrderItem2OSData.Create;
      //OSData.code := LOW_INT;
      SetNullIntProps(OSData);
      SetNullXSProps(OSData);

      //OSData.fkOrderItemRef := RQFKOrderItemRef.Create;
      //OSData.fkOrderItemRef.code := LOW_INT; //RQFKOrderItemObj.code;
    end;
    {
    else begin
      if OSData.code > LOW_INT then
        OSData := TempRQFKOrderItem2OSData.getObject(OSData.code)
      else
        raise Exception.Create('Помилка під час вибору бух. даних для ОЗ!');
    end;
    }

    /////
    OSData.code := LOW_INT;

    OSData.fkOrderItemRef := RQFKOrderItemRef.Create;
    OSData.fkOrderItemRef.code := LOW_INT; //RQFKOrderItemObj.code;
    /////
    ////////////////////////////////////////////////////////////////////////////


    ////////////////////////////////////////////////////////////////////////////
    // Добавление связки
    if orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    begin
      if (str <> '15') then
        if not NoBlankValues([edtOSGrNalogId, edtOSMetAmCode, edtOSMetAmCode_n, edtOSUseLimit, edtOSUseLimit_n]) then
        begin
          Application.MessageBox(PChar('Заповніть, будь ласка, обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING);
          Action := caNone;
          Exit;
        end;

      OSData.kod_ist := edtOSIstCode.Text;
      OSData.name_ist := edtOSIst.Text;

      OSData.kod_subsch := edtOSSubschCode.Text;
      OSData.name_subsch := edtOSSubsch.Text;

      OSData.kod_vid := edtOSVidCode.Text;
      OSData.name_vid := edtOSVid.Text;

      OSData.kod_privat := edtOSPrivatCode.Text;
      OSData.name_privat := edtOSPrivat.Text;

      OSData.kod_gr := edtOSGrCode.Text;
      OSData.name_gr := edtOSGr.Text;

      if edtOSKlassCode.Text <> '' then
      begin
        try
          OSData.num_klass := StrToInt(edtOSKlassCode.Text);
          OSData.name_klass := edtOSKlass.Text;
        except
          on EConvertError do
            raise Exception.Create('Невірне значення у полі "Код КОФ"! Поле має бути числовим!');
        end;
      end
      else begin
        OSData.num_klass := LOW_INT;
        OSData.name_klass := '';
      end;

      /////
      if edtOSGrNalogId.Text <> '' then
      begin
        try
          OSData.id_amort := StrToInt(edtOSGrNalogId.Text);
          OSData.kod_amort := edtOSGrNalogCode.Text;
          OSData.name_amort := edtOSGrNalog.Text;
        except
          on EConvertError do
            raise Exception.Create('Невірне значення у полі "Група амортизації"! Поле має бути числовим!');
        end;
      end
      else begin
        OSData.id_amort := LOW_INT;
        OSData.kod_amort := '';
        OSData.name_amort := '';
      end;

      if edtOSMetAmCode.Text <> '' then
      begin
        try
          OSData.kod_am := StrToInt(edtOSMetAmCode.Text);
          OSData.name_am := edtOSMetAm.Text;
        except
          on EConvertError do
            raise Exception.Create('Невірне значення у полі "Метод амортизації (бух.)"! Поле має бути числовим!');
        end;
      end
      else begin
        OSData.kod_am := LOW_INT;
        OSData.name_am := '';
      end;

      if edtOSMetAmCode_n.Text <> '' then
      begin
        try
          OSData.kod_am_n := StrToInt(edtOSMetAmCode_n.Text);
          OSData.name_am_n := edtOSMetAm_n.Text;
        except
          on EConvertError do
            raise Exception.Create('Невірне значення у полі "Метод амортизації (нал.)"! Поле має бути числовим!');
        end;
      end
      else begin
        OSData.kod_am_n := LOW_INT;
        OSData.name_am_n := '';
      end;

      if edtOSUseLimit.Text <> '' then
        OSData.use_limit := StrToInt(edtOSUseLimit.Text)
      else
        OSData.use_limit := LOW_INT;

      if edtOSUseLimit_n.Text <> '' then
        OSData.use_limit_n := StrToInt(edtOSUseLimit_n.Text)
      else
        OSData.use_limit_n := LOW_INT;
      /////

      if rdbOSF_amortY.Checked then
        OSData.f_amort := 'Y'
      else
        OSData.f_amort := 'N';

      if dtpOSDt_vypusk.Checked then
      begin
        if OSData.dt_vypusk = nil then
          OSData.dt_vypusk := TXSDate.Create;
        OSData.dt_vypusk.XSToNative(GetXSDate(dtpOSDt_vypusk.DateTime));
      end
      else
        OSData.dt_vypusk := nil;

      if edtOSSum_izn_perv.Text <> '' then
      begin
        if OSData.sum_izn_perv = nil then
          OSData.sum_izn_perv := TXSDecimal.Create;
        OSData.sum_izn_perv.DecimalString := edtOSSum_izn_perv.Text;
      end
      else
        OSData.sum_izn_perv := nil;

      if edtOSSum_izn_perv_n.Text <> '' then
      begin
        if OSData.sum_izn_perv_n = nil then
          OSData.sum_izn_perv_n := TXSDecimal.Create;
        OSData.sum_izn_perv_n.DecimalString := edtOSSum_izn_perv_n.Text;
      end
      else
        OSData.sum_izn_perv_n := nil;

      if edtOSSum_st_perv_n.Text <> '' then
      begin
        if OSData.sum_st_perv_n = nil then
          OSData.sum_st_perv_n := TXSDecimal.Create;
        OSData.sum_st_perv_n.DecimalString := edtOSSum_st_perv_n.Text;
      end
      else
        OSData.sum_st_perv_n := nil;

      // Должно быть указано 15 символов. Незаполненное дополняется нулями
      while (Length(edtOSKod_zatr.Text) < 15) do
        edtOSKod_zatr.Text := edtOSKod_zatr.Text + '0';
      OSData.kod_zatr := edtOSKod_zatr.Text;

      OSData.kod_oborud := edtOSKod_oborud.Text;

      OSData.primechan := Trim(edtOSPrimechan.Text);
      OSData.characters := Trim(memOSCharacters.Text);

      OSData.kod_nal_nakl := edtOSKod_nal_nakl.Text;

      {
      // Добавляем (или сохраняем, если уже есть) связку
      if OSData.code = LOW_INT then
      begin
        newOSDataCode := TempRQFKOrderItem2OSData.add(OSData);
        /// перечитаем
        //OSData := TempRQFKOrderItem2OSData.getObject(newOSDataCode);
        //updateOSDataTab;
      end
      else begin
        TempRQFKOrderItem2OSData.save(OSData);
        //updateOSDataTab;
      end;
      }

      //TempRQFKOrderItem2OSData.addForOrderItems(OSData, itemCodesArr);

    end // if orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA

    else if orderKindCode = RQFKORDER_KIND_OS_EXPL then
    begin
      if (str <> '15') then
        if not NoBlankValues([edtOSGrNalogId, edtOSUseLimit, edtOSUseLimit_n]) then
        begin
          Application.MessageBox(PChar('Заповніть, будь ласка, обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING);
          Action := caNone;
          Exit;
        end;

      if memOSCharacters.Visible then
        if not NoBlankValues([memOSCharacters]) then
        begin
          Application.MessageBox(PChar('Заповніть, будь ласка, характеристику!'), PChar('Увага!'), MB_ICONWARNING);
          if memOSCharacters.CanFocus then memOSCharacters.SetFocus;
          Action := caNone;
          Exit;
        end;

      OSData.kod_ist := edtOSIstCode.Text;
      OSData.name_ist := edtOSIst.Text;

      OSData.kod_subsch := edtOSSubschCode.Text;
      OSData.name_subsch := edtOSSubsch.Text;

      // Обязательные поля (нот-наллы в базе), но тут они нам не нужны
      /////
      OSData.kod_vid := '-';
      OSData.kod_privat := '-';
      OSData.kod_gr := '-';
      OSData.f_amort := '-';
      //OSData.kod_nal_nakl := '-';

      if OSData.sum_st_perv_n = nil then
        OSData.sum_st_perv_n := TXSDecimal.Create;
      OSData.sum_st_perv_n.DecimalString := '0';
      /////

      min_spi := LOW_INT;

      /////
      if edtOSGrNalogId.Text <> '' then
      begin
        try
          OSData.id_amort := StrToInt(edtOSGrNalogId.Text);
          OSData.kod_amort := edtOSGrNalogCode.Text;
          OSData.name_amort := edtOSGrNalog.Text;

          /// 08.02.13 
          TempOSGrNalog := HTTPRIOOSGrNalog as OSGrNalogControllerSoapPort;
          min_spi := TempOSGrNalog.getMinSPIForGrNalog(OSData.kod_amort);
          ///
        except
          on EConvertError do
            raise Exception.Create('Невірне значення у полі "Група амортизації"! Поле має бути числовим!');
        end;
      end
      else begin
        OSData.id_amort := LOW_INT;
        OSData.kod_amort := '';
        OSData.name_amort := '';
      end;

      if edtOSUseLimit.Text <> '' then
        OSData.use_limit := StrToInt(edtOSUseLimit.Text)
      else
        OSData.use_limit := LOW_INT;

      if edtOSUseLimit_n.Text <> '' then
        OSData.use_limit_n := StrToInt(edtOSUseLimit_n.Text)
      else
        OSData.use_limit_n := LOW_INT;
      /////

      /// 08.02.13 Мин. СПИ (нал.) не может быть меньше, чем в справочнике!
      if OSData.use_limit_n < min_spi then
      begin
        Application.MessageBox(PChar('Податковий строк корисного використання не може бути меншим, ' +
                                     'ніж мінімальне значення для обраної групи амортизації (' + IntToStr(min_spi) + ') !'),
                               PChar('Увага!'), MB_ICONWARNING);
        edtOSUseLimit_n.SetFocus;
        Action := caNone;
        Exit;
      end;
      ///

      // Должно быть указано 15 символов. Незаполненное дополняется нулями
      while (Length(edtOSKod_zatr.Text) < 15) do
        edtOSKod_zatr.Text := edtOSKod_zatr.Text + '0';
      OSData.kod_zatr := edtOSKod_zatr.Text;

      OSData.primechan := Trim(edtOSPrimechan.Text);
      OSData.characters := Trim(memOSCharacters.Text);

      //TempRQFKOrderItem2OSData.addForOrderItems(OSData, itemCodesArr);
      
    end // else if orderKindCode = RQFKORDER_KIND_OS_EXPL

    else if orderKindCode = RQFKORDER_KIND_OS_MOVEMENT then
    begin
      if memOSCharacters.Visible then
        if not NoBlankValues([memOSCharacters]) then
        begin
          Application.MessageBox(PChar('Заповніть, будь ласка, характеристику!'), PChar('Увага!'), MB_ICONWARNING);
          if memOSCharacters.CanFocus then memOSCharacters.SetFocus;
          Action := caNone;
          Exit;
        end;

      // Обязательные поля (нот-наллы в базе), но тут они нам не нужны
      /////
      OSData.kod_ist := '-';
      OSData.kod_subsch := '-';
      OSData.kod_vid := '-';
      OSData.kod_privat := '-';
      OSData.kod_gr := '-';
      OSData.f_amort := '-';
      //OSData.kod_nal_nakl := '-';

      if OSData.sum_st_perv_n = nil then
        OSData.sum_st_perv_n := TXSDecimal.Create;
      OSData.sum_st_perv_n.DecimalString := '0';
      /////

      OSData.primechan := Trim(edtOSPrimechan.Text);
      OSData.characters := Trim(memOSCharacters.Text);
      OSData.primechan_vyb := Trim(edtOSPrimechan_vyb.Text);

      //TempRQFKOrderItem2OSData.addForOrderItems(OSData, itemCodesArr);
      
    end; // else if orderKindCode = RQFKORDER_KIND_OS_MOVEMENT
    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////
    // Сохранение связки
    if High(itemCodesArr) > 0 then
      strMessage := 'Ви дійсно бажаєте змінити бух. дані для ВСІХ ОБРАНИХ строк ордеру?'
    else
      strMessage := 'Ви дійсно бажаєте змінити бух. дані для обраної строки ордеру?';

    //if Application.MessageBox(PChar('Ви дійсно бажаєте змінити бух. дані для ВСІХ ОБРАНИХ строк ордеру?'),
    if Application.MessageBox(PChar(strMessage),
                              PChar('Увага !'),
                              MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    begin
      Action := caNone;
      Exit;
    end;

    TempRQFKOrderItem2OSData.addForOrderItems(OSData, itemCodesArr);
    ////////////////////////////////////////////////////////////////////////////

  end; // if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert))
end;

procedure TfrmOSDataEdit.FormCreate(Sender: TObject);
begin
  inherited;

  OSData := nil;
  buhDate := '';
  sumWithoutNds := '';
  numberDoc := '';
  orderStatusCode := LOW_INT;
  orderKindCode := LOW_INT;
  num_un := LOW_INT;
  SetLength(itemCodesArr, 0);
end;

procedure TfrmOSDataEdit.FormShow(Sender: TObject);
var i: Integer;
begin
  DisableControls([
       edtOSIstCode, edtOSIst
      ,edtOSSubschCode, edtOSSubsch
      ,edtOSVidCode, edtOSVid
      ,edtOSPrivatCode, edtOSPrivat
      ,edtOSGrCode, edtOSGr
      ,edtOSKlassCode, edtOSKlass

      ,edtOSGrNalogId, edtOSGrNalogCode, edtOSGrNalog
      ,edtOSMetAmCode, edtOSMetAm
      ,edtOSMetAmCode_n, edtOSMetAm_n

      ,rdbOSF_amortY, rdbOSF_amortN
      ,dtpOSDt_vypusk
      ,edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n
      ,edtOSKod_zatr, edtOSKod_oborud
      ,edtOSPrimechan, memOSCharacters, edtOSPrimechan_vyb
      ,edtOSKod_nal_nakl

      ,edtOSNum_un, edtOSKod_inv
   ]);

  SetFloatStyle([edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n]);
  SetIntStyle([edtOSKlassCode, edtOSUseLimit, edtOSUseLimit_n]);

  HideControls([lblOSNum_un, edtOSNum_un, lblOSKod_inv, edtOSKod_inv], (orderStatusCode <> RQFKORDER_STATUS_OS_IN_FK));

  // Доступно только для не 15-х счетов
  HideControls([gbAdditional]);

  // Доступно только для внутр. перемещений
  HideControls([lblOSPrimechan_vyb, edtOSPrimechan_vyb]);

  LoadOSData();

  if DialogState = dsEdit then
    LockUnlockOSData(false)
  else
    LockUnlockOSData(true);


  ///////
  if orderKindCode = RQFKORDER_KIND_OS_EXPL then
  begin
    for i := 0 to Self.ControlCount - 1 do
      HideControls([Self.Controls[i]]);

    HideControls([lblOSIstCode, edtOSIstCode, edtOSIst, spbOSIst, spbOSIstClear,
                  lblOSSubschCode, edtOSSubschCode, edtOSSubsch, spbOSSubsch, spbOSSubschClear,
                  lblOSKod_zatr, edtOSKod_zatr,
                  {*****} lblOSPrimechan, edtOSPrimechan, lblOSCharacters, memOSCharacters, {*****}
                  gbAdditional, btnOk, btnCancel], false);

    HideControls([lblOSMetAm, edtOSMetAmCode, edtOSMetAm, spbOSMetAm, spbOSMetAmClear,
                  lblOSMetAm_n, edtOSMetAmCode_n, edtOSMetAm_n, spbOSMetAm_n, spbOSMetAmClear_n]);

    HideControls([lblOSNum_un, edtOSNum_un, lblOSKod_inv, edtOSKod_inv], (orderStatusCode <> RQFKORDER_STATUS_OS_IN_FK));
    
    gbAdditional.Top := 65;
    //***btnOk.Top := 220;
    //***btnCancel.Top := 220;

    btnOk.Top := 320;
    btnCancel.Top := 320;

    //***btnOk.Left := 412;
    //***btnCancel.Left := 521;

    lblOSKod_zatr.Left := 34;
    edtOSKod_zatr.Left := 138;
    lblOSKod_zatr.Top := 187;
    edtOSKod_zatr.Top := 185;

    ///
    lblOSNum_un.Left := 34;
    lblOSNum_un.Top := 224;

    edtOSNum_un.Left := 138;
    edtOSNum_un.Top := 220;

    lblOSKod_inv.Left := 34;
    lblOSKod_inv.Top := 248;

    edtOSKod_inv.Left := 138;
    edtOSKod_inv.Top := 244;
    ///

    lblOSUseLimit.Top := 52;
    edtOSUseLimit.Top := 54;
    lblOSUseLimit_n.Top := 52;
    edtOSUseLimit_n.Top := 54;
    gbAdditional.Height := 100;
    //***Self.Height := 315;
    Self.Height := 415;
    //***Self.Width := 654;
  end;

  if orderKindCode = RQFKORDER_KIND_OS_MOVEMENT then
  begin
    for i := 0 to Self.ControlCount - 1 do
      HideControls([Self.Controls[i]]);

    HideControls([lblOSPrimechan, edtOSPrimechan, lblOSCharacters, memOSCharacters,
                  lblOSPrimechan_vyb, edtOSPrimechan_vyb,
                  btnOk, btnCancel], false);

    HideControls([lblOSNum_un, edtOSNum_un, lblOSKod_inv, edtOSKod_inv], (orderStatusCode <> RQFKORDER_STATUS_OS_IN_FK));
    
    //***btnOk.Top := 220;
    //***btnCancel.Top := 220;

    btnOk.Top := 320;
    btnCancel.Top := 320;

    btnOk.Left := 412;
    btnCancel.Left := 521;

    ///
    lblOSNum_un.Left := 34;
    //lblOSNum_un.Top := 224;
    lblOSNum_un.Top := 304;

    edtOSNum_un.Left := 138;
    //edtOSNum_un.Top := 220;
    edtOSNum_un.Top := 300;

    lblOSKod_inv.Left := 34;
    //lblOSKod_inv.Top := 248;
    lblOSKod_inv.Top := 328;

    edtOSKod_inv.Left := 138;
    //edtOSKod_inv.Top := 244;
    edtOSKod_inv.Top := 324;
    ///

    lblOSPrimechan.Left := 41;
    edtOSPrimechan.Left := 34;
    lblOSCharacters.Left := 41;
    memOSCharacters.Left := 34;
    lblOSPrimechan_vyb.Left := 41;
    edtOSPrimechan_vyb.Left := 34;

    //Self.Height := 315;
    Self.Height := 415;
    Self.Width := 654;
  end;

  if (orderKindCode = RQFKORDER_KIND_OS_EXPL) or (orderKindCode = RQFKORDER_KIND_OS_MOVEMENT) then
  begin
    // Если меняют реквизиты для более, чем 1-го ОС, то поле "Характеристика" прячем -
    // пусть меняют для каждого ОС индивидуально
    if High(itemCodesArr) > 0 then
      HideControls([lblOSCharacters, memOSCharacters]);
  end;
  ///////
end;

procedure TfrmOSDataEdit.LoadOSData();
var str: String;
    TempOSIst: OSIstControllerSoapPort;
    osIstFilterObj: OSIstFilter;
    osIstList: OSIstShortList;

    TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  dtpOSDt_vypusk.Date := SysUtils.Date;
  dtpOSDt_vypusk.Checked := false;
  rdbOSF_amortY.Checked := true;

  ClearControls([edtOSIstCode, edtOSIst
                ,edtOSSubschCode, edtOSSubsch
                ,edtOSVidCode, edtOSVid
                ,edtOSPrivatCode, edtOSPrivat
                ,edtOSGrCode, edtOSGr
                ,edtOSKlassCode, edtOSKlass
                ,edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n
                ,edtOSKod_zatr, edtOSKod_oborud
                ,edtOSPrimechan, memOSCharacters, edtOSPrimechan_vyb
                ,edtOSKod_nal_nakl
                ,edtOSNum_un, edtOSKod_inv]);

  //////////////////
  ClearAdditionalData;
  //////////////////

  ///// Значения по умолчанию
  if DialogState <> dsView then
  begin
    if orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    begin
      edtOSSubschCode.Text := '1520';
      edtOSSubsch.Text := 'ПРИОБРЕТЕНИЕ ОСНОВНЫХ СРЕДСТВ';
      edtOSGrCode.Text := '1';
      edtOSGr.Text := 'ПРОМЫШЛЕННО-ПРОИЗВ.ОС';

      edtOSKod_zatr.Text := '000000000000000';

      edtOSKod_nal_nakl.Text := numberDoc;
    end;

    if orderKindCode = RQFKORDER_KIND_OS_EXPL then
    begin
      TempOSIst := HTTPRIOOSIst as OSIstControllerSoapPort;

      // Значение по умолчанию для источника
      edtOSIstCode.Text := TempOSIst.getOSIstCondition(false);
      if edtOSIstCode.Text <> '' then
      begin
        osIstFilterObj := OSIstFilter.Create;
        SetNullIntProps(osIstFilterObj);
        SetNullXSProps(osIstFilterObj);

        osIstFilterObj.kod_ist := edtOSIstCode.Text;

        osIstList := TempOSIst.getScrollableFilteredList(osIstFilterObj, 0, -1);

        if osIstList.totalCount > 0 then
          edtOSIst.Text := osIstList.list[0].name_ist;
      end;
    end;

    if (orderKindCode = RQFKORDER_KIND_OS_EXPL) or (orderKindCode = RQFKORDER_KIND_OS_MOVEMENT) then
    begin
      TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
      if num_un > 0 then
      begin
        MakeMultiline(memOSCharacters.Lines, TempRQFKOrder.getOSCharacteristic(num_un));
        edtOSPrimechan.Text := TempRQFKOrder.getOSComment(num_un);
      end;
    end;

  end; // if DialogState <> dsView
  /////

  if OSData <> nil then
    if OSData.code > LOW_INT then
    begin
      edtOSIstCode.Text := OSData.kod_ist;
      edtOSIst.Text := OSData.name_ist;

      edtOSSubschCode.Text := OSData.kod_subsch;
      edtOSSubsch.Text := OSData.name_subsch;

      edtOSVidCode.Text := OSData.kod_vid;
      edtOSVid.Text := OSData.name_vid;

      edtOSPrivatCode.Text := OSData.kod_privat;
      edtOSPrivat.Text := OSData.name_privat;

      edtOSGrCode.Text := OSData.kod_gr;
      edtOSGr.Text := OSData.name_gr;

      if OSData.num_klass > LOW_INT then
      begin
        edtOSKlassCode.Text := IntToStr(OSData.num_klass);
        edtOSKlass.Text := OSData.name_klass;
      end
      else begin
        edtOSKlassCode.Text := '';
        edtOSKlass.Text := '';
      end;

      //////////
      str := Copy(OSData.kod_subsch, 1, 2);
      if str = '15' then
        ClearAdditionalData;
      HideControls([gbAdditional], (str = '15'));

      if OSData.id_amort > LOW_INT then
      begin
        edtOSGrNalogId.Text := IntToStr(OSData.id_amort);
        edtOSGrNalogCode.Text := OSData.kod_amort;
        edtOSGrNalog.Text := OSData.name_amort;
      end
      else begin
        edtOSGrNalogId.Text := '';
        edtOSGrNalogCode.Text := '';
        edtOSGrNalog.Text := '';
      end;

      if OSData.kod_am > LOW_INT then
      begin
        edtOSMetAmCode.Text := IntToStr(OSData.kod_am);
        edtOSMetAm.Text := OSData.name_am;
      end
      else begin
        edtOSMetAmCode.Text := '';
        edtOSMetAm.Text := '';
      end;

      if OSData.kod_am_n > LOW_INT then
      begin
        edtOSMetAmCode_n.Text := IntToStr(OSData.kod_am_n);
        edtOSMetAm_n.Text := OSData.name_am_n;
      end
      else begin
        edtOSMetAmCode_n.Text := '';
        edtOSMetAm_n.Text := '';
      end;

      if OSData.use_limit > LOW_INT then
        edtOSUseLimit.Text := IntToStr(OSData.use_limit)
      else
        edtOSUseLimit.Text := '';

      if OSData.use_limit_n > LOW_INT then
        edtOSUseLimit_n.Text := IntToStr(OSData.use_limit_n)
      else
        edtOSUseLimit_n.Text := '';
      //////////

      if OSData.f_amort = 'Y' then
        rdbOSF_amortY.Checked := true
      else
        rdbOSF_amortN.Checked := true;

      if OSData.dt_vypusk <> nil then
      begin
        dtpOSDt_vypusk.DateTime := EncodeDate(OSData.dt_vypusk.Year,
                                              OSData.dt_vypusk.Month,
                                              OSData.dt_vypusk.Day);
        dtpOSDt_vypusk.Checked := true;
      end
      else begin
        dtpOSDt_vypusk.DateTime := SysUtils.Date;
        dtpOSDt_vypusk.Checked := false;
      end;

      if OSData.sum_izn_perv <> nil then
        edtOSSum_izn_perv.Text := OSData.sum_izn_perv.DecimalString
      else
        edtOSSum_izn_perv.Text := '';

      if OSData.sum_izn_perv_n <> nil then
        edtOSSum_izn_perv_n.Text := OSData.sum_izn_perv_n.DecimalString
      else
        edtOSSum_izn_perv_n.Text := '';

      if OSData.sum_st_perv_n <> nil then
        edtOSSum_st_perv_n.Text := OSData.sum_st_perv_n.DecimalString
      else
        //edtOSSum_st_perv_n.Text := '';
        edtOSSum_st_perv_n.Text := sumWithoutNds;

      edtOSKod_zatr.Text := OSData.kod_zatr;

      edtOSKod_oborud.Text := OSData.kod_oborud;

      edtOSPrimechan.Text := OSData.primechan;
      MakeMultiline(memOSCharacters.Lines, OSData.characters);
      edtOSPrimechan_vyb.Text := OSData.primechan_vyb;

      if OSData.kod_nal_nakl <> '' then
        edtOSKod_nal_nakl.Text := OSData.kod_nal_nakl
      else
        edtOSKod_nal_nakl.Text := numberDoc;

      /////
      if OSData.num_un > LOW_INT then
        edtOSNum_un.Text := IntToStr(OSData.num_un)
      else
        edtOSNum_un.Text := '';

      edtOSKod_inv.Text := OSData.kod_inv;
      /////
    end;
end;

procedure TfrmOSDataEdit.LockUnlockOSData(lock: Boolean);
begin
  // Если ордер не в статусе "Складений", ничего не разлочиваем !!!
  if not (orderStatusCode in [RQFKORDER_STATUS_CREATED
  , RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE]) then
  begin
    DisableControls([spbOSIst, spbOSIstClear,
                     spbOSSubsch, spbOSSubschClear,
                     spbOSVid, spbOSVidClear,
                     spbOSPrivat, spbOSPrivatClear,
                     spbOSGr, spbOSGrClear,
                     spbOSKlass, spbOSKlassClear,

                     spbOSGrNalog, spbOSGrNalogClear,
                     spbOSMetAm, spbOSMetAmClear,
                     spbOSMetAm_n, spbOSMetAmClear_n,

                     rdbOSF_amortY, rdbOSF_amortN,
                     dtpOSDt_vypusk,
                     edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n,
                     edtOSKod_nal_nakl,
                     edtOSKod_zatr, edtOSKod_oborud,
                     edtOSPrimechan, memOSCharacters, edtOSPrimechan_vyb,

                     edtOSUseLimit, edtOSUseLimit_n]);

    // DisableControls([btnOSDataEdit, btnOSDataSave, btnOSDataCancel]);

    Exit;
  end;

  DisableControls([spbOSIst, spbOSIstClear,
                   spbOSSubsch, spbOSSubschClear,
                   spbOSVid, spbOSVidClear,
                   spbOSPrivat, spbOSPrivatClear,
                   spbOSGr, spbOSGrClear,
                   spbOSKlass, spbOSKlassClear,

                   spbOSGrNalog, spbOSGrNalogClear,
                   spbOSMetAm, spbOSMetAmClear,
                   spbOSMetAm_n, spbOSMetAmClear_n,

                   rdbOSF_amortY, rdbOSF_amortN,
                   dtpOSDt_vypusk,
                   edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n,
                   edtOSKod_nal_nakl,
                   edtOSKod_zatr, edtOSKod_oborud,
                   edtOSPrimechan, memOSCharacters, edtOSPrimechan_vyb,

                   edtOSUseLimit, edtOSUseLimit_n], lock);

  // Лочим/разлочиваем кнопки "Редагувати", "Зберегти" и "Відмінити" (в зависимости от режима)
  {
  if lock then
  begin
    DisableControls([btnOSDataEdit], false);
    DisableControls([btnOSDataSave], true);
    DisableControls([btnOSDataCancel], true);
  end
  else begin
    DisableControls([btnOSDataEdit], true);
    DisableControls([btnOSDataSave], false);
    DisableControls([btnOSDataCancel], false);
  end;
  }
end;

procedure TfrmOSDataEdit.spbOSGrClearClick(Sender: TObject);
begin
  ClearControls([edtOSGrCode, edtOSGr]);
end;

procedure TfrmOSDataEdit.spbOSGrClick(Sender: TObject);
var
  frmOSGrShow: TfrmOSGrShow;
begin
  frmOSGrShow := TfrmOSGrShow.Create(Application, fmNormal);
  try
    with frmOSGrShow do
      if ShowModal = mrOk then
      begin
        edtOSGrCode.Text := GetReturnValue(sgOSGr, 1);
        edtOSGr.Text := GetReturnValue(sgOSGr, 2);
      end;
  finally
    frmOSGrShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSGrNalogClearClick(Sender: TObject);
begin
  ClearControls([edtOSGrNalogId, edtOSGrNalogCode, edtOSGrNalog,
                 edtOSUseLimit, edtOSUseLimit_n]);
end;

procedure TfrmOSDataEdit.spbOSGrNalogClick(Sender: TObject);
var
  frmOSGrNalogShow: TfrmOSGrNalogShow;
  f: OSGrNalogFilter;
  spi: Integer;
begin
  if (edtOSSubschCode.Text = '') then
  begin
    Application.MessageBox(PChar('Спочатку оберіть рахунок!'), PChar('Увага!'), MB_ICONWARNING);
    edtOSSubschCode.SetFocus;
    Exit;
  end;

  f := OSGrNalogFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := '(b.kod_subsch = ''' + edtOSSubschCode.Text + ''')';

  frmOSGrNalogShow := TfrmOSGrNalogShow.Create(Application, fmNormal, f);
  try
    frmOSGrNalogShow.DisableActions([frmOSGrNalogShow.actFilter, frmOSGrNalogShow.actNoFilter]);
    with frmOSGrNalogShow do
      if ShowModal = mrOk then
      begin
        edtOSGrNalogId.Text := GetReturnValue(sgOSGrNalog, 1);
        edtOSGrNalogCode.Text := GetReturnValue(sgOSGrNalog, 2);
        edtOSGrNalog.Text := GetReturnValue(sgOSGrNalog, 3);

        spi := LOW_INT;
        try
          spi := StrToInt(GetReturnValue(sgOSGrNalog, 4));
        except
          on EConvertError do
            spi := LOW_INT;
        end;

        if spi <> LOW_INT then
        begin
          edtOSUseLimit.Text := IntToStr(spi);
          edtOSUseLimit_n.Text := IntToStr(spi);
        end
        else begin
          edtOSUseLimit.Text := '';
          edtOSUseLimit_n.Text := '';
        end;
      end;
  finally
    frmOSGrNalogShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSIstClearClick(Sender: TObject);
begin
  ClearControls([edtOSIstCode, edtOSIst]);
end;

procedure TfrmOSDataEdit.spbOSIstClick(Sender: TObject);
var
  frmOSIstShow: TfrmOSIstShow;
  f: OSIstFilter;
  TempOSIst: OSIstControllerSoapPort;
begin
  f := OSIstFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    f.conditionSQL := '(kod_ist < ''60'')';

  if orderKindCode = RQFKORDER_KIND_OS_EXPL then
  begin
    TempOSIst := HTTPRIOOSIst as OSIstControllerSoapPort;
    f.conditionSQL := TempOSIst.getOSIstCondition(true);
  end;

  frmOSIstShow := TfrmOSIstShow.Create(Application, fmNormal, f);
  try
    frmOSIstShow.DisableActions([frmOSIstShow.actFilter, frmOSIstShow.actNoFilter]);
    with frmOSIstShow do
      if ShowModal = mrOk then
      begin
        edtOSIstCode.Text := GetReturnValue(sgOSIst, 1);
        edtOSIst.Text := GetReturnValue(sgOSIst, 2);
      end;
  finally
    frmOSIstShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSKlassClearClick(Sender: TObject);
begin
  ClearControls([edtOSKlassCode, edtOSKlass]);
end;

procedure TfrmOSDataEdit.spbOSKlassClick(Sender: TObject);
var
  frmOSKlassShow: TfrmOSKlassShow;
begin
  frmOSKlassShow := TfrmOSKlassShow.Create(Application, fmNormal);
  try
    with frmOSKlassShow do
      if ShowModal = mrOk then
      begin
        edtOSKlassCode.Text := GetReturnValue(sgOSKlass, 1);
        edtOSKlass.Text := GetReturnValue(sgOSKlass, 2);
      end;
  finally
    frmOSKlassShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSMetAmClearClick(Sender: TObject);
begin
  ClearControls([edtOSMetAmCode, edtOSMetAm]);
end;

procedure TfrmOSDataEdit.spbOSMetAmClear_nClick(Sender: TObject);
begin
  ClearControls([edtOSMetAmCode_n, edtOSMetAm_n]);
end;

procedure TfrmOSDataEdit.spbOSMetAmClick(Sender: TObject);
var
  frmOSMetAmShow: TfrmOSMetAmShow;
  f: OSMetAmFilter;
begin
  if buhDate = '' then
    raise Exception.Create('Помилка при визначенні дати документу!');

  f := OSMetAmFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := '(OSMETAM.date_start <= to_date(''' + buhDate + ''', ''dd.MM.yyyy'') and ' +
                    ' OSMETAM.date_end   >= to_date(''' + buhDate + ''', ''dd.MM.yyyy'') and ' +
                    ' OSMETAM.kod_am in (1))';

  frmOSMetAmShow := TfrmOSMetAmShow.Create(Application, fmNormal, f);
  try
    frmOSMetAmShow.DisableActions([frmOSMetAmShow.actFilter, frmOSMetAmShow.actNoFilter]);
    with frmOSMetAmShow do
      if ShowModal = mrOk then
      begin
        edtOSMetAmCode.Text := GetReturnValue(sgOSMetAm, 1);
        edtOSMetAm.Text := GetReturnValue(sgOSMetAm, 2);
      end;
  finally
    frmOSMetAmShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSMetAm_nClick(Sender: TObject);
var
  frmOSMetAmShow: TfrmOSMetAmShow;
  f: OSMetAmFilter;
begin
  if buhDate = '' then
    raise Exception.Create('Помилка при визначенні дати документу!');

  f := OSMetAmFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := '(OSMETAM.date_start <= to_date(''' + buhDate + ''', ''dd.MM.yyyy'') and ' +
                    ' OSMETAM.date_end   >= to_date(''' + buhDate + ''', ''dd.MM.yyyy'') and ' +
                    ' OSMETAM.kod_am in (1))';

  frmOSMetAmShow := TfrmOSMetAmShow.Create(Application, fmNormal, f);
  try
    frmOSMetAmShow.DisableActions([frmOSMetAmShow.actFilter, frmOSMetAmShow.actNoFilter]);
    with frmOSMetAmShow do
      if ShowModal = mrOk then
      begin
        edtOSMetAmCode_n.Text := GetReturnValue(sgOSMetAm, 1);
        edtOSMetAm_n.Text := GetReturnValue(sgOSMetAm, 2);
      end;
  finally
    frmOSMetAmShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSPrivatClearClick(Sender: TObject);
begin
  ClearControls([edtOSPrivatCode, edtOSPrivat]);
end;

procedure TfrmOSDataEdit.spbOSPrivatClick(Sender: TObject);
var
  frmOSPrivatShow: TfrmOSPrivatShow;
  f: OSPrivatFilter;
begin
  if (edtOSVidCode.Text = '') then
  begin
    Application.MessageBox(PChar('Спочатку оберіть вид ОЗ!'), PChar('Увага!'), MB_ICONWARNING);
    edtOSVidCode.SetFocus;
    Exit;
  end;

  f := OSPrivatFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := 'substr(kod_privat, 1, 2) = ''' + edtOSVidCode.Text + '''';

  frmOSPrivatShow := TfrmOSPrivatShow.Create(Application, fmNormal, f);
  try
    frmOSPrivatShow.DisableActions([frmOSPrivatShow.actFilter, frmOSPrivatShow.actNoFilter]);
    with frmOSPrivatShow do
      if ShowModal = mrOk then
      begin
        edtOSPrivatCode.Text := GetReturnValue(sgOSPrivat, 1);
        edtOSPrivat.Text := GetReturnValue(sgOSPrivat, 2);
      end;
  finally
    frmOSPrivatShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSSubschClearClick(Sender: TObject);
begin
  ClearControls([edtOSSubschCode, edtOSSubsch, edtOSKod_zatr]);

  if orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    HideControls([gbAdditional]);

  ClearAdditionalData;
end;

procedure TfrmOSDataEdit.spbOSSubschClick(Sender: TObject);
var
  frmOSSubschShow: TfrmOSSubschShow;
  f: OSSubschFilter;
  str: String;
begin
  f := OSSubschFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  /// 28.11.12 Пожелания бухгалтерии
  // f.conditionSQL := 'kod_subsch like (''15%'')';
  if orderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    f.conditionSQL := '(kod_subsch like (''15%'') or kod_subsch like (''10%'') or kod_subsch like (''12%''))';

  if orderKindCode = RQFKORDER_KIND_OS_EXPL then
    //f.conditionSQL := 'kod_subsch like (''10%'')';
    f.conditionSQL := 'kod_subsch not like (''15%'')';
  ///

  frmOSSubschShow := TfrmOSSubschShow.Create(Application, fmNormal, f);
  try
    frmOSSubschShow.DisableActions([frmOSSubschShow.actFilter, frmOSSubschShow.actNoFilter]);
    with frmOSSubschShow do
      if ShowModal = mrOk then
      begin
        edtOSSubschCode.Text := GetReturnValue(sgOSSubsch, 1);
        edtOSSubsch.Text := GetReturnValue(sgOSSubsch, 2);

        ///// 29.11.12 Пожелания бухгалтерии
        // Если 15-й счет, то "Код затрат №1" по умолч. - 15 нулей,
        // если 10-й или 12-й - то <> 15 нулей
        str := Copy(edtOSSubschCode.Text, 1, 2);
        if str = '15' then
        begin
          if edtOSKod_zatr.Text = '' then
            edtOSKod_zatr.Text := '000000000000000';
          ClearAdditionalData;
        end
        else begin
          // сбросим после выбора счета, пусть вводят новый
          edtOSKod_zatr.Text := '';

          ClearControls([edtOSGrNalogId, edtOSGrNalogCode, edtOSGrNalog,
                         edtOSUseLimit, edtOSUseLimit_n]);
        end;
        /////

        //ClearAdditionalData;
        HideControls([gbAdditional], (str = '15'));
      end;
  finally
    frmOSSubschShow.Free;
  end;
end;

procedure TfrmOSDataEdit.spbOSVidClearClick(Sender: TObject);
begin
  ClearControls([edtOSVidCode, edtOSVid]);
  spbOSPrivatClearClick(Sender);
end;

procedure TfrmOSDataEdit.spbOSVidClick(Sender: TObject);
var
  frmOSVidShow: TfrmOSVidShow;
begin
  frmOSVidShow := TfrmOSVidShow.Create(Application, fmNormal);
  try
    with frmOSVidShow do
      if ShowModal = mrOk then
      begin
        edtOSVidCode.Text := GetReturnValue(sgOSVid, 1);
        edtOSVid.Text := GetReturnValue(sgOSVid, 2);
        spbOSPrivatClearClick(Sender);
      end;
  finally
    frmOSVidShow.Free;
  end;
end;

end.
