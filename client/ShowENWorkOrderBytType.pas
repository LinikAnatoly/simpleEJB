
unit ShowENWorkOrderBytType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWorkOrderBytTypeController, AdvObj ;


type
  TfrmENWorkOrderBytTypeShow = class(TChildForm)  
  HTTPRIOENWorkOrderBytType: THTTPRIO;
    ImageList1: TImageList;
    sgENWorkOrderBytType: TAdvStringGrid;
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
procedure sgENWorkOrderBytTypeTopLeftChanged(Sender: TObject);
procedure sgENWorkOrderBytTypeDblClick(Sender: TObject);
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
 // ENWorkOrderBytTypeObj: ENWorkOrderBytType;
 // ENWorkOrderBytTypeFilterObj: ENWorkOrderBytTypeFilter;
  
  
implementation

uses Main, EditENWorkOrderBytType, EditENWorkOrderBytTypeFilter;


{$R *.dfm}

var
  //frmENWorkOrderBytTypeShow : TfrmENWorkOrderBytTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWorkOrderBytTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование'
        );
   

procedure TfrmENWorkOrderBytTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWorkOrderBytTypeShow:=nil;
    inherited;
  end;


procedure TfrmENWorkOrderBytTypeShow.FormShow(Sender: TObject);
var
  TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
  i: Integer;
  ENWorkOrderBytTypeList: ENWorkOrderBytTypeShortList;
begin
  SetGridHeaders(ENWorkOrderBytTypeHeaders, sgENWorkOrderBytType.ColumnHeaders);

  DisableActions([actInsert, actEdit, actDelete]);

  ColCount:=100;
  TempENWorkOrderBytType :=  HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderBytTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderBytTypeList := TempENWorkOrderBytType.getScrollableFilteredList(ENWorkOrderBytTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWorkOrderBytTypeList.list);

  if LastCount > -1 then
     sgENWorkOrderBytType.RowCount:=LastCount+2
  else
     sgENWorkOrderBytType.RowCount:=2;

   with sgENWorkOrderBytType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderBytTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWorkOrderBytTypeList.list[i].name;
        LastRow:=i+1;
        sgENWorkOrderBytType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWorkOrderBytType.Row:=1;
end;

procedure TfrmENWorkOrderBytTypeShow.sgENWorkOrderBytTypeTopLeftChanged(Sender: TObject);
var
  TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENWorkOrderBytTypeList: ENWorkOrderBytTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWorkOrderBytType.TopRow + sgENWorkOrderBytType.VisibleRowCount) = ColCount
  then
    begin
      TempENWorkOrderBytType :=  HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;
      CurrentRow:=sgENWorkOrderBytType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWorkOrderBytTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWorkOrderBytTypeList := TempENWorkOrderBytType.getScrollableFilteredList(ENWorkOrderBytTypeFilter(FilterObject),ColCount-1, 100);



  sgENWorkOrderBytType.RowCount:=sgENWorkOrderBytType.RowCount+100;
  LastCount:=High(ENWorkOrderBytTypeList.list);
  with sgENWorkOrderBytType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWorkOrderBytTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWorkOrderBytTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWorkOrderBytTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWorkOrderBytType.Row:=CurrentRow-5;
   sgENWorkOrderBytType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWorkOrderBytTypeShow.sgENWorkOrderBytTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWorkOrderBytType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWorkOrderBytTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWorkOrderBytType.RowCount-1 do
   for j:=0 to sgENWorkOrderBytType.ColCount-1 do
     sgENWorkOrderBytType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWorkOrderBytTypeShow.actViewExecute(Sender: TObject);
Var TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
begin
 TempENWorkOrderBytType := HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;
   try
     ENWorkOrderBytTypeObj := TempENWorkOrderBytType.getObject(StrToInt(sgENWorkOrderBytType.Cells[0,sgENWorkOrderBytType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderBytTypeEdit:=TfrmENWorkOrderBytTypeEdit.Create(Application, dsView);
  try
    frmENWorkOrderBytTypeEdit.ShowModal;
  finally
    frmENWorkOrderBytTypeEdit.Free;
    frmENWorkOrderBytTypeEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderBytTypeShow.actEditExecute(Sender: TObject);
Var TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
begin
 TempENWorkOrderBytType := HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;
   try
     ENWorkOrderBytTypeObj := TempENWorkOrderBytType.getObject(StrToInt(sgENWorkOrderBytType.Cells[0,sgENWorkOrderBytType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWorkOrderBytTypeEdit:=TfrmENWorkOrderBytTypeEdit.Create(Application, dsEdit);
  try
    if frmENWorkOrderBytTypeEdit.ShowModal= mrOk then
      begin
        //TempENWorkOrderBytType.save(ENWorkOrderBytTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWorkOrderBytTypeEdit.Free;
    frmENWorkOrderBytTypeEdit:=nil;
  end;
end;

procedure TfrmENWorkOrderBytTypeShow.actDeleteExecute(Sender: TObject);
Var TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWorkOrderBytType := HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWorkOrderBytType.Cells[0,sgENWorkOrderBytType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи змінних завдань для Енергозбуту) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWorkOrderBytType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWorkOrderBytTypeShow.actInsertExecute(Sender: TObject);
// Var TempENWorkOrderBytType: ENWorkOrderBytTypeControllerSoapPort; 
begin
  // TempENWorkOrderBytType := HTTPRIOENWorkOrderBytType as ENWorkOrderBytTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWorkOrderBytTypeObj:=ENWorkOrderBytType.Create;



  try
    frmENWorkOrderBytTypeEdit:=TfrmENWorkOrderBytTypeEdit.Create(Application, dsInsert);
    try
      if frmENWorkOrderBytTypeEdit.ShowModal = mrOk then
      begin
        if ENWorkOrderBytTypeObj<>nil then
            //TempENWorkOrderBytType.add(ENWorkOrderBytTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWorkOrderBytTypeEdit.Free;
      frmENWorkOrderBytTypeEdit:=nil;
    end;
  finally
    ENWorkOrderBytTypeObj.Free;
  end;
end;

procedure TfrmENWorkOrderBytTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWorkOrderBytTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENWorkOrderBytTypeFilterEdit:=TfrmENWorkOrderBytTypeFilterEdit.Create(Application, dsInsert);
  try
    ENWorkOrderBytTypeFilterObj := ENWorkOrderBytTypeFilter.Create;
    SetNullIntProps(ENWorkOrderBytTypeFilterObj);
    SetNullXSProps(ENWorkOrderBytTypeFilterObj);

    if frmENWorkOrderBytTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWorkOrderBytTypeFilter.Create;
      FilterObject := ENWorkOrderBytTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWorkOrderBytTypeFilterEdit.Free;
    frmENWorkOrderBytTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENWorkOrderBytTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.