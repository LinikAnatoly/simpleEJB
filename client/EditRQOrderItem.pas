
unit EditRQOrderItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, RQOrderItemController, TB2Item,
    TB2Dock, TB2Toolbar, RQOrgController, AdvObj,
    RQOrderController ;

type
  TfrmRQOrderItemEdit = class(TDialogForm)
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
  

  HTTPRIORQOrderItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIORQMaterials2TKMaterials: THTTPRIO;
    gbBudgetData: TGroupBox;
    spbRQOrgOrg: TSpeedButton;
    lblRQOrgOrgName: TLabel;
    spbRQDDSCodesDdsCodes: TSpeedButton;
    lblRQDDSCodesDdsCodesName: TLabel;
    edtRQOrgOrgName: TEdit;
    edtRQDDSCodesDdsCodesName: TEdit;
    lblPriceWithoutNds: TLabel;
    lblNds: TLabel;
    lblSumWithoutNds: TLabel;
    lblSumNds: TLabel;
    lblSumGen: TLabel;
    edtPriceWithoutNds: TEdit;
    edtSumWithoutNds: TEdit;
    edtSumNds: TEdit;
    edtSumGen: TEdit;
    sgENEstimateItem: TAdvStringGrid;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIORQOrderItem2ENEstimateItem: THTTPRIO;
    HTTPRIORQOrder: THTTPRIO;
    HTTPRIORQMaterials: THTTPRIO;
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    actDelete: TAction;
    actInsert: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    ImageList1: TImageList;
    tbActions: TTBToolbar;
    actMove: TAction;
    TBItem1: TTBItem;
    N3: TMenuItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    HTTPRIORQOrg: THTTPRIO;
    edtPriceWithNds: TEdit;
    lblPriceWithNds: TLabel;
    HTTPRIO1: THTTPRIO;
    edtContractNumber: TEdit;
    lblContractNumber: TLabel;
    spbContractNumberSelect: TSpeedButton;
    lblPlannedDatePays: TLabel;
    lblPlannedDateDelivery: TLabel;
    edtPlannedDateDelivery: TDateTimePicker;
    edtPlannedDatePays: TDateTimePicker;
    lblDeliveryTime: TLabel;
    edtDeliveryTime: TEdit;
    actViewPlan: TAction;
    N4: TMenuItem;
    actEditCount: TAction;
    N5: TMenuItem;
    edtCode: TEdit;
    lblENResponsibles: TLabel;
    edtENResponsibles: TEdit;
    HTTPRIOENResponsibles: THTTPRIO;
    spbENResponsibles: TSpeedButton;
    grpTypePay: TGroupBox;
		edtTypePayName: TEdit;
    spbTypePay: TSpeedButton;
    HTTPRIORQOrderItemTypePay: THTTPRIO;
		lblValue: TLabel;
    edtValue: TEdit;
    spbValue: TSpeedButton;
    lblPdv: TLabel;
    cbbNDS: TComboBox;
    tbiUpdateMaterialPrice: TTBItem;
    gbItemState: TGroupBox;
    cbRQOrderItemStatus: TComboBox;
    lblStatusRef: TLabel;
    edtStatusReason: TEdit;
    lblStatusReason: TLabel;
    GroupBox1: TGroupBox;
    lblMaterialNameTxt: TLabel;
    edtTKMeasurementMeasurementName: TEdit;
    edtTKMaterialsMaterialName: TEdit;
    edtCountFact: TEdit;
    edtMeasurementNameTxt: TEdit;
    edtMaterialNameTxt: TEdit;
    edtCountGen: TEdit;
    lblTKMeasurementMeasurementName: TLabel;
    spbTKMeasurementMeasurement: TSpeedButton;
    lblTKMaterialsMaterialName: TLabel;
    spbTKMaterialsMaterial: TSpeedButton;
    lblCountFact: TLabel;
    lblMeasurementNameTxt: TLabel;
    lblCountGen: TLabel;
    edtCommentGen: TEdit;
    lblIdentIdTXT: TLabel;
    lblIdentId: TLabel;
    lblCommentGen: TLabel;
    gbMaterial: TGroupBox;
    spbRQMeasurementRqMeasurement: TSpeedButton;
    spbRQMaterialsRqMaterials: TSpeedButton;
    lblRQMeasurementRqMeasurementName: TLabel;
    lblRQMaterialsRqMaterialsName: TLabel;
    lblCoef: TLabel;
    edtRQMaterialsRqMaterialsName: TEdit;
    edtRQMeasurementRqMeasurementName: TEdit;
    edtCoef: TEdit;
    lblIdentId2010TXT: TLabel;
    lblIdentId2010: TLabel;


  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKMaterialsMaterialClick(Sender : TObject);
  procedure spbTKMeasurementMeasurementClick(Sender : TObject);
  procedure spbRQOrgOrgClick(Sender : TObject);
  procedure spbRQDDSCodesDdsCodesClick(Sender : TObject);
  procedure updateEstimateItemGrid();
    procedure updateEstimateItemGrid_();
    procedure sgENEstimateItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure spbRQMaterialsRqMaterialsClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actMoveExecute(Sender: TObject);
    procedure edtPriceWithNdsChange(Sender: TObject);
    procedure edtPriceWithoutNdsChange(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actEditCountExecute(Sender: TObject);
    procedure cbRQOrderItemStatusChange(Sender: TObject);
    procedure spbENResponsiblesClick(Sender: TObject);
    procedure spbTypePayClick(Sender: TObject);
    procedure spbValueClick(Sender: TObject);
    procedure cbbNDSChange(
      Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbiUpdateMaterialPriceClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    conditionSQL : String;
    orderKindCode : Integer;
    creationMethodCode: Integer;
    Temporder : RQOrder;

end;

var
  frmRQOrderItemEdit: TfrmRQOrderItemEdit;
  RQOrderItemObj: RQOrderItem;
  RQOrgObj: RQOrg;


  RQOrderItem2ENEstimateItemHeaders: array [1..10] of String =
        ( 'Код матеріала з Плану'
          ,'Матеріал (план)'
          ,'Од.вим.(план)'
          ,'Кіл-сть у плані'
          ,'Матеріал (факт)'
          ,'Од.вим.(факт)'
          ,'Кіл-сть(факт)'
          //,'Ціна без ПДВ'
          //,'Сума без ПДВ'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Період вик.робіт'
        );

  ENEstimateItemHeaders: array [1..16] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'

          /// 05.02.13
          ,'Підрозділ'
          ///

          ,'інв №'
          ,'Об''єкт'
          ,'Період вик.робіт'
          ,'ПідВид робіт'
          ,'Тип Акту'

          ,'Код роботи'
          ,'Робота'
          ,'Тип строки кошторису'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
  ,ShowTKMeasurement
  ,TKMeasurementController
  ,ShowRQOrg
  //,RQOrgController
  ,ShowRQDDSCodes
  ,RQDDSCodesController
, ENConsts, RQMaterials2MeasurementController,
  RQMaterials2TKMaterialsController, EditRQMaterials2TKMaterials,
  RQMaterialsController, RQMeasurementController, ENEstimateItemController,
  ENHumenItemController, ENEstimateItemKindController,
  RQOrderItem2ENEstimateItemController,
  RQOrderItem2ENEstimateItemStatusController, EditMaterialsParametersOut
  , ShowRQMaterials, ShowFINServicesObject,
  ENServicesObjectController, ENPlanWorkController, EditENPlanWork,
  DMReportsUnit, EditRQOrderItem2ENEstimateItem,
  RQOrderItemStatusController, ENResponsiblesController,
  ShowENResponsibles, EditMaterialsForRQOrder, ShowRQOrderItemTypePay, 
  RQOrderItemTypePayController, EditRQOrderItemTypePay, ShowRQTypePayValue, 
  RQTypePayValueController, EditTKMaterials;

{uses  
    EnergyproController, EnergyproController2, RQOrderItemController  ;
}
{$R *.dfm}


procedure TfrmRQOrderItemEdit.updateEstimateItemGrid();
var
  i, j : Integer;
  //TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
  RQOrderItem2ENEstimateItemList: RQOrderItem2ENEstimateItemShortList;
  e2Filter : RQOrderItem2ENEstimateItemFilter;
  materialCode : Integer;
  //conditionSQL, planCondition : String;
  period : String;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);


   SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

  try
    materialCode := RQOrderItemObj.material.code; //StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

    TempRQOrderItem2ENEstimateItem :=  HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;

    e2Filter := RQOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(e2Filter);
    SetNullXSProps(e2Filter);

    e2Filter.orderItem := RQOrderItem.Create;
    e2Filter.orderItem.code := RQOrderItemObj.code;

    e2Filter.statusRef := RQOrderItem2ENEstimateItemStatusRef.Create;
    e2Filter.statusRef.code := RQORDERITM2NSTMTTMSTTS_GOOD;
    
{
    eFilter.conditionSQL := 'enestimateitem.code in '+
    '(select RQORDERITEM2ENESTIMTTM.estimateitemcode from RQORDERITEM2ENESTIMTTM where RQORDERITEM2ENESTIMTTM.ORDERITEMCODE = '+ IntToStr(RQOrderItemObj.code) +
    ' and RQORDERITEM2ENESTIMTTM.STATUSREFCODE = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +')' ;
}
    
