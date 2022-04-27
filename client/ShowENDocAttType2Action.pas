
unit ShowENDocAttType2Action;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENDocAttType2ActionController, AdvObj ;


type
    TfrmENDocAttType2ActionShow = class(TChildForm)  
    HTTPRIOENDocAttType2Action: THTTPRIO;
    ImageList1: TImageList;
    sgENDocAttType2Action: TAdvStringGrid;
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
    procedure sgENDocAttType2ActionTopLeftChanged(Sender: TObject);
    procedure sgENDocAttType2ActionDblClick(Sender: TObject);
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
   class function chooseFromList : ENDocAttType2ActionShort; stdcall; static;
 end;


var
  frmENDocAttType2ActionShow: TfrmENDocAttType2ActionShow;
  
  
implementation

uses Main, EditENDocAttType2Action, EditENDocAttType2ActionFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDocAttType2ActionHeaders: array [1..1] of String =
        ( 'Код'
        );
   
class function TfrmENDocAttType2ActionShow.chooseFromList : ENDocAttType2ActionShort;
var
  f1 : ENDocAttType2ActionFilter;
  frmENDocAttType2ActionShow : TfrmENDocAttType2ActionShow;
  selected : ENDocAttType2ActionShort;
begin
  inherited;
     selected := nil;
     f1 := ENDocAttType2ActionFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENDocAttType2ActionShow := TfrmENDocAttType2ActionShow.Create(Application, fmNormal, f1);
       try
          with frmENDocAttType2ActionShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENDocAttType2ActionShort(sgENDocAttType2Action.Objects[0, sgENDocAttType2Action.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENDocAttType2ActionShow.Free;
       end;
end;

procedure TfrmENDocAttType2ActionShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENDocAttType2ActionShow:=nil;
  inherited;
end;


procedure TfrmENDocAttType2ActionShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENDocAttType2ActionShow.FormShow(Sender: TObject);
var
  TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
  i: Integer;
  ENDocAttType2ActionList: ENDocAttType2ActionShortList;
begin
  SetGridHeaders(ENDocAttType2ActionHeaders, sgENDocAttType2Action.ColumnHeaders);
  ColCount:=100;
  TempENDocAttType2Action :=  HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttType2ActionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttType2ActionList := TempENDocAttType2Action.getScrollableFilteredList(ENDocAttType2ActionFilter(FilterObject),0,ColCount);
  LastCount:=High(ENDocAttType2ActionList.list);

  if LastCount > -1 then
     sgENDocAttType2Action.RowCount:=LastCount+2
  else
     sgENDocAttType2Action.RowCount:=2;

   with sgENDocAttType2Action do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttType2ActionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDocAttType2ActionList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENDocAttType2Action.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENDocAttType2Action.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENDocAttType2Action.RowCount > selectedRow then
      sgENDocAttType2Action.Row := selectedRow
    else
      sgENDocAttType2Action.Row := sgENDocAttType2Action.RowCount - 1;
    end
    else
      sgENDocAttType2Action.Row:=1;   
end;


procedure TfrmENDocAttType2ActionShow.sgENDocAttType2ActionTopLeftChanged(Sender: TObject);
var
  TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
  i,CurrentRow: Integer;
  ENDocAttType2ActionList: ENDocAttType2ActionShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDocAttType2Action.TopRow + sgENDocAttType2Action.VisibleRowCount) = ColCount
  then
    begin
      TempENDocAttType2Action :=  HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;
      CurrentRow:=sgENDocAttType2Action.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttType2ActionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttType2ActionList := TempENDocAttType2Action.getScrollableFilteredList(ENDocAttType2ActionFilter(FilterObject),ColCount-1, 100);


  sgENDocAttType2Action.RowCount:=sgENDocAttType2Action.RowCount+100;
  LastCount:=High(ENDocAttType2ActionList.list);
  with sgENDocAttType2Action do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttType2ActionList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDocAttType2ActionList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDocAttType2Action.Row:=CurrentRow-5;
   sgENDocAttType2Action.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDocAttType2ActionShow.sgENDocAttType2ActionDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDocAttType2Action,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENDocAttType2ActionShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENDocAttType2Action.RowCount-1 do
   for j:=0 to sgENDocAttType2Action.ColCount-1 do
     sgENDocAttType2Action.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENDocAttType2ActionShow.actViewExecute(Sender: TObject);
var 
  TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
begin
  TempENDocAttType2Action := HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;
  try
    ENDocAttType2ActionObj := TempENDocAttType2Action.getObject(StrToInt(sgENDocAttType2Action.Cells[0, sgENDocAttType2Action.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENDocAttType2ActionEdit := TfrmENDocAttType2ActionEdit.Create(Application, dsView);
  try
    frmENDocAttType2ActionEdit.ShowModal;
  finally
    frmENDocAttType2ActionEdit.Free;
    frmENDocAttType2ActionEdit := nil;
  end;
end;


procedure TfrmENDocAttType2ActionShow.actEditExecute(Sender: TObject);
var 
  TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
begin
  TempENDocAttType2Action := HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;
  try
    ENDocAttType2ActionObj := TempENDocAttType2Action.getObject(StrToInt(sgENDocAttType2Action.Cells[0,sgENDocAttType2Action.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDocAttType2Action.Row;
  frmENDocAttType2ActionEdit:=TfrmENDocAttType2ActionEdit.Create(Application, dsEdit);
  
  try
    if frmENDocAttType2ActionEdit.ShowModal= mrOk then
      begin
        //TempENDocAttType2Action.save(ENDocAttType2ActionObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDocAttType2ActionEdit.Free;
    frmENDocAttType2ActionEdit:=nil;
  end;

  if sgENDocAttType2Action.RowCount > selectedRow then
    sgENDocAttType2Action.Row := selectedRow
  else
    sgENDocAttType2Action.Row := sgENDocAttType2Action.RowCount - 1;
  
end;


procedure TfrmENDocAttType2ActionShow.actDeleteExecute(Sender: TObject);
Var TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDocAttType2Action := HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDocAttType2Action.Cells[0,sgENDocAttType2Action.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Звязок типів вкладень з діями)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDocAttType2Action.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDocAttType2ActionShow.actInsertExecute(Sender: TObject);
// Var TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort; 
begin
  // TempENDocAttType2Action := HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDocAttType2ActionObj:=ENDocAttType2Action.Create;
  SetNullIntProps(ENDocAttType2ActionObj);
  SetNullXSProps(ENDocAttType2ActionObj);



  try
    frmENDocAttType2ActionEdit:=TfrmENDocAttType2ActionEdit.Create(Application, dsInsert);
    try
      if frmENDocAttType2ActionEdit.ShowModal = mrOk then
      begin
        if ENDocAttType2ActionObj<>nil then
            //TempENDocAttType2Action.add(ENDocAttType2ActionObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDocAttType2ActionEdit.Free;
      frmENDocAttType2ActionEdit:=nil;
    end;
  finally
    ENDocAttType2ActionObj.Free;
  end;
end;


procedure TfrmENDocAttType2ActionShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENDocAttType2ActionShow.actFilterExecute(Sender: TObject);
begin
{frmENDocAttType2ActionFilterEdit:=TfrmENDocAttType2ActionFilterEdit.Create(Application, dsInsert);
  try
    ENDocAttType2ActionFilterObj := ENDocAttType2ActionFilter.Create;
    SetNullIntProps(ENDocAttType2ActionFilterObj);
    SetNullXSProps(ENDocAttType2ActionFilterObj);

    if frmENDocAttType2ActionFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENDocAttType2ActionFilter.Create;
      FilterObject := ENDocAttType2ActionFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDocAttType2ActionFilterEdit.Free;
    frmENDocAttType2ActionFilterEdit:=nil;
  end;}
end;


procedure TfrmENDocAttType2ActionShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.