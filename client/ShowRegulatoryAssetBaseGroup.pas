unit ShowRegulatoryAssetBaseGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RegulatoryAssetBaseCalculationController, AdvObj, CommCtrl, StdCtrls, Generics.Collections;


type
    TfrmRegulatoryAssetBaseGroupShow = class(TChildForm)  
    HTTPRIORegulatoryAssetBaseGroup: THTTPRIO;
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
    tvMain: TTreeView;
    GroupBox1: TGroupBox;
    btnCancel: TButton;
    btnOk: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvMainExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tvMainDblClick(Sender: TObject);

  private
   { Private declarations }
   isMultiple : Boolean;
   selectedRow: Integer;
   preSelectedList : TList<RegulatoryAssetBaseGroupShort>;
   preSelectedCodesList : TList<Integer>;
   procedure refresh;
   procedure SelectPreSelected;
   function GetListToExpandOnShowWhenPreSelected : TList<RegulatoryAssetBaseGroupShort>;
   function getPathToItem(item : RegulatoryAssetBaseGroupShort) : TList<RegulatoryAssetBaseGroupShort>;
   function getListByParent(parent : RegulatoryAssetBaseGroupShort; recursive : Boolean) : RegulatoryAssetBaseGroupShortList;
   function GetChecked(Node: TTreeNode): Boolean;
   procedure SetChecked(Node: TTreeNode; Checked: Boolean);
   procedure CheckSubNode(Sender: TObject; Node: TTreeNode);
   function GetNodeByData(data : RegulatoryAssetBaseGroupShort) : TTreeNode;
 public
   { Public declarations }
   constructor Create(AOwner: TComponent; FormMode: TFormMode;
                              AFilter : RegulatoryAssetBaseGroupFilter;
                              isMultiple : Boolean;
                              preSelected: RegulatoryAssetBaseGroupShortList); reintroduce; overload;
   function GetMultipleSelected : RegulatoryAssetBaseGroupShortList;
   class function chooseFromList(preSelected : RegulatoryAssetBaseGroupShortList = nil)
      : RegulatoryAssetBaseGroupShort; stdcall; static;
   class function chooseFromListMultiple(preSelected : RegulatoryAssetBaseGroupShortList = nil)
      : RegulatoryAssetBaseGroupShortList; stdcall; static;
 end;


var
  frmRegulatoryAssetBaseGroupShow: TfrmRegulatoryAssetBaseGroupShow;
  
  
implementation

uses Main, Generics.Defaults;

const TVIS_CHECKED = $2000;
  TVIS_UNCHECKED = $1000;

