
unit EditRQFKOrderItem;                                  

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItemController
  ,RQFKOrderItem2ENEstimateItemController
  , RQFKOrderItemRemainderController, RQFKOrderItem2OSDataController
  ,ENConsts, ExtCtrls  ,FINMaterialsController   , FINMaterialsStatusController,
  AdvObj, tmsAdvGridExcel
  ;

type
  TfrmRQFKOrderItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;
    lblNomenclatureCode : TLabel;
    edtNomenclatureCode: TEdit;
    lblNomenclatureUnitCode : TLabel;
    edtNomenclatureUnitCode: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
  spbTKMaterialsMaterial : TSpeedButton;
  

  HTTPRIORQFKOrderItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblPriceWithNds: TLabel;
    edtPriceWithNds: TEdit;
    lblPriceNds: TLabel;
    edtPriceNds: TEdit;
    gbNomenclature: TGroupBox;
    lblNomenclatureNum: TLabel;
    edtNomenclatureNum: TEdit;
    spbNomenclature: TSpeedButton;
    edtNomenclatureBalSch: TEdit;
    lblNomenclatureBalSch: TLabel;
    lblNomenclatureName: TLabel;
    edtNomenclatureName_: TMemo;
    edtNomenclatureUnitName: TEdit;
    lblNomenclatureUnitName: TLabel;
    edtNomenclatureName: TEdit;
    gbContractInfo: TGroupBox;
    lblContractNumber: TLabel;
    lblContractDate: TLabel;
    lblFinDocCode: TLabel;
    lblFinDocID: TLabel;
    edtContractNumber: TEdit;
    edtContractDate: TDateTimePicker;
    edtFinDocCode: TEdit;
    edtFinDocID: TEdit;
    pcItemData: TPageControl;
    tsEstimate: TTabSheet;
    tsRemainder: TTabSheet;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    sgRQFKOrderItem2ENEstimateItem: TAdvStringGrid;
    sgRQFKOrderItemRemainder: TAdvStringGrid;
    HTTPRIORQFKOrderItemRemainder: THTTPRIO;
    actionInfo: TActionList;
    actViewPlan: TAction;
    HTTPRIOENPlanWork: THTTPRIO;
    actEditRQFKOrderItem2ENEstimateItem: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actRemainderChange: TAction;
    N3: TMenuItem;
    Panel1: TPanel;
    lblCount_: TLabel;
    lblSum_: TLabel;
    lblCount: TLabel;
    Label1: TLabel;
    actExport2Excel: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    lblMaterialNameFullLbl: TLabel;
    edtMaterialNameFull: TMemo;
    tsSCCounterData: TTabSheet;
    scCounterPanel: TPanel;
    lblSourceCode: TLabel;
    lblAccount: TLabel;
    lblExpensesCode: TLabel;
    edtExpensesCode: TComboBox;
    edtAccount: TComboBox;
    edtSourceCode: TComboBox;
    lblCharacters: TLabel;
    lblCounterType: TLabel;
    edtCounterType: TEdit;
    edtCharacters: TMemo;
    btnSCInvoiceSave: TBitBtn;
    btnSCInvoiceCancel: TBitBtn;
    btnSCInvoiceEdit: TBitBtn;
    HTTPRIOSCInvoice: THTTPRIO;
    edtTaxNumber: TEdit;
    lblTaxNumber: TLabel;
    sgENEstimateItem: TAdvStringGrid;
    pnlENEstimateItem: TPanel;
    Label4: TLabel;
    Splitter1: TSplitter;
    HTTPRIOENEstimateItem2ENEstimateItem: THTTPRIO;
    actViewPlanIn: TAction;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    lblNextMatId: TLabel;
    edtNextMatId: TEdit;
    spbNextMatId: TSpeedButton;
    gbGeneral: TGroupBox;
    lblCountGen: TLabel;
    lblPriceWithoutNds: TLabel;
    lblSumWithoutNds: TLabel;
    lblCommentGen: TLabel;
    edtCountGen: TEdit;
    edtPriceWithoutNds: TEdit;
    edtSumWithoutNds: TEdit;
    edtCommentGen: TMemo;
    gbMaterials: TGroupBox;
    lblTKMaterialsMaterialName: TLabel;
    lblMaterialNameTxt: TLabel;
    lblMeasurementNameTxt: TLabel;
    edtMaterialName: TEdit;
    edtMaterialNameTxt: TEdit;
    edtMeasurementNameTxt: TEdit;
    lblMeasurementUnit: TLabel;
    edtMeasurementUnit: TEdit;
    tsDismount: TTabSheet;
    il1: TImageList;
    tlb1: TToolBar;
    btnViewDismount: TToolButton;
    btnInsertDismount: TToolButton;
    btnDeleteDismount: TToolButton;
    actViewDismount: TAction;
    actInsertDismount: TAction;
    actDeleteDismount: TAction;
    sgDismount: TAdvStringGrid;
    spl1: TSplitter;
    gbFINUnmount: TGroupBox;
    sgFINUnmount: TAdvStringGrid;
    HTTPRIOFINMaterials: THTTPRIO;
    spbContractNumberSelect: TSpeedButton;
    tsTwoUnits: TTabSheet;
    lblMeasurementTwoUnits: TLabel;
    edtMeasurementTwoUnits: TEdit;
    lblCountTwoUnits: TLabel;
    edtCountTwoUnits: TEdit;
    lblPriceTwoUnits: TLabel;
    edtPriceTwoUnits: TEdit;
    btnTKMeasurementTkMeasurement: TSpeedButton;
    btnEPRenClear: TSpeedButton;
    tsOSData: TTabSheet;
    edtOSIst: TEdit;
    spbOSIst: TSpeedButton;
    edtOSSubsch: TEdit;
    spbOSSubsch: TSpeedButton;
    edtOSVid: TEdit;
    spbOSVid: TSpeedButton;
    edtOSPrivat: TEdit;
    spbOSPrivat: TSpeedButton;
    edtOSGr: TEdit;
    spbOSGr: TSpeedButton;
    edtOSKlass: TEdit;
    spbOSKlass: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtOSIstCode: TEdit;
    edtOSSubschCode: TEdit;
    edtOSVidCode: TEdit;
    edtOSPrivatCode: TEdit;
    edtOSGrCode: TEdit;
    edtOSKlassCode: TEdit;
    spbOSIstClear: TSpeedButton;
    spbOSSubschClear: TSpeedButton;
    spbOSVidClear: TSpeedButton;
    spbOSPrivatClear: TSpeedButton;
    spbOSGrClear: TSpeedButton;
    spbOSKlassClear: TSpeedButton;
    btnOSDataEdit: TBitBtn;
    btnOSDataSave: TBitBtn;
    btnOSDataCancel: TBitBtn;
    HTTPRIORQFKOrderItem2OSData: THTTPRIO;
    rdbOSF_amortY: TRadioButton;
    rdbOSF_amortN: TRadioButton;
    Label7: TLabel;
    Label10: TLabel;
    edtOSSum_izn_perv: TEdit;
    Label11: TLabel;
    edtOSSum_izn_perv_n: TEdit;
    dtpOSDt_vypusk: TDateTimePicker;
    Label12: TLabel;
    Label13: TLabel;
    edtOSKod_zatr: TEdit;
    Label14: TLabel;
    edtOSKod_oborud: TEdit;
    Label15: TLabel;
    edtOSPrimechan: TEdit;
    memOSCharacters: TMemo;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtOSNum_un: TEdit;
    edtOSKod_inv: TEdit;
    lblSumGen: TLabel;
    edtSumGen: TEdit;
    lblSumNds: TLabel;
    edtSumNds: TEdit;
    Label19: TLabel;
    edtOSKod_nal_nakl: TEdit;
    Label20: TLabel;
    edtOSSum_st_perv_n: TEdit;
    lblSellingPriceWithoutNds: TLabel;
    edtSellingPriceWithoutNds: TEdit;
    lblSellingSumWithoutNds: TLabel;
    edtSellingSumWithoutNds: TEdit;
    tsMain: TTabSheet;
    lblRQStorageZone: TLabel;
    edtRQStorageZone: TEdit;
    spbRQStorageZone: TSpeedButton;
    HTTPRIORQStorageZone: THTTPRIO;
    spbRQStorageZoneClear: TSpeedButton;
    lblDateRealiz: TLabel;
    edtDateRealiz: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    aeExcel: TAdvGridExcelIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbTKMaterialsMaterialClick(Sender : TObject);
  procedure spbNomenclatureClick(Sender: TObject);
  procedure edtCountGenChange(Sender: TObject);

   procedure updateEstimateItemGrid_();
   procedure updateRemainderGrid();
   procedure updateSCCounterTab();

   /// 24.10.11
   procedure updateEstimateItemInGrid();
   ///

    // 14.06.12 NET-801
    procedure updateOSDataTab();
    procedure LockUnlockOSData(lock: Boolean = true);

    procedure pcItemDataChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actEditRQFKOrderItem2ENEstimateItemExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actRemainderChangeExecute(Sender: TObject);
    procedure actExport2ExcelExecute(Sender: TObject);
    procedure btnSCInvoiceEditClick(Sender: TObject);
    procedure btnSCInvoiceCancelClick(Sender: TObject);
    procedure btnSCInvoiceSaveClick(Sender: TObject);
    procedure sgRQFKOrderItem2ENEstimateItemClick(Sender: TObject);
    procedure actViewPlanInExecute(Sender: TObject);
    procedure spbNextMatIdClick(Sender: TObject);
    procedure actViewDismountExecute(Sender: TObject);
    procedure actInsertDismountExecute(Sender: TObject);
    procedure UpdateGrid(Sender: TObject);
    procedure updateDismountGrid();
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure updateFINMaterialsGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid );
    procedure actDeleteDismountExecute(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure btnTKMeasurementTkMeasurementClick(Sender: TObject);
    procedure btnEPRenClearClick(Sender: TObject);
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
    procedure FormDestroy(Sender: TObject);
    procedure btnOSDataSaveClick(Sender: TObject);
    procedure btnOSDataEditClick(Sender: TObject);
    procedure btnOSDataCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pcItemDataChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edtSumWithoutNdsChange(Sender: TObject);
    procedure edtSellingPriceWithoutNdsChange(Sender: TObject);
    procedure spbRQStorageZoneClick(Sender: TObject);
    procedure spbRQStorageZoneClearClick(Sender: TObject);

  private
    { Private declarations }
    OSData: RQFKOrderItem2OSData;
    AllowClose: Boolean;
    function isRQFKOrderForStorage(orderKindCode : Integer) : Boolean;
  public
    { Public declarations }
    kindCode, storageCode : Integer;
    accountingType : Integer;
    statusCode, orgID : Integer;
    codeOrg: String;
    numberDoc: String;
    molOutCode: String;
  end;

var
  frmRQFKOrderItemEdit: TfrmRQFKOrderItemEdit;
  RQFKOrderItemObj: RQFKOrderItem;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
, ShowTmaterial, TmaterialController//, ENEstimateItemController
, ENPlanWorkController, DMReportsUnit, EditENPlanWork,
  EditRQFKOrderItem2ENEstimateItem, ENEstimateItemController,
  ShowRQFKOrderItem2ENEstimateItem, ShowENDepartment,
  ENDepartmentController, ENDistanceTypeController,
  ENDepartmentTypeController, EditRQFKOrderItemRemainder,
  SCInvoiceController, ENEstimateItem2ENEstimateItemController,
  ENPlanWorkKindController, ShowFINServicesObject, ENServicesObjectController , EditENEstimateItem , ENEstimateItemKindController ,
   ShowTKMeasurement
  ,TKMeasurementController, ShowOSGr, ShowOSIst, ShowOSKlass, ShowOSPrivat,
  ShowOSSubsch, ShowOSVid, OSIstController, OSSubschController,
  OSPrivatController, ShowRQStorageZone, RQStorageZoneController,
  RQStorageZone2TKMaterialsController, Globals , ShellAPI;

{uses
    EnergyproController, EnergyproController2, RQFKOrderItemController ;
}


{$R *.dfm}

var
  {
  ENEstimateItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'

          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );
  }
  ENEstimateItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Дата поч.робіт'
          ,'Підрозділ'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'

          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );


  RQFKOrderItem2ENEstimateItemHeaders: array [1..11] of String =
        ( 'Код матеріала з Плану'
          ,'Матеріал (план)'
          ,'Од.вим.(план)'
          ,'Кіл-сть у плані'
          ,'Матеріал (факт)'
          ,'Од.вим.(факт)'
          ,'Кіл-сть(факт)'
          //,'Ціна без ПДВ'
          ,'Сума без ПДВ'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Період вик.робіт'
        );

  RQFKOrderItemRemainderHeaders: array [1..6] of String =
        ( 'Код'
          ,'Назва матеріалу з Накладної'
          ,'кількість у заявці'
          ,'ціна без ПДВ'
          ,'сума без ПДВ'
          ,'Бюджетотримач'
        );

  ENDismountItemHeaders: array [1..8] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість'
          ,'Од. виміру'
          ,'Код роботи'
          ,'Робота'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

          FINMaterialsShortHeaders: array [1..15] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'МОЛ'
          ,'Призначення залишку'
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код партії'
          //,'тип строки кошторису'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );


