
unit EditRQBill;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, RQOrderController, RQBillController,
    ExtCtrls , RQOrgRschetController, AdvObj, tmsAdvGridExcel , ShellAPI,
    TB2Item, TB2Dock, TB2Toolbar, RQFKOrderItemController, EditRQFKOrder
    ;

type
  TfrmRQBillEdit = class(TDialogForm)
    pcRQBill: TPageControl;
    tsRQBill: TTabSheet;
    lblNumberDoc: TLabel;
    lblNumberProject: TLabel;
    lblDateGen: TLabel;
    lblCommentGen: TLabel;
    lblUserGen: TLabel;
    lblDateEdit: TLabel;
    edtNumberDoc: TEdit;
    edtNumberProject: TEdit;
    edtDateGen: TDateTimePicker;
    edtCommentGen: TMemo;
    edtUserGen: TEdit;
    edtDateEdit: TDateTimePicker;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQOrder: THTTPRIO;
    tsRQBillItems: TTabSheet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    HTTPRIORQOrderItem: THTTPRIO;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgRQBillItem: TAdvStringGrid;
    lblCode: TLabel;
    edtCode: TEdit;
    btnBillImport: TButton;
    HTTPRIORQMaterials: THTTPRIO;
    actTDExcel: TAction;
    actTDExport: TAction;
    pnlTotal: TPanel;
    Label4: TLabel;
    pnlTotalSum: TPanel;
    HTTPRIORQBill: THTTPRIO;
    HTTPRIORQBillItem: THTTPRIO;
	  HTTPRIORQInvoice: THTTPRIO;
    HTTPRIORQOrgRschet: THTTPRIO;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtRschet: TEdit;
    edtMfo: TEdit;
    edtBank: TEdit;
    lblTKMaterialsMaterialName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrgOrg: TSpeedButton;
    btnCreateInvoice: TButton;
    edtDeliveryDays: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlVatSum: TPanel;
    pnlSum: TPanel;
    edtVAT: TComboBox;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    spbContractNumberSelect: TSpeedButton;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIORQFKOrder2Bill: THTTPRIO;
    tsPayments: TTabSheet;
    grpRQPayDoc: TGroupBox;
    sgRQPayDoc: TAdvStringGrid;
    spl1: TSplitter;
    grpRQPayDocItem: TGroupBox;
    sgRQPayDocItem: TAdvStringGrid;
    HTTPRIORQPayDocItem2BillItem: THTTPRIO;
    HTTPRIORQPayDoc: THTTPRIO;
    HTTPRIORQPayDocItem: THTTPRIO;
    btnPrintProxy: TButton;
    btnCreatePrihodBufet: TButton;
    ToolButton4: TToolButton;
    actIncomeSlip: TAction;
    actSelectAll: TAction;
    N5: TMenuItem;
    actClearAll: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    actPrintBarCodes: TAction;
    N12: TMenuItem;
    btnCheckMaterialByContract: TButton;
    lblSumWithNds: TLabel;
    edtSumWithNds: TEdit;
    actExcell: TAction;
    aeExcelBillItem: TAdvGridExcelIO;
    mniExcell: TMenuItem;
    actChangePaysParam: TAction;
    mniChangePaysParam: TMenuItem;
    edtPersonalAccount: TEdit;
    lblPersonalAccount: TLabel;
    tsRQFKOrder: TTabSheet;
    TBToolbar2: TTBToolbar;
    TBItem9: TTBItem;
    TBItem13: TTBItem;
    sgRQFKOrder: TAdvStringGrid;
    Splitter2: TSplitter;
    sgRQFKOrderItem: TAdvStringGrid;
    HTTPRIORQFKOrderItem: THTTPRIO;
    pnlLegend: TPanel;
    ShapePaid: TShape;
    lblPaid: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure pcRQBillChange(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbRQOrgOrgClick(Sender: TObject);
    procedure btnCreateInvoiceClick(Sender: TObject);
    procedure btnBillImportClick(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure btnPrintProxyClick(Sender: TObject);
    procedure btnCreatePrihodBufetClick(Sender: TObject);
    procedure actIncomeSlipExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actClearAllExecute(Sender: TObject);
    procedure actPrintBarCodesExecute(Sender: TObject);
    procedure btnCheckMaterialByContractClick(Sender: TObject);
    procedure actExcellExecute(Sender: TObject);
    procedure actChangePaysParamExecute(Sender: TObject);
    procedure edtDateGenChange(
      Sender: TObject);
    procedure sgRQFKOrderClick(Sender: TObject);

  private
    { Private declarations }
    selectedItemIndex: Integer;
  public
    { Public declarations }
    RQOrderObj: RQOrder;
    RQBillObj: RQBill;
    RQOrgRschetObj: RQOrgRschet;

    //RQInvoiceObj: RQInvoice;
    procedure UpdateGrid(Sender: TObject);
    procedure UpdateItemGrid();

end;

var
  frmRQBillEdit: TfrmRQBillEdit;
  //RQBillObj: RQBill;


  RQBillItemHeaders: array [1..11] of String =
        ( 'Код'
          , '№'
          , 'код РГК'
          , 'Матеріал'
          , 'Од. виміру'
          ,'Кількість'
          ,'Ціна (без ПДВ)'
          ,'Сума (без ПДВ)'
          ,'Сума (з ПДВ)'
          ,'Примітка'
          ,'Суми по об`єктам для ІП'
        );

  RQPayDocHeaders: array [1..7] of String =
        ( 'Код'
          ,'Сума'
          ,'Номер документа'
          ,'Дата сплати'
          ,'Номер доручення'
          ,'Метод розрахунку'
          ,'Підзвітна особа'
        );

  RQPayDocItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер документа'
          ,'Дата сплати'
          ,'Номер доручення'
          ,'Матеріал(Довідник)'
          ,'Од. виміру(Довідник)'
          ,'Кількість'
          ,'Сума у рахунку(без ПДВ)'
          ,'Сума у рахунку(з ПДВ)'
          ,'Сума сплати'
        );

  RQFKOrderHeaders: array [1..19] of String =
        ( 'Код'
          ,'Вид ордеру'
          ,'Номер'
          ,'Дата документу'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Загальна вага, кг'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
        );

  RQFKOrderItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Вага, кг'
          ,'Дж.фін.'
          ,''
        );


// Если вдруг в гриде поменяются местами столбцы (RQOrderDepartmentHeaders),
// то достаточно изменить их индекс в этих константах
const
  DEPARTMENT_COL_NUMBER = 5; // № столбца 'Підрозділ'

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  //,ShowENDepartment
  //,ENDepartmentController
  ,ShowRQOrderType
  ,RQOrderTypeController
  ,ShowRQOrderForm
  ,RQOrderFormController
  ,ShowRQOrderResource
  ,RQOrderResourceController
, ENDepartmentTypeController, ENConsts, RQOrderItemController,
  RQOrderStatusController, EditRQBillItem, EditMaterialsIn,
  ShowRQOrder, RQOrderKindController, DMReportsUnit, Globals,
  RQDDSCodesController, StrUtils, RQMaterialsController, EditRQOrderItem,
  RQBillStatusController
 ,RQBillItemController
 ,ShowRQOrg
 ,RQOrgController
 ,RQInvoiceController
 ,RQInvoiceStatusController
 ,ShowRQOrgRschet
