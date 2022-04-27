
unit ShowENSOValuesType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSOValuesTypeController, AdvObj ;


type
    TfrmENSOValuesTypeShow = class(TChildForm)  
    HTTPRIOENSOValuesType: THTTPRIO;
    ImageList1: TImageList;
    sgENSOValuesType: TAdvStringGrid;
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
    procedure sgENSOValuesTypeTopLeftChanged(Sender: TObject);
    procedure sgENSOValuesTypeDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENSOValuesTypeShort; overload; stdcall; static;
 end;

//var
 // ENSOValuesTypeObj: ENSOValuesType;
 // ENSOValuesTypeFilterObj: ENSOValuesTypeFilter;
  
  
implementation

uses Main, EditENSOValuesType, EditENSOValuesTypeFilter;


{$R *.dfm}

var
  frmENSOValuesTypeShow : TfrmENSOValuesTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOValuesTypeHeaders: array [1..6] of String =
        ( 'Код'
          ,'Наименование'
          ,'поле для сортировки'
          , 'Категорія'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );
   
class function TfrmENSOValuesTypeShow.chooseFromList : ENSOValuesTypeShort;
var
  f1 : ENSOValuesTypeFilter;
  frmENSOValuesTypeShow : TfrmENSOValuesTypeShow;
  selected : ENSOValuesTypeShort;
begin
  inherited;
     selected := nil;
     f1 := ENSOValuesTypeFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENSOValuesTypeShow := TfrmENSOValuesTypeShow.Create(Application, fmNormal, f1);
       try
          with frmENSOValuesTypeShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENSOValuesTypeShort(sgENSOValuesType.Objects[0, sgENSOValuesType.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENSOValuesTypeShow.Free;
       end;
end;

procedure TfrmENSOValuesTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSOValuesTypeShow:=nil;
  inherited;
end;


procedure TfrmENSOValuesTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSOValuesTypeShow.FormShow(Sender: TObject);
var
  TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
  i: Integer;
  ENSOValuesTypeList: ENSOValuesTypeShortList;
begin
  SetGridHeaders(ENSOValuesTypeHeaders, sgENSOValuesType.ColumnHeaders);
  ColCount:=100;
  TempENSOValuesType :=  HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOValuesTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOValuesTypeList := TempENSOValuesType.getScrollableFilteredList(ENSOValuesTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSOValuesTypeList.list);

  if LastCount > -1 then
     sgENSOValuesType.RowCount:=LastCount+2
  else
     sgENSOValuesType.RowCount:=2;

   with sgENSOValuesType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOValuesTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOValuesTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOValuesTypeList.list[i].name;
        if ENSOValuesTypeList.list[i].sortField = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENSOValuesTypeList.list[i].sortField);
        Cells[3, i+1] := ENSOValuesTypeList.list[i].categoryRefName;
        Cells[4,i+1] := ENSOValuesTypeList.list[i].userGen;
        if ENSOValuesTypeList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENSOValuesTypeList.list[i].dateEdit);
        Objects[0, i+1] := ENSOValuesTypeList.list[i];
        LastRow:=i+1;
        sgENSOValuesType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSOValuesType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSOValuesType.RowCount > selectedRow then
      sgENSOValuesType.Row := selectedRow
    else
      sgENSOValuesType.Row := sgENSOValuesType.RowCount - 1;
    end
    else
      sgENSOValuesType.Row:=1;   
end;


