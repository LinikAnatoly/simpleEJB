
unit ShowENMol2GeoDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENMol2GeoDepartmentController, AdvObj ;


type
    TfrmENMol2GeoDepartmentShow = class(TChildForm)  
    HTTPRIOENMol2GeoDepartment: THTTPRIO;
    ImageList1: TImageList;
    sgENMol2GeoDepartment: TAdvStringGrid;
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
    procedure sgENMol2GeoDepartmentTopLeftChanged(Sender: TObject);
    procedure sgENMol2GeoDepartmentDblClick(Sender: TObject);
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
   class function chooseFromList : ENMol2GeoDepartmentShort; stdcall; static;
 end;


var
  frmENMol2GeoDepartmentShow: TfrmENMol2GeoDepartmentShow;
  
  
implementation

uses Main, EditENMol2GeoDepartment, EditENMol2GeoDepartmentFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMol2GeoDepartmentHeaders: array [1..1] of String =
        ( 'Код'
        );
   
class function TfrmENMol2GeoDepartmentShow.chooseFromList : ENMol2GeoDepartmentShort;
var
  f1 : ENMol2GeoDepartmentFilter;
  frmENMol2GeoDepartmentShow : TfrmENMol2GeoDepartmentShow;
  selected : ENMol2GeoDepartmentShort;
begin
  inherited;
     selected := nil;
     f1 := ENMol2GeoDepartmentFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENMol2GeoDepartmentShow := TfrmENMol2GeoDepartmentShow.Create(Application, fmNormal, f1);
       try
          with frmENMol2GeoDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENMol2GeoDepartmentShort(sgENMol2GeoDepartment.Objects[0, sgENMol2GeoDepartment.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENMol2GeoDepartmentShow.Free;
       end;
end;

procedure TfrmENMol2GeoDepartmentShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENMol2GeoDepartmentShow:=nil;
  inherited;
end;


procedure TfrmENMol2GeoDepartmentShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENMol2GeoDepartmentShow.FormShow(Sender: TObject);
var
  TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
  i: Integer;
  ENMol2GeoDepartmentList: ENMol2GeoDepartmentShortList;
begin
  SetGridHeaders(ENMol2GeoDepartmentHeaders, sgENMol2GeoDepartment.ColumnHeaders);
  ColCount:=100;
  TempENMol2GeoDepartment :=  HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMol2GeoDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMol2GeoDepartmentList := TempENMol2GeoDepartment.getScrollableFilteredList(ENMol2GeoDepartmentFilter(FilterObject),0,ColCount);
  LastCount:=High(ENMol2GeoDepartmentList.list);

  if LastCount > -1 then
     sgENMol2GeoDepartment.RowCount:=LastCount+2
  else
     sgENMol2GeoDepartment.RowCount:=2;

   with sgENMol2GeoDepartment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMol2GeoDepartmentList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMol2GeoDepartmentList.list[i].code)
        else
        Cells[0,i+1] := '';
		Objects[0, i+1] := ENMol2GeoDepartmentList.list[i];
        LastRow:=i+1;
        sgENMol2GeoDepartment.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENMol2GeoDepartment.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENMol2GeoDepartment.RowCount > selectedRow then
      sgENMol2GeoDepartment.Row := selectedRow
    else
      sgENMol2GeoDepartment.Row := sgENMol2GeoDepartment.RowCount - 1;
    end
    else
      sgENMol2GeoDepartment.Row:=1;   
end;


procedure TfrmENMol2GeoDepartmentShow.sgENMol2GeoDepartmentTopLeftChanged(Sender: TObject);
var
  TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
  i,CurrentRow: Integer;
  ENMol2GeoDepartmentList: ENMol2GeoDepartmentShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMol2GeoDepartment.TopRow + sgENMol2GeoDepartment.VisibleRowCount) = ColCount
  then
    begin
      TempENMol2GeoDepartment :=  HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;
      CurrentRow:=sgENMol2GeoDepartment.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMol2GeoDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMol2GeoDepartmentList := TempENMol2GeoDepartment.getScrollableFilteredList(ENMol2GeoDepartmentFilter(FilterObject),ColCount-1, 100);


  sgENMol2GeoDepartment.RowCount:=sgENMol2GeoDepartment.RowCount+100;
  LastCount:=High(ENMol2GeoDepartmentList.list);
  with sgENMol2GeoDepartment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMol2GeoDepartmentList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMol2GeoDepartmentList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
		  Objects[0, i+CurrentRow] := ENMol2GeoDepartmentList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMol2GeoDepartment.Row:=CurrentRow-5;
   sgENMol2GeoDepartment.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMol2GeoDepartmentShow.sgENMol2GeoDepartmentDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMol2GeoDepartment,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENMol2GeoDepartmentShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENMol2GeoDepartment.RowCount-1 do
   for j:=0 to sgENMol2GeoDepartment.ColCount-1 do
     sgENMol2GeoDepartment.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENMol2GeoDepartmentShow.actViewExecute(Sender: TObject);
