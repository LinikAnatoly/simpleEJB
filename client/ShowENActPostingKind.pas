
unit ShowENActPostingKind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENActPostingKindController ;


type
    TfrmENActPostingKindShow = class(TChildForm)  
    HTTPRIOENActPostingKind: THTTPRIO;
    ImageList1: TImageList;
    sgENActPostingKind: TAdvStringGrid;
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
    procedure sgENActPostingKindTopLeftChanged(Sender: TObject);
    procedure sgENActPostingKindDblClick(Sender: TObject);
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
   class function chooseFromList : ENActPostingKindShort; stdcall; static;
 end;


var
  frmENActPostingKindShow: TfrmENActPostingKindShow;
  
  
implementation

uses Main, EditENActPostingKind, EditENActPostingKindFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActPostingKindHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер шаблону'
          ,'Найменування шаблону'
          ,'Дата з якої застосовується шаблон'
          ,'счет затрат '
          ,'кау затрат '
          ,'счет закрытия '
          ,'кау закрытия  '
          ,'Вид операции материалы(Акты)'
          ,'Вид операции материалы(Ордера)'
          ,'Вид операции счетчики(Акты)'
        );
   
class function TfrmENActPostingKindShow.chooseFromList : ENActPostingKindShort;
var
  f1 : ENActPostingKindFilter;
  frmENActPostingKindShow : TfrmENActPostingKindShow;
  selected : ENActPostingKindShort;
begin
  inherited;
     selected := nil;
     f1 := ENActPostingKindFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENActPostingKindShow := TfrmENActPostingKindShow.Create(Application, fmNormal, f1);
       try
          with frmENActPostingKindShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENActPostingKindShort(sgENActPostingKind.Objects[0, sgENActPostingKind.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENActPostingKindShow.Free;
       end;
end;

procedure TfrmENActPostingKindShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENActPostingKindShow:=nil;
  inherited;
end;


procedure TfrmENActPostingKindShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENActPostingKindShow.FormShow(Sender: TObject);
var
  TempENActPostingKind: ENActPostingKindControllerSoapPort;
  i: Integer;
  ENActPostingKindList: ENActPostingKindShortList;
begin
  SetGridHeaders(ENActPostingKindHeaders, sgENActPostingKind.ColumnHeaders);
  ColCount:=100;
  TempENActPostingKind :=  HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingKindList := TempENActPostingKind.getScrollableFilteredList(ENActPostingKindFilter(FilterObject),0,ColCount);
  LastCount:=High(ENActPostingKindList.list);

  if LastCount > -1 then
     sgENActPostingKind.RowCount:=LastCount+2
  else
     sgENActPostingKind.RowCount:=2;

   with sgENActPostingKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingKindList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActPostingKindList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActPostingKindList.list[i].numberGen;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[2,i+1] := ENActPostingKindList.list[i].name;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        if ENActPostingKindList.list[i].dateTemplate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENActPostingKindList.list[i].dateTemplate);
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[4,i+1] := ENActPostingKindList.list[i].account_expense;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[5,i+1] := ENActPostingKindList.list[i].kau_expense;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[6,i+1] := ENActPostingKindList.list[i].account_closing;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[7,i+1] := ENActPostingKindList.list[i].kau_closing;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[8,i+1] := ENActPostingKindList.list[i].typeOperMatetialsAct;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[9,i+1] := ENActPostingKindList.list[i].typeOperMatetialsOrder;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        Cells[10,i+1] := ENActPostingKindList.list[i].typeOperCountersAct;
        Objects[0, i+1] := ENActPostingKindList.list[i];
        LastRow:=i+1;
        sgENActPostingKind.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENActPostingKind.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENActPostingKind.RowCount > selectedRow then
      sgENActPostingKind.Row := selectedRow
    else
      sgENActPostingKind.Row := sgENActPostingKind.RowCount - 1;
    end
    else
      sgENActPostingKind.Row:=1;   
end;


procedure TfrmENActPostingKindShow.sgENActPostingKindTopLeftChanged(Sender: TObject);
var
  TempENActPostingKind: ENActPostingKindControllerSoapPort;
  i,CurrentRow: Integer;
  ENActPostingKindList: ENActPostingKindShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActPostingKind.TopRow + sgENActPostingKind.VisibleRowCount) = ColCount
  then
    begin
      TempENActPostingKind :=  HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;
      CurrentRow:=sgENActPostingKind.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingKindFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingKindList := TempENActPostingKind.getScrollableFilteredList(ENActPostingKindFilter(FilterObject),ColCount-1, 100);


  sgENActPostingKind.RowCount:=sgENActPostingKind.RowCount+100;
  LastCount:=High(ENActPostingKindList.list);
  with sgENActPostingKind do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingKindList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActPostingKindList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActPostingKindList.list[i].numberGen;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[2,i+CurrentRow] := ENActPostingKindList.list[i].name;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        if ENActPostingKindList.list[i].dateTemplate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENActPostingKindList.list[i].dateTemplate);
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[4,i+CurrentRow] := ENActPostingKindList.list[i].account_expense;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[5,i+CurrentRow] := ENActPostingKindList.list[i].kau_expense;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[6,i+CurrentRow] := ENActPostingKindList.list[i].account_closing;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[7,i+CurrentRow] := ENActPostingKindList.list[i].kau_closing;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[8,i+CurrentRow] := ENActPostingKindList.list[i].typeOperMatetialsAct;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[9,i+CurrentRow] := ENActPostingKindList.list[i].typeOperMatetialsOrder;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
        Cells[10,i+CurrentRow] := ENActPostingKindList.list[i].typeOperCountersAct;
        Objects[0, i+CurrentRow] := ENActPostingKindList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActPostingKind.Row:=CurrentRow-5;
   sgENActPostingKind.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActPostingKindShow.sgENActPostingKindDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActPostingKind,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENActPostingKindShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENActPostingKind.RowCount-1 do
   for j:=0 to sgENActPostingKind.ColCount-1 do
     sgENActPostingKind.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENActPostingKindShow.actViewExecute(Sender: TObject);
