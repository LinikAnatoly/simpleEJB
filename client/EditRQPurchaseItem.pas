
unit EditRQPurchaseItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
    EnergyproController, EnergyproController2, RQPurchaseItemController, AdvObj,
    TB2Dock, TB2Toolbar, ExtCtrls;

type
    TfrmRQPurchaseItemEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;

    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQPurchaseItem: THTTPRIO;
    HTTPRIORQPurchaseItem2EstimateItem: THTTPRIO;
    ActionShowFreeItem: TActionList;
    actUpdatePurchaseItemFreeCount: TAction;
    actReplaseCountMaterials: TAction;
    ppMenuShowFreeItem: TPopupMenu;
    miUpdatePurchaseItemFreeCount: TMenuItem;
    miReplaseCountMaterials: TMenuItem;
    ActionForEstimate: TActionList;
    actUnReplaseCountPurchaseMaterials: TAction;
    actNotAccountMaterialsForPurchase: TAction;
    actUnNotAccountMaterialsForPurchase: TAction;
    ppMenuForEstimate: TPopupMenu;
    miUnReplaseCountPurchaseMaterials: TMenuItem;
    miNotAccountMaterialsForPurchase: TMenuItem;
    miUnNotAccountMaterialsForPurchase: TMenuItem;
    PageControl1: TPageControl;
    tsTenderItem: TTabSheet;
    lblPurchaseName: TLabel;
    lblIdentid2010: TLabel;
    lblIdentid2015: TLabel;
    lblMeasurementNameGen: TLabel;
    lblCountChecked: TLabel;
    lblCountCheckedFromPurchaseItem: TLabel;
    lblPaid: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    ShapePaid: TShape;
    edtIdentid2010: TEdit;
    edtIdentid2015: TEdit;
    edtMeasurementNameGen: TEdit;
    edtPurchaseName: TEdit;
    GroupBox1: TGroupBox;
    lblCountGen: TLabel;
    lblPriceGenWithoutNds: TLabel;
    lblPriceGenWithNds: TLabel;
    lblSumGenWithoutNds: TLabel;
    lblSumGenWithNds: TLabel;
    edtCountGen: TEdit;
    edtPriceGenWithoutNds: TEdit;
    edtPriceGenWithNds: TEdit;
    edtSumGenWithoutNds: TEdit;
    edtSumGenWithNds: TEdit;
    groupBoxContract: TGroupBox;
    lblCountPurchase: TLabel;
    lblPricePurchaseWithoutNds: TLabel;
    lblPricePurchaseWithNds: TLabel;
    lblSumPurchaseWithoutNds: TLabel;
    lblSumPurchaseWithNds: TLabel;
    edtCountPurchase: TEdit;
    edtPricePurchaseWithoutNds: TEdit;
    edtPricePurchaseWithNds: TEdit;
    edtSumPurchaseWithoutNds: TEdit;
    edtSumPurchaseWithNds: TEdit;
    sgENEstimateItem: TAdvStringGrid;
    tbActions: TTBToolbar;
    GroupBoxFreeCountFromItem: TGroupBox;
    sgRQPurchaseItem: TAdvStringGrid;
    edtCountChecked: TEdit;
    edtCountCheckedFromPurchaseItem: TEdit;
    chkIsAbstractSum: TCheckBox;
    Label3: TLabel;
    Shape3: TShape;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENEstimateItemDblClick(Sender: TObject);
    procedure edtCountPurchaseChange(Sender: TObject);
    procedure calcSum();
    procedure edtPricePurchaseWithoutNdsChange(Sender: TObject);
    procedure actUpdatePurchaseItemExecute(Sender: TObject);
    procedure actUpdatePurchaseItemFreeCountExecute(Sender: TObject);

    function GetCheckedMaterialsCountFromEstimate: Double;
    function GetCheckedMaterialsCountWithFreePurchaseItem: Double;
    procedure sgENEstimateItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sgRQPurchaseItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure actReplaseCountMaterialsExecute(Sender: TObject);
    procedure actUnReplaseCountPurchaseMaterialsExecute(Sender: TObject);
    procedure actNotAccountMaterialsForPurchaseExecute(Sender: TObject);
    procedure actUnNotAccountMaterialsForPurchaseExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    statusPurchase : Integer;

end;

var
  frmRQPurchaseItemEdit: TfrmRQPurchaseItemEdit;
  RQPurchaseItemObj: RQPurchaseItem;

  ENEstimateItemHeaders: array [1..15] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість із планів '
          ,'Кількість для оприлюднення '
          ,'Од. виміру'
          ,'Підрозділ'
          ,'інв №'
          ,'Об''єкт'
          ,'Період вик.робіт'
          ,'ПідВид робіт'
          ,'Тип Акту'
          ,'Код роботи'
          ,'Робота'
          ,'Інформація по договору'
          ,'Заявка '

        );

        RQPurchaseItemHeaders: array [1..6] of String =
        ( 'Код строки закупівлі',
          'Назва плану закупівлі',
          'Дата формування',
          'Назва матеріалу',
          'Кількість',
          'Тип плану закупівлі'
        );

