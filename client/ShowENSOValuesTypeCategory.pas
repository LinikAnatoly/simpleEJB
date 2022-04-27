
unit ShowENSOValuesTypeCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSOValuesTypeCategoryController, AdvObj ;


type
    TfrmENSOValuesTypeCategoryShow = class(TChildForm)  
    HTTPRIOENSOValuesTypeCategory: THTTPRIO;
    ImageList1: TImageList;
    sgENSOValuesTypeCategory: TAdvStringGrid;
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
    procedure sgENSOValuesTypeCategoryTopLeftChanged(Sender: TObject);
    procedure sgENSOValuesTypeCategoryDblClick(Sender: TObject);
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
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENSOValuesTypeCategoryShort; overload; stdcall; static;
 end;


var
  frmENSOValuesTypeCategoryShow: TfrmENSOValuesTypeCategoryShow;
  
  
implementation

uses Main, EditENSOValuesTypeCategory, EditENSOValuesTypeCategoryFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSOValuesTypeCategoryHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   
class function TfrmENSOValuesTypeCategoryShow.chooseFromList : ENSOValuesTypeCategoryShort;
var
  f1 : ENSOValuesTypeCategoryFilter;
  frmENSOValuesTypeCategoryShow : TfrmENSOValuesTypeCategoryShow;
  selected : ENSOValuesTypeCategoryShort;
begin
  inherited;
     selected := nil;
     f1 := ENSOValuesTypeCategoryFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENSOValuesTypeCategoryShow := TfrmENSOValuesTypeCategoryShow.Create(Application, fmNormal, f1);
       try
          with frmENSOValuesTypeCategoryShow do
          begin
            //DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENSOValuesTypeCategoryShort(sgENSOValuesTypeCategory.Objects[0, sgENSOValuesTypeCategory.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENSOValuesTypeCategoryShow.Free;
       end;
end;

procedure TfrmENSOValuesTypeCategoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSOValuesTypeCategoryShow:=nil;
  inherited;
end;


procedure TfrmENSOValuesTypeCategoryShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSOValuesTypeCategoryShow.FormShow(Sender: TObject);
var
  TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort;
  i: Integer;
  ENSOValuesTypeCategoryList: ENSOValuesTypeCategoryShortList;
begin
  SetGridHeaders(ENSOValuesTypeCategoryHeaders, sgENSOValuesTypeCategory.ColumnHeaders);
  ColCount:=100;
  TempENSOValuesTypeCategory :=  HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSOValuesTypeCategoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOValuesTypeCategoryList := TempENSOValuesTypeCategory.getScrollableFilteredList(ENSOValuesTypeCategoryFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSOValuesTypeCategoryList.list);

  if LastCount > -1 then
     sgENSOValuesTypeCategory.RowCount:=LastCount+2
  else
     sgENSOValuesTypeCategory.RowCount:=2;

   with sgENSOValuesTypeCategory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOValuesTypeCategoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSOValuesTypeCategoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSOValuesTypeCategoryList.list[i].name;
        Objects[0, i+1] := ENSOValuesTypeCategoryList.list[i];
        LastRow:=i+1;
        sgENSOValuesTypeCategory.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSOValuesTypeCategory.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSOValuesTypeCategory.RowCount > selectedRow then
      sgENSOValuesTypeCategory.Row := selectedRow
    else
      sgENSOValuesTypeCategory.Row := sgENSOValuesTypeCategory.RowCount - 1;
    end
    else
      sgENSOValuesTypeCategory.Row:=1;   
end;


procedure TfrmENSOValuesTypeCategoryShow.sgENSOValuesTypeCategoryTopLeftChanged(Sender: TObject);
var
  TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENSOValuesTypeCategoryList: ENSOValuesTypeCategoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSOValuesTypeCategory.TopRow + sgENSOValuesTypeCategory.VisibleRowCount) = ColCount
  then
    begin
      TempENSOValuesTypeCategory :=  HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;
      CurrentRow:=sgENSOValuesTypeCategory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSOValuesTypeCategoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSOValuesTypeCategoryList := TempENSOValuesTypeCategory.getScrollableFilteredList(ENSOValuesTypeCategoryFilter(FilterObject),ColCount-1, 100);


  sgENSOValuesTypeCategory.RowCount:=sgENSOValuesTypeCategory.RowCount+100;
  LastCount:=High(ENSOValuesTypeCategoryList.list);
  with sgENSOValuesTypeCategory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSOValuesTypeCategoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSOValuesTypeCategoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSOValuesTypeCategoryList.list[i].name;
        Objects[0, i+CurrentRow] := ENSOValuesTypeCategoryList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSOValuesTypeCategory.Row:=CurrentRow-5;
   sgENSOValuesTypeCategory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSOValuesTypeCategoryShow.sgENSOValuesTypeCategoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSOValuesTypeCategory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSOValuesTypeCategoryShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSOValuesTypeCategory.RowCount-1 do
   for j:=0 to sgENSOValuesTypeCategory.ColCount-1 do
     sgENSOValuesTypeCategory.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSOValuesTypeCategoryShow.actViewExecute(Sender: TObject);
