unit EditMaterials2Contracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ExtCtrls, ComCtrls, Grids,
  BaseGrid, AdvGrid, RQOrgController, ENEstimateItemController,
  ENPlanWorkController, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  ActnList, TB2Item, TB2Dock, TB2Toolbar, Menus, AdvObj ;

type
  TfrmMaterials2Contracts = class(TDialogForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblENBudgetName: TLabel;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblDepartment: TLabel;
    spbDepartment: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    edtENElementName: TEdit;
    edtENBudgetName: TEdit;
    chbGSMOnly: TCheckBox;
    btnSelect: TBitBtn;
    edtDepartment: TEdit;
    lblDateStart: TLabel;
    dtpDateStart: TDateTimePicker;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    GroupBox2: TGroupBox;
    lblRQOrgOrgName: TLabel;
    spbRQOrg: TSpeedButton;
    lblContractNumber: TLabel;
    spbContractNumber: TSpeedButton;
    spbRQOrgClear: TSpeedButton;
    spbContractNumberClear: TSpeedButton;
    edtRQOrgOrgName: TEdit;
    edtContractNumber: TEdit;
    lblMeasurement: TLabel;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    lblYearOrder: TLabel;
    lblMonthOrder: TLabel;
    edtYearOrder: TComboBox;
    edtMonthOrder: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    lblDeliveryDate: TLabel;
    edtContractCount: TEdit;
    Label6: TLabel;
    btnAutoAllocateMaterialCount: TButton;
    Label7: TLabel;
    edtContractRest: TEdit;
    Label8: TLabel;
    edtInContract: TEdit;
    btnAddMaterials: TBitBtn;
    HTTPRIOENEstimateItem2Contract: THTTPRIO;
    ActionList1: TActionList;
    actDelete: TAction;
    ImageList1: TImageList;
    GroupBox3: TGroupBox;
    tbActionsTO: TTBToolbar;
    TBItem7: TTBItem;
    sgENEstimateItemInContract: TAdvStringGrid;
    btnFind: TButton;
    rbPlanned: TRadioButton;
    rbNonePlanned: TRadioButton;
    Label9: TLabel;
    edtMaterialInContractName: TEdit;
    spbMaterialInContractName: TSpeedButton;
    spbMaterialInContractClear: TSpeedButton;
    Label10: TLabel;
    lblMaterialInContractTotal: TLabel;
    btnContractItems: TButton;
    HTTPRIOENContract: THTTPRIO;
    btnReport: TButton;
    actSelectAll: TAction;
    actClearAll: TAction;
    pmENEstimateItemInContract: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    HTTPRIOENResponsibles: THTTPRIO;
    ActionList2: TActionList;
    actInsertResp2Contract: TAction;
    actEditOMTSResponsibles: TAction;
    tbActions: TTBToolbar;
    TBItem6: TTBItem;
    TBItem1: TTBItem;
    HTTPRIOFINContracts: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    chbOrdered: TCheckBox;
    chbPlanned: TCheckBox;
    lblRQOrder: TLabel;
    edtRQOrder: TEdit;
    spbRQOrder: TSpeedButton;
    spbRQOrderClear: TSpeedButton;
    actSelectNotPlanned: TAction;
    actSelectPlanned: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Shape1: TShape;
    Label2: TLabel;
    chbPresent: TCheckBox;
    btnReportBillByContract: TButton;
    btnSpravTender: TButton;
    Button1: TButton;
    procedure spbMaterialNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbRQOrgClick(Sender: TObject);
    procedure spbRQOrgClearClick(Sender: TObject);
    procedure spbContractNumberClick(Sender: TObject);
    procedure spbContractNumberClearClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnAutoAllocateMaterialCountClick(Sender: TObject);
    procedure sgENEstimateItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure edtContractCountChange(Sender: TObject);
    procedure btnAddMaterialsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFindClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure spbMaterialInContractNameClick(Sender: TObject);
    procedure spbMaterialInContractClearClick(Sender: TObject);
    procedure btnContractItemsClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actClearAllExecute(Sender: TObject);
    procedure actInsertResp2ContractExecute(Sender: TObject);
    procedure actEditOMTSResponsiblesExecute(Sender: TObject);
    procedure chbOrderedClick(Sender: TObject);
    procedure chbPlannedClick(Sender: TObject);
    procedure spbRQOrderClearClick(Sender: TObject);
    procedure spbRQOrderClick(Sender: TObject);
    procedure actSelectPlannedExecute(Sender: TObject);
    procedure actSelectNotPlannedExecute(Sender: TObject);
    procedure btnReportBillByContractClick(Sender: TObject);
    procedure btnSpravTenderClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    materialCode: Integer;
    departmentCode: Integer;
    elementCode: Integer;
    budgetCode: Integer;

    materialInContractCode: Integer;

    org: RQOrg;
    contractNumber: String;
    contractDate: TDate;
    finDocCode: String;
    finDocID: Integer;

    planCodes: String;

    eFilter: ENEstimateItemFilter;
    planFilter: ENPlanWorkFilter;

    orderCode: Integer;

    procedure AutoAllocateMaterialCount;
    function GetCheckedMaterialsCount: Double;
    procedure getRestCountByContract(finDocCode: String; materialCode: Integer);
  public
    { Public declarations }
    procedure UpdateEstimateItemGrid();
    procedure UpdateEstimateItemsInContractGrid();
  end;

var
  frmMaterials2Contracts: TfrmMaterials2Contracts;

implementation

uses ShowTKMaterials, TKMaterialsController, ChildFormUnit, ENConsts,
  ENDepartmentController, ENElementController, ShowENDepartment,
  ShowENElement, ENDepartmentTypeController, ShowRQOrg,
  ShowFINServicesObject, XSBuiltIns, ENServicesObjectController,
  ENEstimateItemStatusController, ENPlanWorkKindController,
  ENEstimateItemKindController, GridHeadersUnit,
  ENEstimateItem2ContractController,
  ENEstimateItem2ENEstimateItemController
  ,ENPlanWorkFormController , ShowENContractItem, ENContractItemController,
  ENContractController, EnergyproController, DMReportsUnit,
  ENResponsiblesController, FINContractsController, EditOMTSResponsibles,
  EditENResponsibles2FINContracts, ENResponsibles2FINContractsController,
  RQOrderController, RQOrderKindController, ShowRQOrder,
  reportTenderMaterials, ShowENContract , DeficitProficit;

{$R *.dfm}

var
  ENEstimateItemHeaders: array [1..14] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Дата поч.робіт'
          ,'Підрозділ'
          ,'Інв. №'
          ,'Назва об''єкту'

          /////
          ,'Заявка'
          ,'Постачальник, договір'
          /////

          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'

          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );

  ENEstimateItemInContractHeaders: array [1..12] of String =
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

(* 22.01.13
procedure TfrmMaterials2Contracts.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  {
  mtFilter := TKMaterialsFilter.Create;
  SetNullIntProps(mtFilter);
  SetNullXSProps(mtFilter);

  mtFilter.conditionSQL := 'parentrefcode is null';
  mtFilter.orderBySQL := ' tk1.name'; // в ДАО в запросе пробит алиас tk1 !!!
  }
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
          //*** if ENEstimateItemObj.materialRef = nil then ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
          //*** ENEstimateItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
          lblMeasurement.Caption := {'од.виміру : '+ }TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
          lblDeliveryDate.Caption := {'строк постачання : '+ } IntToStr(TKMaterialsShort(tvDep.Selected.Data).deliveryDate){ + ' днів'}; //GetReturnValue(sgSpr_matherial, 2);
          ClearGrid(sgENEstimateItem);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;
*)

