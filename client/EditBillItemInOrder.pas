unit EditBillItemInOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController, DialogFormUnit, ChildFormUnit,
  RQBillItemController;

type
  TfrmBillItemInOrderEdit = class(TDialogForm)
    Panel1: TPanel;
    lbBillName: TLabel;
    spbBill: TSpeedButton;
    spbBillClear: TSpeedButton;
    edtBillName: TEdit;
    btnSelect: TBitBtn;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
  	HTTPRIORQBillItem: THTTPRIO;
   	HTTPRIORQOrderItem: THTTPRIO;
    HTTPRIORQInvoiceItem: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    btnAddMaterials: TBitBtn;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    edtBillDate: TEdit;
    edtContract: TEdit;
    edtCorrCount: TEdit;
    lblCorrCount: TLabel;
    lblContract: TLabel;
    spbContract: TSpeedButton;
    spbContractClear: TSpeedButton;
    HTTPRIORQFKOrderItem: THTTPRIO;
    lblBillDate: TLabel;
    sgBillItem: TAdvStringGrid;
    HTTPRIORQBillItem2OrderItem: THTTPRIO;
    lblCount: TLabel;
    lblCount_: TLabel;
    lblENDepartmentName: TLabel;
    edtENDepartmentName: TEdit;
    spbENDepartment: TSpeedButton;
    spbENDepartmentClear: TSpeedButton;
    edtStorageZone: TEdit;
    lblStorageZone: TLabel;
    spbStorageZone: TSpeedButton;
    spbStorageZoneClear: TSpeedButton;
    procedure spbBillClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbBillClearClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure sgBillItemClick(Sender: TObject);

    procedure spbPlanMOLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddMaterialsClick(Sender: TObject);




    function makeEstimateCondition(): String;
    procedure sgBillItemDblClick(Sender: TObject);
    procedure spbMaterialGroupClick(Sender: TObject);
    procedure spbMaterialGroupClearClick(Sender: TObject);
    procedure spbContractClearClick(Sender: TObject);
    procedure spbContractClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
    procedure spbStorageZoneClearClick(Sender: TObject);
    procedure spbStorageZoneClick(Sender: TObject);
         
  private
    { Private declarations }
  public
    { Public declarations }
    //RQOrderItemObj: RQOrderItem;

    isBill : Boolean;
    accountingTypeCode : Integer;
    fKOrderKindCode : Integer;
    storageCode : Integer; // Склад для приходных ордеров

    elementCode : Integer;
    elementName : String;
    billCode : Integer;
    billName : String;
    planCodes : String;
    planFilter : ENPlanWorkFilter;
    billItemFilter : RQBillItemFilter;
    MOLCode : String;
    departmentCode : Integer;
    departmentName : String;
    BillItemInOrderCode : Integer;
    invoiceCode : Integer;
    materialGroupCode : Integer;
    contractNumber : String;
    orgId : Integer;
    zoneCode : Integer;

    procedure UpdateMaterials_(billItemFilter: RQBillItemFilter);
    procedure updateEstimateItemGrid_();
  end;

var
  frmBillItemInOrderEdit: TfrmBillItemInOrderEdit;


implementation

{$R *.dfm}

uses ShowENEPRen, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, TKMaterialsController, GridHeadersUnit,
  {ENPlanWorkController, }ENPlanWorkKindController, EditTKMaterials,
  EditENPlanWork, DMReportsUnit, ShellAPI, Globals,
  ENPlanWorkItemController, EditENPlanWorkItem, ENEstimateItemController,
  XSBuiltIns, FINMolController, ShowFINMol, ENDepartment2EPRenController,
  ENEstimateItemKindController, EditRQBillItem, RQBillController,
  TKMeasurementController, EditRQInvoiceItem, ShowRQBill,
  RQOrderKindController, RQOrderStatusController,RQInvoiceItemController,
  RQDDSCodesController, ShowTKMaterials, ShowFINServicesObject,
  ENServicesObjectController, RQFKOrderItemController, RQBillStatusController,
  RQOrderItemController, RQOrgController, RQBillItem2OrderItemController,
  RQStorageZoneController, RQStorageController, ShowRQStorageZone;

var



  RQBillItemHeaders: array [1..11] of String =
       ( 'Код строки рахунку'
          , '№'
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

  ENEstimateItemHeaders: array [1..8] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість'
          //,'залишок'
          ,'Од. вим.'
          ,'у заявці №'
          ,'за період'
          ,'бюджетотримач'
          ,'код строки заявки'
        );
                

