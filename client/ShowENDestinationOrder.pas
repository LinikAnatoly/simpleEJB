
unit ShowENDestinationOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDestinationOrderController ;


type
  TfrmENDestinationOrderShow = class(TChildForm)  
  HTTPRIOENDestinationOrder: THTTPRIO;
    ImageList1: TImageList;
    sgENDestinationOrder: TAdvStringGrid;
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
procedure sgENDestinationOrderTopLeftChanged(Sender: TObject);
procedure sgENDestinationOrderDblClick(Sender: TObject);
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
 // ENDestinationOrderObj: ENDestinationOrder;
 // ENDestinationOrderFilterObj: ENDestinationOrderFilter;
  
  
implementation

uses Main, EditENDestinationOrder, EditENDestinationOrderFilter;


{$R *.dfm}

var
  //frmENDestinationOrderShow : TfrmENDestinationOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDestinationOrderHeaders: array [1..2] of String =
        ( 'Код'
          ,'№ з/п у маршруті'
        );
   

procedure TfrmENDestinationOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDestinationOrderShow:=nil;
    inherited;
  end;


procedure TfrmENDestinationOrderShow.FormShow(Sender: TObject);
var
  TempENDestinationOrder: ENDestinationOrderControllerSoapPort;
  i: Integer;
  ENDestinationOrderList: ENDestinationOrderShortList;
  begin
  SetGridHeaders(ENDestinationOrderHeaders, sgENDestinationOrder.ColumnHeaders);
  ColCount:=100;
  TempENDestinationOrder :=  HTTPRIOENDestinationOrder as ENDestinationOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDestinationOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDestinationOrderList := TempENDestinationOrder.getScrollableFilteredList(ENDestinationOrderFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDestinationOrderList.list);

  if LastCount > -1 then
     sgENDestinationOrder.RowCount:=LastCount+2
  else
     sgENDestinationOrder.RowCount:=2;

   with sgENDestinationOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDestinationOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDestinationOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENDestinationOrderList.list[i].numberInOrder = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENDestinationOrderList.list[i].numberInOrder);
        LastRow:=i+1;
        sgENDestinationOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDestinationOrder.Row:=1;
end;

procedure TfrmENDestinationOrderShow.sgENDestinationOrderTopLeftChanged(Sender: TObject);
var
  TempENDestinationOrder: ENDestinationOrderControllerSoapPort;
  i,CurrentRow: Integer;
  ENDestinationOrderList: ENDestinationOrderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDestinationOrder.TopRow + sgENDestinationOrder.VisibleRowCount) = ColCount
  then
    begin
      TempENDestinationOrder :=  HTTPRIOENDestinationOrder as ENDestinationOrderControllerSoapPort;
      CurrentRow:=sgENDestinationOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDestinationOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDestinationOrderList := TempENDestinationOrder.getScrollableFilteredList(ENDestinationOrderFilter(FilterObject),ColCount-1, 100);



  sgENDestinationOrder.RowCount:=sgENDestinationOrder.RowCount+100;
  LastCount:=High(ENDestinationOrderList.list);
  with sgENDestinationOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDestinationOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDestinationOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENDestinationOrderList.list[i].numberInOrder = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENDestinationOrderList.list[i].numberInOrder);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDestinationOrder.Row:=CurrentRow-5;
   sgENDestinationOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDestinationOrderShow.sgENDestinationOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDestinationOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDestinationOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDestinationOrder.RowCount-1 do
   for j:=0 to sgENDestinationOrder.ColCount-1 do
     sgENDestinationOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDestinationOrderShow.actViewExecute(Sender: TObject);
Var TempENDestinationOrder: ENDestinationOrderControllerSoapPort;
begin
 TempENDestinationOrder := HTTPRIOENDestinationOrder as ENDestinationOrderControllerSoapPort;
   try
     ENDestinationOrderObj := TempENDestinationOrder.getObject(StrToInt(sgENDestinationOrder.Cells[0,sgENDestinationOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDestinationOrderEdit:=TfrmENDestinationOrderEdit.Create(Application, dsView);
  try
    frmENDestinationOrderEdit.ShowModal;
  finally
    frmENDestinationOrderEdit.Free;
    frmENDestinationOrderEdit:=nil;
  end;
end;

procedure TfrmENDestinationOrderShow.actEditExecute(Sender: TObject);
Var TempENDestinationOrder: ENDestinationOrderControllerSoapPort;
begin
 TempENDestinationOrder := HTTPRIOENDestinationOrder as ENDestinationOrderControllerSoapPort;
   try
     ENDestinationOrderObj := TempENDestinationOrder.getObject(StrToInt(sgENDestinationOrder.Cells[0,sgENDestinationOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDestinationOrderEdit:=TfrmENDestinationOrderEdit.Create(Application, dsEdit);
  try
    if frmENDestinationOrderEdit.ShowModal= mrOk then
      begin
        //TempENDestinationOrder.save(ENDestinationOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDestinationOrderEdit.Free;
    frmENDestinationOrderEdit:=nil;
  end;
end;

procedure TfrmENDestinationOrderShow.actDeleteExecute(Sender: TObject);
Var TempENDestinationOrder: ENDestinationOrderControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDestinationOrder := HTTPRIOENDestinationOrder as ENDestinationOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDestinationOrder.Cells[0,sgENDestinationOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Маршрут прямування) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDestinationOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDestinationOrderShow.actInsertExecute(Sender: TObject);
// Var TempENDestinationOrder: ENDestinationOrderControllerSoapPort; 
begin
  // TempENDestinationOrder := HTTPRIOENDestinationOrder as ENDestinationOrderControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDestinationOrderObj:=ENDestinationOrder.Create;



  try
    frmENDestinationOrderEdit:=TfrmENDestinationOrderEdit.Create(Application, dsInsert);
    try
      if frmENDestinationOrderEdit.ShowModal = mrOk then
      begin
        if ENDestinationOrderObj<>nil then
            //TempENDestinationOrder.add(ENDestinationOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDestinationOrderEdit.Free;
      frmENDestinationOrderEdit:=nil;
    end;
  finally
    ENDestinationOrderObj.Free;
  end;
end;

procedure TfrmENDestinationOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDestinationOrderShow.actFilterExecute(Sender: TObject);
begin
{frmENDestinationOrderFilterEdit:=TfrmENDestinationOrderFilterEdit.Create(Application, dsInsert);
  try
    ENDestinationOrderFilterObj := ENDestinationOrderFilter.Create;
    SetNullIntProps(ENDestinationOrderFilterObj);
    SetNullXSProps(ENDestinationOrderFilterObj);

    if frmENDestinationOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDestinationOrderFilter.Create;
      FilterObject := ENDestinationOrderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDestinationOrderFilterEdit.Free;
    frmENDestinationOrderFilterEdit:=nil;
  end;}
end;

procedure TfrmENDestinationOrderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.