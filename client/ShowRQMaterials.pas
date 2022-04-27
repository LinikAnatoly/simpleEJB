
unit ShowRQMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQMaterialsController, ExtCtrls, AdvObj ;


type
  TfrmRQMaterialsShow = class(TChildForm)  
  HTTPRIORQMaterials: THTTPRIO;
    ImageList1: TImageList;
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
    PanelRQMaterialsGroup: TPanel;
    PanelRQMaterials: TPanel;
    Splitter1: TSplitter;
    sgRQMaterials: TAdvStringGrid;
    tvGroups: TTreeView;
    HTTPRIORQMaterialsGroup: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQMaterialsTopLeftChanged(Sender: TObject);
procedure sgRQMaterialsDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure tvGroupsDblClick(Sender: TObject);
    procedure tvGroupsClick(Sender: TObject);

procedure updateRQMaterialsGrid(RQMaterialsList : RQMaterialsShortList);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmRQMaterialsShow : TfrmRQMaterialsShow;
 // RQMaterialsObj: RQMaterials;
 // RQMaterialsFilterObj: RQMaterialsFilter;
  
  
implementation

uses Main, EditRQMaterials, EditRQMaterialsFilter,
  RQMaterialsGroupController;


{$R *.dfm}

var
  //frmRQMaterialsShow : TfrmRQMaterialsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQMaterialsHeaders: array [1..4] of String =
        ( 'Код'
          //,'код из TMC'
          ,'Назва матеріала'
          ,'Од.вим.'
          ,'Група ТМЦ'
        );
   

procedure TfrmRQMaterialsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQMaterialsShow:=nil;
    inherited;
  end;


procedure TfrmRQMaterialsShow.FormShow(Sender: TObject);
var
  TempRQMaterials: RQMaterialsControllerSoapPort;
  i: Integer;
  RQMaterialsList: RQMaterialsShortList;
  begin

    DisableActions([actInsert, actEdit, actDelete]);

    tvGroups.Selected := nil;
    tvGroupsDblClick(Sender);
    tvGroupsClick(Sender);
    
{
  SetGridHeaders(RQMaterialsHeaders, sgRQMaterials.ColumnHeaders);
  ColCount:=100;
  TempRQMaterials :=  HTTPRIORQMaterials as RQMaterialsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterialsList := TempRQMaterials.getScrollableFilteredList(RQMaterialsFilter(FilterObject),0,ColCount);


  LastCount:=High(RQMaterialsList.list);

  if LastCount > -1 then
     sgRQMaterials.RowCount:=LastCount+2
  else
     sgRQMaterials.RowCount:=2;

   with sgRQMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQMaterialsList.list[i].outCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(RQMaterialsList.list[i].outCode);
        Cells[2,i+1] := RQMaterialsList.list[i].name;
        LastRow:=i+1;
        sgRQMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQMaterials.Row:=1;
}

end;

procedure TfrmRQMaterialsShow.sgRQMaterialsTopLeftChanged(Sender: TObject);
var
  TempRQMaterials: RQMaterialsControllerSoapPort;
  i,CurrentRow: Integer;
  RQMaterialsList: RQMaterialsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQMaterials.TopRow + sgRQMaterials.VisibleRowCount) = ColCount
  then
    begin
      TempRQMaterials :=  HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
      CurrentRow:=sgRQMaterials.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterialsList := TempRQMaterials.getScrollableFilteredList(RQMaterialsFilter(FilterObject),ColCount-1, 100);



  sgRQMaterials.RowCount:=sgRQMaterials.RowCount+100;
  LastCount:=High(RQMaterialsList.list);
  with sgRQMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQMaterialsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQMaterialsList.list[i].outCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(RQMaterialsList.list[i].outCode);
        Cells[2,i+CurrentRow] := RQMaterialsList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQMaterials.Row:=CurrentRow-5;
   sgRQMaterials.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQMaterialsShow.sgRQMaterialsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQMaterials,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQMaterialsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQMaterials.RowCount-1 do
   for j:=0 to sgRQMaterials.ColCount-1 do
     sgRQMaterials.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQMaterialsShow.actViewExecute(Sender: TObject);
