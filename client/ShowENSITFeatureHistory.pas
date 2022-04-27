
unit ShowENSITFeatureHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSITFeatureHistoryController ;


type
  TfrmENSITFeatureHistoryShow = class(TChildForm)  
  HTTPRIOENSITFeatureHistory: THTTPRIO;
    ImageList1: TImageList;
    sgENSITFeatureHistory: TAdvStringGrid;
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
procedure sgENSITFeatureHistoryTopLeftChanged(Sender: TObject);
procedure sgENSITFeatureHistoryDblClick(Sender: TObject);
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
 // ENSITFeatureHistoryObj: ENSITFeatureHistory;
 // ENSITFeatureHistoryFilterObj: ENSITFeatureHistoryFilter;
  
  
implementation

uses Main, EditENSITFeatureHistory, EditENSITFeatureHistoryFilter;


{$R *.dfm}

var
  //frmENSITFeatureHistoryShow : TfrmENSITFeatureHistoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSITFeatureHistoryHeaders: array [1..5] of String =
        ( 'Код'
          ,'Назва'
          ,'Нове значення'
          ,'Старе значення'
          ,'Дата генерації'
        );
   

procedure TfrmENSITFeatureHistoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSITFeatureHistoryShow:=nil;
    inherited;
  end;


procedure TfrmENSITFeatureHistoryShow.FormShow(Sender: TObject);
var
  TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
  i: Integer;
  ENSITFeatureHistoryList: ENSITFeatureHistoryShortList;
  begin
  SetGridHeaders(ENSITFeatureHistoryHeaders, sgENSITFeatureHistory.ColumnHeaders);
  ColCount:=100;
  TempENSITFeatureHistory :=  HTTPRIOENSITFeatureHistory as ENSITFeatureHistoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSITFeatureHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITFeatureHistoryList := TempENSITFeatureHistory.getScrollableFilteredList(ENSITFeatureHistoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSITFeatureHistoryList.list);

  if LastCount > -1 then
     sgENSITFeatureHistory.RowCount:=LastCount+2
  else
     sgENSITFeatureHistory.RowCount:=2;

   with sgENSITFeatureHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITFeatureHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSITFeatureHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSITFeatureHistoryList.list[i].name;
        Cells[2,i+1] := ENSITFeatureHistoryList.list[i].newvalue;
        Cells[3,i+1] := ENSITFeatureHistoryList.list[i].oldvalue;
        if ENSITFeatureHistoryList.list[i].dategen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENSITFeatureHistoryList.list[i].dategen);
        LastRow:=i+1;
        sgENSITFeatureHistory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSITFeatureHistory.Row:=1;
end;

procedure TfrmENSITFeatureHistoryShow.sgENSITFeatureHistoryTopLeftChanged(Sender: TObject);
var
  TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENSITFeatureHistoryList: ENSITFeatureHistoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSITFeatureHistory.TopRow + sgENSITFeatureHistory.VisibleRowCount) = ColCount
  then
    begin
      TempENSITFeatureHistory :=  HTTPRIOENSITFeatureHistory as ENSITFeatureHistoryControllerSoapPort;
      CurrentRow:=sgENSITFeatureHistory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSITFeatureHistoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITFeatureHistoryList := TempENSITFeatureHistory.getScrollableFilteredList(ENSITFeatureHistoryFilter(FilterObject),ColCount-1, 100);



  sgENSITFeatureHistory.RowCount:=sgENSITFeatureHistory.RowCount+100;
  LastCount:=High(ENSITFeatureHistoryList.list);
  with sgENSITFeatureHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITFeatureHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSITFeatureHistoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSITFeatureHistoryList.list[i].name;
        Cells[2,i+CurrentRow] := ENSITFeatureHistoryList.list[i].newvalue;
        Cells[3,i+CurrentRow] := ENSITFeatureHistoryList.list[i].oldvalue;
        if ENSITFeatureHistoryList.list[i].dategen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENSITFeatureHistoryList.list[i].dategen);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSITFeatureHistory.Row:=CurrentRow-5;
   sgENSITFeatureHistory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSITFeatureHistoryShow.sgENSITFeatureHistoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSITFeatureHistory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSITFeatureHistoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSITFeatureHistory.RowCount-1 do
   for j:=0 to sgENSITFeatureHistory.ColCount-1 do
     sgENSITFeatureHistory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSITFeatureHistoryShow.actViewExecute(Sender: TObject);
