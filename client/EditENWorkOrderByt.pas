
unit EditENWorkOrderByt;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, Globals,
    EnergyproController, EnergyproController2, ENWorkOrderBytController, ENDepartment2EPRenController, AdvObj,
    ENRecordPointBytController, LoginUnit, HTMLabel;

type
  TfrmENWorkOrderBytEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    HTTPRIOENWorkOrderByt: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENDepartment: THTTPRIO;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    tsItems: TTabSheet;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    lblENDepartmentDepartmentRefName: TLabel;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    ImageList1: TImageList;
    HTTPRIOENWorkOrderBytItem: THTTPRIO;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    sgENWorkOrderBytItem: TAdvStringGrid;
    actViewPlan: TAction;
    ToolButton4: TToolButton;
    HTTPRIOENPlanWork: THTTPRIO;
    N5: TMenuItem;
    N9: TMenuItem;
    lblSite: TLabel;
    edtSite: TEdit;
    spbSite: TSpeedButton;
    lblFinWorker: TLabel;
    spbFinWorker: TSpeedButton;
    lblFinWorkerTabNumber: TLabel;
    lblFINWorkerName: TLabel;
    edtFINWorkerName: TEdit;
    edtFinWorkerTabNumber: TEdit;
    HTTPRIOENSite: THTTPRIO;
    btnPrint: TButton;
    chbCheckAll: TCheckBox;
    btnCheckSelected: TButton;
    btnUncheckSelected: TButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    chbPrintDetailFromBilling: TCheckBox;
    HTTPRIOENRecordPointByt: THTTPRIO;
    chbPrintAdditionalDocuments: TCheckBox;
    lblType: TLabel;
    edtType: TEdit;
    HTTPRIOENWorkOrderBytType: THTTPRIO;
    actChangeFinWorker: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    ToolButton5: TToolButton;
    btnPrintPrintAdditionalAgreements: TButton;
    gbAdditionalAgreements: TGroupBox;
    chbPrintCountersChange: TCheckBox;
    chbPrintTariffChange: TCheckBox;
    chbPrintPowerChange: TCheckBox;
    actSealsBinding: TAction;
    ToolButton9: TToolButton;
    actSealsBindingByFact: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    lblStatus: TLabel;
    edtStatus: TEdit;
    HTTPRIOENWorkOrderBytStatus: THTTPRIO;
    ToolButton2: TToolButton;
    actEditPlan: TAction;
    ToolButton3: TToolButton;
    N15: TMenuItem;
    chbPrintSaveSeals: TCheckBox;
    htmlAttention: THTMLabel;
    actSetSMSInfo: TAction;
    HTTPRIOENPlanInformCustomer: THTTPRIO;
    N16: TMenuItem;
    actSetSMSInfo1: TMenuItem;
    btnSMSInform: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure spbSiteClick(Sender: TObject);
    procedure spbFinWorkerClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure chbCheckAllClick(Sender: TObject);
    procedure btnCheckSelectedClick(Sender: TObject);
    procedure btnUncheckSelectedClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure PrintDetailReportFromBilling();
    procedure PrintAdditionalDocuments();
    procedure actChangeFinWorkerExecute(Sender: TObject);
    procedure btnPrintPrintAdditionalAgreementsClick(Sender: TObject);
    procedure actSealsBindingExecute(Sender: TObject);
    procedure actSealsBindingByFactExecute(Sender: TObject);
    procedure actEditPlanExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSetSMSInfoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateENWorkOrderBytItems;
  public
    { Public declarations }
    ENWorkOrderBytObj: ENWorkOrderByt;
  end;

var vENWorkOrderBytItemSQL: String;
  frmENWorkOrderBytEdit: TfrmENWorkOrderBytEdit;
  //ENWorkOrderBytObj: ENWorkOrderByt;

implementation

uses ShowENDepartment, ENDepartmentController, ENWorkOrderBytItemController,
  ENConsts, EditENWorkOrderBytItem, EditENWorkOrderBytItemAdd,
  ENPlanWorkController, EditENPlanWork, ShowENSite, ENSiteController, ShowFINWorker,
  FINWorkerController, FINWorkerKindController, DMReportsUnit,
  ENWorkOrderBytTypeController, EditFINWorkerAssignToAll,
  EditSCSeal2ENWorkOrderByt, EditSealRegistriesForENWorkOrderByt,
  ENWorkOrderBytStatusController, DMBillingUnit, EditENPlanInformCustomer,
  ENPlanInformCustomerController;


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderBytController  ;
}
{$R *.dfm}

var
  ENWorkOrderBytItemHeaders: array [1..16] of String =
        ( 'Код'
          ,'Виконавець'
          ,'Код роботи'
          ,'Робота'
          ,'№ дог. з послуг'
          ,'Особ. рахунок'
          ,'ПІБ абонента/замовника'
          ,'Адреса абонента'
          ,'Номер тел. абонента'
          ,'Час прибуття'
          ,'Інв. № лічильника'
          ,'Сер. № лічильника'
          ,'Номери пломб'
          ,'Норм. посада'
          ,'Дата створення міс. плану'
          ,'Попередній рік та місяць плану'
          //,'Примітка'
          //,'Дата створення'
          //,'Дата зміни'
          //,'Користувач, який створив запис'
          //,'Користувач, який вніс зміни'
        );

procedure TfrmENWorkOrderBytEdit.FormShow(Sender: TObject);
var
  TempENDepartment: ENDepartmentControllerSoapPort;
  departmentObj: ENDepartment;
  TempENSite: ENSiteControllerSoapPort;
  siteObj: ENSite;
  TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
  typeObj: ENWorkOrderBytType;
  TempENWorkOrderBytStatus: ENWorkOrderBytStatusControllerSoapPort;
  statusObj: ENWorkOrderBytStatus;
