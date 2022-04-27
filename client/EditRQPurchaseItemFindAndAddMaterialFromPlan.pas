unit EditRQPurchaseItemFindAndAddMaterialFromPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, InvokeRegistry, Rio, SOAPHTTPClient,
  Grids, AdvObj, BaseGrid, AdvGrid , DialogFormUnit, Menus, ActnList;

type
  TfrmRQPurchaseItemFindAndAddMaterialFromPlan = class(TDialogForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    btnFind: TButton;
    lblPK: TLabel;
    edtPlanCode: TEdit;
    sgENEstimateItem: TAdvStringGrid;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    Splitter1: TSplitter;
    Label1: TLabel;
    HTTPRIORQPurchaseItem2EstimateItem: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblENBudgetName: TLabel;
    edtOrderName: TEdit;
    spbOrder: TSpeedButton;
    spbOrderClear: TSpeedButton;
    HTTPRIORQOrder: THTTPRIO;
    ActionEstimate: TActionList;
    actCheckAll: TAction;
    actUnCheckAll: TAction;
    PopupMenuEstimate: TPopupMenu;
    miUnCheckAll: TMenuItem;
    miCheckAll: TMenuItem;
    chkAddSpecOdejda: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure UpdateEstimateItem;
    procedure btnFindClick(Sender: TObject);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbOrderClick(Sender: TObject);
    procedure actCheckAllExecute(Sender: TObject);
    procedure actUnCheckAllExecute(Sender: TObject);
  private
    { Private declarations }
    materialCode: Integer;
    orderCode : Integer;
  public
    { Public declarations }
      planpurchaseCode : Integer;
      planpurchaseKindCode : Integer;
      yearplan : Integer;
  end;

var
  frmRQPurchaseItemFindAndAddMaterialFromPlan: TfrmRQPurchaseItemFindAndAddMaterialFromPlan;

  ENEstimateItemHeaders: array [1..16] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Ціна'
          ,'Вартість'
          ,'Код дк 2010'
          ,'Код дк 2015'
          ,'Од. виміру'
          ,'Дата поч.робіт'
          ,'Підрозділ'
          ,'Інв. №'
          ,'Назва об''єкту'  // не трогать
          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'

          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );

implementation

uses GridHeadersUnit, ENEstimateItemController, ENPlanWorkController,
  TKMaterialsController, ShowTKMaterials, RQPurchaseItem2EstimateItemController,
  ChildFormUnit, ENConsts, ShowRQOrder, RQOrderController,
  RQOrderKindController;

{$R *.dfm}

procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.actCheckAllExecute(
  Sender: TObject);
begin
  inherited;
   checkGrid(sgENEstimateItem, 1, true);
end;

procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.actUnCheckAllExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgENEstimateItem, 1, false);
end;

procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.btnFindClick(Sender: TObject);
begin
  UpdateEstimateItem;
end;

procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.btnOkClick(
  Sender: TObject);
var
  selectedEiItemForAdd2PlanPurchase : Boolean;
  i , j : Integer;
  eiList : ENEstimateItemShortList;
  eiObj : ENEstimateItemShort;
  eiArr : ArrayOfENEstimateItemShort;
  eiArrCount : Integer;
  TempEstimateItem : ENEstimateItemControllerSoapPort;

