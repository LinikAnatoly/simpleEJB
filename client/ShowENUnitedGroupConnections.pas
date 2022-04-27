
unit ShowENUnitedGroupConnections;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENUnitedGroupConnectionsController, AdvObj ;


type
  TfrmENUnitedGroupConnectionsShow = class(TChildForm)  
  HTTPRIOENUnitedGroupConnections: THTTPRIO;
    ImageList1: TImageList;
    sgENUnitedGroupConnections: TAdvStringGrid;
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
procedure sgENUnitedGroupConnectionsTopLeftChanged(Sender: TObject);
procedure sgENUnitedGroupConnectionsDblClick(Sender: TObject);
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
 frmENUnitedGroupConnectionsShow : TfrmENUnitedGroupConnectionsShow;
 // ENUnitedGroupConnectionsObj: ENUnitedGroupConnections;
 // ENUnitedGroupConnectionsFilterObj: ENUnitedGroupConnectionsFilter;
  
  
implementation

uses Main, {EditENUnitedGroupConnections, }EditENUnitedGroupConnectionsFilter;


{$R *.dfm}

var
  //frmENUnitedGroupConnectionsShow : TfrmENUnitedGroupConnectionsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENUnitedGroupConnectionsHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва'
          ,'Короткий опис'
        );
   

procedure TfrmENUnitedGroupConnectionsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENUnitedGroupConnectionsShow:=nil;
    inherited;
  end;


procedure TfrmENUnitedGroupConnectionsShow.FormShow(Sender: TObject);
var
  TempENUnitedGroupConnections: ENUnitedGroupConnectionsControllerSoapPort;
  i: Integer;
  ENUnitedGroupConnectionsList: ENUnitedGroupConnectionsShortList;
  begin
  SetGridHeaders(ENUnitedGroupConnectionsHeaders, sgENUnitedGroupConnections.ColumnHeaders);
  ColCount:=100;
  TempENUnitedGroupConnections :=  HTTPRIOENUnitedGroupConnections as ENUnitedGroupConnectionsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENUnitedGroupConnectionsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENUnitedGroupConnectionsList := TempENUnitedGroupConnections.getScrollableFilteredList(ENUnitedGroupConnectionsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENUnitedGroupConnectionsList.list);

  if LastCount > -1 then
     sgENUnitedGroupConnections.RowCount:=LastCount+2
  else
     sgENUnitedGroupConnections.RowCount:=2;

   with sgENUnitedGroupConnections do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENUnitedGroupConnectionsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENUnitedGroupConnectionsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENUnitedGroupConnectionsList.list[i].name;
        Cells[2,i+1] := ENUnitedGroupConnectionsList.list[i].description;
        LastRow:=i+1;
        sgENUnitedGroupConnections.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENUnitedGroupConnections.Row:=1;
end;

procedure TfrmENUnitedGroupConnectionsShow.sgENUnitedGroupConnectionsTopLeftChanged(Sender: TObject);
var
  TempENUnitedGroupConnections: ENUnitedGroupConnectionsControllerSoapPort;
  i,CurrentRow: Integer;
  ENUnitedGroupConnectionsList: ENUnitedGroupConnectionsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENUnitedGroupConnections.TopRow + sgENUnitedGroupConnections.VisibleRowCount) = ColCount
  then
    begin
      TempENUnitedGroupConnections :=  HTTPRIOENUnitedGroupConnections as ENUnitedGroupConnectionsControllerSoapPort;
      CurrentRow:=sgENUnitedGroupConnections.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENUnitedGroupConnectionsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENUnitedGroupConnectionsList := TempENUnitedGroupConnections.getScrollableFilteredList(ENUnitedGroupConnectionsFilter(FilterObject),ColCount-1, 100);



  sgENUnitedGroupConnections.RowCount:=sgENUnitedGroupConnections.RowCount+100;
  LastCount:=High(ENUnitedGroupConnectionsList.list);
  with sgENUnitedGroupConnections do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENUnitedGroupConnectionsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENUnitedGroupConnectionsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENUnitedGroupConnectionsList.list[i].name;
        Cells[2,i+CurrentRow] := ENUnitedGroupConnectionsList.list[i].description;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENUnitedGroupConnections.Row:=CurrentRow-5;
   sgENUnitedGroupConnections.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENUnitedGroupConnectionsShow.sgENUnitedGroupConnectionsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENUnitedGroupConnections,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENUnitedGroupConnectionsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENUnitedGroupConnections.RowCount-1 do
   for j:=0 to sgENUnitedGroupConnections.ColCount-1 do
     sgENUnitedGroupConnections.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENUnitedGroupConnectionsShow.actViewExecute(Sender: TObject);
