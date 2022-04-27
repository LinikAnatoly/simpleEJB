
unit ShowENPost10OKSN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPost10OKSNController, AdvObj ;


type
    TfrmENPost10OKSNShow = class(TChildForm)  
    HTTPRIOENPost10OKSN: THTTPRIO;
    ImageList1: TImageList;
    sgENPost10OKSN: TAdvStringGrid;
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
    procedure sgENPost10OKSNTopLeftChanged(Sender: TObject);
    procedure sgENPost10OKSNDblClick(Sender: TObject);
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
 // ENPost10OKSNObj: ENPost10OKSN;
 // ENPost10OKSNFilterObj: ENPost10OKSNFilter;
 frmENPost10OKSNShow : TfrmENPost10OKSNShow;
  
  
implementation

uses Main, EditENPost10OKSN, EditENPost10OKSNFilter;


{$R *.dfm}

var
  //frmENPost10OKSNShow : TfrmENPost10OKSNShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPost10OKSNHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер опори'
          ,'Максимальна кількість проводів підвісу'
          ,'Найменування відпайки'
          ,'Наименование линии'
        );
   

procedure TfrmENPost10OKSNShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPost10OKSNShow:=nil;
  inherited;
end;


procedure TfrmENPost10OKSNShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENPost10OKSNShow.FormShow(Sender: TObject);
var
  TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
  i: Integer;
  ENPost10OKSNList: ENPost10OKSNShortList;
begin
  SetGridHeaders(ENPost10OKSNHeaders, sgENPost10OKSN.ColumnHeaders);
  ColCount:=100;
  TempENPost10OKSN :=  HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPost10OKSNFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPost10OKSNList := TempENPost10OKSN.getScrollableFilteredList(ENPost10OKSNFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPost10OKSNList.list);

  if LastCount > -1 then
     sgENPost10OKSN.RowCount:=LastCount+2
  else
     sgENPost10OKSN.RowCount:=2;

   with sgENPost10OKSN do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPost10OKSNList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPost10OKSNList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1,i+1,false, false);
        Cells[1,i+1] := ENPost10OKSNList.list[i].postNumber;
        if ENPost10OKSNList.list[i].numberOfCables = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPost10OKSNList.list[i].numberOfCables);

        Cells[3,i+1] := ENPost10OKSNList.list[i].branchLineName;
        Cells[4,i+1] := ENPost10OKSNList.list[i].line10RefBuhName;
        LastRow:=i+1;
        sgENPost10OKSN.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPost10OKSN.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPost10OKSN.RowCount > selectedRow then
      sgENPost10OKSN.Row := selectedRow
    else
      sgENPost10OKSN.Row := sgENPost10OKSN.RowCount - 1;
    end
    else
      sgENPost10OKSN.Row:=1;   
end;


procedure TfrmENPost10OKSNShow.sgENPost10OKSNTopLeftChanged(Sender: TObject);
var
  TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
  i,CurrentRow: Integer;
  ENPost10OKSNList: ENPost10OKSNShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPost10OKSN.TopRow + sgENPost10OKSN.VisibleRowCount) = ColCount
  then
    begin
      TempENPost10OKSN :=  HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;
      CurrentRow:=sgENPost10OKSN.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPost10OKSNFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPost10OKSNList := TempENPost10OKSN.getScrollableFilteredList(ENPost10OKSNFilter(FilterObject),ColCount-1, 100);


  sgENPost10OKSN.RowCount:=sgENPost10OKSN.RowCount+100;
  LastCount:=High(ENPost10OKSNList.list);
  with sgENPost10OKSN do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPost10OKSNList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPost10OKSNList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        AddCheckBox(1,i+CurrentRow,false, false);
        Cells[1,i+CurrentRow] := ENPost10OKSNList.list[i].postNumber;
        if ENPost10OKSNList.list[i].numberOfCables = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENPost10OKSNList.list[i].numberOfCables);

        Cells[3,i+CurrentRow] := ENPost10OKSNList.list[i].branchLineName;
        Cells[4,i+CurrentRow] := ENPost10OKSNList.list[i].line10RefBuhName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPost10OKSN.Row:=CurrentRow-5;
   sgENPost10OKSN.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPost10OKSNShow.sgENPost10OKSNDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPost10OKSN,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPost10OKSNShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENPost10OKSN.RowCount-1 do
   for j:=0 to sgENPost10OKSN.ColCount-1 do
     sgENPost10OKSN.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPost10OKSNShow.actViewExecute(Sender: TObject);
