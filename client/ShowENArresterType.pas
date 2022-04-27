
unit ShowENArresterType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENArresterTypeController, AdvObj ;


type
  TfrmENArresterTypeShow = class(TChildForm)  
  HTTPRIOENArresterType: THTTPRIO;
    ImageList1: TImageList;
    sgENArresterType: TAdvStringGrid;
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
procedure sgENArresterTypeTopLeftChanged(Sender: TObject);
procedure sgENArresterTypeDblClick(Sender: TObject);
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
 frmENArresterTypeShow : TfrmENArresterTypeShow;
 // ENArresterTypeObj: ENArresterType;
 // ENArresterTypeFilterObj: ENArresterTypeFilter;
  
  
implementation

uses Main, EditENArresterType, EditENArresterTypeFilter;


{$R *.dfm}

var
  //frmENArresterTypeShow : TfrmENArresterTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENArresterTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип разрядника'
        );
   

procedure TfrmENArresterTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENArresterTypeShow:=nil;
    inherited;
  end;


procedure TfrmENArresterTypeShow.FormShow(Sender: TObject);
var
  TempENArresterType: ENArresterTypeControllerSoapPort;
  i: Integer;
  ENArresterTypeList: ENArresterTypeShortList;
  begin
  SetGridHeaders(ENArresterTypeHeaders, sgENArresterType.ColumnHeaders);
  ColCount:=100;
  TempENArresterType :=  HTTPRIOENArresterType as ENArresterTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENArresterTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENArresterTypeList := TempENArresterType.getScrollableFilteredList(ENArresterTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENArresterTypeList.list);

  if LastCount > -1 then
     sgENArresterType.RowCount:=LastCount+2
  else
     sgENArresterType.RowCount:=2;

   with sgENArresterType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENArresterTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENArresterTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENArresterTypeList.list[i].name;
        LastRow:=i+1;
        sgENArresterType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENArresterType.Row:=1;
end;

procedure TfrmENArresterTypeShow.sgENArresterTypeTopLeftChanged(Sender: TObject);
var
  TempENArresterType: ENArresterTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENArresterTypeList: ENArresterTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENArresterType.TopRow + sgENArresterType.VisibleRowCount) = ColCount
  then
    begin
      TempENArresterType :=  HTTPRIOENArresterType as ENArresterTypeControllerSoapPort;
      CurrentRow:=sgENArresterType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENArresterTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENArresterTypeList := TempENArresterType.getScrollableFilteredList(ENArresterTypeFilter(FilterObject),ColCount-1, 100);



  sgENArresterType.RowCount:=sgENArresterType.RowCount+100;
  LastCount:=High(ENArresterTypeList.list);
  with sgENArresterType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENArresterTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENArresterTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENArresterTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENArresterType.Row:=CurrentRow-5;
   sgENArresterType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENArresterTypeShow.sgENArresterTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENArresterType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENArresterTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENArresterType.RowCount-1 do
   for j:=0 to sgENArresterType.ColCount-1 do
     sgENArresterType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENArresterTypeShow.actViewExecute(Sender: TObject);
Var TempENArresterType: ENArresterTypeControllerSoapPort;
begin
 TempENArresterType := HTTPRIOENArresterType as ENArresterTypeControllerSoapPort;
   try
     ENArresterTypeObj := TempENArresterType.getObject(StrToInt(sgENArresterType.Cells[0,sgENArresterType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENArresterTypeEdit:=TfrmENArresterTypeEdit.Create(Application, dsView);
  try
    frmENArresterTypeEdit.ShowModal;
  finally
    frmENArresterTypeEdit.Free;
    frmENArresterTypeEdit:=nil;
  end;
end;

procedure TfrmENArresterTypeShow.actEditExecute(Sender: TObject);
Var TempENArresterType: ENArresterTypeControllerSoapPort;
begin
 TempENArresterType := HTTPRIOENArresterType as ENArresterTypeControllerSoapPort;
   try
     ENArresterTypeObj := TempENArresterType.getObject(StrToInt(sgENArresterType.Cells[0,sgENArresterType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENArresterTypeEdit:=TfrmENArresterTypeEdit.Create(Application, dsEdit);
  try
    if frmENArresterTypeEdit.ShowModal= mrOk then
      begin
        //TempENArresterType.save(ENArresterTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENArresterTypeEdit.Free;
    frmENArresterTypeEdit:=nil;
  end;
end;

procedure TfrmENArresterTypeShow.actDeleteExecute(Sender: TObject);
Var TempENArresterType: ENArresterTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENArresterType := HTTPRIOENArresterType as ENArresterTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENArresterType.Cells[0,sgENArresterType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип разрядника (ОПН)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENArresterType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENArresterTypeShow.actInsertExecute(Sender: TObject);
Var TempENArresterType: ENArresterTypeControllerSoapPort;
begin
  TempENArresterType := HTTPRIOENArresterType as ENArresterTypeControllerSoapPort;
  ENArresterTypeObj:=ENArresterType.Create;



  try
    frmENArresterTypeEdit:=TfrmENArresterTypeEdit.Create(Application, dsInsert);
    try
      if frmENArresterTypeEdit.ShowModal = mrOk then
      begin
        if ENArresterTypeObj<>nil then
            //TempENArresterType.add(ENArresterTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENArresterTypeEdit.Free;
      frmENArresterTypeEdit:=nil;
    end;
  finally
    ENArresterTypeObj.Free;
  end;
end;

procedure TfrmENArresterTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENArresterTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENArresterTypeFilterEdit:=TfrmENArresterTypeFilterEdit.Create(Application, dsInsert);
  try
    ENArresterTypeFilterObj := ENArresterTypeFilter.Create;
    SetNullIntProps(ENArresterTypeFilterObj);
    SetNullXSProps(ENArresterTypeFilterObj);

    if frmENArresterTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENArresterTypeFilter.Create;
      FilterObject := ENArresterTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENArresterTypeFilterEdit.Free;
    frmENArresterTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENArresterTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.