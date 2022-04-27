
unit EditENFuelInventarization;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInventarizationController,
  AdvObj, ExtCtrls ;

type
  TfrmENFuelInventarizationEdit = class(TDialogForm)


  HTTPRIOENFuelInventarization: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    grpInv: TGroupBox;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    lblMolCode: TLabel;
    edtMolCode: TEdit;
    edtMolName: TEdit;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    edtCode: TEdit;
    lblCode: TLabel;
    grpItems: TGroupBox;
    HTTPRIOENFuelInventarizationItem: THTTPRIO;
    spbMOL: TSpeedButton;
    sgENFuelInventarizationItem: TAdvStringGrid;
    btnGenItems: TButton;
    btnSaveCountFact: TSpeedButton;
    btnReserve: TSpeedButton;
    btnClose: TSpeedButton;
    Splitter1: TSplitter;
    sgENFuelInvResult: TAdvStringGrid;
    Splitter2: TSplitter;
    HTTPRIOENFuelInvResult: THTTPRIO;
    sgRQFKOrder: TAdvStringGrid;
    HTTPRIORQFKOrder: THTTPRIO;
    Splitter3: TSplitter;
    sgENAct: TAdvStringGrid;
    HTTPRIOENAct: THTTPRIO;
    PopupOrd: TPopupMenu;
    mChangeDate: TMenuItem;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateItems();
  procedure updateResultItems();
  procedure updateFKOrders();
  procedure updateAct();
    procedure spbMOLClick(Sender: TObject);
    procedure btnGenItemsClick(Sender: TObject);
    procedure btnSaveCountFactClick(Sender: TObject);
    procedure btnReserveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure sgRQFKOrderDblClick(Sender: TObject);
    procedure sgENActClick(Sender: TObject);
    procedure mChangeDateClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFuelInventarizationEdit: TfrmENFuelInventarizationEdit;
  ENFuelInventarizationObj: ENFuelInventarization;



implementation

uses ENFuelInventarizationItemController, ShowFINMol, ENConsts,
  ENFuelInventarizationStatusController, ENFuelInvResultController,
  RQFKOrderController, EditRQFKOrder, ENActController, EditENAct, UpdateDate;


{uses  
    EnergyproController, EnergyproController2, ENFuelInventarizationController  ;
}
{$R *.dfm}

var
ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelInventarizationItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Автомобіль (гос.№, інв.№)'
          ,'Тип палива'
          ,'Подорожній лист (дата)'
          ,'обсяг з останнього ПЛ, л.'
          ,'обсяг фактичний, л.'
          ,'різниця, л.'
        );
  ENFuelInvResultHeaders: array [1..4] of String =
        ( 'Код'
          ,'Обсяг, л.'
          ,'Тип палива'
          ,'Тип ітога'
        );

  RQFKOrderHeaders: array [1..6] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
        );

  ENActHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата проведення акту'
          ,'Дата акту'
          ,'Код МОЛ / ФИО мола с фин.кол.'
          ,'Тип'
          ,'Статус'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

procedure TfrmENFuelInventarizationEdit.updateAct;
var
  TempENAct: ENActControllerSoapPort;
  i: Integer;
  ENActList: ENActShortList;
  actFilter : ENActFilter;
  begin

  ClearGrid(sgENAct);

  SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
  TempENAct :=  HTTPRIOENAct as ENActControllerSoapPort;


     actFilter := ENActFilter.Create;
     SetNullIntProps(actFilter);
     SetNullXSProps(actFilter);

     actFilter.conditionSQL := ' enact.code in (select distinct a2pw.actrefcode ' +
                               ' from enfuelinventarization fi, enfuelinvresult fr, ' +
                               ' enestimateitem ei , enplanwork pw, enact2enplanwork a2pw  ' +
                               ' where fi.code = fr.inventarizationrefcode ' +
                               ' and fr.estimateitemrefcode = ei.code ' +
                               ' and ei.planrefcode = pw.code ' +
                               ' and pw.code = a2pw.plancode ' +
                               ' and fi.code = ' + IntToStr(ENFuelInventarizationObj.code) + ')';

  ENActList := TempENAct.getScrollableFilteredList(actFilter,0,-1);


  LastCount:=High(ENActList.list);

  if LastCount > -1 then
     sgENAct.RowCount:=LastCount+2
  else
     sgENAct.RowCount:=2;

   with sgENAct do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActList.list[i].numberGen;
        if ENActList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActList.list[i].dateGen);

          if ENActList.list[i].dateAct = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENActList.list[i].dateAct);

        Cells[4,i+1] :=  ENActList.list[i].finMolCode + ' / ' +  ENActList.list[i].finMolName;

        Cells[5,i+1] := ENActList.list[i].actTypeRefName; //'';
        Cells[6, i+1] := ENActList.list[i].statusRefName;
        Cells[7, i+1] := ENActList.list[i].userGen;

        if ENActList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENActList.list[i].dateEdit);

        LastRow:=i+1;
        sgENAct.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAct.Row:=1;
