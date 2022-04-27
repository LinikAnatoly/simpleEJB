
unit EditENTravelSheetItemSearch;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemController,
  TB2Item, TB2Dock, TB2Toolbar

  ,ENTravelSheetController, ExtCtrls, AdvObj
  
  ;

type
  TfrmENTravelSheetItemEditSearch = class(TDialogForm)


  HTTPRIOENTravelSheetItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblDateStart: TLabel;
    edtDateStart: TDateTimePicker;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    lblWorkOrderNumber: TLabel;
    edtWorkOrderNumber: TEdit;
    btnSearchTransport: TButton;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    HTTPRIOENTransportItem: THTTPRIO;
    btnSaveItems: TButton;
    HTTPRIOENTravelSheet: THTTPRIO;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    actSelectAll: TAction;
    actUnSelectAll: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    spbENElementClear: TSpeedButton;
    lblMolName: TLabel;
    edtMolName: TEdit;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    HTTPRIOENPlanWork: THTTPRIO;
    spbDepartmentClear: TSpeedButton;
    chkBinded: TCheckBox;
    lblDateFinal: TLabel;
    edtDateFinal: TDateTimePicker;
    Panel1: TPanel;
    grENTransportItems: TGroupBox;
    sgENTransportItem: TAdvStringGrid;
    gbTransportItemsDetail: TGroupBox;
    Splitter1: TSplitter;
    sgENTransportItemDetailed: TAdvStringGrid;
    isShowDetail: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENElementClick(Sender: TObject);
  procedure updateENTransportGrid();
  procedure updateENTransportDetailedGrid();
  
    procedure FormCreate(Sender: TObject);
    procedure btnSearchTransportClick(Sender: TObject);
    procedure btnSaveItemsClick(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actUnSelectAllExecute(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure sgENTransportItemDblClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);

    function  getCondition() : string;
    procedure sgENTransportItemCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sgENTransportItemClick(Sender: TObject);
    procedure isShowDetailClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    elementCode : Integer;
    departmentCode : Integer;
    molCode : string;
    itemKind : Integer;
    travelSheetCode : Integer;
    travelSheetObj : ENTravelSheet;
end;

var
  frmENTravelSheetItemEditSearch: TfrmENTravelSheetItemEditSearch;
  //ENTravelSheetItemObj: ENTravelSheetItem;

   ENTransportItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Об"єкт плана'
          ,'Майстер'
          ,'Виконавець'
          ,'Транспорт нормативний'
          ,'Тип транспорту'
          //,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Відстані, км'
          ,'№ наряду'
          ,'Дата наряду'
          //,'Код роботи'
          //,'Робота'
          //,'Кількость робіт'
          //,'Ціна нормочасу'
          //,'Вартість нормочасу'


          //,'Користувач що вніс зміни'
          //,'Дата останньої зміни'
        );

   ENTransportItemDetailedHeaders: array [1..12] of String =
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Транспорт штатний'
          ,'Робітник'
          ,'№ та дата наряду'//'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Код роботи'
          ,'Робота'
          //,'Ціна нормочасу'
          //,'Вартість нормочасу'
          ,'Тип транспорту'
          ,'Відстані, км'
          ,'Користувач що вніс зміни'
          ,'Дата останньої зміни'
        );

implementation

uses
  ShowENElement, ENElementController, ENConsts, ENTransportItemController, 
  ShowEPDepartment, ShowENDepartment, 
  ENDepartmentController, DMReportsUnit, ShowFINMol, FINMolController,
  EditENPlanWork, ENPlanWorkController, TKTransportController,
  TKTransportTypeController;


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemController  ;
}
{$R *.dfm}

