
unit ShowENSORItems2Post10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSORItems2Post10Controller, AdvObj ;


type
    TfrmENSORItems2Post10Show = class(TChildForm)  
    HTTPRIOENSORItems2Post10: THTTPRIO;
    ImageList1: TImageList;
    sgENSORItems2Post10: TAdvStringGrid;
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
    procedure sgENSORItems2Post10TopLeftChanged(Sender: TObject);
    procedure sgENSORItems2Post10DblClick(Sender: TObject);
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
 // ENSORItems2Post10Obj: ENSORItems2Post10;
 // ENSORItems2Post10FilterObj: ENSORItems2Post10Filter;
 frmENSORItems2Post10Show : TfrmENSORItems2Post10Show;
  
  
implementation

uses Main, EditENSORItems2Post10, EditENSORItems2Post10Filter;


{$R *.dfm}

var
  //frmENSORItems2Post10Show : TfrmENSORItems2Post10Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSORItems2Post10Headers: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENSORItems2Post10Show.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSORItems2Post10Show:=nil;
  inherited;
end;


procedure TfrmENSORItems2Post10Show.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSORItems2Post10Show.FormShow(Sender: TObject);
var
  TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort;
  i: Integer;
  ENSORItems2Post10List: ENSORItems2Post10ShortList;
begin
  SetGridHeaders(ENSORItems2Post10Headers, sgENSORItems2Post10.ColumnHeaders);
  ColCount:=100;
  TempENSORItems2Post10 :=  HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSORItems2Post10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSORItems2Post10List := TempENSORItems2Post10.getScrollableFilteredList(ENSORItems2Post10Filter(FilterObject),0,ColCount);
  LastCount:=High(ENSORItems2Post10List.list);

  if LastCount > -1 then
     sgENSORItems2Post10.RowCount:=LastCount+2
  else
     sgENSORItems2Post10.RowCount:=2;

   with sgENSORItems2Post10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSORItems2Post10List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSORItems2Post10List.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENSORItems2Post10.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSORItems2Post10.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSORItems2Post10.RowCount > selectedRow then
      sgENSORItems2Post10.Row := selectedRow
    else
      sgENSORItems2Post10.Row := sgENSORItems2Post10.RowCount - 1;
    end
    else
      sgENSORItems2Post10.Row:=1;   
end;


procedure TfrmENSORItems2Post10Show.sgENSORItems2Post10TopLeftChanged(Sender: TObject);
var
  TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort;
  i,CurrentRow: Integer;
  ENSORItems2Post10List: ENSORItems2Post10ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSORItems2Post10.TopRow + sgENSORItems2Post10.VisibleRowCount) = ColCount
  then
    begin
      TempENSORItems2Post10 :=  HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;
      CurrentRow:=sgENSORItems2Post10.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSORItems2Post10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSORItems2Post10List := TempENSORItems2Post10.getScrollableFilteredList(ENSORItems2Post10Filter(FilterObject),ColCount-1, 100);


  sgENSORItems2Post10.RowCount:=sgENSORItems2Post10.RowCount+100;
  LastCount:=High(ENSORItems2Post10List.list);
  with sgENSORItems2Post10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSORItems2Post10List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSORItems2Post10List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSORItems2Post10.Row:=CurrentRow-5;
   sgENSORItems2Post10.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSORItems2Post10Show.sgENSORItems2Post10DblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSORItems2Post10,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSORItems2Post10Show.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSORItems2Post10.RowCount-1 do
   for j:=0 to sgENSORItems2Post10.ColCount-1 do
     sgENSORItems2Post10.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSORItems2Post10Show.actViewExecute(Sender: TObject);
var 
  TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort;
begin
  TempENSORItems2Post10 := HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;
  try
    ENSORItems2Post10Obj := TempENSORItems2Post10.getObject(StrToInt(sgENSORItems2Post10.Cells[0,sgENSORItems2Post10.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSORItems2Post10.Row;
  frmENSORItems2Post10Edit:=TfrmENSORItems2Post10Edit.Create(Application, dsView);
  
  try
    frmENSORItems2Post10Edit.ShowModal;
  finally
    frmENSORItems2Post10Edit.Free;
    frmENSORItems2Post10Edit:=nil;
  end;

  if sgENSORItems2Post10.RowCount > selectedRow then
    sgENSORItems2Post10.Row := selectedRow
  else
    sgENSORItems2Post10.Row := sgENSORItems2Post10.RowCount - 1;
  
end;


procedure TfrmENSORItems2Post10Show.actEditExecute(Sender: TObject);
var 
  TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort;
begin
  TempENSORItems2Post10 := HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;
  try
    ENSORItems2Post10Obj := TempENSORItems2Post10.getObject(StrToInt(sgENSORItems2Post10.Cells[0,sgENSORItems2Post10.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSORItems2Post10.Row;
  frmENSORItems2Post10Edit:=TfrmENSORItems2Post10Edit.Create(Application, dsEdit);
  
  try
    if frmENSORItems2Post10Edit.ShowModal= mrOk then
      begin
        //TempENSORItems2Post10.save(ENSORItems2Post10Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSORItems2Post10Edit.Free;
    frmENSORItems2Post10Edit:=nil;
  end;

  if sgENSORItems2Post10.RowCount > selectedRow then
    sgENSORItems2Post10.Row := selectedRow
  else
    sgENSORItems2Post10.Row := sgENSORItems2Post10.RowCount - 1;
  
end;


procedure TfrmENSORItems2Post10Show.actDeleteExecute(Sender: TObject);
Var TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSORItems2Post10 := HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSORItems2Post10.Cells[0,sgENSORItems2Post10.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка ліній сумісного підвісу та опор 10) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSORItems2Post10.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSORItems2Post10Show.actInsertExecute(Sender: TObject);
// Var TempENSORItems2Post10: ENSORItems2Post10ControllerSoapPort; 
begin
  // TempENSORItems2Post10 := HTTPRIOENSORItems2Post10 as ENSORItems2Post10ControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSORItems2Post10Obj:=ENSORItems2Post10.Create;
  SetNullIntProps(ENSORItems2Post10Obj);
  SetNullXSProps(ENSORItems2Post10Obj);



  try
    frmENSORItems2Post10Edit:=TfrmENSORItems2Post10Edit.Create(Application, dsInsert);
    try
      if frmENSORItems2Post10Edit.ShowModal = mrOk then
      begin
        if ENSORItems2Post10Obj<>nil then
            //TempENSORItems2Post10.add(ENSORItems2Post10Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSORItems2Post10Edit.Free;
      frmENSORItems2Post10Edit:=nil;
    end;
  finally
    ENSORItems2Post10Obj.Free;
  end;
end;


procedure TfrmENSORItems2Post10Show.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSORItems2Post10Show.actFilterExecute(Sender: TObject);
begin
{frmENSORItems2Post10FilterEdit:=TfrmENSORItems2Post10FilterEdit.Create(Application, dsInsert);
  try
    ENSORItems2Post10FilterObj := ENSORItems2Post10Filter.Create;
    SetNullIntProps(ENSORItems2Post10FilterObj);
    SetNullXSProps(ENSORItems2Post10FilterObj);

    if frmENSORItems2Post10FilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSORItems2Post10Filter.Create;
      FilterObject := ENSORItems2Post10FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSORItems2Post10FilterEdit.Free;
    frmENSORItems2Post10FilterEdit:=nil;
  end;}
end;


procedure TfrmENSORItems2Post10Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.