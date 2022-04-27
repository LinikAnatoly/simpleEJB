
unit ShowFKTrans2AXTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  FKTrans2AXTransController, AdvObj ;


type
    TfrmFKTrans2AXTransShow = class(TChildForm)  
    HTTPRIOFKTrans2AXTrans: THTTPRIO;
    ImageList1: TImageList;
    sgFKTrans2AXTrans: TAdvStringGrid;
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
    procedure sgFKTrans2AXTransTopLeftChanged(Sender: TObject);
    procedure sgFKTrans2AXTransDblClick(Sender: TObject);
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
 // FKTrans2AXTransObj: FKTrans2AXTrans;
 // FKTrans2AXTransFilterObj: FKTrans2AXTransFilter;
  
  
implementation

uses Main, EditFKTrans2AXTrans, EditFKTrans2AXTransFilter;


{$R *.dfm}

var
  //frmFKTrans2AXTransShow : TfrmFKTrans2AXTransShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FKTrans2AXTransHeaders: array [1..4] of String =
        ( 'Код'
          ,'Місяць реестра проводок'
          ,'Рік реестра проводок'
          ,'Имя схемы, передающей проводки'
        );
   

procedure TfrmFKTrans2AXTransShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmFKTrans2AXTransShow:=nil;
  inherited;
end;


procedure TfrmFKTrans2AXTransShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmFKTrans2AXTransShow.FormShow(Sender: TObject);
var
  TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
  i: Integer;
  FKTrans2AXTransList: FKTrans2AXTransShortList;
begin
  SetGridHeaders(FKTrans2AXTransHeaders, sgFKTrans2AXTrans.ColumnHeaders);
  ColCount:=100;
  TempFKTrans2AXTrans :=  HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FKTrans2AXTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FKTrans2AXTransList := TempFKTrans2AXTrans.getScrollableFilteredList(FKTrans2AXTransFilter(FilterObject),0,ColCount);
  LastCount:=High(FKTrans2AXTransList.list);

  if LastCount > -1 then
     sgFKTrans2AXTrans.RowCount:=LastCount+2
  else
     sgFKTrans2AXTrans.RowCount:=2;

   with sgFKTrans2AXTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FKTrans2AXTransList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FKTrans2AXTransList.list[i].code)
        else
        Cells[0,i+1] := '';
        if FKTrans2AXTransList.list[i].monthGen = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(FKTrans2AXTransList.list[i].monthGen);
        if FKTrans2AXTransList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(FKTrans2AXTransList.list[i].yearGen);
        Cells[3,i+1] := FKTrans2AXTransList.list[i].taskOwner;
        LastRow:=i+1;
        sgFKTrans2AXTrans.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgFKTrans2AXTrans.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgFKTrans2AXTrans.RowCount > selectedRow then
      sgFKTrans2AXTrans.Row := selectedRow
    else
      sgFKTrans2AXTrans.Row := sgFKTrans2AXTrans.RowCount - 1;
    end
    else
      sgFKTrans2AXTrans.Row:=1;   
end;


procedure TfrmFKTrans2AXTransShow.sgFKTrans2AXTransTopLeftChanged(Sender: TObject);
var
  TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
  i,CurrentRow: Integer;
  FKTrans2AXTransList: FKTrans2AXTransShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFKTrans2AXTrans.TopRow + sgFKTrans2AXTrans.VisibleRowCount) = ColCount
  then
    begin
      TempFKTrans2AXTrans :=  HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;
      CurrentRow:=sgFKTrans2AXTrans.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FKTrans2AXTransFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FKTrans2AXTransList := TempFKTrans2AXTrans.getScrollableFilteredList(FKTrans2AXTransFilter(FilterObject),ColCount-1, 100);


  sgFKTrans2AXTrans.RowCount:=sgFKTrans2AXTrans.RowCount+100;
  LastCount:=High(FKTrans2AXTransList.list);
  with sgFKTrans2AXTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FKTrans2AXTransList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FKTrans2AXTransList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if FKTrans2AXTransList.list[i].monthGen = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(FKTrans2AXTransList.list[i].monthGen);
        if FKTrans2AXTransList.list[i].yearGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(FKTrans2AXTransList.list[i].yearGen);
        Cells[3,i+CurrentRow] := FKTrans2AXTransList.list[i].taskOwner;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFKTrans2AXTrans.Row:=CurrentRow-5;
   sgFKTrans2AXTrans.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFKTrans2AXTransShow.sgFKTrans2AXTransDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFKTrans2AXTrans,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmFKTrans2AXTransShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgFKTrans2AXTrans.RowCount-1 do
   for j:=0 to sgFKTrans2AXTrans.ColCount-1 do
     sgFKTrans2AXTrans.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmFKTrans2AXTransShow.actViewExecute(Sender: TObject);
