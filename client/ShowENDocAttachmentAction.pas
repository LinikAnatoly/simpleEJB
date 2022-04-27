
unit ShowENDocAttachmentAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENDocAttachmentActionController, AdvObj ;


type
    TfrmENDocAttachmentActionShow = class(TChildForm)  
    HTTPRIOENDocAttachmentAction: THTTPRIO;
    ImageList1: TImageList;
    sgENDocAttachmentAction: TAdvStringGrid;
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
    procedure sgENDocAttachmentActionTopLeftChanged(Sender: TObject);
    procedure sgENDocAttachmentActionDblClick(Sender: TObject);
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
   class function chooseFromList : ENDocAttachmentActionShort; stdcall; static;
 end;


var
  frmENDocAttachmentActionShow: TfrmENDocAttachmentActionShow;
  
  
implementation

uses Main, EditENDocAttachmentAction, EditENDocAttachmentActionFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDocAttachmentActionHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   
class function TfrmENDocAttachmentActionShow.chooseFromList : ENDocAttachmentActionShort;
var
  f1 : ENDocAttachmentActionFilter;
  frmENDocAttachmentActionShow : TfrmENDocAttachmentActionShow;
  selected : ENDocAttachmentActionShort;
begin
  inherited;
     selected := nil;
     f1 := ENDocAttachmentActionFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENDocAttachmentActionShow := TfrmENDocAttachmentActionShow.Create(Application, fmNormal, f1);
       try
          with frmENDocAttachmentActionShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENDocAttachmentActionShort(sgENDocAttachmentAction.Objects[0, sgENDocAttachmentAction.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENDocAttachmentActionShow.Free;
       end;
end;

procedure TfrmENDocAttachmentActionShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENDocAttachmentActionShow:=nil;
  inherited;
end;


procedure TfrmENDocAttachmentActionShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENDocAttachmentActionShow.FormShow(Sender: TObject);
var
  TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort;
  i: Integer;
  ENDocAttachmentActionList: ENDocAttachmentActionShortList;
begin
  SetGridHeaders(ENDocAttachmentActionHeaders, sgENDocAttachmentAction.ColumnHeaders);
  ColCount:=100;
  TempENDocAttachmentAction :=  HTTPRIOENDocAttachmentAction as ENDocAttachmentActionControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttachmentActionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttachmentActionList := TempENDocAttachmentAction.getScrollableFilteredList(ENDocAttachmentActionFilter(FilterObject),0,ColCount);
  LastCount:=High(ENDocAttachmentActionList.list);

  if LastCount > -1 then
     sgENDocAttachmentAction.RowCount:=LastCount+2
  else
     sgENDocAttachmentAction.RowCount:=2;

   with sgENDocAttachmentAction do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentActionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDocAttachmentActionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDocAttachmentActionList.list[i].name;
        Objects[0, i+1] := ENDocAttachmentActionList.list[i];
        LastRow:=i+1;
        sgENDocAttachmentAction.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENDocAttachmentAction.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENDocAttachmentAction.RowCount > selectedRow then
      sgENDocAttachmentAction.Row := selectedRow
    else
      sgENDocAttachmentAction.Row := sgENDocAttachmentAction.RowCount - 1;
    end
    else
      sgENDocAttachmentAction.Row:=1;   
end;


procedure TfrmENDocAttachmentActionShow.sgENDocAttachmentActionTopLeftChanged(Sender: TObject);
var
  TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort;
  i,CurrentRow: Integer;
  ENDocAttachmentActionList: ENDocAttachmentActionShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDocAttachmentAction.TopRow + sgENDocAttachmentAction.VisibleRowCount) = ColCount
  then
    begin
      TempENDocAttachmentAction :=  HTTPRIOENDocAttachmentAction as ENDocAttachmentActionControllerSoapPort;
      CurrentRow:=sgENDocAttachmentAction.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDocAttachmentActionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDocAttachmentActionList := TempENDocAttachmentAction.getScrollableFilteredList(ENDocAttachmentActionFilter(FilterObject),ColCount-1, 100);


  sgENDocAttachmentAction.RowCount:=sgENDocAttachmentAction.RowCount+100;
  LastCount:=High(ENDocAttachmentActionList.list);
  with sgENDocAttachmentAction do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDocAttachmentActionList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDocAttachmentActionList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDocAttachmentActionList.list[i].name;
        Objects[0, i+CurrentRow] := ENDocAttachmentActionList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDocAttachmentAction.Row:=CurrentRow-5;
   sgENDocAttachmentAction.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDocAttachmentActionShow.sgENDocAttachmentActionDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDocAttachmentAction,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENDocAttachmentActionShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENDocAttachmentAction.RowCount-1 do
   for j:=0 to sgENDocAttachmentAction.ColCount-1 do
     sgENDocAttachmentAction.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENDocAttachmentActionShow.actViewExecute(Sender: TObject);
var 
  TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort;
begin
  TempENDocAttachmentAction := HTTPRIOENDocAttachmentAction as ENDocAttachmentActionControllerSoapPort;
  try
    ENDocAttachmentActionObj := TempENDocAttachmentAction.getObject(StrToInt(sgENDocAttachmentAction.Cells[0, sgENDocAttachmentAction.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENDocAttachmentActionEdit := TfrmENDocAttachmentActionEdit.Create(Application, dsView);
  try
    frmENDocAttachmentActionEdit.ShowModal;
  finally
    frmENDocAttachmentActionEdit.Free;
    frmENDocAttachmentActionEdit := nil;
  end;
end;


procedure TfrmENDocAttachmentActionShow.actEditExecute(Sender: TObject);
var 
  TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort;
begin
  TempENDocAttachmentAction := HTTPRIOENDocAttachmentAction as ENDocAttachmentActionControllerSoapPort;
  try
    ENDocAttachmentActionObj := TempENDocAttachmentAction.getObject(StrToInt(sgENDocAttachmentAction.Cells[0,sgENDocAttachmentAction.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENDocAttachmentAction.Row;
  frmENDocAttachmentActionEdit:=TfrmENDocAttachmentActionEdit.Create(Application, dsEdit);
  
  try
    if frmENDocAttachmentActionEdit.ShowModal= mrOk then
      begin
        //TempENDocAttachmentAction.save(ENDocAttachmentActionObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDocAttachmentActionEdit.Free;
    frmENDocAttachmentActionEdit:=nil;
  end;

  if sgENDocAttachmentAction.RowCount > selectedRow then
    sgENDocAttachmentAction.Row := selectedRow
  else
    sgENDocAttachmentAction.Row := sgENDocAttachmentAction.RowCount - 1;
  
end;


procedure TfrmENDocAttachmentActionShow.actDeleteExecute(Sender: TObject);
Var TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDocAttachmentAction := HTTPRIOENDocAttachmentAction as ENDocAttachmentActionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDocAttachmentAction.Cells[0,sgENDocAttachmentAction.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Дія для вкладення)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDocAttachmentAction.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDocAttachmentActionShow.actInsertExecute(Sender: TObject);
// Var TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort; 
begin
  // TempENDocAttachmentAction := HTTPRIOENDocAttachmentAction as ENDocAttachmentActionControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDocAttachmentActionObj:=ENDocAttachmentAction.Create;
  SetNullIntProps(ENDocAttachmentActionObj);
  SetNullXSProps(ENDocAttachmentActionObj);



  try
    frmENDocAttachmentActionEdit:=TfrmENDocAttachmentActionEdit.Create(Application, dsInsert);
    try
      if frmENDocAttachmentActionEdit.ShowModal = mrOk then
      begin
        if ENDocAttachmentActionObj<>nil then
            //TempENDocAttachmentAction.add(ENDocAttachmentActionObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDocAttachmentActionEdit.Free;
      frmENDocAttachmentActionEdit:=nil;
    end;
  finally
    ENDocAttachmentActionObj.Free;
  end;
end;


procedure TfrmENDocAttachmentActionShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENDocAttachmentActionShow.actFilterExecute(Sender: TObject);
begin
{frmENDocAttachmentActionFilterEdit:=TfrmENDocAttachmentActionFilterEdit.Create(Application, dsInsert);
  try
    ENDocAttachmentActionFilterObj := ENDocAttachmentActionFilter.Create;
    SetNullIntProps(ENDocAttachmentActionFilterObj);
    SetNullXSProps(ENDocAttachmentActionFilterObj);

    if frmENDocAttachmentActionFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENDocAttachmentActionFilter.Create;
      FilterObject := ENDocAttachmentActionFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDocAttachmentActionFilterEdit.Free;
    frmENDocAttachmentActionFilterEdit:=nil;
  end;}
end;


procedure TfrmENDocAttachmentActionShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.