
unit ShowENGroundType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENGroundTypeController, AdvObj ;


type
  TfrmENGroundTypeShow = class(TChildForm)  
  HTTPRIOENGroundType: THTTPRIO;
    ImageList1: TImageList;
    sgENGroundType: TAdvStringGrid;
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
procedure sgENGroundTypeTopLeftChanged(Sender: TObject);
procedure sgENGroundTypeDblClick(Sender: TObject);
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
 frmENGroundTypeShow : TfrmENGroundTypeShow;
 // ENGroundTypeObj: ENGroundType;
 // ENGroundTypeFilterObj: ENGroundTypeFilter;
  
  
implementation

uses Main, EditENGroundType, EditENGroundTypeFilter;


{$R *.dfm}

var
  //frmENGroundTypeShow : TfrmENGroundTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENGroundTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Заземлення'
        );
   

procedure TfrmENGroundTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENGroundTypeShow:=nil;
    inherited;
  end;


procedure TfrmENGroundTypeShow.FormShow(Sender: TObject);
var
  TempENGroundType: ENGroundTypeControllerSoapPort;
  i: Integer;
  ENGroundTypeList: ENGroundTypeShortList;
begin
  DisableActions([actInsert, actEdit, actDelete]);

  SetGridHeaders(ENGroundTypeHeaders, sgENGroundType.ColumnHeaders);
  ColCount:=100;
  TempENGroundType :=  HTTPRIOENGroundType as ENGroundTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENGroundTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGroundTypeFilter(FilterObject).conditionSQL :=
    'ENGROUNDTYPE.CODE NOT IN (60000000, 60000001, 240000000)';

  ENGroundTypeList := TempENGroundType.getScrollableFilteredList(
    ENGroundTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENGroundTypeList.list);

  if LastCount > -1 then
     sgENGroundType.RowCount:=LastCount+2
  else
     sgENGroundType.RowCount:=2;

   with sgENGroundType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGroundTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENGroundTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENGroundTypeList.list[i].name;
        LastRow:=i+1;
        sgENGroundType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENGroundType.Row:=1;
end;

procedure TfrmENGroundTypeShow.sgENGroundTypeTopLeftChanged(Sender: TObject);
var
  TempENGroundType: ENGroundTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENGroundTypeList: ENGroundTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENGroundType.TopRow + sgENGroundType.VisibleRowCount) = ColCount
  then
    begin
      TempENGroundType :=  HTTPRIOENGroundType as ENGroundTypeControllerSoapPort;
      CurrentRow:=sgENGroundType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENGroundTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGroundTypeList := TempENGroundType.getScrollableFilteredList(ENGroundTypeFilter(FilterObject),ColCount-1, 100);



  sgENGroundType.RowCount:=sgENGroundType.RowCount+100;
  LastCount:=High(ENGroundTypeList.list);
  with sgENGroundType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGroundTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENGroundTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENGroundTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENGroundType.Row:=CurrentRow-5;
   sgENGroundType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENGroundTypeShow.sgENGroundTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENGroundType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENGroundTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENGroundType.RowCount-1 do
   for j:=0 to sgENGroundType.ColCount-1 do
     sgENGroundType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENGroundTypeShow.actViewExecute(Sender: TObject);
Var TempENGroundType: ENGroundTypeControllerSoapPort;
begin
 TempENGroundType := HTTPRIOENGroundType as ENGroundTypeControllerSoapPort;
   try
     ENGroundTypeObj := TempENGroundType.getObject(StrToInt(sgENGroundType.Cells[0,sgENGroundType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENGroundTypeEdit:=TfrmENGroundTypeEdit.Create(Application, dsView);
  try
    frmENGroundTypeEdit.ShowModal;
  finally
    frmENGroundTypeEdit.Free;
    frmENGroundTypeEdit:=nil;
  end;
end;

procedure TfrmENGroundTypeShow.actEditExecute(Sender: TObject);
Var TempENGroundType: ENGroundTypeControllerSoapPort;
begin
 TempENGroundType := HTTPRIOENGroundType as ENGroundTypeControllerSoapPort;
   try
     ENGroundTypeObj := TempENGroundType.getObject(StrToInt(sgENGroundType.Cells[0,sgENGroundType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENGroundTypeEdit:=TfrmENGroundTypeEdit.Create(Application, dsEdit);
  try
    if frmENGroundTypeEdit.ShowModal= mrOk then
      begin
        //TempENGroundType.save(ENGroundTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENGroundTypeEdit.Free;
    frmENGroundTypeEdit:=nil;
  end;
end;

procedure TfrmENGroundTypeShow.actDeleteExecute(Sender: TObject);
Var TempENGroundType: ENGroundTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENGroundType := HTTPRIOENGroundType as ENGroundTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENGroundType.Cells[0,sgENGroundType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить Характеристику заземления?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENGroundType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENGroundTypeShow.actInsertExecute(Sender: TObject);
// Var TempENGroundType: ENGroundTypeControllerSoapPort; 
begin
  // TempENGroundType := HTTPRIOENGroundType as ENGroundTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENGroundTypeObj:=ENGroundType.Create;



  try
    frmENGroundTypeEdit:=TfrmENGroundTypeEdit.Create(Application, dsInsert);
    try
      if frmENGroundTypeEdit.ShowModal = mrOk then
      begin
        if ENGroundTypeObj<>nil then
            //TempENGroundType.add(ENGroundTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENGroundTypeEdit.Free;
      frmENGroundTypeEdit:=nil;
    end;
  finally
    ENGroundTypeObj.Free;
  end;
end;

procedure TfrmENGroundTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENGroundTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENGroundTypeFilterEdit:=TfrmENGroundTypeFilterEdit.Create(Application, dsInsert);
  try
    ENGroundTypeFilterObj := ENGroundTypeFilter.Create;
    SetNullIntProps(ENGroundTypeFilterObj);
    SetNullXSProps(ENGroundTypeFilterObj);

    if frmENGroundTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENGroundTypeFilter.Create;
      FilterObject := ENGroundTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENGroundTypeFilterEdit.Free;
    frmENGroundTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENGroundTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.