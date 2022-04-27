
unit ShowRQPurchaseItemTender2RQPurchaseItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPurchaseItemTender2RQPurchaseItemController;


type
  TfrmRQPurchaseItemTender2RQPurchaseItemShow = class(TChildForm)  
  HTTPRIORQPurchaseItemTender2RQPurchaseItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQPurchaseItemTender2RQPurchaseItem: TAdvStringGrid;
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
procedure sgRQPurchaseItemTender2RQPurchaseItemTopLeftChanged(Sender: TObject);
procedure sgRQPurchaseItemTender2RQPurchaseItemDblClick(Sender: TObject);
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

var frmRQPurchaseItemTender2RQPurchaseItemShow : TfrmRQPurchaseItemTender2RQPurchaseItemShow;
 // RQPurchaseItemTender2RQPurchaseItemObj: RQPurchaseItemTender2RQPurchaseItem;
 // RQPurchaseItemTender2RQPurchaseItemFilterObj: RQPurchaseItemTender2RQPurchaseItemFilter;

implementation

uses Main, EditRQPurchaseItemTender2RQPurchaseItem, EditRQPurchaseItemTender2RQPurchaseItemFilter;


{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPurchaseItemTender2RQPurchaseItemHeaders: array [1..2] of String =
        ( 'Код'
          ,'кількість по строке плана закупок'
        );
   

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPurchaseItemTender2RQPurchaseItemShow:=nil;
    inherited;
  end;


procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.FormShow(Sender: TObject);
var
  TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
  i: Integer;
  RQPurchaseItemTender2RQPurchaseItemList: RQPurchaseItemTender2RQPurchaseItemShortList;
  begin
  SetGridHeaders(RQPurchaseItemTender2RQPurchaseItemHeaders, sgRQPurchaseItemTender2RQPurchaseItem.ColumnHeaders);
  ColCount:=100;
  TempRQPurchaseItemTender2RQPurchaseItem :=  HTTPRIORQPurchaseItemTender2RQPurchaseItem as RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemTender2RQPurchaseItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemTender2RQPurchaseItemList := TempRQPurchaseItemTender2RQPurchaseItem.getScrollableFilteredList(RQPurchaseItemTender2RQPurchaseItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPurchaseItemTender2RQPurchaseItemList.list);

  if LastCount > -1 then
     sgRQPurchaseItemTender2RQPurchaseItem.RowCount:=LastCount+2
  else
     sgRQPurchaseItemTender2RQPurchaseItem.RowCount:=2;

   with sgRQPurchaseItemTender2RQPurchaseItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemTender2RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemTender2RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQPurchaseItemTender2RQPurchaseItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQPurchaseItemTender2RQPurchaseItemList.list[i].countGen.DecimalString;
        LastRow:=i+1;
        sgRQPurchaseItemTender2RQPurchaseItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPurchaseItemTender2RQPurchaseItem.Row:=1;
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.sgRQPurchaseItemTender2RQPurchaseItemTopLeftChanged(Sender: TObject);
var
  TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQPurchaseItemTender2RQPurchaseItemList: RQPurchaseItemTender2RQPurchaseItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPurchaseItemTender2RQPurchaseItem.TopRow + sgRQPurchaseItemTender2RQPurchaseItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQPurchaseItemTender2RQPurchaseItem :=  HTTPRIORQPurchaseItemTender2RQPurchaseItem as RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
      CurrentRow:=sgRQPurchaseItemTender2RQPurchaseItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemTender2RQPurchaseItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemTender2RQPurchaseItemList := TempRQPurchaseItemTender2RQPurchaseItem.getScrollableFilteredList(RQPurchaseItemTender2RQPurchaseItemFilter(FilterObject),ColCount-1, 100);



  sgRQPurchaseItemTender2RQPurchaseItem.RowCount:=sgRQPurchaseItemTender2RQPurchaseItem.RowCount+100;
  LastCount:=High(RQPurchaseItemTender2RQPurchaseItemList.list);
  with sgRQPurchaseItemTender2RQPurchaseItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemTender2RQPurchaseItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPurchaseItemTender2RQPurchaseItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQPurchaseItemTender2RQPurchaseItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQPurchaseItemTender2RQPurchaseItemList.list[i].countGen.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPurchaseItemTender2RQPurchaseItem.Row:=CurrentRow-5;
   sgRQPurchaseItemTender2RQPurchaseItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.sgRQPurchaseItemTender2RQPurchaseItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPurchaseItemTender2RQPurchaseItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPurchaseItemTender2RQPurchaseItem.RowCount-1 do
   for j:=0 to sgRQPurchaseItemTender2RQPurchaseItem.ColCount-1 do
     sgRQPurchaseItemTender2RQPurchaseItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.actViewExecute(Sender: TObject);
Var TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
begin
 TempRQPurchaseItemTender2RQPurchaseItem := HTTPRIORQPurchaseItemTender2RQPurchaseItem as RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemTender2RQPurchaseItemObj := TempRQPurchaseItemTender2RQPurchaseItem.getObject(StrToInt(sgRQPurchaseItemTender2RQPurchaseItem.Cells[0,sgRQPurchaseItemTender2RQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemTender2RQPurchaseItemEdit:=TfrmRQPurchaseItemTender2RQPurchaseItemEdit.Create(Application, dsView);
  try
    frmRQPurchaseItemTender2RQPurchaseItemEdit.ShowModal;
  finally
    frmRQPurchaseItemTender2RQPurchaseItemEdit.Free;
    frmRQPurchaseItemTender2RQPurchaseItemEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.actEditExecute(Sender: TObject);
Var TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
begin
 TempRQPurchaseItemTender2RQPurchaseItem := HTTPRIORQPurchaseItemTender2RQPurchaseItem as RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
   try
     RQPurchaseItemTender2RQPurchaseItemObj := TempRQPurchaseItemTender2RQPurchaseItem.getObject(StrToInt(sgRQPurchaseItemTender2RQPurchaseItem.Cells[0,sgRQPurchaseItemTender2RQPurchaseItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPurchaseItemTender2RQPurchaseItemEdit:=TfrmRQPurchaseItemTender2RQPurchaseItemEdit.Create(Application, dsEdit);
  try
    if frmRQPurchaseItemTender2RQPurchaseItemEdit.ShowModal= mrOk then
      begin
        //TempRQPurchaseItemTender2RQPurchaseItem.save(RQPurchaseItemTender2RQPurchaseItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPurchaseItemTender2RQPurchaseItemEdit.Free;
    frmRQPurchaseItemTender2RQPurchaseItemEdit:=nil;
  end;
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.actDeleteExecute(Sender: TObject);
Var TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPurchaseItemTender2RQPurchaseItem := HTTPRIORQPurchaseItemTender2RQPurchaseItem as RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPurchaseItemTender2RQPurchaseItem.Cells[0,sgRQPurchaseItemTender2RQPurchaseItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звьязок строк (План закупок, тендера) зі строкама Плану закупок) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItemTender2RQPurchaseItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.actInsertExecute(Sender: TObject);
// Var TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort; 
begin
  // TempRQPurchaseItemTender2RQPurchaseItem := HTTPRIORQPurchaseItemTender2RQPurchaseItem as RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPurchaseItemTender2RQPurchaseItemObj:=RQPurchaseItemTender2RQPurchaseItem.Create;

   //RQPurchaseItemTender2RQPurchaseItemObj.countGen:= TXSDecimal.Create;


  try
    frmRQPurchaseItemTender2RQPurchaseItemEdit:=TfrmRQPurchaseItemTender2RQPurchaseItemEdit.Create(Application, dsInsert);
    try
      if frmRQPurchaseItemTender2RQPurchaseItemEdit.ShowModal = mrOk then
      begin
        if RQPurchaseItemTender2RQPurchaseItemObj<>nil then
            //TempRQPurchaseItemTender2RQPurchaseItem.add(RQPurchaseItemTender2RQPurchaseItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPurchaseItemTender2RQPurchaseItemEdit.Free;
      frmRQPurchaseItemTender2RQPurchaseItemEdit:=nil;
    end;
  finally
    RQPurchaseItemTender2RQPurchaseItemObj.Free;
  end;
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQPurchaseItemTender2RQPurchaseItemFilterEdit:=TfrmRQPurchaseItemTender2RQPurchaseItemFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemTender2RQPurchaseItemFilterObj := RQPurchaseItemTender2RQPurchaseItemFilter.Create;
    SetNullIntProps(RQPurchaseItemTender2RQPurchaseItemFilterObj);
    SetNullXSProps(RQPurchaseItemTender2RQPurchaseItemFilterObj);

    if frmRQPurchaseItemTender2RQPurchaseItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPurchaseItemTender2RQPurchaseItemFilter.Create;
      FilterObject := RQPurchaseItemTender2RQPurchaseItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPurchaseItemTender2RQPurchaseItemFilterEdit.Free;
    frmRQPurchaseItemTender2RQPurchaseItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPurchaseItemTender2RQPurchaseItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.