
unit ShowENContactBreaker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENContactBreakerController, AdvObj ;


type
  TfrmENContactBreakerShow = class(TChildForm)  
  HTTPRIOENContactBreaker: THTTPRIO;
    ImageList1: TImageList;
    sgENContactBreaker: TAdvStringGrid;
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
procedure sgENContactBreakerTopLeftChanged(Sender: TObject);
procedure sgENContactBreakerDblClick(Sender: TObject);
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
 frmENContactBreakerShow : TfrmENContactBreakerShow;
 // ENContactBreakerObj: ENContactBreaker;
 // ENContactBreakerFilterObj: ENContactBreakerFilter;
  
  
implementation

uses Main, EditENContactBreaker, EditENContactBreakerFilter;


{$R *.dfm}

var
  //frmENContactBreakerShow : TfrmENContactBreakerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENContactBreakerHeaders: array [1..4] of String =
         ('Код'
         ,'Рубильник'
         ,'Диспетчерское название'
         ,'Номинальный ток, А');


procedure TfrmENContactBreakerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENContactBreakerShow:=nil;
    inherited;
  end;


procedure TfrmENContactBreakerShow.FormShow(Sender: TObject);
var
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  i: Integer;
  ENContactBreakerList: ENContactBreakerShortList;
begin
  SetGridHeaders(ENContactBreakerHeaders, sgENContactBreaker.ColumnHeaders);
  ColCount:=100;
  TempENContactBreaker :=  HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENContactBreakerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContactBreakerList := TempENContactBreaker.getScrollableFilteredList(
    ENContactBreakerFilter(FilterObject), 0, ColCount);

  LastCount := High(ENContactBreakerList.list);

  if LastCount > -1 then
     sgENContactBreaker.RowCount := LastCount + 2
  else
     sgENContactBreaker.RowCount := 2;
   with sgENContactBreaker do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContactBreakerList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENContactBreakerList.list[i].code)
        else //Код Рубильника
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENContactBreakerList.list[i].materialRefName; //Рубильник из Нормативных материалов
        Cells[2, i + 1] := ENContactBreakerList.list[i].name; //Диспетчерское название
        if ENContactBreakerList.list[i].current = nil then
          Cells[3, i + 1] := ''
        else //Номинальный ток, А
          Cells[3, i + 1] := ENContactBreakerList.list[i].current.DecimalString;
        LastRow := i + 1;
        sgENContactBreaker.RowCount := LastRow + 1;
      end;
   ColCount:=ColCount+1;
   sgENContactBreaker.Row:=1;
end;

procedure TfrmENContactBreakerShow.sgENContactBreakerTopLeftChanged(Sender: TObject);
var
  TempENContactBreaker: ENContactBreakerControllerSoapPort;
  i,CurrentRow: Integer;
  ENContactBreakerList: ENContactBreakerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENContactBreaker.TopRow + sgENContactBreaker.VisibleRowCount) = ColCount
  then
    begin
      TempENContactBreaker :=  HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
      CurrentRow:=sgENContactBreaker.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENContactBreakerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContactBreakerList := TempENContactBreaker.getScrollableFilteredList(ENContactBreakerFilter(FilterObject),ColCount-1, 100);



  sgENContactBreaker.RowCount:=sgENContactBreaker.RowCount+100;
  LastCount:=High(ENContactBreakerList.list);
  with sgENContactBreaker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContactBreakerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENContactBreakerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENContactBreakerList.list[i].current = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENContactBreakerList.list[i].current.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENContactBreaker.Row:=CurrentRow-5;
   sgENContactBreaker.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENContactBreakerShow.sgENContactBreakerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENContactBreaker,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENContactBreakerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENContactBreaker.RowCount-1 do
   for j:=0 to sgENContactBreaker.ColCount-1 do
     sgENContactBreaker.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENContactBreakerShow.actViewExecute(Sender: TObject);
Var TempENContactBreaker: ENContactBreakerControllerSoapPort;
begin
 TempENContactBreaker := HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
   try
     ENContactBreakerObj := TempENContactBreaker.getObject(StrToInt(sgENContactBreaker.Cells[0,sgENContactBreaker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContactBreakerEdit:=TfrmENContactBreakerEdit.Create(Application, dsView);
  try
    frmENContactBreakerEdit.ShowModal;
  finally
    frmENContactBreakerEdit.Free;
    frmENContactBreakerEdit:=nil;
  end;
end;

procedure TfrmENContactBreakerShow.actEditExecute(Sender: TObject);
Var TempENContactBreaker: ENContactBreakerControllerSoapPort;
begin
 TempENContactBreaker := HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
   try
     ENContactBreakerObj := TempENContactBreaker.getObject(StrToInt(sgENContactBreaker.Cells[0,sgENContactBreaker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContactBreakerEdit:=TfrmENContactBreakerEdit.Create(Application, dsEdit);
  try
    if frmENContactBreakerEdit.ShowModal= mrOk then
      begin
        //TempENContactBreaker.save(ENContactBreakerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENContactBreakerEdit.Free;
    frmENContactBreakerEdit:=nil;
  end;
end;

procedure TfrmENContactBreakerShow.actDeleteExecute(Sender: TObject);
Var TempENContactBreaker: ENContactBreakerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContactBreaker := HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContactBreaker.Cells[0,sgENContactBreaker.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Рубильники) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContactBreaker.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENContactBreakerShow.actInsertExecute(Sender: TObject);
Var TempENContactBreaker: ENContactBreakerControllerSoapPort;
begin
  TempENContactBreaker := HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
  ENContactBreakerObj:=ENContactBreaker.Create;

   //ENContactBreakerObj.current:= TXSDecimal.Create;


  try
    frmENContactBreakerEdit:=TfrmENContactBreakerEdit.Create(Application, dsInsert);
    try
      if frmENContactBreakerEdit.ShowModal = mrOk then
      begin
        if ENContactBreakerObj<>nil then
            //TempENContactBreaker.add(ENContactBreakerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENContactBreakerEdit.Free;
      frmENContactBreakerEdit:=nil;
    end;
  finally
    ENContactBreakerObj.Free;
  end;
end;

procedure TfrmENContactBreakerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENContactBreakerShow.actFilterExecute(Sender: TObject);
begin
{frmENContactBreakerFilterEdit:=TfrmENContactBreakerFilterEdit.Create(Application, dsInsert);
  try
    ENContactBreakerFilterObj := ENContactBreakerFilter.Create;
    SetNullIntProps(ENContactBreakerFilterObj);
    SetNullXSProps(ENContactBreakerFilterObj);

    if frmENContactBreakerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContactBreakerFilter.Create;
      FilterObject := ENContactBreakerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENContactBreakerFilterEdit.Free;
    frmENContactBreakerFilterEdit:=nil;
  end;}
end;

procedure TfrmENContactBreakerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.