implementation

uses EditENPlanWork, DMReportsUnit,
  ENPlanWorkController, RQPurchaseItem2EstimateItemController;


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItemController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItemEdit.FormShow(Sender: TObject);
var
  i, j : Integer;
   RQPurchaseItem2EstimateItemList : RQPurchaseItem2EstimateItemShortList;
   TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
begin
   TempRQPurchaseItem2EstimateItem :=  HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;

  DisableControls([edtCode, edtPurchaseName , edtMeasurementNameGen  , edtIdentid2010  , edtIdentid2015  , edtCountGen
    , edtPriceGenWithoutNds  , edtPriceGenWithNds  , edtSumGenWithoutNds  ,  edtSumGenWithNds ]);
  SetFloatStyle([edtCountPurchase , edtPricePurchaseWithoutNds  ,  edtPricePurchaseWithNds  , edtSumPurchaseWithoutNds  , edtSumPurchaseWithNds ]);

  if DialogState = dsView then
  begin
   //DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPurchaseName
      ,edtCountGen
      ,edtCountPurchase
      ,edtPriceGenWithoutNds
      ,edtPriceGenWithNds
      ,edtSumGenWithoutNds
      ,edtSumGenWithNds
      ,edtPricePurchaseWithoutNds
      ,edtPricePurchaseWithNds
      ,edtSumPurchaseWithoutNds
      ,edtSumPurchaseWithNds
     ]);
   end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPurchaseItemObj.code);
    edtPurchaseName.Text :=  RQPurchaseItemObj.materialNameGen;
    edtMeasurementNameGen.Text := RQPurchaseItemObj.measurementNameGen;
    edtIdentid2010.Text := RQPurchaseItemObj.identid2010;
    edtIdentid2015.Text := RQPurchaseItemObj.identid2015; 
    if ( RQPurchaseItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPurchaseItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    if ( RQPurchaseItemObj.countPurchase <> nil ) then
       edtCountPurchase.Text := RQPurchaseItemObj.countPurchase.decimalString
    else
       edtCountPurchase.Text := '';


    if ( RQPurchaseItemObj.priceGenWithoutNds <> nil ) then
       edtPriceGenWithoutNds.Text := RQPurchaseItemObj.priceGenWithoutNds.decimalString
    else
       edtPriceGenWithoutNds.Text := '';
    if ( RQPurchaseItemObj.priceGenWithNds <> nil ) then
       edtPriceGenWithNds.Text := RQPurchaseItemObj.priceGenWithNds.decimalString
    else
       edtPriceGenWithNds.Text := '';
    if ( RQPurchaseItemObj.sumGenWithoutNds <> nil ) then
       edtSumGenWithoutNds.Text := RQPurchaseItemObj.sumGenWithoutNds.decimalString
    else
       edtSumGenWithoutNds.Text := '';
    if ( RQPurchaseItemObj.sumGenWithNds <> nil ) then
       edtSumGenWithNds.Text := RQPurchaseItemObj.sumGenWithNds.decimalString
    else
       edtSumGenWithNds.Text := '';
    if ( RQPurchaseItemObj.pricePurchaseWithoutNds <> nil ) then
       edtPricePurchaseWithoutNds.Text := RQPurchaseItemObj.pricePurchaseWithoutNds.decimalString
    else
       edtPricePurchaseWithoutNds.Text := '';
    if ( RQPurchaseItemObj.pricePurchaseWithNds <> nil ) then
       edtPricePurchaseWithNds.Text := RQPurchaseItemObj.pricePurchaseWithNds.decimalString
    else
       edtPricePurchaseWithNds.Text := '';
    if ( RQPurchaseItemObj.sumPurchaseWithoutNds <> nil ) then
       edtSumPurchaseWithoutNds.Text := RQPurchaseItemObj.sumPurchaseWithoutNds.decimalString
    else
       edtSumPurchaseWithoutNds.Text := '';
    if ( RQPurchaseItemObj.sumPurchaseWithNds <> nil ) then
       edtSumPurchaseWithNds.Text := RQPurchaseItemObj.sumPurchaseWithNds.decimalString
    else
       edtSumPurchaseWithNds.Text := '';

   if RQPurchaseItemObj.isAbstractSum <> LOW_INT  then
   begin
    if RQPurchaseItemObj.isAbstractSum > 0  then
       chkIsAbstractSum.Checked := True
    else
       chkIsAbstractSum.Checked := False;
   end
    else
       chkIsAbstractSum.Checked := False;

    SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

    for i:=1 to sgENEstimateItem.RowCount-1 do
    begin
     sgENEstimateItem.RowColor[i] := clNone;
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
    end;
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);
   // лист с планами объектами
   RQPurchaseItem2EstimateItemList := TempRQPurchaseItem2EstimateItem.getListWithPlanObj( RQPurchaseItemObj.code );


    if High(RQPurchaseItem2EstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(RQPurchaseItem2EstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(RQPurchaseItem2EstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if RQPurchaseItem2EstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(RQPurchaseItem2EstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         Cells[1,i+1] := RQPurchaseItem2EstimateItemList.list[i].purchaseItemRefMaterialNameGen;
         // if ( StrToFloat(RQPurchaseItem2EstimateItemList.list[i].countPurchase.DecimalString ) > 0 ) then
           AddCheckBox(1, i+1, false, false);
         // красим строки замещенные в желтый
         if RQPurchaseItem2EstimateItemList.list[i].purchaseItem2EstimateItemStatusRefCode
           = ENConsts.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_REPLACEMENT then
             RowColor[i+1] := clYellow;
         // красим строки высвобожденные в аква
         if RQPurchaseItem2EstimateItemList.list[i].purchaseItem2EstimateItemStatusRefCode
           = ENConsts.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FREED then
             RowColor[i+1] := clAqua;
         // красим строки по которым отменили попадание кол-ва countPurchase в закупки
         if RQPurchaseItem2EstimateItemList.list[i].purchaseItem2EstimateItemStatusRefCode
           = ENConsts.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_FROMPLAN_ONLY then
             RowColor[i+1] := clLime;

         if RQPurchaseItem2EstimateItemList.list[i].purchaseItem2EstimateItemStatusRefCode
           = ENConsts.RQPLANPURCHASEITEM2ENESTIMATEITEMSTATUS_REPLACEMENT_SUM_ABSTRACT then
             RowColor[i+1] := clMoneyGreen;


         if RQPurchaseItem2EstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := RQPurchaseItem2EstimateItemList.list[i].countGen.DecimalString;

         if RQPurchaseItem2EstimateItemList.list[i].countPurchase = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := RQPurchaseItem2EstimateItemList.list[i].countPurchase.DecimalString;

         Cells[4,i+1] := RQPurchaseItem2EstimateItemList.list[i].purchaseItemRefMeasurementNameGen;
         Cells[5,i+1] := RQPurchaseItem2EstimateItemList.list[i].depName;

         Cells[6,i+1] := RQPurchaseItem2EstimateItemList.list[i].objInv;
         Cells[7,i+1] := RQPurchaseItem2EstimateItemList.list[i].objName;
         Cells[8,i+1] := RQPurchaseItem2EstimateItemList.list[i].periodPlan;

         Cells[9,i+1] := RQPurchaseItem2EstimateItemList.list[i].enplanworkTypeName;
         Cells[10,i+1] := RQPurchaseItem2EstimateItemList.list[i].enplanworkStateName;

         Cells[11,i+1] := RQPurchaseItem2EstimateItemList.list[i].techkartnumber;
         Cells[12,i+1] := RQPurchaseItem2EstimateItemList.list[i].techkartname;

         Cells[13,i+1] := RQPurchaseItem2EstimateItemList.list[i].contractnumber;

         Cells[14,i+1] := RQPurchaseItem2EstimateItemList.list[i].order_info;


         Objects[1,i+1] := TObject(RQPurchaseItem2EstimateItemList.list[i].estimateItemRefCode);


         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;
     edtCountChecked.Text := '0';

  end;

  // При черновом статусе плана закупок покажем грид с доступным количеством
  // из строк ранее сформированных
  if  statusPurchase = ENConsts.RQPLANPURCHASE_STATUS_DRAFT  then
  begin
   GroupBoxFreeCountFromItem.Visible := True;
   sgRQPurchaseItem.Visible := True;
   actUpdatePurchaseItemFreeCountExecute(sender);
   lblCountCheckedFromPurchaseItem.Visible := true;
   edtCountCheckedFromPurchaseItem.Visible := true;
  end
  else
  begin
   GroupBoxFreeCountFromItem.Visible := False;
   sgRQPurchaseItem.Visible := False;
   lblCountCheckedFromPurchaseItem.Visible := False;
   edtCountCheckedFromPurchaseItem.Visible := False;
  end


end;



procedure TfrmRQPurchaseItemEdit.sgENEstimateItemCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
var checkedCount: Double ;
begin

    checkedCount := GetCheckedMaterialsCountFromEstimate;

    edtCountChecked.Text := FloatToStr(checkedCount);
end;

procedure TfrmRQPurchaseItemEdit.sgENEstimateItemDblClick(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
objCode : Integer;
begin
      try
        objCode:= Integer(sgENEstimateItem.Objects[1,sgENEstimateItem.Row]);
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


procedure TfrmRQPurchaseItemEdit.sgRQPurchaseItemCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
var checkedCountWithFreePurchaseItem: Double ;
begin

    checkedCountWithFreePurchaseItem := GetCheckedMaterialsCountWithFreePurchaseItem;

    edtCountCheckedFromPurchaseItem.Text := FloatToStr(checkedCountWithFreePurchaseItem);
end;

procedure TfrmRQPurchaseItemEdit.edtCountPurchaseChange(Sender: TObject);
begin
  inherited;
  calcSum();
end;


procedure TfrmRQPurchaseItemEdit.edtPricePurchaseWithoutNdsChange(
  Sender: TObject);
begin
  inherited;
  calcSum();
end;


procedure TfrmRQPurchaseItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtPurchaseName
      ,edtCountGen
      ,edtCountPurchase
      ,edtPriceGenWithoutNds
      ,edtPriceGenWithNds
      ,edtSumGenWithoutNds
      ,edtSumGenWithNds
      ,edtPricePurchaseWithoutNds
      ,edtPricePurchaseWithNds
      ,edtSumPurchaseWithoutNds
      ,edtSumPurchaseWithNds
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;

     RQPurchaseItemObj.identid2010 := edtIdentid2010.Text; 

     RQPurchaseItemObj.identid2015 := edtIdentid2015.Text; 

     if (RQPurchaseItemObj.countGen = nil ) then
       RQPurchaseItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQPurchaseItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQPurchaseItemObj.countGen := nil;


     RQPurchaseItemObj.measurementNameGen := edtMeasurementNameGen.Text;

     if (RQPurchaseItemObj.priceGenWithoutNds = nil ) then
       RQPurchaseItemObj.priceGenWithoutNds := TXSDecimal.Create;
     if edtPriceGenWithoutNds.Text <> '' then
       RQPurchaseItemObj.priceGenWithoutNds.decimalString := edtPriceGenWithoutNds.Text 
     else
       RQPurchaseItemObj.priceGenWithoutNds := nil;

     if (RQPurchaseItemObj.priceGenWithNds = nil ) then
       RQPurchaseItemObj.priceGenWithNds := TXSDecimal.Create;
     if edtPriceGenWithNds.Text <> '' then
       RQPurchaseItemObj.priceGenWithNds.decimalString := edtPriceGenWithNds.Text 
     else
       RQPurchaseItemObj.priceGenWithNds := nil;

     if (RQPurchaseItemObj.sumGenWithoutNds = nil ) then
       RQPurchaseItemObj.sumGenWithoutNds := TXSDecimal.Create;
     if edtSumGenWithoutNds.Text <> '' then
       RQPurchaseItemObj.sumGenWithoutNds.decimalString := edtSumGenWithoutNds.Text 
     else
       RQPurchaseItemObj.sumGenWithoutNds := nil;

     if (RQPurchaseItemObj.sumGenWithNds = nil ) then
       RQPurchaseItemObj.sumGenWithNds := TXSDecimal.Create;
     if edtSumGenWithNds.Text <> '' then
       RQPurchaseItemObj.sumGenWithNds.decimalString := edtSumGenWithNds.Text 
     else
       RQPurchaseItemObj.sumGenWithNds := nil;
      ///////////


      if (RQPurchaseItemObj.countPurchase = nil ) then
       RQPurchaseItemObj.countPurchase := TXSDecimal.Create;
     if edtCountPurchase.Text <> '' then
       RQPurchaseItemObj.countPurchase.decimalString := edtCountPurchase.Text
     else
       RQPurchaseItemObj.countPurchase := nil;

      if (RQPurchaseItemObj.pricePurchaseWithoutNds = nil ) then
       RQPurchaseItemObj.pricePurchaseWithoutNds := TXSDecimal.Create;
     if edtPricePurchaseWithoutNds.Text <> '' then
       RQPurchaseItemObj.pricePurchaseWithoutNds.decimalString := edtPricePurchaseWithoutNds.Text
     else
       RQPurchaseItemObj.pricePurchaseWithoutNds := nil;

     if (RQPurchaseItemObj.pricePurchaseWithNds = nil ) then
       RQPurchaseItemObj.pricePurchaseWithNds := TXSDecimal.Create;
     if edtPricePurchaseWithNds.Text <> '' then
       RQPurchaseItemObj.pricePurchaseWithNds.decimalString := edtPricePurchaseWithNds.Text
     else
       RQPurchaseItemObj.pricePurchaseWithNds := nil;

     if (RQPurchaseItemObj.sumPurchaseWithoutNds = nil ) then
       RQPurchaseItemObj.sumPurchaseWithoutNds := TXSDecimal.Create;
     if edtSumPurchaseWithoutNds.Text <> '' then
       RQPurchaseItemObj.sumPurchaseWithoutNds.decimalString := edtSumPurchaseWithoutNds.Text
     else
       RQPurchaseItemObj.sumPurchaseWithoutNds := nil;

     if (RQPurchaseItemObj.sumPurchaseWithNds = nil ) then
       RQPurchaseItemObj.sumPurchaseWithNds := TXSDecimal.Create;
     if edtSumPurchaseWithNds.Text <> '' then
       RQPurchaseItemObj.sumPurchaseWithNds.decimalString := edtSumPurchaseWithNds.Text
     else
       RQPurchaseItemObj.sumPurchaseWithNds := nil;

     if chkIsAbstractSum.Checked = True then
      RQPurchaseItemObj.isAbstractSum := 1
    else
      RQPurchaseItemObj.isAbstractSum := 0;



    if DialogState = dsInsert then
    begin
      RQPurchaseItemObj.code:=low(Integer);
      TempRQPurchaseItem.add(RQPurchaseItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPurchaseItem.save(RQPurchaseItemObj);
    end;
  end;
end;


procedure TfrmRQPurchaseItemEdit.actUpdatePurchaseItemFreeCountExecute(Sender: TObject);
Var h, j , LastCount : Integer;
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i  , LastRowPurchaseItem : Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  RQPurchaseItemFilterObj : RQPurchaseItemFilter;
begin
 for h:=1 to sgRQPurchaseItem.RowCount-1 do
   for j:=0 to sgRQPurchaseItem.ColCount-1 do
     sgRQPurchaseItem.Cells[j,h]:='';

     SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItem.ColumnHeaders);

     TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;


     RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
     SetNullIntProps(RQPurchaseItemFilterObj);
     SetNullXSProps(RQPurchaseItemFilterObj);


     RQPurchaseItemFilterObj.conditionSQL :=
     ' RQPurchaseItem.CODE in ( select purit.code from net.rqpurchaseitem purit  , net.rqplanpurchase pur ' +
      ' where purit.countfree > 0 ' +
      ' and purit.purchaserefcode = pur.code ' +
      ' and purit.materialrefcode =  ' + IntToStr(RQPurchaseItemObj.materialRef.code) +
      ' and pur.statusrefcode = 2 /* утвержденные берем */) ' ;




     RQPurchaseItemFilterObj.orderBySQL := 'RQPLANPURCHASE.DATEADD';

  RQPurchaseItemList :=
  TempRQPurchaseItem.getScrollableFilteredList(RQPurchaseItemFilterObj,0,-1);

   LastCount:=High(RQPurchaseItemList.list);

  if LastCount > -1 then
     sgRQPurchaseItem.RowCount:=LastCount+2
  else
     sgRQPurchaseItem.RowCount:=2;

   with sgRQPurchaseItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQPurchaseItemList.list[i].purchaseRefName;

        if RQPurchaseItemList.list[i].purchaseRefDateAdd = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTime2String(RQPurchaseItemList.list[i].purchaseRefDateAdd);

        Cells[3,i+1] := RQPurchaseItemList.list[i].materialNameGen;

        if RQPurchaseItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQPurchaseItemList.list[i].countFree.DecimalString;
        AddCheckBox(4, i+1, false, false);

        Cells[5,i+1] := RQPurchaseItemList.list[i].purchaseKindName;

        LastRowPurchaseItem:=i+1;
        sgRQPurchaseItem.RowCount:=LastRowPurchaseItem+1;
      end;
   sgRQPurchaseItem.Row:=1;


   edtCountCheckedFromPurchaseItem.Text := '0';

end;

procedure TfrmRQPurchaseItemEdit.calcSum();
var
  curr_nds, curr_nds_coeff, countFact, pricePurchaseWithoutNds, pricePurchaseWithNds, sumPurchaseWithoutNds, sumPurchaseWithNds: Double;
begin

  curr_nds := DMReports.getStandartKoefInPeriod(ENSTANDARDCONST_PDV, Now);
  curr_nds_coeff := curr_nds / 100 + 1;

  try
    countFact := StrToFloat(edtCountPurchase.Text);
  except
    on EConvertError do
      countFact := 0;
  end;

  try
    pricePurchaseWithoutNds := StrToFloat(edtPricePurchaseWithoutNds.Text);
  except
    on EConvertError do
      pricePurchaseWithoutNds := 0;
  end;

  try
    pricePurchaseWithNds := StrToFloat(edtPricePurchaseWithNds.Text);
  except
    on EConvertError do
      pricePurchaseWithNds := 0;
  end;

  pricePurchaseWithNds := Conv(pricePurchaseWithoutNds * curr_nds_coeff, 2);
  edtPricePurchaseWithNds.Text := FloatToStr(pricePurchaseWithNds);

  edtSumPurchaseWithoutNds.Text := FloatToStr(Conv(countFact * pricePurchaseWithoutNds, 2));
  edtSumPurchaseWithNds.Text := FloatToStr(Conv(countFact * pricePurchaseWithNds, 2));
end;

procedure TfrmRQPurchaseItemEdit.actNotAccountMaterialsForPurchaseExecute(
  Sender: TObject);
var stateEi ,  selectedEi   : boolean;
i  , j : Integer;
pi2eiObj : RQPurchaseItem2EstimateItemShort;
pi2eiList : RQPurchaseItem2EstimateItemShortList;
eArrCountEi , eArrCountPi : Integer;
eArrEi :  ArrayOfRQPurchaseItem2EstimateItemShort;
TempRQPurchaseItem2EstimateItem : RQPurchaseItem2EstimateItemControllerSoapPort;
thisRqPurchaseItemCode : Integer;
TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
  inherited;
   selectedEi := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selectedEi);
    if selectedEi then break;
  end;

   if not selectedEi then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал у переліку матеріалів з планів!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  pi2eiList := RQPurchaseItem2EstimateItemShortList.Create;
  pi2eiList.totalCount := 0;
  stateEi := false;

   for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, stateEi);
    if stateEi then
    begin
       pi2eiObj := RQPurchaseItem2EstimateItemShort.Create;
       SetNullIntProps(pi2eiObj);
       SetNullXSProps(pi2eiObj);
       pi2eiObj.code := StrToInt(sgENEstimateItem.Cells[0, i]);
       pi2eiObj.countPurchase := TXSDecimal.Create;
       pi2eiObj.countPurchase.DecimalString := sgENEstimateItem.Cells[3, i];
       eArrCountEi := High(eArrEi) + 1;
       SetLength(eArrEi, eArrCountEi + 1);
       eArrEi[eArrCountEi] := pi2eiObj;

    end;
  end;

  pi2eiList.list := eArrEi;
  pi2eiList.totalCount := High(eArrEi) + 1;

   if (High(eArrEi) >= 0) then
  begin
    TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQPurchaseItem2EstimateItem.notAccountMaterialsForPurchase( eArrEi );
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  thisRqPurchaseItemCode := RQPurchaseItemObj.code;
  TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(thisRqPurchaseItemCode);
   except
   on EConvertError do Exit;
  end;

  FormShow(Sender);
end;




procedure TfrmRQPurchaseItemEdit.actReplaseCountMaterialsExecute(
  Sender: TObject);
var stateEi,statePi ,  selectedEi , selectedPi  : boolean;
i  , j : Integer;
pi2eiObj : RQPurchaseItem2EstimateItemShort;
piObj : RQPurchaseItemShort;
pi2eiList : RQPurchaseItem2EstimateItemShortList;
piList : RQPurchaseItemShortList;
eArrCountEi , eArrCountPi : Integer;
eArrEi :  ArrayOfRQPurchaseItem2EstimateItemShort;
eArrPi :  ArrayOfRQPurchaseItemShort;
TempRQPurchaseItem2EstimateItem : RQPurchaseItem2EstimateItemControllerSoapPort;
TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
thisRqPurchaseItemCode : Integer;
begin

begin
  //inherited;
     /// Проверяем, чтобы был выбраны были строки естимейтов и какие то строки плана закупок предыдущего
  selectedEi := false;
  selectedPi := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selectedEi);
    if selectedEi then break;
  end;

  for i := 1 to sgRQPurchaseItem.RowCount - 1 do
  begin
    sgRQPurchaseItem.GetCheckBoxState(4, i, selectedPi);
    if selectedPi then break;
  end;

  if not selectedEi then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал у переліку матеріалів з планів!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if not selectedPi then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал у переліку попередніх строк закупівель !!!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  //
  pi2eiList := RQPurchaseItem2EstimateItemShortList.Create;
  pi2eiList.totalCount := 0;
  stateEi := false;

   for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, stateEi);
    if stateEi then
    begin
       pi2eiObj := RQPurchaseItem2EstimateItemShort.Create;
       SetNullIntProps(pi2eiObj);
       SetNullXSProps(pi2eiObj);
       pi2eiObj.code := StrToInt(sgENEstimateItem.Cells[0, i]);
       pi2eiObj.countPurchase := TXSDecimal.Create;
       pi2eiObj.countPurchase.DecimalString := sgENEstimateItem.Cells[3, i];
       eArrCountEi := High(eArrEi) + 1;
       SetLength(eArrEi, eArrCountEi + 1);
       eArrEi[eArrCountEi] := pi2eiObj;

    end;
  end;

  pi2eiList.list := eArrEi;
  pi2eiList.totalCount := High(eArrEi) + 1;

  ///////// строки откуда брать кол-во
  piList := RQPurchaseItemShortList.Create;
  piList.totalCount := 0;
  statePi := false;

   for j := 1 to sgRQPurchaseItem.RowCount - 1 do
  begin
    sgRQPurchaseItem.GetCheckBoxState(4, j, statePi);
    if statePi then
    begin
       piObj := RQPurchaseItemShort.Create;
       SetNullIntProps(piObj);
       SetNullXSProps(piObj);
       piObj.code := StrToInt(sgRQPurchaseItem.Cells[0, j]);
       piObj.countFree := TXSDecimal.Create;
       piObj.countFree.DecimalString := sgRQPurchaseItem.Cells[4, i];
       eArrCountPi := High(eArrPi) + 1;
       SetLength(eArrPi, eArrCountPi + 1);
       eArrPi[eArrCountPi] := piObj;

    end;
  end;

  piList.list := eArrPi;
  piList.totalCount := High(eArrPi) + 1;

   if ((High(eArrEi) >= 0) and (High(eArrPi) >= 0) ) then
  begin
    TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQPurchaseItem2EstimateItem.replaceCountMaterials( eArrEi , eArrPi );
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

 thisRqPurchaseItemCode := RQPurchaseItemObj.code;
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(thisRqPurchaseItemCode);
   except
   on EConvertError do Exit;
  end;
end;
   FormShow(Sender);


end;

procedure TfrmRQPurchaseItemEdit.actUnNotAccountMaterialsForPurchaseExecute(
  Sender: TObject);
var stateEi ,  selectedEi   : boolean;
i  , j : Integer;
pi2eiObj : RQPurchaseItem2EstimateItemShort;
pi2eiList : RQPurchaseItem2EstimateItemShortList;
eArrCountEi , eArrCountPi : Integer;
eArrEi :  ArrayOfRQPurchaseItem2EstimateItemShort;
TempRQPurchaseItem2EstimateItem : RQPurchaseItem2EstimateItemControllerSoapPort;
thisRqPurchaseItemCode : Integer;
TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
  inherited;
   selectedEi := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selectedEi);
    if selectedEi then break;
  end;

   if not selectedEi then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один матеріал у переліку матеріалів з планів!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  pi2eiList := RQPurchaseItem2EstimateItemShortList.Create;
  pi2eiList.totalCount := 0;
  stateEi := false;

   for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, stateEi);
    if stateEi then
    begin
       pi2eiObj := RQPurchaseItem2EstimateItemShort.Create;
       SetNullIntProps(pi2eiObj);
       SetNullXSProps(pi2eiObj);
       pi2eiObj.code := StrToInt(sgENEstimateItem.Cells[0, i]);
       pi2eiObj.countPurchase := TXSDecimal.Create;
       pi2eiObj.countPurchase.DecimalString := sgENEstimateItem.Cells[3, i];
       eArrCountEi := High(eArrEi) + 1;
       SetLength(eArrEi, eArrCountEi + 1);
       eArrEi[eArrCountEi] := pi2eiObj;

    end;
  end;

  pi2eiList.list := eArrEi;
  pi2eiList.totalCount := High(eArrEi) + 1;

   if (High(eArrEi) >= 0)   then
  begin
    TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQPurchaseItem2EstimateItem.UnNotAccountMaterialsForPurchase( eArrEi );
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  thisRqPurchaseItemCode := RQPurchaseItemObj.code;
  TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(thisRqPurchaseItemCode);
   except
   on EConvertError do Exit;
  end;

  FormShow(Sender);