{
   это типа для добавления из планов ...

    eFilter.kindRef := ENEstimateItemKindRef.Create;
    eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;


    //AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    // может условие по СТАТУСАМ !!!
    //planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    //AddCondition(conditionSQL, planCondition);

    eFilter.conditionSQL := conditionSQL;
}
    //eFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    /// 05.02.13
    e2Filter.orderBySQL := '40'; // поле № 40 - наименование подразделения

    RQOrderItem2ENEstimateItemList := TempRQOrderItem2ENEstimateItem.getScrollableFilteredList(e2Filter, 0, -1);



    //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

    if High(RQOrderItem2ENEstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(RQOrderItem2ENEstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(RQOrderItem2ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if RQOrderItem2ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(RQOrderItem2ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := RQOrderItem2ENEstimateItemList.list[i].materialRefName;

         if DialogState <> dsView then
           AddCheckBox(1, i+1, false, false);
         
         if RQOrderItem2ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := RQOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;

         if RQOrderItem2ENEstimateItemList.list[i].countGen = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := RQOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;

         Cells[4,i+1] := RQOrderItem2ENEstimateItemList.list[i].measureType;
{
                   ,'Од. виміру'

          /// 05.02.13
          ,'Підрозділ'
          ///

          ,'інв №'
          ,'Об''єкт'
          ,'Період'
          ,'Тип робіт'
          ,'Вид робіт'

          ,'Код роботи'
}
         /// 05.02.13
         Cells[5,i+1] := RQOrderItem2ENEstimateItemList.list[i].planRefDepartmentName;
         ///

         Cells[6,i+1] := RQOrderItem2ENEstimateItemList.list[i].invNumber;
         Cells[7,i+1] := RQOrderItem2ENEstimateItemList.list[i].elementName;
         period := IntToStr(RQOrderItem2ENEstimateItemList.list[i].planRefYearGen);

         if RQOrderItem2ENEstimateItemList.list[i].planRefMonthGen < 10 then
           period := period + '0' + IntToStr(RQOrderItem2ENEstimateItemList.list[i].planRefMonthGen)
         else
           period := period + IntToStr(RQOrderItem2ENEstimateItemList.list[i].planRefMonthGen);

         Cells[8,i+1] :=  period;

         Cells[9,i+1] := RQOrderItem2ENEstimateItemList.list[i].planType;
         Cells[10,i+1] := RQOrderItem2ENEstimateItemList.list[i].planState;

         Cells[11,i+1] := RQOrderItem2ENEstimateItemList.list[i].kartaNum;
         Cells[12,i+1] := RQOrderItem2ENEstimateItemList.list[i].kartaRefName;


         Objects[1,i+1] := TObject(RQOrderItem2ENEstimateItemList.list[i].estimateItemCode);

         {
         Cells[13,i+1] := RQOrderItem2ENEstimateItemList.list[i].typeRefName;

         Cells[14,i+1] := RQOrderItem2ENEstimateItemList.list[i].userGen;

         if RQOrderItem2ENEstimateItemList.list[i].dateEdit = nil then
           Cells[15,i+1] := ''
         else
           Cells[15,i+1] := XSDate2String(RQOrderItem2ENEstimateItemList.list[i].dateEdit);
          }

{
         if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
         begin
           // Если к нормативному материалу привязаны материалы из ФК, выделяем строку цветом
           //if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
           if ENEstimateItemList.list[i].countFINMaterials > 0 then
           begin
             RowColor[i+1] := Shape1.Brush.Color; //$0080FF80; //$EBFFF5
             Objects[1,i+1] := TObject(1); // признак (разнесенный)
           end
           else begin
             RowColor[i+1] := clWindow;
             Objects[1,i+1] := TObject(0);
           end;
           //else
           //  RowColor[i+1] := clYellow;
         end
         else begin
           RowColor[i+1] := clWindow;

           // Выделяем цветом ручной ввод
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
             RowColor[i+1] := clMoneyGreen; //$EBFFF5

           // Выделяем цветом строки, относящиеся ко всей смете
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
             RowColor[i+1] := clYellow;
         end;

         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);
}

         //eiLastRow := i + 1;
         sgENEstimateItem.RowCount := i + 2;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     //eiColCount := eiColCount + 1;
     sgENEstimateItem.Row := 1;

end;



procedure TfrmRQOrderItemEdit.updateEstimateItemGrid_();
var
  i, j : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  eFilter : ENEstimateItemFilter;
  materialCode : Integer;
  //conditionSQL, planCondition : String;
  period : String;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';

    SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

  try
    materialCode := RQOrderItemObj.material.code; //StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

    //TempRQOrderItem2ENEstimateItem :=  HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    eFilter.materialRef := TKMaterialsRef.Create;
    eFilter.materialRef.code := materialCode;

    eFilter.conditionSQL := 'enestimateitem.code in '+
    '(select RQORDERITEM2ENESTIMTTM.estimateitemcode from RQORDERITEM2ENESTIMTTM where RQORDERITEM2ENESTIMTTM.ORDERITEMCODE = '+ IntToStr(RQOrderItemObj.code) +
    ' and RQORDERITEM2ENESTIMTTM.STATUSREFCODE = '+ IntToStr(RQORDERITM2NSTMTTMSTTS_GOOD) +')' ;
{
   это типа для добавления из планов ...

    eFilter.kindRef := ENEstimateItemKindRef.Create;
    eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;


    //AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    // может условие по СТАТУСАМ !!!
    //planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    //AddCondition(conditionSQL, planCondition);

    eFilter.conditionSQL := conditionSQL;
}
    eFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';


    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);



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
         AddCheckBox(1, i+1, true, false);
         
         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[4,i+1] := ENEstimateItemList.list[i].measureType;
{
                   ,'Од. виміру'

          ,'інв №'
          ,'Об''єкт'
          ,'Період'
          ,'Тип робіт'
          ,'Вид робіт'

          ,'Код роботи'
}
         Cells[5,i+1] := ENEstimateItemList.list[i].invNumber;
         Cells[6,i+1] := ENEstimateItemList.list[i].elementName;
         period := IntToStr(ENEstimateItemList.list[i].planRefYearGen);

         if ENEstimateItemList.list[i].planRefMonthGen < 10 then
           period := period + '0' + IntToStr(ENEstimateItemList.list[i].planRefMonthGen)
         else
           period := period + IntToStr(ENEstimateItemList.list[i].planRefMonthGen);

         Cells[7,i+1] :=  period;

         Cells[8,i+1] := ENEstimateItemList.list[i].planType;
         Cells[9,i+1] := ENEstimateItemList.list[i].planState;

         Cells[10,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[11,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[12,i+1] := ENEstimateItemList.list[i].typeRefName;

         Cells[13,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[14,i+1] := ''
         else
           Cells[14,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);

{
         if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
         begin
           // Если к нормативному материалу привязаны материалы из ФК, выделяем строку цветом
           //if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
           if ENEstimateItemList.list[i].countFINMaterials > 0 then
           begin
             RowColor[i+1] := Shape1.Brush.Color; //$0080FF80; //$EBFFF5
             Objects[1,i+1] := TObject(1); // признак (разнесенный)
           end
           else begin
             RowColor[i+1] := clWindow;
             Objects[1,i+1] := TObject(0);
           end;
           //else
           //  RowColor[i+1] := clYellow;
         end
         else begin
           RowColor[i+1] := clWindow;

           // Выделяем цветом ручной ввод
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
             RowColor[i+1] := clMoneyGreen; //$EBFFF5

           // Выделяем цветом строки, относящиеся ко всей смете
           if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
             RowColor[i+1] := clYellow;
         end;

         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);
}

         //eiLastRow := i + 1;
         sgENEstimateItem.RowCount := i + 2;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     //eiColCount := eiColCount + 1;
     sgENEstimateItem.Row := 1;

end;


procedure TfrmRQOrderItemEdit.FormShow(Sender: TObject);
var
   tmpMaterial : TKMaterials;
   i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;
    RQMaterialsFilterObj : RQMaterialsFilter;
    RQMaterialsList :  RQMaterialsShortList;
    TempRQMaterials: RQMaterialsControllerSoapPort;

    TempENResponsibles: ENResponsiblesControllerSoapPort;
		ENResponsiblesObj: ENResponsibles;
		TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
		RQOrderItemTypePayObj : RQOrderItemTypePay;

    curr_nds : Real;
begin
  // Отключаем процедуру пересчета суммы при открытии формы (после открытия включим)
  edtCountFact.OnChange := nil;
  edtPriceWithNds.OnChange := nil;
  lblIdentIdTXT.Caption := '';
  lblIdentId2010TXT.Caption := '';
  try
    //DisableControls([spbTKMaterialsMaterial, spbTKMeasurementMeasurement]);

    DisableControls([edtCode]);

    // нефиг кол-во руками трогать ...
    DisableControls([edtCountGen, edtCountFact]);
    // и сумму тоже - считается автоматом
    DisableControls([edtSumGen, edtSumWithoutNds]);

    DisableControls([
      edtTKMaterialsMaterialName
      ,spbTKMaterialsMaterial
      ,edtTKMeasurementMeasurementName
      ,spbTKMeasurementMeasurement
      //,edtCountGen
      ,edtCountFact
      //,edtRQOrgOrgName
      //,spbRQOrgOrg
      //,edtRQDDSCodesDdsCodesName
      //,spbRQDDSCodesDdsCodes
      ,spbRQMeasurementRqMeasurement

      ,edtRQMaterialsRqMaterialsName
      ,edtRQMeasurementRqMeasurementName
      ,edtRQOrgOrgName
      ,edtRQDDSCodesDdsCodesName
      ,edtContractNumber
      ,spbContractNumberSelect
      , edtDeliveryTime

			, edtENResponsibles
			,edtTypePayName
			,edtValue
       ]);

    SetFloatStyle([edtPriceWithoutNds,  edtPriceWithNds, edtSumWithoutNds, edtSumNds, edtSumGen]);

    HideControls([lblCountGen, edtCountGen]);
{
    HideControls([lblPriceWithoutNds, edtPriceWithoutNds,
                  lblNds, edtNds,
                  lblSumWithoutNds, edtSumWithoutNds,
                  lblSumNds, edtSumNds]);
}
    if DialogState = dsView then
    begin
  //     DisableControls([
      DisableControls([
        //edtTKMaterialsMaterialName
        //,spbTKMaterialsMaterial
        //,edtTKMeasurementMeasurementName
        //,spbTKMeasurementMeasurement
        //,
        edtRQOrgOrgName
        ,spbRQOrgOrg
        ,edtRQDDSCodesDdsCodesName
        ,spbRQDDSCodesDdsCodes
        //,btnSearchInPlan
				, spbContractNumberSelect
				,spbTypePay
				,spbValue
         ]);

         DisableActions([actInsert, actDelete, actMove, actEditCount]);
    end;

    if (DialogState = dsInsert) then
    begin
       DisableActions([actMove, actEditCount]);
    end;

    if (DialogState = dsInsert) or (DialogState = dsEdit) then
    begin
      DenyBlankValues([
        edtCountGen
        ,edtCountFact
        ,edtPriceWithoutNds
        ,cbbNDS
        ,edtPriceWithNds
        ,edtSumWithoutNds
        ,edtSumNds
        ,edtSumGen
       ]);

      if (creationMethodCode = LOW_INT) then
        raise Exception.Create('Невідомий метод створення заявки!');

      if (creationMethodCode = RQORDER_CREATION_METHOD_AUTO_AVZ) then
        DisableActions([actInsert]);
     end;

    //if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text :=  IntToStr(RQOrderItemObj.code);

      if ( RQOrderItemObj.countGen <> nil ) then
         edtCountGen.Text := RQOrderItemObj.countGen.decimalString
      else
         edtCountGen.Text := '';
      edtMaterialNameTxt.Text := RQOrderItemObj.materialNameTxt;
      edtMeasurementNameTxt.Text := RQOrderItemObj.measurementNameTxt;
      if ( RQOrderItemObj.countFact <> nil ) then
         edtCountFact.Text := RQOrderItemObj.countFact.decimalString
      else
         edtCountFact.Text := '';
      if ( RQOrderItemObj.priceWithoutNds <> nil ) then
         edtPriceWithoutNds.Text := RQOrderItemObj.priceWithoutNds.decimalString
      else
         edtPriceWithoutNds.Text := '';
      {if ( RQOrderItemObj.nds <> nil ) then
         edtNds.Text := RQOrderItemObj.nds.decimalString
      else
         edtNds.Text := '';}

         // доступное значение ндс по периоду заявки
       if DialogState = dsEdit then
       begin
             // если на редактирование то тянем процент ндс коотрый действует в периоде
             curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , Temporder.dateGen.AsDate );
             cbbNDS.Clear;
             cbbNDS.AddItem('0',nil);
             cbbNDS.AddItem(FloatToStr(curr_nds),nil);


          if StrToFloat(RQOrderItemObj.nds.decimalString) > 0 then
             cbbNDS.ItemIndex := 1
          else
             cbbNDS.ItemIndex := 0;
       end
       else
       begin
           // если на чтение то ндс тянем со строки заявки
           cbbNDS.Clear;
           cbbNDS.AddItem(RQOrderItemObj.nds.DecimalString,nil);
           cbbNDS.ItemIndex := 0;
       end;

      if ( RQOrderItemObj.priceWithNds <> nil ) then
         edtPriceWithNds.Text := RQOrderItemObj.priceWithNds.decimalString
      else
         edtPriceWithNds.Text := '';
      if ( RQOrderItemObj.sumWithoutNds <> nil ) then
         edtSumWithoutNds.Text := RQOrderItemObj.sumWithoutNds.decimalString
      else
         edtSumWithoutNds.Text := ''; 
      if ( RQOrderItemObj.sumNds <> nil ) then
         edtSumNds.Text := RQOrderItemObj.sumNds.decimalString
      else
         edtSumNds.Text := '';
      if ( RQOrderItemObj.sumGen <> nil ) then
         edtSumGen.Text := RQOrderItemObj.sumGen.decimalString
      else
         edtSumGen.Text := '';
      edtCommentGen.Text := RQOrderItemObj.commentGen;


      cbRQOrderItemStatus.ItemIndex := RQOrderItemObj.statusRef.code - 1;
      edtStatusReason.Text := RQOrderItemObj.statusReason;
      HideControls([ lblStatusReason, edtStatusReason], RQOrderItemObj.statusRef.code = RQORDERITEM_STATUS_GOOD);

  {
      edtUserGen.Text := RQOrderItemObj.userGen;
        if RQOrderItemObj.dateEdit <> nil then
        begin
          edtDateEdit.DateTime:=EncodeDate(RQOrderItemObj.dateEdit.Year,RQOrderItemObj.dateEdit.Month,RQOrderItemObj.dateEdit.Day);
          edtDateEdit.checked := true;
        end
        else
        begin
          edtDateEdit.DateTime:=SysUtils.Date;
          edtDateEdit.checked := false;
        end;
  }



       //if orderKindCode in [RQORDER_KIND_BUDGET, RQORDER_KIND_OE] then
          DisableControls([spbRQMaterialsRqMaterials, spbContractNumberSelect],  (DialogState <> dsEdit));
      { пусть пока развязывает Лариса ...
       else
          DisableControls([spbRQMaterialsRqMaterials]);
			}

			if RQOrderItemObj.typePayRef <> nil then
			begin
				if RQOrderItemObj.typePayRef.code > LOW_INT then
				 begin

						TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;

						 try
							 RQOrderItemTypePayObj := TempRQOrderItemTypePay.getObject(RQOrderItemObj.typePayRef.code);
						 except
						  on EConvertError do Exit;
						 end;

						edtTypePayName.Text := RQOrderItemTypePayObj.name;
				 end;

				 // выбор значение для вида оплаты
         if RQOrderItemObj.paymentValue > low_int then
			   edtValue.text := IntToStr(RQOrderItemObj.paymentValue);

			end;



			if RQOrderItemObj.material <> nil then
			begin
				 if RQOrderItemObj.material.code > LOW_INT then
         begin
            edtTKMaterialsMaterialName.Text := RQOrderItemObj.material.name;

            TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
            tmpMaterial :=  TempTKMaterials.getObject(RQOrderItemObj.material.code);

            if  tmpMaterial <> nil then
            begin
              if  tmpMaterial.measurement <> nil then
                 if tmpMaterial.measurement.code > LOW_INT then
                 begin
                     RQOrderItemObj.measurement.name := tmpMaterial.measurement.name;
                     RQOrderItemObj.measurement.code := tmpMaterial.measurement.code;

                     edtTKMeasurementMeasurementName.Text := RQOrderItemObj.measurement.name;

                     lblIdentIdTXT.Caption := tmpMaterial.identid2015;
                     lblIdentId2010TXT.Caption := tmpMaterial.identid2010;
                 end;

             // дернуть материал для Закупок ...
             TempRQMaterials :=  HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
             RQMaterialsFilterObj := RQMaterialsFilter.Create;
             SetNullIntProps(RQMaterialsFilterObj);
             SetNullXSProps(RQMaterialsFilterObj);
             RQMaterialsFilterObj.conditionSQL := 'RQMATERIALS.CODE in (select RQMATERIALS2TKMATERILS.RQMATERIALSCODE from RQMATERIALS2TKMATERILS where RQMATERIALS2TKMATERILS.TKMATERIALSCODE = '+ IntToStr(RQOrderItemObj.material.code) +')';
             RQMaterialsList := TempRQMaterials.getScrollableFilteredList(RQMaterialsFilterObj, 0, -1);
             if (RQMaterialsList.totalCount > 1) then
             begin
                 ShowMessage('Один материал имеет несколько материалов для Заказа ...');
             end;

             if RQMaterialsList.totalCount = 1 then
             begin
                 edtRQMaterialsRqMaterialsName.Text := RQMaterialsList.list[0].name;
                 edtRQMeasurementRqMeasurementName.Text := RQMaterialsList.list[0].measurementName;
             end;

             end; // tmpMaterial <> nil


         end;
      end;

      if RQOrderItemObj.org <> nil then
        edtRQOrgOrgName.Text := RQOrderItemObj.org.name;

      if RQOrderItemObj.ddsCodes <> nil then
        edtRQDDSCodesDdsCodesName.Text := RQOrderItemObj.ddsCodes.txtCode + ' ' + RQOrderItemObj.ddsCodes.name;

      if  length(edtRQOrgOrgName.Text) > 0 then
      begin
        DisableControls([spbContractNumberSelect], (DialogState <> dsEdit));
        if ((length(RQOrderItemObj.contractNumber) > 0) and (RQOrderItemObj.contractDate <> nil)) then
        begin
          edtContractNumber.Text := '№' + RQOrderItemObj.contractNumber + ' від ' + DateToStr ( EncodeDate(RQOrderItemObj.contractDate.Year,RQOrderItemObj.contractDate.Month,RQOrderItemObj.contractDate.Day) );
        end
        else
        if length(RQOrderItemObj.contractNumber) > 0 then
         edtContractNumber.Text := '№' + RQOrderItemObj.contractNumber;
      end
      else
        DisableControls([spbContractNumberSelect]);

      if ( RQOrderItemObj.deliveryTime <> Low(Integer) ) then
         edtDeliveryTime.Text := IntToStr(RQOrderItemObj.deliveryTime)
      else
         edtDeliveryTime.Text := '';

      if RQOrderItemObj.plannedDatePays <> nil then
      begin
        edtPlannedDatePays.DateTime:=EncodeDate(RQOrderItemObj.plannedDatePays.Year,RQOrderItemObj.plannedDatePays.Month,RQOrderItemObj.plannedDatePays.Day);
        edtPlannedDatePays.checked := true;
      end
      else
      begin
        edtPlannedDatePays.DateTime:=SysUtils.Date;
        edtPlannedDatePays.checked := false;
      end;
      if RQOrderItemObj.plannedDateDelivery <> nil then
      begin
        edtPlannedDateDelivery.DateTime:=EncodeDate(RQOrderItemObj.plannedDateDelivery.Year,RQOrderItemObj.plannedDateDelivery.Month,RQOrderItemObj.plannedDateDelivery.Day);
        edtPlannedDateDelivery.checked := true;
      end
      else
      begin
        edtPlannedDateDelivery.DateTime:=SysUtils.Date;
        edtPlannedDateDelivery.checked := false;
      end;



      // Вытягиваем отв. лицо
      if RQOrderItemObj.responsiblesRef <> nil then
        if RQOrderItemObj.responsiblesRef.code > LOW_INT then
        begin
          TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
          ENResponsiblesObj := TempENResponsibles.getObject(RQOrderItemObj.responsiblesRef.code);
          if ENResponsiblesObj <> nil then
            edtENResponsibles.Text := ENResponsiblesObj.FIO;
        end;

      DisableActions([actMove]);
      //if orderKindCode in [RQORDER_KIND_BUDGET, RQORDER_KIND_OE, RQORDER_KIND_OE_PLANNED_AUTO] then
      begin
          HideControls([gbBudgetData], false);
          //DisableActions([actMove], false);
          DisableActions([actMove], (DialogState in [dsView, dsInsert]));
      end;

      updateEstimateItemGrid();

    end;

  finally
    // Включаем процедуру пересчета суммы
    edtCountFact.OnChange := edtPriceWithNdsChange;
    edtPriceWithNds.OnChange := edtPriceWithNdsChange;
  end;
end;



procedure TfrmRQOrderItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItem: RQOrderItemControllerSoapPort;
    TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
    RQMaterials2TKMaterialsList: RQMaterials2TKMaterialsShortList;
    mmFilterObj : RQMaterials2TKMaterialsFilter;
    TempRQOrg: RQOrgControllerSoapPort;
    tRQOrg: RQOrg;
    orgFilter: RQOrgFilter;
    orgList: RQOrgShortList;

    frmRQMaterials2TKMaterialsEdit: TfrmRQMaterials2TKMaterialsEdit;

    i, j, n : Integer;
    state : boolean;
    eArr :  ArrayOfENEstimateItemShort;
    eObj :  ENEstimateItemShort;
    eList : ENEstimateItemShortList;

    isChangeStatus : Boolean;
begin

  isChangeStatus := False;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      ,edtCountFact
      //,edtPriceWithoutNds
      //,edtNds
      ,edtPriceWithNds
      //,edtSumWithoutNds
      //,edtSumNds
      ,edtSumGen
     ])  then
  begin
			Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
			Action:=caNone;
  end
  else
  begin
		TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
    TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;

{******************
это делается не тут

    // проверим развязку с материалами для Заказа ..

    mmFilterObj := RQMaterials2TKMaterialsFilter.Create;
    SetNullIntProps(mmFilterObj);
    SetNullXSProps(mmFilterObj);
    TempRQMaterials2TKMaterials := HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;
    RQMaterials2TKMaterialsList := TempRQMaterials2TKMaterials.getScrollableFilteredList(mmFilterObj, 0, -1);
    if RQMaterials2TKMaterialsList.totalCount = 0 then
    begin
        RQMaterials2TKMaterialsObj:=RQMaterials2TKMaterials.Create;

        RQMaterials2TKMaterialsObj.coef:= TXSDecimal.Create;
        RQMaterials2TKMaterialsObj.coef.DecimalString := '1.0';

        RQMaterials2TKMaterialsObj.tkMeasurement := TKMeasurement.Create;
        RQMaterials2TKMaterialsObj.tkMeasurement.code := RQOrderItemObj.measurement.code;
        RQMaterials2TKMaterialsObj.tkMeasurement.name := RQOrderItemObj.measurement.name;


        RQMaterials2TKMaterialsObj.tkMaterials := TKMaterials.Create;
        RQMaterials2TKMaterialsObj.tkMaterials.code := RQOrderItemObj.material.code;
        RQMaterials2TKMaterialsObj.tkMaterials.name := RQOrderItemObj.material.name;

        RQMaterials2TKMaterialsObj.rqMaterials := RQMaterials.Create;
        RQMaterials2TKMaterialsObj.rqMeasurement := RQMeasurement.Create;

        try
          frmRQMaterials2TKMaterialsEdit:=TfrmRQMaterials2TKMaterialsEdit.Create(Application, dsInsert);
          try
            if frmRQMaterials2TKMaterialsEdit.ShowModal = mrOk then
            begin
              if RQMaterials2TKMaterialsObj<>nil then
                  //TempRQMaterials2TKMaterials.add(RQMaterials2TKMaterialsObj);
                  //UpdateGrid(Sender);
            end;
          finally
            frmRQMaterials2TKMaterialsEdit.Free;
            frmRQMaterials2TKMaterialsEdit:=nil;
          end;
        finally
          RQMaterials2TKMaterialsObj.Free;
        end;
    end
    else
    if RQMaterials2TKMaterialsList.totalCount > 1 then
    begin
        ShowMessage('Ошибка в развязе материалов ...');
        exit;
    end;
**********************}

     if (RQOrderItemObj.countGen = nil ) then
       RQOrderItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQOrderItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQOrderItemObj.countGen := nil;

     RQOrderItemObj.materialNameTxt := edtMaterialNameTxt.Text; 

     RQOrderItemObj.measurementNameTxt := edtMeasurementNameTxt.Text; 

     if (RQOrderItemObj.countFact = nil ) then
       RQOrderItemObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       RQOrderItemObj.countFact.decimalString := edtCountFact.Text
     else
       RQOrderItemObj.countFact := nil;


     if (RQOrderItemObj.priceWithoutNds = nil ) then
       RQOrderItemObj.priceWithoutNds := TXSDecimal.Create;
     if edtPriceWithoutNds.Text <> '' then
       RQOrderItemObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text
     else
       RQOrderItemObj.priceWithoutNds := nil;

    { if (RQOrderItemObj.nds = nil ) then
       RQOrderItemObj.nds := TXSDecimal.Create;
     if edtNds.Text <> '' then
       RQOrderItemObj.nds.decimalString := edtNds.Text
     else
       RQOrderItemObj.nds := nil;}

     if cbbNDS.Text <> '' then
       RQOrderItemObj.nds := TXSDecimal.Create;
     if cbbNDS.Text <> '' then
       RQOrderItemObj.nds.decimalString := cbbNDS.Text
     else
       RQOrderItemObj.nds := nil;


     if (RQOrderItemObj.priceWithNds = nil ) then
       RQOrderItemObj.priceWithNds := TXSDecimal.Create;
     if edtPriceWithNds.Text <> '' then
       RQOrderItemObj.priceWithNds.decimalString := edtPriceWithNds.Text
     else
			 RQOrderItemObj.priceWithNds := nil;


     if (RQOrderItemObj.sumWithoutNds = nil ) then
       RQOrderItemObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQOrderItemObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text
     else
       RQOrderItemObj.sumWithoutNds := nil;
{
     if (RQOrderItemObj.sumNds = nil ) then
       RQOrderItemObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       RQOrderItemObj.sumNds.decimalString := edtSumNds.Text
     else
       RQOrderItemObj.sumNds := nil;
     }
     
		 if (RQOrderItemObj.sumGen = nil ) then
			 RQOrderItemObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
			 RQOrderItemObj.sumGen.decimalString := edtSumGen.Text
		 else
			 RQOrderItemObj.sumGen := nil;

     RQOrderItemObj.commentGen := edtCommentGen.Text; 

		 RQOrderItemObj.userGen := edtUserGen.Text;

		 //
			if RQOrderItemObj.typePayRef <> nil then
				if ((RQOrderItemObj.typePayRef.code > 0) and (edtValue.Text = '')) then
					begin
					 Application.MessageBox(PChar('Поле "Значення" не заповнене!!!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
           if edtValue.CanFocus then
             edtValue.SetFocus;
					 Action:=caNone;
					 Exit;
					end;

		 if edtValue.text <> '' then
			RQOrderItemObj.paymentValue := StrToInt(edtValue.text)
		 else
			RQOrderItemObj.paymentValue := LOW_INT ;



     if edtdateEdit.checked then
     begin 
       if RQOrderItemObj.dateEdit = nil then
          RQOrderItemObj.dateEdit := TXSDate.Create;
       RQOrderItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQOrderItemObj.dateEdit := nil;

     if edtplannedDatePays.checked then
     begin 
       if RQOrderItemObj.plannedDatePays = nil then
          RQOrderItemObj.plannedDatePays := TXSDate.Create;
       RQOrderItemObj.plannedDatePays.XSToNative(GetXSDate(edtplannedDatePays.DateTime));
     end
     else
       RQOrderItemObj.plannedDatePays := nil;

     if edtplannedDateDelivery.checked then
     begin
       if RQOrderItemObj.plannedDateDelivery = nil then
          RQOrderItemObj.plannedDateDelivery := TXSDate.Create;
       RQOrderItemObj.plannedDateDelivery.XSToNative(GetXSDate(edtplannedDateDelivery.DateTime));
     end
     else
       RQOrderItemObj.plannedDateDelivery := nil;


		 if RQOrderItemObj.statusRef = nil then
     begin
      RQOrderItemObj.statusRef := RQOrderItemStatusRef.Create;
      RQOrderItemObj.statusRef.code := RQORDERITEM_STATUS_GOOD;
     end
     else
     begin

       // проверить права ... при изменении
       if  cbRQOrderItemStatus.ItemIndex + 1 = RQORDERITEM_STATUS_CANCELED then
       begin
          if not NoBlankValues([ edtStatusReason ])  then
          begin
              Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
              Action:=caNone;
              Exit;
          end;
       end;

       // изменили статус ...
       if RQOrderItemObj.statusRef.code <> cbRQOrderItemStatus.ItemIndex + 1 then
          isChangeStatus := True;

			 RQOrderItemObj.statusRef.code := cbRQOrderItemStatus.ItemIndex + 1;
			 RQOrderItemObj.statusReason := edtStatusReason.Text;
       
     end;


// закнем массив ЕстимайтИтемов ...
{ *************
    n:=0;
    for i:=1 to sgENEstimateItem.RowCount - 1 do
    begin
       sgENEstimateItem.GetCheckBoxState(1, i, state);
       if state then
         n := n + 1;
    end;
    SetLength(eArr, n );
    n:=0;
    for i:=1 to sgENEstimateItem.RowCount - 1 do
    begin
       sgENEstimateItem.GetCheckBoxState(1, i, state);
       if state then
       begin
        eObj := ENEstimateItemShort.Create;
        SetNullIntProps(eObj);
        SetNullXSProps(eObj);
        eObj.code := StrToInt(sgENEstimateItem.cells[0,i]);
        eObj.countFact := TXSDecimal.Create;
        eObj.countFact.DecimalString := (sgENEstimateItem.cells[3,i]);
        eArr[n] := eObj;
        n:=n+1;
       end;
    end;
*************}

{
  eList :=  ENEstimateItemShortList.Create;
  eList.list := eArr;
  eList.totalCount := n;
}

{ чуть не так ;) ... сохранение на серваке ...

    orgFilter := RQOrgFilter.Create;
    SetNullIntProps(orgFilter);
    SetNullXSProps(orgFilter);
    orgFilter.id := RQOrderItemObj.org.id;

    orgList := TempRQOrg.getScrollableFilteredList(orgFilter, 0, -1);


   //tRQOrg := TempRQOrg.getObject(RQOrderItemObj.org.code);
   //tRQOrg := TempRQOrg.getFilteredLis

   if orgList.totalCount = 0 then
   begin
      RQOrderItemObj.org.code := TempRQOrg.add(RQOrderItemObj.org);
   end
    else
   begin
      RQOrderItemObj.org.code := orgList.list[0].code;
   end;
}

    if DialogState = dsInsert then
    begin
      RQOrderItemObj.code:=low(Integer);
      //TempRQOrderItem.add(RQOrderItemObj);
      //TempRQOrderItem.addWithEstimateList(RQOrderItemObj, eArr);
    end
    else
    if DialogState = dsEdit then
    begin
      if isChangeStatus then
        TempRQOrderItem.changeStatus(RQOrderItemObj)
      else
        TempRQOrderItem.save(RQOrderItemObj);
    end;
  end;
end;


procedure TfrmRQOrderItemEdit.FormCreate(Sender: TObject);
begin
  inherited;
  orderKindCode := LOW_INT;
  creationMethodCode := LOW_INT;
end;

procedure TfrmRQOrderItemEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemObj.material = nil then RQOrderItemObj.material := TKMaterials.Create();
               //RQOrderItemObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;



procedure TfrmRQOrderItemEdit.spbTKMeasurementMeasurementClick(Sender : TObject);
var
   frmTKMeasurementShow: TfrmTKMeasurementShow;
begin
	 frmTKMeasurementShow:=TfrmTKMeasurementShow.Create(Application,fmNormal);
   try
      with frmTKMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemObj.measurement = nil then RQOrderItemObj.measurement := TKMeasurement.Create();
               RQOrderItemObj.measurement.code := StrToInt(GetReturnValue(sgTKMeasurement,0));
               edtTKMeasurementMeasurementName.Text:=GetReturnValue(sgTKMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMeasurementShow.Free;
   end;
end;



procedure TfrmRQOrderItemEdit.spbRQOrgOrgClick(Sender : TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   //org : RQOrg;
   tmpOrg: RQOrg;
   TempRQOrg : RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
begin
  {
	 frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemObj.org = nil then
               begin
                RQOrderItemObj.org := RQOrg.Create();
                SetNullIntProps(RQOrderItemObj.org);
                SetNullXSProps(RQOrderItemObj.org);
               end;
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               RQOrderItemObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               RQOrderItemObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               RQOrderItemObj.org.name := GetReturnValue(sgRQOrg,1);
               RQOrderItemObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               RQOrderItemObj.org.okpo := GetReturnValue(sgRQOrg,2);
               RQOrderItemObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               RQOrderItemObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               RQOrderItemObj.org.adr := GetReturnValue(sgRQOrg,5);
               RQOrderItemObj.org.tel := GetReturnValue(sgRQOrg,6);
               RQOrderItemObj.org.country := GetReturnValue(sgRQOrg,10);
               RQOrderItemObj.org.region := GetReturnValue(sgRQOrg,11);
               RQOrderItemObj.org.ministry := GetReturnValue(sgRQOrg,12);
               RQOrderItemObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               RQOrderItemObj.org.type_ := GetReturnValue(sgRQOrg,14);
               RQOrderItemObj.org.master_code := GetReturnValue(sgRQOrg,15);

               //RQOrderItemObj.org.date_svidet := TXSDate.Create;
               //RQOrderItemObj.org.likv_date := TXSDate.Create;
               //RQOrderItemObj.org.dateNalogform := TXSDate.Create;

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    RQOrderItemObj.org.date_svidet := TXSDate.Create;
                    RQOrderItemObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    RQOrderItemObj.org.likv_date := TXSDate.Create;
                    RQOrderItemObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               RQOrderItemObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               RQOrderItemObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               RQOrderItemObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    RQOrderItemObj.org.date_nalogform := TXSDate.Create;
                    RQOrderItemObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               RQOrderItemObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               RQOrderItemObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               RQOrderItemObj.org.Primechan := GetReturnValue(sgRQOrg,7);

               ///// При изменении поставщика нужно сбрасывать договор и отв. лицо!!!
               edtContractNumber.Text := '';
               RQOrderItemObj.contractNumber := '';
               RQOrderItemObj.contractDate := nil;
               RQOrderItemObj.finDocCode := '';
               RQOrderItemObj.finDocID := LOW_INT;

               RQOrderItemObj.responsiblesRef := nil;
               /////

               DisableControls([spbContractNumberSelect], false);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
  }

  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, RQOrderItemObj.org) then
  begin
    RQOrderItemObj.org := tmpOrg;

    edtRQOrgOrgName.Text := RQOrderItemObj.org.name;
    ///// При изменении поставщика нужно сбрасывать договор и отв. лицо!!!
    edtContractNumber.Text := '';
    RQOrderItemObj.contractNumber := '';
    RQOrderItemObj.contractDate := nil;
    RQOrderItemObj.finDocCode := '';
    RQOrderItemObj.finDocID := LOW_INT;

    RQOrderItemObj.responsiblesRef := nil;
    /////

    DisableControls([spbContractNumberSelect], false);
  end;
end;



procedure TfrmRQOrderItemEdit.spbRQDDSCodesDdsCodesClick(Sender : TObject);
var
   frmRQDDSCodesShow: TfrmRQDDSCodesShow;
   f : RQDDSCodesFilter;
begin
   f := RQDDSCodesFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.isActual := 1;
   f.conditionSQL := 'q1.PARENTDDSCODESREFCODE is null';
   frmRQDDSCodesShow:=TfrmRQDDSCodesShow.Create(Application,fmNormal,f);
   try

      with frmRQDDSCodesShow do
        if ShowModal = mrOk then
        begin
          if tvDDSCodes.Selected = nil then Exit;
          if tvDDSCodes.Selected.Data = nil then Exit;

          try
             if RQOrderItemObj.ddsCodes = nil then RQOrderItemObj.ddsCodes := RQDDSCodes.Create();
             RQOrderItemObj.ddsCodes.code := RQDDSCodesShort(tvDDSCodes.Selected.Data).code; //StrToInt(GetReturnValue(sgRQDDSCodes,0));
             edtRQDDSCodesDdsCodesName.Text := RQDDSCodesShort(tvDDSCodes.Selected.Data).txtCode + ' ' +
                                               RQDDSCodesShort(tvDDSCodes.Selected.Data).name; //GetReturnValue(sgRQDDSCodes,1);
          except
             on EConvertError do Exit;
          end;
        end;
   finally
      frmRQDDSCodesShow.Free;
   end;
end;



procedure TfrmRQOrderItemEdit.sgENEstimateItemCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  j : Integer;
begin
  inherited;
  {
if DialogState = dsEdit  then
begin
  if State then
  begin
     //ShowMessage('true');
     edtCountFact.Text := FloatToStr(StrToFloat(edtCountFact.Text) + StrToFloat( sgENEstimateItem.Cells[3, ARow] ));
  end
  else
  begin
     //ShowMessage('false');
      if Application.MessageBox(PChar('Вы дійсно бажаєте видалити матеріал з заявки ?'),
                        PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

          j := Integer(sgENEstimateItem.Objects[1, ARow]);

          if (orderKindCode = RQORDER_KIND_DEPARTMENT) then
              TempRQOrderItem.removeFromRQDepartmentByEstimate(j, RQOrderItemObj.orderRef.code)
          else
          if (orderKindCode = RQORDER_KIND_BUDGET) then
              TempRQOrderItem.removeFromRQBudgetByEstimate(j, RQOrderItemObj.orderRef.code)
          else
          if (orderKindCode = RQORDER_KIND_OE) then
              TempRQOrderItem.removeFromRQOeByEstimate(j, RQOrderItemObj.orderRef.code)
          else
          begin
              ShowMessage('Error in Kind RQOrder');
              Exit;
          end;


          //TempRQOrderItem.removeFromEstimate(j);

          edtCountFact.Text := FloatToStr(StrToFloat(edtCountFact.Text) - StrToFloat( sgENEstimateItem.Cells[3, ARow] ));

          //UpdateGrid(Sender);
          //updateEstimateItemGrid();
          if ( StrToFloat(edtCountFact.Text) < 0.000001) then
          begin
              DialogState := dsView;
              ModalResult := mrOK;
              Close;
          end
          else
          begin
              TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
              RQOrderItemObj := TempRQOrderItem.getObject(RQOrderItemObj.code);
              Self.FormShow(Sender);
          end;

      end;
      //Self.FormShow(Sender);
     //edtCountFact.Text := FloatToStr(StrToFloat(edtCountFact.Text) - StrToFloat( sgENEstimateItem.Cells[3, ARow] ));
  end;
end;
}

end;

procedure TfrmRQOrderItemEdit.spbRQMaterialsRqMaterialsClick(
  Sender: TObject);
var
   frmRQMaterialsShow : TfrmRQMaterialsShow;
   TempRQMaterials: RQMaterialsControllerSoapPort;
   rqMat : RQMaterials;
   TempRQMaterials2TKMaterials: RQMaterials2TKMaterialsControllerSoapPort;
   m2mFilter : RQMaterials2TKMaterialsFilter;
   m2mList : RQMaterials2TKMaterialsShortList;
begin

  frmRQMaterialsShow := TfrmRQMaterialsShow.Create(Application, fmNormal);
  try
     if frmRQMaterialsShow.ShowModal = mrOK then
     begin
        if Application.MessageBox(PChar('Ви дійсно бажаєте зв''язати матеріал з матеріалом для закупівлі ?'),
                          PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            edtRQMaterialsRqMaterialsName.Text :=  frmRQMaterialsShow.GetReturnValue(frmRQMaterialsShow.sgRQMaterials, 1);
            edtRQMeasurementRqMeasurementName.Text := frmRQMaterialsShow.GetReturnValue(frmRQMaterialsShow.sgRQMaterials, 2);

            TempRQMaterials2TKMaterials := HTTPRIORQMaterials2TKMaterials as RQMaterials2TKMaterialsControllerSoapPort;

            m2mFilter := RQMaterials2TKMaterialsFilter.Create;
            SetNullIntProps(m2mFilter);
            SetNullXSProps(m2mFilter);

            m2mFilter.tkMaterials := TKMaterials.Create;
            m2mFilter.tkMaterials.code := RQOrderItemObj.material.code;

            m2mList := TempRQMaterials2TKMaterials.getScrollableFilteredList(m2mFilter, 0, -1);
            if m2mList.totalCount > 0 then
               RQMaterials2TKMaterialsObj := TempRQMaterials2TKMaterials.getObject(m2mList.list[0].code)
            else
            begin

              RQMaterials2TKMaterialsObj:=RQMaterials2TKMaterials.Create;

               SetNullIntProps(RQMaterials2TKMaterialsObj);
               SetNullXSProps(RQMaterials2TKMaterialsObj);


              RQMaterials2TKMaterialsObj.coef:= TXSDecimal.Create;
              RQMaterials2TKMaterialsObj.coef.DecimalString := '1.0';
              
              //if edtCoef.Text <> '' then
              //  RQMaterials2TKMeasurementObj.coef.decimalString := edtCoef.Text


              RQMaterials2TKMaterialsObj.tkMeasurement := TKMeasurement.Create;
              RQMaterials2TKMaterialsObj.tkMeasurement.code := RQOrderItemObj.measurement.code;
              RQMaterials2TKMaterialsObj.tkMeasurement.name := RQOrderItemObj.measurement.name;


              RQMaterials2TKMaterialsObj.tkMaterials := TKMaterials.Create;
              RQMaterials2TKMaterialsObj.tkMaterials.code := RQOrderItemObj.material.code;
              RQMaterials2TKMaterialsObj.tkMaterials.name := RQOrderItemObj.material.name;

              RQMaterials2TKMaterialsObj.rqMaterials := RQMaterials.Create;
              RQMaterials2TKMaterialsObj.rqMeasurement := RQMeasurement.Create;

            end;

            TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;

            try
              rqMat := TempRQMaterials.getObject(StrToInt(frmRQMaterialsShow.GetReturnValue(frmRQMaterialsShow.sgRQMaterials, 0)));
            except
              on EConvertError do Exit;
            end;

            SetNullIntProps(RQMaterials2TKMaterialsObj.rqMaterials);
            SetNullXSProps(RQMaterials2TKMaterialsObj.rqMaterials);
            RQMaterials2TKMaterialsObj.rqMaterials.code := rqMat.code;

            SetNullIntProps(RQMaterials2TKMaterialsObj.rqMeasurement);
            SetNullXSProps(RQMaterials2TKMaterialsObj.rqMeasurement);
            RQMaterials2TKMaterialsObj.rqMeasurement.code := rqMat.measurement.code;

            if RQMaterials2TKMaterialsObj.code > LOW_INT then
                TempRQMaterials2TKMaterials.save(RQMaterials2TKMaterialsObj)
            else
                TempRQMaterials2TKMaterials.add(RQMaterials2TKMaterialsObj);

        end;


     end;
  finally
     frmRQMaterialsShow.Free;
     frmRQMaterialsShow := nil;
  end;
end;

procedure TfrmRQOrderItemEdit.actInsertExecute(Sender: TObject);
var
  frmMaterialsParametersOutEdit: TfrmMaterialsParametersOutEdit;
  order : RQOrder;
  TempRQOrder_: RQOrderControllerSoapPort;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  { // 25.01.13 NET-4204 Теперь будут вручную докидывать материалы и в плановую заявку
  if (orderKindCode = RQORDER_KIND_OE_PLANNED_AUTO) then
  begin
     ShowMessage('Додавати можна тільки у Неплановій заявці ...');
     Exit;
  end;
  }

  if (orderKindCode = RQORDER_KIND_OE_PLANNED_AUTO) then
  begin
    frmMaterialsForRQOrderEdit := TfrmMaterialsForRQOrderEdit.Create(Application, dsInsert);
    try
      frmMaterialsForRQOrderEdit.orderItemCode := RQOrderItemObj.code;
      
      if RQOrderItemObj.material <> nil then
        if RQOrderItemObj.material.code > LOW_INT then
        begin
          frmMaterialsForRQOrderEdit.materialCode := RQOrderItemObj.material.code;
          frmMaterialsForRQOrderEdit.edtMaterialName.Text := RQOrderItemObj.material.name;
        end;

      if RQOrderItemObj.budgetRef <> nil then
        if RQOrderItemObj.budgetRef.code > LOW_INT then
          frmMaterialsForRQOrderEdit.budgetCode := RQOrderItemObj.budgetRef.code;

      if RQOrderItemObj.finDocID > 0 then
        frmMaterialsForRQOrderEdit.finDocID := RQOrderItemObj.finDocID;

      if frmMaterialsForRQOrderEdit.ShowModal = mrOk then
      begin
      end;
    finally
      frmMaterialsForRQOrderEdit.Free;
    end;

  end
  else begin
    TempRQOrder_ :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
    order := TempRQOrder_.getObject(RQOrderItemObj.orderRef.code);

    frmMaterialsParametersOutEdit := TfrmMaterialsParametersOutEdit.Create(Application, dsInsert);

    try

    frmMaterialsParametersOutEdit.materialsINCode := RQOrderItemObj.material.code;
    frmMaterialsParametersOutEdit.materialsINName := RQOrderItemObj.material.name;

    frmMaterialsParametersOutEdit.departmentCode := order.departmentRef.code;
    frmMaterialsParametersOutEdit.departmentName :=  order.departmentRef.name;

    frmMaterialsParametersOutEdit.budgetCode :=  order.budgetRef.code;
    frmMaterialsParametersOutEdit.budgetName := order.budgetRef.name;
    frmMaterialsParametersOutEdit.orderCode := order.code;


      if frmMaterialsParametersOutEdit.ShowModal = mrOk then
      begin
        //if RQOrderItemObj<>nil then
            //TempRQOrderItem.add(RQOrderItemObj);
            //UpdateGrid(Sender);
      end;
    finally
      frmMaterialsParametersOutEdit.Free;
      frmMaterialsParametersOutEdit:=nil;
    end;

    {
    TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
    RQOrderItemObj := TempRQOrderItem.getObject(RQOrderItemObj.code);
    Self.FormShow(Sender);
    }
  end;

  TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  RQOrderItemObj := TempRQOrderItem.getObject(RQOrderItemObj.code);
  Self.FormShow(Sender);
end;

procedure TfrmRQOrderItemEdit.actDeleteExecute(Sender: TObject);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  j, i, objCode: Integer;
  state, selected: Boolean;
begin
{ // 25.01.13 NET-4204 Теперь будут вручную докидывать материалы и удалять их и из плановой заявки
      if (orderKindCode = RQORDER_KIND_OE_PLANNED_AUTO) then
      begin
         ShowMessage('Видаляти можна тільки у Неплановій заявці ...');
         Exit;
      end;
}

  if (orderKindCode = LOW_INT) then
    raise Exception.Create('Невідомий тип заявки!');

  if (creationMethodCode = LOW_INT) then
    raise Exception.Create('Невідомий метод створення заявки!');

  /// Проверяем, чтобы был выбран хотя бы один материал
  selected := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбрана ни одна строка
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  ///

  if (orderKindCode = RQORDER_KIND_OE_PLANNED_AUTO) then
  begin
    TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;

    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити обрані матеріали з заявки ?'),
                      PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
      Exit;

    state := false;

    for i := 1 to sgENEstimateItem.RowCount - 1 do
    begin
      sgENEstimateItem.GetCheckBoxState(1, i, state);

      if state then
      begin
        try
          ObjCode := StrToInt(sgENEstimateItem.Cells[0, i]);
        except
          on EConvertError do Continue;
        end;

        TempRQOrderItem.removeEstimateFromAutoOrder(ObjCode);
      end;
    end;

    RQOrderItemObj := TempRQOrderItem.getObject(RQOrderItemObj.code);
    if RQOrderItemObj <> nil then
      Self.FormShow(Sender)
    else
      Self.Close;

  end // if (orderKindCode = RQORDER_KIND_OE_PLANNED_AUTO)
  else begin

    TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   //ShowMessage('false');

    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити обрані матеріали з заявки ?'),
                      PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      state := false;

      if creationMethodCode = RQORDER_CREATION_METHOD_AUTO_AVZ then
      begin

        for i := 1 to sgENEstimateItem.RowCount - 1 do
        begin
          sgENEstimateItem.GetCheckBoxState(1, i, state);

          if state then
          begin
            try
              ObjCode := StrToInt(sgENEstimateItem.Cells[0, i]);
            except
              on EConvertError do Continue;
            end;

            TempRQOrderItem.removeEstimateFromAVZOrder(ObjCode);
          end;
        end;

      end // if creationMethodCode = RQORDER_CREATION_METHOD_AUTO_AVZ
      else begin

        for i:=1 to sgENEstimateItem.RowCount - 1 do
        begin
          sgENEstimateItem.GetCheckBoxState(1, i, state);

          if state then
          begin
              j := Integer(sgENEstimateItem.Objects[1, i]);
              {
              if (orderKindCode = RQORDER_KIND_DEPARTMENT) then
                  TempRQOrderItem.removeFromRQDepartmentByEstimate(j, RQOrderItemObj.orderRef.code)
              else
              if (orderKindCode = RQORDER_KIND_BUDGET) then
                  TempRQOrderItem.removeFromRQBudgetByEstimate(j, RQOrderItemObj.orderRef.code)
              else
              if (orderKindCode = RQORDER_KIND_OE) then
                  TempRQOrderItem.removeFromRQOeByEstimate(j, RQOrderItemObj.orderRef.code)
              else
              begin
                  ShowMessage('Error in Kind RQOrder');
                  Exit;
              end;
              }

              TempRQOrderItem.removeFromEstimate(j, RQOrderItemObj.orderRef.code);

          end;
        end;

      end;



      //TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
      RQOrderItemObj := TempRQOrderItem.getObject(RQOrderItemObj.code);
      if RQOrderItemObj <> nil then
        Self.FormShow(Sender)
      else
        Self.Close;


      //TempRQOrderItem.removeFromEstimate(j);
      {
                edtCountFact.Text := FloatToStr(StrToFloat(edtCountFact.Text) - StrToFloat( sgENEstimateItem.Cells[3, ARow] ));

                //UpdateGrid(Sender);
                //updateEstimateItemGrid();
                if ( StrToFloat(edtCountFact.Text) < 0.000001) then
                begin
                    DialogState := dsView;
                    ModalResult := mrOK;
                    Close;
                end
                else
                begin
                    TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
                    RQOrderItemObj := TempRQOrderItem.getObject(RQOrderItemObj.code);
                    Self.FormShow(Sender);
                end;

            end;
            //Self.FormShow(Sender);
           //edtCountFact.Text := FloatToStr(StrToFloat(edtCountFact.Text) - StrToFloat( sgENEstimateItem.Cells[3, ARow] ));
        end;
      }
    end;
  end;
end;

procedure TfrmRQOrderItemEdit.actMoveExecute(Sender: TObject);
var
 err, state : boolean;
 i,j, count , n : integer;
 TempRQOrderItem: RQOrderItemControllerSoapPort;
 arr : RQOrderItemController.ArrayOfInteger;
begin
  inherited;
  
  err := false;
  if RQOrderItemObj.ddsCodes = nil then err:= true;
  if (not err) and (RQOrderItemObj.ddsCodes.code <= 0) then err := true;

  if err then
  begin
      Application.MessageBox(PChar('Необхідно  вказати код ДДС, а потім переносити матеріали !!!'),
                        PChar('Увага !'),MB_ICONWARNING);
      exit;
  end;

  state := false;
  count := 0;
  for i:=1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if (state) then
      count := count + 1;
  end;

  if count = 0 then
  begin
      Application.MessageBox(PChar('Необхідно обрати матеріали !!!'),
                        PChar('Увага !'),MB_ICONWARNING);
      exit;
  end;

  SetLength(arr, count);
  n:=0;
  state := false;
  for i:=1 to sgENEstimateItem.RowCount - 1 do
  begin
      sgENEstimateItem.GetCheckBoxState(1, i, state);
      if state then
      begin
          j := Integer(sgENEstimateItem.Objects[1, i]);
          arr[n] := j ;
          n := n + 1;
      end;
  end;
  TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
  TempRQOrderItem.moveEstimate2Item(RQOrderItemObj.code, arr);

  ModalResult := mrCancel;

end;

procedure TfrmRQOrderItemEdit.edtPriceWithNdsChange(Sender: TObject);
var price, count, sum: Double;
begin
  try
    price := StrToFloat(edtPriceWithNds.Text);
  except
    on EConvertError do
      price := 0;
  end;

  try
    count := StrToFloat(edtCountFact.Text);
  except
    on EConvertError do
      count := 0;
  end;

  //edtSumGen.Text := FloatToStrF(price * count, ffFixed, 15, 2);
  edtSumGen.Text := FloatToStr(Conv(price * count, 2));
end;

procedure TfrmRQOrderItemEdit.edtPriceWithoutNdsChange(Sender: TObject);
var price, count, sum, curr_nds, curr_nds_coeff: Double;
begin
  try
    price := StrToFloat(edtPriceWithoutNds.Text);
  except
    on EConvertError do
      price := 0;
  end;

  try
    count := StrToFloat(edtCountFact.Text);
  except
    on EConvertError do
      count := 0;
  end;

 try
  curr_nds:=  StrToFloat(cbbNDS.Text);
    except
    on EConvertError do
      curr_nds := 0;
  end;

  curr_nds_coeff := curr_nds / 100 + 1;
  //edtSumGen.Text := FloatToStrF(price * count, ffFixed, 15, 2);
  edtSumWithoutNds.Text := FloatToStr(Conv(price * count, 2));
  edtPriceWithNds.Text := FloatToStr(Conv(price * {NDS_COEFF} curr_nds_coeff , 2));
end;

procedure TfrmRQOrderItemEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   // NET-4529 закупки / тендера . Привязівать договор на строку теперь нужно с формі управления планом закупок
    Application.MessageBox(PChar('Для прив''язки договору використовуйте форму роботи з планом закупок !'),PChar('Увага!'), MB_ICONINFORMATION);

  ////////// Пусть привязывают с менюхи на строках - там обрабатывается логика по отв. лицам
  //Application.MessageBox(PChar('Для прив''язки договору використовуйте випадаюче меню '+
  //                             '"Введення договору по обраним позиціям" на строках заявки !'),
  //                       PChar('Увага!'), MB_ICONINFORMATION);
  Exit;
  //////////

// чуть шо добавть группы если не будут нужных договоров
// в ДАО метод getContractList ... сейчас 205 - лабораотрные работы

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(RQOrderItemObj.org.id) ; // and a.agree_group_id in (205, 342, 319, 88)';

   f.partnerCode := RQOrderItemObj.org.codeorg;

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
                RQOrderItemObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                RQOrderItemObj.contractDate := TXSDate.Create;
                RQOrderItemObj.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
                RQOrderItemObj.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
                RQOrderItemObj.finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));

                //edtContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                //edtContractDate.Checked := true;
                //edtName.Text := GetReturnValue(sgFINServicesObject, 3);
                //edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
                //edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
                //edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                //edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                ///// 28.07.10
                {
                DisableControls([edtCode
                                 ,edtContractDate
                                 ,edtName
                                 ,edtPartnerCode
                                 ,edtFinDocCode
                                 ,edtFinDocID
                                 ,edtCommentGen
                                ]);
                /////
                }
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmRQOrderItemEdit.actViewPlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
//tPlan : ENPlanWork;
objCode : Integer;
begin

      try
        //objCode:= Integer(sgENEstimateItem.Objects[1,sgENEstimateItem.Row]);
        objCode:= Integer(sgENEstimateItem.Objects[1,sgENEstimateItem.Row]);
        //TObject(RQOrderItem2ENEstimateItemList.list[i].estimateItemCode);//StrToInt( sgRQFKOrderItem2ENEstimateItem.Cells[0, sgRQFKOrderItem2ENEstimateItem.row] );
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




procedure TfrmRQOrderItemEdit.actEditCountExecute(Sender: TObject);
Var TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
begin

 Exit;
 
 TempRQOrderItem2ENEstimateItem := HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;
   try
     RQOrderItem2ENEstimateItemObj := TempRQOrderItem2ENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderItem2ENEstimateItemEdit:=TfrmRQOrderItem2ENEstimateItemEdit.Create(Application, dsEdit);
  try
    if frmRQOrderItem2ENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempRQOrderItem2ENEstimateItem.save(RQOrderItem2ENEstimateItemObj);
        //UpdateGrid(Sender);
      end;
  finally
    frmRQOrderItem2ENEstimateItemEdit.Free;
    frmRQOrderItem2ENEstimateItemEdit:=nil;
  end;
end;

procedure TfrmRQOrderItemEdit.cbbNDSChange(
  Sender: TObject);
begin
  //inherited;
    edtPriceWithoutNdsChange(self);
end;

procedure TfrmRQOrderItemEdit.cbRQOrderItemStatusChange(Sender: TObject);
begin
  inherited;

  HideControls([lblStatusReason, edtStatusReason], (cbRQOrderItemStatus.ItemIndex + 1 <> RQORDERITEM_STATUS_CANCELED) );
  DenyBlankValues([edtStatusReason]);
  if (cbRQOrderItemStatus.ItemIndex + 1 <> RQORDERITEM_STATUS_CANCELED ) then
  begin
    edtStatusReason.Text := '';
  end;



end;

procedure TfrmRQOrderItemEdit.spbENResponsiblesClick(Sender: TObject);
var
   frmENResponsiblesShow: TfrmENResponsiblesShow;
begin
   frmENResponsiblesShow := TfrmENResponsiblesShow.Create(Application, fmNormal);
   try
      with frmENResponsiblesShow do
        if ShowModal = mrOk then
        begin
            try
              if RQOrderItemObj.responsiblesRef = nil then RQOrderItemObj.responsiblesRef := ENResponsiblesRef.Create;
              RQOrderItemObj.responsiblesRef.code := StrToInt(GetReturnValue(sgENResponsibles, 0));
              edtENResponsibles.Text := GetReturnValue(sgENResponsibles, 1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENResponsiblesShow.Free;
   end;
end;

procedure TfrmRQOrderItemEdit.spbTypePayClick(Sender: TObject);
var
	 frmRQOrderItemTypePayShow :  TfrmRQOrderItemTypePayShow;
begin
	 frmRQOrderItemTypePayShow:=TfrmRQOrderItemTypePayShow.Create(Application,fmNormal);
	 try
			with frmRQOrderItemTypePayShow do
				if ShowModal = mrOk then
				begin
						try
							 if RQOrderItemObj.typePayRef = nil then RQOrderItemObj.typePayRef := RQOrderItemTypePayRef.Create();
							 RQOrderItemObj.typePayRef.code := StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
							 edtTypePayName.Text:=GetReturnValue(sgRQOrderItemTypePay,1);

							 // чистим значение вида оплат для того что бы выбрали его по новой для нового вида оплат
							 edtValue.Text := '';
            except
               on EConvertError do Exit;
						end;
        end;
   finally
			frmRQOrderItemTypePayShow.Free;
   end;
end;

procedure TfrmRQOrderItemEdit.spbValueClick(Sender: TObject);
var
	 frmRQTypePayValueShow :  TfrmRQTypePayValueShow;
	 RQTypePayValueFilterObj : RQTypePayValueFilter;
   isTypePaySet: Boolean;
begin
  isTypePaySet := false;

  RQTypePayValueFilterObj := RQTypePayValueFilter.Create;
  SetNullIntProps(RQTypePayValueFilterObj);
  SetNullXSProps(RQTypePayValueFilterObj);

  if RQOrderItemObj.typePayRef <> nil then
    if RQOrderItemObj.typePayRef.code > LOW_INT then
    begin
      RQTypePayValueFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
      RQTypePayValueFilterObj.typePayRef.code := RQOrderItemObj.typePayRef.code;
      isTypePaySet := true;
    end;

   if not isTypePaySet then
   begin
     Application.MessageBox(PChar('Спочатку оберіть Вид оплат!'),
                         PChar('Увага!'), MB_ICONWARNING);
     edtTypePayName.SetFocus;
     Exit;
   end;

	 frmRQTypePayValueShow:= TfrmRQTypePayValueShow.Create(Application,fmNormal , RQTypePayValueFilterObj);
	 try
			with frmRQTypePayValueShow do
				if ShowModal = mrOk then
				begin
            try
							 RQOrderItemObj.paymentValue := StrToInt(GetReturnValue(sgRQTypePayValue,0));
							 edtValue.Text:=GetReturnValue(sgRQTypePayValue,1);
						except
							 on EConvertError do Exit;
						end;
        end;
   finally
			frmRQTypePayValueShow.Free;
   end;
end;

procedure TfrmRQOrderItemEdit.tbiUpdateMaterialPriceClick(Sender: TObject);
 Var TempTKMaterials: TKMaterialsControllerSoapPort;
    materialObj : TKMaterials;
begin
 TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

    try
      TKMaterialsObj :=  TempTKMaterials.getObject(RQOrderItemObj.material.code);
    except
     on EConvertError do Exit;
    end;

  frmTKMaterialsEdit := TfrmTKMaterialsEdit.Create(Application, dsEdit);
  try
    DisableControls([frmTKMaterialsEdit.edtName, frmTKMaterialsEdit.edtTKMeasurementName,
                    frmTKMaterialsEdit.spbTKMeasurement, frmTKMaterialsEdit.grpIdent,
                    frmTKMaterialsEdit.grpMaterialsLinks, frmTKMaterialsEdit.grpOther,
                    frmTKMaterialsEdit.edtDeliveryDate]
    );

    frmTKMaterialsEdit.tsnn.TabVisible := False;
    frmTKMaterialsEdit.tsRecycledMaterials.TabVisible := False;
    frmTKMaterialsEdit.tsProduction.TabVisible := False;

    frmTKMaterialsEdit.pcTKMaterials.ActivePage  := frmTKMaterialsEdit.tsGeneral;

    frmTKMaterialsEdit.ShowModal;

  finally
    if frmTKMaterialsEdit.ModalResult = mrOk then
    edtPriceWithoutNds.Text :=  frmTKMaterialsEdit.edtCost.Text;

    frmTKMaterialsEdit.Free;
    frmTKMaterialsEdit:=nil;
  end;
end;

end.
