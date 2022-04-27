
unit ShowENServFromSideStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENServFromSideStatusController, AdvObj ;


type
    TfrmENServFromSideStatusShow = class(TChildForm)  
    HTTPRIOENServFromSideStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENServFromSideStatus: TAdvStringGrid;
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
    procedure sgENServFromSideStatusTopLeftChanged(Sender: TObject);
    procedure sgENServFromSideStatusDblClick(Sender: TObject);
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
   class function chooseFromList : ENServFromSideStatusShort; stdcall; static;
 end;


var
  frmENServFromSideStatusShow: TfrmENServFromSideStatusShow;
  
  
implementation

uses Main, EditENServFromSideStatus, EditENServFromSideStatusFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServFromSideStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування статусу договору'
        );
   
class function TfrmENServFromSideStatusShow.chooseFromList : ENServFromSideStatusShort;
var
  f1 : ENServFromSideStatusFilter;
  frmENServFromSideStatusShow : TfrmENServFromSideStatusShow;
  selected : ENServFromSideStatusShort;
begin
  inherited;
     selected := nil;
     f1 := ENServFromSideStatusFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENServFromSideStatusShow := TfrmENServFromSideStatusShow.Create(Application, fmNormal, f1);
       try
          with frmENServFromSideStatusShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENServFromSideStatusShort(sgENServFromSideStatus.Objects[0, sgENServFromSideStatus.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENServFromSideStatusShow.Free;
       end;
end;

procedure TfrmENServFromSideStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENServFromSideStatusShow:=nil;
  inherited;
end;


procedure TfrmENServFromSideStatusShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENServFromSideStatusShow.FormShow(Sender: TObject);
var
  TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort;
  i: Integer;
  ENServFromSideStatusList: ENServFromSideStatusShortList;
begin
  SetGridHeaders(ENServFromSideStatusHeaders, sgENServFromSideStatus.ColumnHeaders);
  ColCount:=100;
  TempENServFromSideStatus :=  HTTPRIOENServFromSideStatus as ENServFromSideStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServFromSideStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServFromSideStatusList := TempENServFromSideStatus.getScrollableFilteredList(ENServFromSideStatusFilter(FilterObject),0,ColCount);
  LastCount:=High(ENServFromSideStatusList.list);

  if LastCount > -1 then
     sgENServFromSideStatus.RowCount:=LastCount+2
  else
     sgENServFromSideStatus.RowCount:=2;

   with sgENServFromSideStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServFromSideStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServFromSideStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENServFromSideStatusList.list[i].name;
        Objects[0, i+1] := ENServFromSideStatusList.list[i];
        LastRow:=i+1;
        sgENServFromSideStatus.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENServFromSideStatus.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENServFromSideStatus.RowCount > selectedRow then
      sgENServFromSideStatus.Row := selectedRow
    else
      sgENServFromSideStatus.Row := sgENServFromSideStatus.RowCount - 1;
    end
    else
      sgENServFromSideStatus.Row:=1;   
end;


procedure TfrmENServFromSideStatusShow.sgENServFromSideStatusTopLeftChanged(Sender: TObject);
var
  TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENServFromSideStatusList: ENServFromSideStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServFromSideStatus.TopRow + sgENServFromSideStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENServFromSideStatus :=  HTTPRIOENServFromSideStatus as ENServFromSideStatusControllerSoapPort;
      CurrentRow:=sgENServFromSideStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServFromSideStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServFromSideStatusList := TempENServFromSideStatus.getScrollableFilteredList(ENServFromSideStatusFilter(FilterObject),ColCount-1, 100);


  sgENServFromSideStatus.RowCount:=sgENServFromSideStatus.RowCount+100;
  LastCount:=High(ENServFromSideStatusList.list);
  with sgENServFromSideStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServFromSideStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServFromSideStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENServFromSideStatusList.list[i].name;
        Objects[0, i+CurrentRow] := ENServFromSideStatusList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServFromSideStatus.Row:=CurrentRow-5;
   sgENServFromSideStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServFromSideStatusShow.sgENServFromSideStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServFromSideStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENServFromSideStatusShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENServFromSideStatus.RowCount-1 do
   for j:=0 to sgENServFromSideStatus.ColCount-1 do
     sgENServFromSideStatus.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENServFromSideStatusShow.actViewExecute(Sender: TObject);
var 
  TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort;
begin
  TempENServFromSideStatus := HTTPRIOENServFromSideStatus as ENServFromSideStatusControllerSoapPort;
  try
    ENServFromSideStatusObj := TempENServFromSideStatus.getObject(StrToInt(sgENServFromSideStatus.Cells[0, sgENServFromSideStatus.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENServFromSideStatusEdit := TfrmENServFromSideStatusEdit.Create(Application, dsView);
  try
    frmENServFromSideStatusEdit.ShowModal;
  finally
    frmENServFromSideStatusEdit.Free;
    frmENServFromSideStatusEdit := nil;
  end;
end;


procedure TfrmENServFromSideStatusShow.actEditExecute(Sender: TObject);
var 
  TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort;
begin
  TempENServFromSideStatus := HTTPRIOENServFromSideStatus as ENServFromSideStatusControllerSoapPort;
  try
    ENServFromSideStatusObj := TempENServFromSideStatus.getObject(StrToInt(sgENServFromSideStatus.Cells[0,sgENServFromSideStatus.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENServFromSideStatus.Row;
  frmENServFromSideStatusEdit:=TfrmENServFromSideStatusEdit.Create(Application, dsEdit);
  
  try
    if frmENServFromSideStatusEdit.ShowModal= mrOk then
      begin
        //TempENServFromSideStatus.save(ENServFromSideStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServFromSideStatusEdit.Free;
    frmENServFromSideStatusEdit:=nil;
  end;

  if sgENServFromSideStatus.RowCount > selectedRow then
    sgENServFromSideStatus.Row := selectedRow
  else
    sgENServFromSideStatus.Row := sgENServFromSideStatus.RowCount - 1;
  
end;


procedure TfrmENServFromSideStatusShow.actDeleteExecute(Sender: TObject);
Var TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServFromSideStatus := HTTPRIOENServFromSideStatus as ENServFromSideStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServFromSideStatus.Cells[0,sgENServFromSideStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Статус об"єкту (договору) - сторонні послуги)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServFromSideStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENServFromSideStatusShow.actInsertExecute(Sender: TObject);
// Var TempENServFromSideStatus: ENServFromSideStatusControllerSoapPort; 
begin
  // TempENServFromSideStatus := HTTPRIOENServFromSideStatus as ENServFromSideStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENServFromSideStatusObj:=ENServFromSideStatus.Create;
  SetNullIntProps(ENServFromSideStatusObj);
  SetNullXSProps(ENServFromSideStatusObj);



  try
    frmENServFromSideStatusEdit:=TfrmENServFromSideStatusEdit.Create(Application, dsInsert);
    try
      if frmENServFromSideStatusEdit.ShowModal = mrOk then
      begin
        if ENServFromSideStatusObj<>nil then
            //TempENServFromSideStatus.add(ENServFromSideStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServFromSideStatusEdit.Free;
      frmENServFromSideStatusEdit:=nil;
    end;
  finally
    ENServFromSideStatusObj.Free;
  end;
end;


procedure TfrmENServFromSideStatusShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENServFromSideStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENServFromSideStatusFilterEdit:=TfrmENServFromSideStatusFilterEdit.Create(Application, dsInsert);
  try
    ENServFromSideStatusFilterObj := ENServFromSideStatusFilter.Create;
    SetNullIntProps(ENServFromSideStatusFilterObj);
    SetNullXSProps(ENServFromSideStatusFilterObj);

    if frmENServFromSideStatusFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENServFromSideStatusFilter.Create;
      FilterObject := ENServFromSideStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServFromSideStatusFilterEdit.Free;
    frmENServFromSideStatusFilterEdit:=nil;
  end;}
end;


procedure TfrmENServFromSideStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.