
unit EditENEstimateItem2ENEstimateItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItem2ENEstimateItemController,
  ExtCtrls
  , ENPlanWorkController
  , ENEstimateItemController
  , ShowENPlanWork
  , ENConsts
  ,ENEstimateItem2TypeController, TB2Item, TB2Dock, TB2Toolbar, AdvObj
  ;

type
  TfrmENEstimateItem2ENEstimateItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;


  HTTPRIOENEstimateItem2ENEstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    gbPlan: TGroupBox;
    gbPlanIn: TGroupBox;
    gbPlanOut: TGroupBox;
    Splitter1: TSplitter;
    edtPlanIn: TEdit;
    spbPlanIn: TSpeedButton;
    edtPlanOut: TEdit;
    spbPlanOut: TSpeedButton;
    sgENEstimateItemIN: TAdvStringGrid;
    sgENEstimateItemOUT: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOFINMaterials: THTTPRIO;
    btnSave: TButton;
    gbENFINMaterials: TGroupBox;
    SpeedButton1: TSpeedButton;
    sgENFINMaterialsIN: TAdvStringGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    sgENEstimateItemTO: TAdvStringGrid;
    sgENEstimateItemFROM: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDeleteForIN: TAction;
    actUpdatePlanIN: TAction;
    ImageList1: TImageList;
    actDeleteForOUT: TAction;
    tbActionsTO: TTBToolbar;
    TBItem7: TTBItem;
    tbActionsFROM: TTBToolbar;
    TBItem1: TTBItem;
    GroupBox3: TGroupBox;
    SpeedButton2: TSpeedButton;
    sgENFINMaterialsOUT: TAdvStringGrid;
    tbActionsIN: TTBToolbar;
    TBItem2: TTBItem;
    actEditPlanIN: TAction;
    actEditPlanOUT: TAction;
    tbActionsOUT: TTBToolbar;
    TBItem3: TTBItem;
    edtFinCount: TEdit;
    Label1: TLabel;
    btnEditMaterials: TButton;
    TBItem4: TTBItem;
    actUpdatePlanOUT: TAction;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    actAddEstimateItem: TAction;
    HTTPRIO1: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateENEstimateItemGrid(grid : TAdvStringGrid; planCode : Integer);  
    procedure spbPlanInClick(Sender: TObject);
    procedure spbPlanOutClick(Sender: TObject);
    procedure sgENEstimateItemINClick(Sender: TObject);

    procedure updateENFINMaterialsGrid();
    procedure updateENFINMaterialsGrid_(grid: TAdvStringGrid; estimateCode: Integer);
    procedure sgENEstimateItemINCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sgENEstimateItemOUTCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btnSaveClick(Sender: TObject);

    procedure updateEstimateItemGrid_(grid : TAdvStringGrid; estimateCode : Integer);
    procedure deleteENEstimateItem2ENEstimateItem(estimateItemINCode, estimateItemOUTCode: Integer);

    procedure sgENEstimateItemOUTClick(Sender: TObject);
    procedure actDeleteForINExecute(Sender: TObject);
    procedure actDeleteForOUTExecute(Sender: TObject);
    procedure sgENFINMaterialsINCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure actEditPlanINExecute(Sender: TObject);
    procedure actEditPlanOUTExecute(Sender: TObject);
    procedure sgENFINMaterialsINClick(Sender: TObject);
    procedure btnEditMaterialsClick(Sender: TObject);
    procedure actUpdatePlanINExecute(Sender: TObject);
    procedure actUpdatePlanOUTExecute(Sender: TObject);
    procedure actAddEstimateItemExecute(Sender: TObject);

  private
    { Private declarations }
    estimateMeasurement, finMeasurement: String;
  public
    { Public declarations }
    planIN, planOUT : ENPlanWork;
    eTypeIN : Integer;
    selIN : boolean;
end;

var
  frmENEstimateItem2ENEstimateItemEdit: TfrmENEstimateItem2ENEstimateItemEdit;
  ENEstimateItem2ENEstimateItemObj: ENEstimateItem2ENEstimateItem;

implementation

uses DMReportsUnit, FINMaterialsController, FINMaterialsStatusController,
  Math, EditENPlanWork, EditMaterialsParameters,
  EditEstimate2EstimateCount, EditENEstimateItem,
  ENEstimateItemKindController, TKAccountingTypeController;

var
  ENEstimateItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал'                          // !!! используеться при разноске  !!!
          ,'Кількість нормативна'             
          ,'Кількість скорегована'           // !!! используеться при разноске  !!!
          ,'Од. виміру'                      // !!! используеться при разноске  !!!
          ,'Дата поч.робіт'
          ,'Код роботи'
          ,'Робота'
          ,'Тип строки кошторису'
          ,'Статус'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );


  ENFINMaterialsHeaders: array [1..25] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниця виміру'       // не двигать !!! вычитываем данные
          ,'Кількість матеріалу'  // не двигать !!! вычитываем данные
          ,'код,назва ЦФВ'
          ,'ПІБ МОЛа'

          ,'Призначення залишку' {*** передвинуто ***}
          ,'код партії'
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
          //,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'

        );

  ENEstimateItemHeaders__ : array [1..12] of String =
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

