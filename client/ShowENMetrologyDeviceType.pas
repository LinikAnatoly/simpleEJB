
unit ShowENMetrologyDeviceType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMetrologyDeviceTypeController ;


type
  TfrmENMetrologyDeviceTypeShow = class(TChildForm)  
  HTTPRIOENMetrologyDeviceType: THTTPRIO;
    ImageList1: TImageList;
    sgENMetrologyDeviceType: TAdvStringGrid;
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
procedure sgENMetrologyDeviceTypeTopLeftChanged(Sender: TObject);
procedure sgENMetrologyDeviceTypeDblClick(Sender: TObject);
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
 // ENMetrologyDeviceTypeObj: ENMetrologyDeviceType;
 // ENMetrologyDeviceTypeFilterObj: ENMetrologyDeviceTypeFilter;
  
  
implementation

uses Main, EditENMetrologyDeviceType, EditENMetrologyDeviceTypeFilter;


{$R *.dfm}

var
  //frmENMetrologyDeviceTypeShow : TfrmENMetrologyDeviceTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMetrologyDeviceTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип об''єкту'
        );
   

procedure TfrmENMetrologyDeviceTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMetrologyDeviceTypeShow:=nil;
    inherited;
  end;


procedure TfrmENMetrologyDeviceTypeShow.FormShow(Sender: TObject);
var
  TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
  i: Integer;
  ENMetrologyDeviceTypeList: ENMetrologyDeviceTypeShortList;
  begin
  SetGridHeaders(ENMetrologyDeviceTypeHeaders, sgENMetrologyDeviceType.ColumnHeaders);
  ColCount:=100;
  TempENMetrologyDeviceType :=  HTTPRIOENMetrologyDeviceType as ENMetrologyDeviceTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyDeviceTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMetrologyDeviceTypeList := TempENMetrologyDeviceType.getScrollableFilteredList(ENMetrologyDeviceTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMetrologyDeviceTypeList.list);

  if LastCount > -1 then
     sgENMetrologyDeviceType.RowCount:=LastCount+2
  else
     sgENMetrologyDeviceType.RowCount:=2;

   with sgENMetrologyDeviceType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyDeviceTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMetrologyDeviceTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMetrologyDeviceTypeList.list[i].name;
        LastRow:=i+1;
        sgENMetrologyDeviceType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMetrologyDeviceType.Row:=1;
end;

procedure TfrmENMetrologyDeviceTypeShow.sgENMetrologyDeviceTypeTopLeftChanged(Sender: TObject);
var
  TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENMetrologyDeviceTypeList: ENMetrologyDeviceTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMetrologyDeviceType.TopRow + sgENMetrologyDeviceType.VisibleRowCount) = ColCount
  then
    begin
      TempENMetrologyDeviceType :=  HTTPRIOENMetrologyDeviceType as ENMetrologyDeviceTypeControllerSoapPort;
      CurrentRow:=sgENMetrologyDeviceType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyDeviceTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMetrologyDeviceTypeList := TempENMetrologyDeviceType.getScrollableFilteredList(ENMetrologyDeviceTypeFilter(FilterObject),ColCount-1, 100);



  sgENMetrologyDeviceType.RowCount:=sgENMetrologyDeviceType.RowCount+100;
  LastCount:=High(ENMetrologyDeviceTypeList.list);
  with sgENMetrologyDeviceType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyDeviceTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMetrologyDeviceTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMetrologyDeviceTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMetrologyDeviceType.Row:=CurrentRow-5;
   sgENMetrologyDeviceType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMetrologyDeviceTypeShow.sgENMetrologyDeviceTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMetrologyDeviceType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMetrologyDeviceTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMetrologyDeviceType.RowCount-1 do
   for j:=0 to sgENMetrologyDeviceType.ColCount-1 do
     sgENMetrologyDeviceType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMetrologyDeviceTypeShow.actViewExecute(Sender: TObject);
Var TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
begin
 TempENMetrologyDeviceType := HTTPRIOENMetrologyDeviceType as ENMetrologyDeviceTypeControllerSoapPort;
   try
     ENMetrologyDeviceTypeObj := TempENMetrologyDeviceType.getObject(StrToInt(sgENMetrologyDeviceType.Cells[0,sgENMetrologyDeviceType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyDeviceTypeEdit:=TfrmENMetrologyDeviceTypeEdit.Create(Application, dsView);
  try
    frmENMetrologyDeviceTypeEdit.ShowModal;
  finally
    frmENMetrologyDeviceTypeEdit.Free;
    frmENMetrologyDeviceTypeEdit:=nil;
  end;
end;

procedure TfrmENMetrologyDeviceTypeShow.actEditExecute(Sender: TObject);
Var TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
begin
 TempENMetrologyDeviceType := HTTPRIOENMetrologyDeviceType as ENMetrologyDeviceTypeControllerSoapPort;
   try
     ENMetrologyDeviceTypeObj := TempENMetrologyDeviceType.getObject(StrToInt(sgENMetrologyDeviceType.Cells[0,sgENMetrologyDeviceType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyDeviceTypeEdit:=TfrmENMetrologyDeviceTypeEdit.Create(Application, dsEdit);
  try
    if frmENMetrologyDeviceTypeEdit.ShowModal= mrOk then
      begin
        //TempENMetrologyDeviceType.save(ENMetrologyDeviceTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMetrologyDeviceTypeEdit.Free;
    frmENMetrologyDeviceTypeEdit:=nil;
  end;
end;

procedure TfrmENMetrologyDeviceTypeShow.actDeleteExecute(Sender: TObject);
Var TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMetrologyDeviceType := HTTPRIOENMetrologyDeviceType as ENMetrologyDeviceTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMetrologyDeviceType.Cells[0,sgENMetrologyDeviceType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи обьектів Метрології) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMetrologyDeviceType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMetrologyDeviceTypeShow.actInsertExecute(Sender: TObject);
Var TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
begin
  TempENMetrologyDeviceType := HTTPRIOENMetrologyDeviceType as ENMetrologyDeviceTypeControllerSoapPort;
  ENMetrologyDeviceTypeObj:=ENMetrologyDeviceType.Create;



  try
    frmENMetrologyDeviceTypeEdit:=TfrmENMetrologyDeviceTypeEdit.Create(Application, dsInsert);
    try
      if frmENMetrologyDeviceTypeEdit.ShowModal = mrOk then
      begin
        if ENMetrologyDeviceTypeObj<>nil then
            //TempENMetrologyDeviceType.add(ENMetrologyDeviceTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMetrologyDeviceTypeEdit.Free;
      frmENMetrologyDeviceTypeEdit:=nil;
    end;
  finally
    ENMetrologyDeviceTypeObj.Free;
  end;
end;

procedure TfrmENMetrologyDeviceTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMetrologyDeviceTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENMetrologyDeviceTypeFilterEdit:=TfrmENMetrologyDeviceTypeFilterEdit.Create(Application, dsEdit);
  try
    ENMetrologyDeviceTypeFilterObj := ENMetrologyDeviceTypeFilter.Create;
    SetNullIntProps(ENMetrologyDeviceTypeFilterObj);
    SetNullXSProps(ENMetrologyDeviceTypeFilterObj);

    if frmENMetrologyDeviceTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMetrologyDeviceTypeFilter.Create;
      FilterObject := ENMetrologyDeviceTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMetrologyDeviceTypeFilterEdit.Free;
    frmENMetrologyDeviceTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENMetrologyDeviceTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.