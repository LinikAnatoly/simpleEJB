
unit ShowENAirCrossingItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAirCrossingItemController, AdvObj ;


type
  TfrmENAirCrossingItemShow = class(TChildForm)  
  HTTPRIOENAirCrossingItem: THTTPRIO;
    ImageList1: TImageList;
    sgENAirCrossingItem: TAdvStringGrid;
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
procedure sgENAirCrossingItemTopLeftChanged(Sender: TObject);
procedure sgENAirCrossingItemDblClick(Sender: TObject);
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

var
 frmENAirCrossingItemShow : TfrmENAirCrossingItemShow;
 // ENAirCrossingItemObj: ENAirCrossingItem;
 // ENAirCrossingItemFilterObj: ENAirCrossingItemFilter;
  
  
implementation

uses Main, EditENAirCrossingItem, EditENAirCrossingItemFilter;


{$R *.dfm}

var
  //frmENAirCrossingItemShow : TfrmENAirCrossingItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAirCrossingItemHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENAirCrossingItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAirCrossingItemShow:=nil;
    inherited;
  end;


procedure TfrmENAirCrossingItemShow.FormShow(Sender: TObject);
var
  TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
  i: Integer;
  ENAirCrossingItemList: ENAirCrossingItemShortList;
  begin
  SetGridHeaders(ENAirCrossingItemHeaders, sgENAirCrossingItem.ColumnHeaders);
  ColCount:=100;
  TempENAirCrossingItem :=  HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAirCrossingItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAirCrossingItemList := TempENAirCrossingItem.getScrollableFilteredList(ENAirCrossingItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAirCrossingItemList.list);

  if LastCount > -1 then
     sgENAirCrossingItem.RowCount:=LastCount+2
  else
     sgENAirCrossingItem.RowCount:=2;

   with sgENAirCrossingItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAirCrossingItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAirCrossingItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENAirCrossingItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAirCrossingItem.Row:=1;
end;

procedure TfrmENAirCrossingItemShow.sgENAirCrossingItemTopLeftChanged(Sender: TObject);
var
  TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENAirCrossingItemList: ENAirCrossingItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAirCrossingItem.TopRow + sgENAirCrossingItem.VisibleRowCount) = ColCount
  then
    begin
      TempENAirCrossingItem :=  HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
      CurrentRow:=sgENAirCrossingItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAirCrossingItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAirCrossingItemList := TempENAirCrossingItem.getScrollableFilteredList(ENAirCrossingItemFilter(FilterObject),ColCount-1, 100);



  sgENAirCrossingItem.RowCount:=sgENAirCrossingItem.RowCount+100;
  LastCount:=High(ENAirCrossingItemList.list);
  with sgENAirCrossingItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAirCrossingItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAirCrossingItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAirCrossingItem.Row:=CurrentRow-5;
   sgENAirCrossingItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAirCrossingItemShow.sgENAirCrossingItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAirCrossingItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAirCrossingItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAirCrossingItem.RowCount-1 do
   for j:=0 to sgENAirCrossingItem.ColCount-1 do
     sgENAirCrossingItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAirCrossingItemShow.actViewExecute(Sender: TObject);
Var TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
begin
 TempENAirCrossingItem := HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
   try
     ENAirCrossingItemObj := TempENAirCrossingItem.getObject(StrToInt(sgENAirCrossingItem.Cells[0,sgENAirCrossingItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAirCrossingItemEdit:=TfrmENAirCrossingItemEdit.Create(Application, dsView);
  try
    frmENAirCrossingItemEdit.ShowModal;
  finally
    frmENAirCrossingItemEdit.Free;
    frmENAirCrossingItemEdit:=nil;
  end;
end;

procedure TfrmENAirCrossingItemShow.actEditExecute(Sender: TObject);
Var TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
begin
 TempENAirCrossingItem := HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
   try
     ENAirCrossingItemObj := TempENAirCrossingItem.getObject(StrToInt(sgENAirCrossingItem.Cells[0,sgENAirCrossingItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAirCrossingItemEdit:=TfrmENAirCrossingItemEdit.Create(Application, dsEdit);
  try
    if frmENAirCrossingItemEdit.ShowModal= mrOk then
      begin
        //TempENAirCrossingItem.save(ENAirCrossingItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAirCrossingItemEdit.Free;
    frmENAirCrossingItemEdit:=nil;
  end;
end;

procedure TfrmENAirCrossingItemShow.actDeleteExecute(Sender: TObject);
Var TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAirCrossingItem := HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAirCrossingItem.Cells[0,sgENAirCrossingItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори ПЛ 6-10 кВ, які обмежують повітряні перетинання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAirCrossingItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAirCrossingItemShow.actInsertExecute(Sender: TObject);
// Var TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort; 
begin
  // TempENAirCrossingItem := HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAirCrossingItemObj:=ENAirCrossingItem.Create;



  try
    frmENAirCrossingItemEdit:=TfrmENAirCrossingItemEdit.Create(Application, dsInsert);
    try
      if frmENAirCrossingItemEdit.ShowModal = mrOk then
      begin
        if ENAirCrossingItemObj<>nil then
            //TempENAirCrossingItem.add(ENAirCrossingItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAirCrossingItemEdit.Free;
      frmENAirCrossingItemEdit:=nil;
    end;
  finally
    ENAirCrossingItemObj.Free;
  end;
end;

procedure TfrmENAirCrossingItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAirCrossingItemShow.actFilterExecute(Sender: TObject);
begin
{frmENAirCrossingItemFilterEdit:=TfrmENAirCrossingItemFilterEdit.Create(Application, dsInsert);
  try
    ENAirCrossingItemFilterObj := ENAirCrossingItemFilter.Create;
    SetNullIntProps(ENAirCrossingItemFilterObj);
    SetNullXSProps(ENAirCrossingItemFilterObj);

    if frmENAirCrossingItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAirCrossingItemFilter.Create;
      FilterObject := ENAirCrossingItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAirCrossingItemFilterEdit.Free;
    frmENAirCrossingItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENAirCrossingItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.