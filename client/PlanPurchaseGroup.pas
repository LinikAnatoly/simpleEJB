unit PlanPurchaseGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs ,ChildFormUnit  ,  StdCtrls, ExtCtrls, InvokeRegistry,
  Grids, AdvObj, BaseGrid, AdvGrid, Rio, SOAPHTTPClient, Menus, ActnList , GridHeadersUnit,
  TB2Item, TB2Dock, TB2Toolbar, ImgList , DateUtils ,XSBuiltIns ;

type
  TfrmPlanPurchaseGroup = class(TChildForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    HTTPRIORQPlanPurchase: THTTPRIO;
    ActionListAll: TActionList;
    actUpdatePlanPurchaseAndCnangeForPurchase: TAction;
    PopupMenuAll: TPopupMenu;
    N6: TMenuItem;
    Panel4: TPanel;
    panelPlanPurchaseList: TPanel;
    Label1: TLabel;
    sgRQPlanPurchase: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel5: TPanel;
    tbActions: TTBToolbar;
    tbiUpdatePurchaseItemTender: TTBItem;
    Label3: TLabel;
    sgRQPurchaseItemTender: TAdvStringGrid;
    PopupMenuItemTender: TPopupMenu;
    ActionListItemTender: TActionList;
    actUpdatePurchaseItemTender: TAction;
    miUpdatePurchaseItemTender: TMenuItem;
    HTTPRIORQPurchaseItemTender: THTTPRIO;
    Splitter2: TSplitter;
    actFilterPurchaseItemTender: TAction;
    tbiFilterPurchaseItemTender: TTBItem;
    tbiWithoutFilterPurchaseItemTender: TTBItem;
    actWithoutFilterPurchaseItemTender: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    TBToolbar1: TTBToolbar;
    tbiUpdatePurchaseItem: TTBItem;
    sgRQPurchaseItem: TAdvStringGrid;
    ActionPurchaseItem: TActionList;
    actPurchaseItemView: TAction;
    actPurchaseItemInsert: TAction;
    actPurchaseItemDelete: TAction;
    actPurchaseItemEdit: TAction;
    actUpdatePurchaseItem: TAction;
    actPurchaseItemFilter: TAction;
    actPurchaseItemNoFilter: TAction;
    actPurchaseItemChangePlanType: TAction;
    actPurchaseItemExportExcel: TAction;
    PopupMenuPurchaseItem: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MenuItem3: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    miLine1: TMenuItem;
    miChangePlanPurchaseItemType: TMenuItem;
    miLine2: TMenuItem;
    miExportExcel: TMenuItem;
    Splitter3: TSplitter;
    HTTPRIORQPurchaseItem: THTTPRIO;
    Panel8: TPanel;
    Splitter4: TSplitter;
    Panel9: TPanel;
    Splitter5: TSplitter;
    Panel10: TPanel;
    TBToolbar2: TTBToolbar;
    TBItem1: TTBItem;
    Label5: TLabel;
    ImageList1: TImageList;
    sgRQPurchaseItemWithoutContract: TAdvStringGrid;
    ActionPurchaseItemWithoutContract: TActionList;
    PopupMenuPurchaseItemWithoutContract: TPopupMenu;
    actUpdatePurchaseItemWithoutContract: TAction;
    Label6: TLabel;
    ActionPurchaseItem2EIWithoutContract: TActionList;
    actEstimateWithoutContractUpdate: TAction;
    PopupMenuPurchaseItem2EIWithoutContract: TPopupMenu;
    HTTPRIORQPurchaseItem2EstimateItem: THTTPRIO;
    actPurchaseItemWithoutContractView: TAction;
    actPlanPurchaseSelectAll: TAction;
    actPlanPurchaseUnSelectAll: TAction;
    miPlanPurchaseSelectAll: TMenuItem;
    miPlanPurchaseUnSelectAll: TMenuItem;
    actPurchaseItemTenderCheckAll: TAction;
    actPurchaseItemTenderUnCheckAll: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Panel11: TPanel;
    Label7: TLabel;
    TBToolbar4: TTBToolbar;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    sgENContract: TAdvStringGrid;
    ActionEnContract: TActionList;
    actEnContractView: TAction;
    actEnContractInsert: TAction;
    actEnContractDelete: TAction;
    actEnContractEdit: TAction;
    actEnContractUpdate: TAction;
    actEnContractFilter: TAction;
    actEnContractNoFilter: TAction;
    PopupMenuEnContract: TPopupMenu;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    HTTPRIOENContract: THTTPRIO;
    Panel12: TPanel;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Panel13: TPanel;
    Label8: TLabel;
    TBToolbar5: TTBToolbar;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    sgENContractItem: TAdvStringGrid;
    HTTPRIOENContractItem: THTTPRIO;
    ActionEncontractItem: TActionList;
    actEncontractItemView: TAction;
    actEncontractItemInsert: TAction;
    actEncontractItemDelete: TAction;
    actEncontractItemEdit: TAction;
    actEncontractItemUpdate: TAction;
    actEncontractItemFilter: TAction;
    actEncontractItemNoFilter: TAction;
    PopupMenuEncontractItem: TPopupMenu;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    Label9: TLabel;
    TBToolbar6: TTBToolbar;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    sgENEstimateItemInContract: TAdvStringGrid;
    ActionListEstimate2ContractItem: TActionList;
    PopupMenuEstimate2ContractItem: TPopupMenu;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    actEstimate2ContractItemUpdate: TAction;
    HTTPRIOENEstimateItem: THTTPRIO;
    chkAutoUpdateEstimate2ContractItem: TCheckBox;
    actEstimateWithoutContractCheckAll: TAction;
    actEstimateWithoutContractUnCheckAll: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    actEnContractAddProjectAgreement: TAction;
    N14: TMenuItem;
    miEnContractAddProjectAgreement: TMenuItem;
    actEstimateWithoutContractAdd2Specification: TAction;
    N15: TMenuItem;
    miEstimateWithoutContractUnAdd2Specification: TMenuItem;
    actEstimate2ProjectAgreeUnlink: TAction;
    N16: TMenuItem;
    miEstimate2ProjectAgreeRemoveFromSpecification: TMenuItem;
    actEstimateWithoutContractLink2Contract: TAction;
    miEstimateWithoutContractLink2Contract: TMenuItem;
    edtInfoForEstimateWithoutContract: TEdit;
    actEstimateWithContractUnLink2Contract: TAction;
    miEstimateWithContractUnLink2Contract: TMenuItem;
    N17: TMenuItem;
    TBItem16: TTBItem;
    Panel14_InfoEnEstimateItem2Contract: TPanel;
    lblMaterialInContractTotal: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Shape1: TShape;
    Panel14InfoEnContract: TPanel;
    Label12: TLabel;
    Shape2: TShape;
    HTTPRIODFDocAgreement: THTTPRIO;
    actEstimateWithoutContractFilter: TAction;
    actEstimateWithoutContractNoFilter: TAction;
    HTTPRIODFDoc: THTTPRIO;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    actEstimate2ContractFilter: TAction;
    actEstimate2ContractNoFilter: TAction;
    TBControlItem1: TTBControlItem;
    chkAutoFindContractWithFreeCount: TCheckBox;
    actEncontractItemFilterByMaterial: TAction;
    TBToolbar7: TTBToolbar;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem19: TTBItem;
    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod: TAdvStringGrid;
    Panel14: TPanel;
    Splitter8: TSplitter;
    TBToolbar3: TTBToolbar;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    sgENEstimateItem: TAdvStringGrid;
    Label13: TLabel;
    ActionPurchaseItem2EIWithoutContractGroup: TActionList;
    actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_update: TAction;
    PopupMenuPurchaseItem2EIWithoutContractGroup: TPopupMenu;
    MenuItem25: TMenuItem;
    N21: TMenuItem;
    miEstimateWithoutContractGroupAdd2Specification: TMenuItem;
    actEstimateWithoutContractGroupAdd2Specification: TAction;
    pnlMaterialInContractGroup: TPanel;
    splmaterialInContractGroup: TSplitter;
    PopupMenuEstimate2ContractItemGroup: TPopupMenu;
    MenuItem30: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    lblEstimate2ContractItemGroup: TLabel;
    ActionListEstimate2ContractItemGroup: TActionList;
    actEstimate2ContractItemGroupUpdate: TAction;
    sgGroupedEstimate2Contract: TAdvStringGrid;
    TBToolbar8: TTBToolbar;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    actEstimate2ProjectAgreeGroupUnlink: TAction;
    actEstimateWithoutContractGroupLink2Contract: TAction;
    miEstimateWithoutContractGroupLink2Contract: TMenuItem;
    actEstimate2ContractGroupUnlink: TAction;
    actEstimateWithoutContractGroupCheckAll: TAction;
    miEstimateWithoutContractGroupCheckAll: TMenuItem;
    actEstimateWithoutContractGroupUnCheckAll: TAction;
    miEstimateWithoutContractGroupUnCheckAll: TMenuItem;
    procedure Label2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure actUpdatePlanPurchaseAndCnangeForPurchaseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtYearGenChange(Sender: TObject);
    procedure actUpdatePurchaseItemTenderExecute(Sender: TObject);
    procedure actFilterPurchaseItemTenderExecute(Sender: TObject);
    procedure actWithoutFilterPurchaseItemTenderExecute(Sender: TObject);
    procedure actPurchaseItemViewExecute(Sender: TObject);
    procedure actUpdatePurchaseItemExecute(Sender: TObject);
    procedure actPurchaseItemChangePlanTypeExecute(Sender: TObject);
    procedure actUpdatePurchaseItemWithoutContractExecute(
      Sender: TObject);
    procedure actEstimateWithoutContractUpdateExecute(Sender: TObject);
    procedure sgRQPurchaseItemWithoutContractClick(Sender: TObject);
    procedure sgRQPurchaseItemWithoutContractMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sgRQPurchaseItemWithoutContractDblClick(Sender: TObject);
    procedure actPurchaseItemWithoutContractViewExecute(Sender: TObject);
    procedure actPlanPurchaseSelectAllExecute(Sender: TObject);
    procedure actPlanPurchaseUnSelectAllExecute(Sender: TObject);
    procedure actPurchaseItemTenderCheckAllExecute(Sender: TObject);
    procedure actPurchaseItemTenderUnCheckAllExecute(Sender: TObject);
    procedure actEnContractUpdateExecute(Sender: TObject);
    procedure sgENContractTopLeftChanged(Sender: TObject);
    procedure actEnContractFilterExecute(Sender: TObject);
    procedure actEnContractViewExecute(Sender: TObject);
    procedure sgENContractDblClick(Sender: TObject);
    procedure actEncontractItemUpdateExecute(Sender: TObject);
    procedure actEstimate2ContractItemUpdateExecute(Sender: TObject);
    procedure sgENContractItemClick(Sender: TObject);
    procedure sgENEstimateItemInContractDblClick(Sender: TObject);
    procedure actEstimateWithoutContractCheckAllExecute(Sender: TObject);
    procedure actEstimateWithoutContractUnCheckAllExecute(Sender: TObject);
    procedure actEnContractAddProjectAgreementExecute(Sender: TObject);
    procedure PopupMenuPurchaseItem2EIWithoutContractPopup(Sender: TObject);
    procedure actEstimateWithoutContractAdd2SpecificationExecute(
      Sender: TObject);
    procedure actEstimate2ProjectAgreeUnlinkExecute(
      Sender: TObject);
    procedure actEstimateWithoutContractLink2ContractExecute(Sender: TObject);
    procedure PopupMenuEstimate2ContractItemPopup(Sender: TObject);
    procedure sgENEstimateItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);

    function  GetCheckedMaterialsCountFromEstimate: Double;
    function  GetCheckedMaterialsCountFromGroupMaterial: Double;
    procedure UpdateInfoForEstimateWithoutContract();
    procedure actEstimateWithContractUnLink2ContractExecute(Sender: TObject);
    procedure sgENEstimateItemDblClick(Sender: TObject);
    procedure actEnContractDeleteExecute(Sender: TObject);
    procedure actEnContractEditExecute(Sender: TObject);
    procedure sgENContractMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sgENContractClick(Sender: TObject);
    procedure sgENContractRightClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure actEstimateWithoutContractFilterExecute(Sender: TObject);
    procedure actEstimateWithoutContractNoFilterExecute(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure actEstimate2ContractFilterExecute(Sender: TObject);
    procedure actEstimate2ContractNoFilterExecute(Sender: TObject);
    procedure actEncontractItemFilterByMaterialExecute(Sender: TObject);
    procedure actEncontractItemNoFilterExecute(Sender: TObject);
    procedure actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_updateExecute(Sender: TObject);

    function StringArrayToString(Const AnArray: array of WideString): String;
    procedure sgMaterialWithoutContractGroupByOrderitemOrPlanPeriodCheckBoxClick(
      Sender: TObject; ACol, ARow: Integer; State: Boolean);
    procedure actEstimateWithoutContractGroupAdd2SpecificationExecute(
      Sender: TObject);
    procedure actEstimate2ContractItemGroupUpdateExecute(Sender: TObject);
    procedure actEstimate2ProjectAgreeGroupUnlinkExecute(Sender: TObject);
    procedure actEstimateWithoutContractGroupLink2ContractExecute(
      Sender: TObject);
    procedure actEstimate2ContractGroupUnlinkExecute(Sender: TObject);
    procedure actEstimateWithoutContractGroupCheckAllExecute(Sender: TObject);
    procedure actEstimateWithoutContractGroupUnCheckAllExecute(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure PopupMenuPurchaseItem2EIWithoutContractGroupPopup(
      Sender: TObject);
    procedure PopupMenuEstimate2ContractItemGroupPopup(Sender: TObject);
  private
    { Private declarations }
    checkedCountEstimateitemWithoutContract : Double;
    checkedCountGroupMaterialWithoutContract : Double;
  public
    { Public declarations }
  end;

var
  frmPlanPurchaseGroup: TfrmPlanPurchaseGroup;

    b : boolean;

   ColCountPlanPurchase, LastCountPlanPurchase: Integer;
   LastRowPlanPurchase: Integer = 1;

   ColCountEnContract, LastCountEnContract: Integer;
   LastRowEnContract: Integer = 1;

   ColCountEnContractItem, LastCountEnContractItem: Integer;
   LastRowEnContractItem: Integer = 1;

    RQPlanPurchaseHeaders: array [1..9] of String =
        ( 'Код'
          ,'Найменування'
          ,'Рік'
          ,'Примітка'
          ,'Дата створення плану закупівель '
          ,'Дата зміни річного плану закупівель '
          ,'Користувач, який створив план закупівель'
          ,'Користувач, який вніс зміни до річного плану закупівель'
          ,'Статус'
        );

        RQPurchaseItemTenderHeaders: array [1..11] of String =
        ( 'Код'
          ,'Річний план/зміна'
          ,'Код ДК основний '
          ,'Код ДК додатковий '
          ,'Предмет закупівлі за кодом ДК(Назва) '
          ,'Джерело фінансування'
          ,'Вартість із планів(грн. з ПДВ)'
          ,'Вартість згідно плану закупівель (грн. з ПДВ)'
          ,'Процедура закупівлі'
          ,'Орієнтовний початок проведення процедури закупівлі(місяць рік)'
          ,'Тип закупівлі'
        );

        RQPurchaseItemHeaders: array [1..15] of String =
        ( 'Код'
          ,'Річний план/зміна'
          ,'Код ДК 2010'
          ,'Код ДК 2015'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'Ціна із планів робіт (грн. з ПДВ)'
          ,'Кількість із планів робіт '
          ,'Вартість із планів робіт (грн. з ПДВ) '
          ,'Ціна згідно плану закупівель (грн. з ПДВ)'
          ,'Кількість згідно плану закупівель'
          ,'Вартість згідно плану закупівель (грн. з ПДВ) '
          ,'Тип закупівлі'
          ,'Користувач що вніс зміни'
          ,'Перелік об`єктів з планів'

        );

          ENEstimateItemHeaders: array [1..13] of String =
        (  'Код'
          ,'Матеріал'
          ,'Кількість із планів '
          ,'Кількість згідно плану закупівель '
          ,'Од. виміру'
          ,'Підрозділ'
          ,'інв №'
          ,'Об`єкт'
          ,'Період вик.робіт'
          ,'ПідВид робіт'
          ,'Тип Акту'
          ,'Код роботи'
          ,'Робота'
          //,'Інформація по договору'
          //,'Заявка'
        );

        sgMaterialWithoutContractGroupByOrderitemOrPlanPeriodHeaders: array [1..6] of String =
        (  'ун.код строки заявки'
          ,'Заявка або план'
          ,'Період'
          ,'ДДС код'
          ,'Бюджетотримач'
          ,'Кількість'
        );

         ENContractHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Дата закінчення договору'
          ,'Договор/Проект'
          ,'Постачальник'  // 5
          ,'Код договору у фін.кол.'
          ,'PK договору у фін.кол.'
          ,'Пользователь внесший изменение'
          ,'Дата последнего изменения'
        );

        ENContractItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість за договором'
          ,'Неприв`язана кількість'
          ,'Ціна'
          ,'Вартість'
          ,'Користувач'
					,'Дата зміни'
					,'Кількість фактична'
        );

        ENEstimateItemInContractHeaders: array [1..14] of String =
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
          ,'Інформація про план закупок'
          ,'Заявка'

          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );

        sgGroupedEstimate2ContractHeaders: array [1..6] of String =
        (  'ун.код строки заявки'
          ,'Заявка або план'
          ,'Період'
          ,'ДДС код'
          ,'Бюджетотримач'
          ,'Кількість'
        );

