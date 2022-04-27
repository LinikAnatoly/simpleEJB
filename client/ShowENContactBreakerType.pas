
unit ShowENContactBreakerType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENContactBreakerTypeController, AdvObj ;


type
  TfrmENContactBreakerTypeShow = class(TChildForm)  
  HTTPRIOENContactBreakerType: THTTPRIO;
    ImageList1: TImageList;
    sgENContactBreakerType: TAdvStringGrid;
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
procedure sgENContactBreakerTypeTopLeftChanged(Sender: TObject);
procedure sgENContactBreakerTypeDblClick(Sender: TObject);
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
 frmENContactBreakerTypeShow : TfrmENContactBreakerTypeShow;
 // ENContactBreakerTypeObj: ENContactBreakerType;
 // ENContactBreakerTypeFilterObj: ENContactBreakerTypeFilter;
  
  
implementation

uses Main, EditENContactBreakerType, EditENContactBreakerTypeFilter;


{$R *.dfm}

var
  //frmENContactBreakerTypeShow : TfrmENContactBreakerTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENContactBreakerTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип рубильника'
        );
   

procedure TfrmENContactBreakerTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENContactBreakerTypeShow:=nil;
    inherited;
  end;


procedure TfrmENContactBreakerTypeShow.FormShow(Sender: TObject);
var
  TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
  i: Integer;
  ENContactBreakerTypeList: ENContactBreakerTypeShortList;
  begin
  SetGridHeaders(ENContactBreakerTypeHeaders, sgENContactBreakerType.ColumnHeaders);
  ColCount:=100;
  TempENContactBreakerType :=  HTTPRIOENContactBreakerType as ENContactBreakerTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENContactBreakerTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContactBreakerTypeList := TempENContactBreakerType.getScrollableFilteredList(ENContactBreakerTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENContactBreakerTypeList.list);

  if LastCount > -1 then
     sgENContactBreakerType.RowCount:=LastCount+2
  else
     sgENContactBreakerType.RowCount:=2;

   with sgENContactBreakerType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContactBreakerTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENContactBreakerTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENContactBreakerTypeList.list[i].name;
        LastRow:=i+1;
        sgENContactBreakerType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENContactBreakerType.Row:=1;
end;

procedure TfrmENContactBreakerTypeShow.sgENContactBreakerTypeTopLeftChanged(Sender: TObject);
var
  TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENContactBreakerTypeList: ENContactBreakerTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENContactBreakerType.TopRow + sgENContactBreakerType.VisibleRowCount) = ColCount
  then
    begin
      TempENContactBreakerType :=  HTTPRIOENContactBreakerType as ENContactBreakerTypeControllerSoapPort;
      CurrentRow:=sgENContactBreakerType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENContactBreakerTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContactBreakerTypeList := TempENContactBreakerType.getScrollableFilteredList(ENContactBreakerTypeFilter(FilterObject),ColCount-1, 100);



  sgENContactBreakerType.RowCount:=sgENContactBreakerType.RowCount+100;
  LastCount:=High(ENContactBreakerTypeList.list);
  with sgENContactBreakerType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContactBreakerTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENContactBreakerTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENContactBreakerTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENContactBreakerType.Row:=CurrentRow-5;
   sgENContactBreakerType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENContactBreakerTypeShow.sgENContactBreakerTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENContactBreakerType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENContactBreakerTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENContactBreakerType.RowCount-1 do
   for j:=0 to sgENContactBreakerType.ColCount-1 do
     sgENContactBreakerType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENContactBreakerTypeShow.actViewExecute(Sender: TObject);
Var TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
begin
 TempENContactBreakerType := HTTPRIOENContactBreakerType as ENContactBreakerTypeControllerSoapPort;
   try
     ENContactBreakerTypeObj := TempENContactBreakerType.getObject(StrToInt(sgENContactBreakerType.Cells[0,sgENContactBreakerType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContactBreakerTypeEdit:=TfrmENContactBreakerTypeEdit.Create(Application, dsView);
  try
    frmENContactBreakerTypeEdit.ShowModal;
  finally
    frmENContactBreakerTypeEdit.Free;
    frmENContactBreakerTypeEdit:=nil;
  end;
end;

procedure TfrmENContactBreakerTypeShow.actEditExecute(Sender: TObject);
Var TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
begin
 TempENContactBreakerType := HTTPRIOENContactBreakerType as ENContactBreakerTypeControllerSoapPort;
   try
     ENContactBreakerTypeObj := TempENContactBreakerType.getObject(StrToInt(sgENContactBreakerType.Cells[0,sgENContactBreakerType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContactBreakerTypeEdit:=TfrmENContactBreakerTypeEdit.Create(Application, dsEdit);
  try
    if frmENContactBreakerTypeEdit.ShowModal= mrOk then
      begin
        //TempENContactBreakerType.save(ENContactBreakerTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENContactBreakerTypeEdit.Free;
    frmENContactBreakerTypeEdit:=nil;
  end;
end;

procedure TfrmENContactBreakerTypeShow.actDeleteExecute(Sender: TObject);
Var TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContactBreakerType := HTTPRIOENContactBreakerType as ENContactBreakerTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContactBreakerType.Cells[0,sgENContactBreakerType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типы рубильников) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContactBreakerType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENContactBreakerTypeShow.actInsertExecute(Sender: TObject);
Var TempENContactBreakerType: ENContactBreakerTypeControllerSoapPort;
begin
  TempENContactBreakerType := HTTPRIOENContactBreakerType as ENContactBreakerTypeControllerSoapPort;
  ENContactBreakerTypeObj:=ENContactBreakerType.Create;



  try
    frmENContactBreakerTypeEdit:=TfrmENContactBreakerTypeEdit.Create(Application, dsInsert);
    try
      if frmENContactBreakerTypeEdit.ShowModal = mrOk then
      begin
        if ENContactBreakerTypeObj<>nil then
            //TempENContactBreakerType.add(ENContactBreakerTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENContactBreakerTypeEdit.Free;
      frmENContactBreakerTypeEdit:=nil;
    end;
  finally
    ENContactBreakerTypeObj.Free;
  end;
end;

procedure TfrmENContactBreakerTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENContactBreakerTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENContactBreakerTypeFilterEdit:=TfrmENContactBreakerTypeFilterEdit.Create(Application, dsInsert);
  try
    ENContactBreakerTypeFilterObj := ENContactBreakerTypeFilter.Create;
    SetNullIntProps(ENContactBreakerTypeFilterObj);
    SetNullXSProps(ENContactBreakerTypeFilterObj);

    if frmENContactBreakerTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContactBreakerTypeFilter.Create;
      FilterObject := ENContactBreakerTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENContactBreakerTypeFilterEdit.Free;
    frmENContactBreakerTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENContactBreakerTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.