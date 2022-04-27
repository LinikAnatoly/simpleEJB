
unit ShowENSheets4SOItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSheets4SOController, AdvObj ;


type
    TfrmENSheets4SOItemsShow = class(TChildForm)  
    HTTPRIOENSheets4SOItems: THTTPRIO;
    ImageList1: TImageList;
    sgENSheets4SOItems: TAdvStringGrid;
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
    procedure sgENSheets4SOItemsTopLeftChanged(Sender: TObject);
    procedure sgENSheets4SOItemsDblClick(Sender: TObject);
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
   class function chooseFromList : ENSheets4SOItemsShort; stdcall; static;
 end;


var
  frmENSheets4SOItemsShow: TfrmENSheets4SOItemsShow;
  
  
implementation

uses Main, EditENSheets4SOItems, EditENSheets4SOItemsFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSheets4SOItemsHeaders: array [1..3] of String =
        ( 'Код'
          ,'зміст пункту'
          ,'доповнення до пункту'
        );
   
class function TfrmENSheets4SOItemsShow.chooseFromList : ENSheets4SOItemsShort;
var
  f1 : ENSheets4SOItemsFilter;
  frmENSheets4SOItemsShow : TfrmENSheets4SOItemsShow;
  selected : ENSheets4SOItemsShort;
