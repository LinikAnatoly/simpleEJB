
unit ShowENSORItems2Post04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSORItems2Post04Controller, AdvObj ;


type
    TfrmENSORItems2Post04Show = class(TChildForm)  
    HTTPRIOENSORItems2Post04: THTTPRIO;
    ImageList1: TImageList;
    sgENSORItems2Post04: TAdvStringGrid;
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
    procedure sgENSORItems2Post04TopLeftChanged(Sender: TObject);
    procedure sgENSORItems2Post04DblClick(Sender: TObject);
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
 // ENSORItems2Post04Obj: ENSORItems2Post04;
 // ENSORItems2Post04FilterObj: ENSORItems2Post04Filter;
  
  
implementation

uses Main, EditENSORItems2Post04, EditENSORItems2Post04Filter;


{$R *.dfm}

var
  //frmENSORItems2Post04Show : TfrmENSORItems2Post04Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSORItems2Post04Headers: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENSORItems2Post04Show.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSORItems2Post04Show:=nil;
  inherited;
end;


procedure TfrmENSORItems2Post04Show.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSORItems2Post04Show.FormShow(Sender: TObject);
var
  TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort;
  i: Integer;
  ENSORItems2Post04List: ENSORItems2Post04ShortList;
begin
  SetGridHeaders(ENSORItems2Post04Headers, sgENSORItems2Post04.ColumnHeaders);
  ColCount:=100;
  TempENSORItems2Post04 :=  HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSORItems2Post04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSORItems2Post04List := TempENSORItems2Post04.getScrollableFilteredList(ENSORItems2Post04Filter(FilterObject),0,ColCount);
  LastCount:=High(ENSORItems2Post04List.list);

  if LastCount > -1 then
     sgENSORItems2Post04.RowCount:=LastCount+2
  else
     sgENSORItems2Post04.RowCount:=2;

   with sgENSORItems2Post04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSORItems2Post04List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSORItems2Post04List.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENSORItems2Post04.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSORItems2Post04.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSORItems2Post04.RowCount > selectedRow then
      sgENSORItems2Post04.Row := selectedRow
    else
      sgENSORItems2Post04.Row := sgENSORItems2Post04.RowCount - 1;
    end
    else
      sgENSORItems2Post04.Row:=1;   
end;


procedure TfrmENSORItems2Post04Show.sgENSORItems2Post04TopLeftChanged(Sender: TObject);
var
  TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort;
  i,CurrentRow: Integer;
  ENSORItems2Post04List: ENSORItems2Post04ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSORItems2Post04.TopRow + sgENSORItems2Post04.VisibleRowCount) = ColCount
  then
    begin
      TempENSORItems2Post04 :=  HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;
      CurrentRow:=sgENSORItems2Post04.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSORItems2Post04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSORItems2Post04List := TempENSORItems2Post04.getScrollableFilteredList(ENSORItems2Post04Filter(FilterObject),ColCount-1, 100);


  sgENSORItems2Post04.RowCount:=sgENSORItems2Post04.RowCount+100;
  LastCount:=High(ENSORItems2Post04List.list);
  with sgENSORItems2Post04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSORItems2Post04List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSORItems2Post04List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSORItems2Post04.Row:=CurrentRow-5;
   sgENSORItems2Post04.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSORItems2Post04Show.sgENSORItems2Post04DblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSORItems2Post04,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSORItems2Post04Show.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSORItems2Post04.RowCount-1 do
   for j:=0 to sgENSORItems2Post04.ColCount-1 do
     sgENSORItems2Post04.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSORItems2Post04Show.actViewExecute(Sender: TObject);
var 
  TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort;
begin
  TempENSORItems2Post04 := HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;
  try
    ENSORItems2Post04Obj := TempENSORItems2Post04.getObject(StrToInt(sgENSORItems2Post04.Cells[0,sgENSORItems2Post04.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSORItems2Post04.Row;
  frmENSORItems2Post04Edit:=TfrmENSORItems2Post04Edit.Create(Application, dsView);
  
  try
    frmENSORItems2Post04Edit.ShowModal;
  finally
    frmENSORItems2Post04Edit.Free;
    frmENSORItems2Post04Edit:=nil;
  end;

  if sgENSORItems2Post04.RowCount > selectedRow then
    sgENSORItems2Post04.Row := selectedRow
  else
    sgENSORItems2Post04.Row := sgENSORItems2Post04.RowCount - 1;
  
end;


procedure TfrmENSORItems2Post04Show.actEditExecute(Sender: TObject);
var 
  TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort;
begin
  TempENSORItems2Post04 := HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;
  try
    ENSORItems2Post04Obj := TempENSORItems2Post04.getObject(StrToInt(sgENSORItems2Post04.Cells[0,sgENSORItems2Post04.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSORItems2Post04.Row;
  frmENSORItems2Post04Edit:=TfrmENSORItems2Post04Edit.Create(Application, dsEdit);
  
  try
    if frmENSORItems2Post04Edit.ShowModal= mrOk then
      begin
        //TempENSORItems2Post04.save(ENSORItems2Post04Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSORItems2Post04Edit.Free;
    frmENSORItems2Post04Edit:=nil;
  end;

  if sgENSORItems2Post04.RowCount > selectedRow then
    sgENSORItems2Post04.Row := selectedRow
  else
    sgENSORItems2Post04.Row := sgENSORItems2Post04.RowCount - 1;
  
end;


procedure TfrmENSORItems2Post04Show.actDeleteExecute(Sender: TObject);
Var TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSORItems2Post04 := HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSORItems2Post04.Cells[0,sgENSORItems2Post04.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка ліній сумісного підвісу та опор 04) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSORItems2Post04.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSORItems2Post04Show.actInsertExecute(Sender: TObject);
// Var TempENSORItems2Post04: ENSORItems2Post04ControllerSoapPort; 
begin
  // TempENSORItems2Post04 := HTTPRIOENSORItems2Post04 as ENSORItems2Post04ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSORItems2Post04Obj:=ENSORItems2Post04.Create;
  SetNullIntProps(ENSORItems2Post04Obj);
  SetNullXSProps(ENSORItems2Post04Obj);



  try
    frmENSORItems2Post04Edit:=TfrmENSORItems2Post04Edit.Create(Application, dsInsert);
    try
      if frmENSORItems2Post04Edit.ShowModal = mrOk then
      begin
        if ENSORItems2Post04Obj<>nil then
            //TempENSORItems2Post04.add(ENSORItems2Post04Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSORItems2Post04Edit.Free;
      frmENSORItems2Post04Edit:=nil;
    end;
  finally
    ENSORItems2Post04Obj.Free;
  end;
end;


procedure TfrmENSORItems2Post04Show.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSORItems2Post04Show.actFilterExecute(Sender: TObject);
begin
{frmENSORItems2Post04FilterEdit:=TfrmENSORItems2Post04FilterEdit.Create(Application, dsInsert);
  try
    ENSORItems2Post04FilterObj := ENSORItems2Post04Filter.Create;
    SetNullIntProps(ENSORItems2Post04FilterObj);
    SetNullXSProps(ENSORItems2Post04FilterObj);

    if frmENSORItems2Post04FilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSORItems2Post04Filter.Create;
      FilterObject := ENSORItems2Post04FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSORItems2Post04FilterEdit.Free;
    frmENSORItems2Post04FilterEdit:=nil;
  end;}
end;


procedure TfrmENSORItems2Post04Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.