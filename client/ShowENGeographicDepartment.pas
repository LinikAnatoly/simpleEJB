
unit ShowENGeographicDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENGeographicDepartmentController, AdvObj ;


type
    TfrmENGeographicDepartmentShow = class(TChildForm)  
    HTTPRIOENGeographicDepartment: THTTPRIO;
    ImageList1: TImageList;
    sgENGeographicDepartment: TAdvStringGrid;
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
    procedure sgENGeographicDepartmentTopLeftChanged(Sender: TObject);
    procedure sgENGeographicDepartmentDblClick(Sender: TObject);
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
   class function chooseFromList : ENGeographicDepartmentShort; stdcall; static;
 end;


var
  frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
  
  
implementation

uses Main, EditENGeographicDepartment, EditENGeographicDepartmentFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENGeographicDepartmentHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   
class function TfrmENGeographicDepartmentShow.chooseFromList : ENGeographicDepartmentShort;
var
  f1 : ENGeographicDepartmentFilter;
  frmENGeographicDepartmentShow : TfrmENGeographicDepartmentShow;
  selected : ENGeographicDepartmentShort;
begin
  inherited;
     selected := nil;
     f1 := ENGeographicDepartmentFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, f1);
       try
          with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENGeographicDepartmentShow.Free;
       end;
end;

procedure TfrmENGeographicDepartmentShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENGeographicDepartmentShow:=nil;
  inherited;
end;


procedure TfrmENGeographicDepartmentShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENGeographicDepartmentShow.FormShow(Sender: TObject);
var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  i: Integer;
  ENGeographicDepartmentList: ENGeographicDepartmentShortList;
begin
  SetGridHeaders(ENGeographicDepartmentHeaders, sgENGeographicDepartment.ColumnHeaders);
  ColCount:=100;
  TempENGeographicDepartment :=  HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENGeographicDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGeographicDepartmentList := TempENGeographicDepartment.getScrollableFilteredList(ENGeographicDepartmentFilter(FilterObject),0,ColCount);
  LastCount:=High(ENGeographicDepartmentList.list);

  if LastCount > -1 then
     sgENGeographicDepartment.RowCount:=LastCount+2
  else
     sgENGeographicDepartment.RowCount:=2;

   with sgENGeographicDepartment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGeographicDepartmentList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENGeographicDepartmentList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENGeographicDepartmentList.list[i].name;
        Objects[0, i + 1] := ENGeographicDepartmentList.list[i];
        LastRow:=i+1;
        sgENGeographicDepartment.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENGeographicDepartment.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENGeographicDepartment.RowCount > selectedRow then
      sgENGeographicDepartment.Row := selectedRow
    else
      sgENGeographicDepartment.Row := sgENGeographicDepartment.RowCount - 1;
    end
    else
      sgENGeographicDepartment.Row:=1;   
end;


procedure TfrmENGeographicDepartmentShow.sgENGeographicDepartmentTopLeftChanged(Sender: TObject);
var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  i,CurrentRow: Integer;
  ENGeographicDepartmentList: ENGeographicDepartmentShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENGeographicDepartment.TopRow + sgENGeographicDepartment.VisibleRowCount) = ColCount
  then
    begin
      TempENGeographicDepartment :=  HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
      CurrentRow:=sgENGeographicDepartment.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENGeographicDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENGeographicDepartmentList := TempENGeographicDepartment.getScrollableFilteredList(ENGeographicDepartmentFilter(FilterObject),ColCount-1, 100);


  sgENGeographicDepartment.RowCount:=sgENGeographicDepartment.RowCount+100;
  LastCount:=High(ENGeographicDepartmentList.list);
  with sgENGeographicDepartment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENGeographicDepartmentList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENGeographicDepartmentList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENGeographicDepartmentList.list[i].name;
        Objects[0, i + CurrentRow] := ENGeographicDepartmentList.list[i];
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENGeographicDepartment.Row:=CurrentRow-5;
   sgENGeographicDepartment.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENGeographicDepartmentShow.sgENGeographicDepartmentDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENGeographicDepartment,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENGeographicDepartmentShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENGeographicDepartment.RowCount-1 do
   for j:=0 to sgENGeographicDepartment.ColCount-1 do
     sgENGeographicDepartment.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENGeographicDepartmentShow.actViewExecute(Sender: TObject);
