
unit ShowENHumenItemKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENHumenItemKindController ;


type
  TfrmENHumenItemKindShow = class(TChildForm)  
  HTTPRIOENHumenItemKind: THTTPRIO;
    ImageList1: TImageList;
    sgENHumenItemKind: TAdvStringGrid;
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
procedure sgENHumenItemKindTopLeftChanged(Sender: TObject);
procedure sgENHumenItemKindDblClick(Sender: TObject);
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
 // ENHumenItemKindObj: ENHumenItemKind;
 // ENHumenItemKindFilterObj: ENHumenItemKindFilter;
  
  
implementation

uses Main, EditENHumenItemKind, EditENHumenItemKindFilter;


{$R *.dfm}

var
  //frmENHumenItemKindShow : TfrmENHumenItemKindShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHumenItemKindHeaders: array [1..2] of String =
        ( 'Код'
          ,'Вид персонала'
        );
   

procedure TfrmENHumenItemKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENHumenItemKindShow:=nil;
    inherited;
  end;


procedure TfrmENHumenItemKindShow.FormShow(Sender: TObject);
var
  TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
  i: Integer;
  ENHumenItemKindList: ENHumenItemKindShortList;
  begin
  SetGridHeaders(ENHumenItemKindHeaders, sgENHumenItemKind.ColumnHeaders);
  ColCount:=100;
  TempENHumenItemKind :=  HTTPRIOENHumenItemKind as ENHumenItemKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHumenItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHumenItemKindList := TempENHumenItemKind.getScrollableFilteredList(ENHumenItemKindFilter(FilterObject),0,ColCount);


  LastCount:=High(ENHumenItemKindList.list);

  if LastCount > -1 then
     sgENHumenItemKind.RowCount:=LastCount+2
  else
     sgENHumenItemKind.RowCount:=2;

   with sgENHumenItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHumenItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHumenItemKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENHumenItemKindList.list[i].name;
        LastRow:=i+1;
        sgENHumenItemKind.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENHumenItemKind.Row:=1;
end;

procedure TfrmENHumenItemKindShow.sgENHumenItemKindTopLeftChanged(Sender: TObject);
var
  TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENHumenItemKindList: ENHumenItemKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENHumenItemKind.TopRow + sgENHumenItemKind.VisibleRowCount) = ColCount
  then
    begin
      TempENHumenItemKind :=  HTTPRIOENHumenItemKind as ENHumenItemKindControllerSoapPort;
      CurrentRow:=sgENHumenItemKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENHumenItemKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHumenItemKindList := TempENHumenItemKind.getScrollableFilteredList(ENHumenItemKindFilter(FilterObject),ColCount-1, 100);



  sgENHumenItemKind.RowCount:=sgENHumenItemKind.RowCount+100;
  LastCount:=High(ENHumenItemKindList.list);
  with sgENHumenItemKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHumenItemKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHumenItemKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENHumenItemKindList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHumenItemKind.Row:=CurrentRow-5;
   sgENHumenItemKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENHumenItemKindShow.sgENHumenItemKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHumenItemKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENHumenItemKindShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENHumenItemKind.RowCount-1 do
   for j:=0 to sgENHumenItemKind.ColCount-1 do
     sgENHumenItemKind.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENHumenItemKindShow.actViewExecute(Sender: TObject);
Var TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
begin
 TempENHumenItemKind := HTTPRIOENHumenItemKind as ENHumenItemKindControllerSoapPort;
   try
     ENHumenItemKindObj := TempENHumenItemKind.getObject(StrToInt(sgENHumenItemKind.Cells[0,sgENHumenItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHumenItemKindEdit:=TfrmENHumenItemKindEdit.Create(Application, dsView);
  try
    frmENHumenItemKindEdit.ShowModal;
  finally
    frmENHumenItemKindEdit.Free;
    frmENHumenItemKindEdit:=nil;
  end;
end;

procedure TfrmENHumenItemKindShow.actEditExecute(Sender: TObject);
Var TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
begin
 TempENHumenItemKind := HTTPRIOENHumenItemKind as ENHumenItemKindControllerSoapPort;
   try
     ENHumenItemKindObj := TempENHumenItemKind.getObject(StrToInt(sgENHumenItemKind.Cells[0,sgENHumenItemKind.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHumenItemKindEdit:=TfrmENHumenItemKindEdit.Create(Application, dsEdit);
  try
    if frmENHumenItemKindEdit.ShowModal= mrOk then
      begin
        //TempENHumenItemKind.save(ENHumenItemKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHumenItemKindEdit.Free;
    frmENHumenItemKindEdit:=nil;
  end;
end;

procedure TfrmENHumenItemKindShow.actDeleteExecute(Sender: TObject);
Var TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENHumenItemKind := HTTPRIOENHumenItemKind as ENHumenItemKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENHumenItemKind.Cells[0,sgENHumenItemKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Види персонала (ел.тех., водії і т.д.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHumenItemKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENHumenItemKindShow.actInsertExecute(Sender: TObject);
Var TempENHumenItemKind: ENHumenItemKindControllerSoapPort;
begin
  TempENHumenItemKind := HTTPRIOENHumenItemKind as ENHumenItemKindControllerSoapPort;
  ENHumenItemKindObj:=ENHumenItemKind.Create;



  try
    frmENHumenItemKindEdit:=TfrmENHumenItemKindEdit.Create(Application, dsInsert);
    try
      if frmENHumenItemKindEdit.ShowModal = mrOk then
      begin
        if ENHumenItemKindObj<>nil then
            //TempENHumenItemKind.add(ENHumenItemKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHumenItemKindEdit.Free;
      frmENHumenItemKindEdit:=nil;
    end;
  finally
    ENHumenItemKindObj.Free;
  end;
end;

procedure TfrmENHumenItemKindShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENHumenItemKindShow.actFilterExecute(Sender: TObject);
begin
{frmENHumenItemKindFilterEdit:=TfrmENHumenItemKindFilterEdit.Create(Application, dsEdit);
  try
    ENHumenItemKindFilterObj := ENHumenItemKindFilter.Create;
    SetNullIntProps(ENHumenItemKindFilterObj);
    SetNullXSProps(ENHumenItemKindFilterObj);

    if frmENHumenItemKindFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHumenItemKindFilter.Create;
      FilterObject := ENHumenItemKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHumenItemKindFilterEdit.Free;
    frmENHumenItemKindFilterEdit:=nil;
  end;}
end;

procedure TfrmENHumenItemKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.