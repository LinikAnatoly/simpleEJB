
unit ShowENDepartmentType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDepartmentTypeController ;


type
  TfrmENDepartmentTypeShow = class(TChildForm)  
  HTTPRIOENDepartmentType: THTTPRIO;
    ImageList1: TImageList;
    sgENDepartmentType: TAdvStringGrid;
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
procedure sgENDepartmentTypeTopLeftChanged(Sender: TObject);
procedure sgENDepartmentTypeDblClick(Sender: TObject);
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
 // ENDepartmentTypeObj: ENDepartmentType;
 // ENDepartmentTypeFilterObj: ENDepartmentTypeFilter;
  
  
implementation

uses Main, EditENDepartmentType, EditENDepartmentTypeFilter;


{$R *.dfm}

var
  frmENDepartmentTypeShow : TfrmENDepartmentTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDepartmentTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип підрозділа'
        );
   

procedure TfrmENDepartmentTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDepartmentTypeShow:=nil;
    inherited;
  end;


procedure TfrmENDepartmentTypeShow.FormShow(Sender: TObject);
var
  TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
  i: Integer;
  ENDepartmentTypeList: ENDepartmentTypeShortList;
  begin
  SetGridHeaders(ENDepartmentTypeHeaders, sgENDepartmentType.ColumnHeaders);
  ColCount:=100;
  TempENDepartmentType :=  HTTPRIOENDepartmentType as ENDepartmentTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDepartmentTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDepartmentTypeList := TempENDepartmentType.getScrollableFilteredList(ENDepartmentTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDepartmentTypeList.list);

  if LastCount > -1 then
     sgENDepartmentType.RowCount:=LastCount+2
  else
     sgENDepartmentType.RowCount:=2;

   with sgENDepartmentType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDepartmentTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDepartmentTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDepartmentTypeList.list[i].name;
        LastRow:=i+1;
        sgENDepartmentType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDepartmentType.Row:=1;
end;

procedure TfrmENDepartmentTypeShow.sgENDepartmentTypeTopLeftChanged(Sender: TObject);
var
  TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDepartmentTypeList: ENDepartmentTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDepartmentType.TopRow + sgENDepartmentType.VisibleRowCount) = ColCount
  then
    begin
      TempENDepartmentType :=  HTTPRIOENDepartmentType as ENDepartmentTypeControllerSoapPort;
      CurrentRow:=sgENDepartmentType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDepartmentTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDepartmentTypeList := TempENDepartmentType.getScrollableFilteredList(ENDepartmentTypeFilter(FilterObject),ColCount-1, 100);



  sgENDepartmentType.RowCount:=sgENDepartmentType.RowCount+100;
  LastCount:=High(ENDepartmentTypeList.list);
  with sgENDepartmentType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDepartmentTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDepartmentTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDepartmentTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDepartmentType.Row:=CurrentRow-5;
   sgENDepartmentType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDepartmentTypeShow.sgENDepartmentTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDepartmentType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDepartmentTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDepartmentType.RowCount-1 do
   for j:=0 to sgENDepartmentType.ColCount-1 do
     sgENDepartmentType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDepartmentTypeShow.actViewExecute(Sender: TObject);
Var TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
begin
 TempENDepartmentType := HTTPRIOENDepartmentType as ENDepartmentTypeControllerSoapPort;
   try
     ENDepartmentTypeObj := TempENDepartmentType.getObject(StrToInt(sgENDepartmentType.Cells[0,sgENDepartmentType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDepartmentTypeEdit:=TfrmENDepartmentTypeEdit.Create(Application, dsView);
  try
    frmENDepartmentTypeEdit.ShowModal;
  finally
    frmENDepartmentTypeEdit.Free;
    frmENDepartmentTypeEdit:=nil;
  end;
end;

procedure TfrmENDepartmentTypeShow.actEditExecute(Sender: TObject);
Var TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
begin
 TempENDepartmentType := HTTPRIOENDepartmentType as ENDepartmentTypeControllerSoapPort;
   try
     ENDepartmentTypeObj := TempENDepartmentType.getObject(StrToInt(sgENDepartmentType.Cells[0,sgENDepartmentType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDepartmentTypeEdit:=TfrmENDepartmentTypeEdit.Create(Application, dsEdit);
  try
    if frmENDepartmentTypeEdit.ShowModal= mrOk then
      begin
        //TempENDepartmentType.save(ENDepartmentTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDepartmentTypeEdit.Free;
    frmENDepartmentTypeEdit:=nil;
  end;
end;

procedure TfrmENDepartmentTypeShow.actDeleteExecute(Sender: TObject);
Var TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDepartmentType := HTTPRIOENDepartmentType as ENDepartmentTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDepartmentType.Cells[0,sgENDepartmentType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип підрозділа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDepartmentType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDepartmentTypeShow.actInsertExecute(Sender: TObject);
Var TempENDepartmentType: ENDepartmentTypeControllerSoapPort;
begin
  TempENDepartmentType := HTTPRIOENDepartmentType as ENDepartmentTypeControllerSoapPort;
  ENDepartmentTypeObj:=ENDepartmentType.Create;



  try
    frmENDepartmentTypeEdit:=TfrmENDepartmentTypeEdit.Create(Application, dsInsert);
    try
      if frmENDepartmentTypeEdit.ShowModal = mrOk then
      begin
        if ENDepartmentTypeObj<>nil then
            //TempENDepartmentType.add(ENDepartmentTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDepartmentTypeEdit.Free;
      frmENDepartmentTypeEdit:=nil;
    end;
  finally
    ENDepartmentTypeObj.Free;
  end;
end;

procedure TfrmENDepartmentTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDepartmentTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENDepartmentTypeFilterEdit:=TfrmENDepartmentTypeFilterEdit.Create(Application, dsEdit);
  try
    if frmENDepartmentTypeFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENDepartmentTypeFilter.Create;
      FilterObject := ENDepartmentTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDepartmentTypeFilterEdit.Free;
    frmENDepartmentTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENDepartmentTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.