
unit ShowENTransportRoute2RQFKOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportRoute2RQFKOrderController ;


type
  TfrmENTransportRoute2RQFKOrderShow = class(TChildForm)  
  HTTPRIOENTransportRoute2RQFKOrder: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportRoute2RQFKOrder: TAdvStringGrid;
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
procedure sgENTransportRoute2RQFKOrderTopLeftChanged(Sender: TObject);
procedure sgENTransportRoute2RQFKOrderDblClick(Sender: TObject);
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
 // ENTransportRoute2RQFKOrderObj: ENTransportRoute2RQFKOrder;
 // ENTransportRoute2RQFKOrderFilterObj: ENTransportRoute2RQFKOrderFilter;
  
  
implementation

uses Main, EditENTransportRoute2RQFKOrder, EditENTransportRoute2RQFKOrderFilter;


{$R *.dfm}

var
  //frmENTransportRoute2RQFKOrderShow : TfrmENTransportRoute2RQFKOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportRoute2RQFKOrderHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENTransportRoute2RQFKOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportRoute2RQFKOrderShow:=nil;
    inherited;
  end;


procedure TfrmENTransportRoute2RQFKOrderShow.FormShow(Sender: TObject);
var
  TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort;
  i: Integer;
  ENTransportRoute2RQFKOrderList: ENTransportRoute2RQFKOrderShortList;
  begin
  SetGridHeaders(ENTransportRoute2RQFKOrderHeaders, sgENTransportRoute2RQFKOrder.ColumnHeaders);
  ColCount:=100;
  TempENTransportRoute2RQFKOrder :=  HTTPRIOENTransportRoute2RQFKOrder as ENTransportRoute2RQFKOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRoute2RQFKOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRoute2RQFKOrderList := TempENTransportRoute2RQFKOrder.getScrollableFilteredList(ENTransportRoute2RQFKOrderFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportRoute2RQFKOrderList.list);

  if LastCount > -1 then
     sgENTransportRoute2RQFKOrder.RowCount:=LastCount+2
  else
     sgENTransportRoute2RQFKOrder.RowCount:=2;

   with sgENTransportRoute2RQFKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRoute2RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportRoute2RQFKOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENTransportRoute2RQFKOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportRoute2RQFKOrder.Row:=1;
end;

procedure TfrmENTransportRoute2RQFKOrderShow.sgENTransportRoute2RQFKOrderTopLeftChanged(Sender: TObject);
var
  TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportRoute2RQFKOrderList: ENTransportRoute2RQFKOrderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportRoute2RQFKOrder.TopRow + sgENTransportRoute2RQFKOrder.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportRoute2RQFKOrder :=  HTTPRIOENTransportRoute2RQFKOrder as ENTransportRoute2RQFKOrderControllerSoapPort;
      CurrentRow:=sgENTransportRoute2RQFKOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportRoute2RQFKOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportRoute2RQFKOrderList := TempENTransportRoute2RQFKOrder.getScrollableFilteredList(ENTransportRoute2RQFKOrderFilter(FilterObject),ColCount-1, 100);



  sgENTransportRoute2RQFKOrder.RowCount:=sgENTransportRoute2RQFKOrder.RowCount+100;
  LastCount:=High(ENTransportRoute2RQFKOrderList.list);
  with sgENTransportRoute2RQFKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportRoute2RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportRoute2RQFKOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportRoute2RQFKOrder.Row:=CurrentRow-5;
   sgENTransportRoute2RQFKOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportRoute2RQFKOrderShow.sgENTransportRoute2RQFKOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportRoute2RQFKOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportRoute2RQFKOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportRoute2RQFKOrder.RowCount-1 do
   for j:=0 to sgENTransportRoute2RQFKOrder.ColCount-1 do
     sgENTransportRoute2RQFKOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportRoute2RQFKOrderShow.actViewExecute(Sender: TObject);
