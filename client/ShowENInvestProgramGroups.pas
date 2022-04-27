
unit ShowENInvestProgramGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENInvestProgramGroupsController, AdvObj;


type
  TfrmENInvestProgramGroupsShow = class(TChildForm)
  HTTPRIOENInvestProgramGroups: THTTPRIO;
    ImageList1: TImageList;
    sgENInvestProgramGroups: TAdvStringGrid;
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
procedure sgENInvestProgramGroupsTopLeftChanged(Sender: TObject);
procedure sgENInvestProgramGroupsDblClick(Sender: TObject);
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

var
 frmENInvestProgramGroupsShow : TfrmENInvestProgramGroupsShow;
 // ENInvestProgramGroupsObj: ENInvestProgramGroups;
 // ENInvestProgramGroupsFilterObj: ENInvestProgramGroupsFilter;
  
  
implementation

uses Main, EditENInvestProgramGroups, EditENInvestProgramGroupsFilter;


{$R *.dfm}

var
  //frmENInvestProgramGroupsShow : TfrmENInvestProgramGroupsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInvestProgramGroupsHeaders: array [1..3] of String =
        ( 'Код'
          ,'Розділ'
          ,'Опис розділу'
        );
   

procedure TfrmENInvestProgramGroupsShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENInvestProgramGroupsShow:=nil;
  inherited;
end;


procedure TfrmENInvestProgramGroupsShow.FormShow(Sender: TObject);
var
  TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
  i: Integer;
  ENInvestProgramGroupsList: ENInvestProgramGroupsShortList;
  begin
  SetGridHeaders(ENInvestProgramGroupsHeaders, sgENInvestProgramGroups.ColumnHeaders);
  ColCount:=100;
  TempENInvestProgramGroups :=  HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENInvestProgramGroupsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInvestProgramGroupsList := TempENInvestProgramGroups.getScrollableFilteredList(ENInvestProgramGroupsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENInvestProgramGroupsList.list);

  if LastCount > -1 then
     sgENInvestProgramGroups.RowCount:=LastCount+2
  else
     sgENInvestProgramGroups.RowCount:=2;

   with sgENInvestProgramGroups do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInvestProgramGroupsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENInvestProgramGroupsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENInvestProgramGroupsList.list[i].name;
        Cells[2,i+1] := ENInvestProgramGroupsList.list[i].commentgen;
        LastRow:=i+1;
        sgENInvestProgramGroups.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENInvestProgramGroups.Row:=1;
end;

procedure TfrmENInvestProgramGroupsShow.sgENInvestProgramGroupsTopLeftChanged(Sender: TObject);
var
  TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
  i,CurrentRow: Integer;
  ENInvestProgramGroupsList: ENInvestProgramGroupsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENInvestProgramGroups.TopRow + sgENInvestProgramGroups.VisibleRowCount) = ColCount
  then
    begin
      TempENInvestProgramGroups :=  HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
      CurrentRow:=sgENInvestProgramGroups.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENInvestProgramGroupsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInvestProgramGroupsList := TempENInvestProgramGroups.getScrollableFilteredList(ENInvestProgramGroupsFilter(FilterObject),ColCount-1, 100);



  sgENInvestProgramGroups.RowCount:=sgENInvestProgramGroups.RowCount+100;
  LastCount:=High(ENInvestProgramGroupsList.list);
  with sgENInvestProgramGroups do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInvestProgramGroupsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENInvestProgramGroupsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENInvestProgramGroupsList.list[i].name;
        Cells[2,i+CurrentRow] := ENInvestProgramGroupsList.list[i].commentgen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENInvestProgramGroups.Row:=CurrentRow-5;
   sgENInvestProgramGroups.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENInvestProgramGroupsShow.sgENInvestProgramGroupsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENInvestProgramGroups,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENInvestProgramGroupsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENInvestProgramGroups.RowCount-1 do
   for j:=0 to sgENInvestProgramGroups.ColCount-1 do
     sgENInvestProgramGroups.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENInvestProgramGroupsShow.actViewExecute(Sender: TObject);
Var TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
begin
 TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
   try
     ENInvestProgramGroupsObj := TempENInvestProgramGroups.getObject(StrToInt(sgENInvestProgramGroups.Cells[0,sgENInvestProgramGroups.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInvestProgramGroupsEdit:=TfrmENInvestProgramGroupsEdit.Create(Application, dsView);
  try
    frmENInvestProgramGroupsEdit.ShowModal;
  finally
    frmENInvestProgramGroupsEdit.Free;
    frmENInvestProgramGroupsEdit:=nil;
  end;
end;

procedure TfrmENInvestProgramGroupsShow.actEditExecute(Sender: TObject);
Var TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
begin
 TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
   try
     ENInvestProgramGroupsObj := TempENInvestProgramGroups.getObject(StrToInt(sgENInvestProgramGroups.Cells[0,sgENInvestProgramGroups.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInvestProgramGroupsEdit:=TfrmENInvestProgramGroupsEdit.Create(Application, dsEdit);
  try
    if frmENInvestProgramGroupsEdit.ShowModal= mrOk then
      begin
        //TempENInvestProgramGroups.save(ENInvestProgramGroupsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENInvestProgramGroupsEdit.Free;
    frmENInvestProgramGroupsEdit:=nil;
  end;
end;

procedure TfrmENInvestProgramGroupsShow.actDeleteExecute(Sender: TObject);
Var TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENInvestProgramGroups.Cells[0,sgENInvestProgramGroups.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Розділ інвест програми) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENInvestProgramGroups.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENInvestProgramGroupsShow.actInsertExecute(Sender: TObject);
Var TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
begin
  TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
  ENInvestProgramGroupsObj:=ENInvestProgramGroups.Create;



  try
    frmENInvestProgramGroupsEdit:=TfrmENInvestProgramGroupsEdit.Create(Application, dsInsert);
    try
      if frmENInvestProgramGroupsEdit.ShowModal = mrOk then
      begin
        if ENInvestProgramGroupsObj<>nil then
            //TempENInvestProgramGroups.add(ENInvestProgramGroupsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENInvestProgramGroupsEdit.Free;
      frmENInvestProgramGroupsEdit:=nil;
    end;
  finally
    ENInvestProgramGroupsObj.Free;
  end;
end;

procedure TfrmENInvestProgramGroupsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENInvestProgramGroupsShow.actFilterExecute(Sender: TObject);
begin
{frmENInvestProgramGroupsFilterEdit:=TfrmENInvestProgramGroupsFilterEdit.Create(Application, dsInsert);
  try
    ENInvestProgramGroupsFilterObj := ENInvestProgramGroupsFilter.Create;
    SetNullIntProps(ENInvestProgramGroupsFilterObj);
    SetNullXSProps(ENInvestProgramGroupsFilterObj);

    if frmENInvestProgramGroupsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENInvestProgramGroupsFilter.Create;
      FilterObject := ENInvestProgramGroupsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENInvestProgramGroupsFilterEdit.Free;
    frmENInvestProgramGroupsFilterEdit:=nil;
  end;}
end;

procedure TfrmENInvestProgramGroupsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.