Var TempRQMaterials: RQMaterialsControllerSoapPort;
begin
 TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
   try
     RQMaterialsObj := TempRQMaterials.getObject(StrToInt(sgRQMaterials.Cells[0,sgRQMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterialsEdit:=TfrmRQMaterialsEdit.Create(Application, dsView);
  try
    frmRQMaterialsEdit.ShowModal;
  finally
    frmRQMaterialsEdit.Free;
    frmRQMaterialsEdit:=nil;
  end;
end;

procedure TfrmRQMaterialsShow.actEditExecute(Sender: TObject);
Var TempRQMaterials: RQMaterialsControllerSoapPort;
begin
 TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
   try
     RQMaterialsObj := TempRQMaterials.getObject(StrToInt(sgRQMaterials.Cells[0,sgRQMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterialsEdit:=TfrmRQMaterialsEdit.Create(Application, dsEdit);
  try
    if frmRQMaterialsEdit.ShowModal= mrOk then
      begin
        //TempRQMaterials.save(RQMaterialsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQMaterialsEdit.Free;
    frmRQMaterialsEdit:=nil;
  end;
end;

procedure TfrmRQMaterialsShow.actDeleteExecute(Sender: TObject);
Var TempRQMaterials: RQMaterialsControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQMaterials.Cells[0,sgRQMaterials.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Справочник материалов (Собств.Зак.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQMaterials.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQMaterialsShow.actInsertExecute(Sender: TObject);
Var TempRQMaterials: RQMaterialsControllerSoapPort;
begin
  TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
  RQMaterialsObj:=RQMaterials.Create;

   RQMaterialsObj.dateCreate:= TXSDate.Create;
   RQMaterialsObj.dateDelete:= TXSDate.Create;


  try
    frmRQMaterialsEdit:=TfrmRQMaterialsEdit.Create(Application, dsInsert);
    try
      if frmRQMaterialsEdit.ShowModal = mrOk then
      begin
        if RQMaterialsObj<>nil then
            //TempRQMaterials.add(RQMaterialsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQMaterialsEdit.Free;
      frmRQMaterialsEdit:=nil;
    end;
  finally
    RQMaterialsObj.Free;
  end;
end;

procedure TfrmRQMaterialsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQMaterialsShow.actFilterExecute(Sender: TObject);
var
  RQMaterialsList: RQMaterialsShortList;
  TempRQMaterials: RQMaterialsControllerSoapPort;
  f : RQMaterialsFilter;
begin
  frmRQMaterialsFilterEdit:=TfrmRQMaterialsFilterEdit.Create(Application, dsEdit);
  try
    RQMaterialsFilterObj := RQMaterialsFilter.Create;
    SetNullIntProps(RQMaterialsFilterObj);
    SetNullXSProps(RQMaterialsFilterObj);

    if frmRQMaterialsFilterEdit.ShowModal = mrOk then
    begin

      //FilterObject := RQMaterialsFilter.Create;
      //actUpdateExecute(Sender);

      HideControls([PanelRQMaterialsGroup, Splitter1]) ;

      f := RQMaterialsFilterObj;
      TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;

      RQMaterialsList := TempRQMaterials.getScrollableFilteredList(f, 0, -1);

      updateRQMaterialsGrid(RQMaterialsList);
    end;
  finally
    frmRQMaterialsFilterEdit.Free;
    frmRQMaterialsFilterEdit:=nil;
  end;
end;


procedure TfrmRQMaterialsShow.actNoFilterExecute(Sender: TObject);
begin
   HideControls([PanelRQMaterialsGroup, Splitter1], false) ;
   tvGroups.Items.Clear;
   tvGroups.Selected := nil;
   tvGroupsDblClick(Sender);
   tvGroupsClick(Sender);
{
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
}
end;

procedure TfrmRQMaterialsShow.tvGroupsDblClick(Sender: TObject);
var
  TempRQMaterials: RQMaterialsControllerSoapPort;
  i: Integer;
  RQMaterialsList: RQMaterialsShortList;
  TempRQMaterialsGroup : RQMaterialsGroupControllerSoapPort;
  RQMaterialsGroupList, gList : RQMaterialsGroupShortList;
  g, g1 : RQMaterialsGroupFilter;
  m : RQMaterialsFilter;
  tn : TTreeNode;
begin

   TempRQMaterialsGroup := HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;
   TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;

   if tvGroups.Selected <> nil then
   begin
      g := RQMaterialsGroupFilter.Create;
      SetNullIntProps(g);
      SetNullXSProps(g);
      g.parentRef := RQMaterialsGroupRef.Create;
      g.parentRef.code :=  RQMaterialsGroupShort(tvGroups.Selected.Data).code;

      tvGroups.Selected.DeleteChildren;

      RQMaterialsGroupList := TempRQMaterialsGroup.getScrollableFilteredList(g,0,-1);
   end
   else
   begin

      g := RQMaterialsGroupFilter.Create;
      SetNullIntProps(g);
      SetNullXSProps(g);
      //g.parentRef := RQMaterialsGroupRef.Create;
      //g.parentRef.code :=  RQMaterialsGroupShort(tvGroups.Selected.Data).code;
      g.conditionSQL := 'g1.parentrefcode is null';

      RQMaterialsGroupList := TempRQMaterialsGroup.getScrollableFilteredList(g,0,-1);
   end;

   for i:=0 to High(RQMaterialsGroupList.list) do
   begin
      tn := tvGroups.Items.AddChild(tvGroups.Selected, RQMaterialsGroupList.list[i].name);
      tn.Data := RQMaterialsGroupList.list[i];
      {
      g1 := RQMaterialsGroupFilter.Create;
      SetNullIntProps(g1);
      SetNullXSProps(g1);
      gList :=  TempRQMaterialsGroup.getScrollableFilteredList(g1,0,-1);
      }
      tn.HasChildren := RQMaterialsGroupList.list[i].childCount > 0;
      

   end;

  if tvGroups.Selected <> nil then
    tvGroups.Selected.Expand(false);


end;


procedure TfrmRQMaterialsShow.updateRQMaterialsGrid(RQMaterialsList : RQMaterialsShortList);
var
i,j : Integer;
begin
  SetGridHeaders(RQMaterialsHeaders, sgRQMaterials.ColumnHeaders);

  for i:=1 to sgRQMaterials.RowCount-1 do
   for j:=0 to sgRQMaterials.ColCount-1 do
     sgRQMaterials.Cells[j,i]:='';
  sgRQMaterials.RowCount:=2;

  
if RQMaterialsList = nil then Exit;

  if High(RQMaterialsList.list) > -1 then
     sgRQMaterials.RowCount:=High(RQMaterialsList.list)+2
  else
     sgRQMaterials.RowCount:=2;

   with sgRQMaterials do
    for i:=0 to High(RQMaterialsList.list) do
      begin
        Application.ProcessMessages;
        if RQMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';
{
        if RQMaterialsList.list[i].outCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(RQMaterialsList.list[i].outCode);
}
        Cells[1,i+1] := RQMaterialsList.list[i].name;
        Cells[2, i+1] := RQMaterialsList.list[i].measurementName;
        Cells[3, i+1] := RQMaterialsList.list[i].groupRefName;
        LastRow:=i+1;
        sgRQMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQMaterials.Row:=1;

end;


procedure TfrmRQMaterialsShow.tvGroupsClick(Sender: TObject);
var
  RQMaterialsList: RQMaterialsShortList;
  TempRQMaterials: RQMaterialsControllerSoapPort;
  f : RQMaterialsFilter;
  i,j: Integer;
begin
  inherited;

  if tvGroups.Selected <> nil then
  begin
      TempRQMaterials := HTTPRIORQMaterials as RQMaterialsControllerSoapPort;
      f := RQMaterialsFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);
      f.groupRef := RQMaterialsGroupRef.Create;
      f.groupRef.code := RQMaterialsGroupShort(tvGroups.Selected.Data).code;
      f.conditionSQL := 'rqmaterials.datedelete is null';
      RQMaterialsList := TempRQMaterials.getScrollableFilteredList(f, 0, -1);
      updateRQMaterialsGrid(RQMaterialsList);
  end
  else
      updateRQMaterialsGrid(nil);

end;

end.