end;

procedure TfrmENFuelInventarizationEdit.updateFKOrders;
var
TempRQFKOrder : RQFKOrderControllerSoapPort;
i: Integer;
orderList : RQFKOrderShortList;
orderFilter : RQFKOrderFilter;
begin

   ClearGrid(sgRQFKOrder);

   SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);

   TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

     orderFilter := RQFKOrderFilter.Create;
     SetNullIntProps(orderFilter);
     SetNullXSProps(orderFilter);

  orderFilter.conditionSQL := ' rqfkorder.code in ( select foi.fkorderrefcode ' +
                              ' from enfuelinvresult fr, rqfkorderitem foi ' +
                              ' where fr.fkorderitemrefcode = foi.code ' +
                              ' and fr.inventarizationrefcode = ' + IntToStr(ENFuelInventarizationObj.code) + ' ) ';

  orderList := TempRQFKOrder.getScrollableFilteredList(orderFilter,0,-1);

  LastCount:=High(orderList.list);

  if LastCount > -1 then
     sgRQFKOrder.RowCount:=LastCount+2
  else
     sgRQFKOrder.RowCount:=2;

   with sgRQFKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if orderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(orderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := orderList.list[i].numberDoc;
        if orderList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(orderList.list[i].dateGen);

          Cells[3,i+1] := orderList.list[i].molOutCode;
          Cells[4,i+1] := orderList.list[i].molOutName;
        Cells[5, i+1] := orderList.list[i].statusName;

        LastRow:=i+1;
        sgRQFKOrder.RowCount:=LastRow+1;
      end;
end;


procedure TfrmENFuelInventarizationEdit.updateResultItems();
var
  TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
  i: Integer;
  ENFuelInvResultList: ENFuelInvResultShortList;
  fuelInvResFilter : ENFuelInvResultFilter;
  begin

  ClearGrid(sgENFuelInvResult);
  SetGridHeaders(ENFuelInvResultHeaders, sgENFuelInvResult.ColumnHeaders);

  TempENFuelInvResult :=  HTTPRIOENFuelInvResult as ENFuelInvResultControllerSoapPort;

  fuelInvResFilter := ENFuelInvResultFilter.Create;
  SetNullIntProps(fuelInvResFilter);
  SetNullXSProps(fuelInvResFilter);

  fuelInvResFilter.inventarizationRef := ENFuelInventarizationRef.Create;
  fuelInvResFilter.inventarizationRef.code := ENFuelInventarizationObj.code;

  ENFuelInvResultList := TempENFuelInvResult.getScrollableFilteredList(fuelInvResFilter,0,-1);


  LastCount:=High(ENFuelInvResultList.list);

  if LastCount > -1 then
     sgENFuelInvResult.RowCount:=LastCount+2
  else
     sgENFuelInvResult.RowCount:=2;

   with sgENFuelInvResult do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
               if ENFuelInvResultList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelInvResultList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENFuelInvResultList.list[i].deltaCount = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENFuelInvResultList.list[i].deltaCount.DecimalString;

        Cells[2,i+1] := ENFuelInvResultList.list[i].fuelTypeRefName;

        Cells[3,i+1] :=  ENFuelInvResultList.list[i].typeRefName;

        LastRow:=i+1;
        sgENFuelInvResult.RowCount:=LastRow+1;


      end;
   sgENFuelInvResult.Row:=1;
end;


procedure TfrmENFuelInventarizationEdit.updateItems();
var
  TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
  i: Integer;
  ENFuelInventarizationItemList: ENFuelInventarizationItemShortList;
  ENFuelInvItemsFilter : ENFuelInventarizationItemFilter;
  begin

  ClearGrid(sgENFuelInventarizationItem);
  SetGridHeaders(ENFuelInventarizationItemHeaders, sgENFuelInventarizationItem.ColumnHeaders);

  sgENFuelInventarizationItem.Options := sgENFuelInventarizationItem.Options - [goColMoving];
  sgENFuelInventarizationItem.Options := sgENFuelInventarizationItem.Options + [goEditing];

  TempENFuelInventarizationItem :=  HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;

  ENFuelInvItemsFilter := ENFuelInventarizationItemFilter.Create;
  SetNullIntProps(ENFuelInvItemsFilter);
  SetNullXSProps(ENFuelInvItemsFilter);
  ENFuelInvItemsFilter.inventarizationRef := ENFuelInventarizationRef.Create;
  ENFuelInvItemsFilter.inventarizationRef.code := ENFuelInventarizationObj.code;

  ENFuelInventarizationItemList := TempENFuelInventarizationItem.getScrollableFilteredList(ENFuelInvItemsFilter,0,-1);


  LastCount:=High(ENFuelInventarizationItemList.list);

  if LastCount > -1 then
     sgENFuelInventarizationItem.RowCount:=LastCount+2
  else
     sgENFuelInventarizationItem.RowCount:=2;

   with sgENFuelInventarizationItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInventarizationItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelInventarizationItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFuelInventarizationItemList.list[i].transportRealRefName +
                        ENFuelInventarizationItemList.list[i].transportRealRefGosNumber + ' (' +
                        ENFuelInventarizationItemList.list[i].transportRealRefInvNumber + ')';
        CellProperties[1, i+1].ReadOnly := true;

        Cells[2,i+1] := ENFuelInventarizationItemList.list[i].fuelTypeRefName;
        CellProperties[2, i+1].ReadOnly := true;

        Cells[3,i+1] := ENFuelInventarizationItemList.list[i].travelSheetRefNumberGen + ' (' +
                        XSDate2String(ENFuelInventarizationItemList.list[i].travelSheetRefDateStart) + ' - ' +
                        XSDate2String(ENFuelInventarizationItemList.list[i].travelSheetRefDateFinal) + ')';
        CellProperties[3, i+1].ReadOnly := true;

        if ENFuelInventarizationItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENFuelInventarizationItemList.list[i].countGen.DecimalString;

        CellProperties[4, i+1].ReadOnly := true;

        if ENFuelInventarizationItemList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENFuelInventarizationItemList.list[i].countFact.DecimalString;

        CellProperties[5, i+1].ReadOnly := false;
        Colors[5, i+1] := clYellow;

        if ((ENFuelInventarizationItemList.list[i].countGen = nil) or (ENFuelInventarizationItemList.list[i].countFact = nil))  then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := FloatToStr(StrToFloat(ENFuelInventarizationItemList.list[i].countFact.DecimalString) -
                          StrToFloat(ENFuelInventarizationItemList.list[i].countGen.DecimalString));
          CellProperties[6, i+1].ReadOnly := True;

        LastRow:=i+1;
        sgENFuelInventarizationItem.RowCount:=LastRow+1;
      end;
   sgENFuelInventarizationItem.Row:=1;
end;


procedure TfrmENFuelInventarizationEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode, edtMolCode, edtMolName]);

  if DialogState = dsInsert then
  begin
   HideControls([grpItems, btnGenItems, btnReserve, btnSaveCountFact, btnClose]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtNumberGen, edtDateGen, edtMolCode, edtMolName]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_DRAFT then
      begin
      btnGenItems.Caption := 'Создать строки ведомости';
      DisableControls([btnSaveCountFact, btnReserve, btnClose]);
      DisableControls([btnGenItems],false);
      end;
      if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_ITEMS_GENERATED then
      begin
      btnGenItems.Caption := 'Удалить строки ведомости';
      DisableControls([btnReserve, btnClose]);
      DisableControls([btnGenItems, btnSaveCountFact],false);
      end;
      if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_FACT_QUANTITY_INSERTED then
      begin
      btnReserve.Caption := 'Зарезервировать';
      btnGenItems.Caption := 'Удалить строки ведомости';
      btnClose.Caption := 'Провести ведомость';
      DisableControls([btnClose]);
      DisableControls([btnGenItems, btnSaveCountFact, btnReserve],false);
      end;
      if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_FUEL_RESERVED then
      begin
      btnReserve.Caption := 'Отменить резервирование';
      btnGenItems.Caption := 'Удалить строки ведомости';
      btnClose.Caption := 'Провести ведомость';
      DisableControls([btnGenItems, btnSaveCountFact]);
      DisableControls([btnClose, btnReserve],false);
      end;
      if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_CLOSED then
      begin
      btnClose.Caption := 'Отменить проведение';
      DisableControls([btnGenItems, btnSaveCountFact, btnSaveCountFact, btnReserve]);
      DisableControls([btnClose],false);
      end;


      HideControls([grpItems],false);
      Self.updateItems();
      Self.updateResultItems();
      Self.updateFKOrders();
      Self.updateAct();
      DisableControls([edtDateGen]);

      edtCode.Text := IntToStr(ENFuelInventarizationObj.code);
    edtNumberGen.Text := ENFuelInventarizationObj.numberGen; 
      if ENFuelInventarizationObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENFuelInventarizationObj.dateGen.Year,ENFuelInventarizationObj.dateGen.Month,ENFuelInventarizationObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtMolCode.Text := ENFuelInventarizationObj.molCode; 
    edtMolName.Text := ENFuelInventarizationObj.molName; 
    MakeMultiline(edtCommentGen.Lines, ENFuelInventarizationObj.commentGen);
  end;

