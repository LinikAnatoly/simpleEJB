
unit ShowENAgreementKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENAgreementKindController, AdvObj ;


type
    TfrmENAgreementKindShow = class(TChildForm)  
    HTTPRIOENAgreementKind: THTTPRIO;
    ImageList1: TImageList;
    sgENAgreementKind: TAdvStringGrid;
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
    procedure sgENAgreementKindTopLeftChanged(Sender: TObject);
    procedure sgENAgreementKindDblClick(Sender: TObject);
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
   class function chooseFromList : ENAgreementKindShort; overload; stdcall; static;
 end;


var
  frmENAgreementKindShow: TfrmENAgreementKindShow;
  
  
implementation

uses Main, EditENAgreementKind, EditENAgreementKindFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAgreementKindHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва'
          ,'Користувач, який вніс зміни'
        );
   
class function TfrmENAgreementKindShow.chooseFromList : ENAgreementKindShort;
var
  f1 : ENAgreementKindFilter;
  frmENAgreementKindShow : TfrmENAgreementKindShow;
  selected : ENAgreementKindShort;
begin
  inherited;
     selected := nil;
     f1 := ENAgreementKindFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENAgreementKindShow := TfrmENAgreementKindShow.Create(Application, fmNormal, f1);
       try
          with frmENAgreementKindShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENAgreementKindShort(sgENAgreementKind.Objects[0, sgENAgreementKind.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENAgreementKindShow.Free;
       end;
end;

procedure TfrmENAgreementKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENAgreementKindShow:=nil;
  inherited;
end;


procedure TfrmENAgreementKindShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENAgreementKindShow.FormShow(Sender: TObject);
var
  TempENAgreementKind: ENAgreementKindControllerSoapPort;
  i: Integer;
  ENAgreementKindList: ENAgreementKindShortList;
begin
  SetGridHeaders(ENAgreementKindHeaders, sgENAgreementKind.ColumnHeaders);
  ColCount:=100;
  TempENAgreementKind :=  HTTPRIOENAgreementKind as ENAgreementKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAgreementKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAgreementKindList := TempENAgreementKind.getScrollableFilteredList(ENAgreementKindFilter(FilterObject),0,ColCount);
  LastCount:=High(ENAgreementKindList.list);

  if LastCount > -1 then
     sgENAgreementKind.RowCount:=LastCount+2
  else
     sgENAgreementKind.RowCount:=2;

   with sgENAgreementKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAgreementKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAgreementKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAgreementKindList.list[i].name;
        Objects[0, i+1] := ENAgreementKindList.list[i];
        Cells[2,i+1] := ENAgreementKindList.list[i].userGen;
        Objects[0, i+1] := ENAgreementKindList.list[i];
        LastRow:=i+1;
        sgENAgreementKind.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENAgreementKind.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENAgreementKind.RowCount > selectedRow then
      sgENAgreementKind.Row := selectedRow
    else
      sgENAgreementKind.Row := sgENAgreementKind.RowCount - 1;
    end
    else
      sgENAgreementKind.Row:=1;   
end;


procedure TfrmENAgreementKindShow.sgENAgreementKindTopLeftChanged(Sender: TObject);
var
  TempENAgreementKind: ENAgreementKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENAgreementKindList: ENAgreementKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAgreementKind.TopRow + sgENAgreementKind.VisibleRowCount) = ColCount
  then
    begin
      TempENAgreementKind :=  HTTPRIOENAgreementKind as ENAgreementKindControllerSoapPort;
      CurrentRow:=sgENAgreementKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAgreementKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAgreementKindList := TempENAgreementKind.getScrollableFilteredList(ENAgreementKindFilter(FilterObject),ColCount-1, 100);


  sgENAgreementKind.RowCount:=sgENAgreementKind.RowCount+100;
  LastCount:=High(ENAgreementKindList.list);
  with sgENAgreementKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAgreementKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAgreementKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAgreementKindList.list[i].name;
        Objects[0, i+CurrentRow] := ENAgreementKindList.list[i];
        Cells[2,i+CurrentRow] := ENAgreementKindList.list[i].userGen;
        Objects[0, i+CurrentRow] := ENAgreementKindList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAgreementKind.Row:=CurrentRow-5;
   sgENAgreementKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAgreementKindShow.sgENAgreementKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAgreementKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENAgreementKindShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENAgreementKind.RowCount-1 do
   for j:=0 to sgENAgreementKind.ColCount-1 do
     sgENAgreementKind.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENAgreementKindShow.actViewExecute(Sender: TObject);
var 
  TempENAgreementKind: ENAgreementKindControllerSoapPort;
begin
  TempENAgreementKind := HTTPRIOENAgreementKind as ENAgreementKindControllerSoapPort;
  try
    ENAgreementKindObj := TempENAgreementKind.getObject(StrToInt(sgENAgreementKind.Cells[0,sgENAgreementKind.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENAgreementKind.Row;
  frmENAgreementKindEdit:=TfrmENAgreementKindEdit.Create(Application, dsView);
  
  try
    frmENAgreementKindEdit.ShowModal;
  finally
    frmENAgreementKindEdit.Free;
    frmENAgreementKindEdit:=nil;
  end;

  if sgENAgreementKind.RowCount > selectedRow then
    sgENAgreementKind.Row := selectedRow
  else
    sgENAgreementKind.Row := sgENAgreementKind.RowCount - 1;
  
end;


procedure TfrmENAgreementKindShow.actEditExecute(Sender: TObject);
var 
  TempENAgreementKind: ENAgreementKindControllerSoapPort;
begin
  TempENAgreementKind := HTTPRIOENAgreementKind as ENAgreementKindControllerSoapPort;
  try
    ENAgreementKindObj := TempENAgreementKind.getObject(StrToInt(sgENAgreementKind.Cells[0,sgENAgreementKind.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENAgreementKind.Row;
  frmENAgreementKindEdit:=TfrmENAgreementKindEdit.Create(Application, dsEdit);
  
  try
    if frmENAgreementKindEdit.ShowModal= mrOk then
      begin
        //TempENAgreementKind.save(ENAgreementKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAgreementKindEdit.Free;
    frmENAgreementKindEdit:=nil;
  end;

  if sgENAgreementKind.RowCount > selectedRow then
    sgENAgreementKind.Row := selectedRow
  else
    sgENAgreementKind.Row := sgENAgreementKind.RowCount - 1;
  
end;


procedure TfrmENAgreementKindShow.actDeleteExecute(Sender: TObject);
Var TempENAgreementKind: ENAgreementKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAgreementKind := HTTPRIOENAgreementKind as ENAgreementKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAgreementKind.Cells[0,sgENAgreementKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Вид договору)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAgreementKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAgreementKindShow.actInsertExecute(Sender: TObject);
// Var TempENAgreementKind: ENAgreementKindControllerSoapPort; 
begin
  // TempENAgreementKind := HTTPRIOENAgreementKind as ENAgreementKindControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAgreementKindObj:=ENAgreementKind.Create;
  SetNullIntProps(ENAgreementKindObj);
  SetNullXSProps(ENAgreementKindObj);



  try
    frmENAgreementKindEdit:=TfrmENAgreementKindEdit.Create(Application, dsInsert);
    try
      if frmENAgreementKindEdit.ShowModal = mrOk then
      begin
        if ENAgreementKindObj<>nil then
            //TempENAgreementKind.add(ENAgreementKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAgreementKindEdit.Free;
      frmENAgreementKindEdit:=nil;
    end;
  finally
    ENAgreementKindObj.Free;
  end;
end;


procedure TfrmENAgreementKindShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENAgreementKindShow.actFilterExecute(Sender: TObject);
begin
{frmENAgreementKindFilterEdit:=TfrmENAgreementKindFilterEdit.Create(Application, dsInsert);
  try
    ENAgreementKindFilterObj := ENAgreementKindFilter.Create;
    SetNullIntProps(ENAgreementKindFilterObj);
    SetNullXSProps(ENAgreementKindFilterObj);

    if frmENAgreementKindFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENAgreementKindFilter.Create;
      FilterObject := ENAgreementKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAgreementKindFilterEdit.Free;
    frmENAgreementKindFilterEdit:=nil;
  end;}
end;


procedure TfrmENAgreementKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.