
unit ShowENTransformerType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransformerTypeController, AdvObj ;


type
  TfrmENTransformerTypeShow = class(TChildForm)  
  HTTPRIOENTransformerType: THTTPRIO;
    ImageList1: TImageList;
    sgENTransformerType: TAdvStringGrid;
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
procedure sgENTransformerTypeTopLeftChanged(Sender: TObject);
procedure sgENTransformerTypeDblClick(Sender: TObject);
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
 frmENTransformerTypeShow : TfrmENTransformerTypeShow;
 // ENTransformerTypeObj: ENTransformerType;
 // ENTransformerTypeFilterObj: ENTransformerTypeFilter;
  
  
implementation

uses Main, EditENTransformerType, EditENTransformerTypeFilter
 //,ShowENTransformerType
 ;


{$R *.dfm}

var
  //frmENTransformerTypeShow : TfrmENTransformerTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransformerTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип трансформатора'
        );
   

procedure TfrmENTransformerTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransformerTypeShow:=nil;
    inherited;
  end;


procedure TfrmENTransformerTypeShow.FormShow(Sender: TObject);
var
  TempENTransformerType: ENTransformerTypeControllerSoapPort;
  i: Integer;
  ENTransformerTypeList: ENTransformerTypeShortList;
  begin
  SetGridHeaders(ENTransformerTypeHeaders, sgENTransformerType.ColumnHeaders);
  ColCount:=100;
  TempENTransformerType :=  HTTPRIOENTransformerType as ENTransformerTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransformerTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransformerTypeList := TempENTransformerType.getScrollableFilteredList(ENTransformerTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransformerTypeList.list);

  if LastCount > -1 then
     sgENTransformerType.RowCount:=LastCount+2
  else
     sgENTransformerType.RowCount:=2;

   with sgENTransformerType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransformerTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransformerTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTransformerTypeList.list[i].name;
        LastRow:=i+1;
        sgENTransformerType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransformerType.Row:=1;
end;

procedure TfrmENTransformerTypeShow.sgENTransformerTypeTopLeftChanged(Sender: TObject);
var
  TempENTransformerType: ENTransformerTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransformerTypeList: ENTransformerTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransformerType.TopRow + sgENTransformerType.VisibleRowCount) = ColCount
  then
    begin
      TempENTransformerType :=  HTTPRIOENTransformerType as ENTransformerTypeControllerSoapPort;
      CurrentRow:=sgENTransformerType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransformerTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransformerTypeList := TempENTransformerType.getScrollableFilteredList(ENTransformerTypeFilter(FilterObject),ColCount-1, 100);



  sgENTransformerType.RowCount:=sgENTransformerType.RowCount+100;
  LastCount:=High(ENTransformerTypeList.list);
  with sgENTransformerType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransformerTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransformerTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTransformerTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransformerType.Row:=CurrentRow-5;
   sgENTransformerType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransformerTypeShow.sgENTransformerTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransformerType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransformerTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransformerType.RowCount-1 do
   for j:=0 to sgENTransformerType.ColCount-1 do
     sgENTransformerType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransformerTypeShow.actViewExecute(Sender: TObject);
Var TempENTransformerType: ENTransformerTypeControllerSoapPort;
begin
 TempENTransformerType := HTTPRIOENTransformerType as ENTransformerTypeControllerSoapPort;
   try
     ENTransformerTypeObj := TempENTransformerType.getObject(StrToInt(sgENTransformerType.Cells[0,sgENTransformerType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerTypeEdit:=TfrmENTransformerTypeEdit.Create(Application, dsView);
  try
    frmENTransformerTypeEdit.ShowModal;
  finally
    frmENTransformerTypeEdit.Free;
    frmENTransformerTypeEdit:=nil;
  end;
end;

procedure TfrmENTransformerTypeShow.actEditExecute(Sender: TObject);
Var TempENTransformerType: ENTransformerTypeControllerSoapPort;
begin
 TempENTransformerType := HTTPRIOENTransformerType as ENTransformerTypeControllerSoapPort;
   try
     ENTransformerTypeObj := TempENTransformerType.getObject(StrToInt(sgENTransformerType.Cells[0,sgENTransformerType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerTypeEdit:=TfrmENTransformerTypeEdit.Create(Application, dsEdit);
  try
    if frmENTransformerTypeEdit.ShowModal= mrOk then
      begin
        //TempENTransformerType.save(ENTransformerTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransformerTypeEdit.Free;
    frmENTransformerTypeEdit:=nil;
  end;
end;

procedure TfrmENTransformerTypeShow.actDeleteExecute(Sender: TObject);
Var TempENTransformerType: ENTransformerTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransformerType := HTTPRIOENTransformerType as ENTransformerTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransformerType.Cells[0,sgENTransformerType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип трансформатора) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransformerType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransformerTypeShow.actInsertExecute(Sender: TObject);
Var TempENTransformerType: ENTransformerTypeControllerSoapPort;
begin
  TempENTransformerType := HTTPRIOENTransformerType as ENTransformerTypeControllerSoapPort;
  ENTransformerTypeObj:=ENTransformerType.Create;



  try
    frmENTransformerTypeEdit:=TfrmENTransformerTypeEdit.Create(Application, dsInsert);
    try
      if frmENTransformerTypeEdit.ShowModal = mrOk then
      begin
        if ENTransformerTypeObj<>nil then
            //TempENTransformerType.add(ENTransformerTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransformerTypeEdit.Free;
      frmENTransformerTypeEdit:=nil;
    end;
  finally
    ENTransformerTypeObj.Free;
  end;
end;

procedure TfrmENTransformerTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransformerTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENTransformerTypeFilterEdit:=TfrmENTransformerTypeFilterEdit.Create(Application, dsEdit);
  try
    if frmENTransformerTypeFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENTransformerTypeFilter.Create;
      FilterObject := ENTransformerTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransformerTypeFilterEdit.Free;
    frmENTransformerTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransformerTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.