end;



procedure TfrmENFuelInventarizationEdit.mChangeDateClick(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  frmUpdateDate : TfrmUpdateDate;
  orderObj : RQFKOrder;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  frmUpdateDate:=TfrmUpdateDate.Create(Application,dsEdit);
   try
      with frmUpdateDate do
      begin
        if ShowModal = mrOk then
        begin
            try
             orderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));

             if edtDateGen.checked then
             begin
               if orderObj.dateGen = nil then
                  orderObj.dateGen := TXSDate.Create;
                  orderObj.dateGen.XSToNative(GetXSDate(edtDateGen.DateTime));
             end
             else
               orderObj.dateGen := nil;

            except
               on EConvertError do Exit;
            end;

           TempRQFKOrder.changeDate(orderObj);
        end;
      end;
      updateFKOrders;
   finally
      frmUpdateDate.Free;
   end;

end;

procedure TfrmENFuelInventarizationEdit.sgENActClick(Sender: TObject);
Var TempENAct: ENActControllerSoapPort;
begin
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
  frmENActEdit := TfrmENActEdit.Create(Application, dsView);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
    except
      on EConvertError  do Exit;
    end;

    frmENActEdit.ShowModal;

  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;
end;

procedure TfrmENFuelInventarizationEdit.sgRQFKOrderDblClick(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  frmRQFKOrderEditView : TfrmRQFKOrderEdit;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEditView:=TfrmRQFKOrderEdit.Create(Application, dsEdit);

  try
    try
      frmRQFKOrderEditView.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

     frmRQFKOrderEditView.ShowModal;

  finally
    frmRQFKOrderEditView.Free;
    frmRQFKOrderEditView:=nil;
  end;
end;

procedure TfrmENFuelInventarizationEdit.spbMOLClick(Sender: TObject);
var
 frmFINMolShow : TfrmFINMolShow;
begin
   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal);
   try
      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtMolCode.Text := GetReturnValue(sgFINMol,0);
               edtMolName.Text := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmENFuelInventarizationEdit.btnCloseClick(Sender: TObject);
