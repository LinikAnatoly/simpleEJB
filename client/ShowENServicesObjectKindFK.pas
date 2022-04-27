
unit ShowENServicesObjectKindFK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENServicesObjectKindFKController, AdvObj ;


type
    TfrmENServicesObjectKindFKShow = class(TChildForm)  
    HTTPRIOENServicesObjectKindFK: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesObjectKindFK: TAdvStringGrid;
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
    procedure sgENServicesObjectKindFKTopLeftChanged(Sender: TObject);
    procedure sgENServicesObjectKindFKDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
  frmENServicesObjectKindFKShow : TfrmENServicesObjectKindFKShow;
 // ENServicesObjectKindFKObj: ENServicesObjectKindFK;
 // ENServicesObjectKindFKFilterObj: ENServicesObjectKindFKFilter;
  
  
implementation

uses Main, EditENServicesObjectKindFK, EditENServicesObjectKindFKFilter;


{$R *.dfm}

var
  //frmENServicesObjectKindFKShow : TfrmENServicesObjectKindFKShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesObjectKindFKHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmENServicesObjectKindFKShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENServicesObjectKindFKShow:=nil;
  inherited;
end;


procedure TfrmENServicesObjectKindFKShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENServicesObjectKindFKShow.FormShow(Sender: TObject);
var
  TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort;
  i: Integer;
  ENServicesObjectKindFKList: ENServicesObjectKindFKShortList;
begin
  SetGridHeaders(ENServicesObjectKindFKHeaders, sgENServicesObjectKindFK.ColumnHeaders);
  ColCount:=100;
  TempENServicesObjectKindFK :=  HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectKindFKFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesObjectKindFKList := TempENServicesObjectKindFK.getScrollableFilteredList(ENServicesObjectKindFKFilter(FilterObject),0,ColCount);
  LastCount:=High(ENServicesObjectKindFKList.list);

  if LastCount > -1 then
     sgENServicesObjectKindFK.RowCount:=LastCount+2
  else
     sgENServicesObjectKindFK.RowCount:=2;

   with sgENServicesObjectKindFK do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectKindFKList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObjectKindFKList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENServicesObjectKindFKList.list[i].name;
        LastRow:=i+1;
        sgENServicesObjectKindFK.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENServicesObjectKindFK.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENServicesObjectKindFK.RowCount > selectedRow then
      sgENServicesObjectKindFK.Row := selectedRow
    else
      sgENServicesObjectKindFK.Row := sgENServicesObjectKindFK.RowCount - 1;
    end
    else
      sgENServicesObjectKindFK.Row:=1;   
end;


procedure TfrmENServicesObjectKindFKShow.sgENServicesObjectKindFKTopLeftChanged(Sender: TObject);
var
  TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesObjectKindFKList: ENServicesObjectKindFKShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServicesObjectKindFK.TopRow + sgENServicesObjectKindFK.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesObjectKindFK :=  HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;
      CurrentRow:=sgENServicesObjectKindFK.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectKindFKFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesObjectKindFKList := TempENServicesObjectKindFK.getScrollableFilteredList(ENServicesObjectKindFKFilter(FilterObject),ColCount-1, 100);


  sgENServicesObjectKindFK.RowCount:=sgENServicesObjectKindFK.RowCount+100;
  LastCount:=High(ENServicesObjectKindFKList.list);
  with sgENServicesObjectKindFK do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectKindFKList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesObjectKindFKList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENServicesObjectKindFKList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesObjectKindFK.Row:=CurrentRow-5;
   sgENServicesObjectKindFK.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesObjectKindFKShow.sgENServicesObjectKindFKDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServicesObjectKindFK,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENServicesObjectKindFKShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENServicesObjectKindFK.RowCount-1 do
   for j:=0 to sgENServicesObjectKindFK.ColCount-1 do
     sgENServicesObjectKindFK.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENServicesObjectKindFKShow.actViewExecute(Sender: TObject);
var 
  TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort;
