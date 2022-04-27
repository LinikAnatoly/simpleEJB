
unit EditRQOrderItemServices;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItemController, TB2Item,
  TB2Dock, TB2Toolbar, RQOrgController , RQOrderController,
  AdvObj ;

type
  TfrmRQOrderItemServicesEdit = class(TDialogForm)
    lblMaterialNameTxt : TLabel;
    edtMaterialNameTxt: TEdit;
    lblMeasurementNameTxt : TLabel;
    edtMeasurementNameTxt: TEdit;
    lblCountFact : TLabel;
    edtCountFact: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblTKMaterialsMaterialName : TLabel;
  edtTKMaterialsMaterialName : TEdit;
  spbTKMaterialsMaterial : TSpeedButton;
  
  lblTKMeasurementMeasurementName : TLabel;
  edtTKMeasurementMeasurementName : TEdit;
  spbTKMeasurementMeasurement : TSpeedButton;
  

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
    edtNds: TEdit;
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
    lblIdentId: TLabel;
    lblIdentIdTXT: TLabel;
    lblStatusRef: TLabel;
    cbRQOrderItemStatus: TComboBox;
    lblStatusReason: TLabel;
    edtStatusReason: TEdit;
    edtCode: TEdit;
    grpTypePay: TGroupBox;
    spbTypePay: TSpeedButton;
    lblValue: TLabel;
    spbValue: TSpeedButton;
    edtTypePayName: TEdit;
    edtValue: TEdit;
    HTTPRIORQOrderItemTypePay: THTTPRIO;
    lblPdv: TLabel;
    cbbNDS: TComboBox;


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
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actMoveExecute(Sender: TObject);
    procedure edtPriceWithNdsChange(Sender: TObject);
    procedure edtPriceWithoutNdsChange(Sender: TObject);
    procedure spbContractNumberSelectClick(Sender: TObject);
    procedure actViewPlanExecute(Sender: TObject);
    procedure actEditCountExecute(Sender: TObject);
    procedure cbRQOrderItemStatusChange(Sender: TObject);
    procedure spbTypePayClick(Sender: TObject);
    procedure spbValueClick(Sender: TObject);
    procedure cbbNDSChange(
      Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    conditionSQL : String;
    orderKindCode : Integer;
    Temporder : RQOrder;
end;

var
  frmRQOrderItemServicesEdit: TfrmRQOrderItemServicesEdit;
  RQOrderItemSObj: RQOrderItem;
  RQOrgObjS: RQOrg;

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

  ENEstimateItemHeaders: array [1..13] of String =
        ( 'Код'
          ,'Послуга'
          ,'Кількість'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'

          ,'інв №'
          ,'Об''єкт'
          ,'Період вик.робіт'
          ,'ПідВид робіт'
          ,'Тип Акту'

          ,'Код роботи'
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
  RQOrderItem2ENEstimateItemStatusController, EditMaterialsParametersOut,
  ShowRQMaterials, ShowFINServicesObject,
  ENServicesObjectController, ENPlanWorkController, EditENPlanWork,
  DMReportsUnit, EditRQOrderItem2ENEstimateItem,
  RQOrderItemStatusController, ShowRQOrderItemTypePay, ShowRQTypePayValue,
  RQOrderItemTypePayController, RQTypePayValueController;

{uses  
    EnergyproController, EnergyproController2, RQOrderItemController  ;
}
{$R *.dfm}


procedure TfrmRQOrderItemServicesEdit.updateEstimateItemGrid();
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
    materialCode := RQOrderItemSObj.material.code; //StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

    TempRQOrderItem2ENEstimateItem :=  HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;

    e2Filter := RQOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(e2Filter);
    SetNullXSProps(e2Filter);

    e2Filter.orderItem := RQOrderItem.Create;
    e2Filter.orderItem.code := RQOrderItemSObj.code;

    e2Filter.statusRef := RQOrderItem2ENEstimateItemStatusRef.Create;
    e2Filter.statusRef.code := RQORDERITM2NSTMTTMSTTS_GOOD;



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


         Cells[3,i+1] := RQOrderItem2ENEstimateItemList.list[i].measureType;

         Cells[4,i+1] := RQOrderItem2ENEstimateItemList.list[i].invNumber;
         Cells[5,i+1] := RQOrderItem2ENEstimateItemList.list[i].elementName;
         period := IntToStr(RQOrderItem2ENEstimateItemList.list[i].planRefYearGen);

         if RQOrderItem2ENEstimateItemList.list[i].planRefMonthGen < 10 then
           period := period + '0' + IntToStr(RQOrderItem2ENEstimateItemList.list[i].planRefMonthGen)
         else
           period := period + IntToStr(RQOrderItem2ENEstimateItemList.list[i].planRefMonthGen);

         Cells[6,i+1] :=  period;

         Cells[7,i+1] := RQOrderItem2ENEstimateItemList.list[i].planType;
         Cells[8,i+1] := RQOrderItem2ENEstimateItemList.list[i].planState;

         Cells[9,i+1] := RQOrderItem2ENEstimateItemList.list[i].kartaNum;


         Objects[1,i+1] := TObject(RQOrderItem2ENEstimateItemList.list[i].estimateItemCode);


         sgENEstimateItem.RowCount := i + 2;
       end;


     sgENEstimateItem.Row := 1;

end;



procedure TfrmRQOrderItemServicesEdit.updateEstimateItemGrid_();
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
    materialCode := RQOrderItemSObj.material.code; //StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
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
    '(select RQORDERITEM2ENESTIMTTM.estimateitemcode from RQORDERITEM2ENESTIMTTM where RQORDERITEM2ENESTIMTTM.ORDERITEMCODE = '+ IntToStr(RQOrderItemSObj.code) +
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
         

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[3,i+1] := ENEstimateItemList.list[i].measureType;
{
                   ,'Од. виміру'

          ,'інв №'
          ,'Об''єкт'
          ,'Період'
          ,'Тип робіт'
          ,'Вид робіт'

          ,'Код роботи'
}
         Cells[4,i+1] := ENEstimateItemList.list[i].invNumber;
         Cells[5,i+1] := ENEstimateItemList.list[i].elementName;
         period := IntToStr(ENEstimateItemList.list[i].planRefYearGen);

         if ENEstimateItemList.list[i].planRefMonthGen < 10 then
           period := period + '0' + IntToStr(ENEstimateItemList.list[i].planRefMonthGen)
         else
           period := period + IntToStr(ENEstimateItemList.list[i].planRefMonthGen);

         Cells[6,i+1] :=  period;

         Cells[7,i+1] := ENEstimateItemList.list[i].planType;
         Cells[8,i+1] := ENEstimateItemList.list[i].planState;

         Cells[9,i+1] := ENEstimateItemList.list[i].kartaNum;

         Cells[10,i+1] := ENEstimateItemList.list[i].typeRefName;

         Cells[11,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[12,i+1] := ''
         else
           Cells[12,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);


         sgENEstimateItem.RowCount := i + 2;
       end;


     sgENEstimateItem.Row := 1;

end;


procedure TfrmRQOrderItemServicesEdit.FormShow(Sender: TObject);
var
   tmpMaterial : TKMaterials;
   i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;
    RQMaterialsFilterObj : RQMaterialsFilter;
    RQMaterialsList :  RQMaterialsShortList;
    TempRQMaterials: RQMaterialsControllerSoapPort;
		TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
		RQOrderItemTypePayObj : RQOrderItemTypePay;

    curr_nds : Real;
begin
  // Отключаем процедуру пересчета суммы при открытии формы (после открытия включим)
  edtCountFact.OnChange := nil;
  edtPriceWithNds.OnChange := nil;
  lblIdentIdTXT.Caption := '';

  try
    //DisableControls([spbTKMaterialsMaterial, spbTKMeasurementMeasurement]);

    DisableControls([edtCode]);

    // нефиг кол-во руками трогать ...
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
      ,edtRQOrgOrgName
      ,edtRQDDSCodesDdsCodesName
      ,edtContractNumber
      ,spbContractNumberSelect
      , edtDeliveryTime
      
			,edtTypePayName
			,edtValue      
       ]);

    SetFloatStyle([edtPriceWithoutNds, edtNds, edtPriceWithNds, edtSumWithoutNds, edtSumNds, edtSumGen]);

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
         edtCountFact
        ,edtPriceWithoutNds
        ,edtNds
        ,edtPriceWithNds
        ,edtSumWithoutNds
        ,edtSumNds
        ,edtSumGen
       ]);
     end;

    //if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin

      edtCode.Text :=  IntToStr(RQOrderItemSObj.code);

      edtMaterialNameTxt.Text := RQOrderItemSObj.materialNameTxt;
      edtMeasurementNameTxt.Text := RQOrderItemSObj.measurementNameTxt;
      if ( RQOrderItemSObj.countFact <> nil ) then
         edtCountFact.Text := RQOrderItemSObj.countFact.decimalString
      else
         edtCountFact.Text := ''; 
      if ( RQOrderItemSObj.priceWithoutNds <> nil ) then
         edtPriceWithoutNds.Text := RQOrderItemSObj.priceWithoutNds.decimalString
      else
         edtPriceWithoutNds.Text := ''; 
      if ( RQOrderItemSObj.nds <> nil ) then
         edtNds.Text := RQOrderItemSObj.nds.decimalString
      else
         edtNds.Text := '';

           // доступное значение ндс по периоду заявки
       if DialogState = dsEdit then
       begin
             // если на редактирование то тянем процент ндс коотрый действует в периоде
             curr_nds:=   DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV , Temporder.dateGen.AsDate );
             cbbNDS.Clear;
             cbbNDS.AddItem('0',nil);
             cbbNDS.AddItem(FloatToStr(curr_nds),nil);


          if StrToFloat(RQOrderItemSObj.nds.decimalString) > 0 then
             cbbNDS.ItemIndex := 1
          else
             cbbNDS.ItemIndex := 0;
       end
       else
       begin
           // если на чтение то ндс тянем со строки заявки
           cbbNDS.Clear;
           cbbNDS.AddItem(RQOrderItemSObj.nds.DecimalString,nil);
           cbbNDS.ItemIndex := 0;
       end;

      if ( RQOrderItemSObj.priceWithNds <> nil ) then
         edtPriceWithNds.Text := RQOrderItemSObj.priceWithNds.decimalString
      else
         edtPriceWithNds.Text := '';
      if ( RQOrderItemSObj.sumWithoutNds <> nil ) then
         edtSumWithoutNds.Text := RQOrderItemSObj.sumWithoutNds.decimalString
      else
         edtSumWithoutNds.Text := ''; 
      if ( RQOrderItemSObj.sumNds <> nil ) then
         edtSumNds.Text := RQOrderItemSObj.sumNds.decimalString
      else
         edtSumNds.Text := ''; 
      if ( RQOrderItemSObj.sumGen <> nil ) then
         edtSumGen.Text := RQOrderItemSObj.sumGen.decimalString
      else
         edtSumGen.Text := ''; 
      edtCommentGen.Text := RQOrderItemSObj.commentGen;


      cbRQOrderItemStatus.ItemIndex := RQOrderItemSObj.statusRef.code - 1;
      edtStatusReason.Text := RQOrderItemSObj.statusReason;
      HideControls([ lblStatusReason, edtStatusReason], RQOrderItemSObj.statusRef.code = RQORDERITEM_STATUS_GOOD);

      /////////////
      // 20.01.2012 +++ на строке заявки договор менять нельзя!!!
      DisableControls([spbRQOrgOrg], (RQOrderItemSObj.org.code <> Low_int));
      DisableControls([spbContractNumberSelect], (RQOrderItemSObj.contractNumber <> ''));
      /////////////

			if RQOrderItemSObj.typePayRef <> nil then
			begin
				if RQOrderItemSObj.typePayRef.code > LOW_INT then
				 begin

						TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;

						 try
							 RQOrderItemTypePayObj := TempRQOrderItemTypePay.getObject(RQOrderItemSObj.typePayRef.code);
						 except
						  on EConvertError do Exit;
						 end;

						edtTypePayName.Text := RQOrderItemTypePayObj.name;
				 end;

				 // выбор значение для вида оплаты
         if RQOrderItemSObj.paymentValue > low_int then
			   edtValue.text := IntToStr(RQOrderItemSObj.paymentValue);

			end;

      if RQOrderItemSObj.material <> nil then
      begin
         if RQOrderItemSObj.material.code > LOW_INT then
         begin
            edtTKMaterialsMaterialName.Text := RQOrderItemSObj.material.name;

            TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
            tmpMaterial :=  TempTKMaterials.getObject(RQOrderItemSObj.material.code);

            if  tmpMaterial <> nil then
            begin
              if  tmpMaterial.measurement <> nil then
                 if tmpMaterial.measurement.code > LOW_INT then
                 begin
                     RQOrderItemSObj.measurement.name := tmpMaterial.measurement.name;
                     RQOrderItemSObj.measurement.code := tmpMaterial.measurement.code;

                     edtTKMeasurementMeasurementName.Text := RQOrderItemSObj.measurement.name;

                     lblIdentIdTXT.Caption := tmpMaterial.identid;
                 end;

               end; // tmpMaterial <> nil


         end;
      end;

      if RQOrderItemSObj.org <> nil then
        edtRQOrgOrgName.Text := RQOrderItemSObj.org.name;

      if RQOrderItemSObj.ddsCodes <> nil then
        edtRQDDSCodesDdsCodesName.Text := RQOrderItemSObj.ddsCodes.txtCode + ' ' + RQOrderItemSObj.ddsCodes.name;

      if  length(edtRQOrgOrgName.Text) > 0 then
      begin
        if ((length(RQOrderItemSObj.contractNumber) > 0) and (RQOrderItemSObj.contractDate <> nil)) then
        begin
          edtContractNumber.Text := '№' + RQOrderItemSObj.contractNumber + ' від ' + DateToStr ( EncodeDate(RQOrderItemSObj.contractDate.Year,RQOrderItemSObj.contractDate.Month,RQOrderItemSObj.contractDate.Day) );
        end
        else
        if length(RQOrderItemSObj.contractNumber) > 0 then
         edtContractNumber.Text := '№' + RQOrderItemSObj.contractNumber;
      end;


      if ( RQOrderItemSObj.deliveryTime <> Low(Integer) ) then
         edtDeliveryTime.Text := IntToStr(RQOrderItemSObj.deliveryTime)
      else
         edtDeliveryTime.Text := '';

      if RQOrderItemSObj.plannedDatePays <> nil then
      begin
        edtPlannedDatePays.DateTime:=EncodeDate(RQOrderItemSObj.plannedDatePays.Year,RQOrderItemSObj.plannedDatePays.Month,RQOrderItemSObj.plannedDatePays.Day);
        edtPlannedDatePays.checked := true;
      end
      else
      begin
        edtPlannedDatePays.DateTime:=SysUtils.Date;
        edtPlannedDatePays.checked := false;
      end;
      if RQOrderItemSObj.plannedDateDelivery <> nil then
      begin
        edtPlannedDateDelivery.DateTime:=EncodeDate(RQOrderItemSObj.plannedDateDelivery.Year,RQOrderItemSObj.plannedDateDelivery.Month,RQOrderItemSObj.plannedDateDelivery.Day);
        edtPlannedDateDelivery.checked := true;
      end
      else
      begin
        edtPlannedDateDelivery.DateTime:=SysUtils.Date;
        edtPlannedDateDelivery.checked := false;
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



procedure TfrmRQOrderItemServicesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
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
       edtCountFact
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
        RQMaterials2TKMaterialsObj.tkMeasurement.code := RQOrderItemSObj.measurement.code;
        RQMaterials2TKMaterialsObj.tkMeasurement.name := RQOrderItemSObj.measurement.name;


        RQMaterials2TKMaterialsObj.tkMaterials := TKMaterials.Create;
        RQMaterials2TKMaterialsObj.tkMaterials.code := RQOrderItemSObj.material.code;
        RQMaterials2TKMaterialsObj.tkMaterials.name := RQOrderItemSObj.material.name;

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

     if (RQOrderItemSObj.countGen = nil ) then
       RQOrderItemSObj.countGen := TXSDecimal.Create;

     RQOrderItemSObj.materialNameTxt := edtMaterialNameTxt.Text; 

     RQOrderItemSObj.measurementNameTxt := edtMeasurementNameTxt.Text; 

     if (RQOrderItemSObj.countFact = nil ) then
       RQOrderItemSObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       RQOrderItemSObj.countFact.decimalString := edtCountFact.Text
     else
       RQOrderItemSObj.countFact := nil;


     if (RQOrderItemSObj.priceWithoutNds = nil ) then
       RQOrderItemSObj.priceWithoutNds := TXSDecimal.Create;
     if edtPriceWithoutNds.Text <> '' then
       RQOrderItemSObj.priceWithoutNds.decimalString := edtPriceWithoutNds.Text
     else
       RQOrderItemSObj.priceWithoutNds := nil;
{
     if (RQOrderItemSObj.nds = nil ) then
       RQOrderItemSObj.nds := TXSDecimal.Create;
     if edtNds.Text <> '' then
       RQOrderItemSObj.nds.decimalString := edtNds.Text
     else
       RQOrderItemSObj.nds := nil;
     }
     if cbbNDS.Text <> '' then
       RQOrderItemSObj.nds := TXSDecimal.Create;
     if cbbNDS.Text <> '' then
       RQOrderItemSObj.nds.decimalString := cbbNDS.Text
     else
       RQOrderItemSObj.nds := nil;

     if (RQOrderItemSObj.priceWithNds = nil ) then
       RQOrderItemSObj.priceWithNds := TXSDecimal.Create;
     if edtPriceWithNds.Text <> '' then
       RQOrderItemSObj.priceWithNds.decimalString := edtPriceWithNds.Text
     else
       RQOrderItemSObj.priceWithNds := nil;


     if (RQOrderItemSObj.sumWithoutNds = nil ) then
       RQOrderItemSObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQOrderItemSObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text
     else
       RQOrderItemSObj.sumWithoutNds := nil;
{
     if (RQOrderItemSObj.sumNds = nil ) then
       RQOrderItemSObj.sumNds := TXSDecimal.Create;
     if edtSumNds.Text <> '' then
       RQOrderItemSObj.sumNds.decimalString := edtSumNds.Text
     else
       RQOrderItemSObj.sumNds := nil;
     }
     
     if (RQOrderItemSObj.sumGen = nil ) then
       RQOrderItemSObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       RQOrderItemSObj.sumGen.decimalString := edtSumGen.Text 
     else
       RQOrderItemSObj.sumGen := nil;

     RQOrderItemSObj.commentGen := edtCommentGen.Text; 

     RQOrderItemSObj.userGen := edtUserGen.Text;

		 //
			if RQOrderItemSObj.typePayRef <> nil then
				if ((RQOrderItemSObj.typePayRef.code > 0) and (edtValue.Text = '')) then
					begin
					 Application.MessageBox(PChar('Поле "Значення" не заповнене!!!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
           if edtValue.CanFocus then
             edtValue.SetFocus;
					 Action:=caNone;
					 Exit;
					end;

		 if edtValue.text <> '' then
			RQOrderItemSObj.paymentValue := StrToInt(edtValue.text)
		 else
			RQOrderItemSObj.paymentValue := LOW_INT ;

     if edtdateEdit.checked then
     begin 
       if RQOrderItemSObj.dateEdit = nil then
          RQOrderItemSObj.dateEdit := TXSDate.Create;
       RQOrderItemSObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQOrderItemSObj.dateEdit := nil;

     if edtplannedDatePays.checked then
     begin 
       if RQOrderItemSObj.plannedDatePays = nil then
          RQOrderItemSObj.plannedDatePays := TXSDate.Create;
       RQOrderItemSObj.plannedDatePays.XSToNative(GetXSDate(edtplannedDatePays.DateTime));
     end
     else
       RQOrderItemSObj.plannedDatePays := nil;

     if edtplannedDateDelivery.checked then
     begin 
       if RQOrderItemSObj.plannedDateDelivery = nil then
          RQOrderItemSObj.plannedDateDelivery := TXSDate.Create;
       RQOrderItemSObj.plannedDateDelivery.XSToNative(GetXSDate(edtplannedDateDelivery.DateTime));
     end
     else
       RQOrderItemSObj.plannedDateDelivery := nil;


     if RQOrderItemSObj.statusRef = nil then
     begin
      RQOrderItemSObj.statusRef := RQOrderItemStatusRef.Create;
      RQOrderItemSObj.statusRef.code := RQORDERITEM_STATUS_GOOD;
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
       if RQOrderItemSObj.statusRef.code <> cbRQOrderItemStatus.ItemIndex + 1 then
          isChangeStatus := True;

       RQOrderItemSObj.statusRef.code := cbRQOrderItemStatus.ItemIndex + 1;
       RQOrderItemSObj.statusReason := edtStatusReason.Text;
       
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
    orgFilter.id := RQOrderItemSObj.org.id;

    orgList := TempRQOrg.getScrollableFilteredList(orgFilter, 0, -1);


   //tRQOrg := TempRQOrg.getObject(RQOrderItemSObj.org.code);
   //tRQOrg := TempRQOrg.getFilteredLis

   if orgList.totalCount = 0 then
   begin
      RQOrderItemSObj.org.code := TempRQOrg.add(RQOrderItemSObj.org);
   end
    else
   begin
      RQOrderItemSObj.org.code := orgList.list[0].code;
   end;
}

    if DialogState = dsInsert then
    begin
      RQOrderItemSObj.code:=low(Integer);
      //TempRQOrderItem.add(RQOrderItemSObj);
      //TempRQOrderItem.addWithEstimateList(RQOrderItemSObj, eArr);
    end
    else
    if DialogState = dsEdit then
    begin
      if isChangeStatus then
        TempRQOrderItem.changeStatus(RQOrderItemSObj)
      else
        TempRQOrderItem.save(RQOrderItemSObj);
    end;
  end;
end;


procedure TfrmRQOrderItemServicesEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemSObj.material = nil then RQOrderItemSObj.material := TKMaterials.Create();
               //RQOrderItemSObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;



procedure TfrmRQOrderItemServicesEdit.spbTKMeasurementMeasurementClick(Sender : TObject);
var 
   frmTKMeasurementShow: TfrmTKMeasurementShow;
begin
   frmTKMeasurementShow:=TfrmTKMeasurementShow.Create(Application,fmNormal);
   try
      with frmTKMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItemSObj.measurement = nil then RQOrderItemSObj.measurement := TKMeasurement.Create();
               RQOrderItemSObj.measurement.code := StrToInt(GetReturnValue(sgTKMeasurement,0));
               edtTKMeasurementMeasurementName.Text:=GetReturnValue(sgTKMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMeasurementShow.Free;
   end;
end;



procedure TfrmRQOrderItemServicesEdit.spbRQOrgOrgClick(Sender : TObject);
var 
   frmRQOrgShow: TfrmRQOrgShow;
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
               if RQOrderItemSObj.org = nil then
               begin
                RQOrderItemSObj.org := RQOrg.Create();
                SetNullIntProps(RQOrderItemSObj.org);
                SetNullXSProps(RQOrderItemSObj.org);
               end;
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               RQOrderItemSObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               RQOrderItemSObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               RQOrderItemSObj.org.name := GetReturnValue(sgRQOrg,1);
               RQOrderItemSObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               RQOrderItemSObj.org.okpo := GetReturnValue(sgRQOrg,2);
               RQOrderItemSObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               RQOrderItemSObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               RQOrderItemSObj.org.adr := GetReturnValue(sgRQOrg,5);
               RQOrderItemSObj.org.tel := GetReturnValue(sgRQOrg,6);
               RQOrderItemSObj.org.country := GetReturnValue(sgRQOrg,10);
               RQOrderItemSObj.org.region := GetReturnValue(sgRQOrg,11);
               RQOrderItemSObj.org.ministry := GetReturnValue(sgRQOrg,12);
               RQOrderItemSObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               RQOrderItemSObj.org.type_ := GetReturnValue(sgRQOrg,14);
               RQOrderItemSObj.org.master_code := GetReturnValue(sgRQOrg,15);

               //RQOrderItemSObj.org.date_svidet := TXSDate.Create;
               //RQOrderItemSObj.org.likv_date := TXSDate.Create;
               //RQOrderItemSObj.org.dateNalogform := TXSDate.Create;

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    RQOrderItemSObj.org.date_svidet := TXSDate.Create;
                    RQOrderItemSObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    RQOrderItemSObj.org.likv_date := TXSDate.Create;
                    RQOrderItemSObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               RQOrderItemSObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               RQOrderItemSObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               RQOrderItemSObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    RQOrderItemSObj.org.date_nalogform := TXSDate.Create;
                    RQOrderItemSObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               RQOrderItemSObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               RQOrderItemSObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               RQOrderItemSObj.org.Primechan := GetReturnValue(sgRQOrg,7);

               DisableControls([spbContractNumberSelect], false);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
}

  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, RQOrderItemSObj.org) then
  begin
    RQOrderItemSObj.org := tmpOrg;
    edtRQOrgOrgName.Text := RQOrderItemSObj.org.name;
    DisableControls([spbContractNumberSelect], false);
  end;
