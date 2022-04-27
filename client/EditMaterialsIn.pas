unit EditMaterialsIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController, DialogFormUnit, ChildFormUnit,
  RQOrderItemController, ComCtrls;

type
  TfrmMaterialsInEdit = class(TDialogForm)
    Panel1: TPanel;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    lblENBudgetName: TLabel;
    spbOrder: TSpeedButton;
    spbOrderClear: TSpeedButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    edtOrderName: TEdit;
    chkkindrefcodemat: TCheckBox;
    btnSelect: TBitBtn;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
  	HTTPRIORQBillItem: THTTPRIO;
   	HTTPRIORQOrderItem: THTTPRIO;
    HTTPRIORQInvoiceItem: THTTPRIO;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtMolName: TEdit;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    btnAddMaterials: TBitBtn;
    Panel2: TPanel;
    sgOrderItem: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    edtCorrCount: TEdit;
    lblCorrPrice: TLabel;
    lblCorrCount: TLabel;
    edtCorrPrice: TEdit;
    lblContract: TLabel;
    lblMaterialGroup: TLabel;
    edtContract: TEdit;
    edtMaterialGroup: TEdit;
    spbMaterialGroup: TSpeedButton;
    spbMaterialGroupClear: TSpeedButton;
    spbContract: TSpeedButton;
    spbContractClear: TSpeedButton;
    HTTPRIORQFKOrderItem: THTTPRIO;
    cbGroupItemMaterial: TCheckBox;
    edtCorrMaterialTxt: TEdit;
    lblCorrMaterialTxt: TLabel;
    cbOrg: TCheckBox;
    edtDateRealiz: TDateTimePicker;
    lblDateRealiz: TLabel;
    lblENDepartmentName: TLabel;
    edtENDepartmentName: TEdit;
    spbENDepartment: TSpeedButton;
    spbENDepartmentClear: TSpeedButton;
    edtStorageZone: TEdit;
    lblStorageZone: TLabel;
    spbStorageZone: TSpeedButton;
    spbStorageZoneClear: TSpeedButton;
    procedure spbOrderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbOrderClearClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure sgOrderItemClick(Sender: TObject);

    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddMaterialsClick(Sender: TObject);




   function makeEstimateCondition(): String;
   procedure sgOrderItemDblClick(Sender: TObject);
    procedure spbMaterialGroupClick(Sender: TObject);
    procedure spbMaterialGroupClearClick(Sender: TObject);
    procedure spbContractClearClick(Sender: TObject);
    procedure spbContractClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbStorageZoneClearClick(Sender: TObject);
    procedure spbStorageZoneClick(Sender: TObject);
         
  private
    { Private declarations }
  public
    { Public declarations }
    //RQOrderItemObj: RQOrderItem;

    isBill : Boolean;
    accountingTypeCode : Integer;

    elementCode: Integer;
    elementName: String;
    orderCode: Integer;
    orderName: String;
    planCodes: String;
    planFilter: ENPlanWorkFilter;
    orderItemFilter: RQOrderItemFilter;
    MOLCode : String;
    departmentCode : Integer;
    departmentName : String;
    materialsINCode : Integer;
    billCode, billType : Integer;
    invoiceCode : Integer;
    materialGroupCode : Integer;
    contractNumber : String;
    orgId : Integer;
    kindCode: Integer;
    storageCode : Integer;
    zoneCode : Integer;

    //procedure UpdateMaterials(planCodes: String); overload;
    procedure UpdateMaterials_(orderItemFilter: RQOrderItemFilter);
    procedure updateEstimateItemGrid_();
    procedure refreshEstimateItemGrid_();
  end;

var
  frmMaterialsInEdit: TfrmMaterialsInEdit;


implementation

{$R *.dfm}

uses ShowENEPRen, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, TKMaterialsController, GridHeadersUnit,
  {ENPlanWorkController, }ENPlanWorkKindController, EditTKMaterials,
  EditENPlanWork, DMReportsUnit, ShellAPI, Globals,
  ENPlanWorkItemController, EditENPlanWorkItem, ENEstimateItemController,
  XSBuiltIns, FINMolController, ShowFINMol, ENDepartment2EPRenController,
  ENEstimateItemKindController, EditRQOrderItem, RQOrderController,
  TKMeasurementController, EditRQBillItem, EditRQInvoiceItem,
  ShowRQOrder, RQOrderKindController, RQOrderStatusController,
  RQBillItemController, RQInvoiceItemController, RQDDSCodesController,
  ShowTKMaterials, ShowFINServicesObject, ENServicesObjectController,
  RQFKOrderItemController, RQOrderItemStatusController, RQOrgController,
  RQOrderResourceController, RQStorageZoneController, RQStorageController,
  ShowRQStorageZone;

