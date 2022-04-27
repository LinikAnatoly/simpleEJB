unit EditRQOrderChangeContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient, RQOrgController, ImgList, TB2Item, TB2Dock, TB2Toolbar,
  ActnList;

type
  TfrmRQOrderChangeContractEdit = class(TDialogForm)
    lblRQOrgOrgName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrg: TSpeedButton;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    spbContractNumber: TSpeedButton;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQOrg: THTTPRIO;
    spbRQOrgClear: TSpeedButton;
    spbContractNumberClear: TSpeedButton;
    lblENResponsibles: TLabel;
    edtENResponsibles: TEdit;
    spbENResponsibles: TSpeedButton;
    spbENResponsiblesClear: TSpeedButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actInsertResp2Contract: TAction;
    tbActions: TTBToolbar;
    TBItem6: TTBItem;
    HTTPRIOFINContracts: THTTPRIO;
    HTTPRIOENResponsibles: THTTPRIO;
    actEditOMTSResponsibles: TAction;
    TBItem1: TTBItem;
    procedure FormShow(Sender: TObject);
    procedure spbRQOrgClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbContractNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbRQOrgClearClick(Sender: TObject);
    procedure spbContractNumberClearClick(Sender: TObject);
    procedure spbENResponsiblesClearClick(Sender: TObject);
    procedure spbENResponsiblesClick(Sender: TObject);
    procedure actInsertResp2ContractExecute(Sender: TObject);
    procedure actEditOMTSResponsiblesExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SetResponsibleByFinDocID();
  public
    { Public declarations }
    org: RQOrg;
    contractNumber: String;
    contractDate: TDate;
    finDocCode: String;
    finDocID: Integer;
    responsibleCode: Integer;
  end;

var
  frmRQOrderChangeContractEdit: TfrmRQOrderChangeContractEdit;

implementation

uses ShowRQOrg, ShowFINServicesObject, ChildFormUnit, XSBuiltIns,
  ENServicesObjectController, ENConsts, ShowENResponsibles,
  ENResponsiblesController, FINContractsController,
  EditENResponsibles2FINContracts, ENResponsibles2FINContractsController,
  DMReportsUnit, EditOMTSResponsibles;

{$R *.dfm}

procedure TfrmRQOrderChangeContractEdit.FormShow(Sender: TObject);
begin
  ///// 23.12.10
  // DisableControls([edtRQOrgOrgName, edtContractNumber, spbContractNumber]);
  // Разрешаем вводить руками (не выбирая из ФК)!
  DisableControls([edtRQOrgOrgName, spbContractNumber,
                   {*** 08.05.12 Нафига его вводить руками (?) ***} edtContractNumber, {***}
                   edtENResponsibles, spbENResponsibles]);
  /////
  DisableActions([actInsertResp2Contract]);
  DenyBlankValues([edtRQOrgOrgName]);
end;

procedure TfrmRQOrderChangeContractEdit.spbRQOrgClick(Sender: TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
   tmpOrg: RQOrg;
   TempRQOrg: RQOrgControllerSoapPort;
   sDate, lDate, nDate, strId, strAXId: String;
begin
  {
   frmRQOrgShow := TfrmRQOrgShow.Create(Application, fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if org = nil then
               begin
                org := RQOrg.Create();
                SetNullIntProps(org);
                SetNullXSProps(org);
               end;
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);

               //org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               strId := GetReturnValue(sgRQOrg, 0);
               if strId = '' then
                 org.id := LOW_INT
               else
                 org.id := StrToInt(strId);

               strAXId := GetReturnValue(sgRQOrg, 24);
               if strAXId = '' then
                 org.axOrgId := LOW_INT
               else
                 org.axOrgId := StrToInt(strAXId);
               org.axOrgCode := GetReturnValue(sgRQOrg, 25);

               org.codeorg := GetReturnValue(sgRQOrg,8);
               org.name := GetReturnValue(sgRQOrg,1);
               org.ukr_name := GetReturnValue(sgRQOrg,9);
               org.okpo := GetReturnValue(sgRQOrg,2);
               org.nalog_num := GetReturnValue(sgRQOrg,3);
               org.svidet_num := GetReturnValue(sgRQOrg,4);
               org.adr := GetReturnValue(sgRQOrg,5);
               org.tel := GetReturnValue(sgRQOrg,6);
               org.country := GetReturnValue(sgRQOrg,10);
               org.region := GetReturnValue(sgRQOrg,11);
               org.ministry := GetReturnValue(sgRQOrg,12);
               org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               org.type_ := GetReturnValue(sgRQOrg,14);
               org.master_code := GetReturnValue(sgRQOrg,15);

               //org.date_svidet := TXSDate.Create;
               //org.likv_date := TXSDate.Create;
               //org.dateNalogform := TXSDate.Create;

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    org.date_svidet := TXSDate.Create;
                    org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    org.likv_date := TXSDate.Create;
                    org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               org.except_flag := GetReturnValue(sgRQOrg,18);
               org.likv_flag := GetReturnValue(sgRQOrg,19);
               org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    org.date_nalogform := TXSDate.Create;
                    org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               org.adr_legal := GetReturnValue(sgRQOrg,23);
               org.Primechan := GetReturnValue(sgRQOrg,7);

               spbContractNumberClearClick(Sender);
               DisableControls([spbContractNumber], false);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
   }

  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, org) then
  begin
    org := tmpOrg;
    edtRQOrgOrgName.Text := org.name;
    spbContractNumberClearClick(Sender);
    DisableControls([spbContractNumber], false);
  end;