{uses  
    EnergyproController, EnergyproController2, ENEstimateItem2ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItem2ENEstimateItemEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(ENFINMaterialsHeaders, sgENFINMaterialsIN.ColumnHeaders);
  SetGridHeaders(ENFINMaterialsHeaders, sgENFINMaterialsOUT.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItemIN.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItemOUT.ColumnHeaders);

  SetGridHeaders(ENEstimateItemHeaders__, sgENEstimateItemTO.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders__, sgENEstimateItemFROM.ColumnHeaders);

  SetFloatStyle([edtCountGen, edtFinCount]);
  
  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
    DisableControls([{edtCountGen,} edtCode, edtPlanIn, edtPlanOut]);
    DenyBlankValues([edtPlanIn, edtPlanOut]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENEstimateItem2ENEstimateItemObj.code);
    if ( ENEstimateItem2ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := ENEstimateItem2ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 


  end;
end;



procedure TfrmENEstimateItem2ENEstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;


     if (ENEstimateItem2ENEstimateItemObj.countGen = nil ) then
       ENEstimateItem2ENEstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENEstimateItem2ENEstimateItemObj.countGen.decimalString := edtCountGen.Text 
     else
       ENEstimateItem2ENEstimateItemObj.countGen := nil;

    if DialogState = dsInsert then
    begin
      ENEstimateItem2ENEstimateItemObj.code:=low(Integer);
      TempENEstimateItem2ENEstimateItem.add(ENEstimateItem2ENEstimateItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENEstimateItem2ENEstimateItem.save(ENEstimateItem2ENEstimateItemObj);
    end;
  end;
end;


procedure TfrmENEstimateItem2ENEstimateItemEdit.spbPlanInClick(
  Sender: TObject);
var
   planFilter : ENPlanWorkFilter;
   estimateFilter : ENEstimateItemFilter;
   eType : Integer;
   frmENPlanWorkShow : TfrmENPlanWorkShow;
   planCode : Integer;
   TempENPlanWork : ENPlanWorkControllerSoapPort;
begin

    frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal);

    try

      DisableActions([ frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actDelete,
                       //frmENPlanWorkShow.actFilter,
                        frmENPlanWorkShow.actNoFilter, frmENPlanWorkShow.actAddPlanItems
                      ]);
      frmENPlanWorkShow.sgENPlanWork.PopupMenu := nil;

      frmENPlanWorkShow.isFiltered := false;

      if frmENPlanWorkShow.ShowModal = mrOk then
      begin
            planCode := StrToInt( frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,0) );
            TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
            planIN := TempENPlanWork.getObject(planCode);

            eTypeIN := DMReports.getElementTypeByPlan(planIN.code);

            if  (planIN.kind.code = ENPLANWORKKIND_CURRENT)
            //and (eTypeIN in [EN_PURCHASES_OBJECT, EN_PURCHASES_NO_OBJECT] )
            then
            begin

              edtPlanIn.Text := 'Інв. № ' + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 2)
                              + ', ' + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 1)
                              + ', ' + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 5)
                              + ' '  + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 4); //planIn.

              updateENEstimateItemGrid(sgENEstimateItemIN ,  planIN.code);
              /////
              sgENEstimateItemINClick(Sender);
              /////
            end
            else
              ShowMessage('Обирати можна тільки місячні плани ...');//на Об"ектні та Безоб"ектні Закупівлі ...');

      end;
    finally
      frmENPlanWorkShow.Free;
      frmENPlanWorkShow:=nil;
    end;

end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.updateENEstimateItemGrid(grid : TAdvStringGrid; planCode : Integer);
var
 i , j: Integer;
 TempENEstimateItem: ENEstimateItemControllerSoapPort;
 ENEstimateItemList: ENEstimateItemShortList;
 estimateItemFilter: ENEstimateItemFilter;
begin
   for i:=1 to grid.RowCount-1 do
     for j:=0 to grid.ColCount-1 do
       grid.Cells[j,i]:='';
   grid.RowCount := 2;
   grid.RemoveCheckBox(1,1);

    //SetGridHeaders(ENEstimateItemHeaders, grid.ColumnHeaders);

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);

       estimateItemFilter.planRef := ENPlanWorkRef.Create;
       estimateItemFilter.planRef.code := planCode;

       estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
       estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

       estimateItemFilter.accountingTypeRef := TKAccountingTypeRef.Create;
       estimateItemFilter.accountingTypeRef.code := TK_ACCOUNTINGTYPE_TMC;

       estimateItemFilter.conditionSQL := 'enestimateitem.countfact <> 0';
       estimateItemFilter.orderBySQL := ' sm.name';

