
unit ShowENDeliveryOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDeliveryOrderController ;


type
  TfrmENDeliveryOrderShow = class(TChildForm)  
  HTTPRIOENDeliveryOrder: THTTPRIO;
    ImageList1: TImageList;
    sgENDeliveryOrder: TAdvStringGrid;
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
procedure sgENDeliveryOrderTopLeftChanged(Sender: TObject);
procedure sgENDeliveryOrderDblClick(Sender: TObject);
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
 // ENDeliveryOrderObj: ENDeliveryOrder;
 // ENDeliveryOrderFilterObj: ENDeliveryOrderFilter;
  
  
implementation

uses Main, EditENDeliveryOrder, EditENDeliveryOrderFilter;


{$R *.dfm}

var
  //frmENDeliveryOrderShow : TfrmENDeliveryOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDeliveryOrderHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENDeliveryOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDeliveryOrderShow:=nil;
    inherited;
  end;


procedure TfrmENDeliveryOrderShow.FormShow(Sender: TObject);
var
  TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
  i: Integer;
  ENDeliveryOrderList: ENDeliveryOrderShortList;
  begin
  SetGridHeaders(ENDeliveryOrderHeaders, sgENDeliveryOrder.ColumnHeaders);
  ColCount:=100;
  TempENDeliveryOrder :=  HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryOrderList := TempENDeliveryOrder.getScrollableFilteredList(ENDeliveryOrderFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDeliveryOrderList.list);

  if LastCount > -1 then
     sgENDeliveryOrder.RowCount:=LastCount+2
  else
     sgENDeliveryOrder.RowCount:=2;

   with sgENDeliveryOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDeliveryOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENDeliveryOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDeliveryOrder.Row:=1;
end;

procedure TfrmENDeliveryOrderShow.sgENDeliveryOrderTopLeftChanged(Sender: TObject);
var
  TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
  i,CurrentRow: Integer;
  ENDeliveryOrderList: ENDeliveryOrderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDeliveryOrder.TopRow + sgENDeliveryOrder.VisibleRowCount) = ColCount
  then
    begin
      TempENDeliveryOrder :=  HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;
      CurrentRow:=sgENDeliveryOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryOrderList := TempENDeliveryOrder.getScrollableFilteredList(ENDeliveryOrderFilter(FilterObject),ColCount-1, 100);



  sgENDeliveryOrder.RowCount:=sgENDeliveryOrder.RowCount+100;
  LastCount:=High(ENDeliveryOrderList.list);
  with sgENDeliveryOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDeliveryOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDeliveryOrder.Row:=CurrentRow-5;
   sgENDeliveryOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDeliveryOrderShow.sgENDeliveryOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDeliveryOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDeliveryOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDeliveryOrder.RowCount-1 do
   for j:=0 to sgENDeliveryOrder.ColCount-1 do
     sgENDeliveryOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDeliveryOrderShow.actViewExecute(Sender: TObject);
Var TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
begin
 TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;
   try
     ENDeliveryOrderObj := TempENDeliveryOrder.getObject(StrToInt(sgENDeliveryOrder.Cells[0,sgENDeliveryOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryOrderEdit:=TfrmENDeliveryOrderEdit.Create(Application, dsView);
  try
    frmENDeliveryOrderEdit.ShowModal;
  finally
    frmENDeliveryOrderEdit.Free;
    frmENDeliveryOrderEdit:=nil;
  end;
end;

procedure TfrmENDeliveryOrderShow.actEditExecute(Sender: TObject);
Var TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
begin
 TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;
   try
     ENDeliveryOrderObj := TempENDeliveryOrder.getObject(StrToInt(sgENDeliveryOrder.Cells[0,sgENDeliveryOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryOrderEdit:=TfrmENDeliveryOrderEdit.Create(Application, dsEdit);
  try
    if frmENDeliveryOrderEdit.ShowModal= mrOk then
      begin
        //TempENDeliveryOrder.save(ENDeliveryOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDeliveryOrderEdit.Free;
    frmENDeliveryOrderEdit:=nil;
  end;
end;

procedure TfrmENDeliveryOrderShow.actDeleteExecute(Sender: TObject);
Var TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDeliveryOrder.Cells[0,sgENDeliveryOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Порядок доставки бригад) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDeliveryOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDeliveryOrderShow.actInsertExecute(Sender: TObject);
Var TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
begin
  TempENDeliveryOrder := HTTPRIOENDeliveryOrder as ENDeliveryOrderControllerSoapPort;
  ENDeliveryOrderObj:=ENDeliveryOrder.Create;



  try
    frmENDeliveryOrderEdit:=TfrmENDeliveryOrderEdit.Create(Application, dsInsert);
    try
      if frmENDeliveryOrderEdit.ShowModal = mrOk then
      begin
        if ENDeliveryOrderObj<>nil then
            //TempENDeliveryOrder.add(ENDeliveryOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDeliveryOrderEdit.Free;
      frmENDeliveryOrderEdit:=nil;
    end;
  finally
    ENDeliveryOrderObj.Free;
  end;
end;

procedure TfrmENDeliveryOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDeliveryOrderShow.actFilterExecute(Sender: TObject);
begin
{frmENDeliveryOrderFilterEdit:=TfrmENDeliveryOrderFilterEdit.Create(Application, dsEdit);
  try
    ENDeliveryOrderFilterObj := ENDeliveryOrderFilter.Create;
    SetNullIntProps(ENDeliveryOrderFilterObj);
    SetNullXSProps(ENDeliveryOrderFilterObj);

    if frmENDeliveryOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDeliveryOrderFilter.Create;
      FilterObject := ENDeliveryOrderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDeliveryOrderFilterEdit.Free;
    frmENDeliveryOrderFilterEdit:=nil;
  end;}
end;

procedure TfrmENDeliveryOrderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.