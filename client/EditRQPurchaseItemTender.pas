
unit EditRQPurchaseItemTender;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
    EnergyproController, EnergyproController2, RQPurchaseItemTenderController,
    AdvObj, TB2Item, TB2Dock, TB2Toolbar , RQTndIt2PrsIt2CntrctItController,
  ExtCtrls ;

type
    TfrmRQPurchaseItemTenderEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;


    HTTPRIORQPurchaseItemTender: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQPurchaseItem: THTTPRIO;
    PageControl1: TPageControl;
    tsTenderItem: TTabSheet;
    gbGeneral: TGroupBox;
    lblIdentid: TLabel;
    lblPurchaseName: TLabel;
    lblFinancingSource: TLabel;
    lblSumGenWithNds: TLabel;
    lblSumFactWithNds: TLabel;
    lblTentativeYearGen: TLabel;
    lblTentativeMonthGen: TLabel;
    spbSpravdkppitem: TSpeedButton;
    edtIdentid: TEdit;
    edtPurchaseName: TMemo;
    edtSumGenWithNds: TEdit;
    edtSumFactWithNds: TEdit;
    edtTentativeYearGen: TComboBox;
    edtTentativeMonthGen: TComboBox;
    sgRQPurchaseItem: TAdvStringGrid;
    Label4: TLabel;
    gbEnContract: TGroupBox;
    ImageList1: TImageList;
    edtFinancingSource: TEdit;
    lblIdentid2: TLabel;
    edtIdentid2: TEdit;
    TBToolbar3: TTBToolbar;
    TBItemEnContractAdd: TTBItem;
    TBItemEnContractEdit: TTBItem;
    TBItemEnContractDelete: TTBItem;
    TBItemEnContractUpdate: TTBItem;
    HTTPRIOENContract: THTTPRIO;
    sgENContract: TAdvStringGrid;
    TBItemEnContractAddPrresent: TTBItem;
    actioListContractItem: TActionList;
    actViewContractItem: TAction;
    actInsertContractItem: TAction;
    actDeleteContractItem: TAction;
    actEditContractItem: TAction;
    actUpdateContractItem: TAction;
    actFilterContractItem: TAction;
    actNoFilterContractItem: TAction;
    PopupMenuContractItem: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    HTTPRIOENContractItem: THTTPRIO;
    btnMakeContractItemFromPurchaseItem: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENContractItem: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label9: TLabel;
    TBToolbar6: TTBToolbar;
    TBItem13: TTBItem;
    sgENEstimateItemInContract: TAdvStringGrid;
    HTTPRIOENEstimateItem: THTTPRIO;
    PopupMenuEstimate2ContractItem: TPopupMenu;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    N16: TMenuItem;
    miEstimate2ProjectAgreeRemoveFromSpecification: TMenuItem;
    miEstimateWithContractUnLink2Contract: TMenuItem;
    ActionListEstimate2ContractItem: TActionList;
    actEstimate2ContractItemUpdate: TAction;
    actEstimate2ProjectAgreeUnlink: TAction;
    actEstimateWithContractUnLink2Contract: TAction;
    edtNameItemType: TEdit;
    lblNameItemType: TLabel;
    spbItemType: TSpeedButton;
    chkShowContractByMaterialPurchaseitem: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUpdateItemExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgRQPurchaseItemDblClick(Sender: TObject);
    procedure spbSpravdkppitemClick(Sender: TObject);
    procedure TBItemEnContractAddClick(Sender: TObject);
    procedure TBItemEnContractUpdateClick(Sender: TObject);
    procedure TBItemEnContractAddPrresentClick(Sender: TObject);
    procedure btnMakeContractItemFromPurchaseItemClick(Sender: TObject);
    procedure actUpdateContractItemExecute(Sender: TObject);
    procedure sgENContractClick(Sender: TObject);
    procedure actDeleteContractItemExecute(Sender: TObject);
    procedure actEstimate2ContractItemUpdateExecute(Sender: TObject);
    procedure sgENContractItemClick(Sender: TObject);
    procedure spbItemTypeClick(Sender: TObject);


  private
    { Private declarations }
    ColCountEnContract : Integer;
    LastCountEnContract : Integer;
    LastRowEnContract : Integer;
  public
    isSplitItemTender: Boolean;
    { Public declarations }

