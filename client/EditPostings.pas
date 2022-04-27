unit EditPostings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DialogFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  Grids, BaseGrid, AdvGrid, FKProvObjectController, ENServicesObjectController,
  AdvObj, ComCtrls, Types, XSBuiltIns, ENActIncomeServicesController,
  tmsAdvGridExcel, Menus, Globals , ShellAPI ;

type
    TfrmPostingsEdit = class(TDialogForm)
    btnMoveToFK: TButton;
    HTTPRIOFKProvObject: THTTPRIO;
    sgProvs: TAdvStringGrid;
    sgProvErrorsDetailed: TAdvStringGrid;
    btnDeleteProv: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    btnDeleteFromFK: TButton;
    btnGetPostingsList: TButton;
    lblGridDescription: TLabel;
    lblDatePosting: TLabel;
    edtDatePosting: TDateTimePicker;
    sgAXLedgerTrans: TAdvStringGrid;
    HTTPRIOAXLedgerTrans: THTTPRIO;
    HTTPRIOEnServicesObject2Prov: THTTPRIO;
    HTTPRIOENActIncomeServices: THTTPRIO;
    HTTPRIOENActIncomServ2Prov: THTTPRIO;
    aeExcel: TAdvGridExcelIO;
    PopupMenu2: TPopupMenu;
    mniViewRQFKOrder: TMenuItem;
    procedure btnMoveToFKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgProvsClick(Sender: TObject);
    procedure btnDeleteProvClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteFromFKClick(Sender: TObject);
    procedure btnGetPostingsListClick(Sender: TObject);
    procedure mniViewRQFKOrderClick(Sender: TObject);
  private
    { Private declarations }
    servicesObject: ENServicesObject;
    actIncomeServices: ENActIncomeServices;
    procedure getProvList(partId: Integer);
    procedure getPostingsList(servicesObjectCode: Integer);
    procedure changeGridDescription(isError: Boolean);
    procedure getStatus(servicesObjectCode: Integer);
    procedure getPostingsListAX(servicesObjectCode: Integer);

    procedure getStatusIncomeServices(actIncomeServicesCode: Integer);
    procedure getPostingsIncomeServicesList(actIncomeServicesCode: Integer);
    procedure getPostingsIncomeServicesListAx(actIncomeServicesCode: Integer);

  public
    { Public declarations }
    provResult: FKProvResult;
    servicesObjectCode: Integer;
    priconnection : Boolean;
    servicesRelaxation : Boolean;
    actIncomeServicesCode: Integer;
    justForCheck: Boolean;
  end;

var
  frmPostingsEdit: TfrmPostingsEdit;

implementation

uses
  GridHeadersUnit, ENConsts, DMReportsUnit, AXLedgerTransController,
  ENServicesObject2ProvController, ENActIncomServ2ProvController;

{$R *.dfm}

var
  FKBadProvHeaders: array [1..12] of String =
        ('Код'
         ,'Дата'
         ,'Цех (К)'
         ,'Счет (К)'
         ,'Субсчет (К)'
         ,'КАУ (К)'
         ,'Цех (Д)'
         ,'Счет (Д)'
         ,'Субсчет (Д)'
         ,'КАУ (Д)'
         ,'Сумма'
         ,'Примечание'
        );

  FKProvErrorDetailedHeaders: array [1..2] of String =
        ('Код'
         ,'Ошибки'
        );

        AXLedgerTransHeaders: array [1..33] of String =
        ( 'Код'
          ,'Дата проводки'
          ,'Сумма '
          ,'Счет ГК'
          ,'"Подразделение"(Д)'
          ,'"Центр затрат"(Д)'
          ,'"Цель"(Д)'
          ,'"Счет"(Д)'
          ,'"договор"(Д)'
          ,'"цфо"(Д)'
          ,'"ФР"(Д)'
          ,'"ДДС"(Д)'
          ,'"Назначение"(Д) '
          ,'"Основание"(Д) '
          ,'"Документ-основание"(Д)'
          ,'"Основное средство"(Д)'
          ,'"Присоединение"(Д)'

          ,'Корр.счёт'
          ,'"Подразделение"(К)'
          ,'"Центр затрат"(К)'
          ,'"Цель"(К)'
          ,'"Счет"(К)'
          ,'"договор"(К)'
          ,'"цфо"(К)'
          ,'"ФР"(К)'
          ,'"ДДС"(К)'
          ,'"Назначение"(К) '
          ,'"Основание"(К) '
          ,'"Документ-основание"(К)'
          ,'"Основное средство"(К)'
          ,'"Присоединение"(К)'

          ,'Текст проводки'
          ,'Код операции'
        );


