
unit ShowENPlanWorkMoveHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkMoveHistoryController ;


type
  TfrmENPlanWorkMoveHistoryShow = class(TChildForm)  
  HTTPRIOENPlanWorkMoveHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkMoveHistory: TAdvStringGrid;
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
procedure sgENPlanWorkMoveHistoryTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkMoveHistoryDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENPlanWorkMoveHistoryObj: ENPlanWorkMoveHistory;
 // ENPlanWorkMoveHistoryFilterObj: ENPlanWorkMoveHistoryFilter;
  
  
implementation

uses Main, EditENPlanWorkMoveHistory, EditENPlanWorkMoveHistoryFilter;


{$R *.dfm}

var
  //frmENPlanWorkMoveHistoryShow : TfrmENPlanWorkMoveHistoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkMoveHistoryHeaders: array [1..6] of String =
        ( 'Код'
          ,'Дата зміни плану'
          ,'Попередній рік для виконання плану'
          ,'Попередній місяц для виконання плану'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENPlanWorkMoveHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkMoveHistoryShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkMoveHistoryShow.FormShow(Sender: TObject);
var
  TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
  i: Integer;
  ENPlanWorkMoveHistoryList: ENPlanWorkMoveHistoryShortList;
  begin
  SetGridHeaders(ENPlanWorkMoveHistoryHeaders, sgENPlanWorkMoveHistory.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkMoveHistory :=  HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkMoveHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkMoveHistoryList := TempENPlanWorkMoveHistory.getScrollableFilteredList(ENPlanWorkMoveHistoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkMoveHistoryList.list);

  if LastCount > -1 then
     sgENPlanWorkMoveHistory.RowCount:=LastCount+2
  else
     sgENPlanWorkMoveHistory.RowCount:=2;

   with sgENPlanWorkMoveHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkMoveHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkMoveHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanWorkMoveHistoryList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPlanWorkMoveHistoryList.list[i].dateGen);
        if ENPlanWorkMoveHistoryList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPlanWorkMoveHistoryList.list[i].yearGen);
        if ENPlanWorkMoveHistoryList.list[i].monthGen = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENPlanWorkMoveHistoryList.list[i].monthGen);
        Cells[4,i+1] := ENPlanWorkMoveHistoryList.list[i].userGen;
        if ENPlanWorkMoveHistoryList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENPlanWorkMoveHistoryList.list[i].dateEdit);
        LastRow:=i+1;
        sgENPlanWorkMoveHistory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkMoveHistory.Row:=1;
end;

procedure TfrmENPlanWorkMoveHistoryShow.sgENPlanWorkMoveHistoryTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkMoveHistoryList: ENPlanWorkMoveHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkMoveHistory.TopRow + sgENPlanWorkMoveHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkMoveHistory :=  HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;
      CurrentRow:=sgENPlanWorkMoveHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkMoveHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkMoveHistoryList := TempENPlanWorkMoveHistory.getScrollableFilteredList(ENPlanWorkMoveHistoryFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkMoveHistory.RowCount:=sgENPlanWorkMoveHistory.RowCount+100;
  LastCount:=High(ENPlanWorkMoveHistoryList.list);
  with sgENPlanWorkMoveHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkMoveHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkMoveHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPlanWorkMoveHistoryList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENPlanWorkMoveHistoryList.list[i].dateGen);
        if ENPlanWorkMoveHistoryList.list[i].yearGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENPlanWorkMoveHistoryList.list[i].yearGen);
        if ENPlanWorkMoveHistoryList.list[i].monthGen = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENPlanWorkMoveHistoryList.list[i].monthGen);
        Cells[4,i+CurrentRow] := ENPlanWorkMoveHistoryList.list[i].userGen;
        if ENPlanWorkMoveHistoryList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDate2String(ENPlanWorkMoveHistoryList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkMoveHistory.Row:=CurrentRow-5;
   sgENPlanWorkMoveHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkMoveHistoryShow.sgENPlanWorkMoveHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkMoveHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkMoveHistoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkMoveHistory.RowCount-1 do
   for j:=0 to sgENPlanWorkMoveHistory.ColCount-1 do
     sgENPlanWorkMoveHistory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkMoveHistoryShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
begin
 TempENPlanWorkMoveHistory := HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;
   try
     ENPlanWorkMoveHistoryObj := TempENPlanWorkMoveHistory.getObject(StrToInt(sgENPlanWorkMoveHistory.Cells[0,sgENPlanWorkMoveHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkMoveHistoryEdit:=TfrmENPlanWorkMoveHistoryEdit.Create(Application, dsView);
  try
    frmENPlanWorkMoveHistoryEdit.ShowModal;
  finally
    frmENPlanWorkMoveHistoryEdit.Free;
    frmENPlanWorkMoveHistoryEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkMoveHistoryShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
begin
 TempENPlanWorkMoveHistory := HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;
   try
     ENPlanWorkMoveHistoryObj := TempENPlanWorkMoveHistory.getObject(StrToInt(sgENPlanWorkMoveHistory.Cells[0,sgENPlanWorkMoveHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkMoveHistoryEdit:=TfrmENPlanWorkMoveHistoryEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkMoveHistoryEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkMoveHistory.save(ENPlanWorkMoveHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkMoveHistoryEdit.Free;
    frmENPlanWorkMoveHistoryEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkMoveHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkMoveHistory := HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkMoveHistory.Cells[0,sgENPlanWorkMoveHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Історія змін плану робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkMoveHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkMoveHistoryShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
begin
  TempENPlanWorkMoveHistory := HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;
  ENPlanWorkMoveHistoryObj:=ENPlanWorkMoveHistory.Create;

   ENPlanWorkMoveHistoryObj.dateGen:= TXSDate.Create;
   ENPlanWorkMoveHistoryObj.dateEdit:= TXSDate.Create;


  try
    frmENPlanWorkMoveHistoryEdit:=TfrmENPlanWorkMoveHistoryEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkMoveHistoryEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkMoveHistoryObj<>nil then
            //TempENPlanWorkMoveHistory.add(ENPlanWorkMoveHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkMoveHistoryEdit.Free;
      frmENPlanWorkMoveHistoryEdit:=nil;
    end;
  finally
    ENPlanWorkMoveHistoryObj.Free;
  end;
end;

procedure TfrmENPlanWorkMoveHistoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkMoveHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkMoveHistoryFilterEdit:=TfrmENPlanWorkMoveHistoryFilterEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkMoveHistoryFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanWorkMoveHistoryFilter.Create;
      FilterObject := ENPlanWorkMoveHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkMoveHistoryFilterEdit.Free;
    frmENPlanWorkMoveHistoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkMoveHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.