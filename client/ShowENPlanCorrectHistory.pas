
unit ShowENPlanCorrectHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanCorrectHistoryController ;


type
  TfrmENPlanCorrectHistoryShow = class(TChildForm)  
  HTTPRIOENPlanCorrectHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanCorrectHistory: TAdvStringGrid;
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
procedure sgENPlanCorrectHistoryTopLeftChanged(Sender: TObject);
procedure sgENPlanCorrectHistoryDblClick(Sender: TObject);
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
 // ENPlanCorrectHistoryObj: ENPlanCorrectHistory;
 // ENPlanCorrectHistoryFilterObj: ENPlanCorrectHistoryFilter;
  
  
implementation

uses Main, EditENPlanCorrectHistory, EditENPlanCorrectHistoryFilter;


{$R *.dfm}

var
  //frmENPlanCorrectHistoryShow : TfrmENPlanCorrectHistoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanCorrectHistoryHeaders: array [1..4] of String =
        ( 'Код'
          ,'Дата коригування плану'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENPlanCorrectHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanCorrectHistoryShow:=nil;
    inherited;
  end;


procedure TfrmENPlanCorrectHistoryShow.FormShow(Sender: TObject);
var
  TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
  i: Integer;
  ENPlanCorrectHistoryList: ENPlanCorrectHistoryShortList;
  begin
  SetGridHeaders(ENPlanCorrectHistoryHeaders, sgENPlanCorrectHistory.ColumnHeaders);
  ColCount:=100;
  TempENPlanCorrectHistory :=  HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanCorrectHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanCorrectHistoryList := TempENPlanCorrectHistory.getScrollableFilteredList(ENPlanCorrectHistoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanCorrectHistoryList.list);

  if LastCount > -1 then
     sgENPlanCorrectHistory.RowCount:=LastCount+2
  else
     sgENPlanCorrectHistory.RowCount:=2;

   with sgENPlanCorrectHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanCorrectHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanCorrectHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanCorrectHistoryList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPlanCorrectHistoryList.list[i].dateGen);
        Cells[2,i+1] := ENPlanCorrectHistoryList.list[i].userGen;
        if ENPlanCorrectHistoryList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENPlanCorrectHistoryList.list[i].dateEdit);
        LastRow:=i+1;
        sgENPlanCorrectHistory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanCorrectHistory.Row:=1;
end;

procedure TfrmENPlanCorrectHistoryShow.sgENPlanCorrectHistoryTopLeftChanged(Sender: TObject);
var
  TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanCorrectHistoryList: ENPlanCorrectHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanCorrectHistory.TopRow + sgENPlanCorrectHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanCorrectHistory :=  HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;
      CurrentRow:=sgENPlanCorrectHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanCorrectHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanCorrectHistoryList := TempENPlanCorrectHistory.getScrollableFilteredList(ENPlanCorrectHistoryFilter(FilterObject),ColCount-1, 100);



  sgENPlanCorrectHistory.RowCount:=sgENPlanCorrectHistory.RowCount+100;
  LastCount:=High(ENPlanCorrectHistoryList.list);
  with sgENPlanCorrectHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanCorrectHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanCorrectHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPlanCorrectHistoryList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENPlanCorrectHistoryList.list[i].dateGen);
        Cells[2,i+CurrentRow] := ENPlanCorrectHistoryList.list[i].userGen;
        if ENPlanCorrectHistoryList.list[i].dateEdit = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENPlanCorrectHistoryList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanCorrectHistory.Row:=CurrentRow-5;
   sgENPlanCorrectHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanCorrectHistoryShow.sgENPlanCorrectHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanCorrectHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanCorrectHistoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanCorrectHistory.RowCount-1 do
   for j:=0 to sgENPlanCorrectHistory.ColCount-1 do
     sgENPlanCorrectHistory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanCorrectHistoryShow.actViewExecute(Sender: TObject);
Var TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
begin
 TempENPlanCorrectHistory := HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;
   try
     ENPlanCorrectHistoryObj := TempENPlanCorrectHistory.getObject(StrToInt(sgENPlanCorrectHistory.Cells[0,sgENPlanCorrectHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanCorrectHistoryEdit:=TfrmENPlanCorrectHistoryEdit.Create(Application, dsView);
  try
    frmENPlanCorrectHistoryEdit.ShowModal;
  finally
    frmENPlanCorrectHistoryEdit.Free;
    frmENPlanCorrectHistoryEdit:=nil;
  end;
end;

procedure TfrmENPlanCorrectHistoryShow.actEditExecute(Sender: TObject);
Var TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
begin
 TempENPlanCorrectHistory := HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;
   try
     ENPlanCorrectHistoryObj := TempENPlanCorrectHistory.getObject(StrToInt(sgENPlanCorrectHistory.Cells[0,sgENPlanCorrectHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanCorrectHistoryEdit:=TfrmENPlanCorrectHistoryEdit.Create(Application, dsEdit);
  try
    if frmENPlanCorrectHistoryEdit.ShowModal= mrOk then
      begin
        //TempENPlanCorrectHistory.save(ENPlanCorrectHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanCorrectHistoryEdit.Free;
    frmENPlanCorrectHistoryEdit:=nil;
  end;
end;

procedure TfrmENPlanCorrectHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanCorrectHistory := HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanCorrectHistory.Cells[0,sgENPlanCorrectHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Історія коригувань плану робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanCorrectHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanCorrectHistoryShow.actInsertExecute(Sender: TObject);
Var TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
begin
  TempENPlanCorrectHistory := HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;
  ENPlanCorrectHistoryObj:=ENPlanCorrectHistory.Create;

   ENPlanCorrectHistoryObj.dateGen:= TXSDate.Create;
   ENPlanCorrectHistoryObj.dateEdit:= TXSDate.Create;


  try
    frmENPlanCorrectHistoryEdit:=TfrmENPlanCorrectHistoryEdit.Create(Application, dsInsert);
    try
      if frmENPlanCorrectHistoryEdit.ShowModal = mrOk then
      begin
        if ENPlanCorrectHistoryObj<>nil then
            //TempENPlanCorrectHistory.add(ENPlanCorrectHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanCorrectHistoryEdit.Free;
      frmENPlanCorrectHistoryEdit:=nil;
    end;
  finally
    ENPlanCorrectHistoryObj.Free;
  end;
end;

procedure TfrmENPlanCorrectHistoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanCorrectHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanCorrectHistoryFilterEdit:=TfrmENPlanCorrectHistoryFilterEdit.Create(Application, dsEdit);
  try
    if frmENPlanCorrectHistoryFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanCorrectHistoryFilter.Create;
      FilterObject := ENPlanCorrectHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanCorrectHistoryFilterEdit.Free;
    frmENPlanCorrectHistoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanCorrectHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.