
unit ShowENDisconnectInitiator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENDisconnectInitiatorController, AdvObj ;


type
    TfrmENDisconnectInitiatorShow = class(TChildForm)  
    HTTPRIOENDisconnectInitiator: THTTPRIO;
    ImageList1: TImageList;
    sgENDisconnectInitiator: TAdvStringGrid;
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
    procedure sgENDisconnectInitiatorTopLeftChanged(Sender: TObject);
    procedure sgENDisconnectInitiatorDblClick(Sender: TObject);
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
 end;

var
 // ENDisconnectInitiatorObj: ENDisconnectInitiator;
 // ENDisconnectInitiatorFilterObj: ENDisconnectInitiatorFilter;
  frmENDisconnectInitiatorShow : TfrmENDisconnectInitiatorShow;
  
implementation

uses Main, EditENDisconnectInitiator, EditENDisconnectInitiatorFilter;


{$R *.dfm}

var
  //frmENDisconnectInitiatorShow : TfrmENDisconnectInitiatorShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDisconnectInitiatorHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENDisconnectInitiatorShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENDisconnectInitiatorShow:=nil;
  inherited;
end;


procedure TfrmENDisconnectInitiatorShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENDisconnectInitiatorShow.FormShow(Sender: TObject);
var
  TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort;
  i: Integer;
  ENDisconnectInitiatorList: ENDisconnectInitiatorShortList;
begin
  SetGridHeaders(ENDisconnectInitiatorHeaders, sgENDisconnectInitiator.ColumnHeaders);
  ColCount:=100;
  TempENDisconnectInitiator :=  HTTPRIOENDisconnectInitiator as ENDisconnectInitiatorControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDisconnectInitiatorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDisconnectInitiatorList := TempENDisconnectInitiator.getScrollableFilteredList(ENDisconnectInitiatorFilter(FilterObject),0,ColCount);
  LastCount:=High(ENDisconnectInitiatorList.list);

  if LastCount > -1 then
     sgENDisconnectInitiator.RowCount:=LastCount+2
  else
     sgENDisconnectInitiator.RowCount:=2;

   with sgENDisconnectInitiator do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDisconnectInitiatorList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDisconnectInitiatorList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDisconnectInitiatorList.list[i].name;
        LastRow:=i+1;
        sgENDisconnectInitiator.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENDisconnectInitiator.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENDisconnectInitiator.RowCount > selectedRow then
      sgENDisconnectInitiator.Row := selectedRow
    else
      sgENDisconnectInitiator.Row := sgENDisconnectInitiator.RowCount - 1;
    end
    else
      sgENDisconnectInitiator.Row:=1;   
end;


procedure TfrmENDisconnectInitiatorShow.sgENDisconnectInitiatorTopLeftChanged(Sender: TObject);
var
  TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort;
  i,CurrentRow: Integer;
  ENDisconnectInitiatorList: ENDisconnectInitiatorShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDisconnectInitiator.TopRow + sgENDisconnectInitiator.VisibleRowCount) = ColCount
  then
    begin
      TempENDisconnectInitiator :=  HTTPRIOENDisconnectInitiator as ENDisconnectInitiatorControllerSoapPort;
      CurrentRow:=sgENDisconnectInitiator.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDisconnectInitiatorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDisconnectInitiatorList := TempENDisconnectInitiator.getScrollableFilteredList(ENDisconnectInitiatorFilter(FilterObject),ColCount-1, 100);


  sgENDisconnectInitiator.RowCount:=sgENDisconnectInitiator.RowCount+100;
  LastCount:=High(ENDisconnectInitiatorList.list);
  with sgENDisconnectInitiator do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDisconnectInitiatorList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDisconnectInitiatorList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDisconnectInitiatorList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDisconnectInitiator.Row:=CurrentRow-5;
   sgENDisconnectInitiator.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDisconnectInitiatorShow.sgENDisconnectInitiatorDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDisconnectInitiator,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENDisconnectInitiatorShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENDisconnectInitiator.RowCount-1 do
   for j:=0 to sgENDisconnectInitiator.ColCount-1 do
     sgENDisconnectInitiator.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENDisconnectInitiatorShow.actViewExecute(Sender: TObject);
var 
  TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort;