var



  RQOrderItemHeaders: array [1..12] of String =
       ( 'Код строки заявки'
          , '№'
          ,'код РГК'
          ,'Матеріал(Довідник)'
          ,'Од. виміру(Довідник)'
          ,'Кількість'
          ,'Ціна (без ПДВ)'
          ,'Сума (без ПДВ)'
          ,'Назва матеріалу (Текст)'
          ,'Од. виміру (Текст)'
          ,'Примітка'
          ,'Код матеріала'
        );


{  RQOrderItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва'
          ,'Од. вим.'
          ,'Кіл-ть'
          ,'Ціна'
          ,'Вартість'
          ,'Строк постачання'
        );
}
{
  ENPlanWorkHeaders: array [1..17] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          ,'Вид робіт'
          ,'Тип робіт'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  ENPlanWorkItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'Кільк. м-лу'
          ,'Джерело нормативу'
          ,'Кільк. робіт'
          ,'Норма часу на од.'
          ,'Всього часу'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );
}

  ENEstimateItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість'
          //,'залишок'
          ,'Од. вим.'
          ,'у заявці №'
          ,'за період'
          ,'бюджетотримач'
          ,'об. планування'
          ,'підрозділ'
        );
                

procedure TfrmMaterialsInEdit.spbOrderClick(Sender: TObject);
var
   frmRQOrderShow: TfrmRQOrderShow;
   f : RQOrderFilter;
begin
    f := RQOrderFilter.create();
    SetNullIntProps(f);
    SetNullXSProps(f);

    f.rqOrderResource := RQOrderResource.Create;

    if (billType = RQBILL_TYPE_TMC) then
    begin
      f.rqOrderResource.code := RQORDER_RESOURCE_TMC;
      f.conditionSQL := ' rqorder.kindrefcode not in ('+
        IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES) + ', ' + IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) + ')'
    end else
    begin
      f.rqOrderResource.code := RQORDER_RESOURCE_SERVICES;
      f.conditionSQL := ' rqorder.kindrefcode in (' +
        IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES) + ', ' + IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) + ')';
    end;

    f.statusRef := RQOrderStatusRef.Create;
    f.statusRef.code := RQORDER_STATUS_WORK_IN_MTS;

   frmRQOrderShow := TfrmRQOrderShow.Create(Application,fmNormal, f);
   try

      with frmRQOrderShow do
      begin
        DisableActions([ {actNoFilter, }actEdit, actInsert, actDelete ]);
        if ShowModal = mrOk then
        begin
            try
              //orderCode := ENDepartmentShort(tvDep.Selected.Data).code;
              orderCode := StrToInt(GetReturnValue(sgRQOrder,0));
              orderName := GetReturnValue(sgRQOrder,1);
              //budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtOrderName.Text := orderName;
              Edit1.Text := GetReturnValue(sgRQOrder,3);
              Edit2.Text := GetReturnValue(sgRQOrder,6);
              Edit3.Text := GetReturnValue(sgRQOrder,7);
              Edit4.Text := GetReturnValue(sgRQOrder,8);
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
      frmRQOrderShow.Free;
   end;
end;

procedure TfrmMaterialsInEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtOrderName, Edit1, Edit2, Edit3, Edit4, edtMaterialGroup, edtContract,
    edtENDepartmentName, edtStorageZone]);

