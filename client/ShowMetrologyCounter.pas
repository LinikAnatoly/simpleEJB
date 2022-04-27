
unit ShowMetrologyCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMetrologyCounterController, AdvObj ;


type
  TfrmMetrologyCounterShow = class(TChildForm)
  HTTPRIOENMetrologyCounter: THTTPRIO;
    ImageList1: TImageList;
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
    sgENMetrologyCounter: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENMetrologyCounterTopLeftChanged(Sender: TObject);
procedure sgENMetrologyCounterDblClick(Sender: TObject);
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
 public
   showdistinctname : boolean;

   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENMetrologyCounterObj: ENMetrologyCounter;
 // ENMetrologyCounterFilterObj: ENMetrologyCounterFilter;
  
  
implementation

uses Main, EditENMetrologyCounter, EditENMetrologyCounterFilter,
  ShowENMetrologyCounter;


{$R *.dfm}

var
  //frmENMetrologyCounterShow : TfrmENMetrologyCounterShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMetrologyCounterHeaders: array [1..12] of String =
        ( 'Код'
          ,'Інв. номер'
          ,'Найменування лічильника'
          ,'Заводський номер'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МОЛа'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Вартість'
          ,'код з ScanCounter'
          ,'Тип лічильника'
        );
   

procedure TfrmMetrologyCounterShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMetrologyCounterShow:=nil;
    inherited;
  end;


procedure TfrmMetrologyCounterShow.FormCreate(Sender: TObject);
begin
    showdistinctname := false;
end;

procedure TfrmMetrologyCounterShow.FormShow(Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  i: Integer;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
  begin

  SetGridHeaders(ENMetrologyCounterHeaders, sgENMetrologyCounter.ColumnHeaders);
  ColCount:=100;
  TempENMetrologyCounter :=  HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyCounterFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if showdistinctname = true then
    ENMetrologyCounterList := TempENMetrologyCounter.getCountersListDistinctName(ENMetrologyCounterFilter(FilterObject),0,ColCount)
    else
  ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(ENMetrologyCounterFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMetrologyCounterList.list);

  if LastCount > -1 then
     sgENMetrologyCounter.RowCount:=LastCount+2
  else
     sgENMetrologyCounter.RowCount:=2;

   with sgENMetrologyCounter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyCounterList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMetrologyCounterList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMetrologyCounterList.list[i].invNumber;
        Cells[2,i+1] := ENMetrologyCounterList.list[i].name;
        Cells[3,i+1] := ENMetrologyCounterList.list[i].buildNumber;
        Cells[4,i+1] := ENMetrologyCounterList.list[i].account;
        Cells[5,i+1] := ENMetrologyCounterList.list[i].departmetFKCode;
        Cells[6,i+1] := ENMetrologyCounterList.list[i].molCode;
        if ENMetrologyCounterList.list[i].dateIn = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENMetrologyCounterList.list[i].dateIn);
        if ENMetrologyCounterList.list[i].dateBuild = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENMetrologyCounterList.list[i].dateBuild);
        if ENMetrologyCounterList.list[i].cost = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENMetrologyCounterList.list[i].cost.DecimalString;
        if ENMetrologyCounterList.list[i].scCode = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(ENMetrologyCounterList.list[i].scCode);
        Cells[11,i+1] := ENMetrologyCounterList.list[i].counterType;
        LastRow:=i+1;
        sgENMetrologyCounter.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMetrologyCounter.Row:=1;
end;

procedure TfrmMetrologyCounterShow.sgENMetrologyCounterTopLeftChanged(Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  i,CurrentRow: Integer;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMetrologyCounter.TopRow + sgENMetrologyCounter.VisibleRowCount) = ColCount
  then
    begin
      TempENMetrologyCounter :=  HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
      CurrentRow:=sgENMetrologyCounter.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyCounterFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if showdistinctname = true then
  ENMetrologyCounterList := TempENMetrologyCounter.getCountersListDistinctName(ENMetrologyCounterFilter(FilterObject),0,ColCount)
    else
  ENMetrologyCounterList := TempENMetrologyCounter.getCountersList(ENMetrologyCounterFilter(FilterObject),0,ColCount);



  sgENMetrologyCounter.RowCount:=sgENMetrologyCounter.RowCount+100;
  LastCount:=High(ENMetrologyCounterList.list);
  with sgENMetrologyCounter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyCounterList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMetrologyCounterList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMetrologyCounterList.list[i].invNumber;
        Cells[2,i+CurrentRow] := ENMetrologyCounterList.list[i].name;
        Cells[3,i+CurrentRow] := ENMetrologyCounterList.list[i].buildNumber;
        Cells[4,i+CurrentRow] := ENMetrologyCounterList.list[i].account;
        Cells[5,i+CurrentRow] := ENMetrologyCounterList.list[i].departmetFKCode;
        Cells[6,i+CurrentRow] := ENMetrologyCounterList.list[i].molCode;
        if ENMetrologyCounterList.list[i].dateIn = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDate2String(ENMetrologyCounterList.list[i].dateIn);
        if ENMetrologyCounterList.list[i].dateBuild = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENMetrologyCounterList.list[i].dateBuild);
        if ENMetrologyCounterList.list[i].cost = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENMetrologyCounterList.list[i].cost.DecimalString;
        if ENMetrologyCounterList.list[i].scCode = Low(Integer) then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := IntToStr(ENMetrologyCounterList.list[i].scCode);
        Cells[11,i+CurrentRow] := ENMetrologyCounterList.list[i].counterType;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMetrologyCounter.Row:=CurrentRow-5;
   sgENMetrologyCounter.RowCount:=LastRow+1;
  end;
