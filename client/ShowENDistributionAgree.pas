
unit ShowENDistributionAgree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENDistributionAgreeController, AdvObj ;


type
    TfrmENDistributionAgreeShow = class(TChildForm)  
    HTTPRIOENDistributionAgree: THTTPRIO;
    ImageList1: TImageList;
    sgENDistributionAgree: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENDistributionAgreeTopLeftChanged(Sender: TObject);
    procedure sgENDistributionAgreeDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENDistributionAgreeObj: ENDistributionAgree;
 // ENDistributionAgreeFilterObj: ENDistributionAgreeFilter;
  
  
implementation

uses Main, EditENDistributionAgree, EditENDistributionAgreeFilter;


{$R *.dfm}

var
  frmENDistributionAgreeShow : TfrmENDistributionAgreeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDistributionAgreeHeaders: array [1..37] of String =
        ( 'Код'
          ,'EIC код'
          ,'Найменування об''єкту'
          ,'Адреса об''єкту'
          ,'Потужність об''єкту'
          ,'Найменування лічільника (Д.3)'
          ,'Найменування типу лічільника (Д.3)'
          ,'Струм к-т (Д.3)'
          ,'Напруга к-т (Д.3)'
          ,'Загальний к-т (Д.3)'
          ,'Місце втановлення лічільника (Д.3)'
          ,'Клас напруги (Д.3)'
          ,'Режим роботи (Д.3)'
          ,'Тип тарифу (Д.3)'
          ,'Вид обліку (Д.3)'
          ,'Фідер ГАВ (Д.5)'
          ,'Категорія надійності згідно ПУЕ (Д.6)'
          ,'Категорія надійності гарантована схемою (Д.6)'
          ,'Балансова належність оператору системи (Д.6)'
          ,'Балансова належність споживача (Д.6)'
          ,'Межа відповідальності оператору системи (Д.6)'
          ,'Межа відповідальності споживача (Д.6)'
          ,'Найменування лінії (Д.7)'
          ,'Ссылка на файл-схему (Д.7)'
          ,'Особливі умови (Д.8)'
          ,'Тип трансформатору (Д.8)'
          ,'Номінальна напруга ВН (Д.8)'
          ,'Номінальна напруга НН (Д.8)'
          ,'Втрати активної потужності ХХ (Д.8)'
          ,'Втрати активної потужності КЗ (Д.8)'
          ,'Струм І хх (Д.8)'
          ,'Напруга КЗ (Д.8)'
          ,'Довжина лінії (Д.8)'
          ,'Опір лінії R (Д.8)'
          ,'Опір лінії X(Д.8)'
          ,'Кількість годин роботи з навантаженнями'
          ,'Користувач, який вніс зміни'
        );
   

procedure TfrmENDistributionAgreeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENDistributionAgreeShow:=nil;
  inherited;
end;


procedure TfrmENDistributionAgreeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENDistributionAgreeShow.FormShow(Sender: TObject);
var
  TempENDistributionAgree: ENDistributionAgreeControllerSoapPort;
  i: Integer;
  ENDistributionAgreeList: ENDistributionAgreeShortList;
