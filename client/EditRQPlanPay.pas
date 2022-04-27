
unit EditRQPlanPay;

interface

uses
    Windows, Messages,  StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, RQPlanPayController, AdvObj,
    RQPlanPayItemSecondController  , XMLIntf  , XMLDoc, RQPlanPayItemFactPlatController,
    ExtCtrls, ShowIFobsXMLNotImported, tmsAdvGridExcel ,ShellAPI , RQPlanPay2RQbudgetController,
    DB, DBTables, FMTBcd, SqlExpr , SysUtils;

type
  TfrmRQPlanPayEdit = class(TDialogForm)

    lblCode : TLabel;
   	edtCode : TEdit;


  HTTPRIORQPlanPay: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    ActionList1: TActionList;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ImageList1: TImageList;
    HTTPRIORQPlanPayItemSecond: THTTPRIO;
    PageControl1: TPageControl;
    tsPlanPay: TTabSheet;
    gbItems: TGroupBox;
    tbPlanPaySecond: TToolBar;
    btnUpdateGrid: TToolButton;
    btnFilter: TToolButton;
    btnNoFilter: TToolButton;
    sgRQPlanPayItemSecond: TAdvStringGrid;
    edtOrderitemCode: TEdit;
    edtDateGen: TDateTimePicker;
    lblDateGen: TLabel;
    lblNumberDoc: TLabel;
    edtNumberDoc: TEdit;
    btnGenerateItems: TBitBtn;
    btnRemoveSelected: TToolButton;
    actRemoveItem: TAction;
    pmPlanPaySecond: TPopupMenu;
    mnUpdateGrid: TMenuItem;
    mnFilter: TMenuItem;
    mnNoFilter: TMenuItem;
    btnKeepSelected: TToolButton;
    actRemoveOtherItem: TAction;
    lblToPay: TLabel;
    mnRemoveSelected: TMenuItem;
    mnKeepSelected: TMenuItem;
    mnDelimiter: TMenuItem;
    btnUpdateToPaySum: TToolButton;
    actUpdateToPaySum: TAction;
    mnUpdateToPaySum: TMenuItem;
    tsPayInfo: TTabSheet;
    tlbrpayInfo: TToolBar;
    btnChangeGroupPayInfoDetails: TToolButton;
    sgPaymentGroupInfo: TAdvStringGrid;
    actChangeGroupPayInfoDetails: TAction;
    HTTPRIORQPlanItemBankDetail: THTTPRIO;
    tsProbankImportedData: TTabSheet;
    sgRQPlanPayItemFactPlat: TAdvStringGrid;
    HTTPRIORQPlanPayItemFactPlat: THTTPRIO;
    btnImportDataFromProbank: TButton;
    btnExportXML: TButton;
    actmakeXMLExportFileForIFOBS: TAction;
    N1: TMenuItem;
    HTTPRIOENBankingDetails: THTTPRIO;
    lblSummGroup: TLabel;
    Shape1: TShape;
    lblDifference: TLabel;
    Button1: TButton;
    Button2: TButton;
    btnMakePayDocs: TButton;
    lblSumPlanFactImportedFromProbank: TLabel;
    actCheckAll: TAction;
    actUnCheckAll: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    btnNotImportedPayments: TButton;
    Button3: TButton;
    btnReestr: TButton;
    tlbRemoveItemsByBillCodes: TToolButton;
    actRemoveItemsByBillCodes: TAction;
    ToolBar1: TToolBar;
    tbRQBillView: TToolButton;
    btnShowBill: TToolButton;
    actShowBill: TAction;
    HTTPRIORQBill: THTTPRIO;
    cbbRqplanpayKind: TComboBox;
    btnShowBillByItemReestr: TToolButton;
    actShowBillByReestrItem: TAction;
    mniShowBillByReestrItem: TMenuItem;
    btnCurrSaldoByContract: TBitBtn;
    edtContractnumber: TEdit;
    lblContractNumber: TLabel;
    lblKredit: TLabel;
    edtCredit: TEdit;
    lblDebet: TLabel;
    edtDebet: TEdit;
    lblsalRazvern: TLabel;
    lblsalSvern: TLabel;
    edtDebetSvern: TEdit;
    edtCreditSvern: TEdit;
    aeExcelplanpaydocitem: TAdvGridExcelIO;
    actExcell: TAction;
    mniExcell: TMenuItem;
    BitBtn1: TBitBtn;
    lblBudget: TLabel;
    edtBudget: TEdit;
    spbBudget: TSpeedButton;
    HTTPRIORQPlanPay2RQbudget: THTTPRIO;
    HTTPRIORQBudget: THTTPRIO;
    Memo1: TMemo;
    tblForReestr: TTable;
    ssnReestr: TSession;
    chkSaveIBANBuyer: TCheckBox;
    chkSaveIBANSeller: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGenerateItemsClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actRemoveItemExecute(Sender: TObject);
    procedure actRemoveOtherItemExecute(Sender: TObject);
    procedure actUpdateToPaySumExecute(Sender: TObject);
    procedure actChangeGroupPayInfoDetailsExecute(Sender: TObject);
    procedure updateGroupStringInfoForPay;
    procedure updateProbankImportedData;
    procedure PageControl1Change(Sender: TObject);
    procedure btnImportFromProbankClick(Sender: TObject);
    procedure makeXMLExportFileForIFOBS(rqPlanPayCode: Integer);
    procedure makeTXTExportFileForiBank2(rqPlanPayCode: Integer);
    procedure actmakeXMLExportFileForIFOBSExecute(Sender: TObject);
    procedure pmPlanPaySecondPopup(Sender: TObject);
    procedure btnMakePayDocsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnReestrClick(Sender: TObject);
    procedure actCheckAllExecute(Sender: TObject);
    procedure actUnCheckAllExecute(Sender: TObject);  
    procedure setMakePayDocs;
    procedure setVisibleBtnUnimportedPayments;
    procedure btnNotImportedPaymentsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure sgRQPlanPayItemSecondCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure actRQBillViewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRemoveItemsByBillCodesExecute(Sender: TObject);
    procedure actShowBillExecute(Sender: TObject);
    procedure actShowBillByReestrItemExecute(Sender: TObject);
    procedure btnCurrSaldoByContractClick(Sender: TObject);
    procedure actExcellExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure spbBudgetClick(Sender: TObject);
    procedure makePDFExportFileForOBU(rqPlanPayCode: Integer); // экспорт ощадбанк
  private
    { Private declarations }
       pl2budg: RQPlanPay2RQbudget;
  public
    { Public declarations }
  RQPlanPayObjStatusRefCode : Integer;
  selectedItemIndex: Integer;

end;

var
  frmRQPlanPayEdit: TfrmRQPlanPayEdit;
  RQPlanPayObj: RQPlanPay;
  planPayItemSecondFilter : RQPlanPayItemSecondFilter;
//  RQPlanPayItemSecondFilterObj : RQPlanPayItemSecondFilter;
  toPaySum : Double;
  toPaySumGroup : Double;

implementation

uses EditRQPlanPayItemSecondFilter, RQPlanItemBankDetailController,
  EditRQPlanItemBankDetail, RQBillController, ENConsts,
  ENBankingDetailsController, DMReportsUnit, EditRQBill,
  RQPlanPayKindController, Globals, ShowRQBudget, RQBudgetController,
  RQBudgetStatusController, Main, FinancialUtilsUnit;


{uses
    EnergyproController, EnergyproController2, RQPlanPayController  ;
}
{$R *.dfm}