begin
  TempENServicesObjectKindFK := HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;
  try
    ENServicesObjectKindFKObj := TempENServicesObjectKindFK.getObject(StrToInt(sgENServicesObjectKindFK.Cells[0,sgENServicesObjectKindFK.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENServicesObjectKindFK.Row;
  frmENServicesObjectKindFKEdit:=TfrmENServicesObjectKindFKEdit.Create(Application, dsView);
  
  try
    frmENServicesObjectKindFKEdit.ShowModal;
  finally
    frmENServicesObjectKindFKEdit.Free;
    frmENServicesObjectKindFKEdit:=nil;
  end;

  if sgENServicesObjectKindFK.RowCount > selectedRow then
    sgENServicesObjectKindFK.Row := selectedRow
  else
    sgENServicesObjectKindFK.Row := sgENServicesObjectKindFK.RowCount - 1;
  
end;


procedure TfrmENServicesObjectKindFKShow.actEditExecute(Sender: TObject);
var 
  TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort;
begin
  TempENServicesObjectKindFK := HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;
  try
    ENServicesObjectKindFKObj := TempENServicesObjectKindFK.getObject(StrToInt(sgENServicesObjectKindFK.Cells[0,sgENServicesObjectKindFK.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENServicesObjectKindFK.Row;
  frmENServicesObjectKindFKEdit:=TfrmENServicesObjectKindFKEdit.Create(Application, dsEdit);
  
  try
    if frmENServicesObjectKindFKEdit.ShowModal= mrOk then
      begin
        //TempENServicesObjectKindFK.save(ENServicesObjectKindFKObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServicesObjectKindFKEdit.Free;
    frmENServicesObjectKindFKEdit:=nil;
  end;

  if sgENServicesObjectKindFK.RowCount > selectedRow then
    sgENServicesObjectKindFK.Row := selectedRow
  else
    sgENServicesObjectKindFK.Row := sgENServicesObjectKindFK.RowCount - 1;
  
end;


procedure TfrmENServicesObjectKindFKShow.actDeleteExecute(Sender: TObject);
Var TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesObjectKindFK := HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesObjectKindFK.Cells[0,sgENServicesObjectKindFK.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Вид услуг на сторону для ФК проводок( оказанные услуги ) ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesObjectKindFK.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesObjectKindFKShow.actInsertExecute(Sender: TObject);
// Var TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort; 
begin
  // TempENServicesObjectKindFK := HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServicesObjectKindFKObj:=ENServicesObjectKindFK.Create;
  SetNullIntProps(ENServicesObjectKindFKObj);
  SetNullXSProps(ENServicesObjectKindFKObj);



  try
    frmENServicesObjectKindFKEdit:=TfrmENServicesObjectKindFKEdit.Create(Application, dsInsert);
    try
      if frmENServicesObjectKindFKEdit.ShowModal = mrOk then
      begin
        if ENServicesObjectKindFKObj<>nil then
            //TempENServicesObjectKindFK.add(ENServicesObjectKindFKObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServicesObjectKindFKEdit.Free;
      frmENServicesObjectKindFKEdit:=nil;
    end;
  finally
    ENServicesObjectKindFKObj.Free;
  end;
end;


procedure TfrmENServicesObjectKindFKShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENServicesObjectKindFKShow.actFilterExecute(Sender: TObject);
begin
{frmENServicesObjectKindFKFilterEdit:=TfrmENServicesObjectKindFKFilterEdit.Create(Application, dsInsert);
  try
    ENServicesObjectKindFKFilterObj := ENServicesObjectKindFKFilter.Create;
    SetNullIntProps(ENServicesObjectKindFKFilterObj);
    SetNullXSProps(ENServicesObjectKindFKFilterObj);

    if frmENServicesObjectKindFKFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENServicesObjectKindFKFilter.Create;
      FilterObject := ENServicesObjectKindFKFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesObjectKindFKFilterEdit.Free;
    frmENServicesObjectKindFKFilterEdit:=nil;
  end;}
end;


procedure TfrmENServicesObjectKindFKShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.