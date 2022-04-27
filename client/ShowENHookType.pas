
unit ShowENHookType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENHookTypeController, AdvObj ;


type
  TfrmENHookTypeShow = class(TChildForm)  
  HTTPRIOENHookType: THTTPRIO;
    ImageList1: TImageList;
    sgENHookType: TAdvStringGrid;
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
procedure sgENHookTypeTopLeftChanged(Sender: TObject);
procedure sgENHookTypeDblClick(Sender: TObject);
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
 frmENHookTypeShow : TfrmENHookTypeShow;
 // ENHookTypeObj: ENHookType;
 // ENHookTypeFilterObj: ENHookTypeFilter;
  
  
implementation

uses Main, EditENHookType, EditENHookTypeFilter;


{$R *.dfm}

var
//  frmENHookTypeShow : TfrmENHookTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENHookTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип крюку'
        );
   

procedure TfrmENHookTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENHookTypeShow:=nil;
    inherited;
  end;


procedure TfrmENHookTypeShow.FormShow(Sender: TObject);
var
  TempENHookType: ENHookTypeControllerSoapPort;
  i: Integer;
  ENHookTypeList: ENHookTypeShortList;
  begin
  SetGridHeaders(ENHookTypeHeaders, sgENHookType.ColumnHeaders);
  ColCount:=100;
  TempENHookType :=  HTTPRIOENHookType as ENHookTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENHookTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHookTypeList := TempENHookType.getScrollableFilteredList(ENHookTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENHookTypeList.list);

  if LastCount > -1 then
     sgENHookType.RowCount:=LastCount+2
  else
     sgENHookType.RowCount:=2;

   with sgENHookType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHookTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHookTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENHookTypeList.list[i].name;
        LastRow:=i+1;
        sgENHookType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENHookType.Row:=1;
end;

procedure TfrmENHookTypeShow.sgENHookTypeTopLeftChanged(Sender: TObject);
var
  TempENHookType: ENHookTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENHookTypeList: ENHookTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENHookType.TopRow + sgENHookType.VisibleRowCount) = ColCount
  then
    begin
      TempENHookType :=  HTTPRIOENHookType as ENHookTypeControllerSoapPort;
      CurrentRow:=sgENHookType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENHookTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENHookTypeList := TempENHookType.getScrollableFilteredList(ENHookTypeFilter(FilterObject),ColCount-1, 100);



  sgENHookType.RowCount:=sgENHookType.RowCount+100;
  LastCount:=High(ENHookTypeList.list);
  with sgENHookType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENHookTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENHookTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENHookTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENHookType.Row:=CurrentRow-5;
   sgENHookType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENHookTypeShow.sgENHookTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENHookType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENHookTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENHookType.RowCount-1 do
   for j:=0 to sgENHookType.ColCount-1 do
     sgENHookType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENHookTypeShow.actViewExecute(Sender: TObject);
Var TempENHookType: ENHookTypeControllerSoapPort;
begin
 TempENHookType := HTTPRIOENHookType as ENHookTypeControllerSoapPort;
   try
     ENHookTypeObj := TempENHookType.getObject(StrToInt(sgENHookType.Cells[0,sgENHookType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHookTypeEdit:=TfrmENHookTypeEdit.Create(Application, dsView);
  try
    frmENHookTypeEdit.ShowModal;
  finally
    frmENHookTypeEdit.Free;
    frmENHookTypeEdit:=nil;
  end;
end;

procedure TfrmENHookTypeShow.actEditExecute(Sender: TObject);
Var TempENHookType: ENHookTypeControllerSoapPort;
begin
 TempENHookType := HTTPRIOENHookType as ENHookTypeControllerSoapPort;
   try
     ENHookTypeObj := TempENHookType.getObject(StrToInt(sgENHookType.Cells[0,sgENHookType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHookTypeEdit:=TfrmENHookTypeEdit.Create(Application, dsEdit);
  try
    if frmENHookTypeEdit.ShowModal= mrOk then
      begin
        //TempENHookType.save(ENHookTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHookTypeEdit.Free;
    frmENHookTypeEdit:=nil;
  end;
end;

procedure TfrmENHookTypeShow.actDeleteExecute(Sender: TObject);
Var TempENHookType: ENHookTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENHookType := HTTPRIOENHookType as ENHookTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENHookType.Cells[0,sgENHookType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи крюків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENHookType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENHookTypeShow.actInsertExecute(Sender: TObject);
// Var TempENHookType: ENHookTypeControllerSoapPort; 
begin
  // TempENHookType := HTTPRIOENHookType as ENHookTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENHookTypeObj:=ENHookType.Create;



  try
    frmENHookTypeEdit:=TfrmENHookTypeEdit.Create(Application, dsInsert);
    try
      if frmENHookTypeEdit.ShowModal = mrOk then
      begin
        if ENHookTypeObj<>nil then
            //TempENHookType.add(ENHookTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHookTypeEdit.Free;
      frmENHookTypeEdit:=nil;
    end;
  finally
    ENHookTypeObj.Free;
  end;
end;

procedure TfrmENHookTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENHookTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENHookTypeFilterEdit:=TfrmENHookTypeFilterEdit.Create(Application, dsInsert);
  try
    ENHookTypeFilterObj := ENHookTypeFilter.Create;
    SetNullIntProps(ENHookTypeFilterObj);
    SetNullXSProps(ENHookTypeFilterObj);

    if frmENHookTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENHookTypeFilter.Create;
      FilterObject := ENHookTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENHookTypeFilterEdit.Free;
    frmENHookTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENHookTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.