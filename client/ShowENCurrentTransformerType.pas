
unit ShowENCurrentTransformerType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCurrentTransformerTypeController, AdvObj ;


type
  TfrmENCurrentTransformerTypeShow = class(TChildForm)  
  HTTPRIOENCurrentTransformerType: THTTPRIO;
    ImageList1: TImageList;
    sgENCurrentTransformerType: TAdvStringGrid;
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
procedure sgENCurrentTransformerTypeTopLeftChanged(Sender: TObject);
procedure sgENCurrentTransformerTypeDblClick(Sender: TObject);
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
 frmENCurrentTransformerTypeShow : TfrmENCurrentTransformerTypeShow;
 // ENCurrentTransformerTypeObj: ENCurrentTransformerType;
 // ENCurrentTransformerTypeFilterObj: ENCurrentTransformerTypeFilter;
  
  
implementation

uses Main, EditENCurrentTransformerType, EditENCurrentTransformerTypeFilter;


{$R *.dfm}

var
  //frmENCurrentTransformerTypeShow : TfrmENCurrentTransformerTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCurrentTransformerTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип трансформатора тока'
        );
   

procedure TfrmENCurrentTransformerTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCurrentTransformerTypeShow:=nil;
    inherited;
  end;


procedure TfrmENCurrentTransformerTypeShow.FormShow(Sender: TObject);
var
  TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
  i: Integer;
  ENCurrentTransformerTypeList: ENCurrentTransformerTypeShortList;
  begin
  SetGridHeaders(ENCurrentTransformerTypeHeaders, sgENCurrentTransformerType.ColumnHeaders);
  ColCount:=100;
  TempENCurrentTransformerType :=  HTTPRIOENCurrentTransformerType as ENCurrentTransformerTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCurrentTransformerTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCurrentTransformerTypeList := TempENCurrentTransformerType.getScrollableFilteredList(ENCurrentTransformerTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENCurrentTransformerTypeList.list);

  if LastCount > -1 then
     sgENCurrentTransformerType.RowCount:=LastCount+2
  else
     sgENCurrentTransformerType.RowCount:=2;

   with sgENCurrentTransformerType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCurrentTransformerTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCurrentTransformerTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCurrentTransformerTypeList.list[i].name;
        LastRow:=i+1;
        sgENCurrentTransformerType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCurrentTransformerType.Row:=1;
end;

procedure TfrmENCurrentTransformerTypeShow.sgENCurrentTransformerTypeTopLeftChanged(Sender: TObject);
var
  TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENCurrentTransformerTypeList: ENCurrentTransformerTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCurrentTransformerType.TopRow + sgENCurrentTransformerType.VisibleRowCount) = ColCount
  then
    begin
      TempENCurrentTransformerType :=  HTTPRIOENCurrentTransformerType as ENCurrentTransformerTypeControllerSoapPort;
      CurrentRow:=sgENCurrentTransformerType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCurrentTransformerTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCurrentTransformerTypeList := TempENCurrentTransformerType.getScrollableFilteredList(ENCurrentTransformerTypeFilter(FilterObject),ColCount-1, 100);



  sgENCurrentTransformerType.RowCount:=sgENCurrentTransformerType.RowCount+100;
  LastCount:=High(ENCurrentTransformerTypeList.list);
  with sgENCurrentTransformerType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCurrentTransformerTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCurrentTransformerTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCurrentTransformerTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCurrentTransformerType.Row:=CurrentRow-5;
   sgENCurrentTransformerType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCurrentTransformerTypeShow.sgENCurrentTransformerTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCurrentTransformerType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCurrentTransformerTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCurrentTransformerType.RowCount-1 do
   for j:=0 to sgENCurrentTransformerType.ColCount-1 do
     sgENCurrentTransformerType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCurrentTransformerTypeShow.actViewExecute(Sender: TObject);
Var TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
begin
 TempENCurrentTransformerType := HTTPRIOENCurrentTransformerType as ENCurrentTransformerTypeControllerSoapPort;
   try
     ENCurrentTransformerTypeObj := TempENCurrentTransformerType.getObject(StrToInt(sgENCurrentTransformerType.Cells[0,sgENCurrentTransformerType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCurrentTransformerTypeEdit:=TfrmENCurrentTransformerTypeEdit.Create(Application, dsView);
  try
    frmENCurrentTransformerTypeEdit.ShowModal;
  finally
    frmENCurrentTransformerTypeEdit.Free;
    frmENCurrentTransformerTypeEdit:=nil;
  end;
end;

procedure TfrmENCurrentTransformerTypeShow.actEditExecute(Sender: TObject);
Var TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
begin
 TempENCurrentTransformerType := HTTPRIOENCurrentTransformerType as ENCurrentTransformerTypeControllerSoapPort;
   try
     ENCurrentTransformerTypeObj := TempENCurrentTransformerType.getObject(StrToInt(sgENCurrentTransformerType.Cells[0,sgENCurrentTransformerType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCurrentTransformerTypeEdit:=TfrmENCurrentTransformerTypeEdit.Create(Application, dsEdit);
  try
    if frmENCurrentTransformerTypeEdit.ShowModal= mrOk then
      begin
        //TempENCurrentTransformerType.save(ENCurrentTransformerTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCurrentTransformerTypeEdit.Free;
    frmENCurrentTransformerTypeEdit:=nil;
  end;
end;

procedure TfrmENCurrentTransformerTypeShow.actDeleteExecute(Sender: TObject);
Var TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCurrentTransformerType := HTTPRIOENCurrentTransformerType as ENCurrentTransformerTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCurrentTransformerType.Cells[0,sgENCurrentTransformerType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип трансформатора тока) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCurrentTransformerType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCurrentTransformerTypeShow.actInsertExecute(Sender: TObject);
Var TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
begin
  TempENCurrentTransformerType := HTTPRIOENCurrentTransformerType as ENCurrentTransformerTypeControllerSoapPort;
  ENCurrentTransformerTypeObj:=ENCurrentTransformerType.Create;



  try
    frmENCurrentTransformerTypeEdit:=TfrmENCurrentTransformerTypeEdit.Create(Application, dsInsert);
    try
      if frmENCurrentTransformerTypeEdit.ShowModal = mrOk then
      begin
        if ENCurrentTransformerTypeObj<>nil then
            //TempENCurrentTransformerType.add(ENCurrentTransformerTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCurrentTransformerTypeEdit.Free;
      frmENCurrentTransformerTypeEdit:=nil;
    end;
  finally
    ENCurrentTransformerTypeObj.Free;
  end;
end;

procedure TfrmENCurrentTransformerTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCurrentTransformerTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENCurrentTransformerTypeFilterEdit:=TfrmENCurrentTransformerTypeFilterEdit.Create(Application, dsInsert);
  try
    ENCurrentTransformerTypeFilterObj := ENCurrentTransformerTypeFilter.Create;
    SetNullIntProps(ENCurrentTransformerTypeFilterObj);
    SetNullXSProps(ENCurrentTransformerTypeFilterObj);

    if frmENCurrentTransformerTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCurrentTransformerTypeFilter.Create;
      FilterObject := ENCurrentTransformerTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCurrentTransformerTypeFilterEdit.Free;
    frmENCurrentTransformerTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENCurrentTransformerTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.