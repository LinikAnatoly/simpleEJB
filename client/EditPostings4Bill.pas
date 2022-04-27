unit EditPostings4Bill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DialogFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  Grids, BaseGrid, AdvGrid, FKProvObjectController, ENServicesObjectController,
  AdvObj, ComCtrls, Types, XSBuiltIns, ENSOPayBillProvController;

type
  TfrmPostings4BillEdit = class(TDialogForm)
    btnMoveToFK: TButton;
    HTTPRIOFKProvObject: THTTPRIO;
    sgProvs: TAdvStringGrid;
    sgProvErrorsDetailed: TAdvStringGrid;
    HTTPRIOENServicesObject: THTTPRIO;
    btnDeleteFromFK: TButton;
    btnGetPostings4BillList: TButton;
    lblGridDescription: TLabel;
    lblDatePosting: TLabel;
    edtDatePosting: TDateTimePicker;
    HTTPRIOENSOPayBillProv: THTTPRIO;
    sgAXLedgerTrans: TAdvStringGrid;
    HTTPRIOAXLedgerTrans: THTTPRIO;
    HTTPRIOEnServicesObject2Prov: THTTPRIO;
    procedure btnMoveToFKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgProvsClick(Sender: TObject);
    procedure btnDeleteFromFKClick(Sender: TObject);
    procedure btnGetPostings4BillListClick(Sender: TObject);
  private
    { Private declarations }
    servicesObject: ENServicesObject;
    procedure getProvList(partId: Integer);
    procedure getPostings4BillList(soPayBillProvCode: Integer);
    procedure changeGridDescription(isError: Boolean);
    procedure getStatus(soPayBillProvCode: Integer);

    procedure getPostingsListAx(soPayBillProvCode: Integer);
  public
    { Public declarations }
    provResult: FKProvResult;
  end;

var
  frmPostings4BillEdit: TfrmPostings4BillEdit;
    ENSOPayBillProvObj: ENSOPayBillProv;

implementation

uses GridHeadersUnit, ENConsts, DMReportsUnit, EditENSOPayBillProv,
  ENPayment2SOController, ENSOBillController, AXLedgerTransController,
  ENServicesObject2ProvController;

{$R *.dfm}

var   FKBadProvHeaders: array[1..12] of string =
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


procedure TfrmPostings4BillEdit.btnMoveToFKClick(Sender: TObject);
var //TempFKProvObject: FKProvObjectControllerSoapPort;
    TempENServicesObjectController: ENServicesObjectControllerSoapPort;
    TempENSOPayBillProv : ENSOPayBillProvControllerSoapPort;
    i: Integer;
    provList: FKProvObjectShortList;
    datePosting : TXSDate;
    soPBPFilter : ENSOPayBillProvFilter;
    soPBPList : ENSOPayBillProvShortList;