implementation

uses RQPlanPurchaseController, RQPlanPurchaseKindController, ENConsts,
  RQSpravDKPPController, RQPurchaseItemTenderController,
  EditRQPurchaseItemTenderFilter, RQPurchaseItemController, EditRQPurchaseItem,
  EditRQPurchaseItemFilter, EditRQPurchaseItemType,
  RQPurchaseItemTypeController, ChangePlanPurchaseItemType,
  RQPurchaseItem2EstimateItemController, EditRQPurchaseItem2EstimateItemFilter,
  ENContractController, EditENContractFilter, EditENContract,
  ENContractItemController, EditENContractItemFilter, ENEstimateItemController,
  ENPlanWorkController, TKMaterialsController, EditENPlanWork, DMReportsUnit,
  EditDFDocAgreement, DFDocAgreementController, DFDocController,
  EditENEstimtate2ContractFilter, ShowTKMaterials , EnergyproController ,DialogFormUnit ;

{$R *.dfm}

procedure TfrmPlanPurchaseGroup.actEnContractAddProjectAgreementExecute(
  Sender: TObject);
  var
    TempDFDocAgreement : DFDocAgreementControllerSoapPort;
    TempDFDoc: DFDocControllerSoapPort;
    dfdocagrObj :DFDocAgreement;
    dfdobj : DFDoc;
    docNum : String;
begin
  inherited;
     TempDFDocAgreement := HTTPRIODFDocAgreement as DFDocAgreementControllerSoapPort;
     TempDFDoc := HTTPRIODFDoc as DFDocControllerSoapPort;
      DFDocAgreementObj := DFDocAgreement.Create;
      SetNullXSProps(DFDocAgreementObj);
      SetNullIntProps(DFDocAgreementObj);
      try
        frmDFDocAgreementEdit := TfrmDFDocAgreementEdit.Create(Application, dsInsert);
        frmDFDocAgreementEdit.chkPurchaseTMC.Checked:= true;
        frmDFDocAgreementEdit.isCreateByEstimate := 1; // проект договора собирается с естимейтов
        try
          if frmDFDocAgreementEdit.ShowModal = mrOk then
          begin
            if DFDocAgreementObj <> nil then
            begin
              if frmDFDocAgreementEdit.purchaseTMCagreeCode <> LOW_INT then
              begin
               dfdocagrObj:=TempDFDocAgreement.getObject(frmDFDocAgreementEdit.purchaseTMCagreeCode);
               docNum := dfdocagrObj.doc.docNum;
               //dfdobj:= TempDFDoc.getObject(dfdocagrObj.doc.code);
               Application.MessageBox(PChar(' Створено проект договору ' + docNum ), PChar('Повідомлення'), MB_ICONINFORMATION);
              end;

              actEnContractUpdateExecute(Sender);
            end;
          end;
        finally
          frmDFDocAgreementEdit.Free;
          frmDFDocAgreementEdit:=nil;
        end;
      finally
        DFDocAgreementObj.Free;
        DFDocAgreementObj := nil;
      end;
end;


procedure TfrmPlanPurchaseGroup.actEnContractDeleteExecute(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Договір) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContract.remove(ObjCode);
      actEnContractUpdateExecute(Sender);
  end;
end;

procedure TfrmPlanPurchaseGroup.actEnContractEditExecute(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
    TempDfDocAgreement : DFDocAgreementControllerSoapPort;
    dfDocAgreementFil : DFDocAgreementFilter;
    DFDocAgreementList: DFDocAgreementShortList;
begin
 TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
 TempDfDocAgreement:= HTTPRIODFDocAgreement as DFDocAgreementControllerSoapPort;
   try
     ENContractObj := TempENContract.getObject(StrToInt(sgENContract.Cells[0,sgENContract.Row]));
   except
   on EConvertError do Exit;
  end;
 //  если тип = проект договора то открываем форму докфлова на просмотр /  редактирование/ иначе форму енерджинетовскую
   if ENContractObj.contractType.code = ENConsts.ENCONTRACTTYPE_AGREE then
   begin
    frmENContractEdit:=TfrmENContractEdit.Create(Application, dsEdit);
    try
      frmENContractEdit.ShowModal;
    finally
      frmENContractEdit.Free;
      frmENContractEdit:=nil;
    end;
   end
   else
   if ENContractObj.contractType.code = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE then
   begin
      dfDocAgreementFil := DFDocAgreementFilter.Create;
      SetNullIntProps(dfDocAgreementFil);
      SetNullXSProps(dfDocAgreementFil);
      dfDocAgreementFil.conditionSQL := ' DFDOCAGREEMENT.CODE =( select agreerefcode  from docflow.dfspecification2agree where encontractcode =   ' + IntToStr( ENContractObj.code) + ' ) ' ;

      DFDocAgreementList := TempDFDocAgreement.getScrollableFilteredList(dfDocAgreementFil,0,-1);
      if High(DFDocAgreementList.list) = 0 then
      begin
       Application.MessageBox(PChar('Помилка при визначенні проекту договора!'),
                           PChar('Увага!'), MB_ICONWARNING);
       Exit;
      end;

      try
         DFDocAgreementObj := TempDFDocAgreement.getObject(DFDocAgreementList.list[0].code);
       except
       on EConvertError do Exit;
      end;
      frmDFDocAgreementEdit:=TfrmDFDocAgreementEdit.Create(Application, dsEdit);
      try
        if frmDFDocAgreementEdit.ShowModal= mrOk then
        begin
        end;
      finally
        frmDFDocAgreementEdit.Free;
        frmDFDocAgreementEdit:=nil;
      end;


   end;
end;

procedure TfrmPlanPurchaseGroup.actEnContractFilterExecute(Sender: TObject);
begin
frmENContractFilterEdit:=TfrmENContractFilterEdit.Create(Application, dsEdit);
  try
    ENContractFilterObj := ENContractFilter.Create;
    SetNullIntProps(ENContractFilterObj);
    SetNullXSProps(ENContractFilterObj);

    if frmENContractFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENContractFilterObj;
      actEnContractUpdateExecute(Sender);
    end;
  finally
    frmENContractFilterEdit.Free;
    frmENContractFilterEdit:=nil;
  end;
end;


procedure TfrmPlanPurchaseGroup.actEncontractItemUpdateExecute(Sender: TObject);
  Var i, j , EnContractObjCode : Integer;
  TempENContractItem: ENContractItemControllerSoapPort;
  ENContractItemList: ENContractItemShortList;

begin
   for i:=1 to sgENContractItem.RowCount-1 do
   for j:=0 to sgENContractItem.ColCount-1 do
   begin
     sgENContractItem.Cells[j,i]:='';
     if Assigned(sgENContractItem.Objects[j,i]) then
     begin
        //sgENContractItem.Objects[j,i].Free;
        sgENContractItem.Objects[j,i]:=nil;
     end;
   end;

   EnContractObjCode := LOW_INT;

    try
     EnContractObjCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
    except
     on EConvertError do Exit;
    end;



  ColCountEnContractItem:=1000;
  TempENContractItem :=  HTTPRIOENContractItem as ENContractItemControllerSoapPort;

     ENContractItemFilterObj := nil;
  if ENContractItemFilterObj = nil then
  begin
     ENContractItemFilterObj := ENContractItemFilter.Create;
     SetNullIntProps(ENContractItemFilterObj);
     SetNullXSProps(ENContractItemFilterObj);
  end;

  if EnContractObjCode <> LOW_INT then
   begin
     ENContractItemFilterObj.contract := ENContract.Create;
     ENContractItemFilterObj.contract.code := EnContractObjCode;
   end;

  ENContractItemList := TempENContractItem.getScrollableFilteredList(ENContractItemFilterObj,0,ColCountEnContractItem);


  LastCountEnContractItem:=High(ENContractItemList.list);

  if LastCountEnContractItem > -1 then
     sgENContractItem.RowCount:=LastCountEnContractItem + 2
  else
     sgENContractItem.RowCount:=2;


   with sgENContractItem do
    for i:=0 to LastCountEnContractItem do
      begin

        if ENContractItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractItemList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENContractItemList.list[i].materialName;

        Objects[1,i+1] := TObject(ENContractItemList.list[i].materialCode);

        if ENContractItemList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENContractItemList.list[i].countGen.DecimalString;

       if ENContractItemList.list[i].countbinded = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := FloatToStr(strtofloat(ENContractItemList.list[i].countGen.DecimalString)
                         - strtofloat(ENContractItemList.list[i].countbinded.DecimalString)
                         );

        if ENContractItemList.list[i].price = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENContractItemList.list[i].price.DecimalString;

        if ENContractItemList.list[i].cost = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENContractItemList.list[i].cost.DecimalString;
        Cells[6,i+1] := ENContractItemList.list[i].userGen;
        if ENContractItemList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
					Cells[7,i+1] := XSDate2String(ENContractItemList.list[i].dateEdit);

					if ENContractItemList.list[i].countReal = nil then
					Cells[8,i+1] := ''
				else
					Cells[8,i+1] := ENContractItemList.list[i].countReal.DecimalString;

        LastRowEnContractItem:=i+1;
        sgENContractItem.RowCount:=LastRowEnContractItem+1;
      end;
   ColCountEnContractItem:= ColCountEnContractItem+1;
   sgENContractItem.Row:= 1;



end;

procedure TfrmPlanPurchaseGroup.actEnContractUpdateExecute(Sender: TObject);
var
 i, j : Integer;
 TempENContract: ENContractControllerSoapPort;
 ENContractList: ENContractShortList;
 purchaseItemCode : Integer;
begin
  inherited;
 for i:=1 to sgENContract.RowCount-1 do
 begin
   sgENContract.RowColor[i]:= clNone;
   for j:=0 to sgENContract.ColCount-1 do
     sgENContract.Cells[j,i]:='';
 end;
  ClearGrid(sgENContract);

  ColCountEnContract:=100;
  TempENContract :=  HTTPRIOENContract as ENContractControllerSoapPort;

  purchaseItemCode:= LOW_INT;
  try
     purchaseItemCode := StrToInt(sgRQPurchaseItemWithoutContract.Cells[0,sgRQPurchaseItemWithoutContract.Row]);
   except
   purchaseItemCode:=LOW_INT ;
  end;

  if ENContractFilterObj  = nil then
  begin
     ENContractFilterObj := ENContractFilter.Create;
     SetNullIntProps(ENContractFilterObj);
     SetNullXSProps(ENContractFilterObj);
  end;

  if ((chkAutoFindContractWithFreeCount.Checked) and (purchaseItemCode <> LOW_INT)) then
  ENContractFilterObj.conditionSQL := 'encontract.code in ( select c.code  ' +
  ' from encontractitem ci  , encontract c ' +
  ' where ci.materialcode = (select pi.materialrefcode from rqpurchaseitem pi where pi.code = ' + IntToStr(purchaseItemCode) + ' limit 1 ) ' +
   ' and ci.contractcode = c.code ' +
   ' group by c.code , ci.countgen , ci.code ' +
   ' having (ci.countgen::numeric(15,6) -  coalesce((select coalesce(sum(ec.countfact), 0) ' +
   '       from enestimateitem2contrct ec, enestimateitem ei ' +
   '       where ec.estimateitemcode = ei.code ' +
   '         and ei.materialrefcode = ci.materialcode ' +
   '         and ec.findocid = c.findocid ' +
   '         and ec.findoccode = c.findoccode),0)::numeric(15,6) ) > 0 )';

  ENContractFilterObj.orderBySQL := 'contractenddate desc , contractdate ';

  ENContractList := TempENContract.getScrollableFilteredList(ENContractFilterObj,0,ColCountEnContract);


  LastCountEnContract:=High(ENContractList.list);

  if LastCountEnContract > -1 then
     sgENContract.RowCount:=LastCountEnContract+2
  else
     sgENContract.RowCount:=2;

   with sgENContract do
    for i:=0 to LastCountEnContract do
      begin
        Application.ProcessMessages;
        if ENContractList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractList.list[i].code)
        else
          Cells[0,i+1] := '';

          Cells[1,i+1] := ENContractList.list[i].contractNumber;

        if ENContractList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENContractList.list[i].contractDate);

        if ENContractList.list[i].contractEndDate = nil then
          Cells[3,i+1] := ''
        else
         begin
          Cells[3,i+1] := XSDate2String(ENContractList.list[i].contractEndDate);
          if comparedate(date() , StrToDate(XSDate2String(ENContractList.list[i].contractEndDate))  ) > 0 then
             RowColor[i+1]:= clRed;
         end;



          Cells[4,i+1] := ENContractList.list[i].contractTypeName;
          if (ENContractList.list[i].contractTypeCode = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE ) then
             RowColor[i+1]:= clLime;
          Objects[4,i+1] := TObject(ENContractList.list[i].contractTypeCode);

          Cells[5,i+1] := ENContractList.list[i].orgName;

          Cells[6,i+1] := ENContractList.list[i].finDocCode;

        if ENContractList.list[i].finDocID = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENContractList.list[i].finDocID);

          Cells[8,i+1] := ENContractList.list[i].userGen;

        if ENContractList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENContractList.list[i].dateEdit);

        LastRowEnContract:=i+1;
        sgENContract.RowCount:=LastRowEnContract+1;
      end;
   ColCountEnContract:=ColCountEnContract+1;
   sgENContract.Row:=1;
   actEncontractItemUpdateExecute(Sender);
   actEstimate2ContractItemGroupUpdateExecute(Sender);

//    if chkAutoUpdateEstimate2ContractItem.Checked = True then
//       actEstimate2ContractItemUpdateExecute(Sender);

end;

