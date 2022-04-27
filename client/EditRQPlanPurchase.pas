
unit EditRQPlanPurchase;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, DMReportsUnit,
    EnergyproController, EnergyproController2, RQPlanPurchaseController, ExtCtrls,
    AdvObj , EditInsertRQPlanPurchase ;

type
  TfrmRQPlanPurchaseEdit = class(TDialogForm)


  HTTPRIORQPlanPurchase: THTTPRIO;
    pcGeneral: TPageControl;
    tsPlanPurchase: TTabSheet;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    edtCode: TEdit;
    lblCode: TLabel;
    pcPlanPurchaseItems: TPageControl;
    Panel2: TPanel;
    lblCommentGen: TLabel;
    lblYearGen: TLabel;
    lblName: TLabel;
    edtCommentGen: TMemo;
    edtName: TEdit;
    edtYearGen: TComboBox;
    tsPurchaseItem: TTabSheet;
    tsPurchaseItemTender: TTabSheet;
    ImageList1: TImageList;
    HTTPRIORQPurchaseItem: THTTPRIO;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ActionItem: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEditItem: TAction;
    actUpdateItem: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenuItem: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Panel4: TPanel;
    HTTPRIORQSpravDKPP: THTTPRIO;
    HTTPRIORQPurchaseItemTender: THTTPRIO;
    btnDeleteItems: TButton;
    Splitter2: TSplitter;
    sgRQPurchaseItemTender: TAdvStringGrid;
    ActionItemTender: TActionList;
    ActViewItemTender: TAction;
    Action2: TAction;
    Action3: TAction;
    actEditItemTender: TAction;
    actUpdateItemTender: TAction;
    actFilterItemTender: TAction;
    Action6: TAction;
    PopupMenuItemTender: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    ToolButton9: TToolButton;
    btnCreateItems: TButton;
    actChangePlanPurchaseItemType: TAction;
    miChangePlanPurchaseItemType: TMenuItem;
    miLine1: TMenuItem;
    GroupBox1: TGroupBox;
    edtSpravDkpp: TEdit;
    Label1: TLabel;
    spbSpravdkPP: TSpeedButton;
    Label2: TLabel;
    edtCountSymbolGroupdkPP: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    spbSpravdkPPServices: TSpeedButton;
    Label4: TLabel;
    edtSpravDkppServices: TEdit;
    edtCountSymbolGroupdkPPServices: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    spbSpravdkPPWorks: TSpeedButton;
    Label6: TLabel;
    edtSpravDkppWorks: TEdit;
    edtCountSymbolGroupdkPPWorks: TEdit;
    btnPrintReport: TButton;
    actExportExcel: TAction;
    miSplitItemTender: TMenuItem;
    actSplitItemTender: TAction;
    miLine2: TMenuItem;
    miExportExcel: TMenuItem;
    actExportExcelTenderItem: TAction;
    miLine3: TMenuItem;
    miExportExcelTenderItem: TMenuItem;
    ActionPlanPurchaseChange: TActionList;
    actInsertPlanPurchaseChanges: TAction;
    actUpdatePlanPurchaseChanges: TAction;
    ppMenuPlanPurchaseChange: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem12: TMenuItem;
    ActionItemChanges: TActionList;
    actUpdateItemChangesForPlanPurchase: TAction;
    actViewItemChangesForPlanPurchase: TAction;
    actFilterItemChangesForPlanPurchase: TAction;
    actEditItemChangesForPlanPurchase: TAction;
    ToolButton8: TToolButton;
    MenuPlanItemChanges: TPopupMenu;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    actDeletePlanPurchaseChanges: TAction;
    N12: TMenuItem;
    sgRQPurchaseItem: TAdvStringGrid;
    actChangeENtenderPurchaseKind: TAction;
    miChangeENtenderPurchaseKind: TMenuItem;
    N13: TMenuItem;
    ToolButton1: TToolButton;
    Button1: TButton;
    Action1: TAction;
    ToolButton2: TToolButton;
    actResetPurchaseCountByAbstractPurchaseItem: TAction;
    miResetPurchaseCountBySbstractPurchaseItem: TMenuItem;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actUpdateItemExecute(Sender: TObject);
    procedure pcPlanPurchaseItemsChange(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure sgRQPurchaseItemDblClick(Sender: TObject);
    procedure actUpdateItemTenderExecute(Sender: TObject);
    procedure spbSpravdkPPClick(Sender: TObject);
    procedure btnCreateItemsClick(Sender: TObject);
    procedure ActViewItemTenderExecute(Sender: TObject);
    procedure actEditItemTenderExecute(Sender: TObject);
    procedure sgRQPurchaseItemTenderDblClick(Sender: TObject);
    procedure btnPrintReportClick(Sender: TObject);
    procedure actEditItemExecute(Sender: TObject);
    procedure btnDeleteItemsClick(Sender: TObject);
    procedure PopupMenuItemPopup(Sender: TObject);
    procedure spbSpravdkPPServicesClick(Sender: TObject);
    procedure spbSpravdkPPWorksClick(Sender: TObject);
    procedure actSplitItemTenderExecute(Sender: TObject);
    procedure actExportExcelExecute(Sender: TObject);
    procedure actExportExcelTenderItemExecute(Sender: TObject);
    procedure actInsertPlanPurchaseChangesExecute(Sender: TObject);
    procedure actUpdatePlanPurchaseChangesExecute(Sender: TObject);
    procedure actViewItemChangesForPlanPurchaseExecute(Sender: TObject);
    procedure actFilterItemChangesForPlanPurchaseExecute(Sender: TObject);
    procedure actEditItemChangesForPlanPurchaseExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure sgRQPurchaseItemForChangesDblClick(Sender: TObject);
    procedure actDeletePlanPurchaseChangesExecute(Sender: TObject);
    procedure actChangePlanPurchaseItemTypeExecute(Sender: TObject);
    procedure actChangeENtenderPurchaseKindExecute(Sender: TObject);
    procedure sgRQPurchaseItemTopLeftChanged(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actFilterItemTenderExecute(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actResetPurchaseCountByAbstractPurchaseItemExecute(
      Sender: TObject);
    // procedure sgRQPurchaseItemDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
   SpravDKPP : Integer;
   SpravDKPPServices : Integer;
   SpravDKPPWorks : Integer;
   CountSymbolGroupdkPP , CountSymbolGroupdkPPServices , CountSymbolGroupdkPPWorks : Integer;

end;

var
  frmRQPlanPurchaseEdit: TfrmRQPlanPurchaseEdit;
  RQPlanPurchaseObj: RQPlanPurchase;

  ColCountPurchaseItem , LastCountPurchaseItem : Integer;
  LastRowPurchaseItem: Integer = 1;
  LastRowPurchaseItemMain: Integer = 1;

   RQPurchaseItemHeaders: array [1..14] of String =
        ( 'Код'
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

         RQPurchaseItemForChangesHeaders: array [1..17] of String =
        ( 'Код'
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
          ,'№ Договора'
          ,'Дата Договора'
          ,'Постачальник'
          ,'Користувач що вніс зміни'
          ,'Перелік об`єктів з планів'
        );


        RQPurchaseItemTenderHeaders: array [1..9] of String =
        ( 'Код'
          ,'Код ДК'
          ,'Предмет закупівлі за кодом ДК(Назва) '
          ,'Джерело фінансування'
          ,'Орієнтована вартість(грн. з ПДВ) із планів '
          ,'Орієнтована вартість(грн. з ПДВ) згідно плану закупівель '
          ,'Процедура закупівлі'
          ,'Орієнтовний початок проведення процедури закупівлі(місяць рік)'
          ,'Тип закупівлі'
        );

         RQPlanPurchaseHeaders: array [1..7] of String =
        ( 'Код'
          ,'Найменування '
          // ,'Рік Плану закупок'
         // ,'Версія Плану закупок'
          ,'Примітка'
          ,'Дата створення '
          ,'Дата зміни '
          ,'Користувач, який створив зміни'
          ,'Користувач, який вніс зміни до зиін'
        );

implementation

uses RQPurchaseItemController, EditRQPurchaseItem, EditRQPurchaseItemTender,
  EditRQPurchaseItemFilter, RQSpravDKPPController, ShowRQSpravDKPP,
  RQPurchaseItemTenderController , EditRQPurchaseItemTenderFilter,
  ChangePlanPurchaseItemType, ENConsts, reportPlanPurchase,
  RQPlanPurchaseKindController, ENTenderPurchaseKindController,
  ShowENTenderPurchaseKind, EditRQPurchaseItemFindAndAddMaterialFromPlan,
  ShowRQPurchaseItemAbstractSum;


{uses
    EnergyproController, EnergyproController2, RQPlanPurchaseController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPurchaseEdit.FormCreate(Sender: TObject);
begin
     BorderStyle:= bsSizeable;

     SetFloatStyle([edtCountSymbolGroupdkPP]);

     DisableControls([edtSpravDkpp , edtSpravDkppServices , edtSpravDkppWorks ,  edtCode ]);

     RQPurchaseItemTenderFilterObj:= nil;
     RQPurchaseItemFilterObj:= nil;
end;


procedure TfrmRQPlanPurchaseEdit.FormShow(Sender: TObject);
begin

//   if HTTPRIORQPlanPurchase.HTTPWebNode.UserName = 'energynet'  then
//     Button1.Visible:= True
//     else
//     Button1.Visible:= False;

  pcGeneral.ActivePage := tsPlanPurchase;
  pcPlanPurchaseItems.ActivePage := tsPurchaseItem;
  pcPlanPurchaseItemsChange(Sender);

  SpravDKPP := LOW_INT;
  SpravDKPPServices := LOW_INT;
  SpravDKPPWorks := LOW_INT;

   CountSymbolGroupdkPP := LOW_INT;
   CountSymbolGroupdkPPServices := LOW_INT;
   CountSymbolGroupdkPPWorks := LOW_INT;

  SetFloatStyle([edtCountSymbolGroupdkPP , edtCountSymbolGroupdkPPServices  , edtCountSymbolGroupdkPPWorks ]);


  DisableControls([edtCode ]);
  DisableChildControls([edtCountSymbolGroupdkPP] , false);

  if DialogState <> dsInsert then
  begin
    DisableControls([edtName,edtYearGen]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtName, edtYearGen, edtSpravDkpp,edtSpravDkppServices , edtSpravDkppWorks ,  edtCountSymbolGroupdkPP]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQPlanPurchaseObj.code);
    edtName.Text := RQPlanPurchaseObj.name;

    if ( RQPlanPurchaseObj.yearGen <> Low(Integer) ) then
      edtYearGen.ItemIndex := RQPlanPurchaseObj.yearGen - 2009
    else
      edtYearGen.ItemIndex := -1;

    MakeMultiline(edtCommentGen.Lines, RQPlanPurchaseObj.commentGen);

  end;

  RQPurchaseItemFilterObj.Free;
  RQPurchaseItemFilterObj := nil;
  actUpdateItemExecute(Sender);
end;


procedure TfrmRQPlanPurchaseEdit.pcPlanPurchaseItemsChange(Sender: TObject);
begin
  inherited;
   if pcPlanPurchaseItems.ActivePage = tsPurchaseItem then
     actUpdateItemExecute(Sender);
   if pcPlanPurchaseItems.ActivePage = tsPurchaseItemTender then
     actUpdateItemTenderExecute(Sender);
end;


procedure TfrmRQPlanPurchaseEdit.PopupMenuItemPopup(Sender: TObject);
var
  PlanPurchaseItemTypeCode : Integer;
begin

   try
        PlanPurchaseItemTypeCode:= Integer(
        sgRQPurchaseItem.Objects[11,sgRQPurchaseItem.Row]);
   except
        on EConvertError do Exit;
   end;
   if PlanPurchaseItemTypeCode = ENConsts.PURCHASE_ITEM_TYPE_MATERIALS  then
      actChangePlanPurchaseItemType.Visible :=  False
      else
      actChangePlanPurchaseItemType.Visible :=  True;
end;

procedure TfrmRQPlanPurchaseEdit.sgRQPurchaseItemDblClick(Sender: TObject);
begin
actViewExecute(Sender);
end;


procedure TfrmRQPlanPurchaseEdit.sgRQPurchaseItemForChangesDblClick(
  Sender: TObject);
begin
  inherited;
  actViewItemChangesForPlanPurchaseExecute(Sender);
end;



procedure TfrmRQPlanPurchaseEdit.sgRQPurchaseItemTenderDblClick(
  Sender: TObject);
begin
  inherited;
  ActViewItemTenderExecute(Sender);
end;

procedure TfrmRQPlanPurchaseEdit.sgRQPurchaseItemTopLeftChanged(
  Sender: TObject);
var
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  begin
  if LastCountPurchaseItem < 99 then Exit;
  if (sgRQPurchaseItem.TopRow + sgRQPurchaseItem.VisibleRowCount) = ColCountPurchaseItem
  then
    begin
      TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
      CurrentRow:=sgRQPurchaseItem.RowCount;

    if RQPurchaseItemFilterObj = nil then
    begin
       RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
       SetNullIntProps(RQPurchaseItemFilterObj);
       SetNullXSProps(RQPurchaseItemFilterObj);
    end;

     RQPurchaseItemFilterObj.purchaseRef := RQPlanPurchaseRef.Create;
     RQPurchaseItemFilterObj.purchaseRef.code := RQPlanPurchaseObj.code;

     RQPurchaseItemFilterObj.orderBySQL := ' RQPURCHASEITEMTYPE.CODE  ,  TKMATERIALS.NAME';

     RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredList(RQPurchaseItemFilterObj,ColCountPurchaseItem-1, 100);



    sgRQPurchaseItem.RowCount:=sgRQPurchaseItem.RowCount+100;
    LastCountPurchaseItem:=High(RQPurchaseItemList.list);
   with sgRQPurchaseItem do
    for i:=0 to LastCountPurchaseItem do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := RQPurchaseItemList.list[i].identid2010;
        Cells[2,i+CurrentRow] := RQPurchaseItemList.list[i].identid2015;

        Cells[3,i+CurrentRow] := RQPurchaseItemList.list[i].materialNameGen;
        AddCheckBox(3, i+CurrentRow, false, false);

        Cells[4,i+CurrentRow] := RQPurchaseItemList.list[i].measurementNameGen;

         if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countGen = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := RQPurchaseItemList.list[i].countGen.DecimalString;

        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;


          if RQPurchaseItemList.list[i].pricePurchaseWithNds = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := RQPurchaseItemList.list[i].pricePurchaseWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countPurchase = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := RQPurchaseItemList.list[i].countPurchase.DecimalString;

        if RQPurchaseItemList.list[i].sumPurchaseWithNds = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := RQPurchaseItemList.list[i].sumPurchaseWithNds.DecimalString;

        Cells[11,i+CurrentRow] := RQPurchaseItemList.list[i].purchaseItemTypeRefName;
        //не менять
        Objects[11,i+CurrentRow] := TObject(RQPurchaseItemList.list[i].purchaseItemTypeRefCode);// код типа закупки

        Cells[12,i+CurrentRow] := RQPurchaseItemList.list[i].userGen;
        //Cells[9,i+1] := RQPurchaseItemList.list[i].commentGen;
        Cells[13,i+CurrentRow] := RQPurchaseItemList.list[i].objectsName;  // названия объектов в строке

        LastRowPurchaseItem:=i+CurrentRow;
      end;
   ColCountPurchaseItem:=ColCountPurchaseItem+100;
   sgRQPurchaseItem.Row:=CurrentRow-5;
   sgRQPurchaseItem.RowCount:=LastRowPurchaseItem+1;
  end;
end;

procedure TfrmRQPlanPurchaseEdit.spbSpravdkPPClick(Sender: TObject);
var
   frmdkpp : TfrmRQSpravDKPPShow;
   f : RQSpravDKPPFilter;
begin
   f := RQSpravDKPPFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmdkpp := TfrmRQSpravDKPPShow.Create(Application, fmNormal, f);

   try
      with frmdkpp do begin
        if ShowModal = mrOk then
        begin
            try
               SpravDKPP := StrToInt(GetReturnValue(sgRQSpravDKPP,0));
               edtSpravDkpp.Text := GetReturnValue(sgRQSpravDKPP,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmdkpp.Free;
   end;

end;


procedure TfrmRQPlanPurchaseEdit.spbSpravdkPPServicesClick(Sender: TObject);
var
   frmdkpp : TfrmRQSpravDKPPShow;
   f : RQSpravDKPPFilter;
begin
   f := RQSpravDKPPFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmdkpp := TfrmRQSpravDKPPShow.Create(Application, fmNormal, f);

   try
      with frmdkpp do begin
        if ShowModal = mrOk then
        begin
            try
               SpravDKPPServices := StrToInt(GetReturnValue(sgRQSpravDKPP,0));
               edtSpravDkppServices.Text := GetReturnValue(sgRQSpravDKPP,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmdkpp.Free;
   end;

end;

procedure TfrmRQPlanPurchaseEdit.spbSpravdkPPWorksClick(Sender: TObject);
var
   frmdkpp : TfrmRQSpravDKPPShow;
   f : RQSpravDKPPFilter;
begin
   f := RQSpravDKPPFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmdkpp := TfrmRQSpravDKPPShow.Create(Application, fmNormal, f);

   try
      with frmdkpp do begin
        if ShowModal = mrOk then
        begin
            try
               SpravDKPPWorks := StrToInt(GetReturnValue(sgRQSpravDKPP,0));
               edtSpravDkppWorks.Text := GetReturnValue(sgRQSpravDKPP,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmdkpp.Free;
   end;

end;

procedure TfrmRQPlanPurchaseEdit.ToolButton1Click(Sender: TObject);
  Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin

// TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
//   try
//     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
//   except
//   on EConvertError do Exit;
//  end;

  frmRQPurchaseItemFindAndAddMaterialFromPlan:=TfrmRQPurchaseItemFindAndAddMaterialFromPlan.Create(Application, dsEdit);
  frmRQPurchaseItemFindAndAddMaterialFromPlan.planpurchaseCode := RQPlanPurchaseObj.code;
  frmRQPurchaseItemFindAndAddMaterialFromPlan.planpurchaseKindCode := RQPlanPurchaseObj.kindRef.code;
  frmRQPurchaseItemFindAndAddMaterialFromPlan.yearplan:= RQPlanPurchaseObj.yearGen;
  try
    if frmRQPurchaseItemFindAndAddMaterialFromPlan.ShowModal= mrOk then
      begin
        actUpdateItemExecute(Sender);
      end;
  finally
    frmRQPurchaseItemFindAndAddMaterialFromPlan.Free;
    frmRQPurchaseItemFindAndAddMaterialFromPlan:=nil;
  end;
end;

procedure TfrmRQPlanPurchaseEdit.ToolButton2Click(Sender: TObject);
var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
      TempPlanpurchaseOBJECT :  RQPlanPurchase;
begin
  begin

    TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;

    TempPlanpurchaseOBJECT:=RQPlanPurchase.Create;
    TempPlanpurchaseOBJECT.kindRef := RQPlanPurchaseKindRef.Create;
    TempPlanpurchaseOBJECT.kindRef.code := 1;
    TempPlanpurchaseOBJECT.name := RQPlanPurchaseObj.name;
    TempPlanpurchaseOBJECT.yearGen := RQPlanPurchaseObj.yearGen;
    TempPlanpurchaseOBJECT.commentGen := RQPlanPurchaseObj.commentGen;
    TempPlanpurchaseOBJECT.code :=  RQPlanPurchaseObj.code;


    TempRQPlanPurchase.addInPresentPlanPurchase(RQPlanPurchaseObj);

    actUpdateItemExecute(Sender);

  end;
end;

procedure TfrmRQPlanPurchaseEdit.actFilterExecute(Sender: TObject);
begin
 frmRQPurchaseItemFilterEdit:=TfrmRQPurchaseItemFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
    SetNullIntProps(RQPurchaseItemFilterObj);
    SetNullXSProps(RQPurchaseItemFilterObj);

    if frmRQPurchaseItemFilterEdit.ShowModal = mrOk then
    begin
      actUpdateItemExecute(Sender);
    end;
  finally
    frmRQPurchaseItemFilterEdit.Free;
    frmRQPurchaseItemFilterEdit:=nil;
  end;

end;


procedure TfrmRQPlanPurchaseEdit.actFilterItemChangesForPlanPurchaseExecute(
  Sender: TObject);
begin
 frmRQPurchaseItemFilterEdit:=TfrmRQPurchaseItemFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
    SetNullIntProps(RQPurchaseItemFilterObj);
    SetNullXSProps(RQPurchaseItemFilterObj);

    if frmRQPurchaseItemFilterEdit.ShowModal = mrOk then
    begin
     // actUpdateItemChangesForPlanPurchaseExecute(Sender);
    end;
  finally
    frmRQPurchaseItemFilterEdit.Free;
    frmRQPurchaseItemFilterEdit:=nil;
  end;

end;

procedure TfrmRQPlanPurchaseEdit.actInsertPlanPurchaseChangesExecute(
  Sender: TObject);

begin
  try
    frmRQPlanPurchaseEditInsert:=TfrmRQPlanPurchaseEditInsert.Create(Application, dsInsert);
    frmRQPlanPurchaseEditInsert.kindPlanPurchase:= ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN;
    frmRQPlanPurchaseEditInsert.parentPlanPurchaseCode:= RQPlanPurchaseObj.code;
    frmRQPlanPurchaseEditInsert.Caption:= 'Зміни до плану закупок №'+RQPlanPurchaseObj.name +'  '+ IntToStr(RQPlanPurchaseObj.yearGen) + ' року' ;

    frmRQPlanPurchaseEditInsert.edtCommentGen.Top:= 40;
    frmRQPlanPurchaseEditInsert.lblCommentGen.Top:=40;
    frmRQPlanPurchaseEditInsert.year:= RQPlanPurchaseObj.yearGen;
    frmRQPlanPurchaseEditInsert.lblName.Caption:= 'Назва';
    frmRQPlanPurchaseEditInsert.edtYearGen.Visible:= false;
    frmRQPlanPurchaseEditInsert.lblYearGen.Visible:= false;
    try
      if frmRQPlanPurchaseEditInsert.ShowModal = mrOk then
      begin
        if RQPlanPurchaseObj<>nil then
            actUpdatePlanPurchaseChangesExecute(Sender);
            // actUpdateItemChangesForPlanPurchaseExecute(sender);

      end;
    finally
      frmRQPlanPurchaseEditInsert.Free;
      frmRQPlanPurchaseEditInsert:=nil;
    end;
  finally
   // RQPlanPurchaseObj.Free;
  end;
end;

procedure TfrmRQPlanPurchaseEdit.actFilterItemTenderExecute(Sender: TObject);
begin
frmRQPurchaseItemTenderFilterEdit:=TfrmRQPurchaseItemTenderFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemTenderFilterObj := RQPurchaseItemTenderFilter.Create;
    SetNullIntProps(RQPurchaseItemTenderFilterObj);
    SetNullXSProps(RQPurchaseItemTenderFilterObj);

    if frmRQPurchaseItemTenderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPurchaseItemTenderFilter.Create;
     // FilterObject := RQPurchaseItemTenderFilterObj;
      actUpdateItemTenderExecute(Sender);
    end;
  finally
    frmRQPurchaseItemTenderFilterEdit.Free;
    frmRQPurchaseItemTenderFilterEdit:=nil;
  end;
end;

procedure TfrmRQPlanPurchaseEdit.actNoFilterExecute(Sender: TObject);
begin
  inherited;
  RQPurchaseItemFilterObj.Free;
  RQPurchaseItemFilterObj := nil;
  actUpdateItemExecute(Sender);
end;



procedure TfrmRQPlanPurchaseEdit.actResetPurchaseCountByAbstractPurchaseItemExecute(
  Sender: TObject);
var
  frmRqPurchaseItemAbstractSumShow: TfrmRqPurchaseItemAbstractSumShow;
  f: RQPurchaseItemFilter;
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  purchaseItemCodeSource : Integer;

  selectedPurchaseItem : Boolean;
  i , j : Integer;
  piList : RQPurchaseItemShortList;
  piObj : RQPurchaseItemShort;
  piArrCount : Integer;
  piArr : ArrayOfRQPurchaseItemShort;
begin
  f := RQPurchaseItemFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.isAbstractSum := 1;
  f.conditionSQL := ' rqplanpurchase.yeargen = '+ IntToStr(RQPlanPurchaseObj.yearGen);

   TempRQPurchaseItem :=  HTTPRIORQPurchaseItem  as RQPurchaseItemControllerSoapPort;
   frmRqPurchaseItemAbstractSumShow :=TfrmRqPurchaseItemAbstractSumShow.Create(Application,fmNormal, f);
   frmRqPurchaseItemAbstractSumShow.DisableActions([frmRqPurchaseItemAbstractSumShow.actdelete ,
   frmRqPurchaseItemAbstractSumShow.actInsert , frmRqPurchaseItemAbstractSumShow.actEdit , frmRqPurchaseItemAbstractSumShow.actNoFilter ]);
  try

    with frmRqPurchaseItemAbstractSumShow do
      if ShowModal = mrOk then
      begin
        try

          purchaseItemCodeSource := StrToInt(GetReturnValue(frmRqPurchaseItemAbstractSumShow.sgRQPurchaseItemWithCheckSum,0));
          ////
             selectedPurchaseItem := false;

            for i := 1 to sgRQPurchaseItem.RowCount - 1 do
            begin
              sgRQPurchaseItem.GetCheckBoxState(3, i, selectedPurchaseItem);
              if selectedPurchaseItem then break;
            end;
            if not selectedPurchaseItem then
            begin
              Application.MessageBox(PChar('Не обрані строки плану закупівель!'),
                                     PChar('Увага!'), MB_ICONWARNING);
              Exit;
            end;

            piList := RQPurchaseItemShortList.Create;
            piList.totalCount := 0;
            selectedPurchaseItem := false;

            for i := 1 to sgRQPurchaseItem.RowCount - 1 do
            begin
              sgRQPurchaseItem.GetCheckBoxState(3, i, selectedPurchaseItem);
              if selectedPurchaseItem then
              begin
                 piObj := RQPurchaseItemShort .Create;
                 SetNullIntProps(piObj);
                 SetNullXSProps(piObj);
                 piObj.code :=  StrToInt( sgRQPurchaseItem.Cells[0 , i]);
                 piArrCount := High(piArr) + 1;
                 SetLength(piArr, piArrCount + 1);
                 piArr[piArrCount] := piObj;

              end;
            end;

            piList.list:= piArr;
            piList.totalCount := High(piArr) + 1;

            if (piList.totalCount >= 0  ) then
            begin

              TempRQPurchaseItem.resetPurchaseCountByAbstractPurchaseItem(piArr , purchaseItemCodeSource);
              actUpdateItemExecute(sender);
            end
            else begin
              Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
              Exit;
            end;
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRqPurchaseItemAbstractSumShow.Free;

  end;
end;

procedure TfrmRQPlanPurchaseEdit.actSplitItemTenderExecute(Sender: TObject);
var
  TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
begin
  inherited;
  TempRQPurchaseItemTender := HTTPRIORQPurchaseItemTender as RQPurchaseItemTenderControllerSoapPort;
  try
    RQPurchaseItemTenderObj := TempRQPurchaseItemTender.getObject(StrToInt(sgRQPurchaseItemTender.Cells[0,sgRQPurchaseItemTender.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQPurchaseItemTenderEdit := TfrmRQPurchaseItemTenderEdit.Create(Application, dsEdit);
  frmRQPurchaseItemTenderEdit.isSplitItemTender := True;
  try
    if frmRQPurchaseItemTenderEdit.ShowModal = mrOk then
    begin
      pcPlanPurchaseItemsChange(Sender);
    end;
  finally
    frmRQPurchaseItemTenderEdit.Free;
    frmRQPurchaseItemTenderEdit:=nil;
  end;
end;


procedure TfrmRQPlanPurchaseEdit.actUpdateItemExecute(Sender: TObject);
Var h, j  : Integer;
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i  : Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;

begin
 for h:=1 to sgRQPurchaseItem.RowCount-1 do
   for j:=0 to sgRQPurchaseItem.ColCount-1 do
     sgRQPurchaseItem.Cells[j,h]:='';

     SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItem.ColumnHeaders);
     ColCountPurchaseItem:=100;
     TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;

   if RQPurchaseItemFilterObj = nil then
    begin
       RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
       SetNullIntProps(RQPurchaseItemFilterObj);
       SetNullXSProps(RQPurchaseItemFilterObj);
    end;

     RQPurchaseItemFilterObj.purchaseRef := RQPlanPurchaseRef.Create;
     RQPurchaseItemFilterObj.purchaseRef.code := RQPlanPurchaseObj.code;

     RQPurchaseItemFilterObj.orderBySQL := ' RQPURCHASEITEMTYPE.CODE  ,  TKMATERIALS.NAME';
     RQPurchaseItemList :=  TempRQPurchaseItem.getScrollableFilteredList(RQPurchaseItemFilterObj,0,ColCountPurchaseItem);

     LastCountPurchaseItem:=High(RQPurchaseItemList.list);

  if LastCountPurchaseItem > -1 then
     sgRQPurchaseItem.RowCount:=LastCountPurchaseItem+2
  else
     sgRQPurchaseItem.RowCount:=2;

   with sgRQPurchaseItem do
    for i:=0 to LastCountPurchaseItem do
      begin
         Application.ProcessMessages;
         if RQPurchaseItemList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(RQPurchaseItemList.list[i].code)
         else
         Cells[0,i+1] := '';

         Cells[1,i+1] := RQPurchaseItemList.list[i].identid2010;
         Cells[2,i+1] := RQPurchaseItemList.list[i].identid2015;

         Cells[3,i+1] := RQPurchaseItemList.list[i].materialNameGen;
         AddCheckBox(3, i+1, false, false);

          Cells[4,i+1] := RQPurchaseItemList.list[i].measurementNameGen;

         if RQPurchaseItemList.list[i].priceGenWithNds = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQPurchaseItemList.list[i].priceGenWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQPurchaseItemList.list[i].countGen.DecimalString;

        if RQPurchaseItemList.list[i].sumGenWithNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQPurchaseItemList.list[i].sumGenWithNds.DecimalString;


          if RQPurchaseItemList.list[i].pricePurchaseWithNds = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQPurchaseItemList.list[i].pricePurchaseWithNds.DecimalString;

         if RQPurchaseItemList.list[i].countPurchase = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQPurchaseItemList.list[i].countPurchase.DecimalString;

        if RQPurchaseItemList.list[i].sumPurchaseWithNds = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := RQPurchaseItemList.list[i].sumPurchaseWithNds.DecimalString;

        Cells[11,i+1] := RQPurchaseItemList.list[i].purchaseItemTypeRefName;
        //не менять
        Objects[11,i+1] := TObject(RQPurchaseItemList.list[i].purchaseItemTypeRefCode);// код типа закупки

        Cells[12,i+1] := RQPurchaseItemList.list[i].userGen;
        //Cells[9,i+1] := RQPurchaseItemList.list[i].commentGen;
        Cells[13,i+1] := RQPurchaseItemList.list[i].objectsName;  // названия объектов в строке
        LastRowPurchaseItem:=i+1;
        sgRQPurchaseItem.RowCount:=LastRowPurchaseItem+1;
      end;
   ColCountPurchaseItem:=ColCountPurchaseItem+1;
   sgRQPurchaseItem.Row:=1;

end;

procedure TfrmRQPlanPurchaseEdit.actUpdateItemTenderExecute(Sender: TObject);
var
  TempRQSpravDKPP: RQSpravDKPPControllerSoapPort;
  i, j , h , lastCount , lastrow : Integer;
  RQPurchaseItemTenderList: RQPurchaseItemTenderShortList;
  TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
begin

ClearGrid(sgRQPurchaseItemTender);
 for h:=1 to sgRQPurchaseItemTender.RowCount-1 do
   for j:=0 to sgRQPurchaseItemTender.ColCount-1 do
     sgRQPurchaseItemTender.Cells[j,h]:='';

//   'Код'
//          ,'Код ДК'
//          ,'Предмет закупівлі за кодом ДК(Назва) '
//          ,'Джерело фінансування'
//          ,'Орієнтована вартість з ПДВ по плану '
//          ,'Орієнтована вартість з ПДВ по договору '
//          ,'Процедура закупівлі'
//          ,'Орієнтовний початок проведення процедури закупівлі(місяць рік)'
     // TempRQSpravDKPP :=  HTTPRIORQSpravDKPP as RQSpravDKPPControllerSoapPort;

//      if RQPlanPurchaseObj. <> nil then
//        if ENPlanWorkObj.stateRef.code <> low(Integer) then
//        begin
//          TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
//
//          edtWorkState.Text := TempENPlanWorkState.getObject(ENPlanWorkObj.stateRef.code).name;
//        end;              ы


  SetGridHeaders(RQPurchaseItemTenderHeaders, sgRQPurchaseItemTender.ColumnHeaders);

  TempRQPurchaseItemTender := HTTPRIORQPurchaseItemTender as RQPurchaseItemTenderControllerSoapPort;

  if RQPurchaseItemTenderFilterObj = nil then
  begin
     RQPurchaseItemTenderFilterObj := RQPurchaseItemTenderFilter.Create;
     SetNullIntProps(RQPurchaseItemTenderFilterObj);
     SetNullXSProps(RQPurchaseItemTenderFilterObj);
  end;
  RQPurchaseItemTenderFilterObj.purchaseRef := RQPlanPurchaseRef.Create;
  RQPurchaseItemTenderFilterObj.purchaseRef.code := RQPlanPurchaseObj.code;

  RQPurchaseItemTenderFilterObj.orderBySQL := 'rqpurchaseitemtender.purchaseitemtyperefcod ,  rqpurchaseitemtender.identid , rqpurchaseitemtender.purchasename ';
  //RQPurchaseItemTenderList := TempRQPurchaseItemTender.getScrollableFilteredList(RQPurchaseItemTenderFilter(FilterObject),0,ColCount);
  RQPurchaseItemTenderList := TempRQPurchaseItemTender.getScrollableFilteredList(RQPurchaseItemTenderFilterObj,0,-1);


  LastCount := High(RQPurchaseItemTenderList.list);

  if (lastCount > -1) then
  begin
    DisableControls([btnCreateItems, edtSpravDkpp, edtCountSymbolGroupdkPP, spbSpravdkPP
                                     ,edtSpravDkppServices, edtCountSymbolGroupdkPPServices, spbSpravdkPPServices
                                     ,edtSpravDkppWorks, edtCountSymbolGroupdkPPWorks, spbSpravdkPPWorks ]);
    //edtSpravDkpp.Text := RQPurchaseItemTenderList.list[0].spravDKPPRefName;
    //edtCountSymbolGroupdkPP.Text := IntToStr(RQPurchaseItemTenderList.list[0].countSymbolForGroup);
  end else
  begin
    DisableControls([btnCreateItems, edtSpravDkpp, edtCountSymbolGroupdkPP, spbSpravdkPP
                                     ,edtSpravDkppServices, edtCountSymbolGroupdkPPServices, spbSpravdkPPServices
                                     ,edtSpravDkppWorks, edtCountSymbolGroupdkPPWorks, spbSpravdkPPWorks ], False);
    DenyBlankValues([edtSpravDkpp, edtCountSymbolGroupdkPP , edtSpravDkppServices  , edtCountSymbolGroupdkPPServices  , edtSpravDkppWorks  , edtCountSymbolGroupdkPPWorks]);
    edtSpravDkpp.Text := '';
    edtCountSymbolGroupdkPP.Text := '';
    edtSpravDkppServices.Text := '';
    edtCountSymbolGroupdkPPServices.Text := '';
    edtSpravDkppWorks.Text := '';
    edtCountSymbolGroupdkPPWorks.Text := '';
  end;


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
        Cells[1,i+1] := RQPurchaseItemTenderList.list[i].identid;
        Cells[2,i+1] := RQPurchaseItemTenderList.list[i].purchaseName;
        Cells[3,i+1] := RQPurchaseItemTenderList.list[i].financingSource;
        if RQPurchaseItemTenderList.list[i].sumGenWithNds = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQPurchaseItemTenderList.list[i].sumGenWithNds.DecimalString;
        if RQPurchaseItemTenderList.list[i].sumFactWithNds = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQPurchaseItemTenderList.list[i].sumFactWithNds.DecimalString;

          Cells[6,i+1] := RQPurchaseItemTenderList.list[i].tenderKindRefName; //  kinditemtendername;
          Cells[7,i+1] := RQPurchaseItemTenderList.list[i].tentativemonthyear;

          Cells[8,i+1] := RQPurchaseItemTenderList.list[i].purchaseItemTypeRefName;


         if (RQPurchaseItemTenderList.list[i].purchaseItemTypeRefCode = ENConsts.PURCHASE_ITEM_TYPE_MATERIALS) then
          begin
           edtSpravDkpp.Text := RQPurchaseItemTenderList.list[i].spravDKPPRefName;
           edtCountSymbolGroupdkPP.Text := IntToStr(RQPurchaseItemTenderList.list[i].countSymbolForGroup);
          end;
         if (RQPurchaseItemTenderList.list[i].purchaseItemTypeRefCode = ENConsts.PURCHASE_ITEM_TYPE_SERVICES) then
          begin
           edtSpravDkppServices.Text := RQPurchaseItemTenderList.list[i].spravDKPPRefName;
           edtCountSymbolGroupdkPPServices.Text := IntToStr(RQPurchaseItemTenderList.list[i].countSymbolForGroup);
          end;
         if (RQPurchaseItemTenderList.list[i].purchaseItemTypeRefCode = ENConsts.PURCHASE_ITEM_TYPE_WORKS) then
          begin
           edtSpravDkppWorks.Text := RQPurchaseItemTenderList.list[i].spravDKPPRefName;
           edtCountSymbolGroupdkPPWorks.Text := IntToStr(RQPurchaseItemTenderList.list[i].countSymbolForGroup);
          end;

       
        LastRow:=i+1;
        sgRQPurchaseItemTender.RowCount:=LastRow+1;
      end;

   sgRQPurchaseItemTender.Row:=1;
end;

procedure TfrmRQPlanPurchaseEdit.actUpdatePlanPurchaseChangesExecute(
  Sender: TObject);
{
var
  TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  i , LastCount , LastRow : Integer;
  RQPlanPurchaseList: RQPlanPurchaseShortList;
  FilterPlanPurchase: RQPlanPurchaseFilter;
  a,b :integer;
}
begin
{
  SetGridHeaders(RQPlanPurchaseHeaders, sgRQPlanPurchase.ColumnHeaders);
  TempRQPlanPurchase :=  HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;

  for a:=1 to sgRQPlanPurchase.RowCount-1 do
   for b:=0 to sgRQPlanPurchase.ColCount-1 do
     sgRQPlanPurchase.Cells[b,a]:=''; 


   FilterPlanPurchase := RQPlanPurchaseFilter.Create;
   SetNullIntProps(FilterPlanPurchase);
   SetNullXSProps(FilterPlanPurchase);

   FilterPlanPurchase.parentRef := RQPlanPurchaseRef.Create;
   FilterPlanPurchase.parentRef.code := RQPlanPurchaseObj.code;
   FilterPlanPurchase.kindRef := RQPlanPurchaseKindRef.Create;
   FilterPlanPurchase.kindRef.code := ENConsts.RQPLANPURCHASE_KIND_CHANGE_FOR_PLAN;

   FilterPlanPurchase.orderBySQL := 'RQPLANPURCHASE.DATEADD ';

  RQPlanPurchaseList := TempRQPlanPurchase.getScrollableFilteredList(RQPlanPurchaseFilter(FilterPlanPurchase),0,-1);


  LastCount:=High(RQPlanPurchaseList.list);

  if LastCount > -1 then
     sgRQPlanPurchase.RowCount:=LastCount+2
  else
     sgRQPlanPurchase.RowCount:=2;

   with sgRQPlanPurchase do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPurchaseList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPurchaseList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPlanPurchaseList.list[i].name;
//        if RQPlanPurchaseList.list[i].yearGen = Low(Integer) then
//          Cells[2,i+1] := ''
//        else
//          Cells[2,i+1] := IntToStr(RQPlanPurchaseList.list[i].yearGen);

//        if RQPlanPurchaseList.list[i].version = Low(Integer) then
//          Cells[3,i+1] := ''
//        else
//          Cells[3,i+1] := IntToStr(RQPlanPurchaseList.list[i].version);

        Cells[2,i+1] := RQPlanPurchaseList.list[i].commentGen;

        if RQPlanPurchaseList.list[i].dateAdd = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateAdd);

        if RQPlanPurchaseList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(RQPlanPurchaseList.list[i].dateEdit);
          Cells[5,i+1] := RQPlanPurchaseList.list[i].userAdd;
          Cells[6,i+1] := RQPlanPurchaseList.list[i].userEdit;
        LastRow:=i+1;
        sgRQPlanPurchase.RowCount:=LastRow+1;
      end;

   sgRQPlanPurchase.Row:=1;
   actUpdateItemChangesForPlanPurchaseExecute(sender);
}
end;

procedure TfrmRQPlanPurchaseEdit.actViewExecute(Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsView);
  frmRQPurchaseItemEdit.statusPurchase := RQPlanPurchaseObj.statusRef.code;
  try

    frmRQPurchaseItemEdit.ShowModal;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
end;


procedure TfrmRQPlanPurchaseEdit.actViewItemChangesForPlanPurchaseExecute(
  Sender: TObject);
// Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
{
 TempRQPurcdhaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj :=
     TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItemForChanges.Cells[0,sgRQPurchaseItemForChanges.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsView);
  try
    frmRQPurchaseItemEdit.ShowModal;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
}
end;

procedure TfrmRQPlanPurchaseEdit.ActViewItemTenderExecute(Sender: TObject);
Var TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
begin
 TempRQPurchaseItemTender := HTTPRIORQPurchaseItemTender as RQPurchaseItemTenderControllerSoapPort;
   try
     RQPurchaseItemTenderObj := TempRQPurchaseItemTender.getObject(StrToInt(sgRQPurchaseItemTender.Cells[0,sgRQPurchaseItemTender.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemTenderEdit:=TfrmRQPurchaseItemTenderEdit.Create(Application, dsView);
  try
    frmRQPurchaseItemTenderEdit.ShowModal;
  finally
    frmRQPurchaseItemTenderEdit.Free;
    frmRQPurchaseItemTenderEdit:=nil;
  end;
end;


procedure TfrmRQPlanPurchaseEdit.actChangeENtenderPurchaseKindExecute(
  Sender: TObject);
var
   frmENTenderPurchaseKindShow: TfrmENTenderPurchaseKindShow;
   itemTenderObj : RQPurchaseItemTender;
   TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити процедуру закупівлі ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

   TempRQPurchaseItemTender := HTTPRIORQPurchaseItemTender as RQPurchaseItemTenderControllerSoapPort;
   try
     itemTenderObj := TempRQPurchaseItemTender.getObject(StrToInt(sgRQPurchaseItemTender.Cells[0,sgRQPurchaseItemTender.Row]));
   except
   on EConvertError do Exit;
  end;

   frmENTenderPurchaseKindShow := TfrmENTenderPurchaseKindShow.Create(Application, fmNormal);
   try
     DisableActions([frmENTenderPurchaseKindShow.actInsert,frmENTenderPurchaseKindShow.actEdit,frmENTenderPurchaseKindShow.actDelete]);

     with frmENTenderPurchaseKindShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           if itemTenderObj.tenderKindRef = nil
             then itemTenderObj.tenderKindRef := ENTenderPurchaseKindRef.Create;
                  itemTenderObj.tenderKindRef.code := StrToInt(GetReturnValue(sgENTenderPurchaseKind, 0));
           TempRQPurchaseItemTender.save(itemTenderObj);
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmENTenderPurchaseKindShow.Free;
     actUpdateItemTenderExecute(Sender);
   end;
  end;

end;

procedure TfrmRQPlanPurchaseEdit.actChangePlanPurchaseItemTypeExecute(
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
        actUpdateItemExecute(Sender);
      end;
  finally
    frmChangePlanPurchaseItemType.Free;
    frmChangePlanPurchaseItemType:=nil;
  end;

end;

procedure TfrmRQPlanPurchaseEdit.actDeleteExecute(Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить строку Плана закупок ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItem.remove(ObjCode);
      actUpdateItemExecute(Sender);
  end;
end;


procedure TfrmRQPlanPurchaseEdit.actDeletePlanPurchaseChangesExecute(
  Sender: TObject);
Var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
  ObjCode: Integer;
begin
{
 TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPurchase.Cells[0,sgRQPlanPurchase.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить зміну до плану закупівель) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPurchase.remove(ObjCode);
      actUpdatePlanPurchaseChangesExecute(Sender);
  end;
}
end;

procedure TfrmRQPlanPurchaseEdit.actEditItemChangesForPlanPurchaseExecute(
  Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
{
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj :=
      TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItemForChanges.Cells[0,sgRQPurchaseItemForChanges.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsEdit);
  try
    if frmRQPurchaseItemEdit.ShowModal= mrOk then
      begin
        actUpdateItemChangesForPlanPurchaseExecute(Sender);
      end;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
}
end;

procedure TfrmRQPlanPurchaseEdit.actEditItemExecute(Sender: TObject);
Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemEdit:=TfrmRQPurchaseItemEdit.Create(Application, dsEdit);
  frmRQPurchaseItemEdit.statusPurchase := RQPlanPurchaseObj.statusRef.code;
  try
    if frmRQPurchaseItemEdit.ShowModal= mrOk then
      begin
        //TempRQPurchaseItem.save(RQPurchaseItemObj);
        //UpdateGrid(Sender);
        actUpdateItemExecute(Sender);
      end;
  finally
    frmRQPurchaseItemEdit.Free;
    frmRQPurchaseItemEdit:=nil;
  end;
end;

procedure TfrmRQPlanPurchaseEdit.actEditItemTenderExecute(Sender: TObject);
var
  TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
begin
  TempRQPurchaseItemTender := HTTPRIORQPurchaseItemTender as RQPurchaseItemTenderControllerSoapPort;
  try
    RQPurchaseItemTenderObj := TempRQPurchaseItemTender.getObject(StrToInt(sgRQPurchaseItemTender.Cells[0,sgRQPurchaseItemTender.Row]));
  except
    on EConvertError do Exit;
  end;
  frmRQPurchaseItemTenderEdit := TfrmRQPurchaseItemTenderEdit.Create(Application, dsEdit);
  try
    if frmRQPurchaseItemTenderEdit.ShowModal= mrOk then
    begin
      // TempRQPurchaseItemTender.save(RQPurchaseItemTenderObj);
      // UpdateGrid(Sender);
      pcPlanPurchaseItemsChange(Sender);
    end;
  finally
    frmRQPurchaseItemTenderEdit.Free;
    frmRQPurchaseItemTenderEdit:=nil;
  end;
end;


procedure TfrmRQPlanPurchaseEdit.actExportExcelExecute(Sender: TObject);
begin
  inherited;
    DMReports.exportGrid(sgRQPurchaseItem, '__');
end;

procedure TfrmRQPlanPurchaseEdit.actExportExcelTenderItemExecute(
  Sender: TObject);
begin
  inherited;
    DMReports.exportGrid(sgRQPurchaseItemTender, '__');
end;

procedure TfrmRQPlanPurchaseEdit.btnCreateItemsClick(Sender: TObject);
var
  TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;

begin
  if not NoBlankValues([edtSpravDkpp, edtCountSymbolGroupdkPP , edtSpravDkppServices, edtCountSymbolGroupdkPPServices  , edtSpravDkppWorks, edtCountSymbolGroupdkPPWorks ]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
  end
  else
  begin
    if Application.MessageBox(PChar(' Сформувати строки по кодам ДК   ? '),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      try
        CountSymbolGroupdkPP := strToInt(edtCountSymbolGroupdkPP.Text);
      except
        on EConvertError do CountSymbolGroupdkPP := LOW_INT;
      end;
      try
        CountSymbolGroupdkPPServices := strToInt(edtCountSymbolGroupdkPPServices.Text);
      except
        on EConvertError do CountSymbolGroupdkPPServices := LOW_INT;
      end;
       try
        CountSymbolGroupdkPPWorks := strToInt(edtCountSymbolGroupdkPPWorks.Text);
      except
        on EConvertError do CountSymbolGroupdkPPWorks := LOW_INT;
      end;



      TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
      TempRQPlanPurchase.makePurchaseItemTender
      (RQPlanPurchaseObj.code
      , SpravDKPP, strToInt(edtCountSymbolGroupdkPP.Text)
      , SpravDKPPServices, strToInt(edtCountSymbolGroupdkPPServices.Text)
      , SpravDKPPWorks, strToInt(edtCountSymbolGroupdkPPWorks.Text)
      );
      Self.actUpdateItemTenderExecute(Sender);
    end;
  end;
end;


procedure TfrmRQPlanPurchaseEdit.btnDeleteItemsClick(Sender: TObject);
var
  TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
  inherited;
  if Application.MessageBox( PChar('Ви дійсно бажаєте видалити строки? Усі змінені дані в строках будуть видалені...'),
          PChar('Увага !'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
    TempRQPlanPurchase.removePurchaseItemTender(RQPlanPurchaseObj.code);

    ShowMessage('Строки видалені ...');
    RQPlanPurchaseObj := TempRQPlanPurchase.getObject(RQPlanPurchaseObj.code);
    Self.actUpdateItemTenderExecute(Sender);
    Exit;
  end;
end;


procedure TfrmRQPlanPurchaseEdit.btnPrintReportClick(Sender: TObject);
begin
   frmreportplanpurchase := Tfrmreportplanpurchase.Create(Application, dsInsert);
   frmreportplanpurchase.PlanPurchaseCode:= RQPlanPurchaseObj.code;
  try
		frmreportplanpurchase.ShowModal;
	finally
		frmreportplanpurchase.Free;
 end;
end;


procedure TfrmRQPlanPurchaseEdit.Button1Click(Sender: TObject);
var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
      TempPlanpurchaseOBJECT :  RQPlanPurchase;
begin
  begin

//    TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;
//
//    TempPlanpurchaseOBJECT:=RQPlanPurchase.Create;
//    TempPlanpurchaseOBJECT.kindRef := RQPlanPurchaseKindRef.Create;
//    TempPlanpurchaseOBJECT.kindRef.code := 1;
//    TempPlanpurchaseOBJECT.name := RQPlanPurchaseObj.name;
//    TempPlanpurchaseOBJECT.yearGen := RQPlanPurchaseObj.yearGen;
//    TempPlanpurchaseOBJECT.commentGen := RQPlanPurchaseObj.commentGen;
//    TempPlanpurchaseOBJECT.code :=  RQPlanPurchaseObj.code;
//
//
//    TempRQPlanPurchase.addInPresentPlanPurchase(RQPlanPurchaseObj);
//
//    actUpdateItemExecute(Sender);

  end;
end;

procedure TfrmRQPlanPurchaseEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPurchase: RQPlanPurchaseControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtYearGen
     // ,edtVersion
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPlanPurchase := HTTPRIORQPlanPurchase as RQPlanPurchaseControllerSoapPort;


     RQPlanPurchaseObj.name := edtName.Text;

     if ( edtYearGen.Text <> '' ) then
       RQPlanPurchaseObj.yearGen := StrToInt(edtYearGen.Text)
     else
       RQPlanPurchaseObj.yearGen := Low(Integer) ;

//     if ( edtVersion.Text <> '' ) then
//       RQPlanPurchaseObj.version := StrToInt(edtVersion.Text)
//     else
//       RQPlanPurchaseObj.version := Low(Integer) ;

     RQPlanPurchaseObj.commentGen := edtCommentGen.Text; 

//     RQPlanPurchaseObj.dateAdd := GetTXSDateTimeFromTDateTimePicker(edtdateAdd);
//
//     RQPlanPurchaseObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtdateEdit);
//
//     RQPlanPurchaseObj.userAdd := edtUserAdd.Text;
//
//     RQPlanPurchaseObj.userEdit := edtUserEdit.Text;

    if DialogState = dsInsert then
    begin
      RQPlanPurchaseObj.code:=low(Integer);
      TempRQPlanPurchase.add(RQPlanPurchaseObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPlanPurchase.save(RQPlanPurchaseObj);
    end;
  end;
end;


end.