var 
  TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort;
begin
  TempENSOValuesTypeCategory := HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;
  try
    ENSOValuesTypeCategoryObj := TempENSOValuesTypeCategory.getObject(StrToInt(sgENSOValuesTypeCategory.Cells[0,sgENSOValuesTypeCategory.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOValuesTypeCategory.Row;
  frmENSOValuesTypeCategoryEdit:=TfrmENSOValuesTypeCategoryEdit.Create(Application, dsView);
  
  try
    frmENSOValuesTypeCategoryEdit.ShowModal;
  finally
    frmENSOValuesTypeCategoryEdit.Free;
    frmENSOValuesTypeCategoryEdit:=nil;
  end;

  if sgENSOValuesTypeCategory.RowCount > selectedRow then
    sgENSOValuesTypeCategory.Row := selectedRow
  else
    sgENSOValuesTypeCategory.Row := sgENSOValuesTypeCategory.RowCount - 1;
  
end;


procedure TfrmENSOValuesTypeCategoryShow.actEditExecute(Sender: TObject);
var 
  TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort;
begin
  TempENSOValuesTypeCategory := HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;
  try
    ENSOValuesTypeCategoryObj := TempENSOValuesTypeCategory.getObject(StrToInt(sgENSOValuesTypeCategory.Cells[0,sgENSOValuesTypeCategory.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSOValuesTypeCategory.Row;
  frmENSOValuesTypeCategoryEdit:=TfrmENSOValuesTypeCategoryEdit.Create(Application, dsEdit);
  
  try
    if frmENSOValuesTypeCategoryEdit.ShowModal= mrOk then
      begin
        //TempENSOValuesTypeCategory.save(ENSOValuesTypeCategoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSOValuesTypeCategoryEdit.Free;
    frmENSOValuesTypeCategoryEdit:=nil;
  end;

  if sgENSOValuesTypeCategory.RowCount > selectedRow then
    sgENSOValuesTypeCategory.Row := selectedRow
  else
    sgENSOValuesTypeCategory.Row := sgENSOValuesTypeCategory.RowCount - 1;
  
end;


procedure TfrmENSOValuesTypeCategoryShow.actDeleteExecute(Sender: TObject);
Var TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSOValuesTypeCategory := HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSOValuesTypeCategory.Cells[0,sgENSOValuesTypeCategory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Категорії типів додаткових реквізитів)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSOValuesTypeCategory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSOValuesTypeCategoryShow.actInsertExecute(Sender: TObject);
// Var TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort; 
begin
  // TempENSOValuesTypeCategory := HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSOValuesTypeCategoryObj:=ENSOValuesTypeCategory.Create;
  SetNullIntProps(ENSOValuesTypeCategoryObj);
  SetNullXSProps(ENSOValuesTypeCategoryObj);



  try
    frmENSOValuesTypeCategoryEdit:=TfrmENSOValuesTypeCategoryEdit.Create(Application, dsInsert);
    try
      if frmENSOValuesTypeCategoryEdit.ShowModal = mrOk then
      begin
        if ENSOValuesTypeCategoryObj<>nil then
            //TempENSOValuesTypeCategory.add(ENSOValuesTypeCategoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSOValuesTypeCategoryEdit.Free;
      frmENSOValuesTypeCategoryEdit:=nil;
    end;
  finally
    ENSOValuesTypeCategoryObj.Free;
  end;
end;


procedure TfrmENSOValuesTypeCategoryShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSOValuesTypeCategoryShow.actFilterExecute(Sender: TObject);
begin
frmENSOValuesTypeCategoryFilterEdit:=TfrmENSOValuesTypeCategoryFilterEdit.Create(Application, dsInsert);
  try
    ENSOValuesTypeCategoryFilterObj := ENSOValuesTypeCategoryFilter.Create;
    SetNullIntProps(ENSOValuesTypeCategoryFilterObj);
    SetNullXSProps(ENSOValuesTypeCategoryFilterObj);

    if frmENSOValuesTypeCategoryFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSOValuesTypeCategoryFilter.Create;
      FilterObject := ENSOValuesTypeCategoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSOValuesTypeCategoryFilterEdit.Free;
    frmENSOValuesTypeCategoryFilterEdit:=nil;
  end;
end;


procedure TfrmENSOValuesTypeCategoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.