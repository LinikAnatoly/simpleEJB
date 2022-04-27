
unit ShowRQCentralExportAnalyse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  RQCentralExportAnalyseController, AdvObj, ExtCtrls, StdCtrls,  DateUtils ;


type
  TfrmRQCentralExportAnalyseShow = class(TChildForm)
    ImageList1: TImageList;
    ActionList1: TActionList;
    PopupMenu1: TPopupMenu;
    actExport2Excel: TAction;
    test1: TMenuItem;
    Panel1: TPanel;
    pnlExportGroup: TPanel;
    Splitter1: TSplitter;
    sgRQCentralExportAnalyse: TAdvStringGrid;
    pnlmaterials: TPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    pnlplan: TPanel;
    Label1: TLabel;
    sgENPlanWork: TAdvStringGrid;
    ActionListPlan: TActionList;
    actViewplan: TAction;
    HTTPRIOENPlanWork: THTTPRIO;
    PopupPlan: TPopupMenu;
    MenuItem1: TMenuItem;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    sgRQFKOrderItem2ENEstimateItem: TAdvStringGrid;
    chkUsePlanForViewMaterials: TCheckBox;
    Label2: TLabel;
    edtDateStart: TDateTimePicker;
    Label3: TLabel;
    edtDateFinal: TDateTimePicker;
    btnUpdateAnalyse: TButton;
    lblPaid: TLabel;
    ShapePaid: TShape;
    Label4: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label5: TLabel;
    HTTPRIORQCentralExportAnalyse: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQCentralExportAnalyseDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actExport2ExcelExecute(Sender: TObject);
function  getColorForCell(cause : integer ;  centralGraph : integer ): Tcolor;
    procedure sgRQCentralExportAnalyseClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure actViewplanExecute(Sender: TObject);
procedure   getEstimateWithMaterialsOrderList
(dateStart : String ; dateFinal : String; depCode : Integer ; planCode : Integer );
procedure UpdateAnalyseData(Sender: TObject);
    procedure btnUpdateAnalyseClick(Sender: TObject);
    procedure sgENPlanWorkRowChanging(Sender: TObject; OldRow, NewRow: Integer;
      var Allow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure sgRQCentralExportAnalyseCellValidate(Sender: TObject; ACol,
      ARow: Integer; var Value: string; var Valid: Boolean);
    procedure sgRQCentralExportAnalyseGetCellBorder(Sender: TObject; ARow,
      ACol: Integer; APen: TPen; var Borders: TCellBorders);
  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   procedure UpdateSums;
 end;

//var
 // RQCentralExportAnalyseObj: RQCentralExportAnalyse;
 // RQCentralExportAnalyseFilterObj: RQCentralExportAnalyseFilter;


implementation

uses Main//,
//EditRQCentralExportAnalyse,
//EditRQCentralExportAnalyseFilter
, ENConsts, ENPlanWorkController, DMReportsUnit, EditENPlanWork,
  RQFKOrderItem2ENEstimateItemController;


{$R *.dfm}

var
  //frmRQCentralExportAnalyseShow : TfrmRQCentralExportAnalyseShow;
  UNITEDGROUPS_COLS_WITH_BOLD_BORDERS: array [1..13] of
  Integer = (4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28);

  ColCount,ColCountPlan, LastCount: Integer;
  LastRow: Integer = 1;
  LastRowPlan: Integer = 1;
  RQCentralExportAnalyseHeaders: array [1..30] of String =
        ( 'Код'
          ,'Дата '
          ,'Апарат управління (кг.)план '
          ,'Апарат управління (кг.)'
          ,'Високопільський РЕЗ і ЕМ (кг.)план '
          ,'Високопільський РЕЗ і ЕМ (кг.) '
          ,'В.Лепетиський РЕЗ і ЕМ (кг.)план'
          ,'В.Лепетиський РЕЗ і ЕМ (кг.)'
          ,'Генічеський РЕЗ і ЕМ (кг.)план'
          ,'Генічеський РЕЗ і ЕМ (кг.)'
          ,'Г.Пристанський РЕЗ і ЕМ (кг.)план'
          ,'Г.Пристанський РЕЗ і ЕМ (кг.)'
          ,'Іванівський РЕЗ і ЕМ (кг.)план'
          ,'Іванівський РЕЗ і ЕМ (кг.)'
          ,'Каховський РЕЗ і ЕМ (кг.)план'
          ,'Каховський РЕЗ і ЕМ (кг.)'
          ,'Н.Каховський РЕЗ і ЕМ (кг.)план'
          ,'Н.Каховський РЕЗ і ЕМ (кг.)'
          ,'Н.Троїцький РЕЗ і ЕМ (кг.)план'
          ,'Н.Троїцький РЕЗ і ЕМ (кг.)'
          ,'Скадовський РЕЗ і ЕМ (кг.)план'
          ,'Скадовський РЕЗ і ЕМ (кг.)'
          ,'ХМВЕ (кг.)план'
          ,'ХМВЕ (кг.)'
          ,'ХМЕМ (кг.)план'
          ,'ХМЕМ (кг.)'
          ,'Цюрупинський РЕЗ і ЕМ (кг.)план'
          ,'Цюрупинський РЕЗ і ЕМ (кг.)'
          ,'Чаплинський РЕЗ і ЕМ (кг.)план'
          ,'Чаплинський РЕЗ і ЕМ (кг.)'
        );

        ENPlanWorkHeaders: array [1..19] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          //,'Початк. місяць та рік плану (до перенесення)'
          //,'Початк. місяць плану'
          ,'ПідВид робіт'
          ,'Тип акту'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          ,'Початк. місяць та рік плану (до перенесення)'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
          ,'Дата створення'
        );

        RQFKOrderItem2ENEstimateItemHeaders: array [1..10] of String =
        ( 'Список естимейты'
          ,'Матеріал '
          ,'Кіл-сть у плані'
          ,'Кіл-сть у ордері'
          ,'№ ордера'
          ,'Дата ордера '
          ,'МВО відправник'
          ,'МВО отримувач'
          ,'Вид ордеру'
          ,'Статус ордеру'
        );

procedure TfrmRQCentralExportAnalyseShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQCentralExportAnalyseShow:=nil;
    inherited;
  end;


procedure TfrmRQCentralExportAnalyseShow.FormCreate(Sender: TObject);
begin
  // inherited;
  with sgRQCentralExportAnalyse do begin
   // ColCount := 20;
   
  end;
end;

procedure TfrmRQCentralExportAnalyseShow.FormShow(Sender: TObject);
var
  TempRQCentralExportAnalyse: RQCentralExportAnalyseControllerSoapPort;
  i: Integer;
  RQCentralExportAnalyseList: RQCentralExportAnalyseShortList;
  c: Integer;
  v: Integer;
  y,m,d : word;
  begin

  DecodeDate(now,y,m,d);
  edtDateStart.DateTime := EncodeDate(y,m,1);
  edtDateStart.Checked := true;

  edtDateFinal.DateTime := EndOfAMonth(y, m);
  edtDateFinal.Checked := true;



  SetGridHeaders(RQCentralExportAnalyseHeaders, sgRQCentralExportAnalyse.ColumnHeaders);
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(RQFKOrderItem2ENEstimateItemHeaders, sgRQFKOrderItem2ENEstimateItem.ColumnHeaders);

end;

procedure TfrmRQCentralExportAnalyseShow.sgENPlanWorkRowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
var
planCode  , depCodeByCell : integer;
begin
  inherited;
  try
     depCodeByCell := Integer(sgRQCentralExportAnalyse.Objects[sgRQCentralExportAnalyse.Col, sgRQCentralExportAnalyse.Row]);
   except
   on EConvertError do Exit;
  end;
   // показ материалы
     if chkUsePlanForViewMaterials.Checked = True  then
     begin

       try
        planCode := StrToInt(frmRQCentralExportAnalyseShow.sgENPlanWork.Cells[0,NewRow]);

       except
       on EConvertError do Exit;
       end;

       getEstimateWithMaterialsOrderList(sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row],
                                       sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row],
                                       depCodeByCell,
                                       planCode );
     end
end;

procedure TfrmRQCentralExportAnalyseShow.sgRQCentralExportAnalyseCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: string; var Valid: Boolean);
begin
 // inherited;
    UpdateSums;
end;

procedure TfrmRQCentralExportAnalyseShow.sgRQCentralExportAnalyseClickCell(
  Sender: TObject; ARow, ACol: Integer);
  var
  depCodeByCell : Integer;
  TempRQCentralExportAnalyse: RQCentralExportAnalyseControllerSoapPort;
 // TempENPlanWork: ENPlanWorkControllerSoapPort;
  i, n   : Integer;
  planCode : Integer;
  ENPlanWorkList: ENPlanWorkShortList;

begin
  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