procedure TfrmPlanPurchaseGroup.actEnContractViewExecute(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
    TempDfDocAgreement : DFDocAgreementControllerSoapPort;
    dfDocAgreementFil : DFDocAgreementFilter;
    DFDocAgreementList: DFDocAgreementShortList;
begin
 TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
 TempDfDocAgreement:= HTTPRIODFDocAgreement as DFDocAgreementControllerSoapPort;
   try
     ENContractObj := TempENContract.getObject(StrToInt(sgENContract.Cells[0,sgENContract.Row]));
   except
   on EConvertError do Exit;
  end;
 //  если тип = проект договора то открываем форму докфлова на просмотр /  редактирование/ иначе форму енерджинетовскую
   if ENContractObj.contractType.code = ENConsts.ENCONTRACTTYPE_AGREE then
   begin
    frmENContractEdit:=TfrmENContractEdit.Create(Application, dsView);
    try
      frmENContractEdit.ShowModal;
    finally
      frmENContractEdit.Free;
      frmENContractEdit:=nil;
    end;
   end
   else
   if ENContractObj.contractType.code = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE then
   begin
      dfDocAgreementFil := DFDocAgreementFilter.Create;
      SetNullIntProps(dfDocAgreementFil);
      SetNullXSProps(dfDocAgreementFil);
      dfDocAgreementFil.conditionSQL := ' DFDOCAGREEMENT.CODE =( select agreerefcode  from docflow.dfspecification2agree where encontractcode =   ' + IntToStr( ENContractObj.code) + ' ) ' ;

      DFDocAgreementList := TempDFDocAgreement.getScrollableFilteredList(dfDocAgreementFil,0,-1);
      if High(DFDocAgreementList.list) = 0 then
      begin
       Application.MessageBox(PChar('Помилка при визначенні проекту договора!'),
                           PChar('Увага!'), MB_ICONWARNING);
       Exit;
      end;

      try
         DFDocAgreementObj := TempDFDocAgreement.getObject(DFDocAgreementList.list[0].code);
       except
       on EConvertError do Exit;
      end;
      frmDFDocAgreementEdit:=TfrmDFDocAgreementEdit.Create(Application, dsView);
      try
        if frmDFDocAgreementEdit.ShowModal= mrOk then
        begin
        end;
      finally
        frmDFDocAgreementEdit.Free;
        frmDFDocAgreementEdit:=nil;
      end;


   end;
end;

procedure TfrmPlanPurchaseGroup.actEstimate2ContractFilterExecute(
  Sender: TObject);
begin
  frmENEstimateitem2ContractFilter:=TfrmENEstimateitem2ContractFilter.Create(Application, dsInsert);
  try

    if frmENEstimateitem2ContractFilter.ShowModal = mrOk then
    begin
      actEstimate2ContractItemUpdateExecute(Sender);
    end;
  finally
    frmENEstimateitem2ContractFilter.Free;
    frmENEstimateitem2ContractFilter:=nil;
  end


//  frmRQPurchaseItem2EstimateItemFilterEdit:=TfrmRQPurchaseItem2EstimateItemFilterEdit.Create(Application, dsEdit);
// frmRQPurchaseItem2EstimateItemFilterEdit.Caption:= 'Фільтр матеріали без договорів ';
//  try
//    RQPurchaseItem2EstimateItemFilterObj := RQPurchaseItem2EstimateItemFilter.Create;
//    SetNullIntProps(RQPurchaseItem2EstimateItemFilterObj);
//    SetNullXSProps(RQPurchaseItem2EstimateItemFilterObj);
//
//    if frmRQPurchaseItem2EstimateItemFilterEdit.ShowModal = mrOk then
//    begin
//      RQPurchaseItem2EstimateItemFilterObj := RQPurchaseItem2EstimateItemFilterObj;
//      actEstimateWithoutContractUpdateExecute(Sender);
//    end;
//  finally
//    frmRQPurchaseItem2EstimateItemFilterEdit.Free;
//    frmRQPurchaseItem2EstimateItemFilterEdit:=nil;
//  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimate2ContractGroupUnlinkExecute(
  Sender: TObject);
var
  selectedEiItemGroupForUnlink2Specification : Boolean;
  i , j : Integer;
  eiGroupList : RQPurchaseItem2EstimateItemGroupShortList;
  eiGroupObj : RQPurchaseItem2EstimateItemGroupShort;
  eiGroupArr : ArrayOfRQPurchaseItem2EstimateItemGroupShort;
  eiGroupArrCount : Integer;
  TempRQpurchaseItem2Enestimateitem : RQPurchaseItem2EstimateItemControllerSoapPort;
  enContractCode : Integer;
begin
  selectedEiItemGroupForUnlink2Specification := false;

  enContractCode := LOW_INT;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


  for i := 1 to sgGroupedEstimate2Contract.RowCount - 1 do
  begin
    sgGroupedEstimate2Contract.GetCheckBoxState(1, i, selectedEiItemGroupForUnlink2Specification);
    if selectedEiItemGroupForUnlink2Specification then break;
  end;
  if not selectedEiItemGroupForUnlink2Specification then
  begin
    Application.MessageBox(PChar('Не обрані сгруповані строки матеріалу !'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний матеріал по проекту договору !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  eiGroupList := RQPurchaseItem2EstimateItemGroupShortList.Create;
  eiGroupList.totalCount := 0;
  selectedEiItemGroupForUnlink2Specification := false;

  for i := 1 to sgGroupedEstimate2Contract.RowCount - 1 do
  begin
    sgGroupedEstimate2Contract.GetCheckBoxState(1, i, selectedEiItemGroupForUnlink2Specification);
    if selectedEiItemGroupForUnlink2Specification then
    begin
       eiGroupObj := RQPurchaseItem2EstimateItemGroupShort.Create;
       SetNullIntProps(eiGroupObj);
       SetNullXSProps(eiGroupObj);
      if (sgGroupedEstimate2Contract.Cells[0,i] <> '' ) then
       begin
        eiGroupObj.orderitemСode := StrToInt(sgGroupedEstimate2Contract.Cells[0,i] );
       end
      else
       eiGroupObj.orderitemСode := Low(Integer);

       eiGroupObj.enContractCode := enContractCode;
       eiGroupObj.materialCode := Integer(sgGroupedEstimate2Contract.Objects[2,i]); // код материала
       eiGroupObj.purchaseitemСode := Integer(sgGroupedEstimate2Contract.Objects[3,i]);  // код строки плана закупки
       eiGroupObj.estimatearray :=  ArrayOfString(
                    sgGroupedEstimate2Contract.Objects[0,i]
                  );


       eiGroupArrCount := High(eiGroupArr) + 1;
       SetLength(eiGroupArr, eiGroupArrCount + 1);
       eiGroupArr[eiGroupArrCount] := eiGroupObj;

    end;
  end;

  eiGroupList.list:= eiGroupArr;
  eiGroupList.totalCount := High(eiGroupArr) + 1;

  if (eiGroupList.totalCount >= 0  ) then
  begin
    TempRQpurchaseItem2Enestimateitem := HTTPRIORQPurchaseItem2EstimateItem  as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQpurchaseItem2Enestimateitem.estimateGroupInContractUnlink2Contract(eiGroupArr);

    actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_updateExecute(Sender);
    actEstimate2ContractItemGroupUpdateExecute(Sender);
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimate2ContractItemGroupUpdateExecute(
  Sender: TObject);
var
    i, code  , z , j: Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    //ENEstimateItemGroupList: ENEstimateItemShortList;
    eFilter : ENEstimateItemFilter;
    pFilter : ENPlanWorkFilter;
    conditionSQL, planCondition , eCondition : String;
    ////
    currentCount, totalCount: Double;
    materialInContractCode : Integer;
    finDocID: Integer;
    condition :string;

    TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
    RQPurchaseItem2EstimateItemGroupList : RQPurchaseItem2EstimateItemGroupShortList;
begin
   materialInContractCode := LOW_INT;
   ClearGrid(sgGroupedEstimate2Contract);

   currentCount := 0;
   totalCount := 0;

   for z:=1 to sgGroupedEstimate2Contract.RowCount-1 do
   for j:=0 to sgGroupedEstimate2Contract.ColCount-1 do
   begin
     sgGroupedEstimate2Contract.Cells[j,z]:='';
     if Assigned(sgGroupedEstimate2Contract.Objects[j,z]) then
     begin
        sgGroupedEstimate2Contract.Objects[j,z]:=nil;
     end;
   end;

   TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

   try
     materialInContractCode:= Integer( sgENContractItem.Objects[1,sgENContractItem.Row]);
   except
     on EConvertError do Exit;
   end;

   try
     finDocID:= StrToInt( sgENContract.Cells[7,sgENContract.Row] ) ;
   except
     on EConvertError do Exit;
   end;

    condition := '';

    if materialInContractCode > LOW_INT then
    begin
      AddCondition(condition, ' enestimateitem.materialrefcode = ' + IntToStr(materialInContractCode) );
    end;

     AddCondition(condition, ' enestimateitem2contrct.findocid = ' + IntToStr(finDocID) );

     if withoutBill then
      AddCondition(condition, ' ENESTIMATEITEM.CODE not in ( select bi2ei.estimateitemcode from rqbillitem2enestimattm bi2ei where bi2ei.estimateitemcode = ENESTIMATEITEM.CODE ) ' );

     if EnEstimateitem2ContractOrderCode <> LOW_INT then
       AddCondition(condition, ' ENESTIMATEITEM.CODE in ( select oi2ei.estimateitemcode from rqorderitem oi , rqorderitem2enestimttm oi2ei '+
                               ' where oi.orderrefcode = ' + IntToStr(EnEstimateitem2ContractOrderCode) +
                               '   and oi.code = oi2ei.orderitemcode )' );

       eFilter.conditionSQL :=  condition ;



    /////
    eFilter.orderBySQL := ' SM.NAME, ENPLANWORK.DATESTART ';

    Application.ProcessMessages;
    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!

    pFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(pFilter);
    SetNullXSProps(pFilter);

    TempRQPurchaseItem2EstimateItem :=  HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
    RQPurchaseItem2EstimateItemGroupList := TempRQPurchaseItem2EstimateItem.getGroupedEstimate2ContractList(eFilter, pFilter);


   if High(RQPurchaseItem2EstimateItemGroupList.list) > -1 then
      sgGroupedEstimate2Contract.RowCount := High(RQPurchaseItem2EstimateItemGroupList.list) + 2
    else
      sgGroupedEstimate2Contract.RowCount := 2;

     with sgGroupedEstimate2Contract do
       for i := 0 to High(RQPurchaseItem2EstimateItemGroupList.list) do
       begin
        Application.ProcessMessages;

        if RQPurchaseItem2EstimateItemGroupList.list[i].orderitemСode = LOW_INT then
         Cells[0,i+1] := ''
          else
         Cells[0,i+1] := IntToStr(RQPurchaseItem2EstimateItemGroupList.list[i].orderitemСode);

        //массив стимейтов
        Objects[0,i+1] := TObject(RQPurchaseItem2EstimateItemGroupList.list[i].estimateArray);

        Cells[1,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].orderPlanNumber;
        AddCheckBox(1, i+1, false, false);

        Cells[2,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].orderPlanPeriod;
        Cells[3,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].ddsСode;
        Cells[4,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].budgetName;

        if RQPurchaseItem2EstimateItemGroupList.list[i].countfact = nil then
           Cells[5,i+1] := ''
         else
           Cells[5,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].countfact.DecimalString;

         // запишем код материала
         Objects[2,i+1] := TObject(RQPurchaseItem2EstimateItemGroupList.list[i].materialCode);
         // запишем код строки плана закупки
         Objects[3,i+1] := TObject(RQPurchaseItem2EstimateItemGroupList.list[i].purchaseitemСode );


         sgGroupedEstimate2Contract.RowCount := i + 2;
       end;



     if materialInContractCode > LOW_INT then
       lblMaterialInContractTotal.Caption := FloatToStr(totalCount)
     else
       lblMaterialInContractTotal.Caption := '';


     // обнолим фильтр по заявке
     EnEstimateitem2ContractOrderCode:=LOW_INT;

end;

procedure TfrmPlanPurchaseGroup.actEstimate2ContractItemUpdateExecute(
  Sender: TObject);
var
    i, code : Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eFilter : ENEstimateItemFilter;
    pFilter : ENPlanWorkFilter;
    conditionSQL, planCondition , eCondition : String;
    ////
    currentCount, totalCount: Double;
    materialInContractCode : Integer;
    finDocID: Integer;
    condition :string;
begin
   materialInContractCode := LOW_INT;
   ClearGrid(sgENEstimateItemInContract);

   currentCount := 0;
   totalCount := 0;

   TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

   try
     materialInContractCode:= Integer( sgENContractItem.Objects[1,sgENContractItem.Row]);
   except
     on EConvertError do Exit;
   end;

   try
     finDocID:= StrToInt( sgENContract.Cells[7,sgENContract.Row] ) ;
   except
     on EConvertError do Exit;
   end;



    if materialInContractCode > LOW_INT then
    begin
      eFilter.materialRef := TKMaterialsRef.Create;
      eFilter.materialRef.code := materialInContractCode;
    end;


//      eFilter.conditionSQL :=  'enestimateitem.code in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct where ' +
//                    ' enestimateitem2contrct.findocid = ' + IntToStr(finDocID) + ')';
     condition := '';

     AddCondition(condition, ' enestimateitem2contrct.findocid = ' + IntToStr(finDocID) );

     if withoutBill then
      AddCondition(condition, ' ENESTIMATEITEM.CODE not in ( select bi2ei.estimateitemcode from rqbillitem2enestimattm bi2ei where bi2ei.estimateitemcode = ENESTIMATEITEM.CODE ) ' );

     if EnEstimateitem2ContractOrderCode <> LOW_INT then
       AddCondition(condition, ' ENESTIMATEITEM.CODE in ( select oi2ei.estimateitemcode from rqorderitem oi , rqorderitem2enestimttm oi2ei '+
                               ' where oi.orderrefcode = ' + IntToStr(EnEstimateitem2ContractOrderCode) +
                               '   and oi.code = oi2ei.orderitemcode )' );

     // SUPP-72963 естимейты из планов фильтруем по сгрупированным
         AddCondition(condition, ' ENESTIMATEITEM.CODE = ANY(''{'
         +  StringArrayToString (
               ArrayOfString(
                    sgGroupedEstimate2Contract.Objects[0,sgGroupedEstimate2Contract.Row]
                  )
                )
           + '}'')'
          );
       eFilter.conditionSQL :=  condition ;



    /////
    eFilter.orderBySQL := ' SM.NAME, ENPLANWORK.DATESTART ';

    Application.ProcessMessages;
    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!

    pFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(pFilter);
    SetNullXSProps(pFilter);

    ENEstimateItemList := TempENEstimateItem.getDetailedEstimate2ContractList(eFilter, pFilter);

    if High(ENEstimateItemList.list) > -1 then
      sgENEstimateItemInContract.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgENEstimateItemInContract.RowCount := 2;

     with sgENEstimateItemInContract do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         // в объекте лежит код связки RQPurchaseItem2EstimateItem ( с него добавили естимейты в проект договора , или в договор )
         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].purchaseItem2EstimateitemCode);

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);

         AddCheckBox(1, i+1, false, false);



         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!
         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else begin
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
           try
             currentCount := StrToFloat(ENEstimateItemList.list[i].countFact.DecimalString);
           except
             on EConvertError do
               currentCount := 0;
           end;
         end;


         totalCount := totalCount + currentCount;
         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!

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

         Cells[12 ,i+1 ] := ENEstimateItemList.list[i].purchaseInfoByOrderItem;

         if ENEstimateItemList.list[i].statusRefCode <> ENESTIMATEITEMSTATUS_PLANNED then
           RowColor[i + 1] := clYellow //$0080FF80;
         else
           RowColor[i + 1] := clNone;

         Cells[13 ,i+1 ] := ENEstimateItemList.list[i].orderNumber;


         sgENEstimateItemInContract.RowCount := i + 2;
       end;

     sgENEstimateItemInContract.Row := 1;

     if materialInContractCode > LOW_INT then
       lblMaterialInContractTotal.Caption := FloatToStr(totalCount)
     else
       lblMaterialInContractTotal.Caption := '';


     // обнолим фильтр по заявке
     EnEstimateitem2ContractOrderCode:=LOW_INT;

end;

procedure TfrmPlanPurchaseGroup.actEstimate2ContractNoFilterExecute(
  Sender: TObject);
begin
     EnEstimateitem2ContractOrderCode := LOW_INT;
     withoutBill:= false;
     actEstimate2ContractItemUpdateExecute(Sender);
end;