procedure TfrmBillItemInOrderEdit.spbBillClick(Sender: TObject);
var
   frmRQBillShow: TfrmRQBillShow;
   f : RQBillFilter;
begin
    f := RQBillFilter.create();
    SetNullIntProps(f);
    SetNullXSProps(f);

    f.statusRef := RQBillStatusRef.Create;
    f.statusRef.code := RQBILL_STATUS_CONFIRMED;

    if orgId > 0 then
       f.conditionSQL := ' orgcode in (select og.code from rqorg og where og.id = '+ IntToStr(orgId) +')';

   frmRQBIllShow := TfrmRQBillShow.Create(Application, fmNormal, f);
   if orgId > 0 then
      frmRQBIllShow.orgId := orgId;

   try

      with frmRQBillShow do
      begin
        DisableActions([actNoFilter, actEdit, actInsert, actDelete ]);
        if ShowModal = mrOk then
        begin
            try
              billCode := StrToInt(GetReturnValue(sgRQBill,0));
              billName := GetReturnValue(sgRQBill,1);
              edtBillName.Text := billName;
              edtBillDate.Text := GetReturnValue(sgRQBill,3);
              edtContract.Text := GetReturnValue(sgRQBill,6);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmRQBillShow.Free;
   end;
end;

procedure TfrmBillItemInOrderEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtBillName, edtBillDate, edtContract, edtENDepartmentName, edtStorageZone]);

  SetGridHeaders(RQBillItemHeaders, sgBillItem.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

  // 17.09.2012 +++ для приходов прячем выбор подразделения, если это не Счетчики
  HideControls([lblENDepartmentName, edtENDepartmentName, spbENDepartment, spbENDepartmentClear],
     ((accountingTypeCode <> TK_ACCOUNTINGTYPE_COUNTER) and (fKOrderKindCode <> RQFKORDER_KIND_PRIHOD_POSTAVKA)));

  // 12.04.2013 для счетчиков и для счетов прячется выбор зоны
  HideControls([lblStorageZone, edtStorageZone, spbStorageZone, spbStorageZoneClear],
     (((accountingTypeCode <> TK_ACCOUNTINGTYPE_TMC) and (fKOrderKindCode = RQFKORDER_KIND_PRIHOD_POSTAVKA)) or isBill));

  SetFloatStyle([edtCorrCount]);

  if (BillItemInOrderCode <> LOW_INT) then
  begin
      btnSelectClick(Sender);
  end;

end;

procedure TfrmBillItemInOrderEdit.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
//  edtENElementName.Text := '';
end;

procedure TfrmBillItemInOrderEdit.spbBillClearClick(
  Sender: TObject);
begin
  billCode := 0;
  edtBillName.Text := '';
  edtBillDate.Text := '';
  edtContract.Text := '';
end;

function TfrmBillItemInOrderEdit.makeEstimateCondition(): String;
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


procedure TfrmBillItemInOrderEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;
    condition : String;
    ENMaterialsList: ENMaterialsShortList;
begin

    if (billCode <=0 ) and (materialGroupCode <= 0) and (contractNumber = '') then
      begin
        Application.MessageBox(PChar('Введіть хоча б один критерій для пошуку!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;

    ////////////////////////////////////////////////////////////////////////////
    billItemFilter := RQBillItemFilter.Create;
    SetNullIntProps(billItemFilter);
    SetNullXSProps(billItemFilter);

    if billCode > 0 then
     begin
      billItemFilter.billRef := RQBillRef.Create;
      billItemFilter.billRef.code := billCode;
     end;

   { if materialGroupCode > 0 then
     begin
      orderItemFilter.conditionSQL := 'tkmaterials.rootgrouprefcode = ' + IntToStr(materialGroupCode) +
         ' and rqorder.kindrefcode in ('+ IntToStr( RQORDER_KIND_OE_PLANNED_AUTO ) +','+ IntToStr(RQORDER_KIND_OE_NOPLANNED) +')';
      orderItemFilter.orderBySQL := 'TKMATERIALS.NAME';
     end;  }

   { if contractNumber <> '' then
     begin
      orderItemFilter.conditionSQL :=
         'rqorder.kindrefcode in ('+ IntToStr( RQORDER_KIND_OE_PLANNED_AUTO ) +','+ IntToStr(RQORDER_KIND_OE_NOPLANNED) +')'+
         ' and rqorderitem.contractnumber = '''+contractNumber+'''';
      orderItemFilter.orderBySQL := 'TKMATERIALS.NAME';
     end; }

    UpdateMaterials_(billItemFilter);
    edtCorrCount.Text := '';
end;


procedure TfrmBillItemInOrderEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmBillItemInOrderEdit.UpdateMaterials_(billItemFilter: RQBillItemFilter);
var i, j, LastCount: Integer;
    TempRQBillItem: RQBillItemControllerSoapPort;
    RQBillItemList: RQBillItemShortList;
begin
  if billItemFilter = nil then Exit;

  for i := 1 to sgBillItem.RowCount - 1 do
    for j := 0 to sgBillItem.ColCount - 1 do
      sgBillItem.Cells[j, i] := '';

  sgBillItem.RowCount := 2;

  TempRQBillItem :=  HTTPRIORQBillItem as RQBillItemControllerSoapPort;

  //   QQQQQQQQQQQQQ  добавить метод для отбора
  //RQBillItemList := TempRQBillItem.getGeneralList(billItemFilter,0,-1);

  RQBillItemList := TempRQBillItem.getScrollableFilteredList(billItemFilter,0,-1);

  if RQBillItemList = nil then Exit;


  LastCount := High(RQBillItemList.list);

  if LastCount > -1 then
    sgBillItem.RowCount := LastCount + 2
  else
    sgBillItem.RowCount := 2;


   with sgBillItem do
     for i := 0 to LastCount do
     begin
       //Application.ProcessMessages;

            if RQBillItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(RQBillItemList.list[i].code)
            else
            Cells[0,i+1] := '';

            Cells[1,i+1] := IntToStr(i + 1);
            Cells[2,i+1] := RQBillItemList.list[i].materialName;
            Cells[3,i+1] := RQBillItemList.list[i].measurementName;

            if RQBillItemList.list[i].countFact = nil then
              Cells[4,i+1] := ''
            else
              Cells[4,i+1] := SeparateThousands(RQBillItemList.list[i].countFact.DecimalString);

            if RQBillItemList.list[i].priceWithoutNds = nil then
              Cells[5,i+1] := ''
            else
              Cells[5,i+1] := RQBillItemList.list[i].priceWithoutNds.DecimalString;

            Alignments[5, i + 1] := taRightJustify;
            Colors[5, i + 1] := $0080FF80;

            if RQBillItemList.list[i].sumWithoutNds = nil then
              Cells[6,i+1] := ''
            else
              Cells[6,i+1] := SeparateThousands(RQBillItemList.list[i].sumWithoutNds.DecimalString);

            Cells[7,i+1] := RQBillItemList.list[i].materialNameTxt;
            Cells[8,i+1] := RQBillItemList.list[i].measurementNameTxt;

            Cells[9,i+1] := RQBillItemList.list[i].commentGen;

            if RQBillItemList.list[i].materialCode <> Low(Integer) then
              Cells[10,i+1] := IntToStr(RQBillItemList.list[i].materialCode)
            else
              Cells[10,i+1] := '';


       sgBillItem.RowCount := i + 2;
     end;

   sgBillItem.Row := 1;
   sgBillItemClick(sgBillItem);
end;



procedure TfrmBillItemInOrderEdit.updateEstimateItemGrid_();
var i, j, LastCount: Integer;
    biFilter : RQBillItemFilter;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eiFilter : ENEstimateItemFilter;
    materialCode, billItemCode : Integer;
    conditionSQL : String;
    cnt_, tmp_ : double;

begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
       sgENEstimateItem.RowCount := 2;
       sgENEstimateItem.RemoveCheckBox(1,1);

    try
      materialCode := StrToInt(sgBillItem.Cells[10,sgBillItem.Row]);
      billItemCode := StrToInt(sgBillItem.Cells[0,sgBillItem.Row]);
    except
      on EConvertError do Exit;
    end;

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eiFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eiFilter);
    SetNullXSProps(eiFilter);

    eiFilter.materialRef := TKMaterialsRef.Create;
    eiFilter.materialRef.code := materialCode;

    {
    eiFilter.conditionSQL := ' rqbillitem2enestimattm.billitemcode  = '+ IntToStr(billItemCode) +
    ' and enestimateitem.code not in (select ii2ei.estimateitemcode from rqfkorderitem2enstmttm ii2ei '+
    ' where ii2ei.statusrefcode = ' + IntToStr(RQFKORDERTM2STMTTMSTTS_IN_INVOICE) +
    ' and ii2ei.countgen = 0 and finmaterialsrefcode is null)';
    }


    if (departmentCode <> LOW_INT) then
      eiFilter.conditionSQL := ' enplanwork.departmentrefcode = ' + IntToStr(departmentCode) +
      ' and rqbillitem2enestimattm.billitemcode  = ' + IntToStr(billItemCode) +
      ' and enestimateitem.code not in (' +
      ' select ri.estimateitemrefcode from rqfkorderitemremainder ri' +
      ' where ri.estimateitemrefcode in (select bi.estimateitemcode from rqbillitem2enestimattm  bi where bi.billitemcode =' + IntToStr(billItemCode) + '))'
    else
      eiFilter.conditionSQL := ' rqbillitem2enestimattm.billitemcode  = '+ IntToStr(billItemCode) +
      ' and enestimateitem.code not in (' +
      ' select ri.estimateitemrefcode from rqfkorderitemremainder ri' +
      ' where ri.estimateitemrefcode in (select bi.estimateitemcode from rqbillitem2enestimattm  bi where bi.billitemcode =' + IntToStr(billItemCode) + '))';


    //' and rqorderitem2enestimttm.estimateitemcode not in (select rm.estimateitemrefcode from rqfkorderitemremainder rm where rm.countgen <> 0)' +
    //' and rqbillitem2enestimattm.estimateitemcode not in (select rm.estimateitemrefcode from rqfkorderitemremainder rm where rm.countgen <> 0)';

    //Application.ProcessMessages;

    cnt_ := 0;
    edtCorrCount.Text := '';

    ENEstimateItemList := TempENEstimateItem.getForBillInvoiceList(eiFilter, isBill, Low_INT);

    if High(ENEstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         //Application.ProcessMessages;


         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         AddCheckBox(1, i+1, true, false);
         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
         begin
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

              try
                tmp_ := StrToFloat(ENEstimateItemList.list[i].countFact.DecimalString);
              except
                tmp_ := 0;
              end;
              cnt_ := cnt_ + tmp_;
         end;


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

         if ENEstimateItemList.list[i].planRefCode <> Low(Integer) then
           Cells[7,i+1] := IntToStr(ENEstimateItemList.list[i].planRefCode)
         else
           Cells[7,i+1] := '';

         sgENEstimateItem.RowCount := i + 2;
       end;

     lblCount_.Caption :=  SeparateThousands(FloatToStr(Conv(cnt_, 2)));
                                                            
     sgENEstimateItem.Row := 1;

end;



procedure TfrmBillItemInOrderEdit.sgBillItemClick(Sender: TObject);
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

  if BillItemInOrderCode = LOW_INT then
  begin
    try
      materialCode := StrToInt(sgBillItem.Cells[10,sgBillItem.Row]);
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



procedure TfrmBillItemInOrderEdit.spbPlanMOLClick(Sender: TObject);
{var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
 TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
 i: Integer;
 ENDepartment2EPRenList: ENDepartment2EPRenShortList;
 renFilter : ENDepartment2EPRenFilter;
 renList : ENDepartment2EPRenShortList;
 molSel : boolean;}
begin
{ f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

     if departmentCode <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := departmentCode;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try
      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;
      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtMolName.Text := GetReturnValue(sgFINMol,0) + ' ' +GetReturnValue(sgFINMol,1);
               MOLCode := GetReturnValue(sgFINMol,0);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end; }
end;


procedure TfrmBillItemInOrderEdit.FormCreate(Sender: TObject);
begin
  inherited;
  MOLCode := '';
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  BillItemInOrderCode := LOW_INT;
  accountingTypeCode := LOW_INT;// по идее пусть вааще не фильтрует .. TK_ACCOUNTINGTYPE_TMC;
  zoneCode := LOW_INT;
  storageCode := LOW_INT;
end;

procedure TfrmBillItemInOrderEdit.btnAddMaterialsClick(
  Sender: TObject);
var
   TempRQBillItem: RQBillItemControllerSoapPort;
   TempRQOrderItem: RQOrderItemControllerSoapPort;
   TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
   TempRQBillItem2OrderItem: RQBillItem2OrderItemControllerSoapPort;

   obj : RQOrderItem;
   billItemObj : RQBillItem;
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
     materialCode := StrToInt(sgBillItem.Cells[10, sgBillItem.Row]);     
   except
     on EConvertError do Exit;
   end;

   {countGen := TXSDecimal.Create;
   countGen.DecimalString := sgENEstimateItem.Cells[3, i];

   corrCount := TXSDecimal.Create;
   if edtCorrCount.Text <> '' then
     corrCount.DecimalString := edtCorrCount.Text;

   if corrCount.DecimalString > countGen.DecimalString then
     begin
       Application.MessageBox(PChar('Кількість перевищує залишок !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
       Exit;
     end;}

   TempRQBillItem := HTTPRIORQBillItem as RQBillItemControllerSoapPort;
   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

   billItemObj := RQBillItem.Create;
   SetNullIntProps(billItemObj);
   SetNullXSProps(billItemObj);

   obj := RQOrderItem.Create;
   SetNullIntProps(obj);
   SetNullXSProps(obj);

    try
      billItemObj := TempRQBillItem.getObject(StrToInt(sgBillItem.Cells[0,sgBillItem.Row]));
      obj := TempRQOrderItem.getObject(StrToInt(sgENEstimateItem.Cells[7,sgENEstimateItem.Row]));
    except
      on EConvertError do Exit;
    end;


   // Данные о договоре со строки счета
   obj.contractNumber := billItemObj.contractNumber;
   obj.contractDate := billItemObj.contractDate;
   obj.finDocID := billItemObj.finDocId;
   obj.finDocCode := billItemObj.finDocCode;


   //obj.orderRef := RQOrderRef.Create;
   //obj.orderRef.code := orderCode;
   obj.priceWithoutNds := TXSDecimal.Create;

   //obj.ddsCodes := RQDDSCodes.Create;
   //obj.ddsCodes.txtCode := sgOrderItem.Cells[2, sgOrderItem.Row];

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

   obj.priceWithoutNds.DecimalString := sgBillItem.Cells[5, sgBillItem.Row];
   remainder.priceWithoutNds.DecimalString :=  sgBillItem.Cells[5, sgBillItem.Row];

   obj.material := TKMaterials.Create;

   if BillItemInOrderCode = LOW_INT then
   begin
      obj.material.code := materialCode;
   end
   else
      obj.material.code := BillItemInOrderCode;

   obj.material.name := sgBillItem.Cells[2, sgBillItem.Row];
   remainder.materialNameTxt := obj.material.name;

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
       // QQQQQQQQQQQ
       //TempRQBillItem.addBillItemList(corrCount, billCode, obj, eArr, groupMaterial)

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

       // QQQQQQQQQQQQQQQQQQ
       TempRQFKOrderItem.addFromOrderItemList(corrCount, invoiceCode, obj, eArr, remainder, billItemObj.code, zoneCode);

     end;

     updateEstimateItemGrid_();
   ///////////////////////
  end
  else
  begin
    Application.MessageBox(PChar('Не вибрано жодного запису!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  BillItemInOrderCode := LOW_INT;

  updateEstimateItemGrid_();

end;


{procedure TfrmBillItemInOrderEdit.sgOrderItemDblClick(
  Sender: TObject);
var materialCode: Integer;
    oldPlanCondition, planCondition, materialCondition: String;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;
    state : boolean;
begin

  if BillItemInOrderCode = LOW_INT then
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

procedure TfrmBillItemInOrderEdit.sgBillItemDblClick(
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

  if BillItemInOrderCode = LOW_INT then
  begin
    try
      // QQQQQQQQQQ  код материала !!!!!!!!!!!1
      materialCode := StrToInt(sgBillItem.Cells[10,sgBillItem.Row]);
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


procedure TfrmBillItemInOrderEdit.spbMaterialGroupClick(Sender: TObject);
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
          //edtMaterialGroup.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
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


procedure TfrmBillItemInOrderEdit.spbMaterialGroupClearClick(Sender: TObject);
begin
  materialGroupCode := LOW_INT;
end;


procedure TfrmBillItemInOrderEdit.spbContractClearClick(Sender: TObject);
begin
  contractNumber := '';
  edtContract.Text := '';
end;



procedure TfrmBillItemInOrderEdit.spbContractClick(Sender: TObject);
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


procedure TfrmBillItemInOrderEdit.spbENDepartmentClick(
  Sender: TObject);
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


procedure TfrmBillItemInOrderEdit.spbENDepartmentClearClick(
  Sender: TObject);
begin
  edtENDepartmentName.Text := '';
  departmentCode := LOW_INT;
end;

procedure TfrmBillItemInOrderEdit.spbStorageZoneClearClick(
  Sender: TObject);
begin
  inherited;
  zoneCode := LOW_INT;
  edtStorageZone.Text := ''; 
end;

procedure TfrmBillItemInOrderEdit.spbStorageZoneClick(Sender: TObject);
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
