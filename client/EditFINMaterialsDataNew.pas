
unit EditFINMaterialsDataNew;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMaterialsController
  ,ENActController, ExtCtrls, Mask, AdvSpin
  , TKMaterialsController
  ,  ENEstimateItemController, TB2Item, TB2Dock, TB2Toolbar
  , ENWorkOrderController
  , ENPlanWorkController
  ,
  FINMolDataController
  , RQFKOrderController, AdvObj
  ;

type
  TfrmFINMaterialsDataNewEdit = class(TDialogForm)
    lblFrc_name : TLabel;


  HTTPRIOFINMaterials: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    lblFINDate: TLabel;
    edtFINDate: TDateTimePicker;
    edtTKMaterial: TEdit;
    lblTKMaterial: TLabel;
    edtTKCount: TEdit;
    lblTKCount: TLabel;
    lblFactCount: TLabel;
    edtFactCount: TEdit;
    GroupBox1: TGroupBox;
    sgENPlanWorkItem: TAdvStringGrid;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    gbENFINMaterials: TGroupBox;
    sgENFINMaterials: TAdvStringGrid;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    btnAdd: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ImageList1: TImageList;
    lblMeasurementUnit: TLabel;
    lblPlanWorkItem: TLabel;
    gbFINMaterials: TGroupBox;
    sgFINMaterials: TAdvStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    edtNomenclature: TEdit;
    edtMaterialName: TEdit;
    btnFind: TButton;
    lblENEstimateItemComment: TLabel;
    sgENEstimateItem: TAdvStringGrid;
    lblPlanWork: TLabel;
    edtPlanWork: TEdit;
    spbPlanWork: TSpeedButton;
    cbEstimateItemKind: TComboBox;
    HTTPRIOFINMolData: THTTPRIO;
    lblFINMol: TLabel;
    edtFINMol: TEdit;
    spbFINMol: TSpeedButton;
    chbIsIgnoreParty: TCheckBox;
    lblCFO: TLabel;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    btnMegaList: TButton;
    edtTime: TEdit;
    sgENEstimateItem2Fin: TAdvStringGrid;
    btnBind: TButton;
    lblRequiredQuantity: TLabel;
    lblFilledQuantity: TLabel;
    lblSuggestedQuantity: TLabel;
    chbAutoReserve: TCheckBox;
    lblAutoReserveWarning: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFINMolClick(Sender: TObject);
    procedure spbFINMaterialClick(Sender: TObject);

    procedure updateFINMaterialsGrid();
    procedure updateENPlanWorkItemGrid();
    procedure updateENFINMaterialsGrid();
    procedure UpdateENEstimateItem2FinGrid();

    procedure sgFINMaterialsDblClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edtNomenclatureKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actUpdateExecute(Sender: TObject);
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbPlanWorkClick(Sender: TObject);
    procedure cbEstimateItemKindChange(Sender: TObject);
    procedure sgFINMaterialsClick(Sender: TObject);
    procedure btnMegaListClick(Sender: TObject);
    procedure sgENEstimateItem2FinCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: String; var Valid: Boolean);
    procedure sgENEstimateItem2FinCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sgENEstimateItem2FinRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure btnBindClick(Sender: TObject);
    procedure chbAutoReserveClick(Sender: TObject);



  private
    { Private declarations }
    procedure InitForm(planWork: ENPlanWork; elementTypeCode: Integer; estimateItemKind: Integer);
    procedure showHideFINGridForAutoReservation(aEstimateItemCode: Integer; aENGridRow: Integer);
  public
    { Public declarations }
    planCode : Integer;
    estimateCode : Integer;
    trEstimateCodes : string; // типа вызываем из Подорожних листов .. те коды которые в транспорте на листе
    estimateItemKind: Integer;
    planCodes , partyCondition, nnCondition : String;

    parentEstimateCode : Integer;
    elementTypeCode: Integer;

    writePartyCondition , writeNnCondition: String;
    isWriteOffProtection : Boolean;

    procedure UpdateEstimateItems(planCode: Integer; estimateItemKind: Integer);


  end;

var
  frmFINMaterialsDataNewEdit: TfrmFINMaterialsDataNewEdit;
  FINMaterialsObj: FINMaterials;
  molCode : String;
  actObj_ : ENAct;
  workOrder : ENWorkOrder;
  planWork : ENPlanWork;
  //elementTypeCode: Integer;

  molData : FINMolData;
  
  materialObj : TKMaterials;
  estimateObj : ENEstimateItem;

  finDoc : Integer;
  
 // maxCount : real;
  
  materialCondition : String;
  balansNumberCondition : String;

  FINMaterialsHeaders: array [1..26] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниця виміру'
          ,'Кількість матеріалу'
          ,'Призначення залишку' {*** передвинуто ***}
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код ...'
          //,'Призначення залишку'
          ,'код тип назн залишк'
          ,'код ...'
          ,'код ЦФВ'
          ,'ЦФВ'
          ,'Ціна розрахункова'
          ,'ПІБ МОЛа'
          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Балансовий рахунок'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
          ,'дата ввода в экспл.'
          ,'код фин аналит.AX'
        );


  ENFINMaterialsHeaders: array [1..24] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниця виміру'
          ,'Кількість матеріалу'

          ,'ПІБ МОЛа'

          ,'Призначення залишку' {*** передвинуто ***}
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код ...'
          //,'Призначення залишку'
          ,'код ...'
          ,'код ...'
          ,'код ...'
          ,'...'
          ,'Ціна розрахункова'

          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Балансовий рахунок'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
        );


  ENPlanWorkItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'кількість'
          ,'норма часу на од.'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );

  ENEstimateItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Код роботи'
          ,'Робота'
          ,'Тип строки кошторису'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  ENEstimateItem2FinHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал (ПЛАН)'
          ,'Кількість (ПЛАН)'
          //,'Од. вим. (ПЛАН)'
          ,'Од. вим.'

          ,'Прив''язано' // Уже привязанное кол-во с подотчета
          ,' '           // Столбец для чекбокса
          ,'ПРИВ''ЯЗАТИ' // Скрытый столбец! Кол-во для привязки, предлагаемое автоматически
          ,'ПРИВ''ЯЗАТИ' // Кол-во, которое будет привязано (по умолч. = тому, к-рое предлагается автоматически, но может быть изменено руками)

          ,'Матеріал (ФК)'
          ,'Номенкл. №'
          ,'Кількість (ФК)'
          //,'Од. вим. (ФК)'
          ,'Партія'
        );




implementation

uses FINMolController, ShowFINMol, ENDepartment2EPRenController,
   DMReportsUnit
  //, ShowFINMaterialsData
  , ENConsts,
 ENPlanWorkItemController, FINMaterialsStatusController,
  EditFINMaterialCount, ENEstimateItemKindController, ShowENPlanWork,
  FINDoc2MolDataController, FINMolTypeController, ShowFINMolData,
  ENElementController
  , TKAccountingTypeController;


{uses
    EnergyproController, EnergyproController2, FINMaterialsController  ;
}
{$R *.dfm}


procedure TfrmFINMaterialsDataNewEdit.updateENPlanWorkItemGrid();
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  i ,j : Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  planItemFilter : ENPlanWorkItemFilter;
begin

   if estimateObj.planItemRef <> nil then
     if estimateObj.planItemRef.code > LOW_INT then
     begin
       TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

       planItemFilter := ENPlanWorkItemFilter.Create;
       SetNullIntProps(planItemFilter);
       SetNullXSProps(planItemFilter);
       planItemFilter.code :=  estimateObj.planItemRef.code;

       /////
       planItemFilter.planRef := ENPlanWorkRef.Create;
       planItemFilter.planRef.code := estimateObj.planRef.code;
       /////
       ///
       ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

       lblPlanWorkItem.Caption := ENPlanWorkItemList.list[0].kartaNum + ' ' + ENPlanWorkItemList.list[0].kartaRefName + ' ' + ENPlanWorkItemList.list[0].countGen.DecimalString;
     end;


{ //-----------------------------------------------------------------
   for i:=1 to sgENPlanWorkItem.RowCount-1 do
     for j:=0 to sgENPlanWorkItem.ColCount-1 do
       sgENPlanWorkItem.Cells[j,i]:='';

    SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
    TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    //if planItemFilter = nil then
    begin
       planItemFilter := ENPlanWorkItemFilter.Create;
       SetNullIntProps(planItemFilter);
       SetNullXSProps(planItemFilter);
    end;

    //if planItemFilter.planItemRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
   // planItemFilter.planRef.code := actObj. ;
   planItemFilter.conditionSQL := 'code in (select enestimateitem.planitemrefcode from enestimateitem';
   planItemFilter.conditionSQL := planItemFilter.conditionSQL +' where enestimateitem.planrefcode = '+ IntToStr(planCode);
   planItemFilter.conditionSQL := planItemFilter.conditionSQL +' and enestimateitem.materialrefcode = (select enestimateitem.materialrefcode from enestimateitem where enestimateitem.code =' + IntToStr(estimateCode) + '))';


    ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

    //iLastCount:=High(ENPlanWorkItemList.list);

    if High(ENPlanWorkItemList.list) > -1 then
       sgENPlanWorkItem.RowCount:=High(ENPlanWorkItemList.list)+2
    else
       sgENPlanWorkItem.RowCount:=2;

     with sgENPlanWorkItem do       
     for i:=0 to High(ENPlanWorkItemList.list) do
        begin
          Application.ProcessMessages;
          if ENPlanWorkItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENPlanWorkItemList.list[i].kartaNum;
          Cells[2,i+1] := ENPlanWorkItemList.list[i].kartaRefName;


          if ENPlanWorkItemList.list[i].countGen = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;

          if ENPlanWorkItemList.list[i].normOfTime = nil then
             Cells[4, i+1] := ''
          else
             Cells[4, i+1] := ENPlanWorkItemList.list[i].normOfTime.DecimalString;

          Cells[5, i+1] := ENPlanWorkItemList.list[i].meter;
          Cells[6, i+1] := ENPlanWorkItemList.list[i].measurementUnit;

          Cells[7,i+1] := ENPlanWorkItemList.list[i].userGen;
          if ENPlanWorkItemList.list[i].dateEdit = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);
          //iLastRow:=i+1;
          sgENPlanWorkItem.RowCount:=i+2;
        end;
     //iColCount:=iColCount+1;
     sgENPlanWorkItem.Row:=1;

}
end;


procedure TfrmFINMaterialsDataNewEdit.updateFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j , i2: Integer;
  FINMaterialsList: FINMaterialsList_;
  FINMaterialsList2: FINMaterialsShortList;

  //fmList: FINMaterialsShortList;

  //balansNumberCondition, materialCondition : String;
  finFilter , finFilter2 : FINMaterialsFilter;
  dateRemains : TXSDate;
  condition : String;
  currentEstimate : ENEstimateItem;
  estimateCode : Integer;
  rowNNFilterForWrite , rowPartyFilterForWrite : String;

  TempRQFKOrder: RQFKOrderControllerSoapPort;
  rqfqFilter : RQFKOrderFilter;
  rqfqList : RQFKOrderShortList;

  showNetOperative: Boolean;
  usesMDAXData: Boolean;
begin

  usesMDAXData := DMReports.UsesMDAXData(ENConsts.CONFIG_USES_MDAX_INVENTORYONHAND);

   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;


   //SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);

   // ПЕРЕДЕЛАли !!!!!!!!!!! на фильтр ....

      balansNumberCondition := ''; //and rpsc.bal_sch in ("+ balansNumberCondition +")
      //molCode := actObj.finMolCode ;

      // ДО проведения ПРИХОДА на МОЛ - уже видно мат-лы в подотчете .. НАХ их ...
      materialCondition := ' and h.op_kind_id not in (''5'',''10'',''310'',''300'',''320'',''321'',''20'',''15'', ''322'')';
      
      //materialCondition := '';  // and rst.mat_id in ("+ materialCondition +")