var 
  TempENActPostingKind: ENActPostingKindControllerSoapPort;
begin
  TempENActPostingKind := HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;
  try
    ENActPostingKindObj := TempENActPostingKind.getObject(StrToInt(sgENActPostingKind.Cells[0, sgENActPostingKind.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActPostingKindEdit := TfrmENActPostingKindEdit.Create(Application, dsView);
  try
    frmENActPostingKindEdit.ShowModal;
  finally
    frmENActPostingKindEdit.Free;
    frmENActPostingKindEdit := nil;
  end;
end;


procedure TfrmENActPostingKindShow.actEditExecute(Sender: TObject);
var 
  TempENActPostingKind: ENActPostingKindControllerSoapPort;
begin
  TempENActPostingKind := HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;
  try
    ENActPostingKindObj := TempENActPostingKind.getObject(StrToInt(sgENActPostingKind.Cells[0,sgENActPostingKind.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENActPostingKind.Row;
  frmENActPostingKindEdit:=TfrmENActPostingKindEdit.Create(Application, dsEdit);
  
  try
    if frmENActPostingKindEdit.ShowModal= mrOk then
      begin
        //TempENActPostingKind.save(ENActPostingKindObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActPostingKindEdit.Free;
    frmENActPostingKindEdit:=nil;
  end;

  if sgENActPostingKind.RowCount > selectedRow then
    sgENActPostingKind.Row := selectedRow
  else
    sgENActPostingKind.Row := sgENActPostingKind.RowCount - 1;
  
end;


procedure TfrmENActPostingKindShow.actDeleteExecute(Sender: TObject);
Var TempENActPostingKind: ENActPostingKindControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActPostingKind := HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActPostingKind.Cells[0,sgENActPostingKind.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Вид шаблона проводки для акта выполненных работ )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActPostingKind.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActPostingKindShow.actInsertExecute(Sender: TObject);
// Var TempENActPostingKind: ENActPostingKindControllerSoapPort; 
begin
  // TempENActPostingKind := HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActPostingKindObj:=ENActPostingKind.Create;
  SetNullIntProps(ENActPostingKindObj);
  SetNullXSProps(ENActPostingKindObj);

   //ENActPostingKindObj.dateTemplate:= TXSDateTime.Create;
   


  try
    frmENActPostingKindEdit:=TfrmENActPostingKindEdit.Create(Application, dsInsert);
    try
      if frmENActPostingKindEdit.ShowModal = mrOk then
      begin
        if ENActPostingKindObj<>nil then
            //TempENActPostingKind.add(ENActPostingKindObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActPostingKindEdit.Free;
      frmENActPostingKindEdit:=nil;
    end;
  finally
    ENActPostingKindObj.Free;
  end;
end;


procedure TfrmENActPostingKindShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENActPostingKindShow.actFilterExecute(Sender: TObject);
begin
{frmENActPostingKindFilterEdit:=TfrmENActPostingKindFilterEdit.Create(Application, dsInsert);
  try
    ENActPostingKindFilterObj := ENActPostingKindFilter.Create;
    SetNullIntProps(ENActPostingKindFilterObj);
    SetNullXSProps(ENActPostingKindFilterObj);

    if frmENActPostingKindFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENActPostingKindFilter.Create;
      FilterObject := ENActPostingKindFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActPostingKindFilterEdit.Free;
    frmENActPostingKindFilterEdit:=nil;
  end;}
end;


procedure TfrmENActPostingKindShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.