end;

var
  frmRQPurchaseItemTenderEdit: TfrmRQPurchaseItemTenderEdit;
  RQPurchaseItemTenderObj: RQPurchaseItemTender;

  LastRowPurchaseItem: Integer = 1;
//  RQPurchaseItemHeaders: array [1..10] of String =
//        ( 'Код'
//          ,'Код ДК 2010'
//          ,'Код ДК 2015'
//          ,'Назва матеріалу'
//          ,'Од.виміру'
//          ,'Ціна з НДС'
//          ,'Кількість'
//          ,'Вартість з ПДВ '
//          ,'Користувач що вніс зміни'
//          ,'Примітка'
//        );



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

        ENContractHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Дата закінчення договору'
          ,'Постачальник'  // 5
          ,'Код договору у фін.кол.'
          ,'PK договору у фін.кол.'
          ,'Пользователь внесший изменение'
          ,'Дата последнего изменения'
        );

        ENContractItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість за договором'
          ,'Неприв`язана кількість'
          ,'Ціна'
          ,'Вартість'
          ,'Користувач'
					,'Дата зміни'
					,'Кількість фактична'
        );

        ENEstimateItemInContractHeaders: array [1..13] of String =
        ( 'Код'
          ,'Матеріал'
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
          ,'Інформація про план закупок'
        );


implementation


uses
  RQPurchaseItemController, EditRQPurchaseItem,
  RQSpravDKPPController, ShowRQSpravDKPPItem, ENContractController,
  EditENContract, ShowENContract, EditRQTndIt2PrsIt2CntrctIt,
  ENContractItemController, RQPurchaseItemTender2RQPurchaseItemController,
  ENContractTypeController, ENEstimateItemController, ENPlanWorkController,
  TKMaterialsController, ShowRQPurchaseItemType, RQPurchaseItemTypeController;

{$R *.dfm}



procedure TfrmRQPurchaseItemTenderEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode , edtNameItemType ]);
  SetFloatStyle([edtSumGenWithNds , edtSumFactWithNds]);

  SetGridHeaders(ENContractHeaders, sgENContract.ColumnHeaders);
  SetGridHeaders(ENContractItemHeaders, sgENContractItem.ColumnHeaders);
  SetGridHeaders(ENEstimateItemInContractHeaders, sgENEstimateItemInContract.ColumnHeaders);

  DisableControls([chkShowContractByMaterialPurchaseitem], false);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPurchaseName
      ,edtFinancingSource
      ,edtSumGenWithNds
      ,edtSumFactWithNds
      , edtTentativeYearGen
      , edtTentativeMonthGen
      , edtIdentid
      , edtIdentid2
     ]);

    DisableControls([edtIdentid , edtSumGenWithNds , edtSumFactWithNds ]);

    SetComboBoxCurrentYearWithStart(edtTentativeYearGen, 2009, 2);
    SetComboBoxCurrentMonth(edtTentativeMonthGen);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if (isSplitItemTender) then
    begin
      DisableControls([gbGeneral]);
    end;


    edtCode.Text := IntToStr(RQPurchaseItemTenderObj.code);
    edtIdentid.Text := RQPurchaseItemTenderObj.identid;
    edtIdentid2.Text := RQPurchaseItemTenderObj.identid2;

    MakeMultiline(edtPurchaseName.Lines, RQPurchaseItemTenderObj.purchaseName);
   // MakeMultiline(edtFinancingSource.Lines, RQPurchaseItemTenderObj.financingSource);
    edtFinancingSource.Text := RQPurchaseItemTenderObj.financingSource;

    if ( RQPurchaseItemTenderObj.sumGenWithNds <> nil ) then
       edtSumGenWithNds.Text := RQPurchaseItemTenderObj.sumGenWithNds.decimalString
    else
       edtSumGenWithNds.Text := '';
    if ( RQPurchaseItemTenderObj.sumFactWithNds <> nil ) then
       edtSumFactWithNds.Text := RQPurchaseItemTenderObj.sumFactWithNds.decimalString
    else
       edtSumFactWithNds.Text := '';

    if ( RQPurchaseItemTenderObj.tentativeYearGen  <> Low(Integer) ) then
      edtTentativeYearGen.ItemIndex := RQPurchaseItemTenderObj.tentativeYearGen - 2009
    else
      edtTentativeYearGen.ItemIndex := -1;

    if ( RQPurchaseItemTenderObj.tentativeMonthGen <> Low(Integer) ) then
      edtTentativeMonthGen.ItemIndex := RQPurchaseItemTenderObj.tentativeMonthGen - 1
    else
      edtTentativeMonthGen.ItemIndex := -1;

      actUpdateItemExecute(Sender);
      TBItemEnContractUpdateClick(Sender);

  end;