/////////////

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

    if High(ENEstimateItemList.list) > -1 then
      grid.RowCount := High(ENEstimateItemList.list) + 2
    else
      grid.RowCount := 2;

     with grid do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         AddCheckBox(1, i+1, false, false);

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

         if ENEstimateItemList.list[i].planRefDateStart <> nil then
            Cells[5,i+1] := XSDate2String(ENEstimateItemList.list[i].planRefDateStart)
         else
            Cells[5, i +1] := '';



         Cells[6,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[7,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[8,i+1] := ENEstimateItemList.list[i].typeRefName;

         Cells[9,i+1] := ENEstimateItemList.list[i].statusRefName;

         Cells[10,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[11,i+1] := ''
         else
           Cells[11,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);

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

         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);

         eiLastRow := i + 1;
}
         grid.RowCount := i + 2;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     //eiColCount := eiColCount + 1;
     grid.Row := 1;

//////////////
end;





procedure TfrmENEstimateItem2ENEstimateItemEdit.spbPlanOutClick(
  Sender: TObject);
var
   planFilter : ENPlanWorkFilter;
   estimateFilter : ENEstimateItemFilter;
   //eType : Integer;
   frmENPlanWorkShow : TfrmENPlanWorkShow;
   planCode : Integer;
   TempENPlanWork : ENPlanWorkControllerSoapPort;
begin

    //planFilter := ENPlanWorkFilter.Create;

    frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal);

    try

      DisableActions([ frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actDelete,
                       //frmENPlanWorkShow.actFilter,
                        frmENPlanWorkShow.actNoFilter, frmENPlanWorkShow.actAddPlanItems
                      ]);
      frmENPlanWorkShow.sgENPlanWork.PopupMenu := nil;

      frmENPlanWorkShow.isFiltered := false;

      if frmENPlanWorkShow.ShowModal = mrOk then
      begin
            planCode := StrToInt( frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,0) );
            TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
            planOUT := TempENPlanWork.getObject(planCode);

            { // Перенесено в btnSaveClick
            ///////////
            if (planOUT.kind.code <> ENPLANWORKKIND_CURRENT) then
            begin
                ShowMessage('Оберають тільки Місячні плани ...');
                Exit;
            end;

            eType := DMReports.getElementTypeByPlan(planOUT.code);
            if eTypeIN = EN_PURCHASES_OBJECT then
            begin

                if eTypeIN <> eType then
                begin
                    ShowMessage('Не співпадають ТИПИ обьєктів ...!');
                    Exit;
                end;
            end;

            if planIN.budgetRef.code <> planOUT.budgetRef.code then
            begin
                ShowMessage('Не співпадають БЮДЖЕТОТРИМАЧІ ...!');
                Exit;
            end;
            ///////
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
          ,'ПідВид робіт'
          ,'Тип акту'
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
}
            edtPlanOUT.Text := 'Інв. № ' + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 2)
                             + ', ' + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 1)
                             + ', ' + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 5)
                             + ' '  + frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork, 4);

            updateENEstimateItemGrid(sgENEstimateItemOUT, planOut.code);
            /////
            sgENEstimateItemOUTClick(Sender);
            /////

      end;
    finally
      frmENPlanWorkShow.Free;
      frmENPlanWorkShow:=nil;
    end;
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.sgENEstimateItemINClick(
  Sender: TObject);
var estimateCode: Integer;
begin
  //updateENFINMaterialsGrid();

  try
    estimateCode := StrToInt(sgENEstimateItemIN.Cells[0, sgENEstimateItemIN.Row]);
  except
    on EConvertError do Exit;
  end;

  updateENFINMaterialsGrid_(sgENFINMaterialsIN, estimateCode);

  updateEstimateItemGrid_(sgENEstimateItemTO, estimateCode);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.updateENFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j{, estimateItemCode}: Integer;
  l: FINMaterialsShortList;
  f : FINMaterialsFilter;
  //balansNumberCondition, materialCondition : String;
  estimateCode : Integer;
begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   for i:=1 to sgENFINMaterialsIN.RowCount-1 do
     for j:=0 to sgENFINMaterialsIN.ColCount-1 do
       sgENFINMaterialsIN.Cells[j,i]:='';
   sgENFINMaterialsIN.RowCount := 2;

   try
     //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
     estimateCode := StrToInt(sgENEstimateItemIN.Cells[0, sgENEstimateItemIN.Row]);
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

   {
   f.conditionSQL := 'finmaterials.code in '
                    +'( select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE and RQFKORDERITEM.FKORDERREFCODE = '+ IntToStr(rqFKOrderCode) +')';
   }

   // Выбираем только из проведенных ордеров !!!
   f.conditionSQL :=
     'finmaterials.code in ' +
     '(select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE ' +
     '  from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM, RQFKORDER ' +
     ' where RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE ' +
     '   and RQFKORDERITEM.fkorderrefcode = RQFKORDER.code ' +
     '   and RQFKORDER.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) + ') ' +
     ' or finmaterials.code not in (select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM ' +
     '                              where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null)';

   f.estimateItemRef := ENEstimateItemRef.Create;
   // дето дернуть всю цепочку ..
   f.estimateItemRef.code := estimateCode;

   f.orderBySQL := 'finmaterials.dateedit desc';


   //l := TempFINMaterials.getFilteredPartyList(estimateCode);
   l :=  TempFINMaterials.getScrollableFilteredList(f, 0, -1);

  if High(l.list) > -1 then
     sgENFINMaterialsIN.RowCount:=High(l.list)+2
  else
     sgENFINMaterialsIN.RowCount:=2;

   with sgENFINMaterialsIN do
    for i:=0 to High(l.list) do
      begin
        Application.ProcessMessages;


        if l.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(l.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);

