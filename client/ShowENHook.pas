
unit ShowENHook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENHookController ;


type
  TfrmENHookShow = class(TChildForm)  
  HTTPRIOENHook: THTTPRIO;
    ImageList1: TImageList;
    sgENHook: TAdvStringGrid;
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
procedure sgENHookTopLeftChanged(Sender: TObject);
procedure sgENHookDblClick(Sender: TObject);
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
 // ENHookObj: ENHook;
 // ENHookFilterObj: ENHookFilter;
  
  
implementation

uses Main, EditENHook, EditENHookFilter;


{$R *.dfm}

var
  //frmENHookShow : TfrmENHookShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHookHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва крюку'
        );
   

procedure TfrmENHookShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENHookShow:=nil;
    inherited;
  end;


procedure TfrmENHookShow.FormShow(Sender: TObject);
var
  TempENHook: ENHookControllerSoapPort;
  i: Integer;
  ENHookList: ENHookShortList;
  begin
  SetGridHeaders(ENHookHeaders, sgENHook.ColumnHeaders);
  ColCount:=100;
  TempENHook :=  HTTPRIOENHook as ENHookControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHookFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHookList := TempENHook.getScrollableFilteredList(ENHookFilter(FilterObject),0,ColCount);


  LastCount:=High(ENHookList.list);

  if LastCount > -1 then
     sgENHook.RowCount:=LastCount+2
  else
     sgENHook.RowCount:=2;

   with sgENHook do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHookList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHookList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENHookList.list[i].name;
        LastRow:=i+1;
        sgENHook.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENHook.Row:=1;
end;

procedure TfrmENHookShow.sgENHookTopLeftChanged(Sender: TObject);
var
  TempENHook: ENHookControllerSoapPort;
  i,CurrentRow: Integer;
  ENHookList: ENHookShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENHook.TopRow + sgENHook.VisibleRowCount) = ColCount
  then
    begin
      TempENHook :=  HTTPRIOENHook as ENHookControllerSoapPort;
      CurrentRow:=sgENHook.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENHookFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHookList := TempENHook.getScrollableFilteredList(ENHookFilter(FilterObject),ColCount-1, 100);



  sgENHook.RowCount:=sgENHook.RowCount+100;
  LastCount:=High(ENHookList.list);
  with sgENHook do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHookList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHookList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENHookList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHook.Row:=CurrentRow-5;
   sgENHook.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENHookShow.sgENHookDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHook,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENHookShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENHook.RowCount-1 do
   for j:=0 to sgENHook.ColCount-1 do
     sgENHook.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENHookShow.actViewExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort;
begin
 TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
   try
     ENHookObj := TempENHook.getObject(StrToInt(sgENHook.Cells[0,sgENHook.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHookEdit:=TfrmENHookEdit.Create(Application, dsView);
  try
    frmENHookEdit.ShowModal;
  finally
    frmENHookEdit.Free;
    frmENHookEdit:=nil;
  end;
end;

procedure TfrmENHookShow.actEditExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort;
begin
 TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
   try
     ENHookObj := TempENHook.getObject(StrToInt(sgENHook.Cells[0,sgENHook.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHookEdit:=TfrmENHookEdit.Create(Application, dsEdit);
  try
    if frmENHookEdit.ShowModal= mrOk then
      begin
        //TempENHook.save(ENHookObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHookEdit.Free;
    frmENHookEdit:=nil;
  end;
end;

procedure TfrmENHookShow.actDeleteExecute(Sender: TObject);
Var TempENHook: ENHookControllerSoapPort;
  ObjCode: Integer;
begin
 TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;
   try
     ObjCode := StrToInt(sgENHook.Cells[0,sgENHook.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Крюки на опорах) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHook.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENHookShow.actInsertExecute(Sender: TObject);
// Var TempENHook: ENHookControllerSoapPort; 
begin
  // TempENHook := HTTPRIOENHook as ENHookControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENHookObj:=ENHook.Create;



  try
    frmENHookEdit:=TfrmENHookEdit.Create(Application, dsInsert);
    try
      if frmENHookEdit.ShowModal = mrOk then
      begin
        if ENHookObj<>nil then
            //TempENHook.add(ENHookObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHookEdit.Free;
      frmENHookEdit:=nil;
    end;
  finally
    ENHookObj.Free;
  end;
end;

procedure TfrmENHookShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENHookShow.actFilterExecute(Sender: TObject);
begin
{frmENHookFilterEdit:=TfrmENHookFilterEdit.Create(Application, dsInsert);
  try
    ENHookFilterObj := ENHookFilter.Create;
    SetNullIntProps(ENHookFilterObj);
    SetNullXSProps(ENHookFilterObj);

    if frmENHookFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHookFilter.Create;
      FilterObject := ENHookFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHookFilterEdit.Free;
    frmENHookFilterEdit:=nil;
  end;}
end;

procedure TfrmENHookShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.