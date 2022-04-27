
unit ShowENSO2DistrAgree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSO2DistrAgreeController, AdvObj ;


type
    TfrmENSO2DistrAgreeShow = class(TChildForm)  
    HTTPRIOENSO2DistrAgree: THTTPRIO;
    ImageList1: TImageList;
    sgENSO2DistrAgree: TAdvStringGrid;
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
    procedure sgENSO2DistrAgreeTopLeftChanged(Sender: TObject);
    procedure sgENSO2DistrAgreeDblClick(Sender: TObject);
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

//var
 // ENSO2DistrAgreeObj: ENSO2DistrAgree;
 // ENSO2DistrAgreeFilterObj: ENSO2DistrAgreeFilter;
  
  
implementation

uses Main, EditENSO2DistrAgree, EditENSO2DistrAgreeFilter;


{$R *.dfm}

var
  frmENSO2DistrAgreeShow : TfrmENSO2DistrAgreeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSO2DistrAgreeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );
   

procedure TfrmENSO2DistrAgreeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSO2DistrAgreeShow:=nil;
  inherited;
end;


procedure TfrmENSO2DistrAgreeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSO2DistrAgreeShow.FormShow(Sender: TObject);
var
  TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
  i: Integer;
  ENSO2DistrAgreeList: ENSO2DistrAgreeShortList;
begin
  SetGridHeaders(ENSO2DistrAgreeHeaders, sgENSO2DistrAgree.ColumnHeaders);
  ColCount:=100;
  TempENSO2DistrAgree :=  HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2DistrAgreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2DistrAgreeList := TempENSO2DistrAgree.getScrollableFilteredList(ENSO2DistrAgreeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSO2DistrAgreeList.list);

  if LastCount > -1 then
     sgENSO2DistrAgree.RowCount:=LastCount+2
  else
     sgENSO2DistrAgree.RowCount:=2;

   with sgENSO2DistrAgree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2DistrAgreeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2DistrAgreeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSO2DistrAgreeList.list[i].userGen;
        if ENSO2DistrAgreeList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENSO2DistrAgreeList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSO2DistrAgree.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSO2DistrAgree.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSO2DistrAgree.RowCount > selectedRow then
      sgENSO2DistrAgree.Row := selectedRow
    else
      sgENSO2DistrAgree.Row := sgENSO2DistrAgree.RowCount - 1;
    end
    else
      sgENSO2DistrAgree.Row:=1;   
end;


procedure TfrmENSO2DistrAgreeShow.sgENSO2DistrAgreeTopLeftChanged(Sender: TObject);
var
  TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSO2DistrAgreeList: ENSO2DistrAgreeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSO2DistrAgree.TopRow + sgENSO2DistrAgree.VisibleRowCount) = ColCount
  then
    begin
      TempENSO2DistrAgree :=  HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;
      CurrentRow:=sgENSO2DistrAgree.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSO2DistrAgreeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSO2DistrAgreeList := TempENSO2DistrAgree.getScrollableFilteredList(ENSO2DistrAgreeFilter(FilterObject),ColCount-1, 100);


  sgENSO2DistrAgree.RowCount:=sgENSO2DistrAgree.RowCount+100;
  LastCount:=High(ENSO2DistrAgreeList.list);
  with sgENSO2DistrAgree do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSO2DistrAgreeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSO2DistrAgreeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSO2DistrAgreeList.list[i].userGen;
        if ENSO2DistrAgreeList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENSO2DistrAgreeList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSO2DistrAgree.Row:=CurrentRow-5;
   sgENSO2DistrAgree.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSO2DistrAgreeShow.sgENSO2DistrAgreeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSO2DistrAgree,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSO2DistrAgreeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSO2DistrAgree.RowCount-1 do
   for j:=0 to sgENSO2DistrAgree.ColCount-1 do
     sgENSO2DistrAgree.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSO2DistrAgreeShow.actViewExecute(Sender: TObject);
var 
  TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