end;


procedure TfrmRQPurchaseItemTenderEdit.sgENContractClick(Sender: TObject);
begin
  inherited;
    actUpdateContractItemExecute(Sender);

end;

procedure TfrmRQPurchaseItemTenderEdit.sgENContractItemClick(Sender: TObject);
begin
  // inherited;
  actEstimate2ContractItemUpdateExecute(Sender);
end;

procedure TfrmRQPurchaseItemTenderEdit.sgRQPurchaseItemDblClick(
  Sender: TObject);
 Var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;

begin

 TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemObj := TempRQPurchaseItem.getObject(StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]));
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

end;


procedure TfrmRQPurchaseItemTenderEdit.spbItemTypeClick(Sender: TObject);
var
   frmrqItemTypeShow : TfrmRQPurchaseItemTypeShow;
begin


   frmrqItemTypeShow := TfrmRQPurchaseItemTypeShow.Create(Application, fmNormal);
   try
     with frmrqItemTypeShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           edtNameItemType.Text := GetReturnValue(sgRQPurchaseItemType, 1) ;
           RQPurchaseItemTenderObj.purchaseItemTypeRef := RQPurchaseItemTypeRef.Create;
           RQPurchaseItemTenderObj.purchaseItemTypeRef.code := StrToInt( GetReturnValue(sgRQPurchaseItemType, 0) );
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmrqItemTypeShow.Free;
   end;
end;

procedure TfrmRQPurchaseItemTenderEdit.spbSpravdkppitemClick(
  Sender: TObject);
var
   frmrqspravdkppitemSfow : TfrmRQSpravDKPPItemShow;
begin


   frmrqspravdkppitemSfow := TfrmRQSpravDKPPItemShow.Create(Application, fmNormal);
   try
     with frmrqspravdkppitemSfow do
     begin
       if ShowModal = mrOk then
       begin
         try
           edtPurchaseName.Text := GetReturnValue(sgRQSpravDKPPItem, 2) ;
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmrqspravdkppitemSfow.Free;
   end;
end;