{paty
        if l.list[i].party_id > LOW_INT then
          Cells[0, i +1] := IntToStr(l.list[i].party_id)
        else
          Cells[0, i +1] := '';
}

        Cells[1,i+1] := l.list[i].nn;
        Cells[2,i+1] := l.list[i].mat_name;
        Cells[3,i+1] := l.list[i].mu_name;



        if l.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := l.list[i].quantity.DecimalString;

        Cells[5, i+1] := IntToStr(l.list[i].frc_code) + ' ' + l.list[i].frc_name;

        Cells[6,i+1] := l.list[i].div_name;
        Cells[7,i+1] := l.list[i].rest_purpose_name;

        Cells[8,i+1] := l.list[i].partner_name;
        if l.list[i].doc_date = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(l.list[i].doc_date);
        Cells[10,i+1] := l.list[i].party_discription;

        //Cells[15,i+1] := l.list[i].div_name;


        sgENFINMaterialsIN.RowCount:= i + 2;
      end;

   sgENFINMaterialsIN.Row:=1;
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.updateENFINMaterialsGrid_(grid: TAdvStringGrid; estimateCode: Integer);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j{, estimateItemCode}: Integer;
  l: FINMaterialsShortList;
  f : FINMaterialsFilter;
  //balansNumberCondition, materialCondition : String;
  //estimateCode : Integer;
begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   ClearGrid(grid);

   f := FINMaterialsFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);

   f.estimateItemRef := ENEstimateItemRef.Create;
   f.estimateItemRef.code := estimateCode; //estimateItemCode; //estimateObj.code;

   f.statusRef := FINMaterialsStatusRef.Create;
   f.statusRef.code := FINMATERIALSSTATUS_GOOD;

   {
   f.conditionSQL := 'finmaterials.code in '
                    +'( select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE and RQFKORDERITEM.FKORDERREFCODE = '+ IntToStr(rqFKOrderCode) +')';
   }

   // Выбираем только из проведенных ордеров !!!
   f.conditionSQL :=
     'finmaterials.code in ' +
     '(select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE ' +
     '  from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM, RQFKORDER ' +
     ' where RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE ' +
     '   and RQFKORDERITEM.fkorderrefcode = RQFKORDER.code ' +
     '   and RQFKORDER.statuscode = ' + IntToStr(RQFKORDER_STATUS_IN_FK) + ') ' +
     ' or finmaterials.code not in (select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM ' +
     '                              where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null)';

   f.estimateItemRef := ENEstimateItemRef.Create;
   // дето дернуть всю цепочку ..
   f.estimateItemRef.code := estimateCode;

   f.orderBySQL := 'finmaterials.dateedit desc';


   l :=  TempFINMaterials.getScrollableFilteredList(f, 0, -1);

  if High(l.list) > -1 then
     grid.RowCount:=High(l.list)+2
  else
     grid.RowCount:=2;

   with grid do
    for i:=0 to High(l.list) do
      begin
        Application.ProcessMessages;


        if l.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(l.list[i].code)
        else
        Cells[0,i+1] := '';

        if grid = sgENFINMaterialsIN then
          AddCheckBox(1, i+1, false, false);

{paty
        if l.list[i].party_id > LOW_INT then
          Cells[0, i +1] := IntToStr(l.list[i].party_id)
        else
          Cells[0, i +1] := '';
}

        Cells[1,i+1] := l.list[i].nn;
        Cells[2,i+1] := l.list[i].mat_name;
        Cells[3,i+1] := l.list[i].mu_name;



        if l.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := l.list[i].quantity.DecimalString;

        Cells[5, i+1] := IntToStr(l.list[i].frc_code) + ' ' + l.list[i].frc_name;

        Cells[6,i+1] := l.list[i].div_name;
        Cells[7,i+1] := l.list[i].rest_purpose_name;

        if l.list[i].party_id > LOW_INT then
          Cells[8,i+1] := IntToStr(l.list[i].party_id)
        else
          Cells[8,i+1] := '';

        Cells[9,i+1] := l.list[i].partner_name;
        if l.list[i].doc_date = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(l.list[i].doc_date);
        Cells[11,i+1] := l.list[i].party_discription;

        //Cells[15,i+1] := l.list[i].div_name;


        grid.RowCount:= i + 2;
      end;

(*
      if High(l.list) = -1 then
      begin
         l := TempFINMaterials.getFilteredPartyList(estimateCode);

          if High(l.list) > -1 then
             grid.RowCount:=High(l.list)+2
          else
             grid.RowCount:=2;

           with grid do
            for i:=0 to High(l.list) do
              begin
                Application.ProcessMessages;

              {
                if l.list[i].code <> Low(Integer) then
                Cells[0,i+1] := IntToStr(l.list[i].code)
                else
                Cells[0,i+1] := '';
              }
                if grid = sgENFINMaterialsIN then
                  AddCheckBox(1, i+1, false, false);

        {paty  }
                if l.list[i].party_id > LOW_INT then
                  Cells[0, i +1] := IntToStr(l.list[i].party_id)
                else
                  Cells[0, i +1] := '';


                Cells[1,i+1] := l.list[i].nn;
                Cells[2,i+1] := l.list[i].mat_name;
                Cells[3,i+1] := l.list[i].mu_name;



                if l.list[i].quantity = nil then
                  Cells[4,i+1] := ''
                else
                  Cells[4,i+1] := l.list[i].quantity.DecimalString;

                Cells[5, i+1] := IntToStr(l.list[i].frc_code) + ' ' + l.list[i].frc_name;

                Cells[6,i+1] := l.list[i].div_name;
                Cells[7,i+1] := l.list[i].rest_purpose_name;

                if l.list[i].party_id > LOW_INT then
                  Cells[8,i+1] := IntToStr(l.list[i].party_id)
                else
                  Cells[8,i+1] := '';

                Cells[9,i+1] := l.list[i].partner_name;
                if l.list[i].doc_date = nil then
                  Cells[10,i+1] := ''
                else
                  Cells[10,i+1] := XSDate2String(l.list[i].doc_date);
                Cells[11,i+1] := l.list[i].party_discription;

                //Cells[15,i+1] := l.list[i].div_name;


                grid.RowCount:= i + 2;
              end;

      end;
      *)
   grid.Row:=1;
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.sgENEstimateItemINCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  //selIN := true;
  checkGrid(sgENEstimateItemIN, ACol, false);
  sgENEstimateItemIN.SetCheckBoxState(ACol, ARow, State);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.sgENEstimateItemOUTCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  checkGrid(sgENEstimateItemOUT, ACol, false);
  sgENEstimateItemOUT.SetCheckBoxState(ACol,ARow, State);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.btnSaveClick(
  Sender: TObject);
