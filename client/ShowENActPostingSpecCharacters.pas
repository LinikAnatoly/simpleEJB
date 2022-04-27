
unit ShowENActPostingSpecCharacters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENActPostingSpecCharactersController, AdvObj ;


type
    TfrmENActPostingSpecCharactersShow = class(TChildForm)  
    HTTPRIOENActPostingSpecCharacters: THTTPRIO;
    ImageList1: TImageList;
    sgENActPostingSpecCharacters: TAdvStringGrid;
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
    procedure sgENActPostingSpecCharactersTopLeftChanged(Sender: TObject);
    procedure sgENActPostingSpecCharactersDblClick(Sender: TObject);
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
   class function chooseFromList : ENActPostingSpecCharactersShort; stdcall; static;
 end;


var
  frmENActPostingSpecCharactersShow: TfrmENActPostingSpecCharactersShow;
  
  
implementation

uses Main, EditENActPostingSpecCharacters, EditENActPostingSpecCharactersFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActPostingSpecCharactersHeaders: array [1..3] of String =
        ( 'Код'
          ,'Найменування '
          ,'Коментар'
        );
   
class function TfrmENActPostingSpecCharactersShow.chooseFromList : ENActPostingSpecCharactersShort;
var
  f1 : ENActPostingSpecCharactersFilter;
  frmENActPostingSpecCharactersShow : TfrmENActPostingSpecCharactersShow;
  selected : ENActPostingSpecCharactersShort;
