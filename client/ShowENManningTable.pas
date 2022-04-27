
unit ShowENManningTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENManningTableController, treelist
  , ENDepartmentController, ExtCtrls, AdvObj

   ;


type
  TfrmENManningTableShow = class(TChildForm)  
  HTTPRIOENManningTable: THTTPRIO;
    ImageList1: TImageList;
    sgENManningTable: TAdvStringGrid;
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
    HTTPRIOENDepartment: THTTPRIO;
    Panel1: TPanel;
    tvDep: TTreeList;
    Splitter1: TSplitter;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENManningTableTopLeftChanged(Sender: TObject);
procedure sgENManningTableDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tvDepDblClick(Sender: TObject);
    procedure tvDepChange(Sender: TObject; Node: TTreeNode);

  private
   { Private declarations }
 public
   { Public declarations }
   departmentFilter : ENDepartmentFilter;

   procedure UpdateGrid(Sender: TObject);

 end;

var
 frmENManningTableShow : TfrmENManningTableShow;
 // ENManningTableObj: ENManningTable;
 // ENManningTableFilterObj: ENManningTableFilter;

  
implementation

uses Main, EditENManningTable
, EditENManningTableFilter

;


{$R *.dfm}

var
  //frmENManningTableShow : TfrmENManningTableShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENManningTableHeaders: array [1..5] of String =
        ( 'Код'
          ,'Посада'
          ,'Підрозділ'
          ,'Дата початку дії'
          ,'Дата закінчення дії'
        );
   

procedure TfrmENManningTableShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENManningTableShow:=nil;
    inherited;
  end;


procedure TfrmENManningTableShow.FormShow(Sender: TObject);
var
  TempENManningTable: ENManningTableControllerSoapPort;
  i: Integer;
  ENManningTableList: ENManningTableShortList;

  TempENDepartment: ENDepartmentControllerSoapPort;
  //i: Integer;
  ENDepartmentList: ENDepartmentShortList;
    
  begin

    TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
{
  if FilterObject = nil then
  begin
     FilterObject := ENDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENDepartmentFilter(FilterObject).conditionSQL := 'parentrefcode is null';
  end;
}


  ENDepartmentList := TempENDepartment.getScrollableFilteredList(departmentFilter,0,-1);

   tvDep.Items.Clear;


    for i:=0 to High(ENDepartmentList.list) do
      begin
        ///////
        tvDep.Items.AddChild(nil, ENDepartmentList.list[i].shortName + ';;;;;' + ENDepartmentList.list[i].typeRefName ).Data := ENDepartmentList.list[i];
      end;

      SetGridHeaders(ENManningTableHeaders, sgENManningTable.ColumnHeaders);

      if  tvDep.Items.Count > 0 then
        tvDep.Items[0].Selected := true;
      tvDep.SetFocus;

      
{
  SetGridHeaders(ENManningTableHeaders, sgENManningTable.ColumnHeaders);
  ColCount:=100;
  TempENManningTable :=  HTTPRIOENManningTable as ENManningTableControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENManningTableFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENManningTableList := TempENManningTable.getScrollableFilteredList(ENManningTableFilter(FilterObject),0,ColCount);


  LastCount:=High(ENManningTableList.list);

  if LastCount > -1 then
     sgENManningTable.RowCount:=LastCount+2
  else
     sgENManningTable.RowCount:=2;

   with sgENManningTable do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENManningTableList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENManningTableList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENManningTableList.list[i].positionName;
        Cells[2,i+1] := ENManningTableList.list[i].departmentShortName;

        if ENManningTableList.list[i].dateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENManningTableList.list[i].dateStart);
        if ENManningTableList.list[i].dateFinal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENManningTableList.list[i].dateFinal);
        LastRow:=i+1;
        sgENManningTable.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENManningTable.Row:=1;
}   
end;