function  TfrmENTravelSheetItemEditSearch.getCondition() : string;
var sql1 : string;
begin

  sql1 := '';
  if (itemKind = TRAVELITEM_KIND_PLAN) then
    /// 18.02.11 С черновых планов тоже даем выбирать, но будем их автоматом утверждать
    //sql1 := ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_NPZ) + ' and p.statuscode = ' + IntToStr(ENPLANWORKSTATUS_LOCKED)
    sql1 := ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_NPZ) +
            ' and p.statuscode not in (' + IntToStr(ENPLANWORKSTATUS_CANCELED_) + ', ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')' +
            ' and p.code not in (select ch.planoldrefcode ' +
                               ' from enplancorrecthistory ch, enplanwork pw ' +
                               ' where ch.reasoncode = ' + IntToStr(CORRECTREASON_MOVE_TO_FACT) +
                               '   and ch.plannewrefcode = pw.code and pw.statuscode = ' + IntToStr(ENPLANWORKSTATUS_LOCKED) + ')'
    ///
  else
  if (itemKind = TRAVELITEM_KIND_FACT) then
     // нужно или ЧЕРНОВОЙ ПЛАН или ФАКТ на него ...
     //sql1 := ' and p.kindcode = ' + IntToStr(ENPLANWORKKIND_FACT) + ' and p.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD)
     sql1 := ' and ( (p.kindcode = 3 and p.statuscode = 1) or (p.kindcode = 4 and p.statuscode = 1))'
  else
  begin

    Exit;
  end;

  if departmentCode > LOW_INT then
    AddCondition(sql1, 'p.departmentrefcode = ' + IntToStr(departmentCode));


  if edtWorkOrderNumber.Text <> '' then
  begin
    AddCondition(sql1, ' w.workordernumber = ''' + edtWorkOrderNumber.Text + ''' ');
  end;

  if edtENElementName.Text <> '' then
  begin
    AddCondition(sql1, ' p.elementrefcode = ' + IntToStr(elementCode));
  end;

  // типа МАСТЕР с наряда ...
  if molCode <> '' then
  begin
    AddCondition(sql1, ' fmd.finmolcode = ' + molCode); 
  end;

  if chkBinded.Checked then
  begin
    AddCondition(sql1, ' tr.transportrealcode = ' + IntToStr(travelSheetObj.transportReal.code) );
  end;

  if  DateToStr(edtDateStart.Date) = DateToStr(edtDateFinal.Date) then
    AddCondition(sql1,' p.datestart = to_date('''+ DateToStr(edtDateStart.Date) +''',''dd.MM.yyyy'')' )
  else
  begin
    AddCondition(sql1,'p.datestart >= to_date('''+ DateToStr(edtDateStart.Date) +''',''dd.MM.yyyy'')' );
    AddCondition(sql1,'p.datestart <= to_date('''+ DateToStr(edtDateFinal.Date) +''',''dd.MM.yyyy'')' );
  end;

  // 30.11.2011 +++ кроме перевезення-енергозбут 
  AddCondition(sql1,' p.code not in (select pl.code from enplanwork pl where pl.typerefcode = 11 and pl.budgetrefcode = 240000001)');

  Result := sql1;
end;

procedure TfrmENTravelSheetItemEditSearch.updateENTransportDetailedGrid();
var
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemList: ENTransportItemShortList;

    //ENTransportItemDetailedList: ENTransportItemShortList;

    transportItemFilter : ENTransportItemFilter;
    i , j : integer;
    sql, sql1 : string;
    state_ : Boolean;

    TempENTravelSheet: ENTravelSheetControllerSoapPort;
    ts : ENTravelSheet;
begin
  ClearGrid(sgENTransportItemDetailed);

  if sgENTransportItem.Row = 0 then Exit;

  TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  transportItemFilter := ENTransportItemFilter.Create;
  SetNullIntProps(transportItemFilter);
  SetNullXSProps(transportItemFilter);
  transportItemFilter.conditionSQL := getCondition;

  {
  transportItemFilter.planRef := ENPlanWorkRef.Create;
  transportItemFilter.planRef.code := Integer( sgENTransportItem.Objects[0, sgENTransportItem.Row ] );
  transportItemFilter.transport := TKTransport.Create;
  transportItemFilter.transport.code := Integer(sgENTransportItem.Objects[1, sgENTransportItem.Row ] );
  transportItemFilter.tktransportType := TKTransportType.Create;
  transportItemFilter.tktransportType.code := Integer(sgENTransportItem.Objects[2, sgENTransportItem.Row ] );
  }
  
  ENTransportItemList := TempENTransportItem.getListDetailedForTravelSheetItem(transportItemFilter);

  if High(ENTransportItemList.list) > -1 then
    sgENTransportItemDetailed.RowCount := High(ENTransportItemList.list) + 2
  else
    sgENTransportItemDetailed.RowCount := 2;

  i := 0;
  with sgENTransportItemDetailed do
     for j := 0 to High(ENTransportItemList.list) do
     begin
        Application.ProcessMessages;

        // по идее НАЛов НЕ будет ...
        if  (ENTransportItemList.list[j].countWorkFact <> nil)
            and (ENTransportItemList.list[j].distance <> nil)
        then
        begin
           if ( StrToFloat(ENTransportItemList.list[j].countWorkFact.DecimalString ) = 0)
            and ( StrToFloat((ENTransportItemList.list[j].distance.DecimalString)) = 0) then
            begin
              Continue;
            end;
        end
        else
          Continue;

        if ENTransportItemList.list[j].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[j].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := ENTransportItemList.list[j].transportName;
        AddCheckBox(1, i+1, False, False);

        Cells[2, i+1] := ENTransportItemList.list[j].transportRealName;

        //Cells[3, i+1] := ENTransportItemList.list[i].workerFactName;
        Cells[3, i+1] := ENTransportItemList.list[j].finWorkerName + ' ' + ENTransportItemList.list[j].finWorkerPositionName;

        //Cells[8, i +1] := ENTransportItemList.list[j].planRefWorkOrderNumber;

        if ENTransportItemList.list[i].planRefDateStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[j].planRefWorkOrderNumber + ' від ' + XSDate2String(ENTransportItemList.list[j].planRefDateStart);


        {
        if ENTransportItemList.list[j].countWorkGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[j].countWorkGen.DecimalString;
        }

        if ENTransportItemList.list[j].countWorkFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[j].countWorkFact.DecimalString;

        Cells[6, i+1] := ENTransportItemList.list[j].kartaNum;
        Cells[7,i + 1] := ENTransportItemList.list[j].kartaRefName;

        Cells[8,i+1] := ENTransportItemList.list[j].tktransportTypeName;

        if ENTransportItemList.list[j].distance <> nil then
            Cells[9,i+1] :=  ENTransportItemList.list[j].distance.DecimalString
        else
            Cells[9,i+1] := '';

        Cells[10,i+1] := ENTransportItemList.list[j].userGen;

        if ENTransportItemList.list[j].dateEdit = nil then
          Cells[11,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(ENTransportItemList.list[j].dateEdit);
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;

        // Выделяем цветом ручной ввод
        {
       if ENTransportItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENTransportItemDetailed.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENTransportItemDetailed.RowColor[i+1] := clWindow;

       Objects[0,i+1] := TObject(ENTransportItemList.list[j].typeRefCode);
        }

        Objects[0,i+1] := TObject(ENTransportItemList.list[j].planRefCode);
        Objects[1,i+1] := TObject(ENTransportItemList.list[j].transportCode);
        Objects[2,i+1] := TObject(ENTransportItemList.list[j].tktransportTypeCode);
        
       i := i + 1;

      //sgENTransportItemDetailed.Row := 1;
    end;

  if i > 0 then
    sgENTransportItemDetailed.RowCount := i + 1
  else
    sgENTransportItemDetailed.RowCount := 2;

    sgENTransportItemDetailed.Row := 1;

end;



procedure TfrmENTravelSheetItemEditSearch.updateENTransportGrid();
var
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemList: ENTransportItemShortList;

    //ENTransportItemDetailedList: ENTransportItemShortList;

    transportItemFilter : ENTransportItemFilter;
    i , j : integer;
    sql, sql1 : string;
    state_ : Boolean;

    TempENTravelSheet: ENTravelSheetControllerSoapPort;
    ts : ENTravelSheet;
begin
  if (departmentCode = LOW_INT) and (edtWorkOrderNumber.Text = '') and
     (elementCode = LOW_INT) and (not chkBinded.Checked )
  then
  begin
    Application.MessageBox(PChar('Оберіть підрозділ, об''єкт або наряд-завдання!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  ClearGrid(sgENTransportItem);


  TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  transportItemFilter := ENTransportItemFilter.Create;
  SetNullIntProps(transportItemFilter);
  SetNullXSProps(transportItemFilter);

  //transportItemFilter.planRef := ENPlanWorkRef.Create;
  //transportItemFilter.planRef.code := ENPlanWorkObj.code;

  ////////////////////////////////////////


  sql1 := getCondition();

  ////////////////////////////////////////////////////////////

  // + условие при заливки грида - пропустим 0-вые маш часы(скорыг) и км-АЖ
  transportItemFilter.conditionSQL := sql1;

  // до ноги ... в сервере свой ордерБай
  //transportItemFilter.orderBySQL := 'p.elementrefcode, p.kindcode desc, p.code ';//' entransportitem.planitemrefcode';

  ENTransportItemList := TempENTransportItem.getListForTravelSheetItem(transportItemFilter);

  if High(ENTransportItemList.list) > -1 then
    sgENTransportItem.RowCount := High(ENTransportItemList.list) + 2
  else
    sgENTransportItem.RowCount := 2;

  i := 0;
  with sgENTransportItem do
     for j := 0 to High(ENTransportItemList.list) do
     begin
        Application.ProcessMessages;
        // по идее НАЛов НЕ будет ...
        if  (ENTransportItemList.list[j].countWorkFact <> nil)
            and (ENTransportItemList.list[j].distance <> nil)
        then
        begin
           if ( StrToFloat(ENTransportItemList.list[j].countWorkFact.DecimalString ) = 0)
            and ( StrToFloat((ENTransportItemList.list[j].distance.DecimalString)) = 0) then
            begin
              Continue;
            end;
        end
        else
          Continue;

          //??? шо за И и ЖИ ?? ;)
        if ENTransportItemList.list[j].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[j].code)
        else
        Cells[0,i+1] := '';
{
        ( 'Код'
          ,'Об"єкт плана'
          ,'Транспорт нормативний'
          ,'Тип транспорту'
          ,'Норма часу нормативна'
          ,'Норма часу скорегована'
          ,'Відстані, км'
          ,'Код роботи'
          ,'Робота'
          ,'Кількость робіт'
}
        Cells[1, i+1] := {'інв.№' +} ENTransportItemList.list[j].elementInvNumber + ' ' + ENTransportItemList.list[j].elementName ;
        AddCheckBox(1, i +1, false, false);

        Cells[2, i +1] := ENTransportItemList.list[j].planRefMOLName;
        Cells[3, i +1] := ENTransportItemList.list[j].planRefFinExecutorName;
        
        //Cells[2, i+1] := ENTransportItemList.list[j].transportRealName;
        Cells[4, i +1] := ENTransportItemList.list[j].transportName;

        //Cells[3, i+1] := ENTransportItemList.list[j].workerFactName;
        Cells[5, i+1] := ENTransportItemList.list[j].tktransportTypeName;
        {
        if ENTransportItemList.list[j].countWorkGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[j].countWorkGen.DecimalString;
        }

        if ENTransportItemList.list[j].countWorkFact = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTransportItemList.list[j].countWorkFact.DecimalString;

        if ENTransportItemList.list[j].distance <> nil then
            Cells[7,i+1] :=  ENTransportItemList.list[j].distance.DecimalString
        else
            Cells[7,i+1] := '';

        Cells[8, i +1] := ENTransportItemList.list[j].planRefWorkOrderNumber;

        if ENTransportItemList.list[j].planRefDateStart = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENTransportItemList.list[j].planRefDateStart);

        if ( ENTransportItemList.list[j].planRefKindCode = ENPLANWORKKIND_NPZ) and (itemKind = TRAVELITEM_KIND_FACT)  then
          RowColor[i+1] := clYellow
        else
          RowColor[i+1] := clWindow;

        {
        Cells[7, i+1] := ENTransportItemList.list[j].kartaNum;
        Cells[8,i + 1] := ENTransportItemList.list[j].kartaRefName;

        if ENTransportItemList.list[j].planItemRefCountGen <> nil then
            Cells[9,i+1] :=  ENTransportItemList.list[j].planItemRefCountGen.DecimalString
        else
            Cells[9,i+1] := '';
        }

        Objects[0,i+1] := TObject(ENTransportItemList.list[j].planRefCode);
        Objects[1,i+1] := TObject(ENTransportItemList.list[j].transportCode);
        Objects[2,i+1] := TObject(ENTransportItemList.list[j].tktransportTypeCode);


        i := i + 1;
{
        Cells[10,i+1] := ENTransportItemList.list[j].userGen;

        if ENTransportItemList.list[j].dateEdit = nil then
          Cells[11,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(ENTransportItemList.list[j].dateEdit);
}
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;
{
        // Выделяем цветом ручной ввод
       if ENTransportItemList.list[j].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENTransportItem.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENTransportItem.RowColor[i+1] := clWindow;

       Objects[0,i+1] := TObject(ENTransportItemList.list[j].typeRefCode);
}       
    end;

  if i > 0 then
    sgENTransportItem.RowCount := i + 1
  else
    sgENTransportItem.RowCount := 2;

    sgENTransportItem.Row := 1;

    if (i = 0) then
      Application.MessageBox(PChar('Немає Транспорту для включення у Подорожній лист ...'), PChar('Увага !'),MB_ICONWARNING)
    else
    begin
      updateENTransportDetailedGrid();
      sgENTransportItemClick(nil);
    end;

end;

procedure TfrmENTravelSheetItemEditSearch.FormShow(Sender: TObject);
begin

  SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);

  SetGridHeaders(ENTransportItemDetailedHeaders, sgENTransportItemDetailed.ColumnHeaders);


  DisableControls([edtDateStart, edtDateFinal, edtENDepartmentDepartmentName, spbENDepartmentDepartment,
                   edtENElementName, edtMolName]);

  // если подр - ХОЕвская служба транспорта - подразделение можно выбирать какое хош ...
  DisableControls([spbENDepartmentDepartment], departmentCode <> ENDEPARTMENT_CODE_OE_TRANSPORT);

  isShowDetailClick(Sender);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin


  end;
end;



procedure TfrmENTravelSheetItemEditSearch.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
begin
  // :)
end;


procedure TfrmENTravelSheetItemEditSearch.spbENElementClick(
  Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f : ENElementFilter;
begin
     f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';
     //f.conditionSQL := 'code in (select elementrefcode from enline10 union all select elementcode from enlin150 union all select elementrefcode from ensubstation10 union all select elementrefcode from ensubstation150)
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
   try

      with frmENElementShow do
        if ShowModal = mrOk then
        begin

            try
               elementCode := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENTravelSheetItemEditSearch.FormCreate(Sender: TObject);
begin
  inherited;
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  molCode := '';
  itemKind := LOW_INT;
  travelSheetCode := LOW_INT;
end;

procedure TfrmENTravelSheetItemEditSearch.btnSearchTransportClick(
  Sender: TObject);
begin
  inherited;
  updateENTransportGrid();
end;

procedure TfrmENTravelSheetItemEditSearch.btnSaveItemsClick(
  Sender: TObject);
var
state : boolean;
TempENTravelSheet: ENTravelSheetControllerSoapPort;
i, n , j : Integer;
codes : ENTravelSheetController.ArrayOfInteger;
////////////
//trShort : ENTransportItemShort ;
//tArr__ : ArrayOfENTransportItemShort;
//tList : ENTransportItemShortList;
begin
  inherited;

  n := 0;
  state := false;
  for i := 1 to sgENTransportItemDetailed.RowCount - 1 do
  begin
    sgENTransportItemDetailed.GetCheckBoxState(1, i, state);
    if state then
    begin
       n := n + 1;
    end;
  end;

  if ( n = 0 ) then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один транспорт з планів ... !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  //tList :=  ENTransportItemShortList.Create;
  //tList.totalCount := n;
  SetLength(codes, n);

  //SetLength(codes, n);
  state := false;
  j := 0;
  for i := 1 to sgENTransportItemDetailed.RowCount - 1 do
  begin
    sgENTransportItemDetailed.GetCheckBoxState(1, i, state);
    if state then
    begin
      {
       trShort := ENTransportItemShort.Create;
       SetNullIntProps(trShort);
       SetNullXSProps(trShort);
       trShort.planRefCode := Integer( sgENTransportItem.Objects[0, i ] );
       trShort.transportCode := Integer(sgENTransportItem.Objects[1, i ] );
       trShort.tktransportTypeCode := Integer(sgENTransportItem.Objects[2, i ] );
       tArr[j] := trShort;
       //codes[ j ] := StrToInt(sgENTransportItem.Cells[0, i]);
       }
       codes[ j ] := StrToInt(sgENTransportItemDetailed.Cells[0, i]);
       j := j + 1;
    end;
  end;

  //tList.list := tArr;


  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

  //if itemKind = -1000000 then // типа в закрытый без перерасчета ;)
  //  TempENTravelSheet.addItemsNORecalc_(travelSheetCode, tArr)
  //else
  TempENTravelSheet.addItemsDetailed(travelSheetCode, codes);


  ModalResult := mrOk;

{
  n := 0;
  state := false;
  for i := 1 to sgENTransportItem.RowCount - 1 do
  begin
    sgENTransportItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       n := n + 1;
    end;
  end;

  if ( n = 0 ) then
  begin
    Application.MessageBox(PChar('Оберіть хоча б один транспорт з планів ... !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    Exit;
  end;

  //tList :=  ENTransportItemShortList.Create;
  //tList.totalCount := n;
  SetLength(tArr, n);

  //SetLength(codes, n);
  state := false;
  j := 0;
  for i := 1 to sgENTransportItemdet.RowCount - 1 do
  begin
    sgENTransportItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       trShort := ENTransportItemShort.Create;
       SetNullIntProps(trShort);
       SetNullXSProps(trShort);
       trShort.planRefCode := Integer( sgENTransportItem.Objects[0, i ] );
       trShort.transportCode := Integer(sgENTransportItem.Objects[1, i ] );
       trShort.tktransportTypeCode := Integer(sgENTransportItem.Objects[2, i ] );
       tArr[j] := trShort;
       //codes[ j ] := StrToInt(sgENTransportItem.Cells[0, i]);
       j := j + 1;
    end;
  end;

  //tList.list := tArr;


  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

  if itemKind = 1000 then // типа в закрытый без перерасчета ;)
    TempENTravelSheet.addItemsNORecalc_(travelSheetCode, tArr)
  else
    TempENTravelSheet.addItems(travelSheetCode, tArr);


  ModalResult := mrOk;
}
  
end;

procedure TfrmENTravelSheetItemEditSearch.actSelectAllExecute(
  Sender: TObject);
begin
  inherited;
  CheckGrid(sgENTransportItem, 1, True);
end;

procedure TfrmENTravelSheetItemEditSearch.actUnSelectAllExecute(
  Sender: TObject);
begin
  inherited;
  CheckGrid(sgENTransportItem, 1, False);
end;

procedure TfrmENTravelSheetItemEditSearch.spbENElementClearClick(
  Sender: TObject);
begin
  edtENElementName.Text := '';
  elementCode := LOW_INT;
end;

procedure TfrmENTravelSheetItemEditSearch.spbENDepartmentDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

  f:=  ENDepartmentFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do
      begin
        DisableActions([ actEdit, actInsert, actDelete ]);
        if ShowModal = mrOk then
        begin
            try
               //if ENTravelSheetObj.department = nil then ENTravelSheetObj.department := ENDepartment.Create();
               //ENTravelSheetObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;

               //tsTravelSheetItemPlan.TabVisible := False;
               //tsTravelSheetItemFact.TabVisible := False;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENTravelSheetItemEditSearch.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
{
   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;

  ENMOL2PlanWorkObj: ENMOL2PlanWork;
  TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;

  molSel : boolean;
}  
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      //plan := DMReports.getPlanByCode(planCode);

//   if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then

     if departmentCode <> LOW_INT then
     begin
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) in (' +  DMReports.getFinRenByDepartmentCode( departmentCode ) + ')';
      end;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert , actDelete ]);
        if ShowModal = mrOk then
        begin
            try

               edtMolName.Text := GetReturnValue(sgFINMol,0) + ' ' + GetReturnValue(sgFINMol,1); //ENMOL2PlanWorkObj.molCode + ' ' + ENMOL2PlanWorkObj.molName;
               molCode := GetReturnValue(sgFINMol,0);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmENTravelSheetItemEditSearch.spbPlanMOLClearClick(
  Sender: TObject);
begin
  inherited;
  molCode := '';
  edtMolName.Text := '';
end;

procedure TfrmENTravelSheetItemEditSearch.sgENTransportItemDblClick(
  Sender: TObject);
var planCode: Integer;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  planCode := Integer(sgENTransportItem.Objects[0, sgENTransportItem.Row]);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
  try
    frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);
    frmENPlanWorkEdit.ShowModal;
  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit := nil;
  end;
end;

procedure TfrmENTravelSheetItemEditSearch.spbDepartmentClearClick(
  Sender: TObject);
begin
  edtENDepartmentDepartmentName.Text := '';
  departmentCode := LOW_INT;
end;

procedure TfrmENTravelSheetItemEditSearch.sgENTransportItemCheckBoxClick(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
var
i : Integer;
planCode, transportCode, transportTypeCode : Integer;
begin
  inherited;

   planCode := Integer( sgENTransportItem.Objects[0, ARow ] );
   transportCode := Integer(sgENTransportItem.Objects[1, ARow ] );
   transportTypeCode := Integer(sgENTransportItem.Objects[2, ARow ] );

  for i:=1 to sgENTransportItemDetailed.RowCount - 1 do
  begin
        if (planCode = Integer( sgENTransportItemDetailed.Objects[0,i]))
           and (transportCode = Integer(sgENTransportItemDetailed.Objects[1,i]))
           and (transportTypeCode = Integer(sgENTransportItemDetailed.Objects[2,i]))
        then
        begin
             sgENTransportItemDetailed.SetCheckBoxState(1, i, State);
        end;
  end;

end;

procedure TfrmENTravelSheetItemEditSearch.sgENTransportItemClick(Sender: TObject);
var
i : Integer;
planCode, transportCode, transportTypeCode : Integer;
begin
  inherited;
   planCode := Integer( sgENTransportItem.Objects[0, sgENTransportItem.Row ] );
   transportCode := Integer(sgENTransportItem.Objects[1, sgENTransportItem.Row ] );
   transportTypeCode := Integer(sgENTransportItem.Objects[2, sgENTransportItem.Row ] );

  for i:=1 to sgENTransportItemDetailed.RowCount - 1 do
  begin
        if (planCode = Integer( sgENTransportItemDetailed.Objects[0,i]))
           and (transportCode = Integer(sgENTransportItemDetailed.Objects[1,i]))
           and (transportTypeCode = Integer(sgENTransportItemDetailed.Objects[2,i]))
        then
            sgENTransportItemDetailed.RowColor[i] := clYellow
        else
            sgENTransportItemDetailed.RowColor[i] := clWindow;
  end;
end;

procedure TfrmENTravelSheetItemEditSearch.isShowDetailClick(Sender: TObject);
begin
  inherited;
  HideControls([gbTransportItemsDetail], not isShowDetail.Checked);
end;

end.