{
      if (edtMaterialName.Text <> '') then
      begin
         materialCondition := ' and upper(rst.mat_name) like ' + chr(39) + '%'+ AnsiUpperCase(edtMaterialName.Text) + '%' + chr(39) ;
      end;

      If (edtNomenclature.Text <> '') then
      begin
        materialCondition := materialCondition + ' and upper(rst.nn) like ' + chr(39) + '%'+ AnsiUpperCase(edtNomenclature.Text) + '%' + chr(39) ;
      end;
}

      finFilter := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter);
      SetNullXSProps(finFilter);
      // исщем с фильтрами ...
      if (edtMaterialName.Text <> '') then
      finFilter.mat_name := '*' + edtMaterialName.Text + '*';
      If (edtNomenclature.Text <> '') then
      finFilter.nn := '*' + edtNomenclature.Text + '*';

      condition := '';

      // если приеднання - фильтруем по нему ... если нет - выкидываем материалы для ПЕ
      //finFilter.conditionSQL := ' isCN '
      if planWork.typeRef.code = ENPLANWORKTYPE_CN then
      begin

        if planWork.priConnectionNumber <> '' then
          //finFilter.conditionSQL := ' isCN is not null and trim(rest_purpose_name) like ''%' + planWork.priConnectionNumber + ''''
          condition := ' ( isCN is not null and trim(rest_purpose_name) like ''%' + planWork.priConnectionNumber + ''')'
        else
          //finFilter.conditionSQL := ' isCN is not null';
          begin
          condition := ' (isCN is not null)'
          end;

          if  partyCondition <> '' then
          begin
              condition := '(' + condition + ' or ( dat.party_id in ('+ partyCondition +')) )';
          end;


      end
      else
        //finFilter.conditionSQL := ' isCN is null';
        condition := ' isCN is null';

      ///// 28.12.10
      // Для ВРТУ особый режим работы чекбокса "весь підзвіт", по крайней мере пока
      ///// *** 21.04.11 УБИРАЕМ ЭТУ ВОЗМОЖНОСТЬ !!!
      // 26.04.11 Все-таки надо... А то они не видят опер. запас... Внизу просто откинем транзит
      if (planWork.typeRef.code = ENPLANWORKTYPE_CN) and (chbIsIgnoreParty.Checked) then
        condition := '';
      /////

      // 22.04.11 Не видят ничего на подотчете при привязке ГСМ для ВРТУ
      if (planWork.typeRef.code = ENPLANWORKTYPE_CN) and
         (estimateItemKind = ENESTIMATEITEMKIND_GSM) and
         (chbIsIgnoreParty.Checked) then
        condition := '';

      if (estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
      begin
        //condition := ' isCN is null';
        AddCondition(condition, ' (dat.bal_sch = ''0221'')  ');
      end
      else
      // для ХИТРЫХ СПИСАНИЙ - хитрые бал. счета ...
      //if DMReports.getElementTypeByPlan(planWork.code) = EN_WRITING_NO_OBJECT then
      if (elementTypeCode = EN_WRITING_NO_OBJECT) then
      begin
          if planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_TMC then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''28'') ) ')
          else
          if planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS] then
          begin
               ///// 01.12.11
               if planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
                 AddCondition(condition, ' ( dat.bal_sch like ''07%'' ) ') // списание Спецодежды МБП
               else
                 AddCondition(condition, ' ( substr(dat.bal_sch,1,2) < ''10'' ) '); // списание остального МБП
               /////
          end
          else
          if planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA then
               AddCondition(condition, ' ( dat.bal_sch like ''11%'' ) ') // типа списание МАЛОЦЕНКИ  МНМА
          else
          if planWork.stateRef.code = ENPLANWORKSTATE_WRITINGS_OS then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''11'') )') // типа списание Осн. Средств с 11 счета
          else
          if (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_REALIZATION) or
             (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_NONEREALIZATION) or
             (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL) then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''28'') ) ')
          else
          begin
            ShowMessage('Error ...');
            Exit;
          end;

      end

      else begin
        if planWork.stateRef.code = ENPLANWORKSTATE_RECEPT_TRANSMISSION then
          // 17.07.12 NET-2508
          AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') or dat.bal_sch = ''0316'' ) ')
        else if planWork.stateRef.code = ENPLANWORKSTATE_REFINEMENT then
          AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') or dat.bal_sch like ''1124'') ')
        else
          AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') ) ');
      end;

      // выберем ПАРТИИИ и номенклатуры из приходов/расходов ...
   try
     //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
     if chbAutoReserve.Checked then
       estimateCode := StrToInt(sgENEstimateItem2Fin.Cells[0, sgENEstimateItem2Fin.Row])
     else
       estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
   except
     on EConvertError do Exit;
   end;

   // мож хоть по номенклатуре фильтрануть???
   if not chbIsIgnoreParty.Checked then
   begin
      if (estimateItemKind <> ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
      begin
        if  partyCondition <> '' then
        begin
            AddCondition(condition, ' dat.party_id in ('+ partyCondition +')');
        end
        else
        if planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then // если под вид списание средств защиты
          //*** 28.09.12 NET-3102
          // AddCondition( condition  , ' dat.rest_purpose_id = ' + IntToStr(REST_PURPOSE_ID_TRANZIT))
          AddCondition( condition  , ' dat.rest_purpose_type_id = ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT))
          //***
        else
          if not (planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) then // 09.12.11 Типа МБП могут быть и в Транзите, их можно списывать
            //*** 28.09.12 NET-3102
            // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT));
            AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
            //***
      end;
   end
   else
   begin
      //if (estimateItemKind <> ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
      //begin
        ///// 28.12.10
        // Для ВРТУ особый режим работы чекбокса "весь підзвіт", по крайней мере пока
        ///// *** 21.04.11 УБИРАЕМ ЭТУ ВОЗМОЖНОСТЬ !!!
        // if (planWork.typeRef.code <> ENPLANWORKTYPE_CN) and ( estimateItemKind <> ENESTIMATEITEMKIND_GSM) then
        if estimateItemKind <> ENESTIMATEITEMKIND_GSM then
        /////
          ///// 15.02.11
          // Для Метрологии (счетчиков) тоже особый режим работы чекбокса "весь підзвіт", по крайней мере пока
          if (elementTypeCode <> EN_METROLOGY_COUNTER) then
          /////
            if planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then // если под вид списание средств защиты
              //*** 28.09.12 NET-3102
              // AddCondition( condition  , ' dat.rest_purpose_id = ' + IntToStr(REST_PURPOSE_ID_TRANZIT))
              AddCondition( condition  , ' dat.rest_purpose_type_id = ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT))
              //***
            else
              if not (planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) then // 09.12.11 Типа МБП могут быть и в Транзите, их можно списывать
                //*** 28.09.12 NET-3102
                // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT));
                AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
                //***
      //end;
   end;

   // Показывать или нет Net. Оперативный запас (true - показывать)
   showNetOperative := false;

    {
    if ((estimateItemKind <> ENESTIMATEITEMKIND_GSM) and (planWork.budgetRef.code <> ENBUDGET_ENERGOSBYT) and
           (elementTypeCode <> EN_WRITING_NO_OBJECT)
           and (planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION) ) or
    ((planWork.budgetRef.code = ENBUDGET_VPTU) and (elementTypeCode <> EN_SERVICES_OBJECT))
      then

      //*** 28.09.12 NET-3102
      // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_NET_OPERATIVE));
      AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_NET_OPERATIVE));
      //***
    }

{********************************************************************************
/// 06.02.12 Возвращаем Нет.Оперативный запас назад (чтоб его было видно) ;-)

   if (estimateItemKind = ENESTIMATEITEMKIND_GSM) or
      (planWork.budgetRef.code = ENBUDGET_ENERGOSBYT) or
      (elementTypeCode = EN_WRITING_NO_OBJECT) then
     showNetOperative := true;

   if (planWork.budgetRef.code = ENBUDGET_VPTU) and (elementTypeCode = EN_SERVICES_OBJECT) then
     showNetOperative := true;

   if (elementTypeCode = EN_SIT)  or (planWork.budgetRef.code = ENBUDGET_SIT) then
      showNetOperative := true;

   if (planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION) then
     showNetOperative := false;

   if not showNetOperative then
     //*** 28.09.12 NET-3102
     // AddCondition(condition, ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_NET_OPERATIVE));
     AddCondition(condition, ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_NET_OPERATIVE));
     //***
********************************************************************************}

////////////////////////////////////////////////////////////////////////////////
{ 26.12.12 Тут листы с сервака дергаются, но дальше нигде не используются,
           так что можно весь этот кусок убрать

      // !!! ДЛЯ СПИСАНИЯ СРЕДСТВ ЗАЩИТЫ  фильтруем по номенклатуре и партии тех материалов которые находятся в finmaterials и введены в эксплуатацию
      if planWork.typeRef.code =  ENPLANWORKTYPE_WRITEOFF_PROTECTION then // если под вид списание средств защиты
      begin

        FINMaterialsList2 := TempFINMaterials.getFilteredPartyListWriteOff(estimateCode,molCode);

         rowNNFilterForWrite := '';
         for i2:=0 to High(FINMaterialsList2.list) do
         begin
           if rowNNFilterForWrite <> '' then
           rowNNFilterForWrite := rowNNFilterForWrite + ' , ' + '''' + FINMaterialsList2.list[i2].nn+''''
           else
           rowNNFilterForWrite := ''''+FINMaterialsList2.list[i2].nn+'''';

           if rowPartyFilterForWrite <> '' then
           rowPartyFilterForWrite := rowPartyFilterForWrite + ' , ' +  IntToStr(FINMaterialsList2.list[i2].party_id)
           else
           rowPartyFilterForWrite := IntToStr(FINMaterialsList2.list[i2].party_id);
         end;

         if rowNNFilterForWrite <> '' then
        // y AddCondition( condition  , ' dat.nn in (' + rowNNFilterForWrite + ')' ) ;

         if rowPartyFilterForWrite <> '' then
        // y AddCondition( condition  , ' dat.party_id in (' + rowPartyFilterForWrite + ')' ) ;


      end;

      // вытягиваем дату ввода в эксплуатацию если это списание средств защиты
   if isWriteOffProtection then
   begin
     TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

      rqfqFilter := RQFKOrderFilter.Create;
    SetNullIntProps(rqfqFilter);
    SetNullXSProps(rqfqFilter);
    rqfqFilter.conditionSQL := ' RQFKORDER.code in ( Select r.code    ' +
                               ' From rqfkorderitem2enstmttm rei , rqfkorderitem ri ,  rqfkorder r   ' +
                               ' Where rei.estimateitemcode = ( select i2i.estimateiteminrefcode from enestimateitem2nstmttm i2i ' +
                               '                                    where i2i.estimateitemoutrefcode = ' + IntToStr(estimateCode) +
                               '                                                                         and  i2i.typerefcode = 6 ' +
                               '                                                                         limit 1 ) ' +
                               '  and rei.fkorderitemrefcode = ri.code ' +
                               '  and ri.fkorderrefcode = r.code ' +
                               '  and r.kindcode in (8,9) ' +
                               '  and r.statuscode = 3   limit 1  ) ';

    rqfqList := TempRQFKOrder.getScrollableFilteredList(rqfqFilter, 0, -1);
     if rqfqList.totalCount > 0 then
      // AddCondition( condition  , ' dat.wear_date = ' + 'to_date(' + ''''+  DateToStr ( EncodeDate(rqfqList.list[0].dateGen.Year,rqfqList.list[0].dateGen.Month,rqfqList.list[0].dateGen.Day) ) +'''' + ',' + '''' + 'dd.mm.yyyy' + ''''+')' )
     else
     // иначе формируем строку со всеми партиями и датами вводов в эксплуатацию и
      // AddCondition( condition  , ' dat.wear_date is null ' ) ;

   end;
}
////////////////////////////////////////////////////////////////////////////////

   /////////////////////////////////////////////////////////////////////////////
   // 16.11.12 NET-3079
   if (estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
   begin
     if (partyCondition = '-1') and (nnCondition <> '') then
     begin
       AddCondition(condition, ' dat.nn in ('+ nnCondition +')');
       AddCondition(condition, ' dat.rest_purpose_type_id = ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
     end;
   end;
   /////////////////////////////////////////////////////////////////////////////

      finFilter.conditionSQL := condition;

      finFilter.orderBySQL := ' dat.mat_name';




      dateRemains := TXSDate.Create;
      dateRemains.XSToNative(GetXSDate( StrToDate('31.01.3000') ));

      //finDocCode := actObj.finDocCode ;//low(Integer);
      //dateDoc := TXSDate.Create;
      //frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));
      //frmFINMaterialsDataShow.dateDoc := actObj.dateGen;


////// 01.02.13 NET-4061, п. 3 /////////////////////////////////////////////////
{
   FINMaterialsList := TempFINMaterials.getMaterialsList(
                  finFilter,
                  balansNumberCondition,
                  // actObj.finMolCode,
                  molCode, // это может быть МЕХАник .. в зависимости ои вида материала ...
                  materialCondition,
                  //actObj.dateGen,
                  //dateRemains,
                  workOrder.dateGen,
                  //* actObj.finDocCode
                  finDoc
                  );
}
   FINMaterialsList := TempFINMaterials.getMaterialsList(
                  planCode,
                  finFilter,
                  balansNumberCondition,
                  // actObj.finMolCode,
                  molCode, // это может быть МЕХАник .. в зависимости ои вида материала ...
                  materialCondition,
                  //actObj.dateGen,
                  //dateRemains,
                  workOrder.dateGen,
                  //* actObj.finDocCode
                  finDoc
                  );
////////////////////////////////////////////////////////////////////////////////

  if High(FINMaterialsList.list) > -1 then
     sgFINMaterials.RowCount:=High(FINMaterialsList.list)+2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to High(FINMaterialsList.list) do
      begin
        // Application.ProcessMessages;

        if FINMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := FINMaterialsList.list[i].nn;
        Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;

        if FINMaterialsList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := FINMaterialsList.list[i].quantity.DecimalString;

        Cells[5,i+1] := FINMaterialsList.list[i].rest_purpose_name;


        Cells[6,i+1] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[8,i+1] := FINMaterialsList.list[i].party_discription;


        if (usesMDAXData) then
        begin
         Cells[9,i+1] := FINMaterialsList.list[i].ax_rest_purpose_id;

         Cells[10,i+1] := FINMaterialsList.list[i].ax_rest_purpose_typeid; // InventDimFinancial_UA.Dimanion[9]

         Cells[12,i+1] := FINMaterialsList.list[i].ax_frc_code;

         Cells[20,i+1] := FINMaterialsList.list[i].ax_party_id;


        end
        else
        begin
           if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
            Cells[9,i+1] := ''
            else
            Cells[9,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        //Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;

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

          if FINMaterialsList.list[i].party_id = Low(Integer) then
            Cells[20,i+1] := ''
          else
            Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);

        end;

          Cells[13,i+1] := FINMaterialsList.list[i].frc_name;

        if FINMaterialsList.list[i].calc_price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;

        Cells[15,i+1] := FINMaterialsList.list[i].div_name;

        if FINMaterialsList.list[i].price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;

// ---------------------------------------

        if FINMaterialsList.list[i].mat_id = Low(Integer) then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := IntToStr(FINMaterialsList.list[i].mat_id);


         Cells[21, i+1] := FINMaterialsList.list[i].partner;

         Cells[22, i+1] := IntToStr(FINMaterialsList.list[i].mu_id) ;

         Cells[23, i+1] := FINMaterialsList.list[i].doc_num;

        if FINMaterialsList.list[i].wear_date = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := XSDate2String(FINMaterialsList.list[i].wear_date);

          Cells[25,i+1] := FINMaterialsList.list[i].axInventDimFinId;

        sgFINMaterials.RowCount:= i + 2;
      end;

   sgFINMaterials.Row:=1;
      end;
   //ColCount:=ColCount+1;
   //sgFINMaterials.Row:=1;


//end;




procedure TfrmFINMaterialsDataNewEdit.updateENFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j{, estimateItemCode}: Integer;
  l: FINMaterialsShortList;
  f : FINMaterialsFilter;
  //balansNumberCondition, materialCondition : String;

begin
   if chbAutoReserve.Checked then Exit;

   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   for i:=1 to sgENFINMaterials.RowCount-1 do
     for j:=0 to sgENFINMaterials.ColCount-1 do
       sgENFINMaterials.Cells[j,i]:='';
   sgENFINMaterials.RowCount := 2;

   try
     //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
     estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
   except
     on EConvertError do Exit;
   end;

   f := FINMaterialsFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);

   f.estimateItemRef := ENEstimateItemRef.Create;
   f.estimateItemRef.code := estimateCode; //estimateItemCode; //estimateObj.code;

   f.statusRef := FINMaterialsStatusRef.Create;
   f.statusRef.code := FINMATERIALSSTATUS_GOOD;

   l := TempFINMaterials.getScrollableFilteredList(f,0,-1);

  if High(l.list) > -1 then
     sgENFINMaterials.RowCount:=High(l.list)+2
  else
     sgENFINMaterials.RowCount:=2;

   with sgENFINMaterials do
    for i:=0 to High(l.list) do
      begin
        //Application.ProcessMessages;

        if l.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(l.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := l.list[i].nn;
        Cells[2,i+1] := l.list[i].mat_name;
        Cells[3,i+1] := l.list[i].mu_name;

        if l.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := l.list[i].quantity.DecimalString;

        Cells[5,i+1] := l.list[i].div_name;
        Cells[6,i+1] := l.list[i].rest_purpose_name;

        Cells[7,i+1] := l.list[i].partner_name;
        if l.list[i].doc_date = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(l.list[i].doc_date);
        Cells[9,i+1] := l.list[i].party_discription;
        if l.list[i].party_id <> LOW_INT then
          Cells[10,i+1] := IntToStr(l.list[i].party_id)
        else
          Cells[10,i+1] := '';

        //Cells[15,i+1] := l.list[i].div_name;

 {       Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;
        Cells[4,i+1] := FINMaterialsList.list[i].div_name;
        Cells[5,i+1] := FINMaterialsList.list[i].partner_name;
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

// ---------------------------------------

        if FINMaterialsList.list[i].mat_id = Low(Integer) then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := IntToStr(FINMaterialsList.list[i].mat_id);

        if FINMaterialsList.list[i].party_id = Low(Integer) then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);

         Cells[21, i+1] := FINMaterialsList.list[i].partner;

         Cells[22, i+1] := IntToStr(FINMaterialsList.list[i].mu_id) ;

         Cells[23, i+1] := FINMaterialsList.list[i].doc_num;
 }
        sgENFINMaterials.RowCount:= i + 2;
      end;

   sgENFINMaterials.Row:=1;
end;



procedure TfrmFINMaterialsDataNewEdit.FormShow(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  _FINMaterialsList: FINMaterialsShortList;
  finMaterialFilter : FINMaterialsFilter;
  _finMat : FINMaterials;
  //actObj : ENAct;

  //frmFINMaterialsDataShow : TfrmFINMaterialsDataShow;
  f : FINMaterialsFilter;
  m , finObj: FINMaterials ;

//  TempFINMaterials_: FINMaterialsControllerSoapPort;

 TempSpr_matherial: TKMaterialsControllerSoapPort;
 Spr_matherialFilterObj : TKMaterialsFilter;
 Spr_matherialList : TKMaterialsShortList;

 element: ENElement;

 s_ : string;
 //TempENEstimateItem: ENEstimateItemControllerSoapPort;
 //TempTKMaterials: TKMaterialsControllerSoapPort;
begin
  /////
  //btnMegaList.Visible := (HTTPRIOENEstimateItem.HTTPWebNode.UserName = 'energynet');
  //edtTime.Visible := (HTTPRIOENEstimateItem.HTTPWebNode.UserName = 'energynet');
  //lblRequiredQuantity.Visible := (HTTPRIOENEstimateItem.HTTPWebNode.UserName = 'energynet');
  //lblFilledQuantity.Visible := (HTTPRIOENEstimateItem.HTTPWebNode.UserName = 'energynet');
  //lblSuggestedQuantity.Visible := (HTTPRIOENEstimateItem.HTTPWebNode.UserName = 'energynet');

  SetGridHeaders(ENEstimateItem2FinHeaders, sgENEstimateItem2Fin.ColumnHeaders);

  sgENEstimateItem2Fin.SortSettings.Show := false;
  /////

  lblCFO.Caption := '';

  DisableControls([edtFINMol, edtFINDate, {spbFINMol,} edtPlanWork]);

  DisableControls([spbPlanWork, cbEstimateItemKind], (planCodes = ''));
  HideControls([lblPlanWork, edtPlanWork, spbPlanWork, cbEstimateItemKind], (planCodes = ''));
  if planCodes = '' then
  begin
    // для красоты
    if lblFINDate.Left > 50 then
    begin
        //lblFINMol.Left := lblFINMol.Left - 340;
        //edtFINMol.Left := edtFINMol.Left - 340;
        //spbFINMol.Left := spbFINMol.Left - 340;
        lblFINDate.Left := lblFINDate.Left - 600;
        edtFINDate.Left := edtFINDate.Left - 600;
    end;
  end;


  if planCodes = '' then
  begin
    // ЕСЛИ НЕТУ ПЛАНА и к нему АКТА ... Уходим отсюда .....
    if planCode = LOW_INT then
    begin
      ShowMessage('План не найден ..');
      Close;
      Exit;
    end;

    planWork := DMReports.getPlanByCode(planCode);
    if planWork = nil then
    begin
      ShowMessage('План не найден .. код=' + IntToStr(planCode));
      Close;
      Exit;
    end;
  end;

  ///// 28.12.10
  ///// *** 21.04.11 УБИРАЕМ ЭТУ ВОЗМОЖНОСТЬ !!!
  // if planWork.typeRef.code = ENPLANWORKTYPE_CN then
  //  chbIsIgnoreParty.Caption := 'весь підзвіт (включно з матеріалами для інших об''єктів !!!)';
  /////

  ///// 15.02.11
  element := DMReports.getElementByCode(planWork.elementRef.code);
  elementTypeCode := element.typeRef.code;
  if elementTypeCode = EN_METROLOGY_COUNTER then
    chbIsIgnoreParty.Caption := 'весь підзвіт (включно з матеріалами для інших об''єктів !!!)';
  /////


{ **
actObj := DMReports.getActByPlan(planCode);
if actObj.code = LOW_INT then
begin
  Application.MessageBox(PChar('Выберите АКТ! Ничего НЕ сохраниться !!!'), PChar('Внимание!'), MB_ICONWARNING);
  ModalResult := mrCancel;
  //self.Close;
  //btnCancel.Click;

  Exit;

 //Abort;
end;
}

{
workOrder := DMReports.getWorkOrderByPlanCode(planCode);
if workOrder.code = LOW_INT then
begin
  Application.MessageBox(PChar('Введите НАРЯД ! Ничего НЕ сохранится !!!'), PChar('Внимание!'), MB_ICONWARNING);
  ModalResult := mrCancel;
  //self.Close;
  //btnCancel.Click;

  Close;

  Exit;

 //Abort;
end;
}

// разрулим материал !!
// + подменить МОЛа если материал -ГСМ ...
{*****
 TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
 estimateObj := TempENEstimateItem.getObject( estimateCode );

if estimateObj = nil then
begin
  ShowMessage('nefig ... estimateObj не найден ..');
  Close;
  exit;
end;
*****}

  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

  if workOrder = nil then
  begin
    Application.MessageBox(PChar('Выберите план для привязки материалов!'), PChar('Внимание!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  if workOrder.code = LOW_INT then
  begin
    Application.MessageBox(PChar('Выберите план для привязки материалов!'), PChar('Внимание!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  if molData = nil then
  begin
    Application.MessageBox(PChar('Добавьте МОЛов для привязки материалов!'), PChar('Внимание!'), MB_ICONWARNING);
    //edtPlanWork.SetFocus;
    Exit;
  end;

  //estimateItemKind := ENESTIMATEITEMKIND_MATERIALS;

  // по идее можно ВЫКОСИТЬ ... код  между условиями одинаковый !!!
  if estimateItemKind = ENESTIMATEITEMKIND_MATERIALS then
  begin
    edtFINMol.Text := molData.finMolName; //workOrder.finMolName;
    molCode := molData.finMolCode; //workOrder.finMolCode;

    ///// 05.12.11
    { *****
    if  isWriteOffProtection then
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_332).finDocCode // перенос в 33х
    else
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // перенос в 30х
    ***** }
    if (planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) or
       (planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA) then
      finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_332).finDocCode // перенос в 33х
    else
    if (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_REALIZATION) or
       (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_NONEREALIZATION) or
       {SUPP-13758}(planWork.stateRef.code = ENPLANWORKSTATE_BUFET_REALIZATION_BEZNAL) then
      finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_292).finDocCode // перенос в 33х
    else
      finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // перенос в 30х
    /////
  end
  else
  if estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
  begin
    edtFINMol.Text := molData.finMolName; //workOrder.finMolName;
    molCode := molData.finMolCode; //workOrder.finMolCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // перенос в 30х
  end
  else
  if estimateItemKind = ENESTIMATEITEMKIND_GSM then
  begin
    edtFINMol.Text := molData.finMolName; //workOrder.finMolName;
    molCode := molData.finMolCode; //workOrder.finMolCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // перенос в 30х

  { такое же как и сверху ...

    edtFINMol.Text := workOrder.finMechanicName;
    molCode := workOrder.finMechanicCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMechanicCode;
    }
  end
  else
  begin
      ShowMessage('Неизвестный материал!');
      edtFINMol.Text := 'Неизвестно ...';
      molCode := '-100001';
  end;


  if finDoc = LOW_INT then
  begin
    s_ := 'Перезаведіть МОЛа ' + molData.finMolName + ' у наряді ... ';
    Application.MessageBox(PChar(s_), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  {*****
  if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS then
  begin
    edtFINMol.Text := workOrder.finMolName;
    molCode := workOrder.finMolCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMOLCode; // перенос в 30х
  end
  else
  if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_GSM then
  begin
    edtFINMol.Text := workOrder.finMechanicName;
    molCode := workOrder.finMechanicCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMechanicCode;
  end
  else
  begin
      ShowMessage('neponytniy material :)');
      edtFINMol.Text := 'Neponytno ...';
      molCode := '-100001';
  end;

  lblENEstimateItemComment.Caption := estimateObj.commentGen ;
  *****}

  if workOrder.dateGen <> nil then
  begin
    edtFINDate.DateTime := EncodeDate(workOrder.dateGen.Year,workOrder.dateGen.Month,workOrder.dateGen.Day);
    edtFINDate.Checked := true;
  end
  else
  begin
    edtFINDate.DateTime := SysUtils.Date;
    edtFINDate.Checked := false;
  end;


  {*****
  TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
  materialObj := TempTKMaterials.getObject( estimateObj.materialRef.code );

  if materialObj = nil then
  begin
    ShowMessage('... materialObj не найден ..');
    Close;
    exit;
  end;

  edtTKMaterial.Text := materialObj.name ; //+ ' ('+ materialObj.measurement.name+')';
  //edtTKCount.Text := estimateObj.countFact.DecimalString + ' estimateObj.countFact'; // estimateObj.countGEN?? смотря для чего ... у ФАКТА это ...
  edtTKCount.Text := estimateObj.countFact.DecimalString ; // estimateObj.countGEN?? смотря для чего ... у ФАКТА это ...
  lblMeasurementUnit.Caption := materialObj.measurement.name;
  *****}

  //SetGridHeaders(FINMaterialsHeaders, sgENFINMaterials.ColumnHeaders);
  SetGridHeaders(ENFINMaterialsHeaders, sgENFINMaterials.ColumnHeaders);
  SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);

  {***** Это все сработает при вызове InitForm
  UpdateEstimateItems(planCode, estimateItemKind);

  updateENFINMaterialsGrid;
  //updateENPlanWorkItemGrid;

  updateFINMaterialsGrid;
  *****}

  /////
  InitForm(planWork, elementTypeCode, estimateItemKind);
  /////

  /// Обновление вызовется выше в InitForm
  //if chbAutoReserve.Checked then
  //  UpdateENEstimateItem2FinGrid;



  EXIT ; ///!!!!





end;



procedure TfrmFINMaterialsDataNewEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMaterials: FINMaterialsControllerSoapPort;
begin
  if Assigned(workOrder) then
    workOrder.Free;
  workOrder := nil;
end;


procedure TfrmFINMaterialsDataNewEdit.spbFINMolClick(Sender: TObject);
var
{
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  plan : ENPlanWork;
  molSel : boolean;
}
  i,j : Integer;
  f : FINMOLDataFilter;
  TempFINMolData: FINMolDataControllerSoapPort;
  FINMolDataList: FINMolDataShortList;
  frm : TfrmFINMolDataShow;
begin

   f := FINMOLDataFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.molTypeRef := FINMolTypeRef.Create;
   f.molTypeRef.code := molData.molTypeRef.code;
   f.workOrder := ENWorkOrder.Create;
   f.workOrder.code := workOrder.code;
   //f.conditionSQL := 'finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.WORKORDERCODE = '+ IntToStr(workOrder.code)+')';

   frm :=  TfrmFINMolDataShow.Create(Application, fmNormal, f);

   try
      frm.DisableActions([frm.actInsert, frm.actDelete, frm.actEdit, frm.actFilter, frm.actNoFilter]);
      if frm.ShowModal = mrOK then
      begin

            try
              i := StrToInt(frm.GetReturnValue(frm.sgFINMolData, 0));
            except
               on EConvertError do Exit;
            end;
            //TTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
            TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
            molData := TempFINMolData.getObject(i);
            //edtFINMol.Text:= molData.finMolName; //ENDepartmentShort(tvDep.Selected.Data).shortName;
            //molCode := molData.finMolCode;
            FormShow(Sender);
      end;
   finally
      frm.Free;
   end;

//showMessage('звоните разработчикам ... 11-73');
{
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      plan := DMReports.getPlanByCode(planCode);
      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.renRef := EPRenRef.Create;
      renFilter.renRef.code := plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
        f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);
   try
      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFINMol.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               molCode := GetReturnValue(sgFINMol,0);
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

procedure TfrmFINMaterialsDataNewEdit.spbFINMaterialClick(Sender: TObject);
var
  //frmFINMaterialsDataShow : TfrmFINMaterialsDataShow;
  f : FINMaterialsFilter;
  m : FINMaterials ;
  TempFINMaterials: FINMaterialsControllerSoapPort;
begin

{

   frmFINMaterialsDataShow:= TfrmFINMaterialsDataShow.Create(Application,fmNormal);
   try
      //FINMaterialsO
      frmFINMaterialsDataShow.balansNumberCondition := ''; //and rpsc.bal_sch in ("+ balansNumberCondition +")
      frmFINMaterialsDataShow.molCode := molCode;
      frmFINMaterialsDataShow.materialCondition := '';  // and rst.mat_id in ("+ materialCondition +")
      frmFINMaterialsDataShow.finDocCode := low(Integer);
      frmFINMaterialsDataShow.dateDoc := TXSDate.Create;
      frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));


      with frmFINMaterialsDataShow do
        if ShowModal = mrOk then
        begin
            try
               //if ENWorkerObj.manningTable = nil then ENWorkerObj.manningTable := ENManningTable.Create();
               //ENWorkerObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               //edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);
               {
               m := FINMaterials.Create;
               SetNullIntProps(m);
               SetNullXSProps(m);
               m.estimateItemRef := ENEstimateItemRef.Create;
               m.estimateItemRef.code := ENEstimateItemObj.code;

               m.mat_id :=  StrToInt(GetReturnValue(sgFINMaterials,0));
               m.nn := GetReturnValue(sgFINMaterials,3);

               TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
               TempFINMaterials.add(m);
               }
{            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMaterialsDataShow.Free;
   end;
}
end;

procedure TfrmFINMaterialsDataNewEdit.sgFINMaterialsDblClick(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  m : FINMaterials;
  counnt, temp2 : real;
  rezervedCountForEst : Double;

  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempTKMaterials: TKMaterialsControllerSoapPort;
  fm : FINMaterialsFilter;
  fl: FINMaterialsShortList;
  im : Integer;
  estimateObj:ENEstimateItem;
  planObj:ENPlanWork;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  extraCargo:TXSDecimal;

  strEstimateCode, strTKMaterialName, strTKMeasurementName, strQuantity: String;
begin
  if workOrder = nil then
  begin
    Application.MessageBox(PChar('Выберите план для привязки материалов!'), PChar('Внимание!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  if workOrder.code = LOW_INT then
  begin
    Application.MessageBox(PChar('Выберите план для привязки материалов!'), PChar('Внимание!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  ///// Определяем режим работы формы (автоматическое резервирование или нет)
  if chbAutoReserve.Checked then
  begin
    strEstimateCode := sgENEstimateItem2Fin.Cells[0, sgENEstimateItem2Fin.Row];
    strTKMaterialName := sgENEstimateItem2Fin.Cells[1, sgENEstimateItem2Fin.Row];
    strQuantity := sgENEstimateItem2Fin.Cells[2, sgENEstimateItem2Fin.Row];
    strTKMeasurementName := sgENEstimateItem2Fin.Cells[3, sgENEstimateItem2Fin.Row];

    try
      estimateCode := StrToInt(strEstimateCode);
    except
      on EConvertError do Exit;
    end;

  end
  else begin
    strEstimateCode := sgENEstimateItem.Cells[0, sgENEstimateItem.Row];
    strTKMaterialName := sgENEstimateItem.Cells[1, sgENEstimateItem.Row];
    strQuantity := sgENEstimateItem.Cells[3, sgENEstimateItem.Row];
    strTKMeasurementName := sgENEstimateItem.Cells[4, sgENEstimateItem.Row];
  end;
  /////

  TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  temp2 := 0;
  try
    //temp2 := StrToFloat(sgENEstimateItem.Cells[3, sgENEstimateItem.Row]);
    temp2 := StrToFloat(strQuantity);
  except
    on EConvertError do Exit;
  end;

  ///// 26.12.12 Почему 0.00000001 ??? Тут же лишний 0! У нас максимум 6 цифр может быть после "."!
  // if temp2 < 0.00000001 then
  if temp2 < 0.000001 then
  /////
  begin
    Application.MessageBox(PChar('Кол-во материалов = 0... Откорректируйте кол-во материалов в работе!'), PChar('Внимание!'), MB_ICONWARNING);
    Exit;
  end;

  frmFINMaterialCountEdit := TfrmFINMaterialCountEdit.Create(Application, dsEdit);

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  //estimateObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
  estimateObj := TempENEstimateItem.getObject(StrToInt(strEstimateCode));

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  planObj := TempENPlanWork.getObject(estimateObj.planRef.code);

  frmFINMaterialCountEdit.kindCode:=planObj.stateRef.code;

  if  (planObj.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION)
  then begin
   extraCargo:=TXSDecimal.Create;
   extraCargo:= TempFINMaterials.getExtraCargo(sgFINMaterials.Cells[1,sgFINMaterials.Row]);

   if  extraCargo<>nil  then    frmFINMaterialCountEdit.edtExtraCargo.Text:=extraCargo.decimalString;

   HideControls([frmFINMaterialCountEdit.lblPrice, frmFINMaterialCountEdit.edtExtraCargo],false);
  end
  else
  HideControls([frmFINMaterialCountEdit.lblPrice, frmFINMaterialCountEdit.edtExtraCargo],true);

  try

    try
      //frmFINMaterialCountEdit.tkMaterialName := sgENEstimateItem.Cells[1,sgENEstimateItem.Row];
      frmFINMaterialCountEdit.tkMaterialName := strTKMaterialName;
      frmFINMaterialCountEdit.tkMeasurementName := strTKMeasurementName;
      frmFINMaterialCountEdit.nn := sgFINMaterials.Cells[1,sgFINMaterials.Row];
      frmFINMaterialCountEdit.materialName := sgFINMaterials.Cells[2,sgFINMaterials.Row];
      frmFINMaterialCountEdit.measurementName := sgFINMaterials.Cells[3,sgFINMaterials.Row];
      frmFINMaterialCountEdit.availableCount := StrToFloat(sgFINMaterials.Cells[4,sgFINMaterials.Row]);
      frmFINMaterialCountEdit.CurrentCount := StrToFloat(sgENEstimateItem.Cells[3,sgENEstimateItem.Row]);

      frmFINMaterialCountEdit.planItemName := '';////sgENPlanWorkItem.Cells[1, sgENPlanWorkItem.Row] + '  ' +
                                           //sgENPlanWorkItem.Cells[2, sgENPlanWorkItem.Row];
    except
      on EConvertError do Exit;
    end;

    if frmFINMaterialCountEdit.ShowModal = mrOK then
    begin
     // !!! ДЛЯ СПИСАНИЯ СРЕДСТВ ЗАЩИТЫ  если кол-во подвязываемого мат-ла не совпадает с нормативным колличеством то запрещаем
      if planWork.typeRef.code =  ENPLANWORKTYPE_WRITEOFF_PROTECTION then // если под вид списание средств защиты
      begin
          //TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
        // вытянем количество подвязанного материала
         fm := FINMaterialsFilter.Create;
           SetNullXSProps(fm);
           SetNullIntProps(fm);

           fm.estimateItemRef := ENEstimateItemRef.Create;
           fm.estimateItemRef.code := estimateCode; //estimateItemCode; //estimateObj.code;

           fm.statusRef := FINMaterialsStatusRef.Create;
           fm.statusRef.code := FINMATERIALSSTATUS_GOOD;

           fl := TempFINMaterials.getScrollableFilteredList(fm,0,-1);
           rezervedCountForEst := 0;
            for im:=0 to High(fl.list) do
            begin
              //rezervedCountForEst:= rezervedCountForEst  + strTofloat( fl.list[im].quantity.DecimalString);
              rezervedCountForEst:= rezervedCountForEst + DMReports.getFINMaterialConvertedQuantity(fl.list[im]);
            end;

          if temp2 < frmFINMaterialCountEdit.enteredCount + rezervedCountForEst then
          begin
            Application.MessageBox(PChar('Разрешено подвязывать кол-во материалов не больше чем на плане!'), PChar('Внимание!'), MB_ICONWARNING);
            Exit;
          end;

      end;



        // перечитаем грид ;)
        // йудет кол-во в ФК

        // сохраним связку и кол-во в естимате ...

      ////////////////////////////////////////////////////////////////////////////////
      // разрулим материал !!
      // + подменить МОЛа если материал -ГСМ ...
       TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
       estimateObj := TempENEstimateItem.getObject( estimateCode );

      if estimateObj = nil then
      begin
        ShowMessage('estimateObj не найден ..');
        Close;
        exit;
      end;

      {
      if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS then
      begin
        edtFINMol.Text := workOrder.finMolName;
        molCode := workOrder.finMolCode;
        finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMOLCode; // перенос в 30х
      end
      else
      if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_GSM then
      begin
        edtFINMol.Text := workOrder.finMechanicName;
        molCode := workOrder.finMechanicCode;
        finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMechanicCode;
      end
      else
      begin
          ShowMessage('neponytniy material :)');
          edtFINMol.Text := 'Neponytno ...';
          molCode := '-100001';
      end;
      }

      lblENEstimateItemComment.Caption := estimateObj.commentGen ;

      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
      materialObj := TempTKMaterials.getObject( estimateObj.materialRef.code );

      if materialObj = nil then
      begin
        ShowMessage('... materialObj не найден ..');
        Close;
        exit;
      end;

      edtTKMaterial.Text := materialObj.name ; //+ ' ('+ materialObj.measurement.name+')';
      //edtTKCount.Text := estimateObj.countFact.DecimalString + ' estimateObj.countFact'; // estimateObj.countGEN?? смотря для чего ... у ФАКТА это ...
      edtTKCount.Text := estimateObj.countFact.DecimalString ; // estimateObj.countGEN?? смотря для чего ... у ФАКТА это ...
      lblMeasurementUnit.Caption := materialObj.measurement.name;
      ////////////////////////////////////////////////////////////////////////////////

               m := FINMaterials.Create;
               SetNullIntProps(m);
               SetNullXSProps(m);
               m.estimateItemRef := ENEstimateItemRef.Create;
               m.estimateItemRef.code := estimateCode; // !!!!!!!!!!!!!!!!!!!!!! а если несколько !!!
               m.div_code := molCode; //* actObj.finMolCode;
               m.finDocItemCode := -1; //* actObj.finDocCode; // пока этот код ... на сервере его поменяем - это код ИТЕМА в ФК

               m.quantity := TXSDecimal.Create;
               m.quantity.DecimalString :=  FloatToStr(frmFINMaterialCountEdit.enteredCount); //edtGettingCount.Text ; //!!!!!!!!! kol-vo ....//'1';// sgFINMaterials.Cells[15, sgFINMaterials.Row];

               if frmFINMaterialCountEdit.axFactor > 0 then
               begin
                 m.axFactor := TXSDecimal.Create;
                 m.axFactor.DecimalString := FloatToStr(frmFINMaterialCountEdit.axFactor);
               end;

               m.nn := sgFINMaterials.Cells[1, sgFINMaterials.Row];
               m.mat_name := sgFINMaterials.Cells[2, sgFINMaterials.Row];
               m.mu_name := sgFINMaterials.Cells[3, sgFINMaterials.Row];

               // чего он стал4-м??? НАДО 15 !!!! m.div_name := sgFINMaterials.Cells[4, sgFINMaterials.Row];
               m.div_name := sgFINMaterials.Cells[15, sgFINMaterials.Row];

               m.rest_purpose_name := sgFINMaterials.Cells[5, sgFINMaterials.Row];

               m.partner_name := sgFINMaterials.Cells[6, sgFINMaterials.Row];
               m.doc_date  := TXSDate.Create;
               m.doc_date.XSToNative(GetXSDate( StrToDate(sgFINMaterials.Cells[7, sgFINMaterials.Row])));
               m.party_discription :=  sgFINMaterials.Cells[8, sgFINMaterials.Row];
               if(DMReports.getMDAXDataValue(ENConsts.CONFIG_USES_MDAX_INVENTORYONHAND) = '1' ) then
                begin
                 m.rest_purpose_id := LOW_INT ;
                 m.ax_rest_purpose_id := sgFINMaterials.Cells[9, sgFINMaterials.Row] ;
                 m.ax_rest_purpose_typeid := sgFINMaterials.Cells[10, sgFINMaterials.Row];
                 m.rest_purpose_type_id := LOW_INT;
                 m.budget_core_id := LOW_INT; // уточнить откуда брать
                 m.ax_frc_code := sgFINMaterials.Cells[12, sgFINMaterials.Row];
                 m.mat_id := LOW_INT; // c AX нету mat_id
                 m.ax_party_id := sgFINMaterials.Cells[20, sgFINMaterials.Row];
                end
               else
                begin
                 m.ax_rest_purpose_id := '' ;
                 m.rest_purpose_id := StrToInt( sgFINMaterials.Cells[9, sgFINMaterials.Row] );
                 m.ax_rest_purpose_typeid := '';
                 m.rest_purpose_type_id := StrToInt(sgFINMaterials.Cells[10, sgFINMaterials.Row]);
                 m.budget_core_id := StrToInt(sgFINMaterials.Cells[11, sgFINMaterials.Row]);
                 m.frc_code := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
                 m.mat_id := StrToInt(sgFINMaterials.Cells[19, sgFINMaterials.Row]);
                 m.party_id := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);
                end;

               //m.rest_purpose_name := sgFINMaterials.Cells[9, sgFINMaterials.Row];



               m.frc_name := sgFINMaterials.Cells[13, sgFINMaterials.Row];
               m.calc_price := TXSDecimal.Create;
               if sgFINMaterials.Cells[16, sgFINMaterials.Row] <> '' then
                 m.calc_price.DecimalString := sgFINMaterials.Cells[16, sgFINMaterials.Row]
               else
                 m.calc_price := nil;


               m.price := TXSDecimal.Create;
               if sgFINMaterials.Cells[14, sgFINMaterials.Row] <> '' then
                 m.price.DecimalString := sgFINMaterials.Cells[14, sgFINMaterials.Row]
               else
                 m.price := nil;

               m.cost := TXSDecimal.Create;
               if sgFINMaterials.Cells[17, sgFINMaterials.Row] <> '' then
                 m.cost.DecimalString := sgFINMaterials.Cells[17, sgFINMaterials.Row] //  она же в ! m.fullCost
               else
                 m.cost := nil;

               m.bal_sch := sgFINMaterials.Cells[18, sgFINMaterials.Row];
//-----------------

               m.partner := (sgFINMaterials.Cells[21, sgFINMaterials.Row]);
               try
                 m.mu_id := StrToInt(sgFINMaterials.Cells[22, sgFINMaterials.Row]);
               except
                 on EConvertError do m.mu_id := LOW_INT;
               end;
               m.doc_num := sgFINMaterials.Cells[23, sgFINMaterials.Row];

               ///////////////
               /////// общиее кол-во и стоимость для правильного округления ...
               //////////////
               m.fullQuantity := TXSDecimal.Create;
               m.fullCost := TXSDecimal.Create;
               if sgFINMaterials.Cells[4, sgFINMaterials.Row] <> '' then
                 m.fullQuantity.DecimalString := sgFINMaterials.Cells[4, sgFINMaterials.Row]
               else
                 m.fullQuantity := nil;

               if sgFINMaterials.Cells[17, sgFINMaterials.Row] <> '' then
                 m.fullCost.DecimalString := sgFINMaterials.Cells[17, sgFINMaterials.Row] // по идее она есть еще и в ! m.cost
               else
                 m.fullCost := nil;
               ////////////////////

               if  sgFINMaterials.Cells[24, sgFINMaterials.Row] <> '' then
               begin
                 m.wear_date := TXSDate.Create;
                 m.wear_date.XSToNative(GetXSDate( StrToDate(sgFINMaterials.Cells[24, sgFINMaterials.Row])));
               end
               else
                 m.wear_date := nil;

               m.axInventDimFinId := sgFINMaterials.Cells[25, sgFINMaterials.Row];  // код фин аналитики AX

               // развязка с молом ...
               m.molDataRef := FINMolDataRef.Create;
               m.molDataRef.code := molData.code;




       if  (planObj.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION)  then
       begin
          m.extra_cargo:=TXSDecimal.Create;
          m.cost_ext:=TXSDecimal.Create;
          m.extra_cargo.DecimalString:=frmFINMaterialCountEdit.edtExtraCargo.Text;
          m.cost_ext.DecimalString:=FloatToStr(StrToFloat(frmFINMaterialCountEdit.edtExtraCargo.Text)*frmFINMaterialCountEdit.enteredCount);
       end;
{


        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;

        }

        TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

         //Сохраним цену реализации - буфет

       if  (planObj.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION) then
       begin
         extraCargo.DecimalString:= frmFINMaterialCountEdit.edtExtraCargo.Text;
         TempFINMaterials.setExtraCargo(sgFINMaterials.Cells[1,sgFINMaterials.Row],extraCargo);
       end;

        if estimateItemKind = ENESTIMATEITEMKIND_MATERIALS then
           TempFINMaterials.addMaterials(m)
        else
        if estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
           TempFINMaterials.addMaterials(m)
        else
        if  estimateItemKind = ENESTIMATEITEMKIND_GSM then
           TempFINMaterials.addGsm(m)
        else
        begin
            ShowMessage('Error in estimate Kind');
            exit;
        end;
    end;

    UpdateEstimateItems(planCode, estimateItemKind);
    // может пока размышлял ктото другой разнес ....
    updateFINMaterialsGrid;
    updateENFINMaterialsGrid;

    if chbAutoReserve.Checked then
      UpdateENEstimateItem2FinGrid;

  finally
    frmFINMaterialCountEdit.Free;
  end;

end;

procedure TfrmFINMaterialsDataNewEdit.actDeleteExecute(Sender: TObject);
Var TempFINMaterials: FINMaterialsControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFINMaterials.Cells[0,sgENFINMaterials.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите видалили прив"язку з матеріалами (Матеріали з фин.кол.) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      //TempFINMaterials.remove(ObjCode);
        if estimateItemKind = ENESTIMATEITEMKIND_MATERIALS then
           TempFINMaterials.removeMaterials(ObjCode)
        else
        if estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
           TempFINMaterials.removeMaterials(ObjCode)
        else
        if  estimateItemKind = ENESTIMATEITEMKIND_GSM then
           TempFINMaterials.removeGSM(ObjCode)
        else
        begin
            ShowMessage('Error in estimate Kind');
            exit;
        end;

      //UpdateGrid(Sender);
      updateFINMaterialsGrid;
      updateENFINMaterialsGrid;

      if chbAutoReserve.Checked then
        UpdateENEstimateItem2FinGrid;
  end;
end;

procedure TfrmFINMaterialsDataNewEdit.actEditExecute(Sender: TObject);

var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  m, tm : FINMaterials;
  counnt : real;
  ObjCode : integer;
begin
  EXIT; // РЕДАКТИРОВАНИЕ ЗАКРЫТО!!!

   try
     ObjCode := StrToInt(sgENFINMaterials.Cells[0,sgENFINMaterials.Row]);
   except
   on EConvertError do Exit;
   end;

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
  m := TempFINMaterials.getObject(ObjCode);



  frmFINMaterialCountEdit := TfrmFINMaterialCountEdit.Create(Application, dsEdit);

  try

    frmFINMaterialCountEdit.materialName := m.mat_name ; //sgFINMaterials.Cells[2,sgFINMaterials.Row];
    frmFINMaterialCountEdit.measurementName := m.mu_name; //sgFINMaterials.Cells[3,sgFINMaterials.Row];
    frmFINMaterialCountEdit.availableCount := StrToFloat(m.quantity.DecimalString); //StrToFLoat(sgFINMaterials.Cells[15,sgFINMaterials.Row]);

    frmFINMaterialCountEdit.planItemName := ''; ////sgENPlanWorkItem.Cells[1, sgENPlanWorkItem.Row] + '  ' +
                                         //sgENPlanWorkItem.Cells[2, sgENPlanWorkItem.Row];

    if frmFINMaterialCountEdit.ShowModal = mrOK then
    begin

        //TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
        m.quantity.DecimalString := FloatToStr(frmFINMaterialCountEdit.enteredCount); // сохраним кол-во ..
        //TempFINMaterials.add(m);
        TempFINMaterials.save(m);
    end;
    // может пока размышлял ктото другой разнес ....
    updateFINMaterialsGrid;
    updateENFINMaterialsGrid;

    if chbAutoReserve.Checked then
      UpdateENEstimateItem2FinGrid;

  finally
    frmFINMaterialCountEdit.Free;
  end;

end;

procedure TfrmFINMaterialsDataNewEdit.btnFindClick(Sender: TObject);
begin
  inherited;
  updateFINMaterialsGrid;
  sgFINMaterialsClick(Sender);
end;

procedure TfrmFINMaterialsDataNewEdit.edtNomenclatureKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnFindClick(Sender);
end;

procedure TfrmFINMaterialsDataNewEdit.actUpdateExecute(Sender: TObject);
begin
  updateENFINMaterialsGrid;
  updateFINMaterialsGrid;

  if chbAutoReserve.Checked then
    UpdateENEstimateItem2FinGrid;
end;

procedure TfrmFINMaterialsDataNewEdit.UpdateEstimateItems(planCode,
  estimateItemKind: Integer);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    estimateItemFilter: ENEstimateItemFilter;
    i, j, eiColCount, eiLastCount, eiLastRow, rowToSelect: Integer;
    sql : string;
begin
  //estimateItemKind := ENESTIMATEITEMKIND_MATERIALS; //*** TEMP !!!

  /////
  {
  for i := 1 to sgENEstimateItem.RowCount - 1 do
    for j := 0 to sgENEstimateItem.ColCount - 1 do
      sgENEstimateItem.Cells[j, i] := '';

    sgENEstimateItem.RowCount := 2;
  }

  ClearGrid(sgENEstimateItem);

  sql := '';

  /////

  //SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  eiColCount := -1;
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  //if estimateItemFilter = nil then
  //begin
     estimateItemFilter := ENEstimateItemFilter.Create;
     SetNullIntProps(estimateItemFilter);
     SetNullXSProps(estimateItemFilter);
  //end;

  if trEstimateCodes = '' then
  begin
    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := planCode;
  end
  else
  begin
    // типа накидали кодов из Трансп. листа ...
    AddCondition(sql, ' code in (' + trEstimateCodes + ') ');
  end;


  //estimateItemFilter.conditionSQL := 'enestimateitem.kindrefcode in (1,2)';
  if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
  estimateItemFilter.kindRef.code := estimateItemKind;

  // чтоб не тягали ОС и СЧЕТЧИКИ ... они заежают из других мест ...
  if estimateItemFilter.accountingTypeRef = nil then estimateItemFilter.accountingTypeRef := TKAccountingTypeRef.Create();
  estimateItemFilter.accountingTypeRef.code := TK_ACCOUNTINGTYPE_TMC;

  // обработаем вывод всех или не нулевых ..
  //if not cbShowAll.Checked then
  //begin
  AddCondition(sql, ' ENESTIMATEITEM.COUNTFACT <> 0 ');
  //end;


  estimateItemFilter.conditionSQL := sql;
  ////
  estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
  ////

  ///
  //pnlLegend.Visible := (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]);
  ///

  ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

  eiLastCount := High(ENEstimateItemList.list);

  if eiLastCount > -1 then
    sgENEstimateItem.RowCount := eiLastCount + 2
  else
    sgENEstimateItem.RowCount := 2;

  eiLastRow := 1;
  rowToSelect := 1;

   with sgENEstimateItem do
     for i := 0 to eiLastCount do
     begin
       //Application.ProcessMessages;  // как-то оно подтормаживает... 

       if ENEstimateItemList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
       else
         Cells[0,i+1] := '';

       if ENEstimateItemList.list[i].code = estimateCode then
         rowToSelect := i + 1;

       Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

       if ENEstimateItemList.list[i].countGen = nil then
         Cells[2,i+1] := ''
       else
         Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

       if ENEstimateItemList.list[i].countFact = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

       Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

       Cells[5,i+1] := ENEstimateItemList.list[i].kartaNum;
       Cells[6,i+1] := ENEstimateItemList.list[i].kartaRefName;

       Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;

       Cells[8,i+1] := ENEstimateItemList.list[i].userGen;

       if ENEstimateItemList.list[i].dateEdit = nil then
         Cells[9,i+1] := ''
       else
         Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);

       {
       if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
       begin
         // Если к нормативному материалу привязаны материалы из ФК, выделяем строку цветом
         if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
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
       }

       /////
       if ENEstimateItemList.list[i].countFINMaterials > 0 then
       //if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
       begin
         RowColor[i+1] := $0080FF80; //$EBFFF5
         Objects[1,i+1] := TObject(1); // признак (разнесенный)
       end
       else begin
         RowColor[i+1] := clWindow;
         Objects[1,i+1] := TObject(0);
       end;
       /////

       Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

       eiLastRow := i + 1;
       sgENEstimateItem.RowCount := eiLastRow + 1;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   eiColCount := eiColCount + 1;

   if sgENEstimateItem.Row = rowToSelect then
     sgENEstimateItemClick(sgENEstimateItem) // Если выбрана первая строка, обновляем грид с привязанными м-лами
   else
     // иначе он обновится сам (событие OnClick, судя по всему, срабатывает при изменении текущей строки грида)
     sgENEstimateItem.Row := rowToSelect; //1;

{
   // выведем список ФИН материалов .... если они есть ВААЩЕ ...
   // и только для НПЗ и ФАКТА
   if ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT) then
   begin

      try
        j := StrToInt( sgENEstimateItem.Cells[0, sgENEstimateItem.Row ]); //   (sgENEstimateItem,0));
      except
        on EConvertError do Exit;
      end;
      gbFINMaterials.Visible := true;
      //sgENEstimateItem.Align := alClient;
      updateFINMaterialsGrid(j, sgFINMaterials);
  end
  else
  begin
     gbFINMaterials.Visible := false;
     Panel1.Align := alClient;
  end;
}  
end;

procedure TfrmFINMaterialsDataNewEdit.sgENEstimateItemClick(Sender: TObject);
var eObjCode : Integer;
finFilter2 : FINMaterialsFilter;
fmList : FINMaterialsShortList;
TempFINMaterials :FINMaterialsControllerSoapPort;
i , j : integer;
oldParty, partyFromOrder, parentEstimateCodes : String;
begin
  updateENFINMaterialsGrid;

   try
     eObjCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
   except
   on EConvertError do Exit;
   end;

   parentEstimateCode := DMReports.getParentEstimateFromCurrentPlan(eObjCode).code;

   oldParty := partyCondition;

   partyCondition := '';

   nnCondition := '';

   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   //currentEstimate := DMReports.getParentEstimateFromCurrentPlan(estimateCode);
   if ( parentEstimateCode > LOW_INT) then
   begin
      finFilter2 := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter2);
      SetNullXSProps(finFilter2);
      finFilter2.statusRef := FINMaterialsStatusRef.Create;
      finFilter2.statusRef.code := FINMATERIALSSTATUS_GOOD;
      finFilter2.estimateItemRef := ENEstimateItemRef.Create;
      finFilter2.estimateItemRef.code :=  parentEstimateCode;
      fmList := TempFINMaterials.getScrollableFilteredList(finFilter2, 0, -1);
      for i:=0 to fmList.totalCount - 1 do
      begin
         AddListPos(partyCondition, IntToStr( fmList.list[i].party_id) );
         AddListPos(nnCondition, '''' + fmList.list[i].nn + '''');
      end;

      // накинем партии из приходов для тех случаев, когда приходы идут напрямую на МОЛа,
      // при этом не образуется Финматериалсы, как в случае передачи со склада на МОЛа
      // интересно как такие МОЛы работали до этого?
      partyFromOrder := '';
      partyFromOrder := DMReports.getPartyFromFKOrderByEstimateFromCurrentPlan(parentEstimateCode);
      if partyFromOrder <> '' then
        AddListPos(partyCondition,  partyFromOrder);

      {***
      if (partyCondition <> '') or ( oldParty <> '' ) then
      begin
        btnFindClick(Sender);
      end;
      ***}
{
   else
   begin
     for i:=1 to sgFINMaterials.RowCount-1 do
       for j:=0 to sgFINMaterials.ColCount-1 do
         sgFINMaterials.Cells[j,i]:='';
     sgFINMaterials.RowCount := 2;
   end;
}
  end;

  ///// 03.07.2017 SUPP-58701
  parentEstimateCodes := DMReports.getParentEstimateCodesFromCurrentPlan(eObjCode);

  if parentEstimateCodes <> '' then
  begin
    finFilter2 := FINMaterialsFilter.Create;
    SetNullIntProps(finFilter2);
    SetNullXSProps(finFilter2);

    finFilter2.statusRef := FINMaterialsStatusRef.Create;
    finFilter2.statusRef.code := FINMATERIALSSTATUS_GOOD;
    finFilter2.conditionSQL := 'FINMATERIALS.ESTIMATEITEMREFCODE in (' + parentEstimateCodes + ')';

    fmList := TempFINMaterials.getScrollableFilteredList(finFilter2, 0, -1);
    for i := 0 to fmList.totalCount - 1 do
    begin
       AddListPos(partyCondition, IntToStr( fmList.list[i].party_id) );
       AddListPos(nnCondition, '''' + fmList.list[i].nn + '''');
    end;
  end;
  /////

  if (partyCondition <> '') or ( oldParty <> '' ) then
  begin
    btnFindClick(Sender);
  end;

  updateFINMaterialsGrid;

end;

procedure TfrmFINMaterialsDataNewEdit.FormCreate(Sender: TObject);
begin
  planCodes := '';
  planCode := LOW_INT;
  estimateItemKind := LOW_INT;

  parentEstimateCode := LOW_INT;
  partyCondition := '';

  /////
  // 16.11.12 NET-3079 Для работ на сторону с использованием м-лов заказчика
  // будем ограничивать выбор остатков только теми номенклатурами, к-рые
  // были привязаны к материалам заказчика на месячном плане
  nnCondition := '';
  /////
  
  trEstimateCodes := '';
  elementTypeCode := LOW_INT;
end;

procedure TfrmFINMaterialsDataNewEdit.spbPlanWorkClick(Sender: TObject);
var planFilter: ENPlanWorkFilter;
    frmENPlanWorkShow: TfrmENPlanWorkShow;
    oldPlanCode: Integer;
    oldPlanName: String;
begin
  if planCodes = '' then Exit;

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  planFilter.conditionSQL := 'enplanwork.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) +
                             ' and enplanwork.code in (' + planCodes + ')';

  frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);
  try
    with frmENPlanWorkShow do
    begin
      DisableActions([frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actDelete,
                      frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actAddPlanItems,
                      frmENPlanWorkShow.actFilter, frmENPlanWorkShow.actNoFilter]);
      isFiltered := true;
      if ShowModal = mrOk then
      begin
        oldPlanCode := planCode;
        oldPlanName := edtPlanWork.Text;
        try
          planCode := StrToInt(GetReturnValue(sgENPlanWork, 0));
          planWork := DMReports.getPlanByCode(planCode);
          if planCode = oldPlanCode then Exit; // Если выбрали тот же самый план
        except
          on EConvertError do
          begin
            planCode := oldPlanCode;
            Exit;
          end;
        end;
        edtPlanWork.Text := GetReturnValue(sgENPlanWork, 1);

        ////////////////////////////////////////////////////////////////////////////////
        workOrder := DMReports.getWorkOrderByPlanCode(planCode);

        if workOrder.code = LOW_INT then
        begin
          Application.MessageBox(PChar('На выбранном плане не введен НАРЯД! Сначала создайте НАРЯД!'), PChar('Внимание!'), MB_ICONWARNING);
          planCode := oldPlanCode;
          edtPlanWork.Text := oldPlanName;
          Exit;
        end;

        estimateItemKind := cbEstimateItemKind.ItemIndex + 1;

        Self.FormShow(Sender);
        ////////////////////////////////////////////////////////////////////////////////


        //UpdateEstimateItems(planCode, estimateItemKind);
      end;
    end;
  finally
    frmENPlanWorkShow.Free;
  end;
end;

procedure TfrmFINMaterialsDataNewEdit.cbEstimateItemKindChange(
  Sender: TObject);
begin
  if planCode = LOW_INT then Exit;

  estimateItemKind := cbEstimateItemKind.ItemIndex + 1;

  //molData := DMReports.getMOLData(workOrder.code, molTypeCode);

  //FormShow(Sender);
  UpdateEstimateItems(planCode, estimateItemKind);
end;

procedure TfrmFINMaterialsDataNewEdit.sgFINMaterialsClick(Sender: TObject);
begin
  if sgFINMaterials.Cells[12, sgFINMaterials.Row] <> '' then
    lblCFO.Caption := 'ЦФО:  ' + sgFINMaterials.Cells[12, sgFINMaterials.Row] + ' ' +
                                 sgFINMaterials.Cells[13, sgFINMaterials.Row]; 
end;

procedure TfrmFINMaterialsDataNewEdit.btnMegaListClick(Sender: TObject);
begin
  UpdateENEstimateItem2FinGrid;
end;

procedure TfrmFINMaterialsDataNewEdit.UpdateENEstimateItem2FinGrid;
var TempFINMaterials: FINMaterialsControllerSoapPort;
    ei2FinList: ENEstimateItem2FinShortList;
    finFilter: FINMaterialsFilter;
    tStart, tFinish: Cardinal;
    i, j, tmpEstimateCode, rowToSelect, selectedEstimateCode: Integer;
    strMessage: String;
    condition, balansNumberCondition, materialCondition: String;
    suggestedQuantity, requiredQuantity, filledQuantity: Double;
    Allow, rowFound: Boolean;
begin
  selectedEstimateCode := LOW_INT;
  try
    selectedEstimateCode := StrToInt(sgENEstimateItem2Fin.Cells[0, sgENEstimateItem2Fin.Row]);
  except
    on EConvertError do selectedEstimateCode := LOW_INT;
  end;

  ClearGrid(sgENEstimateItem2Fin);

////////////////////////////////////////////////////////////////////////////////
     balansNumberCondition := '';

     materialCondition := ' and h.op_kind_id not in (''5'',''10'',''310'',''15'')';


      finFilter := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter);
      SetNullXSProps(finFilter);


      condition := '';

      if planWork.typeRef.code = ENPLANWORKTYPE_CN then
      begin
        if planWork.priConnectionNumber <> '' then
          condition := ' (isCN is not null and trim(rest_purpose_name) like ''%' + planWork.priConnectionNumber + ''')'
        else
          condition := ' (isCN is not null)';

        ///// 01.10.13 Где-то потерялось условие ;)
        if  partyCondition <> '' then
          condition := '(' + condition + ' or ( dat.party_id in ('+ partyCondition +')) )';
        /////
      end
      else
        condition := ' isCN is null';



      if (elementTypeCode = EN_WRITING_NO_OBJECT) then
      begin
          if planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_TMC then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'') ) ')
          else
          if planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS] then
          begin
               ///// 01.12.11
               if planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
                 AddCondition(condition, ' ( dat.bal_sch like ''07%'' ) ') // списание Спецодежды МБП
               else
                 AddCondition(condition, ' ( substr(dat.bal_sch,1,2) < ''10'' ) '); // списание остального МБП
               /////
          end
          else
          if planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA then
               AddCondition(condition, ' ( dat.bal_sch like ''11%'' ) ') // типа списание МАЛОЦЕНКИ  МНМА
          else
          if planWork.stateRef.code = ENPLANWORKSTATE_WRITINGS_OS then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''11'') )') // типа списание Осн. Средств с 11 счета
          else
          if (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_REALIZATION) or
             (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_NONEREALIZATION) then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''28'') ) ')
          else
          begin
            ShowMessage('Error ...');
            Exit;
          end;

      end



      else begin
        if planWork.stateRef.code = ENPLANWORKSTATE_RECEPT_TRANSMISSION then
          // 17.07.12 NET-2508
          AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') or dat.bal_sch = ''0316'' ) ')
        else
          AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') ) ');
      end;

   /////////////////////////////////////////////////////////////////////////////
   // 05.11.14 NET-4414 ГСМ подвязываем только с Бака !!!
   // 15.11.14 Включим при запуске механизма
   if (estimateItemKind = ENESTIMATEITEMKIND_GSM) then
     AddCondition(condition, ' dat.rest_purpose_type_id = ' + IntToStr(REST_PURPOSE_TYPE_ID_FUELTANK));

   /////////////////////////////////////////////////////////////////////////////

      finFilter.conditionSQL := condition;

      //finFilter.orderBySQL := ' dat.mat_name';




