
unit ShowENSITEquipState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSITEquipStateController ;


type
  TfrmENSITEquipStateShow = class(TChildForm)  
  HTTPRIOENSITEquipState: THTTPRIO;
    ImageList1: TImageList;
    sgENSITEquipState: TAdvStringGrid;
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
procedure sgENSITEquipStateTopLeftChanged(Sender: TObject);
procedure sgENSITEquipStateDblClick(Sender: TObject);
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
 // ENSITEquipStateObj: ENSITEquipState;
 // ENSITEquipStateFilterObj: ENSITEquipStateFilter;
  
  
implementation

uses Main, EditENSITEquipState, EditENSITEquipStateFilter;


{$R *.dfm}

var
  //frmENSITEquipStateShow : TfrmENSITEquipStateShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSITEquipStateHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип обьекту СІТ'
        );
   

procedure TfrmENSITEquipStateShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSITEquipStateShow:=nil;
    inherited;
  end;


procedure TfrmENSITEquipStateShow.FormShow(Sender: TObject);
var
  TempENSITEquipState: ENSITEquipStateControllerSoapPort;
  i: Integer;
  ENSITEquipStateList: ENSITEquipStateShortList;
  begin
  SetGridHeaders(ENSITEquipStateHeaders, sgENSITEquipState.ColumnHeaders);
  ColCount:=100;
  TempENSITEquipState :=  HTTPRIOENSITEquipState as ENSITEquipStateControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSITEquipStateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITEquipStateList := TempENSITEquipState.getScrollableFilteredList(ENSITEquipStateFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSITEquipStateList.list);

  if LastCount > -1 then
     sgENSITEquipState.RowCount:=LastCount+2
  else
     sgENSITEquipState.RowCount:=2;

   with sgENSITEquipState do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITEquipStateList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSITEquipStateList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSITEquipStateList.list[i].name;
        LastRow:=i+1;
        sgENSITEquipState.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSITEquipState.Row:=1;
end;

procedure TfrmENSITEquipStateShow.sgENSITEquipStateTopLeftChanged(Sender: TObject);
var
  TempENSITEquipState: ENSITEquipStateControllerSoapPort;
  i,CurrentRow: Integer;
  ENSITEquipStateList: ENSITEquipStateShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSITEquipState.TopRow + sgENSITEquipState.VisibleRowCount) = ColCount
  then
    begin
      TempENSITEquipState :=  HTTPRIOENSITEquipState as ENSITEquipStateControllerSoapPort;
      CurrentRow:=sgENSITEquipState.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSITEquipStateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITEquipStateList := TempENSITEquipState.getScrollableFilteredList(ENSITEquipStateFilter(FilterObject),ColCount-1, 100);



  sgENSITEquipState.RowCount:=sgENSITEquipState.RowCount+100;
  LastCount:=High(ENSITEquipStateList.list);
  with sgENSITEquipState do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITEquipStateList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSITEquipStateList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSITEquipStateList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSITEquipState.Row:=CurrentRow-5;
   sgENSITEquipState.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSITEquipStateShow.sgENSITEquipStateDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSITEquipState,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSITEquipStateShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSITEquipState.RowCount-1 do
   for j:=0 to sgENSITEquipState.ColCount-1 do
     sgENSITEquipState.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSITEquipStateShow.actViewExecute(Sender: TObject);
Var TempENSITEquipState: ENSITEquipStateControllerSoapPort;
begin
 TempENSITEquipState := HTTPRIOENSITEquipState as ENSITEquipStateControllerSoapPort;
   try
     ENSITEquipStateObj := TempENSITEquipState.getObject(StrToInt(sgENSITEquipState.Cells[0,sgENSITEquipState.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITEquipStateEdit:=TfrmENSITEquipStateEdit.Create(Application, dsView);
  try
    frmENSITEquipStateEdit.ShowModal;
  finally
    frmENSITEquipStateEdit.Free;
    frmENSITEquipStateEdit:=nil;
  end;
end;

procedure TfrmENSITEquipStateShow.actEditExecute(Sender: TObject);
Var TempENSITEquipState: ENSITEquipStateControllerSoapPort;
begin
 TempENSITEquipState := HTTPRIOENSITEquipState as ENSITEquipStateControllerSoapPort;
   try
     ENSITEquipStateObj := TempENSITEquipState.getObject(StrToInt(sgENSITEquipState.Cells[0,sgENSITEquipState.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITEquipStateEdit:=TfrmENSITEquipStateEdit.Create(Application, dsEdit);
  try
    if frmENSITEquipStateEdit.ShowModal= mrOk then
      begin
        //TempENSITEquipState.save(ENSITEquipStateObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSITEquipStateEdit.Free;
    frmENSITEquipStateEdit:=nil;
  end;
end;

procedure TfrmENSITEquipStateShow.actDeleteExecute(Sender: TObject);
Var TempENSITEquipState: ENSITEquipStateControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSITEquipState := HTTPRIOENSITEquipState as ENSITEquipStateControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSITEquipState.Cells[0,sgENSITEquipState.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Состояние обьекту СІТ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSITEquipState.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSITEquipStateShow.actInsertExecute(Sender: TObject);
Var TempENSITEquipState: ENSITEquipStateControllerSoapPort;
begin
  TempENSITEquipState := HTTPRIOENSITEquipState as ENSITEquipStateControllerSoapPort;
  ENSITEquipStateObj:=ENSITEquipState.Create;



  try
    frmENSITEquipStateEdit:=TfrmENSITEquipStateEdit.Create(Application, dsInsert);
    try
      if frmENSITEquipStateEdit.ShowModal = mrOk then
      begin
        if ENSITEquipStateObj<>nil then
            //TempENSITEquipState.add(ENSITEquipStateObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSITEquipStateEdit.Free;
      frmENSITEquipStateEdit:=nil;
    end;
  finally
    ENSITEquipStateObj.Free;
  end;
end;

procedure TfrmENSITEquipStateShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSITEquipStateShow.actFilterExecute(Sender: TObject);
begin
{frmENSITEquipStateFilterEdit:=TfrmENSITEquipStateFilterEdit.Create(Application, dsEdit);
  try
    ENSITEquipStateFilterObj := ENSITEquipStateFilter.Create;
    SetNullIntProps(ENSITEquipStateFilterObj);
    SetNullXSProps(ENSITEquipStateFilterObj);

    if frmENSITEquipStateFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSITEquipStateFilter.Create;
      FilterObject := ENSITEquipStateFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSITEquipStateFilterEdit.Free;
    frmENSITEquipStateFilterEdit:=nil;
  end;}
end;

procedure TfrmENSITEquipStateShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.