Var TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort;
begin
 TempENTransportRoute2RQFKOrder := HTTPRIOENTransportRoute2RQFKOrder as ENTransportRoute2RQFKOrderControllerSoapPort;
   try
     ENTransportRoute2RQFKOrderObj := TempENTransportRoute2RQFKOrder.getObject(StrToInt(sgENTransportRoute2RQFKOrder.Cells[0,sgENTransportRoute2RQFKOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRoute2RQFKOrderEdit:=TfrmENTransportRoute2RQFKOrderEdit.Create(Application, dsView);
  try
    frmENTransportRoute2RQFKOrderEdit.ShowModal;
  finally
    frmENTransportRoute2RQFKOrderEdit.Free;
    frmENTransportRoute2RQFKOrderEdit:=nil;
  end;
end;

procedure TfrmENTransportRoute2RQFKOrderShow.actEditExecute(Sender: TObject);
Var TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort;
begin
 TempENTransportRoute2RQFKOrder := HTTPRIOENTransportRoute2RQFKOrder as ENTransportRoute2RQFKOrderControllerSoapPort;
   try
     ENTransportRoute2RQFKOrderObj := TempENTransportRoute2RQFKOrder.getObject(StrToInt(sgENTransportRoute2RQFKOrder.Cells[0,sgENTransportRoute2RQFKOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportRoute2RQFKOrderEdit:=TfrmENTransportRoute2RQFKOrderEdit.Create(Application, dsEdit);
  try
    if frmENTransportRoute2RQFKOrderEdit.ShowModal= mrOk then
      begin
        //TempENTransportRoute2RQFKOrder.save(ENTransportRoute2RQFKOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportRoute2RQFKOrderEdit.Free;
    frmENTransportRoute2RQFKOrderEdit:=nil;
  end;
end;

procedure TfrmENTransportRoute2RQFKOrderShow.actDeleteExecute(Sender: TObject);
Var TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportRoute2RQFKOrder := HTTPRIOENTransportRoute2RQFKOrder as ENTransportRoute2RQFKOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportRoute2RQFKOrder.Cells[0,sgENTransportRoute2RQFKOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок маршрутів із накладними) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportRoute2RQFKOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportRoute2RQFKOrderShow.actInsertExecute(Sender: TObject);
// Var TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort; 
begin
  // TempENTransportRoute2RQFKOrder := HTTPRIOENTransportRoute2RQFKOrder as ENTransportRoute2RQFKOrderControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTransportRoute2RQFKOrderObj:=ENTransportRoute2RQFKOrder.Create;



  try
    frmENTransportRoute2RQFKOrderEdit:=TfrmENTransportRoute2RQFKOrderEdit.Create(Application, dsInsert);
    try
      if frmENTransportRoute2RQFKOrderEdit.ShowModal = mrOk then
      begin
        if ENTransportRoute2RQFKOrderObj<>nil then
            //TempENTransportRoute2RQFKOrder.add(ENTransportRoute2RQFKOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportRoute2RQFKOrderEdit.Free;
      frmENTransportRoute2RQFKOrderEdit:=nil;
    end;
  finally
    ENTransportRoute2RQFKOrderObj.Free;
  end;
end;

procedure TfrmENTransportRoute2RQFKOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportRoute2RQFKOrderShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportRoute2RQFKOrderFilterEdit:=TfrmENTransportRoute2RQFKOrderFilterEdit.Create(Application, dsInsert);
  try
    ENTransportRoute2RQFKOrderFilterObj := ENTransportRoute2RQFKOrderFilter.Create;
    SetNullIntProps(ENTransportRoute2RQFKOrderFilterObj);
    SetNullXSProps(ENTransportRoute2RQFKOrderFilterObj);

    if frmENTransportRoute2RQFKOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportRoute2RQFKOrderFilter.Create;
      FilterObject := ENTransportRoute2RQFKOrderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportRoute2RQFKOrderFilterEdit.Free;
    frmENTransportRoute2RQFKOrderFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportRoute2RQFKOrderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.