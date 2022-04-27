
unit ShowENEstimateItemType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENEstimateItemTypeController ;


type
  TfrmENEstimateItemTypeShow = class(TChildForm)  
  HTTPRIOENEstimateItemType: THTTPRIO;
    ImageList1: TImageList;
    sgENEstimateItemType: TAdvStringGrid;
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
procedure sgENEstimateItemTypeTopLeftChanged(Sender: TObject);
procedure sgENEstimateItemTypeDblClick(Sender: TObject);
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
 // ENEstimateItemTypeObj: ENEstimateItemType;
 // ENEstimateItemTypeFilterObj: ENEstimateItemTypeFilter;
  
  
implementation

uses Main, EditENEstimateItemType, EditENEstimateItemTypeFilter;


{$R *.dfm}

var
  //frmENEstimateItemTypeShow : TfrmENEstimateItemTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENEstimateItemTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип строки кошторису'
        );
   

procedure TfrmENEstimateItemTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEstimateItemTypeShow:=nil;
    inherited;
  end;


procedure TfrmENEstimateItemTypeShow.FormShow(Sender: TObject);
var
  TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
  i: Integer;
  ENEstimateItemTypeList: ENEstimateItemTypeShortList;
  begin
  SetGridHeaders(ENEstimateItemTypeHeaders, sgENEstimateItemType.ColumnHeaders);
  ColCount:=100;
  TempENEstimateItemType :=  HTTPRIOENEstimateItemType as ENEstimateItemTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemTypeList := TempENEstimateItemType.getScrollableFilteredList(ENEstimateItemTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENEstimateItemTypeList.list);

  if LastCount > -1 then
     sgENEstimateItemType.RowCount:=LastCount+2
  else
     sgENEstimateItemType.RowCount:=2;

   with sgENEstimateItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENEstimateItemTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENEstimateItemTypeList.list[i].name;
        LastRow:=i+1;
        sgENEstimateItemType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENEstimateItemType.Row:=1;
end;

procedure TfrmENEstimateItemTypeShow.sgENEstimateItemTypeTopLeftChanged(Sender: TObject);
var
  TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENEstimateItemTypeList: ENEstimateItemTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENEstimateItemType.TopRow + sgENEstimateItemType.VisibleRowCount) = ColCount
  then
    begin
      TempENEstimateItemType :=  HTTPRIOENEstimateItemType as ENEstimateItemTypeControllerSoapPort;
      CurrentRow:=sgENEstimateItemType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENEstimateItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEstimateItemTypeList := TempENEstimateItemType.getScrollableFilteredList(ENEstimateItemTypeFilter(FilterObject),ColCount-1, 100);



  sgENEstimateItemType.RowCount:=sgENEstimateItemType.RowCount+100;
  LastCount:=High(ENEstimateItemTypeList.list);
  with sgENEstimateItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEstimateItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENEstimateItemTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENEstimateItemTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENEstimateItemType.Row:=CurrentRow-5;
   sgENEstimateItemType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEstimateItemTypeShow.sgENEstimateItemTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENEstimateItemType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEstimateItemTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENEstimateItemType.RowCount-1 do
   for j:=0 to sgENEstimateItemType.ColCount-1 do
     sgENEstimateItemType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEstimateItemTypeShow.actViewExecute(Sender: TObject);
Var TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
begin
 TempENEstimateItemType := HTTPRIOENEstimateItemType as ENEstimateItemTypeControllerSoapPort;
   try
     ENEstimateItemTypeObj := TempENEstimateItemType.getObject(StrToInt(sgENEstimateItemType.Cells[0,sgENEstimateItemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemTypeEdit:=TfrmENEstimateItemTypeEdit.Create(Application, dsView);
  try
    frmENEstimateItemTypeEdit.ShowModal;
  finally
    frmENEstimateItemTypeEdit.Free;
    frmENEstimateItemTypeEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemTypeShow.actEditExecute(Sender: TObject);
Var TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
begin
 TempENEstimateItemType := HTTPRIOENEstimateItemType as ENEstimateItemTypeControllerSoapPort;
   try
     ENEstimateItemTypeObj := TempENEstimateItemType.getObject(StrToInt(sgENEstimateItemType.Cells[0,sgENEstimateItemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEstimateItemTypeEdit:=TfrmENEstimateItemTypeEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemTypeEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItemType.save(ENEstimateItemTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENEstimateItemTypeEdit.Free;
    frmENEstimateItemTypeEdit:=nil;
  end;
end;

procedure TfrmENEstimateItemTypeShow.actDeleteExecute(Sender: TObject);
Var TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENEstimateItemType := HTTPRIOENEstimateItemType as ENEstimateItemTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENEstimateItemType.Cells[0,sgENEstimateItemType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип строки кошторису(з тех.карти, руками)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENEstimateItemType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEstimateItemTypeShow.actInsertExecute(Sender: TObject);
Var TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
begin
  TempENEstimateItemType := HTTPRIOENEstimateItemType as ENEstimateItemTypeControllerSoapPort;
  ENEstimateItemTypeObj:=ENEstimateItemType.Create;



  try
    frmENEstimateItemTypeEdit:=TfrmENEstimateItemTypeEdit.Create(Application, dsInsert);
    try
      if frmENEstimateItemTypeEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemTypeObj<>nil then
            //TempENEstimateItemType.add(ENEstimateItemTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemTypeEdit.Free;
      frmENEstimateItemTypeEdit:=nil;
    end;
  finally
    ENEstimateItemTypeObj.Free;
  end;
end;

procedure TfrmENEstimateItemTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEstimateItemTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENEstimateItemTypeFilterEdit:=TfrmENEstimateItemTypeFilterEdit.Create(Application, dsEdit);
  try
    if frmENEstimateItemTypeFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENEstimateItemTypeFilter.Create;
      FilterObject := ENEstimateItemTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENEstimateItemTypeFilterEdit.Free;
    frmENEstimateItemTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENEstimateItemTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.