begin
  SetGridHeaders(ENWorkOrderBytItemHeaders, sgENWorkOrderBytItem.ColumnHeaders);
  DisableControls([edtCode, edtENDepartment, edtSite, edtFinWorkerTabNumber, edtFINWorkerName, edtType, edtStatus]);

  pcMain.ActivePage := tsMain;

  DisableActions([actSealsBinding, actSealsBindingByFact]);
  HideActions([actSealsBinding, actSealsBindingByFact]);

  //actSealsBinding.Visible := (HTTPRIOENWorkOrderByt.HTTPWebNode.UserName = 'energynet');
  //actSealsBindingByFact.Visible := (HTTPRIOENWorkOrderByt.HTTPWebNode.UserName = 'energynet');

  DisableControls([chbPrintDetailFromBilling, chbPrintAdditionalDocuments,
                   chbCheckAll, btnCheckSelected, btnUncheckSelected,
                   chbPrintCountersChange, chbPrintTariffChange, chbPrintPowerChange, chbPrintSaveSeals], False);

  if DialogState = dsView then
  begin
    DisableControls([spbENDepartment, spbSite, spbFinWorker{, btnCheckSelected, btnUncheckSelected}]);
    DisableActions([actInsert, actEdit, actDelete, actChangeFinWorker]);

    // Пускай удаляют при любом статусе - главное, чтобы план был черновым (проверяется на серваке)
    {
    // Для еще не выполненных заданий нужно открыть возможность удаления строк
    // (все доп. проверки - на серваке)
    if (ENWorkOrderBytObj.statusRef.code = ENWORKORDERBYTSTATUS_DRAFT) or
       (ENWorkOrderBytObj.statusRef.code = ENWORKORDERBYTSTATUS_FORMED) or
       (ENWorkOrderBytObj.statusRef.code = ENWORKORDERBYTSTATUS_APPROVED) then
    }
    DisableActions([actDelete], false);
  end;

  if DialogState = dsEdit then
  begin
    DisableControls([edtNumberGen{??}, edtDateGen, edtENDepartment, spbENDepartment]);
  end;

  if DialogState = dsInsert then
  begin
    tsItems.TabVisible := false;
    HideControls([btnPrint, chbPrintDetailFromBilling, chbPrintAdditionalDocuments,
                  lblType, edtType, lblStatus, edtStatus]);
  end;

  if (DialogState = dsView) or (DialogState = dsEdit) then begin
       htmlAttention.Visible := (ENWorkOrderBytObj.typeRef.code = ENWORKORDERBYTTYPE_CONTROL);
  end;


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtENDepartment
      ,edtFinWorkerTabNumber
      ,edtFINWorkerName
     ]);

  end;



  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENWorkOrderBytObj.code);

    edtNumberGen.Text := ENWorkOrderBytObj.numberGen;

    if ENWorkOrderBytObj.dateGen <> nil then
    begin
      edtDateGen.DateTime := EncodeDate(ENWorkOrderBytObj.dateGen.Year, ENWorkOrderBytObj.dateGen.Month, ENWorkOrderBytObj.dateGen.Day);
      edtDateGen.checked := true;
    end
    else begin
      edtDateGen.DateTime := SysUtils.Date;
      edtDateGen.checked := false;
    end;

    MakeMultiline(edtCommentGen.Lines, ENWorkOrderBytObj.commentGen);

    if ENWorkOrderBytObj.departmentRef <> nil then
      if ENWorkOrderBytObj.departmentRef.code <> LOW_INT then
      begin
        TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
        departmentObj := TempENDepartment.getObject(ENWorkOrderBytObj.departmentRef.code);
        if departmentObj <> nil then
          edtENDepartment.Text := departmentObj.shortName;
      end;

    if ENWorkOrderBytObj.siteRef <> nil then
      if ENWorkOrderBytObj.siteRef.code <> LOW_INT then
      begin
        TempENSite := HTTPRIOENSite as ENSiteControllerSoapPort;
        siteObj := TempENSite.getObject(ENWorkOrderBytObj.siteRef.code);
        if siteObj <> nil then
          edtSite.Text := siteObj.name;
      end;

    if ENWorkOrderBytObj.finWorker <> nil then
    begin
      edtFINWorkerName.Text := ENWorkOrderBytObj.finWorker.name;
      edtFinWorkerTabNumber.Text := ENWorkOrderBytObj.finWorker.tabNumber;
    end;

    if ENWorkOrderBytObj.typeRef <> nil then
      if ENWorkOrderBytObj.typeRef.code <> LOW_INT then
      begin
        if (ENWorkOrderBytObj.typeRef.code = ENWORKORDERBYTTYPE_RAID_BY_BILLING) or
           (ENWorkOrderBytObj.typeRef.code = ENWORKORDERBYTTYPE_CONTROL) then
        begin
          DisableActions([actInsert, actDelete]);
          HideActions([actInsert, actDelete]);
          HideControls([chbPrintAdditionalDocuments]);
        end;

        TempENWorkOrderBytType := HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;
        typeObj := TempENWorkOrderBytType.getObject(ENWorkOrderBytObj.typeRef.code);
        if typeObj <> nil then
          edtType.Text := typeObj.name;
      end;

    if ENWorkOrderBytObj.statusRef <> nil then
      if ENWorkOrderBytObj.statusRef.code <> LOW_INT then
      begin
        TempENWorkOrderBytStatus := HTTPRIOENWorkOrderBytStatus as ENWorkOrderBytStatusControllerSoapPort;
        statusObj := TempENWorkOrderBytStatus.getObject(ENWorkOrderBytObj.statusRef.code);
        if statusObj <> nil then
          edtStatus.Text := statusObj.name;

        //if (HTTPRIOENWorkOrderByt.HTTPWebNode.UserName = 'energynet') then
        //begin
          if (statusObj.code = ENWORKORDERBYTSTATUS_FORMED) or
             (statusObj.code = ENWORKORDERBYTSTATUS_COMPLETED) then
          begin
            actSealsBinding.Enabled := true;
            actSealsBinding.Visible := true;
          end;

          // Чтобы можно было посмотреть реестры пломб и в статусе "Завершене"
          if statusObj.code >= ENWORKORDERBYTSTATUS_COMPLETED then
          begin
            actSealsBindingByFact.Enabled := true;
            actSealsBindingByFact.Visible := true;
          end;
        //end;

      end; // if ENWorkOrderBytObj.statusRef.code <> LOW_INT
  end; // if (DialogState = dsEdit) or (DialogState = dsView)
end;



procedure TfrmENWorkOrderBytEdit.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePage = tsItems then
    UpdateENWorkOrderBytItems;
end;