begin
  SetGridHeaders(ENDistributionAgreeHeaders, sgENDistributionAgree.ColumnHeaders);
  ColCount:=100;
  TempENDistributionAgree :=  HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDistributionAgreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDistributionAgreeList := TempENDistributionAgree.getScrollableFilteredList(ENDistributionAgreeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENDistributionAgreeList.list);

  if LastCount > -1 then
     sgENDistributionAgree.RowCount:=LastCount+2
  else
     sgENDistributionAgree.RowCount:=2;

   with sgENDistributionAgree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDistributionAgreeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDistributionAgreeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDistributionAgreeList.list[i].eic;
        Cells[2,i+1] := ENDistributionAgreeList.list[i].objectname;
        Cells[3,i+1] := ENDistributionAgreeList.list[i].objectaddress;
        if ENDistributionAgreeList.list[i].power = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENDistributionAgreeList.list[i].power.DecimalString;
        Cells[5,i+1] := ENDistributionAgreeList.list[i].d3countername;
        Cells[6,i+1] := ENDistributionAgreeList.list[i].d3countertype;
        if ENDistributionAgreeList.list[i].d3amperageratio = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENDistributionAgreeList.list[i].d3amperageratio.DecimalString;
        if ENDistributionAgreeList.list[i].d3voltageratio = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENDistributionAgreeList.list[i].d3voltageratio.DecimalString;
        if ENDistributionAgreeList.list[i].d3totalratio = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENDistributionAgreeList.list[i].d3totalratio.DecimalString;
        Cells[10,i+1] := ENDistributionAgreeList.list[i].d3place;
        Cells[11,i+1] := ENDistributionAgreeList.list[i].d3voltageclass;
        Cells[12,i+1] := ENDistributionAgreeList.list[i].d3workmode;
        Cells[13,i+1] := ENDistributionAgreeList.list[i].d3tarifftype;
        Cells[14,i+1] := ENDistributionAgreeList.list[i].d3accountingtype;
        Cells[15,i+1] := ENDistributionAgreeList.list[i].d5feederlist;
        Cells[16,i+1] := ENDistributionAgreeList.list[i].d6reliabilitypue;
        Cells[17,i+1] := ENDistributionAgreeList.list[i].d6reliabilityguaranteed;
        Cells[18,i+1] := ENDistributionAgreeList.list[i].d6balancesupplier;
        Cells[19,i+1] := ENDistributionAgreeList.list[i].d6balanceclient;
        Cells[20,i+1] := ENDistributionAgreeList.list[i].d6responsibilitysupplier;
        Cells[21,i+1] := ENDistributionAgreeList.list[i].d6responsibilityclient;
        Cells[22,i+1] := ENDistributionAgreeList.list[i].d7linesource;
        Cells[23,i+1] := ENDistributionAgreeList.list[i].d7attachment;
        Cells[24,i+1] := ENDistributionAgreeList.list[i].d8conditions;
        Cells[25,i+1] := ENDistributionAgreeList.list[i].d8transformertype;
        if ENDistributionAgreeList.list[i].d8voltagebh = nil then
          Cells[26,i+1] := ''
        else
          Cells[26,i+1] := ENDistributionAgreeList.list[i].d8voltagebh.DecimalString;
        if ENDistributionAgreeList.list[i].d8voltagehh = nil then
          Cells[27,i+1] := ''
        else
          Cells[27,i+1] := ENDistributionAgreeList.list[i].d8voltagehh.DecimalString;
        if ENDistributionAgreeList.list[i].d8lossesxx = nil then
          Cells[28,i+1] := ''
        else
          Cells[28,i+1] := ENDistributionAgreeList.list[i].d8lossesxx.DecimalString;
        if ENDistributionAgreeList.list[i].d8losseskz = nil then
          Cells[29,i+1] := ''
        else
          Cells[29,i+1] := ENDistributionAgreeList.list[i].d8losseskz.DecimalString;
        if ENDistributionAgreeList.list[i].d8amperage = nil then
          Cells[30,i+1] := ''
        else
          Cells[30,i+1] := ENDistributionAgreeList.list[i].d8amperage.DecimalString;
        if ENDistributionAgreeList.list[i].d8voltagekz = nil then
          Cells[31,i+1] := ''
        else
          Cells[31,i+1] := ENDistributionAgreeList.list[i].d8voltagekz.DecimalString;
        if ENDistributionAgreeList.list[i].d8linelength = nil then
          Cells[32,i+1] := ''
        else
          Cells[32,i+1] := ENDistributionAgreeList.list[i].d8linelength.DecimalString;
        if ENDistributionAgreeList.list[i].d8liner = nil then
          Cells[33,i+1] := ''
        else
          Cells[33,i+1] := ENDistributionAgreeList.list[i].d8liner.DecimalString;
        if ENDistributionAgreeList.list[i].d8linex = nil then
          Cells[34,i+1] := ''
        else
          Cells[34,i+1] := ENDistributionAgreeList.list[i].d8linex.DecimalString;
        if ENDistributionAgreeList.list[i].d8hours = Low(Integer) then
          Cells[35,i+1] := ''
        else
          Cells[35,i+1] := IntToStr(ENDistributionAgreeList.list[i].d8hours);
        Cells[36,i+1] := ENDistributionAgreeList.list[i].userGen;
        LastRow:=i+1;
        sgENDistributionAgree.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENDistributionAgree.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENDistributionAgree.RowCount > selectedRow then
      sgENDistributionAgree.Row := selectedRow
    else
      sgENDistributionAgree.Row := sgENDistributionAgree.RowCount - 1;
    end
    else
      sgENDistributionAgree.Row:=1;   