//  inherited;
  try
     depCodeByCell := Integer(sgRQCentralExportAnalyse.Objects[sgRQCentralExportAnalyse.Col, sgRQCentralExportAnalyse.Row]);
   except
   on EConvertError do Exit;
  end;

     ClearGrid(sgRQFKOrderItem2ENEstimateItem);
     ClearGrid(sgENPlanWork);

  TempRQCentralExportAnalyse :=  HTTPRIORQCentralExportAnalyse as RQCentralExportAnalyseControllerSoapPort;

  ENPlanWorkList :=
  TempRQCentralExportAnalyse.getScrollableListPlan(sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row]
  ,sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row] , depCodeByCell );
    try

   if ENPlanWorkList <> nil then
    begin
     if High(ENPlanWorkList.list) > -1 then
        sgENPlanWork.RowCount:=High(ENPlanWorkList.list)+2
    end
    else
       sgENPlanWork.RowCount:=2;

     with sgENPlanWork do
      for i:=0 to High(ENPlanWorkList.list) do
        begin
          Application.ProcessMessages;

          n := 0;

          if ENPlanWorkList.list[i].code <> Low(Integer) then
          Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code)
          else
          Cells[n,i+1] := '';
          inc(n);
          if  ENPlanWorkList.list[i].causeDisconnection > 0 then
             RowColor[i + 1] := clRed
          else
             RowColor[i + 1] := clWindow;

          Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
          inc(n);

          if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
            Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
            Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
          else
            Cells[n,i+1] := '';
          inc(n);

          if ENPlanWorkList.list[i].dateStart = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
          inc(n);
          Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
          inc(n);

          Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
          inc(n);

          Cells[n,i+1] := '';


          if ENPlanWorkList.list[i].yearOriginal > 0 then
          begin

            if ENPlanWorkList.list[i].monthOriginal > 0 then
              Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthOriginal] + ' ' +
                              IntToStr(ENPlanWorkList.list[i].yearOriginal);
          end
          else
            Cells[n,i+1] := '';
          inc(n);


          Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
          inc(n);


          Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
          inc(n);

          if ENPlanWorkList.list[i].dateEdit = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
           inc(n);

          if ENPlanWorkList.list[i].dateGen = nil then
            Cells[n,i+1] := ''
          else
            Cells[n,i+1] := XSDateTimeWithDate2String(ENPlanWorkList.list[i].dateGen);

          inc(n);

          LastRowPlan:=i+1;
          sgENPlanWork.RowCount:=LastRowPlan+1;
        end;
     ColCountPlan:=ColCountPlan+1;
     sgENPlanWork.Row:=1;



     // показ материалы
     if chkUsePlanForViewMaterials.Checked = True  then
     begin

       try
        planCode := StrToInt(frmRQCentralExportAnalyseShow.sgENPlanWork.Cells[0,frmRQCentralExportAnalyseShow.sgENPlanWork.Row]);

       except
       on EConvertError do Exit;
       end;

       getEstimateWithMaterialsOrderList(sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row],
                                       sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row],
                                       depCodeByCell,
                                       planCode );
     end
     else
     getEstimateWithMaterialsOrderList(sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row],
                                       sgRQCentralExportAnalyse.Cells[1,sgRQCentralExportAnalyse.Row],
                                       depCodeByCell,
                                       LOW_INT );

  finally
  ENPlanWorkList.Free;
  end;



end;

procedure   TfrmRQCentralExportAnalyseShow.getEstimateWithMaterialsOrderList
(dateStart : String ; dateFinal : String; depCode : Integer ; planCode : Integer );
var
  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  RQFKOrderItem2ENEstimateItemList: RQFKOrderItem2ENEstimateItemShortList;
  i  , g : Integer;
begin

 SetGridHeaders(RQFKOrderItem2ENEstimateItemHeaders, sgRQFKOrderItem2ENEstimateItem.ColumnHeaders);
 TempRQFKOrderItem2ENEstimateItem :=  HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;

 RQFKOrderItem2ENEstimateItemList := TempRQFKOrderItem2ENEstimateItem.getEstimateWithMaterialsOrderList
 (dateStart,dateFinal,depCode ,planCode );


 if High(RQFKOrderItem2ENEstimateItemList.list) > -1 then
     sgRQFKOrderItem2ENEstimateItem.RowCount:=High(RQFKOrderItem2ENEstimateItemList.list)+2
  else
     sgRQFKOrderItem2ENEstimateItem.RowCount:=2;


      for g := 1 to sgRQFKOrderItem2ENEstimateItem.RowCount - 1 do
      begin
        if sgRQFKOrderItem2ENEstimateItem.IsNode(g) then
          sgRQFKOrderItem2ENEstimateItem.SplitCells(1,g);   // split cells again
      end;

   with sgRQFKOrderItem2ENEstimateItem do
    for i:=0 to High(RQFKOrderItem2ENEstimateItemList.list) do
      begin
        Application.ProcessMessages;
        // список естимейтов
        Cells[0,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].estimateItemUserGen;
        // название материала
        Cells[1, i+1] := RQFKOrderItem2ENEstimateItemList.list[i].materialRefName;

        // кол-во материала план
        if RQFKOrderItem2ENEstimateItemList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].countGen.DecimalString;
        // кол-во материала в ордерах
        if RQFKOrderItem2ENEstimateItemList.list[i].fkOrderItemRefCountGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQFKOrderItem2ENEstimateItemList.list[i].fkOrderItemRefCountGen.DecimalString;
        // номер ордера
        Cells[4, i +1] := RQFKOrderItem2ENEstimateItemList.list[i].fkOrderRefNumberGen;
        // дата ордера
        if RQFKOrderItem2ENEstimateItemList.list[i].fkOrderRefDateGen = nil then
        Cells[5, i +1] := ''
        else
        Cells[5, i +1] := XSDate2String( RQFKOrderItem2ENEstimateItemList.list[i].fkOrderRefDateGen);
        // мол отправитель
        Cells[6, i +1] := RQFKOrderItem2ENEstimateItemList.list[i].fkOrderRefMOLINCode;
        // мол получатель
        Cells[7, i +1] := RQFKOrderItem2ENEstimateItemList.list[i].fkOrderRefMOLOUTCode;
        // вид ордера
        Cells[8, i +1] := RQFKOrderItem2ENEstimateItemList.list[i].fkOrderkindName;
        // статус ордера
        Cells[9, i +1] := RQFKOrderItem2ENEstimateItemList.list[i].statusRefName;

        //CellProperties[1, i+1].VAlignment := vtaCenter;

        sgRQFKOrderItem2ENEstimateItem.RowCount:=i+2;



      end;
         sgRQFKOrderItem2ENEstimateItem.Row:=1;