var
  i, j, eCodeIN, eCodeOUT, fCode : Integer;
  eType: Integer;
  matIN, matOUT : String;
  cState : Boolean;
  TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
  finCount : TXSDecimal;
begin
  inherited;

  cState := false;

  eCodeIN := LOW_INT;
  eCodeOUT := LOW_INT;
  fCode := LOW_INT;

  for i:=1 to sgENEstimateItemIN.RowCount - 1 do
  begin
     sgENEstimateItemIN.GetCheckBoxState(1, i, cState );
     if cState then
     begin
         //matIN := sg
         try
           eCodeIN := StrToInt( sgENEstimateItemIN.Cells[0, i] );
           matIN := sgENEstimateItemIN.Cells[1, i];
           // *** ЧТОБЫ НЕ ЗАТЕРЛОСЬ КОЛ-ВО, ВВЕДЕННОЕ РУКАМИ !!!
           //if edtCountGen.Text = '' then
           //  edtCountGen.Text := FloatToStr( StrToFloat(sgENEstimateItemIN.Cells[3, i]) );
           edtCountGen.Text := sgENEstimateItemIN.Cells[3, i];
           estimateMeasurement := sgENEstimateItemIN.Cells[4, i];
         except
          on EConvertError do Exit;
        end;
     end;
  end;

  cState := false;
  for i:=1 to sgENEstimateItemOUT.RowCount - 1 do
  begin
     sgENEstimateItemOUT.GetCheckBoxState(1, i, cState );
     if cState then
     begin
         //matIN := sg
         try
           eCodeOUT := StrToInt( sgENEstimateItemOUT.Cells[0, i] );
           matOUT := sgENEstimateItemOUT.Cells[1, i];
         except
          on EConvertError do Exit;
        end;
     end;
  end;

  cState := false;
  for i:=1 to sgENFINMaterialsIN.RowCount - 1 do
  begin
     sgENFINMaterialsIN.GetCheckBoxState(1, i, cState );
     if cState then
     begin
         //matIN := sg
         try
           fCode := StrToInt( sgENFINMaterialsIN.Cells[0, i] );
         except
          on EConvertError do Exit;
        end;
     end;
  end;

  ///////////
  // Перенесено из spbPlanOutClick
  if (planIN = nil) or (planOUT = nil) then
  begin
    Application.MessageBox(PChar('Не обраний один із планів!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (planOUT.kind.code <> ENPLANWORKKIND_CURRENT) then
  begin
    Application.MessageBox(PChar('Обирати можна тільки Місячні плани!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
{
  eType := DMReports.getElementTypeByPlan(planOUT.code);
  if eTypeIN = EN_PURCHASES_OBJECT then
  begin

      if eTypeIN <> eType then
      begin
        Application.MessageBox(PChar('Не співпадають ТИПИ об''єктів!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
  end;
}

  TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
  
  // для Хитрых Юзеров можно ...
  try
    TempENEstimateItem2ENEstimateItem.getChangeBudegt();
  except
    on Exception do
    begin
      if planIN.budgetRef.code <> planOUT.budgetRef.code then
      begin
        Application.MessageBox(PChar('Не співпадають БЮДЖЕТОТРИМАЧІ!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;
  end;
  ///////

  {
  // 16.08.11 Уберем пока эту проверку - Ксюхе надо перебрасывать м-лы
  // между работами одного и того же плана
  if planIN.code = planOUT.code then
  begin
    Application.MessageBox(PChar('Ви обрали один і той самий план!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  }

  if (eCodeIN = LOW_INT) or (eCodeOUT = LOW_INT) or (fCode = LOW_INT) then
  begin
    Application.MessageBox(PChar('Не обраний один з матеріалів!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (matIN <> matOUT) then
  begin
    Application.MessageBox(PChar('Не співпадають матеріали!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  ////////
  frmEstimate2EstimateCountEdit := TfrmEstimate2EstimateCountEdit.Create(Application, dsEdit);
  try
    frmEstimate2EstimateCountEdit.edtEstimateCount.Text := sgENEstimateItemIN.Cells[3, sgENEstimateItemIN.Row]; //edtCountGen.Text;
    frmEstimate2EstimateCountEdit.edtFinCount.Text := sgENFINMaterialsIN.Cells[4,  sgENFINMaterialsIN.Row]; //edtFinCount.Text;
    frmEstimate2EstimateCountEdit.lblEstimateMeasurement.Caption := estimateMeasurement;
    frmEstimate2EstimateCountEdit.lblFinMeasurement.Caption := finMeasurement;

    if frmEstimate2EstimateCountEdit.ShowModal = mrOk then
    begin
      edtCountGen.Text := frmEstimate2EstimateCountEdit.edtEstimateCount.Text;
      edtFinCount.Text := frmEstimate2EstimateCountEdit.edtFinCount.Text;
    end
    else
      Exit;
  finally
    frmEstimate2EstimateCountEdit.Free;
  end;
  ////////

  if Application.MessageBox(PChar('Кількість нормативного матеріалу: ' + edtCountGen.Text + ' ' + estimateMeasurement + #13#10+
                                  'Кількість фактичного матеріалу: ' + edtFinCount.Text + ' ' + finMeasurement + #13#10#13#10+
                                  'Ви дійсно бажаєте зберегти прив''язку ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  ENEstimateItem2ENEstimateItemObj := ENEstimateItem2ENEstimateItem.Create;

  ENEstimateItem2ENEstimateItemObj.estimateItemInRef := ENEstimateItemRef.Create;
  ENEstimateItem2ENEstimateItemObj.estimateItemInRef.code := eCodeIN;

  ENEstimateItem2ENEstimateItemObj.estimateItemOutRef := ENEstimateItemRef.Create;
  ENEstimateItem2ENEstimateItemObj.estimateItemOutRef.code := eCodeOUT;
  ENEstimateItem2ENEstimateItemObj.typeRef := ENEstimateItem2TypeRef.Create;
  ENEstimateItem2ENEstimateItemObj.typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;

     if (ENEstimateItem2ENEstimateItemObj.countGen = nil ) then
       ENEstimateItem2ENEstimateItemObj.countGen := TXSDecimal.Create;

     if edtCountGen.Text <> '' then
       ENEstimateItem2ENEstimateItemObj.countGen.decimalString := edtCountGen.Text
     else
       ENEstimateItem2ENEstimateItemObj.countGen := nil;


     if edtFinCount.Text <> '' then
     begin
       finCount := TXSDecimal.Create;
       finCount.decimalString := edtFinCount.Text;
     end
     else
       finCount := nil;



  TempENEstimateItem2ENEstimateItem.add(ENEstimateItem2ENEstimateItemObj, fCode, finCount);

  Application.MessageBox(PChar('Прив''язку збережено!'),
                         PChar('Інформація'), MB_ICONINFORMATION);

  updateENEstimateItemGrid(sgENEstimateItemIN ,  planIN.code);
  updateENEstimateItemGrid(sgENEstimateItemOUT, planOut.code);

  //updateENFINMaterialsGrid();
  sgENEstimateItemINClick(sgENEstimateItemIN);
  sgENEstimateItemOUTClick(sgENEstimateItemOUT);


end;


procedure TfrmENEstimateItem2ENEstimateItemEdit.updateEstimateItemGrid_(grid : TAdvStringGrid; estimateCode : Integer);
var
  i, j, tmpEstimateCode : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  eFilter : ENEstimateItemFilter;
  //pFilter : ENPlanWorkFilter;
  materialCode : Integer;
  conditionSQL, planCondition, estimateCondition : String;

  TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
  e2eList: ENEstimateItem2ENEstimateItemShortList;
  e2eFilter: ENEstimateItem2ENEstimateItemFilter;
begin
   for i:=1 to grid.RowCount-1 do
     for j:=0 to grid.ColCount-1 do
       grid.Cells[j,i]:='';
   grid.RowCount := 2;
   //sgENEstimateItem.RemoveCheckBox(1,1);

{
   if grid = sgENEstimateItemTO then
     conditionSQL := 'enestimateitem.code in ' +
       '(select enestimateitem2nstmttm.estimateitemoutrefcode from enestimateitem2nstmttm ' +
       '  where enestimateitem2nstmttm.estimateiteminrefcode = ' + IntToStr(estimateCode) +
       '    and enestimateitem2nstmttm.typerefcode = ' + IntToStr(ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED) + ')';

   if grid = sgENEstimateItemFROM then
     conditionSQL := 'enestimateitem.code in ' +
       '(select enestimateitem2nstmttm.estimateiteminrefcode from enestimateitem2nstmttm ' +
       '  where enestimateitem2nstmttm.estimateitemoutrefcode = ' + IntToStr(estimateCode) +
       '    and enestimateitem2nstmttm.typerefcode = ' + IntToStr(ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED) + ')';
}



   /////////////////////////////////////////////////////////////////////////////
   e2eFilter := ENEstimateItem2ENEstimateItemFilter.Create;
   SetNullIntProps(e2eFilter);
   SetNullXSProps(e2eFilter);

   if grid = sgENEstimateItemTO then
   begin
     e2eFilter.estimateItemInRef := ENEstimateItemRef.Create;
     e2eFilter.estimateItemInRef.code := estimateCode;
     e2eFilter.typeRef := ENEstimateItem2TypeRef.Create;
     e2eFilter.typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;
   end;

   if grid = sgENEstimateItemFROM then
   begin
     e2eFilter.estimateItemOutRef := ENEstimateItemRef.Create;
     e2eFilter.estimateItemOutRef.code := estimateCode;
     e2eFilter.typeRef := ENEstimateItem2TypeRef.Create;
     e2eFilter.typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;     
   end;

   TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
   e2eList := TempENEstimateItem2ENEstimateItem.getScrollableFilteredList(e2eFilter, 0, -1);

   if e2eList = nil then Exit;
   if e2eList.totalCount = 0 then Exit;

   estimateCondition := '';

   for i := 0 to e2eList.totalCount - 1 do
   begin
     tmpEstimateCode := -1;

     if grid = sgENEstimateItemTO then
       tmpEstimateCode := e2eList.list[i].estimateItemOutRefCode;

     if grid = sgENEstimateItemFROM then
       tmpEstimateCode := e2eList.list[i].estimateItemInRefCode;
       
     AddListPos(estimateCondition, IntToStr(tmpEstimateCode));
   end;

   if estimateCondition = '' then Exit;
   /////////////////////////////////////////////////////////////////////////////


   eFilter := ENEstimateItemFilter.Create;
   SetNullIntProps(eFilter);
   SetNullXSProps(eFilter);

   //eFilter.conditionSQL := conditionSQL;
   eFilter.conditionSQL := 'enestimateitem.code in (' + estimateCondition + ')';

   TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

   //ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, planFilter);
   ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

    if High(ENEstimateItemList.list) > -1 then
      grid.RowCount := High(ENEstimateItemList.list) + 2
    else
      grid.RowCount := 2;

     with grid do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         //AddCheckBox(1, i+1, false, false);

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;
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
         grid.RowCount := i + 2;
       end;

     grid.Row := 1;

end;


procedure TfrmENEstimateItem2ENEstimateItemEdit.sgENEstimateItemOUTClick(
  Sender: TObject);
var estimateCode: Integer;
begin
  try
    estimateCode := StrToInt(sgENEstimateItemOUT.Cells[0, sgENEstimateItemOUT.Row]);
  except
    on EConvertError do Exit;
  end;

  updateENFINMaterialsGrid_(sgENFINMaterialsOUT, estimateCode);

  updateEstimateItemGrid_(sgENEstimateItemFROM, estimateCode);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.deleteENEstimateItem2ENEstimateItem(
  estimateItemINCode, estimateItemOUTCode: Integer);
var
  i: Integer;
  TempENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItemControllerSoapPort;
  e2eList: ENEstimateItem2ENEstimateItemShortList;
  e2eFilter: ENEstimateItem2ENEstimateItemFilter;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Зв''язок матеріалів) ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  e2eFilter := ENEstimateItem2ENEstimateItemFilter.Create;
  SetNullIntProps(e2eFilter);
  SetNullXSProps(e2eFilter);

  e2eFilter.typeRef := ENEstimateItem2TypeRef.Create;
  e2eFilter.typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;
  e2eFilter.estimateItemInRef := ENEstimateItemRef.Create;
  e2eFilter.estimateItemInRef.code := estimateItemINCode;
  e2eFilter.estimateItemOutRef := ENEstimateItemRef.Create;
  e2eFilter.estimateItemOutRef.code := estimateItemOUTCode;

  TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
  e2eList := TempENEstimateItem2ENEstimateItem.getScrollableFilteredList(e2eFilter, 0, -1);

  for i := 0 to e2eList.totalCount - 1 do
  begin
    if e2eList.list[i] <> nil then
      if e2eList.list[i].code > LOW_INT then
        TempENEstimateItem2ENEstimateItem.remove(e2eList.list[i].code);
  end;

  //updateEstimateItemGrid_(sgENEstimateItemTO, estimateItemINCode);

  if planIn <> nil then
    updateENEstimateItemGrid(sgENEstimateItemIN ,  planIN.code);
  if planOUT <> nil then
    updateENEstimateItemGrid(sgENEstimateItemOUT, planOut.code);

  //updateENFINMaterialsGrid();

  sgENEstimateItemINClick(sgENEstimateItemIN);
  sgENEstimateItemOUTClick(sgENEstimateItemOUT);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.actDeleteForINExecute(
  Sender: TObject);
var estimateItemINCode, estimateItemOUTCode: Integer;
begin
  try
    estimateItemINCode := StrToInt(sgENEstimateItemIN.Cells[0, sgENEstimateItemIN.Row]);
  except
    on EConvertError do Exit;
  end;

  try
    estimateItemOUTCode := StrToInt(sgENEstimateItemTO.Cells[0, sgENEstimateItemTO.Row]);
  except
    on EConvertError do Exit;
  end;

  deleteENEstimateItem2ENEstimateItem(estimateItemINCode, estimateItemOUTCode);

{
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Зв''язок матеріалів) ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  e2eFilter := ENEstimateItem2ENEstimateItemFilter.Create;
  SetNullIntProps(e2eFilter);
  SetNullXSProps(e2eFilter);

  e2eFilter.typeRef := ENEstimateItem2TypeRef.Create;
  e2eFilter.typeRef.code := ENESTIMATEITEM2ENESTIMATEITEM_TYPE_OBJECT_MOVED;
  e2eFilter.estimateItemInRef := ENEstimateItemRef.Create;
  e2eFilter.estimateItemInRef.code := estimateItemINCode;
  e2eFilter.estimateItemOutRef := ENEstimateItemRef.Create;
  e2eFilter.estimateItemOutRef.code := estimateItemOUTCode;

  TempENEstimateItem2ENEstimateItem := HTTPRIOENEstimateItem2ENEstimateItem as ENEstimateItem2ENEstimateItemControllerSoapPort;
  e2eList := TempENEstimateItem2ENEstimateItem.getScrollableFilteredList(e2eFilter, 0, -1);

  for i := 0 to e2eList.totalCount - 1 do
  begin
    if e2eList.list[i] <> nil then
      if e2eList.list[i].code > LOW_INT then
        TempENEstimateItem2ENEstimateItem.remove(e2eList.list[i].code);
  end;

  //updateEstimateItemGrid_(sgENEstimateItemTO, estimateItemINCode);
  sgENEstimateItemINClick(Sender);
  sgENEstimateItemOUTClick(Sender);
}  
end;


procedure TfrmENEstimateItem2ENEstimateItemEdit.actDeleteForOUTExecute(
  Sender: TObject);
var estimateItemINCode, estimateItemOUTCode: Integer;
begin
  try
    estimateItemINCode := StrToInt(sgENEstimateItemFROM.Cells[0, sgENEstimateItemFROM.Row]);
  except
    on EConvertError do Exit;
  end;

  try
    estimateItemOUTCode := StrToInt(sgENEstimateItemOUT.Cells[0, sgENEstimateItemOUT.Row]);
  except
    on EConvertError do Exit;
  end;

  deleteENEstimateItem2ENEstimateItem(estimateItemINCode, estimateItemOUTCode);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.sgENFINMaterialsINCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  checkGrid(sgENFINMaterialsIN, ACol, false);
  sgENFINMaterialsIN.SetCheckBoxState(ACol, ARow, State);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.actEditPlanINExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    //tPlan : ENPlanWork;
    //ObjCode: Integer;
    dlgState: TDialogState;
begin
  if planIN = nil then Exit;
  if planIN.code = LOW_INT then Exit;

  dlgState := dsEdit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (planIN.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
  begin
    try
        TempENPlanWork.editPreConfirm(planIN.code);
    except
        Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
        exit;
    end;
  end;

  if not (planIN.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

      //and
      //not ( planIN.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      //exit;
      dlgState := dsView;
  end;

  //selectedRow := sgENPlanWork.Row;

  //frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dlgState);
  try

    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planIN.code);

    if frmENPlanWorkEdit.ShowModal= mrOk then
    begin
    end;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.actEditPlanOUTExecute(
  Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    //tPlan : ENPlanWork;
    //ObjCode: Integer;
    dlgState: TDialogState;
begin
  if planOUT = nil then Exit;
  if planOUT.code = LOW_INT then Exit;

  dlgState := dsEdit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if (planOUT.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
  begin
    try
        TempENPlanWork.editPreConfirm(planOUT.code);
    except
        Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
        exit;
    end;
  end;

  if not (planOUT.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

      //and
      //not ( planOUT.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      //exit;
      dlgState := dsView;
  end;

  //selectedRow := sgENPlanWork.Row;

  //frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dlgState);
  try

    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planOUT.code);

    if frmENPlanWorkEdit.ShowModal= mrOk then
    begin
    end;


  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.sgENFINMaterialsINClick(
  Sender: TObject);
begin
  edtFinCount.Text := sgENFINMaterialsIN.Cells[4,  sgENFINMaterialsIN.Row];
  finMeasurement := sgENFINMaterialsIN.Cells[3,  sgENFINMaterialsIN.Row];
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.btnEditMaterialsClick(
  Sender: TObject);
begin
  frmMaterialsParametersEdit := TfrmMaterialsParametersEdit.Create(Application, dsInsert);
  try
    frmMaterialsParametersEdit.ShowModal;
  finally
    frmMaterialsParametersEdit.Free;
  end;
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.actUpdatePlanINExecute(
  Sender: TObject);
begin
  if planIN = nil then Exit;
  
  updateENEstimateItemGrid(sgENEstimateItemIN, planIN.code);
  sgENEstimateItemINClick(Sender);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.actUpdatePlanOUTExecute(
  Sender: TObject);
begin
  if planOut = nil then Exit;

  updateENEstimateItemGrid(sgENEstimateItemOUT, planOut.code);
  sgENEstimateItemOUTClick(Sender);
end;

procedure TfrmENEstimateItem2ENEstimateItemEdit.actAddEstimateItemExecute(
  Sender: TObject);
var
 TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  inherited;

    if planOUT = nil then
    begin
      ShowMessage('Виберіть план, у який додати матеріал ...');
      Exit;
    end;

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    ENEstimateItemObj := ENEstimateItem.Create;
    SetNullIntProps(ENEstimateItemObj);
    SetNullXSProps(ENEstimateItemObj);

    //ENEstimateItemObj.countGen := TXSDecimal.Create;
    //ENEstimateItemObj.countFact := TXSDecimal.Create;
    //ENEstimateItemObj.dateEdit := TXSDate.Create;

    ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
    ENEstimateItemObj.planRef.code := planOUT.code;

    ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
    ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    try
      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
      frmENEstimateItemEdit.ENPlanWorkCode := planOUT.code;
      frmENEstimateItemEdit.isForClosedPlan := True;
      try
        if frmENEstimateItemEdit.ShowModal = mrOk then
        begin
          //if ENEstimateItemObj <> nil then
            //TempENEstimateItem.add(ENEstimateItemObj);
          //  UpdateGrid(Sender);

            updateENEstimateItemGrid(sgENEstimateItemOUT, planOut.code);
            /////
            sgENEstimateItemOUTClick(Sender);          
          
        end;
      finally
        frmENEstimateItemEdit.Free;
        frmENEstimateItemEdit := nil;
      end;
    finally
      ENEstimateItemObj.Free;
    end;

end;

end.