end;



procedure TfrmRQOrderItemServicesEdit.spbRQDDSCodesDdsCodesClick(Sender : TObject);
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
             if RQOrderItemSObj.ddsCodes = nil then RQOrderItemSObj.ddsCodes := RQDDSCodes.Create();
             RQOrderItemSObj.ddsCodes.code := RQDDSCodesShort(tvDDSCodes.Selected.Data).code; //StrToInt(GetReturnValue(sgRQDDSCodes,0));
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



procedure TfrmRQOrderItemServicesEdit.sgENEstimateItemCheckBoxClick(
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
              TempRQOrderItem.removeFromRQDepartmentByEstimate(j, RQOrderItemSObj.orderRef.code)
          else
          if (orderKindCode = RQORDER_KIND_BUDGET) then
              TempRQOrderItem.removeFromRQBudgetByEstimate(j, RQOrderItemSObj.orderRef.code)
          else
          if (orderKindCode = RQORDER_KIND_OE) then
              TempRQOrderItem.removeFromRQOeByEstimate(j, RQOrderItemSObj.orderRef.code)
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
              RQOrderItemSObj := TempRQOrderItem.getObject(RQOrderItemSObj.code);
              Self.FormShow(Sender);
          end;

      end;
      //Self.FormShow(Sender);
     //edtCountFact.Text := FloatToStr(StrToFloat(edtCountFact.Text) - StrToFloat( sgENEstimateItem.Cells[3, ARow] ));
  end;
end;
}