//         sgRQFKOrderItem2ENEstimateItem.MergeColumnCells(0, true);
  //       sgRQFKOrderItem2ENEstimateItem.MergeColumnCells(1, false);
    //     sgRQFKOrderItem2ENEstimateItem.MergeColumnCells(2, false);
//        sgRQFKOrderItem2ENEstimateItem.Group(0) ;
//         for g := 1 to sgRQFKOrderItem2ENEstimateItem.RowCount - 1 do
//        begin
//          if sgRQFKOrderItem2ENEstimateItem.IsNode(g) then
//            sgRQFKOrderItem2ENEstimateItem.MergeCells(0,g,sgRQFKOrderItem2ENEstimateItem.ColCount,1); // Merge the full row
//        end;


end;



procedure TfrmRQCentralExportAnalyseShow.sgRQCentralExportAnalyseDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQCentralExportAnalyse,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQCentralExportAnalyseShow.sgRQCentralExportAnalyseGetCellBorder(
  Sender: TObject; ARow, ACol: Integer; APen: TPen; var Borders: TCellBorders);
 var
 i : Integer;
begin
  inherited;

    for i := Low(UNITEDGROUPS_COLS_WITH_BOLD_BORDERS) to High(UNITEDGROUPS_COLS_WITH_BOLD_BORDERS) do
  begin


    if (ACol = UNITEDGROUPS_COLS_WITH_BOLD_BORDERS[i]) then
    begin
      APen.Color := clBlack;
      APen.Width := 2;
      Borders := [cbLeft];
    end;
  end;
end;

procedure TfrmRQCentralExportAnalyseShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQCentralExportAnalyse.RowCount-1 do
   for j:=0 to sgRQCentralExportAnalyse.ColCount-1 do
     sgRQCentralExportAnalyse.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQCentralExportAnalyseShow.actViewExecute(Sender: TObject);
Var TempRQCentralExportAnalyse: RQCentralExportAnalyseControllerSoapPort;
begin
// TempRQCentralExportAnalyse := HTTPRIORQCentralExportAnalyse as RQCentralExportAnalyseControllerSoapPort;
//   try
//     RQCentralExportAnalyseObj := TempRQCentralExportAnalyse.getObject(StrToInt(sgRQCentralExportAnalyse.Cells[0,sgRQCentralExportAnalyse.Row]));
//   except
//   on EConvertError do Exit;
//  end;
//  frmRQCentralExportAnalyseEdit:=TfrmRQCentralExportAnalyseEdit.Create(Application, dsView);
//  try
//    frmRQCentralExportAnalyseEdit.ShowModal;
//  finally
//    frmRQCentralExportAnalyseEdit.Free;
//    frmRQCentralExportAnalyseEdit:=nil;
//  end;
end;

procedure TfrmRQCentralExportAnalyseShow.actViewplanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode : Integer;
begin
      try
        objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
      except
        on EConvertError do Exit;
      end;
  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
      exit;
  end;

   TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

   frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
   frmENPlanWorkEdit.viewPlanWork := 1;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_TRANSPORT) and (tPlan.stateRef.code = ENPLANWORKSTATE_GSM) then
    frmENPlanWorkEdit.isTransport := true;

   if (tPlan.typeRef.code = ENPLANWORKTYPE_SIZ) then
    frmENPlanWorkEdit.isSiz := true;

   try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
     except
       on EConvertError do Exit;
     end;

     frmENPlanWorkEdit.ShowModal;

   finally
     frmENPlanWorkEdit.Free;
     frmENPlanWorkEdit:=nil;
   end;

