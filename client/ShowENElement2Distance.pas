
unit ShowENElement2Distance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENElement2DistanceController ;


type
    TfrmENElement2DistanceShow = class(TChildForm)  
    HTTPRIOENElement2Distance: THTTPRIO;
    ImageList1: TImageList;
    sgENElement2Distance: TAdvStringGrid;
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
    procedure sgENElement2DistanceTopLeftChanged(Sender: TObject);
    procedure sgENElement2DistanceDblClick(Sender: TObject);
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
   class function chooseFromList : ENElement2DistanceShort; stdcall; static;
 end;


var
  frmENElement2DistanceShow: TfrmENElement2DistanceShow;
  
  
implementation

uses Main, EditENElement2Distance, EditENElement2DistanceFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENElement2DistanceHeaders: array [1..2] of String =
        ( 'Код'
          ,'Дістанція до елемента мережі'
        );
   
class function TfrmENElement2DistanceShow.chooseFromList : ENElement2DistanceShort;
var
  f1 : ENElement2DistanceFilter;
  frmENElement2DistanceShow : TfrmENElement2DistanceShow;
  selected : ENElement2DistanceShort;
begin
  inherited;
     selected := nil;
     f1 := ENElement2DistanceFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENElement2DistanceShow := TfrmENElement2DistanceShow.Create(Application, fmNormal, f1);
       try
          with frmENElement2DistanceShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENElement2DistanceShort(sgENElement2Distance.Objects[0, sgENElement2Distance.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENElement2DistanceShow.Free;
       end;
end;

procedure TfrmENElement2DistanceShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENElement2DistanceShow:=nil;
  inherited;
end;


procedure TfrmENElement2DistanceShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENElement2DistanceShow.FormShow(Sender: TObject);
var
  TempENElement2Distance: ENElement2DistanceControllerSoapPort;
  i: Integer;
  ENElement2DistanceList: ENElement2DistanceShortList;
begin
  SetGridHeaders(ENElement2DistanceHeaders, sgENElement2Distance.ColumnHeaders);
  ColCount:=100;
  TempENElement2Distance :=  HTTPRIOENElement2Distance as ENElement2DistanceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENElement2DistanceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENElement2DistanceList := TempENElement2Distance.getScrollableFilteredList(ENElement2DistanceFilter(FilterObject),0,ColCount);
  LastCount:=High(ENElement2DistanceList.list);

  if LastCount > -1 then
     sgENElement2Distance.RowCount:=LastCount+2
  else
     sgENElement2Distance.RowCount:=2;

   with sgENElement2Distance do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENElement2DistanceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENElement2DistanceList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENElement2DistanceList.list[i].distance = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENElement2DistanceList.list[i].distance.DecimalString;
        Objects[0, i+1] := ENElement2DistanceList.list[i];
        LastRow:=i+1;
        sgENElement2Distance.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENElement2Distance.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENElement2Distance.RowCount > selectedRow then
      sgENElement2Distance.Row := selectedRow
    else
      sgENElement2Distance.Row := sgENElement2Distance.RowCount - 1;
    end
    else
      sgENElement2Distance.Row:=1;   
end;


procedure TfrmENElement2DistanceShow.sgENElement2DistanceTopLeftChanged(Sender: TObject);
var
  TempENElement2Distance: ENElement2DistanceControllerSoapPort;
  i,CurrentRow: Integer;
  ENElement2DistanceList: ENElement2DistanceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENElement2Distance.TopRow + sgENElement2Distance.VisibleRowCount) = ColCount
  then
    begin
      TempENElement2Distance :=  HTTPRIOENElement2Distance as ENElement2DistanceControllerSoapPort;
      CurrentRow:=sgENElement2Distance.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENElement2DistanceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENElement2DistanceList := TempENElement2Distance.getScrollableFilteredList(ENElement2DistanceFilter(FilterObject),ColCount-1, 100);


  sgENElement2Distance.RowCount:=sgENElement2Distance.RowCount+100;
  LastCount:=High(ENElement2DistanceList.list);
  with sgENElement2Distance do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENElement2DistanceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENElement2DistanceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENElement2DistanceList.list[i].distance = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENElement2DistanceList.list[i].distance.DecimalString;
        Objects[0, i+CurrentRow] := ENElement2DistanceList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENElement2Distance.Row:=CurrentRow-5;
   sgENElement2Distance.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENElement2DistanceShow.sgENElement2DistanceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENElement2Distance,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENElement2DistanceShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENElement2Distance.RowCount-1 do
   for j:=0 to sgENElement2Distance.ColCount-1 do
     sgENElement2Distance.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENElement2DistanceShow.actViewExecute(Sender: TObject);
var 
  TempENElement2Distance: ENElement2DistanceControllerSoapPort;
begin
  TempENElement2Distance := HTTPRIOENElement2Distance as ENElement2DistanceControllerSoapPort;
  try
    ENElement2DistanceObj := TempENElement2Distance.getObject(StrToInt(sgENElement2Distance.Cells[0, sgENElement2Distance.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENElement2DistanceEdit := TfrmENElement2DistanceEdit.Create(Application, dsView);
  try
    frmENElement2DistanceEdit.ShowModal;
  finally
    frmENElement2DistanceEdit.Free;
    frmENElement2DistanceEdit := nil;
  end;
end;


procedure TfrmENElement2DistanceShow.actEditExecute(Sender: TObject);
var 
  TempENElement2Distance: ENElement2DistanceControllerSoapPort;
begin
  TempENElement2Distance := HTTPRIOENElement2Distance as ENElement2DistanceControllerSoapPort;
  try
    ENElement2DistanceObj := TempENElement2Distance.getObject(StrToInt(sgENElement2Distance.Cells[0,sgENElement2Distance.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENElement2Distance.Row;
  frmENElement2DistanceEdit:=TfrmENElement2DistanceEdit.Create(Application, dsEdit);
  
  try
    if frmENElement2DistanceEdit.ShowModal= mrOk then
      begin
        //TempENElement2Distance.save(ENElement2DistanceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENElement2DistanceEdit.Free;
    frmENElement2DistanceEdit:=nil;
  end;

  if sgENElement2Distance.RowCount > selectedRow then
    sgENElement2Distance.Row := selectedRow
  else
    sgENElement2Distance.Row := sgENElement2Distance.RowCount - 1;
  
end;


procedure TfrmENElement2DistanceShow.actDeleteExecute(Sender: TObject);
Var TempENElement2Distance: ENElement2DistanceControllerSoapPort;
  ObjCode: Integer;
begin
 TempENElement2Distance := HTTPRIOENElement2Distance as ENElement2DistanceControllerSoapPort;
   try
     ObjCode := StrToInt(sgENElement2Distance.Cells[0,sgENElement2Distance.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Мінімальна дістанція до бази для елементів)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENElement2Distance.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENElement2DistanceShow.actInsertExecute(Sender: TObject);
// Var TempENElement2Distance: ENElement2DistanceControllerSoapPort; 
begin
  // TempENElement2Distance := HTTPRIOENElement2Distance as ENElement2DistanceControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENElement2DistanceObj:=ENElement2Distance.Create;
  SetNullIntProps(ENElement2DistanceObj);
  SetNullXSProps(ENElement2DistanceObj);

   //ENElement2DistanceObj.distance:= TXSDecimal.Create;


  try
    frmENElement2DistanceEdit:=TfrmENElement2DistanceEdit.Create(Application, dsInsert);
    try
      if frmENElement2DistanceEdit.ShowModal = mrOk then
      begin
        if ENElement2DistanceObj<>nil then
            //TempENElement2Distance.add(ENElement2DistanceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENElement2DistanceEdit.Free;
      frmENElement2DistanceEdit:=nil;
    end;
  finally
    ENElement2DistanceObj.Free;
  end;
end;


procedure TfrmENElement2DistanceShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENElement2DistanceShow.actFilterExecute(Sender: TObject);
begin
{frmENElement2DistanceFilterEdit:=TfrmENElement2DistanceFilterEdit.Create(Application, dsInsert);
  try
    ENElement2DistanceFilterObj := ENElement2DistanceFilter.Create;
    SetNullIntProps(ENElement2DistanceFilterObj);
    SetNullXSProps(ENElement2DistanceFilterObj);

    if frmENElement2DistanceFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENElement2DistanceFilter.Create;
      FilterObject := ENElement2DistanceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENElement2DistanceFilterEdit.Free;
    frmENElement2DistanceFilterEdit:=nil;
  end;}
end;


procedure TfrmENElement2DistanceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.