
unit ShowENBranchType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBranchTypeController ;


type
  TfrmENBranchTypeShow = class(TChildForm)  
  HTTPRIOENBranchType: THTTPRIO;
    ImageList1: TImageList;
    sgENBranchType: TAdvStringGrid;
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
procedure sgENBranchTypeTopLeftChanged(Sender: TObject);
procedure sgENBranchTypeDblClick(Sender: TObject);
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
 // ENBranchTypeObj: ENBranchType;
 // ENBranchTypeFilterObj: ENBranchTypeFilter;
  
  
implementation

uses Main, EditENBranchType, EditENBranchTypeFilter;


{$R *.dfm}

var
  //frmENBranchTypeShow : TfrmENBranchTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBranchTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип присоединения'
        );
   

procedure TfrmENBranchTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBranchTypeShow:=nil;
    inherited;
  end;


procedure TfrmENBranchTypeShow.FormShow(Sender: TObject);
var
  TempENBranchType: ENBranchTypeControllerSoapPort;
  i: Integer;
  ENBranchTypeList: ENBranchTypeShortList;
  begin
  SetGridHeaders(ENBranchTypeHeaders, sgENBranchType.ColumnHeaders);
  ColCount:=100;
  TempENBranchType :=  HTTPRIOENBranchType as ENBranchTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBranchTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranchTypeList := TempENBranchType.getScrollableFilteredList(ENBranchTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBranchTypeList.list);

  if LastCount > -1 then
     sgENBranchType.RowCount:=LastCount+2
  else
     sgENBranchType.RowCount:=2;

   with sgENBranchType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranchTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBranchTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBranchTypeList.list[i].name;
        LastRow:=i+1;
        sgENBranchType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBranchType.Row:=1;
end;

procedure TfrmENBranchTypeShow.sgENBranchTypeTopLeftChanged(Sender: TObject);
var
  TempENBranchType: ENBranchTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENBranchTypeList: ENBranchTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBranchType.TopRow + sgENBranchType.VisibleRowCount) = ColCount
  then
    begin
      TempENBranchType :=  HTTPRIOENBranchType as ENBranchTypeControllerSoapPort;
      CurrentRow:=sgENBranchType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBranchTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranchTypeList := TempENBranchType.getScrollableFilteredList(ENBranchTypeFilter(FilterObject),ColCount-1, 100);



  sgENBranchType.RowCount:=sgENBranchType.RowCount+100;
  LastCount:=High(ENBranchTypeList.list);
  with sgENBranchType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranchTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBranchTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBranchTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBranchType.Row:=CurrentRow-5;
   sgENBranchType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBranchTypeShow.sgENBranchTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBranchType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBranchTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBranchType.RowCount-1 do
   for j:=0 to sgENBranchType.ColCount-1 do
     sgENBranchType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBranchTypeShow.actViewExecute(Sender: TObject);
Var TempENBranchType: ENBranchTypeControllerSoapPort;
begin
 TempENBranchType := HTTPRIOENBranchType as ENBranchTypeControllerSoapPort;
   try
     ENBranchTypeObj := TempENBranchType.getObject(StrToInt(sgENBranchType.Cells[0,sgENBranchType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranchTypeEdit:=TfrmENBranchTypeEdit.Create(Application, dsView);
  try
    frmENBranchTypeEdit.ShowModal;
  finally
    frmENBranchTypeEdit.Free;
    frmENBranchTypeEdit:=nil;
  end;
end;

procedure TfrmENBranchTypeShow.actEditExecute(Sender: TObject);
Var TempENBranchType: ENBranchTypeControllerSoapPort;
begin
 TempENBranchType := HTTPRIOENBranchType as ENBranchTypeControllerSoapPort;
   try
     ENBranchTypeObj := TempENBranchType.getObject(StrToInt(sgENBranchType.Cells[0,sgENBranchType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranchTypeEdit:=TfrmENBranchTypeEdit.Create(Application, dsEdit);
  try
    if frmENBranchTypeEdit.ShowModal= mrOk then
      begin
        //TempENBranchType.save(ENBranchTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBranchTypeEdit.Free;
    frmENBranchTypeEdit:=nil;
  end;
end;

procedure TfrmENBranchTypeShow.actDeleteExecute(Sender: TObject);
Var TempENBranchType: ENBranchTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBranchType := HTTPRIOENBranchType as ENBranchTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBranchType.Cells[0,sgENBranchType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типы присоединений) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBranchType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBranchTypeShow.actInsertExecute(Sender: TObject);
Var TempENBranchType: ENBranchTypeControllerSoapPort;
begin
  TempENBranchType := HTTPRIOENBranchType as ENBranchTypeControllerSoapPort;
  ENBranchTypeObj:=ENBranchType.Create;



  try
    frmENBranchTypeEdit:=TfrmENBranchTypeEdit.Create(Application, dsInsert);
    try
      if frmENBranchTypeEdit.ShowModal = mrOk then
      begin
        if ENBranchTypeObj<>nil then
            //TempENBranchType.add(ENBranchTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBranchTypeEdit.Free;
      frmENBranchTypeEdit:=nil;
    end;
  finally
    ENBranchTypeObj.Free;
  end;
end;

procedure TfrmENBranchTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBranchTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENBranchTypeFilterEdit:=TfrmENBranchTypeFilterEdit.Create(Application, dsInsert);
  try
    ENBranchTypeFilterObj := ENBranchTypeFilter.Create;
    SetNullIntProps(ENBranchTypeFilterObj);
    SetNullXSProps(ENBranchTypeFilterObj);

    if frmENBranchTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBranchTypeFilter.Create;
      FilterObject := ENBranchTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBranchTypeFilterEdit.Free;
    frmENBranchTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENBranchTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.