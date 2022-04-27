
unit ShowENMark;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMarkController, AdvObj ;


type
  TfrmENMarkShow = class(TChildForm)  
  HTTPRIOENMark: THTTPRIO;
    ImageList1: TImageList;
    sgENMark: TAdvStringGrid;
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
procedure sgENMarkTopLeftChanged(Sender: TObject);
procedure sgENMarkDblClick(Sender: TObject);
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
 frmENMarkShow : TfrmENMarkShow;
 // ENMarkObj: ENMark;
 // ENMarkFilterObj: ENMarkFilter;
  
  
implementation

uses Main, EditENMark, EditENMarkFilter;


{$R *.dfm}

var
  //frmENMarkShow : TfrmENMarkShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMarkHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENMarkShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMarkShow:=nil;
    inherited;
  end;


procedure TfrmENMarkShow.FormShow(Sender: TObject);
var
  TempENMark: ENMarkControllerSoapPort;
  i: Integer;
  ENMarkList: ENMarkShortList;
  begin

  DisableActions([actEdit, actInsert, actDelete]);

  SetGridHeaders(ENMarkHeaders, sgENMark.ColumnHeaders);
  ColCount:=100;
  TempENMark :=  HTTPRIOENMark as ENMarkControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMarkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMarkList := TempENMark.getScrollableFilteredList(ENMarkFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMarkList.list);

  if LastCount > -1 then
     sgENMark.RowCount:=LastCount+2
  else
     sgENMark.RowCount:=2;

   with sgENMark do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMarkList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMarkList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMarkList.list[i].name;
        LastRow:=i+1;
        sgENMark.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMark.Row:=1;
end;

procedure TfrmENMarkShow.sgENMarkTopLeftChanged(Sender: TObject);
var
  TempENMark: ENMarkControllerSoapPort;
  i,CurrentRow: Integer;
  ENMarkList: ENMarkShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMark.TopRow + sgENMark.VisibleRowCount) = ColCount
  then
    begin
      TempENMark :=  HTTPRIOENMark as ENMarkControllerSoapPort;
      CurrentRow:=sgENMark.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMarkFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMarkList := TempENMark.getScrollableFilteredList(ENMarkFilter(FilterObject),ColCount-1, 100);



  sgENMark.RowCount:=sgENMark.RowCount+100;
  LastCount:=High(ENMarkList.list);
  with sgENMark do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMarkList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMarkList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMarkList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMark.Row:=CurrentRow-5;
   sgENMark.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMarkShow.sgENMarkDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMark,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMarkShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMark.RowCount-1 do
   for j:=0 to sgENMark.ColCount-1 do
     sgENMark.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMarkShow.actViewExecute(Sender: TObject);
Var TempENMark: ENMarkControllerSoapPort;
begin
 TempENMark := HTTPRIOENMark as ENMarkControllerSoapPort;
   try
     ENMarkObj := TempENMark.getObject(StrToInt(sgENMark.Cells[0,sgENMark.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMarkEdit:=TfrmENMarkEdit.Create(Application, dsView);
  try
    frmENMarkEdit.ShowModal;
  finally
    frmENMarkEdit.Free;
    frmENMarkEdit:=nil;
  end;
end;

procedure TfrmENMarkShow.actEditExecute(Sender: TObject);
Var TempENMark: ENMarkControllerSoapPort;
begin
 TempENMark := HTTPRIOENMark as ENMarkControllerSoapPort;
   try
     ENMarkObj := TempENMark.getObject(StrToInt(sgENMark.Cells[0,sgENMark.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMarkEdit:=TfrmENMarkEdit.Create(Application, dsEdit);
  try
    if frmENMarkEdit.ShowModal= mrOk then
      begin
        //TempENMark.save(ENMarkObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMarkEdit.Free;
    frmENMarkEdit:=nil;
  end;
end;

procedure TfrmENMarkShow.actDeleteExecute(Sender: TObject);
Var TempENMark: ENMarkControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMark := HTTPRIOENMark as ENMarkControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMark.Cells[0,sgENMark.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Маркер) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMark.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMarkShow.actInsertExecute(Sender: TObject);
Var TempENMark: ENMarkControllerSoapPort;
begin
  TempENMark := HTTPRIOENMark as ENMarkControllerSoapPort;
  ENMarkObj:=ENMark.Create;



  try
    frmENMarkEdit:=TfrmENMarkEdit.Create(Application, dsInsert);
    try
      if frmENMarkEdit.ShowModal = mrOk then
      begin
        if ENMarkObj<>nil then
            //TempENMark.add(ENMarkObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMarkEdit.Free;
      frmENMarkEdit:=nil;
    end;
  finally
    ENMarkObj.Free;
  end;
end;

procedure TfrmENMarkShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMarkShow.actFilterExecute(Sender: TObject);
begin
{frmENMarkFilterEdit:=TfrmENMarkFilterEdit.Create(Application, dsEdit);
  try
    ENMarkFilterObj := ENMarkFilter.Create;
    SetNullIntProps(ENMarkFilterObj);
    SetNullXSProps(ENMarkFilterObj);

    if frmENMarkFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMarkFilter.Create;
      FilterObject := ENMarkFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMarkFilterEdit.Free;
    frmENMarkFilterEdit:=nil;
  end;}
end;

procedure TfrmENMarkShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;



end.