procedure TfrmRQPurchaseItemTenderEdit.btnMakeContractItemFromPurchaseItemClick(Sender: TObject);
// Var TempRQTndIt2PrsIt2CntrctIt: RQTndIt2PrsIt2CntrctItControllerSoapPort;
begin

  RQTndIt2PrsIt2CntrctItObj:=RQTndIt2PrsIt2CntrctIt.Create;
  SetNullIntProps(RQTndIt2PrsIt2CntrctItObj);
  SetNullXSProps(RQTndIt2PrsIt2CntrctItObj);


  RQTndIt2PrsIt2CntrctItObj.tndIt2PrsItRef :=  RQPurchaseItemTender2RQPurchaseItemRef.Create;
  try
  RQTndIt2PrsIt2CntrctItObj.tndIt2PrsItRef.code := StrToInt( sgRQPurchaseItem.Cells[0, sgRQPurchaseItem.Row]);
   except
   on EConvertError do Exit;
  end;


   try
     RQTndIt2PrsIt2CntrctItObj.enContractCode := StrToInt( sgENContract.Cells[0 ,sgENContract.Row ]);
   except
   on EConvertError do Exit;
  end;


  try
    frmRQTndIt2PrsIt2CntrctItEdit:=TfrmRQTndIt2PrsIt2CntrctItEdit.Create(Application, dsInsert);
    frmRQTndIt2PrsIt2CntrctItEdit.edtCountGen.Text :=  sgRQPurchaseItem.Cells[9 , sgRQPurchaseItem.Row];
    frmRQTndIt2PrsIt2CntrctItEdit.edtPrice.Text :=  sgRQPurchaseItem.Cells[8 , sgRQPurchaseItem.Row];
    frmRQTndIt2PrsIt2CntrctItEdit.lblinfo.Caption := 'Додавання строки до договору ' + sgENContract.Cells[1 , sgENContract.Row];
    try
      if frmRQTndIt2PrsIt2CntrctItEdit.ShowModal = mrOk then
      begin
        if RQTndIt2PrsIt2CntrctItObj<>nil then
            //TempRQTndIt2PrsIt2CntrctIt.add(RQTndIt2PrsIt2CntrctItObj);

            actUpdateContractItemExecute(sender);
      end;
    finally
      frmRQTndIt2PrsIt2CntrctItEdit.Free;
      frmRQTndIt2PrsIt2CntrctItEdit:=nil;
    end;
  finally
    RQTndIt2PrsIt2CntrctItObj.Free;
  end;
end;

procedure TfrmRQPurchaseItemTenderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  i, n, m: integer;
  state, isSel: Boolean;
  planPurchaseItemCodes: RQPurchaseItemTenderController.ArrayOfInteger;
  TempRQPurchaseItemTender: RQPurchaseItemTenderControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtPurchaseName
      ,edtFinancingSource
      ,edtSumGenWithNds
      ,edtSumFactWithNds
     ]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempRQPurchaseItemTender := HTTPRIORQPurchaseItemTender as RQPurchaseItemTenderControllerSoapPort;

    RQPurchaseItemTenderObj.identid := edtIdentid.Text;
    RQPurchaseItemTenderObj.identid2 := edtIdentid2.Text;
    RQPurchaseItemTenderObj.purchaseName := edtPurchaseName.Text;
    RQPurchaseItemTenderObj.financingSource := edtFinancingSource.Text;

    if (RQPurchaseItemTenderObj.sumGenWithNds = nil ) then
      RQPurchaseItemTenderObj.sumGenWithNds := TXSDecimal.Create;

    if edtSumGenWithNds.Text <> '' then
      RQPurchaseItemTenderObj.sumGenWithNds.decimalString := edtSumGenWithNds.Text
    else
      RQPurchaseItemTenderObj.sumGenWithNds := nil;

    if (RQPurchaseItemTenderObj.sumFactWithNds = nil ) then
      RQPurchaseItemTenderObj.sumFactWithNds := TXSDecimal.Create;
    if edtSumFactWithNds.Text <> '' then
      RQPurchaseItemTenderObj.sumFactWithNds.decimalString := edtSumFactWithNds.Text
    else
      RQPurchaseItemTenderObj.sumFactWithNds := nil;

    if (edtTentativeYearGen.ItemIndex >= 0) then
      RQPurchaseItemTenderObj.tentativeYearGen := edtTentativeYearGen.ItemIndex + 2009
    else
      RQPurchaseItemTenderObj.tentativeYearGen := Low(Integer) ;

    if (edtTentativeMonthGen.ItemIndex >= 0) then
      RQPurchaseItemTenderObj.tentativeMonthGen := edtTentativeMonthGen.ItemIndex + 1
    else
      RQPurchaseItemTenderObj.tentativeMonthGen := Low(Integer) ;

   
    if DialogState = dsInsert then
    begin
      RQPurchaseItemTenderObj.code:=low(Integer);
      TempRQPurchaseItemTender.add(RQPurchaseItemTenderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      if (isSplitItemTender) then
      begin
        state := False;
        isSel := False;

        n := 0;
        m := 0;

        for i:=1 to sgRQPurchaseItem.RowCount - 1 do
        begin
          sgRQPurchaseItem.GetCheckBoxState(1,i,state);
          if state then
          begin
            isSel := True;
            SetLength(planPurchaseItemCodes, m + 1);
            m := m + 1;
            planPurchaseItemCodes[n] := StrToInt(sgRQPurchaseItem.Cells[0, i]);
            n := n + 1;
          end;
        end;

        if not isSel then
        begin
          Application.MessageBox(PChar('Нічого не вибрано!!!'), PChar('Увага!'),MB_ICONWARNING);
          Exit;
        end;

        if Application.MessageBox(PChar('Обрані строки буде перенесено на нову позицію плану закупок!'),
                                PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
        begin
          TempRQPurchaseItemTender.splitItemTender(RQPurchaseItemTenderObj.code, planPurchaseItemCodes);
          ModalResult := mrOk;
        end;

      end
      else
        TempRQPurchaseItemTender.save(RQPurchaseItemTenderObj);
    end;
  end;
end;


procedure TfrmRQPurchaseItemTenderEdit.FormCreate(Sender: TObject);
begin
  inherited;
  BorderStyle:= bsSizeable;
  isSplitItemTender := False;
end;


procedure TfrmRQPurchaseItemTenderEdit.TBItemEnContractAddPrresentClick(Sender: TObject);
var
   frmENContractShow: TfrmENContractShow;
   ENContractobj : ENContract;
   TempENContract: ENContractControllerSoapPort;

begin

   frmENContractShow:=TfrmENContractShow.Create(Application,fmNormal);
   TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
   try
      with frmENContractShow do
        if ShowModal = mrOk then
        begin
            try
               ENContractobj:=ENContract.Create;
               try
                 ENContractObj := TempENContract.getObject(StrToInt(sgENContract.Cells[0,sgENContract.Row]));
               except
               on EConvertError do Exit;
              end;
               ENContractObj.purchaseItemTender.code := RQPurchaseItemTenderObj.code;

               TempENContract.save(ENContractObj);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENContractShow.Free;
   end;
      TBItemEnContractUpdateClick(Sender);
end;

procedure TfrmRQPurchaseItemTenderEdit.TBItemEnContractAddClick(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
begin
  TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
  ENContractObj:=ENContract.Create;

   ENContractObj.contractDate:= TXSDate.Create;
   ENContractObj.dateEdit:= TXSDate.Create;

//  код тендорной строки для записи в связку   RQTNDIT2PRSIT2CNTRCTIT после заполнения связки можно обнолить , он там не нужен
// так как к одной строке тендерной может относится много договоров .
   ENContractObj.purchaseItemTender := RQPurchaseItemTender.Create;
   ENContractObj.purchaseItemTender.code := RQPurchaseItemTenderObj.code;

   ENContractObj.contractType := ENContractType.Create;
   ENContractObj.contractType.code := ENConsts.ENCONTRACTTYPE_AGREE;



  try
    frmENContractEdit:=TfrmENContractEdit.Create(Application, dsInsert);
    frmENContractEdit.Panel2.Visible := false;
    try
      if frmENContractEdit.ShowModal = mrOk then
      begin
        if ENContractObj<>nil then
            TBItemEnContractUpdateClick(Sender);
      end;
    finally
      frmENContractEdit.Free;
      frmENContractEdit:=nil;
    end;
  finally
    ENContractObj.Free;
  end;
end;

procedure TfrmRQPurchaseItemTenderEdit.TBItemEnContractUpdateClick(
  Sender: TObject);
var
  TempENContract: ENContractControllerSoapPort;
  i , a , j , PurchaseItemCode : Integer;
  ENContractList: ENContractShortList;
  encontractfil : ENContractFilter;
  begin
  for a:=1 to sgENContract.RowCount-1 do
   for j:=0 to sgENContract.ColCount-1 do
    begin
     sgENContract.Cells[j,a]:='';
    end;


  SetGridHeaders(ENContractHeaders, sgENContract.ColumnHeaders);
  ColCountEnContract:=100;
  TempENContract :=  HTTPRIOENContract as ENContractControllerSoapPort;


     encontractfil := ENContractFilter.Create;
     SetNullIntProps(encontractfil);
     SetNullXSProps(encontractfil);


 // encontractfil.purchaseItemTender := RQPurchaseItemTender.Create;
 // encontractfil.purchaseItemTender.code := RQPurchaseItemTenderObj.code;

  if chkShowContractByMaterialPurchaseitem.Checked then
  begin
       try
        PurchaseItemCode := StrToInt(sgRQPurchaseItem.Cells[0,sgRQPurchaseItem.Row]);
       except
          on EConvertError do Exit;
       end;
    encontractfil.conditionSQL := 'encontract.code in ( select itt2ct.contractrefcode from rqpurchstmtndr2ncntrct itt2ct where itt2ct.purchaseitemtenderrfcd = '+
    IntToStr(RQPurchaseItemTenderObj.code) + ')   and   encontract.code in ( select distinct ci.contractcode from encontractitem ci where ' +
   ' ci.materialcode = ( select pi.materialrefcode from rqpurchaseitem pi where pi.code = '  + IntToStr(PurchaseItemCode)  + ' ) )  ';

  end
  else
   encontractfil.conditionSQL := ' encontract.code in ( select itt2ct.contractrefcode from rqpurchstmtndr2ncntrct itt2ct where itt2ct.purchaseitemtenderrfcd = '+
       IntToStr(RQPurchaseItemTenderObj.code) + ' )'  ;


  ENContractFilter(encontractfil).orderBySQL := 'contractdate desc ';

  ENContractList := TempENContract.getScrollableFilteredList(ENContractFilter(encontractfil),0,ColCountEnContract);


  LastCountEnContract:=High(ENContractList.list);

  if LastCountEnContract > -1 then
     sgENContract.RowCount:=LastCountEnContract+2
  else
     sgENContract.RowCount:=2;
          Application.ProcessMessages;
   with sgENContract do
    for i:=0 to LastCountEnContract do
      begin

        if ENContractList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractList.list[i].code)
        else
          Cells[0,i+1] := '';

          Cells[1,i+1] := ENContractList.list[i].contractNumber;

        if ENContractList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENContractList.list[i].contractDate);

        if ENContractList.list[i].contractEndDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENContractList.list[i].contractEndDate);

          Cells[4,i+1] := ENContractList.list[i].orgName;

          Cells[5,i+1] := ENContractList.list[i].finDocCode;

        if ENContractList.list[i].finDocID = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENContractList.list[i].finDocID);

          Cells[7,i+1] := ENContractList.list[i].userGen;

        if ENContractList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENContractList.list[i].dateEdit);

        LastRowEnContract:=i+1;
        sgENContract.RowCount:=LastRowEnContract+1;
      end;
   ColCountEnContract:=ColCountEnContract+1;
   sgENContract.Row:=1;