var
ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPlanPayItemSecondHeaders: array [1..36] of String =
        ( 'Код'
          ,'Код ДДС'
          ,'Наименование заявки/период заявки'
          ,'Статус заявки'
          ,'ОКПО поставщика'
          ,'поставщик'
          ,'Договор'
          ,'Наименование материала'
          ,'ед. изм.'
          ,'кол-во (запланировано)'
          ,'Цена за ед. с НДС (запланировано)'
          ,'Стоимость с НДС (запланировано) '
          ,'Дата поставки (запланировано) '
          ,'кол-во дней поставки (запланировано)'
           //// second
          ,'кол-во (приход)'
          ,'Цена за ед. с НДС (приход)'
          ,'стоимость с НДС (приход)'
          ,'Дата прихода'
          ,'Код (2)'
          ,'Сумма к оплате (плановая)'
          ,'Дата плановой оплаты'
          ,'Дата фактической оплаты'
          ,'Цена за ед. с НДС (оплата)'
          ,'Стоимость с НДС (оплата)'
          ,'Кол-во (оплата)'
          ,'номер счета'
          ,'Бюджетодержатель'
          ,'Вид оплат'
          ,'Значение(%\дни)'
          ,'Дата оплаты (расчетная)'
          ,'Признак оплаты'
          ,'Вид оплат (первоначальный)'
          ,'Значение (%\дни) (первоначальное)'
          ,'код счета'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

        PaymentGroupInfoHeaders: array [1..11] of String =
        (
         'Код rqbill'
        ,'Номер счета EnergyNET'
        ,'Дата счета EnergyNET'
        ,'Сумма по счету (грн. с НДС)'
        ,'р/сч плательщика'
        ,'МФО банка плательщика'
        ,'ОКПО получателя'
        ,'Получатель'
        ,'р/сч получателя'
        ,'МФО банка получателя'
        ,'Назначение платежа'
          );

        RQPlanPayItemFactPlatHeaders: array [1..9] of String =
        (
         'Код'
         , 'id платежа в пробанке'
         , 'Номер счета'
         , 'Дата счета'
         , 'Строки счета'
         , 'Сумма по строке ведомости (план)'
         , 'Сумма по строке ведомости (факт)'
         , 'Сумма платежа'
         , 'Статуси строк рахунку'
          );


procedure TfrmRQPlanPayEdit.FormShow(Sender: TObject);
var
  TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
  i, c: Integer;
  RQPlanPayItemSecondList: RQPlanPayItemSecondShortList;
  itemFirstCode : Integer;
  itemFirstOrderdate : string;
  itemFirstOld, checkState : Boolean;

   TempRQBudget: RQBudgetControllerSoapPort;
   RQBudgetList: RQBudgetShortList;
   rqbudgFilter : RQBudgetFilter;

begin


  DisableControls([chkSaveIBANBuyer, chkSaveIBANSeller], false);

  // скроем компоненты по бюджету если в конфиге не стоит проверять оплаты по бюджету
  DisableControls([ edtBudget]);
  if not DMReports.chkPaymentByBudget then
     begin
      HideControls([lblBudget , edtBudget , spbBudget ] )
     end
   else
    begin
      if  DialogState <> DialogFormUnit.dsInsert then
      begin

        DisableControls([spbBudget] );

        TempRQBudget :=  HTTPRIORQBudget as RQBudgetControllerSoapPort;

        if rqbudgFilter = nil then
          begin
             rqbudgFilter := RQBudgetFilter.Create;
             SetNullIntProps(rqbudgFilter);
             SetNullXSProps(rqbudgFilter);
          end;


          rqbudgFilter.conditionSQL := ' rqbudget.code in ( select rqbudget.code from rqplanpay2rqbudget , rqbudget ' +
                                       ' where rqplanpay2rqbudget.budgetrefcode = rqbudget.code ' +
                                       ' and rqplanpay2rqbudget.planpayrefcode = ' + IntToStr(RQPlanPayObj.code) + ' )';


          RQBudgetList := TempRQbudget.getScrollableFilteredList(rqbudgFilter,0,-1);

          if RQBudgetList.list <> nil then
           if RQBudgetList.list[i].dateGen <> nil then
             edtBudget.Text := XSDate2String(RQBudgetList.list[i].dateGen);



      end ;










    end;

   if DialogState = DialogFormUnit.dsInsert then
   HideControls([btnCurrSaldoByContract , lblContractNumber , edtContractnumber ,lblsalRazvern , lblsalSvern , lblDebet , edtDebet ,
   edtDebetSvern , lblKredit , edtCredit , edtCreditSvern , BitBtn1 ]);

   DisableControls([edtContractnumber, edtDebet, edtCredit, edtDebetSvern, edtCreditSvern]);

   FormatSettings.DecimalSeparator := '.';

  // Чтобы на маленьких экранах форма не уезжала за левый край
  if Self.Width > Screen.Width then
    Self.Left := 10; //Self.BorderWidth;

  RQPlanPayObjStatusRefCode := 0;

  PageControl1.ActivePage := tsPlanPay;

  sgPaymentGroupInfo.Options := sgPaymentGroupInfo.Options - [goColMoving];

  if DialogState <> DialogFormUnit.dsInsert then
  begin
   RQPlanPayObjStatusRefCode := RQPlanPayObj.statusRef.code;
   DisableControls([cbbRqplanpayKind]);
  end;

  if RQPlanPayObjStatusRefCode in [ enconsts.RQPLANPAYSTATUS_CLOSED , ENConsts.RQPLANPAYSTATUS_PAYMENTS_DONE ]
  then
  DisableActions([actRemoveItem , actRemoveOtherItem , actUpdateToPaySum]);

  if RQPlanPayObjStatusRefCode in [ ENConsts.RQPLANPAYSTATUS_PAYMENTS_DONE , RQPLANPAYSTATUS_CLOSED ]
  then
  DisableActions([actRemoveItemsByBillCodes , actChangeGroupPayInfoDetails]);


  toPaySum := 0;

  DisableControls([edtDateGen, edtNumberDoc]);
  HideControls([edtOrderitemCode, btnGenerateItems]);

  if DialogState = DialogFormUnit.dsInsert then
  begin
    HideControls([gbItems, edtOrderitemCode, btnGenerateItems, btnReestr]);
    DisableControls([edtDateGen, edtNumberDoc],false);
    tsProbankImportedData.TabVisible := False;
    tsPayInfo.TabVisible := False;
  end;

  if DialogState = dsView then
  begin
    // DisableControls([tbPlanPaySecond]);
    DisableActions([actRemoveItem, actRemoveOtherItem]);
  end;
      DisableControls([edtCode]);
  if (DialogState = DialogFormUnit.dsInsert) or (DialogState = DialogFormUnit.dsEdit) then
  begin
   // DenyBlankValues([]);
   end;

  if  (DialogState = DialogFormUnit.dsEdit) or (DialogState = DialogFormUnit.dsView) then
  begin

   cbbRqplanpayKind.ItemIndex := RQPlanPayObj.kindRef.code -1;

   if DialogState = DialogFormUnit.DsEdit then
   HideControls([btnGenerateItems, edtOrderitemCode],false);

   if RQPlanPayObjStatusRefCode = ENConsts.RQPLANPAYSTATUS_CREATED then
  HideControls([btnGenerateItems, edtOrderitemCode]);

   // Установка текста кнопки Разнести/Удалить оплаты
   setMakePayDocs();
   setVisibleBtnUnimportedPayments();

   HideControls([gbItems],false);

      edtCode.Text := IntToStr(RQPlanPayObj.code);
    edtNumberDoc.Text := RQPlanPayObj.numberDoc; 
      if RQPlanPayObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQPlanPayObj.dateGen.Year,RQPlanPayObj.dateGen.Month,RQPlanPayObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
  end;


  SetGridHeaders(RQPlanPayItemSecondHeaders, sgRQPlanPayItemSecond.ColumnHeaders);
  ColCount:=100;
  TempRQPlanPayItemSecond :=  HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;

   if planPayItemSecondFilter = nil then
   begin
       planPayItemSecondFilter := RQPlanPayItemSecondFilter.Create;
       SetNullIntProps(planPayItemSecondFilter);
       SetNullXSProps(planPayItemSecondFilter);
   end;

    planPayItemSecondFilter.planPayRef := RQPlanPayRef.Create;
    planPayItemSecondFilter.planPayRef.code := RQPlanPayObj.code;

  RQPlanPayItemSecondList := TempRQPlanPayItemSecond.getScrollableFilteredList(planPayItemSecondFilter,0,-1);


  LastCount:=High(RQPlanPayItemSecondList.list);

  if LastCount > -1 then
     sgRQPlanPayItemSecond.RowCount:=LastCount+2
  else
     sgRQPlanPayItemSecond.RowCount:=2;

//             for c := 1 to 13 do
//          begin
//            sgRQPlanPayItemSecond.Colors[c, 0] := $FF0000
//          end;

               for c := 14 to 17 do
          begin
            sgRQPlanPayItemSecond.Colors[c, 0] := $00FF00
          end;

               for c := 19 to 20 do
          begin
            sgRQPlanPayItemSecond.Colors[c, 0] := $FF00FF
          end;

               for c := 21 to 24 do
          begin
            sgRQPlanPayItemSecond.Colors[c, 0] := $00FFFF
          end;

          begin
            sgRQPlanPayItemSecond.Colors[11, 0] := $FF00FF
          end;

   itemFirstCode := 0;
   itemFirstOld := false;

    Application.ProcessMessages;

   with sgRQPlanPayItemSecond do
    for i:=0 to LastCount do
      begin

        if itemFirstCode <> RQPlanPayItemSecondList.list[i].planPayItemFirstRefCode then
              begin
                 itemFirstCode := RQPlanPayItemSecondList.list[i].planPayItemFirstRefCode;
                 Cells[0,i+1]  :=  IntToStr(itemFirstCode);
                 itemFirstOld  := false;
              end
        else
          begin
                 Cells[0,i+1] := '';
                 itemFirstOld := true;
          end;

       if itemFirstOld then
          begin
            for c := 1 to 13 do
            Cells[c,i+1] := '';
          end;

       if not itemFirstOld then
          begin
           Cells[1,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefddscode;

           if RQPlanPayItemSecondList.list[i].planPayItemFirstReforderdate = nil then
          itemFirstOrderdate := ''
           else
          itemFirstOrderdate :=  IntToStr(RQPlanPayItemSecondList.list[i].planPayItemFirstReforderdate.Month) + '.' +
                                 IntToStr(RQPlanPayItemSecondList.list[i].planPayItemFirstReforderdate.Year);

          Cells[2,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefnumberdoc  + ' за ' + itemFirstOrderdate;


          Cells[3,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefstatussymbol;
          Cells[4,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstReforgokpo;

          Cells[5,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstReforg;
          Cells[6,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefcontract;
          Cells[7,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefmname;

          Cells[8,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefmeas;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefcountfact = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefcountfact.DecimalString;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefpricewithnds = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefpricewithnds.DecimalString;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefsumma = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefsumma.DecimalString;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefpostavka_date = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].planPayItemFirstRefpostavka_date);

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefdeliverytime = Low(Integer) then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].planPayItemFirstRefDeliverytime);
      end;

        if RQPlanPayItemSecondList.list[i].prihod_count = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := RQPlanPayItemSecondList.list[i].prihod_count.DecimalString;

        if RQPlanPayItemSecondList.list[i].prihod_price = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := RQPlanPayItemSecondList.list[i].prihod_price.DecimalString;

        if RQPlanPayItemSecondList.list[i].prihod_summa = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := RQPlanPayItemSecondList.list[i].prihod_summa.DecimalString;

        if RQPlanPayItemSecondList.list[i].prihod_date = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].prihod_date);

          if RQPlanPayItemSecondList.list[i].code <> Low(Integer) then
          Cells[18,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].code)
        else
          Cells[18,i+1] := '';
          CellProperties[18, i+1].ReadOnly := False;
          if RQPlanPayItemSecondList.list[i].pay_sign <> 1  then

          AddCheckBox(18,i+1,false,false)
          else
          AddCheckBox(18,i+1,true,false);

        if RQPlanPayItemSecondList.list[i].pay_plan_summa = nil then
          Cells[19,i+1] := ''
        else begin
          Cells[19,i+1] := RQPlanPayItemSecondList.list[i].pay_plan_summa.DecimalString;
          toPaySum := toPaySum + StrToFloat(RQPlanPayItemSecondList.list[i].pay_plan_summa.DecimalString);

          if StrToFloat(RQPlanPayItemSecondList.list[i].pay_plan_summa.DecimalString) > 0 then
          begin
            CellProperties[19, i+1].FontColor := clBlue;
            CellProperties[19, i+1].FontStyle := FontStyles[0, 0];
          end;
        end;

        CellProperties[19,i+1].ReadOnly := True;


        if RQPlanPayItemSecondList.list[i].pay_plan_date = nil then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_plan_date);

        if RQPlanPayItemSecondList.list[i].pay_fact_date = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_fact_date);

        if RQPlanPayItemSecondList.list[i].pay_fact_price = nil then
          Cells[22,i+1] := ''
        else
          Cells[22,i+1] := RQPlanPayItemSecondList.list[i].pay_fact_price.DecimalString;

        if RQPlanPayItemSecondList.list[i].pay_fact_summa = nil then
          Cells[23,i+1] := ''
        else
          Cells[23,i+1] := RQPlanPayItemSecondList.list[i].pay_fact_summa.DecimalString;

        if RQPlanPayItemSecondList.list[i].pay_fact_count = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := RQPlanPayItemSecondList.list[i].pay_fact_count.DecimalString;

          Cells[25,i+1] := RQPlanPayItemSecondList.list[i].bill_num;
          Cells[26,i+1] := RQPlanPayItemSecondList.list[i].budget_name;
          Cells[27,i+1] := RQPlanPayItemSecondList.list[i].pay_type_name;

        if RQPlanPayItemSecondList.list[i].pay_type_value = Low(Integer) then
          Cells[28,i+1] := ''
        else
          Cells[28,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].pay_type_value);

        if RQPlanPayItemSecondList.list[i].pay_date = nil then
          Cells[29,i+1] := ''
        else
          Cells[29,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_date);

        if RQPlanPayItemSecondList.list[i].pay_sign = Low(Integer) then
          Cells[30,i+1] := ''
        else
          Cells[30,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].pay_sign);

          Cells[31,i+1] := RQPlanPayItemSecondList.list[i].pay_type_name_initial;

        if RQPlanPayItemSecondList.list[i].pay_type_value_initial = Low(Integer) then
          Cells[32,i+1] := ''
        else
          Cells[32,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].pay_type_value_initial);

          Cells[33,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].billRefCode);
          Cells[34,i+1] := RQPlanPayItemSecondList.list[i].userGen;

        if RQPlanPayItemSecondList.list[i].dateEdit = nil then
          Cells[35,i+1] := ''
        else
          Cells[35,i+1] := XSDateTimeWithDate2String(RQPlanPayItemSecondList.list[i].dateEdit);

        if RQPlanPayItemSecondList.list[i].summaPropose = nil then
          Cells[36,i+1] := ''
        else
          Cells[36,i+1] := RQPlanPayItemSecondList.list[i].summaPropose.DecimalString;

          Objects[0,i+1] := TObject(RQPlanPayItemSecondList.list[i].code);


        LastRow:=i+1;
        sgRQPlanPayItemSecond.RowCount:=LastRow+1;

      end;
   ColCount:=ColCount+1;
   sgRQPlanPayItemSecond.Row:=1;

 lblToPay.Caption := 'Cумма к оплате : ' + FloatToStr(toPaySum);

