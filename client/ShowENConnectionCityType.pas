
unit ShowENConnectionCityType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENConnectionCityTypeController ;


type
    TfrmENConnectionCityTypeShow = class(TChildForm)  
    HTTPRIOENConnectionCityType: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionCityType: TAdvStringGrid;
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
    procedure sgENConnectionCityTypeTopLeftChanged(Sender: TObject);
    procedure sgENConnectionCityTypeDblClick(Sender: TObject);
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
   class function chooseFromList : ENConnectionCityTypeShort; stdcall; static;
 end;


var
  frmENConnectionCityTypeShow: TfrmENConnectionCityTypeShow;
  
  
implementation

uses Main, EditENConnectionCityType, EditENConnectionCityTypeFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionCityTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування типу місцевості приєднання'
        );
   
class function TfrmENConnectionCityTypeShow.chooseFromList : ENConnectionCityTypeShort;
var
  f1 : ENConnectionCityTypeFilter;
  frmENConnectionCityTypeShow : TfrmENConnectionCityTypeShow;
  selected : ENConnectionCityTypeShort;
begin
  inherited;
     selected := nil;
     f1 := ENConnectionCityTypeFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENConnectionCityTypeShow := TfrmENConnectionCityTypeShow.Create(Application, fmNormal, f1);
       try
          with frmENConnectionCityTypeShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENConnectionCityTypeShort(sgENConnectionCityType.Objects[0, sgENConnectionCityType.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENConnectionCityTypeShow.Free;
       end;
end;

procedure TfrmENConnectionCityTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENConnectionCityTypeShow:=nil;
  inherited;
end;


procedure TfrmENConnectionCityTypeShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENConnectionCityTypeShow.FormShow(Sender: TObject);
var
  TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort;
  i: Integer;
  ENConnectionCityTypeList: ENConnectionCityTypeShortList;
begin
  SetGridHeaders(ENConnectionCityTypeHeaders, sgENConnectionCityType.ColumnHeaders);
  ColCount:=100;
  TempENConnectionCityType :=  HTTPRIOENConnectionCityType as ENConnectionCityTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionCityTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionCityTypeList := TempENConnectionCityType.getScrollableFilteredList(ENConnectionCityTypeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENConnectionCityTypeList.list);

  if LastCount > -1 then
     sgENConnectionCityType.RowCount:=LastCount+2
  else
     sgENConnectionCityType.RowCount:=2;

   with sgENConnectionCityType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionCityTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionCityTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionCityTypeList.list[i].name;
        Objects[0, i+1] := ENConnectionCityTypeList.list[i];
        LastRow:=i+1;
        sgENConnectionCityType.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENConnectionCityType.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENConnectionCityType.RowCount > selectedRow then
      sgENConnectionCityType.Row := selectedRow
    else
      sgENConnectionCityType.Row := sgENConnectionCityType.RowCount - 1;
    end
    else
      sgENConnectionCityType.Row:=1;   
end;


procedure TfrmENConnectionCityTypeShow.sgENConnectionCityTypeTopLeftChanged(Sender: TObject);
var
  TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionCityTypeList: ENConnectionCityTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionCityType.TopRow + sgENConnectionCityType.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionCityType :=  HTTPRIOENConnectionCityType as ENConnectionCityTypeControllerSoapPort;
      CurrentRow:=sgENConnectionCityType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionCityTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionCityTypeList := TempENConnectionCityType.getScrollableFilteredList(ENConnectionCityTypeFilter(FilterObject),ColCount-1, 100);


  sgENConnectionCityType.RowCount:=sgENConnectionCityType.RowCount+100;
  LastCount:=High(ENConnectionCityTypeList.list);
  with sgENConnectionCityType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionCityTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionCityTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionCityTypeList.list[i].name;
        Objects[0, i+CurrentRow] := ENConnectionCityTypeList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionCityType.Row:=CurrentRow-5;
   sgENConnectionCityType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionCityTypeShow.sgENConnectionCityTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionCityType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENConnectionCityTypeShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENConnectionCityType.RowCount-1 do
   for j:=0 to sgENConnectionCityType.ColCount-1 do
     sgENConnectionCityType.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENConnectionCityTypeShow.actViewExecute(Sender: TObject);
var 
  TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort;
begin
  TempENConnectionCityType := HTTPRIOENConnectionCityType as ENConnectionCityTypeControllerSoapPort;
  try
    ENConnectionCityTypeObj := TempENConnectionCityType.getObject(StrToInt(sgENConnectionCityType.Cells[0, sgENConnectionCityType.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENConnectionCityTypeEdit := TfrmENConnectionCityTypeEdit.Create(Application, dsView);
  try
    frmENConnectionCityTypeEdit.ShowModal;
  finally
    frmENConnectionCityTypeEdit.Free;
    frmENConnectionCityTypeEdit := nil;
  end;
end;


procedure TfrmENConnectionCityTypeShow.actEditExecute(Sender: TObject);
var 
  TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort;
begin
  TempENConnectionCityType := HTTPRIOENConnectionCityType as ENConnectionCityTypeControllerSoapPort;
  try
    ENConnectionCityTypeObj := TempENConnectionCityType.getObject(StrToInt(sgENConnectionCityType.Cells[0,sgENConnectionCityType.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENConnectionCityType.Row;
  frmENConnectionCityTypeEdit:=TfrmENConnectionCityTypeEdit.Create(Application, dsEdit);
  
  try
    if frmENConnectionCityTypeEdit.ShowModal= mrOk then
      begin
        //TempENConnectionCityType.save(ENConnectionCityTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionCityTypeEdit.Free;
    frmENConnectionCityTypeEdit:=nil;
  end;

  if sgENConnectionCityType.RowCount > selectedRow then
    sgENConnectionCityType.Row := selectedRow
  else
    sgENConnectionCityType.Row := sgENConnectionCityType.RowCount - 1;
  
end;


procedure TfrmENConnectionCityTypeShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionCityType := HTTPRIOENConnectionCityType as ENConnectionCityTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionCityType.Cells[0,sgENConnectionCityType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Тип місцевості приєднання)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionCityType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionCityTypeShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionCityType: ENConnectionCityTypeControllerSoapPort; 
begin
  // TempENConnectionCityType := HTTPRIOENConnectionCityType as ENConnectionCityTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionCityTypeObj:=ENConnectionCityType.Create;
  SetNullIntProps(ENConnectionCityTypeObj);
  SetNullXSProps(ENConnectionCityTypeObj);



  try
    frmENConnectionCityTypeEdit:=TfrmENConnectionCityTypeEdit.Create(Application, dsInsert);
    try
      if frmENConnectionCityTypeEdit.ShowModal = mrOk then
      begin
        if ENConnectionCityTypeObj<>nil then
            //TempENConnectionCityType.add(ENConnectionCityTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionCityTypeEdit.Free;
      frmENConnectionCityTypeEdit:=nil;
    end;
  finally
    ENConnectionCityTypeObj.Free;
  end;
end;


procedure TfrmENConnectionCityTypeShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionCityTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENConnectionCityTypeFilterEdit:=TfrmENConnectionCityTypeFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionCityTypeFilterObj := ENConnectionCityTypeFilter.Create;
    SetNullIntProps(ENConnectionCityTypeFilterObj);
    SetNullXSProps(ENConnectionCityTypeFilterObj);

    if frmENConnectionCityTypeFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENConnectionCityTypeFilter.Create;
      FilterObject := ENConnectionCityTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionCityTypeFilterEdit.Free;
    frmENConnectionCityTypeFilterEdit:=nil;
  end;}
end;


procedure TfrmENConnectionCityTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.