end;


procedure TfrmENDistributionAgreeShow.sgENDistributionAgreeTopLeftChanged(Sender: TObject);
var
  TempENDistributionAgree: ENDistributionAgreeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDistributionAgreeList: ENDistributionAgreeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDistributionAgree.TopRow + sgENDistributionAgree.VisibleRowCount) = ColCount
  then
    begin
      TempENDistributionAgree :=  HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;
      CurrentRow:=sgENDistributionAgree.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDistributionAgreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDistributionAgreeList := TempENDistributionAgree.getScrollableFilteredList(ENDistributionAgreeFilter(FilterObject),ColCount-1, 100);


  sgENDistributionAgree.RowCount:=sgENDistributionAgree.RowCount+100;
  LastCount:=High(ENDistributionAgreeList.list);
  with sgENDistributionAgree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDistributionAgreeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDistributionAgreeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDistributionAgreeList.list[i].eic;
        Cells[2,i+CurrentRow] := ENDistributionAgreeList.list[i].objectname;
        Cells[3,i+CurrentRow] := ENDistributionAgreeList.list[i].objectaddress;
        if ENDistributionAgreeList.list[i].power = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENDistributionAgreeList.list[i].power.DecimalString;
        Cells[5,i+CurrentRow] := ENDistributionAgreeList.list[i].d3countername;
        Cells[6,i+CurrentRow] := ENDistributionAgreeList.list[i].d3countertype;
        if ENDistributionAgreeList.list[i].d3amperageratio = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENDistributionAgreeList.list[i].d3amperageratio.DecimalString;
        if ENDistributionAgreeList.list[i].d3voltageratio = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENDistributionAgreeList.list[i].d3voltageratio.DecimalString;
        if ENDistributionAgreeList.list[i].d3totalratio = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENDistributionAgreeList.list[i].d3totalratio.DecimalString;
        Cells[10,i+CurrentRow] := ENDistributionAgreeList.list[i].d3place;
        Cells[11,i+CurrentRow] := ENDistributionAgreeList.list[i].d3voltageclass;
        Cells[12,i+CurrentRow] := ENDistributionAgreeList.list[i].d3workmode;
        Cells[13,i+CurrentRow] := ENDistributionAgreeList.list[i].d3tarifftype;
        Cells[14,i+CurrentRow] := ENDistributionAgreeList.list[i].d3accountingtype;
        Cells[15,i+CurrentRow] := ENDistributionAgreeList.list[i].d5feederlist;
        Cells[16,i+CurrentRow] := ENDistributionAgreeList.list[i].d6reliabilitypue;
        Cells[17,i+CurrentRow] := ENDistributionAgreeList.list[i].d6reliabilityguaranteed;
        Cells[18,i+CurrentRow] := ENDistributionAgreeList.list[i].d6balancesupplier;
        Cells[19,i+CurrentRow] := ENDistributionAgreeList.list[i].d6balanceclient;
        Cells[20,i+CurrentRow] := ENDistributionAgreeList.list[i].d6responsibilitysupplier;
        Cells[21,i+CurrentRow] := ENDistributionAgreeList.list[i].d6responsibilityclient;
        Cells[22,i+CurrentRow] := ENDistributionAgreeList.list[i].d7linesource;
        Cells[23,i+CurrentRow] := ENDistributionAgreeList.list[i].d7attachment;
        Cells[24,i+CurrentRow] := ENDistributionAgreeList.list[i].d8conditions;
        Cells[25,i+CurrentRow] := ENDistributionAgreeList.list[i].d8transformertype;
        if ENDistributionAgreeList.list[i].d8voltagebh = nil then
          Cells[26,i+CurrentRow] := ''
        else
          Cells[26,i+CurrentRow] := ENDistributionAgreeList.list[i].d8voltagebh.DecimalString;
        if ENDistributionAgreeList.list[i].d8voltagehh = nil then
          Cells[27,i+CurrentRow] := ''
        else
          Cells[27,i+CurrentRow] := ENDistributionAgreeList.list[i].d8voltagehh.DecimalString;
        if ENDistributionAgreeList.list[i].d8lossesxx = nil then
          Cells[28,i+CurrentRow] := ''
        else
          Cells[28,i+CurrentRow] := ENDistributionAgreeList.list[i].d8lossesxx.DecimalString;
        if ENDistributionAgreeList.list[i].d8losseskz = nil then
          Cells[29,i+CurrentRow] := ''
        else
          Cells[29,i+CurrentRow] := ENDistributionAgreeList.list[i].d8losseskz.DecimalString;
        if ENDistributionAgreeList.list[i].d8amperage = nil then
          Cells[30,i+CurrentRow] := ''
        else
          Cells[30,i+CurrentRow] := ENDistributionAgreeList.list[i].d8amperage.DecimalString;
        if ENDistributionAgreeList.list[i].d8voltagekz = nil then
          Cells[31,i+CurrentRow] := ''
        else
          Cells[31,i+CurrentRow] := ENDistributionAgreeList.list[i].d8voltagekz.DecimalString;
        if ENDistributionAgreeList.list[i].d8linelength = nil then
          Cells[32,i+CurrentRow] := ''
        else
          Cells[32,i+CurrentRow] := ENDistributionAgreeList.list[i].d8linelength.DecimalString;
        if ENDistributionAgreeList.list[i].d8liner = nil then
          Cells[33,i+CurrentRow] := ''
        else
          Cells[33,i+CurrentRow] := ENDistributionAgreeList.list[i].d8liner.DecimalString;
        if ENDistributionAgreeList.list[i].d8linex = nil then
          Cells[34,i+CurrentRow] := ''
        else
          Cells[34,i+CurrentRow] := ENDistributionAgreeList.list[i].d8linex.DecimalString;
        if ENDistributionAgreeList.list[i].d8hours = Low(Integer) then
          Cells[35,i+CurrentRow] := ''
        else
          Cells[35,i+CurrentRow] := IntToStr(ENDistributionAgreeList.list[i].d8hours);
        Cells[36,i+CurrentRow] := ENDistributionAgreeList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDistributionAgree.Row:=CurrentRow-5;
   sgENDistributionAgree.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDistributionAgreeShow.sgENDistributionAgreeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDistributionAgree,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENDistributionAgreeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENDistributionAgree.RowCount-1 do
   for j:=0 to sgENDistributionAgree.ColCount-1 do
     sgENDistributionAgree.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENDistributionAgreeShow.actViewExecute(Sender: TObject);
