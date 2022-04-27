
unit ShowRQPackingListItemType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPackingListItemTypeController ;


type
  TfrmRQPackingListItemTypeShow = class(TChildForm)  
  HTTPRIORQPackingListItemType: THTTPRIO;
    ImageList1: TImageList;
    sgRQPackingListItemType: TAdvStringGrid;
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
procedure sgRQPackingListItemTypeTopLeftChanged(Sender: TObject);
procedure sgRQPackingListItemTypeDblClick(Sender: TObject);
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
 // RQPackingListItemTypeObj: RQPackingListItemType;
 // RQPackingListItemTypeFilterObj: RQPackingListItemTypeFilter;
  
  
implementation

uses Main, EditRQPackingListItemType, EditRQPackingListItemTypeFilter;


{$R *.dfm}

var
 // frmRQPackingListItemTypeShow : TfrmRQPackingListItemTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPackingListItemTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование типа строки'
        );
   

procedure TfrmRQPackingListItemTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPackingListItemTypeShow:=nil;
    inherited;
  end;


procedure TfrmRQPackingListItemTypeShow.FormShow(Sender: TObject);
var
  TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort;
  i: Integer;
  RQPackingListItemTypeList: RQPackingListItemTypeShortList;
  begin
  SetGridHeaders(RQPackingListItemTypeHeaders, sgRQPackingListItemType.ColumnHeaders);
  ColCount:=100;
  TempRQPackingListItemType :=  HTTPRIORQPackingListItemType as RQPackingListItemTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPackingListItemTypeList := TempRQPackingListItemType.getScrollableFilteredList(RQPackingListItemTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPackingListItemTypeList.list);

  if LastCount > -1 then
     sgRQPackingListItemType.RowCount:=LastCount+2
  else
     sgRQPackingListItemType.RowCount:=2;

   with sgRQPackingListItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPackingListItemTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPackingListItemTypeList.list[i].name;
        LastRow:=i+1;
        sgRQPackingListItemType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPackingListItemType.Row:=1;
end;

procedure TfrmRQPackingListItemTypeShow.sgRQPackingListItemTypeTopLeftChanged(Sender: TObject);
var
  TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQPackingListItemTypeList: RQPackingListItemTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPackingListItemType.TopRow + sgRQPackingListItemType.VisibleRowCount) = ColCount
  then
    begin
      TempRQPackingListItemType :=  HTTPRIORQPackingListItemType as RQPackingListItemTypeControllerSoapPort;
      CurrentRow:=sgRQPackingListItemType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListItemTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPackingListItemTypeList := TempRQPackingListItemType.getScrollableFilteredList(RQPackingListItemTypeFilter(FilterObject),ColCount-1, 100);



  sgRQPackingListItemType.RowCount:=sgRQPackingListItemType.RowCount+100;
  LastCount:=High(RQPackingListItemTypeList.list);
  with sgRQPackingListItemType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListItemTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPackingListItemTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPackingListItemTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPackingListItemType.Row:=CurrentRow-5;
   sgRQPackingListItemType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPackingListItemTypeShow.sgRQPackingListItemTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPackingListItemType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPackingListItemTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPackingListItemType.RowCount-1 do
   for j:=0 to sgRQPackingListItemType.ColCount-1 do
     sgRQPackingListItemType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPackingListItemTypeShow.actViewExecute(Sender: TObject);
Var TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort;
begin
 TempRQPackingListItemType := HTTPRIORQPackingListItemType as RQPackingListItemTypeControllerSoapPort;
   try
     RQPackingListItemTypeObj := TempRQPackingListItemType.getObject(StrToInt(sgRQPackingListItemType.Cells[0,sgRQPackingListItemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListItemTypeEdit:=TfrmRQPackingListItemTypeEdit.Create(Application, dsView);
  try
    frmRQPackingListItemTypeEdit.ShowModal;
  finally
    frmRQPackingListItemTypeEdit.Free;
    frmRQPackingListItemTypeEdit:=nil;
  end;
end;

procedure TfrmRQPackingListItemTypeShow.actEditExecute(Sender: TObject);
Var TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort;
begin
 TempRQPackingListItemType := HTTPRIORQPackingListItemType as RQPackingListItemTypeControllerSoapPort;
   try
     RQPackingListItemTypeObj := TempRQPackingListItemType.getObject(StrToInt(sgRQPackingListItemType.Cells[0,sgRQPackingListItemType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListItemTypeEdit:=TfrmRQPackingListItemTypeEdit.Create(Application, dsEdit);
  try
    if frmRQPackingListItemTypeEdit.ShowModal= mrOk then
      begin
        //TempRQPackingListItemType.save(RQPackingListItemTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPackingListItemTypeEdit.Free;
    frmRQPackingListItemTypeEdit:=nil;
  end;
end;

procedure TfrmRQPackingListItemTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPackingListItemType := HTTPRIORQPackingListItemType as RQPackingListItemTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPackingListItemType.Cells[0,sgRQPackingListItemType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типы строк погрузочной ведомости) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPackingListItemType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPackingListItemTypeShow.actInsertExecute(Sender: TObject);
// Var TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort; 
begin
  // TempRQPackingListItemType := HTTPRIORQPackingListItemType as RQPackingListItemTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPackingListItemTypeObj:=RQPackingListItemType.Create;



  try
    frmRQPackingListItemTypeEdit:=TfrmRQPackingListItemTypeEdit.Create(Application, dsInsert);
    try
      if frmRQPackingListItemTypeEdit.ShowModal = mrOk then
      begin
        if RQPackingListItemTypeObj<>nil then
            //TempRQPackingListItemType.add(RQPackingListItemTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPackingListItemTypeEdit.Free;
      frmRQPackingListItemTypeEdit:=nil;
    end;
  finally
    RQPackingListItemTypeObj.Free;
  end;
end;

procedure TfrmRQPackingListItemTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPackingListItemTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQPackingListItemTypeFilterEdit:=TfrmRQPackingListItemTypeFilterEdit.Create(Application, dsInsert);
  try
    RQPackingListItemTypeFilterObj := RQPackingListItemTypeFilter.Create;
    SetNullIntProps(RQPackingListItemTypeFilterObj);
    SetNullXSProps(RQPackingListItemTypeFilterObj);

    if frmRQPackingListItemTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPackingListItemTypeFilter.Create;
      FilterObject := RQPackingListItemTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPackingListItemTypeFilterEdit.Free;
    frmRQPackingListItemTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPackingListItemTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.