var 
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
begin
  TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
  try
    ENGeographicDepartmentObj := TempENGeographicDepartment.getObject(StrToInt(sgENGeographicDepartment.Cells[0, sgENGeographicDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENGeographicDepartmentEdit := TfrmENGeographicDepartmentEdit.Create(Application, dsView);
  try
    frmENGeographicDepartmentEdit.ShowModal;
  finally
    frmENGeographicDepartmentEdit.Free;
    frmENGeographicDepartmentEdit := nil;
  end;
end;


procedure TfrmENGeographicDepartmentShow.actEditExecute(Sender: TObject);
var 
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
begin
  TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
  try
    ENGeographicDepartmentObj := TempENGeographicDepartment.getObject(StrToInt(sgENGeographicDepartment.Cells[0,sgENGeographicDepartment.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENGeographicDepartment.Row;
  frmENGeographicDepartmentEdit:=TfrmENGeographicDepartmentEdit.Create(Application, dsEdit);
  
  try
    if frmENGeographicDepartmentEdit.ShowModal= mrOk then
      begin
        //TempENGeographicDepartment.save(ENGeographicDepartmentObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENGeographicDepartmentEdit.Free;
    frmENGeographicDepartmentEdit:=nil;
  end;

  if sgENGeographicDepartment.RowCount > selectedRow then
    sgENGeographicDepartment.Row := selectedRow
  else
    sgENGeographicDepartment.Row := sgENGeographicDepartment.RowCount - 1;
  
end;


procedure TfrmENGeographicDepartmentShow.actDeleteExecute(Sender: TObject);
Var TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENGeographicDepartment.Cells[0,sgENGeographicDepartment.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Географічний підрозділ)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENGeographicDepartment.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENGeographicDepartmentShow.actInsertExecute(Sender: TObject);
// Var TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort; 
begin
  // TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENGeographicDepartmentObj:=ENGeographicDepartment.Create;
  SetNullIntProps(ENGeographicDepartmentObj);
  SetNullXSProps(ENGeographicDepartmentObj);

   //ENGeographicDepartmentObj.dateAdd:= TXSDateTime.Create;
   
   //ENGeographicDepartmentObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENGeographicDepartmentEdit:=TfrmENGeographicDepartmentEdit.Create(Application, dsInsert);
    try
      if frmENGeographicDepartmentEdit.ShowModal = mrOk then
      begin
        if ENGeographicDepartmentObj<>nil then
            //TempENGeographicDepartment.add(ENGeographicDepartmentObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENGeographicDepartmentEdit.Free;
      frmENGeographicDepartmentEdit:=nil;
    end;
  finally
    ENGeographicDepartmentObj.Free;
  end;
end;


procedure TfrmENGeographicDepartmentShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENGeographicDepartmentShow.actFilterExecute(Sender: TObject);
begin
{frmENGeographicDepartmentFilterEdit:=TfrmENGeographicDepartmentFilterEdit.Create(Application, dsInsert);
  try
    ENGeographicDepartmentFilterObj := ENGeographicDepartmentFilter.Create;
    SetNullIntProps(ENGeographicDepartmentFilterObj);
    SetNullXSProps(ENGeographicDepartmentFilterObj);

    if frmENGeographicDepartmentFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENGeographicDepartmentFilter.Create;
      FilterObject := ENGeographicDepartmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENGeographicDepartmentFilterEdit.Free;
    frmENGeographicDepartmentFilterEdit:=nil;
  end;}
end;


procedure TfrmENGeographicDepartmentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.