end;

procedure TfrmRQPurchaseItemEdit.actUnReplaseCountPurchaseMaterialsExecute(
  Sender: TObject);
var stateEi,statePi ,  selectedEi , selectedPi  : boolean;
i  , eArrCountEi , thisRqPurchaseItemCode : Integer;
pi2eiList : RQPurchaseItem2EstimateItemShortList;
pi2eiObj : RQPurchaseItem2EstimateItemShort;
eArrEi :  ArrayOfRQPurchaseItem2EstimateItemShort;
TempRQPurchaseItem2EstimateItem : RQPurchaseItem2EstimateItemControllerSoapPort;
TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
  inherited;
  selectedEi := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, selectedEi);
    if selectedEi then break;
  end;

  if not selectedEi then
  begin
    Application.MessageBox(PChar('Не вибрані матеріали для відміни заміщення!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  pi2eiList := RQPurchaseItem2EstimateItemShortList.Create;
  pi2eiList.totalCount := 0;
  stateEi := false;

     for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, stateEi);
    if stateEi then
    begin
       pi2eiObj := RQPurchaseItem2EstimateItemShort.Create;
       SetNullIntProps(pi2eiObj);
       SetNullXSProps(pi2eiObj);
       pi2eiObj.code := StrToInt(sgENEstimateItem.Cells[0, i]);
       pi2eiObj.countPurchase := TXSDecimal.Create;
       pi2eiObj.countPurchase.DecimalString := sgENEstimateItem.Cells[3, i];
       eArrCountEi := High(eArrEi) + 1;
       SetLength(eArrEi, eArrCountEi + 1);
       eArrEi[eArrCountEi] := pi2eiObj;

    end;
  end;

   pi2eiList.list := eArrEi;
   pi2eiList.totalCount := High(eArrEi) + 1;

   if (High(eArrEi) >= 0  ) then
  begin
    TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;
    TempRQPurchaseItem2EstimateItem.unReplaceCountMaterials( eArrEi );
  end
  else begin
    Application.MessageBox(PChar('Не вибрано жодного матеріалу!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

 thisRqPurchaseItemCode := RQPurchaseItemObj.code;
 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(thisRqPurchaseItemCode);
   except
   on EConvertError do Exit;
  end;

   FormShow(Sender);
end;

procedure TfrmRQPurchaseItemEdit.actUpdatePurchaseItemExecute(Sender: TObject);
Var h, j , LastCount : Integer;
  TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
  i  , LastRowPurchaseItem : Integer;
  RQPurchaseItemList: RQPurchaseItemShortList;
  RQPurchaseItemFilterObj : RQPurchaseItemFilter;
begin
 for h:=1 to sgRQPurchaseItem.RowCount-1 do
   for j:=0 to sgRQPurchaseItem.ColCount-1 do
     sgRQPurchaseItem.Cells[j,h]:='';

     SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItem.ColumnHeaders);

     TempRQPurchaseItem :=  HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;


     RQPurchaseItemFilterObj := RQPurchaseItemFilter.Create;
     SetNullIntProps(RQPurchaseItemFilterObj);
     SetNullXSProps(RQPurchaseItemFilterObj);


     RQPurchaseItemFilterObj.conditionSQL :=
     ' RQPurchaseItem.CODE in ( select purit.code from net.RQPurchaseItem purit  , net.rqplanpurchase pur ' +
      ' where purit.purchaserefcode = 1 ' +
      ' and purit.countfree > 0 ' +
      ' and purit.purchaserefcode = pur.code ' +
      ' and pur.statusrefcode = 2 /*затвердже*/) ' ;


     RQPurchaseItemFilterObj.orderBySQL := 'RQPLANPURCHASE.DATEADD';

  RQPurchaseItemList :=
  TempRQPurchaseItem.getScrollableFilteredList(RQPurchaseItemFilterObj,0,-1);

   LastCount:=High(RQPurchaseItemList.list);

  if LastCount > -1 then
     sgRQPurchaseItem.RowCount:=LastCount+2
  else
     sgRQPurchaseItem.RowCount:=2;

   with sgRQPurchaseItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQPurchaseItemList.list[i].purchaseRefName;

        if RQPurchaseItemList.list[i].purchaseRefDateAdd = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTime2String(RQPurchaseItemList.list[i].purchaseRefDateAdd);

        if RQPurchaseItemList.list[i].countFree = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQPurchaseItemList.list[i].countFree.DecimalString;


        Cells[5,i+1] := RQPurchaseItemList.list[i].objectsName;  // названия объектов в строке

        LastRowPurchaseItem:=i+1;
        sgRQPurchaseItem.RowCount:=LastRowPurchaseItem+1;
      end;
   sgRQPurchaseItem.Row:=1;

end;

function TfrmRQPurchaseItemEdit.GetCheckedMaterialsCountFromEstimate: Double;
var i: Integer;
    state: Boolean;
    estimateCount, totalCount: Double;
begin
  Result := 0;
  totalCount := 0;
  state := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
      try
        estimateCount := StrToFloat(sgENEstimateItem.Cells[3, i]);
      except
        on EConvertError do Continue;
      end;

      totalCount := totalCount + estimateCount;
    end;
  end;

  Result := totalCount;
end;



function TfrmRQPurchaseItemEdit.GetCheckedMaterialsCountWithFreePurchaseItem: Double;
var i: Integer;
    state: Boolean;
    estimateCount, totalCount: Double;
begin
  Result := 0;
  totalCount := 0;
  state := false;

  for i := 1 to sgRQPurchaseItem.RowCount - 1 do
  begin
    sgRQPurchaseItem.GetCheckBoxState(4, i, state);
    if state then
    begin
      try
        estimateCount := StrToFloat(sgRQPurchaseItem.Cells[4, i]);
      except
        on EConvertError do Continue;
      end;

      totalCount := totalCount + estimateCount;
    end;
  end;

  Result := totalCount;
end;


end.