end;

procedure TfrmRQCentralExportAnalyseShow.btnUpdateAnalyseClick(Sender: TObject);
begin
  inherited;
   UpdateAnalyseData(Sender);
end;

procedure TfrmRQCentralExportAnalyseShow.actEditExecute(Sender: TObject);
Var TempRQCentralExportAnalyse: RQCentralExportAnalyseControllerSoapPort;
begin
// TempRQCentralExportAnalyse := HTTPRIORQCentralExportAnalyse as RQCentralExportAnalyseControllerSoapPort;
//   try
//     RQCentralExportAnalyseObj := TempRQCentralExportAnalyse.getObject(StrToInt(sgRQCentralExportAnalyse.Cells[0,sgRQCentralExportAnalyse.Row]));
//   except
//   on EConvertError do Exit;
//  end;
//  frmRQCentralExportAnalyseEdit:=TfrmRQCentralExportAnalyseEdit.Create(Application, dsEdit);
//  try
//    if frmRQCentralExportAnalyseEdit.ShowModal= mrOk then
//      begin
//        //TempRQCentralExportAnalyse.save(RQCentralExportAnalyseObj);
//        UpdateGrid(Sender);
//      end;
//  finally
//    frmRQCentralExportAnalyseEdit.Free;
//    frmRQCentralExportAnalyseEdit:=nil;
//  end;
end;

