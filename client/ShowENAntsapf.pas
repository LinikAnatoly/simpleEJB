
unit ShowENAntsapf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAntsapfController ;


type
  TfrmENAntsapfShow = class(TChildForm)  
  HTTPRIOENAntsapf: THTTPRIO;
    ImageList1: TImageList;
    sgENAntsapf: TAdvStringGrid;
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
procedure sgENAntsapfTopLeftChanged(Sender: TObject);
procedure sgENAntsapfDblClick(Sender: TObject);
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
 // ENAntsapfObj: ENAntsapf;
 // ENAntsapfFilterObj: ENAntsapfFilter;
  
  
implementation

uses Main, EditENAntsapf, EditENAntsapfFilter;


{$R *.dfm}

var
  //frmENAntsapfShow : TfrmENAntsapfShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAntsapfHeaders: array [1..2] of String =
        ( 'Код'
          ,'Положение переключателя'
        );
   

procedure TfrmENAntsapfShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAntsapfShow:=nil;
    inherited;
  end;


procedure TfrmENAntsapfShow.FormShow(Sender: TObject);
var
  TempENAntsapf: ENAntsapfControllerSoapPort;
  i: Integer;
  ENAntsapfList: ENAntsapfShortList;
  begin
  SetGridHeaders(ENAntsapfHeaders, sgENAntsapf.ColumnHeaders);
  ColCount:=100;
  TempENAntsapf :=  HTTPRIOENAntsapf as ENAntsapfControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAntsapfFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAntsapfList := TempENAntsapf.getScrollableFilteredList(ENAntsapfFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAntsapfList.list);

  if LastCount > -1 then
     sgENAntsapf.RowCount:=LastCount+2
  else
     sgENAntsapf.RowCount:=2;

   with sgENAntsapf do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAntsapfList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAntsapfList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAntsapfList.list[i].name;
        LastRow:=i+1;
        sgENAntsapf.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAntsapf.Row:=1;
end;

procedure TfrmENAntsapfShow.sgENAntsapfTopLeftChanged(Sender: TObject);
var
  TempENAntsapf: ENAntsapfControllerSoapPort;
  i,CurrentRow: Integer;
  ENAntsapfList: ENAntsapfShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAntsapf.TopRow + sgENAntsapf.VisibleRowCount) = ColCount
  then
    begin
      TempENAntsapf :=  HTTPRIOENAntsapf as ENAntsapfControllerSoapPort;
      CurrentRow:=sgENAntsapf.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAntsapfFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAntsapfList := TempENAntsapf.getScrollableFilteredList(ENAntsapfFilter(FilterObject),ColCount-1, 100);



  sgENAntsapf.RowCount:=sgENAntsapf.RowCount+100;
  LastCount:=High(ENAntsapfList.list);
  with sgENAntsapf do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAntsapfList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAntsapfList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAntsapfList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAntsapf.Row:=CurrentRow-5;
   sgENAntsapf.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAntsapfShow.sgENAntsapfDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAntsapf,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAntsapfShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAntsapf.RowCount-1 do
   for j:=0 to sgENAntsapf.ColCount-1 do
     sgENAntsapf.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAntsapfShow.actViewExecute(Sender: TObject);
Var TempENAntsapf: ENAntsapfControllerSoapPort;
begin
 TempENAntsapf := HTTPRIOENAntsapf as ENAntsapfControllerSoapPort;
   try
     ENAntsapfObj := TempENAntsapf.getObject(StrToInt(sgENAntsapf.Cells[0,sgENAntsapf.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAntsapfEdit:=TfrmENAntsapfEdit.Create(Application, dsView);
  try
    frmENAntsapfEdit.ShowModal;
  finally
    frmENAntsapfEdit.Free;
    frmENAntsapfEdit:=nil;
  end;
end;

procedure TfrmENAntsapfShow.actEditExecute(Sender: TObject);
Var TempENAntsapf: ENAntsapfControllerSoapPort;
begin
 TempENAntsapf := HTTPRIOENAntsapf as ENAntsapfControllerSoapPort;
   try
     ENAntsapfObj := TempENAntsapf.getObject(StrToInt(sgENAntsapf.Cells[0,sgENAntsapf.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAntsapfEdit:=TfrmENAntsapfEdit.Create(Application, dsEdit);
  try
    if frmENAntsapfEdit.ShowModal= mrOk then
      begin
        //TempENAntsapf.save(ENAntsapfObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAntsapfEdit.Free;
    frmENAntsapfEdit:=nil;
  end;
end;

procedure TfrmENAntsapfShow.actDeleteExecute(Sender: TObject);
Var TempENAntsapf: ENAntsapfControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAntsapf := HTTPRIOENAntsapf as ENAntsapfControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAntsapf.Cells[0,sgENAntsapf.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Положения переключателя анцапфы) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAntsapf.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAntsapfShow.actInsertExecute(Sender: TObject);
// Var TempENAntsapf: ENAntsapfControllerSoapPort; 
begin
  // TempENAntsapf := HTTPRIOENAntsapf as ENAntsapfControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAntsapfObj:=ENAntsapf.Create;



  try
    frmENAntsapfEdit:=TfrmENAntsapfEdit.Create(Application, dsInsert);
    try
      if frmENAntsapfEdit.ShowModal = mrOk then
      begin
        if ENAntsapfObj<>nil then
            //TempENAntsapf.add(ENAntsapfObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAntsapfEdit.Free;
      frmENAntsapfEdit:=nil;
    end;
  finally
    ENAntsapfObj.Free;
  end;
end;

procedure TfrmENAntsapfShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAntsapfShow.actFilterExecute(Sender: TObject);
begin
{frmENAntsapfFilterEdit:=TfrmENAntsapfFilterEdit.Create(Application, dsInsert);
  try
    ENAntsapfFilterObj := ENAntsapfFilter.Create;
    SetNullIntProps(ENAntsapfFilterObj);
    SetNullXSProps(ENAntsapfFilterObj);

    if frmENAntsapfFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAntsapfFilter.Create;
      FilterObject := ENAntsapfFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAntsapfFilterEdit.Free;
    frmENAntsapfFilterEdit:=nil;
  end;}
end;

procedure TfrmENAntsapfShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.