end;

procedure TfrmRQPurchaseItemTenderEdit.actDeleteContractItemExecute(
  Sender: TObject);
Var TempENContractItem: ENContractItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContractItem := HTTPRIOENContractItem as ENContractItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContractItem.Cells[0,sgENContractItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Позиція договору) ??? Материалы которые подвязаны к этому договору будут отвязаны !!! '),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContractItem.remove(ObjCode);
      actUpdateContractItemExecute(Sender);
  end;
end;

procedure TfrmRQPurchaseItemTenderEdit.actEstimate2ContractItemUpdateExecute(
  Sender: TObject);
var
    i, code : Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    eFilter : ENEstimateItemFilter;
    pFilter : ENPlanWorkFilter;
    conditionSQL, planCondition , eCondition : String;
    ////
    currentCount, totalCount: Double;
    materialInContractCode : Integer;
    finDocID: Integer;
begin
   materialInContractCode := LOW_INT;
   ClearGrid(sgENEstimateItemInContract);

   currentCount := 0;
   totalCount := 0;

   TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

   try
     materialInContractCode:= Integer( sgENContractItem.Objects[1,sgENContractItem.Row]);
   except
     on EConvertError do Exit;
   end;

   try
     finDocID:= StrToInt( sgENContract.Cells[6,sgENContract.Row] ) ; // не двигать колонку - берется код договора
   except
     on EConvertError do Exit;
   end;



    if materialInContractCode > LOW_INT then
    begin
      eFilter.materialRef := TKMaterialsRef.Create;
      eFilter.materialRef.code := materialInContractCode;
    end;

      eFilter.conditionSQL :=  ' enestimateitem2contrct.findocid = ' + IntToStr(finDocID) ;

    /////
    eFilter.orderBySQL := ' SM.NAME, ENPLANWORK.DATESTART, ENESTIMATEITEMTYPE.CODE';

    Application.ProcessMessages;
    // в ЭТОМ методе обрабатываються НЕ все поля фильтра плана !!!!

    pFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(pFilter);
    SetNullXSProps(pFilter);

    ENEstimateItemList := TempENEstimateItem.getDetailedEstimate2ContractList(eFilter, pFilter);

    if High(ENEstimateItemList.list) > -1 then
      sgENEstimateItemInContract.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgENEstimateItemInContract.RowCount := 2;

     with sgENEstimateItemInContract do
       for i := 0 to High(ENEstimateItemList.list) do
       begin


         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         // в объекте лежит код связки RQPurchaseItem2EstimateItem ( с него добавили естимейты в проект договора , или в договор )
         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].purchaseItem2EstimateitemCode);

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

         Objects[1,i+1] := TObject(ENEstimateItemList.list[i].statusRefCode);

        //  AddCheckBox(1, i+1, false, false);

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

         Cells[12 ,i+1 ] := ENEstimateItemList.list[i].purchaseInfoByOrderItem;

         sgENEstimateItemInContract.RowCount := i + 2;
       end;

     sgENEstimateItemInContract.Row := 1;

