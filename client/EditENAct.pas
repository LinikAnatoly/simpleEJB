unit EditENAct;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons, EnergyproController, EnergyproController2,
  ENActController, ExtCtrls, ENAct2HumenController, ShellAPI, AdvObj,
  RQFKOrderController, RQFKOrderKindController, ShowRQFKOrder,
  ENAct2RQFKOrderController, ENAct2RQFKOrderTypeController, EditRQFKOrder,
  tmsAdvGridExcel, ShowKau, EditKauFilter, KauController,
  ENAct2FinInfoProvController, ENAct2DFDocDecreeController,
  EditENAct2DFDocDecree, ShowENWarrant, ENWarrantController,
  ENWarrantTypeController, ENSettingForDFDecreeController,
  EditENSettingForDFDecree, ENDepartmentController, TB2Item, TB2Dock, TB2Toolbar,
  DFDocSignerController, User2StaffingController
  ;


type
  TfrmENActEdit = class(TDialogForm)
    pcENActs: TPageControl;
    tsAct: TTabSheet;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    lblFinDocCode: TLabel;
    lblFinMolCode: TLabel;
    edtFinMolCode: TEdit;
    lblFinMolName: TLabel;
    edtFinMolName: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen_: TEdit;
    lblUserGen: TLabel;
    edtUserGen: TEdit;
    lblDateEdit: TLabel;
    edtDateEdit: TDateTimePicker;
    spbENElementElement: TSpeedButton;
    edtENElementElementName: TEdit;
    lblENElementElementName: TLabel;
    HTTPRIOENAct: THTTPRIO;
    spbFINMol: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    tsPlans: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENAct2ENPlanWork: TAdvStringGrid;
    ImageList1: TImageList;
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
    HTTPRIOENPlanWork: THTTPRIO;
    tsMaterials: TTabSheet;
    tsWorkItems: TTabSheet;
    tsHumens: TTabSheet;
    tsTransports: TTabSheet;
    btnPrintAct: TButton;
    Label1: TLabel;
    lblWorkState: TLabel;
    Label2: TLabel;
    lblFinMechanicCode: TLabel;
    lblFinMechanicName: TLabel;
    edtFinMechanicCode: TEdit;
    edtFinMechanicName: TEdit;
    spbFINMechanic: TSpeedButton;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    HTTPRIOENPlanWorkState: THTTPRIO;
    btnCloseAct: TButton;
    sgENTransportItem: TAdvStringGrid;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOENTransportItem: THTTPRIO;
    sgENPlanWorkItem: TAdvStringGrid;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOFINMaterials: THTTPRIO;
    sgFINMaterials: TAdvStringGrid;
    tsValidateMaterials: TTabSheet;
    Panel1: TPanel;
    sgFINActMaterials: TAdvStringGrid;
    Panel2: TPanel;
    sgFINAllMaterials: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label3: TLabel;
    pnlTotalAct: TPanel;
    Label4: TLabel;
    pnlTotalFin: TPanel;
    HTTPRIOENAct2ENPlanWork: THTTPRIO;
    gbFKData: TGroupBox;
    lblFKMOLdocCode: TLabel;
    lblFKMeachanicDocCode: TLabel;
    edtFINMOLDocCode: TEdit;
    edtFINMechanicDocCode: TEdit;
    HTTPRIOFINDoc2Act: THTTPRIO;
    lblPK: TLabel;
    edtCode: TEdit;
    btnPrintAct2: TButton;
    actGB: TGroupBox;
    sgENAct2Humen: TAdvStringGrid;
    HTTPRIOENAct2Humen: THTTPRIO;
    cbHumen: TGroupBox;
    sgENHumenItem: TAdvStringGrid;
    gbMOLData: TGroupBox;
    sgFINMolData: TAdvStringGrid;
    HTTPRIOFINMolData: THTTPRIO;
    edtCommentGen: TMemo;
    btnPrintActRelations: TButton;
    btnUndoSignature: TButton;
    edtTabNumber: TEdit;
    lblTabNumber: TLabel;
    btnRelatedTabNumber: TButton;
    lblDateAct: TLabel;
    edtDateAct: TDateTimePicker;
    HTTPRIOENEstimateItem: THTTPRIO;
    btnChangeDateMove: TButton;
    btnMoveToReversed: TButton;
    tsProducedMaterials: TTabSheet;
    ToolBar2: TToolBar;
    tbSetZone: TToolButton;
    actSetZone: TAction;
    HTTPRIORQStorage2ENMol: THTTPRIO;
    HTTPRIORQStorageZone: THTTPRIO;
    sgProducedMaterials: TAdvStringGrid;
    tsAct2ServicesFromSide: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    sgActsServicesFS: TAdvStringGrid;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIOENAct2RQFKOrder: THTTPRIO;
    lblIstOS: TLabel;
    edtOSIstCode: TEdit;
    edtOSIst: TEdit;
    spbOSIst: TSpeedButton;
    spbOSIstClear: TSpeedButton;
    HTTPRIOENPlanWorkENAct2OSData: THTTPRIO;
    tsSCUsageInput: TTabSheet;
    sgSCUsageInput: TAdvStringGrid;
    HTTPRIOSCUsageInput: THTTPRIO;
    HTTPRIOSCUsageInputItem: THTTPRIO;
    HTTPRIOSCUsageInputItemOZ: THTTPRIO;
    gbFinKodIst: TGroupBox;
    ToolBar4: TToolBar;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    sgENAct2FinKodIst: TAdvStringGrid;
    HTTPRIOENAct2FinKodIst: THTTPRIO;
    actAddFinKodIst: TAction;
    actDeleteFinKodIst: TAction;
    HTTPRIOSCSeal: THTTPRIO;
    tsPostings: TTabSheet;
    PopupOtherProvs: TPopupMenu;
    workExcel: TAdvGridExcelIO;
    lblMolObjectMNMA: TLabel;
    edtMolObjectMNMA: TEdit;
    spbMolObjectMNMA: TSpeedButton;
    HTTPRIOENElement: THTTPRIO;
    mExportExcelOtherProvs: TMenuItem;
    PopupMaterialProvs: TPopupMenu;
    MenuItem2: TMenuItem;
    HTTPRIOENMol: THTTPRIO;
    HTTPRIOENAct2Prov: THTTPRIO;
    HTTPRIOENActPostingKind: THTTPRIO;
    tsDecree: TTabSheet;
    ActionListDecree: TActionList;
    ActionDecreeView: TAction;
    ActionDecreeInsert: TAction;
    ActionDecreeDelete: TAction;
    Action4: TAction;
    actUpdateDfDocDecree: TAction;
    Action6: TAction;
    Action7: TAction;
    sgDFDocDecree: TAdvStringGrid;
    PopupMenuDecree: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    ImageList2: TImageList;
    ToolBar5: TToolBar;
    ToolButton10: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    HTTPRIODFDocSetting: THTTPRIO;
    edtPartner: TEdit;
    lblPartner: TLabel;
    HTTPRIOENGeneralContracts: THTTPRIO;
    PageControl1: TPageControl;
    tsPostingList: TTabSheet;
    tsPostingFinInfo: TTabSheet;
    gbMaterialProvs: TGroupBox;
    sgMaterialProvs: TAdvStringGrid;
    gbOtherProvs: TGroupBox;
    sgOtherProvs: TAdvStringGrid;
    grpPostingInfo: TGroupBox;
    lblPostingKind: TLabel;
    spbPostingKind: TSpeedButton;
    edtPostingKind: TEdit;
    chkIsIncomeAct: TCheckBox;
    btnSavePostingInfo: TButton;
    gbKau1476: TGroupBox;
    spbKau1476: TSpeedButton;
    spbKau1476Clear: TSpeedButton;
    edtKau1476: TEdit;
    edtKauName1476: TEdit;
    gbKau1783: TGroupBox;
    spbKau1783: TSpeedButton;
    spbKau1783Clear: TSpeedButton;
    edtKau1783: TEdit;
    edtKauName1783: TEdit;
    HTTPRIOENAct2FinInfoProv: THTTPRIO;
    btnSavePostingFinInfo: TButton;
    HTTPRIOENAct2DFDocDecree: THTTPRIO;
    HTTPRIOENWarrant: THTTPRIO;
    HTTPRIODFDocDecree: THTTPRIO;
    HTTPRIOENSettingForDFDecree: THTTPRIO;
    tsDFDoc: TTabSheet;
    alDoc: TActionList;
    actClearDFDocSigners: TAction;
    actViewDFDoc: TAction;
    actUpdateDFDocs: TAction;
    gbDFDocSigners: TGroupBox;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    sgDFDocSigners: TAdvStringGrid;
    gbDFDocs: TGroupBox;
    ToolBar18: TToolBar;
    ToolButton95: TToolButton;
    ToolButton101: TToolButton;
    sgDFDocs: TAdvStringGrid;
    btnOk: TButton;
    btnCancel: TButton;
    actSaveDFDocSigners: TAction;
    TBItem2: TTBItem;
    tsENACTINVEST2DFDOC: TTabSheet;
    PopupMenuActDf: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    ActionListActDf: TActionList;
    ActInsertActInvest2dfdoc: TAction;
    ActDeleteActInvest2dfdoc: TAction;
    ActEditActInvest2dfdoc: TAction;
    ActUpdateActInvest2dfdoc: TAction;
    ToolBar6: TToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    sgENActInvest2DFDoc: TAdvStringGrid;
    HTTPRIOENActInvest2DFDoc: THTTPRIO;
    ActViewActInvest2dfdoc: TAction;

    procedure UpdateGrid(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
    procedure spbENElementElementClick(Sender : TObject);
    procedure spbFINMolClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure pcENActsChange(Sender: TObject);
    procedure btnPrintActClick(Sender: TObject);
    procedure edtDateGenExit(Sender: TObject);
    procedure spbFINMechanicClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure btnCloseActClick(Sender: TObject);
    //procedure Button1Click(Sender: TObject);
    procedure sgFINActMaterialsClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintAct2Click(Sender: TObject);
    procedure fillActHumens(humenKind : Integer);

    procedure LoadMOLData(actCode : Integer);
    procedure btnPrintActRelationsClick(Sender: TObject);
    procedure btnUndoSignatureClick(Sender: TObject);
    procedure btnRelatedTabNumberClick(Sender: TObject);
    procedure btnChangeDateMoveClick(Sender: TObject);
    procedure btnMoveToReversedClick(Sender: TObject);
    procedure checkIfActIsReversed;
    procedure actSetZoneExecute(Sender: TObject);
    procedure updateProduced();
    procedure spbOSIstClick(Sender: TObject);
    procedure spbOSIstClearClick(Sender: TObject);
    procedure sgSCUsageInputClick(Sender: TObject);
    procedure updateFinKodIst();
    procedure actAddFinKodIstExecute(Sender: TObject);
    procedure actDeleteFinKodIstExecute(Sender: TObject);
    procedure getPostingsList(enActObjectCode: Integer);
    procedure mExportExcelOtherProvsClick(Sender: TObject);
    procedure spbMolObjectMNMAClick(Sender: TObject);
    procedure ExportExcelProvs(isMaterials : Boolean);
    procedure mExportExcelMaterialProvsClick(Sender: TObject);
    procedure btnSavePostingInfoClick(Sender: TObject);
    procedure spbPostingKindClick(Sender: TObject);
    procedure ActionDecreeViewExecute(Sender: TObject);
    procedure ActionDecreeInsertExecute(Sender: TObject);
    procedure ActionDecreeDeleteExecute(Sender: TObject);
    procedure spbKau1476Click(Sender: TObject);
    procedure spbKau1783Click(Sender: TObject);
    procedure spbKau1476ClearClick(Sender: TObject);
    procedure spbKau1783ClearClick(Sender: TObject);
    procedure actViewEnact2FinInfo(actCode: Integer);
    procedure btnSavePostingFinInfoClick(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure actUpdateDfDocDecreeExecute(Sender: TObject);
    procedure actClearDFDocSignersExecute(Sender: TObject);
    procedure actViewDFDocExecute(Sender: TObject);
    procedure actUpdateDFDocsExecute(Sender: TObject);
    procedure actSaveDFDocSignersExecute(Sender: TObject);
    procedure ActInsertActInvest2dfdocExecute(Sender: TObject);
    procedure ActEditActInvest2dfdocExecute(Sender: TObject);
    procedure ActDeleteActInvest2dfdocExecute(Sender: TObject);
    procedure ActUpdateActInvest2dfdocExecute(Sender: TObject);
    procedure ActViewActInvest2dfdocExecute(Sender: TObject);
    procedure sgENActInvest2DFDocDblClick(Sender: TObject);
  private
    { Private declarations }
    replaceCounter, ozToReplaceCounterServices : Boolean;

    procedure initDFDocsTab;
    procedure initDFDocSignersGrid(setDefaultSigners: Boolean = true);
    procedure loadDFDocSigners;
    function getDFDocSignersForSaving(var dfDocSigners: ArrayOfDFDocSigner): Boolean;
    procedure updateDFDocs;
  public
    { Public declarations }
    ENActObj: ENAct;
    planCode : Integer;
    enact2postingKindcode : Integer;
  end;

var
  ENAct2FinInfoProvObj : ENAct2FinInfoProv;
  frmENActEdit: TfrmENActEdit;

  renCode, molCode : Integer;

  actHasSeals : Boolean;

  actHumenFilter : ENAct2HumenFilter;

  FinKodIstColCount, FinKodIstLastCount: Integer;
  FinKodIstLastRow: Integer = 1;
  ENAct2FinKodIstHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );

  ENAct2HumenHeaders: array [1..9] of String =
        ( 'Код'
          ,'№ по порядку'
          ,'таб №'
          ,'ФИО/должность'
          ,'оклад в мес'
          ,'часов в мес'
          ,'зп в час'
          ,'часов отработано фактически'
          ,'Зарплата'
        );


  ENAct2ENPlanWorkHeaders: array [1..4] of String =
        ( 'Код'
        ,'№ наряду'
        ,'дата виконання'
        ,'вид ремонту'
        );

  ENPlanWorkItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'Джерело нормативу'
          ,'Кількість'
          ,'Норма часу на од.'
          ,'Всього часу'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );

{
  FINMaterialsShortHeaders: array [1..8] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'МОЛ'
          //,'тип строки кошторису'
          //,'користувач, що вніс зміни'
          //,'дата останньої зміни'
        );
}
  FINMaterialsShortHeaders: array [1..8] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Номенклатурний номер'
          ,'Од. виміру'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'Призначення залишку'
          //,'тип строки кошторису'
          //,'користувач, що вніс зміни'
          //,'дата останньої зміни'
        );

  ENHumenItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Посада нормативна'
          ,'Посада штатна'
          ,'Робітник'
          ,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Код роботи'
          ,'Робота'
          ,'Ціна нормочасу'
          ,'Вартість нормочасу'
          ,'Користувач що вніс зміни'
          ,'Дата останньої зміни'
        );
        
   ENTransportItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Транспорт штатний'
          ,'Робітник'
          ,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Код роботи'
          ,'Робота'
          ,'Ціна нормочасу'
          ,'Вартість нормочасу'
          ,'Користувач що вніс зміни'
          ,'Дата останньої зміни'
        );


  FINMolDataHeaders: array [1..5] of String =
        ( 'Код'
          ,'код МОЛа из фин.кол.'
          ,'ФИО МОЛа с фин.кол.'
          ,'Мобільний номер'
          ,'Тип МОЛа'
        );

  ActsServicesFSHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Код постачальника'
          ,'Постачальник'
          ,'сума (без ПДВ)'
          ,'Статус'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
        );

  SCUsageInputHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата складання'
          ,'Дата початку'
          ,'Дата закінчення'
          ,'Код МВО'
          ,'ПІБ МВО'
          ,'Підрозділ'
          ,'Статус'
          ,'Дата зміни'
          ,'Користувач'
        );

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

          DFDocDecreeHeaders: array [1..5] of String =
      ( 'Код'
        ,'Номер розпорядження'
        ,'Дата розпорядження'
        ,'Заголовок розпорядження'
        ,'Стан'
      );


      ENActInvest2DFDocHeaders: array [1..8] of String =
        ( 'Код'
          ,'код звязаного документу з документообігу'
          ,'код типу звязаного документу з документообігу'
          ,'Номер звязаного документу з документообігу'
          ,'Дата реєстрації звязаного документу з документообігу'
          ,'Короткий зміст звязаного документу з документообігу'
          ,'Примітка'
          ,'Тип Розпорядження/Наказу'

        );

implementation

uses
  ShowENElement, ENElementController, FINMolController, ShowFINMol, ENDepartment2EPRenController,
  ENAct2ENPlanWorkController, EditENAct2ENPlanWork, ShowENPlanWork,
  ENPlanWorkController, ENPlanWorkKindController, ENConsts,
  ENPlanWorkStatusController, DMReportsUnit, ENPlanWorkStateController,
  ShowENPlanWorkState, ENHumenItemController, ENTransportItemController,
  ENPlanWorkItemController, FINMaterialsController,
  FINMaterialsStatusController, EditENPlanWork, //FINDoc2ActController,
  FINDocTypeController, ENHumenItemKindController, FINMolDataController,
  ENPlan2HumenController, Globals,ENEstimateItemController,
  ENEstimateItemKindController, ENServicesObjectController, RQStorageZoneController,
  ShowRQStorageZone, RQStorage2ENMolController, ShowOSIst, OSIstController,
  ENPlanWorkENAct2OSDataController, SCUsageInputController, EditSCUsageInput,
  SCUsageInputItemController, SCUsageInputItemOZController,
  ENAct2FinKodIstController, EditENAct2FinKodIst, SCSealController, FKProvObjectController, ShowENMol, ENMolController, ENMolTypeController, ENMolStatusController,
  ENAct2ProvController, ENActPostingKindController, ShowENActPostingKind,
  EditDFDocDecree, DFDocDecreeController, DFDocSettingController, DFConsts,
  ENGeneralContractsController, ShowDocumentManagement,
  ENActInvest2DFDocController, EditENActInvest2DFDoc;

{uses  
    EnergyproController, EnergyproController2, ENActController  ;
}
{$R *.dfm}

procedure TfrmENActEdit.updateDFDocs;
begin
  if DialogState = dsInsert then Exit;
  if ENActObj = nil then Exit;
  if ENActObj.code = LOW_INT then Exit;

  DMReports.fillDFDocsGrid(ENActObj, Self, sgDFDocs);
end;

procedure TfrmENActEdit.updateFinKodIst();
var
  TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
  i: Integer;
  ENAct2FinKodIstList: ENAct2FinKodIstShortList;
  fkiFilter : ENAct2FinKodIstFilter;
  begin

  ClearGrid(sgENAct2FinKodIst);

  SetGridHeaders(ENAct2FinKodIstHeaders, sgENAct2FinKodIst.ColumnHeaders);
  TempENAct2FinKodIst :=  HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;

     fkiFilter := ENAct2FinKodIstFilter.Create;
     SetNullIntProps(fkiFilter);
     SetNullXSProps(fkiFilter);
     fkiFilter.actRef:= ENActRef.Create;
     fkiFilter.actRef.code := ENActObj.code;

  ENAct2FinKodIstList := TempENAct2FinKodIst.getScrollableFilteredList(fkiFilter,0,-1);

  FinKodIstLastCount:=High(ENAct2FinKodIstList.list);

  if FinKodIstLastCount > -1 then
     sgENAct2FinKodIst.RowCount:=FinKodIstLastCount+2
  else
     sgENAct2FinKodIst.RowCount:=2;

   with sgENAct2FinKodIst do
    for i:=0 to FinKodIstLastCount do
      begin
        Application.ProcessMessages;
        if ENAct2FinKodIstList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAct2FinKodIstList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAct2FinKodIstList.list[i].kodIstRefName;

        FinKodIstLastRow:=i+1;
        sgENAct2FinKodIst.RowCount:=FinKodIstLastRow+1;
      end;
   sgENAct2FinKodIst.Row:=1;
  end;

procedure TfrmENActEdit.LoadMOLData(actCode : Integer);
var
  i,j : Integer;
  f : FINMOLDataFilter;
  TempFINMolData: FINMolDataControllerSoapPort;
  FINMolDataList: FINMolDataShortList;
begin
   for i := 1 to  sgFINMolData.RowCount - 1 do
     for j := 0 to sgFINMOLData.ColCount - 1 do
       sgFINMolData.Cells[j,i] := '';
   sgFINMolData.RowCount := 2;

   f := FINMOLDataFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.act := ENAct.Create;
   f.act.code := actCode;
   f.orderBySQL := 'finmoldata.moltyperefcode';
   //f.conditionSQL := 'finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.ACTCODE = '+ IntToStr(actCode)+')';

   TempFINMolData :=  HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   FINMolDataList :=  TempFINMolData.getScrollableFilteredList(f, 0, -1);

   molCode := Low(Integer);

  if High(FINMolDataList.list) > -1 then
     sgFINMolData.RowCount:=High(FINMolDataList.list)+2
  else
     sgFINMolData.RowCount:=2;

   with sgFINMolData do
    for i:=0 to High(FINMolDataList.list) do
      begin
        Application.ProcessMessages;
        if FINMolDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMolDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINMolDataList.list[i].finMolCode;
        Cells[2,i+1] := FINMolDataList.list[i].finMolName;
        Cells[3,i+1] := FINMolDataList.list[i].phoneNumber;
        Cells[4,i+1] := FINMolDataList.list[i].molTypeRefName;

        if FINMolDataList.list[i].code <> Low(Integer) then
           molCode := FINMolDataList.list[i].code
        else molCode := Low(Integer);

        sgFINMolData.RowCount:=High(FINMolDataList.list)+2;
      end;
   sgFINMolData.Row:=1;

end;

procedure TfrmENActEdit.ExportExcelProvs(isMaterials : Boolean);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    if isMaterials then begin
      workExcel.AdvStringGrid := sgMaterialProvs;
    end else begin
      workExcel.AdvStringGrid := sgOtherProvs;
    end;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('request') + '.xls';

    workExcel.XLSExport(FileName);
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

procedure TfrmENActEdit.mExportExcelMaterialProvsClick(Sender: TObject);
begin
  inherited;
  Self.ExportExcelProvs(True);
end;

