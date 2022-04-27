
unit ShowENAct2DFDocDecree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENAct2DFDocDecreeController, AdvObj ;


type
    TfrmENAct2DFDocDecreeShow = class(TChildForm)  
    HTTPRIOENAct2DFDocDecree: THTTPRIO;
    ImageList1: TImageList;
    sgENAct2DFDocDecree: TAdvStringGrid;
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
    procedure sgENAct2DFDocDecreeTopLeftChanged(Sender: TObject);
    procedure sgENAct2DFDocDecreeDblClick(Sender: TObject);
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
 frmENAct2DFDocDecreeShow : TfrmENAct2DFDocDecreeShow;
 // ENAct2DFDocDecreeObj: ENAct2DFDocDecree;
 // ENAct2DFDocDecreeFilterObj: ENAct2DFDocDecreeFilter;
  
  
implementation

uses Main, EditENAct2DFDocDecree, EditENAct2DFDocDecreeFilter;


{$R *.dfm}

var
  //frmENAct2DFDocDecreeShow : TfrmENAct2DFDocDecreeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAct2DFDocDecreeHeaders: array [1..8] of String =
        ( 'Код'
          ,'Примітка'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
          ,'Код DFDocDecreeCode'
          ,'Код dfDocCode'
        );
   

procedure TfrmENAct2DFDocDecreeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENAct2DFDocDecreeShow:=nil;
  inherited;
end;


procedure TfrmENAct2DFDocDecreeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENAct2DFDocDecreeShow.FormShow(Sender: TObject);
var
  TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
  i: Integer;
  ENAct2DFDocDecreeList: ENAct2DFDocDecreeShortList;
begin
  SetGridHeaders(ENAct2DFDocDecreeHeaders, sgENAct2DFDocDecree.ColumnHeaders);
  ColCount:=100;
  TempENAct2DFDocDecree :=  HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2DFDocDecreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2DFDocDecreeList := TempENAct2DFDocDecree.getScrollableFilteredList(ENAct2DFDocDecreeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENAct2DFDocDecreeList.list);

  if LastCount > -1 then
     sgENAct2DFDocDecree.RowCount:=LastCount+2
  else
     sgENAct2DFDocDecree.RowCount:=2;

   with sgENAct2DFDocDecree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2DFDocDecreeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAct2DFDocDecreeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAct2DFDocDecreeList.list[i].commentGen;
        Cells[2,i+1] := ENAct2DFDocDecreeList.list[i].userAdd;
        if ENAct2DFDocDecreeList.list[i].dateAdd = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENAct2DFDocDecreeList.list[i].dateAdd);
        Cells[4,i+1] := ENAct2DFDocDecreeList.list[i].userGen;
        if ENAct2DFDocDecreeList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENAct2DFDocDecreeList.list[i].dateEdit);
        if ENAct2DFDocDecreeList.list[i].DFDocDecreeCode = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENAct2DFDocDecreeList.list[i].DFDocDecreeCode);
        if ENAct2DFDocDecreeList.list[i].dfDocCode = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENAct2DFDocDecreeList.list[i].dfDocCode);
        LastRow:=i+1;
        sgENAct2DFDocDecree.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENAct2DFDocDecree.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENAct2DFDocDecree.RowCount > selectedRow then
      sgENAct2DFDocDecree.Row := selectedRow
    else
      sgENAct2DFDocDecree.Row := sgENAct2DFDocDecree.RowCount - 1;
    end
    else
      sgENAct2DFDocDecree.Row:=1;   
end;


procedure TfrmENAct2DFDocDecreeShow.sgENAct2DFDocDecreeTopLeftChanged(Sender: TObject);
var
  TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
  i,CurrentRow: Integer;
  ENAct2DFDocDecreeList: ENAct2DFDocDecreeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAct2DFDocDecree.TopRow + sgENAct2DFDocDecree.VisibleRowCount) = ColCount
  then
    begin
      TempENAct2DFDocDecree :=  HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;
      CurrentRow:=sgENAct2DFDocDecree.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAct2DFDocDecreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAct2DFDocDecreeList := TempENAct2DFDocDecree.getScrollableFilteredList(ENAct2DFDocDecreeFilter(FilterObject),ColCount-1, 100);


  sgENAct2DFDocDecree.RowCount:=sgENAct2DFDocDecree.RowCount+100;
  LastCount:=High(ENAct2DFDocDecreeList.list);
  with sgENAct2DFDocDecree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAct2DFDocDecreeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAct2DFDocDecreeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAct2DFDocDecreeList.list[i].commentGen;
        Cells[2,i+CurrentRow] := ENAct2DFDocDecreeList.list[i].userAdd;
        if ENAct2DFDocDecreeList.list[i].dateAdd = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENAct2DFDocDecreeList.list[i].dateAdd);
        Cells[4,i+CurrentRow] := ENAct2DFDocDecreeList.list[i].userGen;
        if ENAct2DFDocDecreeList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENAct2DFDocDecreeList.list[i].dateEdit);
        if ENAct2DFDocDecreeList.list[i].DFDocDecreeCode = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENAct2DFDocDecreeList.list[i].DFDocDecreeCode);
        if ENAct2DFDocDecreeList.list[i].dfDocCode = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENAct2DFDocDecreeList.list[i].dfDocCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAct2DFDocDecree.Row:=CurrentRow-5;
   sgENAct2DFDocDecree.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAct2DFDocDecreeShow.sgENAct2DFDocDecreeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAct2DFDocDecree,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENAct2DFDocDecreeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENAct2DFDocDecree.RowCount-1 do
   for j:=0 to sgENAct2DFDocDecree.ColCount-1 do
     sgENAct2DFDocDecree.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENAct2DFDocDecreeShow.actViewExecute(Sender: TObject);