var 
  TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
begin
  TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;
  try
    ENMol2GeoDepartmentObj := TempENMol2GeoDepartment.getObject(StrToInt(sgENMol2GeoDepartment.Cells[0, sgENMol2GeoDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENMol2GeoDepartmentEdit := TfrmENMol2GeoDepartmentEdit.Create(Application, dsView);
  try
    frmENMol2GeoDepartmentEdit.ShowModal;
  finally
    frmENMol2GeoDepartmentEdit.Free;
    frmENMol2GeoDepartmentEdit := nil;
  end;
end;


procedure TfrmENMol2GeoDepartmentShow.actEditExecute(Sender: TObject);
var 
  TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
begin
  TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;
  try
    ENMol2GeoDepartmentObj := TempENMol2GeoDepartment.getObject(StrToInt(sgENMol2GeoDepartment.Cells[0,sgENMol2GeoDepartment.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENMol2GeoDepartment.Row;
  frmENMol2GeoDepartmentEdit:=TfrmENMol2GeoDepartmentEdit.Create(Application, dsEdit);
  
  try
    if frmENMol2GeoDepartmentEdit.ShowModal= mrOk then
      begin
        //TempENMol2GeoDepartment.save(ENMol2GeoDepartmentObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMol2GeoDepartmentEdit.Free;
    frmENMol2GeoDepartmentEdit:=nil;
  end;

  if sgENMol2GeoDepartment.RowCount > selectedRow then
    sgENMol2GeoDepartment.Row := selectedRow
  else
    sgENMol2GeoDepartment.Row := sgENMol2GeoDepartment.RowCount - 1;
  
end;


procedure TfrmENMol2GeoDepartmentShow.actDeleteExecute(Sender: TObject);
Var TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMol2GeoDepartment.Cells[0,sgENMol2GeoDepartment.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Зв"язок МВО з географічніми підрозділами)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMol2GeoDepartment.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMol2GeoDepartmentShow.actInsertExecute(Sender: TObject);
// Var TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort; 
begin
  // TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENMol2GeoDepartmentObj:=ENMol2GeoDepartment.Create;
  SetNullIntProps(ENMol2GeoDepartmentObj);
  SetNullXSProps(ENMol2GeoDepartmentObj);



  try
    frmENMol2GeoDepartmentEdit:=TfrmENMol2GeoDepartmentEdit.Create(Application, dsInsert);
    try
      if frmENMol2GeoDepartmentEdit.ShowModal = mrOk then
      begin
        if ENMol2GeoDepartmentObj<>nil then
            //TempENMol2GeoDepartment.add(ENMol2GeoDepartmentObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMol2GeoDepartmentEdit.Free;
      frmENMol2GeoDepartmentEdit:=nil;
    end;
  finally
    ENMol2GeoDepartmentObj.Free;
  end;
end;


procedure TfrmENMol2GeoDepartmentShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENMol2GeoDepartmentShow.actFilterExecute(Sender: TObject);
begin
{frmENMol2GeoDepartmentFilterEdit:=TfrmENMol2GeoDepartmentFilterEdit.Create(Application, dsInsert);
  try
    ENMol2GeoDepartmentFilterObj := ENMol2GeoDepartmentFilter.Create;
    SetNullIntProps(ENMol2GeoDepartmentFilterObj);
    SetNullXSProps(ENMol2GeoDepartmentFilterObj);

    if frmENMol2GeoDepartmentFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENMol2GeoDepartmentFilter.Create;
      FilterObject := ENMol2GeoDepartmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMol2GeoDepartmentFilterEdit.Free;
    frmENMol2GeoDepartmentFilterEdit:=nil;
  end;}
end;


procedure TfrmENMol2GeoDepartmentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.