procedure TfrmENActEdit.mExportExcelOtherProvsClick(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  Self.ExportExcelProvs(False);
end;

procedure TfrmENActEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 if pcENActs.ActivePage = tsPlans then
 begin
   for i:=1 to sgENAct2ENPlanWork.RowCount-1 do
     for j:=0 to sgENAct2ENPlanWork.ColCount-1 do
       sgENAct2ENPlanWork.Cells[j,i]:='';
 end;


 pcENActsChange(Sender);
end;


procedure TfrmENActEdit.FormShow(Sender: TObject);
var
  list : ENElementShortList;
  f : ENElementFilter;
  TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
  stateObj : ENPlanWorkState;
  i: Integer;

  //TempFINDoc2Act: FINDoc2ActControllerSoapPort;
  //f2aFilter : FINDoc2ActFilter;
  //FINDoc2ActList: FINDoc2ActShortList;

  TempENPlanWorkENAct2OSData: ENPlanWorkENAct2OSDataControllerSoapPort;
  ENPlanWorkENAct2OSDataList: ENPlanWorkENAct2OSDataShortList;
  ENPlanWorkENActosdatafilter : ENPlanWorkENAct2OSDataFilter;

  TempSCSeal : SCSealControllerSoapPort;
  sealFilter : SCSealFilter;
  sealList : SCSealShortList;
  strInvNumber :string;
  eFilter : ENElementFilter;
  TempENElement: ENElementControllerSoapPort;
  TempENMol : ENMolControllerSoapPort;
  eList : ENElementShortList;
  molFilter : ENMolFilter;
  molList : ENMolShortList;

  TempENGeneralContracts: ENGeneralContractsControllerSoapPort;
  iGC: Integer;
  ENGeneralContractsList: ENGeneralContractsShortList;
  generalContractFil : ENGeneralContractsFilter;
begin
  //SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);
  //SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);
  actHasSeals := False;
  HideControls([gbFinKodIst]);
  DisableActions([actAddFinKodIst, actDeleteFinKodIst]);

  tsENACTINVEST2DFDOC.TabVisible := (DMReports.getLastVersionENIPItemCodeByActCode(ENActObj.code) > 0);

  tsSCUsageInput.TabVisible := False;
  tsDecree.TabVisible:= (not (DialogState = dsInsert))
  and ((ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_RECONSTRUCTION) or
       (ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_CAPITALBUILDER) );

  SetGridHeaders(SCUsageInputHeaders, sgSCUsageInput.ColumnHeaders);

  SetGridHeaders(ActsServicesFSHeaders, sgActsServicesFS.ColumnHeaders);

  pcENActs.ActivePage := tsAct;
  gbFKData.Visible := false;
  tsProducedMaterials.TabVisible := (not (DialogState = dsInsert)) and (ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_PRODUCTION);
  actSetZone.Enabled := (ENActObj.statusRef.code = ENConsts.ENACT_GOOD) and (DialogState <> dsView);
  // SUPP-30045 - отобразим вкладку и для актов доробки. что бы связать услуги сумма по которой будет учитываться в дорабатываемом материале
  tsAct2ServicesFromSide.TabVisible :=
    (not (DialogState = dsInsert)) and
    ((ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_TMC_TRANSFER) or (ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_REFINEMENT) or
     DMReports.checkActTypeForCountersStateVerification(ENActObj));

  if (DialogState = dsInsert) then
  begin
    DisableControls([spbENPlanWorkState]);

    // При вызове формы для добавления нового акта прячем все вкладки, кроме основной
    for i := 0 to pcENActs.PageCount - 1 do
      if pcENActs.Pages[i] <> tsAct then
        pcENActs.Pages[i].TabVisible := false;

    HideControls([btnPrintAct, btnCloseAct, gbMOLData, btnPrintActRelations,
                  lblTabNumber, edtTabNumber, btnRelatedTabNumber, btnUndoSignature,
                  gbFinKodIst]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtFinMolName, edtFinMechanicName, edtENElementElementName, edtWorkState , edtMolObjectMNMA ,edtPartner]);
    DenyBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtDateAct
      //,edtFinDocCode
      //,edtFinMolCode
      ,edtFinMolName
      ,edtFinMechanicName
      ,edtENElementElementName
      ,edtWorkState
      ,edtPostingKind
     ]);
   end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    TempSCSeal :=  HTTPRIOSCSeal as SCSealControllerSoapPort;
    sealFilter := SCSealFilter.Create;
    SetNullIntProps(sealFilter);
    SetNullXSProps(sealFilter);
    sealFilter.conditionSQL := ' scseal.estimateitemrefcode in ( '  +
					' select ei.code from enplanwork p, enestimateitem ei, ' +
					' enact2enplanwork a2p ' +
					' where p.code = a2p.plancode ' +
					' and ei.planrefcode = p.code ' +
					' and ei.kindrefcode = ' + IntToStr(ENConsts.ENESTIMATEITEMKIND_MATERIALS) +
					' and a2p.actrefcode = ' + IntToStr(ENActObj.code) + ')';
     sealList := TempSCSeal.getScrollableFilteredList(sealFilter,0,-1);

     if sealList.totalCount > 0 then
     actHasSeals := True;

     if actHasSeals then
     begin
       HideControls([gbFinKodIst],False);
       DisableActions([actAddFinKodIst, actDeleteFinKodIst],false);
     end;

    ozToReplaceCounterServices := DMReports.checkOzToReplaceCounterServices(ENActObj.code);
    if ((ENActObj.element.typeRef.code = ENConsts.EN_SERVICES_OBJECT) and (ozToReplaceCounterServices))
      then tsSCUsageInput.TabVisible := True;

    // 21.09.2012 +++ показываем кнопку изменения даты проведения
    if (ENActObj.statusRef.code = ENACT_SIGNATURE) then
    begin
      DisableControls([edtDateGen], False);
      btnChangeDateMove.Visible := True;
    end;

    if (ENActObj.statusRef.code = ENACT_CLOSED) then
      btnMoveToReversed.Visible := True
    else
      btnMoveToReversed.Visible := False;

    if(ENActObj.statusRef.code = ENACT_REVERSED) then
      btnCloseAct.Visible := False
    else
      btnCloseAct.Visible := True;

    DisableControls([spbFINMol, spbFINMechanic, spbENElementElement, spbENPlanWorkState]);

    SetGridHeaders(FINMolDataHeaders, sgFINMolData.ColumnHeaders);
    LoadMOLData(ENActObj.code);

   edtCode.Text := IntToStr(ENActObj.code);

   HideControls([btnUndoSignature]);

   SetIntStyle(edtTabNumber);
   DisableControls([edtTabNumber], False);

    // елс проведенный акт - перепишем капшион на кнопке проведения на ОТМЕНА проведения
  if  ENActObj.statusRef.code = ENACT_CLOSED  then
  begin
     DisableControls([spbKau1476,spbKau1476Clear,spbKau1783,spbKau1783Clear]);
     btnCloseAct.Caption := 'Видалити прийняття АКТУ';
     btnCloseAct.Top := 350;

     if actHasSeals then
      begin
        HideControls([gbFinKodIst],False);
        DisableActions([actAddFinKodIst, actDeleteFinKodIst]);
      end;

{
     gbFKData.Visible := true;
     DisableControls([edtFINMOLDocCode, edtFINMechanicDocCode]);
     // а тута дернем КОДЫ из таблицы соответсвий ;)
     TempFINDoc2Act :=  HTTPRIOFINDoc2Act as FINDoc2ActControllerSoapPort;
     f2aFilter := FINDoc2ActFilter.Create;
     SetNullXSProps(f2aFilter);
     SetNullIntProps(f2aFilter);
     f2aFilter.typeRef := FINDocTypeRef.Create;
     f2aFilter.typeRef.code  := 4 ; // типа 300 операция ...
     f2aFilter.actRef := ENActRef.Create;
     f2aFilter.actRef.code := ENActObj.code;
     FINDoc2ActList := TempFINDoc2Act.getScrollableFilteredList(f2aFilter, 0, -1);
     if ( FINDoc2ActList.totalCount = 1 ) then
     begin
         edtFINMOLDocCode.Text := IntToStr( FINDoc2ActList.list[0].finDocMOLCode );
         edtFINMechanicDocCode.Text := IntToStr( FINDoc2ActList.list[0].finDocMechanicCode );
     end
     else
     begin
         // strasniy MTUK !!!!
     end;
}
  end; // если акто уже проведенный
   
  if  ENActObj.statusRef.code = ENACT_GOOD  then
  begin
     if (DialogState = dsView) then HideControls([btnCloseAct]);
     btnCloseAct.Caption := 'На підписання';

     if actHasSeals then
     begin
       HideControls([gbFinKodIst],False);
       DisableActions([actAddFinKodIst, actDeleteFinKodIst],false);
     end;

  end;

  if  ENActObj.statusRef.code = ENACT_SIGNATURE  then
  begin
     btnCloseAct.Caption := 'Провести в ФК';
     HideControls([btnUndoSignature], False);

     if actHasSeals then
     begin
       HideControls([gbFinKodIst],False);
       DisableActions([actAddFinKodIst, actDeleteFinKodIst],false);
     end;
  end;

       edtNumberGen.Text := ENActObj.numberGen;

      if ENActObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENActObj.dateGen.Year,ENActObj.dateGen.Month,ENActObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

      if ENActObj.dateAct <> nil then
      begin
        edtDateAct.DateTime:=EncodeDate(ENActObj.dateAct.Year,ENActObj.dateAct.Month,ENActObj.dateAct.Day);
        edtDateAct.checked := true;
      end
      else
      begin
        edtDateAct.DateTime:=SysUtils.Date;
        edtDateAct.checked := false;
      end;

    //edtFinMolCode.Text := ENActObj.finMolCode;
    edtFinMolName.Text := ENActObj.finMolName;
    if ( ENActObj.finMolCode <> '') and (DialogState = dsEdit) then
      DisableControls([spbFINMOL]);

    //edtFinMolCode.Text := ENActObj.finMolCode;
    edtFinMechanicName.Text := ENActObj.finMechanicName;
    if ( ENActObj.finMechanicCode <> '') and (DialogState = dsEdit) then
      DisableControls([spbFINMechanic]);


   // edtCommentGen.text := ENActObj.commentGen;
    MakeMultiline(edtCommentGen.Lines, ENActObj.commentGen);

    if  ENActObj.actTypeRef = nil then
       ENActObj.actTypeRef := ENPlanWorkStateRef.Create
    else
    if  ENActObj.actTypeRef.code > Low(Integer) then
    begin

         try

             TempENPlanWorkState :=  HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
             stateObj := TempENPlanWorkState.getObject(ENActObj.actTypeRef.code);
             if stateObj <> nil then
             begin
                 edtWorkState.Text := stateObj.name;
             end;
         finally

         end;
    end;

    {
    if ENActObj.actTypeRef <> nil then
      if ENActObj.actTypeRef.code > LOW_INT then
        cbENActType.ItemIndex := ENActObj.actTypeRef.code - 1;
}
        

{    edtUserGen.Text := ENActObj.userGen;
      if ENActObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENActObj.dateEdit.Year,ENActObj.dateEdit.Month,ENActObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
}
    //edtENElementElementName.Text := TObject(DMReports.getObjectByElement(ENActObj.element.code)).name;

       if actHasSeals then
       updateFinKodIst;

      end; // edit-view

  if ENActObj.element <> nil then
  begin
      f := ENElementFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);
      f.code := ENActObj.element.code;
      list := DMReports.searchElements(f,0,1,'','');
      if list.totalCount > 0 then
      begin
         edtENElementElementName.Text := list.list[0].objectName + ' ' + list.list[0].typeRefName;
         renCode := list.list[0].renRefCode;
      end
      else
         edtENElementElementName.Text := '!!! meGA errrrroorrrr !!! ';
  end;

   if ( ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_WRITINGS_OS ) then
   begin
        if  (DialogState = dsEdit) or (DialogState = dsView) then
        begin
         DisableControls([edtOSIstCode , edtOSIst]);
         HideControls([lblIstOS, edtOSIstCode , edtOSIst , spbOSIst , spbOSIstClear ] ,false);

          if (DialogState = dsView ) then
             DisableControls([spbOSIst, spbOSIstClear]);


             TempENPlanWorkENAct2OSData :=  HTTPRIOENPlanWorkENAct2OSData as ENPlanWorkENAct2OSDataControllerSoapPort;

             ENPlanWorkENActosdatafilter := ENPlanWorkENAct2OSDataFilter.Create;
             SetNullIntProps(ENPlanWorkENActosdatafilter);
             SetNullXSProps(ENPlanWorkENActosdatafilter);

             ENPlanWorkENActosdatafilter.actRef := ENActRef.Create;
             ENPlanWorkENActosdatafilter.actRef.code := ENActObj.code;


             // ENPlanWorkENAct2OSDataList := TempENPlanWorkENAct2OSData.getScrollableFilteredList(ENPlanWorkENAct2OSDataFilter(ENPlanWorkENActosdatafilter),0,-1);
             ENPlanWorkENAct2OSDataList := TempENPlanWorkENAct2OSData.getScrollableFilteredList(ENPlanWorkENActosdatafilter,0,-1);

             if ENPlanWorkENAct2OSDataList.totalCount > 0 then
              begin
                edtOSIstCode.Text := ENPlanWorkENAct2OSDataList.list[0].kod_ist;
                edtOSIst.Text := ENPlanWorkENAct2OSDataList.list[0].name_ist;
              end

        end;

   end;

   if (DialogState = dsEdit) or (DialogState = dsView) then
   begin
//    9 объекты РЗА                   EN_RZA
//    10 объекты СДТУ                 EN_SDTU
//    15 Об'єкти будівельної служби   EN_BUILDER
//    16 Об'єкти СІТ                  EN_SIT
//    17 Об'єкти служби Ізоляції      EN_ISOLATION
//    24 Об'єкти ЦПВ                  EN_PREPRODUCTION_OBJECT
//    27 Об'єкти ВЕБ                  EN_EB_OBJECT
//    32 Устаткування компанії (бензопили і т.д.) ENELEMENTTYPE_EQUIPMENT_OBJECTS
//    33 Обладнання у Ремонті ENELEMENTTYPE_EQUIPMENT_REPAIR_OBJECTS

     if (    (ENActObj.element.typeRef.code = ENConsts.EN_RZA)
          or (ENActObj.element.typeRef.code = ENConsts.EN_SDTU)
          or (ENActObj.element.typeRef.code = ENConsts.EN_BUILDER)
          or (ENActObj.element.typeRef.code = ENConsts.EN_SIT)
          or (ENActObj.element.typeRef.code = ENConsts.EN_ISOLATION)
          or (ENActObj.element.typeRef.code = ENConsts.EN_PREPRODUCTION_OBJECT)
          or (ENActObj.element.typeRef.code = ENConsts.EN_EB_OBJECT)

        or (ENActObj.element.typeRef.code = ENConsts.ENELEMENTTYPE_EQUIPMENT_OBJECTS)
        or (ENActObj.element.typeRef.code = ENConsts.ENELEMENTTYPE_EQUIPMENT_REPAIR_OBJECTS)

         ) then
     begin
       eFilter := ENElementFilter.Create;
       SetNullIntProps(eFilter);
       SetNullXSProps(eFilter);
       eFilter.code := ENActObj.element.code;
       TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
       eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);

       strInvNumber:= eList.list[0].objectInvNumber;

        if Length(strInvNumber) > 6 then begin

             DisableControls([edtMolObjectMNMA]);
             HideControls([lblMolObjectMNMA, edtMolObjectMNMA , spbMolObjectMNMA ] ,false);

              if (DialogState = dsView ) then
                 DisableControls([spbMolObjectMNMA]);
				 
				 if((Assigned(ENActObj)) and (Length(ENActObj.molCodeObject) > 0)) then begin
				   TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
                   molFilter := ENMolFilter.Create;
				   SetNullXSProps(molFilter);
				   SetNullIntProps(molFilter);
				   molFilter.finCode := ENActObj.molCodeObject;
				   molList := TempENMol.getScrollableFilteredList(molFilter, 0, -1);
				   if((Assigned(molList)) and (molList.totalCount > 0)) then begin
				     edtMolObjectMNMA.Text := molList.list[0].finCode + ' ' + molList.list[0].name;
				   end;
				 end;
         end;

     end;

   end;
      // 20	Акт виконаних робіт договорів підряду
   if ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_TMC_TRANSFER then
   begin
    HideControls([ lblPartner , edtPartner ] ,false);

      generalContractFil  := ENGeneralContractsFilter.Create;
      SetNullIntProps(generalContractFil);
      SetNullXSProps(generalContractFil);
      generalContractFil.conditionSQL :=
      ' engeneralcontracts.code in (select p2g.generalcontractrefcode from enplanwork2gnrlcntrcts p2g  , enact2enplanwork a2p ' +
      ' where p2g.planrefcode=a2p.plancode ' +
      ' and a2p.actrefcode =  '+ IntToStr(ENActObj.code) + ')';

      TempENGeneralContracts :=  HTTPRIOENGeneralContracts as ENGeneralContractsControllerSoapPort;
      ENGeneralContractsList := TempENGeneralContracts.getScrollableFilteredList(generalContractFil,0,-1);
      if(High(ENGeneralContractsList.list) > -1 ) then
       begin

        edtPartner.text:=  ENGeneralContractsList.list[i].partnerCode + ' ' + ENGeneralContractsList.list[i].partnerName;
       end;
      //zzz
   end;

   actViewEnact2FinInfo(ENActObj.code);

  initDFDocsTab;
end;



procedure TfrmENActEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAct: ENActControllerSoapPort;
tmpDate , planDate, actDate : TDateTime;
plan : ENPlanWork;

  strInvNumber :string;
  eFilter : ENElementFilter;
  TempENElement: ENElementControllerSoapPort;
  eList : ENElementShortList;
  dfDocSigners: ArrayOfDFDocSigner;
  isSignable: Boolean;
