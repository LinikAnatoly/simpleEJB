
unit ShowENTravelSheetItemStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetItemStatusController, AdvObj ;


type
  TfrmENTravelSheetItemStatusShow = class(TChildForm)  
  HTTPRIOENTravelSheetItemStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetItemStatus: TAdvStringGrid;
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
procedure sgENTravelSheetItemStatusTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetItemStatusDblClick(Sender: TObject);
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
 // ENTravelSheetItemStatusObj: ENTravelSheetItemStatus;
 // ENTravelSheetItemStatusFilterObj: ENTravelSheetItemStatusFilter;
  
  
implementation

uses Main, EditENTravelSheetItemStatus, EditENTravelSheetItemStatusFilter;


{$R *.dfm}

var
  //frmENTravelSheetItemStatusShow : TfrmENTravelSheetItemStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetItemStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENTravelSheetItemStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelSheetItemStatusShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetItemStatusShow.FormShow(Sender: TObject);
var
  TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
  i: Integer;
  ENTravelSheetItemStatusList: ENTravelSheetItemStatusShortList;
  begin
  SetGridHeaders(ENTravelSheetItemStatusHeaders, sgENTravelSheetItemStatus.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetItemStatus :=  HTTPRIOENTravelSheetItemStatus as ENTravelSheetItemStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetItemStatusList := TempENTravelSheetItemStatus.getScrollableFilteredList(ENTravelSheetItemStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetItemStatusList.list);

  if LastCount > -1 then
     sgENTravelSheetItemStatus.RowCount:=LastCount+2
  else
     sgENTravelSheetItemStatus.RowCount:=2;

   with sgENTravelSheetItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetItemStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetItemStatusList.list[i].name;
        LastRow:=i+1;
        sgENTravelSheetItemStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetItemStatus.Row:=1;
end;

procedure TfrmENTravelSheetItemStatusShow.sgENTravelSheetItemStatusTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetItemStatusList: ENTravelSheetItemStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetItemStatus.TopRow + sgENTravelSheetItemStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetItemStatus :=  HTTPRIOENTravelSheetItemStatus as ENTravelSheetItemStatusControllerSoapPort;
      CurrentRow:=sgENTravelSheetItemStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetItemStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetItemStatusList := TempENTravelSheetItemStatus.getScrollableFilteredList(ENTravelSheetItemStatusFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetItemStatus.RowCount:=sgENTravelSheetItemStatus.RowCount+100;
  LastCount:=High(ENTravelSheetItemStatusList.list);
  with sgENTravelSheetItemStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetItemStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTravelSheetItemStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetItemStatus.Row:=CurrentRow-5;
   sgENTravelSheetItemStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelSheetItemStatusShow.sgENTravelSheetItemStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetItemStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetItemStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetItemStatus.RowCount-1 do
   for j:=0 to sgENTravelSheetItemStatus.ColCount-1 do
     sgENTravelSheetItemStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetItemStatusShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
begin
 TempENTravelSheetItemStatus := HTTPRIOENTravelSheetItemStatus as ENTravelSheetItemStatusControllerSoapPort;
   try
     ENTravelSheetItemStatusObj := TempENTravelSheetItemStatus.getObject(StrToInt(sgENTravelSheetItemStatus.Cells[0,sgENTravelSheetItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetItemStatusEdit:=TfrmENTravelSheetItemStatusEdit.Create(Application, dsView);
  try
    frmENTravelSheetItemStatusEdit.ShowModal;
  finally
    frmENTravelSheetItemStatusEdit.Free;
    frmENTravelSheetItemStatusEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetItemStatusShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
begin
 TempENTravelSheetItemStatus := HTTPRIOENTravelSheetItemStatus as ENTravelSheetItemStatusControllerSoapPort;
   try
     ENTravelSheetItemStatusObj := TempENTravelSheetItemStatus.getObject(StrToInt(sgENTravelSheetItemStatus.Cells[0,sgENTravelSheetItemStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetItemStatusEdit:=TfrmENTravelSheetItemStatusEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetItemStatusEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetItemStatus.save(ENTravelSheetItemStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetItemStatusEdit.Free;
    frmENTravelSheetItemStatusEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetItemStatusShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetItemStatus := HTTPRIOENTravelSheetItemStatus as ENTravelSheetItemStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetItemStatus.Cells[0,sgENTravelSheetItemStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус строки маршрутного листа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetItemStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelSheetItemStatusShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheetItemStatus: ENTravelSheetItemStatusControllerSoapPort;
begin
  TempENTravelSheetItemStatus := HTTPRIOENTravelSheetItemStatus as ENTravelSheetItemStatusControllerSoapPort;
  ENTravelSheetItemStatusObj:=ENTravelSheetItemStatus.Create;



  try
    frmENTravelSheetItemStatusEdit:=TfrmENTravelSheetItemStatusEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetItemStatusEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetItemStatusObj<>nil then
            //TempENTravelSheetItemStatus.add(ENTravelSheetItemStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetItemStatusEdit.Free;
      frmENTravelSheetItemStatusEdit:=nil;
    end;
  finally
    ENTravelSheetItemStatusObj.Free;
  end;
end;

procedure TfrmENTravelSheetItemStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetItemStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetItemStatusFilterEdit:=TfrmENTravelSheetItemStatusFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetItemStatusFilterObj := ENTravelSheetItemStatusFilter.Create;
    SetNullIntProps(ENTravelSheetItemStatusFilterObj);
    SetNullXSProps(ENTravelSheetItemStatusFilterObj);

    if frmENTravelSheetItemStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetItemStatusFilter.Create;
      FilterObject := ENTravelSheetItemStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetItemStatusFilterEdit.Free;
    frmENTravelSheetItemStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetItemStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.