procedure TfrmRQFKOrderItemEdit.FormShow(Sender: TObject);
var TempRQStorageZone: RQStorageZoneControllerSoapPort;
    storageZone: RQStorageZone;
    storageZoneFilter: RQStorageZoneFilter;
    storageZoneList: RQStorageZoneShortList;
    isStorageZoneSet: Boolean;
begin

  // 25.07.2012 +++ прячем отпукную цену и стоимость
  HideControls([lblSellingPriceWithoutNds, lblSellingSumWithoutNds,
      edtSellingPriceWithoutNds, edtSellingSumWithoutNds]);

  if accountingType in [TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO] then
  DisableActions([actEditRQFKOrderItem2ENEstimateItem]);

  // полочим поля справочников ...
 //  DisableControls([edtNomenclatureCode, edtNomenclatureBalSch, edtNomenclatureUnitCode, edtNomenclatureUnitName
	DisableControls([edtNomenclatureCode, edtNomenclatureUnitCode, edtNomenclatureUnitName
      , edtMaterialName, edtMeasurementUnit
			,edtCountGen
      //,edtPriceWithoutNds
			,edtPriceWithNds
      ,edtPriceNds
      //,edtSumWithoutNds
      ,edtSumNds
      ,edtSumGen
      , edtNomenclatureName, edtNomenclatureUnitName
      , edtCode
      , edtContractNumber, edtContractDate, edtFinDocCode
      , edtMaterialNameTxt, edtMeasurementNameTxt
      , edtNomenclatureNum
      , edtNextMatId
      , edtMeasurementTwoUnits

      ,edtOSIstCode, edtOSIst
      ,edtOSSubschCode, edtOSSubsch
      ,edtOSVidCode, edtOSVid
      ,edtOSPrivatCode, edtOSPrivat
      ,edtOSGrCode, edtOSGr
      ,edtOSKlassCode, edtOSKlass
      ,rdbOSF_amortY, rdbOSF_amortN
      ,dtpOSDt_vypusk
      ,edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n
      ,edtOSKod_zatr, edtOSKod_oborud
      ,edtOSPrimechan, memOSCharacters
      ,edtOSKod_nal_nakl

      ,edtOSNum_un, edtOSKod_inv

      ,edtRQStorageZone

      //, edtNomenclatureBalSch // SUPP-91184  // SUPP-104475
   ]);

   SetFloatStyle([edtCountGen, edtSumWithoutNds, edtPriceWithoutNds, edtCountTwoUnits, edtPriceTwoUnits,
                  edtSumNds, edtSumGen,
                  edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n,
                  edtSellingPriceWithoutNds, edtSellingSumWithoutNds]);
   SetIntStyle(edtOSKlassCode);

   // 24.07.2013 нужно показывать для приходных ордеров буфет дату реализации 
	 if ( kindCode = RQFKORDER_KIND_PRIHOD_BUFET ) then
			HideControls([lblDateRealiz , edtDateRealiz],false)
	 else
			HideControls([lblDateRealiz , edtDateRealiz]);


	 HideControls([spbContractNumberSelect], True);
	 HideControls([pcItemData], DialogState = dsInsert);
   HideControls([gbContractInfo], (not ((kindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (kindCode = RQFKORDER_KIND_PRIHOD_BUFET))));
   // прячем вкладку с альтернативной единицей измерения если не обычный расходный ордер
   HideControls([tsTwoUnits], kindCode <> RQFKORDER_KIND_RASHOD_OE2REM );
	 if  ((RQFKORDER_KIND_RASHOD_OE2REM <> kindCode) or (accountingType = TK_ACCOUNTINGTYPE_COUNTER ))  then
				tsTwoUnits.TabVisible := False;

   // 11.05.2017 Прячем вообще эту хрень!!!
   tsTwoUnits.TabVisible := False;

   // прячем вкладку демонтированых материалов если не списание счетчиков
	 if  RQFKORDER_KIND_WRITEOFFCOUNTERS <> kindCode then
        tsDismount.TabVisible := False;

   /////
   // Вкладка Бух. дані для ОЗ доступна только для прихода основных средств
   tsOSData.TabVisible := (kindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA) and (accountingType = TK_ACCOUNTINGTYPE_OS) and
                          (statusCode <> RQFKORDER_STATUS_GOOD);
                          {and ((HTTPRIORQFKOrderItem.HTTPWebNode.UserName = 'energynet') or
                               (HTTPRIORQFKOrderItem.HTTPWebNode.UserName = 'SofyanikIP')); // пока только для себя и для Ирины Павловны ;)}

   if (kindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA) and (accountingType = TK_ACCOUNTINGTYPE_OS) {and
      ((HTTPRIORQFKOrderItem.HTTPWebNode.UserName = 'energynet') or
       (HTTPRIORQFKOrderItem.HTTPWebNode.UserName = 'SofyanikIP')) } then
   begin
     HideControls([lblSumNds, lblSumGen, edtSumNds, edtSumGen], false);
     if DialogState = dsEdit then
       DisableControls([edtSumNds, edtSumGen], false);
       
     // HideControls([gbNomenclature]);
     // lblNomenclatureNum.Caption := 'Інв. №';
     DisableControls([spbNomenclature]);
   end;

   // Редактировать бух. данные даем только для ордеров в статусе "Складений"
   DisableControls([btnOSDataEdit], not (statusCode in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE]));
   /////

   if (kindCode = RQFKORDER_KIND_OS_EXPL) then
   begin
     lblNomenclatureNum.Caption := 'Інв. №';
     DisableControls([spbNomenclature]);
   end;

   pcItemData.ActivePage := tsEstimate;
   tsMain.TabVisible := false;

// NET-3102
////////////////////////////////////////////////////////////////////////////////
// !!!!!!!! для складов убрать коммент !!!!!!!

   if (isRQFKOrderForStorage(kindCode)) then
   begin
     tsMain.TabVisible := true;
     pcItemData.ActivePage := tsMain;
   end;

////////////////////////////////////////////////////////////////////////////////

   HideControls([lblCommentGen, edtCommentGen], ((kindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA) or (kindCode = RQFKORDER_KIND_PRIHOD_BUFET)));

   {11.11.2011 - Спрячем контроли для акта перевода единицы измерения}
   HideControls([lblNextMatId, edtNextMatId, spbNextMatId], (kindCode <> RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE));

   SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

   tsSCCounterData.TabVisible := False;

   if accountingType = TK_ACCOUNTINGTYPE_COUNTER then
   begin
       tsSCCounterData.TabVisible := True;
   end;


   // 18.01.2012 +++ нужное/ненужное для Услуг со сторони
   if (kindCode = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
   begin
     HideControls([gbNomenclature]);
     HideControls([gbContractInfo], false);
     gbGeneral.Top := 3;
     tsEstimate.Caption := 'Послуги на планах';
     tsRemainder.Caption := 'Послуги без планів';
     gbMaterials.Left := 9;
     gbMaterials.Top := 160;
     btnOk.Top := 292;
     btnCancel.Top := 292;
   end;



  if DialogState = dsView then
  begin
  //     DisableControls([
    DisableControls([
      edtMaterialName
      ,spbTKMaterialsMaterial
      ,spbNomenclature
      ,spbNextMatId
      ,btnTKMeasurementTkMeasurement
      ,spbRQStorageZone
			,spbRQStorageZoneClear
			,edtDateRealiz
       ]);
    DisableActions([actEditRQFKOrderItem2ENEstimateItem, actRemainderChange]);
  end;


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      //edtCountGen,
      edtPriceWithoutNds
      ,edtPriceWithNds
      ,edtPriceNds
      //,edtSumWithoutNds
      ,edtSumNds
      ,edtSumGen
      , edtSellingPriceWithoutNds
      , edtSellingSumWithoutNds
     ]);

     DenyBlankValues([edtOSIstCode, edtOSSubschCode, edtOSVidCode, edtOSPrivatCode, edtOSGrCode, edtOSKod_nal_nakl, edtOSSum_st_perv_n]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

		// дата реализации
		if RQFKOrderItemObj.dateRealiz <> nil then
			begin
				edtDateRealiz.DateTime:=EncodeDate(RQFKOrderItemObj.dateRealiz.Year,RQFKOrderItemObj.dateRealiz.Month,RQFKOrderItemObj.dateRealiz.Day);
				edtDateRealiz.checked := true;
      end
      else
			begin
				edtDateRealiz.DateTime:=SysUtils.Date;
				edtDateRealiz.checked := false;
			end;
		//
    tsRemainder.TabVisible :=  (kindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA);

    HideControls([pnlENEstimateItem, sgENEstimateItem, Splitter1], (kindCode <> RQFKORDER_KIND_RASHOD_E2E));

    { Задизаблим кнопку выбора номенклатур, при актах перевода единиц измереия}
    if kindCode = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
          DisableControls([spbNomenclature]);

    // 26.02.2012 +++ изменение номера договора
    // только для услуг со стороны, при условии, что его небыло в плане и заявке
    if (kindCode = RQFKORDER_KIND_SERVICES_FROM_SIDE) and (DialogState = dsEdit) then
    begin
      if (RQFKOrderItemObj.finDocID = LOW_INT) then
         HideControls([spbContractNumberSelect], False);
    end;


    edtCode.Text := IntToStr(RQFKOrderItemObj.code);
    if ( RQFKOrderItemObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(RQFKOrderItemObj.finCode)
    else
       edtFinCode.Text := '';

    if ( RQFKOrderItemObj.nomenclatureCode <> Low(Integer) ) then
       edtNomenclatureCode.Text := IntToStr(RQFKOrderItemObj.nomenclatureCode)
    else
       edtNomenclatureCode.Text := '';

    edtNomenclatureNum.Text := RQFKOrderItemObj.nomenclatureNum;
    edtNomenclatureBalSch.Text := RQFKOrderItemObj.nomenclatureBalSch;

    //MakeMultiline(edtNomenclatureName.Lines, RQFKOrderItemObj.nomenclatureName);
    edtNomenclatureName.Text := RQFKOrderItemObj.nomenclatureName;

    if ( RQFKOrderItemObj.nomenclatureUnitCode <> Low(Integer) ) then
       edtNomenclatureUnitCode.Text := IntToStr(RQFKOrderItemObj.nomenclatureUnitCode)
    else
       edtNomenclatureUnitCode.Text := '';
    edtNomenclatureUnitName.Text := RQFKOrderItemObj.nomenclatureUnitName;


    edtContractNumber.Text := RQFKOrderItemObj.contractNumber;
      if RQFKOrderItemObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(RQFKOrderItemObj.contractDate.Year,RQFKOrderItemObj.contractDate.Month,RQFKOrderItemObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;
    edtFinDocCode.Text := RQFKOrderItemObj.finDocCode;
    if ( RQFKOrderItemObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(RQFKOrderItemObj.finDocID)
    else
       edtFinDocID.Text := '';


    edtMaterialNameTxt.Text := RQFKOrderItemObj.materialNameTxt;
    edtMeasurementNameTxt.Text := RQFKOrderItemObj.measurementNameTxt;

    if ( RQFKOrderItemObj.countGen <> nil ) then
       edtCountGen.Text := RQFKOrderItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    if ( RQFKOrderItemObj.priceWithoutNds <> nil ) then
       edtPriceWithoutNds.Text := RQFKOrderItemObj.priceWithoutNds.decimalString
    else
       edtPriceWithoutNds.Text := '';
    if ( RQFKOrderItemObj.priceWithNds <> nil ) then
       edtPriceWithNds.Text := RQFKOrderItemObj.priceWithNds.decimalString
    else
       edtPriceWithNds.Text := '';
    if ( RQFKOrderItemObj.priceNds <> nil ) then
       edtPriceNds.Text := RQFKOrderItemObj.priceNds.decimalString
    else
       edtPriceNds.Text := '';
    if ( RQFKOrderItemObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQFKOrderItemObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := '';
    if ( RQFKOrderItemObj.sumNds <> nil ) then
       edtSumNds.Text := RQFKOrderItemObj.sumNds.decimalString
    else
       edtSumNds.Text := '';
    if ( RQFKOrderItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQFKOrderItemObj.sumGen.decimalString
    else
       edtSumGen.Text := '';


      if RQFKOrderItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQFKOrderItemObj.dateEdit.Year,RQFKOrderItemObj.dateEdit.Month,RQFKOrderItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
    edtUserGen.Text := RQFKOrderItemObj.userGen;

    // NET-308 - длинное название ...
    if Length(RQFKOrderItemObj.material.name) > 255 then
    begin
      edtMaterialName.Text := Copy(RQFKOrderItemObj.material.name, 0, 255);
      MakeMultiline(edtMaterialNameFull.Lines, RQFKOrderItemObj.material.name);
      DisableControls([edtMaterialNameFull]);
    end
    else
    begin
      edtMaterialName.Text := RQFKOrderItemObj.material.name;
      HideControls([lblMaterialNameFullLbl, edtMaterialNameFull]);
    end;

    edtMeasurementUnit.Text :=  RQFKOrderItemObj.material.measurement.name;

    MakeMultiline(edtCommentGen.Lines, RQFKOrderItemObj.commentGen);

    pcItemDataChange(Sender);

    if kindCode = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
    begin
      edtNextMatId.Text := RQFKOrderItemObj.next_mat_name;
    end;

    edtMeasurementTwoUnits.Text := RQFKOrderItemObj.measurementTwoUnits;
    if ( RQFKOrderItemObj.countTwoUnits <> nil ) then
       edtCountTwoUnits.Text := RQFKOrderItemObj.countTwoUnits.decimalString
    else
       edtCountTwoUnits.Text := '';
    if ( RQFKOrderItemObj.priceTwoUnits <> nil ) then
       edtPriceTwoUnits.Text := RQFKOrderItemObj.priceTwoUnits.decimalString
    else
       edtPriceTwoUnits.Text := '';

    /////////// 26.07.2012 +++ отпускная цена и стоимость
    if (RQFKOrderItemObj.sellingPriceWithoutNds <> nil) then
       edtSellingPriceWithoutNds.Text := RQFKOrderItemObj.sellingPriceWithoutNds.decimalString
    else
       edtSellingPriceWithoutNds.Text := '';
    if (RQFKOrderItemObj.sellingCostWithoutNds <> nil) then
       edtSellingSumWithoutNds.Text := RQFKOrderItemObj.sellingCostWithoutNds.decimalString
    else
       edtSellingSumWithoutNds.Text := '';

    if (kindCode = RQFKORDER_KIND_SALE_PRODUCTS) then
    begin
      HideControls([lblSellingPriceWithoutNds, lblSellingSumWithoutNds,
            edtSellingPriceWithoutNds, edtSellingSumWithoutNds], False);

      // NET-3866.. +++ ставят чё попало.....      
      DisableControls([edtSellingSumWithoutNds]);

      HideControls([lblPriceWithoutNds, lblSumWithoutNds,
            edtPriceWithoutNds, edtSumWithoutNds], True);

      lblPriceWithoutNds.Left := 368;
      lblSumWithoutNds.Left := 368;
      edtPriceWithoutNds.Left := 497;
      edtSumWithoutNds.Left := 497;

      lblSellingPriceWithoutNds.Left := 8;
      lblSellingSumWithoutNds.Left := 8;
      edtSellingPriceWithoutNds.Left := 132;
      edtSellingSumWithoutNds.Left := 132;
      edtCountGen.Left := 132;
      edtCommentGen.Left := 132;

    end;
    /////////////////

     if isRQFKOrderForStorage(kindCode) then
     begin
       isStorageZoneSet := false;

       TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;

       if RQFKOrderItemObj.zoneRef <> nil then
         if RQFKOrderItemObj.zoneRef.code <> LOW_INT then
         begin
           storageZone := TempRQStorageZone.getObject(RQFKOrderItemObj.zoneRef.code);

           if storageZone = nil then
           begin
             Application.MessageBox(PChar('Неможливо визначити місце зберігання!'), PChar('Помилка!'), MB_ICONERROR);
             Exit;
           end;

           if storageZone.storage = nil then
           begin
             Application.MessageBox(PChar('Неможливо визначити місце зберігання!'), PChar('Помилка!'), MB_ICONERROR);
             Exit;
           end;

           isStorageZoneSet := true;
           edtRQStorageZone.Text := storageZone.storage.name + '. ' +
                                    storageZone.name;
         end;

         // Если зона хранения не задана, на редактировании строки пытаемся определить
         // ее автоматом - по связке мест хранения с нормативными материалами
         if (DialogState = dsEdit) and (not isStorageZoneSet) then
         begin
           storageZoneFilter := RQStorageZoneFilter.Create;
           SetNullIntProps(storageZoneFilter);
           SetNullXSProps(storageZoneFilter);

           storageZoneFilter.conditionSQL :=
              ' rqstoragezone.code in ' +
              ' (select z.code ' +
              '  from rqstoragezone z, rqstorage2enmol sm, enmol m, rqstoragezone2tkmatrls zm ' +
              '  where z.storagecode = sm.storagerefcode ' +
              '    and sm.molrefcode = m.code ' +
              '    and m.fincode = ''' + molOutCode + ''' ' +
              '    and zm.zonerefcode = z.code ' +
              '    and zm.materialrefcode = ' + IntToStr(RQFKOrderItemObj.material.code) + ') ';

           storageZoneList := TempRQStorageZone.getScrollableFilteredList(storageZoneFilter, 0, -1);

           if storageZoneList.totalCount > 0 then
           begin
             if RQFKOrderItemObj.zoneRef = nil then RQFKOrderItemObj.zoneRef := RQStorageZoneRef.Create();
             RQFKOrderItemObj.zoneRef.code := storageZoneList.list[0].code;
             edtRQStorageZone.Text := storageZoneList.list[0].storageName + '. ' +
                                      storageZoneList.list[0].name;
           end;
         end; // if (DialogState = dsEdit) and (not isStorageZoneSet)

     end;
  end;
end;



procedure TfrmRQFKOrderItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([

      edtCountGen
      ,edtPriceWithoutNds
      ,edtPriceWithNds
      ,edtPriceNds
      ,edtSumWithoutNds
      ,edtSumNds
      ,edtSumGen

     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end

  else if ((kindCode = RQFKORDER_KIND_SALE_PRODUCTS)
             and (not NoBlankValues([edtSellingPriceWithoutNds, edtSellingSumWithoutNds]))) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end  

  else
  begin
    TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;


     if ( edtFinCode.Text <> '' ) then
       RQFKOrderItemObj.finCode := StrToInt(edtFinCode.Text)
     else
       RQFKOrderItemObj.finCode := Low(Integer) ;

     if ( edtNomenclatureCode.Text <> '' ) then
       RQFKOrderItemObj.nomenclatureCode := StrToInt(edtNomenclatureCode.Text)
     else
       RQFKOrderItemObj.nomenclatureCode := Low(Integer) ;

     RQFKOrderItemObj.nomenclatureNum := edtNomenclatureNum.Text; 

     RQFKOrderItemObj.nomenclatureBalSch := edtNomenclatureBalSch.Text; 

     RQFKOrderItemObj.nomenclatureName := edtNomenclatureName.Text; 

     if ( edtNomenclatureUnitCode.Text <> '' ) then
       RQFKOrderItemObj.nomenclatureUnitCode := StrToInt(edtNomenclatureUnitCode.Text)
     else
       RQFKOrderItemObj.nomenclatureUnitCode := Low(Integer) ;

     RQFKOrderItemObj.nomenclatureUnitName := edtNomenclatureUnitName.Text;

      RQFKOrderItemObj.contractNumber := edtContractNumber.Text; 

     if edtcontractDate.checked then
     begin 
       if RQFKOrderItemObj.contractDate = nil then
          RQFKOrderItemObj.contractDate := TXSDate.Create;
       RQFKOrderItemObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       RQFKOrderItemObj.contractDate := nil;

     RQFKOrderItemObj.finDocCode := edtFinDocCode.Text; 

     if ( edtFinDocID.Text <> '' ) then
       RQFKOrderItemObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       RQFKOrderItemObj.finDocID := Low(Integer) ;

     RQFKOrderItemObj.materialNameTxt := edtMaterialNameTxt.Text; 

     RQFKOrderItemObj.measurementNameTxt := edtMeasurementNameTxt.Text; 

     if (RQFKOrderItemObj.countGen = nil ) then
       RQFKOrderItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKOrderItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQFKOrderItemObj.countGen := nil;

     if (RQFKOrderItemObj.priceWithoutNds = nil ) then
       RQFKOrderItemObj.priceWithoutNds := TXSDecimal.Create;
     if edtPriceWithoutNds.Text <> '' then
       RQFKOrderItemObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text 
     else
       RQFKOrderItemObj.priceWithoutNds := nil;

     if (RQFKOrderItemObj.priceWithNds = nil ) then
       RQFKOrderItemObj.priceWithNds := TXSDecimal.Create;
     if edtPriceWithNds.Text <> '' then
       RQFKOrderItemObj.priceWithNds.decimalString := edtPriceWithNds.Text 
     else
       RQFKOrderItemObj.priceWithNds := nil;

     if (RQFKOrderItemObj.priceNds = nil ) then
       RQFKOrderItemObj.priceNds := TXSDecimal.Create;
     if edtPriceNds.Text <> '' then
       RQFKOrderItemObj.priceNds.decimalString := edtPriceNds.Text
     else
       RQFKOrderItemObj.priceNds := nil;

     if (RQFKOrderItemObj.sumWithoutNds = nil ) then
       RQFKOrderItemObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQFKOrderItemObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text
     else
       RQFKOrderItemObj.sumWithoutNds := nil;

     if (RQFKOrderItemObj.sumNds = nil ) then
       RQFKOrderItemObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       RQFKOrderItemObj.sumNds.decimalString := edtSumNds.Text
     else
       RQFKOrderItemObj.sumNds := nil;

     if (RQFKOrderItemObj.sumGen = nil ) then
       RQFKOrderItemObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       RQFKOrderItemObj.sumGen.decimalString := edtSumGen.Text
     else
       RQFKOrderItemObj.sumGen := nil;

     if edtdateEdit.checked then
     begin 
       if RQFKOrderItemObj.dateEdit = nil then
          RQFKOrderItemObj.dateEdit := TXSDate.Create;
       RQFKOrderItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQFKOrderItemObj.dateEdit := nil;

     RQFKOrderItemObj.userGen := edtUserGen.Text;

     RQFKOrderItemObj.commentGen := edtCommentGen.Text;

     RQFKOrderItemObj.measurementTwoUnits := edtMeasurementTwoUnits.Text; 
                              
     if (RQFKOrderItemObj.countTwoUnits = nil ) then
       RQFKOrderItemObj.countTwoUnits := TXSDecimal.Create;
     if edtCountTwoUnits.Text <> '' then
       RQFKOrderItemObj.countTwoUnits.decimalString := edtCountTwoUnits.Text
     else
       RQFKOrderItemObj.countTwoUnits := nil;

     if (RQFKOrderItemObj.priceTwoUnits = nil ) then
       RQFKOrderItemObj.priceTwoUnits := TXSDecimal.Create;
     if edtPriceTwoUnits.Text <> '' then
       RQFKOrderItemObj.priceTwoUnits.decimalString := edtPriceTwoUnits.Text
     else
       RQFKOrderItemObj.priceTwoUnits := nil;


     if (RQFKOrderItemObj.sellingPriceWithoutNds = nil ) then
       RQFKOrderItemObj.sellingPriceWithoutNds := TXSDecimal.Create;
     if edtSellingPriceWithoutNds.Text <> '' then
       RQFKOrderItemObj.sellingPriceWithoutNds.decimalString := edtSellingPriceWithoutNds.Text
     else
       RQFKOrderItemObj.sellingPriceWithoutNds := nil;

     if (RQFKOrderItemObj.sellingCostWithoutNds = nil ) then
       RQFKOrderItemObj.sellingCostWithoutNds := TXSDecimal.Create;
     if edtSellingSumWithoutNds.Text <> '' then
       RQFKOrderItemObj.sellingCostWithoutNds.decimalString := edtSellingSumWithoutNds.Text
     else
			 RQFKOrderItemObj.sellingCostWithoutNds := nil;

			 if edtDateRealiz.checked then
     begin 
			 if RQFKOrderItemObj.dateRealiz = nil then
					RQFKOrderItemObj.dateRealiz := TXSDate.Create;
			 RQFKOrderItemObj.dateRealiz.XSToNative(GetXSDate(edtDateRealiz.DateTime));
		 end
		 else
			 RQFKOrderItemObj.dateRealiz := nil;
              

    if DialogState = dsInsert then
    begin
      RQFKOrderItemObj.code:=low(Integer);
      TempRQFKOrderItem.add(RQFKOrderItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
    if kindcode = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
        TempRQFKOrderItem.saveMeasurementChange(RQFKOrderItemObj)
      else
        TempRQFKOrderItem.save(RQFKOrderItemObj);
    end;
  end;
end;


procedure TfrmRQFKOrderItemEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               //if RQFKOrderItemObj.material = nil then RQFKOrderItemObj.material := TKMaterials.Create();
               //RQFKOrderItemObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;



procedure TfrmRQFKOrderItemEdit.spbNomenclatureClick(Sender: TObject);
var
   frmTmaterialShow: TfrmTmaterialShow;
   nomFilter : TmaterialFilter;
   axInventItemGroupId: String;
   TempTKMaterials: TKMaterialsControllerSoapPort;
   inventItemGroupList: AXInventItemGroupShortList;
begin

   nomFilter := TmaterialFilter.Create;
   SetNullIntProps(nomFilter);
   SetNullXSProps(nomFilter);

   // нет такого поля .. вернее оно не обрабатываеться ;) nomFilter.status := 'A';

   nomFilter.status := 'A'; // Чтобы корректно работал фильтр в AX
   nomFilter.conditionSQL := 'UMC_DBA.TMATHERIAL.STATUS = ''A''';
   nomFilter.orderBySQL := 'UMC_DBA.TMATHERIAL.NAME';
   
   frmTmaterialShow:=TfrmTmaterialShow.Create(Application,fmNormal, nomFilter);
   try
      frmTmaterialShow.ShowFilter := true;
      
      with frmTmaterialShow do
        if ShowModal = mrOk then
        begin

            try
               //if RQFKOrderItemObj. = nil then RQFKOrderItemObj.material := TKMaterials.Create();
                RQFKOrderItemObj.nomenclatureCode := StrToInt(GetReturnValue(frmTmaterialShow.sgTmaterial,0));
                RQFKOrderItemObj.nomenclatureNum := GetReturnValue(frmTmaterialShow.sgTmaterial,1);

                // Если есть код группы номенклатур из AX, то мы должны выбрать бал. счет из группы
                axInventItemGroupId := GetReturnValue(frmTmaterialShow.sgTmaterial, 11);
                if axInventItemGroupId <> '' then
                begin
                  TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

                  inventItemGroupList := TempTKMaterials.getAXInventItemGroupList(axInventItemGroupId);

                  if inventItemGroupList <> nil then
                      if inventItemGroupList.list <> nil then
                        if inventItemGroupList.totalCount > 0 then
                          if inventItemGroupList.list[0] <> nil then
                            RQFKOrderItemObj.nomenclatureBalSch := inventItemGroupList.list[0].inventProfileId;
                end
                else
                  RQFKOrderItemObj.nomenclatureBalSch := GetReturnValue(frmTmaterialShow.sgTmaterial,2);

                RQFKOrderItemObj.nomenclatureName := GetReturnValue(frmTmaterialShow.sgTmaterial,3);
                RQFKOrderItemObj.nomenclatureUnitCode := StrToInt(GetReturnValue(frmTmaterialShow.sgTmaterial,4));
                RQFKOrderItemObj.nomenclatureUnitName :=  GetReturnValue(frmTmaterialShow.sgTmaterial,5);

                if  copy(AnsiUpperCase(Trim(RQFKOrderItemObj.nomenclatureName)), 1, 255) <> Copy(AnsiUpperCase(Trim( RQFKOrderItemObj.material.name )), 1, 255) then
                begin
                    Application.MessageBox(PChar('Номенклатурна назва матеріалу ( '+ AnsiUpperCase(Trim(RQFKOrderItemObj.nomenclatureName)) +' ) не співпадає з Назвою матеріала у планах ( ' + AnsiUpperCase(Trim( RQFKOrderItemObj.material.name )) + ' ). Змініть номенклатуру або заведіть нову ...'),
                         PChar('Увага !'),MB_ICONWARNING);
                    RQFKOrderItemObj.nomenclatureCode := LOW_INT;
                    RQFKOrderItemObj.nomenclatureBalSch := '';
                    RQFKOrderItemObj.nomenclatureNum := '';
                    RQFKOrderItemObj.nomenclatureName := '';
                    RQFKOrderItemObj.nomenclatureUnitCode := LOW_INT;
                    RQFKOrderItemObj.nomenclatureUnitName := '';
                    Exit;
                end;

                if  AnsiUpperCase(Trim(RQFKOrderItemObj.nomenclatureUnitName)) <> AnsiUpperCase(Trim( RQFKOrderItemObj.material.measurement.name )) then
                begin
                    Application.MessageBox(PChar('Номенклатурна одиниця виміру матеріалу ( '+ AnsiUpperCase(Trim(RQFKOrderItemObj.nomenclatureUnitName)) +' ) не співпадає з одиницею виміру матеріала у планах ( ' + AnsiUpperCase(Trim( RQFKOrderItemObj.material.measurement.name )) + ' ). Змініть номенклатуру або заведіть нову ...'),
                         PChar('Увага !'),MB_ICONWARNING);
                    RQFKOrderItemObj.nomenclatureCode := LOW_INT;
                    RQFKOrderItemObj.nomenclatureBalSch := '';
                    RQFKOrderItemObj.nomenclatureNum := '';
                    RQFKOrderItemObj.nomenclatureName := '';
                    RQFKOrderItemObj.nomenclatureUnitCode := LOW_INT;
                    RQFKOrderItemObj.nomenclatureUnitName := '';
                    Exit;
                end;

                edtNomenclatureCode.Text := IntToStr(RQFKOrderItemObj.nomenclatureCode);
                edtNomenclatureNum.Text := RQFKOrderItemObj.nomenclatureNum;
                edtNomenclatureBalSch.Text := RQFKOrderItemObj.nomenclatureBalSch;
                //MakeMultiline(edtNomenclatureName.Lines, RQFKOrderItemObj.nomenclatureName);
                edtNomenclatureName.Text :=  RQFKOrderItemObj.nomenclatureName;
                edtNomenclatureUnitCode.Text := IntToStr(RQFKOrderItemObj.nomenclatureUnitCode);
                edtNomenclatureUnitName.Text := RQFKOrderItemObj.nomenclatureUnitName;




{

        ( 'Код'
          ,'Номенклатурний номер матеріалу'
          ,'Балансовий рахунок'
          ,'Назва матеріалу'

          ,'код од. виміру'
          ,'од. виміру'

          ,'Ціна'
          ,'Срок эксплуатации (в месяцах)'
          ,'Идентификатор вида спецодежды'
          ,'Использование аналитики по материалу'
          ,'дата создания'
          }
                
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTmaterialShow.Free;
   end;
end;

procedure TfrmRQFKOrderItemEdit.edtCountGenChange(Sender: TObject);
var price, count, sum: Double;
begin
  try
    price := StrToFloat(edtPriceWithoutNds.Text);
  except
    on EConvertError do
      price := 0;
  end;

  try
    count := StrToFloat(edtCountGen.Text);
  except
    on EConvertError do
      count := 0;
  end;

  //edtSumGen.Text := FloatToStrF(price * count, ffFixed, 15, 2);
  edtSumWithoutNds.Text := FloatToStr(Conv(price * count, 2));
end;

procedure TfrmRQFKOrderItemEdit.pcItemDataChange(Sender: TObject);
begin
  inherited;
if  (DialogState <> dsInsert) then
begin
  if pcItemData.ActivePage = tsEstimate then
    updateEstimateItemGrid_()
  else
  if pcItemData.ActivePage = tsRemainder then
    updateRemainderGrid()
  else
  if pcItemData.ActivePage = tsSCCounterData then
    updateSCCounterTab()
  else
  if pcItemData.ActivePage = tsDismount then
    updateDismountGrid()
  else
  if pcItemData.ActivePage = tsOSData then
  begin
    updateOSDataTab();
    LockUnlockOSData();
  end;
end;

end;

procedure TfrmRQFKOrderItemEdit.updateSCCounterTab();
var
  i: integer;
  TempSCInvoice: SCInvoiceControllerSoapPort;
  f : SCInvoiceFilter;
  l : SCInvoiceShortList;
begin
   DisableControls([btnSCInvoiceEdit, btnSCInvoiceSave, btnSCInvoiceCancel]);

   DisableControls([edtSourceCode, edtAccount, edtExpensesCode, edtCounterType, edtCharacters, edtTaxNumber]);

   TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
   f := SCInvoiceFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.fkOrderItemRef := RQFKOrderItemRef.Create;
   f.fkOrderItemRef.code := RQFKOrderItemObj.code;
   l := TempSCInvoice.getScrollableFilteredList(f, 0, -1);
   if l.totalCount = 0 then
   begin
     edtSourceCode.ItemIndex := -1;
     edtAccount.ItemIndex := -1;
     edtExpensesCode.ItemIndex := -1;
   end
   else
   begin
      edtSourceCode.Text := l.list[0].sourceCode;
      edtAccount.Text := l.list[0].subAccountCode;
      edtExpensesCode.Text := l.list[0].costCode;

      edtCounterType.Text := l.list[0].counterType;
      MakeMultiline(edtCharacters.Lines, l.list[0].characters);
      edtTaxNumber.Text := l.list[0].numberTax;
   end;

   //if DialogState <> dsView then
   if statusCode in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE] then
   begin
      DisableControls([btnSCInvoiceEdit], False);
   end;
//qqqqqqqqqqqqqqq
end;

procedure TfrmRQFKOrderItemEdit.btnSCInvoiceEditClick(Sender: TObject);
begin
  inherited;
  DisableControls([edtSourceCode, edtAccount, edtExpensesCode, edtCounterType, edtCharacters, edtTaxNumber
                   , btnSCInvoiceSave, btnSCInvoiceCancel ], False);
  DisableControls([btnSCInvoiceEdit]);
end;

procedure TfrmRQFKOrderItemEdit.btnSCInvoiceCancelClick(Sender: TObject);
begin
  inherited;
  updateSCCounterTab();
end;

procedure TfrmRQFKOrderItemEdit.btnSCInvoiceSaveClick(Sender: TObject);
var
  i: integer;
  TempSCInvoice: SCInvoiceControllerSoapPort;
  f : SCInvoiceFilter;
  l : SCInvoiceShortList;
  obj : SCInvoice;
begin
  inherited;
   TempSCInvoice := HTTPRIOSCInvoice as SCInvoiceControllerSoapPort;
   f := SCInvoiceFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.fkOrderItemRef := RQFKOrderItemRef.Create;
   f.fkOrderItemRef.code := RQFKOrderItemObj.code;
   l := TempSCInvoice.getScrollableFilteredList(f, 0, -1);
   if l.totalCount = 1 then
   begin
      obj := TempSCInvoice.getObject(l.list[0].code);

      obj.subAccountCode := edtAccount.Text;
      obj.sourceCode := edtSourceCode.Text;
      obj.costCode := edtExpensesCode.Text;
      obj.counterType := edtCounterType.Text;
      obj.characters := edtCharacters.Text;
      obj.numberTax := edtTaxNumber.Text;
      TempSCInvoice.save(obj);
   end
   else
    ShowMessage('Дані по лічільникам не знайдено ...');

   updateSCCounterTab();

end;

procedure TfrmRQFKOrderItemEdit.updateEstimateItemGrid_();
var
  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  i,j: Integer;
  RQFKOrderItem2ENEstimateItemList: RQFKOrderItem2ENEstimateItemShortList;
  f : RQFKOrderItem2ENEstimateItemFilter;
  cnt_, sum_ , tmp_ : double;
begin

   SetGridHeaders(RQFKOrderItem2ENEstimateItemHeaders, sgRQFKOrderItem2ENEstimateItem.ColumnHeaders);

   if (kindCode = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
   begin
     sgRQFKOrderItem2ENEstimateItem.ColumnHeaders[1] := 'Послуга (план)';
     sgRQFKOrderItem2ENEstimateItem.ColWidths[4] := 0;
     sgRQFKOrderItem2ENEstimateItem.ColWidths[5] := 0;
   end;

   for i:=1 to sgRQFKOrderItem2ENEstimateItem.RowCount-1 do
     for j:=0 to sgRQFKOrderItem2ENEstimateItem.ColCount-1 do
       sgRQFKOrderItem2ENEstimateItem.Cells[j,i]:='';
   sgRQFKOrderItem2ENEstimateItem.RowCount := 2;

  f := RQFKOrderItem2ENEstimateItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.fkOrderItemRef := RQFKOrderItemRef.Create;
  f.fkOrderItemRef.code := RQFKOrderItemObj.code;

  TempRQFKOrderItem2ENEstimateItem :=  HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
  
  //RQFKOrderItem2ENEstimateItemList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(f,0,-1);
  RQFKOrderItem2ENEstimateItemList := TempRQFKOrderItem2ENEstimateItem.getEstimateGroupedList(f,0,-1);



  if High(RQFKOrderItem2ENEstimateItemList.list) > -1 then
     sgRQFKOrderItem2ENEstimateItem.RowCount:=High(RQFKOrderItem2ENEstimateItemList.list)+2
  else
     sgRQFKOrderItem2ENEstimateItem.RowCount:=2;

   cnt_ := 0;
   sum_ := 0;

   with sgRQFKOrderItem2ENEstimateItem do
    for i:=0 to High(RQFKOrderItem2ENEstimateItemList.list) do
      begin
        Application.ProcessMessages;
        if RQFKOrderItem2ENEstimateItemList.list[i].estimateItemCode <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItem2ENEstimateItemList.list[i].estimateItemCode)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := RQFKOrderItem2ENEstimateItemList.list[i].materialRefName;
        Cells[2, i+1] := RQFKOrderItem2ENEstimateItemList.list[i].measurementRefName;

        if RQFKOrderItem2ENEstimateItemList.list[i].estimateItemCountFact = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].estimateItemCountFact.DecimalString;

        Cells[4, i +1] := RQFKOrderItem2ENEstimateItemList.list[i].finMaterialsRefMat_name;
        Cells[5, i +1] := RQFKOrderItem2ENEstimateItemList.list[i].finMaterialsRefMu_name;

        //tmp_ := 0;
        if RQFKOrderItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
        begin
          Cells[6,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;

              try
                tmp_ := StrToFloat(RQFKOrderItem2ENEstimateItemList.list[i].countGen.DecimalString);
              except
                tmp_ := 0;
              end;
              cnt_ := cnt_ + tmp_;
        end;

        if RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds = nil then
          Cells[7,i+1] := ''
        else
        begin
          Cells[7,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds.DecimalString;

              try
                tmp_ := StrToFloat(RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds.DecimalString);
              except
                tmp_ := 0;
              end;
              sum_ := sum_ + tmp_;
        end;

        Cells[8, i+1] :=  RQFKOrderItem2ENEstimateItemList.list[i].invNumber;
        Cells[9, i+1] :=  RQFKOrderItem2ENEstimateItemList.list[i].elementName;
        Cells[10, i+1] :=  MonthesNames[RQFKOrderItem2ENEstimateItemList.list[i].planRefMonthGen] + ' ' + IntToStr(RQFKOrderItem2ENEstimateItemList.list[i].planRefYearGen);


{
        ( 'Код'
          ,'Матеріал (план)'
          ,'Од.вим.(план)'
          ,'Кількість у плані'
          ,'Матеріал (факт)'
          ,'Од.вим.(факт)'
          ,'Кількість(факт)'
          //,'Ціна без ПДВ'
          //,'Сума без ПДВ'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Період вик.робіт'
}
{
        if RQFKOrderItem2ENEstimateItemList.list[i].fkOrderItemRefPriceWithoutNds = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].fkOrderItemRefPriceWithoutNds.DecimalString;

        if RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].sumWithoutNds.DecimalString;
}
        sgRQFKOrderItem2ENEstimateItem.RowCount:=i+2;
      end;

   sgRQFKOrderItem2ENEstimateItem.Row:=1;
   lblCount_.Caption :=  SeparateThousands(FloatToStr(Conv(cnt_, 2)));
   lblSum_.Caption :=  SeparateThousands(FloatToStr(Conv(sum_, 2)));

   sgRQFKOrderItem2ENEstimateItemClick(nil);
end;


procedure TfrmRQFKOrderItemEdit.updateRemainderGrid();
var
  TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
  i,j: Integer;
  RQFKOrderItemRemainderList: RQFKOrderItemRemainderShortList;
  f : RQFKOrderItemRemainderFilter;
begin

   for i:=1 to sgRQFKOrderItemRemainder.RowCount-1 do
     for j:=0 to sgRQFKOrderItemRemainder.ColCount-1 do
       sgRQFKOrderItemRemainder.Cells[j,i]:='';
   sgRQFKOrderItemRemainder.RowCount := 2;

  SetGridHeaders(RQFKOrderItemRemainderHeaders, sgRQFKOrderItemRemainder.ColumnHeaders);


  TempRQFKOrderItemRemainder :=  HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;

     f := RQFKOrderItemRemainderFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.fkOrderItemRef := RQFKOrderItemRef.Create;
     f.fkOrderItemRef.code := RQFKOrderItemObj.code;

  RQFKOrderItemRemainderList := TempRQFKOrderItemRemainder.getScrollableFilteredList(f,0,-1);


  if High(RQFKOrderItemRemainderList.list) > -1 then
     sgRQFKOrderItemRemainder.RowCount:=High(RQFKOrderItemRemainderList.list)+2
  else
     sgRQFKOrderItemRemainder.RowCount:=2;

   with sgRQFKOrderItemRemainder do
    for i:=0 to High(RQFKOrderItemRemainderList.list) do
      begin
        Application.ProcessMessages;
        if RQFKOrderItemRemainderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemRemainderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderItemRemainderList.list[i].materialNameTxt;
        if RQFKOrderItemRemainderList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := RQFKOrderItemRemainderList.list[i].countGen.DecimalString;
        if RQFKOrderItemRemainderList.list[i].priceWithoutNds = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQFKOrderItemRemainderList.list[i].priceWithoutNds.DecimalString;
        if RQFKOrderItemRemainderList.list[i].sumWithoutNds = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQFKOrderItemRemainderList.list[i].sumWithoutNds.DecimalString;

        Cells[5,i+1] := RQFKOrderItemRemainderList.list[i].budgetShortName;

        sgRQFKOrderItemRemainder.RowCount:=i+2;
      end;
   sgRQFKOrderItemRemainder.Row:=1;


end;

procedure TfrmRQFKOrderItemEdit.FormCreate(Sender: TObject);
begin
  inherited;

  kindCode := LOW_INT;
  accountingType := LOW_INT;
  statusCode := LOW_INT;
  storageCode := LOW_INT;
  orgID := LOW_INT;

  codeOrg := '';
  numberDoc := '';
  molOutCode := '';

  //OSData := RQFKOrderItem2OSData.Create;
  //OSData.code := LOW_INT;
  OSData := nil;
  AllowClose := true;
end;

procedure TfrmRQFKOrderItemEdit.actViewPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode : Integer;
begin

      try
        objCode:=StrToInt( sgRQFKOrderItem2ENEstimateItem.Cells[0, sgRQFKOrderItem2ENEstimateItem.row] );
      except
        on EConvertError do Exit;
      end;


  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
  try

    try
      frmENPlanWorkEdit.ENPlanWorkObj := DMReports.getPlanByEstimateCode( objCode );
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmRQFKOrderItemEdit.actEditRQFKOrderItem2ENEstimateItemExecute(
  Sender: TObject);
Var
  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  f : RQFKOrderItem2ENEstimateItemFilter;
  l : RQFKOrderItem2ENEstimateItemShortList;
  eCode : Integer;

  frmRQFKOrderItem2ENEstimateItemShow : TfrmRQFKOrderItem2ENEstimateItemShow;

  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;

begin
  inherited;

   try
     eCode := StrToInt(sgRQFKOrderItem2ENEstimateItem.Cells[0,sgRQFKOrderItem2ENEstimateItem.Row]);
   except
   on EConvertError do Exit;
   end;

{
   try
     RQFKOrderItem2ENEstimateItemObj := TempRQFKOrderItem2ENEstimateItem.getObject(StrToInt(sgRQFKOrderItem2ENEstimateItem.Cells[0,sgRQFKOrderItem2ENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
}
 TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;

 f := RQFKOrderItem2ENEstimateItemFilter.Create;
 SetNullIntProps(f);
 SetNullXSProps(f);
 f.estimateItem := ENEstimateItem.Create;
 f.estimateItem.code := eCode;
 f.fkOrderItemRef := RQFKOrderItemRef.Create;
 f.fkOrderItemRef.code := RQFKOrderItemObj.code;

   frmRQFKOrderItem2ENEstimateItemShow:=TfrmRQFKOrderItem2ENEstimateItemShow.Create(Application,fmNormal, f);
   try
        with frmRQFKOrderItem2ENEstimateItemShow do begin
        DisableActions([ actInsert, actDelete , actFilter, actNoFilter]);
        if ShowModal = mrOk then
        begin
            TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
            RQFKOrderItemObj := TempRQFKOrderItem.getObject(RQFKOrderItemObj.code);
            
            self.FormShow(Sender);
        end;
        end;
   finally
      frmRQFKOrderItem2ENEstimateItemShow.Free;
   end;

{
 l := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(f, 0, -1);
 if (l.totalCount <> 1) then
 begin
     ShowMessage('Строка не знайдена ...');
     Exit;
 end;

   try
     RQFKOrderItem2ENEstimateItemObj := TempRQFKOrderItem2ENEstimateItem.getObject(l.list[0].code);
   except
   on EConvertError do Exit;
  end;


  frmRQFKOrderItem2ENEstimateItemEdit:=TfrmRQFKOrderItem2ENEstimateItemEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrderItem2ENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderItem2ENEstimateItem.save(RQFKOrderItem2ENEstimateItemObj);
        //UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderItem2ENEstimateItemEdit.Free;
    frmRQFKOrderItem2ENEstimateItemEdit:=nil;
  end;
}    
end;

procedure TfrmRQFKOrderItemEdit.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  DisableActions([actEditRQFKOrderItem2ENEstimateItem, actViewPlan, actRemainderChange]);
  actEditRQFKOrderItem2ENEstimateItem.Visible := false;
  actViewPlan.Visible := false;
  actRemainderChange.Visible := false;

  if pcItemData.ActivePage = tsRemainder then
  begin
       DisableActions([actRemainderChange], DialogState = dsView );
       actRemainderChange.Visible := actRemainderChange.Enabled;
       //actViewPlan.Visible := not actBudgetChange.Enabled;
       //actEditRQFKOrderItem2ENEstimateItem.Visible := actViewPlan.Visible;
  end;

  if pcItemData.ActivePage = tsEstimate then
  begin
       DisableActions([actViewPlan], false);
       DisableActions([actEditRQFKOrderItem2ENEstimateItem], DialogState = dsView );
       actViewPlan.Visible := actViewPlan.Enabled;
       actEditRQFKOrderItem2ENEstimateItem.Visible := actEditRQFKOrderItem2ENEstimateItem.Enabled;
  end;

  if {(kindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA) and }(accountingType = TK_ACCOUNTINGTYPE_OS) then
  begin
    DisableActions([actEditRQFKOrderItem2ENEstimateItem, actRemainderChange]);
  end;
end;

procedure TfrmRQFKOrderItemEdit.actRemainderChangeExecute(Sender: TObject);
var
   remainder : RQFKOrderItemRemainder;
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;

   TempRQFKOrderItemRemainder: RQFKOrderItemRemainderControllerSoapPort;
   TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
begin
  inherited;

          TempRQFKOrderItemRemainder := HTTPRIORQFKOrderItemRemainder as RQFKOrderItemRemainderControllerSoapPort;

   try
     RQFKOrderItemRemainderObj := TempRQFKOrderItemRemainder.getObject(StrToInt(sgRQFKOrderItemRemainder.Cells[0,sgRQFKOrderItemRemainder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrderItemRemainderEdit:=TfrmRQFKOrderItemRemainderEdit.Create(Application, dsEdit);
  try
    // вбивают ЛЕВЫй бюджет .. там где нельзя ...
    // приход на вже наявний матеріал
    if RQFKOrderItemRemainderObj.typeRef.code = 2 then
    begin
        frmRQFKOrderItemRemainderEdit.DisableControls([frmRQFKOrderItemRemainderEdit.spbENDepartmentBudget]);
    end;

    if frmRQFKOrderItemRemainderEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrderItemRemainder.save(RQFKOrderItemRemainderObj);
        //UpdateGrid(Sender);
        //pcItemDataChange(Sender);
            TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
            RQFKOrderItemObj := TempRQFKOrderItem.getObject(RQFKOrderItemObj.code);
            
            self.FormShow(Sender);
            pcItemData.ActivePage := tsRemainder;
            pcItemDataChange(Sender);         
      end;
  finally
    frmRQFKOrderItemRemainderEdit.Free;
    frmRQFKOrderItemRemainderEdit:=nil;
  end;

{
   try
     remainder := TempRQFKOrderItemRemainder.getObject(StrToInt(sgRQFKOrderItemRemainder.Cells[0,sgRQFKOrderItemRemainder.Row]));
   except
   on EConvertError do Exit;
   end;

          f := ENDepartmentFilter.Create;
          SetNullIntProps(f);
          SetNullXSProps(f);
          f.typeRef := ENDepartmentTypeRef.Create;
          f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
          f.conditionSQL := ' parentrefcode is null';

          frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
          try
          with frmENDepartmentShow do begin
          //DisableActions([ actNoFilter, actEdit, actInsert ]);
          if ShowModal = mrOk then
          begin
            try
               if remainder.budget = nil then remainder.budget := ENDepartment.Create();
               remainder.budget.code := ENDepartmentShort(tvDep.Selected.Data).code;
               //edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;

               TempRQFKOrderItemRemainder.save(remainder);

            except
               on EConvertError do Exit;
            end;
          end
          else
          begin
              Application.MessageBox(PChar('Виберіть бюджетотримача .. або уберіть Відкориговану кількість!'), PChar('Увага!'), MB_ICONWARNING);
              Exit;
          end;
          end;
          finally
            frmENDepartmentShow.Free;
          end;
       //end;
}


end;

procedure TfrmRQFKOrderItemEdit.actExport2ExcelExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  inherited;
//  if pcItemData.ActivePage = tsEstimate then
//    DMReports.exportGrid(sgRQFKOrderItem2ENEstimateItem, 'Материалы_в_планах_');
//
//  if pcItemData.ActivePage = tsRemainder then
//    DMReports.exportGrid(sgRQFKOrderItemRemainder, 'Материалы_без_планов_');


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

procedure TfrmRQFKOrderItemEdit.sgRQFKOrderItem2ENEstimateItemClick(
  Sender: TObject);
begin
  updateEstimateItemInGrid;
end;

procedure TfrmRQFKOrderItemEdit.updateEstimateItemInGrid;
var i, estimateCode: Integer;
    TempE2E: ENEstimateItem2ENEstimateItemControllerSoapPort;
    e2eFilter: ENEstimateItem2ENEstimateItemFilter;
    e2eList: ENEstimateItem2ENEstimateItemShortList;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    eFilter: ENEstimateItemFilter;
    pFilter: ENPlanWorkFilter;
    ENEstimateItemList: ENEstimateItemShortList;
begin
  if kindCode <> RQFKORDER_KIND_RASHOD_E2E then Exit;

  try
    estimateCode := StrToInt(sgRQFKOrderItem2ENEstimateItem.Cells[0, sgRQFKOrderItem2ENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;

  e2eFilter := ENEstimateItem2ENEstimateItemFilter.Create;
  SetNullIntProps(e2eFilter);
  SetNullXSProps(e2eFilter);

  e2eFilter.estimateItemOutRef := ENEstimateItemRef.Create;
  e2eFilter.estimateItemOutRef.code := estimateCode;
  e2eFilter.conditionSQL := 'code in ('+
    ' select rqfkorderitem2e2e.e2erefcode from rqfkorderitem2e2e ' +
    '  where rqfkorderitem2e2e.fkorderitemrefcode = ' + IntToStr(RQFKOrderItemObj.code) +
    ')';

  TempE2E := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
  e2eList := TempE2E.getScrollableFilteredList(e2eFilter, 0, -1);

  if (e2eList.totalCount = 0) then
  begin
    e2eFilter := ENEstimateItem2ENEstimateItemFilter.Create;
    SetNullIntProps(e2eFilter);
    SetNullXSProps(e2eFilter);
    
    e2eFilter.conditionSQL :=
      'code in (select ee.code from enestimateitem2nstmttm ee ' +
      'where ee.estimateitemoutrefcode in  ' +
      '(select ee1.estimateitemoutrefcode ' +
      '   from enestimateitem2nstmttm ee1 ' +
      '  where ee1.estimateiteminrefcode = ' + IntToStr(estimateCode) +
      '    and ee1.typerefcode = 3) ' +
      'and ee.code in ' +
      '(select rqfkorderitem2e2e.e2erefcode from rqfkorderitem2e2e ' +
      '  where rqfkorderitem2e2e.fkorderitemrefcode = ' + IntToStr(RQFKOrderItemObj.code) + ')) ';
    e2eList := TempE2E.getScrollableFilteredList(e2eFilter, 0, -1);
  end;

  if e2eList.totalCount > 0 then
    if e2eList.list[0].code > LOW_INT then
    begin
      TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

      eFilter := ENEstimateItemFilter.Create;
      SetNullIntProps(eFilter);
      SetNullXSProps(eFilter);

      eFilter.code := e2eList.list[0].estimateItemInRefCode;

      pFilter := ENPlanWorkFilter.Create;
      SetNullIntProps(pFilter);
      SetNullXSProps(pFilter);

      pFilter.kind := ENPlanWorkKind.Create;
      pFilter.kind.code := ENPLANWORKKIND_CURRENT;

      ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, pFilter);

      //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

      //eiLastCount := High(ENEstimateItemList.list);

      if High(ENEstimateItemList.list) > -1 then
        sgENEstimateItem.RowCount := High(ENEstimateItemList.list) + 2
      else
        sgENEstimateItem.RowCount := 2;

       with sgENEstimateItem do
         for i := 0 to High(ENEstimateItemList.list) do
         begin
           Application.ProcessMessages;

           if ENEstimateItemList.list[i].code <> Low(Integer) then
             Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
           else
             Cells[0,i+1] := '';

           //AddCheckBox(1, i+1, false, false);

           Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

           Objects[1,i+1] := TObject(ENEstimateItemList.list[i].planRefCode);

           {
           if ENEstimateItemList.list[i].countGen = nil then
             Cells[2,i+1] := ''
           else
             Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;
           }

           // ПОЛЕ не двигать ... !!! выгребаются данные из колонки !!!!
           if ENEstimateItemList.list[i].countFact = nil then
             Cells[2,i+1] := ''
           else
             Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
           // ПОЛЕ не двигать ... !!! выгребаются данные из колонки !!!!

           Cells[3,i+1] := ENEstimateItemList.list[i].measureType;

          if ENEstimateItemList.list[i].planRefDateStart = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := XSDate2String(ENEstimateItemList.list[i].planRefDateStart);

           Cells[5, i+1] := ENEstimateItemList.list[i].planRefDepartmentName;

           Cells[6,i+1] := ENEstimateItemList.list[i].invNumber ;
           Cells[7,i+1] := ENEstimateItemList.list[i].elementName ;

           Cells[8,i+1] := ENEstimateItemList.list[i].kartaNum;
           Cells[9,i+1] := ENEstimateItemList.list[i].kartaRefName;

           Cells[10,i+1] := ENEstimateItemList.list[i].planType;
           Cells[11,i+1] := ENEstimateItemList.list[i].planState;

           //Cells[9,i+1] := ENEstimateItemList.list[i].typeRefName;

          // Cells[8,i+1] := ENEstimateItemList.list[i].userGen;

          { if ENEstimateItemList.list[i].dateEdit = nil then
             Cells[9,i+1] := ''
           else
             Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);
           }
           sgENEstimateItem.RowCount := i + 2;
         end;

       sgENEstimateItem.Row := 1;

    end;
end;

procedure TfrmRQFKOrderItemEdit.actViewPlanInExecute(Sender: TObject);
var planCode: Integer;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  planCode := Integer(sgENEstimateItem.Objects[1, sgENEstimateItem.Row]);

  if planCode <= 0 then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);

    if frmENPlanWorkEdit.ShowModal= mrOk then
    begin
    end;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmRQFKOrderItemEdit.spbNextMatIdClick(Sender: TObject);
var
   frmTmaterialShow: TfrmTmaterialShow;
   nomFilter : TmaterialFilter;
   strUnitName : String;
begin


   nomFilter := TmaterialFilter.Create;
   SetNullIntProps(nomFilter);
   SetNullXSProps(nomFilter);

   // нет такого поля .. вернее оно не обрабатываеться ;) nomFilter.status := 'A';
   nomFilter.conditionSQL := ' UMC_DBA.TMATHERIAL.ID in (select id from umc_dba.tmatherial where ' +
							 					' UMC_DBA.TMATHERIAL.status = ''A'' ' +
						 						' and UMC_DBA.TMATHERIAL.mesure_unit_id in ' +
						 						' (select umc_dba.tmesure_unit.id from umc_dba.tmesure_unit where umc_dba.tmesure_unit.status = ''A'' and upper(umc_dba.tmesure_unit.text) = ''' + AnsiUpperCase(Trim(RQFKOrderItemObj.material.measurement.name)) + '''))';


   nomFilter.orderBySQL := 'UMC_DBA.TMATHERIAL.NAME';

   frmTmaterialShow:=TfrmTmaterialShow.Create(Application,fmNormal, nomFilter);

   frmTmaterialShow.FilterConditionConst := ' UMC_DBA.TMATHERIAL.ID in (select id from umc_dba.tmatherial where ' +
							 					' UMC_DBA.TMATHERIAL.status = ''A'' ' +
						 						' and UMC_DBA.TMATHERIAL.mesure_unit_id in ' +
						 						' (select umc_dba.tmesure_unit.id from umc_dba.tmesure_unit where umc_dba.tmesure_unit.status = ''A'' and upper(umc_dba.tmesure_unit.text) = ''' + AnsiUpperCase(Trim(RQFKOrderItemObj.material.measurement.name)) + '''))';


   try

      with frmTmaterialShow do
        if ShowModal = mrOk then
        begin

            try
                strUnitName := GetReturnValue(frmTmaterialShow.sgTmaterial,5);
                RQFKOrderItemObj.next_mat_name := Copy(GetReturnValue(frmTmaterialShow.sgTmaterial,1)+' '+GetReturnValue(frmTmaterialShow.sgTmaterial,3), 1, 255);
                RQFKOrderItemObj.next_mat_id := StrToInt(GetReturnValue(frmTmaterialShow.sgTmaterial,0));

                if  AnsiUpperCase(Trim(strUnitName)) <> AnsiUpperCase(Trim( RQFKOrderItemObj.material.measurement.name )) then
                begin
                    Application.MessageBox(PChar('Номенклатурна одиниця виміру матеріалу ( '+ AnsiUpperCase(Trim(strUnitName)) +' ) не співпадає з одиницею виміру матеріала у планах ( ' + AnsiUpperCase(Trim( RQFKOrderItemObj.material.measurement.name )) + ' ). Змініть номенклатуру або заведіть нову ...'),
                         PChar('Увага !'),MB_ICONWARNING);
                    RQFKOrderItemObj.next_mat_id := LOW_INT;
                    RQFKOrderItemObj.next_mat_name := '';
                    Exit;
                end;

                edtNextMatId.Text := RQFKOrderItemObj.next_mat_name;
                
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTmaterialShow.Free;
   end;
end;

procedure TfrmRQFKOrderItemEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (orgID <> Low_int) then
   begin
     if (orgID > LOW_INT) then
       f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(orgID)
     else
       f.conditionSQL := ' a.io_flag = ''B''';
   end
   else
   begin
     Application.MessageBox(PChar('Виберіть постачальника!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
     Exit;
   end;

   f.partnerCode := codeOrg;

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;

   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                edtFinDocCode.Text := GetReturnValue(sgFINServicesObject, 5);
                edtFinDocID.Text := GetReturnValue(sgFINServicesObject, 6);

                RQFKOrderItemObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                RQFKOrderItemObj.contractDate := TXSDate.Create;
                RQFKOrderItemObj.contractDate.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject, 2))));
                RQFKOrderItemObj.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
                RQFKOrderItemObj.finDocId := StrToInt(GetReturnValue(sgFINServicesObject, 6));
             except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


procedure TfrmRQFKOrderItemEdit.actViewDismountExecute(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempEnplanWork : ENPlanWorkControllerSoapPort;
  planFilter: ENPlanWorkFilter;
  planList : ENPlanWorkShortList;
  planArray : ENPlanWorkController.ArrayOfInteger;
begin

  if (pcItemData.ActivePage = tsDismount) then
  begin

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgDismount.Cells[0, sgDismount.Row]));

    except
      on EConvertError do Exit;
    end;

    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);
    try
      // код Задания ФАКТ по строке ордера
      TempENPlanWork  := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      planFilter := ENPlanWorkFilter.Create;
      SetNullIntProps(planFilter);
      SetNullXSProps(planFilter);
      planFilter.conditionSQL := ' ENPLANWORK.CODE in (select p.code from enplanwork p , rqfkorderitem2enplnwrk fo2pl ' +
				' where p.code = fo2pl.enplanworkcode ' +
				' and fo2pl.fkorderitemcode = ' + IntToStr(RQFKOrderItemObj.code) +
				' and p.kindcode =  ' + IntToStr(ENPLANWORKKIND_FACT)  + ' ) ' ;
//      planList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
//      if planList.totalCount >= 0 then
//         frmENEstimateItemEdit.ENPlanWorkCode := planList.list[0].code;
       planArray :=   TempENPlanWork.getFilteredCodeArray(planFilter);
      if High(planArray) > -1 then
       frmENEstimateItemEdit.ENPlanWorkCode := planArray[0];
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
       
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  end;

end;

procedure TfrmRQFKOrderItemEdit.actInsertDismountExecute(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempEnplanWork : ENPlanWorkControllerSoapPort;
  planFilter: ENPlanWorkFilter;
  planList : ENPlanWorkShortList;
  planArray : ENPlanWorkController.ArrayOfInteger;
begin

  if pcItemData.ActivePage = tsDismount then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    ENEstimateItemObj := ENEstimateItem.Create;
    try
      ENEstimateItemObj.countGen := TXSDecimal.Create;
      ENEstimateItemObj.countFact := TXSDecimal.Create;
      ENEstimateItemObj.dateEdit := TXSDate.Create;

      // код Задания ФАКТ по строке ордера
      TempENPlanWork  := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      planFilter := ENPlanWorkFilter.Create;
      SetNullIntProps(planFilter);
      SetNullXSProps(planFilter);
      planFilter.conditionSQL := ' ENPLANWORK.CODE in (select p.code from enplanwork p , rqfkorderitem2enplnwrk fo2pl ' +
				' where p.code = fo2pl.enplanworkcode ' +
				' and fo2pl.fkorderitemcode = ' + IntToStr(RQFKOrderItemObj.code) +
				' and p.kindcode =  ' + IntToStr(ENPLANWORKKIND_FACT)  + ' ) ' ;
//      planList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
//      if planList.totalCount >= 0 then
      planArray :=   TempENPlanWork.getFilteredCodeArray(planFilter);
      if High(planArray) > -1 then
      begin
        ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
        ENEstimateItemObj.planRef.code := planArray[0];
      end;
      ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
      ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;

      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
      try
        if ENEstimateItemObj.planRef <> nil then
          frmENEstimateItemEdit.ENPlanWorkCode := ENEstimateItemObj.planRef.code;
          frmENEstimateItemEdit.cbENEstimateItemKind.ItemIndex := ENESTIMATEITEMKIND_DISMOUNT - 1;
          frmENEstimateItemEdit.DisableControls([frmENEstimateItemEdit.cbENEstimateItemKind]);
          frmENEstimateItemEdit.HideControls([frmENEstimateItemEdit.lblCountGen, frmENEstimateItemEdit.edtCountGen]);
          frmENEstimateItemEdit.lblCountFact.Caption := 'кількість';

        if frmENEstimateItemEdit.ShowModal = mrOk then
        begin
          if ENEstimateItemObj <> nil then
           
            UpdateGrid(Sender);
        end;
      finally
        frmENEstimateItemEdit.Free;
        frmENEstimateItemEdit := nil;
      end;
    finally
      ENEstimateItemObj.Free;
    end;
  end;

end;

procedure TfrmRQFKOrderItemEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
  if pcItemData.ActivePage = tsDismount then
 begin
   ClearGrid(sgDismount);
 end;

  pcItemDataChange(Sender);
end;


procedure TfrmRQFKOrderItemEdit.updateDismountGrid();
var
 TempENEstimateItem: ENEstimateItemControllerSoapPort;
 ENEstimateItemList: ENEstimateItemShortList;
 estimateItemFilter: ENEstimateItemFilter;

 TempEnplanWork : ENPlanWorkControllerSoapPort;
 planFilter: ENPlanWorkFilter;
 planList : ENPlanWorkShortList;

 eiLastCount  , i  , eiLastRow  , eiColCount: integer;
 planArray : ENPlanWorkController.ArrayOfInteger;
begin
 DisableActions([actInsertDismount, actDeleteDismount ], not (DialogState in [dsEdit, dsInsert]) );

    SetGridHeaders(ENDismountItemHeaders, sgDismount.ColumnHeaders);
    SetGridHeaders(ENDismountItemHeaders, sgFINUnmount.ColumnHeaders);

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    begin
       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);
    end;

    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    // код Задания ФАКТ по строке ордера
      TempENPlanWork  := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      planFilter := ENPlanWorkFilter.Create;
      SetNullIntProps(planFilter);
      SetNullXSProps(planFilter);
      planFilter.conditionSQL := ' ENPLANWORK.CODE in (select p.code from enplanwork p , rqfkorderitem2enplnwrk fo2pl ' +
				' where p.code = fo2pl.enplanworkcode ' +
				' and fo2pl.fkorderitemcode = ' + IntToStr(RQFKOrderItemObj.code) +
				' and p.kindcode =  ' + IntToStr(ENPLANWORKKIND_FACT)  + ' ) ' ;
    planArray :=   TempENPlanWork.getFilteredCodeArray(planFilter);
      if High(planArray) > -1 then
       estimateItemFilter.planRef.code := planArray[0];

    estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;

    ////
    estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

    eiLastCount := High(ENEstimateItemList.list);

    if eiLastCount > -1 then
      sgDismount.RowCount := eiLastCount + 2
    else
      sgDismount.RowCount := 2;

     with sgDismount do
       for i := 0 to eiLastCount do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[3,i+1] := ENEstimateItemList.list[i].measureType;

         Cells[4,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[5,i+1] := ENEstimateItemList.list[i].kartaRefName;
{
         Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;
}
         Cells[6,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[7,i+1] := ''
         else
           Cells[7,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);



         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);
         Objects[2,i+1] := TObject(ENEstimateItemList.list[i].accountingTypeRefCode);

         eiLastRow := i + 1;
         sgDismount.RowCount := eiLastRow + 1;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     eiColCount := eiColCount + 1;
     sgDismount.Row := 1;

     sgENEstimateItemClick(sgDismount);

end;


procedure TfrmRQFKOrderItemEdit.sgENEstimateItemClick(Sender: TObject);
var
  j, accountingTypeCode : Integer;
begin
     ClearGrid(sgFINUnmount);

     // выведем список ФИН материалов .... если они есть ВААЩЕ ...
    try
      j := StrToInt( TAdvStringGrid(Sender).Cells[0, TAdvStringGrid(Sender).Row ]); //   (sgENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;  

  if Sender = sgDismount then
  begin
    accountingTypeCode := Integer(TAdvStringGrid(Sender).Objects[2, TAdvStringGrid(Sender).Row]);
    if accountingTypeCode = TK_ACCOUNTINGTYPE_TMC then
      updateFINMaterialsGrid(j, sgFINUnmount);
//    else
//    if accountingTypeCode = TK_ACCOUNTINGTYPE_COUNTER then
//      updateSCCounterGrid(j, sgSCCounter);

    //HideControls([gbSCCounter], accountingTypeCode <> TK_ACCOUNTINGTYPE_COUNTER);
    //HideControls([gbFINUnmount], accountingTypeCode <> TK_ACCOUNTINGTYPE_TMC);


  end;


end;

procedure TfrmRQFKOrderItemEdit.updateFINMaterialsGrid(estimateItemCode : Integer; stringGrid : TAdvStringGrid );
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  j,i: Integer;
  finList: FINMaterialsShortList; //List_;
  finFilter : FINMaterialsFilter;
begin
   for i:=1 to stringGrid.RowCount-1 do
     for j:=0 to stringGrid.ColCount-1 do
       stringGrid.Cells[j,i]:='';

  SetGridHeaders(FINMaterialsShortHeaders, stringGrid.ColumnHeaders);

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);
  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := estimateItemCode;

  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  {
  if ENPlanWorkObj.kind.code = ENPLANWORKKIND_CURRENT then
  begin

  end;
  }

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     stringGrid.RowCount:=High(finList.list)+2
  else
     stringGrid.RowCount:=2;

   with stringGrid do
    for i:=0 to High(finList.list) do
      begin
        Application.ProcessMessages;
        if finList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(finList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := finList.list[i].mat_name;
        Cells[2,i+1] := finList.list[i].mu_name;
        Cells[3,i+1] := finList.list[i].nn;

        if finList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := finList.list[i].quantity.DecimalString;

{перенесено в калк_прайс

        if finList.list[i].price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].price.DecimalString;
}
        if finList.list[i].calc_price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].calc_price.DecimalString;

        if finList.list[i].cost = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := finList.list[i].cost.DecimalString;


        Cells[7,i+1] := finList.list[i].div_name;

        Cells[8,i+1] := finList.list[i].rest_purpose_name;

        Cells[9,i+1] := finList.list[i].partner_name;

        if finList.list[i].doc_date = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(finList.list[i].doc_date);

        Cells[11,i+1] := finList.list[i].party_discription;

        Cells[12,i+1] := IntToStr(finList.list[i].party_id);

        Cells[13, i+1] := finList.list[i].userGen ;

        if finList.list[i].dateEdit <> nil then
          Cells[14, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
        else
          Cells[14, i+1] := '';

        {
        Cells[5,i+1] := finList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);
        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+1] := FINMaterialsList.list[i].frc_name;
        if FINMaterialsList.list[i].calc_price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;
        LastRow:=i+1;
        }
        stringGrid.RowCount:= i + 2;
      end;
   //ColCount:=ColCount+1;
   stringGrid.Row:=1;



end;

procedure TfrmRQFKOrderItemEdit.actDeleteDismountExecute(Sender: TObject);
var
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ObjCode: Integer;
begin

  if pcItemData.ActivePage = tsDismount then
  begin
     TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
     try
       ObjCode := StrToInt(sgDismount.Cells[0,sgDismount.Row]);
     except
       on EConvertError do Exit;
     end;

     TempENEstimateItem.removeUnmountCountersWriteOff(ObjCode);

          UpdateGrid(Sender);
     end;

  end; //pcPlanWork.ActivePage = tsDismount



procedure TfrmRQFKOrderItemEdit.btnTKMeasurementTkMeasurementClick(
  Sender: TObject);
var 
   frmTKMeasurementShow: TfrmTKMeasurementShow;
begin
   frmTKMeasurementShow:=TfrmTKMeasurementShow.Create(Application,fmNormal);
   try
      with frmTKMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               RQFKOrderItemObj.measurementtwounits := GetReturnValue(sgTKMeasurement,1);
               edtMeasurementTwoUnits.Text := GetReturnValue(sgTKMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMeasurementShow.Free;
   end;
end;

procedure TfrmRQFKOrderItemEdit.btnEPRenClearClick(Sender: TObject);
begin
  inherited;
             edtMeasurementTwoUnits.Text := '';
             RQFKOrderItemObj.measurementtwounits := '';
end;

procedure TfrmRQFKOrderItemEdit.spbOSIstClick(Sender: TObject);
var
  frmOSIstShow: TfrmOSIstShow;
  f: OSIstFilter;
begin
  f := OSIstFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := '(kod_ist < ''60'')';

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

procedure TfrmRQFKOrderItemEdit.spbOSSubschClick(Sender: TObject);
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
  f.conditionSQL := '(kod_subsch like (''15%'') or kod_subsch like (''10%'') or kod_subsch like (''12%''))';

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
        end
        else
          // сбросим после выбора счета, пусть вводят новый
          edtOSKod_zatr.Text := '';
        /////
      end;
  finally
    frmOSSubschShow.Free;
  end;
end;

procedure TfrmRQFKOrderItemEdit.spbOSVidClick(Sender: TObject);
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

procedure TfrmRQFKOrderItemEdit.spbOSPrivatClick(Sender: TObject);
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

procedure TfrmRQFKOrderItemEdit.spbOSGrClick(Sender: TObject);
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

procedure TfrmRQFKOrderItemEdit.spbOSKlassClick(Sender: TObject);
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

procedure TfrmRQFKOrderItemEdit.spbOSIstClearClick(Sender: TObject);
begin
  ClearControls([edtOSIstCode, edtOSIst]);
end;

procedure TfrmRQFKOrderItemEdit.spbOSSubschClearClick(Sender: TObject);
begin
  ClearControls([edtOSSubschCode, edtOSSubsch, edtOSKod_zatr]);
end;

procedure TfrmRQFKOrderItemEdit.spbOSVidClearClick(Sender: TObject);
begin
  ClearControls([edtOSVidCode, edtOSVid]);
  spbOSPrivatClearClick(Sender);
end;

procedure TfrmRQFKOrderItemEdit.spbOSPrivatClearClick(Sender: TObject);
begin
  ClearControls([edtOSPrivatCode, edtOSPrivat]);
end;

procedure TfrmRQFKOrderItemEdit.spbOSGrClearClick(Sender: TObject);
begin
  ClearControls([edtOSGrCode, edtOSGr]);
end;

procedure TfrmRQFKOrderItemEdit.spbOSKlassClearClick(Sender: TObject);
begin
  ClearControls([edtOSKlassCode, edtOSKlass]);
end;

procedure TfrmRQFKOrderItemEdit.updateOSDataTab;
var
  TempRQFKOrderItem2OSData: RQFKOrderItem2OSDataControllerSoapPort;
  osDataFilter: RQFKOrderItem2OSDataFilter;
  osDataList: RQFKOrderItem2OSDataShortList;
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
                ,edtOSPrimechan, memOSCharacters
                ,edtOSKod_nal_nakl
                ,edtOSNum_un, edtOSKod_inv]);

  ///// Значения по умолчанию
  edtOSSubschCode.Text := '1520';
  edtOSSubsch.Text := 'ПРИОБРЕТЕНИЕ ОСНОВНЫХ СРЕДСТВ';
  edtOSGrCode.Text := '1';
  edtOSGr.Text := 'ПРОМЫШЛЕННО-ПРОИЗВ.ОС';

  edtOSKod_zatr.Text := '000000000000000';

  edtOSSum_st_perv_n.Text := edtSumWithoutNds.Text;
  edtOSKod_nal_nakl.Text := numberDoc;
  /////

  OSData := nil;

  osDataFilter := RQFKOrderItem2OSDataFilter.Create;
  SetNullIntProps(osDataFilter);
  SetNullXSProps(osDataFilter);

  osDataFilter.fkOrderItemRef := RQFKOrderItemRef.Create;
  osDataFilter.fkOrderItemRef.code := RQFKOrderItemObj.code;

  TempRQFKOrderItem2OSData := HTTPRIORQFKOrderItem2OSData as RQFKOrderItem2OSDataControllerSoapPort;

  osDataList := TempRQFKOrderItem2OSData.getScrollableFilteredList(osDataFilter, 0, -1);
  if osDataList.totalCount > 0 then
  begin
    if osDataList.list[0] <> nil then
      if osDataList.list[0].code > LOW_INT then
        OSData := TempRQFKOrderItem2OSData.getObject(osDataList.list[0].code);
  end
  else
    OSData := nil;

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
        edtOSSum_st_perv_n.Text := edtSumWithoutNds.Text;

      edtOSKod_zatr.Text := OSData.kod_zatr;

      edtOSKod_oborud.Text := OSData.kod_oborud;

      edtOSPrimechan.Text := OSData.primechan;
      MakeMultiline(memOSCharacters.Lines, OSData.characters);

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

procedure TfrmRQFKOrderItemEdit.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(OSData) then
    OSData.Free;
end;

procedure TfrmRQFKOrderItemEdit.btnOSDataSaveClick(Sender: TObject);
var TempRQFKOrderItem2OSData: RQFKOrderItem2OSDataControllerSoapPort;
    newOSDataCode: Integer;
    str: String;
begin
  if not NoBlankValues([edtOSIstCode, edtOSSubschCode, edtOSVidCode, edtOSPrivatCode,
                        edtOSGrCode, edtOSSum_st_perv_n, edtOSKod_nal_nakl,
                        edtOSKod_zatr]) then
  begin
    Application.MessageBox(PChar('Заповніть, будь ласка, обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING);
    AllowClose := false;
    Exit;
  end;

  ///// 29.11.12 Пожелания бухгалтерии
  // Если 10-й или 12-й счет - то "Код затрат №1" <> 15 нулей
  str := Copy(edtOSSubschCode.Text, 1, 2);
  if (str <> '15') and (edtOSKod_zatr.Text = '000000000000000') then
  begin
    Application.MessageBox(PChar('Неприпустиме значення в полі "Код витрат №1" для рахунку ' + edtOSSubschCode.Text + '!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtOSKod_zatr.SetFocus;
    AllowClose := false;
    Exit;
  end;
  /////  

  TempRQFKOrderItem2OSData := HTTPRIORQFKOrderItem2OSData as RQFKOrderItem2OSDataControllerSoapPort;

  if OSData = nil then
  begin
    OSData := RQFKOrderItem2OSData.Create;
    //OSData.code := LOW_INT;
    SetNullIntProps(OSData);
    SetNullXSProps(OSData);

    OSData.fkOrderItemRef := RQFKOrderItemRef.Create;
    OSData.fkOrderItemRef.code := RQFKOrderItemObj.code;
  end
  else begin
    if OSData.code > LOW_INT then
      OSData := TempRQFKOrderItem2OSData.getObject(OSData.code)
    else
      raise Exception.Create('Помилка під час вибору бух. даних для ОЗ!');
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

  //////////////////////////////////////////////////////////
  str := Copy(edtOSSubschCode.Text, 1, 2);
  if str = '15' then
  begin
    OSData.id_amort := LOW_INT;
    OSData.kod_amort := '';
    OSData.name_amort := '';

    OSData.kod_am := LOW_INT;
    OSData.name_am := '';

    OSData.kod_am_n := LOW_INT;
    OSData.name_am_n := '';

    OSData.use_limit := LOW_INT;
    OSData.use_limit_n := LOW_INT;
  end;
  //////////////////////////////////////////////////////////

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

  Application.MessageBox(PChar('Дані збережено!'), PChar('Інформація'), MB_ICONINFORMATION);
  AllowClose := true;
  updateOSDataTab();
  LockUnlockOSData();
end;

procedure TfrmRQFKOrderItemEdit.LockUnlockOSData(lock: Boolean);
begin
  // Если ордер не в статусе "Складений", ничего не разлочиваем !!!
  if not (statusCode in [RQFKORDER_STATUS_CREATED
  , RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE]) then
  begin
    DisableControls([spbOSIst, spbOSIstClear,
                     spbOSSubsch, spbOSSubschClear,
                     spbOSVid, spbOSVidClear,
                     spbOSPrivat, spbOSPrivatClear,
                     spbOSGr, spbOSGrClear,
                     spbOSKlass, spbOSKlassClear,

                     rdbOSF_amortY, rdbOSF_amortN,
                     dtpOSDt_vypusk,
                     edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n,
                     edtOSKod_nal_nakl,
                     edtOSKod_zatr, edtOSKod_oborud,
                     edtOSPrimechan, memOSCharacters]);

    DisableControls([btnOSDataEdit, btnOSDataSave, btnOSDataCancel]);

    Exit;
  end;

  DisableControls([spbOSIst, spbOSIstClear,
                   spbOSSubsch, spbOSSubschClear,
                   spbOSVid, spbOSVidClear,
                   spbOSPrivat, spbOSPrivatClear,
                   spbOSGr, spbOSGrClear,
                   spbOSKlass, spbOSKlassClear,

                   rdbOSF_amortY, rdbOSF_amortN,
                   dtpOSDt_vypusk,
                   edtOSSum_izn_perv, edtOSSum_izn_perv_n, edtOSSum_st_perv_n,
                   edtOSKod_nal_nakl,
                   edtOSKod_zatr, edtOSKod_oborud,
                   edtOSPrimechan, memOSCharacters], lock);

  // Лочим/разлочиваем кнопки "Редагувати", "Зберегти" и "Відмінити" (в зависимости от режима)
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
end;

procedure TfrmRQFKOrderItemEdit.btnOSDataEditClick(Sender: TObject);
begin
  LockUnlockOSData(false);
end;

procedure TfrmRQFKOrderItemEdit.btnOSDataCancelClick(Sender: TObject);
begin
  updateOSDataTab();
  LockUnlockOSData();
end;

procedure TfrmRQFKOrderItemEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  // Если начали редактировать, но не сохранили
  if btnOSDataSave.Enabled then
  begin
    if Application.MessageBox(PChar('Зберегти зміни у бух. даних для ОЗ ?'),
                              PChar('Увага !'),
                              MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES then
    begin
      btnOSDataSaveClick(Sender);
      CanClose := AllowClose;
    end
    else
      btnOSDataCancelClick(Sender);
  end;
end;

procedure TfrmRQFKOrderItemEdit.pcItemDataChanging(Sender: TObject;
  var AllowChange: Boolean);
var Answer: Integer;
begin
  // Если начали редактировать, но не сохранили
  {
  if btnOSDataSave.Enabled then
  begin
    if Application.MessageBox(PChar('Зберегти зміни у бух. даних для ОЗ ?'),
                              PChar('Увага !'),
                              MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES then
    begin
      btnOSDataSaveClick(Sender);
      AllowChange := AllowClose;
    end
    else
      btnOSDataCancelClick(Sender);
  end;
  }
  if btnOSDataSave.Enabled then
  begin
    Answer := Application.MessageBox(PChar('Зберегти зміни у бух. даних для ОЗ ?'),
                                     PChar('Увага !'),
                                     MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1);
    if Answer = IDYES then
    begin
      btnOSDataSaveClick(Sender);
      AllowChange := AllowClose;
    end
    else if Answer = IDNO then
    begin
      btnOSDataCancelClick(Sender);
    end
    else begin
      AllowChange := false;
    end;
  end;
end;

procedure TfrmRQFKOrderItemEdit.edtSumWithoutNdsChange(Sender: TObject);
var sumWithoutNds, sumNds: Double;
begin
  try
    sumWithoutNds := StrToFloat(edtSumWithoutNds.Text);
  except
    on EConvertError do
      sumWithoutNds := 0;
  end;

  try
    sumNds := StrToFloat(edtSumNds.Text);
  except
    on EConvertError do
      sumNds := 0;
  end;

  edtSumGen.Text := FloatToStr(Conv(sumWithoutNds + sumNds, 2));

  edtOSSum_st_perv_n.Text := edtSumWithoutNds.Text;
end;

procedure TfrmRQFKOrderItemEdit.edtSellingPriceWithoutNdsChange(Sender: TObject);
var sellingPrice, count : Double;
begin
  try
    sellingPrice := StrToFloat(edtSellingPriceWithoutNds.Text);
  except
    on EConvertError do
      sellingPrice := 0;
  end;

  try
    count := StrToFloat(edtCountGen.Text);
  except
    on EConvertError do
      count := 0;
  end;

  edtSellingSumWithoutNds.Text := FloatToStr(Conv(sellingPrice * count, 2));
end;


procedure TfrmRQFKOrderItemEdit.spbRQStorageZoneClick(Sender: TObject);
var zoneFilter: RQStorageZoneFilter;
    frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin
  if DialogState <> dsEdit then Exit;
  
  if molOutCode = '' then
  begin
    Application.MessageBox(PChar('На ордері не обрано МВО-отримувача!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if storageCode = LOW_INT then
  begin
    Application.MessageBox(PChar('На ордері не вказано склад!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;


  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

  zoneFilter.conditionSQL :=
    //  05.10.2012 +++ склад на документе == складу зоны хранения
    ' rqstoragezone.storagecode = ' + IntToStr(storageCode) +
    ' and rqstoragezone.code in ' +
    ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
    '  where sm.molrefcode in ' +
    '    (select m.code from enmol m where m.fincode = ''' + molOutCode + ''')) ';
  zoneFilter.orderBySQL := 'rqstoragezone.name';

  frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
  try
    frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                         frmRQStorageZoneShow.actDelete,
                                         frmRQStorageZoneShow.actEdit]);
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
          if RQFKOrderItemObj.zoneRef = nil then RQFKOrderItemObj.zoneRef := RQStorageZoneRef.Create();
          RQFKOrderItemObj.zoneRef.code := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          edtRQStorageZone.Text := GetReturnValue(sgRQStorageZone, 1) + '. ' +
                                   GetReturnValue(sgRQStorageZone, 2);
        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;

procedure TfrmRQFKOrderItemEdit.spbRQStorageZoneClearClick(
  Sender: TObject);
begin
  if DialogState <> dsEdit then Exit;
  
  RQFKOrderItemObj.zoneRef := nil;
  edtRQStorageZone.Text := '';
end;

function TfrmRQFKOrderItemEdit.isRQFKOrderForStorage(orderKindCode : Integer) : Boolean;
var
output : Boolean;
begin
    if (orderKindCode in [RQFKORDER_KIND_RASHOD_TO_STORAGE, RQFKORDER_KIND_PRIHOD_POSTAVKA,
                          RQFKORDER_KIND_ZONE_CHANGING]) then
        output := True
    else
        output := False;

    Result := output;
end;

end.

