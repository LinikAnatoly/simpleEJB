
unit ShowENLockType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLockTypeController ;


type
  TfrmENLockTypeShow = class(TChildForm)  
  HTTPRIOENLockType: THTTPRIO;
    ImageList1: TImageList;
    sgENLockType: TAdvStringGrid;
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
procedure sgENLockTypeTopLeftChanged(Sender: TObject);
procedure sgENLockTypeDblClick(Sender: TObject);
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
 // ENLockTypeObj: ENLockType;
 // ENLockTypeFilterObj: ENLockTypeFilter;
  
  
implementation

uses Main, EditENLockType, EditENLockTypeFilter;


{$R *.dfm}

var
  //frmENLockTypeShow : TfrmENLockTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLockTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип замка'
        );
   

procedure TfrmENLockTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLockTypeShow:=nil;
    inherited;
  end;


procedure TfrmENLockTypeShow.FormShow(Sender: TObject);
var
  TempENLockType: ENLockTypeControllerSoapPort;
  i: Integer;
  ENLockTypeList: ENLockTypeShortList;
  begin
  SetGridHeaders(ENLockTypeHeaders, sgENLockType.ColumnHeaders);
  ColCount:=100;
  TempENLockType :=  HTTPRIOENLockType as ENLockTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLockTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLockTypeList := TempENLockType.getScrollableFilteredList(ENLockTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLockTypeList.list);

  if LastCount > -1 then
     sgENLockType.RowCount:=LastCount+2
  else
     sgENLockType.RowCount:=2;

   with sgENLockType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLockTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLockTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLockTypeList.list[i].name;
        LastRow:=i+1;
        sgENLockType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLockType.Row:=1;
end;

procedure TfrmENLockTypeShow.sgENLockTypeTopLeftChanged(Sender: TObject);
var
  TempENLockType: ENLockTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENLockTypeList: ENLockTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLockType.TopRow + sgENLockType.VisibleRowCount) = ColCount
  then
    begin
      TempENLockType :=  HTTPRIOENLockType as ENLockTypeControllerSoapPort;
      CurrentRow:=sgENLockType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLockTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLockTypeList := TempENLockType.getScrollableFilteredList(ENLockTypeFilter(FilterObject),ColCount-1, 100);



  sgENLockType.RowCount:=sgENLockType.RowCount+100;
  LastCount:=High(ENLockTypeList.list);
  with sgENLockType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLockTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLockTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLockTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLockType.Row:=CurrentRow-5;
   sgENLockType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLockTypeShow.sgENLockTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLockType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLockTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLockType.RowCount-1 do
   for j:=0 to sgENLockType.ColCount-1 do
     sgENLockType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLockTypeShow.actViewExecute(Sender: TObject);
Var TempENLockType: ENLockTypeControllerSoapPort;
begin
 TempENLockType := HTTPRIOENLockType as ENLockTypeControllerSoapPort;
   try
     ENLockTypeObj := TempENLockType.getObject(StrToInt(sgENLockType.Cells[0,sgENLockType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLockTypeEdit:=TfrmENLockTypeEdit.Create(Application, dsView);
  try
    frmENLockTypeEdit.ShowModal;
  finally
    frmENLockTypeEdit.Free;
    frmENLockTypeEdit:=nil;
  end;
end;

procedure TfrmENLockTypeShow.actEditExecute(Sender: TObject);
Var TempENLockType: ENLockTypeControllerSoapPort;
begin
 TempENLockType := HTTPRIOENLockType as ENLockTypeControllerSoapPort;
   try
     ENLockTypeObj := TempENLockType.getObject(StrToInt(sgENLockType.Cells[0,sgENLockType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLockTypeEdit:=TfrmENLockTypeEdit.Create(Application, dsEdit);
  try
    if frmENLockTypeEdit.ShowModal= mrOk then
      begin
        //TempENLockType.save(ENLockTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLockTypeEdit.Free;
    frmENLockTypeEdit:=nil;
  end;
end;

procedure TfrmENLockTypeShow.actDeleteExecute(Sender: TObject);
Var TempENLockType: ENLockTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLockType := HTTPRIOENLockType as ENLockTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLockType.Cells[0,sgENLockType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типы замков) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLockType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLockTypeShow.actInsertExecute(Sender: TObject);
Var TempENLockType: ENLockTypeControllerSoapPort;
begin
  TempENLockType := HTTPRIOENLockType as ENLockTypeControllerSoapPort;
  ENLockTypeObj:=ENLockType.Create;



  try
    frmENLockTypeEdit:=TfrmENLockTypeEdit.Create(Application, dsInsert);
    try
      if frmENLockTypeEdit.ShowModal = mrOk then
      begin
        if ENLockTypeObj<>nil then
            //TempENLockType.add(ENLockTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLockTypeEdit.Free;
      frmENLockTypeEdit:=nil;
    end;
  finally
    ENLockTypeObj.Free;
  end;
end;

procedure TfrmENLockTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLockTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENLockTypeFilterEdit:=TfrmENLockTypeFilterEdit.Create(Application, dsInsert);
  try
    ENLockTypeFilterObj := ENLockTypeFilter.Create;
    SetNullIntProps(ENLockTypeFilterObj);
    SetNullXSProps(ENLockTypeFilterObj);

    if frmENLockTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLockTypeFilter.Create;
      FilterObject := ENLockTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLockTypeFilterEdit.Free;
    frmENLockTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENLockTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.