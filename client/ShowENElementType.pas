
unit ShowENElementType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENElementTypeController, AdvObj ;


type
  TfrmENElementTypeShow = class(TChildForm)  
  HTTPRIOENElementType: THTTPRIO;
    ImageList1: TImageList;
    sgENElementType: TAdvStringGrid;
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
procedure sgENElementTypeTopLeftChanged(Sender: TObject);
procedure sgENElementTypeDblClick(Sender: TObject);
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
  frmENElementTypeShow : TfrmENElementTypeShow;
  // ENElementTypeObj: ENElementType;
  // ENElementTypeFilterObj: ENElementTypeFilter;
  
  
implementation

uses Main, EditENElementType, EditENElementTypeFilter;


{$R *.dfm}

var
  //frmENElementTypeShow : TfrmENElementTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENElementTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Типа элмента сети'
        );
   

procedure TfrmENElementTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENElementTypeShow:=nil;
    inherited;
  end;


procedure TfrmENElementTypeShow.FormShow(Sender: TObject);
var
  TempENElementType: ENElementTypeControllerSoapPort;
  i: Integer;
  ENElementTypeList: ENElementTypeShortList;
  begin
  SetGridHeaders(ENElementTypeHeaders, sgENElementType.ColumnHeaders);
  ColCount:=100;
  TempENElementType :=  HTTPRIOENElementType as ENElementTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENElementTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENElementTypeList := TempENElementType.getScrollableFilteredList(ENElementTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENElementTypeList.list);

  if LastCount > -1 then
     sgENElementType.RowCount:=LastCount+2
  else
     sgENElementType.RowCount:=2;

   with sgENElementType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENElementTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENElementTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENElementTypeList.list[i].name;
        LastRow:=i+1;
        sgENElementType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENElementType.Row:=1;
end;

procedure TfrmENElementTypeShow.sgENElementTypeTopLeftChanged(Sender: TObject);
var
  TempENElementType: ENElementTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENElementTypeList: ENElementTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENElementType.TopRow + sgENElementType.VisibleRowCount) = ColCount
  then
    begin
      TempENElementType :=  HTTPRIOENElementType as ENElementTypeControllerSoapPort;
      CurrentRow:=sgENElementType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENElementTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENElementTypeList := TempENElementType.getScrollableFilteredList(ENElementTypeFilter(FilterObject),ColCount-1, 100);



  sgENElementType.RowCount:=sgENElementType.RowCount+100;
  LastCount:=High(ENElementTypeList.list);
  with sgENElementType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENElementTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENElementTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENElementTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENElementType.Row:=CurrentRow-5;
   sgENElementType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENElementTypeShow.sgENElementTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENElementType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENElementTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENElementType.RowCount-1 do
   for j:=0 to sgENElementType.ColCount-1 do
     sgENElementType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENElementTypeShow.actViewExecute(Sender: TObject);
Var TempENElementType: ENElementTypeControllerSoapPort;
begin
 TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
   try
     ENElementTypeObj := TempENElementType.getObject(StrToInt(sgENElementType.Cells[0,sgENElementType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENElementTypeEdit:=TfrmENElementTypeEdit.Create(Application, dsView);
  try
    frmENElementTypeEdit.ShowModal;
  finally
    frmENElementTypeEdit.Free;
    frmENElementTypeEdit:=nil;
  end;
end;

procedure TfrmENElementTypeShow.actEditExecute(Sender: TObject);
Var TempENElementType: ENElementTypeControllerSoapPort;
begin
 TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
   try
     ENElementTypeObj := TempENElementType.getObject(StrToInt(sgENElementType.Cells[0,sgENElementType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENElementTypeEdit:=TfrmENElementTypeEdit.Create(Application, dsEdit);
  try
    if frmENElementTypeEdit.ShowModal= mrOk then
      begin
        //TempENElementType.save(ENElementTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENElementTypeEdit.Free;
    frmENElementTypeEdit:=nil;
  end;
end;

procedure TfrmENElementTypeShow.actDeleteExecute(Sender: TObject);
Var TempENElementType: ENElementTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENElementType.Cells[0,sgENElementType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип элемента сети) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENElementType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENElementTypeShow.actInsertExecute(Sender: TObject);
Var TempENElementType: ENElementTypeControllerSoapPort;
begin
  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeObj:=ENElementType.Create;



  try
    frmENElementTypeEdit:=TfrmENElementTypeEdit.Create(Application, dsInsert);
    try
      if frmENElementTypeEdit.ShowModal = mrOk then
      begin
        if ENElementTypeObj<>nil then
            //TempENElementType.add(ENElementTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENElementTypeEdit.Free;
      frmENElementTypeEdit:=nil;
    end;
  finally
    ENElementTypeObj.Free;
  end;
end;

procedure TfrmENElementTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENElementTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENElementTypeFilterEdit:=TfrmENElementTypeFilterEdit.Create(Application, dsEdit);
  try
    if frmENElementTypeFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENElementTypeFilter.Create;
      FilterObject := ENElementTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENElementTypeFilterEdit.Free;
    frmENElementTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENElementTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.