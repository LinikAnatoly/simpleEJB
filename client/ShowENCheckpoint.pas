
unit ShowENCheckpoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCheckpointController, AdvObj ;


type
  TfrmENCheckpointShow = class(TChildForm)  
  HTTPRIOENCheckpoint: THTTPRIO;
    ImageList1: TImageList;
    sgENCheckpoint: TAdvStringGrid;
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
procedure sgENCheckpointTopLeftChanged(Sender: TObject);
procedure sgENCheckpointDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENCheckpointObj: ENCheckpoint;
 // ENCheckpointFilterObj: ENCheckpointFilter;
  
  
implementation

uses Main, EditENCheckpoint, EditENCheckpointFilter;


{$R *.dfm}

var
  //frmENCheckpointShow : TfrmENCheckpointShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCheckpointHeaders: array [1..3] of String =
        ( 'Код'
          ,'Найменування'
          ,'Транспортний відділ'
        );
   

procedure TfrmENCheckpointShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCheckpointShow :=nil;
    inherited;
  end;


procedure TfrmENCheckpointShow.FormShow(Sender: TObject);
var
  TempENCheckpoint: ENCheckpointControllerSoapPort;
  i: Integer;
  ENCheckpointList: ENCheckpointShortList;
  begin
  SetGridHeaders(ENCheckpointHeaders, sgENCheckpoint.ColumnHeaders);
  ColCount:=100;
  TempENCheckpoint :=  HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCheckpointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCheckpointList := TempENCheckpoint.getScrollableFilteredList(ENCheckpointFilter(FilterObject),0,ColCount);


  LastCount:=High(ENCheckpointList.list);

  if LastCount > -1 then
     sgENCheckpoint.RowCount:=LastCount+2
  else
     sgENCheckpoint.RowCount:=2;

   with sgENCheckpoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCheckpointList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCheckpointList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCheckpointList.list[i].name;
        Cells[2,i+1] := ENCheckpointList.list[i].transportDepartmentRefName;
        LastRow:=i+1;
        sgENCheckpoint.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCheckpoint.Row:=1;
end;

procedure TfrmENCheckpointShow.sgENCheckpointTopLeftChanged(Sender: TObject);
var
  TempENCheckpoint: ENCheckpointControllerSoapPort;
  i,CurrentRow: Integer;
  ENCheckpointList: ENCheckpointShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCheckpoint.TopRow + sgENCheckpoint.VisibleRowCount) = ColCount
  then
    begin
      TempENCheckpoint :=  HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;
      CurrentRow:=sgENCheckpoint.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCheckpointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCheckpointList := TempENCheckpoint.getScrollableFilteredList(ENCheckpointFilter(FilterObject),ColCount-1, 100);



  sgENCheckpoint.RowCount:=sgENCheckpoint.RowCount+100;
  LastCount:=High(ENCheckpointList.list);
  with sgENCheckpoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCheckpointList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCheckpointList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCheckpointList.list[i].name;
        Cells[2,i+CurrentRow] := ENCheckpointList.list[i].transportDepartmentRefName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCheckpoint.Row:=CurrentRow-5;
   sgENCheckpoint.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCheckpointShow.sgENCheckpointDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCheckpoint,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCheckpointShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCheckpoint.RowCount-1 do
   for j:=0 to sgENCheckpoint.ColCount-1 do
     sgENCheckpoint.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCheckpointShow.actViewExecute(Sender: TObject);
Var TempENCheckpoint: ENCheckpointControllerSoapPort;
begin
 TempENCheckpoint := HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;
   try
     ENCheckpointObj := TempENCheckpoint.getObject(StrToInt(sgENCheckpoint.Cells[0,sgENCheckpoint.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCheckpointEdit:=TfrmENCheckpointEdit.Create(Application, dsView);
  try
    frmENCheckpointEdit.ShowModal;
  finally
    frmENCheckpointEdit.Free;
    frmENCheckpointEdit:=nil;
  end;
end;

procedure TfrmENCheckpointShow.actEditExecute(Sender: TObject);
Var TempENCheckpoint: ENCheckpointControllerSoapPort;
begin
 TempENCheckpoint := HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;
   try
     ENCheckpointObj := TempENCheckpoint.getObject(StrToInt(sgENCheckpoint.Cells[0,sgENCheckpoint.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCheckpointEdit:=TfrmENCheckpointEdit.Create(Application, dsEdit);
  try
    if frmENCheckpointEdit.ShowModal= mrOk then
      begin
        //TempENCheckpoint.save(ENCheckpointObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCheckpointEdit.Free;
    frmENCheckpointEdit:=nil;
  end;
end;

procedure TfrmENCheckpointShow.actDeleteExecute(Sender: TObject);
Var TempENCheckpoint: ENCheckpointControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCheckpoint := HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCheckpoint.Cells[0,sgENCheckpoint.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Контрольно-пропускной пункт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCheckpoint.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCheckpointShow.actInsertExecute(Sender: TObject);
// Var TempENCheckpoint: ENCheckpointControllerSoapPort; 
begin
  // TempENCheckpoint := HTTPRIOENCheckpoint as ENCheckpointControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCheckpointObj:=ENCheckpoint.Create;



  try
    frmENCheckpointEdit:=TfrmENCheckpointEdit.Create(Application, dsInsert);
    try
      if frmENCheckpointEdit.ShowModal = mrOk then
      begin
        if ENCheckpointObj<>nil then
            //TempENCheckpoint.add(ENCheckpointObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCheckpointEdit.Free;
      frmENCheckpointEdit:=nil;
    end;
  finally
    ENCheckpointObj.Free;
  end;
end;

procedure TfrmENCheckpointShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCheckpointShow.actFilterExecute(Sender: TObject);
begin
frmENCheckpointFilterEdit:=TfrmENCheckpointFilterEdit.Create(Application, dsInsert);
  try
    ENCheckpointFilterObj := ENCheckpointFilter.Create;
    SetNullIntProps(ENCheckpointFilterObj);
    SetNullXSProps(ENCheckpointFilterObj);

    if frmENCheckpointFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCheckpointFilter.Create;
      FilterObject := ENCheckpointFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCheckpointFilterEdit.Free;
    frmENCheckpointFilterEdit:=nil;
  end;
end;

procedure TfrmENCheckpointShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.