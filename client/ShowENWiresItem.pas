
unit ShowENWiresItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWiresItemController ;


type
  TfrmENWiresItemShow = class(TChildForm)  
  HTTPRIOENWiresItem: THTTPRIO;
    ImageList1: TImageList;
    sgENWiresItem: TAdvStringGrid;
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
procedure sgENWiresItemTopLeftChanged(Sender: TObject);
procedure sgENWiresItemDblClick(Sender: TObject);
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
 // ENWiresItemObj: ENWiresItem;
 // ENWiresItemFilterObj: ENWiresItemFilter;
  
  
implementation

uses Main, EditENWiresItem, EditENWiresItemFilter;


{$R *.dfm}

var
  //frmENWiresItemShow : TfrmENWiresItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWiresItemHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENWiresItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWiresItemShow:=nil;
    inherited;
  end;


procedure TfrmENWiresItemShow.FormShow(Sender: TObject);
var
  TempENWiresItem: ENWiresItemControllerSoapPort;
  i: Integer;
  ENWiresItemList: ENWiresItemShortList;
  begin
  SetGridHeaders(ENWiresItemHeaders, sgENWiresItem.ColumnHeaders);
  ColCount:=100;
  TempENWiresItem :=  HTTPRIOENWiresItem as ENWiresItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresItemList := TempENWiresItem.getScrollableFilteredList(ENWiresItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWiresItemList.list);

  if LastCount > -1 then
     sgENWiresItem.RowCount:=LastCount+2
  else
     sgENWiresItem.RowCount:=2;

   with sgENWiresItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWiresItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENWiresItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWiresItem.Row:=1;
end;

procedure TfrmENWiresItemShow.sgENWiresItemTopLeftChanged(Sender: TObject);
var
  TempENWiresItem: ENWiresItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENWiresItemList: ENWiresItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWiresItem.TopRow + sgENWiresItem.VisibleRowCount) = ColCount
  then
    begin
      TempENWiresItem :=  HTTPRIOENWiresItem as ENWiresItemControllerSoapPort;
      CurrentRow:=sgENWiresItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWiresItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWiresItemList := TempENWiresItem.getScrollableFilteredList(ENWiresItemFilter(FilterObject),ColCount-1, 100);



  sgENWiresItem.RowCount:=sgENWiresItem.RowCount+100;
  LastCount:=High(ENWiresItemList.list);
  with sgENWiresItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWiresItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWiresItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWiresItem.Row:=CurrentRow-5;
   sgENWiresItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWiresItemShow.sgENWiresItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWiresItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWiresItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWiresItem.RowCount-1 do
   for j:=0 to sgENWiresItem.ColCount-1 do
     sgENWiresItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWiresItemShow.actViewExecute(Sender: TObject);
Var TempENWiresItem: ENWiresItemControllerSoapPort;
begin
 TempENWiresItem := HTTPRIOENWiresItem as ENWiresItemControllerSoapPort;
   try
     ENWiresItemObj := TempENWiresItem.getObject(StrToInt(sgENWiresItem.Cells[0,sgENWiresItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresItemEdit:=TfrmENWiresItemEdit.Create(Application, dsView);
  try
    frmENWiresItemEdit.ShowModal;
  finally
    frmENWiresItemEdit.Free;
    frmENWiresItemEdit:=nil;
  end;
end;

procedure TfrmENWiresItemShow.actEditExecute(Sender: TObject);
Var TempENWiresItem: ENWiresItemControllerSoapPort;
begin
 TempENWiresItem := HTTPRIOENWiresItem as ENWiresItemControllerSoapPort;
   try
     ENWiresItemObj := TempENWiresItem.getObject(StrToInt(sgENWiresItem.Cells[0,sgENWiresItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWiresItemEdit:=TfrmENWiresItemEdit.Create(Application, dsEdit);
  try
    if frmENWiresItemEdit.ShowModal= mrOk then
      begin
        //TempENWiresItem.save(ENWiresItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWiresItemEdit.Free;
    frmENWiresItemEdit:=nil;
  end;
end;

procedure TfrmENWiresItemShow.actDeleteExecute(Sender: TObject);
Var TempENWiresItem: ENWiresItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWiresItem := HTTPRIOENWiresItem as ENWiresItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWiresItem.Cells[0,sgENWiresItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори ПЛ, між якими проходить провод) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWiresItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWiresItemShow.actInsertExecute(Sender: TObject);
// Var TempENWiresItem: ENWiresItemControllerSoapPort; 
begin
  // TempENWiresItem := HTTPRIOENWiresItem as ENWiresItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWiresItemObj:=ENWiresItem.Create;



  try
    frmENWiresItemEdit:=TfrmENWiresItemEdit.Create(Application, dsInsert);
    try
      if frmENWiresItemEdit.ShowModal = mrOk then
      begin
        if ENWiresItemObj<>nil then
            //TempENWiresItem.add(ENWiresItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWiresItemEdit.Free;
      frmENWiresItemEdit:=nil;
    end;
  finally
    ENWiresItemObj.Free;
  end;
end;

procedure TfrmENWiresItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWiresItemShow.actFilterExecute(Sender: TObject);
begin
{frmENWiresItemFilterEdit:=TfrmENWiresItemFilterEdit.Create(Application, dsInsert);
  try
    ENWiresItemFilterObj := ENWiresItemFilter.Create;
    SetNullIntProps(ENWiresItemFilterObj);
    SetNullXSProps(ENWiresItemFilterObj);

    if frmENWiresItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWiresItemFilter.Create;
      FilterObject := ENWiresItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWiresItemFilterEdit.Free;
    frmENWiresItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENWiresItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.