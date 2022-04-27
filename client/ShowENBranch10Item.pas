
unit ShowENBranch10Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBranch10ItemController ;


type
  TfrmENBranch10ItemShow = class(TChildForm)  
  HTTPRIOENBranch10Item: THTTPRIO;
    ImageList1: TImageList;
    sgENBranch10Item: TAdvStringGrid;
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
procedure sgENBranch10ItemTopLeftChanged(Sender: TObject);
procedure sgENBranch10ItemDblClick(Sender: TObject);
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
 // ENBranch10ItemObj: ENBranch10Item;
 // ENBranch10ItemFilterObj: ENBranch10ItemFilter;
  
  
implementation

uses Main, EditENBranch10Item, EditENBranch10ItemFilter;


{$R *.dfm}

var
  //frmENBranch10ItemShow : TfrmENBranch10ItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBranch10ItemHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENBranch10ItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBranch10ItemShow:=nil;
    inherited;
  end;


procedure TfrmENBranch10ItemShow.FormShow(Sender: TObject);
var
  TempENBranch10Item: ENBranch10ItemControllerSoapPort;
  i: Integer;
  ENBranch10ItemList: ENBranch10ItemShortList;
  begin
  SetGridHeaders(ENBranch10ItemHeaders, sgENBranch10Item.ColumnHeaders);
  ColCount:=100;
  TempENBranch10Item :=  HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBranch10ItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranch10ItemList := TempENBranch10Item.getScrollableFilteredList(ENBranch10ItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBranch10ItemList.list);

  if LastCount > -1 then
     sgENBranch10Item.RowCount:=LastCount+2
  else
     sgENBranch10Item.RowCount:=2;

   with sgENBranch10Item do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranch10ItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBranch10ItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENBranch10Item.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBranch10Item.Row:=1;
end;

procedure TfrmENBranch10ItemShow.sgENBranch10ItemTopLeftChanged(Sender: TObject);
var
  TempENBranch10Item: ENBranch10ItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENBranch10ItemList: ENBranch10ItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBranch10Item.TopRow + sgENBranch10Item.VisibleRowCount) = ColCount
  then
    begin
      TempENBranch10Item :=  HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
      CurrentRow:=sgENBranch10Item.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBranch10ItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranch10ItemList := TempENBranch10Item.getScrollableFilteredList(ENBranch10ItemFilter(FilterObject),ColCount-1, 100);



  sgENBranch10Item.RowCount:=sgENBranch10Item.RowCount+100;
  LastCount:=High(ENBranch10ItemList.list);
  with sgENBranch10Item do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranch10ItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBranch10ItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBranch10Item.Row:=CurrentRow-5;
   sgENBranch10Item.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBranch10ItemShow.sgENBranch10ItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBranch10Item,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBranch10ItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBranch10Item.RowCount-1 do
   for j:=0 to sgENBranch10Item.ColCount-1 do
     sgENBranch10Item.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBranch10ItemShow.actViewExecute(Sender: TObject);
Var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
begin
 TempENBranch10Item := HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
   try
     ENBranch10ItemObj := TempENBranch10Item.getObject(StrToInt(sgENBranch10Item.Cells[0,sgENBranch10Item.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranch10ItemEdit:=TfrmENBranch10ItemEdit.Create(Application, dsView);
  try
    frmENBranch10ItemEdit.ShowModal;
  finally
    frmENBranch10ItemEdit.Free;
    frmENBranch10ItemEdit:=nil;
  end;
end;

procedure TfrmENBranch10ItemShow.actEditExecute(Sender: TObject);
Var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
begin
 TempENBranch10Item := HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
   try
     ENBranch10ItemObj := TempENBranch10Item.getObject(StrToInt(sgENBranch10Item.Cells[0,sgENBranch10Item.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranch10ItemEdit:=TfrmENBranch10ItemEdit.Create(Application, dsEdit);
  try
    if frmENBranch10ItemEdit.ShowModal= mrOk then
      begin
        //TempENBranch10Item.save(ENBranch10ItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBranch10ItemEdit.Free;
    frmENBranch10ItemEdit:=nil;
  end;
end;

procedure TfrmENBranch10ItemShow.actDeleteExecute(Sender: TObject);
Var TempENBranch10Item: ENBranch10ItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBranch10Item := HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBranch10Item.Cells[0,sgENBranch10Item.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори відгалудження від ПЛ 6-10) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBranch10Item.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBranch10ItemShow.actInsertExecute(Sender: TObject);
// Var TempENBranch10Item: ENBranch10ItemControllerSoapPort; 
begin
  // TempENBranch10Item := HTTPRIOENBranch10Item as ENBranch10ItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBranch10ItemObj:=ENBranch10Item.Create;



  try
    frmENBranch10ItemEdit:=TfrmENBranch10ItemEdit.Create(Application, dsInsert);
    try
      if frmENBranch10ItemEdit.ShowModal = mrOk then
      begin
        if ENBranch10ItemObj<>nil then
            //TempENBranch10Item.add(ENBranch10ItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBranch10ItemEdit.Free;
      frmENBranch10ItemEdit:=nil;
    end;
  finally
    ENBranch10ItemObj.Free;
  end;
end;

procedure TfrmENBranch10ItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBranch10ItemShow.actFilterExecute(Sender: TObject);
begin
{frmENBranch10ItemFilterEdit:=TfrmENBranch10ItemFilterEdit.Create(Application, dsInsert);
  try
    ENBranch10ItemFilterObj := ENBranch10ItemFilter.Create;
    SetNullIntProps(ENBranch10ItemFilterObj);
    SetNullXSProps(ENBranch10ItemFilterObj);

    if frmENBranch10ItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBranch10ItemFilter.Create;
      FilterObject := ENBranch10ItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBranch10ItemFilterEdit.Free;
    frmENBranch10ItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENBranch10ItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.