//
// если договор в док флов черновой тогда :
  // - удаление и пересчет строк из спецификации на стороне докфлов , dfspecificationitem , DFSPECITEM2ENESTIMATE
  // - удаление естимейтов из связки  enestimateitem2contrct пересчет строк encontractitem
  // -- также если отвязываем ВСЕ естимейты которые привязаны к заявке то убрать со строки заявки код и номер проекта договора
  // но если пытаемся отвязать не все естимейты за раз которые привязаны к строке заявки то выдавать перечень материалов(естимейтов которые нужно еще выбрать для отвязки)
  // если нужно будет автоматически разделять строку заявки то потом допилить
procedure TfrmPlanPurchaseGroup.actEstimate2ProjectAgreeGroupUnlinkExecute(
  Sender: TObject);
var
  selectedEiItemGroupForUnlink2Specification : Boolean;
  i , j : Integer;
  eiGroupList : RQPurchaseItem2EstimateItemGroupShortList;
  eiGroupObj : RQPurchaseItem2EstimateItemGroupShort;
  eiGroupArr : ArrayOfRQPurchaseItem2EstimateItemGroupShort;
  eiGroupArrCount : Integer;
  TempRQpurchaseItem2Enestimateitem : RQPurchaseItem2EstimateItemControllerSoapPort;
  enContractCode : Integer;
begin
  selectedEiItemGroupForUnlink2Specification := false;

  enContractCode := LOW_INT;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


  for i := 1 to sgGroupedEstimate2Contract.RowCount - 1 do
  begin
    sgGroupedEstimate2Contract.GetCheckBoxState(1, i, selectedEiItemGroupForUnlink2Specification);
    if selectedEiItemGroupForUnlink2Specification then break;
  end;
  if not selectedEiItemGroupForUnlink2Specification then
  begin
    Application.MessageBox(PChar('Не обрані сгруповані строки матеріалу !'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний матеріал по проекту договору !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  eiGroupList := RQPurchaseItem2EstimateItemGroupShortList.Create;
  eiGroupList.totalCount := 0;
  selectedEiItemGroupForUnlink2Specification := false;

  for i := 1 to sgGroupedEstimate2Contract.RowCount - 1 do
  begin
    sgGroupedEstimate2Contract.GetCheckBoxState(1, i, selectedEiItemGroupForUnlink2Specification);
    if selectedEiItemGroupForUnlink2Specification then
    begin
       eiGroupObj := RQPurchaseItem2EstimateItemGroupShort.Create;
       SetNullIntProps(eiGroupObj);
       SetNullXSProps(eiGroupObj);
      if (sgGroupedEstimate2Contract.Cells[0,i] <> '' ) then
       begin
        eiGroupObj.orderitemСode := StrToInt(sgGroupedEstimate2Contract.Cells[0,i] );
       end
      else
       eiGroupObj.orderitemСode := Low(Integer);

       eiGroupObj.enContractCode := enContractCode;
       eiGroupObj.materialCode := Integer(sgGroupedEstimate2Contract.Objects[2,i]); // код материала
       eiGroupObj.purchaseitemСode := Integer(sgGroupedEstimate2Contract.Objects[3,i]);  // код строки плана закупки
       eiGroupObj.estimatearray :=  ArrayOfString(
                    sgGroupedEstimate2Contract.Objects[0,i]
                  );


       eiGroupArrCount := High(eiGroupArr) + 1;
       SetLength(eiGroupArr, eiGroupArrCount + 1);
       eiGroupArr[eiGroupArrCount] := eiGroupObj;

    end;
  end;

  eiGroupList.list:= eiGroupArr;
  eiGroupList.totalCount := High(eiGroupArr) + 1;

  if (eiGroupList.totalCount >= 0  ) then
  begin
    TempRQpurchaseItem2Enestimateitem := HTTPRIORQPurchaseItem2EstimateItem  as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQpurchaseItem2Enestimateitem.estimateGroupInContractUnlink2Specification(eiGroupArr);

    actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_updateExecute(Sender);
    actEstimate2ContractItemGroupUpdateExecute(Sender);
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimate2ProjectAgreeUnlinkExecute(
  Sender: TObject);
var
  selectedEiForRemoveFromSpecification : Boolean;
  i , j : Integer;
  eiList : ENEstimateItemShortList;
  eiObj : ENEstimateItemShort;
  eiArr : ArrayOfENEstimateItemShort;
  eiArrCount : Integer;
  TempEstimateItem : ENEstimateItemControllerSoapPort;
  enContractCode : Integer;
begin
  selectedEiForRemoveFromSpecification := false;

  enContractCode := LOW_INT;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


  for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
  begin
    sgENEstimateItemInContract.GetCheckBoxState(1, i, selectedEiForRemoveFromSpecification);
    if selectedEiForRemoveFromSpecification then break;
  end;
  if not selectedEiForRemoveFromSpecification then
  begin
    Application.MessageBox(PChar('Не обрані прив`язані строки матеріалу до проекту договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний проект договору !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  eiList := ENEstimateItemShortList.Create;
  eiList.totalCount := 0;
  selectedEiForRemoveFromSpecification := false;

  for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
  begin
    sgENEstimateItemInContract.GetCheckBoxState(1, i, selectedEiForRemoveFromSpecification);
    if selectedEiForRemoveFromSpecification then
    begin
       eiObj := ENEstimateItemShort.Create;
       SetNullIntProps(eiObj);
       SetNullXSProps(eiObj);
       eiObj.code :=  StrToInt( sgENEstimateItemInContract.Cells[0 , i]) ; // код естимейта
       eiObj.enContractCode := enContractCode;
       eiObj.materialRefCode := Integer(sgENContractItem.Objects[1,sgENContractItem.Row]) ; // код материала
       eiObj.purchaseItem2EstimateitemCode := Integer(sgENEstimateItemInContract.Objects[0,i]);  // код связки rqpurchaseitem2enestimateitem
       eiArrCount := High(eiArr) + 1;
       SetLength(eiArr, eiArrCount + 1);
       eiArr[eiArrCount] := eiObj;

    end;
  end;

  eiList.list:= eiArr;
  eiList.totalCount := High(eiArr) + 1;

  if (eiList.totalCount >= 0  ) then
  begin
    TempEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    TempEstimateItem.estimate2ProjectAgreeUnlink(eiArr); // отвязка материалов от проекта договора
    actEstimate2ContractItemUpdateExecute(Sender);
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actFilterPurchaseItemTenderExecute(
  Sender: TObject);
begin
frmRQPurchaseItemTenderFilterEdit:=TfrmRQPurchaseItemTenderFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemTenderFilterObj := RQPurchaseItemTenderFilter.Create;
    SetNullIntProps(RQPurchaseItemTenderFilterObj);
    SetNullXSProps(RQPurchaseItemTenderFilterObj);

    if frmRQPurchaseItemTenderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPurchaseItemTenderFilterObj;
      actUpdatePurchaseItemTenderExecute(Sender);
    end;
  finally
    frmRQPurchaseItemTenderFilterEdit.Free;
    frmRQPurchaseItemTenderFilterEdit:=nil;
  end;
end;

procedure TfrmPlanPurchaseGroup.actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_updateExecute(
  Sender: TObject);
 var
   RQPurchaseItem2EstimateItemGroupshrt : RQPurchaseItem2EstimateItemGroupShort;
   RQPurchaseItem2EstimateItemGroupList : RQPurchaseItem2EstimateItemGroupShortList;
   TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
   i,j : Integer;
   condition : string;
   RQPurchaseItemCode: Integer;
begin

  try
     RQPurchaseItemCode := StrToInt(sgRQPurchaseItemWithoutContract.Cells[0,sgRQPurchaseItemWithoutContract.Row]);
   except
   on EConvertError do Exit;
  end;

   TempRQPurchaseItem2EstimateItem :=  HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;

   for i:=1 to sgENEstimateItem.RowCount-1 do
    begin
     sgENEstimateItem.RowColor[i] := clNone;
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
    end;
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);

   for i:=1 to sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount-1 do
    begin
     sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowColor[i] := clNone;
     for j:=0 to sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.ColCount-1 do
       sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Cells[j,i]:='';
    end;
   sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount := 2;
   sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RemoveCheckBox(1,1);

     if RQPurchaseItem2EstimateItemFilterObj = nil then
    begin
       RQPurchaseItem2EstimateItemFilterObj := RQPurchaseItem2EstimateItemFilter.Create;
       SetNullIntProps(RQPurchaseItem2EstimateItemFilterObj);
       SetNullXSProps(RQPurchaseItem2EstimateItemFilterObj);
    end;
    condition := '';

    AddCondition(condition, ' rqpurchaseitem.code = ' + IntToStr(RQPurchaseItemCode) );
    AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode not in '+
          '('+
      '	 select oi2ei.estimateitemcode'+
      '	 from net.rqorderitem2enestimttm oi2ei  , rqorderitem oi'+
      '	  where oi2ei.orderitemcode = oi.code'+
      '	  and coalesce(oi.findocid,0) <> 0'+
      '	  and oi2ei.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode'+
      '	  union'+
      '	 select e2c.estimateitemcode'+
      '	 from net.enestimateitem2contrct e2c'+
      '	  where e2c.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode'+
      '	 )');

       // не нада брать материалы в статусе "Непотрібно замовляти"
       AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode not in ( select eii.code from enestimateitem eii where eii.code = rqpurchaseitem2estmttm.estimateitemrefcode and eii.statusrefcode = '+ IntToStr( ENConsts.ENESTIMATEITEMSTATUS_UNUSED) +'  ) ' );


      if RQPurchaseItem2EstimateItemFilterObj.orderCode <> LOW_INT then
       AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode in ( select oi2ei.estimateitemcode from rqorderitem oi , rqorderitem2enestimttm oi2ei '+
                               ' where oi.statusrefcode = ' +IntToStr(enconsts.RQORDERITEM_STATUS_GOOD  ) +' and oi.orderrefcode = ' + IntToStr(RQPurchaseItem2EstimateItemFilterObj.orderCode) +
                               '   and oi.code = oi2ei.orderitemcode )' );



    RQPurchaseItem2EstimateItemFilterObj.orderBySQL := ' rqpurchaseitem.materialnamegen ';
    RQPurchaseItem2EstimateItemFilterObj.conditionSQL := condition;


    // лист с планами объектами
    //RQPurchaseItem2EstimateItemList := TempRQPurchaseItem2EstimateItem.getScrollableFilteredListEstimate( RQPurchaseItem2EstimateItemFilterObj , 0 ,-1 );
    // +++mar+++ переделка под выборку материалов сгрупированных по строке заявки или планам
    RQPurchaseItem2EstimateItemGroupList := TempRQPurchaseItem2EstimateItem.getScrollableFilteredListEstimateGroupByAsOrderItem( RQPurchaseItem2EstimateItemFilterObj , 0 ,-1 );

    if High(RQPurchaseItem2EstimateItemGroupList.list) > -1 then
      sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount := High(RQPurchaseItem2EstimateItemGroupList.list) + 2
    else
      sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount := 2;

     with sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod do
       for i := 0 to High(RQPurchaseItem2EstimateItemGroupList.list) do
       begin
        Application.ProcessMessages;

        if RQPurchaseItem2EstimateItemGroupList.list[i].orderitemСode = LOW_INT then
         Cells[0,i+1] := ''
          else
         Cells[0,i+1] := IntToStr(RQPurchaseItem2EstimateItemGroupList.list[i].orderitemСode);

        //массив стимейтов
        Objects[0,i+1] := TObject(RQPurchaseItem2EstimateItemGroupList.list[i].estimateArray);

        Cells[1,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].orderPlanNumber;
        AddCheckBox(1, i+1, false, false);

        Cells[2,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].orderPlanPeriod;
        Cells[3,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].ddsСode;
        Cells[4,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].budgetName;

        if RQPurchaseItem2EstimateItemGroupList.list[i].countfact = nil then
           Cells[5,i+1] := ''
         else
           Cells[5,i+1] := RQPurchaseItem2EstimateItemGroupList.list[i].countfact.DecimalString;

         // запишем код материала
         Objects[2,i+1] := TObject(RQPurchaseItem2EstimateItemGroupList.list[i].materialCode);
         // запишем код строки плана закупки
         Objects[3,i+1] := TObject(RQPurchaseItem2EstimateItemGroupList.list[i].purchaseitemСode );


         sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount := i + 2;
       end;

     sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Row := 1;
     //checkedCountEstimateitemWithoutContract := GetCheckedMaterialsCountFromEstimate;
     //UpdateInfoForEstimateWithoutContract();


end;

procedure TfrmPlanPurchaseGroup.actPlanPurchaseSelectAllExecute(
  Sender: TObject);
begin
  inherited;
     checkGrid(sgRQPlanPurchase, 1, true);
end;

procedure TfrmPlanPurchaseGroup.actPlanPurchaseUnSelectAllExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgRQPlanPurchase, 1, false);
end;

procedure TfrmPlanPurchaseGroup.actPurchaseItemChangePlanTypeExecute(
  Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin

 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObjForChangeType := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmChangePlanPurchaseItemType :=TfrmChangePlanPurchaseItemType.Create(Application, dsEdit);
  try
    if frmChangePlanPurchaseItemType.ShowModal= mrOk then
      begin
        actUpdatePurchaseItemExecute(Sender);
      end;
  finally
    frmChangePlanPurchaseItemType.Free;
    frmChangePlanPurchaseItemType:=nil;
  end;

end;


procedure TfrmPlanPurchaseGroup.actPurchaseItemTenderCheckAllExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgRQPurchaseItemTender, 2, true);
end;

procedure TfrmPlanPurchaseGroup.actPurchaseItemTenderUnCheckAllExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgRQPurchaseItemTender, 2, false);
end;

procedure TfrmPlanPurchaseGroup.actPurchaseItemViewExecute(Sender: TObject);
Var
 TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
 TempRQplanPurchase: RQPlanPurchaseControllerSoapPort;
 rqplanpourchaseobject : RQPlanPurchase;
begin

 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;

 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;

  rqplanpourchaseobject := TempRQPlanPurchase.getObject(RQPurchaseItemObj.purchaseRef.code);

  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsView);
  frmRQPurchaseItemEdit.statusPurchase := rqplanpourchaseobject.statusRef.code;
  try
    frmRQPurchaseItemEdit.ShowModal;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
end;


procedure TfrmPlanPurchaseGroup.actPurchaseItemWithoutContractViewExecute(
  Sender: TObject);
Var
 TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
 TempRQplanPurchase: RQPlanPurchaseControllerSoapPort;
 rqplanpourchaseobject : RQPlanPurchase;
begin

 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;

 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItemWithoutContract.Cells[0,sgRQPurchaseItemWithoutContract.Row]));
   except
   on EConvertError do Exit;
  end;

  rqplanpourchaseobject := TempRQPlanPurchase.getObject(RQPurchaseItemObj.purchaseRef.code);

  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsView);
  frmRQPurchaseItemEdit.statusPurchase := rqplanpourchaseobject.statusRef.code;
  try
    frmRQPurchaseItemEdit.ShowModal;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractCheckAllExecute(
  Sender: TObject);
begin
  inherited;
   checkGrid(sgENEstimateItem, 1, true);
   checkedCountEstimateitemWithoutContract := GetCheckedMaterialsCountFromEstimate;
   checkedCountGroupMaterialWithoutContract := 0;
   UpdateInfoForEstimateWithoutContract();
end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractLink2ContractExecute(
  Sender: TObject);
var
  slectedEiItemForAdd2Specification : Boolean;
  i , j : Integer;
  eiList : ENEstimateItemShortList;
  eiObj : ENEstimateItemShort;
  eiArr : ArrayOfENEstimateItemShort;
  eiArrCount : Integer;
  TempEstimateItem : ENEstimateItemControllerSoapPort;
  enContractCode : Integer;
  countFreeMaterialInContract : Double;