Var TempENUnitedGroupConnections: ENUnitedGroupConnectionsControllerSoapPort;
begin
{
 TempENUnitedGroupConnections := HTTPRIOENUnitedGroupConnections as ENUnitedGroupConnectionsControllerSoapPort;
   try
     ENUnitedGroupConnectionsObj := TempENUnitedGroupConnections.getObject(StrToInt(sgENUnitedGroupConnections.Cells[0,sgENUnitedGroupConnections.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENUnitedGroupConnectionsEdit:=TfrmENUnitedGroupConnectionsEdit.Create(Application, dsView);
  try
    frmENUnitedGroupConnectionsEdit.ShowModal;
  finally
    frmENUnitedGroupConnectionsEdit.Free;
    frmENUnitedGroupConnectionsEdit:=nil;
  end;
}
end;

procedure TfrmENUnitedGroupConnectionsShow.actEditExecute(Sender: TObject);
Var TempENUnitedGroupConnections: ENUnitedGroupConnectionsControllerSoapPort;
begin
{
 TempENUnitedGroupConnections := HTTPRIOENUnitedGroupConnections as ENUnitedGroupConnectionsControllerSoapPort;
   try
     ENUnitedGroupConnectionsObj := TempENUnitedGroupConnections.getObject(StrToInt(sgENUnitedGroupConnections.Cells[0,sgENUnitedGroupConnections.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENUnitedGroupConnectionsEdit:=TfrmENUnitedGroupConnectionsEdit.Create(Application, dsEdit);
  try
    if frmENUnitedGroupConnectionsEdit.ShowModal= mrOk then
      begin
        //TempENUnitedGroupConnections.save(ENUnitedGroupConnectionsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENUnitedGroupConnectionsEdit.Free;
    frmENUnitedGroupConnectionsEdit:=nil;
  end;
}
end;

procedure TfrmENUnitedGroupConnectionsShow.actDeleteExecute(Sender: TObject);
Var TempENUnitedGroupConnections: ENUnitedGroupConnectionsControllerSoapPort;
  ObjCode: Integer;
begin
{
 TempENUnitedGroupConnections := HTTPRIOENUnitedGroupConnections as ENUnitedGroupConnectionsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENUnitedGroupConnections.Cells[0,sgENUnitedGroupConnections.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Об`єднана група договорів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENUnitedGroupConnections.remove(ObjCode);
      UpdateGrid(Sender);
  end;
}
end;

procedure TfrmENUnitedGroupConnectionsShow.actInsertExecute(Sender: TObject);
// Var TempENUnitedGroupConnections: ENUnitedGroupConnectionsControllerSoapPort; 
begin
  // TempENUnitedGroupConnections := HTTPRIOENUnitedGroupConnections as ENUnitedGroupConnectionsControllerSoapPort;  /// Это здесь уже лишнее!!!
{
  ENUnitedGroupConnectionsObj:=ENUnitedGroupConnections.Create;



  try
    frmENUnitedGroupConnectionsEdit:=TfrmENUnitedGroupConnectionsEdit.Create(Application, dsInsert);
    try
      if frmENUnitedGroupConnectionsEdit.ShowModal = mrOk then
      begin
        if ENUnitedGroupConnectionsObj<>nil then
            //TempENUnitedGroupConnections.add(ENUnitedGroupConnectionsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENUnitedGroupConnectionsEdit.Free;
      frmENUnitedGroupConnectionsEdit:=nil;
    end;
  finally
    ENUnitedGroupConnectionsObj.Free;
  end;
}
end;

procedure TfrmENUnitedGroupConnectionsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENUnitedGroupConnectionsShow.actFilterExecute(Sender: TObject);
begin
{frmENUnitedGroupConnectionsFilterEdit:=TfrmENUnitedGroupConnectionsFilterEdit.Create(Application, dsInsert);
  try
    ENUnitedGroupConnectionsFilterObj := ENUnitedGroupConnectionsFilter.Create;
    SetNullIntProps(ENUnitedGroupConnectionsFilterObj);
    SetNullXSProps(ENUnitedGroupConnectionsFilterObj);

    if frmENUnitedGroupConnectionsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENUnitedGroupConnectionsFilter.Create;
      FilterObject := ENUnitedGroupConnectionsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENUnitedGroupConnectionsFilterEdit.Free;
    frmENUnitedGroupConnectionsFilterEdit:=nil;
  end;}
end;

procedure TfrmENUnitedGroupConnectionsShow.actNoFilterExecute(Sender: TObject);
begin
{
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
}
end;

end.