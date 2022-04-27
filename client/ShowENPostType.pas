
unit ShowENPostType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPostTypeController, AdvObj ;


type
  TfrmENPostTypeShow = class(TChildForm)  
  HTTPRIOENPostType: THTTPRIO;
    ImageList1: TImageList;
    sgENPostType: TAdvStringGrid;
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
procedure sgENPostTypeTopLeftChanged(Sender: TObject);
procedure sgENPostTypeDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENPostTypeShow : TfrmENPostTypeShow;
 // ENPostTypeObj: ENPostType;
 // ENPostTypeFilterObj: ENPostTypeFilter;
  
  
implementation

uses Main, EditENPostType, EditENPostTypeFilter;


{$R *.dfm}

var
  //frmENPostTypeShow : TfrmENPostTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPostTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип опори'
        );
   

procedure TfrmENPostTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPostTypeShow:=nil;
    inherited;
  end;


procedure TfrmENPostTypeShow.FormShow(Sender: TObject);
var
  TempENPostType: ENPostTypeControllerSoapPort;
  i: Integer;
  ENPostTypeList: ENPostTypeShortList;
  begin
  SetGridHeaders(ENPostTypeHeaders, sgENPostType.ColumnHeaders);
  ColCount:=100;
  TempENPostType :=  HTTPRIOENPostType as ENPostTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPostTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPostTypeFilter(FilterObject).orderBySQL := ' code desc ';
  ENPostTypeList := TempENPostType.getScrollableFilteredList(ENPostTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPostTypeList.list);

  if LastCount > -1 then
     sgENPostType.RowCount:=LastCount+2
  else
     sgENPostType.RowCount:=2;

   with sgENPostType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPostTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPostTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPostTypeList.list[i].name;
        LastRow:=i+1;
        sgENPostType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPostType.Row:=1;
end;

procedure TfrmENPostTypeShow.sgENPostTypeTopLeftChanged(Sender: TObject);
var
  TempENPostType: ENPostTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENPostTypeList: ENPostTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPostType.TopRow + sgENPostType.VisibleRowCount) = ColCount
  then
    begin
      TempENPostType :=  HTTPRIOENPostType as ENPostTypeControllerSoapPort;
      CurrentRow:=sgENPostType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPostTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPostTypeFilter(FilterObject).orderBySQL := ' code desc ';
  ENPostTypeList := TempENPostType.getScrollableFilteredList(ENPostTypeFilter(FilterObject),ColCount-1, 100);



  sgENPostType.RowCount:=sgENPostType.RowCount+100;
  LastCount:=High(ENPostTypeList.list);
  with sgENPostType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPostTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPostTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPostTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPostType.Row:=CurrentRow-5;
   sgENPostType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPostTypeShow.sgENPostTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPostType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPostTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPostType.RowCount-1 do
   for j:=0 to sgENPostType.ColCount-1 do
     sgENPostType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPostTypeShow.actViewExecute(Sender: TObject);
Var TempENPostType: ENPostTypeControllerSoapPort;
begin
 TempENPostType := HTTPRIOENPostType as ENPostTypeControllerSoapPort;
   try
     ENPostTypeObj := TempENPostType.getObject(StrToInt(sgENPostType.Cells[0,sgENPostType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPostTypeEdit:=TfrmENPostTypeEdit.Create(Application, dsView);
  try
    frmENPostTypeEdit.ShowModal;
  finally
    frmENPostTypeEdit.Free;
    frmENPostTypeEdit:=nil;
  end;
end;

procedure TfrmENPostTypeShow.actEditExecute(Sender: TObject);
Var TempENPostType: ENPostTypeControllerSoapPort;
begin
 TempENPostType := HTTPRIOENPostType as ENPostTypeControllerSoapPort;
   try
     ENPostTypeObj := TempENPostType.getObject(StrToInt(sgENPostType.Cells[0,sgENPostType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPostTypeEdit:=TfrmENPostTypeEdit.Create(Application, dsEdit);
  try
    if frmENPostTypeEdit.ShowModal= mrOk then
      begin
        //TempENPostType.save(ENPostTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPostTypeEdit.Free;
    frmENPostTypeEdit:=nil;
  end;
end;

procedure TfrmENPostTypeShow.actDeleteExecute(Sender: TObject);
Var TempENPostType: ENPostTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPostType := HTTPRIOENPostType as ENPostTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPostType.Cells[0,sgENPostType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип опори) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPostType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPostTypeShow.actInsertExecute(Sender: TObject);
// Var TempENPostType: ENPostTypeControllerSoapPort; 
begin
  // TempENPostType := HTTPRIOENPostType as ENPostTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPostTypeObj:=ENPostType.Create;



  try
    frmENPostTypeEdit:=TfrmENPostTypeEdit.Create(Application, dsInsert);
    try
      if frmENPostTypeEdit.ShowModal = mrOk then
      begin
        if ENPostTypeObj<>nil then
            //TempENPostType.add(ENPostTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPostTypeEdit.Free;
      frmENPostTypeEdit:=nil;
    end;
  finally
    ENPostTypeObj.Free;
  end;
end;

procedure TfrmENPostTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPostTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENPostTypeFilterEdit:=TfrmENPostTypeFilterEdit.Create(Application, dsInsert);
  try
    ENPostTypeFilterObj := ENPostTypeFilter.Create;
    SetNullIntProps(ENPostTypeFilterObj);
    SetNullXSProps(ENPostTypeFilterObj);

    if frmENPostTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPostTypeFilter.Create;
      FilterObject := ENPostTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPostTypeFilterEdit.Free;
    frmENPostTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENPostTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.