var 
  TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
begin
  TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;
  try
    ENPost10OKSNObj := TempENPost10OKSN.getObject(StrToInt(sgENPost10OKSN.Cells[0,sgENPost10OKSN.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPost10OKSN.Row;
  frmENPost10OKSNEdit:=TfrmENPost10OKSNEdit.Create(Application, dsView);
  
  try
    frmENPost10OKSNEdit.ShowModal;
  finally
    frmENPost10OKSNEdit.Free;
    frmENPost10OKSNEdit:=nil;
  end;

  if sgENPost10OKSN.RowCount > selectedRow then
    sgENPost10OKSN.Row := selectedRow
  else
    sgENPost10OKSN.Row := sgENPost10OKSN.RowCount - 1;
  
end;


procedure TfrmENPost10OKSNShow.btnMultiselectClick(Sender: TObject);
Var
state_, isSel : Boolean;
i : Integer;
begin
  if FormMode = fmNormal then
  begin

    state_ := false;
    isSel := false;

  for i:=1 to sgENPost10OKSN.RowCount - 1 do
  begin
     sgENPost10OKSN.GetCheckBoxState(1,i,state_);
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

procedure TfrmENPost10OKSNShow.actEditExecute(Sender: TObject);
var 
  TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
begin
  TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;
  try
    ENPost10OKSNObj := TempENPost10OKSN.getObject(StrToInt(sgENPost10OKSN.Cells[0,sgENPost10OKSN.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPost10OKSN.Row;
  frmENPost10OKSNEdit:=TfrmENPost10OKSNEdit.Create(Application, dsEdit);
  
  try
    if frmENPost10OKSNEdit.ShowModal= mrOk then
      begin
        //TempENPost10OKSN.save(ENPost10OKSNObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPost10OKSNEdit.Free;
    frmENPost10OKSNEdit:=nil;
  end;

  if sgENPost10OKSN.RowCount > selectedRow then
    sgENPost10OKSN.Row := selectedRow
  else
    sgENPost10OKSN.Row := sgENPost10OKSN.RowCount - 1;
  
end;


procedure TfrmENPost10OKSNShow.actDeleteExecute(Sender: TObject);
Var TempENPost10OKSN: ENPost10OKSNControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPost10OKSN.Cells[0,sgENPost10OKSN.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Опори для сумісного підвісу ліній 6-10) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPost10OKSN.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPost10OKSNShow.actInsertExecute(Sender: TObject);
// Var TempENPost10OKSN: ENPost10OKSNControllerSoapPort; 
begin
  // TempENPost10OKSN := HTTPRIOENPost10OKSN as ENPost10OKSNControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPost10OKSNObj:=ENPost10OKSN.Create;
  SetNullIntProps(ENPost10OKSNObj);
  SetNullXSProps(ENPost10OKSNObj);



  try
    frmENPost10OKSNEdit:=TfrmENPost10OKSNEdit.Create(Application, dsInsert);
    try
      if frmENPost10OKSNEdit.ShowModal = mrOk then
      begin
        if ENPost10OKSNObj<>nil then
            //TempENPost10OKSN.add(ENPost10OKSNObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPost10OKSNEdit.Free;
      frmENPost10OKSNEdit:=nil;
    end;
  finally
    ENPost10OKSNObj.Free;
  end;
end;


procedure TfrmENPost10OKSNShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPost10OKSNShow.actFilterExecute(Sender: TObject);
begin
frmENPost10OKSNFilterEdit:=TfrmENPost10OKSNFilterEdit.Create(Application, dsInsert);
  try
    ENPost10OKSNFilterObj := ENPost10OKSNFilter.Create;
    SetNullIntProps(ENPost10OKSNFilterObj);
    SetNullXSProps(ENPost10OKSNFilterObj);

    if frmENPost10OKSNFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENPost10OKSNFilter.Create;
      FilterObject := ENPost10OKSNFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPost10OKSNFilterEdit.Free;
    frmENPost10OKSNFilterEdit:=nil;
  end;
end;


procedure TfrmENPost10OKSNShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.