procedure TfrmRQCentralExportAnalyseShow.actDeleteExecute(Sender: TObject);
Var TempRQCentralExportAnalyse: RQCentralExportAnalyseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQCentralExportAnalyse := HTTPRIORQCentralExportAnalyse as RQCentralExportAnalyseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQCentralExportAnalyse.Cells[0,sgRQCentralExportAnalyse.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (лист для выборки анализа потребности вывоза материалов с ЦС под планы) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQCentralExportAnalyse.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQCentralExportAnalyseShow.actInsertExecute(Sender: TObject);
// Var TempRQCentralExportAnalyse: RQCentralExportAnalyseControllerSoapPort; 
begin
  // TempRQCentralExportAnalyse := HTTPRIORQCentralExportAnalyse as RQCentralExportAnalyseControllerSoapPort;  /// Это здесь уже лишнее!!!
  //RQCentralExportAnalyseObj:=RQCentralExportAnalyse.Create;

   //RQCentralExportAnalyseObj.dif_Aparat:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Visokop:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Vlepetih:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Genichesk:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Gpristan:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Ivanovka:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Kahovka:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Nkahovka:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Ntroick:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Skadovsk:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Hmve:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Hmem:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Curup:= TXSDecimal.Create;
   //RQCentralExportAnalyseObj.dif_Chaplinka:= TXSDecimal.Create;


//  try
//    frmRQCentralExportAnalyseEdit:=TfrmRQCentralExportAnalyseEdit.Create(Application, dsInsert);
//    try
//      if frmRQCentralExportAnalyseEdit.ShowModal = mrOk then
//      begin
//        if RQCentralExportAnalyseObj<>nil then
//            //TempRQCentralExportAnalyse.add(RQCentralExportAnalyseObj);
//            UpdateGrid(Sender);
//      end;
//    finally
//      frmRQCentralExportAnalyseEdit.Free;
//      frmRQCentralExportAnalyseEdit:=nil;
//    end;
//  finally
//    RQCentralExportAnalyseObj.Free;
//  end;
end;

procedure TfrmRQCentralExportAnalyseShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQCentralExportAnalyseShow.actFilterExecute(Sender: TObject);
begin
{frmRQCentralExportAnalyseFilterEdit:=TfrmRQCentralExportAnalyseFilterEdit.Create(Application, dsInsert);
  try
    RQCentralExportAnalyseFilterObj := RQCentralExportAnalyseFilter.Create;
    SetNullIntProps(RQCentralExportAnalyseFilterObj);
    SetNullXSProps(RQCentralExportAnalyseFilterObj);

    if frmRQCentralExportAnalyseFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQCentralExportAnalyseFilter.Create;
      FilterObject := RQCentralExportAnalyseFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQCentralExportAnalyseFilterEdit.Free;
    frmRQCentralExportAnalyseFilterEdit:=nil;
  end;}
end;

procedure TfrmRQCentralExportAnalyseShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmRQCentralExportAnalyseShow.actExport2ExcelExecute(Sender: TObject);
begin
  inherited;
   DMReports.exportGrid(sgRQCentralExportAnalyse, '__');
end;

function  TfrmRQCentralExportAnalyseShow.getColorForCell(cause : integer ;  centralGraph : integer ): Tcolor;
begin
//   if ((cause > 0) and (centralGraph = 0))  then
//    result := $0000FF
//   else if ((cause > 0) and (centralGraph > 0))  then
//   result := $00FFFF
//   else if ((cause = 0) and (centralGraph > 0))  then
//   result := $008000
//   else
//   result := ;

   if ((cause > 0) and (centralGraph = 0))  then
    result := clRed
   else if ((cause > 0) and (centralGraph > 0))  then
   result := clYellow
   else if ((cause = 0) and (centralGraph > 0))  then
   result := clGreen
   else
   result := clNone;


end;

procedure TfrmRQCentralExportAnalyseShow.UpdateAnalyseData(Sender: TObject);
var
  TempRQCentralExportAnalyse: RQCentralExportAnalyseControllerSoapPort;
  i: Integer;
  RQCentralExportAnalyseList: RQCentralExportAnalyseShortList;
  c: Integer;
  v: Integer;

  begin


  ColCount:=100;
  TempRQCentralExportAnalyse :=  HTTPRIORQCentralExportAnalyse as RQCentralExportAnalyseControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQCentralExportAnalyseFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQCentralExportAnalyseList :=
 // TempRQCentralExportAnalyse.getScrollableFilteredList(RQCentralExportAnalyseFilter(FilterObject),0,ColCount);
  TempRQCentralExportAnalyse.getScrollableFilteredList(DateTimeToStr(edtDateStart.DateTime),
   DateTimeToStr(edtDateFinal.DateTime) , LOW_INT );


  LastCount:=High(RQCentralExportAnalyseList.list);

  if LastCount > -1 then
     sgRQCentralExportAnalyse.RowCount:=LastCount+2
  else
     sgRQCentralExportAnalyse.RowCount:=2;

   sgRQCentralExportAnalyse.RowCount:= sgRQCentralExportAnalyse.RowCount+1;

   with sgRQCentralExportAnalyse do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQCentralExportAnalyseList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQCentralExportAnalyseList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQCentralExportAnalyseList.list[i].dateStart;
        //AddColorComment(1,i+1, ' дата ', clMaroon );

        if RQCentralExportAnalyseList.list[i].countplan_Aparat = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := RQCentralExportAnalyseList.list[i].countplan_Aparat.DecimalString;

          Colors[2, i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Aparat
                                            , RQCentralExportAnalyseList.list[i].central_Export_Aparat );

         Objects[2,i+1] := TObject(3);// код подразделения  TObject(RQCentralExportAnalyseList.list[i].code);
         //AddColorComment(2,i+1, ' Маса матеріалу з плану ', clMaroon );

        if RQCentralExportAnalyseList.list[i].dif_Aparat = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQCentralExportAnalyseList.list[i].dif_Aparat.DecimalString;

          Colors[3, i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Aparat
                                            , RQCentralExportAnalyseList.list[i].central_Export_Aparat );

         Objects[3,i+1] := TObject(3);// код подразделения  TObject(RQCentralExportAnalyseList.list[i].code);
         //

        if RQCentralExportAnalyseList.list[i].countplan_Visokop = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQCentralExportAnalyseList.list[i].countplan_Visokop.DecimalString;
          Colors[4,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Visokop
                                            , RQCentralExportAnalyseList.list[i].central_Export_Visokop );
          Objects[4,i+1] := TObject(7);// код подразделения

        if RQCentralExportAnalyseList.list[i].dif_Visokop = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQCentralExportAnalyseList.list[i].dif_Visokop.DecimalString;
          Colors[5,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Visokop
                                            , RQCentralExportAnalyseList.list[i].central_Export_Visokop );
          Objects[5,i+1] := TObject(7);// код подразделения
         //


        if RQCentralExportAnalyseList.list[i].countplan_Vlepetih = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := RQCentralExportAnalyseList.list[i].countplan_Vlepetih.DecimalString;
          Colors[6,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Vlepetih
                                            , RQCentralExportAnalyseList.list[i].central_Export_Vlepetih );
          Objects[6,i+1] := TObject(12);// код подразделения

        if RQCentralExportAnalyseList.list[i].dif_Vlepetih = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQCentralExportAnalyseList.list[i].dif_Vlepetih.DecimalString;
          Colors[7,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Vlepetih
                                            , RQCentralExportAnalyseList.list[i].central_Export_Vlepetih );
          Objects[7,i+1] := TObject(12);// код подразделения
         //


        if RQCentralExportAnalyseList.list[i].countplan_Genichesk = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := RQCentralExportAnalyseList.list[i].countplan_Genichesk.DecimalString;
          Colors[8,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Genichesk
                                            , RQCentralExportAnalyseList.list[i].central_Export_Genichesk );
          Objects[8,i+1] := TObject(14);// код подразделения

        if RQCentralExportAnalyseList.list[i].dif_Genichesk = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQCentralExportAnalyseList.list[i].dif_Genichesk.DecimalString;
          Colors[9,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Genichesk
                                            , RQCentralExportAnalyseList.list[i].central_Export_Genichesk );
          Objects[9,i+1] := TObject(14);// код подразделения
         ////


        if RQCentralExportAnalyseList.list[i].countplan_Gpristan = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := RQCentralExportAnalyseList.list[i].countplan_Gpristan.DecimalString;
          Colors[10,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Gpristan
                                            , RQCentralExportAnalyseList.list[i].central_Export_Gpristan );
          Objects[10,i+1] := TObject(8);// код подразделения

        if RQCentralExportAnalyseList.list[i].dif_Gpristan = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := RQCentralExportAnalyseList.list[i].dif_Gpristan.DecimalString;
          Colors[11,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Gpristan
                                            , RQCentralExportAnalyseList.list[i].central_Export_Gpristan );
          Objects[11,i+1] := TObject(8);// код подразделения
          //


        if RQCentralExportAnalyseList.list[i].countplan_Ivanovka = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := RQCentralExportAnalyseList.list[i].countplan_Ivanovka.DecimalString;
          Colors[12,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Ivanovka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Ivanovka );
          Objects[12,i+1] := TObject(18);// код подразделения

          if RQCentralExportAnalyseList.list[i].dif_Ivanovka = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := RQCentralExportAnalyseList.list[i].dif_Ivanovka.DecimalString;
          Colors[13,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Ivanovka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Ivanovka );
          Objects[13,i+1] := TObject(18);// код подразделения
         ///


        if RQCentralExportAnalyseList.list[i].countplan_Kahovka = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := RQCentralExportAnalyseList.list[i].countplan_Kahovka.DecimalString;
          Colors[14,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Kahovka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Kahovka );
          Objects[14,i+1] := TObject(17);// код подразделения

         if RQCentralExportAnalyseList.list[i].dif_Kahovka = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := RQCentralExportAnalyseList.list[i].dif_Kahovka.DecimalString;
          Colors[15,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Kahovka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Kahovka );
          Objects[15,i+1] := TObject(17);// код подразделения
         //

        if RQCentralExportAnalyseList.list[i].countplan_Nkahovka = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := RQCentralExportAnalyseList.list[i].countplan_Nkahovka.DecimalString;
          Colors[16,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Nkahovka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Nkahovka );
          Objects[16,i+1] := TObject(480);// код подразделения

         if RQCentralExportAnalyseList.list[i].dif_Nkahovka = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := RQCentralExportAnalyseList.list[i].dif_Nkahovka.DecimalString;
          Colors[17,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Nkahovka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Nkahovka );
          Objects[17,i+1] := TObject(480);// код подразделения
          ////////


        if RQCentralExportAnalyseList.list[i].countplan_Ntroick = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := RQCentralExportAnalyseList.list[i].countplan_Ntroick.DecimalString;
          Colors[18,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Ntroick
                                            , RQCentralExportAnalyseList.list[i].central_Export_Ntroick );
          Objects[18,i+1] := TObject(478);// код подразделения

        if RQCentralExportAnalyseList.list[i].dif_Ntroick = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := RQCentralExportAnalyseList.list[i].dif_Ntroick.DecimalString;
          Colors[19,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Ntroick
                                            , RQCentralExportAnalyseList.list[i].central_Export_Ntroick );
          Objects[19,i+1] := TObject(478);// код подразделения
          ///////


        if RQCentralExportAnalyseList.list[i].countplan_Skadovsk = nil then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := RQCentralExportAnalyseList.list[i].countplan_Skadovsk.DecimalString;
          Colors[20,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Skadovsk
                                            , RQCentralExportAnalyseList.list[i].central_Export_Skadovsk );
          Objects[20,i+1] := TObject(10);// код подразделения

          if RQCentralExportAnalyseList.list[i].dif_Skadovsk = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := RQCentralExportAnalyseList.list[i].dif_Skadovsk.DecimalString;
          Colors[21,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Skadovsk
                                            , RQCentralExportAnalyseList.list[i].central_Export_Skadovsk );
          Objects[21,i+1] := TObject(10);// код подразделения
          ///////


        if RQCentralExportAnalyseList.list[i].countplan_Hmve = nil then
          Cells[22,i+1] := ''
        else
          Cells[22,i+1] := RQCentralExportAnalyseList.list[i].countplan_Hmve.DecimalString;
          Colors[22,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Hmve
                                            , RQCentralExportAnalyseList.list[i].central_Export_Hmve );
          Objects[22,i+1] := TObject(482);// код подразделения

         if RQCentralExportAnalyseList.list[i].dif_Hmve = nil then
          Cells[23,i+1] := ''
        else
          Cells[23,i+1] := RQCentralExportAnalyseList.list[i].dif_Hmve.DecimalString;
          Colors[23,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Hmve
                                            , RQCentralExportAnalyseList.list[i].central_Export_Hmve );
          Objects[23,i+1] := TObject(482);// код подразделения
         ///

         if RQCentralExportAnalyseList.list[i].countplan_Hmem = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := RQCentralExportAnalyseList.list[i].countplan_Hmem.DecimalString;
          Colors[24,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Hmem
                                            , RQCentralExportAnalyseList.list[i].central_Export_Hmem );
          Objects[24,i+1] := TObject(481);// код подразделения

         if RQCentralExportAnalyseList.list[i].dif_Hmem = nil then
          Cells[25,i+1] := ''
        else
          Cells[25,i+1] := RQCentralExportAnalyseList.list[i].dif_Hmem.DecimalString;
          Colors[25,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Hmem
                                            , RQCentralExportAnalyseList.list[i].central_Export_Hmem );
          Objects[25,i+1] := TObject(481);// код подразделения
         /////


        if RQCentralExportAnalyseList.list[i].countplan_Curup = nil then
          Cells[26,i+1] := ''
        else
          Cells[26,i+1] := RQCentralExportAnalyseList.list[i].countplan_Curup.DecimalString;
          Colors[26,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Curup
                                            , RQCentralExportAnalyseList.list[i].central_Export_Curup );
          Objects[26,i+1] := TObject(11);// код подразделения
        if RQCentralExportAnalyseList.list[i].dif_Curup = nil then
          Cells[27,i+1] := ''
        else
          Cells[27,i+1] := RQCentralExportAnalyseList.list[i].dif_Curup.DecimalString;
          Colors[27,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Curup
                                            , RQCentralExportAnalyseList.list[i].central_Export_Curup );
          Objects[27,i+1] := TObject(11);// код подразделения
         ////////


        if RQCentralExportAnalyseList.list[i].countplan_Chaplinka = nil then
          Cells[28,i+1] := ''
        else
          Cells[28,i+1] := RQCentralExportAnalyseList.list[i].countplan_Chaplinka.DecimalString;
          Colors[28,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Chaplinka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Chaplinka );
          Objects[28,i+1] := TObject(479);// код подразделения

        if RQCentralExportAnalyseList.list[i].dif_Chaplinka = nil then
          Cells[29,i+1] := ''
        else
          Cells[29,i+1] := RQCentralExportAnalyseList.list[i].dif_Chaplinka.DecimalString;
          Colors[29,i+1] := getColorForCell( RQCentralExportAnalyseList.list[i].cause_Chaplinka
                                            , RQCentralExportAnalyseList.list[i].central_Export_Chaplinka );
          Objects[29,i+1] := TObject(479);// код подразделения



       // LastRow:=i+1;
       // sgRQCentralExportAnalyse.RowCount:=LastRow+1;

//        for v := 1 to 15 do
//           FontSizes[v,i+1]:= 7;

      end;
       // for footer sum



      for c := 1 to 29 do
        sgRQCentralExportAnalyse.ColWidths[c]:= 60;


   sgRQCentralExportAnalyse.Row:=1;

  // sgRQCentralExportAnalyse.FloatingFooter.Visible := True; // show the floating footer
   //sgRQCentralExportAnalyse.FloatingFooter.FooterStyle := fsColumnPreview;
  // sgRQCentralExportAnalyse.FloatingFooter.ColumnCalc[2] := acSUM; // set the calculation type for the column co
  // sgRQCentralExportAnalyse.FloatingFooter.ColumnCalc[3] := acSUM
//   sgRQCentralExportAnalyse.Options := sgRQCentralExportAnalyse.Options + [goEditing];
//   sgRQCentralExportAnalyse.FloatingFooter.Visible := true;
//   sgRQCentralExportAnalyse.FloatingFooter.ColumnCalc[2] := acSUM;

     UpdateSums;
end;

procedure TfrmRQCentralExportAnalyseShow.UpdateSums;
var
  i: Integer;
begin
  for i := 1 to sgRQCentralExportAnalyse.ColCount - 1 do
    sgRQCentralExportAnalyse.Floats[i,sgRQCentralExportAnalyse.RowCount - 1] :=
      sgRQCentralExportAnalyse.ColumnSum(i,1,sgRQCentralExportAnalyse.RowCount - 2);
      sgRQCentralExportAnalyse.FloatingFooter.Invalidate;

end;

end.