procedure TfrmENManningTableShow.sgENManningTableTopLeftChanged(Sender: TObject);
var
  TempENManningTable: ENManningTableControllerSoapPort;
  i,CurrentRow: Integer;
  ENManningTableList: ENManningTableShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENManningTable.TopRow + sgENManningTable.VisibleRowCount) = ColCount
  then
    begin
      TempENManningTable :=  HTTPRIOENManningTable as ENManningTableControllerSoapPort;
      CurrentRow:=sgENManningTable.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENManningTableFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENManningTableList := TempENManningTable.getScrollableFilteredList(ENManningTableFilter(FilterObject),ColCount-1, 100);



  sgENManningTable.RowCount:=sgENManningTable.RowCount+100;
  LastCount:=High(ENManningTableList.list);
  with sgENManningTable do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENManningTableList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENManningTableList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENManningTableList.list[i].positionName;
        Cells[2,i+CurrentRow] := ENManningTableList.list[i].departmentShortName;
        if ENManningTableList.list[i].dateStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENManningTableList.list[i].dateStart);
        if ENManningTableList.list[i].dateFinal = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENManningTableList.list[i].dateFinal);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENManningTable.Row:=CurrentRow-5;
   sgENManningTable.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENManningTableShow.sgENManningTableDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENManningTable,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENManningTableShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENManningTable.RowCount-1 do
   for j:=0 to sgENManningTable.ColCount-1 do
     sgENManningTable.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENManningTableShow.actViewExecute(Sender: TObject);