end;


procedure TfrmRQPlanPayEdit.PageControl1Change(Sender: TObject);
begin
  inherited;

  if PageControl1.ActivePage = tsPlanPay then
  begin

  end
  else if PageControl1.ActivePage = tsPayInfo then
  begin

    updateGroupStringInfoForPay();
  end
  else if PageControl1.ActivePage = tsProbankImportedData then
  begin
    updateProbankImportedData();

    if  ((RQPlanPayObjStatusRefCode <> ENConsts.RQPLANPAYSTATUS_CREATED)
       and (RQPlanPayObjStatusRefCode <> ENConsts.RQPLANPAYSTATUS_GOOD ))then
       DisableActions([actChangeGroupPayInfoDetails]);


  end;

end;

procedure TfrmRQPlanPayEdit.pmPlanPaySecondPopup(Sender: TObject);
begin
  inherited;

   if  ((RQPlanPayObjStatusRefCode <> ENConsts.RQPLANPAYSTATUS_CREATED)
       and (RQPlanPayObjStatusRefCode <> ENConsts.RQPLANPAYSTATUS_GOOD ))then
       DisableActions([actChangeGroupPayInfoDetails]);
end;

procedure TfrmRQPlanPayEdit.actChangeGroupPayInfoDetailsExecute(
  Sender: TObject);
Var TempRQPlanItemBankDetail: RQPlanItemBankDetailControllerSoapPort;
RQPlanItemBankDetailFilterObj: RQPlanItemBankDetailFilter;
RQPlanItemBankDetailList: RQPlanItemBankDetailShortList;