end;


procedure TfrmRQOrderItemServicesEdit.actInsertExecute(Sender: TObject);
var
  frmMaterialsParametersOutEdit: TfrmMaterialsParametersOutEdit;
  order : RQOrder;
  TempRQOrder_: RQOrderControllerSoapPort;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
begin

        if (orderKindCode = RQORDER_KIND_OE_PLANNED_AUTO) then
        begin
           ShowMessage('Додавати можна тільки у Неплановій заявці ...');
           Exit;
        end;

        TempRQOrder_ :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
        order := TempRQOrder_.getObject(RQOrderItemSObj.orderRef.code);

        frmMaterialsParametersOutEdit := TfrmMaterialsParametersOutEdit.Create(Application, dsInsert);

        try

        frmMaterialsParametersOutEdit.materialsINCode := RQOrderItemSObj.material.code;

        frmMaterialsParametersOutEdit.departmentCode := order.departmentRef.code;
        frmMaterialsParametersOutEdit.departmentName :=  order.departmentRef.name;

        frmMaterialsParametersOutEdit.budgetCode :=  order.budgetRef.code;
        frmMaterialsParametersOutEdit.budgetName := order.budgetRef.name;
        frmMaterialsParametersOutEdit.orderCode := order.code;


          if frmMaterialsParametersOutEdit.ShowModal = mrOk then
          begin
            //if RQOrderItemSObj<>nil then
                //TempRQOrderItem.add(RQOrderItemSObj);
                //UpdateGrid(Sender);
          end;
        finally
          frmMaterialsParametersOutEdit.Free;
          frmMaterialsParametersOutEdit:=nil;
        end;

        TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
        RQOrderItemSObj := TempRQOrderItem.getObject(RQOrderItemSObj.code);
        Self.FormShow(Sender);