begin
  TempENDisconnectInitiator := HTTPRIOENDisconnectInitiator as ENDisconnectInitiatorControllerSoapPort;
  try
    ENDisconnectInitiatorObj := TempENDisconnectInitiator.getObject(StrToInt(sgENDisconnectInitiator.Cells[0,sgENDisconnectInitiator.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDisconnectInitiator.Row;
  frmENDisconnectInitiatorEdit:=TfrmENDisconnectInitiatorEdit.Create(Application, dsView);
  
  try
    frmENDisconnectInitiatorEdit.ShowModal;
  finally
    frmENDisconnectInitiatorEdit.Free;
    frmENDisconnectInitiatorEdit:=nil;
  end;

  if sgENDisconnectInitiator.RowCount > selectedRow then
    sgENDisconnectInitiator.Row := selectedRow
  else
    sgENDisconnectInitiator.Row := sgENDisconnectInitiator.RowCount - 1;
  
end;


procedure TfrmENDisconnectInitiatorShow.actEditExecute(Sender: TObject);
var 
  TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort;
begin
  TempENDisconnectInitiator := HTTPRIOENDisconnectInitiator as ENDisconnectInitiatorControllerSoapPort;
  try
    ENDisconnectInitiatorObj := TempENDisconnectInitiator.getObject(StrToInt(sgENDisconnectInitiator.Cells[0,sgENDisconnectInitiator.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDisconnectInitiator.Row;
  frmENDisconnectInitiatorEdit:=TfrmENDisconnectInitiatorEdit.Create(Application, dsEdit);
  
  try
    if frmENDisconnectInitiatorEdit.ShowModal= mrOk then
      begin
        //TempENDisconnectInitiator.save(ENDisconnectInitiatorObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDisconnectInitiatorEdit.Free;
    frmENDisconnectInitiatorEdit:=nil;
  end;

  if sgENDisconnectInitiator.RowCount > selectedRow then
    sgENDisconnectInitiator.Row := selectedRow
  else
    sgENDisconnectInitiator.Row := sgENDisconnectInitiator.RowCount - 1;
  
end;


procedure TfrmENDisconnectInitiatorShow.actDeleteExecute(Sender: TObject);
Var TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDisconnectInitiator := HTTPRIOENDisconnectInitiator as ENDisconnectInitiatorControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDisconnectInitiator.Cells[0,sgENDisconnectInitiator.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ініціатор відключення) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDisconnectInitiator.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDisconnectInitiatorShow.actInsertExecute(Sender: TObject);
// Var TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort; 
begin
  // TempENDisconnectInitiator := HTTPRIOENDisconnectInitiator as ENDisconnectInitiatorControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDisconnectInitiatorObj:=ENDisconnectInitiator.Create;
  SetNullIntProps(ENDisconnectInitiatorObj);
  SetNullXSProps(ENDisconnectInitiatorObj);



  try
    frmENDisconnectInitiatorEdit:=TfrmENDisconnectInitiatorEdit.Create(Application, dsInsert);
    try
      if frmENDisconnectInitiatorEdit.ShowModal = mrOk then
      begin
        if ENDisconnectInitiatorObj<>nil then
            //TempENDisconnectInitiator.add(ENDisconnectInitiatorObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDisconnectInitiatorEdit.Free;
      frmENDisconnectInitiatorEdit:=nil;
    end;
  finally
    ENDisconnectInitiatorObj.Free;
  end;
end;


procedure TfrmENDisconnectInitiatorShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENDisconnectInitiatorShow.actFilterExecute(Sender: TObject);
begin
{frmENDisconnectInitiatorFilterEdit:=TfrmENDisconnectInitiatorFilterEdit.Create(Application, dsInsert);
  try
    ENDisconnectInitiatorFilterObj := ENDisconnectInitiatorFilter.Create;
    SetNullIntProps(ENDisconnectInitiatorFilterObj);
    SetNullXSProps(ENDisconnectInitiatorFilterObj);

    if frmENDisconnectInitiatorFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENDisconnectInitiatorFilter.Create;
      FilterObject := ENDisconnectInitiatorFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDisconnectInitiatorFilterEdit.Free;
    frmENDisconnectInitiatorFilterEdit:=nil;
  end;}
end;


procedure TfrmENDisconnectInitiatorShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.