Var TempENManningTable: ENManningTableControllerSoapPort;
begin
 TempENManningTable := HTTPRIOENManningTable as ENManningTableControllerSoapPort;
   try
     ENManningTableObj := TempENManningTable.getObject(StrToInt(sgENManningTable.Cells[0,sgENManningTable.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENManningTableEdit:=TfrmENManningTableEdit.Create(Application, dsView);
  try
    frmENManningTableEdit.ShowModal;
  finally
    frmENManningTableEdit.Free;
    frmENManningTableEdit:=nil;
  end;
end;

procedure TfrmENManningTableShow.actEditExecute(Sender: TObject);
Var TempENManningTable: ENManningTableControllerSoapPort;
begin
 TempENManningTable := HTTPRIOENManningTable as ENManningTableControllerSoapPort;
   try
     ENManningTableObj := TempENManningTable.getObject(StrToInt(sgENManningTable.Cells[0,sgENManningTable.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENManningTableEdit:=TfrmENManningTableEdit.Create(Application, dsEdit);
  try
    if frmENManningTableEdit.ShowModal= mrOk then
      begin
        //TempENManningTable.save(ENManningTableObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENManningTableEdit.Free;
    frmENManningTableEdit:=nil;
  end;
end;

procedure TfrmENManningTableShow.actDeleteExecute(Sender: TObject);
Var TempENManningTable: ENManningTableControllerSoapPort;
  ObjCode: Integer;
begin
 TempENManningTable := HTTPRIOENManningTable as ENManningTableControllerSoapPort;
   try
     ObjCode := StrToInt(sgENManningTable.Cells[0,sgENManningTable.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Штатний розклад) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENManningTable.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENManningTableShow.actInsertExecute(Sender: TObject);
Var TempENManningTable: ENManningTableControllerSoapPort;
begin
  TempENManningTable := HTTPRIOENManningTable as ENManningTableControllerSoapPort;
  ENManningTableObj:=ENManningTable.Create;

   ENManningTableObj.dateStart:= TXSDate.Create;
   ENManningTableObj.dateFinal:= TXSDate.Create;


  try
    frmENManningTableEdit:=TfrmENManningTableEdit.Create(Application, dsInsert);
    try
      if frmENManningTableEdit.ShowModal = mrOk then
      begin
        if ENManningTableObj<>nil then
            //TempENManningTable.add(ENManningTableObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENManningTableEdit.Free;
      frmENManningTableEdit:=nil;
    end;
  finally
    ENManningTableObj.Free;
  end;
end;

procedure TfrmENManningTableShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENManningTableShow.actFilterExecute(Sender: TObject);
begin
{frmENManningTableFilterEdit:=TfrmENManningTableFilterEdit.Create(Application, dsEdit);
  try
    ENManningTableFilterObj := ENManningTableFilter.Create;
    SetNullIntProps(ENManningTableFilterObj);
    SetNullXSProps(ENManningTableFilterObj);

    if frmENManningTableFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENManningTableFilter.Create;
      FilterObject := ENManningTableFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENManningTableFilterEdit.Free;
    frmENManningTableFilterEdit:=nil;
  end;}
end;

procedure TfrmENManningTableShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENManningTableShow.FormDestroy(Sender: TObject);
begin
  inherited;
if Assigned(departmentFilter) then departmentFilter.Free; 
end;

procedure TfrmENManningTableShow.tvDepDblClick(Sender: TObject);
var
  f , f1 : ENDepartmentFilter;
  c: ENDepartmentControllerSoapPort;
  ENDepartmentList , tempList : ENDepartmentShortList;
  i : integer;
  tn : TTreeNode;
begin
  inherited;

   c := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
   f := ENDepartmentFilter.Create;
   f.parentRef := ENDepartmentRef.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.parentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;

   tvDep.Selected.DeleteChildren;

  ENDepartmentList := c.getScrollableFilteredList(f,0, -1);

  for i:=0 to High(ENDepartmentList.list) do
  begin
         tn := tvDep.Items.AddChild(tvDep.Selected, ENDepartmentList.list[i].shortName);
         //tn := tvDep.Items.AddChild(tvDep.Selected, AnsiReplaceText(ENDepartmentList.list[i].shortName, ';', '/'));

         tn.Data := ENDepartmentList.list[i];

         f1 := ENDepartmentFilter.Create;
         f1.parentRef := ENDepartmentRef.Create;
         SetNullIntProps(f1);
         SetNullXSProps(f1);
         f1.parentRef := ENDepartmentRef.Create;
         f1.parentRef.code := ENDepartmentList.list[i].code;

         tempList := c.getScrollableFilteredList(f1,0, -1);
         //if tempList.totalCount > 0 then
         tn.HasChildren := tempList.totalCount > 0;
  end;
  tvDep.Selected.Expand(false);

end;

procedure TfrmENManningTableShow.tvDepChange(Sender: TObject;
  Node: TTreeNode);
var
  f : ENManningTableFilter;
  TempENManningTable : ENManningTableControllerSoapPort;
  ENManningTableList : ENManningTableShortList;
  i : integer;
begin
  inherited;
  sgENManningTable.Clear;
  SetGridHeaders(ENManningTableHeaders, sgENManningTable.ColumnHeaders);
  ColCount:=100;
  TempENManningTable :=  HTTPRIOENManningTable as ENManningTableControllerSoapPort;

     f := ENManningTableFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);

     f.department := ENDepartment.Create;
     f.department.code := (ENManningTableShort(tvDep.Selected.Data).code);

  ENManningTableList := TempENManningTable.getScrollableFilteredList(f,0,-1);


  LastCount:=High(ENManningTableList.list);

  if LastCount > -1 then
     sgENManningTable.RowCount:=LastCount+2
  else
     sgENManningTable.RowCount:=2;

   with sgENManningTable do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENManningTableList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENManningTableList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENManningTableList.list[i].positionName;
        Cells[2,i+1] := ENManningTableList.list[i].departmentShortName;

        if ENManningTableList.list[i].dateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENManningTableList.list[i].dateStart);
        if ENManningTableList.list[i].dateFinal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENManningTableList.list[i].dateFinal);
        LastRow:=i+1;
        sgENManningTable.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENManningTable.Row:=1;
end;

end.
