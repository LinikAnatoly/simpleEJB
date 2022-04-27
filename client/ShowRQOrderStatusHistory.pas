
unit ShowRQOrderStatusHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderStatusHistoryController ;


type
  TfrmRQOrderStatusHistoryShow = class(TChildForm)  
  HTTPRIORQOrderStatusHistory: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderStatusHistory: TAdvStringGrid;
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
procedure sgRQOrderStatusHistoryTopLeftChanged(Sender: TObject);
procedure sgRQOrderStatusHistoryDblClick(Sender: TObject);
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
 // RQOrderStatusHistoryObj: RQOrderStatusHistory;
 // RQOrderStatusHistoryFilterObj: RQOrderStatusHistoryFilter;
  
  
implementation

uses Main, EditRQOrderStatusHistory, EditRQOrderStatusHistoryFilter;


{$R *.dfm}

var
  //frmRQOrderStatusHistoryShow : TfrmRQOrderStatusHistoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderStatusHistoryHeaders: array [1..2] of String =
        ( 'Код'
          ,'пользователь внесший изменение'
        );
   

procedure TfrmRQOrderStatusHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderStatusHistoryShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderStatusHistoryShow.FormShow(Sender: TObject);
var
  TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
  i: Integer;
  RQOrderStatusHistoryList: RQOrderStatusHistoryShortList;
  begin
  SetGridHeaders(RQOrderStatusHistoryHeaders, sgRQOrderStatusHistory.ColumnHeaders);
  ColCount:=100;
  TempRQOrderStatusHistory :=  HTTPRIORQOrderStatusHistory as RQOrderStatusHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderStatusHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderStatusHistoryList := TempRQOrderStatusHistory.getScrollableFilteredList(RQOrderStatusHistoryFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderStatusHistoryList.list);

  if LastCount > -1 then
     sgRQOrderStatusHistory.RowCount:=LastCount+2
  else
     sgRQOrderStatusHistory.RowCount:=2;

   with sgRQOrderStatusHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderStatusHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderStatusHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderStatusHistoryList.list[i].userGen;
        LastRow:=i+1;
        sgRQOrderStatusHistory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderStatusHistory.Row:=1;
end;

procedure TfrmRQOrderStatusHistoryShow.sgRQOrderStatusHistoryTopLeftChanged(Sender: TObject);
var
  TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderStatusHistoryList: RQOrderStatusHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderStatusHistory.TopRow + sgRQOrderStatusHistory.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderStatusHistory :=  HTTPRIORQOrderStatusHistory as RQOrderStatusHistoryControllerSoapPort;
      CurrentRow:=sgRQOrderStatusHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderStatusHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderStatusHistoryList := TempRQOrderStatusHistory.getScrollableFilteredList(RQOrderStatusHistoryFilter(FilterObject),ColCount-1, 100);



  sgRQOrderStatusHistory.RowCount:=sgRQOrderStatusHistory.RowCount+100;
  LastCount:=High(RQOrderStatusHistoryList.list);
  with sgRQOrderStatusHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderStatusHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderStatusHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderStatusHistoryList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderStatusHistory.Row:=CurrentRow-5;
   sgRQOrderStatusHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderStatusHistoryShow.sgRQOrderStatusHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderStatusHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderStatusHistoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderStatusHistory.RowCount-1 do
   for j:=0 to sgRQOrderStatusHistory.ColCount-1 do
     sgRQOrderStatusHistory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderStatusHistoryShow.actViewExecute(Sender: TObject);
Var TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
begin
 TempRQOrderStatusHistory := HTTPRIORQOrderStatusHistory as RQOrderStatusHistoryControllerSoapPort;
   try
     RQOrderStatusHistoryObj := TempRQOrderStatusHistory.getObject(StrToInt(sgRQOrderStatusHistory.Cells[0,sgRQOrderStatusHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderStatusHistoryEdit:=TfrmRQOrderStatusHistoryEdit.Create(Application, dsView);
  try
    frmRQOrderStatusHistoryEdit.ShowModal;
  finally
    frmRQOrderStatusHistoryEdit.Free;
    frmRQOrderStatusHistoryEdit:=nil;
  end;
end;

procedure TfrmRQOrderStatusHistoryShow.actEditExecute(Sender: TObject);
Var TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
begin
 TempRQOrderStatusHistory := HTTPRIORQOrderStatusHistory as RQOrderStatusHistoryControllerSoapPort;
   try
     RQOrderStatusHistoryObj := TempRQOrderStatusHistory.getObject(StrToInt(sgRQOrderStatusHistory.Cells[0,sgRQOrderStatusHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderStatusHistoryEdit:=TfrmRQOrderStatusHistoryEdit.Create(Application, dsEdit);
  try
    if frmRQOrderStatusHistoryEdit.ShowModal= mrOk then
      begin
        //TempRQOrderStatusHistory.save(RQOrderStatusHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderStatusHistoryEdit.Free;
    frmRQOrderStatusHistoryEdit:=nil;
  end;
end;

procedure TfrmRQOrderStatusHistoryShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderStatusHistory := HTTPRIORQOrderStatusHistory as RQOrderStatusHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderStatusHistory.Cells[0,sgRQOrderStatusHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Історія змін статусів заявки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderStatusHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderStatusHistoryShow.actInsertExecute(Sender: TObject);
Var TempRQOrderStatusHistory: RQOrderStatusHistoryControllerSoapPort;
begin
  TempRQOrderStatusHistory := HTTPRIORQOrderStatusHistory as RQOrderStatusHistoryControllerSoapPort;
  RQOrderStatusHistoryObj:=RQOrderStatusHistory.Create;

   RQOrderStatusHistoryObj.dateGen:= TXSDate.Create;


  try
    frmRQOrderStatusHistoryEdit:=TfrmRQOrderStatusHistoryEdit.Create(Application, dsInsert);
    try
      if frmRQOrderStatusHistoryEdit.ShowModal = mrOk then
      begin
        if RQOrderStatusHistoryObj<>nil then
            //TempRQOrderStatusHistory.add(RQOrderStatusHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderStatusHistoryEdit.Free;
      frmRQOrderStatusHistoryEdit:=nil;
    end;
  finally
    RQOrderStatusHistoryObj.Free;
  end;
end;

procedure TfrmRQOrderStatusHistoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderStatusHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderStatusHistoryFilterEdit:=TfrmRQOrderStatusHistoryFilterEdit.Create(Application, dsEdit);
  try
    RQOrderStatusHistoryFilterObj := RQOrderStatusHistoryFilter.Create;
    SetNullIntProps(RQOrderStatusHistoryFilterObj);
    SetNullXSProps(RQOrderStatusHistoryFilterObj);

    if frmRQOrderStatusHistoryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderStatusHistoryFilter.Create;
      FilterObject := RQOrderStatusHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderStatusHistoryFilterEdit.Free;
    frmRQOrderStatusHistoryFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderStatusHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.