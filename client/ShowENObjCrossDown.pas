
unit ShowENObjCrossDown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENObjCrossDownController, AdvObj ;


type
  TfrmENObjCrossDownShow = class(TChildForm)  
  HTTPRIOENObjCrossDown: THTTPRIO;
    ImageList1: TImageList;
    sgENObjCrossDown: TAdvStringGrid;
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
procedure sgENObjCrossDownTopLeftChanged(Sender: TObject);
procedure sgENObjCrossDownDblClick(Sender: TObject);
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
 frmENObjCrossDownShow : TfrmENObjCrossDownShow;
 // ENObjCrossDownObj: ENObjCrossDown;
 // ENObjCrossDownFilterObj: ENObjCrossDownFilter;
  
  
implementation

uses Main, EditENObjCrossDown, EditENObjCrossDownFilter;


{$R *.dfm}

var
  //frmENObjCrossDownShow : TfrmENObjCrossDownShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENObjCrossDownHeaders: array [1..2] of String =
        ( 'Код'
          ,'Об''єкт під ПЛ 6-10 кВ'
        );
   

procedure TfrmENObjCrossDownShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENObjCrossDownShow:=nil;
    inherited;
  end;


procedure TfrmENObjCrossDownShow.FormShow(Sender: TObject);
var
  TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
  i: Integer;
  ENObjCrossDownList: ENObjCrossDownShortList;
  begin
  SetGridHeaders(ENObjCrossDownHeaders, sgENObjCrossDown.ColumnHeaders);
  ColCount:=100;
  TempENObjCrossDown :=  HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENObjCrossDownFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENObjCrossDownList := TempENObjCrossDown.getScrollableFilteredList(ENObjCrossDownFilter(FilterObject),0,ColCount);


  LastCount:=High(ENObjCrossDownList.list);

  if LastCount > -1 then
     sgENObjCrossDown.RowCount:=LastCount+2
  else
     sgENObjCrossDown.RowCount:=2;

   with sgENObjCrossDown do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENObjCrossDownList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENObjCrossDownList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENObjCrossDownList.list[i].name;
        LastRow:=i+1;
        sgENObjCrossDown.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENObjCrossDown.Row:=1;
end;

procedure TfrmENObjCrossDownShow.sgENObjCrossDownTopLeftChanged(Sender: TObject);
var
  TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
  i,CurrentRow: Integer;
  ENObjCrossDownList: ENObjCrossDownShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENObjCrossDown.TopRow + sgENObjCrossDown.VisibleRowCount) = ColCount
  then
    begin
      TempENObjCrossDown :=  HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;
      CurrentRow:=sgENObjCrossDown.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENObjCrossDownFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENObjCrossDownList := TempENObjCrossDown.getScrollableFilteredList(ENObjCrossDownFilter(FilterObject),ColCount-1, 100);



  sgENObjCrossDown.RowCount:=sgENObjCrossDown.RowCount+100;
  LastCount:=High(ENObjCrossDownList.list);
  with sgENObjCrossDown do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENObjCrossDownList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENObjCrossDownList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENObjCrossDownList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENObjCrossDown.Row:=CurrentRow-5;
   sgENObjCrossDown.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENObjCrossDownShow.sgENObjCrossDownDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENObjCrossDown,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENObjCrossDownShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENObjCrossDown.RowCount-1 do
   for j:=0 to sgENObjCrossDown.ColCount-1 do
     sgENObjCrossDown.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENObjCrossDownShow.actViewExecute(Sender: TObject);
Var TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
begin
 TempENObjCrossDown := HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;
   try
     ENObjCrossDownObj := TempENObjCrossDown.getObject(StrToInt(sgENObjCrossDown.Cells[0,sgENObjCrossDown.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENObjCrossDownEdit:=TfrmENObjCrossDownEdit.Create(Application, dsView);
  try
    frmENObjCrossDownEdit.ShowModal;
  finally
    frmENObjCrossDownEdit.Free;
    frmENObjCrossDownEdit:=nil;
  end;
end;

procedure TfrmENObjCrossDownShow.actEditExecute(Sender: TObject);
Var TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
begin
 TempENObjCrossDown := HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;
   try
     ENObjCrossDownObj := TempENObjCrossDown.getObject(StrToInt(sgENObjCrossDown.Cells[0,sgENObjCrossDown.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENObjCrossDownEdit:=TfrmENObjCrossDownEdit.Create(Application, dsEdit);
  try
    if frmENObjCrossDownEdit.ShowModal= mrOk then
      begin
        //TempENObjCrossDown.save(ENObjCrossDownObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENObjCrossDownEdit.Free;
    frmENObjCrossDownEdit:=nil;
  end;
end;

procedure TfrmENObjCrossDownShow.actDeleteExecute(Sender: TObject);
Var TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
  ObjCode: Integer;
begin
 TempENObjCrossDown := HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;
   try
     ObjCode := StrToInt(sgENObjCrossDown.Cells[0,sgENObjCrossDown.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Об''єкти, які перетинаються ПЛ 6-10 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENObjCrossDown.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENObjCrossDownShow.actInsertExecute(Sender: TObject);
// Var TempENObjCrossDown: ENObjCrossDownControllerSoapPort; 
begin
  // TempENObjCrossDown := HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENObjCrossDownObj:=ENObjCrossDown.Create;



  try
    frmENObjCrossDownEdit:=TfrmENObjCrossDownEdit.Create(Application, dsInsert);
    try
      if frmENObjCrossDownEdit.ShowModal = mrOk then
      begin
        if ENObjCrossDownObj<>nil then
            //TempENObjCrossDown.add(ENObjCrossDownObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENObjCrossDownEdit.Free;
      frmENObjCrossDownEdit:=nil;
    end;
  finally
    ENObjCrossDownObj.Free;
  end;
end;

procedure TfrmENObjCrossDownShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENObjCrossDownShow.actFilterExecute(Sender: TObject);
begin
{frmENObjCrossDownFilterEdit:=TfrmENObjCrossDownFilterEdit.Create(Application, dsInsert);
  try
    ENObjCrossDownFilterObj := ENObjCrossDownFilter.Create;
    SetNullIntProps(ENObjCrossDownFilterObj);
    SetNullXSProps(ENObjCrossDownFilterObj);

    if frmENObjCrossDownFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENObjCrossDownFilter.Create;
      FilterObject := ENObjCrossDownFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENObjCrossDownFilterEdit.Free;
    frmENObjCrossDownFilterEdit:=nil;
  end;}
end;

procedure TfrmENObjCrossDownShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.