begin
  inherited;
     selected := nil;
     f1 := ENActPostingSpecCharactersFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENActPostingSpecCharactersShow := TfrmENActPostingSpecCharactersShow.Create(Application, fmNormal, f1);
       try
          with frmENActPostingSpecCharactersShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENActPostingSpecCharactersShort(sgENActPostingSpecCharacters.Objects[0, sgENActPostingSpecCharacters.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENActPostingSpecCharactersShow.Free;
       end;
end;

procedure TfrmENActPostingSpecCharactersShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENActPostingSpecCharactersShow:=nil;
  inherited;
end;


procedure TfrmENActPostingSpecCharactersShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENActPostingSpecCharactersShow.FormShow(Sender: TObject);
var
  TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort;
  i: Integer;
  ENActPostingSpecCharactersList: ENActPostingSpecCharactersShortList;
begin
  SetGridHeaders(ENActPostingSpecCharactersHeaders, sgENActPostingSpecCharacters.ColumnHeaders);
  ColCount:=100;
  TempENActPostingSpecCharacters :=  HTTPRIOENActPostingSpecCharacters as ENActPostingSpecCharactersControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingSpecCharactersFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingSpecCharactersList := TempENActPostingSpecCharacters.getScrollableFilteredList(ENActPostingSpecCharactersFilter(FilterObject),0,ColCount);
  LastCount:=High(ENActPostingSpecCharactersList.list);

  if LastCount > -1 then
     sgENActPostingSpecCharacters.RowCount:=LastCount+2
  else
     sgENActPostingSpecCharacters.RowCount:=2;

   with sgENActPostingSpecCharacters do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingSpecCharactersList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActPostingSpecCharactersList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActPostingSpecCharactersList.list[i].name;
        Objects[0, i+1] := ENActPostingSpecCharactersList.list[i];
        Cells[2,i+1] := ENActPostingSpecCharactersList.list[i].commentGen;
        Objects[0, i+1] := ENActPostingSpecCharactersList.list[i];
        LastRow:=i+1;
        sgENActPostingSpecCharacters.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENActPostingSpecCharacters.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENActPostingSpecCharacters.RowCount > selectedRow then
      sgENActPostingSpecCharacters.Row := selectedRow
    else
      sgENActPostingSpecCharacters.Row := sgENActPostingSpecCharacters.RowCount - 1;
    end
    else
      sgENActPostingSpecCharacters.Row:=1;   
end;


procedure TfrmENActPostingSpecCharactersShow.sgENActPostingSpecCharactersTopLeftChanged(Sender: TObject);
var
  TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort;
  i,CurrentRow: Integer;
  ENActPostingSpecCharactersList: ENActPostingSpecCharactersShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActPostingSpecCharacters.TopRow + sgENActPostingSpecCharacters.VisibleRowCount) = ColCount
  then
    begin
      TempENActPostingSpecCharacters :=  HTTPRIOENActPostingSpecCharacters as ENActPostingSpecCharactersControllerSoapPort;
      CurrentRow:=sgENActPostingSpecCharacters.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingSpecCharactersFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingSpecCharactersList := TempENActPostingSpecCharacters.getScrollableFilteredList(ENActPostingSpecCharactersFilter(FilterObject),ColCount-1, 100);


  sgENActPostingSpecCharacters.RowCount:=sgENActPostingSpecCharacters.RowCount+100;
  LastCount:=High(ENActPostingSpecCharactersList.list);
  with sgENActPostingSpecCharacters do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingSpecCharactersList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActPostingSpecCharactersList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActPostingSpecCharactersList.list[i].name;
        Objects[0, i+CurrentRow] := ENActPostingSpecCharactersList.list[i];
        Cells[2,i+CurrentRow] := ENActPostingSpecCharactersList.list[i].commentGen;
        Objects[0, i+CurrentRow] := ENActPostingSpecCharactersList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActPostingSpecCharacters.Row:=CurrentRow-5;
   sgENActPostingSpecCharacters.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActPostingSpecCharactersShow.sgENActPostingSpecCharactersDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActPostingSpecCharacters,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENActPostingSpecCharactersShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENActPostingSpecCharacters.RowCount-1 do
   for j:=0 to sgENActPostingSpecCharacters.ColCount-1 do
     sgENActPostingSpecCharacters.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENActPostingSpecCharactersShow.actViewExecute(Sender: TObject);
var 
  TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort;
begin
  TempENActPostingSpecCharacters := HTTPRIOENActPostingSpecCharacters as ENActPostingSpecCharactersControllerSoapPort;
  try
    ENActPostingSpecCharactersObj := TempENActPostingSpecCharacters.getObject(StrToInt(sgENActPostingSpecCharacters.Cells[0, sgENActPostingSpecCharacters.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActPostingSpecCharactersEdit := TfrmENActPostingSpecCharactersEdit.Create(Application, dsView);
  try
    frmENActPostingSpecCharactersEdit.ShowModal;
  finally
    frmENActPostingSpecCharactersEdit.Free;
    frmENActPostingSpecCharactersEdit := nil;
  end;
end;


procedure TfrmENActPostingSpecCharactersShow.actEditExecute(Sender: TObject);
var 
  TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort;
begin
  TempENActPostingSpecCharacters := HTTPRIOENActPostingSpecCharacters as ENActPostingSpecCharactersControllerSoapPort;
  try
    ENActPostingSpecCharactersObj := TempENActPostingSpecCharacters.getObject(StrToInt(sgENActPostingSpecCharacters.Cells[0,sgENActPostingSpecCharacters.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENActPostingSpecCharacters.Row;
  frmENActPostingSpecCharactersEdit:=TfrmENActPostingSpecCharactersEdit.Create(Application, dsEdit);
  
  try
    if frmENActPostingSpecCharactersEdit.ShowModal= mrOk then
      begin
        //TempENActPostingSpecCharacters.save(ENActPostingSpecCharactersObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActPostingSpecCharactersEdit.Free;
    frmENActPostingSpecCharactersEdit:=nil;
  end;

  if sgENActPostingSpecCharacters.RowCount > selectedRow then
    sgENActPostingSpecCharacters.Row := selectedRow
  else
    sgENActPostingSpecCharacters.Row := sgENActPostingSpecCharacters.RowCount - 1;
  
end;


procedure TfrmENActPostingSpecCharactersShow.actDeleteExecute(Sender: TObject);
Var TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActPostingSpecCharacters := HTTPRIOENActPostingSpecCharacters as ENActPostingSpecCharactersControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActPostingSpecCharacters.Cells[0,sgENActPostingSpecCharacters.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Довідник спец.символів для шаблонів проводок )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActPostingSpecCharacters.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActPostingSpecCharactersShow.actInsertExecute(Sender: TObject);
// Var TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort; 
begin
  // TempENActPostingSpecCharacters := HTTPRIOENActPostingSpecCharacters as ENActPostingSpecCharactersControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActPostingSpecCharactersObj:=ENActPostingSpecCharacters.Create;
  SetNullIntProps(ENActPostingSpecCharactersObj);
  SetNullXSProps(ENActPostingSpecCharactersObj);



  try
    frmENActPostingSpecCharactersEdit:=TfrmENActPostingSpecCharactersEdit.Create(Application, dsInsert);
    try
      if frmENActPostingSpecCharactersEdit.ShowModal = mrOk then
      begin
        if ENActPostingSpecCharactersObj<>nil then
            //TempENActPostingSpecCharacters.add(ENActPostingSpecCharactersObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActPostingSpecCharactersEdit.Free;
      frmENActPostingSpecCharactersEdit:=nil;
    end;
  finally
    ENActPostingSpecCharactersObj.Free;
  end;
end;


procedure TfrmENActPostingSpecCharactersShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENActPostingSpecCharactersShow.actFilterExecute(Sender: TObject);
begin
{frmENActPostingSpecCharactersFilterEdit:=TfrmENActPostingSpecCharactersFilterEdit.Create(Application, dsInsert);
  try
    ENActPostingSpecCharactersFilterObj := ENActPostingSpecCharactersFilter.Create;
    SetNullIntProps(ENActPostingSpecCharactersFilterObj);
    SetNullXSProps(ENActPostingSpecCharactersFilterObj);

    if frmENActPostingSpecCharactersFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENActPostingSpecCharactersFilter.Create;
      FilterObject := ENActPostingSpecCharactersFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActPostingSpecCharactersFilterEdit.Free;
    frmENActPostingSpecCharactersFilterEdit:=nil;
  end;}
end;


procedure TfrmENActPostingSpecCharactersShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.