procedure TfrmMaterials2Contracts.spbMaterialNameClick(Sender: TObject);
var
   frmENContractItemShow: TfrmENContractItemShow;

   TempENContract: ENContractControllerSoapPort;
   contractFilter: ENContractFilter;
   contractList: ENContractShortList;

   contractItemFilter: ENContractItemFilter;

   TempTKMaterials: TKMaterialsControllerSoapPort;
   materialFilter: TKMaterialsFilter;
   materialList: TKMaterialsShortList;
begin
  if (finDocCode = '') or (finDocID = LOW_INT) or (org = nil) then
  begin
    Application.MessageBox(PChar('Оберіть договір!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  contractItemFilter := ENContractItemFilter.Create();
  SetNullXSProps(contractItemFilter);
  SetNullIntProps(contractItemFilter);

  /////
  contractItemFilter.contract := ENContract.Create;

  contractFilter := ENContractFilter.Create;
  SetNullIntProps(contractFilter);
  SetNullXSProps(contractFilter);
  contractFilter.finDocCode := finDocCode;
  contractFilter.finDocID := finDocID;

  TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
  contractList := TempENContract.getScrollableFilteredList(contractFilter, 0, 1);
  if High(contractList.list) > -1 then
    contractItemFilter.contract.code := contractList.list[0].code
  else
    contractItemFilter.contract.code := -1; // чтобы ничего не выбралось
  /////

  frmENContractItemShow := TfrmENContractItemShow.Create(Application, fmNormal, contractItemFilter);
  try
    if High(contractList.list) > -1 then
    begin
      frmENContractItemShow.contractCode := contractList.list[0].code;
    end
    else begin
      /// Организация //////////////////////////////////////////////////////////
      {
      if frmENContractItemShow.org = nil then
      begin
        frmENContractItemShow.org := RQOrg.Create();
        SetNullIntProps(frmENContractItemShow.org);
        SetNullXSProps(frmENContractItemShow.org);
      end;
      frmENContractItemShow.org.id := org.id; // по ИД будем смотреть на серваке ...
      frmENContractItemShow.org.codeorg := org.codeorg;
      frmENContractItemShow.org.name := org.name;
      frmENContractItemShow.org.ukr_name := org.ukr_name;
      frmENContractItemShow.org.okpo := org.okpo;
      frmENContractItemShow.org.nalog_num := org.nalog_num;
      frmENContractItemShow.org.svidet_num := org.svidet_num;
      frmENContractItemShow.org.adr := org.adr;
      frmENContractItemShow.org.tel := org.tel;
      frmENContractItemShow.org.country := org.country;
      frmENContractItemShow.org.region := org.region;
      frmENContractItemShow.org.ministry := org.ministry;
      frmENContractItemShow.org.ownership := org.ownership;
      frmENContractItemShow.org.type_ := org.type_;
      frmENContractItemShow.org.master_code := org.master_code;

      //frmENContractItemShow.org.date_svidet := TXSDate.Create;
      //frmENContractItemShow.org.likv_date := TXSDate.Create;
      //frmENContractItemShow.org.dateNalogform := TXSDate.Create;

      if org.date_svidet <> nil then
      begin
        frmENContractItemShow.org.date_svidet := TXSDate.Create;
        frmENContractItemShow.org.date_svidet.XSToNative(org.date_svidet.NativeToXS);
      end;

      if org.likv_date <> nil then
      begin
        frmENContractItemShow.org.likv_date := TXSDate.Create;
        frmENContractItemShow.org.likv_date.XSToNative(org.likv_date.NativeToXS);
      end;

      if org.date_nalogform <> nil then
      begin
        frmENContractItemShow.org.date_nalogform := TXSDate.Create;
        frmENContractItemShow.org.date_nalogform.XSToNative(org.date_nalogform.NativeToXS);
      end;      

      frmENContractItemShow.org.except_flag := org.except_flag;
      frmENContractItemShow.org.likv_flag := org.likv_flag;
      frmENContractItemShow.org.budget_flag := org.budget_flag;

      frmENContractItemShow.org.id_nalogform := org.id_nalogform;
      frmENContractItemShow.org.adr_legal := org.adr_legal;
      frmENContractItemShow.org.Primechan := org.Primechan;
      }
      frmENContractItemShow.org := DMReports.copyOrg(org, frmENContractItemShow.org);
      //////////////////////////////////////////////////////////////////////////

      /// Договор //////////////////////////////////////////////////////////////
      frmENContractItemShow.contractNumber := contractNumber;
      frmENContractItemShow.contractDate := StrToDate(DateToStr(contractDate));
      frmENContractItemShow.finDocCode := finDocCode;
      frmENContractItemShow.finDocID := finDocID;
      //////////////////////////////////////////////////////////////////////////
    end;

    frmENContractItemShow.contractDescription := edtContractNumber.Text;

    frmENContractItemShow.DisableActions([frmENContractItemShow.actInsert, frmENContractItemShow.actDelete, frmENContractItemShow.actEdit]);
    materialCode := LOW_INT;

    with frmENContractItemShow do
      if ShowModal = mrOk then
      begin
        Self.materialCode := Integer(frmENContractItemShow.sgENContractItem.Objects[1, frmENContractItemShow.sgENContractItem.Row]);
        //ShowMessage(IntToStr(materialCode));

        edtMaterialName.Text := GetReturnValue(sgENContractItem, 1);

        //lblMeasurement.Caption := {'од.виміру : '+ }TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
        //lblDeliveryDate.Caption := {'строк постачання : '+ } IntToStr(TKMaterialsShort(tvDep.Selected.Data).deliveryDate){ + ' днів'}; //GetReturnValue(sgSpr_matherial, 2);

        if Self.materialCode <= 0 then
          raise Exception.Create('Не обрано матеріал!');

        materialFilter := TKMaterialsFilter.Create;
        SetNullIntProps(materialFilter);
        SetNullXSProps(materialFilter);
        materialFilter.code := Self.materialCode;

        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        materialList := TempTKMaterials.getScrollableFilteredList(materialFilter, 0, -1);

        if materialList.totalCount > 0 then
        begin
          lblMeasurement.Caption := materialList.list[0].measurementName;
          lblDeliveryDate.Caption := IntToStr(materialList.list[0].deliveryDate);
        end;

        ClearGrid(sgENEstimateItem);
      end;

  finally
    frmENContractItemShow.Free;
  end;

  // Автоматически выдергиваем непривязанный остаток по договору и выбранному материалу
  getRestCountByContract(Self.finDocCode, Self.materialCode);
end;

procedure TfrmMaterials2Contracts.FormShow(Sender: TObject);
begin
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetGridHeaders(ENEstimateItemInContractHeaders, sgENEstimateItemInContract.ColumnHeaders);
  SetFloatStyle([edtContractCount, edtContractRest, edtInContract]);

  // 14.01.2011 Пока задисейблим edtContractNumber
  DisableControls([edtMaterialName, edtDepartment, edtENElementName, edtENBudgetName,
                   //edtRQOrgOrgName, {edtContractNumber, }edtContractRest, edtInContract]);
                   edtRQOrgOrgName, edtContractNumber, edtContractRest, edtInContract,
                   edtMaterialInContractName, edtRQOrder]);

  // 22.01.13 Будет вытягиваться автоматически еще не привязанное кол-во выбранного м-ла из заданного договора
  DisableControls([edtContractCount]);

  HideControls([lblRQOrder, edtRQOrder, spbRQOrder, spbRQOrderClear]);

  if (DialogState = dsEdit) or (DialogState = dsInsert) then
  begin
    DenyBlankValues([edtMaterialName, edtRQOrgOrgName, edtContractNumber, edtContractCount]);
  end;
end;

procedure TfrmMaterials2Contracts.FormCreate(Sender: TObject);
begin
  spbMaterialClearClick(Sender);
  spbDepartmentClearClick(Sender);
  spbENElementClearClick(Sender);
  spbENBudgetClearClick(Sender);
  spbMaterialInContractClearClick(Sender);

  spbRQOrgClearClick(Sender);

  spbRQOrderClearClick(Sender);
end;

procedure TfrmMaterials2Contracts.spbMaterialClearClick(Sender: TObject);
begin
  edtMaterialName.Text := '';
  lblMeasurement.Caption := '';
  lblDeliveryDate.Caption := '';
  materialCode := LOW_INT;

  edtContractCount.Text := '';

  ClearGrid(sgENEstimateItem);
end;

procedure TfrmMaterials2Contracts.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;
{
   if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > LOW_INT then
         if ENPlanWorkObj.renRef <> nil then
            /// Если код РЭСа > 0 (т.е. это не ХОЭ), то фильтруем подразделения по РЭСу,
            /// иначе выводим все
            //if ENPlanWorkObj.renRef.code > low(Integer) then
            // можно переделать из ДМРепорта ...
            if ENPlanWorkObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkObj.renRef.code) +')';
               f.code := Low(integer);
            end;
}

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               //if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               //ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               //departmentName := ENDepartmentShort(tvDep.Selected.Data).shortName;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmMaterials2Contracts.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := 'typerefcode';
{
  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // А для ХОЭ (renCode = 0) выбираем все объекты
}

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
    frmENElementShow.isFiltered := true;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          //elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := GetReturnValue(sgENElement,1); //elementName;
          ///
          //if elementCode > 0 then chbByObjects.Checked := false;
          //HideControls([chbByObjects], (elementCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmMaterials2Contracts.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              //budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName; //budgetName;
              ///
              //if budgetCode > 0 then chbByBudgets.Checked := false;
              //HideControls([chbByBudgets], (budgetCode > 0));
              ///
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmMaterials2Contracts.spbDepartmentClearClick(Sender: TObject);
begin
  edtDepartment.Text := '';
  departmentCode := LOW_INT;
end;

procedure TfrmMaterials2Contracts.spbENElementClearClick(Sender: TObject);
begin
  edtENElementName.Text := '';
  elementCode := LOW_INT;
end;

procedure TfrmMaterials2Contracts.spbENBudgetClearClick(Sender: TObject);
begin
  edtENBudgetName.Text := '';
  budgetCode := LOW_INT;
end;

procedure TfrmMaterials2Contracts.spbRQOrgClick(Sender: TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
   //org: RQOrg;
   tmpOrg: RQOrg;
   TempRQOrg: RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
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
               org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
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
                   end
                   else
                     org.date_svidet := nil;

               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    org.likv_date := TXSDate.Create;
                    org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end
                   else
                     org.likv_date := nil;

               org.except_flag := GetReturnValue(sgRQOrg,18);
               org.likv_flag := GetReturnValue(sgRQOrg,19);
               org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    org.date_nalogform := TXSDate.Create;
                    org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end
                   else
                     org.date_nalogform := nil;

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

procedure TfrmMaterials2Contracts.spbRQOrgClearClick(Sender: TObject);
begin
  edtRQOrgOrgName.Text := '';
  org := nil;
  spbContractNumberClearClick(Sender);
  DisableControls([spbContractNumber]);
end;

procedure TfrmMaterials2Contracts.spbContractNumberClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(org.id) ; // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      //frmFINServicesObjectShow.
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                contractNumber := GetReturnValue(sgFINServicesObject, 1);
                contractDate := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                finDocCode := GetReturnValue(sgFINServicesObject, 5);
                finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));
                DisableControls([edtContractNumber]);
                DenyBlankValues([edtContractNumber]);
                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);

                ///// 30.01.13 Очистим поле "Материал"
                // Автоматически выдергиваем непривязанный остаток по договору и выбранному материалу
                // getRestCountByContract(finDocCode, materialCode);
                spbMaterialClearClick(Sender);
                /////
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmMaterials2Contracts.spbContractNumberClearClick(
  Sender: TObject);