var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
  inherited;
   TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;

   if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_FUEL_RESERVED then
   begin
       if Application.MessageBox(PChar('Ви дійсно бажаєте провести інвентарізацію залишків?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK
                         then
       TempENFuelInventarization.closeInventarization(ENFuelInventarizationObj.code);
   end
   else
   if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_CLOSED then
   begin
       if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення інвентарізації залишків?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK  then
       TempENFuelInventarization.cancelCloseInventarization(ENFuelInventarizationObj.code);
   end;

   ENFuelInventarizationObj :=  TempENFuelInventarization.getObject(ENFuelInventarizationObj.code);
   Self.FormShow(Sender);

end;

procedure TfrmENFuelInventarizationEdit.btnGenItemsClick(Sender: TObject);
var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
  inherited;
  TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;
  ENFuelInventarizationObj := TempENFuelInventarization.getObject(ENFuelInventarizationObj.code);

  if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_DRAFT then
  TempENFuelInventarization.generateInventarizationItems(ENFuelInventarizationObj);

  if ENFuelInventarizationObj.statusRef.code in
  [ENConsts.ENFUELINVENTARIZATION_STATUS_ITEMS_GENERATED, ENConsts.ENFUELINVENTARIZATION_STATUS_FACT_QUANTITY_INSERTED]  then
  TempENFuelInventarization.removeInventarizationItems(ENFuelInventarizationObj.code);

  ENFuelInventarizationObj := TempENFuelInventarization.getObject(ENFuelInventarizationObj.code);
  Self.FormShow(sender);
end;

procedure TfrmENFuelInventarizationEdit.btnReserveClick(Sender: TObject);
var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
  inherited;
   TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;

   if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_FACT_QUANTITY_INSERTED then
   begin
       if Application.MessageBox(PChar('Ви дійсно бажаєте зарезервувати паливо для інвентарізації залишків?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK
                         then
       TempENFuelInventarization.reserveItems(ENFuelInventarizationObj.code);
   end
   else
   if ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_FUEL_RESERVED then
   begin
       if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити резервування палива для інвентарізації залишків?'),
                        PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK  then
       TempENFuelInventarization.removeReserveItems(ENFuelInventarizationObj.code);
   end;

   ENFuelInventarizationObj :=  TempENFuelInventarization.getObject(ENFuelInventarizationObj.code);
   Self.FormShow(Sender);

end;

procedure TfrmENFuelInventarizationEdit.btnSaveCountFactClick(Sender: TObject);
Var TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
    TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
    iiArr : ArrayOfENFuelInventarizationItemShort;
    i, count: Integer ;
    s:string;

begin

 TempENFuelInventarizationItem := HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;


  if ((Application.MessageBox(PChar('Ви дійсно бажаєте зберегти фактичну кількість?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK)
                    and
                    ((ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_ITEMS_GENERATED) or
                     (ENFuelInventarizationObj.statusRef.code = ENConsts.ENFUELINVENTARIZATION_STATUS_FACT_QUANTITY_INSERTED)))  then
  begin

           setLength(iiArr,0);

         for i:= 1 to sgENFuelInventarizationItem.RowCount-1 do
           begin
             count := High(iiArr)+1;
             setLength(iiArr,count+1);
             iiArr[count] := ENFuelInventarizationItemShort.Create;
             iiArr[count].code := StrToInt(sgENFuelInventarizationItem.Cells[0,i]);
             iiArr[count].transportRealRefName := sgENFuelInventarizationItem.Cells[1,i];
             iiArr[count].inventarizationRefCode := ENFuelInventarizationObj.code;
             iiArr[count].fuelTypeRefName := sgENFuelInventarizationItem.Cells[2,i];
             iiArr[count].travelSheetRefNumberGen := sgENFuelInventarizationItem.Cells[3,i];
             iiArr[count].countGen := TXSDecimal.Create;
             iiArr[count].countGen.DecimalString := Trim(sgENFuelInventarizationItem.Cells[4,i]);
             iiArr[count].countFact := TXSDecimal.Create;
             iiArr[count].countFact.DecimalString := Trim(sgENFuelInventarizationItem.Cells[5,i]);

           end;
         ///
      TempENFuelInventarizationItem.saveCountFact(iiArr);

      TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;
      ENFuelInventarizationObj :=  TempENFuelInventarization.getObject(ENFuelInventarizationObj.code);
      Self.FormShow(Sender);
      Application.MessageBox(PChar('Фактична кількість збережена!'),
                    PChar('Увага !'),MB_OK);
  end;
end;

procedure TfrmENFuelInventarizationEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInventarization: ENFuelInventarizationControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen, edtDateGen, edtMolCode,  edtMolName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENFuelInventarization := HTTPRIOENFuelInventarization as ENFuelInventarizationControllerSoapPort;


     ENFuelInventarizationObj.numberGen := edtNumberGen.Text; 

     if edtdateGen.checked then
     begin
       if ENFuelInventarizationObj.dateGen = nil then
          ENFuelInventarizationObj.dateGen := TXSDateTime.Create;
       ENFuelInventarizationObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENFuelInventarizationObj.dateGen := nil;

     ENFuelInventarizationObj.molCode := edtMolCode.Text; 

     ENFuelInventarizationObj.molName := edtMolName.Text; 

     ENFuelInventarizationObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENFuelInventarizationObj.code:=low(Integer);
      TempENFuelInventarization.add(ENFuelInventarizationObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelInventarization.save(ENFuelInventarizationObj);
    end;
  end;
end;


end.