////////////////////////////////////////////////////////////////////////////////

  TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  tStart := GetTickCount;
  //ei2FinList := TempFINMaterials.getENEstimateItem2FinShortList(planCode, molCode, workOrder.dateGen, finDoc);
  ei2FinList := TempFINMaterials.getENEstimateItem2FinShortList(planCode, finFilter, molCode,
                                                                balansNumberCondition, materialCondition, workOrder.dateGen, finDoc);
  tFinish := GetTickCount;

  edtTime.Text := 'TIME: ' + IntToStr(tFinish - tStart);

  strMessage := '';

  // ClearGrid(sgENEstimateItem2Fin);
  {
  for i := 0 to ei2FinList.totalCount - 1 do
  begin
    strMessage := strMessage + #13#10 +
                  Format('%d - estimateCode: %d, party_id: %d', [i + 1, ei2FinList.list[i].estimateCode, ei2FinList.list[i].party_id]);


  end;

  ShowMessage(strMessage);
  }

{
  ENEstimateItem2FinHeaders: array [1..10] of String =
        ( 'Код'
          ,'Матеріал (ПЛАН)'
          ,'Кількість (ПЛАН)'
          ,'Од. вим. (ПЛАН)'
          ,' '
          ,'Матеріал (ПІДЗВІТ)'
          ,'Номенкл. №'
          ,'Кількість (ПІДЗВІТ)'
          ,'Од. вим. (ПІДЗВІТ)'
          ,'Партія'
        );

  ENEstimateItem2FinHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал (ПЛАН)'
          ,'Кількість (ПЛАН)'
          //,'Од. вим. (ПЛАН)'
          ,'Од. вим.'

          ,'Прив''язано' // Уже привязанное кол-во с подотчета
          ,' '           // Столбец для чекбокса
          ,'ПРИВ''ЯЗАТИ' // Скрытый столбец! Кол-во для привязки, предлагаемое автоматически
          ,'ПРИВ''ЯЗАТИ' // Кол-во, которое будет привязано (по умолч. = тому, к-рое предлагается автоматически, но может быть изменено руками)

          ,'Матеріал (ФК)'
          ,'Номенкл. №'
          ,'Кількість (ФК)'
          //,'Од. вим. (ФК)'
          ,'Партія'
        );

}

   tmpEstimateCode := LOW_INT;
   rowToSelect := 1;
   rowFound := false;

   with sgENEstimateItem2Fin do
     for i := 0 to ei2FinList.totalCount - 1 do
     begin
       //Application.ProcessMessages;  // как-то оно подтормаживает... 

       if ei2FinList.list[i].estimateCode <> Low(Integer) then
       begin
         //if ei2FinList.list[i].estimateCode <> tmpEstimateCode then
         //  tmpEstimateCode := ei2FinList.list[i].estimateCode;
           
         Cells[0,i+1] := IntToStr(ei2FinList.list[i].estimateCode);
       end
       else
         Cells[0,i+1] := '';

       if (ei2FinList.list[i].estimateCode = selectedEstimateCode) and (not rowFound) then
       begin
         rowToSelect := i + 1;
         rowFound := true;
       end;

       // Если под один estimate есть несколько партий, то данные в левой части грида (по estimat'у)
       // выводим только один раз (в первой строке, для остальных строк - пусто)
       if ei2FinList.list[i].estimateCode <> tmpEstimateCode then
       begin
         tmpEstimateCode := ei2FinList.list[i].estimateCode;

         Cells[1,i+1] := ei2FinList.list[i].materialRefName;

         if ei2FinList.list[i].estimateCountFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ei2FinList.list[i].estimateCountFact.DecimalString;

         //Colors[2, i + 1] := $0080FF80;

         Cells[3,i+1] := ei2FinList.list[i].measureType;

         // Cells[4,i+1] := '';
         if ei2FinList.list[i].quantityFINMaterials = nil then
           Cells[4,i+1] := ''
         else
           Cells[4,i+1] := ei2FinList.list[i].quantityFINMaterials.DecimalString;
       end
       else begin
         Cells[1,i+1] := '';
         Cells[2,i+1] := '';
         Cells[3,i+1] := '';
         Cells[4,i+1] := '';
       end;

       //CellProperties[4, i + 1].FontStyle := CellProperties[4, i + 1].FontStyle + {[fsItalic] + }[fsBold];
       //CellProperties[4, i + 1].FontColor := clBlue;

       /////////////////////////////////
       requiredQuantity := 0;
       try
         if ei2FinList.list[i].estimateCountFact <> nil then
           if ei2FinList.list[i].estimateCountFact.DecimalString <> '' then
             requiredQuantity := StrToFloat(ei2FinList.list[i].estimateCountFact.DecimalString);
       except
         on EConvertError do requiredQuantity := 0;
       end;

       filledQuantity := 0;
       try
         if ei2FinList.list[i].quantityFINMaterials <> nil then
           if ei2FinList.list[i].quantityFINMaterials.DecimalString <> '' then
             filledQuantity := StrToFloat(ei2FinList.list[i].quantityFINMaterials.DecimalString);
       except
         on EConvertError do filledQuantity := 0;
       end;

       if filledQuantity = requiredQuantity then
       begin
         {
         Colors[1, i + 1] := $0080FF80;
         Colors[2, i + 1] := $0080FF80;
         Colors[3, i + 1] := $0080FF80;
         Colors[4, i + 1] := $0080FF80;
         }
         RowColor[i + 1] := $0080FF80;
       end
       else
         RowColor[i + 1] := clWindow;
       /////////////////////////////////

       // Colors[2, i + 1] := $0080FF80;
       CellProperties[2, i + 1].FontStyle := CellProperties[2, i + 1].FontStyle + {[fsItalic] + }[fsBold];
       //CellProperties[2, i + 1].FontColor := clBlue;

       //if ei2FinList.list[i].suggestedQuantity <> nil then
       //  Cells[4,i+1] := Cells[4,i+1] + ' / ' + ei2FinList.list[i].suggestedQuantity.DecimalString;

       //AddCheckBox(5, i+1, true, false);

       if ei2FinList.list[i].suggestedQuantity = nil then
         Cells[6,i+1] := ''
       else begin
         Cells[6,i+1] := ei2FinList.list[i].suggestedQuantity.DecimalString;
       end;

       suggestedQuantity := 0;
       try
         if sgENEstimateItem2Fin.Cells[6, i+1] <> '' then
           suggestedQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[6, i+1]);
       except
         on EConvertError do suggestedQuantity := 0;
       end;

       /////// НЕ ПЕРЕДВИГАТЬ ЭТОТ КУСОК!!!!!
       CellProperties[5, i+1].Alignment := taCenter;
       CellProperties[5, i+1].ReadOnly := false;
       AddCheckBox(5, i+1, (suggestedQuantity > 0), false);
       sgENEstimateItem2FinCheckBoxClick(sgENEstimateItem2Fin, 5, i+1, (suggestedQuantity > 0));
       ///////

       if ei2FinList.list[i].suggestedQuantity = nil then
         Cells[7,i+1] := ''
       else
         Cells[7,i+1] := ei2FinList.list[i].suggestedQuantity.DecimalString;

       //Colors[7, i + 1] := clYellow;

       Cells[8,i+1] := ei2FinList.list[i].mat_name;
       Cells[9,i+1] := ei2FinList.list[i].nn;

       if ei2FinList.list[i].quantity = nil then
         Cells[10,i+1] := ''
       else
         Cells[10,i+1] := ei2FinList.list[i].quantity.DecimalString;

       // Colors[10, i + 1] := $0080FF80;
       CellProperties[10, i + 1].FontStyle := CellProperties[10, i + 1].FontStyle + {[fsItalic] + }[fsBold];
       //CellProperties[10, i + 1].FontColor := clBlue;

       //Cells[8,i+1] := ei2FinList.list[i].mu_name;


       if ei2FinList.list[i].party_id = LOW_INT then
         Cells[11,i+1] := ''
       else
         Cells[11,i+1] := IntToStr(ei2FinList.list[i].party_id);

       /////////////////////////////////////////////////////////////////////////
       // Скрытые столбцы для дальнейшего создания finmaterials'ов при массовой привязке
       if ei2FinList.list[i].mat_id = LOW_INT then
         Cells[12,i+1] := ''
       else
         Cells[12,i+1] := IntToStr(ei2FinList.list[i].mat_id);

       if ei2FinList.list[i].mu_id = LOW_INT then
         Cells[13,i+1] := ''
       else
         Cells[13,i+1] := IntToStr(ei2FinList.list[i].mu_id);

       Cells[14,i+1] := ei2FinList.list[i].mu_name;

       Cells[15,i+1] := ei2FinList.list[i].div_name;

       if ei2FinList.list[i].rest_purpose_id = LOW_INT then
         Cells[16,i+1] := ''
       else
         Cells[16,i+1] := IntToStr(ei2FinList.list[i].rest_purpose_id);

       if ei2FinList.list[i].rest_purpose_type_id = LOW_INT then
         Cells[17,i+1] := ''
       else
         Cells[17,i+1] := IntToStr(ei2FinList.list[i].rest_purpose_type_id);

       Cells[18,i+1] := ei2FinList.list[i].rest_purpose_name;

       Cells[19,i+1] := ei2FinList.list[i].party_discription;

       if ei2FinList.list[i].budget_core_id = LOW_INT then
         Cells[20,i+1] := ''
       else
         Cells[20,i+1] := IntToStr(ei2FinList.list[i].budget_core_id);

       if ei2FinList.list[i].frc_code = LOW_INT then
         Cells[21,i+1] := ''
       else
         Cells[21,i+1] := IntToStr(ei2FinList.list[i].frc_code);

       Cells[22,i+1] := ei2FinList.list[i].frc_name;

       if ei2FinList.list[i].calc_price = nil then
         Cells[23,i+1] := ''
       else
         Cells[23,i+1] := ei2FinList.list[i].calc_price.DecimalString;

       if ei2FinList.list[i].price = nil then
         Cells[24,i+1] := ''
       else
         Cells[24,i+1] := ei2FinList.list[i].price.DecimalString;

       if ei2FinList.list[i].cost = nil then
         Cells[25,i+1] := ''
       else
         Cells[25,i+1] := ei2FinList.list[i].cost.DecimalString;

       if ei2FinList.list[i].fullQuantity = nil then
         Cells[26,i+1] := ''
       else
         Cells[26,i+1] := ei2FinList.list[i].fullQuantity.DecimalString;

       if ei2FinList.list[i].fullCost = nil then
         Cells[27,i+1] := ''
       else
         Cells[27,i+1] := ei2FinList.list[i].fullCost.DecimalString;

       Cells[28,i+1] := ei2FinList.list[i].bal_sch;

       Cells[29,i+1] := ei2FinList.list[i].partner;
       Cells[30,i+1] := ei2FinList.list[i].partner_name;

       Cells[31,i+1] := ei2FinList.list[i].doc_num;
       if ei2FinList.list[i].doc_date = nil then
         Cells[32,i+1] := ''
       else
         Cells[32,i+1] := XSDate2String(ei2FinList.list[i].doc_date);

       if ei2FinList.list[i].wear_date = nil then
         Cells[33,i+1] := ''
       else
         Cells[33,i+1] := XSDate2String(ei2FinList.list[i].wear_date);

       if ei2FinList.list[i].extra_cargo = nil then
         Cells[34,i+1] := ''
       else
         Cells[34,i+1] := ei2FinList.list[i].extra_cargo.DecimalString;

       if ei2FinList.list[i].cost_ext = nil then
         Cells[35,i+1] := ''
       else
         Cells[35,i+1] := ei2FinList.list[i].cost_ext.DecimalString;
       /////////////////////////////////////////////////////////////////////////

       sgENEstimateItem2Fin.RowCount := i + 2;
     end;

     
  for i := 1 to sgENEstimateItem2Fin.RowCount - 1 do
    for j := 1 to sgENEstimateItem2Fin.ColCount - 1 do
    begin
      {
      if (j <> 5) and (j <> 7) then
        sgENEstimateItem2Fin.CellProperties[j, i].ReadOnly := true
      else
        sgENEstimateItem2Fin.CellProperties[j, i].ReadOnly := false;
      }
      if (j <> 5) and (j <> 7) then
        sgENEstimateItem2Fin.CellProperties[j, i].ReadOnly := true;

      //if j = 7 then
      //  sgENEstimateItem2Fin.CellProperties[j, i].Editor := edPositiveNumeric;
    end;

  sgENEstimateItem2Fin.Row := rowToSelect;
  //sgENEstimateItem2FinRowChanging(sgENEstimateItem2Fin, 0, 1, Allow);
  sgENEstimateItem2FinRowChanging(sgENEstimateItem2Fin, 0, rowToSelect, Allow);