begin
  contractNumber := '';
  finDocCode := '';
  finDocID := LOW_INT;
  edtContractNumber.Text := '';
  // 14.01.2011 Пока задисейблим edtContractNumber
  //*** DisableControls([edtContractNumber], false);
  DenyBlankValues([edtContractNumber]);

  // 30.01.13 Очистим поле "Материал"
  spbMaterialClearClick(Sender);
end;

procedure TfrmMaterials2Contracts.FormDestroy(Sender: TObject);
begin
  if Assigned(eFilter) then
    eFilter.Free;
  if Assigned(planFilter) then
    planFilter.Free;
end;

procedure TfrmMaterials2Contracts.btnSelectClick(Sender: TObject);
begin
  UpdateEstimateItemGrid;
end;

procedure TfrmMaterials2Contracts.btnSpravTenderClick(Sender: TObject);
var    frmENContractShow: TfrmENContractShow;
contractFilter: ENContractFilter;
begin

  contractFilter := ENContractFilter.Create();
  SetNullXSProps(contractFilter);
  SetNullIntProps(contractFilter);

    frmENContractShow := TfrmENContractShow.Create(Application, fmNormal, contractFilter);
    DisableActions([ frmENContractShow.actInsert,     frmENContractShow.actDelete ]);

    try
	   frmENContractShow.ShowModal;
    finally
	  frmENContractShow.Free;
    end;
end;

procedure TfrmMaterials2Contracts.Button1Click(Sender: TObject);
begin
  inherited;
  frmDeficitProficit := TfrmDeficitProficit.Create(Application, dsInsert);
 try
   frmDeficitProficit.ShowModal;
 finally
   frmDeficitProficit.Free;
   frmDeficitProficit := nil;
 end;
end;

procedure TfrmMaterials2Contracts.UpdateEstimateItemGrid;
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;

    ///
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    
    //planFilter: ENPlanWorkFilter;
    //planCodes: String;
    condition , mCondition: String;
    ENMaterialsList: ENMaterialsShortList;

    TempENDepartment: ENDepartmentControllerSoapPort;
    depCodes : String;

    code : Integer;

    ////
    //i, j , code : Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eFilter : ENEstimateItemFilter;
    //pFilter : ENPlanWorkFilter;
    //materialCode : Integer;
    conditionSQL, planCondition , eCondition : String;
    ////

    orderFilter: RQOrderFilter;
    strOrder, strContract: String;