begin


  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtDateGen
      ,edtDateAct
      //,edtFinMolName
      //,edtFinMechanicName
      ,edtENElementElementName
      ,edtWorkState
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else

  begin

    isSignable := DMReports.isSignable(ENActObj);

    //////
    if (isSignable) and (not DMReports.checkDFDocSigners(sgDFDocSigners)) then
    begin
      Application.MessageBox(PChar('Потрібно вказати всіх підписантів!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      pcENActs.ActivePage := tsDFDoc;
      Action := caNone;
      Exit;
    end;
    /////

    if Length(edtNumberGen.Text) > 10 then
    begin
      Application.MessageBox(PChar('Номер акта должен состоять не более, чем из 10 символов!' + #13#10 +
                                   'Иначе его невозможно будет провести в ФинКоллекции!' + #13#10#13#10 +
                                   'Если Вы хотите сохранить подписантов, нажмите кнопку "ЗБЕРЕГТИ" ' +
                                   '(вверху на вкладке "Документообіг" - "Перелік підписувачів") вместо "ОК"!'),
                                   PChar('Внимание!'), MB_ICONWARNING+MB_OK);
      if edtNumberGen.CanFocus then
        edtNumberGen.SetFocus;
      Action := caNone;
      Exit;
    end;

    SetLength(dfDocSigners, 0);

    if isSignable then
    begin
      if not getDFDocSignersForSaving(dfDocSigners) then
      begin
        Action := caNone;
        Exit;
      end;
    end;

    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;


     ENActObj.numberGen := edtNumberGen.Text;
{
проверим на сервере ....

     if DialogState = dsEdit then
     begin
         tmpDate := EncodeDate(ENActObj.dateGen.Year,ENActObj.dateGen.Month,ENActObj.dateGen.Day);
         if edtDateGen.DateTime <  tmpDate then
         begin
            Application.MessageBox(PChar('Дата должна быть БОЛЬШЕ текущей даты акта !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            edtDateGen.DateTime :=  tmpDate;
            if edtDateGen.CanFocus then edtDateGen.SetFocus;
            Exit;
         end;
     end;
}

     if edtdateGen.checked then
     begin
       if ENActObj.dateGen = nil then
          ENActObj.dateGen := TXSDate.Create;
       ENActObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENActObj.dateGen := nil;

     if edtdateAct.checked then
     begin
       if ENActObj.dateAct = nil then
          ENActObj.dateAct := TXSDate.Create;
       ENActObj.dateAct.XSToNative(GetXSDate(edtdateAct.DateTime));
     end
     else
       ENActObj.dateAct := nil;


      // check dates Act an Plan
     if  (ENActObj.dateGen <> nil) and (planCode > 0) then
     begin
         plan := DMReports.getPlanByCode(planCode);
         if plan <> nil then
         begin
            planDate := EncodeDate(plan.dateStart.Year,plan.dateStart.Month,plan.dateStart.Day);
            actDate := EncodeDate(ENActObj.dateGen.Year,ENActObj.dateGen.Month,ENActObj.dateGen.Day);
            if actDate < planDate then
            begin
              Application.MessageBox(PChar('Дата проведення Акту НЕ повинна бути меншою, ніж дата Завдання-Факту ('+ DateToStr(planDate)+') !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
              //if cbENActType.CanFocus then  cbENActType.SetFocus ;
              Action:=caNone;
              Exit;
            end;
         end;
     end;
{
     if ( edtFinDocCode.Text <> '' ) then
       ENActObj.finDocCode := StrToInt(edtFinDocCode.Text)
     else
       ENActObj.finDocCode := Low(Integer) ;
}
     //ENActObj.finMolCode := edtFinMolCode.Text;

     ENActObj.finMolName := edtFinMolName.Text;

     ENActObj.commentGen := edtCommentGen.Text;

     if ENActObj.actTypeRef = nil then
     begin
      Application.MessageBox(PChar('Оберіть ТИП акту !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      //if cbENActType.CanFocus then  cbENActType.SetFocus ;
      Action:=caNone;
      Exit;
     end;

     if ENActObj.actTypeRef.code <= 0 then
     begin
      Application.MessageBox(PChar('Оберіть ТИП акту !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      //if cbENActType.CanFocus then  cbENActType.SetFocus ;
      Action:=caNone;
      Exit;
     end;



{
     if cbENActType.ItemIndex = -1 then
     begin
      Application.MessageBox(PChar('Оберіть ТИП акту !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      if cbENActType.CanFocus then  cbENActType.SetFocus ;
      Action:=caNone;
      Exit;
     end;

     if ENActObj.actTypeRef = nil then ENActObj.actTypeRef := ENPlanWorkStateRef.Create();
     ENActObj.actTypeRef.code := cbENActType.ItemIndex + 1;
}

{
     ENActObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENActObj.dateEdit = nil then
          ENActObj.dateEdit := TXSDate.Create;
       ENActObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENActObj.dateEdit := nil;
}

    if DialogState = dsInsert then
    begin
      ENActObj.code:=low(Integer);

      if High(dfDocSigners) > -1 then
        TempENAct.add(ENActObj, dfDocSigners)
      else
      TempENAct.add(ENActObj);
    end
    else
    if DialogState = dsEdit then
    begin
      // NET-4383 если списание ОС то нужно на акте указать источник списания ОС (делается бухгалтером )
      if (ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_WRITINGS_OS ) then
      begin
        if trim(edtOSIstCode.Text) = '' then
           begin
            Application.MessageBox(PChar('Оберіть Код джерела для списання ОЗ !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
            Action:=caNone;
            Exit;
           end;
      end;

      if High(dfDocSigners) > -1 then
        TempENAct.save(ENActObj, dfDocSigners)
      else
        TempENAct.save(ENActObj);

    end;
  end;
end;


procedure TfrmENActEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
   tElement : ENElement;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try

              {
               if ENElementFilter(frmENElementShow.FilterObject).renRef = nil then
               begin
                 renCode := ENElementShort(frmENElementShow.sgENElement.Objects[frmENElementShow.sgENElement.Row, 0]).renRefCode;
               end
               else
                 renCode := ENElementFilter(frmENElementShow.FilterObject).renRef.code;
               }

               if ENActObj.element = nil then ENActObj.element := ENElement.Create();
               ENActObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);

               tElement := DMReports.getElementByCode(ENActObj.element.code);
               if (tElement <> nil) then
                  renCode := tElement.renRef.code;

               DisableControls([spbENPlanWorkState], false);
               DisableControls([spbENElementElement]);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENActEdit.spbFINMolClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      //plan := DMReports.getPlanByCode(planCode);

      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.renRef := EPRenRef.Create;
      renFilter.renRef.code := renCode; //plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
        f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);
   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFINMolName.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ENActObj.finMolCode := GetReturnValue(sgFINMol,0);
               ENActObj.finMolName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
 {

 if not Assigned(frmFINMolShow) then
    frmFINMolShow := TfrmFINMolShow.Create(Application,fmChild,f);
 frmFINMolShow.Show;
 }


end;

procedure TfrmENActEdit.spbKau1476ClearClick(Sender: TObject);
begin

        edtKau1476.Text := '';
        edtKauName1476.Text := '';

        ENAct2FinInfoProvObj.kau_card_object_id := LOW_INT;
        ENAct2FinInfoProvObj.kau_card_object_kod := '';
        ENAct2FinInfoProvObj.kau_card_object_name := '';
end;

procedure TfrmENActEdit.spbKau1476Click(Sender: TObject);
var
   frmKauShow : TfrmKauShow;
   f : KauFilter;
begin
   f := KauFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   f.kau_table_id := 2753;

   frmKauShow := TfrmKauShow.Create(Application, fmNormal, f);
   DisableActions([frmKauShow.actInsert, frmKauShow.actEdit,
   frmKauShow.actDelete, frmKauShow.actView], true);

   try
      with frmKauShow do
        if ShowModal = mrOk then
        begin
            try
                edtKau1476.Text := GetReturnValue(sgKau, 2);
                edtKauName1476.Text := GetReturnValue(sgKau, 3);

                if ENAct2FinInfoProvObj = nil then
                begin
                  ENAct2FinInfoProvObj := ENAct2FinInfoProv.Create;
                  ENAct2FinInfoProvObj.code := LOW_INT;
                end;

                ENAct2FinInfoProvObj.kau_card_object_id := StrToInt(GetReturnValue(sgKau, 1));
                ENAct2FinInfoProvObj.kau_card_object_kod := edtKau1476.Text;
                ENAct2FinInfoProvObj.kau_card_object_name := edtKauName1476.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmKauShow.Free;
   end;

end;

procedure TfrmENActEdit.spbKau1783ClearClick(Sender: TObject);
begin

    edtKau1783.Text := '';
    edtKauName1783.Text := '';
    ENAct2FinInfoProvObj.kau_element_expenses_id := LOW_INT;
    ENAct2FinInfoProvObj.kau_element_expenses_kod := '';
    ENAct2FinInfoProvObj.kau_element_expenses_name := '';
end;

procedure TfrmENActEdit.spbKau1783Click(Sender: TObject);
var
   frmKauShow : TfrmKauShow;
   f : KauFilter;
begin
   f := KauFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   f.kau_table_id := 2773;

   frmKauShow := TfrmKauShow.Create(Application, fmNormal, f);
   DisableActions([frmKauShow.actInsert, frmKauShow.actEdit,
        frmKauShow.actDelete, frmKauShow.actView], true);

   try
      with frmKauShow do
        if ShowModal = mrOk then
        begin
            try
                if ENAct2FinInfoProvObj = nil then
                begin
                  ENAct2FinInfoProvObj := ENAct2FinInfoProv.Create;
                  ENAct2FinInfoProvObj.code := LOW_INT;
                end;

                edtKau1783.Text := GetReturnValue(sgKau, 2);
                edtKauName1783.Text := GetReturnValue(sgKau, 3);
                ENAct2FinInfoProvObj.kau_element_expenses_id := StrToInt(GetReturnValue(sgKau, 1));
                ENAct2FinInfoProvObj.kau_element_expenses_kod := edtKau1783.Text;
                ENAct2FinInfoProvObj.kau_element_expenses_name := edtKauName1783.Text;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmKauShow.Free;
   end;

end;

procedure TfrmENActEdit.spbMolObjectMNMAClick(Sender: TObject);
var
   mol : ENMolShort;
begin
   mol := TfrmENMolShow.chooseFromList(true);
   if(Assigned(mol)) then begin
     ENActObj.molCodeObject := mol.finCode;
     edtMolObjectMNMA.Text := mol.finCode + ' ' + mol.name;
   end;
end;

procedure TfrmENActEdit.spbOSIstClearClick(Sender: TObject);
var
  TempENPlanWorkENAct2OSData: ENPlanWorkENAct2OSDataControllerSoapPort;
  ENPlanWorkENAct2OSDataObj : ENPlanWorkENAct2OSData;
begin
  ClearControls([edtOSIstCode, edtOSIst]);

  TempENPlanWorkENAct2OSData := HTTPRIOENPlanWorkENAct2OSData as ENPlanWorkENAct2OSDataControllerSoapPort;

  ENPlanWorkENAct2OSDataObj := ENPlanWorkENAct2OSData.Create;
  SetNullIntProps(ENPlanWorkENAct2OSDataObj);
  SetNullXSProps(ENPlanWorkENAct2OSDataObj);


  ENPlanWorkENAct2OSDataObj.kod_ist := '';
  ENPlanWorkENAct2OSDataObj.name_ist := '';
  ENPlanWorkENAct2OSDataObj.actRef := ENActRef.Create;
  ENPlanWorkENAct2OSDataObj.actRef.code := ENActObj.code;

  ////cохраним источник для списания и ссылку на акт в инфо для списания ОС

  TempENPlanWorkENAct2OSData.saveIstOS(ENPlanWorkENAct2OSDataObj);


end;

procedure TfrmENActEdit.spbOSIstClick(Sender: TObject);
var
  frmOSIstShow: TfrmOSIstShow;
  f: OSIstFilter;

  TempENPlanWorkENAct2OSData: ENPlanWorkENAct2OSDataControllerSoapPort;
  ENPlanWorkENAct2OSDataObj : ENPlanWorkENAct2OSData;
begin
  f := OSIstFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.conditionSQL := '(kod_ist > ''60'')';

  frmOSIstShow := TfrmOSIstShow.Create(Application, fmNormal, f);
  try
    frmOSIstShow.DisableActions([frmOSIstShow.actFilter, frmOSIstShow.actNoFilter]);
    with frmOSIstShow do
      if ShowModal = mrOk then
      begin
        edtOSIstCode.Text := GetReturnValue(sgOSIst, 1);
        edtOSIst.Text := GetReturnValue(sgOSIst, 2);

         TempENPlanWorkENAct2OSData := HTTPRIOENPlanWorkENAct2OSData as ENPlanWorkENAct2OSDataControllerSoapPort;


          ENPlanWorkENAct2OSDataObj := ENPlanWorkENAct2OSData.Create;
          SetNullIntProps(ENPlanWorkENAct2OSDataObj);
          SetNullXSProps(ENPlanWorkENAct2OSDataObj);


         ENPlanWorkENAct2OSDataObj.kod_ist := edtOSIstCode.Text;
         ENPlanWorkENAct2OSDataObj.name_ist := edtOSIst.Text;
         ENPlanWorkENAct2OSDataObj.actRef := ENActRef.Create;
         ENPlanWorkENAct2OSDataObj.actRef.code := ENActObj.code;


         // сохраним источник для списания и ссылку на акт в инфо для списания ОС

         TempENPlanWorkENAct2OSData.saveIstOS(ENPlanWorkENAct2OSDataObj);


      end;
  finally
    frmOSIstShow.Free;
  end;
end;

procedure TfrmENActEdit.spbPostingKindClick(Sender: TObject);
var

   frmenactpostingkindShow : TfrmenactpostingkindShow ;
   tElement : ENElement;
begin
   frmenactpostingkindShow:=TfrmenactpostingkindShow.Create(Application,fmNormal);
   try
      with frmenactpostingkindShow do
        if ShowModal = mrOk then
        begin
            try
               enact2postingKindcode :=  StrToInt(GetReturnValue(sgENActPostingKind,0));
               edtPostingKind.Text := GetReturnValue(sgENActPostingKind,2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmenactpostingkindShow.Free;
   end;
end;

procedure TfrmENActEdit.ToolButton17Click(Sender: TObject);
begin
  inherited;
  actUpdateDfDocDecreeExecute(Sender);
end;

procedure TfrmENActEdit.actInsertExecute(Sender: TObject);
var
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  frmENPlanWorkShow : TfrmENPlanWorkShow;
  planFilter : ENPlanWorkFilter;

  fkOrderFilter : RQFKOrderFilter;
  frmRQFKOrderShow : TfrmRQFKOrderShow;
  ENAct2RQFKOrderObj : ENAct2RQFKOrder;
  TempENAct2RQFKOrder : ENAct2RQFKOrderControllerSoapPort;
begin

  if (pcENActs.ActivePage = tsPlans) then
  begin
    //frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application,fmChild);

    // пака разбемся  - закроем такое :)
        Application.MessageBox(PChar('Оберіть цей Акт з Завдання-ФАКТУ !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        Exit;

    TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;

    ENAct2ENPlanWorkObj:=ENAct2ENPlanWork.Create;
    ENAct2ENPlanWorkObj.actRef := ENActRef.Create;
    ENAct2ENPlanWorkObj.actRef.code := ENActObj.code;

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planFilter.elementRef := ENElementRef.Create;
    planFilter.elementRef.code := ENActObj.element.code;

    planFilter.kind := ENPlanWorkKind.Create;
    //planFilter.kind.code := ENPLANWORKKIND_NPZ; // HPZ only ...
    planFilter.kind.code := ENPLANWORKKIND_FACT;

    planFilter.conditionSQL := ' enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER)
                             + ' and enplanwork.code not in (select enact2enplanwork.plancode from enact2enplanwork)'
                             + ' and enplanwork.code in (select enworkorder2enplanwork.plancode from enworkorder2enplanwork, enworkorder where  enworkorder2enplanwork.workordercode = enworkorder.code '
                             + ' and enworkorder.finmolcode = '''+ ENActObj.finMolCode +'''' // MOL
                             + ' and enworkorder.finmechaniccode = '''+ ENActObj.finMechanicCode +'''' // MEHANIK ???
                             +')';


    //planFilter.status := ENPlanWorkStatus.Create;
    //planFilter.status.code := ENPLANWORKSTATUS_LOCKED;

    try
      frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);

      try

        DisableActions([ frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actDelete,
                         frmENPlanWorkShow.actFilter, frmENPlanWorkShow.actNoFilter, frmENPlanWorkShow.actAddPlanItems
                        ]);
        frmENPlanWorkShow.sgENPlanWork.PopupMenu := nil;

        frmENPlanWorkShow.isFiltered := true;

        if frmENPlanWorkShow.ShowModal = mrOk then

        begin
          if ENAct2ENPlanWorkObj<>nil then
          begin
              ENAct2ENPlanWorkObj.plan := ENPlanWork.Create;
              ENAct2ENPlanWorkObj.plan.code := StrToInt( frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,0) );
              TempENAct2ENPlanWork.add(ENAct2ENPlanWorkObj, 1);
              UpdateGrid(Sender);
          end;
        end;
      finally
        frmENPlanWorkShow.Free;
        frmENPlanWorkShow:=nil;
      end;
    finally
      //planFilter.Free;
      ENAct2ENPlanWorkObj.Free;
    end;
  end;

  // -- tsAct2ServicesFromSide
  if (pcENActs.ActivePage = tsAct2ServicesFromSide) then
  begin
    fkOrderFilter := RQFKOrderFilter.Create;
    SetNullIntProps(fkOrderFilter);
    SetNullXSProps(fkOrderFilter);

    fkOrderFilter.kind := RQFKOrderKind.Create;
    fkOrderFilter.kind.code := RQFKORDER_KIND_SERVICES_FROM_SIDE;

    frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal, fkOrderFilter);

    try
      frmRQFKOrderShow.Caption := 'Акти виконаних робіт та послуг';
      frmRQFKOrderShow.UpdateCaption;

      with frmRQFKOrderShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
          try
            ENAct2RQFKOrderObj := ENAct2RQFKOrder.Create;

            SetNullIntProps(ENAct2RQFKOrderObj);
            SetNullXSProps(ENAct2RQFKOrderObj);

            ENAct2RQFKOrderObj.fkOrderRef := RQFKOrderRef.Create;
            ENAct2RQFKOrderObj.actRef := ENActRef.Create;

            ENAct2RQFKOrderObj.actRef.code := ENActObj.code;
            ENAct2RQFKOrderObj.fkOrderRef.code := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);

            /////
            ENAct2RQFKOrderObj.typeRef := ENAct2RQFKOrderTypeRef.Create;

            if ENActObj.element.typeRef.code = EN_METROLOGY_OBJECT then
              ENAct2RQFKOrderObj.typeRef.code := ENConsts.ENACT2RQFKORDER_TYPE_SERVICES

            else if ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_REFINEMENT then
              ENAct2RQFKOrderObj.typeRef.code := ENConsts.ACT_REFINEMENT_AND_SERVICES

            else
              raise Exception.Create('Для цього акту така операція не використовується!');
            /////

            TempENAct2RQFKOrder := HTTPRIOENAct2RQFKOrder as ENAct2RQFKOrderControllerSoapPort;
            TempENAct2RQFKOrder.add(ENAct2RQFKOrderObj);

            pcENActsChange(Sender);
          except
             on EConvertError do Exit;
          end;
        end;
      end;
    finally
      frmRQFKOrderShow.Free;
    end;
  end;

end;

procedure TfrmENActEdit.ActEditActInvest2dfdocExecute(Sender: TObject);
var
  TempENActInvest2DFDoc: ENActInvest2DFDocControllerSoapPort;
begin
  TempENActInvest2DFDoc := HTTPRIOENActInvest2DFDoc as ENActInvest2DFDocControllerSoapPort;
  try
    ENActInvest2DFDocObj := TempENActInvest2DFDoc.getObject(StrToInt(sgENActInvest2DFDoc.Cells[0,sgENActInvest2DFDoc.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActInvest2DFDocEdit:=TfrmENActInvest2DFDocEdit.Create(Application, dsEdit);
  ENActInvest2DFDocObj.dfDocNumber := sgENActInvest2DFDoc.Cells[3,sgENActInvest2DFDoc.Row];
 try
    if frmENActInvest2DFDocEdit.ShowModal= mrOk then
      begin

        pcENActsChange(Sender);
      end;
  finally
    frmENActInvest2DFDocEdit.Free;
    frmENActInvest2DFDocEdit:=nil;
  end;


    sgENActInvest2DFDoc.Row := sgENActInvest2DFDoc.RowCount - 1;

end;

procedure TfrmENActEdit.ActionDecreeDeleteExecute(Sender: TObject);
var
  TempDFDocDecree: DFDocDecreeControllerSoapPort;
  TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
  ObjCode: Integer;
begin
  TempENAct2DFDocDecree := HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;
  try
    ObjCode := StrToInt(sgDFDocDecree.Cells[0,sgDFDocDecree.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Документ (распоряжение)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
     ENAct2DFDocDecreeObj:=ENAct2DFDocDecree.Create;
     SetNullIntProps(ENAct2DFDocDecreeObj);
     SetNullXSProps(ENAct2DFDocDecreeObj);
     ENAct2DFDocDecreeObj.actRef := ENActRef.Create;
     ENAct2DFDocDecreeObj.actRef.code := ENActObj.code;

     ENAct2DFDocDecreeObj.DFDocDecreeCode := ObjCode;

     TempENAct2DFDocDecree.removeByObj(ENAct2DFDocDecreeObj);
     actUpdateDfDocDecreeExecute(Sender);
  end;
end;

procedure TfrmENActEdit.ActionDecreeInsertExecute(Sender: TObject);
var
  //TempDFDocSetting: DFDocSettingControllerSoapPort;
  //FilDFDocSetting :  DFDocSettingFilter;
  i: Integer;
  //DFDocSettingList: DFDocSettingShortList;
    TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
   // frmENWarrantShow : TfrmENWarrantShow;
    fwarrant : ENWarrantFilter;
    warrant : ENWarrant;
    datContract, datWarrant : TXSDate;
    dtdatContract, dtdatWarrant : TDateTime;
    power: Double;
    depCode , settingForDecreeCode : Integer;
    PlanWorkList: ENPlanWorkShortList;
    TempENWarrant: ENWarrantControllerSoapPort;
    ENWarrantList: ENWarrantShortList;
    fplan : ENPlanWorkFilter;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    pCodesList: ENPlanWorkController.ArrayOfInteger;
    planworkObj : ENPlanWork;
    fEl: ENElementFilter;
    listEl : ENElementShortList;
    settingForDecree : ENSettingForDFDecreeFilter;
    TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
    ENSettingForDFDecreeList: ENSettingForDFDecreeShortList;
    SettingForDFDecreeObj : ENSettingForDFDecree;
begin
  // TempDFDocDecree := HTTPRIODFDocDecree as DFDocDecreeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAct2DFDocDecreeObj:=ENAct2DFDocDecree.Create;
  try

      TempENAct2DFDocDecree := HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;

      SetNullIntProps(ENAct2DFDocDecreeObj);
      SetNullXSProps(ENAct2DFDocDecreeObj);

      ENAct2DFDocDecreeObj.actRef:= ENActRef.Create;
      ENAct2DFDocDecreeObj.actRef.code := ENActObj.code;

      frmENAct2DFDocDecreeEdit:=TfrmENAct2DFDocDecreeEdit.Create(Application, dsInsert);
      frmENAct2DFDocDecreeEdit.forAddDefaultSetting:= True;
      frmENAct2DFDocDecreeEdit.Caption:= 'Створення розпорядження';

      // название объекта
      if ENActObj.element <> nil then
      begin
          fEl := ENElementFilter.Create;
          SetNullIntProps(fEl);
          SetNullXSProps(fEl);
          fEl.code := ENActObj.element.code;
          listEl := DMReports.searchElements(fEl,0,1,'','');
          if listEl.totalCount > 0 then
          begin
             frmENAct2DFDocDecreeEdit.edtCommentGen.Text:= 'Про подачу напруги для комплексного випробування  '
                             + listEl.list[0].objectName + ' ' + listEl.list[0].typeRefName;
             //frmENAct2DFDocDecreeEdit.edtSpecifications.Text :=  '1.1. ';
          end
          else
             frmENAct2DFDocDecreeEdit.edtCommentGen.Text:= '!!! meGA errrrroorrrr !!! ';
      end;


      /// авто определить шаблон с настройками для распоряжения
      settingForDecree:= ENSettingForDFDecreeFilter.Create();
      SetNullXSProps(settingForDecree);
      SetNullIntProps(settingForDecree);

       fplan := ENPlanWorkFilter.Create;
       SetNullIntProps(fplan);
       SetNullXSProps(fplan);
       fplan.conditionSQL := 'enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code ) + ')';

      TempENPlanWork :=  HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

      pCodesList:= TempENPlanWork.getFilteredCodeArray(fplan);

       if High(pCodesList) <= -1 then
           begin
            Exit;
           end;
        planworkObj := DMReports.getPlanByCode(pCodesList[0]);
        depCode := planworkObj.departmentRef.code;

        settingForDecree.departmentRef := ENDepartmentRef.Create();
        settingForDecree.departmentRef.code := depCode;
        frmENAct2DFDocDecreeEdit.depCode := depCode;

        TempENSettingForDFDecree :=  HTTPRIOENSettingForDFDecree as ENSettingForDFDecreeControllerSoapPort;
        ENSettingForDFDecreeList := TempENSettingForDFDecree.getScrollableFilteredList(settingForDecree,0,1);


      ///авто заполнение ответственное лицо (по умолчанию берем из шаблона с настройками если он есть)

     if High(ENSettingForDFDecreeList.list) > -1 then
       begin
        SettingForDFDecreeObj:= TempENSettingForDFDecree.getObject(ENSettingForDFDecreeList.list[0].code);
        frmENAct2DFDocDecreeEdit.actUpdateSettingDecreeByCodeExecute( SettingForDFDecreeObj.code);

          

           if SettingForDFDecreeObj.responsRef.code <> null then            
           
           fwarrant:= enwarrantfilter.Create();
           SetNullXSProps(fwarrant);
           SetNullIntProps(fwarrant);
           
           fwarrant.code:= SettingForDFDecreeObj.responsRef.code;
          try
             TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
             ENWarrantList := TempENWarrant.getScrollableFilteredList(fwarrant, 0, 10000, ENConsts.ENWARRANT_TYPE_DECREE_RESPONS);

             if High(ENWarrantList.list) > -1 then
             begin
               warrant := DMReports.getWarrantByCode(ENWarrantList.list[0].code);

               frmENAct2DFDocDecreeEdit.edtResponsSurname.Text:= warrant.personSurname;
               frmENAct2DFDocDecreeEdit.edtResponsSurnameGenitive.Text:= warrant.personSurnameGenitive;

               frmENAct2DFDocDecreeEdit.edtResponsName.Text:= warrant.personName;
               frmENAct2DFDocDecreeEdit.edtResponsNameGenitive.Text:= warrant.personNameGenitive;

               frmENAct2DFDocDecreeEdit.edtResponsPatronimic.Text:= warrant.personPatronimic;
               frmENAct2DFDocDecreeEdit.edtResponsPatronimicGenitive.Text:= warrant.personPatronimicGenitive;

               frmENAct2DFDocDecreeEdit.edtDepartmentName.Text:= warrant.departmentName;
               frmENAct2DFDocDecreeEdit.edtDepartmentNameGenitive.Text:= warrant.departmentNameGenitive;

               frmENAct2DFDocDecreeEdit.edtresponsPosition.text := warrant.warrantPosition;
               frmENAct2DFDocDecreeEdit.edtresponsGenitivePosition.text := warrant.genitivePosition;

             end;

          except
             on EConvertError do Exit;
          end;      



       end;


      settingForDecreeCode:= LOW_INT;
      try
        if frmENAct2DFDocDecreeEdit.ShowModal = mrOk then
        begin

              try
                 settingForDecreeCode := StrToInt(frmENAct2DFDocDecreeEdit.sgENSettingForDFDecree.
                  Cells[0,frmENAct2DFDocDecreeEdit.sgENSettingForDFDecree.Row]);
                  ENAct2DFDocDecreeObj.settingDecreeCode := settingForDecreeCode;
               except
               on EConvertError do
                 begin raise Exception.Create('Помилка, треба вказати шаблон для розпорядження!');
               end;
              end;
              
        
          TempENAct2DFDocDecree.addWithSetting(ENAct2DFDocDecreeObj);
          //20191204zzzzz
          actUpdateDfDocDecreeExecute(Sender);
        end;
      finally
        frmENAct2DFDocDecreeEdit.Free;
        frmENAct2DFDocDecreeEdit:=nil;
      end;



  finally
    ENAct2DFDocDecreeObj.Free;
  end;
end;

procedure TfrmENActEdit.ActionDecreeViewExecute(Sender: TObject);
var
  TempDFDocDecree: DFDocDecreeControllerSoapPort;
begin
  TempDFDocDecree := HTTPRIODFDocDecree as DFDocDecreeControllerSoapPort;
  try
    DFDocDecreeObj := TempDFDocDecree.getObject(StrToInt(sgDFDocDecree.Cells[0,sgDFDocDecree.Row]));
  except
    on EConvertError do Exit;
  end;

  frmDFDocDecreeEdit:=TfrmDFDocDecreeEdit.Create(Application, dsView);
  try
    frmDFDocDecreeEdit.ShowModal;
  finally
    frmDFDocDecreeEdit.Free;
    frmDFDocDecreeEdit:=nil;
  end;
end;

procedure TfrmENActEdit.actSaveDFDocSignersExecute(Sender: TObject);
var
  dfDocSigners: ArrayOfDFDocSigner;
  isSignable: Boolean;
  TempENAct: ENActControllerSoapPort;
begin
  if DialogState <> dsEdit then Exit;

  if (not DMReports.isSignable(ENActObj)) then Exit;

  //////
  if (not DMReports.checkDFDocSigners(sgDFDocSigners)) then
  begin
    Application.MessageBox(PChar('Потрібно вказати всіх підписантів!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
    pcENActs.ActivePage := tsDFDoc;
    Exit;
  end;
  /////

  SetLength(dfDocSigners, 0);

  if not getDFDocSignersForSaving(dfDocSigners) then
    Exit;

  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
  TempENAct.saveDFDocSigners(ENActObj, dfDocSigners);

  updateDFDocs;
end;

procedure TfrmENActEdit.actSetZoneExecute(Sender: TObject);
var
  TempFINMaterials : FINMaterialsControllerSoapPort;
  TempRQStorageZone : RQStorageZoneControllerSoapPort;
  TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
  finMat : FINMaterials;
  i, storageZoneCode, storageCode, k : Integer;
  selected : Boolean;
  zoneFilter : RQStorageZoneFilter;
  frmRQStorageZoneShow : TfrmRQStorageZoneShow;
  count : Integer;
  storage2molFilter : RQStorage2ENMolFilter;
  storage2molList : RQStorage2ENMolShortList;
  finMats : ArrayOfFINMaterialsData;
  molCode : String;
  errorString : String;
begin
  inherited;
    TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
    TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
    TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;

    selected := false;
    count := 0;

    for i := 1 to sgProducedMaterials.RowCount - 1 do
    begin
      sgProducedMaterials.GetCheckBoxState(1, i, selected);
      if selected then count := count + 1;
    end;

    if count = 0 then // Если не выбрана ни одна строка
    begin
      Application.MessageBox(PChar('Оберіть строки!!!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    SetLength(finMats, count);

    k := 0;
    for i:=1 to sgProducedMaterials.RowCount - 1 do
    begin
      sgProducedMaterials.GetCheckBoxState(1,i,selected);
      if selected then
      begin
        finMats[k] := TempFINMaterials.getObject(StrToInt(sgProducedMaterials.Cells[0, i]));
        k := k + 1;
      end;
    end;

    // Проверка, что МОЛ совпадают
    molCode := finMats[0].div_code;

    for i := 1 to k - 1 do begin
        if(finMats[i].div_code <> molCode) then begin
          errorString := 'Не співпадають МВО для матеріалів!';
          raise Exception.Create(errorString);
        end;
    end;

    storage2molFilter := RQStorage2ENMolFilter.Create;
    SetNullXSProps(storage2molFilter);
    SetNullIntProps(storage2molFilter);
    storage2molFilter.conditionSQL := 'EXISTS (select 1 from enmol m where m.fincode = ''' + molCode + ''' and m.code = RQSTORAGE2ENMOL.MOLREFCODE)';
    storage2molList := TempRQStorage2ENMol.getScrollableFilteredList(storage2molFilter, 0, -1);
    if(storage2molList.totalCount = 0) then begin
        errorString := 'Не знайдено жодного складу для МВО ' + finMat.div_code + ' ' + finMat.div_name;
        raise Exception.Create(errorString);
    end;
    if(storage2molList.totalCount > 1) then begin

    end
    else
      storageCode :=  storage2molList.list[0].storageRefCode;

    zoneFilter := RQStorageZoneFilter.Create;
    SetNullIntProps(zoneFilter);
    SetNullXSProps(zoneFilter);

    zoneFilter.conditionSQL :=
      ' rqstoragezone.storagecode = ' + IntToStr(storageCode) +
      ' and rqstoragezone.code in ' +
      ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
      '  where sm.molrefcode in ' +
      '    (select m.code from enmol m where m.fincode = ''' + molCode + ''')) ';
    zoneFilter.orderBySQL := 'rqstoragezone.name';

    storageZoneCode := Low_Int;
    frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
    try
      frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                           frmRQStorageZoneShow.actDelete,
                                           frmRQStorageZoneShow.actEdit]);
      with frmRQStorageZoneShow do
        if ShowModal = mrOk then
        begin
          try
            storageZoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          except
             on EConvertError do Exit;
          end;
        end;
    finally
      frmRQStorageZoneShow.Free;
    end;

    TempFINMaterials.setStorageZone(finMats, storageZoneCode);

    Application.MessageBox(PChar('Місце зберігання змінено!'),
                             PChar('Акти'), MB_OK);

    updateProduced;
end;

procedure TfrmENActEdit.ActUpdateActInvest2dfdocExecute(Sender: TObject);
begin
  inherited;
      pcENActsChange(Sender);
end;

procedure TfrmENActEdit.actUpdateDfDocDecreeExecute(Sender: TObject);
var
  TempDFDocDecree: DFDocDecreeControllerSoapPort;
  ColCountDecree, i , k , j: Integer;
  DFDocDecreeList: DFDocDecreeShortList;
  FilterObjectDecree : DFDocDecreeFilter;

  TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
  a2decr: Integer;
  ENAct2DFDocDecreeList: ENAct2DFDocDecreeShortList;
  a2decrFil: ENAct2DFDocDecreeFilter;
  tt: Integer;
  dfdecreeCodesStr : string;
  LastCountDfDocDecree , LastRowDfDocDecree: Integer;
begin
  SetGridHeaders(DFDocDecreeHeaders, sgDFDocDecree.ColumnHeaders);
  ColCountDecree:=100;
  TempDFDocDecree :=  HTTPRIODFDocDecree as DFDocDecreeControllerSoapPort;

        for k := 1 to  sgDFDocDecree.RowCount - 1 do
     for j := 0 to sgDFDocDecree.ColCount - 1 do
       sgDFDocDecree.Cells[j,k] := '';
   sgDFDocDecree.RowCount := 2;

  TempENAct2DFDocDecree :=  HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;

  a2decrFil := ENAct2DFDocDecreeFilter.Create;
  SetNullIntProps(a2decrFil);
  SetNullXSProps(a2decrFil);


  a2decrFil.actRef := ENActRef.Create;
  a2decrFil.actRef.code := ENActObj.code;

  ENAct2DFDocDecreeList := TempENAct2DFDocDecree.getScrollableFilteredList(a2decrFil,0,-1);
  for tt := 0 to High(ENAct2DFDocDecreeList.list) do
  begin
      if Length(dfdecreeCodesStr)=0 then
         dfdecreeCodesStr:= IntToStr(ENAct2DFDocDecreeList.list[tt].DFDocDecreeCode)
      else
         dfdecreeCodesStr:= dfdecreeCodesStr + ' , ' + IntToStr(ENAct2DFDocDecreeList.list[tt].DFDocDecreeCode);

  end;

     FilterObjectDecree := DFDocDecreeFilter.Create;
     SetNullIntProps(FilterObjectDecree);
     SetNullXSProps(FilterObjectDecree);

  if dfdecreeCodesStr = '' then
     exit;
  FilterObjectDecree.conditionSQL := ' DFDocDecree.code in ( ' + dfdecreeCodesStr + ')';
  DFDocDecreeList := TempDFDocDecree.getScrollableFilteredList(FilterObjectDecree,0,-1);
  LastCountDfDocDecree:=High(DFDocDecreeList.list);

  if LastCountDfDocDecree > -1 then
     sgDFDocDecree.RowCount:=LastCountDfDocDecree+2
  else
     sgDFDocDecree.RowCount:=2;

   with sgDFDocDecree do
    for i:=0 to LastCountDfDocDecree do
      begin
        Application.ProcessMessages;

        if DFDocDecreeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(DFDocDecreeList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := DFDocDecreeList.list[i].number;

        if DFDocDecreeList.list[i].docDateRegistration = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(DFDocDecreeList.list[i].docDateRegistration);

        Cells[3,i+1] := DFDocDecreeList.list[i].docDescription;
        Cells[4,i+1] := DFDocDecreeList.list[i].stateRefName;


        LastRowDfDocDecree:=i+1;
        sgDFDocDecree.RowCount:=LastRowDfDocDecree+1;
      end;
   sgDFDocDecree.Row:=1;
end;

procedure TfrmENActEdit.actUpdateDFDocsExecute(Sender: TObject);
begin
  updateDFDocs;
end;

procedure TfrmENActEdit.ActViewActInvest2dfdocExecute(Sender: TObject);
var
  TempENActInvest2DFDoc: ENActInvest2DFDocControllerSoapPort;
begin
  TempENActInvest2DFDoc := HTTPRIOENActInvest2DFDoc as ENActInvest2DFDocControllerSoapPort;
  try
    ENActInvest2DFDocObj := TempENActInvest2DFDoc.getObject(StrToInt(sgENActInvest2DFDoc.Cells[0,sgENActInvest2DFDoc.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActInvest2DFDocEdit:=TfrmENActInvest2DFDocEdit.Create(Application, dsView);
  ENActInvest2DFDocObj.dfDocNumber := sgENActInvest2DFDoc.Cells[3,sgENActInvest2DFDoc.Row];
 try
    if frmENActInvest2DFDocEdit.ShowModal= mrOk then
      begin

        pcENActsChange(Sender);
      end;
  finally
    frmENActInvest2DFDocEdit.Free;
    frmENActInvest2DFDocEdit:=nil;
  end;




end;

procedure TfrmENActEdit.pcENActsChange(Sender: TObject);
var
  i, iLastCount: Integer;
{
  TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
  ENAct2ENPlanWorkList: ENAct2ENPlanWorkShortList;
  f : ENAct2ENPlanWorkFilter;
}

  TempENPlanWork: ENPlanWorkControllerSoapPort;
  PlanWorkList: ENPlanWorkShortList;
  f : ENPlanWorkFilter;

  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  planItemFilter: ENPlanWorkItemFilter;
  ENPlanWorkItemList: ENPlanWorkItemShortList;

  TempFINMaterials: FINMaterialsControllerSoapPort;
  finFilter : FINMaterialsFilter;
  finList: FINMaterialsShortList;

  TempENHumenItem: ENHumenItemControllerSoapPort;
  humenItemFilter : ENHumenItemFilter;
  ENHumenItemList: ENHumenItemShortList;

  TempENTransportItem: ENTransportItemControllerSoapPort;
  transportItemFilter : ENTransportItemFilter;
  ENTransportItemList: ENTransportItemShortList;

  vNormOfTime, vCountGen: Double;
  totalAct, totalFin, costAct, costFin: Double;
  oldSeparator : Char;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  RQFKOrderList : RQFKOrderShortList;
  RQFKOrderFilterObj : RQFKOrderFilter;

  TempSCUsageInput : SCUsageInputControllerSoapPort;
  SCUsageInputList : SCUsageInputShortList;
  scFilter : SCUsageInputFilter;

  TempENAct2Prov: ENAct2ProvControllerSoapPort;
  ENAct2ProvList: ENAct2ProvShortList;
  ENAct2ProvFil: ENAct2ProvFilter;

  TempENActPostingKind: ENActPostingKindControllerSoapPort;
  ENActPostingKindList: ENActPostingKindShortList;
  ENActPostingKindFil : ENActPostingKindFilter;

  TempENActInvest2DFDoc: ENActInvest2DFDocControllerSoapPort;
  iactInvest2dfdoc , LastCountActInvest2dfdoc : Integer;
  ENActInvest2DFDocList: ENActInvest2DFDocShortList;
  ENActInvest2DFDocFil : ENActInvest2DFDocFilter;
begin
  inherited;

  if (( ENActObj.statusRef.code = ENConsts.ENACT_CLOSED)  ) then
        begin
         DisableControls([btnSavePostingFinInfo ] , true );
        end;
  if (pcENActs.ActivePage = tsENACTINVEST2DFDOC) then
  begin
        ClearGrid(sgENActInvest2DFDoc);

        SetGridHeaders(ENActInvest2DFDocHeaders, sgENActInvest2DFDoc.ColumnHeaders);

        TempENActInvest2DFDoc :=  HTTPRIOENActInvest2DFDoc as ENActInvest2DFDocControllerSoapPort;

        ENActInvest2DFDocFil := ENActInvest2DFDocFilter.Create;
        SetNullIntProps(ENActInvest2DFDocFil);
        SetNullXSProps(ENActInvest2DFDocFil);

        ENActInvest2DFDocFil.actRef:= ENActRef.Create;
        ENActInvest2DFDocFil.actRef.code:= ENActObj.code;

        ENActInvest2DFDocList := TempENActInvest2DFDoc.getScrollableFilteredList(ENActInvest2DFDocFil,0,-1);
        LastCountActInvest2dfdoc:=High(ENActInvest2DFDocList.list);

        if LastCountActInvest2dfdoc > -1 then
           sgENActInvest2DFDoc.RowCount:=LastCountActInvest2dfdoc+2
        else
           sgENActInvest2DFDoc.RowCount:=2;

         with sgENActInvest2DFDoc do
          for i:=0 to LastCountActInvest2dfdoc do
            begin
              Application.ProcessMessages;
              if ENActInvest2DFDocList.list[i].code <> Low(Integer) then
              Cells[0,i+1] := IntToStr(ENActInvest2DFDocList.list[i].code)
              else
              Cells[0,i+1] := '';
              if ENActInvest2DFDocList.list[i].dfDocCode = Low(Integer) then
                Cells[1,i+1] := ''
              else
                Cells[1,i+1] := IntToStr(ENActInvest2DFDocList.list[i].dfDocCode);
              if ENActInvest2DFDocList.list[i].dfDocTypeCode = Low(Integer) then
                Cells[2,i+1] := ''
              else
                Cells[2,i+1] := IntToStr(ENActInvest2DFDocList.list[i].dfDocTypeCode);
              Cells[3,i+1] := ENActInvest2DFDocList.list[i].dfDocNumber;
              if ENActInvest2DFDocList.list[i].dfDocDate = nil then
                Cells[4,i+1] := ''
              else
                Cells[4,i+1] := XSDate2String(ENActInvest2DFDocList.list[i].dfDocDate);
              Cells[5,i+1] := ENActInvest2DFDocList.list[i].dfDocDescription;
              Cells[6,i+1] := ENActInvest2DFDocList.list[i].commentgen;
              Cells[7,i+1] := ENActInvest2DFDocList.list[i].typeRefName;
              Objects[0, i+1] := ENActInvest2DFDocList.list[i];
              LastRow:=i+1;
              sgENActInvest2DFDoc.RowCount:=LastRow+1;
            end;


          sgENActInvest2DFDoc.Row:=1;
  end;


  if (pcENActs.ActivePage = tsPostings) then
  begin
     PageControl1.ActivePage := tsPostingList;
     if ( (ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_SIDEWORKS)
           or ( ENActObj.actTypeRef.code = ENConsts.ENPLANWORKSTATE_DESIGNING ) ) then
     begin

        begin
          DisableControls([grpPostingInfo , lblPostingKind   , spbPostingKind  , chkIsIncomeAct , btnSavePostingInfo ] , false );
         //вычитаем шаблон проводок для акта
          TempENAct2Prov :=  HTTPRIOENAct2Prov as ENAct2ProvControllerSoapPort;
          ENAct2ProvFil := ENAct2ProvFilter.Create;
          SetNullIntProps(ENAct2ProvFil);
          SetNullXSProps(ENAct2ProvFil);
          ENAct2ProvFil.actRef := ENActRef.Create;
          ENAct2ProvFil.actRef.code := ENActObj.code;

          ENAct2ProvList := TempENAct2Prov.getScrollableFilteredList(ENAct2ProvFil,0,-1);
          if High(ENAct2ProvList.list) > -1 then
          begin
             if ((ENAct2ProvList.list[0].isIncomeAct <> LOW_INT )and  (ENAct2ProvList.list[0].isIncomeAct > 0 )) then
              chkIsIncomeAct.Checked:=True
             else
              chkIsIncomeAct.Checked:=False;

             enact2postingKindcode :=  ENAct2ProvList.list[0].actPostingKindRefCode;
             if (enact2postingKindcode > LOW_INT) then
             begin
               TempENActPostingKind :=  HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;
               ENActPostingKindFil := ENActPostingKindFilter.Create;
               SetNullIntProps(ENActPostingKindFil);
               SetNullXSProps(ENActPostingKindFil);
               ENActPostingKindFil.code := enact2postingKindcode;
               ENActPostingKindList := TempENActPostingKind.getScrollableFilteredList(ENActPostingKindFil,0,-1);
               if High(ENActPostingKindList.list) > -1 then
                  edtPostingKind.Text := ENActPostingKindList.list[0].name;

             end;

          end;




        end;

        if (( ENActObj.statusRef.code = ENConsts.ENACT_CLOSED) {or (DialogState = dsView) } ) then
        begin
         DisableControls([grpPostingInfo , lblPostingKind   , spbPostingKind  , chkIsIncomeAct , btnSavePostingInfo ] , true );
        end;
     end
     else
     begin
       HideControls([grpPostingInfo , lblPostingKind , edtPostingKind  , spbPostingKind  , chkIsIncomeAct  , btnSavePostingInfo ] , true );
       DisableControls([grpPostingInfo , lblPostingKind   , spbPostingKind  , chkIsIncomeAct , btnSavePostingInfo ] , true );

     end;


//     else
//     begin
//       HideControls([grpPostingInfo , lblPostingKind , edtPostingKind  , spbPostingKind  , chkIsIncomeAct  , btnSavePostingInfo ] , true );
//       DisableControls([grpPostingInfo , lblPostingKind , edtPostingKind  , spbPostingKind  , chkIsIncomeAct , btnSavePostingInfo ] , true );
//
//     end;

     getPostingsList(ENActObj.code);
  end;

  if (pcENActs.ActivePage = tsSCUsageInput) then
  begin
    ClearGrid(sgSCUsageInput);
    scFilter := SCUsageInputFilter.Create;
    SetNullIntProps(scFilter);
    SetNullXSProps(scFilter);
    scFilter.conditionSQL := 'scusageinput.code in ( ' +
      ' select a2s.scusageinputrefcode from enact2scusageinput a2s ' +
      ' where a2s.actrefcode = ' + IntToStr(ENActObj.code) + ' )';

    TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
    SCUsageInputList := TempSCUsageInput.getScrollableFilteredList(scFilter, 0, -1);

    if High(SCUsageInputList.list) > -1 then
       sgSCUsageInput.RowCount := High(SCUsageInputList.list) + 2
    else
       sgSCUsageInput.RowCount := 2;

     with sgSCUsageInput do
      for i := 0 to High(SCUsageInputList.list) do
        begin
          Application.ProcessMessages;

          if SCUsageInputList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(SCUsageInputList.list[i].code)
            else
          Cells[0,i+1] := '';

          Cells[1,i+1] := SCUsageInputList.list[i].numberDoc;

          if SCUsageInputList.list[i].dateGen = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(SCUsageInputList.list[i].dateGen);

          if SCUsageInputList.list[i].dateStart = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := XSDate2String(SCUsageInputList.list[i].dateStart);

          if SCUsageInputList.list[i].dateFinal = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := XSDate2String(SCUsageInputList.list[i].dateFinal);

          Cells[5,i+1] := SCUsageInputList.list[i].molCode;
          Cells[6,i+1] := SCUsageInputList.list[i].molName;
          Cells[7,i+1] := SCUsageInputList.list[i].departmentShortName;
          Cells[8,i+1] := SCUsageInputList.list[i].statusRefName;
          // ???
          Objects[7,i+1] := TObject(SCUsageInputList.list[i].statusRefCode);

          if SCUsageInputList.list[i].dateEdit = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := XSDateTimeWithDate2String(SCUsageInputList.list[i].dateEdit);
          Cells[10,i+1] := SCUsageInputList.list[i].userGen;

          sgSCUsageInput.RowCount := i + 2;
        end;

     sgSCUsageInput.Row := 1;
  end;

  if pcENActs.ActivePage = tsAct then
  begin
    if DialogState <> dsInsert then
      LoadMOLData(ENActObj.code);
  end;

  if pcENActs.ActivePage = tsPlans then
  begin

    // спрячем добавить ...

    SetGridHeaders(ENAct2ENPlanWorkHeaders, sgENAct2ENPlanWork.ColumnHeaders);
    //ColCount:=100;
    {
    TempENPlanWork :=  HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    f := ENPlanWorkFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    //f.actRef := ENActRef.Create;
    //f.actRef.code := ENActObj.code;
    f.conditionSQL := 'enplanwork.code in (select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + ')';
    f.orderBySQL := 'enplanwork.datestart';

    PlanWorkList := TempENPlanWork.getScrollableFilteredList(f,0,-1);
    }

    PlanWorkList := DMReports.getPlansListByActCode(ENActObj.code, 'enplanwork.datestart');

    //LastCount:=High(ENAct2ENPlanWorkList.list);

    if High(PlanWorkList.list) > -1 then
       sgENAct2ENPlanWork.RowCount:=High(PlanWorkList.list)+2
    else
       sgENAct2ENPlanWork.RowCount:=2;

     with sgENAct2ENPlanWork do
       for i:=0 to High(PlanWorkList.list) do
       begin
         Application.ProcessMessages;
         if PlanWorkList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(PlanWorkList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1, i + 1] := PlanWorkList.list[i].workOrderNumber;

         if PlanWorkList.list[i].dateStart = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := XSDate2String(PlanWorkList.list[i].dateStart);

         Cells[3, i + 1] := PlanWorkList.list[i].typeRefName;

         //LastRow:=i+1;
         //sgENAct2ENPlanWork.RowCount:=High(PlanWorkList.list)+2;
       end;
     //ColCount:=ColCount+1;
     sgENAct2ENPlanWork.Row:=1;


  end;

// ----------------------------------------------------------
  if pcENActs.ActivePage = tsWorkItems then
  begin
    SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);

    TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    planItemFilter := ENPlanWorkItemFilter.Create;
    SetNullIntProps(planItemFilter);
    SetNullXSProps(planItemFilter);

    PlanItemFilter.conditionSQL := 'enplanworkitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + ')';
     // '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + ')';

    planItemFilter.orderBySQL := ' enplanworkitem.kartarefcode';

    ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

    iLastCount:=High(ENPlanWorkItemList.list);

    if iLastCount > -1 then
       sgENPlanWorkItem.RowCount:=iLastCount+2
    else
       sgENPlanWorkItem.RowCount:=2;

     with sgENPlanWorkItem do
      for i:=0 to iLastCount do
        begin
          Application.ProcessMessages;
          if ENPlanWorkItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENPlanWorkItemList.list[i].kartaNum;
          Cells[2,i+1] := ENPlanWorkItemList.list[i].kartaRefName;
          Cells[3, i+1] := ENPlanWorkItemList.list[i].sourceName;


          vCountGen := 0;

          if ENPlanWorkItemList.list[i].countGen = nil then
            Cells[4,i+1] := ''
          else begin
            Cells[4,i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;
            try
              vCountGen := StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString);
            except
              vCountGen := 0;
            end;
          end;

          vNormOfTime := 0;

          if ENPlanWorkItemList.list[i].normOfTime = nil then
            Cells[5, i+1] := ''
          else begin
            Cells[5, i+1] := ENPlanWorkItemList.list[i].normOfTime.DecimalString;
            try
              vNormOfTime := StrToFloat(ENPlanWorkItemList.list[i].normOfTime.DecimalString);
            except
              vNormOfTime := 0;
            end;
          end;

          Cells[6,i+1] := FloatToStr(Conv(vNormOfTime * vCountGen, 3));

          Cells[7, i+1] := ENPlanWorkItemList.list[i].meter;
          Cells[8, i+1] := ENPlanWorkItemList.list[i].measurementUnit;

          Cells[9,i+1] := ENPlanWorkItemList.list[i].userGen;

          {if ENPlanWorkItemList.list[i].dateEdit = nil then
            Cells[9,i+1] := ''
          else
            Cells[9,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);}

          /////
          try
            RowColor[i+1] := clWindow;
            
            // Если работа с нулевым кол-вом, выделяем строку красным цветом
            if ENPlanWorkItemList.list[i].countGen <> nil then
              if StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString) = 0 then
                RowColor[i+1] := clTeal; //clRed;
          except
          end;
          /////

          //iLastRow:=i+1;
          //sgENPlanWorkItem.RowCount:=iLastRow+1;
        end;

     sgENPlanWorkItem.Row:=1;
  end; // selected tsPlanWorkItems


// ----------------------------------------------------------
  if pcENActs.ActivePage = tsMaterials then
  begin
    SetGridHeaders(FINMaterialsShortHeaders, sgFINMaterials.ColumnHeaders);

    finFilter := FINMaterialsFilter.Create;
    SetNullIntProps(finFilter);
    SetNullXSProps(finFilter);

    finFilter.statusRef := FINMaterialsStatusRef.Create;
    finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

    finFilter.conditionSQL := 'finmaterials.estimateitemrefcode in ' +
      '(select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + '))';
    //    '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + '))';

    finFilter.orderBySQL := ' FINMATERIALS.NN, FINMATERIALS.BAL_SCH, case when ENESTIMATEITEM.KINDREFCODE = 2 then FINMATERIALS.MAT_NAME||''(ПММ)'' else FINMATERIALS.MAT_NAME end, FINMATERIALS.MU_NAME, FINMATERIALS.PRICE';

    TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

    finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

    if High(finList.list) > -1 then
       sgFINMaterials.RowCount:=High(finList.list)+2
    else
       sgFINMaterials.RowCount:=2;

     with sgFINMaterials do
      for i:=0 to High(finList.list) do
        begin
          Application.ProcessMessages;
          if finList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(finList.list[i].code)
          else
          Cells[0,i+1] := '';

          Cells[1,i+1] := finList.list[i].mat_name;
          //Cells[2,i+1] := finList.list[i].mu_name;
          //Cells[3,i+1] := finList.list[i].nn;
          Cells[2,i+1] := finList.list[i].nn;
          Cells[3,i+1] := finList.list[i].mu_name;

          if finList.list[i].quantity = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := finList.list[i].quantity.DecimalString;

{ перенесено в КАЛК_ПРАЙС - цена из партиии ...
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
          sgFINMaterials.RowCount:= i + 2;
        end;
     //ColCount:=ColCount+1;
     sgFINMaterials.Row:=1;

  end;


// ----------------------------------------------------------
  if pcENActs.ActivePage = tsHumens then
  begin

    fillActHumens(ENHUMENITEMKIND_ELTEH);

    SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);

    humenItemFilter := ENHumenItemFilter.Create;
    SetNullIntProps(humenItemFilter);
    SetNullXSProps(humenItemFilter);

    //if HumenItemFilter.planRef = nil then HumenItemFilter.planRef := ENPlanWorkRef.Create;
    //HumenItemFilter.planRef.code := ENPlanWorkObj.code;


    HumenItemFilter.conditionSQL := 'enhumenitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + ')';
    //  '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + ')';

    HumenItemFilter.orderBySQL := 'enhumenitem.planitemrefcode';

    TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

    ENHumenItemList := TempENHumenItem.getScrollableFilteredList(HumenItemFilter, 0, -1);

    //eiLastCount := High(ENHumenItemList.list);

    if High(ENHumenItemList.list) > -1 then
      sgENHumenItem.RowCount := High(ENHumenItemList.list) + 2
    else
      sgENHumenItem.RowCount := 2;

    with sgENHumenItem do
       for i := 0 to High(ENHumenItemList.list) do
       begin
          Application.ProcessMessages;
          if ENHumenItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENHumenItemList.list[i].code)
          else
          Cells[0,i+1] := '';

          Cells[1, i+1] := ENHumenItemList.list[i].positionGenName + ' ' + ENHumenItemList.list[i].positionGenRank + ' розряду';

          Cells[2, i+1] := ENHumenItemList.list[i].finWorkerPositionName;
          Cells[3, i+1] := ENHumenItemList.list[i].finWorkerName;

  //        Cells[2, i+1] := ENHumenItemList.list[i].manningTableName;
  //        Cells[3, i+1] := ENHumenItemList.list[i].workerFactName;

          if ENHumenItemList.list[i].countGen = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := ENHumenItemList.list[i].countGen.DecimalString;

          if ENHumenItemList.list[i].countFact = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := ENHumenItemList.list[i].countFact.DecimalString;

          Cells[6, i+1] := ENHumenItemList.list[i].kartaNum;
          Cells[7,i + 1] := ENHumenItemList.list[i].kartaRefName;
        
            {
          if ENHumenItemList.list[i].price = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := ENHumenItemList.list[i].price.DecimalString;
          if ENHumenItemList.list[i].cost = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := ENHumenItemList.list[i].cost.DecimalString;
          Cells[5,i+1] := ENHumenItemList.list[i].userGen;
          if ENHumenItemList.list[i].dateEdit = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := XSDate2String(ENHumenItemList.list[i].dateEdit);
            }
          //LastRow:=i+1;
          //sgENHumenItem.RowCount:=LastRow+1;

      sgENHumenItem.Row := 1;
    end;
  end;

// -----------------------------------------------------------------------------------------------------

  if pcENActs.ActivePage = tsTransports then
  begin
    SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);

    TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

    transportItemFilter := ENTransportItemFilter.Create;
    SetNullIntProps(transportItemFilter);
    SetNullXSProps(transportItemFilter);

    //transportItemFilter.conditionSQL := 'entransportitem.planrefcode in ' +
    //  '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + ')';
    transportItemFilter.conditionSQL := 'entransportitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + ')';

    transportItemFilter.orderBySQL := ' entransportitem.planitemrefcode';

    ENTransportItemList := TempENTransportItem.getScrollableFilteredList(transportItemFilter,0,-1);

    if High(ENTransportItemList.list) > -1 then
      sgENTransportItem.RowCount := High(ENTransportItemList.list) + 2
    else
      sgENTransportItem.RowCount := 2;


    with sgENTransportItem do
       for i := 0 to High(ENTransportItemList.list) do
       begin
          Application.ProcessMessages;
          if ENTransportItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
          else
          Cells[0,i+1] := '';

          Cells[1, i+1] := ENTransportItemList.list[i].transportName;
          Cells[2, i+1] := ENTransportItemList.list[i].transportRealName;

          //Cells[3, i+1] := ENTransportItemList.list[i].workerFactName;
          Cells[3, i+1] := ENTransportItemList.list[i].finWorkerName + ' ' + ENTransportItemList.list[i].finWorkerPositionName;

          if ENTransportItemList.list[i].countWorkGen = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := ENTransportItemList.list[i].countWorkGen.DecimalString;

          if ENTransportItemList.list[i].countWorkFact = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := ENTransportItemList.list[i].countWorkFact.DecimalString;

          Cells[6, i+1] := ENTransportItemList.list[i].kartaNum;
          Cells[7,i + 1] := ENTransportItemList.list[i].kartaRefName;

          Cells[8,i+1] := '';
          Cells[9,i+1] := '';

          Cells[10,i+1] := ENTransportItemList.list[i].userGen;

          if ENTransportItemList.list[i].dateEdit = nil then
            Cells[11,i+1] := ''
          else
            Cells[12,i+1] := XSDate2String(ENTransportItemList.list[i].dateEdit);
          //LastRow:=i+1;
          //sgENHumenItem.RowCount:=LastRow+1;

         Objects[0,i+1] := TObject(ENTransportItemList.list[i].typeRefCode);

         sgENTransportItem.Row := 1;
      end;


  end;

  //--------------------------------------------------------------------------------
  if pcENActs.ActivePage = tsValidateMaterials then
  begin
    totalAct := 0;
    totalFin := 0;

    //oldSeparator := FormatSettings.DecimalSeparator;

    FormatSettings.DecimalSeparator := '.';

    SetGridHeaders(FINMaterialsShortHeaders, sgFINAllMaterials.ColumnHeaders);

    finFilter := FINMaterialsFilter.Create;
    SetNullIntProps(finFilter);
    SetNullXSProps(finFilter);

    finFilter.statusRef := FINMaterialsStatusRef.Create;
    finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

    finFilter.conditionSQL := 'finmaterials.estimateitemrefcode in ' +
      '(select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + '))';
       // '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + '))';

    finFilter.orderBySQL := ' FINMATERIALS.NN, FINMATERIALS.BAL_SCH, case when ENESTIMATEITEM.KINDREFCODE = 2 then FINMATERIALS.MAT_NAME||''(ПММ)'' else FINMATERIALS.MAT_NAME end, FINMATERIALS.MU_NAME, FINMATERIALS.PRICE';

    TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

    finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

    if High(finList.list) > -1 then
       sgFINAllMaterials.RowCount:=High(finList.list)+2
    else
       sgFINAllMaterials.RowCount:=2;

     with sgFINAllMaterials do
      for i:=0 to High(finList.list) do
        begin
          Application.ProcessMessages;
          if finList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(finList.list[i].code)
          else
          Cells[0,i+1] := '';

          if  finList.list[i].estimateItemRefKindCode = ENESTIMATEITEMKIND_GSM then
            Cells[1,i+1] := finList.list[i].mat_name + '(ПММ)'
          else
            Cells[1,i+1] := finList.list[i].mat_name;

          //Cells[2,i+1] := finList.list[i].mu_name;
          //Cells[3,i+1] := finList.list[i].nn;
          Cells[2,i+1] := finList.list[i].nn;
          Cells[3,i+1] := finList.list[i].mu_name;

          if finList.list[i].quantity = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := finList.list[i].quantity.DecimalString;

{
 перенесено в КАЛК_ПРАЙС - цена из партиии ...
          if finList.list[i].price = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := finList.list[i].price.DecimalString;
}
          if finList.list[i].calc_price = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := finList.list[i].calc_price.DecimalString;

          /////
          costFin := 0;

          if finList.list[i].cost = nil then
            Cells[6,i+1] := ''
          else begin
            Cells[6,i+1] := finList.list[i].cost.DecimalString;
            try
              costFin := StrToFloat(finList.list[i].cost.DecimalString);
            except
              costFin := 0;
            end;
          end;

          totalFin := totalFin + costFin;
          /////

          Cells[7,i+1] := finList.list[i].div_name;

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
          //sgFINAllMaterials.RowCount:= i + 2;
        end;
     //ColCount:=ColCount+1;
     sgFINAllMaterials.Row:=1;


  //end;

    SetGridHeaders(FINMaterialsShortHeaders, sgFINActMaterials.ColumnHeaders);

    finFilter := FINMaterialsFilter.Create;
    SetNullIntProps(finFilter);
    SetNullXSProps(finFilter);

    finFilter.statusRef := FINMaterialsStatusRef.Create;
    finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

    finFilter.conditionSQL := 'finmaterials.estimateitemrefcode in ' +
      '(select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + '))';
       // '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + '))';

    finFilter.orderBySQL := ' FINMATERIALS.NN, FINMATERIALS.BAL_SCH, case when ENESTIMATEITEM.KINDREFCODE = 2 then FINMATERIALS.MAT_NAME||''(ПММ)'' else FINMATERIALS.MAT_NAME end, FINMATERIALS.MU_NAME, FINMATERIALS.CALC_PRICE';

    TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

    finList := TempFINMaterials.getGroupedFilteredList(finFilter,0,-1);

    if High(finList.list) > -1 then
       sgFINActMaterials.RowCount:=High(finList.list)+2
    else
       sgFINActMaterials.RowCount:=2;

     with sgFINActMaterials do
      for i:=0 to High(finList.list) do
        begin
          Application.ProcessMessages;
          if finList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(finList.list[i].code)
          else
          Cells[0,i+1] := '';

          Cells[1,i+1] := finList.list[i].mat_name;

          //Cells[2,i+1] := finList.list[i].mu_name;
          //Cells[3,i+1] := finList.list[i].nn;
          Cells[2,i+1] := finList.list[i].nn;
          Cells[3,i+1] := finList.list[i].mu_name;

          if finList.list[i].quantity = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := finList.list[i].quantity.DecimalString;


          if finList.list[i].price = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := finList.list[i].price.DecimalString;

          if finList.list[i].cost = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := finList.list[i].cost.DecimalString;

          /////
          costAct := 0;

          if finList.list[i].cost = nil then
            Cells[6,i+1] := ''
          else begin
            Cells[6,i+1] := finList.list[i].cost.DecimalString;
            try
              costAct := StrToFloat(finList.list[i].cost.DecimalString);
            except
              costAct := 0;
            end;
          end;

          totalAct := totalAct + costAct;
          /////

          Cells[7,i+1] := finList.list[i].div_name;

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
          //sgFINActMaterials.RowCount:= i + 2;
        end;
     //ColCount:=ColCount+1;
     sgFINActMaterials.Row:=1;
  end;

  // ----------------------------------------------------------
  if pcENActs.ActivePage = tsProducedMaterials then
  begin
    updateProduced;
  end;

  // -- tsAct2ServicesFromSide
  if (pcENActs.ActivePage = tsAct2ServicesFromSide) then
  begin
    ClearGrid(sgActsServicesFS);
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    RQFKOrderFilterObj.conditionSQL := 'code in (' +
      ' select a2f.fkorderrefcode from enact2rqfkorder a2f ' +
      ' where a2f.actrefcode = ' + IntToStr(ENActObj.code) + ')';

    RQFKOrderFilterObj.orderBySQL := 'dategen desc, statuscode desc';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilterObj, 0, -1);

    if High(RQFKOrderList.list) > -1 then
       sgActsServicesFS.RowCount := High(RQFKOrderList.list) + 2
    else
       sgActsServicesFS.RowCount := 2;

     with sgActsServicesFS do
      for i := 0 to High(RQFKOrderList.list) do
        begin
          Application.ProcessMessages;
          if RQFKOrderList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := RQFKOrderList.list[i].numberDoc;
          if RQFKOrderList.list[i].dateGen = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

          Cells[3,i+1] := RQFKOrderList.list[i].orgOkpo;
          Cells[4,i+1] := RQFKOrderList.list[i].orgName;
          Cells[5,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString;
          Cells[6,i+1] := RQFKOrderList.list[i].statusName;
          Cells[7,i+1] := RQFKOrderList.list[i].userAdd;

          if RQFKOrderList.list[i].dateAdd = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

          Cells[9,i+1] := RQFKOrderList.list[i].userGen;

          if RQFKOrderList.list[i].dateEdit = nil then
            Cells[10,i+1] := ''
          else
            Cells[10,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

          sgActsServicesFS.RowCount := i + 2;
        end;

     sgActsServicesFS.Row := 1;
  end;

  if (pcENActs.ActivePage = tsDecree) then
  begin
    actUpdateDfDocDecreeExecute(Sender);
  end;

  if (pcENActs.ActivePage = tsDFDoc) then
  begin
    updateDFDocs;
  end;

  sgFINActMaterialsClick(Sender);

  pnlTotalAct.Caption := FloatToStr(Conv(totalAct, 2));
  pnlTotalFin.Caption := FloatToStr(Conv(totalFin, 2));
end;

procedure  TfrmENActEdit.fillActHumens(humenKind : Integer);
var
  TempENAct2Humen: ENAct2HumenControllerSoapPort;
  i: Integer;
  ENAct2HumenList: ENAct2HumenShortList;
  begin
  SetGridHeaders(ENAct2HumenHeaders, sgENAct2Humen.ColumnHeaders);
  //ColCount:=100;
  TempENAct2Humen :=  HTTPRIOENAct2Humen as ENAct2HumenControllerSoapPort;

//  if actHumenFilter = nil then
  begin
     actHumenFilter := ENAct2HumenFilter.Create;
     SetNullIntProps(actHumenFilter);
     SetNullXSProps(actHumenFilter);
     actHumenFilter.actRef := ENActRef.Create;
     actHumenFilter.actRef.code := ENActObj.code;

     //actHumenFilter.humenKindRef := ENHumenItemKindRef.Create;
     //actHumenFilter.humenKindRef.code := humenKind;
  end;

    ENAct2HumenList := TempENAct2Humen.getScrollableFilteredList(actHumenFilter,0,-1);


  //LastCount:=High(ENAct2HumenList.list);

  if High(ENAct2HumenList.list) > -1 then
     sgENAct2Humen.RowCount:=High(ENAct2HumenList.list)+2
  else
     sgENAct2Humen.RowCount:=2;

   with sgENAct2Humen do
    for i:=0 to High(ENAct2HumenList.list) do
      begin
        Application.ProcessMessages;
        if ENAct2HumenList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAct2HumenList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENAct2HumenList.list[i].orederNum = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENAct2HumenList.list[i].orederNum);
        Cells[2,i+1] := ENAct2HumenList.list[i].tabNumber;
        Cells[3,i+1] := ENAct2HumenList.list[i].fio;
{
        if ENAct2HumenList.list[i].salary = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENAct2HumenList.list[i].salary.DecimalString;
}
        if ENAct2HumenList.list[i].timeMonth = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENAct2HumenList.list[i].timeMonth.DecimalString;
{
        if ENAct2HumenList.list[i].salaryHours = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENAct2HumenList.list[i].salaryHours.DecimalString;
}

        if ENAct2HumenList.list[i].timeWork = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENAct2HumenList.list[i].timeWork.DecimalString;

        Cells[8, i+1] := ENAct2HumenList.list[i].humenKindRefName;
{
        if ENAct2HumenList.list[i].paysWork = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENAct2HumenList.list[i].paysWork.DecimalString;
}
        //LastRow:=i+1;
        sgENAct2Humen.RowCount:= i + 2;
      end;

   sgENAct2Humen.Row:=1;

end;

// Проверка сторнирован ли акт
procedure TfrmENActEdit.checkIfActIsReversed;
begin
  if(DialogState = dsInsert) then Exit;

  if(ENActObj.statusRef.code = ENACT_REVERSED) then
  begin
    raise Exception.Create('Акт сторнований');
  end;
end;

procedure TfrmENActEdit.btnPrintActClick(Sender: TObject);
{
var
 argNames, args: ArrayOfString;
 reportName: String;
 i, planType_, planType2 : integer;
 PlanWorkList: ENPlanWorkShortList;
 actTypeIn : Integer;
 }
begin
btnPrintAct2Click(Sender);

EXIT;

// ДОЛЬШЕ не смотреть ..... !!!!!!!!!!!!!
// !!!!!!!!!!!!!!!!!!!!!

end;

procedure TfrmENActEdit.edtDateGenExit(Sender: TObject);
var
tmpDate : TDateTime;
begin
  inherited;
{
if DialogState = dsEdit then
  begin
         tmpDate := EncodeDate(ENActObj.dateGen.Year,ENActObj.dateGen.Month,ENActObj.dateGen.Day);
         if edtDateGen.DateTime <  tmpDate then
         begin
            Application.MessageBox(PChar('Дата должна быть БОЛЬШЕ текущей даты акта !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            edtDateGen.DateTime :=  tmpDate;
            if edtDateGen.CanFocus then edtDateGen.SetFocus;
            //Exit;
         end;
  end;
  }
end;

procedure TfrmENActEdit.spbFINMechanicClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      //plan := DMReports.getPlanByCode(planCode);

      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.renRef := EPRenRef.Create;
      renFilter.renRef.code := renCode; //plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
        f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);
   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFinMechanicName.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ENActObj.finMechanicCode := GetReturnValue(sgFINMol,0);
               ENActObj.finMechanicName := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
 {

 if not Assigned(frmFINMolShow) then
    frmFINMolShow := TfrmFINMolShow.Create(Application,fmChild,f);
 frmFINMolShow.Show;
 }


end;

procedure TfrmENActEdit.spbENPlanWorkStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
   f : ENPlanWorkStateFilter;
   e : ENElement;
begin
   f:= ENPlanWorkStateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.orderBySQL := 'ordered';
   //f.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode from enplantype2planstate where enplantype2planstate.typerefcode = '+ IntToStr(ENPlanWorkObj.typeRef.code) +')';

   e := DMReports.getElementByCode(ENActObj.element.code);

   if e.typeRef.code <> EN_SUBSTATION150 then
      f.conditionSQL := 'enplanworkstate.code <> ' + IntToStr(ENPLANWORKSTATE_CURRENTREPAIR);

   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal,f);
   try
      with frmENPlanWorkStateShow do begin
        DisableActions([ actEdit, actInsert, actDelete, actNoFilter, actFilter ]);
        if ShowModal = mrOk then
        begin
            try
               if ENActObj.actTypeRef = nil then ENActObj.actTypeRef := ENPlanWorkStateRef.Create();
               ENActObj.actTypeRef.code := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;


end;

procedure TfrmENActEdit.btnCloseActClick(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
  //ObjCode: Integer;
  plansList : ENPlanWorkShortList;
  plansString : String;
  i : Integer;
  provCount : Integer;

  TempENAct2FinKodIst : ENAct2FinKodIstControllerSoapPort;
  a2fFilter : ENAct2FinKodIstFilter;
  a2fList : ENAct2FinKodIstShortList;

  servicesObject: ENServicesObject;
begin
 TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

 if molCode = Low(Integer) then
   begin
      Application.MessageBox(PChar('Відсутня МВО, необхідно переприв''язати наряд до акту !!!'), PChar('Увага !'), MB_ICONWARNING);
      Exit;
   end;

 if ENActObj.statusRef.code = ENACT_SIGNATURE then
 begin

    if Application.MessageBox(PChar('Вы действительно хотите УТВЕРДИТЬ АКТ ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin

      /// проверить на привязанный источник для пломб
        if actHasSeals then
        begin
            TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;
            a2fFilter := ENAct2FinKodIstFilter.Create;
            SetNullIntProps(a2fFilter);
            SetNullXSProps(a2fFilter);
            a2fFilter.actRef := ENActRef.Create;
            a2fFilter.actRef.code := ENActObj.code;
            a2fList := TempENAct2FinKodIst.getScrollableFilteredList(a2fFilter,0,-1);
            if a2fList.totalCount = 0 then
              begin
               Application.MessageBox(PChar('На этом акте должен быть указан источник для пломб!'),
                PChar('Увага !'), MB_ICONWARNING);
              Exit;
              end;
        end;

        TempENAct.close( ENActObj.code , 1 , true );

        Application.MessageBox(PChar('Акт проведен !'),PChar('Внимание !'),MB_ICONINFORMATION);

        //UpdateGrid(Sender);
        //updateFINMaterialsGrid;
        //updateENFINMaterialsGrid;
    end;
  end;

 if ENActObj.statusRef.code = ENACT_CLOSED then
 begin

    if Application.MessageBox(PChar('Вы действительно хотите удалить проведение акта ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin

      // для доробок по ДП могут быть сформированные проводки .. они пакаджем уходят по тихому :(
      if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_REFINEMENT_BY_CONTRACT) or (ENActObj.actTypeRef.code = ENPLANWORKSTATE_REFINEMENT) then
      begin
        provCount := TempENAct.getCountProvByActCode(ENActObj.code);
        if  provCount > 0 then
        begin
          if Application.MessageBox(PChar('Вже є сформовані проводки ('+ IntToStr(provCount)+') з Макету ... відмінити проведення акту ?'),
                            PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
          begin
            Exit;
          end;

        end;
      end;

      // Для актов, подписанных с помощью ЭЦП, вызываем свой метод отмены проведения
      // (чтобы были отдельные права, потому что их могут проводить/отменять проведение
      // все подряд, а старые - только бухгалтера)
      if DMReports.getDocCodeForObject(ENActObj) > 0 then
        TempENAct.unCloseByEcp(ENActObj.code, 1)
      else
        TempENAct.unClose(ENActObj.code, 1);

        Application.MessageBox(PChar('Акт Отменен !'),PChar('Внимание !'),MB_ICONINFORMATION);

        //UpdateGrid(Sender);
        //updateFINMaterialsGrid;
        //updateENFINMaterialsGrid;
    end;
 end;

 if ENActObj.statusRef.code = ENACT_GOOD then
 begin
    if Application.MessageBox(PChar('Вы действительно хотите изменить статус у Акта "НА подписании" ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        if ENActObj.element.typeRef.code = EN_SERVICES_OBJECT then
        begin
          servicesObject := DMReports.getServicesObjectByElementCode(ENActObj.element.code);
          if servicesObject = nil then
            raise Exception.Create('Не знайдено зв''язаний договір з послуг на сторону!');

          // Проверяем для всех, кроме присоединений, потому что там проводки передаются при
          // подписании справки о выполнении работ (повідомлення про виконання робіт)
          if (servicesObject.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION) then
          begin
            // Проверка корректности проводок
            if not DMReports.checkMoveToFK(servicesObject.code) then Exit;
          end;
        end;

        TempENAct.signatured( ENActObj.code );

        Application.MessageBox(PChar('Статус изменен ..!'),PChar('Внимание !'),MB_ICONINFORMATION);

        //UpdateGrid(Sender);
        //updateFINMaterialsGrid;
        //updateENFINMaterialsGrid;
    end;
 end;

 ModalResult := mrYes;

end;

procedure TfrmENActEdit.btnMoveToReversedClick(Sender: TObject);
var
  TempENAct : ENActControllerSoapPort;
begin
  inherited;
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
  if Application.MessageBox(PChar('Вы действительно хотите сторнировать акт ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
         TempENAct.moveToReversed(ENActObj.code);
         ENActObj := TempENAct.getObject(ENActObj.code);
         Self.FormShow(Sender);
         Application.MessageBox(PChar('Акт сторнирован!'),PChar('Внимание !'),MB_ICONINFORMATION);
  end;


end;

{
procedure TfrmENActEdit.Button1Click(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  finFilter : FINMaterialsFilter;
  finList: FINMaterialsShortList;

begin
 finFilter := FINMaterialsFilter.Create;
 SetNullIntProps(finFilter);
 SetNullXSProps(finFilter);
 finFilter.statusRef := FINMaterialsStatusRef.Create;
 finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;
 finFilter.conditionSQL := 'finmaterials.estimateitemrefcode in ' +
      '(select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in ' +
        '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + '))';

    TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

    finList := TempFINMaterials.getGroupedFilteredList(finFilter,0,-1);
    ShowMessage(intToStr(finList.totalCount));

end;
}

procedure TfrmENActEdit.sgENActInvest2DFDocDblClick(Sender: TObject);
begin
  inherited;
   ActViewActInvest2dfdocExecute(Sender);
end;

procedure TfrmENActEdit.sgFINActMaterialsClick(Sender: TObject);
var
  nn, mat, ed, price :String;
  i : integer;
begin

  nn := sgFINActMaterials.Cells[ 3, sgFINActMaterials.Row] ;
  mat := sgFINActMaterials.Cells[ 1, sgFINActMaterials.Row] ;
  ed := sgFINActMaterials.Cells[ 2, sgFINActMaterials.Row] ;
  price := sgFINActMaterials.Cells[ 5, sgFINActMaterials.Row] ;
{

          ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'МОЛ'
          //,'тип строки кошторису'
          //,'користувач, що вніс зміни'
          //,'дата останньої зміни'
}

  for  i:=1 to sgFINAllMaterials.RowCount - 1 do
  begin
    if  (sgFINAllMaterials.Cells[ 3, i ] = nn)
     and (sgFINAllMaterials.Cells[ 1, i ] = mat)
     and (sgFINAllMaterials.Cells[ 2, i ] = ed)
     and (sgFINAllMaterials.Cells[ 5, i ] = price)
    then
    begin
       sgFINAllMaterials.RowColor[i] := $0080FF80;
    end
    else
      sgFINAllMaterials.RowColor[i] := clWindow;

  end;

end;


procedure TfrmENActEdit.sgSCUsageInputClick(Sender: TObject);
var
  TempSCUsageInput: SCUsageInputControllerSoapPort;
begin
  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

  frmSCUsageInputEdit := TfrmSCUsageInputEdit.Create(Application, dsView);
  try
    try
      frmSCUsageInputEdit.SCUsageInputObj := TempSCUsageInput.getObject(StrToInt(sgSCUsageInput.Cells[0, sgSCUsageInput.Row]));
    except
      on EConvertError do Exit;
    end;
    frmSCUsageInputEdit.ShowModal;
  finally
    frmSCUsageInputEdit.Free;
    frmSCUsageInputEdit := nil;
  end;
end;


procedure TfrmENActEdit.actViewExecute(Sender: TObject);
var
  objCode, selectedRow : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit : TfrmRQFKOrderEdit;
begin
  inherited;

  if pcENActs.ActivePage = tsPlans then
  begin
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

      try
        objCode:=StrToInt( sgENAct2ENPlanWork.Cells[0, sgENAct2ENPlanWork.row] );
      except
        on EConvertError do Exit;
      end;

      selectedRow := sgENAct2ENPlanWork.Row;

      frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
      try

        frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );

        frmENPlanWorkEdit.ShowModal;

      finally
        frmENPlanWorkEdit.Free;
        frmENPlanWorkEdit:=nil;
      end;
  end;

  // -- tsAct2ServicesFromSide
  if (pcENActs.ActivePage = tsAct2ServicesFromSide) then
  begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);

    try
      try
        frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgActsServicesFS.Cells[0,sgActsServicesFS.Row]));
      except
        on EConvertError do Exit;
      end;

      if (frmRQFKOrderEdit.ShowModal = mrOk)
            and (frmRQFKOrderEdit.RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
        begin
          UpdateGrid(Sender);
        end;
    finally
      frmRQFKOrderEdit.Free;
      frmRQFKOrderEdit:=nil;
    end;

  end;

end;

procedure TfrmENActEdit.actAddFinKodIstExecute(Sender: TObject);
// Var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
begin
  // TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAct2FinKodIstObj:=ENAct2FinKodIst.Create;
  ENAct2FinKodIstObj.actRef := ENActRef.Create;
  ENAct2FinKodIstObj.actRef.code := ENActObj.code;

  try
    frmENAct2FinKodIstEdit:=TfrmENAct2FinKodIstEdit.Create(Application, dsInsert);
    try
      if frmENAct2FinKodIstEdit.ShowModal = mrOk then
      begin
        if ENAct2FinKodIstObj<>nil then
            //TempENAct2FinKodIst.add(ENAct2FinKodIstObj);
            updateFinKodIst;
      end;
    finally
      frmENAct2FinKodIstEdit.Free;
      frmENAct2FinKodIstEdit:=nil;
    end;
  finally
    ENAct2FinKodIstObj.Free;
  end;
end;

procedure TfrmENActEdit.actClearDFDocSignersExecute(Sender: TObject);
begin
  if DialogState = dsView then Exit;

  initDFDocSignersGrid(false);
end;

procedure TfrmENActEdit.ActDeleteActInvest2dfdocExecute(Sender: TObject);
Var TempENActInvest2DFDoc: ENActInvest2DFDocControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActInvest2DFDoc := HTTPRIOENActInvest2DFDoc as ENActInvest2DFDocControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActInvest2DFDoc.Cells[0,sgENActInvest2DFDoc.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Звязок актів по ІП з документом DocFlow)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActInvest2DFDoc.remove(ObjCode);
      pcENActsChange(Sender);
  end;
end;

procedure TfrmENActEdit.actDeleteExecute(Sender: TObject);
var
  objCode , selectedRow, fkOrderCode, act2RQFKOrdeCode : Integer;
  //TempENPlanWork : ENPlanWorkControllerSoapPort;
  TempENAct2ENPlanWork : ENAct2ENPlanWorkControllerSoapPort;
  list : ENAct2ENPlanWorkShortList;
  f : ENAct2ENPlanWorkFilter;
  TempENAct2RQFKOrder : ENAct2RQFKOrderControllerSoapPort;
  act2RQFKOrderFilter : ENAct2RQFKOrderFilter;
  act2RQFKOrderList : ENAct2RQFKOrderShortList;
  act2RQFKOrderArr : ENAct2RQFKOrderController.ArrayOfInteger;
begin
  inherited;

  if pcENActs.ActivePage = tsPlans then
  begin

      TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;

      try
        objCode:=StrToInt( sgENAct2ENPlanWork.Cells[0, sgENAct2ENPlanWork.row] );
      except
        on EConvertError do Exit;
      end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить Наряд из АКТА ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        f := ENAct2ENPlanWorkFilter.Create;
        SetNullXSProps(f);
        SetNullIntProps(f);
        f.plan := ENPlanWork.Create;
        f.plan.code := objCode;

        list := TempENAct2ENPlanWork.getScrollableFilteredList(f, 0, -1);
        if ( list.totalCount > 0) then
          TempENAct2ENPlanWork.remove( list.list[0].code, 1 );
        //else
        // по идее такого не будет ;)

        UpdateGrid(Sender);
    end;

  end; //  pcENActs.ActivePage = tsPlans

  // -- tsAct2ServicesFromSide
  if (pcENActs.ActivePage = tsAct2ServicesFromSide) then
  begin
    TempENAct2RQFKOrder := HTTPRIOENAct2RQFKOrder as ENAct2RQFKOrderControllerSoapPort;
    try
      fkOrderCode := StrToInt(sgActsServicesFS.Cells[0,sgActsServicesFS.Row]);
    except
    on EConvertError do Exit;
    end;

    act2RQFKOrderFilter := ENAct2RQFKOrderFilter.Create;
    SetNullIntProps(act2RQFKOrderFilter);;
    SetNullXSProps(act2RQFKOrderFilter);

    act2RQFKOrderFilter.actRef := ENActRef.Create;
    act2RQFKOrderFilter.actRef.code := ENActObj.code;
    act2RQFKOrderFilter.fkOrderRef := RQFKOrderRef.Create;
    act2RQFKOrderFilter.fkOrderRef.code := fkOrderCode;

    act2RQFKOrderArr := TempENAct2RQFKOrder.getScrollableFilteredCodeArray(act2RQFKOrderFilter, 0, -1);
    if High(act2RQFKOrderArr) > -1 then
      act2RQFKOrdeCode := act2RQFKOrderArr[0];

    if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок актів вик. робіт з актам з послуг зі сторони) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempENAct2RQFKOrder.remove(act2RQFKOrdeCode);
      UpdateGrid(Sender);
    end;
  end;

end;

procedure TfrmENActEdit.actDeleteFinKodIstExecute(Sender: TObject);
Var TempENAct2FinKodIst: ENAct2FinKodIstControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAct2FinKodIst.Cells[0,sgENAct2FinKodIst.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Источник из ФК для этого акта) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAct2FinKodIst.remove(ObjCode);
      updateFinKodIst();
  end;
end;

procedure TfrmENActEdit.ActInsertActInvest2dfdocExecute(Sender: TObject);
// Var TempENActInvest2DFDoc: ENActInvest2DFDocControllerSoapPort;
begin
  // TempENActInvest2DFDoc := HTTPRIOENActInvest2DFDoc as ENActInvest2DFDocControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActInvest2DFDocObj:=ENActInvest2DFDoc.Create;
  SetNullIntProps(ENActInvest2DFDocObj);
  SetNullXSProps(ENActInvest2DFDocObj);

  try
    frmENActInvest2DFDocEdit:=TfrmENActInvest2DFDocEdit.Create(Application, dsInsert);
    ENActInvest2DFDocObj.actRef := ENActRef.Create;
    ENActInvest2DFDocObj.actRef.code := ENActObj.code;

    try
      if frmENActInvest2DFDocEdit.ShowModal = mrOk then
      begin
        if ENActInvest2DFDocObj<>nil then

            pcENActsChange(Sender);
      end;
    finally
      frmENActInvest2DFDocEdit.Free;
      frmENActInvest2DFDocEdit:=nil;
    end;
  finally
    ENActInvest2DFDocObj.Free;
  end;
end;

procedure TfrmENActEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := LOW_INT;
end;

procedure TfrmENActEdit.btnPrintAct2Click(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, addReportName: String;
  i, z, planType, planType2, itemCode, kindCode, docCode: Integer;
  PlanWorkList: ENPlanWorkShortList;
  actTypeIn : Integer;
  TempENAct: ENActControllerSoapPort;
  actsList : ENActShortList;
  actsString : string;
  TempENEstimateItem: ENEstimateitemControllerSoapPort;
  //ENEstimateItemList: ENEstimateItemShortList;
  estimateFilter: ENEstimateItemFilter;
  estimateArr: ENEstimateItemController.ArrayOfInteger;
  servicesObject: ENServicesObject;

  TempFINMaterials : FINMaterialsControllerSoapPort;
  finFilter : FINMaterialsFilter;
  finList : FINMaterialsShortList;

  TempENPlanWorkENAct2OSData: ENPlanWorkENAct2OSDataControllerSoapPort;
  ENPlanWorkENAct2OSDataList: ENPlanWorkENAct2OSDataShortList;
  ENPlanWorkENActosdatafilter : ENPlanWorkENAct2OSDataFilter;

  TempENAct2RQFKOrder : ENAct2RQFKOrderControllerSoapPort;
  act2fkOrderFilter : ENAct2RQFKOrderFilter;
  act2fkOrderList : ENAct2RQFKOrderShortList;

  fkOrderForm : TfrmRQFKOrderEdit;

  TempSCUsageInputItem : SCUsageInputItemControllerSoapPort;
  scInputItemFilter : SCUsageInputItemFilter;
  scInputItemList : SCUsageInputItemShortList;
  scInputItem : SCUsageInputItem;

  TempSCUsageInputItemOZ : SCUsageInputItemOZControllerSoapPort;
  SCUsageInputItemOZList : SCUsageInputItemOZShortList;
  OZFilter : SCUsageInputItemOZFilter;

  reportsList: ArrayOfEPReportRequestEx;

begin
  inherited;



  if DialogState = dsInsert then Exit;

  checkIfActIsReversed;

  if molCode = Low(Integer) then
  begin
     Application.MessageBox(PChar('Відсутня МВО, необхідно переприв''язати наряд до акту  !!!'), PChar('Увага !'), MB_ICONWARNING);
     Exit;
  end;

 TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
 TempENAct2RQFKOrder := HTTPRIOENAct2RQFKOrder as ENAct2RQFKOrderControllerSoapPort;

  // для списаний мат-лов НЕТ работников и т.д. ...
  if DialogState = dsEdit then
  begin
    if (ENActObj.element.typeRef.code <> EN_WRITING_NO_OBJECT)
      // and  (ENActObj.actTypeRef.code <> ENPLANWORKSTATE_GSM)
       and  (ENActObj.actTypeRef.code <> ENPLANWORKSTATE_RECEPT_TRANSMISSION)
    then
    begin
     if (ENActObj.statusRef.code = ENACT_GOOD) {and (ENActObj.element.typeRef.code <> EN_METROLOGY_OBJECT)} then
     begin
      if Application.MessageBox(PChar('Перерахувати розрахунок заробітної плати та транспортні витрати ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
        if  StrToDate(XSDate2String(ENActObj.dateGen)) >= EncodeDate(2011, 7, 1) then
        begin
          actsList :=  TempENAct.getActs4Recalc(ENActObj.code);
          actsString := '';
          if ( actsList.totalCount > 0) then
          begin
             for i:=0 to actsList.totalCount - 1 do
             begin
               if actsList.list[i].statusRefCode = ENACT_GOOD then
               begin
                 actsString := actsString + #13#10 + actsList.list[i].numberGen + ' від ' + XSDate2String(actsList.list[i].dateGen );
               end;
             end;

            if Application.MessageBox(PChar('Будуть перераховані наступні акти, та їх статус буде змінено на  "На підписанні"...: ' + actsString + #13#10 +  #13#10 + ' ПЕРЕРАХУВАТИ їх ??! '),
                              PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
            begin
               Exit;
            end;

          end;
        end;

// 2014-07-17 SUPP-20193 изменен вызов метода при печати акта как и на подписании
//          TempENAct.fillActData(ENActObj.code);
          TempENAct.signatured( ENActObj.code );
          ENActObj := TempENAct.getObject(ENActObj.code);
          Self.FormShow(Sender);
      end;
     end;
    end;
  end;

  // Пока для теста вызываем печать по-новому только для актов, на которых
  // внесены подписанты. Для остальных актов - все как и раньше
  if DMReports.getDocCodeForObject(ENActObj) > 0 then
    if DMReports.printReportsForObject(ENActObj) then Exit;

 planType := DMReports.getPlanTypeByActCode(ENActObj.code) ;

 case ENActObj.actTypeRef.code of


   ENPLANWORKSTATE_CAPITALREPAIR , ENPLANWORKSTATE_CURRENTREPAIR  : actTypeIn := 2; //reportName := 'AVW2_var2_Sitog/Act21';

   ENPLANWORKSTATE_TECHNICALSERVICE : actTypeIn := 3; //reportName := 'AVW2_var2_Sitog_teh_obsl/Act21';



   //ENPLANWORKSTATE_RECONSTRUCTION  : reportName := 'AVW3_var2_Sitog/VedAktAddition3';


   ENPLANWORKSTATE_RECONSTRUCTION  :
     {
     пробить ТИП плана
     }
     //если ПРИЕДНАННЯ
     if planType = ENPLANWORKTYPE_CN then
       actTypeIn := 1 //reportName := 'AVW1_var2/VedAktAddition1'
     else
     // если другие
     actTypeIn := 4; //  reportName := 'AVW3_var2_Sitog/VedAktAddition3';

   //ENPLANWORKSTATE_TECHNICALSERVICE : reportName := 'AVW1_var2/VedAktAddition1';

   ENPLANWORKSTATE_CAPITALBUILDER :
   {
   пробить ТИПЫ планов ...
   }
   // если Инвест программа
   if planType in [ENPLANWORKTYPE_INVEST , ENPLANWORKTYPE_CN] then
     actTypeIn := 5 //reportName := 'AVW4_var2_Sitog/VedAktAddition4'
   // если ВСЕ остальное
   else
      actTypeIn := 2; //reportName := 'AVW2_var2_Sitog/Akt2';

   // ВСЕ ДРУГИЕ ТИПЫ
   else actTypeIn := ENActObj.actTypeRef.code;
 end;

  //reportName := 'common/AktVipWorkAddition2_var2_Sitog/VedAktAddition2';
  if (ENActObj.element.typeRef.code = EN_METROLOGY_OBJECT) and
     (ENActObj.element.code <> ENELEMENT_METROLOGY_OBJECT_WRITEOFF) then
  begin
    if ENActObj.actTypeRef.code <> ENPLANWORKSTATE_COUNTERS_ACT_DEFECT then
    begin
      reportName := 'ActMetrology/Act21';

      /////
      act2fkOrderFilter := ENAct2RQFKOrderFilter.Create;
      SetNullXSProps(act2fkOrderFilter);
      SetNullIntProps(act2fkOrderFilter);

      act2fkOrderFilter.typeRef := ENAct2RQFKOrderTypeRef.Create;
      act2fkOrderFilter.typeRef.code := ENConsts.ENACT2RQFKORDER_TYPE_SERVICES;

      act2fkOrderFilter.actRef := ENActRef.Create;
      act2fkOrderFilter.actRef.code := ENActObj.code;

      act2fkOrderList := TempENAct2RQFKOrder.getScrollableFilteredList(act2fkOrderFilter, 0, -1);

      if(act2fkOrderList.totalCount > 0) then
      begin
        SetLength(argNames, 1);
        SetLength(args, 1);

        argNames[0] := 'fkOrderCode';
        args[0] :=  IntToStr(act2fkOrderList.list[0].fkOrderRefCode);

        addReportName := 'Metrology/actCountersStateVerification';
        if (ENActObj.statusRef.code <> ENACT_GOOD) then
          makeReport(addReportName, argNames, args, 'xls');
      end
      else begin
        if DMReports.checkActTypeForCountersStateVerification(ENActObj) then
          raise Exception.Create('NET-4559 Видатковий акт не зв''язано з актом на послуги зі сторони (на Держповірку)!');
      end;
      /////

    end;
  end
  else
  if (ENActObj.element.typeRef.code = EN_BYT) and (ENActObj.actTypeRef.code <> ENPLANWORKSTATE_SIDEWORKS) then
  begin
     // 2011.12.06 нужно проверить если в акте нету материалов на списание кроме как ПММ погда формируем отчет стандартный на тех обслуживание.
     {
     TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateitemControllerSoapPort;
     estimateFilter := ENEstimateItemFilter.Create;
     SetNullIntProps(estimateFilter);
     SetNullXSProps(estimateFilter);
     estimateFilter.conditionSQL := ' ENESTIMATEITEM.CODE in ( select e.code from enestimateitem e , enplanwork p , enact2enplanwork a2p ' +
                                    '   where e.planrefcode = p.code ' +
                                    '     and p.code = a2p.plancode ' +
                                    '     and a2p.actrefcode = ' + IntToStr(ENActObj.code) +
                                    '     and e.kindrefcode = 1 ' +
                                    '     and e.countfact <> 0 )  ' ;

     ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateFilter, 0, -1);
     }


    finFilter := FINMaterialsFilter.Create;
    SetNullIntProps(finFilter);
    SetNullXSProps(finFilter);

    finFilter.statusRef := FINMaterialsStatusRef.Create;
    finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

    finFilter.conditionSQL := 'ENESTIMATEITEM.KINDREFCODE = 1 and finmaterials.estimateitemrefcode in ' +
      '(select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + '))';

    TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
    finList := TempFINMaterials.getGroupedFilteredList(finFilter,0,-1);

     //if High(ENEstimateItemList.list) > 0 then
     if High(finList.list) > 0 then
        reportName := 'ActByt/Act21'
     else
        reportName := 'AVWCommon2/Act21';
    actTypeIn := 3;

    {Для того, чтобы не отображались код затрат и налог/неналог
      в стандартной форме тех. обслуживания будем посылать
      тип акта -3 (тех обслуживание Енергозбыта)}
    //if High(ENEstimateItemList.list) <= 0 then  finList
    if High(finList.list) <= 0 then
      actTypeIn := -3;

  end
  else
  if ENActObj.element.typeRef.code = EN_ROUTE_BYT then
    reportName := 'ActENRouteByt/Act21'
  else
  if (ENActObj.element.typeRef.code = EN_PROM) and (ENActObj.actTypeRef.code <> ENPLANWORKSTATE_SIDEWORKS) then
  begin
    reportName := 'ActProm/Act21';
    //*** SUPP-75518... +++ актов с типом "відключення" быть не должно. *//
    // actTypeIn := planType;
    actTypeIn := 3;
  end

  else
  if ((ENActObj.element.typeRef.code = EN_PREPRODUCTION_OBJECT) or
      (ENActObj.element.typeRef.code = EN_SIT) or
      (ENActObj.element.typeRef.code = EN_BUILDER)) and
     (ENActObj.actTypeRef.code = ENPLANWORKSTATE_PRODUCTION) then
  begin
     reportName := 'AVWCommon2/ActPreproduction/Act21';
     actTypeIn := 10;
  end

  else
  if (ENActObj.element.typeRef.code = EN_TRANSPORT) and (ENActObj.actTypeRef.code = ENPLANWORKSTATE_GSM) then
  begin
     if ((ENActObj.dateGen.Day <= 30) and (ENActObj.dateGen.Month <= 11)  and (ENActObj.dateGen.Year <= 2011) ) then
     reportName := 'AVWCommon2/ActGSM/Act21'
     else
     // 29.11.2011  +++ новый фишки в перевезенни
     reportName := 'AVWCommon2/ActGSM2/Act21';
     actTypeIn := 12;
  end

  else
  // Для буфета акты на списание пока такие же, как и для ТМЦ
  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_MATERIALS_TMC) then
  begin
     reportName := 'AVWCommon2/ActMaterials/Act21';
     actTypeIn := 13;
  end
  //////////////////////////////////////////////////////////////////////////////
  else
  if ((ENActObj.actTypeRef.code = ENPLANWORKSTATE_BUFET_REALIZATION)or(ENActObj.actTypeRef.code = ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL)) then
  begin
     reportName := 'AVWCommon2/ActMaterials/ActBufet/Realization/Act21';
     actTypeIn := 13;
  end
  else
  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_BUFET_NONEREALIZATION) then
  begin
     reportName := 'AVWCommon2/ActMaterials/ActBufet/Nonerealization/Act21';
     actTypeIn := 13;
  end
  //////////////////////////////////////////////////////////////////////////////
  else
  if ENActObj.actTypeRef.code = ENPLANWORKSTATE_MATERIALS_MNMA then
  begin
     reportName := 'AVWCommon2/ActMaterials/...';
     actTypeIn := 15;
  end
  else
  if ENActObj.actTypeRef.code = ENPLANWORKTYPE_WRITEOFF_OS then
  begin
     reportName := 'AVWCommon2/ActMaterials/ActOZ/Act21';
     actTypeIn := 16;
  end
  else
  if ENActObj.actTypeRef.code = ENPLANWORKSTATE_RECEPT_TRANSMISSION then
  begin
     reportName := 'AReceptTransmisMaterials/Act';

  end
  // работы на сторону
  else
  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_SIDEWORKS) AND (ENActObj.element.typeRef.code <> EN_OPERATIVE_OBJECT)  then
    begin

      if ( ENActObj.dateGen.Year = 2011 ) AND ( ENActObj.dateGen.Month < 9 ) then
        reportName := 'AVWCommon2/Act21';

      if ((( ENActObj.dateGen.Year = 2011 ) AND (ENActObj.dateGen.Month >= 9) )
          or (ENActObj.dateGen.Year > 2011) ) then
      begin
        reportName := 'ActServicesObject/Act21';

        // 08.11.2013 +++ акт по услугам (ТУ, согласование, подключение) на договор о выполнении Тех.Условий
        if (ENActObj.element.typeRef.code = ENELEMENTTYPE_TECHCONDITIONSSERVICES) then
          reportName := 'ActCalculationByTechCondition/Act21';

        // NET-4576 Для договоров на подключение/отключение по заявкам поставщиков
        if (ENActObj.element.typeRef.code = EN_BYT) or (ENActObj.element.typeRef.code = EN_PROM) then
          reportName := 'ActServicesObject/Act21_enrecordpoint';

        ///// 20.05.13 NET-4235 В услугах с типом расчета "Розрахунок вартості на підставі фактичних витрат (новий метод)"
        // нужно по-новому считать общепроизв. затраты!!!
        if ENActObj.element.typeRef.code = EN_SERVICES_OBJECT then
        begin
          servicesObject := DMReports.getServicesObjectByElementCode(ENActObj.element.code);
          if servicesObject = nil then
            raise Exception.Create('Не знайдено зв''язаний договір з послуг на сторону!');

          if servicesObject.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
            reportName := 'ActServicesObject2/Act21';
        end;
        /////
      end;

    end

  else
  if ENActObj.actTypeRef.code = ENPLANWORKSTATE_INSTALLATION_REINSTALLATION  then
  begin
     reportName := 'ActInstallation/ActInstall';
  end
  else
    if ENActObj.actTypeRef.code = ENPLANWORKSTATE_COUNTERS_WRITEOFF  then
    begin
     reportName := 'AVWCommon2/ActMaterials/ActCounters/writeOffCounters';
    end
  else

      reportName :=  'AVWCommon2/Act21';




  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'PcodeAkt';
  args[0] :=  IntToStr( ENActObj.code);

  argNames[1] := 'actType';
  args[1] :=  IntToStr( actTypeIn );



  if ( ENActObj.dateGen.Year = 2011 ) AND ( ENActObj.dateGen.Month < 9 ) then

      reportName := '2011/' + reportName;

  if ((( ENActObj.dateGen.Year = 2011 ) AND ( ENActObj.dateGen.Month >= 9 )) or
      ( ENActObj.dateGen.Year > 2011 )) then

      reportName := '201109/' + reportName;

  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_MATERIALS_MBP) then
    reportName := 'MH/MH_8';

  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS) then
    reportName := 'MH/MH_5';

    // NET-4383
  if ENActObj.actTypeRef.code = ENPLANWORKSTATE_WRITINGS_OS then
  begin
     // достанем вид и счет по основному што списывается
     TempENPlanWorkENAct2OSData :=  HTTPRIOENPlanWorkENAct2OSData as ENPlanWorkENAct2OSDataControllerSoapPort;

     ENPlanWorkENActosdatafilter := ENPlanWorkENAct2OSDataFilter.Create;
     SetNullIntProps(ENPlanWorkENActosdatafilter);
     SetNullXSProps(ENPlanWorkENActosdatafilter);

     ENPlanWorkENActosdatafilter.actRef := ENActRef.Create;
     ENPlanWorkENActosdatafilter.actRef.code := ENActObj.code;


     ENPlanWorkENAct2OSDataList := TempENPlanWorkENAct2OSData.getScrollableFilteredList(ENPlanWorkENAct2OSDataFilter(ENPlanWorkENActosdatafilter),0,-1);

     if ENPlanWorkENAct2OSDataList.totalCount = 0 then
        raise Exception.Create('Не визначено вид або рахунок ОЗ!!!');
     if ((ENPlanWorkENAct2OSDataList.list[0].kod_vid = '') or
        (ENPlanWorkENAct2OSDataList.list[0].kod_subsch_b = ''))  then
        raise Exception.Create('Не визначено вид або рахунок ОЗ!!!');

     // условие для ОЗ-4 - автотрансопрт  31 vid ili 10 vid na chete 1041s
     if ((ENPlanWorkENAct2OSDataList.list[0].kod_vid = '31') or
        ((ENPlanWorkENAct2OSDataList.list[0].kod_vid = '10') and  (ENPlanWorkENAct2OSDataList.list[0].kod_subsch_b = '1041') ) )  then
      begin
        reportName:='write_off/os/oz-3-auto';
      end
      // условие для формы НА-3 счет 1250
     else if (ENPlanWorkENAct2OSDataList.list[0].kod_subsch_b = '1250') then
      begin
        reportName:='write_off/os/na-3';
      end
     else
      begin
        makeReport('write_off/os/actSpiOpr', argNames, args, 'xls');
        reportName := 'write_off/os/oz-3';
      end;

      actTypeIn := 16;
  end;


  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_MATERIALS_MNMA) then
  begin
    args[1] := IntToStr(planType);
    reportName := 'Protection/writeOffMNMA';
    makeReport(reportName, argNames, args, 'xls');

    // Разделение на спецодежду и остальные
   { if planType = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
      reportName := 'Protection/writeOffMNMAReversSide'
    else
      reportName := 'write_off/writeOffMNMAReversSide';
    makeReport(reportName, argNames, args, 'xls'); }

    // Разделение на спецодежду и остальные
    if planType = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
     begin
      reportName := 'Protection/actSpiOprOpr'
     end
    else
      reportName := 'write_off/actSpiOprOpr';
  end;

  // 28.08.14 NET-4392 Акт дефектации счетчиков
  if ENActObj.actTypeRef.code = ENPLANWORKSTATE_COUNTERS_ACT_DEFECT then
  begin
    SetLength(argNames, 3);
    SetLength(args, 3);

    argNames[0] := 'pActCode';
    args[0] := IntToStr(ENActObj.code);

    argNames[1] := 'pActNumber';
    args[1] := ENActObj.numberGen;

    argNames[2] := 'pActDate';
    args[2] := DateToStr(EncodeDate(ENActObj.dateAct.Year, ENActObj.dateAct.Month, ENActObj.dateAct.Day));

    reportName := 'Counters/ActDefect/ActDefect'
  end;

  if planType =  ENPLANWORKTYPE_ESBYT_ZKO_106 then begin
    SetLength(argNames, 3);
    SetLength(args, 3);

    argNames[0] := 'reportType';
    args[0] := '2';

    argNames[1] := 'actType';
    args[1] := IntToStr(ENActObj.actTypeRef.code);

    argNames[2] := 'PcodeAkt';
    args[2] := IntToStr(ENActObj.code);

    reportName := '201109/ActZKU/Act21';
  end;


  if  (ENActObj.statusRef.code <> ENACT_GOOD) then
        makeReport(reportName, argNames, args, 'xls')
  else Application.MessageBox(PChar('Щоб роздрукувати акт, треба щоб він був "На підписанні"'),
                              PChar('Увага !'),MB_DEFBUTTON2);

  if  (ENActObj.statusRef.code <> ENACT_GOOD)
  and (planType = ENPLANWORKTYPE_ESBYT_ZKO_106) then begin
      SetLength(argNames, 2);
      SetLength(args, 2);
      argNames[0] := 'reportType';
      args[0] := '2';
      argNames[1] := 'codeoz';
      args[1] := IntToStr(ENActObj.code);
      reportName := 'Counters/ZKU/Counters_vvod_expl';
      makeReport(reportName, argNames, args, 'xls');
  end;
  
  // NET-4447... 23.04.2015 +++
  // для услуг по замене счетчиков (переход на многотарифный)
  // печатаем документы на ввод в эксплуатацию
  if ((ENActObj.element.typeRef.code = ENConsts.EN_SERVICES_OBJECT) and (ozToReplaceCounterServices)) then
  begin
    TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;

    scInputItemFilter := SCUsageInputItemFilter.Create;
    SetNullIntProps(scInputItemFilter);
    SetNullXSProps(scInputItemFilter);
    scInputItemFilter.conditionSQL := 'scusageinputitem.code in (select ii.code from scusageinputitem ii ' +
        ' where ii.usageinputrefcode in (select a2s.scusageinputrefcode ' +
        ' from enact2scusageinput a2s where a2s.actrefcode = ' + IntToStr(ENActObj.code) + '))';

    scInputItemList := TempSCUsageInputItem.getScrollableFilteredList(scInputItemFilter, 0, -1);
    if High(scInputItemList.list) = -1 then Exit;

    for i:=0 to High(scInputItemList.list) do
    begin
      scInputItem := TempSCUsageInputItem.getObject(scInputItemList.list[i].code);
      itemCode := scInputItem.code;
      kindCode := scInputItem.kindRef.code;

      OZFilter := SCUsageInputItemOZFilter.Create;
      SetNullIntProps(OZFilter);
      SetNullXSProps(OZFilter);
      OZFilter.usageInputItemRef := SCUsageInputItemRef.Create;
      OZFilter.usageInputItemRef.code := itemCode;

      TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;

      SCUsageInputItemOZList := TempSCUsageInputItemOZ.getScrollableFilteredList(OZFilter, 0, -1);
      if High(SCUsageInputItemOZList.list) = -1 then Exit;

      for z:=0 to High(SCUsageInputItemOZList.list) do
      begin
        SetLength(argNames, 1);
        SetLength(args, 1);

        argNames[0] := 'codeoz';
        args[0] := inttostr(SCUsageInputItemOZList.list[z].code);

        if kindCode = 1 then    // ПРИ ВВОДЕ В ЭКСПЛ ФОРМИРУЕМ ОЗ -1 РЕЕСТР И АКТ
        begin
          reportName := 'Counters/VVOD_EXPL/Counters_vvod_expl';
          makeReport(reportName , argNames , args , 'xls');   // формируем ОЗ-1

          reportName := 'Counters/VVOD_EXPL/Counters_vvod_expl_reestr';
          makeReport(reportName , argNames , args , 'xls');   // формируем реестр к ОЗ-1
        end;

        if kindCode = 2 then    // ПРИ ВЫВОДЕ ИЗ ЭКСПЛ ФОРМИРУЕМ ОЗ -1 по выводу
        begin
          reportName := 'Counters/VIVOD_EXPL/Counters_vivod_expl';
          makeReport(reportName , argNames , args , 'xls');   // формируем ОЗ-1
        end;

        if kindCode = 3 then    // при приеме от абонентов формируем факт безоп
        begin
          reportName := 'Counters/actCounterFull';
          makeReport(reportName , argNames , args , 'xls');   // Акт безоплатньої передачі лічильників №

          reportName := 'Counters/deliveryOrder';
          makeReport(reportName , argNames , args , 'xls');   // " ПРИХОДНЫЙ ОРДЕР
        end;
      end;
    end;
  end;

  // SUPP-13237 Для актов списания МШП печатается акт выбытия
  if(ENActObj.actTypeRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) then
  begin
          SetLength(argNames, 1);
          SetLength(args, 1);
          argNames[0] := 'PcodeAkt';
          args[0] :=  IntToStr( ENActObj.code) ;
          reportName := 'MH/MH_4';
          if  (ENActObj.statusRef.code <> ENACT_GOOD) then
            makeReport(reportName, argNames, args, 'xls');
  end;

  {23.11.2011 для акта на виготовлення распечатаем прибутковий ордер
    (для актов от 21.11.2011, т.к. должно было работать от этого числа)}
  if ((ENActObj.actTypeRef.code = ENPLANWORKSTATE_PRODUCTION) or (ENActObj.actTypeRef.code = ENPLANWORKSTATE_TMC_TRANSFER))
      and
      (
        (
          (ENActObj.dateGen.Day >= 21) and (ENActObj.dateGen.Month >= 11) and (ENActObj.dateGen.Year >= 2011)
        )
      or
        (
          (ENActObj.dateGen.Day >= 1) and (ENActObj.dateGen.Month >= 12) and (ENActObj.dateGen.Year >= 2011)
        )
      or
        (
          ENActObj.dateGen.Year >= 2012
        )
      ) then
  begin
          act2fkOrderFilter := ENAct2RQFKOrderFilter.Create;
          SetNullXSProps(act2fkOrderFilter);
          SetNullIntProps(act2fkOrderFilter);
          act2fkOrderFilter.typeRef := ENAct2RQFKOrderTypeRef.Create;
          act2fkOrderFilter.typeRef.code := ENACT2RQFKORDER_TYPE_PRODUCTION;
          act2fkOrderFilter.actRef := ENActRef.Create;
          act2fkOrderFilter.actRef.code := ENActObj.code;
          act2fkOrderList := TempENAct2RQFKOrder.getScrollableFilteredList(act2fkOrderFilter, 0, -1);

          if(act2fkOrderList.totalCount = 0) then
          begin
            SetLength(argNames, 1);
            SetLength(args, 1);
            argNames[0] := 'PcodeAkt';
            args[0] :=  IntToStr( ENActObj.code);
            if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_TMC_TRANSFER) then
            reportName := '201109/AReceptTransmisMaterials/PrihodProduced'
            else
            reportName := '201109/AVWCommon2/ActPreproduction/PrihodProduced';
            if  (ENActObj.statusRef.code <> ENACT_GOOD) then
             makeReport(reportName, argNames, args, 'xls');
          end else begin
            fkOrderForm := TfrmRQFKOrderEdit.Create(Application, dsView);
            if  (ENActObj.statusRef.code <> ENACT_GOOD) then begin
              for i := 0 to act2fkOrderList.totalCount - 1 do begin
                fkOrderForm.printOrder(act2fkOrderList.list[i].fkOrderRefCode);
              end;
            end;
          end;

  end;

  {17.08.2012 - Печатание приходного ордера по доработке}
  if ((ENActObj.actTypeRef.code = ENPLANWORKSTATE_REFINEMENT) and
      (ENActObj.element.typeRef.code <> EN_METROLOGY_OBJECT)) then
  begin
    SetLength(argNames, 1);
    SetLength(args, 1);
    argNames[0] := 'PcodeAkt';
    args[0] :=  IntToStr( ENActObj.code);
    reportName := '201109/AVWCommon2/PrihodRefinement';
    if  (ENActObj.statusRef.code <> ENACT_GOOD) then
      makeReport(reportName, argNames, args, 'xls');

    ///////////////////////////////////////////////
    // 29.10.12 NET-3480 Печать приходного ордера с демонтированными при доработке материалами
    // (если они есть в акте)
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateitemControllerSoapPort;

    estimateFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(estimateFilter);
    SetNullXSProps(estimateFilter);

    estimateFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateFilter.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;
    estimateFilter.conditionSQL :=
      ' ENESTIMATEITEM.CODE in (select e.code from enestimateitem e, ' +
      '     enplanwork p, enact2enplanwork a2p ' +
      '   where e.planrefcode = p.code ' +
      '   and p.code = a2p.plancode ' +
      '   and a2p.actrefcode = ' + IntToStr(ENActObj.code) +
      '   and e.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT) +
      '   and e.accountingtyperefcode in (' + IntToStr(TK_ACCOUNTINGTYPE_TMC) + ', '
                                           +  IntToStr(TK_ACCOUNTINGTYPE_COUNTER) + ')' +
      '   and e.countfact <> 0)' ;

    // ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateFilter, 0, -1);
    estimateArr := TempENEstimateItem.getFilteredCodeArray(estimateFilter, 0, -1);

    // if ENEstimateItemList.totalCount > 0 then
    if High(estimateArr) > -1 then
    begin
      {
      SetLength(argNames, 1);
      SetLength(args, 1);
      argNames[0] := 'PcodeAkt';
      args[0] :=  IntToStr( ENActObj.code);
      }
      reportName := 'Act/PrihodDemontage';
      if  (ENActObj.statusRef.code <> ENACT_GOOD) then
        makeReport(reportName, argNames, args, 'xls');
    end;
    ///////////////////////////////////////////////
  end;

  //NET-3141. Приходный ордер по демонтажу
  if ENActObj.actTypeRef.code in [
    ENPLANWORKSTATE_CAPITALREPAIR,    //Капітальний ремонт
    ENPLANWORKSTATE_RECONSTRUCTION,   //Реконструкція і модернізація
    ENPLANWORKSTATE_TECHNICALSERVICE, //Технічне обслуговування
    ENPLANWORKSTATE_CURRENTREPAIR,    //Поточний ремонт
    ENPLANWORKSTATE_MEDIUMREPAIR,     //Середній ремонт
    ENPLANWORKSTATE_MATERIALS_MNMA,   //Списання малоценки  МНМА
    ENPLANWORKSTATE_MATERIALS_MBP,    //Списання малоценки МБП)
    ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS, // Списання МБП (інструменти)
    ENPLANWORKSTATE_DISMANTLING,     //Демонтаж
    ENPLANWORKSTATE_RECEPT_TRANSMISSION, // прием передача материалов
    ENPLANWORKSTATE_COUNTERS_WRITEOFF , // NET-1026 Списание счетчиков
    ENPLANWORKSTATE_WRITINGS_OS,         // списание ОС        NET-4383
    ENPLANWORKSTATE_MATERIALS_TMC        // списание материалов NET-4398
    ]

  then begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateitemControllerSoapPort;

    estimateFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(estimateFilter);
    SetNullXSProps(estimateFilter);

    estimateFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateFilter.kindRef.code := ENESTIMATEITEMKIND_DISMOUNT;
    estimateFilter.conditionSQL :=
      ' ENESTIMATEITEM.CODE in (select e.code from enestimateitem e, ' +
      '     enplanwork p, enact2enplanwork a2p ' +
      '   where e.planrefcode = p.code ' +
      '   and p.code = a2p.plancode ' +
      '   and a2p.actrefcode = ' + IntToStr(ENActObj.code) +
      '   and e.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT) +
      '   and e.accountingtyperefcode in (' + IntToStr(TK_ACCOUNTINGTYPE_TMC) + ', '
                                           +  IntToStr(TK_ACCOUNTINGTYPE_COUNTER) + ')' +
      '   and e.countfact <> 0)' ;

    // ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateFilter, 0, -1);
    estimateArr := TempENEstimateItem.getFilteredCodeArray(estimateFilter, 0, -1);

    // if ENEstimateItemList.totalCount > 0 then
    if High(estimateArr) > -1 then
    begin
      SetLength(argNames, 1);
      SetLength(args, 1);
      argNames[0] := 'PcodeAkt';
      args[0] :=  IntToStr( ENActObj.code);
      reportName := 'Act/PrihodDemontage';
      if  (ENActObj.statusRef.code <> ENACT_GOOD) then begin
        makeReport(reportName, argNames, args, 'xls');

        // NET-1026 Для списания счетчиков вызывается еще один репорт с теми же
        // параметрами
        if ENActObj.actTypeRef.code = ENPLANWORKSTATE_COUNTERS_WRITEOFF then begin
                   reportName := '201109/AVWCommon2/ActMaterials/ActCounters/actSpiOprOpr';
                   makeReport(reportName, argNames, args, 'xls');
        end;
      end;
    end;
  end;

  // NET-4398 Для актов по списанию где списываются трансформаторы и переводятся
  // во втор сырье печатается форма акта по переводу трансформатора во втор. сырье
  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_MATERIALS_TMC) and
  (DMReports.checkTransformatorsForRawInAct(ENActObj.code))
     then begin
      SetLength(argNames, 1);
      SetLength(args, 1);
      argNames[0] := 'actCode';
      args[0] := IntToStr(ENActObj.code);

      reportName := '201109/AVWCommon2/ActMaterials/ActVtorSyr/ActVtorSyr';
      if  (ENActObj.statusRef.code <> ENACT_GOOD) then
        makeReport(reportName, argNames, args, 'xls');
  end;

  // NET-4543 Форма акта по переводу материалов во втор. сырье
  if (ENActObj.actTypeRef.code = ENPLANWORKSTATE_MATERIALS_TMC) and
     (ENActObj.element.code = ENELEMENTCODE_RECYCLABLE_MATERIALS) then
  begin
    SetLength(argNames, 1);
    SetLength(args, 1);
    argNames[0] := 'actCode';
    args[0] := IntToStr(ENActObj.code);

    reportName := '201109/AVWCommon2/ActMaterials/ActVtorSyrGeneral/ActVtorSyrGeneral';
    if (ENActObj.statusRef.code <> ENACT_GOOD) then
      makeReport(reportName, argNames, args, 'xls');
  end;

end;

procedure TfrmENActEdit.btnPrintActRelationsClick(Sender: TObject);
var
  itemList: TStringList;
  TempENAct: ENActControllerSoapPort;
  actsList : ENActShortList;
  plansList : ENPlanWorkShortList;
  i : Integer;
  fileName , str_ : string;
begin
  inherited;
 checkIfActIsReversed;
 TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

 actsList :=  TempENAct.getActs4Recalc(ENActObj.code);
 plansList := TempENAct.getRelatedWorkOrders(ENActObj.code);

  itemList := TStringList.Create;
  try
    str_ := #13#10 + 'Акти, які залежать від акту № ' + ENActObj.numberGen + ', ' + XSDate2String(ENActObj.dateGen) + ' :' + #13#10;
    itemList.Add(str_);
    for i:=0 to High(actsList.list) do
    begin
      Application.ProcessMessages;
      if (actsList.list[i].code <> ENActObj.code) then
      begin
        str_ := '(ун. код ' + IntToStr(actsList.list[i].code) + '),  № ' + actsList.list[i].numberGen + ' від ' + XSDate2String(actsList.list[i].dateGen) + ', статус : ' + actsList.list[i].statusRefName ;
        itemList.Add(str_);
      end;
    end;

    if (High(plansList.list) >= 0) then
    begin
      str_ := #13#10 + 'Наряди (не включені до актів), які залежать від акту № ' + ENActObj.numberGen + ', ' + XSDate2String(ENActObj.dateGen) + ' :' + #13#10;
      itemList.Add(str_);
      for i:=0 to High(plansList.list) do
      begin
        Application.ProcessMessages;
        //if (actsList.list[i].code <> ENActObj.code) then
        begin
          str_ := '№ нар. завд. ' + plansList.list[i].workOrderNumber + ' від ' + XSDate2String(plansList.list[i].dateStart) ;
          itemList.Add(str_);
        end;
      end;
    end;

    fileName := ExtractFilePath(Application.ExeName) + TempReportsPath + getFileName('actsRelations') + '.txt';

    itemList.SaveToFile(fileName);

    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    itemList.Free;
  end;

end;

procedure TfrmENActEdit.btnUndoSignatureClick(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
begin
  inherited;

  if Application.MessageBox(PChar('Розрахунки ЗП можуть змінитися ... Повернути Акт у статус Черновий ??! '),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = IDOK then
  begin
    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
    TempENAct.unSignatured(ENActObj.code);
    Application.MessageBox(PChar('Статус изменен ..!'),PChar('Внимание !'),MB_ICONINFORMATION);
  end;
  ModalResult := mrYes;

end;

procedure TfrmENActEdit.btnRelatedTabNumberClick(Sender: TObject);
var
  itemList: TStringList;
  TempENAct: ENActControllerSoapPort;
  list_ : ENPlan2HumenShortList;

  i : Integer;
  tn, fileName , str_ : string;
begin
  inherited;

  checkIfActIsReversed;

  if edtTabNumber.Text = '' then  Exit;

  tn := edtTabNumber.Text;

 TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

 list_ :=  TempENAct.getRelatedWorkOrdersByTabNumber(ENActObj.code, tn);


  itemList := TStringList.Create;
  try
    if (High(list_.list) >= 0) then
    begin
      str_ := #13#10 + 'Наряди , які залежать від акту № ' + ENActObj.numberGen + ', ' + XSDate2String(ENActObj.dateGen) + ' :' + #13#10;
      itemList.Add(str_);
      for i:=0 to High(list_.list) do
      begin
        Application.ProcessMessages;
        if (list_.list[i].code <> ENActObj.code) then
        begin
          str_ := '№ нар. завд. ' + list_.list[i].planRefWorkOrderNumber + ' від ' + XSDate2String(list_.list[i].planRefDateStart) + ', час у наряді '+ list_.list[i].timeWorkFact.DecimalString +
          ', № акту '+ list_.list[i].actRefNumberGen +', статус акту ' + list_.list[i].actRefStatusName ;
          itemList.Add(str_);
        end;
      end;
    end
    else
    begin
      str_ := #13#10 + ' Табельний номер вже не знайдено у Акті ....';
      itemList.Add(str_);
    end;
    
    fileName := ExtractFilePath(Application.ExeName) + TempReportsPath + getFileName('tabNumberRelations') + '.txt';

    itemList.SaveToFile(fileName);

    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    itemList.Free;
  end;
end;


procedure TfrmENActEdit.btnSavePostingFinInfoClick(Sender: TObject);
var
  TempENAct2FinInfoProv: ENAct2FinInfoProvControllerSoapPort;
begin
    if ( (ENActObj.statusRef.code <> ENConsts.ENACT_CLOSED ) and (DialogState <> dsInsert) ) then
  // Вставка связки со справочными данными из Фин. Кол.
      begin
         if (ENAct2FinInfoProvObj = nil) then
         begin
           ENAct2FinInfoProvObj := ENAct2FinInfoProv.Create;
           ENAct2FinInfoProvObj.code := LOW_INT;
         end;

         if (ENAct2FinInfoProvObj.actRef = nil) then ENAct2FinInfoProvObj.actRef := ENActRef.Create;
             ENAct2FinInfoProvObj.actRef.code := ENActObj.code;

         TempENAct2FinInfoProv := HTTPRIOENAct2FinInfoProv as ENAct2FinInfoProvControllerSoapPort;
          // на сервере проверим если объект меняется то проверка на права должна сработать
          //!!!!!! . менять єти параметры можно бухгалтерам
          if ENAct2FinInfoProvObj.code <> Low_INT then
         begin
            TempENAct2FinInfoProv.save(ENAct2FinInfoProvObj)
         end else
         begin
            TempENAct2FinInfoProv.add(ENAct2FinInfoProvObj)
         end;
      end;

end;

procedure TfrmENActEdit.btnSavePostingInfoClick(Sender: TObject);
var
 tempEnAct2Prov : ENAct2ProvControllersoapport;
 act2prList : ENAct2ProvShortList;
 act2prFil : enact2provfilter;
 ENAct2ProvObj: ENAct2Prov;
begin
  inherited;
     tempEnAct2Prov := HTTPRIOENAct2Prov as ENAct2ProvControllersoapport;

     act2prFil := ENAct2ProvFilter.Create;
     SetNullIntProps(act2prFil);
     SetNullXSProps(act2prFil);
     act2prFil.actRef:= ENActRef.Create;
     act2prFil.actRef.code := ENActObj.code;


    act2prList := tempEnAct2Prov.getScrollableFilteredList(act2prFil,0,-1);

    if ENActObj.statusRef.code = ENConsts.ENACT_CLOSED then
        begin
          Application.MessageBox(PChar('Аст вже проведений!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
          Exit;
        end;


    ENAct2ProvObj:=ENAct2Prov.Create;
    ENAct2ProvObj.isIncomeAct := Integer(chkIsIncomeAct.Checked);
    ENAct2ProvObj.actRef := ENActRef.Create;
    ENAct2ProvObj.actRef.code := ENActObj.code;
    ENAct2ProvObj.actPostingKindRef := ENActPostingKindRef.Create;
    ENAct2ProvObj.actPostingKindRef.code := enact2postingKindcode;
    tempEnAct2Prov.savePostingInfo(ENAct2ProvObj);



end;

procedure TfrmENActEdit.btnChangeDateMoveClick(Sender: TObject);
var
  TempENAct : ENActControllerSoapPort;
begin
  if ENActObj = nil then Exit;
  if ENActObj.code = LOW_INT then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити дату проведення акту?'),
          PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
  Exit;

  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  if (not NoBlankValues([edtDateGen])) then
  begin
    Application.MessageBox(PChar('Вкажіть дату!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Exit;
  end else
  begin
    ENActObj.dateGen := TXSDate.Create;
    ENActObj.dateGen.XSToNative(GetXSDate(edtDateGen.DateTime));
    TempENAct.changeDateMove(ENActObj);
  end;

  FormShow(sender);
end;

procedure TfrmENActEdit.updateProduced;
var
finFilter : FINMaterialsFilter;
finList : FINMaterialsShortList;
TempFINMaterials : FINMaterialsControllerSoapPort;
molCodes : TStringList;
molCodes_str : String;
i : Integer;
TempRQStorage2ENMol : RQStorage2ENMolControllerSoapPort;
storage2molList : RQStorage2ENMolShortList;
storage2molFilter : RQStorage2ENMolFilter;

begin
    TempRQStorage2ENMol := HTTPRIORQStorage2ENMol as RQStorage2ENMolControllerSoapPort;
    sgProducedMaterials.Clear;
    SetGridHeaders(FINMaterialsShortHeaders, sgProducedMaterials.ColumnHeaders);

    finFilter := FINMaterialsFilter.Create;
    SetNullIntProps(finFilter);
    SetNullXSProps(finFilter);

    finFilter.statusRef := FINMaterialsStatusRef.Create;
    finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

    finFilter.conditionSQL := 'finmaterials.estimateitemrefcode in ' +
      '(select enestimateitem.code from enestimateitem where enestimateitem.planrefcode in (' + DMReports.getPlanCodesByActCode(ENActObj.code) + '))' +
      ' and ENESTIMATEITEM.KINDREFCODE = ' + IntToStr(ENConsts.ENESTIMATEITEMKIND_PRODUCED);
    //    '(select enact2enplanwork.plancode from enact2enplanwork where enact2enplanwork.actrefcode = ' + IntToStr(ENActObj.code) + '))';

    finFilter.orderBySQL := ' FINMATERIALS.NN, FINMATERIALS.BAL_SCH, case when ENESTIMATEITEM.KINDREFCODE = 2 then FINMATERIALS.MAT_NAME||''(ПММ)'' else FINMATERIALS.MAT_NAME end, FINMATERIALS.MU_NAME, FINMATERIALS.PRICE';

    TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

    finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

    molCodes := TStringList.Create;

    if High(finList.list) > -1 then
       sgProducedMaterials.RowCount:=High(finList.list)+2
    else
       sgProducedMaterials.RowCount:=2;

     with sgProducedMaterials do
      for i:=0 to High(finList.list) do
        begin
          Application.ProcessMessages;
          if finList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(finList.list[i].code)
          else
          Cells[0,i+1] := '';

          Cells[1,i+1] := finList.list[i].mat_name;
          //Cells[2,i+1] := finList.list[i].mu_name;
          //Cells[3,i+1] := finList.list[i].nn;
          Cells[2,i+1] := finList.list[i].nn;
          Cells[3,i+1] := finList.list[i].mu_name;

          if finList.list[i].quantity = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := finList.list[i].quantity.DecimalString;

          if finList.list[i].calc_price = nil then
            Cells[5,i+1] := ''
          else
            Cells[5,i+1] := finList.list[i].calc_price.DecimalString;

          if finList.list[i].cost = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := finList.list[i].cost.DecimalString;

          if(molCodes.IndexOf(finList.list[i].div_code) = -1) then
            molCodes.Add(finList.list[i].div_code);

          Cells[7,i+1] := finList.list[i].rest_purpose_name;

          AddCheckBox(1,i+1, false, false);

          sgProducedMaterials.RowCount:= i + 2;
        end;
     //ColCount:=ColCount+1;
     sgProducedMaterials.Row:=1;

     molCodes_str := '';
     for i := 0 to molCodes.Count - 1 do begin
          if Length(molCodes_str) > 0 then
            molCodes_str := molCodes_str + ', ''' + molCodes[i] + ''''
          else
            molCodes_str := '''' + molCodes[i] + '''';
     end;

     storage2molFilter := RQStorage2ENMolFilter.Create;
    SetNullXSProps(storage2molFilter);
    SetNullIntProps(storage2molFilter);
    storage2molFilter.conditionSQL := 'EXISTS (select 1 from enmol m where m.fincode in (' + molCodes_str + ') and m.code = RQSTORAGE2ENMOL.MOLREFCODE)';
    storage2molList := TempRQStorage2ENMol.getScrollableFilteredList(storage2molFilter, 0, -1);

    if actSetZone.Enabled then actSetZone.Enabled := (storage2molList.totalCount > 0);
end;

procedure fillGridWithPostingsFromList(grid : TAdvStringGrid; provList : FKProvObjectShortList);
var i : Integer;
 obj : FKProvObjectShort;
begin
   grid.Clear;
   SetGridHeaders(FKBadProvHeaders, grid.ColumnHeaders);

   if High(provList.list) > -1 then
    grid.RowCount := High(provList.list) + 2
   else
    grid.RowCount := 2;

    i := 0;

  with grid do
    for obj in provList.list do begin
       i := i + 1;
       if obj.id <> Low(Integer) then
        Cells[0,i] := IntToStr(obj.id)
      else
        Cells[0,i] := '';
      if obj.dt_prov = nil then
        Cells[1,i] := ''
      else
        Cells[1,i] := XSDate2String(obj.dt_prov);
      Cells[2,i] := obj.bal_ceh;
      Cells[3,i] := obj.bal_sch;
      Cells[4,i] := obj.bal_sub_sch;
      Cells[5,i] := obj.bal_kau;
      Cells[6,i] := obj.kor_ceh;
      Cells[7,i] := obj.kor_sch;
      Cells[8,i] := obj.kor_sub_sch;
      Cells[9,i] := obj.kor_kau;
      if obj.summa = nil then
        Cells[10,i] := ''
      else
        Cells[10,i] := obj.summa.DecimalString;
      Cells[11,i] := obj.primechan;
    end;

end;

function TfrmENActEdit.getDFDocSignersForSaving(
  var dfDocSigners: ArrayOfDFDocSigner): Boolean;
begin
  Result := DMReports.getDFDocSignersForSaving(ENActObj, Self, sgDFDocSigners, dfDocSigners);
end;

procedure TfrmENActEdit.getPostingsList(enActObjectCode: Integer);
var i: Integer;
    TempENActController: ENActControllerSoapPort;
    otherProvList, materialProvList : FKProvObjectShortList;
    isMaterials : TXSBoolean;
begin
  if enActObjectCode = LOW_INT then Exit;

  TempENActController := HTTPRIOENact as ENActControllerSoapPort;

  isMaterials := TXSBoolean.Create;
  isMaterials.asBoolean := False;

  otherProvList := TempENActController.getPostingsList(enActObjectCode, isMaterials);
  isMaterials.asBoolean := True;
  materialProvList := TempENActController.getPostingsList(enActObjectCode, isMaterials);

  fillGridWithPostingsFromList(sgOtherProvs, otherProvList);
  fillGridWithPostingsFromList(sgMaterialProvs, materialProvList);

end;

procedure TfrmENActEdit.initDFDocSignersGrid(setDefaultSigners: Boolean);
begin
  DMReports.initDFDocSignersGrid(ENActObj, Self, sgDFDocSigners, setDefaultSigners);
end;

procedure TfrmENActEdit.initDFDocsTab;
begin
  tsDFDoc.TabVisible := false;
  DisableActions([actClearDFDocSigners, actSaveDFDocSigners], DialogState = dsView);

  if ENActObj = nil then Exit;

  if DMReports.isSignable(ENActObj) then
  begin
    tsDFDoc.TabVisible := true;
    DMReports.setComponentPropsForDFDocsTab(Self, sgDFDocs, sgDFDocSigners);

    // При добавлении акта не будем отображать
    if (DialogState = dsInsert) then
      //initDFDocSignersGrid;
      tsDFDoc.TabVisible := false;

    if (DialogState = dsEdit) or (DialogState = dsView) then
      loadDFDocSigners;
  end;
end;

procedure TfrmENActEdit.loadDFDocSigners;
begin
  DMReports.loadDFDocSigners(ENActObj, Self, sgDFDocSigners);
end;

procedure TfrmENActEdit.actViewDFDocExecute(Sender: TObject);
begin
  ShowDocumentManagement.openDFDocForViewFromGrid(ENActObj, Self, sgDFDocs);
end;

procedure TfrmENActEdit.actViewEnact2FinInfo(actCode: Integer);
var
  TempENAct2FinInfoProv: ENAct2FinInfoProvControllerSoapPort;
  TempENAct2FinInfoFil: ENAct2FinInfoProvFilter;
  ENAct2FinInfoProvList : ENAct2FinInfoProvShortList;

begin
  if actCode = LOW_INT  then Exit;

  TempENAct2FinInfoProv := HTTPRIOENAct2FinInfoProv as ENAct2FinInfoProvControllerSoapPort;

  TempENAct2FinInfoFil := ENAct2FinInfoProvFilter.Create;
  SetNullIntProps(TempENAct2FinInfoFil);
  SetNullXSProps(TempENAct2FinInfoFil);

  TempENAct2FinInfoFil.actRef := ENActRef.Create;
  TempENAct2FinInfoFil.actRef.code := actCode;

  ENAct2FinInfoProvList := TempENAct2FinInfoProv.getScrollableFilteredList(TempENAct2FinInfoFil,0,-1);
  if High(ENAct2FinInfoProvList.list) > -1 then
  begin
     try
      ENAct2FinInfoProvObj := TempENAct2FinInfoProv.getObject(ENAct2FinInfoProvList.list[0].code);
    except
      on EConvertError do Exit;
    end;

    edtKau1476.Text:= ENAct2FinInfoProvObj.kau_card_object_kod;
    edtKauName1476.Text:= ENAct2FinInfoProvObj.kau_card_object_name;

    edtKau1783.Text:= ENAct2FinInfoProvObj.kau_element_expenses_kod;
    edtKauName1783.Text:= ENAct2FinInfoProvObj.kau_element_expenses_name;

  end;


end;

end.
