
unit ShowENMolFuelMotionType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMolFuelMotionTypeController ;


type
  TfrmENMolFuelMotionTypeShow = class(TChildForm)  
  HTTPRIOENMolFuelMotionType: THTTPRIO;
    ImageList1: TImageList;
    sgENMolFuelMotionType: TAdvStringGrid;
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
procedure sgENMolFuelMotionTypeTopLeftChanged(Sender: TObject);
procedure sgENMolFuelMotionTypeDblClick(Sender: TObject);
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

//var
 // ENMolFuelMotionTypeObj: ENMolFuelMotionType;
 // ENMolFuelMotionTypeFilterObj: ENMolFuelMotionTypeFilter;
  
  
implementation

uses Main, EditENMolFuelMotionType, EditENMolFuelMotionTypeFilter;


{$R *.dfm}

var
  //frmENMolFuelMotionTypeShow : TfrmENMolFuelMotionTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMolFuelMotionTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'наименование типа'
        );
   

procedure TfrmENMolFuelMotionTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMolFuelMotionTypeShow:=nil;
    inherited;
  end;


procedure TfrmENMolFuelMotionTypeShow.FormShow(Sender: TObject);
var
  TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort;
  i: Integer;
  ENMolFuelMotionTypeList: ENMolFuelMotionTypeShortList;
  begin
  SetGridHeaders(ENMolFuelMotionTypeHeaders, sgENMolFuelMotionType.ColumnHeaders);
  ColCount:=100;
  TempENMolFuelMotionType :=  HTTPRIOENMolFuelMotionType as ENMolFuelMotionTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMolFuelMotionTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolFuelMotionTypeList := TempENMolFuelMotionType.getScrollableFilteredList(ENMolFuelMotionTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMolFuelMotionTypeList.list);

  if LastCount > -1 then
     sgENMolFuelMotionType.RowCount:=LastCount+2
  else
     sgENMolFuelMotionType.RowCount:=2;

   with sgENMolFuelMotionType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolFuelMotionTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMolFuelMotionTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMolFuelMotionTypeList.list[i].name;
        LastRow:=i+1;
        sgENMolFuelMotionType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMolFuelMotionType.Row:=1;
end;

procedure TfrmENMolFuelMotionTypeShow.sgENMolFuelMotionTypeTopLeftChanged(Sender: TObject);
var
  TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENMolFuelMotionTypeList: ENMolFuelMotionTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMolFuelMotionType.TopRow + sgENMolFuelMotionType.VisibleRowCount) = ColCount
  then
    begin
      TempENMolFuelMotionType :=  HTTPRIOENMolFuelMotionType as ENMolFuelMotionTypeControllerSoapPort;
      CurrentRow:=sgENMolFuelMotionType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMolFuelMotionTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolFuelMotionTypeList := TempENMolFuelMotionType.getScrollableFilteredList(ENMolFuelMotionTypeFilter(FilterObject),ColCount-1, 100);



  sgENMolFuelMotionType.RowCount:=sgENMolFuelMotionType.RowCount+100;
  LastCount:=High(ENMolFuelMotionTypeList.list);
  with sgENMolFuelMotionType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolFuelMotionTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMolFuelMotionTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMolFuelMotionTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMolFuelMotionType.Row:=CurrentRow-5;
   sgENMolFuelMotionType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMolFuelMotionTypeShow.sgENMolFuelMotionTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMolFuelMotionType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMolFuelMotionTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMolFuelMotionType.RowCount-1 do
   for j:=0 to sgENMolFuelMotionType.ColCount-1 do
     sgENMolFuelMotionType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMolFuelMotionTypeShow.actViewExecute(Sender: TObject);
Var TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort;
begin
 TempENMolFuelMotionType := HTTPRIOENMolFuelMotionType as ENMolFuelMotionTypeControllerSoapPort;
   try
     ENMolFuelMotionTypeObj := TempENMolFuelMotionType.getObject(StrToInt(sgENMolFuelMotionType.Cells[0,sgENMolFuelMotionType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolFuelMotionTypeEdit:=TfrmENMolFuelMotionTypeEdit.Create(Application, dsView);
  try
    frmENMolFuelMotionTypeEdit.ShowModal;
  finally
    frmENMolFuelMotionTypeEdit.Free;
    frmENMolFuelMotionTypeEdit:=nil;
  end;
end;

procedure TfrmENMolFuelMotionTypeShow.actEditExecute(Sender: TObject);
Var TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort;
begin
 TempENMolFuelMotionType := HTTPRIOENMolFuelMotionType as ENMolFuelMotionTypeControllerSoapPort;
   try
     ENMolFuelMotionTypeObj := TempENMolFuelMotionType.getObject(StrToInt(sgENMolFuelMotionType.Cells[0,sgENMolFuelMotionType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolFuelMotionTypeEdit:=TfrmENMolFuelMotionTypeEdit.Create(Application, dsEdit);
  try
    if frmENMolFuelMotionTypeEdit.ShowModal= mrOk then
      begin
        //TempENMolFuelMotionType.save(ENMolFuelMotionTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMolFuelMotionTypeEdit.Free;
    frmENMolFuelMotionTypeEdit:=nil;
  end;
end;

procedure TfrmENMolFuelMotionTypeShow.actDeleteExecute(Sender: TObject);
Var TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMolFuelMotionType := HTTPRIOENMolFuelMotionType as ENMolFuelMotionTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMolFuelMotionType.Cells[0,sgENMolFuelMotionType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Движение топлива по МОЛам (тип) ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMolFuelMotionType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMolFuelMotionTypeShow.actInsertExecute(Sender: TObject);
// Var TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort; 
begin
  // TempENMolFuelMotionType := HTTPRIOENMolFuelMotionType as ENMolFuelMotionTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENMolFuelMotionTypeObj:=ENMolFuelMotionType.Create;



  try
    frmENMolFuelMotionTypeEdit:=TfrmENMolFuelMotionTypeEdit.Create(Application, dsInsert);
    try
      if frmENMolFuelMotionTypeEdit.ShowModal = mrOk then
      begin
        if ENMolFuelMotionTypeObj<>nil then
            //TempENMolFuelMotionType.add(ENMolFuelMotionTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMolFuelMotionTypeEdit.Free;
      frmENMolFuelMotionTypeEdit:=nil;
    end;
  finally
    ENMolFuelMotionTypeObj.Free;
  end;
end;

procedure TfrmENMolFuelMotionTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMolFuelMotionTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENMolFuelMotionTypeFilterEdit:=TfrmENMolFuelMotionTypeFilterEdit.Create(Application, dsInsert);
  try
    ENMolFuelMotionTypeFilterObj := ENMolFuelMotionTypeFilter.Create;
    SetNullIntProps(ENMolFuelMotionTypeFilterObj);
    SetNullXSProps(ENMolFuelMotionTypeFilterObj);

    if frmENMolFuelMotionTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMolFuelMotionTypeFilter.Create;
      FilterObject := ENMolFuelMotionTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMolFuelMotionTypeFilterEdit.Free;
    frmENMolFuelMotionTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENMolFuelMotionTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.