begin
{
    for i := 1 to sgTKMaterials.RowCount - 1 do
      for j := 0 to sgTKMaterials.ColCount - 1 do
        sgTKMaterials.Cells[j, i] := '';

    sgTKMaterials.RowCount := 2;
}

  if materialCode < 0 then
  begin
    Application.MessageBox(PChar('Оберіть матеріал!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtMaterialName.SetFocus;
    Exit;
  end;

  ClearGrid(sgENEstimateItem);


    ////////////////////////////////////////////////////////////////////////////
    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planCodes := '';


    planFilter.kind := ENPlanWorkKind.Create;

    planFilter.kind.code := ENPLANWORKKIND_CURRENT;

    // 30.01.13 Это есть в сервере
    // AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');
{
   if budgetCode <= 0 then
   begin
       ShowMessage('Виберіть Бюджетотримача ...');
       exit;
   end;
}

   { Пока уберем это предупреждение
   if departmentCode <= 0 then
   begin
      if Application.MessageBox(PChar('Не обраний Підрозділ ... УВАЖНО обирайте матеріали на планах !!!  Продовжити ??'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;
   end;
   }

    if departmentCode > 0 then
    begin
      //planFilter.departmentRef := ENDepartmentRef.Create;
      //planFilter.departmentRef.code := departmentCode;

      TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      depCodes := TempENDepartment.getDepartmentCodesDown(departmentCode);
      AddCondition(condition, 'departmentrefcode in (' + depCodes + ')');
    end;


    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;

    if budgetCode > 0 then
    begin
      planFilter.budgetRef := ENDepartmentRef.Create;
      planFilter.budgetRef.code := budgetCode;
    end;

       
    planFilter.formRef :=  ENPlanWorkFormRef.Create;
    ///// 21.02.11 Разрешаем выбирать и ВНЕплановые тоже !!!
    //planFilter.formRef.code := ENPLANWORKFORM_PLANNED;
    if rbPlanned.Checked then
      planFilter.formRef.code := ENPLANWORKFORM_PLANNED
    else if rbNonePlanned.Checked then
      planFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;
    /////

    try
      planFilter.yearGen := StrToInt(edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    end;


    //if edtMonthGen.ItemIndex = -1 then
    if edtMonthGen.ItemIndex <= 0 then
    begin
      //Application.MessageBox(PChar('Выберите месяц!'), PChar('Внимание!'), MB_ICONWARNING);
      //Exit;
    end
    else
      planFilter.monthGen := edtMonthGen.ItemIndex; //+ 1;

    // 30.01.13 Это есть в сервере
    // AddCondition(condition, ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');

    {***
    if chbIsMaster.Checked then
    begin
      AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ masterMOLCode+''')');
    end;
    ***}

    //mCondition := ' and ei.kindrefcode <> ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT);

    ///////
    { ВРТУ
    if budgetCode = 75000011 then
      if edtPriConnectionNumber.Text <> '' then
        planFilter.priConnectionNumber := edtPriConnectionNumber.Text;
    }
    ///////


    
    //if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL) then


    planFilter.conditionSQL := condition;

   // UpdateMaterials_(planFilter, mCondition);



   ////// ESTIMATE'ы ///////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////////////
   eCondition := '';

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    //pFilter := ENPlanWorkFilter.Create;
    //SetNullIntProps(pFilter);
    //SetNullXSProps(pFilter);

    eFilter.materialRef := TKMaterialsRef.Create;
    eFilter.materialRef.code := materialCode;

    eFilter.kindRef := ENEstimateItemKindRef.Create;
    //eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    /////
    if chbGSMOnly.Checked then
        eFilter.kindRef.code := ENESTIMATEITEMKIND_GSM
    else
        eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;
    /////

    eFilter.statusRef := ENEstimateItemStatusRef.Create;
    eFilter.statusRef.code := ENESTIMATEITEMSTATUS_PLANNED;

    // 30.01.13 Уехало на сервер
    //eCondition := 'enestimateitem.countfact > 0 and ' +
    //              'enestimateitem.code not in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct)';

    if  ( Length(eCondition) > 0 ) then eFilter.conditionSQL := eCondition;

    eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    ///// 22.01.13
    // orderFilter := nil;
    orderFilter := RQOrderFilter.Create;
    SetNullIntProps(orderFilter);
    SetNullXSProps(orderFilter);

    if chbOrdered.Checked then
    begin
      if orderCode > 0 then
        orderFilter.code := orderCode
      else begin
        orderFilter.orderPeriod := TXSDate.Create;
        {
        orderFilter.orderPeriod.Year := edtYearOrder.ItemIndex + 2009;
        orderFilter.orderPeriod.Month := edtMonthOrder.ItemIndex + 1;
        orderFilter.orderPeriod.Day := 1;
        }
        orderFilter.orderPeriod.XSToNative(GetXSDate(EncodeDate(edtYearOrder.ItemIndex + 2009, edtMonthOrder.ItemIndex + 1, 1)));

        orderFilter.kindRef := RQOrderKindRef.Create;
        if rbPlanned.Checked then
          orderFilter.kindRef.code := RQORDER_KIND_OE_PLANNED_AUTO
        else if rbNonePlanned.Checked then
          orderFilter.kindRef.code := RQORDER_KIND_OE_NOPLANNED;
      end;
    end;
    /////


    Application.ProcessMessages;



    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!
    // ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, planFilter);

    ENEstimateItemList := TempENEstimateItem.getDetailedEstimateListForTender(eFilter, planFilter, orderFilter,
                                                                              chbPlanned.Checked, chbOrdered.Checked, chbPresent.Checked);



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

           Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

           AddCheckBox(1, i+1, false, false);

         {
         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;
         }

         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!
         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
         // ПОЛЕ не двигать ... !!! выгребаються данные из колонки !!!!

         Cells[3,i+1] := ENEstimateItemList.list[i].measureType;

        if ENEstimateItemList.list[i].planRefDateStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENEstimateItemList.list[i].planRefDateStart);

         Cells[5, i+1] := ENEstimateItemList.list[i].planRefDepartmentName;

         Cells[6,i+1] := ENEstimateItemList.list[i].invNumber ;
         Cells[7,i+1] := ENEstimateItemList.list[i].elementName ;

         /////
         strOrder := ENEstimateItemList.list[i].orderNumber;
         if strOrder <> '' then
         begin
           if ENEstimateItemList.list[i].orderPeriod <> nil then
             //strOrder := strOrder + ', ' + MonthesNames[ENEstimateItemList.list[i].orderPeriod.Month] + ' ' +
             //            IntToStr(ENEstimateItemList.list[i].orderPeriod.Year) + ' р.';
               strOrder := strOrder + ', ' +
               DateToStr(EncodeDate(ENEstimateItemList.list[i].orderPeriod.Year,
                                    ENEstimateItemList.list[i].orderPeriod.Month,
                                    ENEstimateItemList.list[i].orderPeriod.Day));
         end;
         Cells[8,i+1] := strOrder;

         strContract := ENEstimateItemList.list[i].orgName;
         if strContract <> '' then
         begin
           if ENEstimateItemList.list[i].contractNumber <> '' then
           begin
             strContract := strContract + ', дог. № ' + ENEstimateItemList.list[i].contractNumber;

            if ENEstimateItemList.list[i].contractDate <> nil then
              strContract := strContract + ' від ' +
                DateToStr (EncodeDate(ENEstimateItemList.list[i].contractDate.Year,
                                      ENEstimateItemList.list[i].contractDate.Month,
                                      ENEstimateItemList.list[i].contractDate.Day));
           end;
         end;
         Cells[9,i+1] := strContract;
         /////

         Cells[10,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[11,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[12,i+1] := ENEstimateItemList.list[i].planType;
         Cells[13,i+1] := ENEstimateItemList.list[i].planState;

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

     ClearControls([edtContractCount, edtInContract, edtContractRest]);
     
     // Автоматически выдергиваем непривязанный остаток по договору и выбранному материалу
     getRestCountByContract(finDocCode, materialCode);

     //sgENEstimateItemClick(nil);
   /////////////////////////////////////////////////////////////////////////////
end;

procedure TfrmMaterials2Contracts.btnAutoAllocateMaterialCountClick(Sender: TObject);
begin
  AutoAllocateMaterialCount;
end;

procedure TfrmMaterials2Contracts.AutoAllocateMaterialCount;
var i, tmp: Integer;
    contractCount, estimateCount, rest: Double;
    tmpSum: Double;
begin
  CheckGrid(sgENEstimateItem, 1, false);

  edtContractRest.Text := '';
  edtInContract.Text := '';
    
  if edtContractCount.Text = '' then Exit;

  try
    contractCount := StrToFloat(edtContractCount.Text);
  except
    on EConvertError do Exit;
  end;

  //CheckGrid(sgENEstimateItem, 1, false);

  try
    tmp := StrToInt(sgENEstimateItem.Cells[0, 1]);
  except
    on EConvertError do Exit;
  end;

  rest := contractCount;

  tmpSum := 0;
  
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    //if rest <= 0 then Exit;
    
    //sgSelectedCounters.GetCheckBoxState(1, i, state);
    try
      estimateCount := StrToFloat(sgENEstimateItem.Cells[2, i]);
    except
      on EConvertError do Continue;
    end;

    //estimateCount := Conv(estimateCount, 6);

    if rest < estimateCount then break;

    sgENEstimateItem.SetCheckBoxState(1, i, true);

    //tmpSum := tmpSum + estimateCount;

    rest := rest - estimateCount;
    //rest := Conv(rest - estimateCount, 6);
  end;

  ///// 22.01.13
  {
  edtContractRest.Text := FloatToStr(rest);
  edtInContract.Text := FloatToStr(contractCount - rest);
  }
  
  //ShowMessage('rest: ' + FloatToStr(rest) + #13#10 +
  //            'tmpSum: ' + FloatToStr(tmpSum));
  
  edtContractRest.Text := FloatToStr(Conv(rest, 6));
  edtInContract.Text := FloatToStr(Conv(contractCount - rest, 6));
  /////
end;

function TfrmMaterials2Contracts.GetCheckedMaterialsCount: Double;
var i: Integer;
    state: Boolean;
    estimateCount, totalCount: Double;
begin
  Result := 0;

  totalCount := 0;
  state := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    //if rest <= 0 then Exit;
    
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
      try
        estimateCount := StrToFloat(sgENEstimateItem.Cells[2, i]);
      except
        on EConvertError do Continue;
      end;

      totalCount := totalCount + estimateCount;
    end;
  end;

  Result := totalCount;
end;

procedure TfrmMaterials2Contracts.sgENEstimateItemCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
var checkedCount, checkedCountNew, contractCount: Double;
begin
  edtContractRest.Text := '';
  edtInContract.Text := '';
  
  if edtContractCount.Text = '' then
  begin
    Application.MessageBox(PChar('Введіть кількість матеріалу в договорі!'), PChar('Увага!'), MB_ICONWARNING);
    edtContractCount.SetFocus;
    if State then
      sgENEstimateItem.SetCheckBoxState(ACol, ARow, false);    
    Exit;
  end;

  try
    contractCount := StrToFloat(edtContractCount.Text);
  except
    on EConvertError do Exit;
  end;

  checkedCount := GetCheckedMaterialsCount;
  //ShowMessage(FloatToStr(checkedCount));

  if checkedCount > contractCount then
  begin
    Application.MessageBox(PChar('Кількість обраних Вами матеріалів з плану перевищує кількість у договорі!'),
                           PChar('Увага!'), MB_ICONWARNING);
    if State then
      sgENEstimateItem.SetCheckBoxState(ACol, ARow, false);

    checkedCountNew := GetCheckedMaterialsCount;

    edtInContract.Text := FloatToStr(checkedCountNew);
    edtContractRest.Text := FloatToStr(contractCount - checkedCountNew);

    Exit;
  end;

  edtInContract.Text := FloatToStr(checkedCount);
  edtContractRest.Text := FloatToStr(contractCount - checkedCount);

end;

procedure TfrmMaterials2Contracts.edtContractCountChange(Sender: TObject);
begin
  AutoAllocateMaterialCount;
end;

procedure TfrmMaterials2Contracts.btnAddMaterialsClick(Sender: TObject);
var
   TempENEstimateItem2Contract: ENEstimateItem2ContractControllerSoapPort;
   obj: ENEstimateItem2Contract;
   i, n, {materialCode, ??? 21.02.11 какого хрена это тут было ???} eArrCount : Integer;
   eList : ENEstimateItemShortList;
   eArr :  ArrayOfENEstimateItemShort;
   eObj :  ENEstimateItemShort;
   state, selected : boolean;

   TempENResponsibles: ENResponsiblesControllerSoapPort;
   respFilter: ENResponsiblesFilter;
   respList: ENResponsiblesShortList;
begin
  if materialCode < 0 then
  begin
    Application.MessageBox(PChar('Оберіть матеріал!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtMaterialName.SetFocus;
    ClearGrid(sgENEstimateItem);
    Exit;
  end;

  if edtRQOrgOrgName.Text = '' then
  begin
    Application.MessageBox(PChar('Оберіть постачальника!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtRQOrgOrgName.SetFocus;
    Exit;
  end;

  if edtContractNumber.Text = '' then
  begin
    Application.MessageBox(PChar('Введіть № договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  if finDocID = LOW_INT then
  begin
    Application.MessageBox(PChar('Введіть № договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте зберегти прив''язку?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  if chbOrdered.Checked then
    if Application.MessageBox(PChar('На тих позиціях заявок, де є договір, він буде змінений на обраний Вами. '
      +chr(10) + ' Також на позиціях заявок будуть перераховані "Вид сплати", "Значення сплати", "Планова дата постачання", "Планова дата сплати" відповідно до вказаного постачальника/договору. Продовжити?'),
      PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
      Exit;

  { 22.01.13 Это уже не актуально - отв. лица привязываются на справочнике договоров
  /////// Проверяем, есть ли развязка договора с отв. лицом
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

  if respList.totalCount = 0 then
  begin
    Application.MessageBox(PChar('Обраний Вами договір не зв''язаний з відповідальною особою!' + #13#10 +
                                 'Спочатку зробіть прив''язку!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  ///////
  }

  /// Проверяем, чтобы был выбран хотя бы один материал
  selected := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал у переліку матеріалів з планів!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  ///

   obj := ENEstimateItem2Contract.Create;
   SetNullIntProps(obj);
   SetNullXSProps(obj);

    ////////// Поставщик
    {
    if obj.org = nil then obj.org := RQOrg.Create();
    SetNullIntProps(obj.org);
    SetNullXSProps(obj.org);

    obj.org.id := org.id;
    obj.org.codeorg := org.codeorg;
    obj.org.name := org.name;
    obj.org.ukr_name := org.ukr_name;
    obj.org.okpo := org.okpo;
    obj.org.nalog_num := org.nalog_num;
    obj.org.svidet_num := org.svidet_num;
    obj.org.adr := org.adr;
    obj.org.tel := org.tel;
    obj.org.country := org.country;
    obj.org.region := org.region;
    obj.org.ministry := org.ministry;
    obj.org.ownership := org.ownership;
    obj.org.type_ := org.type_;
    obj.org.master_code := org.master_code;


    if org.date_svidet <> nil then
    begin
      obj.org.date_svidet := TXSDate.Create;
      obj.org.date_svidet.XSToNative(GetXSDate(EncodeDate(org.date_svidet.Year,
                                                                     org.date_svidet.Month,
                                                                     org.date_svidet.Day
                                                                     )));
    end;

    if org.likv_date <> nil then
    begin
      obj.org.likv_date := TXSDate.Create;
      obj.org.likv_date.XSToNative(GetXSDate(EncodeDate(org.likv_date.Year,
                                                                   org.likv_date.Month,
                                                                   org.likv_date.Day
                                                                   )));
    end;

    if org.date_nalogform <> nil then
    begin
      obj.org.date_nalogform := TXSDate.Create;
      obj.org.date_nalogform.XSToNative(GetXSDate(EncodeDate(org.date_nalogform.Year,
                                                                        org.date_nalogform.Month,
                                                                        org.date_nalogform.Day
                                                                        )));
    end;

    obj.org.except_flag := org.except_flag;
    obj.org.likv_flag := org.likv_flag;
    obj.org.budget_flag := org.budget_flag;

    obj.org.id_nalogform := org.id_nalogform;
    obj.org.adr_legal := org.adr_legal;
    obj.org.Primechan := org.Primechan;
    }
    obj.org := DMReports.copyOrg(org, obj.org);
    //////////

    ////////// Договор
    if finDocID > LOW_INT then
    begin
      obj.contractNumber := contractNumber;
      obj.contractDate := TXSDate.Create;
      obj.contractDate.XSToNative(GetXSDate(contractDate));
      obj.finDocCode := finDocCode;
      obj.finDocID := finDocID;
    end
    else begin
      ///// 23.12.10
      // obj.contractNumber := '';
      // Разрешаем вводить руками (не выбирая из ФК)! 
      obj.contractNumber := Trim(edtContractNumber.Text); //contractNumber;
      /////
      obj.contractDate := nil;
      obj.finDocCode := '';
      obj.finDocID := LOW_INT;
    end;
    //////////



  {
  n := 0;
  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       n := n + 1;
    end;
  end;
  }
  
  eList := ENEstimateItemShortList.Create;
  eList.totalCount := 0;
  SetLength(eArr, 0);
  //SetLength(eArr, n);
  //n := 0;

  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       eObj := ENEstimateItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       eObj.code := StrToInt(sgENEstimateItem.Cells[0, i]);
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgENEstimateItem.Cells[2, i];
       eArrCount := High(eArr) + 1;
       SetLength(eArr, eArrCount + 1);
       eArr[eArrCount] := eObj;
       //eArr[n] := eObj;
       //n := n + 1;
    end;
  end;

  eList.list := eArr;
  eList.totalCount := High(eArr) + 1;

  if (High(eArr) >= 0) then
  begin
    TempENEstimateItem2Contract := HTTPRIOENEstimateItem2Contract as ENEstimateItem2ContractControllerSoapPort;
    TempENEstimateItem2Contract.addWithEstimateList(obj, eArr);
    //TempRQOrderItem.addWithEstimateList(obj, eArr)
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  
  //materialsINCode := obj.material.code;
  //materialsINCode := LOW_INT;

  Application.MessageBox(PChar('Прив''язку збережено!'),
                         PChar('Повідомлення'), MB_ICONINFORMATION);

  btnSelectClick(Sender);

  // 31.01.13 Будем перечитывать, только если выбран конкретный материал,
  // и он совпадает с тем, который мы только что привязали
  if (materialInContractCode > LOW_INT) and (materialCode = materialInContractCode) then
    UpdateEstimateItemsInContractGrid;

  // Автоматически выдергиваем непривязанный остаток по договору и выбранному материалу
  getRestCountByContract(finDocCode, materialCode);
end;

procedure TfrmMaterials2Contracts.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmMaterials2Contracts.btnFindClick(Sender: TObject);
begin
  UpdateEstimateItemsInContractGrid;
end;

procedure TfrmMaterials2Contracts.UpdateEstimateItemsInContractGrid;
var
    ////
    i, code : Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eFilter : ENEstimateItemFilter;
    pFilter : ENPlanWorkFilter;
    //materialCode : Integer;
    conditionSQL, planCondition , eCondition : String;
    ////
    currentCount, totalCount: Double;
begin
   ClearGrid(sgENEstimateItemInContract);

   currentCount := 0;
   totalCount := 0;
   lblMaterialInContractTotal.Caption := '';

   if (edtRQOrgOrgName.Text = '') or (edtContractNumber.Text = '') then
     Exit;

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    //eFilter.statusRef := ENEstimateItemStatusRef.Create;
    //eFilter.statusRef.code := ENESTIMATEITEMSTATUS_PLANNED;

    if materialInContractCode > LOW_INT then
    begin
      eFilter.materialRef := TKMaterialsRef.Create;
      eFilter.materialRef.code := materialInContractCode;
    end;

    if finDocID = LOW_INT then
      contractNumber := Trim(edtContractNumber.Text);

    ///// 28.01.13 Упростим выбор
    {
    eFilter.conditionSQL :=  //'enestimateitem.countfact > 0 and ' +
                  'enestimateitem.code in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct where ' +
                  ' enestimateitem2contrct.orgcode in (select rqorg.code from rqorg where rqorg.codeorg = ''' + org.codeorg + ''')' +
                  ' and enestimateitem2contrct.contractnumber = ''' + contractNumber + ''')';
    }
    if finDocID = LOW_INT then
      eFilter.conditionSQL :=  //'enestimateitem.countfact > 0 and ' +
                    'enestimateitem.code in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct where ' +
                    ' enestimateitem2contrct.findocid in (select rqorg.code from rqorg where rqorg.codeorg = ''' + org.codeorg + ''')' +
                    ' and enestimateitem2contrct.contractnumber = ''' + contractNumber + ''')'
    else
      eFilter.conditionSQL :=  //'enestimateitem.countfact > 0 and ' +
                    'enestimateitem.code in (select enestimateitem2contrct.estimateitemcode from enestimateitem2contrct where ' +
                    ' enestimateitem2contrct.findocid = ' + IntToStr(finDocID) + ')';

    /////

    //eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
    eFilter.orderBySQL := ' SM.NAME, ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, ENESTIMATEITEMTYPE.CODE';

    Application.ProcessMessages;
    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!

    pFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(pFilter);
    SetNullXSProps(pFilter);

    ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, pFilter);



    //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

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

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);

         AddCheckBox(1, i+1, false, false);
         
         {
         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;
         }

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

         if ENEstimateItemList.list[i].statusRefCode <> ENESTIMATEITEMSTATUS_PLANNED then
           RowColor[i + 1] := clYellow; //$0080FF80;

         //Cells[9,i+1] := ENEstimateItemList.list[i].typeRefName;



        // Cells[8,i+1] := ENEstimateItemList.list[i].userGen;



        { if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[9,i+1] := ''
         else
           Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);
         }
         sgENEstimateItemInContract.RowCount := i + 2;
       end;

     sgENEstimateItemInContract.Row := 1;

     if materialInContractCode > LOW_INT then
       lblMaterialInContractTotal.Caption := FloatToStr(totalCount)
     else
       lblMaterialInContractTotal.Caption := '';
end;

procedure TfrmMaterials2Contracts.actDeleteExecute(Sender: TObject);
var
   TempENEstimateItem2Contract: ENEstimateItem2ContractControllerSoapPort;
   i, objCode: Integer;
   state, selected: Boolean;
begin
  /// Проверяем, чтобы был выбран хотя бы один материал
  selected := false;

  for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
  begin
    sgENEstimateItemInContract.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал у переліку матеріалів, прив''язаних до договору!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  ///

  {
  try
    objCode := StrToInt(sgENEstimateItemInContract.Cells[0,sgENEstimateItemInContract.Row]);
  except
    on EConvertError do Continue;
  end;
  }

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити прив''язку матеріала і договору?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENEstimateItem2Contract := HTTPRIOENEstimateItem2Contract as ENEstimateItem2ContractControllerSoapPort;
    {
    TempENEstimateItem2Contract.removeByEstimateCode(objCode);
    UpdateEstimateItemsInContractGrid
    }

    state := false;

    for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
    begin
      sgENEstimateItemInContract.GetCheckBoxState(1, i, state);

      if state then
      begin
        try
          objCode := StrToInt(sgENEstimateItemInContract.Cells[0, i]);
        except
          on EConvertError do Continue;
        end;

        TempENEstimateItem2Contract.removeByEstimateCode(objCode);
      end;
    end;

    UpdateEstimateItemsInContractGrid;
  end;
end;

procedure TfrmMaterials2Contracts.spbMaterialInContractNameClick(
  Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;

  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
          materialInContractCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialInContractName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
          //lblMeasurement.Caption := {'од.виміру : '+ }TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
          //lblDeliveryDate.Caption := {'строк постачання : '+ } IntToStr(TKMaterialsShort(tvDep.Selected.Data).deliveryDate){ + ' днів'}; //GetReturnValue(sgSpr_matherial, 2);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmMaterials2Contracts.spbMaterialInContractClearClick(
  Sender: TObject);
begin
  ClearGrid(sgENEstimateItemInContract);
  edtMaterialInContractName.Text := '';
  //lblMeasurement.Caption := '';
  //lblDeliveryDate.Caption := '';
  materialInContractCode := LOW_INT;
  lblMaterialInContractTotal.Caption := '';
end;

procedure TfrmMaterials2Contracts.btnContractItemsClick(Sender: TObject);
var
   frmENContractItemShow: TfrmENContractItemShow;

   TempENContract: ENContractControllerSoapPort;
   contractFilter: ENContractFilter;
   contractList: ENContractShortList;

   contractItemFilter: ENContractItemFilter;
begin
  if (finDocCode = '') or (finDocID = LOW_INT) or (org = nil) then
  begin
    Application.MessageBox(PChar('Оберіть договір!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  contractItemFilter := ENContractItemFilter.Create();
  SetNullXSProps(contractItemFilter);
  SetNullIntProps(contractItemFilter);

  /////
  contractItemFilter.contract := ENContract.Create;

  contractFilter := ENContractFilter.Create;
  SetNullIntProps(contractFilter);
  SetNullXSProps(contractFilter);
  contractFilter.finDocCode := finDocCode;
  contractFilter.finDocID := finDocID;

  TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
  contractList := TempENContract.getScrollableFilteredList(contractFilter, 0, 1);
  if High(contractList.list) > -1 then
    contractItemFilter.contract.code := contractList.list[0].code
  else
    contractItemFilter.contract.code := -1; // чтобы ничего не выбралось
  /////

  frmENContractItemShow := TfrmENContractItemShow.Create(Application, fmNormal, contractItemFilter);
  try
    if High(contractList.list) > -1 then
    begin
      frmENContractItemShow.contractCode := contractList.list[0].code;
    end
    else begin
      /// Организация //////////////////////////////////////////////////////////
      {
      if frmENContractItemShow.org = nil then
      begin
        frmENContractItemShow.org := RQOrg.Create();
        SetNullIntProps(frmENContractItemShow.org);
        SetNullXSProps(frmENContractItemShow.org);
      end;
      frmENContractItemShow.org.id := org.id; // по ИД будем смотреть на серваке ...
      frmENContractItemShow.org.codeorg := org.codeorg;
      frmENContractItemShow.org.name := org.name;
      frmENContractItemShow.org.ukr_name := org.ukr_name;
      frmENContractItemShow.org.okpo := org.okpo;
      frmENContractItemShow.org.nalog_num := org.nalog_num;
      frmENContractItemShow.org.svidet_num := org.svidet_num;
      frmENContractItemShow.org.adr := org.adr;
      frmENContractItemShow.org.tel := org.tel;
      frmENContractItemShow.org.country := org.country;
      frmENContractItemShow.org.region := org.region;
      frmENContractItemShow.org.ministry := org.ministry;
      frmENContractItemShow.org.ownership := org.ownership;
      frmENContractItemShow.org.type_ := org.type_;
      frmENContractItemShow.org.master_code := org.master_code;

      //frmENContractItemShow.org.date_svidet := TXSDate.Create;
      //frmENContractItemShow.org.likv_date := TXSDate.Create;
      //frmENContractItemShow.org.dateNalogform := TXSDate.Create;

      if org.date_svidet <> nil then
      begin
        frmENContractItemShow.org.date_svidet := TXSDate.Create;
        frmENContractItemShow.org.date_svidet.XSToNative(org.date_svidet.NativeToXS);
      end;

      if org.likv_date <> nil then
      begin
        frmENContractItemShow.org.likv_date := TXSDate.Create;
        frmENContractItemShow.org.likv_date.XSToNative(org.likv_date.NativeToXS);
      end;

      if org.date_nalogform <> nil then
      begin
        frmENContractItemShow.org.date_nalogform := TXSDate.Create;
        frmENContractItemShow.org.date_nalogform.XSToNative(org.date_nalogform.NativeToXS);
      end;      

      frmENContractItemShow.org.except_flag := org.except_flag;
      frmENContractItemShow.org.likv_flag := org.likv_flag;
      frmENContractItemShow.org.budget_flag := org.budget_flag;

      frmENContractItemShow.org.id_nalogform := org.id_nalogform;
      frmENContractItemShow.org.adr_legal := org.adr_legal;
      frmENContractItemShow.org.Primechan := org.Primechan;
      }
      frmENContractItemShow.org := DMReports.copyOrg(org, frmENContractItemShow.org);
      //////////////////////////////////////////////////////////////////////////

      /// Договор //////////////////////////////////////////////////////////////
      frmENContractItemShow.contractNumber := contractNumber;
      frmENContractItemShow.contractDate := StrToDate(DateToStr(contractDate));
      frmENContractItemShow.finDocCode := finDocCode;
      frmENContractItemShow.finDocID := finDocID;
      //////////////////////////////////////////////////////////////////////////
    end;
    
    frmENContractItemShow.contractDescription := edtContractNumber.Text;

    with frmENContractItemShow do
      if ShowModal = mrOk then
      begin

      end;
  finally
    frmENContractItemShow.Free;
  end;
end;

procedure TfrmMaterials2Contracts.btnReportClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  //reportName: String;
begin
  if (finDocCode = '') or (finDocID = LOW_INT) or (org = nil) then
  begin
    Application.MessageBox(PChar('Оберіть договір!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;
  
  SetLength(argNames, 3);
  SetLength(args, 3);

  argNames[0] := 'findoccode';
  args[0] := finDocCode;

  argNames[1] := 'contractnumber';
  args[1] := contractNumber;

  argNames[2] := 'contractdate';
  args[2] := DateToStr(contractDate);

  makeReport('Tender/MaterialsByContract', argNames, args, 'xls');
end;

procedure TfrmMaterials2Contracts.actSelectAllExecute(Sender: TObject);
begin
  CheckGrid(sgENEstimateItemInContract, 1, true);
end;

procedure TfrmMaterials2Contracts.actClearAllExecute(Sender: TObject);
begin
  CheckGrid(sgENEstimateItemInContract, 1, false);
end;

procedure TfrmMaterials2Contracts.actInsertResp2ContractExecute(
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
        {
        //actUpdateResp2ContractExecute(Sender);

        // Не будем спрашивать, откроем сразу
        /// if Application.MessageBox(PChar('Зв''язок додано! Відкрити перелік відповідальних осіб для вибору?'),
        ///                          PChar('Увага!'), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1) = IDYES then
        /// begin

          //*** spbENResponsiblesClick(Sender);
          SetResponsibleByFinDocID; // Если одно отв. лицо по договору, засетим его сразу, если больше - откроем окно для выбора

        /// end;
        }
        Application.MessageBox(PChar('Зв''язок договору з відповідальною особою додано!' + #13#10 +
                                     'Тепер можна прив''язувати матеріали до цього договору!'), PChar('Увага!'), MB_ICONINFORMATION);
      end;
    finally
      frmENResponsibles2FINContractsEdit.Free;
    end;
  finally
    ENResponsibles2FINContractsObj.Free;
  end;
end;

procedure TfrmMaterials2Contracts.actEditOMTSResponsiblesExecute(
  Sender: TObject);
begin
  frmOMTSResponsiblesEdit := TfrmOMTSResponsiblesEdit.Create(Application, dsInsert);
  try
    frmOMTSResponsiblesEdit.ShowModal;
  finally
    frmOMTSResponsiblesEdit.Free;
  end;
end;

procedure TfrmMaterials2Contracts.getRestCountByContract(
  finDocCode: String; materialCode: Integer);
var TempENEstimateItem2Contract: ENEstimateItem2ContractControllerSoapPort;
    restCount: TXSDecimal;
    strRestCount: String;
    tmpRestCount: Double;
begin
  edtContractCount.Text := '';
  
  if materialCode <= 0 then
  begin
    //Application.MessageBox(PChar('Оберіть матеріал!'),
    //                       PChar('Увага!'), MB_ICONWARNING);
    edtMaterialName.SetFocus;
    //ClearGrid(sgENEstimateItem);
    Exit;
  end;

  if finDocCode = '' then
  begin
    //Application.MessageBox(PChar('Введіть № договору!'),
    //                       PChar('Увага!'), MB_ICONWARNING);
    edtContractNumber.SetFocus;
    Exit;
  end;

  TempENEstimateItem2Contract := HTTPRIOENEstimateItem2Contract as ENEstimateItem2ContractControllerSoapPort;
  restCount := TempENEstimateItem2Contract.getRestCountByContract(finDocCode, materialCode);
  if restCount <> nil then
  begin
    strRestCount := restCount.DecimalString;

    tmpRestCount := 0;

    if strRestCount <> '' then
      try
        tmpRestCount := StrToFloat(strRestCount);
      except
        on EConvertError do tmpRestCount := 0;
      end;

    if tmpRestCount > 0 then
      edtContractCount.Text := FloatToStr(Conv(tmpRestCount, 6));
  end;

  edtContractCountChange(Self);
end;

procedure TfrmMaterials2Contracts.chbOrderedClick(Sender: TObject);
begin
  HideControls([lblYearOrder, edtYearOrder, lblMonthOrder, edtMonthOrder,
                lblRQOrder, edtRQOrder, spbRQOrder, spbRQOrderClear], (not chbOrdered.Checked));
                
  if not chbOrdered.Checked then
    spbRQOrderClearClick(Sender);
end;


procedure TfrmMaterials2Contracts.chbPlannedClick(Sender: TObject);
begin
  HideControls([lblYearGen, edtYearGen, lblMonthGen, edtMonthGen,
                lblDepartment, edtDepartment, spbDepartment, spbDepartmentClear,
                lblENElementName, edtENElementName, spbENElement, spbENElementClear,
                lblENBudgetName, edtENBudgetName, spbENBudget, spbENBudgetClear], (not chbPlanned.Checked));
end;

procedure TfrmMaterials2Contracts.spbRQOrderClearClick(Sender: TObject);
begin
  edtRQOrder.Text := '';
  orderCode := LOW_INT;

  if chbOrdered.Checked then
    HideControls([lblYearOrder, edtYearOrder, lblMonthOrder, edtMonthOrder], false);
end;

procedure TfrmMaterials2Contracts.spbRQOrderClick(Sender: TObject);
var
  frmRQOrderShow : TfrmRQOrderShow;
  orderFilter: RQOrderFilter;
begin
  orderFilter := RQOrderFilter.Create;
  SetNullIntProps(orderFilter);
  SetNullXSProps(orderFilter);

  orderFilter.kindRef := RQOrderKindRef.Create;
  if rbPlanned.Checked then
    orderFilter.kindRef.code := RQORDER_KIND_OE_PLANNED_AUTO
  else if rbNonePlanned.Checked then
    orderFilter.kindRef.code := RQORDER_KIND_OE_NOPLANNED;

  frmRQOrderShow := TfrmRQOrderShow.Create(Application, fmNormal, orderFilter);
  try
    frmRQOrderShow.DisableActions([frmRQOrderShow.actInsert, frmRQOrderShow.actDelete, frmRQOrderShow.actEdit,
                                   frmRQOrderShow.actConfirm, frmRQOrderShow.actUnConfirm]);
    with frmRQOrderShow do
      if ShowModal = mrOk then
      begin
        try
          orderCode := StrToInt(GetReturnValue(sgRQOrder, 0));
          edtRQOrder.Text := '№ ' + GetReturnValue(sgRQOrder, 1) + ' (період: ' + GetReturnValue(sgRQOrder, 3) + ')';
          HideControls([lblYearOrder, edtYearOrder, lblMonthOrder, edtMonthOrder]);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrderShow.Free;
  end;
end;

procedure TfrmMaterials2Contracts.actSelectPlannedExecute(Sender: TObject);
var i, statusCode: Integer;
begin
  for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
  begin
    statusCode := Integer(sgENEstimateItemInContract.Objects[1, i]);
    if statusCode = ENESTIMATEITEMSTATUS_PLANNED then
      sgENEstimateItemInContract.SetCheckBoxState(1, i, true)
    else
      sgENEstimateItemInContract.SetCheckBoxState(1, i, false);
  end;
end;

procedure TfrmMaterials2Contracts.actSelectNotPlannedExecute(Sender: TObject);
var i, statusCode: Integer;
begin
  for i := 1 to sgENEstimateItemInContract.RowCount - 1 do
  begin
    statusCode := Integer(sgENEstimateItemInContract.Objects[1, i]);
    if statusCode <> ENESTIMATEITEMSTATUS_PLANNED then
      sgENEstimateItemInContract.SetCheckBoxState(1, i, true)
    else
      sgENEstimateItemInContract.SetCheckBoxState(1, i, false);
  end;
end;

procedure TfrmMaterials2Contracts.btnReportBillByContractClick(
  Sender: TObject);
begin
  // inherited;
	 frmreportTenderMaterials := TfrmreportTenderMaterials.Create(Application, dsInsert);
 try
	 frmreportTenderMaterials.ShowModal;
 finally
	 frmreportTenderMaterials.Free;
 end;
end;

end.