end;

procedure TfrmRQPurchaseItemTenderEdit.actUpdateContractItemExecute(Sender: TObject);
 Var i, j , EnContractObjCode : Integer;
  TempENContractItem: ENContractItemControllerSoapPort;
  ENContractItemList: ENContractItemShortList;
  ColCountEnContractItem  , LastCountEnContractItem , LastRowEnContractItem : Integer;
  ENContractItemFilterObj : ENContractItemFilter;
begin
  inherited;
 for i:=1 to sgENContractItem.RowCount-1 do
   for j:=0 to sgENContractItem.ColCount-1 do
     sgENContractItem.Cells[j,i]:='';

   EnContractObjCode := LOW_INT;

    try
     EnContractObjCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
    except
     on EConvertError do Exit;
    end;



  ColCountEnContractItem:=10000;
  TempENContractItem :=  HTTPRIOENContractItem as ENContractItemControllerSoapPort;

   ENContractItemFilterObj := ENContractItemFilter.Create;
   SetNullIntProps(ENContractItemFilterObj);
   SetNullXSProps(ENContractItemFilterObj);


  if EnContractObjCode <> LOW_INT then
   begin
     ENContractItemFilterObj.contract := ENContract.Create;
     ENContractItemFilterObj.contract.code := EnContractObjCode;
   end;

  ENContractItemList := TempENContractItem.getScrollableFilteredList(ENContractItemFilterObj,0,ColCountEnContractItem);


  LastCountEnContractItem:=High(ENContractItemList.list);

  if LastCountEnContractItem > -1 then
     sgENContractItem.RowCount:=LastCountEnContractItem + 2
  else
     sgENContractItem.RowCount:=2;


   with sgENContractItem do
    for i:=0 to LastCountEnContractItem do
      begin

        if ENContractItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractItemList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENContractItemList.list[i].materialName;

        Objects[1,i+1] := TObject(ENContractItemList.list[i].materialCode);

        if ENContractItemList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENContractItemList.list[i].countGen.DecimalString;

       if ENContractItemList.list[i].countbinded = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := FloatToStr(strtofloat(ENContractItemList.list[i].countGen.DecimalString)
                         - strtofloat(ENContractItemList.list[i].countbinded.DecimalString)
                         );

        if ENContractItemList.list[i].price = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENContractItemList.list[i].price.DecimalString;

        if ENContractItemList.list[i].cost = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENContractItemList.list[i].cost.DecimalString;
        Cells[6,i+1] := ENContractItemList.list[i].userGen;
        if ENContractItemList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
					Cells[7,i+1] := XSDate2String(ENContractItemList.list[i].dateEdit);

					if ENContractItemList.list[i].countReal = nil then
					Cells[8,i+1] := ''
				else
					Cells[8,i+1] := ENContractItemList.list[i].countReal.DecimalString;

        LastRowEnContractItem:=i+1;
        sgENContractItem.RowCount:=LastRowEnContractItem+1;
      end;
   ColCountEnContractItem:= ColCountEnContractItem+1;
   sgENContractItem.Row:= 1;

         actEstimate2ContractItemUpdateExecute(Sender);

