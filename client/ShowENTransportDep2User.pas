
unit ShowENTransportDep2User;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENTransportDep2UserController, AdvObj ;


type
    TfrmENTransportDep2UserShow = class(TChildForm)  
    HTTPRIOENTransportDep2User: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportDep2User: TAdvStringGrid;
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
    procedure sgENTransportDep2UserTopLeftChanged(Sender: TObject);
    procedure sgENTransportDep2UserDblClick(Sender: TObject);
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
   class function chooseFromList : ENTransportDep2UserShort; stdcall; static;
 end;


var
  frmENTransportDep2UserShow: TfrmENTransportDep2UserShow;
  
  
implementation

uses Main, EditENTransportDep2User, EditENTransportDep2UserFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportDep2UserHeaders: array [1..1] of String =
        ( 'Код'
        );
   
class function TfrmENTransportDep2UserShow.chooseFromList : ENTransportDep2UserShort;
var
  f1 : ENTransportDep2UserFilter;
  frmENTransportDep2UserShow : TfrmENTransportDep2UserShow;
  selected : ENTransportDep2UserShort;
begin
  inherited;
     selected := nil;
     f1 := ENTransportDep2UserFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENTransportDep2UserShow := TfrmENTransportDep2UserShow.Create(Application, fmNormal, f1);
       try
          with frmENTransportDep2UserShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENTransportDep2UserShort(sgENTransportDep2User.Objects[0, sgENTransportDep2User.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENTransportDep2UserShow.Free;
       end;
end;

procedure TfrmENTransportDep2UserShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENTransportDep2UserShow:=nil;
  inherited;
end;


procedure TfrmENTransportDep2UserShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENTransportDep2UserShow.FormShow(Sender: TObject);
var
  TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
  i: Integer;
  ENTransportDep2UserList: ENTransportDep2UserShortList;
begin
  SetGridHeaders(ENTransportDep2UserHeaders, sgENTransportDep2User.ColumnHeaders);
  ColCount:=100;
  TempENTransportDep2User :=  HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportDep2UserFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportDep2UserList := TempENTransportDep2User.getScrollableFilteredList(ENTransportDep2UserFilter(FilterObject),0,ColCount);
  LastCount:=High(ENTransportDep2UserList.list);

  if LastCount > -1 then
     sgENTransportDep2User.RowCount:=LastCount+2
  else
     sgENTransportDep2User.RowCount:=2;

   with sgENTransportDep2User do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportDep2UserList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportDep2UserList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENTransportDep2User.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENTransportDep2User.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENTransportDep2User.RowCount > selectedRow then
      sgENTransportDep2User.Row := selectedRow
    else
      sgENTransportDep2User.Row := sgENTransportDep2User.RowCount - 1;
    end
    else
      sgENTransportDep2User.Row:=1;   
end;


procedure TfrmENTransportDep2UserShow.sgENTransportDep2UserTopLeftChanged(Sender: TObject);
var
  TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportDep2UserList: ENTransportDep2UserShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportDep2User.TopRow + sgENTransportDep2User.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportDep2User :=  HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;
      CurrentRow:=sgENTransportDep2User.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportDep2UserFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportDep2UserList := TempENTransportDep2User.getScrollableFilteredList(ENTransportDep2UserFilter(FilterObject),ColCount-1, 100);


  sgENTransportDep2User.RowCount:=sgENTransportDep2User.RowCount+100;
  LastCount:=High(ENTransportDep2UserList.list);
  with sgENTransportDep2User do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportDep2UserList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportDep2UserList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportDep2User.Row:=CurrentRow-5;
   sgENTransportDep2User.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportDep2UserShow.sgENTransportDep2UserDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportDep2User,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENTransportDep2UserShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENTransportDep2User.RowCount-1 do
   for j:=0 to sgENTransportDep2User.ColCount-1 do
     sgENTransportDep2User.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENTransportDep2UserShow.actViewExecute(Sender: TObject);
var 
  TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
begin
  TempENTransportDep2User := HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;
  try
    ENTransportDep2UserObj := TempENTransportDep2User.getObject(StrToInt(sgENTransportDep2User.Cells[0, sgENTransportDep2User.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENTransportDep2UserEdit := TfrmENTransportDep2UserEdit.Create(Application, dsView);
  try
    frmENTransportDep2UserEdit.ShowModal;
  finally
    frmENTransportDep2UserEdit.Free;
    frmENTransportDep2UserEdit := nil;
  end;
end;


procedure TfrmENTransportDep2UserShow.actEditExecute(Sender: TObject);
var 
  TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
begin
  TempENTransportDep2User := HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;
  try
    ENTransportDep2UserObj := TempENTransportDep2User.getObject(StrToInt(sgENTransportDep2User.Cells[0,sgENTransportDep2User.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENTransportDep2User.Row;
  frmENTransportDep2UserEdit:=TfrmENTransportDep2UserEdit.Create(Application, dsEdit);
  
  try
    if frmENTransportDep2UserEdit.ShowModal= mrOk then
      begin
        //TempENTransportDep2User.save(ENTransportDep2UserObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportDep2UserEdit.Free;
    frmENTransportDep2UserEdit:=nil;
  end;

  if sgENTransportDep2User.RowCount > selectedRow then
    sgENTransportDep2User.Row := selectedRow
  else
    sgENTransportDep2User.Row := sgENTransportDep2User.RowCount - 1;
  
end;


procedure TfrmENTransportDep2UserShow.actDeleteExecute(Sender: TObject);
Var TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportDep2User := HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportDep2User.Cells[0,sgENTransportDep2User.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Связка транспортных подразделений и юзеров)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportDep2User.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportDep2UserShow.actInsertExecute(Sender: TObject);
// Var TempENTransportDep2User: ENTransportDep2UserControllerSoapPort; 
begin
  // TempENTransportDep2User := HTTPRIOENTransportDep2User as ENTransportDep2UserControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTransportDep2UserObj:=ENTransportDep2User.Create;
  SetNullIntProps(ENTransportDep2UserObj);
  SetNullXSProps(ENTransportDep2UserObj);



  try
    frmENTransportDep2UserEdit:=TfrmENTransportDep2UserEdit.Create(Application, dsInsert);
    try
      if frmENTransportDep2UserEdit.ShowModal = mrOk then
      begin
        if ENTransportDep2UserObj<>nil then
            //TempENTransportDep2User.add(ENTransportDep2UserObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportDep2UserEdit.Free;
      frmENTransportDep2UserEdit:=nil;
    end;
  finally
    ENTransportDep2UserObj.Free;
  end;
end;


procedure TfrmENTransportDep2UserShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENTransportDep2UserShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportDep2UserFilterEdit:=TfrmENTransportDep2UserFilterEdit.Create(Application, dsInsert);
  try
    ENTransportDep2UserFilterObj := ENTransportDep2UserFilter.Create;
    SetNullIntProps(ENTransportDep2UserFilterObj);
    SetNullXSProps(ENTransportDep2UserFilterObj);

    if frmENTransportDep2UserFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENTransportDep2UserFilter.Create;
      FilterObject := ENTransportDep2UserFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportDep2UserFilterEdit.Free;
    frmENTransportDep2UserFilterEdit:=nil;
  end;}
end;


procedure TfrmENTransportDep2UserShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.