// ,RQOrgRschetController
 ,RQOrgBankController
 ,EditBillImport, ShowFINServicesObject, ENServicesObjectController
 ,RQFKOrderController, RQFKOrder2BillController, RQFKOrderKindController
 , RQPayDocController, RQPayDocItemController, RQPayDocItem2BillItemController
 , RQBillTypeController
 , EditPrintBarCodeByMaterials
 , TKMaterialsController
 , EditParamPays;


{uses  
    EnergyproController, EnergyproController2, RQOrderController  ;
}
{$R *.dfm}



procedure TfrmRQBillEdit.FormShow(Sender: TObject);
var
  TempRQBillItem: RQBillItemControllerSoapPort;
  itemList : RQBillItemShortList;
  itemFilter : RQBillItemFilter;

  curr_nds : Real;
begin

  pcRQBill.ActivePage := tsRQBill;

  SetFloatStyle([edtSumWithNds ]);

  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
  SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);

  tsRQFKOrder.TabVisible := ((RQBillObj.billType.code = RQBILL_TYPE_TMC) and ((DialogState = dsView) or (DialogState = dsEdit)));

  SetGridHeaders(RQBillItemHeaders, sgRQBillItem.ColumnHeaders);
  if (RQBillObj.billType.code = RQBILL_TYPE_SERVICES) then
  begin
    btnBillImport.Visible := False;
    btnCreateInvoice.Visible := False;
    btnCreatePrihodBufet.Visible := False;
    sgRQBillItem.ColumnHeaders[3] := 'Послуга';
  end;

  if (RQBillObj.billType.code <> RQBILL_TYPE_TMC)
    then
    begin
      btnPrintProxy.Visible := False;
      DisableActions([actIncomeSlip]);
    end;

  if (RQBillObj.statusRef <> nil) and (RQBillObj.statusRef.code <> RQBILL_STATUS_CONFIRMED) then
  begin
    tsPayments.TabVisible := False;
    btnPrintProxy.Visible := false;
  end;

  HideControls([btnCreateInvoice, btnCreatePrihodBufet], (DialogState = dsInsert));
  DisableControls([edtNumberProject]);

  if DialogState = dsEdit then
  begin
       TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
       itemFilter := RQBillItemFilter.Create;
       SetNullIntProps(itemFilter);
       SetNullXSProps(itemFilter);
       itemFilter.billRef := RQBillRef.Create;
       itemFilter.billRef.code := RQBillObj.code;
       itemList := TempRQBillItem.getScrollableFilteredList(itemFilter,0,1);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
    tsRQBillItems.TabVisible := False;
    tsPayments.TabVisible := False;
    btnPrintProxy.Visible := False;

             // доступное значение ндс по периоду счета
             // если на вставку то тянем процент ндс коотрый действует в периоде
             curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , edtDateGen.DateTime );
             edtVat.Clear;
             edtVat.AddItem('0',nil);
             edtVat.AddItem(FloatToStr(curr_nds),nil);

             edtVat.ItemIndex := 1;


  end;

  if DialogState = dsView then
  begin
    DisableControls([
      edtRQOrgOrgName
      ,spbRQOrgOrg
      ,spbContractNumberSelect
      , edtContractNumber
      , spbContractNumberSelect
      , edtSumWithNds
      , edtPersonalAccount
       ]);
     DisableActions([actEdit, actInsert, actDelete]);

  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([
      edtRschet
      ,edtMfo
      ,edtBank
      ,edtRQOrgOrgName
      ,edtContractNumber
      ,edtCode
       ]);
    DenyBlankValues([
      edtNumberDoc
      ,edtDateGen
      ,edtDateEdit
      ,edtRQOrgOrgName
      ,edtContractNumber
     ]);
   end;


  if (DialogState = dsEdit) then
  begin
    DisableControls([
      edtRQOrgOrgName
      ,edtContractNumber
      ,spbRQOrgOrg
      ,spbContractNumberSelect
       ]);

 end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

   if ((RQBillObj.statusRef.code = RQBILL_STATUS_NEW) or (RQBillObj.billType.code = RQBILL_TYPE_SERVICES)) then
    HideControls([btnCreateInvoice, btnCreatePrihodBufet]);

    edtCode.Text := IntToStr(RQBillObj.code);
    edtNumberDoc.Text := RQBillObj.numberDoc;
    edtNumberProject.Text := RQBillObj.numberProject;

      if RQBillObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQBillObj.dateGen.Year,RQBillObj.dateGen.Month,RQBillObj.dateGen.Day);

        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtCommentGen.Text := RQBillObj.commentGen;
    //edtUserGen.Text := RQBillObj.userGen;
      if RQBillObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQBillObj.dateEdit.Year,RQBillObj.dateEdit.Month,RQBillObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtRQOrgOrgName.Text := RQBillObj.org.name;
    edtRschet.Text := RQBillObj.orgRschet.rschet;
    edtBank.Text := RQBillObj.orgRschet.bank.name;
    edtMfo.Text := RQBillObj.orgRschet.mfo;
    edtPersonalAccount.Text := RQBillObj.personalAccount;

{    if RQBillObj.vat.decimalString > '0.00' then
      edtVat.ItemIndex := 1
    else
      edtVat.ItemIndex := 0;    }

         // доступное значение ндс по периоду счета
       if DialogState = dsEdit then
       begin
             // если на редактирование то тянем процент ндс коотрый действует в периоде
             curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , RQBillObj.dateGen.AsDate );
             edtVat.Clear;
             edtVat.AddItem('0',nil);
             edtVat.AddItem(FloatToStr(curr_nds),nil);


          if StrToFloat(RQBillObj.vat.decimalString) > 0 then
             edtVat.ItemIndex := 1
          else
             edtVat.ItemIndex := 0;
       end
       else
       begin
           // если на чтение то ндс тянем со строки заявки
           edtVat.Clear;
           edtVat.AddItem(RQBillObj.vat.DecimalString,nil);
           edtVat.ItemIndex := 0;
       end;


    if (RQBillObj.deliveryDays <> nil ) then
       edtDeliveryDays.Text := RQBillObj.deliveryDays.decimalString
    else
       edtDeliveryDays.Text := '';

    if length(RQBillObj.contractNumber) > 0 then
      begin
        edtContractNumber.Text := '№ ' + RQBillObj.contractNumber + ' від ' + DateToStr(EncodeDate(RQBillObj.contractDate.Year,RQBillObj.contractDate.Month,RQBillObj.contractDate.Day));
      end;

      if ( RQBillObj.sumWithNds <> nil ) then
       edtSumWithNds.Text := RQBillObj.sumWithNds.decimalString
    else
       edtSumWithNds.Text := '';

  end;

  if (DialogState = dsInsert) then
  begin
      RQBillObj.statusRef := RQBillStatusRef.Create;
      RQBillObj.statusRef.code := 1;

      edtNumberProject.Text := 'Auto';
      edtNumberDoc.Text := 'Auto';

      edtDateEdit.DateTime:=SysUtils.Date;
      edtDateEdit.checked := true;

      edtDateGen.DateTime:=SysUtils.Date;
      edtDateGen.checked := true;

      //edtVat.Text := '20';
	end;

	// SUPP-4357 пока скроем кнопку печати проверочного отчета материалов в счете по договорам (пока Беляева не проставит количества на договорах)
	HideControls([btnCheckMaterialByContract]);


