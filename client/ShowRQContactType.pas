
unit ShowRQContactType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RQContactTypeController, AdvObj ;

 type
  TProcChooseRQContactTypeHandler = reference to procedure(selectedObj: RQContactTypeShort);
type
    TfrmRQContactTypeShow = class(TChildForm)  
    HTTPRIORQContactType: THTTPRIO;
    ImageList1: TImageList;
    sgRQContactType: TAdvStringGrid;
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
    procedure sgRQContactTypeTopLeftChanged(Sender: TObject);
    procedure sgRQContactTypeDblClick(Sender: TObject);
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
   class procedure chooseFromList(proc: TProcChooseRQContactTypeHandler); stdcall; static;
 end;

var
 // RQContactTypeObj: RQContactType;
 // RQContactTypeFilterObj: RQContactTypeFilter;
  frmRQContactTypeShow : TfrmRQContactTypeShow;
  
implementation

uses Main, EditRQContactType, EditRQContactTypeFilter;


{$R *.dfm}

var
  //frmRQContactTypeShow : TfrmRQContactTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQContactTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

class procedure TfrmRQContactTypeShow.chooseFromList(proc: TProcChooseRQContactTypeHandler);
var
  f1 : RQContactTypeFilter;
  frmRQContactTypeShow : TfrmRQContactTypeShow;
  selected : RQContactTypeShort;
begin
  inherited;
     f1 := RQContactTypeFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmRQContactTypeShow := TfrmRQContactTypeShow.Create(Application,fmNormal, f1);

       try
          with frmRQContactTypeShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := RQContactTypeShort(sgRQContactType.Objects[0, sgRQContactType.Row]);
                  proc(selected);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmRQContactTypeShow.Free;
       end;

end;
   
procedure TfrmRQContactTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmRQContactTypeShow:=nil;
  inherited;
end;


procedure TfrmRQContactTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmRQContactTypeShow.FormShow(Sender: TObject);
var
  TempRQContactType: RQContactTypeControllerSoapPort;
  i: Integer;
  RQContactTypeList: RQContactTypeShortList;
begin
  SetGridHeaders(RQContactTypeHeaders, sgRQContactType.ColumnHeaders);
  ColCount:=100;
  TempRQContactType :=  HTTPRIORQContactType as RQContactTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQContactTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQContactTypeList := TempRQContactType.getScrollableFilteredList(RQContactTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(RQContactTypeList.list);

  if LastCount > -1 then
     sgRQContactType.RowCount:=LastCount+2
  else
     sgRQContactType.RowCount:=2;

   with sgRQContactType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQContactTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQContactTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQContactTypeList.list[i].name;
        LastRow:=i+1;
        sgRQContactType.RowCount:=LastRow+1;
		Objects[0,i+1] := RQContactTypeList.list[i];
      end;
    
    ColCount:=ColCount+1;
    sgRQContactType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgRQContactType.RowCount > selectedRow then
      sgRQContactType.Row := selectedRow
    else
      sgRQContactType.Row := sgRQContactType.RowCount - 1;
    end
    else
      sgRQContactType.Row:=1;   
end;


procedure TfrmRQContactTypeShow.sgRQContactTypeTopLeftChanged(Sender: TObject);
var
  TempRQContactType: RQContactTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQContactTypeList: RQContactTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQContactType.TopRow + sgRQContactType.VisibleRowCount) = ColCount
  then
    begin
      TempRQContactType :=  HTTPRIORQContactType as RQContactTypeControllerSoapPort;
      CurrentRow:=sgRQContactType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQContactTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQContactTypeList := TempRQContactType.getScrollableFilteredList(RQContactTypeFilter(FilterObject),ColCount-1, 100);


  sgRQContactType.RowCount:=sgRQContactType.RowCount+100;
  LastCount:=High(RQContactTypeList.list);
  with sgRQContactType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQContactTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQContactTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQContactTypeList.list[i].name;
          LastRow:=i+CurrentRow;
		Objects[0,i+CurrentRow] := RQContactTypeList.list[i];
      end;
   ColCount:=ColCount+100;
   sgRQContactType.Row:=CurrentRow-5;
   sgRQContactType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQContactTypeShow.sgRQContactTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQContactType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmRQContactTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgRQContactType.RowCount-1 do
   for j:=0 to sgRQContactType.ColCount-1 do
     sgRQContactType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmRQContactTypeShow.actViewExecute(Sender: TObject);