{  DisableControls([,spbENBudget, spbENBudgetClear
                   ,spbDepartment, spbDepartmentClear
                   ]);
 }
  SetGridHeaders(RQOrderItemHeaders, sgOrderItem.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

  SetFloatStyle([edtCorrCount, edtCorrPrice]);

  edtMonthGen.ItemIndex := -1;

  HideControls([cbOrg], billType = RQBILL_TYPE_TMC);

    // 12.04.2013 для счетчиков и для счетов прячется выбор зоны
  HideControls([lblStorageZone, edtStorageZone, spbStorageZone, spbStorageZoneClear],
     ((billType <> RQBILL_TYPE_TMC) or (isBill)));

  if (billType = RQBILL_TYPE_SERVICES) then
  begin
    HideControls([lblMaterialGroup, edtMaterialGroup, spbMaterialGroup, spbMaterialGroupClear, spbContract, spbContractClear]);
    HideControls([lblContract, edtContract], not isBill);
    cbGroupItemMaterial.Caption := 'розділити строки у рахунку';
    lblCorrMaterialTxt.Caption := 'відкоригована назва послуги';
    sgOrderItem.ColumnHeaders[3] := 'Послуга (Довідник)';
    sgENEstimateItem.ColumnHeaders[1] := 'Послуга';
  end;

  if not (kindCode=RQFKORDER_KIND_PRIHOD_BUFET) then HideControls([lblDateRealiz,edtDateRealiz])
  else HideControls([lblDateRealiz,edtDateRealiz],false);


  if (isBill) then
    cbGroupItemMaterial.Visible := true
  else
    cbGroupItemMaterial.Visible := false;

  //edtContract.Text := '234';
  //contractNumber := '234';

  if (materialsINCode <> LOW_INT) then
  begin
      btnSelectClick(Sender);
  end;

end;

procedure TfrmMaterialsInEdit.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
//  edtENElementName.Text := '';
end;

procedure TfrmMaterialsInEdit.spbOrderClearClick(
  Sender: TObject);
begin
  orderCode := 0;
  edtOrderName.Text := '';
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
end;

function TfrmMaterialsInEdit.makeEstimateCondition(): String;
var
  str, conditionSQL, planCondition : String;

begin
    planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';

    if departmentCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.departmentrefcode = ' + IntToStr(departmentCode));
    end;

{
    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;

    if budgetCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.budgetrefcode = ' + IntToStr(budgetCode));
    end;
}
    //planFilter.kind := ENPlanWorkKind.Create;
    AddCondition(planCondition, 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT));


    try
      //planFilter.yearGen := StrToInt(edtYearGen.Text);
       AddCondition(planCondition, 'enplanwork.yeargen = ' + edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('Выберите год!'), PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    end;


      //planFilter.monthGen := edtMonthGen.ItemIndex + 1;
      AddCondition(planCondition, 'enplanwork.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1));

    //condition := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';
{
    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;

    planFilter.conditionSQL := condition;


    AddCondition(conditionSQL, planFilter.conditionSQL);
}

    AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    // может условие по СТАТУСАМ !!!
    planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    AddCondition(conditionSQL, planCondition);

    Result := conditionSQL;
end;


procedure TfrmMaterialsInEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;
    orderItem : RQOrderItem;
    condition : String;
    ENMaterialsList: ENMaterialsShortList;
begin

    if (orderCode <=0 ) and (materialGroupCode <= 0) and (contractNumber = '') then
      begin
        Application.MessageBox(PChar('Введіть хоча б один критерій для пошуку!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;

    ////////////////////////////////////////////////////////////////////////////

    orderItemFilter := RQOrderItemFilter.Create;
    SetNullIntProps(orderItemFilter);
    SetNullXSProps(orderItemFilter);

    orderItemFilter.statusRef := RQOrderItemStatusRef.Create;
    orderItemFilter.statusRef.code := RQORDERITEM_STATUS_GOOD;

    ////////////////////////////////////////////////////////////////////
    // +++ 23.02.2012 +++ по выбору пользователя...
    // +++ 22.02.2012 +++ не всегда поставщик будет тот, что в заявке!!!
    if ((cbOrg.Checked = false) and (billType = RQBILL_TYPE_SERVICES)) then
    if (orgId <> LOW_INT) then
    begin
      orderItemFilter.org := RQOrg.Create;
      orderItemFilter.org.code := LOW_INT;
      orderItemFilter.org.id := orgId;
    end;
    ////////////////////////////////////////////////////////////////////

    if orderCode > 0 then
     begin
      orderItemFilter.orderRef := RQOrderRef.Create;
      orderItemFilter.orderRef.code := orderCode;
     end;

    if materialGroupCode > 0 then
     begin
      orderItemFilter.conditionSQL := 'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode) +
         ' and rqorder.statusrefcode = '+ IntToStr(RQORDER_STATUS_WORK_IN_MTS) +
         ' and rqorder.kindrefcode in ('+ IntToStr( RQORDER_KIND_OE_PLANNED_AUTO ) +','+ IntToStr(RQORDER_KIND_OE_NOPLANNED) + ')';
      orderItemFilter.orderBySQL := 'TKMATERIALS.NAME';
     end;

    if contractNumber <> '' then
     begin
        if (billType = RQBILL_TYPE_TMC) then
        begin
          orderItemFilter.conditionSQL :=
             'rqorder.kindrefcode in ('+ IntToStr( RQORDER_KIND_OE_PLANNED_AUTO ) +','+ IntToStr(RQORDER_KIND_OE_NOPLANNED) +')'+
             ' and rqorder.statusrefcode = '+ IntToStr(RQORDER_STATUS_WORK_IN_MTS) +
             ' and rqorderitem.contractnumber = '''+contractNumber+'''';
          orderItemFilter.orderBySQL := 'TKMATERIALS.NAME';
        end else
        begin
          orderItemFilter.conditionSQL :=
             'rqorder.kindrefcode in ('+ IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES) + ',' + IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) +')'+
             ' and rqorder.statusrefcode = '+ IntToStr(RQORDER_STATUS_WORK_IN_MTS) +
             ' and rqorderitem.contractnumber = '''+contractNumber+'''';
          orderItemFilter.orderBySQL := 'TKMATERIALS.NAME';
        end
     end;

     //////////////////////
     // 31.01.2012 +++ если счет на оплату Услуг без договора
     // берем строки заявки тож без договоров
     if (contractNumber = '') and (billType = RQBILL_TYPE_SERVICES) then
     begin
       if (isBill) then
       begin
          orderItemFilter.conditionSQL :=
             'rqorder.kindrefcode in ('+ IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES) + ',' + IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) +')'+
             ' and rqorder.statusrefcode = '+ IntToStr(RQORDER_STATUS_WORK_IN_MTS) +
             ' and coalesce(rqorderitem.contractnumber,'''') = ''''';
          orderItemFilter.orderBySQL := 'TKMATERIALS.NAME';
       end else
       begin
          orderItemFilter.conditionSQL :=
             'rqorder.kindrefcode in ('+ IntToStr(RQORDER_KIND_OE_PLANNED_SERVICES) + ',' + IntToStr(RQORDER_KIND_OE_NOPLANNED_SERVICES) +')'+
             ' and rqorder.statusrefcode = '+ IntToStr(RQORDER_STATUS_WORK_IN_MTS);
          orderItemFilter.orderBySQL := 'TKMATERIALS.NAME';
       end
     end;
     //////////////////////

    UpdateMaterials_(orderItemFilter);
    edtCorrCount.Text := '';
    edtCorrPrice.Text := '';
    edtCorrMaterialTxt.Text := '';
end;


procedure TfrmMaterialsInEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmMaterialsInEdit.UpdateMaterials_(orderItemFilter: RQOrderItemFilter);
var i, j, LastCount: Integer;
    TempRQOrderItem: RQOrderItemControllerSoapPort;
    RQOrderItemList: RQOrderItemShortList;
begin
  if orderItemFilter = nil then Exit;

  for i := 1 to sgOrderItem.RowCount - 1 do
    for j := 0 to sgOrderItem.ColCount - 1 do
      sgOrderItem.Cells[j, i] := '';

  sgOrderItem.RowCount := 2;

  TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  RQOrderItemList := TempRQOrderItem.getGeneralList(orderItemFilter,0,-1);
  if RQOrderItemList = nil then Exit;


  LastCount := High(RQOrderItemList.list);

  if LastCount > -1 then
    sgOrderItem.RowCount := LastCount + 2
  else
    sgOrderItem.RowCount := 2;


   with sgOrderItem do
     for i := 0 to LastCount do
     begin
       Application.ProcessMessages;

            if RQOrderItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQOrderItemList.list[i].code)
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := IntToStr(i + 1);
            Cells[2,i+1] := RQOrderItemList.list[i].ddsCodesTxtCode;
            Cells[3,i+1] := RQOrderItemList.list[i].materialName;
            Cells[4,i+1] := RQOrderItemList.list[i].measurementName;

            if RQOrderItemList.list[i].countFact = nil then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := SeparateThousands(RQOrderItemList.list[i].countFact.DecimalString);

            if RQOrderItemList.list[i].priceWithoutNds = nil then
              Cells[6,i+1] := ''
            else
              //Cells[6,i+1] := SeparateThousands(RQOrderItemList.list[i].priceWithNds.DecimalString);
              Cells[6,i+1] := RQOrderItemList.list[i].priceWithoutNds.DecimalString;

            Alignments[6, i + 1] := taRightJustify;
            Colors[6, i + 1] := $0080FF80;

            if RQOrderItemList.list[i].sumWithoutNds = nil then
              Cells[7,i+1] := ''
            else
              Cells[7,i+1] := SeparateThousands(RQOrderItemList.list[i].sumWithoutNds.DecimalString);

            Cells[8,i+1] := RQOrderItemList.list[i].materialNameTxt;
            Cells[9,i+1] := RQOrderItemList.list[i].measurementNameTxt;

            Cells[10,i+1] := RQOrderItemList.list[i].commentGen;

            if RQOrderItemList.list[i].materialCode <> Low(Integer) then
              Cells[11,i+1] := IntToStr(RQOrderItemList.list[i].materialCode)
            else
              Cells[11,i+1] := '';

       sgOrderItem.RowCount := i + 2;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   sgOrderItem.Row := 1;

   sgOrderItemClick(sgOrderItem);
   //sgENPlanWorkClick(sgENPlanWork);
end;



procedure TfrmMaterialsInEdit.updateEstimateItemGrid_();
var i, j, LastCount: Integer;
    //TempRQOrderItem: RQOrderItemControllerSoapPort;
    //RQOrderItemList: RQOrderItemShortList;
    oiFilter : RQOrderItemFilter;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    //TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eiFilter : ENEstimateItemFilter;
    materialCode, orderItemCode : Integer;
    conditionSQL : String;

begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);

  try
    materialCode := StrToInt(sgOrderItem.Cells[11,sgOrderItem.Row]);
    orderItemCode := StrToInt(sgOrderItem.Cells[0,sgOrderItem.Row]);
  except
    on EConvertError do Exit;
  end;

    //TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

   { eFilter := RQOrderItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    eFilter.material := TKMaterials.Create;
    eFilter.material.code := materialCode;
    eFilter.conditionSQL := 'orderrefcode in (select rqorder.code from rqorder where kindrefcode = 2 and rqorder.code in '+
      '(select rqorder2order.orderincode from rqorder2order where rqorder2order.orderoutcode = '+ IntToStr(orderCode) +'))';
    }

    eiFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eiFilter);
    SetNullXSProps(eiFilter);

    eiFilter.materialRef := TKMaterialsRef.Create;
    eiFilter.materialRef.code := materialCode;


  {  eiFilter.conditionSQL := 'enestimateitem.code in '+
    '(select RQORDERITEM2ENESTIMTTM.estimateitemcode from RQORDERITEM2ENESTIMTTM where RQORDERITEM2ENESTIMTTM.ORDERITEMCODE IN '+
    ' (select rqorderitem.code from rqorderitem where rqorderitem.orderrefcode = '+ IntToStr(orderCode) + ')'+
    ' and RQORDERITEM2ENESTIMTTM.STATUSREFCODE = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +')' ;

    eiFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
     and rqorderitem2enestimttm.statusrefcode = 1
     and rqorderitem.orderrefcode = 500000157
   }

    if isBill then
        if (billType = RQBILL_TYPE_TMC) then
          eiFilter.conditionSQL := 'rqorderitem2enestimttm.statusrefcode = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +
               ' and rqorderitem.code = '+ IntToStr(orderItemCode) +
               ' and enestimateitem.code not in (select bi2ei.estimateitemcode from rqbillitem2enestimattm bi2ei '+
	             ' where bi2ei.statusrefcode = 0 and bi2ei.estimateitemcode = enestimateitem.code)'
        else
          eiFilter.conditionSQL := 'rqorderitem2enestimttm.statusrefcode = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +
               ' and rqorderitem.code = '+ IntToStr(orderItemCode)

    else
        if (billType = RQBILL_TYPE_TMC) then
          eiFilter.conditionSQL := 'rqorderitem2enestimttm.statusrefcode = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +
               ' and rqorderitem.code = '+ IntToStr(orderItemCode) +
               ' and enestimateitem.code not in (select ii2ei.estimateitemcode from RQFKORDERITEM2ENSTMTTM ii2ei '+
               // как то вроде КРИВОВАТО ... ' where ii2ei.statusrefcode = ' + IntToStr(RQFKORDERTM2STMTTMSTTS_IN_INVOICE) + ')';
               ' where ii2ei.statusrefcode = ' + IntToStr(RQFKORDERTM2STMTTMSTTS_IN_INVOICE) +
               // не брать РАСХОДЫ ...
               ' and finmaterialsrefcode is null )'
        else
          eiFilter.conditionSQL := 'rqorderitem2enestimttm.statusrefcode = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +
               ' and rqorderitem.code = '+ IntToStr(orderItemCode);



    if (departmentCode <> LOW_INT) then
      eiFilter.conditionSQL := eiFilter.conditionSQL + 'and enplanwork.departmentrefcode = ' + IntToStr(departmentCode);


    { старрое от Инвойсов ...
        eiFilter.conditionSQL := 'rqorderitem2enestimttm.statusrefcode = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +
             ' and rqorderitem.code = '+ IntToStr(orderItemCode) +
             ' and enestimateitem.code not in (select ii2ei.estimateitemcode from rqinvoiceitem2enstmttm ii2ei '+
	           ' where ii2ei.statusrefcode = 0)';
     }

    Application.ProcessMessages;

    //SUPP-13857 - список естимейтов для счета из заявки.... Количество из связки естимейта и строки заявки
    if ((billType = RQBILL_TYPE_TMC ) and (isBill = true )) then
    ENEstimateItemList := TempENEstimateItem.getForBillInvoiceListForGenerateItem(eiFilter, isBill, billType)
    else
    ENEstimateItemList := TempENEstimateItem.getForBillInvoiceList(eiFilter, isBill, billType);

    if High(ENEstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

       {
       enestimateitem.code,      1
       enestimateitem.countfact, 2
       sm.name,                  3
       tu.name,                  4
       rr.numberdoc,             5
       rr.orderperiod,           6
       budg.shortname            7
       --остаток                   8

       anObject.code = set.getInt(1);
       anObject.countFact = set.getBigDecimal(2);
       anObject.materialRefName = set.getString(3);
       anObject.measureType = set.getString(4);
       anObject.invNumber = set.getString(5);      -- номер заявки
       anObject.dateEdit = set.getDate(6);         -- период заявки
       anObject.elementName = set.getString(7);    -- бюджет
       --anObject.countGen = set.getBigDecimal(8);   -- остаток

        anObject.typeRefName = set.getString(10);   --  объект планирования
       }

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         AddCheckBox(1, i+1, true, false);
         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
         Alignments[2, i + 1] := taRightJustify;
         Colors[2, i + 1] := $0080FF80;


        { if ENEstimateItemList.list[i].countGen = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;
         Alignments[3, i + 1] := taRightJustify; }


         Cells[3,i+1] :=  ENEstimateItemList.list[i].measureType;
         Cells[4,i+1] := ENEstimateItemList.list[i].invNumber;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[5,i+1] := ''
         else
           Cells[5,i+1] := MonthesNames[ENEstimateItemList.list[i].dateEdit.Month] + ' ' +
           IntToStr(ENEstimateItemList.list[i].dateEdit.Year) + ' р.';

         Cells[6,i+1] := ENEstimateItemList.list[i].elementName;

         Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;

         Cells[8,i+1] := ENEstimateItemList.list[i].planRefDepartmentName;

         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;

end;



procedure TfrmMaterialsInEdit.sgOrderItemClick(Sender: TObject);
begin
  refreshEstimateItemGrid_
end;



procedure TfrmMaterialsInEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  //TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  //ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  //ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;

  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...


     if departmentCode <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := departmentCode;  // ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;


// пока подразделения - это РЭС ... надо Подразделение !!!

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               edtMolName.Text := GetReturnValue(sgFINMol,0) + ' ' +GetReturnValue(sgFINMol,1); //ENMOL2PlanWorkObj.molName;
               MOLCode := GetReturnValue(sgFINMol,0);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmMaterialsInEdit.spbDepartmentClick(
  Sender: TObject);
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
               departmentName := ENDepartmentShort(tvDep.Selected.Data).shortName;
               //edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmMaterialsInEdit.FormCreate(Sender: TObject);
begin
  inherited;
  MOLCode := '';
  zoneCode := LOW_INT;
  storageCode := LOW_INT;
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
//  budgetCode := LOW_INT;
  materialsINCode := LOW_INT;
  accountingTypeCode := LOW_INT;// по идее пусть вааще не фильтрует .. TK_ACCOUNTINGTYPE_TMC;
end;

procedure TfrmMaterialsInEdit.btnAddMaterialsClick(
  Sender: TObject);
var
   TempRQBillItem: RQBillItemControllerSoapPort;
   //TempRQInvoiceItem: RQInvoiceItemControllerSoapPort;
   TempRQOrderItem: RQOrderItemControllerSoapPort;
   TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;

   obj : RQOrderItem;
   i, n, materialCode: Integer;
   eList : RQOrderItemShortList;
   eArr :  ArrayOfRQOrderItemShort;
   eObj :  RQOrderItemShort;
   state : boolean;
   corrCount : TXSDecimal;
   groupMaterial : boolean;
   remainder : RQFKOrderItemRemainder;

   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   count_ : Double;
begin
   try
     materialCode := StrToInt(sgOrderItem.Cells[11, sgOrderItem.Row]);
   except
     on EConvertError do Exit;
   end;

  { countGen := TXSDecimal.Create;
   countGen.DecimalString := sgENEstimateItem.Cells[3, i];

   corrCount := TXSDecimal.Create;
   if edtCorrCount.Text <> '' then
     corrCount.DecimalString := edtCorrCount.Text;

   if corrCount.DecimalString > countGen.DecimalString then
     begin
       Application.MessageBox(PChar('Відкоригована кількість перевищує залишок !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
       Exit;
     end;    }

   TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
   //TempRQInvoiceItem := HTTPRIORQInvoiceItem as RQInvoiceItemControllerSoapPort;
   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

   obj := RQOrderItem.Create;
   SetNullIntProps(obj);
   SetNullXSProps(obj);

    try
      obj := TempRQOrderItem.getObject(StrToInt(sgOrderItem.Cells[0,sgOrderItem.Row]));
    except
      on EConvertError do Exit;
    end;

   //obj.orderRef := RQOrderRef.Create;
   //obj.orderRef.code := orderCode;
   obj.priceWithoutNds := TXSDecimal.Create;

   obj.ddsCodes := RQDDSCodes.Create;
   obj.ddsCodes.txtCode := sgOrderItem.Cells[2, sgOrderItem.Row];

   remainder := RQFKOrderItemRemainder.Create;
   SetNullIntProps(remainder);
   SetNullXSProps(remainder);
   //remainder.fkOrderItemRef := RQFKOrderItemRef.Create;
   //remainder.fkOrderItemRef.code :=  obj.code;
   remainder.countGen := TXSDecimal.Create;
   remainder.priceWithoutNds := TXSDecimal.Create;

   corrCount := TXSDecimal.Create;
   if edtCorrCount.Text <> '' then
   begin
      corrCount.DecimalString := edtCorrCount.Text;
      //////////////
      remainder.countGen.DecimalString := edtCorrCount.Text;
      ////////////
   end
   else
   begin
      corrCount.DecimalString := '0';
      remainder.countGen := nil;
   end;

   if edtCorrPrice.Text <> '' then
   begin
     obj.priceWithoutNds.DecimalString := edtCorrPrice.Text;
     /////
     remainder.priceWithoutNds.DecimalString :=  edtCorrPrice.Text;
     /////////
   end
   else
   begin
     obj.priceWithoutNds.DecimalString := sgOrderItem.Cells[6, sgOrderItem.Row];
     remainder.priceWithoutNds.DecimalString :=  sgOrderItem.Cells[6, sgOrderItem.Row];
   end;

   if ((edtDateRealiz.Checked)and(kindCode=RQFKORDER_KIND_PRIHOD_BUFET))  then
   begin
    if obj.dateRealiz = nil then
          obj.dateRealiz := TXSDate.Create;
       obj.dateRealiz.XSToNative(GetXSDate(edtDateRealiz.DateTime));
   end
   else
   begin
    obj.dateRealiz := nil;
   end;


   obj.material := TKMaterials.Create;

   if materialsINCode = LOW_INT then
   begin
      obj.material.code := materialCode;
   end
   else
      obj.material.code := materialsINCode;


   if (edtCorrMaterialTxt.Text <> '') then
   begin
      obj.material.name := edtCorrMaterialTxt.Text;
      /////////
      remainder.materialNameTxt := edtCorrMaterialTxt.Text;
      ///////
   end
   else
   begin
      obj.material.name := sgOrderItem.Cells[3, sgOrderItem.Row];
      remainder.materialNameTxt := obj.material.name;
   end;

   if cbGroupItemMaterial.Checked then
      groupMaterial := false
   else
      groupMaterial := true;

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

  eList := RQOrderItemShortList.Create;
  eList.totalCount := 0;
  SetLength(eArr, n);
  n := 0;
  state := false;
  count_ := 0;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       eObj := RQOrderItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       eObj.code :=  StrToInt(sgENEstimateItem.Cells[0, i]);
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgENEstimateItem.Cells[2, i];
       eArr[n] := eObj;
       n := n + 1;
       count_ := count_ + StrToFloat(sgENEstimateItem.Cells[2, i]);
    end;
  end;

  if (count_ > StrToFloat(corrCount.DecimalString)) and (StrToFloat(corrCount.DecimalString)<> 0) then
  begin
     remainder.countGen := nil;
  end;

  eList.list := eArr;
  if (High(eArr) >= 0) then
  begin
     if isBill then
       TempRQBillItem.addBillItemList(corrCount, billCode, obj, eArr, groupMaterial)
     else
     begin
       //TempRQInvoiceItem.addInvoiceItemList(corrCount, invoiceCode, obj, eArr)
       if (remainder.countGen <> nil) then
       begin

            if Application.MessageBox(PChar('Скоригована кількість більше за кількість у строках заявки!'+ #13#10 +' Для надлишку потрібно ввести Бюджетотримача !!!'+ #13#10 + 'Вибрати Бюджетотримача ??? ...'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
            begin
                 Exit;
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
       end;

       TempRQFKOrderItem.addFromOrderItemList(corrCount, invoiceCode, obj, eArr, remainder, LOW_INT, zoneCode);

     end;
   ///////////////////////
  end
  else
  begin
    Application.MessageBox(PChar('Не вибрано жодного запису!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  //materialsINCode := obj.material.code;
  materialsINCode := LOW_INT;

  //btnSelectClick(Sender);
    updateEstimateItemGrid_();

end;


{procedure TfrmMaterialsInEdit.sgOrderItemDblClick(
  Sender: TObject);
var materialCode: Integer;
    oldPlanCondition, planCondition, materialCondition: String;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;
    state : boolean;
begin

  if materialsINCode = LOW_INT then
  begin
    try
      materialCode := StrToInt(sgOrderItem.Cells[11,sgOrderItem.Row]);
    except
      on EConvertError do
      begin
        for i := 1 to sgENEstimateItem.RowCount - 1 do
          for j := 0 to sgENEstimateItem.ColCount - 1 do
            sgENEstimateItem.Cells[j, i] := '';
        sgENEstimateItem.RowCount := 2;
        sgENEstimateItem.RemoveCheckBox(1, 1);
        Exit;
      end;
    end;
  end;

  updateEstimateItemGrid_();
end;}
procedure TfrmMaterialsInEdit.refreshEstimateItemGrid_;
var
materialCode: Integer;
    oldPlanCondition, planCondition, materialCondition: String;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;
    state : boolean;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);

    edtCorrCount.Text := '';
    edtCorrPrice.Text := '';
    edtCorrMaterialTxt.Text := '';

  if materialsINCode = LOW_INT then
  begin
    try
      materialCode := StrToInt(sgOrderItem.Cells[11,sgOrderItem.Row]);
    except
      on EConvertError do
      begin
        for i := 1 to sgENEstimateItem.RowCount - 1 do
          for j := 0 to sgENEstimateItem.ColCount - 1 do
            sgENEstimateItem.Cells[j, i] := '';
        sgENEstimateItem.RowCount := 2;
        sgENEstimateItem.RemoveCheckBox(1, 1);
        Exit;
      end;
    end;
  end;

  updateEstimateItemGrid_();

end;

procedure TfrmMaterialsInEdit.sgOrderItemDblClick(
  Sender: TObject);
var materialCode: Integer;
    oldPlanCondition, planCondition, materialCondition: String;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;
    state : boolean;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);

    edtCorrCount.Text := '';
    edtCorrPrice.Text := '';
    edtCorrMaterialTxt.Text := '';

  if materialsINCode = LOW_INT then
  begin
    try
      materialCode := StrToInt(sgOrderItem.Cells[11,sgOrderItem.Row]);
    except
      on EConvertError do
      begin
        for i := 1 to sgENEstimateItem.RowCount - 1 do
          for j := 0 to sgENEstimateItem.ColCount - 1 do
            sgENEstimateItem.Cells[j, i] := '';
        sgENEstimateItem.RowCount := 2;
        sgENEstimateItem.RemoveCheckBox(1, 1);
        Exit;
      end;
    end;
  end;

  updateEstimateItemGrid_();

end;


procedure TfrmMaterialsInEdit.spbMaterialGroupClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);

      if ShowModal = mrOk then
      begin
        try
          materialGroupCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialGroup.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
        except
          on EConvertError do Exit;
        end;
        //Self.actUpdateExecute(Sender);
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;


procedure TfrmMaterialsInEdit.spbMaterialGroupClearClick(Sender: TObject);
begin
  materialGroupCode := LOW_INT;
  edtMaterialGroup.Text := '';
end;


procedure TfrmMaterialsInEdit.spbContractClearClick(Sender: TObject);
begin
  contractNumber := '';
  edtContract.Text := '';
end;



procedure TfrmMaterialsInEdit.spbContractClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);


   if (orgId > LOW_INT) then
     f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(orgId)
   else
     f.conditionSQL := ' a.io_flag = ''B''';


   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                edtContract.Text := '№' + GetReturnValue(sgFINServicesObject, 1);
                contractNumber := GetReturnValue(sgFINServicesObject, 1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


procedure TfrmMaterialsInEdit.spbENDepartmentClearClick(Sender: TObject);
begin
  edtENDepartmentName.Text := '';
  departmentCode := LOW_INT;
end;

procedure TfrmMaterialsInEdit.spbENDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow : TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmMaterialsInEdit.spbStorageZoneClearClick(Sender: TObject);
begin
  inherited;
  zoneCode := LOW_INT;
  edtStorageZone.Text := '';
end;

procedure TfrmMaterialsInEdit.spbStorageZoneClick(Sender: TObject);
var zoneFilter: RQStorageZoneFilter;
    frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin

  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

  if storageCode = LOW_INT then
  begin
       Application.MessageBox(PChar('На ордері не вказан склад'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
       Exit;
  end;
  zoneFilter.storage := RQStorage.Create;
  zoneFilter.storage.code := storageCode;
  zoneFilter.conditionSQL :=
    ' rqstoragezone.code in ' +
    ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
    '  where sm.molrefcode in ' +
    '    (select m.code from enmol m where m.fincode = ''' + MOLCode + ''')) ';
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
          zoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          edtStorageZone.Text := GetReturnValue(sgRQStorageZone, 2);
        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;

end.
