
unit ShowRQMaterialsGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQMaterialsGroupController ;


type
  TfrmRQMaterialsGroupShow = class(TChildForm)  
  HTTPRIORQMaterialsGroup: THTTPRIO;
    ImageList1: TImageList;
    sgRQMaterialsGroup: TAdvStringGrid;
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
procedure sgRQMaterialsGroupTopLeftChanged(Sender: TObject);
procedure sgRQMaterialsGroupDblClick(Sender: TObject);
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
 // RQMaterialsGroupObj: RQMaterialsGroup;
 // RQMaterialsGroupFilterObj: RQMaterialsGroupFilter;
  
  
implementation

uses Main, EditRQMaterialsGroup, EditRQMaterialsGroupFilter;


{$R *.dfm}

var
  //frmRQMaterialsGroupShow : TfrmRQMaterialsGroupShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQMaterialsGroupHeaders: array [1..3] of String =
        ( 'Код'
          ,'код из TMC'
          ,'Наименование ед. изм.'
        );
   

procedure TfrmRQMaterialsGroupShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQMaterialsGroupShow:=nil;
    inherited;
  end;


procedure TfrmRQMaterialsGroupShow.FormShow(Sender: TObject);
var
  TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
  i: Integer;
  RQMaterialsGroupList: RQMaterialsGroupShortList;
  begin
  SetGridHeaders(RQMaterialsGroupHeaders, sgRQMaterialsGroup.ColumnHeaders);
  ColCount:=100;
  TempRQMaterialsGroup :=  HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterialsGroupFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterialsGroupList := TempRQMaterialsGroup.getScrollableFilteredList(RQMaterialsGroupFilter(FilterObject),0,ColCount);


  LastCount:=High(RQMaterialsGroupList.list);

  if LastCount > -1 then
     sgRQMaterialsGroup.RowCount:=LastCount+2
  else
     sgRQMaterialsGroup.RowCount:=2;

   with sgRQMaterialsGroup do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterialsGroupList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQMaterialsGroupList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQMaterialsGroupList.list[i].outCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(RQMaterialsGroupList.list[i].outCode);
        Cells[2,i+1] := RQMaterialsGroupList.list[i].name;
        LastRow:=i+1;
        sgRQMaterialsGroup.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQMaterialsGroup.Row:=1;
end;

procedure TfrmRQMaterialsGroupShow.sgRQMaterialsGroupTopLeftChanged(Sender: TObject);
var
  TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
  i,CurrentRow: Integer;
  RQMaterialsGroupList: RQMaterialsGroupShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQMaterialsGroup.TopRow + sgRQMaterialsGroup.VisibleRowCount) = ColCount
  then
    begin
      TempRQMaterialsGroup :=  HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;
      CurrentRow:=sgRQMaterialsGroup.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterialsGroupFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterialsGroupList := TempRQMaterialsGroup.getScrollableFilteredList(RQMaterialsGroupFilter(FilterObject),ColCount-1, 100);



  sgRQMaterialsGroup.RowCount:=sgRQMaterialsGroup.RowCount+100;
  LastCount:=High(RQMaterialsGroupList.list);
  with sgRQMaterialsGroup do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterialsGroupList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQMaterialsGroupList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQMaterialsGroupList.list[i].outCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(RQMaterialsGroupList.list[i].outCode);
        Cells[2,i+CurrentRow] := RQMaterialsGroupList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQMaterialsGroup.Row:=CurrentRow-5;
   sgRQMaterialsGroup.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQMaterialsGroupShow.sgRQMaterialsGroupDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQMaterialsGroup,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQMaterialsGroupShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQMaterialsGroup.RowCount-1 do
   for j:=0 to sgRQMaterialsGroup.ColCount-1 do
     sgRQMaterialsGroup.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQMaterialsGroupShow.actViewExecute(Sender: TObject);
Var TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
begin
 TempRQMaterialsGroup := HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;
   try
     RQMaterialsGroupObj := TempRQMaterialsGroup.getObject(StrToInt(sgRQMaterialsGroup.Cells[0,sgRQMaterialsGroup.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterialsGroupEdit:=TfrmRQMaterialsGroupEdit.Create(Application, dsView);
  try
    frmRQMaterialsGroupEdit.ShowModal;
  finally
    frmRQMaterialsGroupEdit.Free;
    frmRQMaterialsGroupEdit:=nil;
  end;
end;

procedure TfrmRQMaterialsGroupShow.actEditExecute(Sender: TObject);
Var TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
begin
 TempRQMaterialsGroup := HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;
   try
     RQMaterialsGroupObj := TempRQMaterialsGroup.getObject(StrToInt(sgRQMaterialsGroup.Cells[0,sgRQMaterialsGroup.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterialsGroupEdit:=TfrmRQMaterialsGroupEdit.Create(Application, dsEdit);
  try
    if frmRQMaterialsGroupEdit.ShowModal= mrOk then
      begin
        //TempRQMaterialsGroup.save(RQMaterialsGroupObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQMaterialsGroupEdit.Free;
    frmRQMaterialsGroupEdit:=nil;
  end;
end;

procedure TfrmRQMaterialsGroupShow.actDeleteExecute(Sender: TObject);
Var TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQMaterialsGroup := HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQMaterialsGroup.Cells[0,sgRQMaterialsGroup.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Справочник ГРУП материалов (Собств.Зак. group_tmc)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQMaterialsGroup.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQMaterialsGroupShow.actInsertExecute(Sender: TObject);
Var TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
begin
  TempRQMaterialsGroup := HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;
  RQMaterialsGroupObj:=RQMaterialsGroup.Create;

   RQMaterialsGroupObj.dateDelete:= TXSDate.Create;


  try
    frmRQMaterialsGroupEdit:=TfrmRQMaterialsGroupEdit.Create(Application, dsInsert);
    try
      if frmRQMaterialsGroupEdit.ShowModal = mrOk then
      begin
        if RQMaterialsGroupObj<>nil then
            //TempRQMaterialsGroup.add(RQMaterialsGroupObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQMaterialsGroupEdit.Free;
      frmRQMaterialsGroupEdit:=nil;
    end;
  finally
    RQMaterialsGroupObj.Free;
  end;
end;

procedure TfrmRQMaterialsGroupShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQMaterialsGroupShow.actFilterExecute(Sender: TObject);
begin
{frmRQMaterialsGroupFilterEdit:=TfrmRQMaterialsGroupFilterEdit.Create(Application, dsEdit);
  try
    RQMaterialsGroupFilterObj := RQMaterialsGroupFilter.Create;
    SetNullIntProps(RQMaterialsGroupFilterObj);
    SetNullXSProps(RQMaterialsGroupFilterObj);

    if frmRQMaterialsGroupFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQMaterialsGroupFilter.Create;
      FilterObject := RQMaterialsGroupFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQMaterialsGroupFilterEdit.Free;
    frmRQMaterialsGroupFilterEdit:=nil;
  end;}
end;

procedure TfrmRQMaterialsGroupShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.