procedure TfrmENWorkOrderBytEdit.spbENDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f: ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENWorkOrderBytObj.departmentRef = nil then ENWorkOrderBytObj.departmentRef := ENDepartmentRef.Create();
               ENWorkOrderBytObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENWorkOrderBytEdit.spbFinWorkerClick(Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f: FINWorkerFilter;
   //TempFINWorker: FINWorkerControllerSoapPort;
   TempENDepartment: ENDepartmentControllerSoapPort;
   departmentObj: ENDepartment;
begin
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if ENWorkOrderBytObj.departmentRef <> nil then
    if ENWorkOrderBytObj.departmentRef.code <> LOW_INT then
    begin
      // MDAX-441
      if DMReports.UsesMDAXData then
      begin
        TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
        departmentObj := TempENDepartment.getObject(ENWorkOrderBytObj.departmentRef.code);
        if departmentObj <> nil then
          if departmentObj.hrmorganizationid <> '' then
            f.departmentCode := departmentObj.hrmorganizationid;
      end
      else begin
        f.departmentCode := IntToStr(ENWorkOrderBytObj.departmentRef.code);
      end;
    end;

   frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
   try
     frmFINWorkerShow.dateGet := TXSDate.Create;
     frmFINWorkerShow.dateGet.XSToNative(GetXSDate(edtDateGen.DateTime));

     frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
          try
            if ENWorkOrderBytObj.finWorker = nil then
            begin
              ENWorkOrderBytObj.finWorker := FINWorker.Create;
              ENWorkOrderBytObj.finWorker.code := LOW_INT;
            end;

            ENWorkOrderBytObj.finWorker.name := GetReturnValue(sgFINWorker,1);
            ENWorkOrderBytObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);
            ENWorkOrderBytObj.finWorker.positionName := GetReturnValue(sgFINWorker,3);

            if (GetReturnValue(sgFINWorker,4) <> '') then
              ENWorkOrderBytObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
            else
              ENWorkOrderBytObj.finWorker.positionCode := LOW_INT;

            ENWorkOrderBytObj.finWorker.departmentName := GetReturnValue(sgFINWorker,5);
            ENWorkOrderBytObj.finWorker.departmentCode := (GetReturnValue(sgFINWorker,6));
            if ENWorkOrderBytObj.finWorker.priceGen = nil then ENWorkOrderBytObj.finWorker.priceGen := TXSDecimal.Create;
            ENWorkOrderBytObj.finWorker.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

            ENWorkOrderBytObj.finWorker.kindRef := FINWorkerKindRef.Create;

            ENWorkOrderBytObj.finWorker.categor := LOW_INT;

            if GetReturnValue(sgFINWorker,8) = '' then
            begin
              ENWorkOrderBytObj.finWorker.kindRef.code := FINWORKER_KIND_OTHER;
            end
            else
            begin
              //if StrToInt(GetReturnValue(sgFINWorker,8)) =
              ENWorkOrderBytObj.finWorker.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
            end;

            if (GetReturnValue(sgFINWorker,9) <> '') then
              ENWorkOrderBytObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
            else
              ENWorkOrderBytObj.finWorker.finCode := LOW_INT;

            if (GetReturnValue(sgFINWorker,12) <> '') then
              ENWorkOrderBytObj.finWorker.categorId := StrToInt(GetReturnValue(sgFINWorker,12))
            else
              ENWorkOrderBytObj.finWorker.categorId := LOW_INT;

            ENWorkOrderBytObj.finWorker.categorName := GetReturnValue(sgFINWorker,13);
            ENWorkOrderBytObj.finWorker.workTimeId := GetReturnValue(sgFINWorker,14);

            ENWorkOrderBytObj.finWorker.positionId := GetReturnValue(sgFINWorker,15);

            edtFINWorkerName.Text := ENWorkOrderBytObj.finWorker.name;
            edtFinWorkerTabNumber.Text := ENWorkOrderBytObj.finWorker.tabNumber;
          except
            on EConvertError do Exit;
          end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENWorkOrderBytEdit.spbSiteClick(Sender: TObject);
