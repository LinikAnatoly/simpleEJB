unit BindingMaterialsFromRem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs,DialogFormUnit, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls,
  ToolWin, ImgList, StdCtrls, ActnList, GridHeadersUnit, InvokeRegistry, Rio,
  SOAPHTTPClient , ENPlanWorkController , ENEstimateItemController  , ENEstimateItemKindController,
  Forms, Menus ,XSBuiltIns ;

type
  TfrmBindingMaterialsFromRem = class(TDialogForm)
    pgcontrol: TPageControl;
    tsEstimateitem: TTabSheet;
    tsRQFKOrder: TTabSheet;
    btnOk: TButton;
    btnCancel: TButton;
    ImageList1: TImageList;
    ToolBar2: TToolBar;
    sgENEstimateItem: TAdvStringGrid;
    Splitter1: TSplitter;
    pnlOrder: TPanel;
    GroupBox1: TGroupBox;
    btnBindingBymaterials: TToolButton;
    ActionList1: TActionList;
    actBindingMaterials: TAction;
    HTTPRIOENEstimateItem: THTTPRIO;
    btnRemoveBindingBymaterials: TToolButton;
    actUnBindingMaterials: TAction;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    sgRQFKOrder: TAdvStringGrid;
    spl1: TSplitter;
    pnlRQFKOrderItem: TPanel;
    gbRQFKOrderItem: TGroupBox;
    sgRQFKOrderItem: TAdvStringGrid;
    ActionList2: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    actCreatePrihod: TAction;
    actMoveToFK: TAction;
    actUnCreatePrihod: TAction;
    actUnMoveToFK: TAction;
    actExcel: TAction;
    actMoveOSToFK: TAction;
    actAddChecked: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    N14: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N16: TMenuItem;
    Excel1: TMenuItem;
    N15: TMenuItem;
    HTTPRIORQFKOrderItem: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    ImageList2: TImageList;
    sgENFINMaterials: TAdvStringGrid;
    HTTPRIOFINMaterials: THTTPRIO;
    Panel1: TPanel;
    edtDateCreateOrder: TDateTimePicker;
    Label1: TLabel;
    procedure pgcontrolChange(Sender: TObject);
    procedure actBindingMaterialsExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actUnBindingMaterialsExecute(Sender: TObject);
    procedure UpdateFkOrderItemGrid();
    procedure sgRQFKOrderClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure sgRQFKOrderDblClick(Sender: TObject);
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure updateFINMaterialsGrid();
  private
    { Private declarations }
    ENPlanWorkObj : ENPlanWork;
  public
    { Public declarations }
  end;

var
  frmBindingMaterialsFromRem: TfrmBindingMaterialsFromRem;

  ENEstimateItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используется при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Код роботи'
          ,'Робота'
          ,'Тип строки кошторису'
          ,'Статус'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

    RQFKOrderItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Вага, кг'
          ,'Дж.фін.'
          ,''
        );

     RQFKOrderHeaders: array [1..18] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Загальна вага, кг'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
        );

          FINMaterialsShortHeaders: array [1..16] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Од. виміру'
          ,'Номенклатурний номер'
          ,'Кількість'
          ,'Ціна'
          ,'Вартість'
          ,'код,назва ЦФВ'
          ,'МОЛ'
          ,'Призначення залишку'
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код партії'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );

  eiColCount, eiLastCount : Integer;
  eiLastRow: Integer = 1;

implementation

uses ENConsts, EditENPlanWork, RQFKOrderController, RQFKOrderItemController,
  EditRQFKOrder, FINMaterialsController;

{$R *.dfm}

procedure TfrmBindingMaterialsFromRem.actBindingMaterialsExecute(
  Sender: TObject);
  var
  res : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  date : TXSDate;
begin
   TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

   if edtDateCreateOrder.checked then
     begin
        date := TXSDate.Create;
        date.XSToNative(GetXSDate(edtDateCreateOrder.DateTime));

        res:=   TempENEstimateItem.bindingMaterialsFromRem(ENPlanWorkObj.code , date );
        pgcontrolChange(Sender);
     end
     else
      begin
       Application.MessageBox(PChar('Вкажіть дату ордеру!!!'),
                    PChar('Увага !'),MB_ICONWARNING );
       Exit;
      end;



   //ShowMessage( IntToStr( res ) );
end;