var 
  TempRQContactType: RQContactTypeControllerSoapPort;
begin
  TempRQContactType := HTTPRIORQContactType as RQContactTypeControllerSoapPort;
  try
    RQContactTypeObj := TempRQContactType.getObject(StrToInt(sgRQContactType.Cells[0,sgRQContactType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQContactType.Row;
  frmRQContactTypeEdit:=TfrmRQContactTypeEdit.Create(Application, dsView);
  
  try
    frmRQContactTypeEdit.ShowModal;
  finally
    frmRQContactTypeEdit.Free;
    frmRQContactTypeEdit:=nil;
  end;

  if sgRQContactType.RowCount > selectedRow then
    sgRQContactType.Row := selectedRow
  else
    sgRQContactType.Row := sgRQContactType.RowCount - 1;
  
end;


procedure TfrmRQContactTypeShow.actEditExecute(Sender: TObject);
var 
  TempRQContactType: RQContactTypeControllerSoapPort;
begin
  TempRQContactType := HTTPRIORQContactType as RQContactTypeControllerSoapPort;
  try
    RQContactTypeObj := TempRQContactType.getObject(StrToInt(sgRQContactType.Cells[0,sgRQContactType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQContactType.Row;
  frmRQContactTypeEdit:=TfrmRQContactTypeEdit.Create(Application, dsEdit);
  
  try
    if frmRQContactTypeEdit.ShowModal= mrOk then
      begin
        //TempRQContactType.save(RQContactTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQContactTypeEdit.Free;
    frmRQContactTypeEdit:=nil;
  end;

  if sgRQContactType.RowCount > selectedRow then
    sgRQContactType.Row := selectedRow
  else
    sgRQContactType.Row := sgRQContactType.RowCount - 1;
  
end;


procedure TfrmRQContactTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQContactType: RQContactTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQContactType := HTTPRIORQContactType as RQContactTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQContactType.Cells[0,sgRQContactType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип контакту організації) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQContactType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQContactTypeShow.actInsertExecute(Sender: TObject);
// Var TempRQContactType: RQContactTypeControllerSoapPort; 
begin
  // TempRQContactType := HTTPRIORQContactType as RQContactTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQContactTypeObj:=RQContactType.Create;
  SetNullIntProps(RQContactTypeObj);
  SetNullXSProps(RQContactTypeObj);



  try
    frmRQContactTypeEdit:=TfrmRQContactTypeEdit.Create(Application, dsInsert);
    try
      if frmRQContactTypeEdit.ShowModal = mrOk then
      begin
        if RQContactTypeObj<>nil then
            //TempRQContactType.add(RQContactTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQContactTypeEdit.Free;
      frmRQContactTypeEdit:=nil;
    end;
  finally
    RQContactTypeObj.Free;
  end;
end;


procedure TfrmRQContactTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmRQContactTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQContactTypeFilterEdit:=TfrmRQContactTypeFilterEdit.Create(Application, dsInsert);
  try
    RQContactTypeFilterObj := RQContactTypeFilter.Create;
    SetNullIntProps(RQContactTypeFilterObj);
    SetNullXSProps(RQContactTypeFilterObj);

    if frmRQContactTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := RQContactTypeFilter.Create;
      FilterObject := RQContactTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQContactTypeFilterEdit.Free;
    frmRQContactTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmRQContactTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.