end;

procedure TfrmRQPurchaseItemTenderEdit.actUpdateItemExecute(Sender: TObject);
var
  i, h, j, LastCount: Integer;
   TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
   RQPurchaseItemList: RQPurchaseItemShortList;
   planPurchaseItemFilter: RQPurchaseItemFilter;
begin

if isSplitItemTender then
   sgRQPurchaseItem.Options := sgRQPurchaseItem.Options + [goEditing]
   else
   sgRQPurchaseItem.Options := sgRQPurchaseItem.Options - [goEditing];

  if (RQPurchaseItemTenderObj.code = LOW_INT) then Exit;

  SetGridHeaders(RQPurchaseItemHeaders, sgRQPurchaseItem.ColumnHeaders);
  TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;

  planPurchaseItemFilter := RQPurchaseItemFilter.Create;
  SetNullIntProps(planPurchaseItemFilter);
  SetNullXSProps(planPurchaseItemFilter);

  planPurchaseItemFilter.conditionSQL := ' RQPurchaseItem.code in ( ' +
    ' select pu.purchaseitemrefcode from rqprchstmtndr2rqprchst pu ' +
    '  where pu.purchaseitemtenderrfcd = ' + IntToStr(RQPurchaseItemTenderObj.code) + ')';

  planPurchaseItemFilter.orderBySQL := 'TKMATERIALS.NAME';

  RQPurchaseItemList := TempRQPurchaseItem.getScrollableFilteredList(planPurchaseItemFilter, 0, -1);

  LastCount:=High(RQPurchaseItemList.list);

  if LastCount > -1 then
    sgRQPurchaseItem.RowCount:=LastCount+2
  else
    sgRQPurchaseItem.RowCount:=2;
    Application.ProcessMessages;
  with sgRQPurchaseItem do
  for i:=0 to LastCount do
    begin

        if RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQPurchaseItemList.list[i].identid2010;
        Cells[2,i+1] := RQPurchaseItemList.list[i].identid2015;

        Cells[3,i+1] := RQPurchaseItemList.list[i].materialNameGen;

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

        //////------- скориговано
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

        ///

        Cells[11,i+1] := RQPurchaseItemList.list[i].purchaseItemTypeRefName;
        // не менять //
        Objects[11,i+1] := TObject(RQPurchaseItemList.list[i].purchaseItemTypeRefCode);// код типа закупки

        Cells[12,i+1] := RQPurchaseItemList.list[i].userGen;

        Cells[13,i+1] := RQPurchaseItemList.list[i].objectsName;  // названия объектов в строке
      if (isSplitItemTender) then
        AddCheckBox(1, i+1, False, False);

      LastRowPurchaseItem:=i+1;
      sgRQPurchaseItem.RowCount:=LastRowPurchaseItem+1;
    end;
  sgRQPurchaseItem.Row:=1;

end;


end.