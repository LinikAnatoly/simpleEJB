
unit ShowENTravelSheetFuelType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetFuelTypeController, AdvObj ;


type
  TfrmENTravelSheetFuelTypeShow = class(TChildForm)  
  HTTPRIOENTravelSheetFuelType: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetFuelType: TAdvStringGrid;
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
procedure sgENTravelSheetFuelTypeTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetFuelTypeDblClick(Sender: TObject);
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
 // ENTravelSheetFuelTypeObj: ENTravelSheetFuelType;
 // ENTravelSheetFuelTypeFilterObj: ENTravelSheetFuelTypeFilter;
  
  
implementation

uses Main; //, EditENTravelSheetFuelType, EditENTravelSheetFuelTypeFilter;


{$R *.dfm}

var
  //frmENTravelSheetFuelTypeShow : TfrmENTravelSheetFuelTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetFuelTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENTravelSheetFuelTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      Self := nil;
    inherited;
  end;


procedure TfrmENTravelSheetFuelTypeShow.FormShow(Sender: TObject);
var
  TempENTravelSheetFuelType: ENTravelSheetFuelTypeControllerSoapPort;
  i: Integer;
  ENTravelSheetFuelTypeList: ENTravelSheetFuelTypeShortList;
  begin
  DisableActions([actView, actUpdate, actInsert, actEdit, actFilter, actNoFilter]);
  SetGridHeaders(ENTravelSheetFuelTypeHeaders, sgENTravelSheetFuelType.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetFuelType :=  HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetFuelTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetFuelTypeList := TempENTravelSheetFuelType.getScrollableFilteredList(ENTravelSheetFuelTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetFuelTypeList.list);

  if LastCount > -1 then
     sgENTravelSheetFuelType.RowCount:=LastCount+2
  else
     sgENTravelSheetFuelType.RowCount:=2;

   with sgENTravelSheetFuelType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetFuelTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetFuelTypeList.list[i].name;
        LastRow:=i+1;
        sgENTravelSheetFuelType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetFuelType.Row:=1;
end;

procedure TfrmENTravelSheetFuelTypeShow.sgENTravelSheetFuelTypeTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetFuelType: ENTravelSheetFuelTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetFuelTypeList: ENTravelSheetFuelTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetFuelType.TopRow + sgENTravelSheetFuelType.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetFuelType :=  HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
      CurrentRow:=sgENTravelSheetFuelType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetFuelTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetFuelTypeList := TempENTravelSheetFuelType.getScrollableFilteredList(ENTravelSheetFuelTypeFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetFuelType.RowCount:=sgENTravelSheetFuelType.RowCount+100;
  LastCount:=High(ENTravelSheetFuelTypeList.list);
  with sgENTravelSheetFuelType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetFuelTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetFuelTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTravelSheetFuelTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetFuelType.Row:=CurrentRow-5;
   sgENTravelSheetFuelType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTravelSheetFuelTypeShow.sgENTravelSheetFuelTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetFuelType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetFuelTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetFuelType.RowCount-1 do
   for j:=0 to sgENTravelSheetFuelType.ColCount-1 do
     sgENTravelSheetFuelType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetFuelTypeShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetFuelType: ENTravelSheetFuelTypeControllerSoapPort;
begin
{ TempENTravelSheetFuelType := HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
   try
     ENTravelSheetFuelTypeObj := TempENTravelSheetFuelType.getObject(StrToInt(sgENTravelSheetFuelType.Cells[0,sgENTravelSheetFuelType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetFuelTypeEdit:=TfrmENTravelSheetFuelTypeEdit.Create(Application, dsView);
  try
    frmENTravelSheetFuelTypeEdit.ShowModal;
  finally
    frmENTravelSheetFuelTypeEdit.Free;
    frmENTravelSheetFuelTypeEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetFuelTypeShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetFuelType: ENTravelSheetFuelTypeControllerSoapPort;
begin
{ TempENTravelSheetFuelType := HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
   try
     ENTravelSheetFuelTypeObj := TempENTravelSheetFuelType.getObject(StrToInt(sgENTravelSheetFuelType.Cells[0,sgENTravelSheetFuelType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetFuelTypeEdit:=TfrmENTravelSheetFuelTypeEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetFuelTypeEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetFuelType.save(ENTravelSheetFuelTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetFuelTypeEdit.Free;
    frmENTravelSheetFuelTypeEdit:=nil;
  end; }
end;

procedure TfrmENTravelSheetFuelTypeShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetFuelType: ENTravelSheetFuelTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetFuelType := HTTPRIOENTravelSheetFuelType as ENTravelSheetFuelTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetFuelType.Cells[0,sgENTravelSheetFuelType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип топлива (Основний и пр.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetFuelType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTravelSheetFuelTypeShow.actInsertExecute(Sender: TObject);
// Var TempENTravelSheetFuelType: ENTravelSheetFuelTypeControllerSoapPort; 
begin
{  ENTravelSheetFuelTypeObj:=ENTravelSheetFuelType.Create;



  try
    frmENTravelSheetFuelTypeEdit:=TfrmENTravelSheetFuelTypeEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetFuelTypeEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetFuelTypeObj<>nil then
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetFuelTypeEdit.Free;
      frmENTravelSheetFuelTypeEdit:=nil;
    end;
  finally
    ENTravelSheetFuelTypeObj.Free;
  end; }
end;

procedure TfrmENTravelSheetFuelTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetFuelTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetFuelTypeFilterEdit:=TfrmENTravelSheetFuelTypeFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetFuelTypeFilterObj := ENTravelSheetFuelTypeFilter.Create;
    SetNullIntProps(ENTravelSheetFuelTypeFilterObj);
    SetNullXSProps(ENTravelSheetFuelTypeFilterObj);

    if frmENTravelSheetFuelTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetFuelTypeFilter.Create;
      FilterObject := ENTravelSheetFuelTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetFuelTypeFilterEdit.Free;
    frmENTravelSheetFuelTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetFuelTypeShow.actNoFilterExecute(Sender: TObject);
begin
{  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);}
end;

end.