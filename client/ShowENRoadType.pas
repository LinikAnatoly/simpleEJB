
unit ShowENRoadType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENRoadTypeController, AdvObj ;


type
  TfrmENRoadTypeShow = class(TChildForm)  
  HTTPRIOENRoadType: THTTPRIO;
    ImageList1: TImageList;
    sgENRoadType: TAdvStringGrid;
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
procedure sgENRoadTypeTopLeftChanged(Sender: TObject);
procedure sgENRoadTypeDblClick(Sender: TObject);
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
 frmENRoadTypeShow : TfrmENRoadTypeShow;
 // ENRoadTypeObj: ENRoadType;
 // ENRoadTypeFilterObj: ENRoadTypeFilter;
  
  
implementation

uses Main, EditENRoadType, EditENRoadTypeFilter;


{$R *.dfm}

var
  //frmENRoadTypeShow : TfrmENRoadTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRoadTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип дороги'
        );
   

procedure TfrmENRoadTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENRoadTypeShow:=nil;
    inherited;
  end;


procedure TfrmENRoadTypeShow.FormShow(Sender: TObject);
var
  TempENRoadType: ENRoadTypeControllerSoapPort;
  i: Integer;
  ENRoadTypeList: ENRoadTypeShortList;
  begin
  SetGridHeaders(ENRoadTypeHeaders, sgENRoadType.ColumnHeaders);
  ColCount:=100;
  TempENRoadType :=  HTTPRIOENRoadType as ENRoadTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRoadTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRoadTypeList := TempENRoadType.getScrollableFilteredList(ENRoadTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENRoadTypeList.list);

  if LastCount > -1 then
     sgENRoadType.RowCount:=LastCount+2
  else
     sgENRoadType.RowCount:=2;

   with sgENRoadType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRoadTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRoadTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRoadTypeList.list[i].name;
        LastRow:=i+1;
        sgENRoadType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENRoadType.Row:=1;
end;

procedure TfrmENRoadTypeShow.sgENRoadTypeTopLeftChanged(Sender: TObject);
var
  TempENRoadType: ENRoadTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENRoadTypeList: ENRoadTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRoadType.TopRow + sgENRoadType.VisibleRowCount) = ColCount
  then
    begin
      TempENRoadType :=  HTTPRIOENRoadType as ENRoadTypeControllerSoapPort;
      CurrentRow:=sgENRoadType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRoadTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRoadTypeList := TempENRoadType.getScrollableFilteredList(ENRoadTypeFilter(FilterObject),ColCount-1, 100);



  sgENRoadType.RowCount:=sgENRoadType.RowCount+100;
  LastCount:=High(ENRoadTypeList.list);
  with sgENRoadType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRoadTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRoadTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRoadTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRoadType.Row:=CurrentRow-5;
   sgENRoadType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRoadTypeShow.sgENRoadTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRoadType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENRoadTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENRoadType.RowCount-1 do
   for j:=0 to sgENRoadType.ColCount-1 do
     sgENRoadType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENRoadTypeShow.actViewExecute(Sender: TObject);
Var TempENRoadType: ENRoadTypeControllerSoapPort;
begin
 TempENRoadType := HTTPRIOENRoadType as ENRoadTypeControllerSoapPort;
   try
     ENRoadTypeObj := TempENRoadType.getObject(StrToInt(sgENRoadType.Cells[0,sgENRoadType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRoadTypeEdit:=TfrmENRoadTypeEdit.Create(Application, dsView);
  try
    frmENRoadTypeEdit.ShowModal;
  finally
    frmENRoadTypeEdit.Free;
    frmENRoadTypeEdit:=nil;
  end;
end;

procedure TfrmENRoadTypeShow.actEditExecute(Sender: TObject);
Var TempENRoadType: ENRoadTypeControllerSoapPort;
begin
 TempENRoadType := HTTPRIOENRoadType as ENRoadTypeControllerSoapPort;
   try
     ENRoadTypeObj := TempENRoadType.getObject(StrToInt(sgENRoadType.Cells[0,sgENRoadType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRoadTypeEdit:=TfrmENRoadTypeEdit.Create(Application, dsEdit);
  try
    if frmENRoadTypeEdit.ShowModal= mrOk then
      begin
        //TempENRoadType.save(ENRoadTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRoadTypeEdit.Free;
    frmENRoadTypeEdit:=nil;
  end;
end;

procedure TfrmENRoadTypeShow.actDeleteExecute(Sender: TObject);
Var TempENRoadType: ENRoadTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRoadType := HTTPRIOENRoadType as ENRoadTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRoadType.Cells[0,sgENRoadType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип дороги) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRoadType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRoadTypeShow.actInsertExecute(Sender: TObject);
Var TempENRoadType: ENRoadTypeControllerSoapPort;
begin
  TempENRoadType := HTTPRIOENRoadType as ENRoadTypeControllerSoapPort;
  ENRoadTypeObj:=ENRoadType.Create;



  try
    frmENRoadTypeEdit:=TfrmENRoadTypeEdit.Create(Application, dsInsert);
    try
      if frmENRoadTypeEdit.ShowModal = mrOk then
      begin
        if ENRoadTypeObj<>nil then
            //TempENRoadType.add(ENRoadTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRoadTypeEdit.Free;
      frmENRoadTypeEdit:=nil;
    end;
  finally
    ENRoadTypeObj.Free;
  end;
end;

procedure TfrmENRoadTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENRoadTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENRoadTypeFilterEdit:=TfrmENRoadTypeFilterEdit.Create(Application, dsEdit);
  try
    ENRoadTypeFilterObj := ENRoadTypeFilter.Create;
    SetNullIntProps(ENRoadTypeFilterObj);
    SetNullXSProps(ENRoadTypeFilterObj);

    if frmENRoadTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENRoadTypeFilter.Create;
      FilterObject := ENRoadTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRoadTypeFilterEdit.Free;
    frmENRoadTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENRoadTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.