begin
  selectedEiItemForAdd2PlanPurchase := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selectedEiItemForAdd2PlanPurchase);
    if selectedEiItemForAdd2PlanPurchase then break;
  end;
  if not selectedEiItemForAdd2PlanPurchase then
  begin
    Application.MessageBox(PChar('Не обрані строки матеріалу з планів для додавання у план закупівель!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;



  eiList := ENEstimateItemShortList.Create;
  eiList.totalCount := 0;
  selectedEiItemForAdd2PlanPurchase := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selectedEiItemForAdd2PlanPurchase);
    if selectedEiItemForAdd2PlanPurchase then
    begin
       eiObj := ENEstimateItemShort.Create;
       SetNullIntProps(eiObj);
       SetNullXSProps(eiObj);
       eiObj.code :=  StrToInt( sgENEstimateItem.Cells[0 , i]); // Integer(sgENEstimateItem.Objects[0,i]) ;
       eiObj.elementName :=  sgENEstimateItem.Cells[11 , i];
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
    TempEstimateItem.estimateAdd2Planpurchase(eiArr , planpurchaseCode);

  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.FormShow(Sender: TObject);
begin
    SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

    SetFloatStyle(edtPlanCode);
    materialCode := LOW_INT;
end;


procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.spbMaterialClearClick(
  Sender: TObject);
begin
   materialCode := LOW_INT;
   edtMaterialName.Text := '';
   orderCode := LOW_INT;
end;

procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.spbMaterialNameClick(Sender: TObject);
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
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;


procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.spbOrderClick(
  Sender: TObject);
var
  frmRQOrderShow: TfrmRQOrderShow;
  f: RQOrderFilter;
  TempRQOrder: RQOrderControllerSoapPort;
  ordObj : RQOrder;
begin
  f := RQOrderFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.kindRef := RQOrderKindRef.Create;
  f.kindRef.code := Low(Integer);

  if(( planpurchaseKindCode = ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN ) and  ( chkAddSpecOdejda.Checked = false)  ) then
     f.conditionSQL := ' RQORDER.rqorderformcode = ' + IntToStr(ENConsts.RQORDER_FORM_NOTPLANNED);
  TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;
  frmRQOrderShow :=TfrmRQOrderShow.Create(Application,fmNormal, f);
  frmRQOrderShow.DisableActions([frmRQOrderShow.actdelete , frmRQOrderShow.actInsert , frmRQOrderShow.actEdit]);
  try

    with frmRQOrderShow do
      if ShowModal = mrOk then
      begin
        try

          ordObj := TempRQOrder.getObject(StrToInt(GetReturnValue(sgRQOrder,0)));
         if ( chkAddSpecOdejda.Checked = false) then
          if ((planpurchaseKindCode = ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN)
             and
             ((ordObj.rqOrderForm.code <> ENConsts.RQORDER_FORM_NOTPLANNED ) or (ordObj.statusRef.code <> ENConsts.RQORDER_STATUS_WORK_IN_MTS  ) )
             ) then
              begin
                Application.MessageBox(PChar('До змін необхідно додавати матеріали в позапланових заявок із статусом "В роботі  у ВМТП"!'), PChar('Увага!'), MB_ICONWARNING);
                Exit;
              end;

         if ( chkAddSpecOdejda.Checked = true) then
          if ((planpurchaseKindCode = ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN)
             and
             (  ordObj.statusRef.code <> ENConsts.RQORDER_STATUS_WORK_IN_MTS   )
             ) then
              begin
                Application.MessageBox(PChar('До змін необхідно додавати матеріали із заявок із статусом "В роботі  у ВМТП"!'), PChar('Увага!'), MB_ICONWARNING);
                Exit;
              end;


          orderCode := StrToInt(GetReturnValue(sgRQOrder,0));
          edtOrderName.Text := GetReturnValue(sgRQOrder,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrderShow.Free;

  end;
end;

procedure TfrmRQPurchaseItemFindAndAddMaterialFromPlan.UpdateEstimateItem;
var
    ////
    i, code : Integer;
    tempRqpurchaseitem2estimateitem : RQPurchaseItem2EstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eFilter : ENEstimateItemFilter;
    pFilter : ENPlanWorkFilter;
    //materialCode : Integer;
    conditionSQL, planCondition , eCondition : String;
    ////
    currentCount, totalCount: Double;
    rqorderformcodeCondition : String;
begin
   ClearGrid(sgENEstimateItem);

   currentCount := 0;
   totalCount := 0;
   //lblMaterialCountTotal.Caption := '';

    tempRqpurchaseitem2estimateitem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    pFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(pFilter);
    SetNullXSProps(pFilter);

    //eFilter.statusRef := ENEstimateItemStatusRef.Create;
    //eFilter.statusRef.code := ENESTIMATEITEMSTATUS_PLANNED;

    if materialCode > LOW_INT then
    begin
      eFilter.materialRef := TKMaterialsRef.Create;
      eFilter.materialRef.code := materialCode;
    end;

    if edtPlanCode.Text <> '' then
    begin
      pFilter.code := StrToInt(edtPlanCode.Text);
    end;

   // pFilter.yearGen := yearplan;


    eCondition :=' ENESTIMATEITEM.kindrefcode not in (3,4,5,7)  and   ENESTIMATEITEM.purchaseitemrefcode is null  ' ;
//    eCondition :=' ENESTIMATEITEM.kindrefcode not in (3,4,5,7) and   ENPLANWORK.yeargen = ' + intToStr( yearplan) + ' and   ENESTIMATEITEM.purchaseitemrefcode is null  ' ;

     if orderCode <> LOW_INT then
        AddCondition(eCondition , ' ENESTIMATEITEM.CODE in ( select q.estimateitemcode from rqorderitem2enestimttm q , rqorderitem oi where q.orderitemcode = oi.code and oi.statusrefcode = 1 and oi.orderrefcode = ' + IntToStr(orderCode) +' )  ');

     if chkAddSpecOdejda.Checked = true then
      begin
        rqorderformcodeCondition := '(1,2)';
        AddCondition(eCondition , ' ENPLANWORK.typerefcode = ' +  IntToStr(ENConsts.ENPLANWORKTYPE_SIZ) );
      end
     else
      rqorderformcodeCondition := '(2)';

     // изменения берутся только из внеплан заявок
     // 05.10.2016 но довать возможность добавлять спецодежду с плановых заявок
     if planpurchaseKindCode = ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN then
        AddCondition(eCondition , ' ENESTIMATEITEM.CODE in (select oi2ei.estimateitemcode from net.rqorderitem2enestimttm oi2ei , net.rqorderitem oi  , net.rqorder o   ' +
                                           ' where oi2ei.estimateitemcode = ENESTIMATEITEM.CODE '+
                                           ' and oi2ei.countgen > 0 ' +
                                           ' and oi.statusrefcode = 1  ' +
                                           ' and oi2ei.orderitemcode = oi.code   ' +
                                           ' and oi.orderrefcode = o.code  ' +
                                           ' and o.statusrefcode = 2 /*В роботі у ВМТП*/ ' +
                                           ' and o.rqorderformcode in ' + rqorderformcodeCondition + ' /*неплановые заявки*/ ' +
                                           ' )') ;



    eFilter.conditionSQL := eCondition ;
   // eFilter.orderBySQL := ' ';

    Application.ProcessMessages;
    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!

    ENEstimateItemList := tempRqpurchaseitem2estimateitem.getEstimateFromPlanForAdding2PlanPurchase(eFilter, pFilter);

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


         if ENEstimateItemList.list[i].price = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := ENEstimateItemList.list[i].price.DecimalString;

         if ENEstimateItemList.list[i].cost = nil then
           Cells[4,i+1] := ''
         else
           Cells[4,i+1] := ENEstimateItemList.list[i].cost.DecimalString;

         Cells[5,i+1] := ENEstimateItemList.list[i].identid2010;

         Cells[6,i+1] := ENEstimateItemList.list[i].identid2015;



         Cells[7,i+1] := ENEstimateItemList.list[i].measureType;

        if ENEstimateItemList.list[i].planRefDateStart = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENEstimateItemList.list[i].planRefDateStart);

         Cells[9, i+1] := ENEstimateItemList.list[i].planRefDepartmentName;

         Cells[10,i+1] := ENEstimateItemList.list[i].invNumber ;
         Cells[11,i+1] := ENEstimateItemList.list[i].elementName ;

         Cells[12,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[13,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[14,i+1] := ENEstimateItemList.list[i].planType;
         Cells[15,i+1] := ENEstimateItemList.list[i].planState;


         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;


end;

end.