end;

procedure TfrmFINMaterialsDataNewEdit.sgENEstimateItem2FinCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: String;
  var Valid: Boolean);
var suggestedQuantity, userQuantity: Double;
    state: Boolean;
begin
  if ACol <> 7 then Exit;

  sgENEstimateItem2Fin.GetCheckBoxState(5, ARow, state);

  if not state then Exit;

  suggestedQuantity := 0;
  try
    if sgENEstimateItem2Fin.Cells[6, ARow] <> '' then
      suggestedQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[6, ARow]);
  except
    on EConvertError do suggestedQuantity := 0;
  end;  

  userQuantity := 0;
  try
    userQuantity := StrToFloat(Value);
  except
    on EConvertError do
    begin
      //raise Exception.Create('Неприпустиме значення: "' + Value + '"!');
      Application.MessageBox(PChar('Неприпустиме значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
      Value := FloatToStr(suggestedQuantity);
      Valid := false;
      Exit;
    end;
  end;

  if userQuantity < 0 then
  begin
    Application.MessageBox(PChar('Неприпустиме значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
    Value := FloatToStr(suggestedQuantity);
    Valid := false;
    Exit;
  end;

  if userQuantity > suggestedQuantity then
  begin
    Application.MessageBox(PChar('Максимальна припустима кількість: ' + FloatToStr(suggestedQuantity) + '!'), PChar('Помилка!'), MB_ICONERROR);
    Value := FloatToStr(suggestedQuantity);
    Valid := false;
  end;
end;

procedure TfrmFINMaterialsDataNewEdit.sgENEstimateItem2FinCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  if State then
  begin
    sgENEstimateItem2Fin.Cells[7, ARow] := sgENEstimateItem2Fin.Cells[6, ARow];
    sgENEstimateItem2Fin.CellProperties[7, ARow].ReadOnly := false;
    sgENEstimateItem2Fin.Colors[7, ARow] := clYellow;
  end
  else begin
    sgENEstimateItem2Fin.Cells[7, ARow] := '';
    sgENEstimateItem2Fin.CellProperties[7, ARow].ReadOnly := true;
    sgENEstimateItem2Fin.Colors[7, ARow] := clWindow;
  end;
end;

procedure TfrmFINMaterialsDataNewEdit.sgENEstimateItem2FinRowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j, estimateItemCode, party_id, tmpEstimateItemCode: Integer;
  l: FINMaterialsShortList;
  f : FINMaterialsFilter;
  //requiredQuantity, filledQuantity, suggestedQuantity, tmpSuggestedQuantity: Double;
begin
  if (NewRow = OldRow) then Exit;

  if not chbAutoReserve.Checked then Exit;

  ClearGrid(sgENFINMaterials);

  try
    // estimateItemCode := StrToInt(sgENEstimateItem2Fin.Cells[0, sgENEstimateItem2Fin.Row]);
    estimateItemCode := StrToInt(sgENEstimateItem2Fin.Cells[0, NewRow]);
  except
    on EConvertError do Exit;
  end;

  /////////////////////////////////////////////////////////////////////////////
  
  (*
  requiredQuantity := 0;
  try
    if sgENEstimateItem2Fin.Cells[2, NewRow] <> '' then
      requiredQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[2, NewRow]);
  except
    on EConvertError do requiredQuantity := 0;
  end;

  filledQuantity := 0;
  try
    if sgENEstimateItem2Fin.Cells[4, NewRow] <> '' then
      filledQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[4, NewRow]);
  except
    on EConvertError do filledQuantity := 0;
  end;

  suggestedQuantity := 0;

  for i := 1 to sgENEstimateItem2Fin.RowCount - 1 do
  begin
    try
      tmpEstimateItemCode := StrToInt(sgENEstimateItem2Fin.Cells[0, i]);
    except
      on EConvertError do Continue;
    end;

    if tmpEstimateItemCode = estimateItemCode then
    begin

      tmpSuggestedQuantity := 0;
      try
        if sgENEstimateItem2Fin.Cells[6, i] <> '' then
          tmpSuggestedQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[6, i]);
      except
        on EConvertError do tmpSuggestedQuantity := 0;
      end;
      suggestedQuantity := suggestedQuantity + tmpSuggestedQuantity;

    end; // if tmpEstimateItemCode = estimateItemCode

  end; // for i := 1 to sgENEstimateItem2Fin.RowCount - 1

  party_id := LOW_INT;
  try
    if sgENEstimateItem2Fin.Cells[11, NewRow] <> '' then
      party_id := StrToInt(sgENEstimateItem2Fin.Cells[11, NewRow]);
  except
    on EConvertError do party_id := LOW_INT;
  end;

  lblRequiredQuantity.Caption := 'Required: ' + FloatToStr(requiredQuantity);
  lblFilledQuantity.Caption := 'Filled: ' + FloatToStr(filledQuantity);
  lblSuggestedQuantity.Caption := 'Suggested: ' + FloatToStr(suggestedQuantity);

  // and (party_id = LOW_INT) - это условие, по идее, можно не добавлять
  if (filledQuantity + suggestedQuantity < requiredQuantity) {and (party_id = LOW_INT)} then
  begin
    ClearGrid(sgFINMaterials);
    lblCFO.Caption := '';
    gbFINMaterials.Visible := true;
    chbIsIgnoreParty.Checked := true;
    chbIsIgnoreParty.Enabled := false;
    chbIsIgnoreParty.Visible := false;
  end
  else begin
    gbFINMaterials.Visible := false;
    chbIsIgnoreParty.Checked := false;
  end;
  *)

  showHideFINGridForAutoReservation(estimateItemCode, NewRow);

  /////////////////////////////////////////////////////////////////////////////



  TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  f := FINMaterialsFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);

  f.estimateItemRef := ENEstimateItemRef.Create;
  f.estimateItemRef.code := estimateItemCode;

  f.statusRef := FINMaterialsStatusRef.Create;
  f.statusRef.code := FINMATERIALSSTATUS_GOOD;

  l := TempFINMaterials.getScrollableFilteredList(f,0,-1);

  if High(l.list) > -1 then
    sgENFINMaterials.RowCount:=High(l.list)+2
  else
    sgENFINMaterials.RowCount:=2;

  with sgENFINMaterials do
    for i:=0 to High(l.list) do
      begin
        //Application.ProcessMessages;

        if l.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(l.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := l.list[i].nn;
        Cells[2,i+1] := l.list[i].mat_name;
        Cells[3,i+1] := l.list[i].mu_name;

        if l.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := l.list[i].quantity.DecimalString;

        Cells[5,i+1] := l.list[i].div_name;
        Cells[6,i+1] := l.list[i].rest_purpose_name;

        Cells[7,i+1] := l.list[i].partner_name;
        if l.list[i].doc_date = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(l.list[i].doc_date);
        Cells[9,i+1] := l.list[i].party_discription;
        if l.list[i].party_id <> LOW_INT then
          Cells[10,i+1] := IntToStr(l.list[i].party_id)
        else
          Cells[10,i+1] := '';

        sgENFINMaterials.RowCount:= i + 2;
      end;

   sgENFINMaterials.Row:=1;
end;

procedure TfrmFINMaterialsDataNewEdit.btnBindClick(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  finList: ArrayOfFINMaterialsData;
  m: FINMaterials;
  i, estimateCode, count: Integer;
  state, isSel: Boolean;
  quantity: Double;
begin
  if estimateItemKind <> ENESTIMATEITEMKIND_MATERIALS then
    raise Exception.Create('NET-3974 Цей функціонал не використовується для такого типу матеріалів!');

  if workOrder = nil then
  begin
    Application.MessageBox(PChar('Выберите план для привязки материалов!'), PChar('Внимание!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  if workOrder.code = LOW_INT then
  begin
    Application.MessageBox(PChar('Выберите план для привязки материалов!'), PChar('Внимание!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  state := false;
  isSel := false;

  for i := 1 to sgENEstimateItem2Fin.RowCount - 1 do
  begin
    sgENEstimateItem2Fin.GetCheckBoxState(5, i, state);
    if state then
    begin
      isSel := true;
      break;
    end;
  end;

  if not isSel then
  begin
    Application.MessageBox(PChar('Виберіть хоча б один матеріал !'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте зарезервувати всі обрані матеріали ?'),
                            PChar('Увага !'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
    Exit;

  SetLength(finList, 0);

  for i := 1 to sgENEstimateItem2Fin.RowCount - 1 do
  begin
    sgENEstimateItem2Fin.GetCheckBoxState(5, i, state);

    if state then
    begin
       try
         estimateCode := StrToInt(sgENEstimateItem2Fin.Cells[0, i]);
       except
         on EConvertError do Continue;
       end;

       quantity := 0;
       try
         if sgENEstimateItem2Fin.Cells[7, i] <> '' then
           quantity := StrToFloat(sgENEstimateItem2Fin.Cells[7, i]);
       except
         on EConvertError do quantity := 0;
       end;

       //if quantity = 0 then Continue;
       if quantity < 0.000001 then Continue;

       m := FINMaterials.Create;
       SetNullIntProps(m);
       SetNullXSProps(m);
       
       m.estimateItemRef := ENEstimateItemRef.Create;
       m.estimateItemRef.code := estimateCode;
       m.div_code := molCode; //* actObj.finMolCode;
       m.finDocItemCode := -1; //* actObj.finDocCode; // пока этот код ... на сервере его поменяем - это код ИТЕМА в ФК

       m.quantity := TXSDecimal.Create;
       m.quantity.DecimalString := FloatToStr(quantity); 

       m.mat_name := sgENEstimateItem2Fin.Cells[8, i];

       m.nn := sgENEstimateItem2Fin.Cells[9, i];

       if sgENEstimateItem2Fin.Cells[11, i] <> '' then
       begin
         try
           m.party_id := StrToInt(sgENEstimateItem2Fin.Cells[11, i]);
         except
           on EConvertError do m.party_id := LOW_INT;
         end;
       end
       else
         m.party_id := LOW_INT;

       if sgENEstimateItem2Fin.Cells[12, i] <> '' then
       begin
         try
           m.mat_id := StrToInt(sgENEstimateItem2Fin.Cells[12, i]);
         except
           on EConvertError do m.mat_id := LOW_INT;
         end;
       end
       else
         m.mat_id := LOW_INT;

       if sgENEstimateItem2Fin.Cells[13, i] <> '' then
       begin
         try
           m.mu_id := StrToInt(sgENEstimateItem2Fin.Cells[13, i]);
         except
           on EConvertError do m.mu_id := LOW_INT;
         end;
       end
       else
         m.mu_id := LOW_INT;
         
       m.mu_name := sgENEstimateItem2Fin.Cells[14, i];

       m.div_name := sgENEstimateItem2Fin.Cells[15, i];

       if sgENEstimateItem2Fin.Cells[16, i] <> '' then
       begin
         try
           m.rest_purpose_id := StrToInt(sgENEstimateItem2Fin.Cells[16, i]);
         except
           on EConvertError do m.rest_purpose_id := LOW_INT;
         end;
       end
       else
         m.rest_purpose_id := LOW_INT;
         
       if sgENEstimateItem2Fin.Cells[17, i] <> '' then
       begin
         try
           m.rest_purpose_type_id := StrToInt(sgENEstimateItem2Fin.Cells[17, i]);
         except
           on EConvertError do m.rest_purpose_type_id := LOW_INT;
         end;
       end
       else
         m.rest_purpose_type_id := LOW_INT;
                  
       m.rest_purpose_name := sgENEstimateItem2Fin.Cells[18, i];
       
       m.party_discription := sgENEstimateItem2Fin.Cells[19, i];

       if sgENEstimateItem2Fin.Cells[20, i] <> '' then
       begin
         try
           m.budget_core_id := StrToInt(sgENEstimateItem2Fin.Cells[20, i]);
         except
           on EConvertError do m.budget_core_id := LOW_INT;
         end;
       end
       else
         m.budget_core_id := LOW_INT;

       if sgENEstimateItem2Fin.Cells[21, i] <> '' then
       begin
         try
           m.frc_code := StrToInt(sgENEstimateItem2Fin.Cells[21, i]);
         except
           on EConvertError do m.frc_code := LOW_INT;
         end;
       end
       else
         m.frc_code := LOW_INT;

       m.frc_name := sgENEstimateItem2Fin.Cells[22, i];

       if sgENEstimateItem2Fin.Cells[23, i] <> '' then
       begin
         m.calc_price := TXSDecimal.Create;
         m.calc_price.DecimalString := sgENEstimateItem2Fin.Cells[23, i];
       end
       else
         m.calc_price := nil;

       if sgENEstimateItem2Fin.Cells[24, i] <> '' then
       begin
         m.price := TXSDecimal.Create;
         m.price.DecimalString := sgENEstimateItem2Fin.Cells[24, i];
       end
       else
         m.price := nil;

       if sgENEstimateItem2Fin.Cells[25, i] <> '' then
       begin
         m.cost := TXSDecimal.Create;
         m.cost.DecimalString := sgENEstimateItem2Fin.Cells[25, i];
       end
       else
         m.cost := nil;

       if sgENEstimateItem2Fin.Cells[26, i] <> '' then
       begin
         m.fullQuantity := TXSDecimal.Create;
         m.fullQuantity.DecimalString := sgENEstimateItem2Fin.Cells[26, i];
       end
       else
         m.fullQuantity := nil;

       if sgENEstimateItem2Fin.Cells[27, i] <> '' then
       begin
         m.fullCost := TXSDecimal.Create;
         m.fullCost.DecimalString := sgENEstimateItem2Fin.Cells[27, i];
       end
       else
         m.fullCost := nil;

       m.bal_sch := sgENEstimateItem2Fin.Cells[28, i];
                
       m.partner := sgENEstimateItem2Fin.Cells[29, i];
       m.partner_name := sgENEstimateItem2Fin.Cells[30, i];

       m.doc_num := sgENEstimateItem2Fin.Cells[31, i];
       if sgENEstimateItem2Fin.Cells[32, i] <> '' then
       begin
         try
           m.doc_date := TXSDate.Create;
           m.doc_date.XSToNative(GetXSDate(StrToDate(sgENEstimateItem2Fin.Cells[32, i])));
         except
           on EConvertError do m.doc_date := nil;
         end;
       end
       else
         m.doc_date := nil;

       if sgENEstimateItem2Fin.Cells[33, i] <> '' then
       begin
         m.wear_date := TXSDate.Create;
         m.wear_date.XSToNative(GetXSDate(StrToDate(sgENEstimateItem2Fin.Cells[33, i])));
       end
       else
         m.wear_date := nil;

       if sgENEstimateItem2Fin.Cells[34, i] <> '' then
       begin
         m.extra_cargo := TXSDecimal.Create;
         m.extra_cargo.DecimalString := sgENEstimateItem2Fin.Cells[34, i];
       end
       else
         m.extra_cargo := nil;

       if sgENEstimateItem2Fin.Cells[35, i] <> '' then
       begin
         m.cost_ext := TXSDecimal.Create;
         m.cost_ext.DecimalString := sgENEstimateItem2Fin.Cells[35, i];
       end
       else
         m.cost_ext := nil;

       // развязка с МОЛом ...
       m.molDataRef := FINMolDataRef.Create;
       m.molDataRef.code := molData.code;

       count := High(finList) + 1;
       SetLength(finList, count + 1);
       finList[count] := m;
    end; // if state

  end; // for i := 1 to sgENEstimateItem2Fin.RowCount - 1

  if High(finList) = -1 then
  //  raise Exception.Create('NET-3974 Не обрано жодного матеріалу для резервування!');
  begin
    Application.MessageBox(PChar('Виберіть хоча б один матеріал (кількість, що прив''язується, повинна бути більше 0)!'),
                                 PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
  TempFINMaterials.batchAddMaterials(finList);

  UpdateENEstimateItem2FinGrid;
end;

procedure TfrmFINMaterialsDataNewEdit.showHideFINGridForAutoReservation(
  aEstimateItemCode, aENGridRow: Integer);
var i, tmpEstimateItemCode, party_id: Integer;
    requiredQuantity, filledQuantity, suggestedQuantity, tmpSuggestedQuantity: Double;
begin
  if not chbAutoReserve.Checked then Exit;

  lblAutoReserveWarning.Visible := true;
    
  //gbFINMaterials.Visible := false;
  gbFINMaterials.Enabled := false;
  btnFind.Enabled := false;
  chbIsIgnoreParty.Checked := false;
  chbIsIgnoreParty.Enabled := false;
  chbIsIgnoreParty.Visible := false;
  ClearGrid(sgFINMaterials);
  lblCFO.Caption := '';

  if aEstimateItemCode = LOW_INT then
    Exit;

  requiredQuantity := 0;
  try
    if sgENEstimateItem2Fin.Cells[2, aENGridRow] <> '' then
      requiredQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[2, aENGridRow]);
  except
    on EConvertError do requiredQuantity := 0;
  end;

  filledQuantity := 0;
  try
    if sgENEstimateItem2Fin.Cells[4, aENGridRow] <> '' then
      filledQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[4, aENGridRow]);
  except
    on EConvertError do filledQuantity := 0;
  end;

  suggestedQuantity := 0;

  for i := 1 to sgENEstimateItem2Fin.RowCount - 1 do
  begin
    try
      tmpEstimateItemCode := StrToInt(sgENEstimateItem2Fin.Cells[0, i]);
    except
      on EConvertError do Continue;
    end;

    if tmpEstimateItemCode = aEstimateItemCode then
    begin

      tmpSuggestedQuantity := 0;
      try
        if sgENEstimateItem2Fin.Cells[6, i] <> '' then
          tmpSuggestedQuantity := StrToFloat(sgENEstimateItem2Fin.Cells[6, i]);
      except
        on EConvertError do tmpSuggestedQuantity := 0;
      end;
      suggestedQuantity := suggestedQuantity + tmpSuggestedQuantity;

    end; // if tmpEstimateItemCode = estimateItemCode

  end; // for i := 1 to sgENEstimateItem2Fin.RowCount - 1

  { 
  party_id := LOW_INT;
  try
    if sgENEstimateItem2Fin.Cells[11, aENGridRow] <> '' then
      party_id := StrToInt(sgENEstimateItem2Fin.Cells[11, aENGridRow]);
  except
    on EConvertError do party_id := LOW_INT;
  end;
  }

  lblRequiredQuantity.Caption := 'Required: ' + FloatToStr(requiredQuantity);
  lblFilledQuantity.Caption := 'Filled: ' + FloatToStr(filledQuantity);
  lblSuggestedQuantity.Caption := 'Suggested: ' + FloatToStr(suggestedQuantity);

  // and (party_id = LOW_INT) - это условие, по идее, можно не добавлять
  if (filledQuantity + suggestedQuantity < requiredQuantity) {and (party_id = LOW_INT)} then
  begin
    lblAutoReserveWarning.Visible := false;

    //// Это делается в начале
    //ClearGrid(sgFINMaterials);
    //lblCFO.Caption := '';

    //gbFINMaterials.Visible := true;
    gbFINMaterials.Enabled := true;
    btnFind.Enabled := true;
    chbIsIgnoreParty.Checked := true;
    //chbIsIgnoreParty.Enabled := false;
    //chbIsIgnoreParty.Visible := false;

    btnFindClick(Self);
  end
  else begin
    lblAutoReserveWarning.Visible := true;

    //gbFINMaterials.Visible := false;
    gbFINMaterials.Enabled := false;
    btnFind.Enabled := false;
    chbIsIgnoreParty.Checked := false;
  end;
end;

procedure TfrmFINMaterialsDataNewEdit.chbAutoReserveClick(Sender: TObject);
var eCode: Integer;
    Allow: Boolean;
begin
  HideControls([sgENEstimateItem2Fin], not chbAutoReserve.Checked);
  HideControls([sgENEstimateItem], chbAutoReserve.Checked);
  HideControls([btnBind], not chbAutoReserve.Checked);

  if chbAutoReserve.Checked then
  begin
    UpdateENEstimateItem2FinGrid;
    
    try
      eCode := StrToInt(sgENEstimateItem2Fin.Cells[0, sgENEstimateItem2Fin.Row]);
    except
      on EConvertError do eCode := LOW_INT;
    end;

    showHideFINGridForAutoReservation(eCode, sgENEstimateItem2Fin.Row);

    sgENEstimateItem2FinRowChanging(sgENEstimateItem2Fin, 0, sgENEstimateItem2Fin.Row, Allow);
  end
  else begin
    lblAutoReserveWarning.Visible := false;
     
    //gbFINMaterials.Visible := true;
    gbFINMaterials.Enabled := true;
    btnFind.Enabled := true;
    chbIsIgnoreParty.Checked := false;
    chbIsIgnoreParty.Enabled := true;
    chbIsIgnoreParty.Visible := true;

    UpdateEstimateItems(planCode, estimateItemKind);
    sgENEstimateItemClick(Sender);
  end;
  
end;

procedure TfrmFINMaterialsDataNewEdit.InitForm(planWork: ENPlanWork; elementTypeCode: Integer; estimateItemKind: Integer);
var isAutoReserve: Boolean;
begin
  isAutoReserve := true;

  if (elementTypeCode = EN_WRITING_NO_OBJECT) then
    isAutoReserve := false;

  if (estimateItemKind <> ENESTIMATEITEMKIND_MATERIALS) and (estimateItemKind <> ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
    isAutoReserve := false;

  if isAutoReserve then
  begin
    lblAutoReserveWarning.Visible := true;
    lblAutoReserveWarning.Font.Color := clBlue;

    chbAutoReserve.Checked := true;
    chbAutoReserve.Enabled := true;
    chbAutoReserve.Visible := true;
  end
  else begin
    lblAutoReserveWarning.Visible := false;

    chbAutoReserve.Checked := false;
    chbAutoReserve.Enabled := false;
    chbAutoReserve.Visible := false;
  end;

  // 17.01.13 Выкладываем клиента с отключенным по дефолту чекбоксом "Автоматичне резервування"
  lblAutoReserveWarning.Visible := false;
  chbAutoReserve.Checked := false;

  chbAutoReserveClick(Self);
end;

end.
