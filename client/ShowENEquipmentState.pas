
unit ShowENEquipmentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENEquipmentStateController ;


type
  TfrmENEquipmentStateShow = class(TChildForm)  
  HTTPRIOENEquipmentState: THTTPRIO;
    ImageList1: TImageList;
    sgENEquipmentState: TAdvStringGrid;
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
procedure sgENEquipmentStateTopLeftChanged(Sender: TObject);
procedure sgENEquipmentStateDblClick(Sender: TObject);
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
 // ENEquipmentStateObj: ENEquipmentState;
 // ENEquipmentStateFilterObj: ENEquipmentStateFilter;
  
  
implementation

uses Main, EditENEquipmentState, EditENEquipmentStateFilter;


{$R *.dfm}

var
  //frmENEquipmentStateShow : TfrmENEquipmentStateShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENEquipmentStateHeaders: array [1..2] of String =
        ( 'Код'
          ,'Состояние оборудование'
        );
   

procedure TfrmENEquipmentStateShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENEquipmentStateShow:=nil;
    inherited;
  end;


procedure TfrmENEquipmentStateShow.FormShow(Sender: TObject);
var
  TempENEquipmentState: ENEquipmentStateControllerSoapPort;
  i: Integer;
  ENEquipmentStateList: ENEquipmentStateShortList;
  begin
  SetGridHeaders(ENEquipmentStateHeaders, sgENEquipmentState.ColumnHeaders);
  ColCount:=100;
  TempENEquipmentState :=  HTTPRIOENEquipmentState as ENEquipmentStateControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENEquipmentStateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEquipmentStateList := TempENEquipmentState.getScrollableFilteredList(ENEquipmentStateFilter(FilterObject),0,ColCount);


  LastCount:=High(ENEquipmentStateList.list);

  if LastCount > -1 then
     sgENEquipmentState.RowCount:=LastCount+2
  else
     sgENEquipmentState.RowCount:=2;

   with sgENEquipmentState do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEquipmentStateList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENEquipmentStateList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENEquipmentStateList.list[i].name;
        LastRow:=i+1;
        sgENEquipmentState.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENEquipmentState.Row:=1;
end;

procedure TfrmENEquipmentStateShow.sgENEquipmentStateTopLeftChanged(Sender: TObject);
var
  TempENEquipmentState: ENEquipmentStateControllerSoapPort;
  i,CurrentRow: Integer;
  ENEquipmentStateList: ENEquipmentStateShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENEquipmentState.TopRow + sgENEquipmentState.VisibleRowCount) = ColCount
  then
    begin
      TempENEquipmentState :=  HTTPRIOENEquipmentState as ENEquipmentStateControllerSoapPort;
      CurrentRow:=sgENEquipmentState.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENEquipmentStateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENEquipmentStateList := TempENEquipmentState.getScrollableFilteredList(ENEquipmentStateFilter(FilterObject),ColCount-1, 100);



  sgENEquipmentState.RowCount:=sgENEquipmentState.RowCount+100;
  LastCount:=High(ENEquipmentStateList.list);
  with sgENEquipmentState do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENEquipmentStateList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENEquipmentStateList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENEquipmentStateList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENEquipmentState.Row:=CurrentRow-5;
   sgENEquipmentState.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENEquipmentStateShow.sgENEquipmentStateDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENEquipmentState,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENEquipmentStateShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENEquipmentState.RowCount-1 do
   for j:=0 to sgENEquipmentState.ColCount-1 do
     sgENEquipmentState.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENEquipmentStateShow.actViewExecute(Sender: TObject);
Var TempENEquipmentState: ENEquipmentStateControllerSoapPort;
begin
 TempENEquipmentState := HTTPRIOENEquipmentState as ENEquipmentStateControllerSoapPort;
   try
     ENEquipmentStateObj := TempENEquipmentState.getObject(StrToInt(sgENEquipmentState.Cells[0,sgENEquipmentState.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEquipmentStateEdit:=TfrmENEquipmentStateEdit.Create(Application, dsView);
  try
    frmENEquipmentStateEdit.ShowModal;
  finally
    frmENEquipmentStateEdit.Free;
    frmENEquipmentStateEdit:=nil;
  end;
end;

procedure TfrmENEquipmentStateShow.actEditExecute(Sender: TObject);
Var TempENEquipmentState: ENEquipmentStateControllerSoapPort;
begin
 TempENEquipmentState := HTTPRIOENEquipmentState as ENEquipmentStateControllerSoapPort;
   try
     ENEquipmentStateObj := TempENEquipmentState.getObject(StrToInt(sgENEquipmentState.Cells[0,sgENEquipmentState.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENEquipmentStateEdit:=TfrmENEquipmentStateEdit.Create(Application, dsEdit);
  try
    if frmENEquipmentStateEdit.ShowModal= mrOk then
      begin
        //TempENEquipmentState.save(ENEquipmentStateObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENEquipmentStateEdit.Free;
    frmENEquipmentStateEdit:=nil;
  end;
end;

procedure TfrmENEquipmentStateShow.actDeleteExecute(Sender: TObject);
Var TempENEquipmentState: ENEquipmentStateControllerSoapPort;
  ObjCode: Integer;
begin
 TempENEquipmentState := HTTPRIOENEquipmentState as ENEquipmentStateControllerSoapPort;
   try
     ObjCode := StrToInt(sgENEquipmentState.Cells[0,sgENEquipmentState.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Состояния оборудования) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENEquipmentState.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENEquipmentStateShow.actInsertExecute(Sender: TObject);
// Var TempENEquipmentState: ENEquipmentStateControllerSoapPort; 
begin
  // TempENEquipmentState := HTTPRIOENEquipmentState as ENEquipmentStateControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENEquipmentStateObj:=ENEquipmentState.Create;



  try
    frmENEquipmentStateEdit:=TfrmENEquipmentStateEdit.Create(Application, dsInsert);
    try
      if frmENEquipmentStateEdit.ShowModal = mrOk then
      begin
        if ENEquipmentStateObj<>nil then
            //TempENEquipmentState.add(ENEquipmentStateObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENEquipmentStateEdit.Free;
      frmENEquipmentStateEdit:=nil;
    end;
  finally
    ENEquipmentStateObj.Free;
  end;
end;

procedure TfrmENEquipmentStateShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENEquipmentStateShow.actFilterExecute(Sender: TObject);
begin
{frmENEquipmentStateFilterEdit:=TfrmENEquipmentStateFilterEdit.Create(Application, dsInsert);
  try
    ENEquipmentStateFilterObj := ENEquipmentStateFilter.Create;
    SetNullIntProps(ENEquipmentStateFilterObj);
    SetNullXSProps(ENEquipmentStateFilterObj);

    if frmENEquipmentStateFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENEquipmentStateFilter.Create;
      FilterObject := ENEquipmentStateFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENEquipmentStateFilterEdit.Free;
    frmENEquipmentStateFilterEdit:=nil;
  end;}
end;

procedure TfrmENEquipmentStateShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.