procedure TfrmENSOValuesTypeShow.sgENSOValuesTypeTopLeftChanged(Sender: TObject);
var
  TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOValuesTypeList: ENSOValuesTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOValuesType.TopRow + sgENSOValuesType.VisibleRowCount) = ColCount
  then
    begin
      TempENSOValuesType :=  HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;
      CurrentRow:=sgENSOValuesType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOValuesTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOValuesTypeList := TempENSOValuesType.getScrollableFilteredList(ENSOValuesTypeFilter(FilterObject),ColCount-1, 100);


  sgENSOValuesType.RowCount:=sgENSOValuesType.RowCount+100;
  LastCount:=High(ENSOValuesTypeList.list);
  with sgENSOValuesType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOValuesTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOValuesTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSOValuesTypeList.list[i].name;
        if ENSOValuesTypeList.list[i].sortField = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENSOValuesTypeList.list[i].sortField);
        Cells[3, i+CurrentRow] := ENSOValuesTypeList.list[i].categoryRefName;
        Cells[4,i+CurrentRow] := ENSOValuesTypeList.list[i].userGen;
        if ENSOValuesTypeList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENSOValuesTypeList.list[i].dateEdit);
        Objects[0, i+CurrentRow] := ENSOValuesTypeList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOValuesType.Row:=CurrentRow-5;
   sgENSOValuesType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOValuesTypeShow.sgENSOValuesTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOValuesType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSOValuesTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSOValuesType.RowCount-1 do
   for j:=0 to sgENSOValuesType.ColCount-1 do
     sgENSOValuesType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSOValuesTypeShow.actViewExecute(Sender: TObject);
var 
  TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
begin
  TempENSOValuesType := HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;
  try
    ENSOValuesTypeObj := TempENSOValuesType.getObject(StrToInt(sgENSOValuesType.Cells[0,sgENSOValuesType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOValuesType.Row;
  frmENSOValuesTypeEdit:=TfrmENSOValuesTypeEdit.Create(Application, dsView);
  
  try
    frmENSOValuesTypeEdit.ShowModal;
  finally
    frmENSOValuesTypeEdit.Free;
    frmENSOValuesTypeEdit:=nil;
  end;

  if sgENSOValuesType.RowCount > selectedRow then
    sgENSOValuesType.Row := selectedRow
  else
    sgENSOValuesType.Row := sgENSOValuesType.RowCount - 1;
  
end;


procedure TfrmENSOValuesTypeShow.actEditExecute(Sender: TObject);
var 
  TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
begin
  TempENSOValuesType := HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;
  try
    ENSOValuesTypeObj := TempENSOValuesType.getObject(StrToInt(sgENSOValuesType.Cells[0,sgENSOValuesType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOValuesType.Row;
  frmENSOValuesTypeEdit:=TfrmENSOValuesTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENSOValuesTypeEdit.ShowModal= mrOk then
      begin
        //TempENSOValuesType.save(ENSOValuesTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOValuesTypeEdit.Free;
    frmENSOValuesTypeEdit:=nil;
  end;

  if sgENSOValuesType.RowCount > selectedRow then
    sgENSOValuesType.Row := selectedRow
  else
    sgENSOValuesType.Row := sgENSOValuesType.RowCount - 1;
  
end;


procedure TfrmENSOValuesTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOValuesType := HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOValuesType.Cells[0,sgENSOValuesType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип значений для ServicesObject) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOValuesType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOValuesTypeShow.actInsertExecute(Sender: TObject);
// Var TempENSOValuesType: ENSOValuesTypeControllerSoapPort; 
begin
  // TempENSOValuesType := HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOValuesTypeObj:=ENSOValuesType.Create;
  SetNullIntProps(ENSOValuesTypeObj);
  SetNullXSProps(ENSOValuesTypeObj);

   //ENSOValuesTypeObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSOValuesTypeEdit:=TfrmENSOValuesTypeEdit.Create(Application, dsInsert);
    try
      if frmENSOValuesTypeEdit.ShowModal = mrOk then
      begin
        if ENSOValuesTypeObj<>nil then
            //TempENSOValuesType.add(ENSOValuesTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOValuesTypeEdit.Free;
      frmENSOValuesTypeEdit:=nil;
    end;
  finally
    ENSOValuesTypeObj.Free;
  end;
end;


procedure TfrmENSOValuesTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSOValuesTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSOValuesTypeFilterEdit:=TfrmENSOValuesTypeFilterEdit.Create(Application, dsInsert);
  try
    ENSOValuesTypeFilterObj := ENSOValuesTypeFilter.Create;
    SetNullIntProps(ENSOValuesTypeFilterObj);
    SetNullXSProps(ENSOValuesTypeFilterObj);

    if frmENSOValuesTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSOValuesTypeFilter.Create;
      FilterObject := ENSOValuesTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOValuesTypeFilterEdit.Free;
    frmENSOValuesTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENSOValuesTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.