begin
  inherited;
     selected := nil;
     f1 := ENSheets4SOItemsFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENSheets4SOItemsShow := TfrmENSheets4SOItemsShow.Create(Application, fmNormal, f1);
       try
          with frmENSheets4SOItemsShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENSheets4SOItemsShort(sgENSheets4SOItems.Objects[0, sgENSheets4SOItems.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENSheets4SOItemsShow.Free;
       end;
end;

procedure TfrmENSheets4SOItemsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSheets4SOItemsShow:=nil;
  inherited;
end;


procedure TfrmENSheets4SOItemsShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSheets4SOItemsShow.FormShow(Sender: TObject);
var
  TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
  i: Integer;
  ENSheets4SOItemsList: ENSheets4SOItemsShortList;
begin
  SetGridHeaders(ENSheets4SOItemsHeaders, sgENSheets4SOItems.ColumnHeaders);
  ColCount:=100;
  TempENSheets4SOItems :=  HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOItemsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOItemsList := TempENSheets4SOItems.getScrollableFilteredList(ENSheets4SOItemsFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSheets4SOItemsList.list);

  if LastCount > -1 then
     sgENSheets4SOItems.RowCount:=LastCount+2
  else
     sgENSheets4SOItems.RowCount:=2;

   with sgENSheets4SOItems do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSheets4SOItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSheets4SOItemsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSheets4SOItemsList.list[i].contentValue;
        Objects[0, i+1] := ENSheets4SOItemsList.list[i];
        Cells[2,i+1] := ENSheets4SOItemsList.list[i].additionalContent;
        Objects[0, i+1] := ENSheets4SOItemsList.list[i];
        LastRow:=i+1;
        sgENSheets4SOItems.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSheets4SOItems.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSheets4SOItems.RowCount > selectedRow then
      sgENSheets4SOItems.Row := selectedRow
    else
      sgENSheets4SOItems.Row := sgENSheets4SOItems.RowCount - 1;
    end
    else
      sgENSheets4SOItems.Row:=1;   
end;


procedure TfrmENSheets4SOItemsShow.sgENSheets4SOItemsTopLeftChanged(Sender: TObject);
var
  TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
  i,CurrentRow: Integer;
  ENSheets4SOItemsList: ENSheets4SOItemsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSheets4SOItems.TopRow + sgENSheets4SOItems.VisibleRowCount) = ColCount
  then
    begin
      TempENSheets4SOItems :=  HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;
      CurrentRow:=sgENSheets4SOItems.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOItemsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOItemsList := TempENSheets4SOItems.getScrollableFilteredList(ENSheets4SOItemsFilter(FilterObject),ColCount-1, 100);


  sgENSheets4SOItems.RowCount:=sgENSheets4SOItems.RowCount+100;
  LastCount:=High(ENSheets4SOItemsList.list);
  with sgENSheets4SOItems do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSheets4SOItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSheets4SOItemsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSheets4SOItemsList.list[i].contentValue;
        Objects[0, i+CurrentRow] := ENSheets4SOItemsList.list[i];
        Cells[2,i+CurrentRow] := ENSheets4SOItemsList.list[i].additionalContent;
        Objects[0, i+CurrentRow] := ENSheets4SOItemsList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSheets4SOItems.Row:=CurrentRow-5;
   sgENSheets4SOItems.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSheets4SOItemsShow.sgENSheets4SOItemsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSheets4SOItems,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSheets4SOItemsShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSheets4SOItems.RowCount-1 do
   for j:=0 to sgENSheets4SOItems.ColCount-1 do
     sgENSheets4SOItems.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSheets4SOItemsShow.actViewExecute(Sender: TObject);
var 
  TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
begin
  TempENSheets4SOItems := HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;
  try
    ENSheets4SOItemsObj := TempENSheets4SOItems.getObject(StrToInt(sgENSheets4SOItems.Cells[0, sgENSheets4SOItems.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSheets4SOItemsEdit := TfrmENSheets4SOItemsEdit.Create(Application, dsView);
  try
    frmENSheets4SOItemsEdit.ShowModal;
  finally
    frmENSheets4SOItemsEdit.Free;
    frmENSheets4SOItemsEdit := nil;
  end;
end;


procedure TfrmENSheets4SOItemsShow.actEditExecute(Sender: TObject);
var 
  TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
begin
  TempENSheets4SOItems := HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;
  try
    ENSheets4SOItemsObj := TempENSheets4SOItems.getObject(StrToInt(sgENSheets4SOItems.Cells[0,sgENSheets4SOItems.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSheets4SOItems.Row;
  frmENSheets4SOItemsEdit:=TfrmENSheets4SOItemsEdit.Create(Application, dsEdit);
  
  try
    if frmENSheets4SOItemsEdit.ShowModal= mrOk then
      begin
        //TempENSheets4SOItems.save(ENSheets4SOItemsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSheets4SOItemsEdit.Free;
    frmENSheets4SOItemsEdit:=nil;
  end;

  if sgENSheets4SOItems.RowCount > selectedRow then
    sgENSheets4SOItems.Row := selectedRow
  else
    sgENSheets4SOItems.Row := sgENSheets4SOItems.RowCount - 1;
  
end;


procedure TfrmENSheets4SOItemsShow.actDeleteExecute(Sender: TObject);
Var TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSheets4SOItems := HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSheets4SOItems.Cells[0,sgENSheets4SOItems.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Пункти для листів для ServicesObject)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSheets4SOItems.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSheets4SOItemsShow.actInsertExecute(Sender: TObject);
// Var TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
begin
  // TempENSheets4SOItems := HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSheets4SOItemsObj:=ENSheets4SOItems.Create;
  SetNullIntProps(ENSheets4SOItemsObj);
  SetNullXSProps(ENSheets4SOItemsObj);



  try
    frmENSheets4SOItemsEdit:=TfrmENSheets4SOItemsEdit.Create(Application, dsInsert);
    try
      if frmENSheets4SOItemsEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOItemsObj<>nil then
            //TempENSheets4SOItems.add(ENSheets4SOItemsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSheets4SOItemsEdit.Free;
      frmENSheets4SOItemsEdit:=nil;
    end;
  finally
    ENSheets4SOItemsObj.Free;
  end;
end;


procedure TfrmENSheets4SOItemsShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSheets4SOItemsShow.actFilterExecute(Sender: TObject);
begin
{frmENSheets4SOItemsFilterEdit:=TfrmENSheets4SOItemsFilterEdit.Create(Application, dsInsert);
  try
    ENSheets4SOItemsFilterObj := ENSheets4SOItemsFilter.Create;
    SetNullIntProps(ENSheets4SOItemsFilterObj);
    SetNullXSProps(ENSheets4SOItemsFilterObj);

    if frmENSheets4SOItemsFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSheets4SOItemsFilter.Create;
      FilterObject := ENSheets4SOItemsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSheets4SOItemsFilterEdit.Free;
    frmENSheets4SOItemsFilterEdit:=nil;
  end;}
end;


procedure TfrmENSheets4SOItemsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.