begin
  TempENSO2DistrAgree := HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;
  try
    ENSO2DistrAgreeObj := TempENSO2DistrAgree.getObject(StrToInt(sgENSO2DistrAgree.Cells[0,sgENSO2DistrAgree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2DistrAgree.Row;
  frmENSO2DistrAgreeEdit:=TfrmENSO2DistrAgreeEdit.Create(Application, dsView);
  
  try
    frmENSO2DistrAgreeEdit.ShowModal;
  finally
    frmENSO2DistrAgreeEdit.Free;
    frmENSO2DistrAgreeEdit:=nil;
  end;

  if sgENSO2DistrAgree.RowCount > selectedRow then
    sgENSO2DistrAgree.Row := selectedRow
  else
    sgENSO2DistrAgree.Row := sgENSO2DistrAgree.RowCount - 1;
  
end;


procedure TfrmENSO2DistrAgreeShow.actEditExecute(Sender: TObject);
var 
  TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
begin
  TempENSO2DistrAgree := HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;
  try
    ENSO2DistrAgreeObj := TempENSO2DistrAgree.getObject(StrToInt(sgENSO2DistrAgree.Cells[0,sgENSO2DistrAgree.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSO2DistrAgree.Row;
  frmENSO2DistrAgreeEdit:=TfrmENSO2DistrAgreeEdit.Create(Application, dsEdit);
  
  try
    if frmENSO2DistrAgreeEdit.ShowModal= mrOk then
      begin
        //TempENSO2DistrAgree.save(ENSO2DistrAgreeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSO2DistrAgreeEdit.Free;
    frmENSO2DistrAgreeEdit:=nil;
  end;

  if sgENSO2DistrAgree.RowCount > selectedRow then
    sgENSO2DistrAgree.Row := selectedRow
  else
    sgENSO2DistrAgree.Row := sgENSO2DistrAgree.RowCount - 1;
  
end;


procedure TfrmENSO2DistrAgreeShow.actDeleteExecute(Sender: TObject);
Var TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSO2DistrAgree := HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSO2DistrAgree.Cells[0,sgENSO2DistrAgree.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка ServicesObject с договором распределения) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSO2DistrAgree.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSO2DistrAgreeShow.actInsertExecute(Sender: TObject);
// Var TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort; 
begin
  // TempENSO2DistrAgree := HTTPRIOENSO2DistrAgree as ENSO2DistrAgreeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSO2DistrAgreeObj:=ENSO2DistrAgree.Create;
  SetNullIntProps(ENSO2DistrAgreeObj);
  SetNullXSProps(ENSO2DistrAgreeObj);

   //ENSO2DistrAgreeObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSO2DistrAgreeEdit:=TfrmENSO2DistrAgreeEdit.Create(Application, dsInsert);
    try
      if frmENSO2DistrAgreeEdit.ShowModal = mrOk then
      begin
        if ENSO2DistrAgreeObj<>nil then
            //TempENSO2DistrAgree.add(ENSO2DistrAgreeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSO2DistrAgreeEdit.Free;
      frmENSO2DistrAgreeEdit:=nil;
    end;
  finally
    ENSO2DistrAgreeObj.Free;
  end;
end;


procedure TfrmENSO2DistrAgreeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSO2DistrAgreeShow.actFilterExecute(Sender: TObject);
begin
{frmENSO2DistrAgreeFilterEdit:=TfrmENSO2DistrAgreeFilterEdit.Create(Application, dsInsert);
  try
    ENSO2DistrAgreeFilterObj := ENSO2DistrAgreeFilter.Create;
    SetNullIntProps(ENSO2DistrAgreeFilterObj);
    SetNullXSProps(ENSO2DistrAgreeFilterObj);

    if frmENSO2DistrAgreeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSO2DistrAgreeFilter.Create;
      FilterObject := ENSO2DistrAgreeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSO2DistrAgreeFilterEdit.Free;
    frmENSO2DistrAgreeFilterEdit:=nil;
  end;}
end;


procedure TfrmENSO2DistrAgreeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.