end;

procedure TfrmRQOrderChangeContractEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([
        edtRQOrgOrgName
       ])  then
    begin
      Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
    else begin
      if org = nil then
      begin
        Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
        Exit;
      end;

      ///////
			// 23.10.12 NET-3387 Теперь отв. лицо выбирается из развязки с материалом (на сервере)!!!
      {
      if (finDocID > LOW_INT) and (responsibleCode = LOW_INT) then
      begin
        Application.MessageBox(PChar('Виберіть відповідальну особу!'), PChar('Увага!'), MB_ICONWARNING);
        edtENResponsibles.SetFocus;
        Action := caNone;
        Exit;
      end;
      }
      ///////

      { 08.05.12 Нафига его вводить руками (?)
      ///// 23.12.10
      // Разрешаем вводить руками (не выбирая из ФК)!
      if contractNumber = '' then
        contractNumber := Trim(edtContractNumber.Text);
      /////
      }
    end;
end;

procedure TfrmRQOrderChangeContractEdit.spbContractNumberClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;

//   TempENResponsibles: ENResponsiblesControllerSoapPort;
//   respFilter: ENResponsiblesFilter;
//   respList: ENResponsiblesShortList;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(org.id) ; // and a.agree_group_id in (205, 342, 319, 88)';

   //f.partnerCode := org.codeorg;
   f.partnerCode := org.axOrgCode;

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      //frmFINServicesObjectShow.
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
                contractNumber := GetReturnValue(sgFINServicesObject, 1);
                contractDate := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                finDocCode := GetReturnValue(sgFINServicesObject, 5);
                finDocID := LOW_INT;
                finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));

                if finDocID = LOW_INT then
                  raise Exception.Create('Помилка при виборі договору!');

                spbENResponsiblesClearClick(Sender);
                DisableControls([spbENResponsibles], false);
                DisableActions([actInsertResp2Contract], false);

                /////// Пытаемся определить автоматом отв. лицо

                ///////
                // 23.10.12 NET-3387 Теперь отв. лицо выбирается из развязки с материалом (на сервере)!!!
                // SetResponsibleByFinDocID;
                ///////

                {
                respFilter := ENResponsiblesFilter.Create;
                SetNullXSProps(respFilter);
                SetNullIntProps(respFilter);

                respFilter.conditionSQL := 'enresponsibles.code in ' +
                   '(select rf.responsiblesrefcode from enresponsbls2fncntrcts rf ' +
                   ' where rf.fincontractscode in ' +
                   ' (select c.code from fincontracts c ' +
                   '  where c.findocid = ' + IntToStr(finDocID) + '))';

                TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;

                respList := TempENResponsibles.getScrollableFilteredList(respFilter, 0, -1);

                if respList.totalCount > 0 then
                begin
                  // Если к выбранному договору привязано только одно отв. лицо, сразу же его подставляем
                  if respList.totalCount = 1 then
                  begin
                    responsibleCode := respList.list[0].code;
                    edtENResponsibles.Text := respList.list[0].FIO;
                  end
                  else // А если привязано несколько отв. лиц, открываем окно со списком для выбора
                    spbENResponsiblesClick(Sender);
                end;
                }
                ///////
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmRQOrderChangeContractEdit.FormCreate(Sender: TObject);
begin
  org := nil;
  contractNumber := '';
  finDocCode := '';
  finDocID := LOW_INT;
  responsibleCode := LOW_INT;