var 
  TempENDistributionAgree: ENDistributionAgreeControllerSoapPort;
begin
  TempENDistributionAgree := HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;
  try
    ENDistributionAgreeObj := TempENDistributionAgree.getObject(StrToInt(sgENDistributionAgree.Cells[0,sgENDistributionAgree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDistributionAgree.Row;
  frmENDistributionAgreeEdit:=TfrmENDistributionAgreeEdit.Create(Application, dsView);
  
  try
    frmENDistributionAgreeEdit.ShowModal;
  finally
    frmENDistributionAgreeEdit.Free;
    frmENDistributionAgreeEdit:=nil;
  end;

  if sgENDistributionAgree.RowCount > selectedRow then
    sgENDistributionAgree.Row := selectedRow
  else
    sgENDistributionAgree.Row := sgENDistributionAgree.RowCount - 1;
  
end;


procedure TfrmENDistributionAgreeShow.actEditExecute(Sender: TObject);
var 
  TempENDistributionAgree: ENDistributionAgreeControllerSoapPort;
begin
  TempENDistributionAgree := HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;
  try
    ENDistributionAgreeObj := TempENDistributionAgree.getObject(StrToInt(sgENDistributionAgree.Cells[0,sgENDistributionAgree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDistributionAgree.Row;
  frmENDistributionAgreeEdit:=TfrmENDistributionAgreeEdit.Create(Application, dsEdit);
  
  try
    if frmENDistributionAgreeEdit.ShowModal= mrOk then
      begin
        //TempENDistributionAgree.save(ENDistributionAgreeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDistributionAgreeEdit.Free;
    frmENDistributionAgreeEdit:=nil;
  end;

  if sgENDistributionAgree.RowCount > selectedRow then
    sgENDistributionAgree.Row := selectedRow
  else
    sgENDistributionAgree.Row := sgENDistributionAgree.RowCount - 1;
  
end;


procedure TfrmENDistributionAgreeShow.actDeleteExecute(Sender: TObject);
Var TempENDistributionAgree: ENDistributionAgreeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDistributionAgree := HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDistributionAgree.Cells[0,sgENDistributionAgree.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Договор распределения) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDistributionAgree.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDistributionAgreeShow.actInsertExecute(Sender: TObject);
// Var TempENDistributionAgree: ENDistributionAgreeControllerSoapPort; 
begin
  // TempENDistributionAgree := HTTPRIOENDistributionAgree as ENDistributionAgreeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDistributionAgreeObj:=ENDistributionAgree.Create;
  SetNullIntProps(ENDistributionAgreeObj);
  SetNullXSProps(ENDistributionAgreeObj);

   //ENDistributionAgreeObj.power:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d3amperageratio:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d3voltageratio:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d3totalratio:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8voltagebh:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8voltagehh:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8lossesxx:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8losseskz:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8amperage:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8voltagekz:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8linelength:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8liner:= TXSDecimal.Create;
   //ENDistributionAgreeObj.d8linex:= TXSDecimal.Create;


  try
    frmENDistributionAgreeEdit:=TfrmENDistributionAgreeEdit.Create(Application, dsInsert);
    try
      if frmENDistributionAgreeEdit.ShowModal = mrOk then
      begin
        if ENDistributionAgreeObj<>nil then
            //TempENDistributionAgree.add(ENDistributionAgreeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDistributionAgreeEdit.Free;
      frmENDistributionAgreeEdit:=nil;
    end;
  finally
    ENDistributionAgreeObj.Free;
  end;
end;


procedure TfrmENDistributionAgreeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENDistributionAgreeShow.actFilterExecute(Sender: TObject);
begin
{frmENDistributionAgreeFilterEdit:=TfrmENDistributionAgreeFilterEdit.Create(Application, dsInsert);
  try
    ENDistributionAgreeFilterObj := ENDistributionAgreeFilter.Create;
    SetNullIntProps(ENDistributionAgreeFilterObj);
    SetNullXSProps(ENDistributionAgreeFilterObj);

    if frmENDistributionAgreeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENDistributionAgreeFilter.Create;
      FilterObject := ENDistributionAgreeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDistributionAgreeFilterEdit.Free;
    frmENDistributionAgreeFilterEdit:=nil;
  end;}
end;


procedure TfrmENDistributionAgreeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.