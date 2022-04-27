 
unit ShowENCabelOut10Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCabelOut10ItemController ;


type
  TfrmENCabelOut10ItemShow = class(TChildForm)  
  HTTPRIOENCabelOut10Item: THTTPRIO;
    ImageList1: TImageList;
    sgENCabelOut10Item: TAdvStringGrid;
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
procedure sgENCabelOut10ItemTopLeftChanged(Sender: TObject);
procedure sgENCabelOut10ItemDblClick(Sender: TObject);
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
 // ENCabelOut10ItemObj: ENCabelOut10Item;
 // ENCabelOut10ItemFilterObj: ENCabelOut10ItemFilter;
  
  
implementation

uses Main, EditENCabelOut10Item, EditENCabelOut10ItemFilter;


{$R *.dfm}

var
  //frmENCabelOut10ItemShow : TfrmENCabelOut10ItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCabelOut10ItemHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENCabelOut10ItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCabelOut10ItemShow:=nil;
    inherited;
  end;


procedure TfrmENCabelOut10ItemShow.FormShow(Sender: TObject);
var
  TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
  i: Integer;
  ENCabelOut10ItemList: ENCabelOut10ItemShortList;
  begin
  SetGridHeaders(ENCabelOut10ItemHeaders, sgENCabelOut10Item.ColumnHeaders);
  ColCount:=100;
  TempENCabelOut10Item :=  HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelOut10ItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelOut10ItemList := TempENCabelOut10Item.getScrollableFilteredList(ENCabelOut10ItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENCabelOut10ItemList.list);

  if LastCount > -1 then
     sgENCabelOut10Item.RowCount:=LastCount+2
  else
     sgENCabelOut10Item.RowCount:=2;

   with sgENCabelOut10Item do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCabelOut10ItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCabelOut10ItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENCabelOut10Item.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCabelOut10Item.Row:=1;
end;

procedure TfrmENCabelOut10ItemShow.sgENCabelOut10ItemTopLeftChanged(Sender: TObject);
var
  TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENCabelOut10ItemList: ENCabelOut10ItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCabelOut10Item.TopRow + sgENCabelOut10Item.VisibleRowCount) = ColCount
  then
    begin
      TempENCabelOut10Item :=  HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
      CurrentRow:=sgENCabelOut10Item.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelOut10ItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelOut10ItemList := TempENCabelOut10Item.getScrollableFilteredList(ENCabelOut10ItemFilter(FilterObject),ColCount-1, 100);



  sgENCabelOut10Item.RowCount:=sgENCabelOut10Item.RowCount+100;
  LastCount:=High(ENCabelOut10ItemList.list);
  with sgENCabelOut10Item do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCabelOut10ItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCabelOut10ItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCabelOut10Item.Row:=CurrentRow-5;
   sgENCabelOut10Item.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCabelOut10ItemShow.sgENCabelOut10ItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCabelOut10Item,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCabelOut10ItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCabelOut10Item.RowCount-1 do
   for j:=0 to sgENCabelOut10Item.ColCount-1 do
     sgENCabelOut10Item.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCabelOut10ItemShow.actViewExecute(Sender: TObject);
Var TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
begin
 TempENCabelOut10Item := HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
   try
     ENCabelOut10ItemObj := TempENCabelOut10Item.getObject(StrToInt(sgENCabelOut10Item.Cells[0,sgENCabelOut10Item.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelOut10ItemEdit:=TfrmENCabelOut10ItemEdit.Create(Application, dsView);
  try
    frmENCabelOut10ItemEdit.ShowModal;
  finally
    frmENCabelOut10ItemEdit.Free;
    frmENCabelOut10ItemEdit:=nil;
  end;
end;

procedure TfrmENCabelOut10ItemShow.actEditExecute(Sender: TObject);
Var TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
begin
 TempENCabelOut10Item := HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
   try
     ENCabelOut10ItemObj := TempENCabelOut10Item.getObject(StrToInt(sgENCabelOut10Item.Cells[0,sgENCabelOut10Item.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelOut10ItemEdit:=TfrmENCabelOut10ItemEdit.Create(Application, dsEdit);
  try
    if frmENCabelOut10ItemEdit.ShowModal= mrOk then
      begin
        //TempENCabelOut10Item.save(ENCabelOut10ItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCabelOut10ItemEdit.Free;
    frmENCabelOut10ItemEdit:=nil;
  end;
end;

procedure TfrmENCabelOut10ItemShow.actDeleteExecute(Sender: TObject);
Var TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCabelOut10Item := HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCabelOut10Item.Cells[0,sgENCabelOut10Item.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори для кабельних виходів і вставок (лінії 6-10)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCabelOut10Item.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCabelOut10ItemShow.actInsertExecute(Sender: TObject);
// Var TempENCabelOut10Item: ENCabelOut10ItemControllerSoapPort; 
begin
  // TempENCabelOut10Item := HTTPRIOENCabelOut10Item as ENCabelOut10ItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCabelOut10ItemObj:=ENCabelOut10Item.Create;



  try
    frmENCabelOut10ItemEdit:=TfrmENCabelOut10ItemEdit.Create(Application, dsInsert);
    try
      if frmENCabelOut10ItemEdit.ShowModal = mrOk then
      begin
        if ENCabelOut10ItemObj<>nil then
            //TempENCabelOut10Item.add(ENCabelOut10ItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCabelOut10ItemEdit.Free;
      frmENCabelOut10ItemEdit:=nil;
    end;
  finally
    ENCabelOut10ItemObj.Free;
  end;
end;

procedure TfrmENCabelOut10ItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCabelOut10ItemShow.actFilterExecute(Sender: TObject);
begin
{frmENCabelOut10ItemFilterEdit:=TfrmENCabelOut10ItemFilterEdit.Create(Application, dsInsert);
  try
    ENCabelOut10ItemFilterObj := ENCabelOut10ItemFilter.Create;
    SetNullIntProps(ENCabelOut10ItemFilterObj);
    SetNullXSProps(ENCabelOut10ItemFilterObj);

    if frmENCabelOut10ItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCabelOut10ItemFilter.Create;
      FilterObject := ENCabelOut10ItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCabelOut10ItemFilterEdit.Free;
    frmENCabelOut10ItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENCabelOut10ItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.