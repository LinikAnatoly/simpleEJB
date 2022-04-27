
unit ShowENTravelSheetType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetTypeController ;


type
  TfrmENTravelSheetTypeShow = class(TChildForm)  
  HTTPRIOENTravelSheetType: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetType: TAdvStringGrid;
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
procedure sgENTravelSheetTypeTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetTypeDblClick(Sender: TObject);
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
 // ENTravelSheetTypeObj: ENTravelSheetType;
 // ENTravelSheetTypeFilterObj: ENTravelSheetTypeFilter;
  
  
implementation

uses Main, EditENTravelSheetType, EditENTravelSheetTypeFilter;


{$R *.dfm}

var
  //frmENTravelSheetTypeShow : TfrmENTravelSheetTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENTravelSheetTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelSheetTypeShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetTypeShow.FormShow(Sender: TObject);
var
  TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
  i: Integer;
  ENTravelSheetTypeList: ENTravelSheetTypeShortList;
  begin
  SetGridHeaders(ENTravelSheetTypeHeaders, sgENTravelSheetType.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetType :=  HTTPRIOENTravelSheetType as ENTravelSheetTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetTypeList := TempENTravelSheetType.getScrollableFilteredList(ENTravelSheetTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetTypeList.list);

  if LastCount > -1 then
     sgENTravelSheetType.RowCount:=LastCount+2
  else
     sgENTravelSheetType.RowCount:=2;

   with sgENTravelSheetType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetTypeList.list[i].name;
        LastRow:=i+1;
        sgENTravelSheetType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetType.Row:=1;
end;

procedure TfrmENTravelSheetTypeShow.sgENTravelSheetTypeTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetTypeList: ENTravelSheetTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetType.TopRow + sgENTravelSheetType.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetType :=  HTTPRIOENTravelSheetType as ENTravelSheetTypeControllerSoapPort;
      CurrentRow:=sgENTravelSheetType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetTypeList := TempENTravelSheetType.getScrollableFilteredList(ENTravelSheetTypeFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetType.RowCount:=sgENTravelSheetType.RowCount+100;
  LastCount:=High(ENTravelSheetTypeList.list);
  with sgENTravelSheetType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTravelSheetTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetType.Row:=CurrentRow-5;
   sgENTravelSheetType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelSheetTypeShow.sgENTravelSheetTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetType.RowCount-1 do
   for j:=0 to sgENTravelSheetType.ColCount-1 do
     sgENTravelSheetType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetTypeShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
begin
 TempENTravelSheetType := HTTPRIOENTravelSheetType as ENTravelSheetTypeControllerSoapPort;
   try
     ENTravelSheetTypeObj := TempENTravelSheetType.getObject(StrToInt(sgENTravelSheetType.Cells[0,sgENTravelSheetType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetTypeEdit:=TfrmENTravelSheetTypeEdit.Create(Application, dsView);
  try
    frmENTravelSheetTypeEdit.ShowModal;
  finally
    frmENTravelSheetTypeEdit.Free;
    frmENTravelSheetTypeEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetTypeShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
begin
 TempENTravelSheetType := HTTPRIOENTravelSheetType as ENTravelSheetTypeControllerSoapPort;
   try
     ENTravelSheetTypeObj := TempENTravelSheetType.getObject(StrToInt(sgENTravelSheetType.Cells[0,sgENTravelSheetType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetTypeEdit:=TfrmENTravelSheetTypeEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetTypeEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetType.save(ENTravelSheetTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetTypeEdit.Free;
    frmENTravelSheetTypeEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetTypeShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetType := HTTPRIOENTravelSheetType as ENTravelSheetTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetType.Cells[0,sgENTravelSheetType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи подорожнього листа) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelSheetTypeShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheetType: ENTravelSheetTypeControllerSoapPort;
begin
  TempENTravelSheetType := HTTPRIOENTravelSheetType as ENTravelSheetTypeControllerSoapPort;
  ENTravelSheetTypeObj:=ENTravelSheetType.Create;



  try
    frmENTravelSheetTypeEdit:=TfrmENTravelSheetTypeEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetTypeEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetTypeObj<>nil then
            //TempENTravelSheetType.add(ENTravelSheetTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetTypeEdit.Free;
      frmENTravelSheetTypeEdit:=nil;
    end;
  finally
    ENTravelSheetTypeObj.Free;
  end;
end;

procedure TfrmENTravelSheetTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetTypeFilterEdit:=TfrmENTravelSheetTypeFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetTypeFilterObj := ENTravelSheetTypeFilter.Create;
    SetNullIntProps(ENTravelSheetTypeFilterObj);
    SetNullXSProps(ENTravelSheetTypeFilterObj);

    if frmENTravelSheetTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetTypeFilter.Create;
      FilterObject := ENTravelSheetTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetTypeFilterEdit.Free;
    frmENTravelSheetTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.