end;

procedure TfrmMetrologyCounterShow.sgENMetrologyCounterDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMetrologyCounter,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmMetrologyCounterShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMetrologyCounter.RowCount-1 do
   for j:=0 to sgENMetrologyCounter.ColCount-1 do
     sgENMetrologyCounter.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmMetrologyCounterShow.actViewExecute(Sender: TObject);
Var TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
begin
 TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
   try
     ENMetrologyCounterObj := TempENMetrologyCounter.getObject(StrToInt(sgENMetrologyCounter.Cells[0,sgENMetrologyCounter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyCounterEdit:=TfrmENMetrologyCounterEdit.Create(Application, dsView);
  try
    frmENMetrologyCounterEdit.ShowModal;
  finally
    frmENMetrologyCounterEdit.Free;
    frmENMetrologyCounterEdit:=nil;
  end;
end;

procedure TfrmMetrologyCounterShow.actEditExecute(Sender: TObject);
Var TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
begin
 TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
   try
     ENMetrologyCounterObj := TempENMetrologyCounter.getObject(StrToInt(sgENMetrologyCounter.Cells[0,sgENMetrologyCounter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyCounterEdit:=TfrmENMetrologyCounterEdit.Create(Application, dsEdit);
  try
    if frmENMetrologyCounterEdit.ShowModal= mrOk then
      begin
        //TempENMetrologyCounter.save(ENMetrologyCounterObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMetrologyCounterEdit.Free;
    frmENMetrologyCounterEdit:=nil;
  end;
end;

procedure TfrmMetrologyCounterShow.actDeleteExecute(Sender: TObject);
Var TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMetrologyCounter.Cells[0,sgENMetrologyCounter.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Прилади обліку Метрології) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMetrologyCounter.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmMetrologyCounterShow.actInsertExecute(Sender: TObject);
Var TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
begin
  TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;
  ENMetrologyCounterObj:=ENMetrologyCounter.Create;

   ENMetrologyCounterObj.dateIn:= TXSDate.Create;
   ENMetrologyCounterObj.dateBuild:= TXSDate.Create;
   ENMetrologyCounterObj.cost:= TXSDecimal.Create;


  try
    frmENMetrologyCounterEdit:=TfrmENMetrologyCounterEdit.Create(Application, dsInsert);
    try
      if frmENMetrologyCounterEdit.ShowModal = mrOk then
      begin
        if ENMetrologyCounterObj<>nil then
            //TempENMetrologyCounter.add(ENMetrologyCounterObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMetrologyCounterEdit.Free;
      frmENMetrologyCounterEdit:=nil;
    end;
  finally
    ENMetrologyCounterObj.Free;
  end;
end;

procedure TfrmMetrologyCounterShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmMetrologyCounterShow.actFilterExecute(Sender: TObject);
begin
frmENMetrologyCounterFilterEdit:=TfrmENMetrologyCounterFilterEdit.Create(Application, dsEdit);
  try
    ENMetrologyCounterFilterObj := ENMetrologyCounterFilter.Create;
    SetNullIntProps(ENMetrologyCounterFilterObj);
    SetNullXSProps(ENMetrologyCounterFilterObj);

    if frmENMetrologyCounterFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMetrologyCounterFilter.Create;
      FilterObject := ENMetrologyCounterFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMetrologyCounterFilterEdit.Free;
    frmENMetrologyCounterFilterEdit:=nil;
  end;
end;

procedure TfrmMetrologyCounterShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.