begin

  if servicesObject = nil then Exit;


  if (servicesObject.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  ///
  begin
    Application.MessageBox(PChar('Цей договір вже проведений!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ПРОВЕСТИ документи в Фін. Колекції ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;


  TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;

  // SUPP-7343... 25.09.2013 +++ для услуг добавлена дата проведения (передачи проводок)
  if (edtDatePosting.Checked) then
  begin
    datePosting := TXSDate.Create;
    datePosting.XSToNative(GetXSDate(edtDatePosting.DateTime));
    provResult := TempENSOPayBillProv.moveToFK(ENSOPayBillProvObj, datePosting);
  end else
    provResult := TempENSOPayBillProv.moveToFK(ENSOPayBillProvObj);

  ClearGrid(sgProvs);
  ClearGrid(sgProvErrorsDetailed);  
  
  if provResult <> nil then
    if ((provResult.partId = LOW_INT) and (servicesObject.isNoPay <> ENSERVICESOBJECT_ISNOPAY)
         and (provResult.badProvList <> nil)) then
    begin
      //sgProvErrorsDetailed.Visible := true;
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

        end;

        sgProvsClick(Sender);
    end // if provResult.partId = LOW_INT
    else begin

      changeGridDescription(false);
      getPostings4BillList(ENSOPayBillProvObj.code);

      if (servicesObject.isNoPay = ENSERVICESOBJECT_ISNOPAY) then
         Application.MessageBox(PChar('Документи проведено! Для безоплатних послуг доходні акти не проводяться!'),
                             PChar('Інформація'), MB_ICONINFORMATION)
      else if (provResult.partId = LOW_INT) then
      Application.MessageBox(PChar('Документи проведено!'),
                             PChar('Інформація'), MB_ICONINFORMATION)
      else
      Application.MessageBox(PChar('Документи проведено! Код пачки проводок: ' + IntToStr(provResult.partId)),
                             PChar('Інформація'), MB_ICONINFORMATION);

    end;

  // после проведения передёрнем объект
  soPBPFilter := ENSOPayBillProvFilter.Create;
  SetNullIntProps(soPBPFilter);
  SetNullXSProps(soPBPFilter);

  soPBPFilter.soRef := ENServicesObjectRef.Create;
  soPBPFilter.soRef.code := ENSOPayBillProvObj.soRef.code;
  soPBPFilter.payment2soRef := ENPayment2SORef.Create;
  if (ENSOPayBillProvObj.payment2soRef <> nil) and (ENSOPayBillProvObj.payment2soRef.code > 0) then
  soPBPFilter.payment2soRef.code := ENSOPayBillProvObj.payment2soRef.code
  else
  soPBPFilter.payment2soRef.code := LOW_INT;
  soPBPFilter.soBillRef := ENSOBillRef.Create;
  soPBPFilter.soBillRef.code := ENSOPayBillProvObj.soBillRef.code;

  soPBPList := TempENSOPayBillProv.getScrollableFilteredList(soPBPFilter, 0, -1);
  if (soPBPList.totalCount > 1 ) then
  begin
    Application.MessageBox(PChar('Знайдено більше однієї проводки!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end
  else if soPBPList.totalCount > 0 then begin
    ENSOPayBillProvObj := TempENSOPayBillProv.getObject(soPBPList.list[0].code);
    getStatus(ENSOPayBillProvObj.code);
    getPostings4BillList(ENSOPayBillProvObj.code);
    getPostingsListAx(ENSOPayBillProvObj.code);
  end;

end;

procedure TfrmPostings4BillEdit.FormShow(Sender: TObject);
var TempENServicesObjectController: ENServicesObjectControllerSoapPort;
begin
  SetGridHeaders(FKBadProvHeaders, sgProvs.ColumnHeaders);
  SetGridHeaders(FKProvErrorDetailedHeaders, sgProvErrorsDetailed.ColumnHeaders);
  SetGridHeaders(AXLedgerTransHeaders, sgAXLedgerTrans.ColumnHeaders);

  HideControls([btnMoveToFK, btnDeleteFromFK]);

  TempENServicesObjectController := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObjectController.getObject(ENSOPayBillProvObj.soRef.code);

    (*  если код пустой, то будем считать,
       что это будут новые проводки  *)

  if ENSOPayBillProvObj.code <> LOW_INT then
  begin
    getStatus(ENSOPayBillProvObj.code);
    getPostings4BillList(ENSOPayBillProvObj.code);
    getPostingsListAX(ENSOPayBillProvObj.code);
    HideControls([btnDeleteFromFK],false);
  end
  else
   begin
       HideControls([btnMoveToFK],False);
   end;

end;

procedure TfrmPostings4BillEdit.getProvList(partId: Integer);
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

procedure TfrmPostings4BillEdit.sgProvsClick(Sender: TObject);
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

procedure TfrmPostings4BillEdit.btnDeleteFromFKClick(Sender: TObject);
var TempENSOPayBillProvController: ENSOPayBillProvControllerSoapPort;
begin
  if ENSOPayBillProvObj.code = LOW_INT then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте ВІДМІНИТИ проведення документів у Фін. Колекції ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempENSOPayBillProvController := HTTPRIOENSOPayBillProv as  ENSOPayBillProvControllerSoapPort;
  TempENSOPayBillProvController.deleteFromFK(ENSOPayBillProvObj.code);
  ENSOPayBillProvObj.code := LOW_INT;

  Application.MessageBox(PChar('Документи відмінено!'), PChar('Інформація'), MB_ICONINFORMATION);

  getStatus(ENSOPayBillProvObj.code);
  getPostings4BillList(ENSOPayBillProvObj.code);
  getPostingsListAx(ENSOPayBillProvObj.code);
end;

procedure TfrmPostings4BillEdit.getPostings4BillList(soPayBillProvCode: Integer);
var i: Integer;
    TempENSOPayBillProv : ENSOPayBillProvControllerSoapPort;
    provList: FKProvObjectShortList;
begin
  ClearGrid(sgProvs);
  ClearGrid(sgProvErrorsDetailed);

  if soPayBillProvCode = LOW_INT then Exit;

  TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;

  provList := TempENSOPayBillProv.getPostings4BillList(soPayBillProvCode);

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

procedure TfrmPostings4BillEdit.btnGetPostings4BillListClick(Sender: TObject);
begin
  getPostings4BillList(ENSOPayBillProvObj.code);
  getPostingsListAx(ENSOPayBillProvObj.code);
end;

procedure TfrmPostings4BillEdit.changeGridDescription(isError: Boolean);
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

procedure TfrmPostings4BillEdit.getStatus(soPayBillProvCode: Integer);
var
  TempENServicesObjectController : ENServicesObjectControllerSoapPort;
  TempENSOPayBillProv : ENSOPayBillProvControllerSoapPort;
  datePosting : TXSDate;
begin
  HideControls([btnMoveToFK, btnDeleteFromFK]);

  if ENSOPayBillProvObj.code > LOW_INT then
  begin
    TempENSOPayBillProv := HTTPRIOENSOPayBillProv as ENSOPayBillProvControllerSoapPort;

    if servicesObject <> nil then
    begin
      //Caption := 'Проводки. Код объекта: ' + IntToStr(servicesObjectCode);
      Caption := 'Проводки. Договір №' + servicesObject.contractNumberServices;

          //DisableControls([btnMoveToFK]);
          HideControls([btnMoveToFK]);
          HideControls([btnDeleteFromFK], false);
          btnDeleteFromFK.Left := 16;

          DisableControls([edtDatePosting]);
          datePosting := TempENSOPayBillProv.getDatePostings4BillByPayBillProvCode(ENSOPayBillProvObj.code);

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
  else  // если код наловый, то считаем, что это будет вставка проводок
    begin
        HideControls([btnMoveToFK],False);
    end;

end;


procedure TfrmPostings4BillEdit.getPostingsListAX(soPayBillProvCode: Integer );
var i: Integer;
    TempENServicesObjectController: ENServicesObjectControllerSoapPort;
    provList: AXLedgerTransShortList;
    TempAXLedgerTransController : AXLedgerTransControllerSoapPort;
    voucher: String;
    Tempenservicesobject2provController  : enservicesobject2provControllerSoapPort;
    enservices2provFilter : ENServicesObject2ProvFilter;
    enservices2provShortlist : ENServicesObject2ProvShortList;

begin
  // через soPayBillProvCode найдем  enservices2prov
  ClearGrid(sgAXLedgerTrans);

  if soPayBillProvCode = LOW_INT then Exit;

  TempAXLedgerTransController := HTTPRIOAXLedgerTrans as AXLedgerTransControllerSoapPort;
  Tempenservicesobject2provController := HTTPRIOEnServicesObject2Prov as enservicesobject2provControllerSoapPort;

  enservices2provFilter := ENServicesObject2ProvFilter.Create;
  SetNullIntProps(enservices2provFilter);
  SetNullXSProps(enservices2provFilter);

  enservices2provFilter.conditionSQL :=  ' enservicesobject2prov.code = ( select so2p.code from ENSOPayBillProv sob , enservicesobject2prov so2p ' +
                                         ' where sob.code = '  + IntToStr(soPayBillProvCode) +
                                         ' and sob.so2provrefcode = so2p.code ) ';

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

end.