procedure TfrmBindingMaterialsFromRem.actEditExecute(Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsEdit);

  try

    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObjectNoSegr(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    // 23.02.2012 +++ разрешаем редактировать бух.атрибуты на акте со статусом "Складений"
    if ((frmRQFKOrderEdit.RQFKOrderObj.status.code <> RQFKORDER_STATUS_GOOD)
           and (frmRQFKOrderEdit.RQFKOrderObj.kind.code <> RQFKORDER_KIND_SERVICES_FROM_SIDE)
           and (frmRQFKOrderEdit.RQFKOrderObj.kind.code <> RQFKORDER_KIND_SALE_PRODUCTS)) then
    begin
        Application.MessageBox(PChar('Цей ордер не редагується ... відмініть проведення або затвердження ...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end;

    if (frmRQFKOrderEdit.RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK) then
    begin
        Application.MessageBox(PChar('Цей акт не редагується ... відмініть проведення...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end;

    if frmRQFKOrderEdit.ShowModal= mrOk then
      begin
         pgcontrolChange(sender);
      end;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;

procedure TfrmBindingMaterialsFromRem.actUnBindingMaterialsExecute(
  Sender: TObject);
 var
  res : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  orderCode, i : integer;
  state_, isSel : boolean;
  strCodes, mesg : string;
begin

  state_ := false;
  isSel := false;

//  for i := 1 to sgENEstimateItem.RowCount - 1 do
//  begin
//     sgENEstimateItem.GetCheckBoxState(1, i, state_);
//     if state_ then
//     begin
//       isSel := true;
//
//     end;
//  end;

     isSel := true;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б один матеріал!!!'), PChar('Увага!'),MB_ICONWARNING);
     Exit;
  end;

  strCodes := '';
  if isSel then
  begin

    for i := 1 to sgENEstimateItem.RowCount - 1 do
    begin
//      sgENEstimateItem.GetCheckBoxState(1, i, state_);
//      if state_ then
        AddListPos(strCodes, sgENEstimateItem.Cells[0, i]);
    end;



   if Application.MessageBox(PChar('Ви дійсно відмінити прив"язку ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
         TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
         TempENEstimateItem.UnBindingMaterialsFromRem(ENPlanWorkObj.code , strCodes );



    end;

  end;

  pgcontrolChange(Sender);
end;

procedure TfrmBindingMaterialsFromRem.actViewExecute(Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsView);

  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObjectNoSegr(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmRQFKOrderEdit.ShowModal= mrOk then
    begin
       pgcontrolChange(sender);
    end;

  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;

procedure TfrmBindingMaterialsFromRem.FormShow(Sender: TObject);
begin
   try
    ENPlanWorkObj := frmENPlanWorkEdit.ENPlanWorkObj;
   except
       Application.MessageBox(PChar('Помилка при визначенні плану !!! '),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
       Exit;
   end;

   if DialogState = dsView then
   DisableControls([btnBindingBymaterials , btnRemoveBindingBymaterials]);

   pgcontrol.ActivePage := tsEstimateitem;
   pgcontrolChange(Sender);

   SetGridHeaders(FINMaterialsShortHeaders, sgENFINMaterials.ColumnHeaders);

   edtDateCreateOrder.DateTime := Date;

end;

procedure TfrmBindingMaterialsFromRem.pgcontrolChange(Sender: TObject);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  estimateItemFilter: ENEstimateItemFilter;
  i : Integer;

  TempRQFKOrder: RQFKOrderControllerSoapPort;
  RQFKOrderList: RQFKOrderShortList;
  fFilter : RQFKOrderFilter;
  LastCountfkorder  , LastRow  , ColCount : Integer;
begin



   //--------------------------------------------------------------------------------
  if (pgcontrol.ActivePage = tsEstimateitem)  then
  begin
    try
      actBindingMaterials.Enabled := (DialogState = dsEdit);

      actBindingMaterials.Visible := actBindingMaterials.Enabled;
    except
      actBindingMaterials.Enabled := false;
      actBindingMaterials.Visible := false;
    end;

    SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);


    eiColCount := -1;
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;


       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);


    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := ENPlanWorkObj.code;

    //estimateItemFilter.conditionSQL := 'enestimateitem.kindrefcode in (1,2)';
    if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
    estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    //обработаем вывод материалов нулевых ..
    estimateItemFilter.conditionSQL := ' ENESTIMATEITEM.COUNTFACT <> 0 ';



    ////
    estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
    ////

    

      ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

      eiLastCount := High(ENEstimateItemList.list);

      if eiLastCount > -1 then
        sgENEstimateItem.RowCount := eiLastCount + 2
      else
        sgENEstimateItem.RowCount := 2;

       with sgENEstimateItem do
         for i := 0 to eiLastCount do
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

           Cells[5,i+1] := ENEstimateItemList.list[i].kartaNum;
           Cells[6,i+1] := ENEstimateItemList.list[i].kartaRefName;

           Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;

           Cells[8,i+1] := ENEstimateItemList.list[i].statusRefName;

           Cells[9,i+1] := ENEstimateItemList.list[i].userGen;

           if ENEstimateItemList.list[i].dateEdit = nil then
             Cells[10,i+1] := ''
           else
             Cells[10,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);




             RowColor[i+1] := clWindow;

             // Выделяем цветом ручной ввод
             if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
               RowColor[i+1] := clMoneyGreen; //$EBFFF5

             // Выделяем цветом строки, относящиеся ко всей смете
             if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
               RowColor[i+1] := clYellow;

             try
             if ((ENPlanWorkObj.kind.code = ENPLANWORKKIND_YEAR) and
                 (ENPlanWorkObj.yearGen = CurrentYear+1) and
                (StrToFloat(ENEstimateItemList.list[i].countGen.DecimalString) <
                StrToFloat(ENEstimateItemList.list[i].countFact.DecimalString))) then
             RowColor[i+1] := clFuchsia;
             except
             end;


           Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

           Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);

           Objects[2,i+1] := TObject(ENEstimateItemList.list[i].accountingTypeRefCode);

           eiLastRow := i + 1;
           sgENEstimateItem.RowCount := eiLastRow + 1;
         end;


       eiColCount := eiColCount + 1;
       sgENEstimateItem.Row := 1;

       updateFINMaterialsGrid();

  end;

  if (pgcontrol.ActivePage = tsRQFKOrder)  then
  begin
    ClearGrid(sgRQFKOrder);
    SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
    SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);

    TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

      if fFilter = nil then
     begin
       fFilter := RQFKOrderFilter.Create;
       SetNullIntProps(fFilter);
       SetNullXSProps(fFilter);
      end;

      fFilter.conditionSQL := ' rqfkorder.code in ( select f.code  from rqfkorder f , enplanwork2fkorder p2f ' +
                                   ' where f.code = p2f.fkorderrefcode ' +
                                   ' and f.kindcode <> ' + IntToStr(ENConsts.RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE ) + '/* так как связка enplanwork2fkorder еще юзается в выбросе остатков с плана в оперативн запас*/ ' +
                                   ' and p2f.planrefcode = ' + IntToStr(ENPlanWorkObj.code ) + ')';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredListNoSegr(fFilter,0,-1);

    LastCountfkorder:=High(RQFKOrderList.list);

  if LastCountfkorder > -1 then
     sgRQFKOrder.RowCount:=LastCountfkorder+2
  else
     sgRQFKOrder.RowCount:=2;

   with sgRQFKOrder do
    for i:=0 to LastCountfkorder do
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

          Cells[3,i+1] := RQFKOrderList.list[i].molInCode;

          Cells[4,i+1] := RQFKOrderList.list[i].molInName;

          Cells[5,i+1] := RQFKOrderList.list[i].molOutCode;

          Cells[6,i+1] := RQFKOrderList.list[i].molOutName;


        Cells[7, i+1] := RQFKOrderList.list[i].statusName;
        Cells[8,i+1] := RQFKOrderList.list[i].expeditorCode;
        Cells[9,i+1] := RQFKOrderList.list[i].expeditorName;

        Cells[10,i+1] := RQFKOrderList.list[i].warrantNumber;
        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);
        Cells[12,i+1] := RQFKOrderList.list[i].warrantFIO;

        if RQFKOrderList.list[i].totalWeight = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := RQFKOrderList.list[i].totalWeight.DecimalString;

        Cells[14,i+1] := RQFKOrderList.list[i].userAdd;

        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[16,i+1] := RQFKOrderList.list[i].userGen;

        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

        LastRow:=i+1;
        sgRQFKOrder.RowCount:=LastRow+1;
      end;
    ColCount:=ColCount+1;
    sgRQFKOrder.Row:=1;

    UpdateFkOrderItemGrid();

  end;
end;

procedure TfrmBindingMaterialsFromRem.sgENEstimateItemClick(Sender: TObject);
begin
  inherited;
   updateFINMaterialsGrid();
end;

procedure TfrmBindingMaterialsFromRem.sgRQFKOrderClick(Sender: TObject);
begin
  inherited;
    UpdateFkOrderItemGrid();
end;

procedure TfrmBindingMaterialsFromRem.sgRQFKOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin

    actViewExecute(Sender);

end;

procedure TfrmBindingMaterialsFromRem.UpdateFkOrderItemGrid();
var
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  i: Integer;
  RQFKOrderItemList: RQFKOrderItemShortList;
  itemFilter: RQFKOrderItemFilter;
  orderCode, itemLastCount : Integer;

begin
  ClearGrid(sgRQFKOrderItem);

  try
    orderCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
  except
   on EConvertError do Exit;
  end;
   TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

     itemfilter := RQFKOrderItemFilter.Create;
     SetNullIntProps(itemfilter);
     SetNullXSProps(itemfilter);
     itemFilter.fkOrderRef := RQFKOrderRef.Create;
     itemFilter.fkOrderRef.code := orderCode;

  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(itemFilter,0,-1);

  itemLastCount:=High(RQFKOrderItemList.list);

  if itemLastCount > -1 then
     sgRQFKOrderItem.RowCount:=itemLastCount+2
  else
     sgRQFKOrderItem.RowCount:=2;

   with sgRQFKOrderItem do
    for i:=0 to itemLastCount do
      begin
        // Application.ProcessMessages;
        if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;
        Cells[2, i+1] := RQFKOrderItemList.list[i].measurementName;
        Cells[3, i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
        Cells[4, i+1] := RQFKOrderItemList.list[i].nomenclatureName;
        Cells[5, i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;
        if RQFKOrderItemList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
        begin
          Cells[6,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
        end;

        if RQFKOrderItemList.list[i].priceWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;

        if RQFKOrderItemList.list[i].sumWithoutNds = nil then
          Cells[8,i+1] := ''
        else
        begin
          Cells[8,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
        end;

        if (RQFKOrderItemList.list[i].weight = nil) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQFKOrderItemList.list[i].weight.DecimalString;

        Cells[10,i+1] := RQFKOrderItemList.list[i].fundingTypeStr;

        sgRQFKOrderItem.RowCount:=i+2;
      end;
   sgRQFKOrderItem.Row:=1;
end;

procedure TfrmBindingMaterialsFromRem.updateFINMaterialsGrid();
var
  j, i, eiCode : Integer;
  TempFINMaterials : FINMaterialsControllerSoapPort;
  finList : FINMaterialsShortList;
  finFilter : FINMaterialsFilter;
begin
  for i:=1 to sgENFINMaterials.RowCount-1 do
    for j:=0 to sgENFINMaterials.ColCount-1 do
      sgENFINMaterials.Cells[j,i]:='';
  try
    eiCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);

  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := eiCode;

  finFilter.conditionSQL := 'finmaterials.statusrefcode in (' +
                             IntToStr(FINMATERIALSSTATUS_GOOD) + ', ' + IntToStr(FINMATERIALSSTATUS_MOVED) + ', ' +
                             IntToStr(CORRECTREASON_MOVE_TO_FACT) +
                            ') and finmaterials.code in '+
                            '(  select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM  , rqfkorderitem oi , rqfkorder o , enplanwork2fkorder p2f ' +
                            ' where RQFKORDERITEM2ENSTMTTM.estimateitemcode = ' + IntToStr( eiCode)  +
                            ' and RQFKORDERITEM2ENSTMTTM.fkorderitemrefcode = oi.code       ' +
                            ' and oi.fkorderrefcode = o.code ' +
                            ' and oi.fkorderrefcode = p2f.fkorderrefcode ' +
                            ' and o.code = p2f.fkorderrefcode ' +
                            ' and p2f.planrefcode = ' + IntToStr( ENPlanWorkObj.code) +
                            ' and o.kindcode in   ( ' + IntToStr(ENConsts.RQFKORDER_KIND_RASHOD_OE2REM) + ',' + IntToStr(ENConsts.RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) + ' ) '  + ')';

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     sgENFINMaterials.RowCount:=High(finList.list)+2
  else
     sgENFINMaterials.RowCount:=2;

   with sgENFINMaterials do
    for i:=0 to High(finList.list) do
      begin
        Application.ProcessMessages;
        if finList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(finList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := finList.list[i].mat_name;
        Cells[2,i+1] := finList.list[i].mu_name;
        Cells[3,i+1] := finList.list[i].nn;

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

        Cells[7, i+1] := IntToStr(finList.list[i].frc_code) + ' ' + finList.list[i].frc_name;
        Cells[8,i+1] := finList.list[i].div_name;
        Cells[9,i+1] := finList.list[i].rest_purpose_name;
        Cells[10,i+1] := finList.list[i].partner_name;

        if finList.list[i].doc_date = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(finList.list[i].doc_date);

        Cells[12,i+1] := finList.list[i].party_discription;
        Cells[13,i+1] := IntToStr(finList.list[i].party_id);
        Cells[14, i+1] := finList.list[i].userGen ;

        if finList.list[i].dateEdit <> nil then
          Cells[15, i+1] := XSDateTimeWithDate2String(finList.list[i].dateEdit)
        else
          Cells[15, i+1] := '';

        sgENFINMaterials.RowCount:= i + 2;
      end;

   sgENFINMaterials.Row:=1;
end;

end.
