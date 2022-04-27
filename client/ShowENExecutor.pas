
unit ShowENExecutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENExecutorController, AdvObj ;


type
    TfrmENExecutorShow = class(TChildForm)  
    HTTPRIOENExecutor: THTTPRIO;
    ImageList1: TImageList;
    sgENExecutor: TAdvStringGrid;
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
    procedure sgENExecutorTopLeftChanged(Sender: TObject);
    procedure sgENExecutorDblClick(Sender: TObject);
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
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


var
  frmENExecutorShow: TfrmENExecutorShow;
  
  
implementation

uses Main, EditENExecutor, EditENExecutorFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENExecutorHeaders: array [1..6] of String =
        ( 'Код'
          ,'ПІБ виконавця'
          ,'Телефон виконавця'
          ,'E-mail виконавця'
          ,'Коментар'
          ,'Тип листа'
        );
   

procedure TfrmENExecutorShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENExecutorShow:=nil;
  inherited;
end;


procedure TfrmENExecutorShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENExecutorShow.FormShow(Sender: TObject);
var
  TempENExecutor: ENExecutorControllerSoapPort;
  i: Integer;
  ENExecutorList: ENExecutorShortList;
begin
  SetGridHeaders(ENExecutorHeaders, sgENExecutor.ColumnHeaders);
  ColCount:=100;
  TempENExecutor :=  HTTPRIOENExecutor as ENExecutorControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENExecutorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENExecutorList := TempENExecutor.getScrollableFilteredList(ENExecutorFilter(FilterObject),0,ColCount);
  LastCount:=High(ENExecutorList.list);

  if LastCount > -1 then
     sgENExecutor.RowCount:=LastCount+2
  else
     sgENExecutor.RowCount:=2;

   with sgENExecutor do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENExecutorList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENExecutorList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENExecutorList.list[i].executorFio;
        Cells[2,i+1] := ENExecutorList.list[i].executorPhone;
        Cells[3,i+1] := ENExecutorList.list[i].executorEmail;
        Cells[4,i+1] := ENExecutorList.list[i].commentGen;
        Cells[5,i+1] := ENExecutorList.list[i].sheetTypeRefName;
        LastRow:=i+1;
        sgENExecutor.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENExecutor.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENExecutor.RowCount > selectedRow then
      sgENExecutor.Row := selectedRow
    else
      sgENExecutor.Row := sgENExecutor.RowCount - 1;
    end
    else
      sgENExecutor.Row:=1;   
end;


procedure TfrmENExecutorShow.sgENExecutorTopLeftChanged(Sender: TObject);
var
  TempENExecutor: ENExecutorControllerSoapPort;
  i,CurrentRow: Integer;
  ENExecutorList: ENExecutorShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENExecutor.TopRow + sgENExecutor.VisibleRowCount) = ColCount
  then
    begin
      TempENExecutor :=  HTTPRIOENExecutor as ENExecutorControllerSoapPort;
      CurrentRow:=sgENExecutor.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENExecutorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENExecutorList := TempENExecutor.getScrollableFilteredList(ENExecutorFilter(FilterObject),ColCount-1, 100);


  sgENExecutor.RowCount:=sgENExecutor.RowCount+100;
  LastCount:=High(ENExecutorList.list);
  with sgENExecutor do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENExecutorList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENExecutorList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENExecutorList.list[i].executorFio;
        Cells[2,i+CurrentRow] := ENExecutorList.list[i].executorPhone;
        Cells[3,i+CurrentRow] := ENExecutorList.list[i].executorEmail;
        Cells[4,i+CurrentRow] := ENExecutorList.list[i].commentGen;
        Cells[5,i+CurrentRow] := ENExecutorList.list[i].sheetTypeRefName;
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENExecutor.Row:=CurrentRow-5;
   sgENExecutor.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENExecutorShow.sgENExecutorDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENExecutor,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENExecutorShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENExecutor.RowCount-1 do
   for j:=0 to sgENExecutor.ColCount-1 do
     sgENExecutor.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENExecutorShow.actViewExecute(Sender: TObject);
var 
  TempENExecutor: ENExecutorControllerSoapPort;
begin
  TempENExecutor := HTTPRIOENExecutor as ENExecutorControllerSoapPort;
  try
    ENExecutorObj := TempENExecutor.getObject(StrToInt(sgENExecutor.Cells[0,sgENExecutor.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENExecutor.Row;
  frmENExecutorEdit:=TfrmENExecutorEdit.Create(Application, dsView);
  
  try
    frmENExecutorEdit.ShowModal;
  finally
    frmENExecutorEdit.Free;
    frmENExecutorEdit:=nil;
  end;

  if sgENExecutor.RowCount > selectedRow then
    sgENExecutor.Row := selectedRow
  else
    sgENExecutor.Row := sgENExecutor.RowCount - 1;
  
end;


procedure TfrmENExecutorShow.actEditExecute(Sender: TObject);
var 
  TempENExecutor: ENExecutorControllerSoapPort;
begin
  TempENExecutor := HTTPRIOENExecutor as ENExecutorControllerSoapPort;
  try
    ENExecutorObj := TempENExecutor.getObject(StrToInt(sgENExecutor.Cells[0,sgENExecutor.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENExecutor.Row;
  frmENExecutorEdit:=TfrmENExecutorEdit.Create(Application, dsEdit);
  
  try
    if frmENExecutorEdit.ShowModal= mrOk then
      begin
        //TempENExecutor.save(ENExecutorObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENExecutorEdit.Free;
    frmENExecutorEdit:=nil;
  end;

  if sgENExecutor.RowCount > selectedRow then
    sgENExecutor.Row := selectedRow
  else
    sgENExecutor.Row := sgENExecutor.RowCount - 1;
  
end;


procedure TfrmENExecutorShow.actDeleteExecute(Sender: TObject);
Var TempENExecutor: ENExecutorControllerSoapPort;
  ObjCode: Integer;
begin
 TempENExecutor := HTTPRIOENExecutor as ENExecutorControllerSoapPort;
   try
     ObjCode := StrToInt(sgENExecutor.Cells[0,sgENExecutor.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Виконавці для листів)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENExecutor.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENExecutorShow.actInsertExecute(Sender: TObject);
// Var TempENExecutor: ENExecutorControllerSoapPort; 
begin
  // TempENExecutor := HTTPRIOENExecutor as ENExecutorControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENExecutorObj:=ENExecutor.Create;
  SetNullIntProps(ENExecutorObj);
  SetNullXSProps(ENExecutorObj);



  try
    frmENExecutorEdit:=TfrmENExecutorEdit.Create(Application, dsInsert);
    try
      if frmENExecutorEdit.ShowModal = mrOk then
      begin
        if ENExecutorObj<>nil then
            //TempENExecutor.add(ENExecutorObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENExecutorEdit.Free;
      frmENExecutorEdit:=nil;
    end;
  finally
    ENExecutorObj.Free;
  end;
end;


procedure TfrmENExecutorShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENExecutorShow.actFilterExecute(Sender: TObject);
begin
{frmENExecutorFilterEdit:=TfrmENExecutorFilterEdit.Create(Application, dsInsert);
  try
    ENExecutorFilterObj := ENExecutorFilter.Create;
    SetNullIntProps(ENExecutorFilterObj);
    SetNullXSProps(ENExecutorFilterObj);

    if frmENExecutorFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENExecutorFilter.Create;
      FilterObject := ENExecutorFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENExecutorFilterEdit.Free;
    frmENExecutorFilterEdit:=nil;
  end;}
end;


procedure TfrmENExecutorShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.