procedure TfrmPostingsEdit.btnMoveToFKClick(Sender: TObject);
var
  TempENServicesObjectController: ENServicesObjectControllerSoapPort;
  i: Integer;
  provList: FKProvObjectShortList;
  datePosting : TXSDate;
  checkPartnerResult: Boolean;
  possiblePartnersList: ArrayOfSpravPartner;
begin
  if (servicesObjectCode = LOW_INT) and (actIncomeServicesCode = LOW_INT) then Exit;
  if (servicesObject = nil) and (actIncomeServices = nil) then Exit;

  /// 19.11.12 NET-3079
  // if (servicesObject.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_GOOD) then
  if (servicesObjectCode > LOW_INT) and (actIncomeServicesCode = LOW_INT) then
  if (servicesObject.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  ///
  begin
    Application.MessageBox(PChar('Цей договір вже проведений!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  // SUPP-6675... 03.09.2013 +++ присоединения проводят как хотят....
  if (not priconnection) and (not servicesRelaxation) and (actIncomeServicesCode = LOW_INT) then
  begin
    // Если это физ. лицо либо юр. лицо небюджет, проводить можно только после оплаты, т.е. статус договора должен быть "Оплаченный"
    if (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL) or
       (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT) or
       (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET) or
       (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT)
    then
    begin
      // Проводить можно только после оплаты !!!
      // если отказались от услуг то даем проводить только расходные акты
      // 03.06.2013 давать проводить если работы выполнены или оплачены if servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID then
      if ( (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID) and
          (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED) and
          (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_DISCLAIMER) and

          // 03.02.2014 +++ договора метрологии... в статусе "Акт приема-передачи счетчиков подписан"
          (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_ACT_SIGNED) ) then
      begin
        Application.MessageBox(PChar('Для проведення в Фін. Колекції цей договір повинен мати статуси "Сплачений" або "Роботи виконані"!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end
    // Если это юр. лицо бюджет, проводить можно, не дожидаясь оплаты, т.е. статус договора должен быть "Подписанный" (или "Оплаченный")
    else if (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET) then
    begin
      if (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_SIGNED) and
         (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_PAID)
         // 03.06.2013 давать проводить если работы выполнены или оплачены
         and (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_COMPLETED)
         and (servicesObject.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_DISCLAIMER)
      then
      begin
        Application.MessageBox(PChar('Для проведення в Фін. Колекції цей договір повинен мати статус "Підписаний" або "Сплачений" або "Роботи виконані"!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end
    else
      raise Exception.Create('Невідомий тип контрагенту!');
  end;

  if not justForCheck then
    if Application.MessageBox(PChar('Ви дійсно бажаєте ПРОВЕСТИ документи в Фін. Колекції ?'),
                              PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
      Exit;

  TempENServicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  //provResult := TempFKProvObject.createPostings(-1);
  //provResult := TempENServicesObjectController.createPostings(servicesObjectCode);
  
  // SUPP-45999 Перед проведением проверим, что не изменился партнер у договора
  checkPartnerResult := TempENServicesObjectController.checkPartnersCode(servicesObject);
  if(not checkPartnerResult) then
  begin
	  possiblePartnersList := TempENServicesObjectController.getListOfPartnersForAgree(servicesObject, 0, 100);
	  if(Length(possiblePartnersList) = 1) then begin
		  if Application.MessageBox(PChar('Не співпадають коди партнерів для цього договору у програмах EnergyNet та модулі "Довідники" комплексу Фін. колекція. Бажаєте оновити інформацію про партнера з модуля "Довідники" ?'
			  + Chr(10) + ' Зміни: з ' + Chr(10) + servicesObject.partnerCode + ' ' + servicesObject.name + ' ' + Chr(10) + ' на ' + possiblePartnersList[0].code + ' ' + possiblePartnersList[0].name),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
			  TempENServicesObjectController.refreshPartnerInfo(servicesObject);
		  end;
	  end;
  end;

  if not justForCheck then
  begin
    // SUPP-7343... 25.09.2013 +++ для услуг добавлена дата проведения (передачи проводок)
    if (edtDatePosting.Checked) then
    begin
      datePosting := TXSDate.Create;
      datePosting.XSToNative(GetXSDate(edtDatePosting.DateTime));
      provResult := TempENServicesObjectController.moveToFK(servicesObjectCode, datePosting, actIncomeServicesCode);
    end else
      provResult := TempENServicesObjectController.moveToFK(servicesObjectCode, actIncomeServicesCode);
  end else
    provResult := TempENServicesObjectController.moveToFKCheckOnly(servicesObjectCode);

  ClearGrid(sgProvs);
  ClearGrid(sgProvErrorsDetailed);

  if provResult <> nil then
    if ((provResult.partId = LOW_INT) and (servicesObject.isNoPay <> ENSERVICESOBJECT_ISNOPAY)
         and (provResult.badProvList <> nil)) then
    begin
      changeGridDescription(true);

      if High(provResult.badProvList.list) > -1 then
        sgProvs.RowCount := High(provResult.badProvList.list) + 2
      else
        sgProvs.RowCount := 2;

      with sgProvs do
        for i := 0 to High(provResult.badProvList.list) do
        begin
          if provResult.badProvList.list[i].id <> Low(Integer) then
            Cells[0,i+1] := IntToStr(provResult.badProvList.list[i].id)
          else
            Cells[0,i+1] := '';
          if provResult.badProvList.list[i].dt_prov = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := XSDate2String(provResult.badProvList.list[i].dt_prov);
          Cells[2,i+1] := provResult.badProvList.list[i].bal_ceh;
          Cells[3,i+1] := provResult.badProvList.list[i].bal_sch;
          Cells[4,i+1] := provResult.badProvList.list[i].bal_sub_sch;
          Cells[5,i+1] := provResult.badProvList.list[i].bal_kau;
          Cells[6,i+1] := provResult.badProvList.list[i].kor_ceh;
          Cells[7,i+1] := provResult.badProvList.list[i].kor_sch;
          Cells[8,i+1] := provResult.badProvList.list[i].kor_sub_sch;
          Cells[9,i+1] := provResult.badProvList.list[i].kor_kau;
          if provResult.badProvList.list[i].summa = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := provResult.badProvList.list[i].summa.DecimalString;
          Cells[11,i+1] := provResult.badProvList.list[i].primechan;

        end; // for i := 0 to High(provResult.badProvList.list)

        sgProvsClick(Sender);
    end // if provResult.partId = LOW_INT
    else begin
      changeGridDescription(false);

      if (actIncomeServicesCode > Low(Integer)) then
      begin
        getPostingsIncomeServicesList(actIncomeServicesCode);
        getPostingsIncomeServicesListAx(actIncomeServicesCode);
      end else
      begin
        getPostingsList(servicesObjectCode);
        getPostingsListAX(servicesObjectCode);
      end;


      if (servicesObject.isNoPay = ENSERVICESOBJECT_ISNOPAY) then
        Application.MessageBox(PChar('Документи проведено! Для безоплатних послуг доходні акти не проводяться!'),
                             PChar('Інформація'), MB_ICONINFORMATION)
      else if (provResult.partId = LOW_INT) then
        Application.MessageBox(PChar('Документи проведено!'),
                             PChar('Інформація'), MB_ICONINFORMATION)
      else
        Application.MessageBox(PChar('Документи проведено! Код пачки проводок: ' + IntToStr(provResult.partId)),
                             PChar('Інформація'), MB_ICONINFORMATION);


    end; // else

  if (actIncomeServicesCode > Low(Integer)) then
    getStatusIncomeServices(actIncomeServicesCode)
  else
    getStatus(servicesObjectCode);

  if justForCheck then
    HideControls([btnMoveToFK, btnDeleteFromFK, btnGetPostingsList, btnDeleteProv,
                  lblDatePosting, edtDatePosting]);
end;


procedure TfrmPostingsEdit.FormShow(Sender: TObject);
var
  TempENServicesObjectController: ENServicesObjectControllerSoapPort;
begin
  SetGridHeaders(FKBadProvHeaders, sgProvs.ColumnHeaders);
  SetGridHeaders(FKProvErrorDetailedHeaders, sgProvErrorsDetailed.ColumnHeaders);
  SetGridHeaders(AXLedgerTransHeaders, sgAXLedgerTrans.ColumnHeaders);

  HideControls([btnMoveToFK, btnDeleteFromFK]);

  if actIncomeServicesCode > LOW_INT then
  begin
    getStatusIncomeServices(actIncomeServicesCode);
    getPostingsIncomeServicesList(actIncomeServicesCode);
    getPostingsIncomeServicesListAx(actIncomeServicesCode);
  end else
  if servicesObjectCode > LOW_INT then
  begin
    getStatus(servicesObjectCode);
    getPostingsList(servicesObjectCode);
    getPostingsListAx(servicesObjectCode);
  end else
    raise Exception.Create('Невідомий код договору: ' + IntToStr(servicesObjectCode) + ' !');

  if justForCheck then
  begin
    HideControls([btnMoveToFK, btnDeleteFromFK, btnGetPostingsList, btnDeleteProv,
                  lblDatePosting, edtDatePosting]);
    btnMoveToFKClick(Sender);
  end;
end;


procedure TfrmPostingsEdit.getProvList(partId: Integer);
var i: Integer;
    TempFKProvObject: FKProvObjectControllerSoapPort;
    provList: FKProvObjectShortList;
begin
  ClearGrid(sgProvs);

  TempFKProvObject := HTTPRIOFKProvObject as FKProvObjectControllerSoapPort;

  provList := TempFKProvObject.getProvListFromFin(provResult.partId);

  if High(provList.list) > -1 then
    sgProvs.RowCount := High(provList.list) + 2
  else
    sgProvs.RowCount := 2;

  with sgProvs do
    for i := 0 to High(provList.list) do
    begin
      if provList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(provList.list[i].id)
      else
        Cells[0,i+1] := '';
      if provList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(provList.list[i].dt_prov);
      Cells[2,i+1] := provList.list[i].bal_ceh;
      Cells[3,i+1] := provList.list[i].bal_sch;
      Cells[4,i+1] := provList.list[i].bal_sub_sch;
      Cells[5,i+1] := provList.list[i].bal_kau;
      Cells[6,i+1] := provList.list[i].kor_ceh;
      Cells[7,i+1] := provList.list[i].kor_sch;
      Cells[8,i+1] := provList.list[i].kor_sub_sch;
      Cells[9,i+1] := provList.list[i].kor_kau;
      if provList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := provList.list[i].summa.DecimalString;
      Cells[11,i+1] := provList.list[i].primechan;
    end;
end;


procedure TfrmPostingsEdit.sgProvsClick(Sender: TObject);
var provId, i, j: Integer;
begin
  ClearGrid(sgProvErrorsDetailed);

  try
    provId := StrToInt(sgProvs.Cells[0, sgProvs.Row]);
  except
    on EConvertError do Exit;
  end;

  if provResult = nil then Exit;
  if provResult.partId > LOW_INT then Exit;

  for i := 0 to High(provResult.badProvList.list) do
  begin
    if provResult.badProvList.list[i].id = provId then
    begin
      if High(provResult.badProvList.list[i].detailedList.list) > -1 then
        sgProvErrorsDetailed.RowCount := High(provResult.badProvList.list[i].detailedList.list) + 2
      else
        sgProvErrorsDetailed.RowCount := 2;

      with sgProvErrorsDetailed do
        for j := 0 to High(provResult.badProvList.list[i].detailedList.list) do
        begin
          if provResult.badProvList.list[i].detailedList.list[j].prov_id <> Low(Integer) then
            Cells[0,j+1] := IntToStr(provResult.badProvList.list[i].detailedList.list[j].prov_id)
          else
            Cells[0,j+1] := '';
          Cells[1,j+1] := provResult.badProvList.list[i].detailedList.list[j].err_mes;
        end;

      break;
    end;
  end;
end;


procedure TfrmPostingsEdit.btnDeleteProvClick(Sender: TObject);
var TempFKProvObject: FKProvObjectControllerSoapPort;
begin
  Exit; // это старая версия !!!

  if provResult <> nil then
    if provResult.partId > LOW_INT then
    begin
      TempFKProvObject := HTTPRIOFKProvObject as FKProvObjectControllerSoapPort;
      TempFKProvObject.deleteProv(provResult.partId);
      ShowMessage('DELETED !!! ' + IntToStr(provResult.partId));
      getProvList(provResult.partId);
    end;
end;


procedure TfrmPostingsEdit.FormCreate(Sender: TObject);
begin
  servicesObjectCode := LOW_INT;
  priconnection := False;
  servicesRelaxation := False;
  actIncomeServicesCode := Low(Integer);
  justForCheck := False;
end;


procedure TfrmPostingsEdit.btnDeleteFromFKClick(Sender: TObject);
var TempENServicesObjectController: ENServicesObjectControllerSoapPort;
begin
  if (servicesObjectCode = LOW_INT) and (actIncomeServicesCode = LOW_INT) then Exit;

  if (actIncomeServicesCode = LOW_INT) then
  if (servicesObject.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Цей договір ще не проведений!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ВІДМІНИТИ проведення документів у Фін. Колекції ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempENServicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  TempENServicesObjectController.deleteFromFK(servicesObjectCode, actIncomeServicesCode);

  Application.MessageBox(PChar('Документи відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  if (actIncomeServicesCode > LOW_INT) then
  begin
    getStatusIncomeServices(actIncomeServicesCode);
    getPostingsIncomeServicesList(actIncomeServicesCode);
    getPostingsIncomeServicesListAx(actIncomeServicesCode);
  end else
  begin
    getStatus(servicesObjectCode);
    getPostingsList(servicesObjectCode);
    getPostingsListAX(servicesObjectCode);
  end;
end;


procedure TfrmPostingsEdit.getPostingsList(servicesObjectCode: Integer);
var i: Integer;
    TempENServicesObjectController: ENServicesObjectControllerSoapPort;
    provList: FKProvObjectShortList;

begin
  ClearGrid(sgProvs);
  ClearGrid(sgProvErrorsDetailed);

  if servicesObjectCode = LOW_INT then Exit;

  TempENServicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  provList := TempENServicesObjectController.getPostingsList(servicesObjectCode);

  if High(provList.list) > -1 then
    sgProvs.RowCount := High(provList.list) + 2
  else
    sgProvs.RowCount := 2;

  with sgProvs do
    for i := 0 to High(provList.list) do
    begin
       if provList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(provList.list[i].id)
      else
        Cells[0,i+1] := '';
      if provList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(provList.list[i].dt_prov);
      Cells[2,i+1] := provList.list[i].bal_ceh;
      Cells[3,i+1] := provList.list[i].bal_sch;
      Cells[4,i+1] := provList.list[i].bal_sub_sch;
      Cells[5,i+1] := provList.list[i].bal_kau;
      Cells[6,i+1] := provList.list[i].kor_ceh;
      Cells[7,i+1] := provList.list[i].kor_sch;
      Cells[8,i+1] := provList.list[i].kor_sub_sch;
      Cells[9,i+1] := provList.list[i].kor_kau;
      if provList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := provList.list[i].summa.DecimalString;
      Cells[11,i+1] := provList.list[i].primechan;
    end;
end;


procedure TfrmPostingsEdit.btnGetPostingsListClick(Sender: TObject);
begin
  getPostingsList(servicesObjectCode);
  getPostingsListAx(servicesObjectCode);
end;


procedure TfrmPostingsEdit.changeGridDescription(isError: Boolean);
begin
  if not isError then
  begin
    lblGridDescription.Caption := 'Список проводок';
    lblGridDescription.Font.Color := clWindowText;
  end
  else begin
    lblGridDescription.Caption := 'Список ошибочных проводок';
    lblGridDescription.Font.Color := clRed;
  end;

  sgProvErrorsDetailed.Visible := isError;
end;


procedure TfrmPostingsEdit.getStatus(servicesObjectCode: Integer);
var
  TempENServicesObjectController : ENServicesObjectControllerSoapPort;
  datePosting : TXSDate;
begin
  HideControls([btnMoveToFK, btnDeleteFromFK]);

  if servicesObjectCode > LOW_INT then
  begin
    TempENServicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    servicesObject := TempENServicesObjectController.getObject(servicesObjectCode);

    if servicesObject <> nil then
    begin
      //Caption := 'Проводки. Код объекта: ' + IntToStr(servicesObjectCode);
      Caption := 'Проводки. Договір №' + servicesObject.contractNumberServices;

      if servicesObject.statusRef <> nil then
      begin

        if (servicesObject.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD) or
           (servicesObject.statusRef.code = ENSERVICESOBJECT_FINSTATUS_ACT_TRANSFER_CLOSED) then
        begin
          //DisableControls([btnDeleteFromFK]);
          HideControls([btnMoveToFK], false);
          HideControls([btnDeleteFromFK]);
          DisableControls([edtDatePosting], False);
          edtDatePosting.Checked := False;
        end;

        if servicesObject.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED then
        begin
          //DisableControls([btnMoveToFK]);
          HideControls([btnMoveToFK]);
          HideControls([btnDeleteFromFK], false);
          btnDeleteFromFK.Left := 16;

          DisableControls([edtDatePosting]);
          datePosting := TempENServicesObjectController.getDatePostingsByServicesCode(servicesObject.code);

          if (datePosting <> nil) then
          begin
            edtDatePosting.DateTime := EncodeDate(datePosting.Year,datePosting.Month,datePosting.Day);
            edtDatePosting.checked := true;
          end else
          begin
            edtDatePosting.DateTime := SysUtils.Date;
            edtDatePosting.checked := false;
          end;

        end;

      end
      else
        raise Exception.Create('Невідомий статус договору (код договору: ' + IntToStr(servicesObjectCode) + ') !');
    end
    else
      raise Exception.Create('Не знайдено договір по коду: ' + IntToStr(servicesObjectCode) + ' !');

    //getPostingsList(servicesObjectCode);
  end
  else
    raise Exception.Create('Невідомий код договору: ' + IntToStr(servicesObjectCode) + ' !');
end;


procedure TfrmPostingsEdit.getPostingsListAX(servicesObjectCode: Integer);
var i: Integer;
    TempENServicesObjectController: ENServicesObjectControllerSoapPort;
    provList: AXLedgerTransShortList;
    TempAXLedgerTransController : AXLedgerTransControllerSoapPort;
    voucher: String;
    Tempenservicesobject2provController  : enservicesobject2provControllerSoapPort;
    enservices2provFilter : ENServicesObject2ProvFilter;
    enservices2provShortlist : ENServicesObject2ProvShortList;

begin
  ClearGrid(sgAXLedgerTrans);

  if servicesObjectCode = LOW_INT then Exit;

  TempAXLedgerTransController := HTTPRIOAXLedgerTrans as AXLedgerTransControllerSoapPort;
  Tempenservicesobject2provController := HTTPRIOEnServicesObject2Prov as enservicesobject2provControllerSoapPort;

  enservices2provFilter := ENServicesObject2ProvFilter.Create;
  SetNullIntProps(enservices2provFilter);
  SetNullXSProps(enservices2provFilter);

  enservices2provFilter.servicesObjectRef := ENServicesObjectRef.Create;
  enservices2provFilter.servicesObjectRef.code :=servicesObjectCode;

  enservices2provShortlist :=  Tempenservicesobject2provController.getScrollableFilteredList(enservices2provFilter,0,-1);

  if enservices2provShortlist.totalCount = 0 then
   Exit;

  voucher := enservices2provShortlist.list[0].voucher;
  if voucher <> '' then
  begin
    provList := TempAXLedgerTransController.getPostingByVoucher(voucher);

  if High(provList.list) > -1 then
    sgAXLedgerTrans.RowCount := High(provList.list) + 2
  else
    sgAXLedgerTrans.RowCount := 2;

  with sgAXLedgerTrans do
    for i := 0 to High(provList.list) do
    begin

      if provList.list[i].transDate = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(provList.list[i].transDate);

      Cells[2,i+1] := provList.list[i].amountCur.DecimalString;
      Cells[3,i+1] := provList.list[i].accountNum;

      Cells[4,i+1] := provList.list[i].accountDimension1;
      Cells[5,i+1] := provList.list[i].accountDimension2;
      Cells[6,i+1] := provList.list[i].accountDimension3;
      Cells[7,i+1] := provList.list[i].accountDimension4;
      Cells[8,i+1] := provList.list[i].accountDimension5;
      Cells[9,i+1] := provList.list[i].accountDimension6;
      Cells[10,i+1] := provList.list[i].accountDimension7;
      Cells[11,i+1] := provList.list[i].accountDimension8;
      Cells[12,i+1] := provList.list[i].accountDimension9;
      Cells[13,i+1] := provList.list[i].accountDimension10;
      Cells[14,i+1] := provList.list[i].accountDimension11;
      Cells[15,i+1] := provList.list[i].accountDimension12;
      Cells[16,i+1] := provList.list[i].accountDimension13;

      Cells[17,i+1] := provList.list[i].offsetAccountNum;

      Cells[18,i+1] := provList.list[i].corAccountDimension1;
      Cells[19,i+1] := provList.list[i].corAccountDimension2;
      Cells[20,i+1] := provList.list[i].corAccountDimension3;
      Cells[21,i+1] := provList.list[i].corAccountDimension4;
      Cells[22,i+1] := provList.list[i].corAccountDimension5;
      Cells[23,i+1] := provList.list[i].corAccountDimension6;
      Cells[24,i+1] := provList.list[i].corAccountDimension7;
      Cells[25,i+1] := provList.list[i].corAccountDimension8;
      Cells[26,i+1] := provList.list[i].corAccountDimension9;
      Cells[27,i+1] := provList.list[i].corAccountDimension10;
      Cells[28,i+1] := provList.list[i].corAccountDimension11;
      Cells[29,i+1] := provList.list[i].corAccountDimension12;
      Cells[30,i+1] := provList.list[i].corAccountDimension13;


      Cells[31,i+1] := provList.list[i].ledgerTxt;
      Cells[32,i+1] := provList.list[i].voucher;



    end;
  end;
end;


procedure TfrmPostingsEdit.getStatusIncomeServices(actIncomeServicesCode: Integer);
var
  TempENServicesObjectController: ENServicesObjectControllerSoapPort;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  datePosting: TXSDate;
begin
  HideControls([btnMoveToFK, btnDeleteFromFK]);

  if servicesObjectCode > LOW_INT then
  begin
    TempENServicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    servicesObject := TempENServicesObjectController.getObject(servicesObjectCode);
  end;

  if actIncomeServicesCode > Low(Integer) then
  begin
    TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
    actIncomeServices := TempENActIncomeServices.getObject(actIncomeServicesCode);

    if actIncomeServices <> nil then
    begin
      Caption := 'Проводки. Прибутковий акт №' + actIncomeServices.numberGen;

      if actIncomeServices.statusRef <> nil then
      begin

        if (actIncomeServices.statusRef.code = ENACTINCOMESTATUS_SIGNATURE) or
              (actIncomeServices.statusRef.code = ENACTINCOMESTATUS_GOOD) then
        begin
          HideControls([btnMoveToFK], false);
          HideControls([btnDeleteFromFK]);
          DisableControls([edtDatePosting], False);
          edtDatePosting.Checked := False;
        end;

        if (actIncomeServices.statusRef.code = ENACTINCOMESTATUS_CLOSED) then
        begin
          HideControls([btnMoveToFK]);
          HideControls([btnDeleteFromFK], false);
          btnDeleteFromFK.Left := 16;

          DisableControls([edtDatePosting]);
          datePosting := TempENActIncomeServices.getDatePostingsByActIncomeServicesCode(actIncomeServicesCode);

          if (datePosting <> nil) then
          begin
            edtDatePosting.DateTime := EncodeDate(datePosting.Year,datePosting.Month,datePosting.Day);
            edtDatePosting.checked := true;
          end else
          begin
            edtDatePosting.DateTime := SysUtils.Date;
            edtDatePosting.checked := false;
          end;

        end;

      end
      else
        raise Exception.Create('Невідомий статус акту (код акту: ' + IntToStr(actIncomeServicesCode) + ') !');
    end
    else
      raise Exception.Create('Не знайдено акт по коду: ' + IntToStr(actIncomeServicesCode) + ' !');

  end
  else
    raise Exception.Create('Невідомий код акту: ' + IntToStr(actIncomeServicesCode) + ' !');
end;


procedure TfrmPostingsEdit.mniViewRQFKOrderClick(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName(Self.Caption + ' (фільтр) ') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmPostingsEdit.getPostingsIncomeServicesList(actIncomeServicesCode: Integer);
var
  i: Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  provList: FKProvObjectShortList;
begin
  ClearGrid(sgProvs);
  ClearGrid(sgProvErrorsDetailed);

  if actIncomeServicesCode = LOW_INT then Exit;

  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
  provList := TempENActIncomeServices.getPostingsList(actIncomeServicesCode);

  if High(provList.list) > -1 then
    sgProvs.RowCount := High(provList.list) + 2
  else
    sgProvs.RowCount := 2;

  with sgProvs do
    for i := 0 to High(provList.list) do
    begin
      if provList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(provList.list[i].id)
      else
        Cells[0,i+1] := '';
      if provList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(provList.list[i].dt_prov);
      Cells[2,i+1] := provList.list[i].bal_ceh;
      Cells[3,i+1] := provList.list[i].bal_sch;
      Cells[4,i+1] := provList.list[i].bal_sub_sch;
      Cells[5,i+1] := provList.list[i].bal_kau;
      Cells[6,i+1] := provList.list[i].kor_ceh;
      Cells[7,i+1] := provList.list[i].kor_sch;
      Cells[8,i+1] := provList.list[i].kor_sub_sch;
      Cells[9,i+1] := provList.list[i].kor_kau;
      if provList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := provList.list[i].summa.DecimalString;
      Cells[11,i+1] := provList.list[i].primechan;
    end;
end;


procedure TfrmPostingsEdit.getPostingsIncomeServicesListAx(actIncomeServicesCode: Integer);
var
  i: Integer;
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  provList: AXLedgerTransShortList;
  TempAXLedgerTransController: AXLedgerTransControllerSoapPort;
  voucher: String;

  TempENActIncomServ2Prov: ENActIncomServ2ProvControllerSoapPort;
  ENActIncomServ2ProvList: ENActIncomServ2ProvShortList;
  actIncomServ2ProvFilter: ENActIncomServ2ProvFilter;
begin
  ClearGrid(sgAXLedgerTrans);

  if actIncomeServicesCode = LOW_INT then Exit;

  TempAXLedgerTransController := HTTPRIOAXLedgerTrans as AXLedgerTransControllerSoapPort;
  TempENActIncomServ2Prov := HTTPRIOENActIncomServ2Prov as ENActIncomServ2ProvControllerSoapPort;

  actIncomServ2ProvFilter := ENActIncomServ2ProvFilter.Create;
  SetNullIntProps(actIncomServ2ProvFilter);
  SetNullXSProps(actIncomServ2ProvFilter);

  actIncomServ2ProvFilter.actIncomeRef := ENActIncomeServicesRef.Create;
  actIncomServ2ProvFilter.actIncomeRef.code := actIncomeServicesCode;

  ENActIncomServ2ProvList := TempENActIncomServ2Prov.getScrollableFilteredList(actIncomServ2ProvFilter, 0, -1);

  if ENActIncomServ2ProvList.totalCount = 0 then Exit;

  voucher := ENActIncomServ2ProvList.list[0].voucher;
  if voucher <> '' then
  begin
    provList := TempAXLedgerTransController.getPostingByVoucher(voucher);

    if High(provList.list) > -1 then
      sgAXLedgerTrans.RowCount := High(provList.list) + 2
    else
      sgAXLedgerTrans.RowCount := 2;

    with sgAXLedgerTrans do
      for i := 0 to High(provList.list) do
      begin
        if provList.list[i].transDate = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(provList.list[i].transDate);

        Cells[2,i+1] := provList.list[i].amountCur.DecimalString;
        Cells[3,i+1] := provList.list[i].accountNum;

        Cells[4,i+1] := provList.list[i].accountDimension1;
        Cells[5,i+1] := provList.list[i].accountDimension2;
        Cells[6,i+1] := provList.list[i].accountDimension3;
        Cells[7,i+1] := provList.list[i].accountDimension4;
        Cells[8,i+1] := provList.list[i].accountDimension5;
        Cells[9,i+1] := provList.list[i].accountDimension6;
        Cells[10,i+1] := provList.list[i].accountDimension7;
        Cells[11,i+1] := provList.list[i].accountDimension8;
        Cells[12,i+1] := provList.list[i].accountDimension9;
        Cells[13,i+1] := provList.list[i].accountDimension10;
        Cells[14,i+1] := provList.list[i].accountDimension11;
        Cells[15,i+1] := provList.list[i].accountDimension12;
        Cells[16,i+1] := provList.list[i].accountDimension13;

        Cells[17,i+1] := provList.list[i].offsetAccountNum;

        Cells[18,i+1] := provList.list[i].corAccountDimension1;
        Cells[19,i+1] := provList.list[i].corAccountDimension2;
        Cells[20,i+1] := provList.list[i].corAccountDimension3;
        Cells[21,i+1] := provList.list[i].corAccountDimension4;
        Cells[22,i+1] := provList.list[i].corAccountDimension5;
        Cells[23,i+1] := provList.list[i].corAccountDimension6;
        Cells[24,i+1] := provList.list[i].corAccountDimension7;
        Cells[25,i+1] := provList.list[i].corAccountDimension8;
        Cells[26,i+1] := provList.list[i].corAccountDimension9;
        Cells[27,i+1] := provList.list[i].corAccountDimension10;
        Cells[28,i+1] := provList.list[i].corAccountDimension11;
        Cells[29,i+1] := provList.list[i].corAccountDimension12;
        Cells[30,i+1] := provList.list[i].corAccountDimension13;

        Cells[31,i+1] := provList.list[i].ledgerTxt;
        Cells[32,i+1] := provList.list[i].voucher;
      end;
  end;
end;


end.
