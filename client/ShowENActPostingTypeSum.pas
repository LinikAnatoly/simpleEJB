
unit ShowENActPostingTypeSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENActPostingTypeSumController, AdvObj ;


type
    TfrmENActPostingTypeSumShow = class(TChildForm)  
    HTTPRIOENActPostingTypeSum: THTTPRIO;
    ImageList1: TImageList;
    sgENActPostingTypeSum: TAdvStringGrid;
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
    procedure sgENActPostingTypeSumTopLeftChanged(Sender: TObject);
    procedure sgENActPostingTypeSumDblClick(Sender: TObject);
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
   class function chooseFromList : ENActPostingTypeSumShort; stdcall; static;
 end;


var
  frmENActPostingTypeSumShow: TfrmENActPostingTypeSumShow;
  
  
implementation

uses Main, EditENActPostingTypeSum, EditENActPostingTypeSumFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActPostingTypeSumHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування '
        );
   
class function TfrmENActPostingTypeSumShow.chooseFromList : ENActPostingTypeSumShort;
var
  f1 : ENActPostingTypeSumFilter;
  frmENActPostingTypeSumShow : TfrmENActPostingTypeSumShow;
  selected : ENActPostingTypeSumShort;
begin
  inherited;
     selected := nil;
     f1 := ENActPostingTypeSumFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENActPostingTypeSumShow := TfrmENActPostingTypeSumShow.Create(Application, fmNormal, f1);
       try
          with frmENActPostingTypeSumShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENActPostingTypeSumShort(sgENActPostingTypeSum.Objects[0, sgENActPostingTypeSum.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENActPostingTypeSumShow.Free;
       end;
end;

procedure TfrmENActPostingTypeSumShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENActPostingTypeSumShow:=nil;
  inherited;
end;


procedure TfrmENActPostingTypeSumShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENActPostingTypeSumShow.FormShow(Sender: TObject);
var
  TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort;
  i: Integer;
  ENActPostingTypeSumList: ENActPostingTypeSumShortList;
begin
  SetGridHeaders(ENActPostingTypeSumHeaders, sgENActPostingTypeSum.ColumnHeaders);
  ColCount:=100;
  TempENActPostingTypeSum :=  HTTPRIOENActPostingTypeSum as ENActPostingTypeSumControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingTypeSumFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingTypeSumList := TempENActPostingTypeSum.getScrollableFilteredList(ENActPostingTypeSumFilter(FilterObject),0,ColCount);
  LastCount:=High(ENActPostingTypeSumList.list);

  if LastCount > -1 then
     sgENActPostingTypeSum.RowCount:=LastCount+2
  else
     sgENActPostingTypeSum.RowCount:=2;

   with sgENActPostingTypeSum do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingTypeSumList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActPostingTypeSumList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActPostingTypeSumList.list[i].name;
        Objects[0, i+1] := ENActPostingTypeSumList.list[i];
        LastRow:=i+1;
        sgENActPostingTypeSum.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENActPostingTypeSum.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENActPostingTypeSum.RowCount > selectedRow then
      sgENActPostingTypeSum.Row := selectedRow
    else
      sgENActPostingTypeSum.Row := sgENActPostingTypeSum.RowCount - 1;
    end
    else
      sgENActPostingTypeSum.Row:=1;   
end;


procedure TfrmENActPostingTypeSumShow.sgENActPostingTypeSumTopLeftChanged(Sender: TObject);
var
  TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort;
  i,CurrentRow: Integer;
  ENActPostingTypeSumList: ENActPostingTypeSumShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActPostingTypeSum.TopRow + sgENActPostingTypeSum.VisibleRowCount) = ColCount
  then
    begin
      TempENActPostingTypeSum :=  HTTPRIOENActPostingTypeSum as ENActPostingTypeSumControllerSoapPort;
      CurrentRow:=sgENActPostingTypeSum.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingTypeSumFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingTypeSumList := TempENActPostingTypeSum.getScrollableFilteredList(ENActPostingTypeSumFilter(FilterObject),ColCount-1, 100);


  sgENActPostingTypeSum.RowCount:=sgENActPostingTypeSum.RowCount+100;
  LastCount:=High(ENActPostingTypeSumList.list);
  with sgENActPostingTypeSum do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingTypeSumList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActPostingTypeSumList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActPostingTypeSumList.list[i].name;
        Objects[0, i+CurrentRow] := ENActPostingTypeSumList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActPostingTypeSum.Row:=CurrentRow-5;
   sgENActPostingTypeSum.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActPostingTypeSumShow.sgENActPostingTypeSumDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActPostingTypeSum,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENActPostingTypeSumShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENActPostingTypeSum.RowCount-1 do
   for j:=0 to sgENActPostingTypeSum.ColCount-1 do
     sgENActPostingTypeSum.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENActPostingTypeSumShow.actViewExecute(Sender: TObject);
var 
  TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort;
begin
  TempENActPostingTypeSum := HTTPRIOENActPostingTypeSum as ENActPostingTypeSumControllerSoapPort;
  try
    ENActPostingTypeSumObj := TempENActPostingTypeSum.getObject(StrToInt(sgENActPostingTypeSum.Cells[0, sgENActPostingTypeSum.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActPostingTypeSumEdit := TfrmENActPostingTypeSumEdit.Create(Application, dsView);
  try
    frmENActPostingTypeSumEdit.ShowModal;
  finally
    frmENActPostingTypeSumEdit.Free;
    frmENActPostingTypeSumEdit := nil;
  end;
end;


procedure TfrmENActPostingTypeSumShow.actEditExecute(Sender: TObject);
var 
  TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort;
begin
  TempENActPostingTypeSum := HTTPRIOENActPostingTypeSum as ENActPostingTypeSumControllerSoapPort;
  try
    ENActPostingTypeSumObj := TempENActPostingTypeSum.getObject(StrToInt(sgENActPostingTypeSum.Cells[0,sgENActPostingTypeSum.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENActPostingTypeSum.Row;
  frmENActPostingTypeSumEdit:=TfrmENActPostingTypeSumEdit.Create(Application, dsEdit);
  
  try
    if frmENActPostingTypeSumEdit.ShowModal= mrOk then
      begin
        //TempENActPostingTypeSum.save(ENActPostingTypeSumObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActPostingTypeSumEdit.Free;
    frmENActPostingTypeSumEdit:=nil;
  end;

  if sgENActPostingTypeSum.RowCount > selectedRow then
    sgENActPostingTypeSum.Row := selectedRow
  else
    sgENActPostingTypeSum.Row := sgENActPostingTypeSum.RowCount - 1;
  
end;


procedure TfrmENActPostingTypeSumShow.actDeleteExecute(Sender: TObject);
Var TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActPostingTypeSum := HTTPRIOENActPostingTypeSum as ENActPostingTypeSumControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActPostingTypeSum.Cells[0,sgENActPostingTypeSum.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Справочник типов суммы для проводок(зп,есв,амортиз и тд))?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActPostingTypeSum.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActPostingTypeSumShow.actInsertExecute(Sender: TObject);
// Var TempENActPostingTypeSum: ENActPostingTypeSumControllerSoapPort; 
begin
  // TempENActPostingTypeSum := HTTPRIOENActPostingTypeSum as ENActPostingTypeSumControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActPostingTypeSumObj:=ENActPostingTypeSum.Create;
  SetNullIntProps(ENActPostingTypeSumObj);
  SetNullXSProps(ENActPostingTypeSumObj);



  try
    frmENActPostingTypeSumEdit:=TfrmENActPostingTypeSumEdit.Create(Application, dsInsert);
    try
      if frmENActPostingTypeSumEdit.ShowModal = mrOk then
      begin
        if ENActPostingTypeSumObj<>nil then
            //TempENActPostingTypeSum.add(ENActPostingTypeSumObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActPostingTypeSumEdit.Free;
      frmENActPostingTypeSumEdit:=nil;
    end;
  finally
    ENActPostingTypeSumObj.Free;
  end;
end;


procedure TfrmENActPostingTypeSumShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENActPostingTypeSumShow.actFilterExecute(Sender: TObject);
begin
{frmENActPostingTypeSumFilterEdit:=TfrmENActPostingTypeSumFilterEdit.Create(Application, dsInsert);
  try
    ENActPostingTypeSumFilterObj := ENActPostingTypeSumFilter.Create;
    SetNullIntProps(ENActPostingTypeSumFilterObj);
    SetNullXSProps(ENActPostingTypeSumFilterObj);

    if frmENActPostingTypeSumFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENActPostingTypeSumFilter.Create;
      FilterObject := ENActPostingTypeSumFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActPostingTypeSumFilterEdit.Free;
    frmENActPostingTypeSumFilterEdit:=nil;
  end;}
end;


procedure TfrmENActPostingTypeSumShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.