
unit ShowENPost04OKSN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPost04OKSNController, AdvObj ;


type
    TfrmENPost04OKSNShow = class(TChildForm)  
    HTTPRIOENPost04OKSN: THTTPRIO;
    ImageList1: TImageList;
    sgENPost04OKSN: TAdvStringGrid;
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
    btnMultiselect: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENPost04OKSNTopLeftChanged(Sender: TObject);
    procedure sgENPost04OKSNDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMultiselectClick(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 // ENPost04OKSNObj: ENPost04OKSN;
 // ENPost04OKSNFilterObj: ENPost04OKSNFilter;
 frmENPost04OKSNShow : TfrmENPost04OKSNShow;
  
  
implementation

uses Main, EditENPost04OKSN, EditENPost04OKSNFilter;


{$R *.dfm}

var
  //frmENPost04OKSNShow : TfrmENPost04OKSNShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPost04OKSNHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер опори'
          ,'Максимальна кількість проводів підвісу'
          ,'Найменування відпайки'
          ,'Наименование линии'
        );


procedure TfrmENPost04OKSNShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPost04OKSNShow:=nil;
  inherited;
end;


procedure TfrmENPost04OKSNShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENPost04OKSNShow.FormShow(Sender: TObject);
var
  TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
  i: Integer;
  ENPost04OKSNList: ENPost04OKSNShortList;
begin
  SetGridHeaders(ENPost04OKSNHeaders, sgENPost04OKSN.ColumnHeaders);
  ColCount:=100;
  TempENPost04OKSN :=  HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPost04OKSNFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPost04OKSNList := TempENPost04OKSN.getScrollableFilteredList(ENPost04OKSNFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPost04OKSNList.list);

  if LastCount > -1 then
     sgENPost04OKSN.RowCount:=LastCount+2
  else
     sgENPost04OKSN.RowCount:=2;

   with sgENPost04OKSN do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPost04OKSNList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPost04OKSNList.list[i].code)
        else
        Cells[0,i+1] := '';
        AddCheckBox(1,i+1,false, false);
        Cells[1,i+1] := ENPost04OKSNList.list[i].postNumber;
        if ENPost04OKSNList.list[i].numberOfCables = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPost04OKSNList.list[i].numberOfCables);

        Cells[3,i+1] := ENPost04OKSNList.list[i].branchLineName;
        Cells[4,i+1] := ENPost04OKSNList.list[i].line04RefBuhName;

        LastRow:=i+1;
        sgENPost04OKSN.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPost04OKSN.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPost04OKSN.RowCount > selectedRow then
      sgENPost04OKSN.Row := selectedRow
    else
      sgENPost04OKSN.Row := sgENPost04OKSN.RowCount - 1;
    end
    else
      sgENPost04OKSN.Row:=1;
end;


procedure TfrmENPost04OKSNShow.sgENPost04OKSNTopLeftChanged(Sender: TObject);
var
  TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
  i,CurrentRow: Integer;
  ENPost04OKSNList: ENPost04OKSNShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPost04OKSN.TopRow + sgENPost04OKSN.VisibleRowCount) = ColCount
  then
    begin
      TempENPost04OKSN :=  HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;
      CurrentRow:=sgENPost04OKSN.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPost04OKSNFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPost04OKSNList := TempENPost04OKSN.getScrollableFilteredList(ENPost04OKSNFilter(FilterObject),ColCount-1, 100);


  sgENPost04OKSN.RowCount:=sgENPost04OKSN.RowCount+100;
  LastCount:=High(ENPost04OKSNList.list);
  with sgENPost04OKSN do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPost04OKSNList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPost04OKSNList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        AddCheckBox(1,i+CurrentRow,false, false);
        Cells[1,i+CurrentRow] := ENPost04OKSNList.list[i].postNumber;
        if ENPost04OKSNList.list[i].numberOfCables = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENPost04OKSNList.list[i].numberOfCables);
        Cells[3,i+CurrentRow] := ENPost04OKSNList.list[i].branchLineName;
        Cells[4,i+CurrentRow] := ENPost04OKSNList.list[i].line04RefBuhName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPost04OKSN.Row:=CurrentRow-5;
   sgENPost04OKSN.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPost04OKSNShow.sgENPost04OKSNDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPost04OKSN,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPost04OKSNShow.UpdateGrid(Sender: TObject);
var
  i, j: Integer;