begin
  slectedEiItemForAdd2Specification := false;

  enContractCode := LOW_INT;
  countFreeMaterialInContract := 0;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, slectedEiItemForAdd2Specification);
    if slectedEiItemForAdd2Specification then break;
  end;
  if not slectedEiItemForAdd2Specification then
  begin
    Application.MessageBox(PChar('Не обрані строки матеріалу з планів для зв`язки з договором !'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний договор !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;

  end;

  if ( Integer(sgENEstimateItem.Objects[2,sgENEstimateItem.Row]) <> Integer(sgENContractItem.Objects[1,sgENContractItem.Row]) )  then
  begin
    Application.MessageBox(PChar('По договору оберіть строку з таким же матеріалом який обраний для прив`язки !!!'),PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  countFreeMaterialInContract := strtofloat(sgENContractItem.Cells[3,sgENContractItem.Row]);
  if (checkedCountEstimateitemWithoutContract >  countFreeMaterialInContract) then
  begin
    Application.MessageBox(PChar('Обрана кількість матеріалу без договорів перевищує доступну кількість по договорному матеріалу !!!'),PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;




  eiList := ENEstimateItemShortList.Create;
  eiList.totalCount := 0;
  slectedEiItemForAdd2Specification := false;


    for i := 1 to sgENEstimateItem.RowCount - 1 do
    begin
      sgENEstimateItem.GetCheckBoxState(1, i, slectedEiItemForAdd2Specification);
      if slectedEiItemForAdd2Specification then
      begin
         eiObj := ENEstimateItemShort.Create;
         SetNullIntProps(eiObj);
         SetNullXSProps(eiObj);
         eiObj.code := Integer(sgENEstimateItem.Objects[1,i]) ; // StrToInt(sgENEstimateItem.Cells[0, i]);
         eiObj.enContractCode := enContractCode;
         eiObj.countFact := TXSDecimal.Create;
         eiObj.countFact.DecimalString := sgENEstimateItem.Cells[2,i]; // кількість брать та  что с плана
         eiObj.materialRefCode := Integer(sgENEstimateItem.Objects[2,i]); // код материала
         eiObj.purchaseItem2EstimateitemCode := StrToInt( sgENEstimateItem.Cells[0, i]);  // код связки rqpurchaseitem2enestimateitem
         eiArrCount := High(eiArr) + 1;
         SetLength(eiArr, eiArrCount + 1);
         eiArr[eiArrCount] := eiObj;

      end;
    end;

  eiList.list:= eiArr;
  eiList.totalCount := High(eiArr) + 1;

  if (eiList.totalCount >= 0  ) then
  begin
    TempEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    TempEstimateItem.estimateWithoutContractLink2Contract(eiArr , StrToInt(sgENContractItem.Cells[0,sgENContractItem.Row]));
    //+++mar+++ пока материалы детально не будем обновлять !!! actEstimateWithoutContractUpdateExecute(Sender);
    actEncontractItemUpdateExecute(Sender);
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractNoFilterExecute(
  Sender: TObject);
begin
  inherited;
  RQPurchaseItem2EstimateItemFilterObj.Free;
  RQPurchaseItem2EstimateItemFilterObj := nil;
  actEstimateWithoutContractUpdateExecute(Sender);
end;

procedure TfrmPlanPurchaseGroup.actEstimateWithContractUnLink2ContractExecute(
  Sender: TObject);
var
  selectedEiForRemoveFromSpecification : Boolean;
  i , j : Integer;
  eiList : ENEstimateItemShortList;
  eiObj : ENEstimateItemShort;
  eiArr : ArrayOfENEstimateItemShort;
  eiArrCount : Integer;
  TempEstimateItem : ENEstimateItemControllerSoapPort;
  enContractCode : Integer;
begin
  selectedEiForRemoveFromSpecification := false;

  enContractCode := LOW_INT;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


  for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
  begin
    sgENEstimateItemInContract.GetCheckBoxState(1, i, selectedEiForRemoveFromSpecification);
    if selectedEiForRemoveFromSpecification then break;
  end;
  if not selectedEiForRemoveFromSpecification then
  begin
    Application.MessageBox(PChar('Не обрані прив`язані строки матеріалу до договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний договор !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  eiList := ENEstimateItemShortList.Create;
  eiList.totalCount := 0;
  selectedEiForRemoveFromSpecification := false;

  for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
  begin
    sgENEstimateItemInContract.GetCheckBoxState(1, i, selectedEiForRemoveFromSpecification);
    if selectedEiForRemoveFromSpecification then
    begin
       eiObj := ENEstimateItemShort.Create;
       SetNullIntProps(eiObj);
       SetNullXSProps(eiObj);
       eiObj.code :=  StrToInt( sgENEstimateItemInContract.Cells[0 , i]) ; // код естимейта
       eiObj.enContractCode := enContractCode;
       eiObj.materialRefCode := Integer(sgENContractItem.Objects[1,sgENContractItem.Row]) ; // код материала
       eiObj.purchaseItem2EstimateitemCode := Integer(sgENEstimateItemInContract.Objects[0,i]);  // код связки rqpurchaseitem2enestimateitem
       eiArrCount := High(eiArr) + 1;
       SetLength(eiArr, eiArrCount + 1);
       eiArr[eiArrCount] := eiObj;

    end;
  end;

  eiList.list:= eiArr;
  eiList.totalCount := High(eiArr) + 1;

  if (eiList.totalCount >= 0  ) then
  begin
    TempEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    TempEstimateItem.EstimateWithContractUnLink2Contract(eiArr); // отвязка материалов от проекта договора
    if chkAutoUpdateEstimate2ContractItem.Checked = True then
       actEstimate2ContractItemUpdateExecute(Sender);
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractAdd2SpecificationExecute(
  Sender: TObject);
var
  slectedEiItemForAdd2Specification : Boolean;
  i , j : Integer;
  eiList : ENEstimateItemShortList;
  eiObj : ENEstimateItemShort;
  eiArr : ArrayOfENEstimateItemShort;
  eiArrCount : Integer;
  TempEstimateItem : ENEstimateItemControllerSoapPort;
  enContractCode : Integer;
begin
  slectedEiItemForAdd2Specification := false;

  enContractCode := LOW_INT;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, slectedEiItemForAdd2Specification);
    if slectedEiItemForAdd2Specification then break;
  end;
  if not slectedEiItemForAdd2Specification then
  begin
    Application.MessageBox(PChar('Не обрані строки матеріалу з планів для додавання у специфікацію!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний проект договору !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  eiList := ENEstimateItemShortList.Create;
  eiList.totalCount := 0;
  slectedEiItemForAdd2Specification := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, slectedEiItemForAdd2Specification);
    if slectedEiItemForAdd2Specification then
    begin
       eiObj := ENEstimateItemShort.Create;
       SetNullIntProps(eiObj);
       SetNullXSProps(eiObj);
       eiObj.code := Integer(sgENEstimateItem.Objects[1,i]) ; // StrToInt(sgENEstimateItem.Cells[0, i]);
       eiObj.enContractCode := enContractCode;
       eiObj.materialRefCode := Integer(sgENEstimateItem.Objects[2,i]); // код материала
       eiObj.purchaseItem2EstimateitemCode := StrToInt( sgENEstimateItem.Cells[0, i]);  // код связки rqpurchaseitem2enestimateitem
       eiArrCount := High(eiArr) + 1;
       SetLength(eiArr, eiArrCount + 1);
       eiArr[eiArrCount] := eiObj;

    end;
  end;

  eiList.list:= eiArr;
  eiList.totalCount := High(eiArr) + 1;

  if (eiList.totalCount >= 0  ) then
  begin
    TempEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    TempEstimateItem.estimateWithoutContractAdd2SpecificationExecute(eiArr);
    actEstimateWithoutContractUpdateExecute(Sender);
    actEncontractItemUpdateExecute(Sender);
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractUnCheckAllExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgENEstimateItem, 1, false);
  checkedCountEstimateitemWithoutContract := GetCheckedMaterialsCountFromEstimate;
  UpdateInfoForEstimateWithoutContract();
end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractUpdateExecute(
  Sender: TObject);
  var
   RQPurchaseItem2EstimateItemList : RQPurchaseItem2EstimateItemShortListLite;
   TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
   i,j : Integer;
   condition : string;
   RQPurchaseItemCode: Integer;
   estimatearray : ArrayOfString;
begin




  try
     RQPurchaseItemCode := StrToInt(sgRQPurchaseItemWithoutContract.Cells[0,sgRQPurchaseItemWithoutContract.Row]);
   except
   on EConvertError do Exit;
  end;

      TempRQPurchaseItem2EstimateItem :=  HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;

   for i:=1 to sgENEstimateItem.RowCount-1 do
    begin
     sgENEstimateItem.RowColor[i] := clNone;
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
    end;
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);

     if RQPurchaseItem2EstimateItemFilterObj = nil then
    begin
       RQPurchaseItem2EstimateItemFilterObj := RQPurchaseItem2EstimateItemFilter.Create;
       SetNullIntProps(RQPurchaseItem2EstimateItemFilterObj);
       SetNullXSProps(RQPurchaseItem2EstimateItemFilterObj);
    end;
    condition := '';

    AddCondition(condition, ' rqpurchaseitem.code = ' + IntToStr(RQPurchaseItemCode) );
    AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode not in '+
          '('+
      '	 select oi2ei.estimateitemcode'+
      '	 from net.rqorderitem2enestimttm oi2ei  , rqorderitem oi'+
      '	  where oi2ei.orderitemcode = oi.code'+
      '	  and coalesce(oi.findocid,0) <> 0'+
      '	  and oi2ei.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode'+
      '	  union'+
      '	 select e2c.estimateitemcode'+
      '	 from net.enestimateitem2contrct e2c'+
      '	  where e2c.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode'+
      '	 )');

        // не нада брать материалы в статусе "Непотрібно замовляти"
       AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode not in ( select eii.code from enestimateitem eii where eii.code = rqpurchaseitem2estmttm.estimateitemrefcode and eii.statusrefcode = '+ IntToStr( ENConsts.ENESTIMATEITEMSTATUS_UNUSED) +'  ) ' );


      if RQPurchaseItem2EstimateItemFilterObj.orderCode <> LOW_INT then
       AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode in ( select oi2ei.estimateitemcode from rqorderitem oi , rqorderitem2enestimttm oi2ei '+
                               ' where oi.statusrefcode = ' +IntToStr(enconsts.RQORDERITEM_STATUS_GOOD  ) +' and oi.orderrefcode = ' + IntToStr(RQPurchaseItem2EstimateItemFilterObj.orderCode) +
                               '   and oi.code = oi2ei.orderitemcode )' );



       // фильтр материалов детально по массиву эстимейтов из поля грида сгрупированного
     //  SetLength(estimatearray, 1);
      //estimatearray[0] := sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[0,sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Row];
     //  AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode in ( ' +  IntToStr(Integer(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[0,sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Row])) + ' ) ' );
         //  := 'phonebook.code = ANY(''{' + IntArrayToStr(DFDocAppealObj.doc.phoneCodes) + '}'')';
  // Integer(sgRQOrderItem.Objects[1, i]);

  // AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode = ANY(''{' +
  // sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[0,sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Row].ToString
  //  + '}'')' ) ;

  //attachmentCode := Integer(sgDFDocAttachment2Stamp.Objects[0, sgDFDocAttachment2Stamp.Row]);

  // tezzzt
         AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode = ANY(''{'
         +  StringArrayToString (
               ArrayOfString(
                    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[0,sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Row]
                  )
                )
           + '}'')'
          );

    RQPurchaseItem2EstimateItemFilterObj.orderBySQL := ' rqpurchaseitem.materialnamegen ';
//    if RQPurchaseItem2EstimateItemFilterObj.conditionSQL<>'' then
//    AddCondition(condition, RQPurchaseItem2EstimateItemFilterObj.conditionSQL );

    RQPurchaseItem2EstimateItemFilterObj.conditionSQL := condition;


    // лист с планами объектами
    RQPurchaseItem2EstimateItemList := TempRQPurchaseItem2EstimateItem.getScrollableFilteredListEstimate( RQPurchaseItem2EstimateItemFilterObj , 0 ,-1 );

    if High(RQPurchaseItem2EstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(RQPurchaseItem2EstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(RQPurchaseItem2EstimateItemList.list) do
       begin
        // Application.ProcessMessages;

         if RQPurchaseItem2EstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(RQPurchaseItem2EstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := RQPurchaseItem2EstimateItemList.list[i].purchaseItemRefMaterialNameGen;
         // if ( StrToFloat(RQPurchaseItem2EstimateItemList.list[i].countPurchase.DecimalString ) > 0 ) then
           AddCheckBox(1, i+1, false, false);
           Objects[1,i+1] := TObject(RQPurchaseItem2EstimateItemList.list[i].estimateItemRefCode);

         // красим строки замещенные в желтый
         if RQPurchaseItem2EstimateItemList.list[i].purchaseItem2EstimateItemStatusRefCode
           = ENConsts.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_REPLACEMENT then
             RowColor[i+1] := clYellow;
         // красим строки высвобожденные в аква
         if RQPurchaseItem2EstimateItemList.list[i].purchaseItem2EstimateItemStatusRefCode
           = ENConsts.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FREED then
             RowColor[i+1] := clAqua;
         // красим строки по которым отменили попадание кол-ва countPurchase в закупки
         if RQPurchaseItem2EstimateItemList.list[i].purchaseItem2EstimateItemStatusRefCode
           = ENConsts.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_ONLY then
             RowColor[i+1] := clRed;


         if RQPurchaseItem2EstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := RQPurchaseItem2EstimateItemList.list[i].countGen.DecimalString;
           // запишем код материала
           Objects[2,i+1] := TObject(RQPurchaseItem2EstimateItemList.list[i].materialCode);

         if RQPurchaseItem2EstimateItemList.list[i].countPurchase = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := RQPurchaseItem2EstimateItemList.list[i].countPurchase.DecimalString;

         Cells[4,i+1] := RQPurchaseItem2EstimateItemList.list[i].purchaseItemRefMeasurementNameGen;
         Cells[5,i+1] := RQPurchaseItem2EstimateItemList.list[i].depName;

         Cells[6,i+1] := RQPurchaseItem2EstimateItemList.list[i].objInv;
         Cells[7,i+1] := RQPurchaseItem2EstimateItemList.list[i].objName;
         Cells[8,i+1] := RQPurchaseItem2EstimateItemList.list[i].periodPlan;

         Cells[9,i+1] := RQPurchaseItem2EstimateItemList.list[i].enplanworkTypeName;
         Cells[10,i+1] := RQPurchaseItem2EstimateItemList.list[i].enplanworkStateName;

         Cells[11,i+1] := RQPurchaseItem2EstimateItemList.list[i].techkartnumber;
         Cells[12,i+1] := RQPurchaseItem2EstimateItemList.list[i].techkartname;

         //Cells[13,i+1] := RQPurchaseItem2EstimateItemList.list[i].contractnumber;

         //Cells[14,i+1] := RQPurchaseItem2EstimateItemList.list[i].order_info;





         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;
     checkedCountEstimateitemWithoutContract := GetCheckedMaterialsCountFromEstimate;
     UpdateInfoForEstimateWithoutContract();

//     RQPurchaseItem2EstimateItemFilterObj.Free;
//     RQPurchaseItem2EstimateItemFilterObj := nil;
end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractFilterExecute(
  Sender: TObject);
begin
 frmRQPurchaseItem2EstimateItemFilterEdit:=TfrmRQPurchaseItem2EstimateItemFilterEdit.Create(Application, dsEdit);
 frmRQPurchaseItem2EstimateItemFilterEdit.Caption:= 'Фільтр матеріали без договорів ';
  try
    RQPurchaseItem2EstimateItemFilterObj := RQPurchaseItem2EstimateItemFilter.Create;
    SetNullIntProps(RQPurchaseItem2EstimateItemFilterObj);
    SetNullXSProps(RQPurchaseItem2EstimateItemFilterObj);


    if frmRQPurchaseItem2EstimateItemFilterEdit.ShowModal = mrOk then
    begin
      RQPurchaseItem2EstimateItemFilterObj := RQPurchaseItem2EstimateItemFilterObj;
      actEstimateWithoutContractUpdateExecute(Sender);
    end;
  finally
    frmRQPurchaseItem2EstimateItemFilterEdit.Free;
    frmRQPurchaseItem2EstimateItemFilterEdit:=nil;
  end;


end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractGroupAdd2SpecificationExecute(
  Sender: TObject);
var
  selectedEiItemGroupForAdd2Specification : Boolean;
  i , j : Integer;
  eiGroupList : RQPurchaseItem2EstimateItemGroupShortList;
  eiGroupObj : RQPurchaseItem2EstimateItemGroupShort;
  eiGroupArr : ArrayOfRQPurchaseItem2EstimateItemGroupShort;
  eiGroupArrCount : Integer;
  TempRQpurchaseItem2Enestimateitem : RQPurchaseItem2EstimateItemControllerSoapPort;
  enContractCode : Integer;
begin
  selectedEiItemGroupForAdd2Specification := false;

  enContractCode := LOW_INT;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


  for i := 1 to sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount - 1 do
  begin
    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.GetCheckBoxState(1, i, selectedEiItemGroupForAdd2Specification);
    if selectedEiItemGroupForAdd2Specification then break;
  end;
  if not selectedEiItemGroupForAdd2Specification then
  begin
    Application.MessageBox(PChar('Не обрані строки матеріалу з планів для додавання у специфікацію!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний проект договору !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  eiGroupList := RQPurchaseItem2EstimateItemGroupShortList.Create;
  eiGroupList.totalCount := 0;
  selectedEiItemGroupForAdd2Specification := false;

  for i := 1 to sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount - 1 do
  begin
    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.GetCheckBoxState(1, i, selectedEiItemGroupForAdd2Specification);
    if selectedEiItemGroupForAdd2Specification then
    begin
       eiGroupObj := RQPurchaseItem2EstimateItemGroupShort.Create;
       SetNullIntProps(eiGroupObj);
       SetNullXSProps(eiGroupObj);
      if (sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Cells[0,i] <> '' ) then
       begin
        eiGroupObj.orderitemСode := StrToInt(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Cells[0,i] );
       end
      else
       eiGroupObj.orderitemСode := Low(Integer);

       eiGroupObj.enContractCode := enContractCode;
       eiGroupObj.materialCode := Integer(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[2,i]); // код материала
       eiGroupObj.purchaseitemСode := Integer(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[3,i]);  // код строки плана закупки
       eiGroupObj.estimatearray :=  ArrayOfString(
                    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[0,i]
                  );


       eiGroupArrCount := High(eiGroupArr) + 1;
       SetLength(eiGroupArr, eiGroupArrCount + 1);
       eiGroupArr[eiGroupArrCount] := eiGroupObj;

    end;
  end;

  eiGroupList.list:= eiGroupArr;
  eiGroupList.totalCount := High(eiGroupArr) + 1;

  if (eiGroupList.totalCount >= 0  ) then
  begin
    TempRQpurchaseItem2Enestimateitem := HTTPRIORQPurchaseItem2EstimateItem  as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQpurchaseItem2Enestimateitem.estimateGroupWithoutContractAdd2Specification(eiGroupArr);

    actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_updateExecute(Sender);
    actEncontractItemUpdateExecute(Sender);

  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractGroupCheckAllExecute(
  Sender: TObject);
begin
  inherited;
   checkGrid(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod, 1, true);
   checkedCountEstimateitemWithoutContract := GetCheckedMaterialsCountFromEstimate;
   checkedCountGroupMaterialWithoutContract := 0;
   UpdateInfoForEstimateWithoutContract();
end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractGroupLink2ContractExecute(
  Sender: TObject);
var
  selectedEiItemGroupForAdd2Contract : Boolean;
  i , j : Integer;
  eiGroupList : RQPurchaseItem2EstimateItemGroupShortList;
  eiGroupObj : RQPurchaseItem2EstimateItemGroupShort;
  eiGroupArr : ArrayOfRQPurchaseItem2EstimateItemGroupShort;
  eiGroupArrCount : Integer;
  TempEstimateItem : ENEstimateItemControllerSoapPort;
  enContractCode : Integer;
  countFreeMaterialInContract : Double;
  TempRQpurchaseItem2Enestimateitem : RQPurchaseItem2EstimateItemControllerSoapPort;
begin
  selectedEiItemGroupForAdd2Contract := false;

  enContractCode := LOW_INT;
  countFreeMaterialInContract := 0;

  try
    enContractCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
  except on EConvertError do Exit;
  end;


   for i := 1 to sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount - 1 do
  begin
    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.GetCheckBoxState(1, i, selectedEiItemGroupForAdd2Contract);
    if selectedEiItemGroupForAdd2Contract then break;
  end;
  if not selectedEiItemGroupForAdd2Contract then
  begin
    Application.MessageBox(PChar('Не обрані сгруповані строки матеріалу з планів для додавання у специфікацію!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if enContractCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Не обраний договор !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;

  end;

  if ( Integer(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[2,sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Row])
     <> Integer(sgENContractItem.Objects[1,sgENContractItem.Row]) )  then
  begin
    Application.MessageBox(PChar('По договору оберіть строку з таким же матеріалом який обраний для прив`язки !!!'),PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  countFreeMaterialInContract := strtofloat(sgENContractItem.Cells[3,sgENContractItem.Row]);
  if (checkedCountEstimateitemWithoutContract >  countFreeMaterialInContract) then
  begin
    Application.MessageBox(PChar('Обрана кількість матеріалу без договорів перевищує доступну кількість по договорному матеріалу !!!'),PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;


  eiGroupList := RQPurchaseItem2EstimateItemGroupShortList.Create;
  eiGroupList.totalCount := 0;
  selectedEiItemGroupForAdd2Contract := false;


    for i := 1 to sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount - 1 do
    begin
      sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.GetCheckBoxState(1, i, selectedEiItemGroupForAdd2Contract);
      if selectedEiItemGroupForAdd2Contract then
      begin
         eiGroupObj := RQPurchaseItem2EstimateItemGroupShort.Create;
         SetNullIntProps(eiGroupObj);
         SetNullXSProps(eiGroupObj);
         if (sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Cells[0,i] <> '' ) then
         begin
          eiGroupObj.orderitemСode := StrToInt(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Cells[0,i] );
         end
         else
         eiGroupObj.orderitemСode := Low(Integer);

         eiGroupObj.enContractCode := enContractCode;
         eiGroupObj.materialCode := Integer(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[2,i]); // код материала
         eiGroupObj.purchaseitemСode := Integer(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[3,i]);  // код строки плана закупки
         eiGroupObj.estimatearray :=  ArrayOfString(
                    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Objects[0,i]
                  );


         eiGroupArrCount := High(eiGroupArr) + 1;
         SetLength(eiGroupArr, eiGroupArrCount + 1);
         eiGroupArr[eiGroupArrCount] := eiGroupObj;

      end;
    end;

   eiGroupList.list:= eiGroupArr;
   eiGroupList.totalCount := High(eiGroupArr) + 1;

  if (eiGroupList.totalCount >= 0  ) then
  begin
    TempRQpurchaseItem2Enestimateitem := HTTPRIORQPurchaseItem2EstimateItem  as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQpurchaseItem2Enestimateitem.estimateGroupWithoutContractAdd2Contract(eiGroupArr , StrToInt(sgENContractItem.Cells[0,sgENContractItem.Row]) );

    actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_updateExecute(Sender);
    actEncontractItemUpdateExecute(Sender);
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmPlanPurchaseGroup.actEstimateWithoutContractGroupUnCheckAllExecute(
  Sender: TObject);
begin
  inherited;
  inherited;
  checkGrid(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod, 1, false);
  checkedCountEstimateitemWithoutContract := GetCheckedMaterialsCountFromEstimate;
  UpdateInfoForEstimateWithoutContract();
end;

procedure TfrmPlanPurchaseGroup.actUpdatePlanPurchaseAndCnangeForPurchaseExecute(
  Sender: TObject);
Var i, j , a: Integer;
  TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  RQPlanPurchaseList: RQPlanPurchaseShortList;
  FilterRqplanPurchase :  RQPlanPurchaseFilter;
begin
 for a:=1 to sgRQPlanPurchase.RowCount-1 do
   for j:=0 to sgRQPlanPurchase.ColCount-1 do
     begin
       sgRQPlanPurchase.Cells[j,a]:='';
       sgRQPlanPurchase.RemoveCheckBox(1,a);
     end;

    ColCountPlanPurchase:=10000;
    TempRQPlanPurchase :=  HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;


     FilterRqplanPurchase := RQPlanPurchaseFilter.Create;
     SetNullIntProps(FilterRqplanPurchase);
     SetNullXSProps(FilterRqplanPurchase);


//     RQPlanPurchaseFilter(FilterRqplanPurchase).kindRef := RQPlanPurchaseKindRef.Create;
//     RQPlanPurchaseFilter(FilterRqplanPurchase).kindRef.code := ENConsts.RQPLANPURCHASE_KIND_PLAN_PURCHASE;
     RQPlanPurchaseFilter(FilterRqplanPurchase).yearGen := StrToInt(edtYearGen.Text);
     RQPlanPurchaseFilter(FilterRqplanPurchase).orderBySQL := ' rqplanpurchase.kindrefcode , rqplanpurchase.dateadd ';

  RQPlanPurchaseList := TempRQPlanPurchase.getScrollableFilteredList(RQPlanPurchaseFilter(FilterRqplanPurchase),0,ColCountPlanPurchase);


  LastCountPlanPurchase:=High(RQPlanPurchaseList.list);

  if LastCountPlanPurchase > -1 then
     sgRQPlanPurchase.RowCount:=LastCountPlanPurchase+2
  else
     sgRQPlanPurchase.RowCount:=2;

   with sgRQPlanPurchase do
    for i:=0 to LastCountPlanPurchase do
      begin
        Application.ProcessMessages;
        if RQPlanPurchaseList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPurchaseList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPlanPurchaseList.list[i].name;

        if RadioGroup1.ItemIndex = 0 then  // если выбираем по нескольким строкам
        AddCheckBox(1, i+1, false, false);

        if RQPlanPurchaseList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(RQPlanPurchaseList.list[i].yearGen);

        Cells[3,i+1] := RQPlanPurchaseList.list[i].commentGen;

        if RQPlanPurchaseList.list[i].dateAdd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateAdd);

        if RQPlanPurchaseList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateEdit);
        Cells[6,i+1] := RQPlanPurchaseList.list[i].userAdd;
        Cells[7,i+1] := RQPlanPurchaseList.list[i].userEdit;
        Cells[8,i+1] := RQPlanPurchaseList.list[i].statusRefName;
        LastRowPlanPurchase:=i+1;
        sgRQPlanPurchase.RowCount:=LastRowPlanPurchase+1;
      end;
   ColCountPlanPurchase:=ColCountPlanPurchase+1;
   sgRQPlanPurchase.Row:=1;


end;

procedure TfrmPlanPurchaseGroup.actUpdatePurchaseItemExecute(Sender: TObject);
var
  i, lastCount , lastrow  , a , j  , LastRowPurchaseItem : Integer;
  plp : Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  selectedPlanPurchase , selectedPurchaseItemTender : Boolean;
  strPlanpurchaseCodes  , strPurchaseItemTenderCodes : string;
  condition: String;
  PurchaseItemFilter : RQPurchaseItemFilter;
begin

  ClearGrid(sgRQPurchaseItem);

  for a:=1 to sgRQPurchaseItem.RowCount-1 do
   for j:=0 to sgRQPurchaseItem.ColCount-1 do
    begin
     sgRQPurchaseItem.Cells[j,a]:='';
     //sgRQPurchaseItem.RemoveCheckBox(1,a);
    end;

  selectedPlanPurchase := false;
  selectedPurchaseItemTender := false;

  for plp := 1 to sgRQPlanPurchase.RowCount - 1 do
  begin
    sgRQPlanPurchase.GetCheckBoxState(1, plp, selectedPlanPurchase);
    if selectedPlanPurchase then break;
  end;

   if not selectedPlanPurchase then
  begin
    Application.MessageBox(PChar('Оберіть річний план, або зміни до нього !'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  //////////////////////
  for plp := 1 to sgRQPurchaseItemTender.RowCount - 1 do
  begin
    sgRQPurchaseItemTender.GetCheckBoxState(2, plp, selectedPurchaseItemTender);
    if selectedPurchaseItemTender then break;
  end;

   if not selectedPurchaseItemTender then
  begin
    Application.MessageBox(PChar('Оберіть предмет закупівлі !'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  // собираем строку с кодами годового плана или изменений к нему для фильтра строк предметов закупки
  selectedPlanPurchase := false;
  strPlanpurchaseCodes := '';

   for plp := 1 to sgRQPlanPurchase.RowCount - 1 do
  begin
    sgRQPlanPurchase.GetCheckBoxState(1, plp, selectedPlanPurchase);
    if selectedPlanPurchase then
    begin
       if strPlanpurchaseCodes = '' then
       strPlanpurchaseCodes := sgRQPlanPurchase.Cells[0, plp]
       else
       strPlanpurchaseCodes := strPlanpurchaseCodes + ','+sgRQPlanPurchase.Cells[0, plp];

    end;
  end;

  selectedPurchaseItemTender := false;
  strPurchaseItemTenderCodes := '';
  // собираем  строку с кодами строк предметов закупки (planpurchaseitemtender)
  for plp := 1 to sgRQPurchaseItemTender.RowCount - 1 do
  begin
    sgRQPurchaseItemTender.GetCheckBoxState(2, plp, selectedPurchaseItemTender);
    if selectedPurchaseItemTender then
    begin
       if strPurchaseItemTenderCodes = '' then
       strPurchaseItemTenderCodes := sgRQPurchaseItemTender.Cells[0, plp]
       else
       strPurchaseItemTenderCodes := strPurchaseItemTenderCodes + ','+sgRQPurchaseItemTender.Cells[0, plp];

    end;
  end;                             
  ///////////////

  TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;


     PurchaseItemFilter := RQPurchaseItemFilter.Create;
     SetNullIntProps(PurchaseItemFilter);
     SetNullXSProps(PurchaseItemFilter);

  condition := '';
  AddCondition(condition, ' rqpurchaseitem.purchaserefcode in (  ' + strPlanpurchaseCodes + ')' );
  AddCondition(condition, ' rqpurchaseitem.code in ( '+
                          ' select pti2pi.purchaseitemrefcode from rqprchstmtndr2rqprchst pti2pi '+
                          ' where pti2pi.purchaseitemtenderrfcd in ( '+ strPurchaseItemTenderCodes +' )) '
               );

  PurchaseItemFilter.orderBySQL := ' rqpurchaseitem.materialnamegen ';
  PurchaseItemFilter.conditionSQL := condition;
  RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredList(PurchaseItemFilter,0,-1);

  LastCount := High(RQPurchaseItemList.list);

 if LastCount > -1 then
     sgRQPurchaseItem.RowCount:=LastCount+2
  else
     sgRQPurchaseItem.RowCount:=2;

   with sgRQPurchaseItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQPurchaseItemList.list[i].purchaseRefName;

        Cells[2,i+1] := RQPurchaseItemList.list[i].identid2010;
        Cells[3,i+1] := RQPurchaseItemList.list[i].identid2015;

        Cells[4,i+1] := RQPurchaseItemList.list[i].materialNameGen;

        Cells[5,i+1] := RQPurchaseItemList.list[i].measurementNameGen;

         if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQPurchaseItemList.list[i].countGen.DecimalString;

        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;


          if RQPurchaseItemList.list[i].pricePurchaseWithNds = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQPurchaseItemList.list[i].pricePurchaseWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countPurchase = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := RQPurchaseItemList.list[i].countPurchase.DecimalString;

        if RQPurchaseItemList.list[i].sumPurchaseWithNds = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := RQPurchaseItemList.list[i].sumPurchaseWithNds.DecimalString;



        Cells[12,i+1] := RQPurchaseItemList.list[i].purchaseItemTypeRefName;
        //не менять
        Objects[12,i+1] := TObject(RQPurchaseItemList.list[i].purchaseItemTypeRefCode);// код типа закупки

        Cells[13,i+1] := RQPurchaseItemList.list[i].userGen;
        //Cells[9,i+1] := RQPurchaseItemList.list[i].commentGen;
        Cells[14,i+1] := RQPurchaseItemList.list[i].objectsName;  // названия объектов в строке
        LastRowPurchaseItem:=i+1;
        sgRQPurchaseItem.RowCount:=LastRowPurchaseItem+1;
      end;
   sgRQPurchaseItem.Row:=1;
end;



procedure TfrmPlanPurchaseGroup.actUpdatePurchaseItemWithoutContractExecute(Sender: TObject);
var
  i, lastCount , lastrow  , a , j  , LastRowPurchaseItem : Integer;
  plp : Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  selectedPlanPurchase , selectedPurchaseItemTender : Boolean;
  strPlanpurchaseCodes  , strPurchaseItemTenderCodes : string;
  condition: String;
  PurchaseItemFilter : RQPurchaseItemFilter;
begin

  ClearGrid(sgRQPurchaseItemWithoutContract);

  for a:=1 to sgRQPurchaseItemWithoutContract.RowCount-1 do
   for j:=0 to sgRQPurchaseItemWithoutContract.ColCount-1 do
    begin
     sgRQPurchaseItemWithoutContract.Cells[j,a]:='';
     //sgRQPurchaseItem.RemoveCheckBox(1,a);
    end;

  selectedPlanPurchase := false;
  selectedPurchaseItemTender := false;

  for plp := 1 to sgRQPlanPurchase.RowCount - 1 do
  begin
    sgRQPlanPurchase.GetCheckBoxState(1, plp, selectedPlanPurchase);
    if selectedPlanPurchase then break;
  end;

   if not selectedPlanPurchase then
  begin
    Application.MessageBox(PChar('Оберіть річний план, або зміни до нього !'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  //////////////////////
  for plp := 1 to sgRQPurchaseItemTender.RowCount - 1 do
  begin
    sgRQPurchaseItemTender.GetCheckBoxState(2, plp, selectedPurchaseItemTender);
    if selectedPurchaseItemTender then break;
  end;

  if not selectedPurchaseItemTender then
  begin
    Application.MessageBox(PChar('Оберіть предмет закупівлі !'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  // собираем строку с кодами годового плана или изменений к нему для фильтра строк предметов закупки
  selectedPlanPurchase := false;
  strPlanpurchaseCodes := '';

  for plp := 1 to sgRQPlanPurchase.RowCount - 1 do
  begin
    sgRQPlanPurchase.GetCheckBoxState(1, plp, selectedPlanPurchase);
    if selectedPlanPurchase then
    begin

      if (sgRQPlanPurchase.Cells[0, plp] = '') then
        raise Exception.Create('Дождитесь пока форма полностью заполнится!');

      if strPlanpurchaseCodes = '' then
        strPlanpurchaseCodes := sgRQPlanPurchase.Cells[0, plp]
      else
        strPlanpurchaseCodes := strPlanpurchaseCodes + ','+sgRQPlanPurchase.Cells[0, plp];
    end;
  end;

  selectedPurchaseItemTender := false;
  strPurchaseItemTenderCodes := '';
  // собираем  строку с кодами строк предметов закупки (planpurchaseitemtender)
  for plp := 1 to sgRQPurchaseItemTender.RowCount - 1 do
  begin
    sgRQPurchaseItemTender.GetCheckBoxState(2, plp, selectedPurchaseItemTender);
    if selectedPurchaseItemTender then
    begin
       if strPurchaseItemTenderCodes = '' then
       strPurchaseItemTenderCodes := sgRQPurchaseItemTender.Cells[0, plp]
       else
       strPurchaseItemTenderCodes := strPurchaseItemTenderCodes + ','+sgRQPurchaseItemTender.Cells[0, plp];

    end;
  end;
  ///////////////

  TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;


     PurchaseItemFilter := RQPurchaseItemFilter.Create;
     SetNullIntProps(PurchaseItemFilter);
     SetNullXSProps(PurchaseItemFilter);

  condition := '';
  AddCondition(condition, ' rqpurchaseitem.purchaserefcode in (  ' + strPlanpurchaseCodes + ')' );
  AddCondition(condition, ' rqpurchaseitem.code in ( '+
                          ' select pti2pi.purchaseitemrefcode from rqprchstmtndr2rqprchst pti2pi '+
                          ' where pti2pi.purchaseitemtenderrfcd in ( '+ strPurchaseItemTenderCodes +' )) '
               );
  AddCondition(condition, ' rqpurchaseitem2estmttm.estimateitemrefcode not in '+
'('+
'	 select oi2ei.estimateitemcode'+
'	 from net.rqorderitem2enestimttm oi2ei  , rqorderitem oi'+
'	  where oi2ei.orderitemcode = oi.code'+
'	  and coalesce(oi.findocid,0) <> 0'+
'	  and oi2ei.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode'+
'	  union'+
'	 select e2c.estimateitemcode'+
'	 from net.enestimateitem2contrct e2c'+
'	  where e2c.estimateitemcode = rqpurchaseitem2estmttm.estimateitemrefcode'+
'	 )');

  PurchaseItemFilter.orderBySQL := ' rqpurchaseitem.materialnamegen ';
  PurchaseItemFilter.conditionSQL := condition;
  RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredListWithoutContract(PurchaseItemFilter,0,-1);

  LastCount := High(RQPurchaseItemList.list);

 if LastCount > -1 then
     sgRQPurchaseItemWithoutContract.RowCount:=LastCount+3
  else
     sgRQPurchaseItemWithoutContract.RowCount:=2;

   with sgRQPurchaseItemWithoutContract do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+2] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+2] := '';

        Cells[1,i+2] := RQPurchaseItemList.list[i].purchaseRefName;

        Cells[2,i+2] := RQPurchaseItemList.list[i].identid2010;
        Cells[3,i+2] := RQPurchaseItemList.list[i].identid2015;

        Cells[4,i+2] := RQPurchaseItemList.list[i].materialNameGen;

        Cells[5,i+2] := RQPurchaseItemList.list[i].measurementNameGen;

         if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[6,i+2] := ''
        else
          Cells[6,i+2] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countGen = nil then
          Cells[7,i+2] := ''
        else
          Cells[7,i+2] := RQPurchaseItemList.list[i].countGen.DecimalString;

        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[8,i+2] := ''
        else
          Cells[8,i+2] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;


          if RQPurchaseItemList.list[i].pricePurchaseWithNds = nil then
          Cells[9,i+2] := ''
        else
          Cells[9,i+2] := RQPurchaseItemList.list[i].pricePurchaseWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countPurchase = nil then
          Cells[10,i+2] := ''
        else
          Cells[10,i+2] := RQPurchaseItemList.list[i].countPurchase.DecimalString;

        if RQPurchaseItemList.list[i].sumPurchaseWithNds = nil then
          Cells[11,i+2] := ''
        else
          Cells[11,i+2] := RQPurchaseItemList.list[i].sumPurchaseWithNds.DecimalString;



        Cells[12,i+2] := RQPurchaseItemList.list[i].purchaseItemTypeRefName;
        //не менять
        Objects[12,i+2] := TObject(RQPurchaseItemList.list[i].purchaseItemTypeRefCode);// код типа закупки

        Cells[13,i+2] := RQPurchaseItemList.list[i].userGen;
        //Cells[9,i+1] := RQPurchaseItemList.list[i].commentGen;
        Cells[14,i+2] := RQPurchaseItemList.list[i].objectsName;  // названия объектов в строке
        LastRowPurchaseItem:=i+2;
        sgRQPurchaseItemWithoutContract.RowCount:=LastRowPurchaseItem+1;
      end;
   sgRQPurchaseItemWithoutContract.Row:=1;
   // +++mar+++ детально теперь вібирать будет по сгруппированнім строкам
   // actEstimateWithoutContractUpdateExecute(Sender);


end;


procedure TfrmPlanPurchaseGroup.actUpdatePurchaseItemTenderExecute(
  Sender: TObject);
var
  TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
  i, lastCount , lastrow  , a , j : Integer;
  plp : Integer;
  RQPurchaseItemTenderList: RQPurchaseItemTenderShortList;
  TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
  //itemTenderFilter : RQPurchaseItemTenderFilter;
  selectedPlanPurchase : Boolean;
  strPlanpurchaseCodes : string;
begin

  ClearGrid(sgRQPurchaseItemTender);


  for a:=1 to sgRQPurchaseItemTender.RowCount-1 do
   for j:=0 to sgRQPurchaseItemTender.ColCount-1 do
    begin
     sgRQPurchaseItemTender.Cells[j,a]:='';
     sgRQPurchaseItemTender.RemoveCheckBox(1,a);
    end;

  selectedPlanPurchase := false;

  for plp := 1 to sgRQPlanPurchase.RowCount - 1 do
  begin
    sgRQPlanPurchase.GetCheckBoxState(1, plp, selectedPlanPurchase);
    if selectedPlanPurchase then break;
  end;

   if not selectedPlanPurchase then
  begin
    Application.MessageBox(PChar('Оберіть річний план, або зміни до нього !'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  // собираем строку с кодами годового плана или изменений к нему для фильтра строк предметов закупки
  selectedPlanPurchase := false;
  strPlanpurchaseCodes := '';

   for plp := 1 to sgRQPlanPurchase.RowCount - 1 do
  begin
    sgRQPlanPurchase.GetCheckBoxState(1, plp, selectedPlanPurchase);
    if selectedPlanPurchase then
    begin
       if strPlanpurchaseCodes = '' then
       strPlanpurchaseCodes := sgRQPlanPurchase.Cells[0, plp]
       else
       strPlanpurchaseCodes := strPlanpurchaseCodes + ','+sgRQPlanPurchase.Cells[0, plp];

    end;
  end;

  TempRQPurchaseItemTender := HTTPRIORQPurchaseItemTender as RQPurchaseItemTenderControllerSoapPort;

//  itemTenderFilter := RQPurchaseItemTenderFilter.Create;
//  SetNullIntProps(itemTenderFilter);
//  SetNullXSProps(itemTenderFilter);

  if RQPurchaseItemTenderFilterObj = nil then
  begin
     RQPurchaseItemTenderFilterObj := RQPurchaseItemTenderFilter.Create;
     SetNullIntProps(RQPurchaseItemTenderFilterObj);
     SetNullXSProps(RQPurchaseItemTenderFilterObj);
  end;

  RQPurchaseItemTenderFilterObj.conditionSQL := ' rqpurchaseitemtender.purchaserefcode in (  ' + strPlanpurchaseCodes + ')';
  RQPurchaseItemTenderFilterObj.orderBySQL := ' rqpurchaseitemtender.identid , rqpurchaseitemtender.purchasename ';
  RQPurchaseItemTenderList := TempRQPurchaseItemTender.getScrollableFilteredList(RQPurchaseItemTenderFilterObj,0,-1);


  LastCount := High(RQPurchaseItemTenderList.list);

 if LastCount > -1 then
     sgRQPurchaseItemTender.RowCount:=LastCount+2
  else
     sgRQPurchaseItemTender.RowCount:=2;

   with sgRQPurchaseItemTender do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemTenderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemTenderList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQPurchaseItemTenderList.list[i].purchaseRefName;

        Cells[2,i+1] := RQPurchaseItemTenderList.list[i].identid;
        if RadioGroup1.ItemIndex = 0 then  // если выбираем по нескольким строкам
        AddCheckBox(2, i+1, false, false); // не трогать - по колонке фильтруются чек боксы

        Cells[3,i+1] := RQPurchaseItemTenderList.list[i].identid2;

        Cells[4,i+1] := RQPurchaseItemTenderList.list[i].purchaseName;
        Cells[5,i+1] := RQPurchaseItemTenderList.list[i].financingSource;
        if RQPurchaseItemTenderList.list[i].sumGenWithNds = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQPurchaseItemTenderList.list[i].sumGenWithNds.DecimalString;
        if RQPurchaseItemTenderList.list[i].sumFactWithNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQPurchaseItemTenderList.list[i].sumFactWithNds.DecimalString;

          Cells[8,i+1] := RQPurchaseItemTenderList.list[i].tenderKindRefName; //  kinditemtendername;
          Cells[9,i+1] := RQPurchaseItemTenderList.list[i].tentativemonthyear;

          Cells[10,i+1] := RQPurchaseItemTenderList.list[i].purchaseItemTypeRefName;

        LastRow:=i+1;
        sgRQPurchaseItemTender.RowCount:=LastRow+1;
      end;

   sgRQPurchaseItemTender.Row:=1;
end;

procedure TfrmPlanPurchaseGroup.actWithoutFilterPurchaseItemTenderExecute(
  Sender: TObject);
begin

  RQPurchaseItemTenderFilterObj.Free;
  RQPurchaseItemTenderFilterObj := nil;
  actUpdatePurchaseItemTenderExecute(Sender);
end;

procedure TfrmPlanPurchaseGroup.edtYearGenChange(Sender: TObject);
begin
  inherited;
   actUpdatePlanPurchaseAndCnangeForPurchaseExecute(Sender);
end;

procedure TfrmPlanPurchaseGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   frmPlanPurchaseGroup:=nil;
end;

procedure TfrmPlanPurchaseGroup.FormCreate(Sender: TObject);
begin
     b := false;
     RQPurchaseItemTenderFilterObj:= nil;
     RQPurchaseItemFilterObj:= nil;
     ENContractFilterObj:= nil;


end;

procedure TfrmPlanPurchaseGroup.FormResize(Sender: TObject);
begin
  inherited;
    Panel1.Height:= Panel2.Height;
end;

procedure TfrmPlanPurchaseGroup.FormShow(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  actUpdatePlanPurchaseAndCnangeForPurchaseExecute(Sender);
  SetGridHeaders(RQPurchaseItemTenderHeaders, sgRQPurchaseItemTender.ColumnHeaders);
  SetGridHeaders(RQPlanPurchaseHeaders, sgRQPlanPurchase.ColumnHeaders);
  SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItem.ColumnHeaders);
// tezzzt  SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItemWithoutContract.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetGridHeaders(ENContractHeaders, sgENContract.ColumnHeaders);
  SetGridHeaders(ENContractItemHeaders, sgENContractItem.ColumnHeaders);
  SetGridHeaders(ENEstimateItemInContractHeaders, sgENEstimateItemInContract.ColumnHeaders);
  SetGridHeaders(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriodHeaders, sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.ColumnHeaders);
  SetGridHeaders(sgGroupedEstimate2ContractHeaders , sgGroupedEstimate2Contract.ColumnHeaders);


  EnEstimateitem2ContractOrderCode := LOW_INT;
  actEnContractUpdateExecute(Sender);


end;

procedure TfrmPlanPurchaseGroup.Label2Click(Sender: TObject);
begin
  b := not(b);
  if b then Label2.Caption := '<'
      else Label2.Caption := '>';

end;



procedure TfrmPlanPurchaseGroup.MenuItem37Click(Sender: TObject);
begin
  inherited;
    checkGrid(sgGroupedEstimate2Contract, 1, true);
end;

procedure TfrmPlanPurchaseGroup.MenuItem38Click(Sender: TObject);
begin
  inherited;
   checkGrid(sgGroupedEstimate2Contract, 1, false);
end;

procedure TfrmPlanPurchaseGroup.N19Click(Sender: TObject);
begin
  inherited;
    checkGrid(sgENEstimateItemInContract, 1, true);
end;

procedure TfrmPlanPurchaseGroup.N20Click(Sender: TObject);
begin
  inherited;
    checkGrid(sgENEstimateItemInContract, 1, false);
end;

procedure TfrmPlanPurchaseGroup.PopupMenuEstimate2ContractItemGroupPopup(
  Sender: TObject);
begin
  inherited;
     actEstimate2ProjectAgreeGroupUnlink.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE);
     actEstimate2ContractGroupUnlink.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_AGREE);
end;

procedure TfrmPlanPurchaseGroup.PopupMenuEstimate2ContractItemPopup(
  Sender: TObject);
begin
  inherited;
  actEstimate2ProjectAgreeUnlink.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE);
  actEstimateWithContractUnLink2Contract.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_AGREE);

end;

procedure TfrmPlanPurchaseGroup.PopupMenuPurchaseItem2EIWithoutContractGroupPopup(
  Sender: TObject);
begin
  inherited;
   actEstimateWithoutContractGroupAdd2Specification.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE);
   actEstimateWithoutContractGroupLink2Contract.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_AGREE);
end;

procedure TfrmPlanPurchaseGroup.PopupMenuPurchaseItem2EIWithoutContractPopup(
  Sender: TObject);
begin
  inherited;

  actEstimateWithoutContractAdd2Specification.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE);
  actEstimateWithoutContractLink2Contract.Enabled :=
    (Integer( sgENContract.Objects[4,sgENContract.Row]) = ENConsts.ENCONTRACTTYPE_AGREE);

end;

procedure TfrmPlanPurchaseGroup.sgENContractClick(Sender: TObject);
begin
  inherited;
  actEncontractItemUpdateExecute(Sender);
  actEstimate2ContractItemGroupUpdateExecute(Sender);
//  if chkAutoUpdateEstimate2ContractItem.Checked = True then
//     actEstimate2ContractItemUpdateExecute(Sender);
end;

procedure TfrmPlanPurchaseGroup.sgENContractDblClick(Sender: TObject);
begin

     actEnContractViewExecute(Sender);
end;

procedure TfrmPlanPurchaseGroup.sgENContractItemClick(Sender: TObject);
begin
  inherited;
//   if chkAutoUpdateEstimate2ContractItem.Checked = True then
//   actEstimate2ContractItemUpdateExecute(Sender);
     actEstimate2ContractItemGroupUpdateExecute(Sender);

end;

procedure TfrmPlanPurchaseGroup.sgENContractMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //inherited;
  {
    if Button = mbLeft then
    begin
     actEncontractItemUpdateExecute(Sender);
     actEstimate2ContractItemUpdateExecute(Sender);
    end;
  }
end;

procedure TfrmPlanPurchaseGroup.sgENContractRightClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  sgENContract.OnClick := nil;
  try
    PopupMenuEnContract.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  finally
    sgENContract.OnClick := sgENContractClick;
  end;
end;

procedure TfrmPlanPurchaseGroup.sgENContractTopLeftChanged(Sender: TObject);
var
  TempENContract: ENContractControllerSoapPort;
  i,CurrentRow: Integer;
  ENContractList: ENContractShortList;
  begin
  if LastCountEnContract < 99 then Exit;
  if (sgENContract.TopRow + sgENContract.VisibleRowCount) = ColCountEnContract
  then
    begin
      TempENContract :=  HTTPRIOENContract as ENContractControllerSoapPort;
      CurrentRow:=sgENContract.RowCount;

   if ENContractFilterObj  = nil then
  begin
     ENContractFilterObj := ENContractFilter.Create;
     SetNullIntProps(ENContractFilterObj);
     SetNullXSProps(ENContractFilterObj);
  end;

  ENContractFilterObj.orderBySQL := 'contractenddate desc , contractdate ';

  ENContractList := TempENContract.getScrollableFilteredList(ENContractFilterObj,ColCountEnContract-1, 100);

  sgENContract.RowCount:=sgENContract.RowCount+100;
  LastCountEnContract:=High(ENContractList.list);
  with sgENContract do
    for i:=0 to LastCountEnContract do
      begin
        Application.ProcessMessages;
        if ENContractList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENContractList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENContractList.list[i].contractNumber;

        if ENContractList.list[i].contractDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENContractList.list[i].contractDate);

        if ENContractList.list[i].contractEndDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
         begin
          Cells[3,i+CurrentRow] := XSDate2String(ENContractList.list[i].contractEndDate);
          if comparedate(date() , StrToDate(XSDate2String(ENContractList.list[i].contractEndDate))  ) > 0 then
             RowColor[i+CurrentRow]:= clRed;
         end;

          Cells[4,i+CurrentRow] := ENContractList.list[i].contractTypeName;
          if (ENContractList.list[i].contractTypeCode = ENConsts.ENCONTRACTTYPE_PROJECT_AGREE ) then
             RowColor[i+1]:= clYellow;
          Objects[4,i+CurrentRow] := TObject(ENContractList.list[i].contractTypeCode);

          Cells[5,i+CurrentRow] := ENContractList.list[i].orgName;

          Cells[6,i+CurrentRow] := ENContractList.list[i].finDocCode;

        if ENContractList.list[i].finDocID = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENContractList.list[i].finDocID);

        Cells[8,i+CurrentRow] := ENContractList.list[i].userGen;

        if ENContractList.list[i].dateEdit = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(ENContractList.list[i].dateEdit);
          LastRowEnContract:=i+CurrentRow;
      end;
   ColCountEnContract:=ColCountEnContract+100;
   sgENContract.Row:=CurrentRow-5;
   sgENContract.RowCount:=LastRowEnContract+1;
  end;
end;

procedure TfrmPlanPurchaseGroup.sgENEstimateItemCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  inherited;
   checkedCountEstimateitemWithoutContract := 0;
   checkedCountEstimateitemWithoutContract := GetCheckedMaterialsCountFromEstimate;
   UpdateInfoForEstimateWithoutContract();
end;

procedure TfrmPlanPurchaseGroup.sgENEstimateItemDblClick(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
objCode : Integer;
begin
    try
      objCode:=   Integer(sgENEstimateItem.Objects[1 ,sgENEstimateItem.Row ]); // code estimateitem
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

procedure TfrmPlanPurchaseGroup.sgENEstimateItemInContractDblClick(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
objCode : Integer;
begin
    try
      objCode:= StrToInt(sgENEstimateItemInContract.Cells[0,sgENEstimateItemInContract.Row]);
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

procedure TfrmPlanPurchaseGroup.sgMaterialWithoutContractGroupByOrderitemOrPlanPeriodCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
   checkedCountGroupMaterialWithoutContract := 0;
   checkedCountGroupMaterialWithoutContract := GetCheckedMaterialsCountFromGroupMaterial;
   checkedCountEstimateitemWithoutContract := 0;
   UpdateInfoForEstimateWithoutContract();
end;

procedure TfrmPlanPurchaseGroup.sgRQPurchaseItemWithoutContractClick(
  Sender: TObject);
begin
  // actEstimateWithoutContractUpdateExecute(Sender);
  actMaterialWithoutContractGroupByOrderitemOrPlanPeriod_updateExecute(Sender);
   if chkAutoFindContractWithFreeCount.Checked then
      actEnContractUpdateExecute(Sender);

end;

procedure TfrmPlanPurchaseGroup.sgRQPurchaseItemWithoutContractDblClick(
  Sender: TObject);
begin

     actPurchaseItemWithoutContractViewExecute(Sender);
end;

procedure TfrmPlanPurchaseGroup.sgRQPurchaseItemWithoutContractMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   actEstimateWithoutContractUpdateExecute(Sender);
end;

procedure TfrmPlanPurchaseGroup.Timer1Timer(Sender: TObject);
begin
if (b)and(Panel1.Left<0) then
  Panel1.Left:= Panel1.Left + 6;
 if (not b)and(Panel1.Left>-350) then
  Panel1.Left:=Panel1.Left - 10;

end;


function TfrmPlanPurchaseGroup.GetCheckedMaterialsCountFromEstimate: Double;
var i: Integer;
    state: Boolean;
    estimateCount, totalCount: Double;
begin
  Result := 0;
  totalCount := 0;
  state := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
      try
        estimateCount := StrToFloat(sgENEstimateItem.Cells[3, i]);
      except
        on EConvertError do Continue;
      end;

      totalCount := totalCount + estimateCount;
    end;
  end;

  Result := totalCount;
end;

function TfrmPlanPurchaseGroup.GetCheckedMaterialsCountFromGroupMaterial: Double;
var i: Integer;
    state: Boolean;
    materialCount, totalCount: Double;
begin
  Result := 0;
  totalCount := 0;
  state := false;

  for i := 1 to sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.RowCount - 1 do
  begin
    sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.GetCheckBoxState(1, i, state);
    if state then
    begin
      try
        materialCount := StrToFloat(sgMaterialWithoutContractGroupByOrderitemOrPlanPeriod.Cells[5, i]);
      except
        on EConvertError do Continue;
      end;

      totalCount := totalCount + materialCount;
    end;
  end;

  Result := totalCount;
end;

procedure TfrmPlanPurchaseGroup.UpdateInfoForEstimateWithoutContract();
begin
edtInfoForEstimateWithoutContract.Text := '';
  if checkedCountGroupMaterialWithoutContract > 0  then
     edtInfoForEstimateWithoutContract.Text :=
    'Обрана кількість матеріалу без договорів = ' +  FloatToStr(checkedCountGroupMaterialWithoutContract);

  if checkedCountEstimateitemWithoutContract > 0  then
     edtInfoForEstimateWithoutContract.Text :=
    'Обрана кількість матеріалу без договорів = ' +  FloatToStr(checkedCountEstimateitemWithoutContract);

end;


procedure TfrmPlanPurchaseGroup.actEncontractItemFilterByMaterialExecute(Sender: TObject);
  Var i, j , EnContractObjCode : Integer;
  TempENContractItem: ENContractItemControllerSoapPort;
  ENContractItemList: ENContractItemShortList;

   TempTKMaterials: TKMaterialsControllerSoapPort;
   materialFilter: TKMaterialsFilter;
   materialList: TKMaterialsShortList;
   frmSpr_matherialShow: TfrmTKMaterialsShow;
begin
 TempENContractItem :=  HTTPRIOENContractItem as ENContractItemControllerSoapPort;

  if ENContractItemFilterObj = nil then
  begin
     ENContractItemFilterObj := ENContractItemFilter.Create;
     SetNullIntProps(ENContractItemFilterObj);
     SetNullXSProps(ENContractItemFilterObj);
  end;

     frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);

  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
            begin
             if ENContractItemFilterObj.material = nil then ENContractItemFilterObj.material := TKMaterials.Create;
                ENContractItemFilterObj.material.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
            end
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;

 for i:=1 to sgENContractItem.RowCount-1 do
   for j:=0 to sgENContractItem.ColCount-1 do
   begin
     sgENContractItem.Cells[j,i]:='';
     if Assigned(sgENContractItem.Objects[j,i]) then
     begin
        //sgENContractItem.Objects[j,i].Free;
        sgENContractItem.Objects[j,i]:=nil;
     end;
   end;

   EnContractObjCode := LOW_INT;

    try
     EnContractObjCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
    except
     on EConvertError do Exit;
    end;



  ColCountEnContractItem:=1000;


  if EnContractObjCode <> LOW_INT then
   begin
     ENContractItemFilterObj.contract := ENContract.Create;
     ENContractItemFilterObj.contract.code := EnContractObjCode;
   end;

  ENContractItemList := TempENContractItem.getScrollableFilteredList(ENContractItemFilterObj,0,ColCountEnContractItem);


  LastCountEnContractItem:=High(ENContractItemList.list);

  if LastCountEnContractItem > -1 then
     sgENContractItem.RowCount:=LastCountEnContractItem + 2
  else
     sgENContractItem.RowCount:=2;


   with sgENContractItem do
    for i:=0 to LastCountEnContractItem do
      begin

        if ENContractItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractItemList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENContractItemList.list[i].materialName;

        Objects[1,i+1] := TObject(ENContractItemList.list[i].materialCode);

        if ENContractItemList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENContractItemList.list[i].countGen.DecimalString;

       if ENContractItemList.list[i].countbinded = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := FloatToStr(strtofloat(ENContractItemList.list[i].countGen.DecimalString)
                         - strtofloat(ENContractItemList.list[i].countbinded.DecimalString)
                         );

        if ENContractItemList.list[i].price = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENContractItemList.list[i].price.DecimalString;

        if ENContractItemList.list[i].cost = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENContractItemList.list[i].cost.DecimalString;
        Cells[6,i+1] := ENContractItemList.list[i].userGen;
        if ENContractItemList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
					Cells[7,i+1] := XSDate2String(ENContractItemList.list[i].dateEdit);

					if ENContractItemList.list[i].countReal = nil then
					Cells[8,i+1] := ''
				else
					Cells[8,i+1] := ENContractItemList.list[i].countReal.DecimalString;

        LastRowEnContractItem:=i+1;
        sgENContractItem.RowCount:=LastRowEnContractItem+1;
      end;
   ColCountEnContractItem:= ColCountEnContractItem+1;
   sgENContractItem.Row:= 1;



end;

procedure TfrmPlanPurchaseGroup.actEncontractItemNoFilterExecute(
  Sender: TObject);
 Var i, j , EnContractObjCode : Integer;
  TempENContractItem: ENContractItemControllerSoapPort;
  ENContractItemList: ENContractItemShortList;

begin
  //inherited;
  for i:=1 to sgENContractItem.RowCount-1 do
   for j:=0 to sgENContractItem.ColCount-1 do
   begin
     sgENContractItem.Cells[j,i]:='';
     if Assigned(sgENContractItem.Objects[j,i]) then
     begin
        //sgENContractItem.Objects[j,i].Free;
        sgENContractItem.Objects[j,i]:=nil;
     end;
   end;

   EnContractObjCode := LOW_INT;

    try
     EnContractObjCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
    except
     on EConvertError do Exit;
    end;



  ColCountEnContractItem:=1000;
  TempENContractItem :=  HTTPRIOENContractItem as ENContractItemControllerSoapPort;


     ENContractItemFilterObj := ENContractItemFilter.Create;
     SetNullIntProps(ENContractItemFilterObj);
     SetNullXSProps(ENContractItemFilterObj);

  if EnContractObjCode <> LOW_INT then
   begin
     ENContractItemFilterObj.contract := ENContract.Create;
     ENContractItemFilterObj.contract.code := EnContractObjCode;
   end;

  ENContractItemList := TempENContractItem.getScrollableFilteredList(ENContractItemFilterObj,0,ColCountEnContractItem);


  LastCountEnContractItem:=High(ENContractItemList.list);

  if LastCountEnContractItem > -1 then
     sgENContractItem.RowCount:=LastCountEnContractItem + 2
  else
     sgENContractItem.RowCount:=2;


   with sgENContractItem do
    for i:=0 to LastCountEnContractItem do
      begin

        if ENContractItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractItemList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENContractItemList.list[i].materialName;

        Objects[1,i+1] := TObject(ENContractItemList.list[i].materialCode);

        if ENContractItemList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENContractItemList.list[i].countGen.DecimalString;

       if ENContractItemList.list[i].countbinded = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := FloatToStr(strtofloat(ENContractItemList.list[i].countGen.DecimalString)
                         - strtofloat(ENContractItemList.list[i].countbinded.DecimalString)
                         );

        if ENContractItemList.list[i].price = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENContractItemList.list[i].price.DecimalString;

        if ENContractItemList.list[i].cost = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENContractItemList.list[i].cost.DecimalString;
        Cells[6,i+1] := ENContractItemList.list[i].userGen;
        if ENContractItemList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
					Cells[7,i+1] := XSDate2String(ENContractItemList.list[i].dateEdit);

					if ENContractItemList.list[i].countReal = nil then
					Cells[8,i+1] := ''
				else
					Cells[8,i+1] := ENContractItemList.list[i].countReal.DecimalString;

        LastRowEnContractItem:=i+1;
        sgENContractItem.RowCount:=LastRowEnContractItem+1;
      end;
   ColCountEnContractItem:= ColCountEnContractItem+1;
   sgENContractItem.Row:= 1;



end;



function TfrmPlanPurchaseGroup.StringArrayToString(Const AnArray: Array of WideString): String;
var
 Index: Integer;
begin
  Index := Low(anArray);
  while Index < High(AnArray) do
  begin
    Result := Result + AnArray[Index] + ',';
    Inc(Index);
  end;
  Result := Result + AnArray[High(AnArray)];
end;

end.