end;

procedure TfrmRQOrderItemServicesEdit.actDeleteExecute(Sender: TObject);
var
  TempRQOrderItem: RQOrderItemControllerSoapPort;
  j ,i : Integer;
  state : boolean;
begin

        if (orderKindCode = RQORDER_KIND_OE_PLANNED_AUTO) then
        begin
           ShowMessage('Видаляти можна тільки у Неплановій заявці ...');
           Exit;
        end;

      TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
     //ShowMessage('false');
      if Application.MessageBox(PChar('Ви дійсно бажаєте видалити вибрані матеріали з заявки ?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin

          state := false;
          for i:=1 to sgENEstimateItem.RowCount - 1 do
          begin
              sgENEstimateItem.GetCheckBoxState(1, i, state);

              if state then
              begin
                  j := Integer(sgENEstimateItem.Objects[1, i]);
                  {
                  if (orderKindCode = RQORDER_KIND_DEPARTMENT) then
                      TempRQOrderItem.removeFromRQDepartmentByEstimate(j, RQOrderItemSObj.orderRef.code)
                  else
                  if (orderKindCode = RQORDER_KIND_BUDGET) then
                      TempRQOrderItem.removeFromRQBudgetByEstimate(j, RQOrderItemSObj.orderRef.code)
                  else
                  if (orderKindCode = RQORDER_KIND_OE) then
                      TempRQOrderItem.removeFromRQOeByEstimate(j, RQOrderItemSObj.orderRef.code)
                  else
                  begin
                      ShowMessage('Error in Kind RQOrder');
                      Exit;
                  end;
                  }

                  TempRQOrderItem.removeFromEstimate(j, RQOrderItemSObj.orderRef.code);

              end;
          end;

              //TempRQOrderItem :=  HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
              RQOrderItemSObj := TempRQOrderItem.getObject(RQOrderItemSObj.code);
              if RQOrderItemSObj <> nil then
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
              RQOrderItemSObj := TempRQOrderItem.getObject(RQOrderItemSObj.code);
              Self.FormShow(Sender);
          end;

      end;
      //Self.FormShow(Sender);
     //edtCountFact.Text := FloatToStr(StrToFloat(edtCountFact.Text) - StrToFloat( sgENEstimateItem.Cells[3, ARow] ));
  end;
}
end;
end;

procedure TfrmRQOrderItemServicesEdit.actMoveExecute(Sender: TObject);
var
 err, state : boolean;
 i,j, count , n : integer;
 TempRQOrderItem: RQOrderItemControllerSoapPort;
 arr : RQOrderItemController.ArrayOfInteger;
begin
  inherited;
  
  err := false;
  if RQOrderItemSObj.ddsCodes = nil then err:= true;
  if (not err) and (RQOrderItemSObj.ddsCodes.code <= 0) then err := true;

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
  TempRQOrderItem.moveEstimate2Item(RQOrderItemSObj.code, arr);

  ModalResult := mrCancel;

end;

procedure TfrmRQOrderItemServicesEdit.edtPriceWithNdsChange(Sender: TObject);
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

procedure TfrmRQOrderItemServicesEdit.edtPriceWithoutNdsChange(Sender: TObject);
var price, count, sum , curr_nds, curr_nds_coeff: Double;
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

procedure TfrmRQOrderItemServicesEdit.spbContractNumberSelectClick(
  Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin     
// чуть шо добавть группы если не будут нужных договоров
// в ДАО метод getContractList ... сейчас 205 - лабораотрные работы

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(RQOrderItemSObj.org.id) ; // and a.agree_group_id in (205, 342, 319, 88)';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContractNumber.Text := '№' + GetReturnValue(sgFINServicesObject, 1) + ' від ' + GetReturnValue(sgFINServicesObject, 2);
                RQOrderItemSObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                RQOrderItemSObj.contractDate := TXSDate.Create;
                RQOrderItemSObj.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
                RQOrderItemSObj.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
                RQOrderItemSObj.finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmRQOrderItemServicesEdit.actViewPlanExecute(Sender: TObject);
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




procedure TfrmRQOrderItemServicesEdit.actEditCountExecute(Sender: TObject);
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

procedure TfrmRQOrderItemServicesEdit.cbbNDSChange(
  Sender: TObject);
begin
  inherited;
      edtPriceWithoutNdsChange(self);
end;

procedure TfrmRQOrderItemServicesEdit.cbRQOrderItemStatusChange(Sender: TObject);
begin
  inherited;

  HideControls([lblStatusReason, edtStatusReason], (cbRQOrderItemStatus.ItemIndex + 1 <> RQORDERITEM_STATUS_CANCELED) );
  DenyBlankValues([edtStatusReason]);
  if (cbRQOrderItemStatus.ItemIndex + 1 <> RQORDERITEM_STATUS_CANCELED ) then
  begin
    edtStatusReason.Text := '';
  end;



end;

procedure TfrmRQOrderItemServicesEdit.spbTypePayClick(Sender: TObject);
var
	 frmRQOrderItemTypePayShow :  TfrmRQOrderItemTypePayShow;
begin
	 frmRQOrderItemTypePayShow:=TfrmRQOrderItemTypePayShow.Create(Application,fmNormal);
	 try
			with frmRQOrderItemTypePayShow do
				if ShowModal = mrOk then
				begin
						try
							 if RQOrderItemSObj.typePayRef = nil then RQOrderItemSObj.typePayRef := RQOrderItemTypePayRef.Create();
							 RQOrderItemSObj.typePayRef.code := StrToInt(GetReturnValue(sgRQOrderItemTypePay,0));
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

procedure TfrmRQOrderItemServicesEdit.spbValueClick(Sender: TObject);
var
	 frmRQTypePayValueShow :  TfrmRQTypePayValueShow;
	 RQTypePayValueFilterObj : RQTypePayValueFilter;
   isTypePaySet: Boolean;
begin
  isTypePaySet := false;

  RQTypePayValueFilterObj := RQTypePayValueFilter.Create;
  SetNullIntProps(RQTypePayValueFilterObj);
  SetNullXSProps(RQTypePayValueFilterObj);

  if RQOrderItemSObj.typePayRef <> nil then
    if RQOrderItemSObj.typePayRef.code > LOW_INT then
    begin
      RQTypePayValueFilterObj.typePayRef := RQOrderItemTypePayRef.Create();
      RQTypePayValueFilterObj.typePayRef.code := RQOrderItemSObj.typePayRef.code;
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
							 RQOrderItemSObj.paymentValue := StrToInt(GetReturnValue(sgRQTypePayValue,0));
							 edtValue.Text:=GetReturnValue(sgRQTypePayValue,1);
						except
							 on EConvertError do Exit;
						end;
        end;
   finally
			frmRQTypePayValueShow.Free;
   end;
end;

end.