end;



procedure TfrmRQBillEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBill: RQBillControllerSoapPort;
    //TempRQOrgRschet: RQOrgRschetControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then begin

  if (RQBillObj.billType.code = RQBILL_TYPE_TMC) and (not NoBlankValues([edtNumberDoc, edtRQOrgOrgName, edtContractNumber])) then begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end else

  ////////////////
  ///// 31.01.2012 +++ для Услуг можно без договора
  if (RQBillObj.billType.code = RQBILL_TYPE_SERVICES) and (not NoBlankValues([edtNumberDoc, edtRQOrgOrgName])) then begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end else
  ////////////////

    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
    //TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

     RQBillObj.numberDoc := edtNumberDoc.Text; 

     RQBillObj.numberProject := edtNumberProject.Text;

     if edtdateGen.checked then begin 
       if RQBillObj.dateGen = nil then
       RQBillObj.dateGen := TXSDate.Create;
       RQBillObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end else begin
       RQBillObj.dateGen := nil;
     end;

     RQBillObj.commentGen := edtCommentGen.Text;

     RQBillObj.personalAccount := edtPersonalAccount.Text;
     // RQBillObj.userGen := edtUserGen.Text;

     if edtVat.Text <> '' then
       RQBillObj.vat := TXSDecimal.Create;
     if edtVat.Text <> '' then
       RQBillObj.vat.decimalString := edtVat.Text
     else
       RQBillObj.vat := nil;

     if edtDeliveryDays.Text <> '' then
       RQBillObj.deliveryDays := TXSDecimal.Create;
     if edtDeliveryDays.Text <> '' then
       RQBillObj.deliveryDays.decimalString := edtDeliveryDays.Text
     else
       RQBillObj.deliveryDays := nil;

     if edtdateEdit.checked then
     begin
       if RQBillObj.dateEdit = nil then
          RQBillObj.dateEdit := TXSDate.Create;
       RQBillObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQBillObj.dateEdit := nil;


       if RQBillObj.sumWithNds = nil then
          RQBillObj.sumWithNds := TXSDecimal.Create;
       if edtSumWithNds.Text <> '' then
			  RQBillObj.sumWithNds.decimalString := edtSumWithNds.Text
			 else
				 RQBillObj.sumWithNds.DecimalString := '0';

    if (RQBillObj.billType.code = RQBILL_TYPE_SERVICES) and (not NoBlankValues([edtContractNumber])) then begin
       if Application.MessageBox(PChar('Не обрано № договору!!! В цей рахунок можливо буде додати тільки строки заявок без договорів!!!  Продовжити ???'),
           PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then begin
             Action:=caNone;
             Exit;
           end
     end;


    if DialogState = dsInsert then begin
      RQBillObj.code:=low(Integer);
      RQBillObj.sumWithNds := TXSDecimal.Create;
      RQBillObj.sumWithNds.DecimalString := '0';

      if RQBillObj.billType.code = RQBILL_TYPE_TMC then
         TempRQBill.addBillByTmc(RQBillObj)
      else
      if RQBillObj.billType.code = RQBILL_TYPE_SERVICES then
         TempRQBill.addBillByServices(RQBillObj)
      else
          ShowMessage('Error in billTypeCode ...');
    end else begin
      if DialogState = dsEdit then begin
        TempRQBill.save(RQBillObj);
      end;
	end;
  end;
end;




procedure TfrmRQBillEdit.pcRQBillChange(Sender: TObject);
var
  i, j, LastCount : Integer;

  RQPayDocFilterObj : RQPayDocFilter;
  RQPayDocItemFilterObj : RQPayDocItemFilter;

  TempRQPayDoc : RQPayDocControllerSoapPort;
  RQPayDocList : RQPayDocShortList;

  TempRQPayDocItem : RQPayDocItemControllerSoapPort;
  RQPayDocItemList : RQPayDocItemShortList;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  RQFKOrderList : RQFKOrderShortList;
  fkOrderFilter : RQFKOrderFilter;
begin
   if pcRQBill.ActivePage = tsRQBillItems then
     begin
       for i:=1 to sgRQBillItem.RowCount-1 do
       for j:=0 to sgRQBillItem.ColCount-1 do
         sgRQBillItem.Cells[j,i]:='';
       UpdateGrid(Sender);
     end
   else
   if pcRQBill.ActivePage = tsPayments then
     begin
        ClearGrids([sgRQPayDoc, sgRQPayDocItem]);
        SetGridHeaders(RQPayDocHeaders, sgRQPayDoc.ColumnHeaders);
        SetGridHeaders(RQPayDocItemHeaders, sgRQPayDocItem.ColumnHeaders);

        TempRQPayDoc := HTTPRIORQPayDoc as RQPayDocControllerSoapPort;
        TempRQPayDocItem := HTTPRIORQPayDocItem as RQPayDocItemControllerSoapPort;

        RQPayDocItemFilterObj := RQPayDocItemFilter.Create;
        SetNullIntProps(RQPayDocItemFilterObj);
        SetNullXSProps(RQPayDocItemFilterObj);
        RQPayDocItemFilterObj.conditionSQL := 'rqpaydocitem.code in '
                    +'(select p2b.paydocitemcode from rqpaydocitem2billitem p2b '
                    +'  where p2b.billitemcode in (select bi.code from rqbillitem bi '
                    +'  where bi.billrefcode = ' + IntToStr(RQBillObj.code) + '))';
        RQPayDocItemList := TempRQPayDocItem.getScrollableFilteredList(RQPayDocItemFilterObj, 0, -1);

        RQPayDocFilterObj := RQPayDocFilter.Create;
        SetNullXSProps(RQPayDocFilterObj);
        SetNullIntProps(RQPayDocFilterObj);
        RQPayDocFilterObj.conditionSQL := 'rqpaydoc.code in '
                    +'(select pi.paydocrefcode from rqpaydocitem pi where pi.code in '
                    +'(select p2b.paydocitemcode from rqpaydocitem2billitem p2b '
                    +'  where p2b.billitemcode in (select bi.code from rqbillitem bi '
                    +'  where bi.billrefcode = ' + IntToStr(RQBillObj.code) + ')))';
        RQPayDocList := TempRQPayDoc.getScrollableFilteredList(RQPayDocFilterObj, 0, -1);

        LastCount:=High(RQPayDocList.list);

        if LastCount > -1 then
           sgRQPayDoc.RowCount:=LastCount+2
        else
           sgRQPayDoc.RowCount:=2;

         with sgRQPayDoc do
          for i:=0 to LastCount do
            begin

              if RQPayDocList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQPayDocList.list[i].code)
              else
              Cells[0,i+1] := '';
              if RQPayDocList.list[i].summaGen = nil then
                Cells[1,i+1] := ''
              else
                Cells[1,i+1] := RQPayDocList.list[i].summaGen.DecimalString;
              Cells[2,i+1] := RQPayDocList.list[i].numberGen;
              if RQPayDocList.list[i].dateGen = nil then
                Cells[3,i+1] := ''
              else
                Cells[3,i+1] := XSDate2String(RQPayDocList.list[i].dateGen);
              Cells[4,i+1] := RQPayDocList.list[i].payOrder;
              Cells[5,i+1] := RQPayDocList.list[i].paymentMethodRefName;
             if RQPayDocList.list[i].accountablePersonRefCode <> Low(Integer) then begin
               Cells[6,i+1] := Format('%s (таб.№ %s)'
               , [RQPayDocList.list[i].accountablePersonRefName
               , RQPayDocList.list[i].accountablePersonRefTabNumber]);
             end;

              sgRQPayDoc.RowCount:=i+2;
            end;
         sgRQPayDoc.Row:=1;

        ////// СТРОКИ
        if High(RQPayDocItemList.list) > -1 then
           sgRQPayDocItem.RowCount:=High(RQPayDocItemList.list)+2
        else
           sgRQPayDocItem.RowCount:=2;

        with sgRQPayDocItem do
          for i:=0 to High(RQPayDocItemList.list) do
            begin
              Application.ProcessMessages;

            if RQPayDocItemList.list[i].billItemSumWithNds.DecimalString = RQPayDocItemList.list[i].summaFact.DecimalString then
               sgRQPayDocItem.RowColor[i + 1] := clYellow;

              if RQPayDocItemList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(RQPayDocItemList.list[i].code)
              else
              Cells[0,i+1] := '';

              Cells[1,i+1] :=  RQPayDocItemList.list[i].payDocRefNumberGen;

              if RQPayDocItemList.list[i].payDocRefDateGen = nil then
                Cells[2,i+1] := ''
              else
                Cells[2,i+1] := XSDate2String(RQPayDocItemList.list[i].payDocRefDateGen);

              Cells[3,i+1] :=  RQPayDocItemList.list[i].payDocRefPayOrder;
              Cells[4,i+1] :=  RQPayDocItemList.list[i].materialName;
              Cells[5,i+1] :=  RQPayDocItemList.list[i].measurementName;

              if RQPayDocItemList.list[i].countFact = nil then
                Cells[6,i+1] := ''
              else
                Cells[6,i+1] := SeparateThousands(RQPayDocItemList.list[i].countFact.DecimalString);

              if RQPayDocItemList.list[i].billItemSummaGen = nil then
                Cells[7,i+1] := ''
              else
                Cells[7,i+1] := RQPayDocItemList.list[i].billItemSummaGen.DecimalString;

              if RQPayDocItemList.list[i].billItemSumWithNds = nil then
                Cells[8,i+1] := ''
              else
                Cells[8,i+1] := RQPayDocItemList.list[i].billItemSumWithNds.DecimalString;

              if RQPayDocItemList.list[i].summaFact = nil then
                Cells[9,i+1] := ''
              else
                Cells[9,i+1] := RQPayDocItemList.list[i].summaFact.DecimalString;

              sgRQPayDocItem.RowCount:=High(RQPayDocItemList.list)+2;
          end;
       sgRQPayDocItem.Row:=1;
     end;

  //----------------- tsRQFKOrder
  if (pcRQBill.ActivePage = tsRQFKOrder) then
  begin

    ClearGrid(sgRQFKOrder);
    ClearGrid(sgRQFKOrderItem);
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    fkOrderFilter := RQFKOrderFilter.Create;
    SetNullIntProps(fkOrderFilter);
    SetNullXSProps(fkOrderFilter);

    fkOrderFilter.conditionSQL :=
    ' rqfkorder.kindcode in (' + IntToStr(RQFKORDER_KIND_PRIHOD_POSTAVKA) + ', ' +
	   IntToStr(RQFKORDER_KIND_PRIHOD_BUFET) +') and rqfkorder.code in ( ' +
    ' select foi.fkorderrefcode from rqfkorderitem foi where foi.code in ( ' +
    ' select foi2ei.fkorderitemrefcode from rqfkorderitem2enstmttm foi2ei where foi2ei.estimateitemcode in ( ' +
    ' select bi2ei.estimateitemcode from rqbillitem2enestimattm bi2ei where bi2ei.billitemcode in ( ' +
    ' select bi.code from rqbillitem bi where bi.billrefcode = ' + IntToStr(RQBillObj.code) + ' ) ) ) )';

    fkOrderFilter.orderBySQL := 'dategen desc, statuscode desc';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(fkOrderFilter, 0, -1);

    if High(RQFKOrderList.list) > -1 then
      sgRQFKOrder.RowCount := High(RQFKOrderList.list) + 2
    else
      sgRQFKOrder.RowCount := 2;

    with sgRQFKOrder do
    for i:=0 to High(RQFKOrderList.list) do
      begin
        Application.ProcessMessages;

        if RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQFKOrderList.list[i].kindName;
        Cells[2,i+1] := RQFKOrderList.list[i].numberDoc;

        if RQFKOrderList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[4,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[4,i+1] := RQFKOrderList.list[i].molInCode;

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[5,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[5,i+1] := RQFKOrderList.list[i].molInName;

        if RQFKOrderList.list[i].kindCode in [RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[6,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else if (RQFKOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[6,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[6,i+1] := RQFKOrderList.list[i].molOutCode;

        if (RQFKOrderList.list[i].kindCode = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[7,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[7,i+1] := RQFKOrderList.list[i].molOutName;

        Cells[8, i+1] := RQFKOrderList.list[i].statusName;
        Cells[9,i+1] := RQFKOrderList.list[i].expeditorCode;
        Cells[10,i+1] := RQFKOrderList.list[i].expeditorName;

        Cells[11,i+1] := RQFKOrderList.list[i].warrantNumber;

        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);

        Cells[13,i+1] := RQFKOrderList.list[i].warrantFIO;

        if RQFKOrderList.list[i].totalWeight = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := RQFKOrderList.list[i].totalWeight.DecimalString;

        Cells[15,i+1] := RQFKOrderList.list[i].userAdd;

        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[17,i+1] := RQFKOrderList.list[i].userGen;

        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

        sgRQFKOrder.RowCount := i + 2;
      end;

    sgRQFKOrder.Row:=1;

    UpdateItemGrid();
  end;
  // END ---------------------- tsRQFKOrder
end;


procedure TfrmRQBillEdit.UpdateItemGrid();
var
  i, orderCode, itemLastCount : Integer;
  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  RQFKOrderItemList : RQFKOrderItemShortList;
  itemFilter : RQFKOrderItemFilter;
begin
  ClearGrid(sgRQFKOrderItem);

  try
    orderCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
  except
    on EConvertError do Exit;
  end;

  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  itemfilter := RQFKOrderItemFilter.Create;
  SetNullIntProps(itemfilter);
  SetNullXSProps(itemfilter);
  itemFilter.fkOrderRef := RQFKOrderRef.Create;
  itemFilter.fkOrderRef.code := orderCode;

  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(itemFilter,0,-1);

  itemLastCount:=High(RQFKOrderItemList.list);

  if itemLastCount > -1 then
     sgRQFKOrderItem.RowCount:=itemLastCount+2
  else
     sgRQFKOrderItem.RowCount:=2;

   with sgRQFKOrderItem do
    for i:=0 to itemLastCount do
      begin
        // Application.ProcessMessages;
        if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;
        Cells[2, i+1] := RQFKOrderItemList.list[i].measurementName;
        Cells[3, i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
        Cells[4, i+1] := RQFKOrderItemList.list[i].nomenclatureName;
        Cells[5, i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;
        if RQFKOrderItemList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
        begin
          Cells[6,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
        end;

        if RQFKOrderItemList.list[i].priceWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;

        if RQFKOrderItemList.list[i].sumWithoutNds = nil then
          Cells[8,i+1] := ''
        else
        begin
          Cells[8,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
        end;

        if (RQFKOrderItemList.list[i].weight = nil) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQFKOrderItemList.list[i].weight.DecimalString;

        Cells[10,i+1] := RQFKOrderItemList.list[i].fundingTypeStr;

        sgRQFKOrderItem.RowCount:=i+2;
      end;
   sgRQFKOrderItem.Row:=1;
end;


procedure TfrmRQBillEdit.UpdateGrid(Sender: TObject);
var
  i: Integer;

  TempRQBillItem: RQBillItemControllerSoapPort;
  RQBillItemList: RQBillItemShortList;
  RQBillItemFilterObj : RQBillItemFilter;

  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderList: RQOrderShortList;
  RQOrderFilterObj : RQOrderFilter;

  vatSum, sum, totalSum, itemSum , sumWithNds : Double;
begin
//
//----------------- tsRQBillItems
  if pcRQBill.ActivePage = tsRQBillItems then
  begin
      sum := 0;
      FormatSettings.DecimalSeparator := '.';

      sgRQBillItem.SetFocus;

      TempRQBillItem :=  HTTPRIORQBillItem as RQBillItemControllerSoapPort;

      RQBillItemFilterObj := RQBillItemFilter.Create;
      SetNullIntProps(RQBillItemFilterObj);
      SetNullXSProps(RQBillItemFilterObj);

      RQBillItemFilterObj.billRef := RQBillRef.Create;
      RQBillItemFilterObj.billRef.code := RQBillObj.code;

      RQBillItemFilterObj.orderBySQL := 'TKMATERIALS.NAME';

      RQBillItemList := TempRQBillItem.getScrollableFilteredList(RQBillItemFilterObj,0,-1);


      //LastCount:=High(RQBillItemList.list);

      if High(RQBillItemList.list) > -1 then
         sgRQBillItem.RowCount:=High(RQBillItemList.list)+2
      else
         sgRQBillItem.RowCount:=2;

       with sgRQBillItem do
        for i:=0 to High(RQBillItemList.list) do
          begin
            Application.ProcessMessages;
            if RQBillItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQBillItemList.list[i].code)
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := IntToStr(i + 1);

            Cells[2,i+1] :=  RQBillItemList.list[i].ddsCodesTxt;
            Cells[3,i+1] :=  RQBillItemList.list[i].materialNameTxt;
            Cells[4,i+1] :=  RQBillItemList.list[i].measurementNameTxt;

            Objects[0, i + 1] := TObject(RQBillItemList.list[i].materialCode);

            if RQBillItemList.list[i].countFact = nil then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := SeparateThousands(RQBillItemList.list[i].countFact.DecimalString);


            if RQBillItemList.list[i].priceWithoutNds = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := SeparateThousands(RQBillItemList.list[i].priceWithoutNds.DecimalString);

            Alignments[6, i + 1] := taRightJustify;
            Colors[6, i + 1] := $0080FF80;

              /////
            itemSum := 0;

            if RQBillItemList.list[i].sumWithoutNds = nil then
              Cells[7,i+1] := ''
            else begin
              Cells[7,i+1] := SeparateThousands(RQBillItemList.list[i].sumWithoutNds.DecimalString);
              try
                itemSum := StrToFloat(RQBillItemList.list[i].sumWithoutNds.DecimalString);
              except
                itemSum := 0;
              end;
              
              if RQBillObj.billType.code = RQBILL_TYPE_TMC then
                AddCheckBox(3, i+1, false, false);
            end;

            Alignments[7, i + 1] := taRightJustify;

            sum := sum + itemSum;
            //totalSum := totalSum + itemSum;
            /////


//            if RQBillObj.vat.DecimalString > '0.00' then
//                 Cells[8,i+1] := FloatToStr(itemSum*1.2)
//            else Cells[8,i+1] := FloatToStr(itemSum);

            if RQBillItemList.list[i].sumgen = nil then
              Cells[8,i+1] := ''
            else
              Cells[8,i+1] := SeparateThousands(RQBillItemList.list[i].sumgen.DecimalString);

            Alignments[8,i+1] := taRightJustify;

            sumWithNds := sumWithNds + StrToFloat(RQBillItemList.list[i].sumgen.DecimalString);

            Cells[9,i+1] := RQBillItemList.list[i].commentGen;

            Cells[10,i+1] := RQBillItemList.list[i].sum_by_obj_text;

            sgRQBillItem.RowCount:=High(RQBillItemList.list)+2;
          end;
       //ColCount:=ColCount+1;
       sgRQBillItem.Row:=1;

//       if RQBillObj.vat.DecimalString > '0.00' then
//         totalSum := sum*1.2
//       else totalSum := sum;
//       vatSum := totalSum-sum;
//
//    pnlSum.Caption := SeparateThousands(FloatToStr(Conv(sum, 2)));
//    pnlVatSum.Caption := SeparateThousands(FloatToStr(Conv(vatSum, 2)));
//    pnlTotalSum.Caption := SeparateThousands(FloatToStr(Conv(totalSum, 2)));

       vatSum := sumWithNds-sum;

    pnlSum.Caption := SeparateThousands(FloatToStr(Conv(sum, 2)));
    pnlVatSum.Caption := SeparateThousands(FloatToStr(Conv(vatSum, 2)));
    pnlTotalSum.Caption := SeparateThousands(FloatToStr(Conv(sumWithNds, 2)));
  end;
// END ---------------------- tsRQBillItems


end;



procedure TfrmRQBillEdit.actUpdateExecute(Sender: TObject);
begin
pcRQBillChange(Sender);
end;



procedure TfrmRQBillEdit.actInsertExecute(Sender: TObject);
var
 i,j: Integer;

 TempRQBillItem: RQBillItemControllerSoapPort;
 frmMaterialsInEdit: TfrmMaterialsInEdit;

 f : RQOrderFilter;
 TempRQOrder_: RQOrderControllerSoapPort;
 RQOrderList: RQOrderShortList;
 frmOrderShow : TfrmRQOrderShow;
begin

    if pcRQBill.ActivePage = tsRQBillItems then
    begin

      frmMaterialsInEdit := TfrmMaterialsInEdit.Create(Application, dsInsert);

      try
      
        if (RQBillObj.billType.code = RQBILL_TYPE_SERVICES) then
         begin
           frmMaterialsInEdit.Caption := 'Редагування послуг у рахунку';
          // frmMaterialsInEdit.cbGroupItemMaterial.Checked := True; { NET-4265 // mod 20.09.2013 для услуг нужно разделять строки всегда }
          // DisableControls([frmMaterialsInEdit.cbGroupItemMaterial]); { \\ mod }
         end
        else frmMaterialsInEdit.Caption := 'Редагування матеріалів у рахунку';

        frmMaterialsInEdit.cbGroupItemMaterial.Checked := True; // NET-4280 - разбивать строки в счете что бы оплаты относились к определенной строке заявки
        DisableControls([frmMaterialsInEdit.cbGroupItemMaterial]); // \\ mod }

        frmMaterialsInEdit.billCode := RQBillObj.code;
        frmMaterialsInEdit.billType := RQBillObj.billType.code;
        frmMaterialsInEdit.isBill := true;

        if (RQBillObj.contractNumber <> '') then
          begin
           frmMaterialsInEdit.edtContract.Text := RQBillObj.contractNumber;
           frmMaterialsInEdit.contractNumber := RQBillObj.contractNumber;
           frmMaterialsInEdit.orgId := RQBillObj.org.id;
          end; 

          if frmMaterialsInEdit.ShowModal = mrOk then
          begin
            if RQOrderItemObj<>nil then
                //TempRQOrderItem.add(RQOrderItemObj);
                //UpdateGrid(Sender);
          end;

        finally
          frmMaterialsInEdit.Free;
          frmMaterialsInEdit:=nil;
        end;

    end;
 UpdateGrid(Sender);

end;



procedure TfrmRQBillEdit.actDeleteExecute(Sender: TObject);
Var
  TempRQBillItem: RQBillItemControllerSoapPort;
  TempRQBill: RQBillControllerSoapPort;
  ObjCode: Integer;
begin
  inherited;
  // -------------- tsRQBillItems

  if pcRQBill.ActivePage = tsRQBillItems then
  begin
     TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
       try
         ObjCode := StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]);
       except
       on EConvertError do Exit;
      end;

      selectedItemIndex := sgRQBillItem.Row;

      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити пункт рахунку ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempRQBillItem.remove(ObjCode);
          //UpdateGrid(Sender);
          //pcRQBillChange(Sender);
      end;
  end;
  //-------------------   tsRQBillItems



  pcRQBillChange(Sender);

  if pcRQBill.ActivePage = tsRQBillItems then
  begin
    if sgRQBillItem.RowCount > selectedItemIndex then
      sgRQBillItem.Row := selectedItemIndex
    else
      sgRQBillItem.Row := sgRQBillItem.RowCount - 1;
  end;
end;

procedure TfrmRQBillEdit.actViewExecute(Sender: TObject);
var
  ObjCode: Integer;
  TempRQBillItem: RQBillItemControllerSoapPort;
  TempRQBill: RQBillControllerSoapPort;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
begin
  inherited;
  // -------------- tsRQBillItems
  if pcRQBill.ActivePage = tsRQBillItems then
  begin
    TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
    try
      RQBillItemObj := TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmRQBillItemEdit:=TfrmRQBillItemEdit.Create(Application, dsView);
    try
      //frmRQBillItemEdit.RQBillItemObj := RQBillItemObj;
      frmRQBillItemEdit.ShowModal;
    finally
      frmRQBillItemEdit.Free;
      frmRQBillItemEdit:=nil;
    end;
  end;
  // --------  tsRQBillItems

  // -------------- tsRQFKOrder
  if pcRQBill.ActivePage = tsRQFKOrder then
  begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);

    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    try
      frmRQFKOrderEdit.ShowModal;
    finally
      frmRQFKOrderEdit.Free;
      frmRQFKOrderEdit:=nil;
    end;
  end;
  // END -------------- tsRQFKOrder

end;


procedure TfrmRQBillEdit.actEditExecute(Sender: TObject);
Var
 TempRQBillItem: RQBillItemControllerSoapPort;
begin
  // -------------- tsRQBillItems

  if pcRQBill.ActivePage = tsRQBillItems then
  begin
     TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
       try
         RQBillItemObj := TempRQBillItem.getObject(StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]));
       except
       on EConvertError do Exit;
      end;

      selectedItemIndex := sgRQBillItem.Row;

      frmRQBillItemEdit:=TfrmRQBillItemEdit.Create(Application, dsEdit);
      frmRQBillItemEdit.RQBillObj := RQBillObj;
      try
        frmRQBillItemEdit.ShowModal;
      finally
        frmRQBillItemEdit.Free;
        frmRQBillItemEdit:=nil;
      end;
  end;
  // --------  tsRQBillItems


  pcRQBillChange(Sender);

  if pcRQBill.ActivePage = tsRQBillItems then
  begin
    if sgRQBillItem.RowCount > selectedItemIndex then
      sgRQBillItem.Row := selectedItemIndex
    else
      sgRQBillItem.Row := sgRQBillItem.RowCount - 1;
  end;
end;

procedure TfrmRQBillEdit.actExcellExecute(Sender: TObject);
//var AppPath, FileName: String;
//    OldCursor: TCursor;
//begin
//  OldCursor := Screen.Cursor;
//  try
//    Screen.Cursor := crHourGlass;
//
//    AppPath := ExtractFilePath(Application.ExeName);
//    if not DirectoryExists(AppPath + TempReportsPath) then
//      CreateDir(AppPath + TempReportsPath);
//    FileName := AppPath + TempReportsPath + GetFileName( 'Позиції_рахунку(фільтр)') + '.xls';
//
//    aeExcelBillItem.XLSExport(FileName);
//    ShellExecute(0,
//                 PChar('open'),
//                 PChar(FileName),
//                 nil,
//                 nil,
//                 SW_SHOWMAXIMIZED);
//  finally
//    Screen.Cursor := OldCursor;
//  end;

var
    argNames, args  : ArrayOfString;
begin
  inherited;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'billСode';
  args[0] := IntToStr(RQBillObj.code);

  makeReport('RepOrder/bill_export', argNames, args, 'xls');

end;

procedure TfrmRQBillEdit.FormDestroy(Sender: TObject);
begin
  inherited;
  if assigned(RQBillObj) then RQBillObj.Free;
end;


procedure TfrmRQBillEdit.FormCreate(Sender: TObject);
begin
  selectedItemIndex := 1;
end;


procedure TfrmRQBillEdit.spbRQOrgOrgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   tmpOrg: RQOrg;
   TempRQOrg : RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
   frmRQOrgRschetShow : TfrmRQOrgRschetShow;
   TempRQOrgRschet : RQOrgRschetControllerSoapPort;
begin
{
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if RQBillObj.org = nil then
               begin
                RQBillObj.org := RQOrg.Create();
                SetNullIntProps(RQBillObj.org);
                SetNullXSProps(RQBillObj.org);
               end;

               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);

               RQBillObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               RQBillObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               RQBillObj.org.name := GetReturnValue(sgRQOrg,1);
               RQBillObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               RQBillObj.org.okpo := GetReturnValue(sgRQOrg,2);
               RQBillObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               RQBillObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               RQBillObj.org.adr := GetReturnValue(sgRQOrg,5);
               RQBillObj.org.tel := GetReturnValue(sgRQOrg,6);
               RQBillObj.org.country := GetReturnValue(sgRQOrg,10);
               RQBillObj.org.region := GetReturnValue(sgRQOrg,11);
               RQBillObj.org.ministry := GetReturnValue(sgRQOrg,12);
               RQBillObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               RQBillObj.org.type_ := GetReturnValue(sgRQOrg,14);
               RQBillObj.org.master_code := GetReturnValue(sgRQOrg,15);

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    RQBillObj.org.date_svidet := TXSDate.Create;
                    RQBillObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    RQBillObj.org.likv_date := TXSDate.Create;
                    RQBillObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               RQBillObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               RQBillObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               RQBillObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    RQBillObj.org.date_nalogform := TXSDate.Create;
                    RQBillObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               RQBillObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               RQBillObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               RQBillObj.org.Primechan := GetReturnValue(sgRQOrg,7);



            except
               on EConvertError do Exit;
            end;
        end;

   finally
      frmRQOrgShow.Free;
   end;
}

  if DMReports.selectRQOrg(tmpOrg , AX_CONTRAGENT_TYPE_VENDOR, RQBillObj.org) then
  begin
    RQBillObj.org := tmpOrg;

    edtRQOrgOrgName.Text := RQBillObj.org.name;

    if ( (RQBillObj.org <> nil) and ((RQBillObj.org.id <> LOW_INT) or (RQBillObj.org.axOrgId <> LOW_INT)) ) then
    begin
      frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application,fmNormal);
      try
         frmRQOrgRschetShow.FilterObject := RQOrgRschetFilter.Create;
         SetNullIntProps(frmRQOrgRschetShow.FilterObject);
         SetNullXSProps(frmRQOrgRschetShow.FilterObject);
         RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).orgId := RQBillObj.org.id;
         //RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := RQBillObj.org.codeorg;
         RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := RQBillObj.org.axOrgCode;
         frmRQOrgRschetShow.Caption := 'Розрахункові рахунки';
         DisableActions([frmRQOrgRschetShow.actNoFilter], true);

         with frmRQOrgRschetShow do
            if ShowModal = mrOk then
            begin
                try
                   if RQBillObj.orgRschet = nil then RQBillObj.orgRschet := RQOrgRschet.Create();
                   RQBillObj.orgRschet.bank := RQOrgBank.Create();

                   RQBillObj.orgRschet.id := StrToInt(GetReturnValue(sgRQOrgRschet,0));
                   RQBillObj.orgRschet.mfo := GetReturnValue(sgRQOrgRschet,3);
                   RQBillObj.orgRschet.rschet := GetReturnValue(sgRQOrgRschet,1);

                   RQBillObj.orgRschet.bank.id := StrToInt(GetReturnValue(sgRQOrgRschet,4));
                   RQBillObj.orgRschet.bank.mfo := GetReturnValue(sgRQOrgRschet,3);
                   RQBillObj.orgRschet.bank.name := GetReturnValue(sgRQOrgRschet,2);

                   //////////////////
                   edtRschet.Text := GetReturnValue(sgRQOrgRschet,1);
                   edtMfo.Text := GetReturnValue(sgRQOrgRschet,3);
                   edtBank.Text := GetReturnValue(sgRQOrgRschet,2);
                   //////////////////

                except
                   on EConvertError do Exit;
                end;
            end;
      finally
         frmRQOrgRschetShow.Free;
      end;
    end
    else
    begin
      Application.MessageBox(PChar('Виберіть постачальника!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
      Exit;
    end;
  end;
end;



procedure TfrmRQBillEdit.btnCreateInvoiceClick(Sender: TObject);
var
TempRQFKOrder: RQFKOrderControllerSoapPort;
RQFKOrderObj: RQFKOrder;

TempRQFKOrder2Bill: RQFKOrder2BillControllerSoapPort;
RQFKOrder2BillList: RQFKOrder2BillShortList;
f : RQFKOrder2BillFilter;
{
TempRQInvoice: RQInvoiceControllerSoapPort;
RQInvoiceObj: RQInvoice;
}
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте скласти прибуткову накладну ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    f :=  RQFKOrder2BillFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.billRef := RQBillRef.Create;
    f.billRef.code := RQBillObj.code;
    TempRQFKOrder2Bill := HTTPRIORQFKOrder2Bill as RQFKOrder2BillControllerSoapPort;
    RQFKOrder2BillList := TempRQFKOrder2Bill.getScrollableFilteredList(f, 0, -1);
    if RQFKOrder2BillList.totalCount > 0 then
    begin
      if Application.MessageBox(PChar('З цього рахунку вже складено ' + IntToStr(RQFKOrder2BillList.totalCount) +' накладних ! Скласти ще одну накладну ??'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
        Exit;
      end;
     end;

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    RQFKOrderObj := RQFKOrder.Create();
    {RQFKOrderObj.kind := RQFKOrderKind.Create;
    RQFKOrderObj.kind.code := RQFKORDER_KIND_PRIHOD_POSTAVKA;}
    RQFKOrderObj.code := RQBillObj.code;
    TempRQFKOrder.addPrihod(RQFKOrderObj);
    ShowMEssage('Накладну складено ...');
  end;

    {
  TempRQInvoice := HTTPRIORQInvoice as RQInvoiceControllerSoapPort;
     begin
      RQInvoiceObj := RQInvoice.Create;
      RQInvoiceObj.code := RQBillObj.code;
      RQInvoiceObj.statusRef := RQInvoiceStatusRef.Create;
      RQInvoiceObj.statusRef.code := 1;

      RQInvoiceObj.dateGen:= TXSDate.Create;
      RQInvoiceObj.dateEdit:= TXSDate.Create;

      RQInvoiceObj.numberDoc := 'Auto';
      RQInvoiceObj.numberProject := 'Auto';

      TempRQInvoice.add(RQInvoiceObj);
     end
}     
end;



procedure TfrmRQBillEdit.btnBillImportClick(Sender: TObject);
begin
 //if not Assigned(frmBillImportEdit) then
  frmBillImportEdit := TfrmBillImportEdit.Create(Application, dsInsert);
  try
    frmBillImportEdit.ShowModal;
  finally
    frmBillImportEdit.Free;
  end;
end;


procedure TfrmRQBillEdit.sgRQFKOrderClick(Sender: TObject);
begin
  inherited;
  UpdateItemGrid();
end;


procedure TfrmRQBillEdit.spbContractNumberSelectClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin     
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (RQBillObj.org <> nil) then
   begin
     if (RQBillObj.org.id > LOW_INT) then
       f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(RQBillObj.org.id)
     else
       f.conditionSQL := ' a.io_flag = ''B''';

     if DMReports.UsesMDAXData(CONFIG_USES_MDAX_CONTRACT) then
       f.partnerCode := RQBillObj.org.axOrgCode
     else
       f.partnerCode := RQBillObj.org.codeorg;
   end
   else
   begin
     Application.MessageBox(PChar('Виберіть постачальника!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
     Exit;
   end;

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContractNumber.Text := '№ ' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
                RQBillObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                RQBillObj.contractDate := TXSDate.Create;
                RQBillObj.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
                RQBillObj.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
                RQBillObj.finDocId := StrToInt(GetReturnValue(sgFINServicesObject, 6));

             except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;



procedure TfrmRQBillEdit.btnPrintProxyClick(Sender: TObject);
var
    argNames, args: ArrayOfString;
begin
    if edtCode.Text = '' then exit;

    SetLength(argNames, 1);
    SetLength(args, 1);

    argnames[0] := 'rqbillcode';
    args[0] := edtCode.Text;

    makeReport('ProxyCard/ProxyCard_1st_side', argNames, args, 'xls');
    makeReport('ProxyCard/ProxyCard_2nd_side', argNames, args, 'xls');

end;

procedure TfrmRQBillEdit.edtDateGenChange(
  Sender: TObject);
  var curr_nds : Double;
begin
  inherited;
   // если меняем дату счета то тянем процент ндс который действует в периоде
             curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , edtDateGen.DateTime );
             edtVat.Clear;
             edtVat.AddItem('0',nil);
             edtVat.AddItem(FloatToStr(curr_nds),nil);
             edtVat.ItemIndex := 1;




end;

procedure TfrmRQBillEdit.btnCreatePrihodBufetClick(Sender: TObject);
var
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  RQFKOrderObj : RQFKOrder;
  TempRQFKOrder2Bill : RQFKOrder2BillControllerSoapPort;
  RQFKOrder2BillList : RQFKOrder2BillShortList;
  f : RQFKOrder2BillFilter;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте скласти прибуткову накладну ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then

  begin

    f :=  RQFKOrder2BillFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.billRef := RQBillRef.Create;
    f.billRef.code := RQBillObj.code;
    TempRQFKOrder2Bill := HTTPRIORQFKOrder2Bill as RQFKOrder2BillControllerSoapPort;
    RQFKOrder2BillList := TempRQFKOrder2Bill.getScrollableFilteredList(f, 0, -1);

    if RQFKOrder2BillList.totalCount > 0 then
    begin
      if Application.MessageBox(PChar('З цього рахунку вже складено ' + IntToStr(RQFKOrder2BillList.totalCount) +' накладних ! Скласти ще одну накладну ??'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
        Exit;
      end;
     end;

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    RQFKOrderObj := RQFKOrder.Create();
    RQFKOrderObj.code := RQBillObj.code;
    TempRQFKOrder.addPrihodBufet(RQFKOrderObj);
    ShowMEssage('Накладну складено ...');
  end;

end;

procedure TfrmRQBillEdit.actIncomeSlipExecute(Sender: TObject);
var
    i, eCode : integer;
    state_, isSel : boolean;
    strArrayOfCodes : String;
    argNames, args : ArrayOfString;
begin
  inherited;

  state_ := false;
  isSel := false;

  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'billCode';
  args[0] := IntToStr(RQBillObj.code);

    for i:=1 to sgRQBillItem.RowCount - 1 do
  begin
     sgRQBillItem.GetCheckBoxState(3,i,state_);
     if state_ then
     begin
       isSel := true;
       if Length(strArrayOfCodes) = 0 then
          strArrayOfCodes := sgRQBillItem.Cells[0,i]
       else
          strArrayOfCodes := strArrayOfCodes + ', ' + sgRQBillItem.Cells[0,i];

     end;

  end;

    if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  argNames[1] := 'billItemCodes';
  args[1] := strArrayOfCodes;

  makeReport('warehouseMaterialsMovement/incomeSlipFromBill', argNames, args, 'xls');

end;

procedure TfrmRQBillEdit.actSelectAllExecute(Sender: TObject);
begin
  inherited;
    checkGrid(sgRQBillItem, 3, true);
end;

procedure TfrmRQBillEdit.actChangePaysParamExecute(Sender: TObject);
begin
  inherited;
    frmEditParamPays:=TfrmEditParamPays.Create(Application, dsEdit);
    frmEditParamPays.billitemCode:= StrToInt(sgRQBillItem.Cells[0,sgRQBillItem.Row]);
      try
        frmEditParamPays.ShowModal;
      finally
        frmEditParamPays.Free;
        frmEditParamPays:=nil;
      end;
end;

procedure TfrmRQBillEdit.actClearAllExecute(Sender: TObject);
begin
  inherited;
    checkGrid(sgRQBillItem, 3, false);
end;

procedure TfrmRQBillEdit.actPrintBarCodesExecute(Sender: TObject);
var
    i, eCode : integer;
    state_, isSel : boolean;
    strArrayOfCodes : String;
    argNames, args : ArrayOfString;
    frmBarCodes : TfrmPrintBarCodeByMaterialsEdit;
    matFilter : TKMaterialsFilter;
begin
  inherited;

  state_ := false;
  isSel := false;

  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'billCode';
  args[0] := IntToStr(RQBillObj.code);

    for i:=1 to sgRQBillItem.RowCount - 1 do
  begin
     sgRQBillItem.GetCheckBoxState(3,i,state_);
     if state_ then
     begin
       isSel := true;
       if Length(strArrayOfCodes) = 0 then
          strArrayOfCodes := IntToStr(Integer(sgRQBillItem.Objects[0,i]))
       else
          strArrayOfCodes := strArrayOfCodes + ', ' + IntToStr(Integer(sgRQBillItem.Objects[0,i]));

     end;

  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну строку!!!'), PChar('Увага !'),MB_ICONWARNING);
     Exit;
  end;

  frmBarCodes := TfrmPrintBarCodeByMaterialsEdit.Create(Application, dsInsert);
  begin
      matFilter := TKMaterialsFilter.Create;
      SetNullXSProps(matFilter);
      SetNullIntProps(matFilter);
      matFilter.conditionSQL := 'tk1.code IN (' + strArrayOfCodes + ')';

      btnOk.Enabled := False;

      try
      frmBarCodes.updateTKMaterialsGrid(matFilter);
    frmBarCodes.ShowModal;
    finally
      frmBarCodes.Free;
    end;

  end;
end;
procedure TfrmRQBillEdit.btnCheckMaterialByContractClick(Sender: TObject);
var
    argNames, args: ArrayOfString;
begin
    if edtCode.Text = '' then exit;

    SetLength(argNames, 1);
    SetLength(args, 1);

		argnames[0] := 'billcode';
    args[0] := edtCode.Text;

		makeReport('Tender/CheckMaterialsByContract', argNames, args, 'xls');
		

end;

end.