begin
 for i:=1 to sgENPost04OKSN.RowCount-1 do
   for j:=0 to sgENPost04OKSN.ColCount-1 do
     sgENPost04OKSN.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPost04OKSNShow.actViewExecute(Sender: TObject);
var 
  TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
begin
  TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;
  try
    ENPost04OKSNObj := TempENPost04OKSN.getObject(StrToInt(sgENPost04OKSN.Cells[0,sgENPost04OKSN.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPost04OKSN.Row;
  frmENPost04OKSNEdit:=TfrmENPost04OKSNEdit.Create(Application, dsView);
  
  try
    frmENPost04OKSNEdit.ShowModal;
  finally
    frmENPost04OKSNEdit.Free;
    frmENPost04OKSNEdit:=nil;
  end;

  if sgENPost04OKSN.RowCount > selectedRow then
    sgENPost04OKSN.Row := selectedRow
  else
    sgENPost04OKSN.Row := sgENPost04OKSN.RowCount - 1;
  
end;


procedure TfrmENPost04OKSNShow.btnMultiselectClick(Sender: TObject);
Var
state_, isSel : Boolean;
i : Integer;
begin
  if FormMode = fmNormal then
  begin

    state_ := false;
    isSel := false;

  for i:=1 to sgENPost04OKSN.RowCount - 1 do
  begin
     sgENPost04OKSN.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
       isSel := true;
     end;
  end;

  if not isSel then
  begin
     Application.MessageBox(PChar('Виберіть хоча б одну опору!!!'), PChar('Увага !'),MB_ICONWARNING);
     ModalResult:=mrNone;
     Exit;
  end;

    ModalResult:=mrOk;
  end;
end;

procedure TfrmENPost04OKSNShow.actEditExecute(Sender: TObject);
var
  TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
begin
  TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;
  try
    ENPost04OKSNObj := TempENPost04OKSN.getObject(StrToInt(sgENPost04OKSN.Cells[0,sgENPost04OKSN.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPost04OKSN.Row;
  frmENPost04OKSNEdit:=TfrmENPost04OKSNEdit.Create(Application, dsEdit);
  
  try
    if frmENPost04OKSNEdit.ShowModal= mrOk then
      begin
        //TempENPost04OKSN.save(ENPost04OKSNObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPost04OKSNEdit.Free;
    frmENPost04OKSNEdit:=nil;
  end;

  if sgENPost04OKSN.RowCount > selectedRow then
    sgENPost04OKSN.Row := selectedRow
  else
    sgENPost04OKSN.Row := sgENPost04OKSN.RowCount - 1;
  
end;


procedure TfrmENPost04OKSNShow.actDeleteExecute(Sender: TObject);
Var TempENPost04OKSN: ENPost04OKSNControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPost04OKSN.Cells[0,sgENPost04OKSN.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори для сумісного підвісу ліній 0,4) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPost04OKSN.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPost04OKSNShow.actInsertExecute(Sender: TObject);
// Var TempENPost04OKSN: ENPost04OKSNControllerSoapPort; 
begin
  // TempENPost04OKSN := HTTPRIOENPost04OKSN as ENPost04OKSNControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPost04OKSNObj:=ENPost04OKSN.Create;
  SetNullIntProps(ENPost04OKSNObj);
  SetNullXSProps(ENPost04OKSNObj);



  try
    frmENPost04OKSNEdit:=TfrmENPost04OKSNEdit.Create(Application, dsInsert);
    try
      if frmENPost04OKSNEdit.ShowModal = mrOk then
      begin
        if ENPost04OKSNObj<>nil then
            //TempENPost04OKSN.add(ENPost04OKSNObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPost04OKSNEdit.Free;
      frmENPost04OKSNEdit:=nil;
    end;
  finally
    ENPost04OKSNObj.Free;
  end;
end;


procedure TfrmENPost04OKSNShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPost04OKSNShow.actFilterExecute(Sender: TObject);
begin
frmENPost04OKSNFilterEdit:=TfrmENPost04OKSNFilterEdit.Create(Application, dsInsert);
  try
    ENPost04OKSNFilterObj := ENPost04OKSNFilter.Create;
    SetNullIntProps(ENPost04OKSNFilterObj);
    SetNullXSProps(ENPost04OKSNFilterObj);

    if frmENPost04OKSNFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENPost04OKSNFilter.Create;
      FilterObject := ENPost04OKSNFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPost04OKSNFilterEdit.Free;
    frmENPost04OKSNFilterEdit:=nil;
  end;
end;


procedure TfrmENPost04OKSNShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.