var 
  TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
begin
  TempFKTrans2AXTrans := HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;
  try
    FKTrans2AXTransObj := TempFKTrans2AXTrans.getObject(StrToInt(sgFKTrans2AXTrans.Cells[0,sgFKTrans2AXTrans.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgFKTrans2AXTrans.Row;
  frmFKTrans2AXTransEdit:=TfrmFKTrans2AXTransEdit.Create(Application, dsView);
  
  try
    frmFKTrans2AXTransEdit.ShowModal;
  finally
    frmFKTrans2AXTransEdit.Free;
    frmFKTrans2AXTransEdit:=nil;
  end;

  if sgFKTrans2AXTrans.RowCount > selectedRow then
    sgFKTrans2AXTrans.Row := selectedRow
  else
    sgFKTrans2AXTrans.Row := sgFKTrans2AXTrans.RowCount - 1;
  
end;


procedure TfrmFKTrans2AXTransShow.actEditExecute(Sender: TObject);
var 
  TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
begin
  TempFKTrans2AXTrans := HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;
  try
    FKTrans2AXTransObj := TempFKTrans2AXTrans.getObject(StrToInt(sgFKTrans2AXTrans.Cells[0,sgFKTrans2AXTrans.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgFKTrans2AXTrans.Row;
  frmFKTrans2AXTransEdit:=TfrmFKTrans2AXTransEdit.Create(Application, dsEdit);
  
  try
    if frmFKTrans2AXTransEdit.ShowModal= mrOk then
      begin
        //TempFKTrans2AXTrans.save(FKTrans2AXTransObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFKTrans2AXTransEdit.Free;
    frmFKTrans2AXTransEdit:=nil;
  end;

  if sgFKTrans2AXTrans.RowCount > selectedRow then
    sgFKTrans2AXTrans.Row := selectedRow
  else
    sgFKTrans2AXTrans.Row := sgFKTrans2AXTrans.RowCount - 1;
  
end;


procedure TfrmFKTrans2AXTransShow.actDeleteExecute(Sender: TObject);
Var TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort;
  ObjCode: Integer;
begin
 TempFKTrans2AXTrans := HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;
   try
     ObjCode := StrToInt(sgFKTrans2AXTrans.Cells[0,sgFKTrans2AXTrans.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (передача проводок из FK в AX (с групировкой "цех сче кау" бал "цех счет кау" кор)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFKTrans2AXTrans.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFKTrans2AXTransShow.actInsertExecute(Sender: TObject);
// Var TempFKTrans2AXTrans: FKTrans2AXTransControllerSoapPort; 
begin
  // TempFKTrans2AXTrans := HTTPRIOFKTrans2AXTrans as FKTrans2AXTransControllerSoapPort;  /// Это здесь уже лишнее!!!
  FKTrans2AXTransObj:=FKTrans2AXTrans.Create;
  SetNullIntProps(FKTrans2AXTransObj);
  SetNullXSProps(FKTrans2AXTransObj);



  try
    frmFKTrans2AXTransEdit:=TfrmFKTrans2AXTransEdit.Create(Application, dsInsert);
    try
      if frmFKTrans2AXTransEdit.ShowModal = mrOk then
      begin
        if FKTrans2AXTransObj<>nil then
            //TempFKTrans2AXTrans.add(FKTrans2AXTransObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFKTrans2AXTransEdit.Free;
      frmFKTrans2AXTransEdit:=nil;
    end;
  finally
    FKTrans2AXTransObj.Free;
  end;
end;


procedure TfrmFKTrans2AXTransShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmFKTrans2AXTransShow.actFilterExecute(Sender: TObject);
begin
{frmFKTrans2AXTransFilterEdit:=TfrmFKTrans2AXTransFilterEdit.Create(Application, dsInsert);
  try
    FKTrans2AXTransFilterObj := FKTrans2AXTransFilter.Create;
    SetNullIntProps(FKTrans2AXTransFilterObj);
    SetNullXSProps(FKTrans2AXTransFilterObj);

    if frmFKTrans2AXTransFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := FKTrans2AXTransFilter.Create;
      FilterObject := FKTrans2AXTransFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFKTrans2AXTransFilterEdit.Free;
    frmFKTrans2AXTransFilterEdit:=nil;
  end;}
end;


procedure TfrmFKTrans2AXTransShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.