end;

procedure TfrmRQOrderChangeContractEdit.spbRQOrgClearClick(
  Sender: TObject);
begin
  edtRQOrgOrgName.Text := '';
  org := nil;
  spbContractNumberClearClick(Sender);
  DisableControls([spbContractNumber]);
end;

procedure TfrmRQOrderChangeContractEdit.spbContractNumberClearClick(
  Sender: TObject);
begin
  edtContractNumber.Text := '';
  contractNumber := '';
  finDocCode := '';
  finDocID := LOW_INT;

  //responsibleCode := LOW_INT;
  //edtENResponsibles.Text := '';
  spbENResponsiblesClearClick(Sender);
  DisableControls([spbENResponsibles]);
  DisableActions([actInsertResp2Contract]);
end;

procedure TfrmRQOrderChangeContractEdit.spbENResponsiblesClearClick(
  Sender: TObject);
begin
  responsibleCode := LOW_INT;
  edtENResponsibles.Text := '';
end;

procedure TfrmRQOrderChangeContractEdit.spbENResponsiblesClick(
  Sender: TObject);
var
   frmENResponsiblesShow: TfrmENResponsiblesShow;
   respFilter: ENResponsiblesFilter;
begin
  if finDocID = LOW_INT then
  begin
    Application.MessageBox(PChar('Виберіть договір!'), PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  respFilter := ENResponsiblesFilter.Create;
  SetNullXSProps(respFilter);
  SetNullIntProps(respFilter);

  respFilter.conditionSQL := 'enresponsibles.code in ' +
     '(select rf.responsiblesrefcode from enresponsbls2fncntrcts rf ' +
     ' where rf.fincontractscode in ' +
     ' (select c.code from fincontracts c ' +
     '  where c.findocid = ' + IntToStr(finDocID) + '))';

  frmENResponsiblesShow := TfrmENResponsiblesShow.Create(Application, fmNormal, respFilter);
  try
    frmENResponsiblesShow.Caption := 'Оберіть, будь ласка, відповідальну особу:'; 
    frmENResponsiblesShow.DisableActions([frmENResponsiblesShow.actInsert,
                                          frmENResponsiblesShow.actEdit,
                                          frmENResponsiblesShow.actDelete,
                                          frmENResponsiblesShow.actFilter,
                                          frmENResponsiblesShow.actNoFilter]);
    with frmENResponsiblesShow do
      if ShowModal = mrOk then
      begin
        try
          //if ENResponsibles2FINContractsObj.responsiblesRef = nil then ENResponsibles2FINContractsObj.responsiblesRef := ENResponsiblesRef.Create();
          //ENResponsibles2FINContractsObj.responsiblesRef.code := StrToInt(GetReturnValue(sgENResponsibles,0));
          responsibleCode := StrToInt(GetReturnValue(sgENResponsibles, 0));
          edtENResponsibles.Text := GetReturnValue(sgENResponsibles, 1);
        except
          on EConvertError do Exit;
        end;
     end;
  finally
    frmENResponsiblesShow.Free;
  end;
end;

procedure TfrmRQOrderChangeContractEdit.actInsertResp2ContractExecute(
  Sender: TObject);
var //respCode, finContractCode: Integer;
    TempFINContracts: FINContractsControllerSoapPort;
    contractsFilter: FINContractsFilter;
    contractsList: FINContractsShortList;
    newContract: FINContracts;
    newContractCode: Integer;
begin
  if org = nil then
  begin
    Application.MessageBox(PChar('Введіть постачальника!'), PChar('Увага!'), MB_ICONWARNING);
    edtRQOrgOrgName.SetFocus;
    Exit;
  end;

  if finDocID = LOW_INT then
  begin
    Application.MessageBox(PChar('Виберіть договір!'), PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  ENResponsibles2FINContractsObj := ENResponsibles2FINContracts.Create;
  try
    SetNullIntProps(ENResponsibles2FINContractsObj);
    SetNullXSProps(ENResponsibles2FINContractsObj);

    frmENResponsibles2FINContractsEdit := TfrmENResponsibles2FINContractsEdit.Create(Application, dsInsert);
    try
      contractsFilter := FINContractsFilter.Create;
      SetNullIntProps(contractsFilter);
      SetNullXSProps(contractsFilter);

      contractsFilter.finDocID := finDocID;

      TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;

      contractsList := TempFINContracts.getScrollableFilteredList(contractsFilter, 0, -1);

      // Если договор уже есть в FINContracts, выдергиваем его
      if contractsList.totalCount > 0 then
      begin
        if contractsList.totalCount > 1 then
          raise Exception.Create('Помилка у кількості договорів з кодом (ФК) ' + IntToStr(finDocID) +
                                 ' (' + IntToStr(contractsList.totalCount) + ' шт.) !');

        ENResponsibles2FINContractsObj.finContracts := FINContracts.Create;
        ENResponsibles2FINContractsObj.finContracts.code := contractsList.list[0].code;

        frmENResponsibles2FINContractsEdit.edtFINContracts.Text := contractsList.list[0].contractNumber +
                                                                   ' (' + contractsList.list[0].orgName + ')';
      end
      // Если договора в FINContracts еще нет, сначала пробуем его туда добавить
      else begin
        newContract := FINContracts.Create;
        SetNullIntProps(newContract);
        SetNullXSProps(newContract);

        newContract.contractNumber := contractNumber;
        newContract.contractDate := TXSDate.Create;
        newContract.contractDate.XSToNative(GetXSDate(contractDate));
        newContract.finDocCode := finDocCode;
        newContract.finDocID := finDocID;

        newContract.org := RQOrg.Create;
        newContract.org := DMReports.copyOrg(org, newContract.org);

        newContractCode := LOW_INT;

        newContractCode := TempFINContracts.add(newContract);

        if newContractCode = LOW_INT then
          raise Exception.Create('Помилка при додаванні договору з кодом (ФК) ' + IntToStr(finDocID) + ' !');

        ENResponsibles2FINContractsObj.finContracts := FINContracts.Create;
        ENResponsibles2FINContractsObj.finContracts.code := newContractCode;

        frmENResponsibles2FINContractsEdit.edtFINContracts.Text := contractNumber + ' (' + org.name + ')';
      end;

      if frmENResponsibles2FINContractsEdit.ShowModal = mrOk then
      begin
        //actUpdateResp2ContractExecute(Sender);

        // Не будем спрашивать, откроем сразу
        /// if Application.MessageBox(PChar('Зв''язок додано! Відкрити перелік відповідальних осіб для вибору?'),
        ///                          PChar('Увага!'), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) = IDYES then
        /// begin

          //*** spbENResponsiblesClick(Sender);
          SetResponsibleByFinDocID; // Если одно отв. лицо по договору, засетим его сразу, если больше - откроем окно для выбора

        /// end;

      end;
    finally
      frmENResponsibles2FINContractsEdit.Free;
    end;
  finally
    ENResponsibles2FINContractsObj.Free;
  end;
end;

procedure TfrmRQOrderChangeContractEdit.actEditOMTSResponsiblesExecute(
  Sender: TObject);
begin
  frmOMTSResponsiblesEdit := TfrmOMTSResponsiblesEdit.Create(Application, dsInsert);
  try
    frmOMTSResponsiblesEdit.ShowModal;
  finally
    frmOMTSResponsiblesEdit.Free;
  end;
end;

procedure TfrmRQOrderChangeContractEdit.SetResponsibleByFinDocID;
var
  TempENResponsibles: ENResponsiblesControllerSoapPort;
  respFilter: ENResponsiblesFilter;
  respList: ENResponsiblesShortList;
begin
  ///////
  // 23.10.12 NET-3387 Теперь отв. лицо выбирается из развязки с материалом (на сервере)!!!
  spbENResponsiblesClearClick(nil);
  Exit;
  /////

  /////// Пытаемся определить автоматом отв. лицо
  respFilter := ENResponsiblesFilter.Create;
  SetNullXSProps(respFilter);
  SetNullIntProps(respFilter);

  respFilter.conditionSQL := 'enresponsibles.code in ' +
     '(select rf.responsiblesrefcode from enresponsbls2fncntrcts rf ' +
     ' where rf.fincontractscode in ' +
     ' (select c.code from fincontracts c ' +
     '  where c.findocid = ' + IntToStr(finDocID) + '))';

  TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;

  respList := TempENResponsibles.getScrollableFilteredList(respFilter, 0, -1);

  if respList.totalCount > 0 then
  begin
    // Если к выбранному договору привязано только одно отв. лицо, сразу же его подставляем
    if respList.totalCount = 1 then
    begin
      responsibleCode := respList.list[0].code;
      edtENResponsibles.Text := respList.list[0].FIO;
    end
    else // А если привязано несколько отв. лиц, открываем окно со списком для выбора
      spbENResponsiblesClick(nil);
  end;
  ///////
end;

end.