Var TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
begin
 TempENSITFeatureHistory := HTTPRIOENSITFeatureHistory as ENSITFeatureHistoryControllerSoapPort;
   try
     ENSITFeatureHistoryObj := TempENSITFeatureHistory.getObject(StrToInt(sgENSITFeatureHistory.Cells[0,sgENSITFeatureHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureHistoryEdit:=TfrmENSITFeatureHistoryEdit.Create(Application, dsView);
  try
    frmENSITFeatureHistoryEdit.ShowModal;
  finally
    frmENSITFeatureHistoryEdit.Free;
    frmENSITFeatureHistoryEdit:=nil;
  end;
end;

procedure TfrmENSITFeatureHistoryShow.actEditExecute(Sender: TObject);
Var TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
begin
 TempENSITFeatureHistory := HTTPRIOENSITFeatureHistory as ENSITFeatureHistoryControllerSoapPort;
   try
     ENSITFeatureHistoryObj := TempENSITFeatureHistory.getObject(StrToInt(sgENSITFeatureHistory.Cells[0,sgENSITFeatureHistory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureHistoryEdit:=TfrmENSITFeatureHistoryEdit.Create(Application, dsEdit);
  try
    if frmENSITFeatureHistoryEdit.ShowModal= mrOk then
      begin
        //TempENSITFeatureHistory.save(ENSITFeatureHistoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSITFeatureHistoryEdit.Free;
    frmENSITFeatureHistoryEdit:=nil;
  end;
end;

procedure TfrmENSITFeatureHistoryShow.actDeleteExecute(Sender: TObject);
Var TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSITFeatureHistory := HTTPRIOENSITFeatureHistory as ENSITFeatureHistoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSITFeatureHistory.Cells[0,sgENSITFeatureHistory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (История свойства) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSITFeatureHistory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSITFeatureHistoryShow.actInsertExecute(Sender: TObject);
Var TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
begin
  TempENSITFeatureHistory := HTTPRIOENSITFeatureHistory as ENSITFeatureHistoryControllerSoapPort;
  ENSITFeatureHistoryObj:=ENSITFeatureHistory.Create;

   ENSITFeatureHistoryObj.dategen:= TXSDate.Create;


  try
    frmENSITFeatureHistoryEdit:=TfrmENSITFeatureHistoryEdit.Create(Application, dsInsert);
    try
      if frmENSITFeatureHistoryEdit.ShowModal = mrOk then
      begin
        if ENSITFeatureHistoryObj<>nil then
            //TempENSITFeatureHistory.add(ENSITFeatureHistoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSITFeatureHistoryEdit.Free;
      frmENSITFeatureHistoryEdit:=nil;
    end;
  finally
    ENSITFeatureHistoryObj.Free;
  end;
end;

procedure TfrmENSITFeatureHistoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSITFeatureHistoryShow.actFilterExecute(Sender: TObject);
begin
{frmENSITFeatureHistoryFilterEdit:=TfrmENSITFeatureHistoryFilterEdit.Create(Application, dsEdit);
  try
    ENSITFeatureHistoryFilterObj := ENSITFeatureHistoryFilter.Create;
    SetNullIntProps(ENSITFeatureHistoryFilterObj);
    SetNullXSProps(ENSITFeatureHistoryFilterObj);

    if frmENSITFeatureHistoryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSITFeatureHistoryFilter.Create;
      FilterObject := ENSITFeatureHistoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSITFeatureHistoryFilterEdit.Free;
    frmENSITFeatureHistoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENSITFeatureHistoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.