{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

class function TfrmRegulatoryAssetBaseGroupShow.chooseFromList(preSelected : RegulatoryAssetBaseGroupShortList = nil) : RegulatoryAssetBaseGroupShort;
var
  f1 : RegulatoryAssetBaseGroupFilter;
  frmRegulatoryAssetBaseGroupShow : TfrmRegulatoryAssetBaseGroupShow;
  selected : RegulatoryAssetBaseGroupShort;
begin
  inherited;
     selected := nil;
     f1 := RegulatoryAssetBaseGroupFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmRegulatoryAssetBaseGroupShow := TfrmRegulatoryAssetBaseGroupShow.Create(Application, fmNormal, f1, false, preSelected);
       try
          with frmRegulatoryAssetBaseGroupShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := RegulatoryAssetBaseGroupShort(tvMain.Selected.Data);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmRegulatoryAssetBaseGroupShow.Free;
       end;
end;
class function TfrmRegulatoryAssetBaseGroupShow.chooseFromListMultiple(preSelected : RegulatoryAssetBaseGroupShortList = nil) : RegulatoryAssetBaseGroupShortList;
var
  f1 : RegulatoryAssetBaseGroupFilter;
  frmRegulatoryAssetBaseGroupShow : TfrmRegulatoryAssetBaseGroupShow;
  selected : RegulatoryAssetBaseGroupShortList;
begin
  inherited;
     selected := nil;
     f1 := RegulatoryAssetBaseGroupFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmRegulatoryAssetBaseGroupShow := TfrmRegulatoryAssetBaseGroupShow.Create(Application, fmNormal, f1, true, preSelected);
       try
          with frmRegulatoryAssetBaseGroupShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := GetMultipleSelected;
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmRegulatoryAssetBaseGroupShow.Free;
       end;
end;

constructor TfrmRegulatoryAssetBaseGroupShow.Create(AOwner: TComponent; FormMode: TFormMode;
                              AFilter : RegulatoryAssetBaseGroupFilter;
                              isMultiple : Boolean;
                              preSelected: RegulatoryAssetBaseGroupShortList);
var
  item : RegulatoryAssetBaseGroupShort;
begin
  inherited Create(AOwner, FormMode, Afilter);
  Self.isMultiple := isMultiple;
  if Assigned(preSelected) and Assigned(preSelected.list) then begin
    Self.preSelectedList := TList<RegulatoryAssetBaseGroupShort>.Create;
    Self.preSelectedCodesList := TList<Integer>.Create;
    Self.preSelectedList.AddRange(preSelected.list);
    for item in Self.preSelectedList do Self.preSelectedCodesList.Add(item.code);
  end;
end;

function TfrmRegulatoryAssetBaseGroupShow.GetChecked(Node: TTreeNode): Boolean;
var
 Item :TTVItem;
begin
 Item.Mask  := TVIF_STATE;
 Item.hItem := Node.ItemId;
 TreeView_GetItem(Node.TreeView.Handle, Item);
 Result := (Item.State and TVIS_CHECKED) = TVIS_CHECKED;
end;
procedure TfrmRegulatoryAssetBaseGroupShow.SetChecked(Node: TTreeNode; Checked: Boolean);
var
 Item :TTVItem;
begin
 FillChar(Item, SizeOf(TTVItem), 0);
 with Item do
 begin
   hItem     := Node.ItemId;
   Mask      := TVIF_STATE;
   StateMask := TVIS_STATEIMAGEMASK;
   if Checked then
     Item.State :=TVIS_CHECKED
   else
     Item.State :=TVIS_CHECKED shr 1;
   TreeView_SetItem(Node.TreeView.Handle, Item);
 end;
end;
procedure TfrmRegulatoryAssetBaseGroupShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmRegulatoryAssetBaseGroupShow:=nil;
  inherited;
end;


procedure TfrmRegulatoryAssetBaseGroupShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmRegulatoryAssetBaseGroupShow.FormShow(Sender: TObject);
begin
  inherited;
  if Self.isMultiple then begin
    SetWindowLong(tvMain.Handle, GWL_STYLE, GetWindowLong(tvMain.Handle, GWL_STYLE) or TVS_CHECKBOXES);
  end;
  refresh;
  SelectPreSelected;
  
end;

procedure TfrmRegulatoryAssetBaseGroupShow.actViewExecute(Sender: TObject);
{var
  TempRegulatoryAssetBaseGroup: RegulatoryAssetBaseGroupControllerSoapPort; }
begin
{  TempRegulatoryAssetBaseGroup := HTTPRIORegulatoryAssetBaseGroup as RegulatoryAssetBaseGroupControllerSoapPort;
  try
    RegulatoryAssetBaseGroupObj := TempRegulatoryAssetBaseGroup.getObject(StrToInt(sgRegulatoryAssetBaseGroup.Cells[0, sgRegulatoryAssetBaseGroup.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRegulatoryAssetBaseGroupEdit := TfrmRegulatoryAssetBaseGroupEdit.Create(Application, dsView);
  try
    frmRegulatoryAssetBaseGroupEdit.ShowModal;
  finally
    frmRegulatoryAssetBaseGroupEdit.Free;
    frmRegulatoryAssetBaseGroupEdit := nil;
  end;}
end;


procedure TfrmRegulatoryAssetBaseGroupShow.actEditExecute(Sender: TObject);
{var
  TempRegulatoryAssetBaseGroup: RegulatoryAssetBaseGroupControllerSoapPort; }
begin
{  TempRegulatoryAssetBaseGroup := HTTPRIORegulatoryAssetBaseGroup as RegulatoryAssetBaseGroupControllerSoapPort;
  try
    RegulatoryAssetBaseGroupObj := TempRegulatoryAssetBaseGroup.getObject(StrToInt(sgRegulatoryAssetBaseGroup.Cells[0,sgRegulatoryAssetBaseGroup.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRegulatoryAssetBaseGroup.Row;
  frmRegulatoryAssetBaseGroupEdit:=TfrmRegulatoryAssetBaseGroupEdit.Create(Application, dsEdit);
  
  try
    if frmRegulatoryAssetBaseGroupEdit.ShowModal= mrOk then
      begin
        //TempRegulatoryAssetBaseGroup.save(RegulatoryAssetBaseGroupObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRegulatoryAssetBaseGroupEdit.Free;
    frmRegulatoryAssetBaseGroupEdit:=nil;
  end;

  if sgRegulatoryAssetBaseGroup.RowCount > selectedRow then
    sgRegulatoryAssetBaseGroup.Row := selectedRow
  else
    sgRegulatoryAssetBaseGroup.Row := sgRegulatoryAssetBaseGroup.RowCount - 1;
 }
end;


procedure TfrmRegulatoryAssetBaseGroupShow.actDeleteExecute(Sender: TObject);
{Var TempRegulatoryAssetBaseGroup: RegulatoryAssetBaseGroupControllerSoapPort;
  ObjCode: Integer;}
begin
{ TempRegulatoryAssetBaseGroup := HTTPRIORegulatoryAssetBaseGroup as RegulatoryAssetBaseGroupControllerSoapPort;
   try
     ObjCode := StrToInt(sgRegulatoryAssetBaseGroup.Cells[0,sgRegulatoryAssetBaseGroup.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Довідник груп активів регуляторної бази)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRegulatoryAssetBaseGroup.remove(ObjCode);
      UpdateGrid(Sender);
  end; }
end;

procedure TfrmRegulatoryAssetBaseGroupShow.actInsertExecute(Sender: TObject);
// Var TempRegulatoryAssetBaseGroup: RegulatoryAssetBaseGroupControllerSoapPort; 
begin
  // TempRegulatoryAssetBaseGroup := HTTPRIORegulatoryAssetBaseGroup as RegulatoryAssetBaseGroupControllerSoapPort;  /// Это здесь уже лишнее!!!
{  RegulatoryAssetBaseGroupObj:=RegulatoryAssetBaseGroup.Create;
  SetNullIntProps(RegulatoryAssetBaseGroupObj);
  SetNullXSProps(RegulatoryAssetBaseGroupObj);



  try
    frmRegulatoryAssetBaseGroupEdit:=TfrmRegulatoryAssetBaseGroupEdit.Create(Application, dsInsert);
    try
      if frmRegulatoryAssetBaseGroupEdit.ShowModal = mrOk then
      begin
        if RegulatoryAssetBaseGroupObj<>nil then
            //TempRegulatoryAssetBaseGroup.add(RegulatoryAssetBaseGroupObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRegulatoryAssetBaseGroupEdit.Free;
      frmRegulatoryAssetBaseGroupEdit:=nil;
    end;
  finally
    RegulatoryAssetBaseGroupObj.Free;
  end;}
end;


procedure TfrmRegulatoryAssetBaseGroupShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;

end;


procedure TfrmRegulatoryAssetBaseGroupShow.actFilterExecute(Sender: TObject);
begin
{frmRegulatoryAssetBaseGroupFilterEdit:=TfrmRegulatoryAssetBaseGroupFilterEdit.Create(Application, dsInsert);
  try
    RegulatoryAssetBaseGroupFilterObj := RegulatoryAssetBaseGroupFilter.Create;
    SetNullIntProps(RegulatoryAssetBaseGroupFilterObj);
    SetNullXSProps(RegulatoryAssetBaseGroupFilterObj);

    if frmRegulatoryAssetBaseGroupFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := RegulatoryAssetBaseGroupFilter.Create;
      FilterObject := RegulatoryAssetBaseGroupFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRegulatoryAssetBaseGroupFilterEdit.Free;
    frmRegulatoryAssetBaseGroupFilterEdit:=nil;
  end;}
end;


procedure TfrmRegulatoryAssetBaseGroupShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
end;

procedure TfrmRegulatoryAssetBaseGroupShow.refresh;
var
  node : TTreeNode;
  item : RegulatoryAssetBaseGroupShort;
  list : RegulatoryAssetBaseGroupShortList;
begin
  list := Self.getListByParent(nil, false);
  if Assigned(list) then begin
    for item in list.list do begin
          node := tvMain.Items.Add(nil, item.number + ' ' + item.name);
          node.Data := item;
          node.HasChildren := (Assigned(item.hasChildren)) and (item.hasChildren.asBoolean);
    end;
  end;
end;

procedure TfrmRegulatoryAssetBaseGroupShow.tvMainDblClick(Sender: TObject);
begin
  if FormMode = fmNormal then
  begin
    if not Self.isMultiple then ModalResult:=mrOk;
  end
end;

procedure TfrmRegulatoryAssetBaseGroupShow.tvMainExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  firstChild : TTreeNode;
  item : RegulatoryAssetBaseGroupShort;
  list : RegulatoryAssetBaseGroupShortList;
  addedNode : TTreeNode;
  checked : Boolean;
begin
  inherited;
  if not Node.HasChildren then Exit;
  firstChild := Node.getFirstChild;
  if not Assigned(firstChild) then begin
    list := Self.getListByParent(RegulatoryAssetBaseGroupShort(Node.Data), false);
    checked := GetChecked(Node);
    if Assigned(list) then begin
      for item in list.list do begin
            addedNode := tvMain.Items.AddChild(Node, item.number + ' ' + item.name);
            addedNode.Data := item;
            addedNode.HasChildren := (Assigned(item.hasChildren)) and (item.hasChildren.asBoolean);
            if checked then begin
              if (not Assigned(Self.preSelectedList)
                or (not Self.preSelectedList.Count = 0)
                or Self.preSelectedCodesList.Contains(item.code)) then
                SetChecked(addedNode, checked);
            end;
      end;
    end;
  end;
end;

procedure TfrmRegulatoryAssetBaseGroupShow.tvMainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  NodeParent, Node: TTreeNode;
  Checked, AllChecked : Boolean;
begin
  Node:=(Sender as TCustomTreeView).GetNodeAt(X, Y);
  if (Node <> nil) and ((Sender as TCustomTreeView).GetHitTestInfoAt(X, Y) = [htOnItem, htOnStateIcon]) then
      CheckSubNode(Sender, Node);
    {if Node.Parent<>nil then
      begin
        NodeParent:=Node.Parent;
        AllChecked := True;
        Node:=NodeParent.getFirstChild;
        while Assigned(Node) do
          begin
            if not GetChecked(Node) then begin
              AllChecked := false;
              Break;
            end;
              //Checked:=True;
            Node:=NodeParent.GetNextChild(Node);
          end;
        if not AllChecked then
          SetChecked(NodeParent, false)
        else
          SetChecked(NodeParent, true);
      end;}
end;

procedure TfrmRegulatoryAssetBaseGroupShow.CheckSubNode(Sender: TObject; Node: TTreeNode);
var
  flag: boolean;
begin
  if not Node.HasChildren then Exit;
  flag:= GetChecked(Node);
  Node:=Node.getFirstChild;
  while Assigned(Node) do
    begin
      SetChecked(Node, flag);
      CheckSubNode(Sender, Node);
      Node:=Node.GetNextChild(Node);
    end;
end;

function TfrmRegulatoryAssetBaseGroupShow.GetMultipleSelected : RegulatoryAssetBaseGroupShortList;
var selected, list : RegulatoryAssetBaseGroupShortList;
selectedList : TList<RegulatoryAssetBaseGroupShort>;
item : RegulatoryAssetBaseGroupShort;
node, firstChild : TTreeNode;
arr : ArrayOfRegulatoryAssetBaseGroupShort;
state : Boolean;
i : Integer;
begin
  selected := RegulatoryAssetBaseGroupShortList.Create;
  selectedList := TList<RegulatoryAssetBaseGroupShort>.Create;
  node := tvMain.Items.GetFirstNode;
  while Assigned(node) do begin
    state := GetChecked(node);
    if state then begin
      selectedList.Add(RegulatoryAssetBaseGroupShort(node.Data));
      if node.HasChildren then begin
        firstChild := node.getFirstChild;
        if not Assigned(firstChild) then begin
          list := Self.getListByParent(RegulatoryAssetBaseGroupShort(node.Data), true);
          for item in list.list do selectedList.Add(item);
        end;
      end;
    end;
    node := node.GetNext;
  end;
  selected.totalCount := selectedList.Count;
  SetLength(arr, selected.totalCount);
  i := 0;
  for item in selectedList do begin
    arr[i] := item;
    i := i + 1;
  end;
  selected.list := arr;
  Result := selected;
end;

function TfrmRegulatoryAssetBaseGroupShow.getListByParent(parent : RegulatoryAssetBaseGroupShort; recursive : Boolean) : RegulatoryAssetBaseGroupShortList;
var
  TempRegularAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  list, listItem : RegulatoryAssetBaseGroupShortList;
  arr : ArrayOfRegulatoryAssetBaseGroupShort;
  filter : RegulatoryAssetBaseGroupFilter;
  item : RegulatoryAssetBaseGroupShort;
  lists : TList<RegulatoryAssetBaseGroupShortList>;
  i : Integer;
begin
  TempRegularAssetBaseCalculation := HTTPRIORegulatoryAssetBaseGroup as RegulatoryAssetBaseCalculationControllerSoapPort;
  filter := RegulatoryAssetBaseGroupFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  if Assigned(parent) then begin
    filter.parentRef := RegulatoryAssetBaseGroupRef.Create;
    filter.parentRef.code := parent.code;
  end else begin
    filter.conditionSQL := 'REGULATORYASSETBASEGRP.PARENTREFCODE IS NULL';
  end;
  list := TempRegularAssetBaseCalculation.getScrollableFilteredListOfGroups(filter, 0, -1);
  if recursive then begin
    lists := TList<RegulatoryAssetBaseGroupShortList>.Create;
    lists.Add(list);
    for item in list.list do begin
      if Assigned(item.hasChildren) and item.hasChildren.asBoolean then begin
        lists.Add(Self.getListByParent(item, True));
      end;
    end;
    list := RegulatoryAssetBaseGroupShortList.Create;
    for listItem in lists do list.totalCount := list.totalCount + listItem.totalCount;
    SetLength(arr, list.totalCount);
    i := 0;
    for listItem in lists do begin
      for item in listItem.list do begin
        arr[i] := item;
        i := i + 1;
      end;
    end;
    list.list := arr;
  end;
  Result := list;
end;
function TfrmRegulatoryAssetBaseGroupShow.getPathToItem(item : RegulatoryAssetBaseGroupShort) : TList<RegulatoryAssetBaseGroupShort>;
var
  TempRegularAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  list : TList<RegulatoryAssetBaseGroupShort>;
  parentItem : RegulatoryAssetBaseGroupShort;
  filter : RegulatoryAssetBaseGroupFilter;
begin
  list := TList<RegulatoryAssetBaseGroupShort>.Create;
  if not Assigned(item) or (item.parentRefCode = Low(Integer)) then begin
    Result := list;
    Exit;
  end;
  TempRegularAssetBaseCalculation := HTTPRIORegulatoryAssetBaseGroup as RegulatoryAssetBaseCalculationControllerSoapPort;
  filter := RegulatoryAssetBaseGroupFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.code := item.parentRefCode;
  parentItem := TempRegularAssetBaseCalculation.getScrollableFilteredListOfGroups(filter, 0, 1).list[0];
  list.AddRange(Self.getPathToItem(parentItem));
  list.Add(parentItem);
  Result := list;
end;

procedure TfrmRegulatoryAssetBaseGroupShow.SelectPreSelected;
var
  node : TTreeNode;
  item, expandItem : RegulatoryAssetBaseGroupShort;
  expandList : TList<RegulatoryAssetBaseGroupShort>;
begin
  if (not Assigned(preSelectedList)) or (not preSelectedList.Count > 0) then
    Exit;
  expandList := GetListToExpandOnShowWhenPreSelected;
  for expandItem in expandList do begin
    node := Self.GetNodeByData(expandItem);
    node.Expand(false);
  end;
  for item in preSelectedList do begin
    node := Self.GetNodeByData(item);
    if Assigned(node) then Self.SetChecked(node, true);
  end;
end;

function TfrmRegulatoryAssetBaseGroupShow.GetNodeByData(data : RegulatoryAssetBaseGroupShort) : TTreeNode;
var node : TTreeNode;
found : Boolean;
begin
  node := nil;
  if not Assigned(data) or (data.code = Low(Integer)) then begin
    Result := node;
    Exit;
  end;
  node := tvMain.Items.getFirstNode;
  found := False;
  while(Assigned(node) and not found) do begin
    found := RegulatoryAssetBaseGroup(node.Data).code = data.code;
    if not found then node := node.getNext;
  end;
  if not found then node := nil;
  Result := node;
end;

function TfrmRegulatoryAssetBaseGroupShow.GetListToExpandOnShowWhenPreSelected : TList<RegulatoryAssetBaseGroupShort>;
var
  list, path : TList<RegulatoryAssetBaseGroupShort>;
  processedCodes : TList<Integer>;
  compareByParent : TComparison<RegulatoryAssetBaseGroupShort>;
  item, pathItem, child : RegulatoryAssetBaseGroupShort;
  needToExpand : Boolean;
  childList : RegulatoryAssetBaseGroupShortList;
begin
  list := TList<RegulatoryAssetBaseGroupShort>.Create;
  if (not Assigned(preSelectedList)) or (not preSelectedList.Count > 0) then begin
    Result := list;
    Exit;
  end;
  processedCodes := TList<Integer>.Create;
  compareByParent := function(const Left, Right: RegulatoryAssetBaseGroupShort): Integer begin
      Result :=  (Left.parentRefCode - Right.parentRefCode)
    end;
  preSelectedList.Sort(TComparer<RegulatoryAssetBaseGroupShort>.Construct(compareByParent));
  for item in preSelectedList do preSelectedCodesList.Add(item.code);
  for item in preSelectedList do begin
    if ((item.parentRefCode = Low(Integer))) or (processedCodes.Contains(item.parentRefCode)) then Continue;
    path := Self.getPathToItem(item);
    for pathItem in path do begin
      if not processedCodes.Contains(pathItem.code) then begin
        childList := Self.getListByParent(pathItem, true);
        needToExpand := False;
        for child in childList.list do if not preSelectedCodesList.Contains(child.code) then begin
          needToExpand := True;
          Break;
        end;
        if needToExpand then list.add(pathItem);
        processedCodes.Add(pathItem.code);
      end;
    end;
  end;
  Result := list;
end;
end.