var frmENSiteShow: TfrmENSiteShow;
begin
  frmENSiteShow := TfrmENSiteShow.Create(Application, fmNormal);
  try
    frmENSiteShow.DisableActions([frmENSiteShow.actInsert,
                                  frmENSiteShow.actEdit,
                                  frmENSiteShow.actDelete]);
    with frmENSiteShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          if ENWorkOrderBytObj.siteRef = nil then ENWorkOrderBytObj.siteRef := ENSiteRef.Create();
          ENWorkOrderBytObj.siteRef.code := StrToInt(GetReturnValue(sgENSite, 0));
          edtSite.Text := GetReturnValue(sgENSite, 1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENSiteShow.Free;
  end;
end;

procedure TfrmENWorkOrderBytEdit.UpdateENWorkOrderBytItems;
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  i, LastCount: Integer;
  ENWorkOrderBytItemList: ENWorkOrderBytItemShortList;
  itemFilter: ENWorkOrderBytItemFilter;
  customerName, conditionSQL: String;
begin
  ClearGrid(sgENWorkOrderBytItem);

  chbCheckAll.Checked := false;

  if DialogState = dsInsert then Exit;
  if ENWorkOrderBytObj = nil then Exit;
  if ENWorkOrderBytObj.code = LOW_INT then Exit;

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

  itemFilter := ENWorkOrderBytItemFilter.Create;
  SetNullIntProps(itemFilter);
  SetNullXSProps(itemFilter);

  itemFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  itemFilter.workOrderBytRef.code := ENWorkOrderBytObj.code;

  if vENWorkOrderBytItemSQL <> '' then
    begin
      conditionSQL := ENWorkOrderBytItemFilter(itemFilter).conditionSQL;
      AddCondition(conditionSQL, vENWorkOrderBytItemSQL);
      ENWorkOrderBytItemFilter(itemFilter).conditionSQL := conditionSQL;
    end;

  ENWorkOrderBytItemList := TempENWorkOrderBytItem.getScrollableFilteredList(itemFilter, 0, -1);

  LastCount := High(ENWorkOrderBytItemList.list);

  if LastCount > -1 then
    sgENWorkOrderBytItem.RowCount := LastCount + 2
  else
    sgENWorkOrderBytItem.RowCount := 2;

  with sgENWorkOrderBytItem do
    for i:=0 to LastCount do
    begin
      Application.ProcessMessages;

{
        ( 'Код'
          ,'Виконавець'
          ,'Код роботи'
          ,'Робота'
          ,'№ дог. з послуг'
          ,'Особ. рахунок'
          ,'ПІБ абонента/замовника'
          ,'Адреса абонента'
          ,'Номер тел. абонента'
          ,'Час прибуття'
          ,'Інв. № лічильника'
          ,'Сер. № лічильника'
          ,'Номери пломб'
          ,'Норм. посада'
          ,'Дата створення міс. плану'
          ,'Попередній рік та місяць плану'
        );
}

      if ENWorkOrderBytItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := ENWorkOrderBytItemList.list[i].finWorkerName + ' (таб. №' + ENWorkOrderBytItemList.list[i].finWorkerTabNumber + ')';

      //if DialogState = dsEdit then // Добавляем чекбоксы и на просмотре тоже (для печати доп. соглашений по выранным строкам)
      AddCheckBox(1, i+1, false, false);

      Cells[2,i+1] := ENWorkOrderBytItemList.list[i].kartaRefNum;
      Cells[3,i+1] := ENWorkOrderBytItemList.list[i].kartaRefName;

      Cells[4,i+1] := ENWorkOrderBytItemList.list[i].contractNumberServices;
      Cells[5,i+1] := ENWorkOrderBytItemList.list[i].accountNumber;

      ///
      //Cells[6,i+1] := ENWorkOrderBytItemList.list[i].name;
      customerName := ENWorkOrderBytItemList.list[i].customerName;
      if ENWorkOrderBytItemList.list[i].recordPointPromRefCode <> Low(Integer) then
        customerName := customerName + ' (' + ENWorkOrderBytItemList.list[i].recordPointName + ')';

      Cells[6,i+1] := customerName;
      ///

      Cells[7,i+1] := ENWorkOrderBytItemList.list[i].address;
      Cells[8,i+1] := ENWorkOrderBytItemList.list[i].phone;
      Cells[9,i+1] := ENWorkOrderBytItemList.list[i].smsInformTime;

      Cells[10,i+1] := ENWorkOrderBytItemList.list[i].invNumber;
      Cells[11,i+1] := ENWorkOrderBytItemList.list[i].serialNumber;
      Cells[12,i+1] := ENWorkOrderBytItemList.list[i].seal;

      Cells[13,i+1] := ENWorkOrderBytItemList.list[i].positionName;

      ///// SUPP-100160 (СЗ-015822)
      if ENWorkOrderBytItemList.list[i].monthPlanDateGen = nil then
        Cells[14,i+1] := ''
      else
        Cells[14,i+1] := XSDateTimeWithDate2String(ENWorkOrderBytItemList.list[i].monthPlanDateGen);

      Cells[15,i+1] := ENWorkOrderBytItemList.list[i].previousPeriod;
      /////

      Objects[1,i+1] := TObject(ENWorkOrderBytItemList.list[i].planRefCode);

      sgENWorkOrderBytItem.RowCount := i + 2;
    end;

   sgENWorkOrderBytItem.Row := 1;
end;

procedure TfrmENWorkOrderBytEdit.actChangeFinWorkerExecute(Sender: TObject);
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  ObjCode: Integer;
  i: Integer;
  state: Boolean;
begin
  if DialogState <> dsEdit then Exit;

  state := false;

  for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
  begin
    sgENWorkOrderBytItem.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  frmFINWorkerAssignToAllEdit := TfrmFINWorkerAssignToAllEdit.Create(Application, dsInsert);
  try
    frmFINWorkerAssignToAllEdit.planCode := LOW_INT;
    frmFINWorkerAssignToAllEdit.workOrderBytCode := ENWorkOrderBytObj.code;

    if frmFINWorkerAssignToAllEdit.ShowModal = mrOK then
    begin

      if Application.MessageBox(PChar('Ви дійсно бажаєте змінити виконавця на ВСІХ вибраних строках ?'),
                                PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
      begin
        TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

        for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
        begin
          sgENWorkOrderBytItem.GetCheckBoxState(1, i, state);

          if state then
          begin
            try
              ObjCode := StrToInt(sgENWorkOrderBytItem.Cells[0, i]);
            except
              on EConvertError do continue;
            end;

            TempENWorkOrderBytItem.updateFinWorker(ObjCode, frmFINWorkerAssignToAllEdit.FINWorkerObj);
          end;
        end;

        actUpdateExecute(Sender);
      end;

    end;

  finally
     frmFINWorkerAssignToAllEdit.Free;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actDeleteExecute(Sender: TObject);
Var TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
    ObjCode: Integer;
    i: Integer;
    state: Boolean;
begin
  state := false;
  for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
  begin
    sgENWorkOrderBytItem.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  {
  try
    ObjCode := StrToInt(sgENWorkOrderBytItem.Cells[0, sgENWorkOrderBytItem.Row]);
  except
    on EConvertError do Exit;
  end;
  }

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ВСІ вибрані строки ?' + #13#10 +
                                  'Зверніть увагу, що буде видалено також прив''язку працівників з Завдань-Планів !'),
                    PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

    for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
    begin
      sgENWorkOrderBytItem.GetCheckBoxState(1, i, state);

      if state then
      begin
        try
          ObjCode := StrToInt(sgENWorkOrderBytItem.Cells[0, i]);
        except
          on EConvertError do continue;
        end;

        TempENWorkOrderBytItem.remove(ObjCode);
      end;
    end;

    actUpdateExecute(Sender);
  end;
end;

procedure TfrmENWorkOrderBytEdit.actEditExecute(Sender: TObject);
Var TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
begin
  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
  try
    ENWorkOrderBytItemObj := TempENWorkOrderBytItem.getObject(StrToInt(sgENWorkOrderBytItem.Cells[0, sgENWorkOrderBytItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENWorkOrderBytItemEdit := TfrmENWorkOrderBytItemEdit.Create(Application, dsEdit);
  try
    frmENWorkOrderBytItemEdit.workOrderBytType := ENWorkOrderBytObj.typeRef.code;

    if frmENWorkOrderBytItemEdit.ShowModal = mrOk then
      actUpdateExecute(Sender);
  finally
    frmENWorkOrderBytItemEdit.Free;
    frmENWorkOrderBytItemEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actEditPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    planCode: Integer;
begin
  planCode := Integer(sgENWorkOrderBytItem.Objects[1, sgENWorkOrderBytItem.Row]);

  if planCode <= 0 then Exit;

  tPlan := DMReports.getPlanByCode(planCode);

  if tPlan = nil then
  begin
    Exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED) then
  begin
    try
      TempENPlanWork.editPreConfirm(tPlan.code);
    except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      Exit;
    end;
  end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])
  then
  begin
    Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ShowModal = mrOk then
    begin
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actInsertExecute(Sender: TObject);
begin
  {
  if not Assigned(frmENWorkOrderBytItemAddEdit) then begin
    frmENWorkOrderBytItemAddEdit := TfrmENWorkOrderBytItemAddEdit.Create(Application, dsInsert);
  end;
  }
  frmENWorkOrderBytItemAddEdit := TfrmENWorkOrderBytItemAddEdit.Create(Application, dsInsert);
  try
    frmENWorkOrderBytItemAddEdit.workOrderBytCode := ENWorkOrderBytObj.code;

    frmENWorkOrderBytItemAddEdit.departmentCode := ENWorkOrderBytObj.departmentRef.code;
    frmENWorkOrderBytItemAddEdit.departmentName := edtENDepartment.Text;

    if ENWorkOrderBytObj.siteRef <> nil then
    begin
      frmENWorkOrderBytItemAddEdit.siteCode := ENWorkOrderBytObj.siteRef.code;
      frmENWorkOrderBytItemAddEdit.siteName := edtSite.Text;
    end;

    if ENWorkOrderBytObj.finWorker <> nil then
    begin
      // MDAX-441
      if DMReports.UsesMDAXData then
      begin
        frmENWorkOrderBytItemAddEdit.axDepartmentCode := ENWorkOrderBytObj.finWorker.departmentCode;
      end
      else begin
        try
          frmENWorkOrderBytItemAddEdit.finDepartmentCode := StrToInt(ENWorkOrderBytObj.finWorker.departmentCode);
        except
          on EConvertError do
            raise Exception.Create('Некоректний код підрозділу для керівника робіт!');
        end;
      end;
    end;

    frmENWorkOrderBytItemAddEdit.dateGet := TXSDate.Create;
    frmENWorkOrderBytItemAddEdit.dateGet.XSToNative(GetXSDate(
                                                      EncodeDate(ENWorkOrderBytObj.dateGen.Year,
                                                                 ENWorkOrderBytObj.dateGen.Month,
                                                                 ENWorkOrderBytObj.dateGen.Day)
                                                    ));

    if frmENWorkOrderBytItemAddEdit.ShowModal = mrOk then
      actUpdateExecute(Sender);
  finally
    frmENWorkOrderBytItemAddEdit.Free;
    frmENWorkOrderBytItemAddEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actSealsBindingByFactExecute(Sender: TObject);
begin
  if ENWorkOrderBytObj = nil then Exit;
  if ENWorkOrderBytObj.code = LOW_INT then Exit;

  frmSealRegistriesForENWorkOrderBytEdit := TfrmSealRegistriesForENWorkOrderBytEdit.Create(Application, dsInsert);
  try
    frmSealRegistriesForENWorkOrderBytEdit.workOrderBytCode := ENWorkOrderBytObj.code;
    frmSealRegistriesForENWorkOrderBytEdit.workOrderBytType := ENWorkOrderBytObj.typeRef.code;

    frmSealRegistriesForENWorkOrderBytEdit.ShowModal;
  finally
    frmSealRegistriesForENWorkOrderBytEdit.Free;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actSealsBindingExecute(Sender: TObject);
begin
  if ENWorkOrderBytObj = nil then Exit;
  if ENWorkOrderBytObj.code = LOW_INT then Exit;
  
  frmSCSeal2ENWorkOrderBytEdit := TfrmSCSeal2ENWorkOrderBytEdit.Create(Application, dsInsert);
  try
    frmSCSeal2ENWorkOrderBytEdit.workOrderBytCode := ENWorkOrderBytObj.code;
    //frmSCSeal2ENWorkOrderBytEdit.sealsCount := DMReports.getSealsCountForWorkOrderByt(ENWorkOrderBytObj.code);
    frmSCSeal2ENWorkOrderBytEdit.isBindingByFact := (ENWorkOrderBytObj.statusRef.code = ENWORKORDERBYTSTATUS_COMPLETED);
    frmSCSeal2ENWorkOrderBytEdit.workOrderBytType := ENWorkOrderBytObj.typeRef.code;

    frmSCSeal2ENWorkOrderBytEdit.ShowModal;
  finally
    frmSCSeal2ENWorkOrderBytEdit.Free;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actSetSMSInfoExecute(Sender: TObject);
Var
TempENPlanInform : ENPlanInformCustomerControllerSoapPort;
tPlan : ENPlanWork;
inform : ENPlanInformCustomer;
informFilter : ENPlanInformCustomerFilter;
informList : ENPlanInformCustomerShortList;

TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  wobi : ENWorkOrderBytItem;

  i, planCode: Integer;
  state: Boolean;

begin

  state := false;
  for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
  begin
    sgENWorkOrderBytItem.GetCheckBoxState(1, i, state);
    if state then
      break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
  TempENPlanInform := HTTPRIOENPlanInformCustomer as ENPlanInformCustomerControllerSoapPort;

  if Application.MessageBox(PChar('Ви дійсно бажаєте встановити час для інформування?'),
                    PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin

    frmENPlanInformCustomerEdit :=TfrmENPlanInformCustomerEdit.Create(Application, dsInsert);
    frmENPlanInformCustomerEdit.isForWorkOrderBytMassSMSInfoSet := True;

      try
        if frmENPlanInformCustomerEdit.ShowModal= mrOk then
          begin
                planCode := LOW_INT;
                for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
                begin
                  sgENWorkOrderBytItem.GetCheckBoxState(1, i, state);
                  if state then
                  begin
                      try
                         wobi := TempENWorkOrderBytItem.getObject(StrToInt(sgENWorkOrderBytItem.Cells[0, i]));
                        except
                          on EConvertError do Exit;
                        end;

                      tPlan := DMReports.getPlanByCode(wobi.planRef.code);

                      if tPlan = nil then
                        begin
                            exit;
                        end;
                      // что бы по два раза по два раза не заносить не заносить
                      if planCode = tPlan.code then
                      Exit;
                      // проверим ка мы нет ли на это плане уже SMS информ
                      informFilter := ENPlanInformCustomerFilter.Create;
                      SetNullIntProps(informFilter);
                      SetNullXSProps(informFilter);
                      informFilter.planRef := ENPlanWorkRef.Create;
                      informFilter.planRef.code := tPlan.code;
                      informList := TempENPlanInform.getScrollableFilteredList(informFilter,0,-1);

                      if informList.totalCount > 0 then
                      begin
                           if informList.list[0].isSent = 0 then
                           TempENPlanInform.remove(informList.list[0].code)
                           else
                           exit;
                      end;

                      inform := ENPlanInformCustomer.Create;

                      with   frmENPlanInformCustomerEdit do
                      begin
                        inform.timeStart := TXSDateTime.Create;
                        inform.timeStart.XSToNative(GetXSDateTimeSeparated(edtdate.DateTime, edtTimeStart.DateTime));

                        inform.timeFinal := TXSDateTime.Create;
                        inform.timeFinal.XSToNative(GetXSDateTimeSeparated(edtdate.DateTime, edtTimeFinal.DateTime));
                      end;

                      inform.planRef := ENPlanWorkRef.Create;
                      inform.planRef.code := tPlan.code;
                      inform.workOrderBytRef := ENWorkOrderBytRef.Create;
                      inform.workOrderBytRef.code := wobi.workOrderBytRef.code;

                      TempENPlanInform.add(inform);
                      planCode := tPlan.code;
                  end;
                end;
                actUpdateExecute(Sender);
           end;
      finally
        frmENPlanInformCustomerEdit.Free;
        frmENPlanInformCustomerEdit := nil;
      end;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateENWorkOrderBytItems;
end;

procedure TfrmENWorkOrderBytEdit.actViewExecute(Sender: TObject);
Var TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
begin
  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
  try
    ENWorkOrderBytItemObj := TempENWorkOrderBytItem.getObject(StrToInt(sgENWorkOrderBytItem.Cells[0, sgENWorkOrderBytItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENWorkOrderBytItemEdit := TfrmENWorkOrderBytItemEdit.Create(Application, dsView);
  try
    frmENWorkOrderBytItemEdit.workOrderBytType := ENWorkOrderBytObj.typeRef.code;

    frmENWorkOrderBytItemEdit.ShowModal;
  finally
    frmENWorkOrderBytItemEdit.Free;
    frmENWorkOrderBytItemEdit := nil;
  end;
end;

procedure TfrmENWorkOrderBytEdit.actViewPlanExecute(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planCode: Integer;
begin
  planCode := Integer(sgENWorkOrderBytItem.Objects[1, sgENWorkOrderBytItem.Row]);

  if planCode <= 0 then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ENPlanWorkObj = nil then Exit;

    frmENPlanWorkEdit.ShowModal;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;


procedure TfrmENWorkOrderBytEdit.btnCheckSelectedClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
  begin
    if sgENWorkOrderBytItem.SelectedCells[1, i] then
      sgENWorkOrderBytItem.SetCheckBoxState(1, i, true);
  end;
end;

procedure TfrmENWorkOrderBytEdit.btnPrintClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;

  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  itemFilter: ENWorkOrderBytItemFilter;
  //itemList: ENWorkOrderBytItemShortList;
  itemArr: ENWorkOrderBytItemController.ArrayOfInteger;
  isWithCounters: boolean;
begin
  if ENWorkOrderBytObj = nil then Exit;
  if ENWorkOrderBytObj.code = LOW_INT then Exit;

  /////
  // 25.05.16 NET-4530 Если в сменном задании есть пломбы, не даем его печатать,
  // пока их не привяжут, т.е. пока задание не будет переведено в статус "Затверджене"

  ///
  { 01.06.16 Пока разрешим печатать без пломб
  if DMReports.isWorkOrderBytWithSeals(ENWorkOrderBytObj.code) then
  begin
    if ENWorkOrderBytObj.statusRef.code < ENWORKORDERBYTSTATUS_APPROVED then
    begin
      Application.MessageBox(PChar('У цьому Змінному завданні використовуються пломби!' + #13#10 +
                                   'Для друку потрібно спочатку прив''язати пломби та перевести завдання ' +
                                   'в статус "Затверджене"!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;
  }
  ///
  /////

  isWithCounters := false;

  /////// Проверим, есть ли в задании строки с привязанными счетчиками
  itemFilter := ENWorkOrderBytItemFilter.Create;
  SetNullIntProps(itemFilter);
  SetNullXSProps(itemFilter);

  itemFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  itemFilter.workOrderBytRef.code := ENWorkOrderBytObj.code;

  itemFilter.conditionSQL := 'ENWORKORDERBYTITEM.sccounterrefcode is not null';

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

  itemArr := TempENWorkOrderBytItem.getScrollableFilteredCodeArray(itemFilter, 0, -1);

  isWithCounters := (High(itemArr) >= 0);
  ///////


  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'workOrderCode';
  args[0] := IntToStr(ENWorkOrderBytObj.code);

  case ENWorkOrderBytObj.typeRef.code of
    ENWORKORDERBYTTYPE_BY_ENERGYNET, ENWORKORDERBYTTYPE_CONTROL:
      begin
        if isWithCounters then // Если есть привязанные счетчики
          reportName := 'RepEnergozbyt/work_order_with_newcounter'
        else
          reportName := 'RepEnergozbyt/work_order';
      end;
    ENWORKORDERBYTTYPE_RAID_BY_BILLING:
      reportName := 'RepEnergozbyt/work_order_raid';
    else
      raise Exception.Create('Невідомий тип змінного завдання!');
  end;

  makeReport(reportName, argNames, args, 'pdf');

  if chbPrintDetailFromBilling.Checked then
  begin
     PrintDetailReportFromBilling;
  end;

  /// 25.06.14 ВРЕМЕННО!!!
  //if (HTTPRIOENWorkOrderByt.HTTPWebNode.UserName = 'energynet') or
  //   (HTTPRIOENWorkOrderByt.HTTPWebNode.UserName = 'BaklanovVV') then
  ///
  if chbPrintAdditionalDocuments.Checked then
    PrintAdditionalDocuments;

  if ENWorkOrderBytObj.typeRef.code = ENWORKORDERBYTTYPE_CONTROL then
  begin
    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'workOrderCode';
    args[0] := IntToStr(ENWorkOrderBytObj.code);

    reportName := 'RepEnergozbyt/work_order_control';

    makeReport(reportName, argNames, args, 'pdf');
  end;
end;

procedure TfrmENWorkOrderBytEdit.btnPrintPrintAdditionalAgreementsClick(
  Sender: TObject);
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  itemFilter: ENWorkOrderBytItemFilter;
  itemList: ENWorkOrderBytItemShortList;
  i, itemCode: Integer;
  state, isCounterChange, printed: Boolean;

  argNames, args: ArrayOfString;
  itemCodes, reportName: String;

  recordPointArr: array of Integer;

  // Процедура для добавления кода точки учета в массив recordPointArr
  procedure addRecordPointInArray(recordPointCode: Integer);
  var arrSize: Integer;
  begin
    arrSize := High(recordPointArr) + 1;
    SetLength(recordPointArr, arrSize + 1);
    recordPointArr[arrSize] := recordPointCode;
  end;

  // Процедура для проверки, содержится ли код точки учета в массиве recordPointArr
  function checkRecordPointInArray(recordPointCode: Integer): Boolean;
  var i: Integer;
  begin
    Result := false;

    for i := 0 to High(recordPointArr) do
      if recordPointArr[i] = recordPointCode then
      begin
        Result := true;
        Exit;
      end;
  end;

begin // procedure TfrmENWorkOrderBytEdit.btnPrintPrintAdditionalAgreementsClick
  if ENWorkOrderBytObj = nil then Exit;
  if ENWorkOrderBytObj.code = LOW_INT then Exit;

  state := false;
  itemCodes := '';

  for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
  begin
    sgENWorkOrderBytItem.GetCheckBoxState(1, i, state);

    if state then
    begin
      try
        itemCode := StrToInt(sgENWorkOrderBytItem.Cells[0, i]);
      except
        on EConvertError do continue;
      end;

      AddListPos(itemCodes, IntToStr(itemCode));
    end;
  end;

  if itemCodes = '' then
  begin
    Application.MessageBox(PChar('Оберіть хоча б одну строку завдання!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    sgENWorkOrderBytItem.SetFocus;
    Exit;
  end;

  if (not chbPrintCountersChange.Checked) and
     (not chbPrintTariffChange.Checked) and
     (not chbPrintPowerChange.Checked) and
     (not chbPrintSaveSeals.Checked ) then
  begin
    Application.MessageBox(PChar('Оберіть додатки, які потрібно надрукувати!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    gbAdditionalAgreements.SetFocus;
    Exit;
  end;

  //****************************************************************************
  itemFilter := ENWorkOrderBytItemFilter.Create;
  SetNullIntProps(itemFilter);
  SetNullXSProps(itemFilter);

  itemFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  itemFilter.workOrderBytRef.code := ENWorkOrderBytObj.code;

  itemFilter.conditionSQL :=
    'ENWORKORDERBYTITEM.code in (' + itemCodes + ') ' +
    // Для юридических точек учета пока ничего не печатаем
    'and (ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE is null)';

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
  itemList := TempENWorkOrderBytItem.getScrollableFilteredList(itemFilter, 0, -1);

  if High(itemList.list) < 0 then
  begin
    Application.MessageBox(PChar('Немає даних для друку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'pWorkOrderBytItemCode';

  SetLength(recordPointArr, 0);

  printed := false;
  
  for i := 0 to High(itemList.list) do
  begin
    isCounterChange := false;

    // Доп. угоду по замене счетика печатаем только для работ, связанных с заменой счетчика
    if not (itemList.list[i].planRefTypeCode in
            [ENPLANWORKTYPE_SIDEWORKS,     // услуги на сторону
             ENPLANWORKTYPE_ESBYT_PZ,      // 100 ЕЗ - Планова заміна лічильника
             ENPLANWORKTYPE_ESBYT_NPZ,     // 102 ЕЗ - Непланова заміна лічильника
             ENPLANWORKTYPE_ESBYT_ZKO_111, // 111 ЕЗ - Установка ЗКУ с заменой(переносом) счетчика
             ENPLANWORKTYPE_ESBYT_ZKO_112] // 112 ЕЗ - Замена счетчика в составе ЗКУ
           ) then
      isCounterChange := false
    else begin
      // Ссылка на точку учета может быть и у строк по услугам на сторону,
      // поэтому выбираем только те строки, у которых нет ссылки на договор
      if ((itemList.list[i].recordPointBytRefCode <> LOW_INT) and
          (itemList.list[i].servicesObjectRefCode = LOW_INT)) or (itemList.list[i].replaceCounterServices > 0) then
        isCounterChange := true
      else
        isCounterChange := false;
    end;

    // Если по этой точке учета еще не печатали документы, то печатаем и запоминаем ее код
    if not checkRecordPointInArray(itemList.list[i].recordPointBytRefCode) then
    begin
      args[0] := IntToStr(itemList.list[i].code);

      if chbPrintCountersChange.Checked and isCounterChange then
      begin
        makeReport('RepEnergozbyt/CountersChange/AdditionalAgreement', argNames, args, 'pdf');
        printed := true;
      end;

      if chbPrintTariffChange.Checked then
      begin
        makeReport('RepEnergozbyt/AdditionalAgreements/AdditionalAgreement_tariff', argNames, args, 'pdf');
        printed := true;
      end;
      
      if chbPrintPowerChange.Checked then
      begin
        makeReport('RepEnergozbyt/AdditionalAgreements/AdditionalAgreement_power', argNames, args, 'pdf');
        printed := true;
      end;

      if chbPrintSaveSeals.Checked then
      begin
        makeReport('RepEnergozbyt/CountersChange/Seals_saving_act/SaveSeals', argNames, args, 'pdf');
        printed := true;
      end;

      // Добавляем код точки учета (ТУ) в массив, чтобы не печатать документы
      // по одной и той же ТУ несколько раз
      addRecordPointInArray(itemList.list[i].recordPointBytRefCode);
    end;

  end; // for i := 0 to High(itemList.list)

  if not printed then
  begin
    Application.MessageBox(PChar('Немає даних для друку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;
  //****************************************************************************

end; // procedure TfrmENWorkOrderBytEdit.btnPrintPrintAdditionalAgreementsClick

procedure TfrmENWorkOrderBytEdit.btnUncheckSelectedClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENWorkOrderBytItem.RowCount - 1 do
  begin
    if sgENWorkOrderBytItem.SelectedCells[1, i] then
      sgENWorkOrderBytItem.SetCheckBoxState(1, i, false);
  end;

  chbCheckAll.OnClick := nil;
  try
    chbCheckAll.Checked := false;
  finally
    chbCheckAll.OnClick := chbCheckAllClick;
  end;
end;

procedure TfrmENWorkOrderBytEdit.chbCheckAllClick(Sender: TObject);
begin
  CheckGrid(sgENWorkOrderBytItem, 1, chbCheckAll.Checked);
end;

procedure TfrmENWorkOrderBytEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtNumberGen, edtDateGen, edtENDepartment, edtFinWorkerTabNumber, edtFINWorkerName]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;

    ENWorkOrderBytObj.numberGen := edtNumberGen.Text;

    if edtdateGen.checked then
    begin
      if ENWorkOrderBytObj.dateGen = nil then
         ENWorkOrderBytObj.dateGen := TXSDate.Create;
      ENWorkOrderBytObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
    end
    else
      ENWorkOrderBytObj.dateGen := nil;

    ENWorkOrderBytObj.commentGen := edtCommentGen.Text;

    { Сервак разберется ;)
    if ENWorkOrderBytObj.statusRef = nil then
    begin
      ENWorkOrderBytObj.statusRef := ENWorkOrderBytStatusRef.Create;
      ENWorkOrderBytObj.statusRef.code := ENWORKORDERBYTSTATUS_DRAFT;
    end;
    }

    if DialogState = dsInsert then
    begin
      ENWorkOrderBytObj.code:=low(Integer);
      TempENWorkOrderByt.add(ENWorkOrderBytObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWorkOrderByt.save(ENWorkOrderBytObj);
    end;
  end;
end;

procedure TfrmENWorkOrderBytEdit.FormCreate(Sender: TObject);
begin
  inherited;
  ENWorkOrderBytObj := nil;
end;

procedure TfrmENWorkOrderBytEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(ENWorkOrderBytObj) then
    ENWorkOrderBytObj.Free;

  inherited;
end;

procedure TfrmENWorkOrderBytEdit.PrintAdditionalDocuments;
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  itemFilter: ENWorkOrderBytItemFilter;
  itemList: ENWorkOrderBytItemShortList;
  i: Integer;

  argNames, args: ArrayOfString;
  reportName: String;

  recordPointArr: array of Integer;

  // Процедура для добавления кода точки учета в массив recordPointArr
  procedure addRecordPointInArray(recordPointCode: Integer);
  var arrSize: Integer;
  begin
    arrSize := High(recordPointArr) + 1;
    SetLength(recordPointArr, arrSize + 1);
    recordPointArr[arrSize] := recordPointCode;
  end;

  // Процедура для проверки, содержится ли код точки учета в массиве recordPointArr
  function checkRecordPointInArray(recordPointCode: Integer): Boolean;
  var i: Integer;
  begin
    Result := false;

    for i := 0 to High(recordPointArr) do
      if recordPointArr[i] = recordPointCode then
      begin
        Result := true;
        Exit;
      end;
  end;

begin // procedure TfrmENWorkOrderBytEdit.PrintAdditionalDocuments;
  if ENWorkOrderBytObj = nil then Exit;
  if ENWorkOrderBytObj.code = LOW_INT then Exit;

  itemFilter := ENWorkOrderBytItemFilter.Create;
  SetNullIntProps(itemFilter);
  SetNullXSProps(itemFilter);

  itemFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  itemFilter.workOrderBytRef.code := ENWorkOrderBytObj.code;

  // 14.11.14 Для юридических точек учета пока ничего не печатаем
  itemFilter.conditionSQL := 'ENWORKORDERBYTITEM.RECORDPOINTPROMREFCODE is null';

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
  itemList := TempENWorkOrderBytItem.getScrollableFilteredList(itemFilter, 0, -1);

  if High(itemList.list) < 0 then Exit;

  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'pWorkOrderBytItemCode';
  argNames[1] := 'pItemIndex';

  //reportName := 'RepEnergozbyt/CountersChange/AdditionalAgreement';

  SetLength(recordPointArr, 0);

  for i := 0 to High(itemList.list) do
  begin
    // Печатаем только для работ, связанных с заменой счетчика
    if not (itemList.list[i].planRefTypeCode in
            [ENPLANWORKTYPE_SIDEWORKS,     // услуги на сторону
             ENPLANWORKTYPE_ESBYT_PZ,      // 100 ЕЗ - Планова заміна лічильника
             ENPLANWORKTYPE_ESBYT_NPZ,     // 102 ЕЗ - Непланова заміна лічильника
             ENPLANWORKTYPE_ESBYT_NS,      // 104 ЕЗ - Непланове зняття лічильника
             ENPLANWORKTYPE_ESBYT_ZKO_111, // 111 ЕЗ - Установка ЗКУ с заменой(переносом) счетчика
             ENPLANWORKTYPE_ESBYT_ZKO_112] // 112 ЕЗ - Замена счетчика в составе ЗКУ
           ) then continue;

    // Ссылка на точку учета может быть и у строк по услугам на сторону,
    // поэтому выбираем только те строки, у которых нет ссылки на договор
    if ((itemList.list[i].recordPointBytRefCode <> LOW_INT) and
       (itemList.list[i].servicesObjectRefCode = LOW_INT)) or (itemList.list[i].replaceCounterServices > 0) then
    begin
      // Если по этой точке учета еще не печатали документы, то печатаем и запоминаем ее код
      if not checkRecordPointInArray(itemList.list[i].recordPointBytRefCode) then
      begin
        args[0] := IntToStr(itemList.list[i].code);
        args[1] := IntToStr(i + 1);
        makeReport('RepEnergozbyt/CountersChange/AdditionalAgreement', argNames, args, 'pdf');
        //makeReport('RepEnergozbyt/CountersChange/Acts', argNames, args, 'pdf');
        makeReport('RepEnergozbyt/CountersChange/Acts_main', argNames, args, 'pdf');

        // Добавляем код точки учета (ТУ) в массив, чтобы не печатать документы
        // по одной и той же ТУ несколько раз
        addRecordPointInArray(itemList.list[i].recordPointBytRefCode);
      end;
    end;

  end; // for i := 0 to High(itemList.list)

end; // procedure TfrmENWorkOrderBytEdit.PrintAdditionalDocuments;

procedure TfrmENWorkOrderBytEdit.PrintDetailReportFromBilling();
var
  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  depList: ENDepartment2EPRenShortList;
  depObj: ENDepartment2EPRen;
  depFilter: ENDepartment2EPRenFilter;

  i: Integer;

  TempENRecordPointByt: ENRecordPointBytControllerSoapPort;
  rpFilter: ENRecordPointBytFilter;
  rpList: ENRecordPointBytShortList;
  rpObj: ENRecordPointByt;

  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  itemFilter: ENWorkOrderBytItemFilter;
  itemList: ENWorkOrderBytItemShortList;

  recordPointCodeStrList: String;
  dateStr: string;
  dateStr2: string;
  argNames, args: ArrayOfString;
  request: EPReportRequestEx;
  requestWarning: EPReportRequestEx;
begin
  if ENWorkOrderBytObj=nil then Exit;

  TempENDepartment2EPRen:=HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
  TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
  TempENWorkOrderBytItem:=HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

  depFilter:= ENDepartment2EPRenFilter.Create;
  SetNullIntProps(depFilter);
  SetNullXSProps(depFilter);
  depFilter.departmentRef:=ENDepartmentRef.Create;
  depFilter.departmentRef.code:=ENWorkOrderBytObj.departmentRef.code;
  depList:=TempENDepartment2EPRen.getScrollableFilteredList(depFilter,0,-1);

  if depList.totalCount<>1 then
  begin
    ShowMessage('Не вдалося визначити код РЕМ за кодировкою біллінгових систем');
    Exit;
  end;

  depObj := TempENDepartment2EPRen.getObject(depList.list[0].code);

   // Вариант без использования ENRecordPointByt.getScrollableFilteredList
   {itemFilter := ENWorkOrderBytItemFilter.Create;
   SetNullIntProps(itemFilter);
   SetNullXSProps(itemFilter);
   itemFilter.workOrderBytRef:=ENWorkOrderBytRef.Create;
   itemFilter.workOrderBytRef.code:=ENWorkOrderBytObj.code;

   itemList := TempENWorkOrderBytItem.getScrollableFilteredList(itemFilter, 0, -1);

   recordPointCodeStrList:='0';
   for i:=0 to High(itemList.list) do
   begin
       if itemList.list[i].recordPointBytRefCode<>low(Integer) then
       begin
         rpObj:=TempENRecordPointByt.getObject(itemList.list[i].recordPointBytRefCode);
         recordPointCodeStrList:=recordPointCodeStrList+', '+intToStr(rpObj.rpCode);
       end;
   end;}

   rpFilter := ENRecordPointBytFilter.Create;
   SetNullIntProps(rpFilter);
   SetNullXSProps(rpFilter);
   rpFilter.conditionSQL:='code in (select i.recordpointbytrefcode from enworkorderbytitem i where i.workorderbytrefcode='+intToStr(ENWorkOrderBytObj.code)+')';

   rpList := TempENRecordPointByt.getScrollableFilteredList(rpFilter, 0, -1);

   recordPointCodeStrList:='0';
   for i:=0 to High(rpList.list) do
   begin
       if rpList.list[i].rpCode<>low(Integer) then
       begin
         recordPointCodeStrList:=recordPointCodeStrList+', '+intToStr(rpList.list[i].rpCode);
       end;
   end;


   dateStr:=FormatDateTime('dd.mm.yyyy', edtDateGen.Date);
   dateStr2:=FormatDateTime('dd.mm.yyyy', edtDateGen.Date-60);

   try
    DMBilling:=TDMBilling.Create(Application);

    request := EPReportRequestEx.Create;
    SetLength(argNames,2);
    SetLength(args,2);
    request.reportCode := 0;
    request.funcName := '/com/ksoe/report/jasperReports/WorkOrderReportDisconnectMainNet.jasper';
    argNames[0] := 'P1';
    args[0] :=  recordPointCodeStrList;
    argNames[1] := 'P2';
    args[1] :=  dateStr;
    request.argNames:=argNames;
    request.args:=args;
    request.resultType:=Low(Integer);
    DMBilling.makeGeneralReportPDF('WorkOrderDisconnect',request,'PDF');


    //Предупреждения об отключении

   requestWarning := EPReportRequestEx.Create;
    SetLength(argNames,5);
    SetLength(args,5);
    requestWarning.reportCode := 0;
    requestWarning.funcName := '/com/ksoe/report/jasperReports/WarningReportNet.jasper';
    argNames[0] := 'P0';
    args[0] :=  '10';
    argNames[1] := 'P1';
    args[1] :=  recordPointCodeStrList;
    argNames[2] := 'P2';
    args[2] :=  dateStr2;
    argNames[3] := 'P3';
    args[3] :=  dateStr;
    argNames[4] := 'P4';
    args[4] :=  '1';

    requestWarning.argNames:=argNames;
    requestWarning.args:=args;
    requestWarning.resultType:=Low(Integer);
    DMBilling.makeGeneralReportPDF('WarningReportNet',requestWarning,'PDF');
    finally
       DMBilling.Free;
       //ShowMessage('Не вдалося отримати PDF-документ з біллінгу');
    end;

end;


end.