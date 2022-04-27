
unit ShowENSubst150Cell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150CellController, AdvObj ;


type
  TfrmENSubst150CellShow = class(TChildForm)
  HTTPRIOENSubst150Cell: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150Cell: TAdvStringGrid;
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
procedure sgENSubst150CellTopLeftChanged(Sender: TObject);
procedure sgENSubst150CellDblClick(Sender: TObject);
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
 frmENSubst150CellShow : TfrmENSubst150CellShow;
 // ENSubst150CellObj: ENSubst150Cell;
 // ENSubst150CellFilterObj: ENSubst150CellFilter;
  
  
implementation

uses Main, EditENSubst150Cell, EditENSubst150CellFilter;


{$R *.dfm}

var
  //frmENSubst150CellShow : TfrmENSubst150CellShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150CellHeaders: array [1..5] of String =
        ( 'Код'
          ,'Диспетч. наименование присоединения'
          ,'Заводской номер'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150CellShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150CellShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150CellShow.FormShow(Sender: TObject);
var
  TempENSubst150Cell: ENSubst150CellControllerSoapPort;
  i: Integer;
  ENSubst150CellList: ENSubst150CellShortList;
  begin
  SetGridHeaders(ENSubst150CellHeaders, sgENSubst150Cell.ColumnHeaders);
  ColCount:=100;
  TempENSubst150Cell :=  HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150CellFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150CellList := TempENSubst150Cell.getScrollableFilteredList(ENSubst150CellFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150CellList.list);

  if LastCount > -1 then
     sgENSubst150Cell.RowCount:=LastCount+2
  else
     sgENSubst150Cell.RowCount:=2;

   with sgENSubst150Cell do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150CellList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150CellList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150CellList.list[i].name;
        Cells[2,i+1] := ENSubst150CellList.list[i].factoryNumber;
        Cells[3,i+1] := ENSubst150CellList.list[i].commentGen;
        Cells[4,i+1] := ENSubst150CellList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150Cell.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150Cell.Row:=1;
end;

procedure TfrmENSubst150CellShow.sgENSubst150CellTopLeftChanged(Sender: TObject);
var
  TempENSubst150Cell: ENSubst150CellControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150CellList: ENSubst150CellShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150Cell.TopRow + sgENSubst150Cell.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150Cell :=  HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
      CurrentRow:=sgENSubst150Cell.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150CellFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150CellList := TempENSubst150Cell.getScrollableFilteredList(ENSubst150CellFilter(FilterObject),ColCount-1, 100);



  sgENSubst150Cell.RowCount:=sgENSubst150Cell.RowCount+100;
  LastCount:=High(ENSubst150CellList.list);
  with sgENSubst150Cell do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150CellList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150CellList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150CellList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150CellList.list[i].factoryNumber;
        Cells[3,i+CurrentRow] := ENSubst150CellList.list[i].commentGen;
        Cells[4,i+CurrentRow] := ENSubst150CellList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150Cell.Row:=CurrentRow-5;
   sgENSubst150Cell.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150CellShow.sgENSubst150CellDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150Cell,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150CellShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150Cell.RowCount-1 do
   for j:=0 to sgENSubst150Cell.ColCount-1 do
     sgENSubst150Cell.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150CellShow.actViewExecute(Sender: TObject);
Var TempENSubst150Cell: ENSubst150CellControllerSoapPort;
begin
 TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
   try
     ENSubst150CellObj := TempENSubst150Cell.getObject(StrToInt(sgENSubst150Cell.Cells[0,sgENSubst150Cell.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150CellEdit:=TfrmENSubst150CellEdit.Create(Application, dsView);
  try
    frmENSubst150CellEdit.ShowModal;
  finally
    frmENSubst150CellEdit.Free;
    frmENSubst150CellEdit:=nil;
  end;
end;

procedure TfrmENSubst150CellShow.actEditExecute(Sender: TObject);
Var TempENSubst150Cell: ENSubst150CellControllerSoapPort;
begin
 TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
   try
     ENSubst150CellObj := TempENSubst150Cell.getObject(StrToInt(sgENSubst150Cell.Cells[0,sgENSubst150Cell.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150CellEdit:=TfrmENSubst150CellEdit.Create(Application, dsEdit);
  try
    if frmENSubst150CellEdit.ShowModal= mrOk then
      begin
        //TempENSubst150Cell.save(ENSubst150CellObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150CellEdit.Free;
    frmENSubst150CellEdit:=nil;
  end;
end;

procedure TfrmENSubst150CellShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150Cell: ENSubst150CellControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150Cell.Cells[0,sgENSubst150Cell.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ячейки ПС 35-150 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150Cell.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150CellShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150Cell: ENSubst150CellControllerSoapPort; 
begin
  // TempENSubst150Cell := HTTPRIOENSubst150Cell as ENSubst150CellControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150CellObj:=ENSubst150Cell.Create;

   //ENSubst150CellObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150CellEdit:=TfrmENSubst150CellEdit.Create(Application, dsInsert);
    try
      if frmENSubst150CellEdit.ShowModal = mrOk then
      begin
        if ENSubst150CellObj<>nil then
            //TempENSubst150Cell.add(ENSubst150CellObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150CellEdit.Free;
      frmENSubst150CellEdit:=nil;
    end;
  finally
    ENSubst150CellObj.Free;
  end;
end;

procedure TfrmENSubst150CellShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150CellShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150CellFilterEdit:=TfrmENSubst150CellFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150CellFilterObj := ENSubst150CellFilter.Create;
    SetNullIntProps(ENSubst150CellFilterObj);
    SetNullXSProps(ENSubst150CellFilterObj);

    if frmENSubst150CellFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150CellFilter.Create;
      FilterObject := ENSubst150CellFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150CellFilterEdit.Free;
    frmENSubst150CellFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150CellShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.