enbankingdetailsobj : ENBankingDetails;
tempenbankingdetails : ENBankingDetailsControllerSoapPort;
begin
 TempRQPlanItemBankDetail := HTTPRIORQPlanItemBankDetail as RQPlanItemBankDetailControllerSoapPort;
 tempenbankingdetails := HTTPRIOENBankingDetails as  ENBankingDetailsControllerSoapPort;
   try
     if PageControl1.ActivePage = tsPayInfo then
     begin
         // реквизиты храним для каждой строки second поэтому выберем любой объект по фильтрам
        RQPlanItemBankDetailFilterObj := RQPlanItemBankDetailFilter.Create;
        SetNullIntProps(RQPlanItemBankDetailFilterObj);
        SetNullXSProps(RQPlanItemBankDetailFilterObj);

        RQPlanItemBankDetailFilterObj.orgOkpo := sgPaymentGroupInfo.Cells[6,sgPaymentGroupInfo.Row];
        RQPlanItemBankDetailFilterObj.billRef := RQBillRef.Create;
        RQPlanItemBankDetailFilterObj.billRef.code  := StrToInt(sgPaymentGroupInfo.Cells[0,sgPaymentGroupInfo.Row]);
        RQPlanItemBankDetailFilterObj.orgAccount := sgPaymentGroupInfo.Cells[8,sgPaymentGroupInfo.Row];
         RQPlanItemBankDetailFilterObj.conditionSQL :=  ' RQPlanItemBankDetail.code  in  (select plidet.code from rqplanpayitemsecond pls  , rqplanitembankdetail plidet , enbankingdetails bd ' +
      ' where pls.planpayrefcode = ' + IntToStr( RQPlanPayObj.code ) +
      ' and plidet.planitemsecondrefcode = pls.code'+
      ' and plidet.bankingrefcode = bd.code '+
      ' and bd.bankaccount = ''' + sgPaymentGroupInfo.Cells[4,sgPaymentGroupInfo.Row] + '''' +
      ' and bd.bankmfo = ' + sgPaymentGroupInfo.Cells[5,sgPaymentGroupInfo.Row] +
      ' and plidet.billrefcode = ' + sgPaymentGroupInfo.Cells[0,sgPaymentGroupInfo.Row] + ')';

        RQPlanItemBankDetailList := TempRQPlanItemBankDetail.getScrollableFilteredList(RQPlanItemBankDetailFilterObj,0,1);


        RQPlanItemBankDetailObj :=  TempRQPlanItemBankDetail.getObject(RQPlanItemBankDetailList.list[0].code);
      end;

      if PageControl1.ActivePage = tsPlanPay then
     begin
         // реквизиты храним для каждой строки second поэтому выберем любой объект по фильтрам
        RQPlanItemBankDetailFilterObj := RQPlanItemBankDetailFilter.Create;
        SetNullIntProps(RQPlanItemBankDetailFilterObj);
        SetNullXSProps(RQPlanItemBankDetailFilterObj);

        RQPlanItemBankDetailFilterObj.planItemSecondRef := RQPlanPayItemSecondRef.Create;
        RQPlanItemBankDetailFilterObj.planItemSecondRef.code :=  Integer(sgRQPlanPayItemSecond.Objects[0,sgRQPlanPayItemSecond.Row]);


        RQPlanItemBankDetailList := TempRQPlanItemBankDetail.getScrollableFilteredList(RQPlanItemBankDetailFilterObj,0,1);


        RQPlanItemBankDetailObj :=  TempRQPlanItemBankDetail.getObject(RQPlanItemBankDetailList.list[0].code);
     end;



   except
   on EConvertError do begin
       ShowMessage('Ошибка при выборе реквизитов !!!');
       Exit;
       end;
  end;
  frmRQPlanItemBankDetailEdit:=TfrmRQPlanItemBankDetailEdit.Create(Application, DialogFormUnit.dsEdit);

  frmRQPlanItemBankDetailEdit.bankingDetailsCode := RQPlanItemBankDetailObj.bankingRef.code;
  enbankingdetailsobj :=  tempenbankingdetails.getObject(RQPlanItemBankDetailObj.bankingRef.code);
//  frmRQPlanItemBankDetailEdit.edtOurAccount.Text :=  sgPaymentGroupInfo.Cells[4,sgPaymentGroupInfo.Row];
 // frmRQPlanItemBankDetailEdit.edtOurMFO.Text := sgPaymentGroupInfo.Cells[5,sgPaymentGroupInfo.Row];

  frmRQPlanItemBankDetailEdit.edtOurAccount.Text :=  enbankingdetailsobj.bankaccount;
  frmRQPlanItemBankDetailEdit.edtOurMFO.Text := IntToStr(enbankingdetailsobj.bankmfo);


  if PageControl1.ActivePage = tsPayInfo then
     frmRQPlanItemBankDetailEdit.editByRqBill := True // меняем реквизиты по всем строкам second где счет енерджи нет равен счету в гриде
   else
     frmRQPlanItemBankDetailEdit.editByRqBill := False; // меняем реквизиты по строкe second где счет енерджи нет равен счету в гриде

  try
    if frmRQPlanItemBankDetailEdit.ShowModal= mrOk then
      begin
        //TempRQPlanItemBankDetail.save(RQPlanItemBankDetailObj);
        updateGroupStringInfoForPay();
      end;
  finally
    frmRQPlanItemBankDetailEdit.Free;
    frmRQPlanItemBankDetailEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayEdit.actCheckAllExecute(Sender: TObject);
begin
    checkGrid(sgRQPlanPayItemSecond, 18, true);
end;

procedure TfrmRQPlanPayEdit.actExcellExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName( 'Позиції_рахунку(фільтр)') + '.xls';

    aeExcelplanpaydocitem.XLSExport(FileName);
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

procedure TfrmRQPlanPayEdit.actFilterExecute(Sender: TObject);
var
tempCondition : String;
begin
frmRQPlanPayItemSecondFilterEdit:=TfrmRQPlanPayItemSecondFilterEdit.Create(Application, DialogFormUnit.dsInsert);
  try
    RQPlanPayItemSecondFilterObj := RQPlanPayItemSecondFilter.Create;
    SetNullIntProps(RQPlanPayItemSecondFilterObj);
    SetNullXSProps(RQPlanPayItemSecondFilterObj);

    if frmRQPlanPayItemSecondFilterEdit.ShowModal = mrOk then
    begin
    planPayItemSecondFilter := RQPlanPayItemSecondFilterObj;

   if frmRQPlanPayItemSecondFilterEdit.mname <> '' then
   AddCondition(tempCondition, ' upper(rqplanpayitemfirst.mname) like upper(''' + '%' +  frmRQPlanPayItemSecondFilterEdit.mname   + '%' + '''' + ')', true);
   if frmRQPlanPayItemSecondFilterEdit.ddscode <> '' then
   AddCondition(tempCondition, ' upper(rqplanpayitemfirst.ddscode) like upper(''' + '%' +  frmRQPlanPayItemSecondFilterEdit.ddscode   + '%' + '''' + ')', true);

   if frmRQPlanPayItemSecondFilterEdit.org <> '' then
   AddCondition(tempCondition, ' upper(rqplanpayitemfirst.org) like upper(''' + '%' +  frmRQPlanPayItemSecondFilterEdit.org   + '%' + '''' + ')', true);
   if frmRQPlanPayItemSecondFilterEdit.orgokpo <> '' then
   AddCondition(tempCondition, ' upper(rqplanpayitemfirst.orgokpo) like upper(''' + '%' +  frmRQPlanPayItemSecondFilterEdit.orgokpo   + '%' + '''' + ')', true);

     if frmRQPlanPayItemSecondFilterEdit.edtDatePlanPayStart.Checked = True then
       begin
          AddCondition(tempCondition, ' rqplanpayitemsecond.pay_plan_date >= ' + ''''+ DateTimeToStr(frmRQPlanPayItemSecondFilterEdit.edtDatePlanPayStart.DateTime) + '''' );
       end;
     if frmRQPlanPayItemSecondFilterEdit.edtDatePlanPayFinal.Checked = True then
       begin
          AddCondition(tempCondition, ' rqplanpayitemsecond.pay_plan_date <= ' + ''''+ DateTimeToStr(frmRQPlanPayItemSecondFilterEdit.edtDatePlanPayFinal.DateTime) + '''' );
       end;

     if frmRQPlanPayItemSecondFilterEdit.UnitEditBtn1.Text <> '' then
        AddCondition(tempCondition, ' rqplanpayitemsecond.pay_plan_summa  ' + frmRQPlanPayItemSecondFilterEdit.UnitEditBtn1.ButtonCaption + frmRQPlanPayItemSecondFilterEdit.UnitEditBtn1.Text );


   planPayItemSecondFilter.conditionSQL := tempCondition;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPlanPayItemSecondFilterEdit.Free;
    frmRQPlanPayItemSecondFilterEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayEdit.actRemoveItemsByBillCodesExecute(Sender: TObject);
var     billCodesArr : RQPlanPayItemSecondController.ArrayOfInteger;
TempRQPlanPayItemSecond :  RQPlanPayItemSecondControllerSoapPort;
TempRQPlanPay : RQPlanPayControllerSoapPort;
 i, count, c: Integer ;
 state, isSel : Boolean;
begin
  inherited;
 TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;

 setLength(billCodesArr,0);

 state := false;
  isSel := false;
  count := 0;

  for i:=1 to sgPaymentGroupInfo.RowCount - 1 do
  begin
     sgPaymentGroupInfo.GetCheckBoxState(1,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку відомості!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgPaymentGroupInfo.RowCount - 1 do
    begin
      sgPaymentGroupInfo.GetCheckBoxState(1,i,state);
      if state then
        begin
        try
        count := High(billCodesArr)+1;
        setLength(billCodesArr,count+1);
        billCodesArr[count] := StrToInt(sgPaymentGroupInfo.Cells[0,i]); /// берем код счета
        except
        on EConvertError do Exit;
        end;
      end;
    end;
      TempRQPlanPayItemSecond.removeItemsByBillCode(billCodesArr,RQPlanPayObj.code);
    end;
   updateGroupStringInfoForPay();
end;

procedure TfrmRQPlanPayEdit.actmakeXMLExportFileForIFOBSExecute(
  Sender: TObject);
  var
  TempRQPlanPay : RQPlanPayControllerSoapPort;
  planPay : RQPlanPay;
begin
  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;

  planPay := TempRQPlanPay.getObject(RQPlanPayObj.code);


  if(planPay = nil) then
    raise Exception.Create('Платіжну відомість не знайдено: код = ' + IntToStr(RQPlanPayObj.code));

  // Проверка статуса ведомости
  if((planPay.statusRef.code <> RQPLANPAYSTATUS_CLOSED) and (planPay.statusRef.code <> RQPLANPAYSTATUS_PAYMENTS_DONE) ) then
  begin
          Application.MessageBox(PChar('Платіжна відомість має бути затверджена!' + #13#10 +
                                 'Експорт скасовано!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

    makeTXTExportFileForiBank2(RQPlanPayObj.code);

    makePDFExportFileForOBU(RQPlanPayObj.code);    // экспорт для ощадбанка

    makeXMLExportFileForIFOBS(RQPlanPayObj.code);




end;

procedure TfrmRQPlanPayEdit.actNoFilterExecute(Sender: TObject);
begin
  inherited;
       planPayItemSecondFilter := RQPlanPayItemSecondFilter.Create;
       SetNullIntProps(planPayItemSecondFilter);
       SetNullXSProps(planPayItemSecondFilter);
       planPayItemSecondFilter.planPayRef := RQPlanPayRef.Create;
       planPayItemSecondFilter.planPayRef.code := RQPlanPayObj.code;
       actUpdateExecute(Sender);
end;

procedure TfrmRQPlanPayEdit.actRemoveItemExecute(Sender: TObject);
var     planPayArr : ArrayOfRQPlanPayItemSecondShort;
TempRQPlanPayItemSecond :  RQPlanPayItemSecondControllerSoapPort;
TempRQPlanPay : RQPlanPayControllerSoapPort;
 i, count, c: Integer ;
 state, isSel : Boolean;
begin
  inherited;
 TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;

 setLength(planPayArr,0);

 state := false;
  isSel := false;
  count := 0;

  for i:=1 to sgRQPlanPayItemSecond.RowCount - 1 do
  begin
     sgRQPlanPayItemSecond.GetCheckBoxState(18,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку відомості!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    for  i:=1 to sgRQPlanPayItemSecond.RowCount - 1 do
    begin
      sgRQPlanPayItemSecond.GetCheckBoxState(18,i,state);
      if state then
      begin
        try
          count := High(planPayArr)+1;
          setLength(planPayArr,count+1);
          planPayArr[count] := RQPlanPayItemSecondShort.Create;
          planPayArr[count].code :=  Integer(sgRQPlanPayItemSecond.Objects[0,i]);
        except
          on EConvertError do Exit;
        end;
      end;
    end;

    TempRQPlanPayItemSecond.removeSelectedItems(planPayArr,-1);
    actUpdateExecute(Sender);
  end;


end;

procedure TfrmRQPlanPayEdit.actRemoveOtherItemExecute(Sender: TObject);
var
planPayArr : ArrayOfRQPlanPayItemSecondShort;
TempRQPlanPayItemSecond :  RQPlanPayItemSecondControllerSoapPort;
TempRQPlanPay : RQPlanPayControllerSoapPort;
 i, count, c: Integer ;
 state, isSel : Boolean;
begin
  inherited;
 TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;

 setLength(planPayArr,0);

 state := false;
  isSel := false;
  count := 0;

  for i:=1 to sgRQPlanPayItemSecond.RowCount - 1 do
  begin
     sgRQPlanPayItemSecond.GetCheckBoxState(18,i,state);
     if state then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку відомості!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите оставть выделенные строки и удалить остальные?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
    for  i:=1 to sgRQPlanPayItemSecond.RowCount - 1 do
    begin
      sgRQPlanPayItemSecond.GetCheckBoxState(18,i,state);
      if state then
        begin
        try
        count := High(planPayArr)+1;
        setLength(planPayArr,count+1);
        planPayArr[count] := RQPlanPayItemSecondShort.Create;
        planPayArr[count].code :=  Integer(sgRQPlanPayItemSecond.Objects[0,i]);
        except
        on EConvertError do Exit;
        end;
      end;
    end;
       TempRQPlanPayItemSecond.removeSelectedItems(planPayArr,RQPlanPayObj.code);
    end;
    actUpdateExecute(Sender);

end;

procedure TfrmRQPlanPayEdit.actRQBillViewExecute(Sender: TObject);
var
  billCode : Integer;
  TempRQBill : RQBillControllerSoapPort;
  frmEditBill : TfrmRQBillEdit;
begin
  inherited;
    try
       billCode := Integer(sgRQPlanPayItemFactPlat.Objects[0, sgRQPlanpayItemFactPlat.Row]);
    except on EConvertError do Exit;
    end;

    frmEditBill:=TfrmRQBillEdit.Create(Application, dsView);
    try
      TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
      frmEditBill.RQBillObj := TempRQBill.getObject(billCode);

      if frmEditBill.RQBillObj <> nil then
        frmEditBill.ShowModal;
    finally
      frmEditBill.Free;
      frmEditBill:=nil;
    end;
end;

procedure TfrmRQPlanPayEdit.actShowBillByReestrItemExecute(Sender: TObject);
var
  billCode : Integer;
  planpayitemSecond : RQPlanPayItemSecond;
  TempRQBill : RQBillControllerSoapPort;
  editBill : TfrmRQBillEdit;
  TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
begin
  inherited;
    
    TempRQPlanPayItemSecond :=  HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;

    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;

    planpayitemSecond:=  TempRQPlanPayItemSecond.getObject(Integer(sgRQPlanPayItemSecond.Objects[0,sgRQPlanPayItemSecond.Row]));

    editBill:=TfrmRQBillEdit.Create(Application, dsView);
    try
      editBill.RQBillObj := TempRQBill.getObject(planpayitemSecond.billRef.code);
      editBill.ShowModal;
    finally
      editBill.Free;
      editBill:=nil;
    end;
end;

procedure TfrmRQPlanPayEdit.actShowBillExecute(Sender: TObject);
var
  billCode : Integer;
  TempRQBill : RQBillControllerSoapPort;
  editBill : TfrmRQBillEdit;
begin
  inherited;
    try
//       billCode := Integer(sgRQPlanPayItemFactPlat.Objects[0, sgRQPlanpayItemFactPlat.Row]);
      billCode := StrToInt(sgPaymentGroupInfo.Cells[0,sgPaymentGroupInfo.Row]);
    except on EConvertError do Exit;
    end;
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    editBill:=TfrmRQBillEdit.Create(Application, dsView);
    try
      editBill.RQBillObj := TempRQBill.getObject(billCode);
      editBill.ShowModal;
    finally
      editBill.Free;
      editBill:=nil;
    end;
end;

procedure TfrmRQPlanPayEdit.actUnCheckAllExecute(Sender: TObject);
begin
  inherited;
    checkGrid(sgRQPlanPayItemSecond, 18, false);
end;

procedure TfrmRQPlanPayEdit.actUpdateExecute(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPlanPayItemSecond.RowCount-1 do
   for j:=0 to sgRQPlanPayItemSecond.ColCount-1 do
     sgRQPlanPayItemSecond.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPlanPayEdit.actUpdateToPaySumExecute(Sender: TObject);
var TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
   objCode : Integer;
   newToPaySum : TXSDecimal;
   oldToPaySum: String;
   oldToPaySumSingle, newToPaySumSingle : Single;
   summPropose : double;
   ///
   enteredValue: Double;
   strEnteredValue: String;
   ///
begin
  inherited;

  selectedItemIndex := sgRQPlanPayItemSecond.Row;

  try
    objCode := Integer(sgRQPlanPayItemSecond.Objects[0,sgRQPlanPayItemSecond.Row]);

    oldToPaySum := sgRQPlanPayItemSecond.Cells[19,sgRQPlanPayItemSecond.Row];
    oldToPaySumSingle := Conv(StrToFloat(oldToPaySum),2);


    summPropose := StrToFloat(sgRQPlanPayItemSecond.Cells[36,sgRQPlanPayItemSecond.Row]);
  except
    on EConvertError do Exit;
  end;

  // oldToPaySum := sgRQPlanPayItemSecond.Cells[19, sgRQPlanPayItemSecond.Row];
  newToPaySum := TXSDecimal.Create;

  // если плановая сумма = 0 то предлагаем сумму к оплате
  /////
  {
  if summPropose > 0 then
  newToPaySum.DecimalString := InputBox('EnergyNet', 'Введіть нову Сумму', FloatToStr(summPropose))
  else
  newToPaySum.DecimalString := InputBox('EnergyNet', 'Введіть нову Сумму', oldToPaySum);
  }
  if summPropose > 0 then
    enteredValue := summPropose
  else
    enteredValue := oldToPaySumSingle; //oldToPaySum;

  strEnteredValue := FloatToStr(enteredValue);

  // if not InputQuery('EnergyNet', 'Введіть нову cуму', enteredValue) then
  if not InputQuery('EnergyNet', 'Введіть нову cуму', strEnteredValue) then
    Exit;

  try
    enteredValue := StrToFloat(strEnteredValue);
  except
    on EConvertError do
    begin
      Application.MessageBox(PChar('Неправильний формат числа: ' + strEnteredValue), PChar('Увага !'), MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end;

  newToPaySum.DecimalString := FloatToStr(enteredValue);
  /////


  try
    newToPaySumSingle := StrToFloat(newToPaySum.DecimalString);
  except
    on EConvertError do
    begin
      Application.MessageBox(PChar('Неправильний формат числа: ' + newToPaySum.DecimalString), PChar('Увага !'), MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end;

  if newToPaySumSingle < 0 then
  begin
    Application.MessageBox(PChar('Сума не може бути менше 0'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  if oldToPaySumSingle - newToPaySumSingle = 0 then
    Exit
  else begin
    TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;
    TempRQPlanPayItemSecond.updateToPaySum(ObjCode, newToPaySum);
    Self.FormShow(Sender);
  end;

  if PageControl1.ActivePage = tsPlanPay then
  begin
    if sgRQPlanPayItemSecond.RowCount > selectedItemIndex then
      sgRQPlanPayItemSecond.Row := selectedItemIndex
    else
      sgRQPlanPayItemSecond.Row := sgRQPlanPayItemSecond.RowCount - 1;
  end;

end;

procedure TfrmRQPlanPayEdit.BitBtn1Click(Sender: TObject);
var
  argNames, args: ArrayOfString;

  reportName: String;
begin
  inherited;

         SetLength(argNames, 1);
         SetLength(args, 1);

         argnames[0] := 'planpaycode';
         args[0] := IntToStr(RQPlanPayObj.code);

         reportName := 'RepOrder/reestrPay/sum_not_paid_by_bill';
         makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmRQPlanPayEdit.btnCurrSaldoByContractClick(Sender: TObject);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
    bilObj : RQBill;
begin

 // inherited;
     TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
       bilObj := TempRQPlanPay.getCurrentSaldoKreditDebet(StrToInt(sgRQPlanPayItemSecond.Cells[0,sgRQPlanPayItemSecond.Row]));

       if bilObj <> nil  then
        if(( bilObj.contractNumber <> '' ) and  (bilObj.vat <> nil ) and ( bilObj.sumWithNds <> nil))then

       begin

       edtContractNumber.Text:= bilObj.contractNumber;
       edtDebet.Text:=  bilObj.vat.DecimalString;    // debet
       edtCredit.Text:=  bilObj.sumWithNds.DecimalString;    // kredit

       if  Strtofloat(bilObj.deliveryDays.DecimalString) > 0 then
       begin
       edtDebetSvern.Text := bilObj.deliveryDays.DecimalString;
       edtCreditSvern.Text := '0';
       end;
       if  Strtofloat(bilObj.deliveryDays.DecimalString) < 0 then
       begin
       edtCreditSvern.Text := FloatToStr(abs(Strtofloat(bilObj.deliveryDays.DecimalString)));
       edtDebetSvern.Text:= '0';
       end;
       if  Strtofloat(bilObj.deliveryDays.DecimalString) = 0 then
       begin
            edtDebetSvern.Text:= '0';
            edtCreditSvern.Text := '0';
       end;

      end;

end;

procedure TfrmRQPlanPayEdit.btnGenerateItemsClick(Sender: TObject);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
OrderitemCode :Integer;
begin
  inherited;
  OrderitemCode:= 0;

  if edtOrderitemCode.Text <> '' then
     OrderitemCode := StrToInt(edtOrderitemCode.Text);

  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
  /////
  // TempRQPlanPay.GenerateItems(RQPlanPayObj.code,XSDate2String(RQPlanPayObj.dateGen),OrderitemCode);
  // 1 - старый метод, 2 - новый ;-)
  if RQPlanPayObj.kindRef.code = RQPLANPAYKIND_TMC then
     TempRQPlanPay.GenerateItems(RQPlanPayObj.code, XSDate2String(RQPlanPayObj.dateGen), OrderitemCode, 2)
  else if RQPlanPayObj.kindRef.code = RQPLANPAYKIND_SERVICE then
     TempRQPlanPay.GenerateItemsService(RQPlanPayObj.code, XSDate2String(RQPlanPayObj.dateGen), OrderitemCode, 1)
  else
    begin
     ShowMessage('Невідомий вид реєстру !!!');
     Exit;
    end;

  /////
  self.FormShow(Sender);
end;

procedure TfrmRQPlanPayEdit.btnImportFromProbankClick(Sender: TObject);
var
TempRQPlanPay : RQPlanPayControllerSoapPort;
listNotImported : IFobsXMLInfoList;
formNotImported : TfrmIFobsXMLNotImportedShow;
begin
  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
  if Application.MessageBox(PChar('Вы действительно хотите импортировать оплаты из Пробанка ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPay.exportReestrPlatFromProbank(RQPlanPayObj.code);
      Self.updateProbankImportedData();
      Application.MessageBox(PChar('Експорт завершений!'),
                         PChar('Сообщение'), MB_ICONINFORMATION);

      listNotImported := TempRQPlanPay.getListForIFobsXMLFileNotImportedFromProbank(RQPlanPayObj.code);
      if(listNotImported.totalCount > 0) then
      begin
          if Application.MessageBox(PChar(' Були імпортовані не усі платежі! Переглянути інформацію по платежам, що не були імпортовані ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
                    begin
                          formNotImported :=  TfrmIFobsXMLNotImportedShow.Create(Application, DialogFormUnit.dsInsert);
                          formNotImported.rqPlanPayCode := RQPlanPayObj.code;
                          try

                            formNotImported.ShowModal;
                          finally
                            formNotImported.Free;
                          end;
                    end;
      end;

  end;
  inherited;
end;

procedure TfrmRQPlanPayEdit.btnMakePayDocsClick(Sender: TObject);
var
  TempRQPlanPay : RQPlanPayControllerSoapPort;

begin
  inherited;
  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;

  if(RQPlanPayObj.statusRef.code <> RQPLANPAYSTATUS_PAYMENTS_DONE) then
  begin
          if Application.MessageBox(PChar('Вы действительно хотите разнести оплаты по счетам согласно платежной ведомости ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
                    begin
                                TempRQPlanPay.makePayDocs(RQPlanPayObj.code);
                                RQPlanPayObj := TempRQPlanPay.getObject(RQPlanPayObj.code);
                                setMakePayDocs;
                                Application.MessageBox(PChar('Оплаты разнесены!'),
                                          PChar('Сообщение'), MB_ICONINFORMATION);
                                Self.updateProbankImportedData();
                    end;
  end
  else
  begin
          if Application.MessageBox(PChar('Вы действительно хотите отменить разноску оплат по счетам согласно платежной ведомости ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
                    begin
                                TempRQPlanPay.removePayDocs(RQPlanPayObj.code);
                                RQPlanPayObj := TempRQPlanPay.getObject(RQPlanPayObj.code);
                                setMakePayDocs;
                                Application.MessageBox(PChar('Оплаты удалены!'),
                                          PChar('Сообщение'), MB_ICONINFORMATION);
                                Self.updateProbankImportedData();
                    end;
  end;
end;

procedure TfrmRQPlanPayEdit.btnNotImportedPaymentsClick(Sender: TObject);
var
formNotImported : TfrmIFobsXMLNotImportedShow;
begin
  inherited;
  formNotImported := TfrmIFobsXMLNotImportedShow.Create(Application, DialogFormUnit.dsInsert);
  formNotImported.rqPlanPayCode := RQPlanPayObj.code;
  try
      formNotImported.ShowModal;
  finally
      formNotImported.Free;
  end;
end;

procedure TfrmRQPlanPayEdit.btnOkClick(Sender: TObject);
begin
  inherited;

end;

// Установить текст кнопки и другие действия
procedure TfrmRQPlanPayEdit.setMakePayDocs;
begin
   if(RQPlanPayObj.statusRef.code = RQPLANPAYSTATUS_PAYMENTS_DONE) then
   begin
         btnMakePayDocs.Caption := 'Видалити оплати';

   end
   else
   begin
         btnMakePayDocs.Caption := 'Рознести оплати по рахунках';
   end;
end;

procedure TfrmRQPlanPayEdit.setVisibleBtnUnimportedPayments;
begin
           if((RQPlanPayObj.statusRef.code = RQPLANPAYSTATUS_CLOSED) or
             (RQPlanPayObj.statusRef.code = RQPLANPAYSTATUS_PAYMENTS_DONE)
           ) then
                      btnNotImportedPayments.Visible := True
           else
                      btnNotImportedPayments.Visible := False;
end;


procedure TfrmRQPlanPayEdit.sgRQPlanPayItemSecondCellChanging(Sender: TObject;
  OldRow, OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  inherited;
   sgRQPlanPayItemSecond.RowColor[OldRow] := clWindow;
   sgRQPlanPayItemSecond.RowColor[NewRow] := clYellow;

   ClearControls([edtContractnumber, edtDebet , edtCredit , edtDebetSvern , edtCreditSvern]);

end;

procedure TfrmRQPlanPayEdit.spbBudgetClick(Sender: TObject);
var

   f : rqbudgetFilter;
   frmRQBudgetShow : TfrmRQBudgetShow;

   TempRQPlanPay2RQbudget: RQPlanPay2RQbudgetControllerSoapPort;
begin
   f := rqbudgetFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

//   f.statusRef := RQBudgetStatusRef.Create;
//   f.statusRef.code :=  RQBUDGET_STATUS_DRAFT;

   f.orderBySQL := '  dategen desc  ' ;

   frmRQBudgetShow:=TfrmRQBudgetShow.Create(Application,fmNormal, f);

   DisableActions([frmRQBudgetShow.actView ,
   frmRQBudgetShow.actInsert ,
   frmRQBudgetShow.actDelete ,
   frmRQBudgetShow.actEdit ,
   frmRQBudgetShow.actUpdate ,
   frmRQBudgetShow.actApprove ,
   frmRQBudgetShow.actUnApprove]
   );
   try

      with frmRQBudgetShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
//               if RQOrderObj.departmentRef = nil then RQOrderObj.departmentRef := ENDepartment.Create();
//               RQOrderObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
//               edtENDepartmentDepartmentRefName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;

               TempRQPlanPay2RQbudget := HTTPRIORQPlanPay2RQbudget as RQPlanPay2RQbudgetControllerSoapPort;
                pl2budg :=RQPlanPay2RQbudget.Create;
               if pl2budg.planPayRef = nil then
                    pl2budg.planPayRef := RQPlanPayRef.Create;
                  pl2budg.planPayRef.code := RQPlanPayObj.code;
               if pl2budg.budgetRef = nil then  pl2budg.budgetRef := RQBudgetRef.Create;
                  pl2budg.budgetRef.code :=  StrToInt ( frmRQBudgetShow.sgRQBudget.Cells[0,frmRQBudgetShow.sgRQBudget.Row] ) ;
                  edtBudget.Text :=  frmRQBudgetShow.sgRQBudget.Cells[2,sgRQBudget.Row];


               //TempRQPlanPay2RQbudget.add(pl2budg);


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmRQBudgetShow.Free;
   end;
end;

procedure TfrmRQPlanPayEdit.btnReestrClick(Sender: TObject);
var
  argNames, args: ArrayOfString;

  reportName: String;
begin

         SetLength(argNames, 1);
         SetLength(args, 1);

         argnames[0] := 'planPayRefCode';
         args[0] := IntToStr(RQPlanPayObj.code);

         reportName := 'RepOrder/plan_pay/rep_order_full';
         makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQPlanPayEdit.Button1Click(Sender: TObject);
var
  argNames, args: ArrayOfString;

  reportName: String;
begin
  inherited;
         SetLength(argNames, 1);
         SetLength(args, 1);

         argnames[0] := 'planPayCode';
         args[0] := IntToStr(RQPlanPayObj.code);

         reportName := 'RepOrder/plan_pay/plan_pay_office';
         makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQPlanPayEdit.Button2Click(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
    inherited;
         SetLength(argNames, 1);
         SetLength(args, 1);

         argnames[0] := 'planPayCode';
         args[0] := IntToStr(RQPlanPayObj.code);

         reportName := 'RepOrder/plan_pay/plan_pay';
         makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmRQPlanPayEdit.Button3Click(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
    inherited;
         SetLength(argNames, 1);
         SetLength(args, 1);

         argnames[0] := 'planPayCode';
         args[0] := IntToStr(RQPlanPayObj.code);

         reportName := 'RepOrder/plan_pay/plan_pay_office_fact';
         makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQPlanPayEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
pl2budgcode : Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = DialogFormUnit.dsEdit) or (DialogState = DialogFormUnit.dsInsert)) then
  if not NoBlankValues([
      edtDateGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

    if DMReports.chkPaymentByBudget then
     begin
       if edtBudget.Text = '' then
       begin
        Application.MessageBox(PChar('Вкажіть бюджетний період!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
       end;
     end;

    TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;


     RQPlanPayObj.numberDoc := edtNumberDoc.Text;

      if  cbbRqplanpayKind.ItemIndex = -1 then
   begin
      Application.MessageBox(PChar('Вкажіть Вид реєстра оплат ...'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
   end;

    if RQPlanPayObj.kindRef = nil then RQPlanPayObj.kindRef := RQPlanPayKindRef.Create;
       RQPlanPayObj.kindRef.code := cbbRqplanpayKind.ItemIndex + 1;

     if edtdateGen.checked then
     begin 
       if RQPlanPayObj.dateGen = nil then
          RQPlanPayObj.dateGen := TXSDate.Create;
       RQPlanPayObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQPlanPayObj.dateGen := nil;

    if DialogState = DialogFormUnit.dsInsert then
    begin

      pl2budgcode := 0;

      if pl2budg <> nil then
       if pl2budg.budgetRef <> nil then
        if pl2budg.budgetRef.code > 0 then
           pl2budgcode := pl2budg.budgetRef.code
         else
           pl2budgcode := 0;




      RQPlanPayObj.code:=low(Integer);

      if DMReports.chkPaymentByBudget then
      TempRQPlanPay.add(RQPlanPayObj , pl2budg.budgetRef.code )
      else
      TempRQPlanPay.add(RQPlanPayObj , LOW_INT );



    end
    else
    if DialogState = DialogFormUnit.dsEdit then
    begin
      TempRQPlanPay.save(RQPlanPayObj);
    end;
  end;
end;



procedure TfrmRQPlanPayEdit.FormCreate(Sender: TObject);
begin
  inherited;
   planPayItemSecondFilter := nil;
end;

procedure TfrmRQPlanPayEdit.updateGroupStringInfoForPay();
 var
 listForClientBank : IFobsXMLInfoList;
 TempRQPlanPay : RQPlanPayControllerSoapPort;
 PInfoLastCount , i , PInfoLastRow : Integer;
 Vamount : Double ;
 begin
    TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
    listForClientBank := TempRQPlanPay.getListForIFobsXMLFile(RQPlanPayObj.code);
    SetGridHeaders(PaymentGroupInfoHeaders, sgPaymentGroupInfo.ColumnHeaders);

    toPaySumGroup := 0;
     PInfoLastCount:=High(listForClientBank.list);
  if PInfoLastCount > -1 then
     sgPaymentGroupInfo.RowCount:=PInfoLastCount+2
  else
     sgPaymentGroupInfo.RowCount:=2;

	 with sgPaymentGroupInfo do
    for i:=0 to PInfoLastCount do
      begin
        Application.ProcessMessages;

        Cells[0,i+1] := listForClientBank.list[i].billCode;  // documentNo; // айди rqbill


        Cells[1,i+1] := listForClientBank.list[i].billNumber;
        AddCheckBox(1,i+1,false,false);

        Cells[2,i+1] := listForClientBank.list[i].billDate;

        Vamount :=   listForClientBank.list[i].amount / 100;
        Cells[3,i+1] := FloatToStr( Vamount );
         toPaySumGroup := toPaySumGroup + Vamount;

        Cells[4,i+1] := listForClientBank.list[i].accountNo; // наш счет

        Cells[5,i+1] := listForClientBank.list[i].ourBankId; // наш мфо

        Cells[6,i+1] := listForClientBank.list[i].corrIdentifyCode; // окпо контрагента

        Cells[7,i+1] := listForClientBank.list[i].corrSName; // наименование контрагента

        Cells[8,i+1] := listForClientBank.list[i].CorrAccountNo; // счет контрагента в банке

        Cells[9,i+1] := listForClientBank.list[i].corrBankId; // мфо банка  контрагента

        Cells[10,i+1] := listForClientBank.list[i].detailsOfPayment; // назначение платежа

		    PInfoLastRow:=i+1;
        sgPaymentGroupInfo.RowCount:=PInfoLastRow+1;
      end;

   sgRQPlanPayItemSecond.Row:=1;

   lblSummGroup.Caption := 'Cумма к оплате : ' + FloatToStr(toPaySumGroup);

 end;

procedure TfrmRQPlanPayEdit.updateProbankImportedData;
var
TempRQPlanPayItemFactPlat : RQPlanPayItemFactPlatControllerSoapPort;
filter : RQPlanPayItemFactPlatFilter;
list : RQPlanPayItemFactPlatShortList;
lastCount , i , lastRow : Integer;
sumPlan, sumFact : double;
 Vamount : double ;
begin

     SetGridHeaders(RQPlanPayItemFactPlatHeaders,sgRQPlanPayItemFactPlat.ColumnHeaders);
     TempRQPlanPayItemFactPlat := HTTPRIORQPlanPayItemFactPlat as RQPlanPayItemFactPlatControllerSoapPort;
     filter := RQPlanPayItemFactPlatFilter.Create;
     SetNullXSProps(filter);
     SetNullIntProps(filter);
     filter.planPayRef := RQPlanPayRef.Create;
     filter.planPayRef.code := RQPlanPayObj.code;
     Vamount := 0;

     list := TempRQPlanPayItemFactPlat.getScrollableFilteredList(filter, 0, -1);

     lastCount:=High(list.list);
    if lastCount > -1 then
     sgRQPlanPayItemFactPlat.RowCount:=lastCount + 2
    else
     sgRQPlanPayItemFactPlat.RowCount := 2;

    with sgRQPlanPayItemFactPlat do
    for i:=0 to lastCount do
      begin
        Application.ProcessMessages;

        Cells[0,i+1] := IntToStr(list.list[i].code);
        Cells[1,i+1] := IntToStr(list.list[i].id);
        Cells[2,i+1] := list.list[i].rqBillRefNumberGen;
        if(list.list[i].rqBillRefDateGen = nil) then
            Cells[3,i+1] := ''
        else
            Cells[3,i+1] := XSDate2String(list.list[i].rqBillRefDateGen);
        Cells[4,i+1] := list.list[i].rqBillItemRefMaterialNames;
        if(list.list[i].planPayItemSecondRefPay_plan_summa = nil) then
            Cells[5,i+1] := ''
        else
            Cells[5,i+1] := list.list[i].planPayItemSecondRefPay_plan_summa.DecimalString;
        if(list.list[i].sumGen = nil) then
            Cells[6,i+1] := ''
        else
            Cells[6,i+1] := list.list[i].sumGen.DecimalString;
        if(list.list[i].sumInPayment = nil) then
            Cells[7,i+1] := ''
        else
            Cells[7,i+1] := list.list[i].sumInPayment.DecimalString;
        Cells[8, i + 1] := list.list[i].rqBillItemRefStates;

        if(list.list[i].planPayItemSecondRefPay_plan_summa = nil) then
          sumPlan := 0
        else
          sumPlan := StrToFloat(list.list[i].planPayItemSecondRefPay_plan_summa.DecimalString);

          if(list.list[i].sumGen = nil) then
            sumFact := 0
          else
            sumFact := StrToFloat(list.list[i].sumGen.DecimalString);

            Vamount := Vamount + sumFact;

            Objects[0, i+1] :=  TObject(list.list[i].rqBillRefCode);

        if(sumFact - sumPlan <> 0) then
          RowColor[i+1] := Shape1.Brush.Color;
      end;

      lblSumPlanFactImportedFromProbank.Caption := 'Загальна сума фактичної сплати: ' + FloatToStr(Vamount);


end;

function processIBANAccount(saveIban : Boolean; account : String) : String;
begin
    if saveIban then begin
      Result := account;
    end else begin
      if FinancialUtilsUnit.IsAccountIBANSimilar(account) then begin
        Result := FinancialUtilsUnit.GetAccountFromIBAN(account);
      end else begin
        Result := account;
      end;

    end;
end;

procedure TfrmRQPlanPayEdit.makeXMLExportFileForIFOBS(rqPlanPayCode: Integer);
var
       AppPath, ExportPath, strNumberOfPlanPay : String;
       i, indexOfHeader, indexOfXMLFile : Integer;
       TempRQPlanPay : RQPlanPayControllerSoapPort;
       planPay : RQPlanPay;
       listForClientBank : IFobsXMLInfoList;
       mfoList : TStringList;
       xmlDoc : Array Of TXMLDocument;
       rowData, itemData : Array Of IXMLNode;
       filePathArray : Array Of String;
       paymentDay : String;
       paymentMonth : String;
begin


  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;

  planPay := TempRQPlanPay.getObject(rqPlanPayCode);

  if(planPay = nil) then
    raise Exception.Create('Платіжну відомість не знайдено: код = ' + IntToStr(rqPlanPayCode));

  // Проверка статуса ведомости
  if((planPay.statusRef.code <> RQPLANPAYSTATUS_CLOSED) and (planPay.statusRef.code <> RQPLANPAYSTATUS_PAYMENTS_DONE) ) then
  begin
          Application.MessageBox(PChar('Платіжна відомість має бути затверджена!' + #13#10 +
                                 'Експорт скасовано!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  listForClientBank := TempRQPlanPay.getListForIFobsXMLFile(rqPlanPayCode);

    // Проверка есть ли строки в платежной ведомости
    if High(listForClientBank.list) = -1 then
  begin
    Application.MessageBox(PChar('Платіжна відомість не містить строк!' + #13#10 +
                                 'Експорт скасовано!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  // Создание листов с объктами TXMLDocument и TString
  mfoList := TStringList.Create;

  strNumberOfPlanPay := planPay.numberDoc;

  // Заполнение листов и определение необходимого количества xml-файлов
  for i := 0 to listForClientBank.totalCount - 1 do
  begin
        // Если такого мфо еще не было в списке, то
        if(mfoList.IndexOf(listForClientBank.list[i].ourBankId) = -1) then
        begin
            mfoList.Add(listForClientBank.list[i].ourBankId);
        end;
  end;

  SetLength(xmlDoc, mfoList.Count);
  SetLength(rowData, mfoList.Count);
  SetLength(itemData, mfoList.Count);
  SetLength(filePathArray, mfoList.Count);

  for i := 0 to Length(xmlDoc) - 1 do
    begin
          xmlDoc[i] := TXMLDocument.Create(Application);
          // Установки xml
          xmlDoc[i].Options := [doNodeAutoCreate,doNodeAutoIndent,doAttrNull,doAutoPrefix,doNamespaceDecl];
          xmlDoc[i].Active := false;
          xmlDoc[i].XML.Clear;
          xmlDoc[i].Active := true;
          xmlDoc[i].Version := '1.0';
          xmlDoc[i].Encoding := 'windows-1251';
          // Добавление информации
          rowData[i] := xmlDoc[i].AddChild('ROWDATA');
          // Формирование имени файла
          filePathArray[i] := 'пл_вед_' + strNumberOfPlanPay + '_мфо_' + mfoList[i] + '.xml';
    end;

    // Формирование пути сохранения и создание директорий
  AppPath := ExtractFilePath(Application.ExeName);
  ExportPath := AppPath + PlanPayExportPath + 'Платежные_ведомости\';
  if not DirectoryExists(AppPath + PlanPayExportPath) then
    CreateDir(AppPath + PlanPayExportPath);
  if not DirectoryExists(ExportPath) then
    CreateDir(ExportPath);

    for i := 0 to listForClientBank.totalCount - 1 do
    begin

        paymentDay := IntToStr(planPay.dateGen.Day);
        if length(paymentDay) = 1  then
        paymentDay :='0'+paymentDay;

        paymentMonth  := IntToStr(planPay.dateGen.Month);
        if length(paymentMonth) = 1  then
        paymentMonth :='0'+paymentMonth;

        indexOfXMLFile := mfoList.IndexOf(listForClientBank.list[i].ourBankId);

        itemData[indexOfXMLFile] := rowData[indexOfXMLFile].AddChild('ROW');
        itemData[indexOfXMLFile].Attributes['Amount'] := IntToStr(listForClientBank.list[i].amount); {Сумма платежа в копейках (Целое число)}
        itemData[indexOfXMLFile].Attributes['CorrSName'] := copy(listForClientBank.list[i].corrSName, 1, 38); {Наименование получателя платежа}
        itemData[indexOfXMLFile].Attributes['DetailsOfPayment'] := listForClientBank.list[i].detailsOfPayment; {Назначение платежа}
        itemData[indexOfXMLFile].Attributes['CorrAccountNo'] := processIBANAccount(false, listForClientBank.list[i].corrAccountNo); {№ счета получателя платежа}
        itemData[indexOfXMLFile].Attributes['AccountNo'] := processIBANAccount(false, listForClientBank.list[i].accountNo); {№ счета плательщика}
        itemData[indexOfXMLFile].Attributes['CorrBankId'] := listForClientBank.list[i].corrBankId; {Код банка получателя платежа (МФО)}
        itemData[indexOfXMLFile].Attributes['CorrIdentifyCode'] := listForClientBank.list[i].corrIdentifyCode; {Идентификационный код получателя платежа(ОКПО)}
        itemData[indexOfXMLFile].Attributes['DocumentNo'] := listForClientBank.list[i].documentNo; {№ документа Если номер не указан, будет использоваться автонумерация}
       // itemData[indexOfXMLFile].Attributes['DocumentDate'] := listForClientBank.list[i].documentDate; {Дата документа ГГГГММДД}
        itemData[indexOfXMLFile].Attributes['DocumentDate'] := IntToStr(planPay.dateGen.Year)+ paymentMonth + paymentDay;
        itemData[indexOfXMLFile].Attributes['BankId'] := listForClientBank.list[i].ourBankId; {Код банка плательщика (МФО)}
        itemData[indexOfXMLFile].Attributes['CorrIBAN'] := processIBANAccount(true, listForClientBank.list[i].corrAccountNo);
        itemData[indexOfXMLFile].Attributes['IBAN'] := processIBANAccount(true, listForClientBank.list[i].accountNo);

    end;

  for i := 0 to Length(xmlDoc) - 1 do
    begin
          // Определение позиции заголовка
          indexOfHeader := xmlDoc[i].XML.IndexOf('<?xml version="1.0"?>');
          if(indexOfHeader = -1) then raise Exception.Create('Помилка при визначенні позиції для строки "<?xml version="1.0"?>"');

          // Замена заголовка
          xmlDoc[i].XML.Delete(indexOfHeader);
          xmlDoc[i].XML.Insert(indexOfHeader, '<?xml version="1.0" encoding="windows-1251"?>');
          xmlDoc[i].XML.SaveToFile(ExportPath + filePathArray[i]);
          xmlDoc[i].Active := false;
    end;

  Application.MessageBox(PChar('Експорт завершений!' + #13#10 +
                               'Платіжні відомості збережені за шляхом "' + ExportPath + '" !'),
                         PChar('Сообщение'), MB_ICONINFORMATION);

end;


procedure TfrmRQPlanPayEdit.makeTXTExportFileForiBank2(rqPlanPayCode: Integer);
var
       AppPath, ExportPath, strNumberOfPlanPay : String;
       i, indexOfHeader, indexOfXMLFile : Integer;
       TempRQPlanPay : RQPlanPayControllerSoapPort;
       planPay : RQPlanPay;
       listForClientBank : IFobsXMLInfoList;
       mfoList : TStringList;
       xmlDoc : Array Of TXMLDocument;
       rowData, itemData : Array Of IXMLNode;
       filePathArray : Array Of String;

       ixistPaymentForIBank2:Boolean;
       fileName : String;
       paymentDay : String;
       paymentMonth : String;
begin
  ixistPaymentForIBank2:= false;

  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;

  planPay := TempRQPlanPay.getObject(rqPlanPayCode);
  strNumberOfPlanPay := planPay.numberDoc;

  if(planPay = nil) then
    raise Exception.Create('Платіжну відомість не знайдено: код = ' + IntToStr(rqPlanPayCode));

  // Проверка статуса ведомости
  if((planPay.statusRef.code <> RQPLANPAYSTATUS_CLOSED) and (planPay.statusRef.code <> RQPLANPAYSTATUS_PAYMENTS_DONE) ) then
  begin
          Application.MessageBox(PChar('Платіжна відомість має бути затверджена!' + #13#10 +
                                 'Експорт скасовано!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  listForClientBank := TempRQPlanPay.getListForIFobsXMLFile(rqPlanPayCode);

    // Проверка есть ли строки в платежной ведомости
    if High(listForClientBank.list) = -1 then
  begin
    Application.MessageBox(PChar('Платіжна відомість не містить строк!' + #13#10 +
                                 'Експорт скасовано!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

   for i := 0 to listForClientBank.totalCount - 1 do
    begin
       if listForClientBank.list[i].ourBankId = IntToStr(ENConsts.ENBANKINGDETAILS_MFO_PIB) then
          begin
           ixistPaymentForIBank2:= True;
           break;
          end;

    end;

    if ixistPaymentForIBank2 then
    begin
        // формирование имени файла
        fileName := 'пл_вед_' + strNumberOfPlanPay + '_мфо_' + IntToStr(ENConsts.ENBANKINGDETAILS_MFO_PIB) + '.txt';
        // Формирование пути сохранения и создание директорий
        AppPath := ExtractFilePath(Application.ExeName);
        ExportPath := AppPath + PlanPayExportPath + 'Платежные_ведомости\';
        if not DirectoryExists(AppPath + PlanPayExportPath) then
          CreateDir(AppPath + PlanPayExportPath);
        if not DirectoryExists(ExportPath) then
          CreateDir(ExportPath);

        Memo1.Lines.Clear;

        Memo1.Lines.Add('Content-Type=doc/ua_payment');
        Memo1.Lines.Add('');

        for i := 0 to listForClientBank.totalCount - 1 do
        begin
           if listForClientBank.list[i].ourBankId = IntToStr(ENConsts.ENBANKINGDETAILS_MFO_PIB) then
              begin
               paymentDay := IntToStr(planPay.dateGen.Day);
               if length(paymentDay) = 1  then
               paymentDay :='0'+paymentDay;

               paymentMonth  := IntToStr(planPay.dateGen.Month);
               if length(paymentMonth) = 1  then
               paymentMonth :='0'+paymentMonth;


               Memo1.Lines.Add('DATE_DOC=' + paymentDay +'.'+ paymentMonth +'.'+IntToStr(planPay.dateGen.Year) );
               Memo1.Lines.Add('NUM_DOC=' + listForClientBank.list[i].documentNo );
               Memo1.Lines.Add('AMOUNT=' + FormatFloat('0.00',(listForClientBank.list[i].amount/100) )  );
               Memo1.Lines.Add('CLN_NAME=' + ' ПАТ ''ЕК ''ХерсонОблEнерго'' ');
               Memo1.Lines.Add('CLN_OKPO=' + listForClientBank.list[i].ourokpo );
               Memo1.Lines.Add('CLN_ACCOUNT=' + processIBANAccount(chkSaveIBANBuyer.Checked, listForClientBank.list[i].accountNo));
               Memo1.Lines.Add('CLN_BANK_MFO=' + listForClientBank.list[i].ourBankId );
               Memo1.Lines.Add('RCPT_NAME=' + copy(listForClientBank.list[i].corrSName,1,39)  );
               Memo1.Lines.Add('RCPT_OKPO=' + listForClientBank.list[i].corrIdentifyCode );
               Memo1.Lines.Add('RCPT_ACCOUNT=' + processIBANAccount(chkSaveIBANSeller.Checked, listForClientBank.list[i].corrAccountNo));
               Memo1.Lines.Add('RCPT_BANK_MFO=' + listForClientBank.list[i].corrBankId );
               Memo1.Lines.Add('PAYMENT_DETAILS=' + listForClientBank.list[i].detailsOfPayment );
               Memo1.Lines.Add('VALUE_DATE=' + paymentDay +'.'+paymentMonth+'.'+IntToStr(planPay.dateGen.Year) );
               Memo1.Lines.Add('');

             end;

        end;


        Memo1.lines.savetoFile(AppPath + PlanPayExportPath+ 'Платежные_ведомости\'+fileName );

    end;



end;


procedure TfrmRQPlanPayEdit.makePDFExportFileForOBU(rqPlanPayCode: Integer);
var
       AppPath, ExportPath, strNumberOfPlanPay : String;
       i, indexOfHeader, indexOfXMLFile : Integer;
       TempRQPlanPay : RQPlanPayControllerSoapPort;
       planPay : RQPlanPay;
       mfoList : TStringList;
       ixistPaymentForOBU : boolean;
       listForClientBank : IFobsXMLInfoList;
       fileName : String;
       param:TStrings;
       month , day : string ;
       myDate : TDateTime;
       mfo_str : string;
begin

  ixistPaymentForOBU:= false; // есть ли в ведомости платежи по ОЩАДБАНКУ

  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;

  planPay := TempRQPlanPay.getObject(rqPlanPayCode);
  strNumberOfPlanPay := planPay.numberDoc;

  if(planPay = nil) then
     raise Exception.Create('Платіжну відомість не знайдено: код = ' + IntToStr(rqPlanPayCode));

  // Проверка статуса ведомости
  if((planPay.statusRef.code <> RQPLANPAYSTATUS_CLOSED ) and (planPay.statusRef.code <> RQPLANPAYSTATUS_PAYMENTS_DONE) ) then
  begin
          Application.MessageBox(PChar('Платіжна відомість має бути затверджена!' + #13#10 +
                                 'Експорт скасовано!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  listForClientBank := TempRQPlanPay.getListForIFobsXMLFile(rqPlanPayCode);

    // Проверка есть ли строки в платежной ведомости
    if High(listForClientBank.list) = -1 then
  begin
    Application.MessageBox(PChar('Платіжна відомість не містить строк!' + #13#10 +
                                 'Експорт скасовано!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

   for i := 0 to listForClientBank.totalCount - 1 do
    begin
       if (( listForClientBank.list[i].ourBankId = IntToStr(ENConsts.ENBANKINGDETAILS_MFO_OBU) )
          or  (listForClientBank.list[i].ourBankId = IntToStr(ENConsts.ENBANKINGDETAILS_MFO_OBU_300465) ) )  then
          begin
           mfo_str := listForClientBank.list[i].ourBankId;
           ixistPaymentForOBU:= True;
           break;
          end;

    end;

    if ixistPaymentForOBU then
    begin
        // формирование имени файла
         fileName := 'пл_вед_' + strNumberOfPlanPay + '_мфо_' + mfo_str + '.dbf';
         //  fileName := 'test.dbf';
        // Формирование пути сохранения и создание директорий
        AppPath := ExtractFilePath(Application.ExeName);
        ExportPath := AppPath + PlanPayExportPath + 'Платежные_ведомости\';
        if not DirectoryExists(AppPath + PlanPayExportPath) then
          CreateDir(AppPath + PlanPayExportPath);
        if not DirectoryExists(ExportPath) then
          CreateDir(ExportPath);


    // создадим таблицу
       Param := TStringList.Create;
       try
         with Param do begin
           param.Add('LANGDRIVER=DBWINUS0');
           //param.Add('LANGDRIVER=ancyrr');
           param.Add('LEVEL=4');
         end;
          ssnReestr.ModifyDriver('DBASE',param);
       finally
         Param.free;
       end; 

       if FileExists(ExportPath +FileName) then begin
         
            DeleteFile(ExportPath +FileName);
         
      end;

     tblForReestr := TTable.Create(nil);
      with tblForReestr do begin
        tblForReestr. DatabaseName  := ExportPath;
        TableType     := ttDBase;
        TableName     := FileName;
        with FieldDefs do begin

          Add('ndoc', ftString, 10, false);        // номер документа
          Add('dt', ftDate, 0, false);             // дата документа
          Add('mfocli', ftString ,12 ,false);      //	МФО клієнта
          Add('okpocli',ftString ,14 ,false);      //	ЗКПО клієнта
          Add('acccli', ftString ,34 ,false);      //	рахунок клієнта
          Add('namecli', ftString ,38 ,false );    // ім’я клієнта
          Add('bankcli', ftString , 254 , false ); //	назва банку клієнта
          Add('mfocor', ftString , 12 ,false );    //	МФО кореспондента
          Add('acccor', ftString , 34 , false );   //	рахунок кореспондента
          Add('okpocor', ftstring,	14 ,false );   //	ЗКПО кореспондента
          Add('namecor', ftstring, 	254 ,false );   // ім’я кореспондента
          Add('bankcor', ftString, 254 ,false );   // назва банку кореспондента
          Add('dk', ftInteger , 0  , false );      //	ознака «дебет/кредит»
          Add('summa', ftFloat , 	0 	, false );   // сума платежу
          Add('nazn' , ftString , 160, false );         //	призначення платежу
          Add('val'  , ftFloat , 0 , false );           // код валюти платежу        

        end;
        try
         tblForReestr.CreateTable;
        except
          on E : Exception do
           begin
             ShowMessage('Exception message = '+E.Message);
             tblForReestr.Close;
             exit;
           end;
         
        end;
      end;

      tblForReestr.Open;

      month:=  IntToStr(planPay.dateGen.Month);
      day:= IntToStr(planPay.dateGen.Day) ;

      if Length(month) = 1 then
         month := '0'+month;
      if Length(day) = 1 then
         day := '0'+day;

        // myDate := EncodeDateTime(2000, 2, 9, 1, 2, 3, 4);

      for i := 0 to listForClientBank.totalCount - 1 do
        begin
          if listForClientBank.list[i].ourBankId = mfo_str then
          begin
          //try
              tblForReestr.Insert;     

              tblForReestr.FieldByName('ndoc').AsString :=  listForClientBank.list[i].documentNo;    // номер документа
            
              //tblForReestr.FieldByName('dt').AsDateTime:= strtodatetime( copy( IntToStr(planPay.dateGen.Year) , 3,2 ) + month + day ) ;  //дата документа

              tblForReestr.FieldByName('dt').AsDateTime:= planPay.dateGen.AsDate;

              tblForReestr.FieldByName('mfocli').AsString := listForClientBank.list[i].ourBankId;     // МФО клієнта
              tblForReestr.FieldByName('okpocli').AsString := listForClientBank.list[i].ourokpo;    //ЗКПО клієнта
              tblForReestr.FieldByName('acccli').AsString := processIBANAccount(chkSaveIBANBuyer.Checked, listForClientBank.list[i].accountNo);   // рахунок клієнта
              tblForReestr.FieldByName('namecli').AsString := ' ПАТ ''ЕК ''ХерсонОблEнерго'' ';       //ім’я клієнта
              tblForReestr.FieldByName('bankcli').AsString := ''; // назва банку клиента               //назва банку клієнта

              tblForReestr.FieldByName('mfocor').AsString := listForClientBank.list[i].corrBankId;      //МФО кореспондента
              tblForReestr.FieldByName('acccor').AsString := processIBANAccount(chkSaveIBANSeller.Checked, listForClientBank.list[i].corrAccountNo);    //рахунок кореспондента
              tblForReestr.FieldByName('okpocor').AsString := listForClientBank.list[i].corrIdentifyCode;  //ЗКПО кореспондента
              tblForReestr.FieldByName('namecor').AsString := listForClientBank.list[i].corrSName;        // м’я кореспондента
              tblForReestr.FieldByName('bankcor').AsString := ''; // назва банку кореспондента          //назва банку кореспондента
              tblForReestr.FieldByName('dk').AsInteger := 0; // ознака «дебет/кредит»
              tblForReestr.FieldByName('summa').AsFloat := listForClientBank.list[i].amount;            //сума платежу
              tblForReestr.FieldByName('nazn').AsString := listForClientBank.list[i].detailsOfPayment;  //призначення платежу
              tblForReestr.FieldByName('val').AsFloat := 980;        //код валюти платежу


              tblForReestr.Post;
          // tblForReestr.Next;
          //except
          // on E : Exception do
          // begin
          //   ShowMessage('Exception message = '+E.Message);
          //   tblForReestr.Close;
          //   exit;
          // end;

          //end;
          end;
        end;
        tblForReestr.Close;
      end;

end;



end.