var 
  TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
begin
  TempENAct2DFDocDecree := HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;
  try
    ENAct2DFDocDecreeObj := TempENAct2DFDocDecree.getObject(StrToInt(sgENAct2DFDocDecree.Cells[0,sgENAct2DFDocDecree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENAct2DFDocDecree.Row;
  frmENAct2DFDocDecreeEdit:=TfrmENAct2DFDocDecreeEdit.Create(Application, dsView);
  
  try
    frmENAct2DFDocDecreeEdit.ShowModal;
  finally
    frmENAct2DFDocDecreeEdit.Free;
    frmENAct2DFDocDecreeEdit:=nil;
  end;

  if sgENAct2DFDocDecree.RowCount > selectedRow then
    sgENAct2DFDocDecree.Row := selectedRow
  else
    sgENAct2DFDocDecree.Row := sgENAct2DFDocDecree.RowCount - 1;
  
end;


procedure TfrmENAct2DFDocDecreeShow.actEditExecute(Sender: TObject);
var 
  TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
begin
  TempENAct2DFDocDecree := HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;
  try
    ENAct2DFDocDecreeObj := TempENAct2DFDocDecree.getObject(StrToInt(sgENAct2DFDocDecree.Cells[0,sgENAct2DFDocDecree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENAct2DFDocDecree.Row;
  frmENAct2DFDocDecreeEdit:=TfrmENAct2DFDocDecreeEdit.Create(Application, dsEdit);
  
  try
    if frmENAct2DFDocDecreeEdit.ShowModal= mrOk then
      begin
        //TempENAct2DFDocDecree.save(ENAct2DFDocDecreeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAct2DFDocDecreeEdit.Free;
    frmENAct2DFDocDecreeEdit:=nil;
  end;

  if sgENAct2DFDocDecree.RowCount > selectedRow then
    sgENAct2DFDocDecree.Row := selectedRow
  else
    sgENAct2DFDocDecree.Row := sgENAct2DFDocDecree.RowCount - 1;
  
end;


procedure TfrmENAct2DFDocDecreeShow.actDeleteExecute(Sender: TObject);
Var TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAct2DFDocDecree := HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAct2DFDocDecree.Cells[0,sgENAct2DFDocDecree.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок актів виконаних робіт з розпорядженнями docFlow) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAct2DFDocDecree.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAct2DFDocDecreeShow.actInsertExecute(Sender: TObject);
// Var TempENAct2DFDocDecree: ENAct2DFDocDecreeControllerSoapPort; 
begin
  // TempENAct2DFDocDecree := HTTPRIOENAct2DFDocDecree as ENAct2DFDocDecreeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAct2DFDocDecreeObj:=ENAct2DFDocDecree.Create;
  SetNullIntProps(ENAct2DFDocDecreeObj);
  SetNullXSProps(ENAct2DFDocDecreeObj);

   //ENAct2DFDocDecreeObj.dateAdd:= TXSDateTime.Create;
   
   //ENAct2DFDocDecreeObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENAct2DFDocDecreeEdit:=TfrmENAct2DFDocDecreeEdit.Create(Application, dsInsert);
    try
      if frmENAct2DFDocDecreeEdit.ShowModal = mrOk then
      begin
        if ENAct2DFDocDecreeObj<>nil then
            //TempENAct2DFDocDecree.add(ENAct2DFDocDecreeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAct2DFDocDecreeEdit.Free;
      frmENAct2DFDocDecreeEdit:=nil;
    end;
  finally
    ENAct2DFDocDecreeObj.Free;
  end;
end;


procedure TfrmENAct2DFDocDecreeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENAct2DFDocDecreeShow.actFilterExecute(Sender: TObject);
begin
{frmENAct2DFDocDecreeFilterEdit:=TfrmENAct2DFDocDecreeFilterEdit.Create(Application, dsInsert);
  try
    ENAct2DFDocDecreeFilterObj := ENAct2DFDocDecreeFilter.Create;
    SetNullIntProps(ENAct2DFDocDecreeFilterObj);
    SetNullXSProps(ENAct2DFDocDecreeFilterObj);

    if frmENAct2DFDocDecreeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENAct2DFDocDecreeFilter.Create;
      FilterObject := ENAct2DFDocDecreeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAct2DFDocDecreeFilterEdit.Free;
    frmENAct2DFDocDecreeFilterEdit:=nil;
  end;}
end;


procedure TfrmENAct2DFDocDecreeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.