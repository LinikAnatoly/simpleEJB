
unit ShowCCTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  CNSubsystemTypeController, AdvObj, StdCtrls, Clipbrd, DMReportsUnit;


type
  TfrmCCTreeShow = class(TChildForm)
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    gbSO2Node: TGroupBox;
    sgENSO2Node: TAdvStringGrid;
    grpCCNodeTree: TGroupBox;
    MainTree: TTreeView;
    pmMainTree: TPopupMenu;
    btnTreeRefresh: TMenuItem;
    btnTreeCollapse: TMenuItem;
    MenuItem31: TMenuItem;
    btnNodeNameToClipboard: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    ImageListCC: TImageList;
    ImageListCCState: TImageList;
    HTTPRIOENSO2Node: THTTPRIO;
    HTTPRIOCCNode: THTTPRIO;
    HTTPRIOCCNodeExt: THTTPRIO;
    gbButtons: TGroupBox;
    btnSearchInTree: TButton;
    btnShowSO2NodesChild: TButton;
    pmSO2Node: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    HTTPRIOENServicesObject: THTTPRIO;
    btnPrintSO2NodesLinks: TButton;
    btnSubstation: TButton;
    btnMeteringReport: TButton;
    HTTPRIOCCElementData: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpdateMainTreeTop();
    procedure btnTreeRefreshClick(Sender: TObject);
    procedure btnTreeCollapseClick(Sender: TObject);
    procedure btnNodeNameToClipboardClick(Sender: TObject);
    procedure btnSearchInTreeClick(Sender: TObject);
    procedure ShowNodeInTree(NodeCode: Integer);
    procedure UpdateMainTreeBranch(parentNode: TTreeNode);
    procedure MainTreeAdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
    procedure MainTreeExpanding(Sender: TObject;
    Node: TTreeNode; var AllowExpansion: Boolean);
    procedure MainTreeMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure updateSO2NodeByChildNodes;
    procedure updateSO2NodeBySelectedNode;
    procedure btnShowSO2NodesChildClick(Sender: TObject);
    procedure MainTreeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure sgENSO2NodeDblClick(Sender: TObject);
    procedure btnPrintSO2NodesLinksClick(Sender: TObject);
    procedure btnSubstationClick(Sender: TObject);
    procedure btnMeteringReportClick(Sender: TObject);


  private
   { Private declarations }
 public
   { Public declarations }

 end;

var
   frmCCTreeShow : TfrmCCTreeShow;
  
  
implementation

uses Main, CCNodeExtController, CCNodeController, EditCCNodeFilter, ShowCCNode,
  ENSO2NodeController, EditENSO2Node, EditENServicesConnection,
  ENServicesObjectController, PrintBindingSelectedNode,
  CCElementDataController, ENSubstation04Controller, CCNodeTypeController,
  EditENSubstation04, CCReportController, CCDMReportUnit ;


{$R *.dfm}

var


  nodeColCount, nodeLastCount: Integer;
  nodeLastRow: Integer = 1;
  ENSO2NodeHeaders: array [1..32] of String =
        ( 'Код'
          ,'код об''єкта'
          ,'назва об''єкта'
          ,'потужність'
          ,'потужність існуюча'
          ,'точка забезп.потужн.ТУ'
          ,'точка приєднання ТУ'
          ,'Роботи безпосередньо по приєднанню'
          ,'опис точки'
          ,'приймає участь у розрахунку резерва'
          ,'Тип точки'
          ,'Номер\дата договору'
          ,'Найменування договору'
          ,'Статус договору'
          ,'об''єкт приэднання'
          ,'адреса об''єкту приэднання'
          ,'напруга'
          ,'напруга існуюча'
          ,'підрозділ'
          ,'№ТУ'
          ,'дата ТУ'
          ,'тип приєднання'
          ,'фактична дата підключення'
          ,'назва Ф04'
          ,'назва ТП10(6)/04'
          ,'назва Ф10(6)'
          ,'назва ПС35/10(6)'
          ,'назва Ф35'
          ,'назва ПС150'
          ,'назва Ф150'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
        );

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

   

procedure TfrmCCTreeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmCCTreeShow:=nil;
    inherited;

  end;


procedure TfrmCCTreeShow.FormShow(Sender: TObject);
begin
  inherited;
  UpdateMainTreeTop;
end;

procedure TfrmCCTreeShow.btnMeteringReportClick(Sender: TObject);
var
  request: CCReportRequestEx;
  argNames, args: ArrayOfString;
  reportName : String;
  showDetails : String;
begin

  if MainTree.Selected = nil then
  begin
     ShowMessage('Оберіть вузел дерева об''єктів CallCentre');
     exit;
  end;

  case CCNodeExtShort(MainTree.Selected.Data).nodetypeCode of
  1,3,5,7:
      begin
        SetLength(argNames,1);
        SetLength(args,1);
        argNames[0] := 'feederCode';
        args[0] := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);

        reportName:='/com/ksoe/callcenter/reports/Metering/MeteringFeeder.jasper';
      end;
  2,4,6:
      begin
        case Application.MessageBox(PChar('Включить в отчет замеры фидеров ?'),
                        PChar('Внимание !'),MB_ICONQUESTION+MB_YESNOCANCEL+MB_DEFBUTTON1) of
        IDYES:  showDetails:='1';
        IDNO:   showDetails:='0';
        IDCANCEL: Exit;
        end;

        SetLength(argNames,2);
        SetLength(args,2);
        argNames[0] := 'substationCode';
        args[0] := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);
        argNames[1] := 'showDetails';
        args[1] := showDetails;

        reportName:='/com/ksoe/callcenter/reports/Metering/MeteringSubstation.jasper';
      end
  else Exit;
  end;

  request := CCReportRequestEx.Create;
  request.argNames:=argNames;
  request.args:=args;
  request.resultType:=Low(Integer);
  request.reportCode := 0;
  request.funcName := reportName;

  CCDMReport.makeGeneralReportPDF('MeteringReport', request, 'xls');

end;

procedure TfrmCCTreeShow.btnNodeNameToClipboardClick(Sender: TObject);
begin
  inherited;
    if MainTree.Selected=nil then exit;
  Clipboard.SetTextBuf(PChar(CCNodeExtShort(MainTree.Selected.Data).name));
end;

procedure TfrmCCTreeShow.btnPrintSO2NodesLinksClick(Sender: TObject);
var argNames, args: EnergyproController.ArrayOfString;
    reportName: String;
    frmPrintBindingSelectedNode: TfrmPrintBindingSelectedNode;
begin
          if MainTree.Selected = nil then
          begin
                ShowMessage('Виберіть точку приєднання з дерева об''єктів CallCentre');
                exit;
          end;

          SetLength(argNames, 5);
          SetLength(args, 5);

          argNames[0] := 'ccNodeCode';
          argNames[1] := 'startDateGen';
          argNames[2] := 'endDateGen';
          argNames[3] := 'startFactDateConn';
          argNames[4] := 'endFactDateConn';

          args[0] := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);

          frmPrintBindingSelectedNode := TfrmPrintBindingSelectedNode.Create(Application);
          try
             if frmPrintBindingSelectedNode.ShowModal = mrOk then
             begin
                  if frmPrintBindingSelectedNode.edtDateTUStart.Checked then
                    args[1] := DateToStr(frmPrintBindingSelectedNode.edtDateTUStart.Date)
                  else
                    args[1] :='';
                  if frmPrintBindingSelectedNode.edtDateTUEnd.Checked then
                    args[2] := DateToStr(frmPrintBindingSelectedNode.edtDateTUEnd.Date)
                  else
                    args[2] :='';
                  if frmPrintBindingSelectedNode.edtFactDateConnStart.Checked then
                    args[3] := DateToStr(frmPrintBindingSelectedNode.edtFactDateConnStart.Date)
                  else
                    args[3] :='';
                  if frmPrintBindingSelectedNode.edtFactDateConnEnd.Checked then
                    args[4] := DateToStr(frmPrintBindingSelectedNode.edtFactDateConnEnd.Date)
                  else
                    args[4] :='';
             end;
          finally
              frmPrintBindingSelectedNode.Close;
              frmPrintBindingSelectedNode.Free;
          end;
          if MainTree.Selected = nil then
          begin
                ShowMessage('Виберіть точку приєднання з дерева об''єктів CallCentre');
                exit;
          end;

          reportName :=  'TechConditions/NewConnection_022019/connectionSO2NodeLinks';
          DMReportsUnit.makeReport(reportName , argNames , args , 'xls');
end;

procedure TfrmCCTreeShow.btnSearchInTreeClick(Sender: TObject);
var
  frmCCNodeFilterEdit: TfrmCCNodeFilterEdit;
  frmCCNodeShow: TfrmCCNodeShow;
  i: Integer;
  NodeObj: CCNode;
  TempCCNode: CCNodeControllerSoapPort;
begin
    frmCCNodeFilterEdit := TfrmCCNodeFilterEdit.Create(Application, dsInsert);

    try
      if frmCCNodeFilterEdit.ShowModal <> mrOk then exit
    finally
      frmCCNodeFilterEdit.Free;
      frmCCNodeFilterEdit := nil;
    end;

   frmCCNodeShow:=TfrmCCNodeShow.Create(Application,fmNormal,CCNodeFilterObj);
   TempCCNode:=HTTPRIOCCNode as CCNodeControllerSoapPort;
   try
      with frmCCNodeShow do
      begin
           i:= ShowModal;

           if i = mrOk then
           begin
             try
               NodeObj:=TempCCNode.getObject(StrToInt(GetReturnValue(sgCCNode,0)));
             except
               on EConvertError do Exit;
             end;
           end
             else Exit;
      end;
    finally
      frmCCNodeShow.Free;
   end;

   if NodeObj=nil then Exit;

   ShowNodeInTree(NodeObj.code);
   updateSO2NodeBySelectedNode;
end;

procedure TfrmCCTreeShow.btnShowSO2NodesChildClick(Sender: TObject);
begin
  inherited;
  updateSO2NodeByChildNodes;
end;

procedure TfrmCCTreeShow.btnSubstationClick(Sender: TObject);
var
  i, j: Integer;
  TempCCElementData: CCElementDataControllerSoapPort;
  ccElementList: CCElementDataShortList;
  ccElementFilter: CCElementDataFilter;
  TempENSubstation04: ENSubstation04ControllerSoapPort;
begin

  if MainTree.Selected = nil then
  begin
     ShowMessage('Оберіть вузел дерева об''єктів CallCentre');
     exit;
  end;

  // сделаем пока только для подстанций
  if CCNodeExtShort(MainTree.Selected.Data).nodetypeCode <> 6 then
  Exit;

  TempCCElementData :=  HTTPRIOCCElementData as CCElementDataControllerSoapPort;

  ccElementFilter := CCElementDataFilter.Create;
  SetNullIntProps(ccElementFilter);
  SetNullXSProps(ccElementFilter);

  ccElementFilter.code:=CCNodeExtShort(MainTree.Selected.Data).code;
  ccElementFilter.nodetype := CCNodeTypeRef.Create;
  ccElementFilter.nodetype.code := 6;
  ccElementFilter.orderBySQL:='name';

  ccElementList := TempCCElementData.getScrollableFilteredList(ccElementFilter,0,-1);

  if ccElementList.totalCount > 0 then
  begin

    try
       ENSubstation04Obj := DMReports.getSubstation04ByElement(ccElementList.list[0].elementCode);
     except
     on EConvertError do Exit;
    end;

    frmENSubstation04Edit:=TfrmENSubstation04Edit.Create(Application, dsView);
    try
      frmENSubstation04Edit.ShowModal;
    finally
      frmENSubstation04Edit.Free;
      frmENSubstation04Edit:=nil;
    end;

  end;
end;

procedure TfrmCCTreeShow.btnTreeCollapseClick(Sender: TObject);
begin
  inherited;
  MainTree.FullCollapse;
end;

procedure TfrmCCTreeShow.btnTreeRefreshClick(Sender: TObject);
begin
  inherited;
  UpdateMainTreeTop;
end;

procedure TfrmCCTreeShow.UpdateMainTreeTop();
var
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  CCNodeExtList: CCNodeExtShortList;
  CCNodeExtFilterObj: CCNodeExtFilter;
  currNode: TTreeNode;
  i,j: Integer;
begin
  MainTree.Items.BeginUpdate;

  if MainTree.Items.Count>0 then
  begin
      currNode:=MainTree.Items[0];
      while currNode <> nil do
      begin
         if  assigned(currNode.Data) then Dispose(currNode.Data);
         currNode:=currNode.GetNext;
      end;
  end;

  MainTree.OnChange:=nil;

  MainTree.Items.Clear;

  TempCCNodeExt :=  HTTPRIOCCNodeExt as CCNodeExtControllerSoapPort;
  CCNodeExtFilterObj := CCNodeExtFilter.Create;
  SetNullIntProps(CCNodeExtFilterObj);
  SetNullXSProps(CCNodeExtFilterObj);

  CCNodeExtFilterObj.conditionSQL:='ccnode.parentnodecode is null and ccnode.code not in (select r.code from ccren r)';
  CCNodeExtFilterObj.orderBySQL := 'ccnode.voltage desc, ccnode.name';
  CCNodeExtList := TempCCNodeExt.getScrollableFilteredList(CCNodeExtFilterObj, 0, -1);

  for i:=0 to High(CCNodeExtList.list) do
  begin
    currNode := MainTree.Items.AddObject(nil,CCNodeExtList.list[i].name,pointer(CCNodeExtList.list[i]));
    if CCNodeExtList.list[i].countChildren>0 then currNode.HasChildren:=true;
    if StrToFloat(CCNodeExtList.list[i].voltage.DecimalString)>150 then
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode+9
    else
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode;
    currNode.StateIndex:=-1;
    currNode.ExpandedImageIndex:=currNode.ImageIndex;
    currNode.SelectedIndex:=currNode.ImageIndex;
  end;

  MainTree.Items.EndUpdate;

end;



procedure TfrmCCTreeShow.ShowNodeInTree(NodeCode: Integer);
var
    NodeExtObj: CCNodeExt;
    TreeNodeObj: TTreeNode;
    TempCCNode: CCNodeControllerSoapPort;
    nodesTree: CCNodeShortList;
    nodesFilter: CCNodeFilter;
    i: Integer;
    res: string;
begin
        TempCCNode:= HTTPRIOCCNode as CCNodeControllerSoapPort;

        if TempCCNode.getObject(NodeCode)=nil then
        begin
           ShowMessage('В поточний час такого об''єкта не існує.');
           Exit;
        end;

        if MainTree.Items.Count=0 then UpdateMainTreeTop;

        nodesFilter:= CCNodeFilter.Create;
        SetNullIntProps(nodesFilter);
        SetNullXSProps(nodesFilter);
        nodesFilter.conditionSQL:='ccnode.code in (select sit.nodewithallparents('+intToStr(NodeCode)+'))';
        //nodesFilter.orderBySQL:='ccnode.nodetypecode';
        nodesFilter.orderBySQL:='(select count(*) from sit.nodewithallparents(ccnode.code))';
        nodesTree:=TempCCNode.getScrollableFilteredList(nodesFilter,0,-1);

        for i:=0 to High(nodesTree.list) do
        begin
           if i=0 then
              TreeNodeObj:=MainTree.Items[0]
           else
              TreeNodeObj:=TreeNodeObj.getFirstChild;

           while TreeNodeObj <> nil do
           begin
             NodeExtObj:=CCNodeExt(TreeNodeObj.Data);
             if NodeExtObj.code<>nodesTree.list[i].code then
             begin
                TreeNodeObj:=TreeNodeObj.GetNextSibling;
             end
             else
             begin
               if TreeNodeObj.Count=0 then UpdateMainTreeBranch(TreeNodeObj);
               Break;
             end;
           end;

           if TreeNodeObj=nil then
           begin
             ShowMessage('Об''єкта немає в списку. Спробуйте оновити дерево або змінити фільтрацію');
             Exit;
           end;
        end;

        MainTree.Selected:=TreeNodeObj;
        MainTree.SetFocus;
end;

procedure TfrmCCTreeShow.UpdateMainTreeBranch(parentNode: TTreeNode);
var
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  CCNodeExtList: CCNodeExtShortList;
  CCNodeExtFilterObj: CCNodeExtFilter;
  currNode: TTreeNode;
  i,j: Integer;
begin
  if parentNode.Count>0 then Exit;

  MainTree.Items.BeginUpdate;

  TempCCNodeExt :=  HTTPRIOCCNodeExt as CCNodeExtControllerSoapPort;
  CCNodeExtFilterObj := CCNodeExtFilter.Create;
  SetNullIntProps(CCNodeExtFilterObj);
  SetNullXSProps(CCNodeExtFilterObj);

  CCNodeExtFilterObj.conditionSQL:=
     ' ccnode.parentnodecode='+IntToStr(CCNodeExtShort(parentNode.Data).code)+
     ' or ccnode.parentnormalcode='+IntToStr(CCNodeExtShort(parentNode.Data).code);
  if CCNodeExtShort(parentNode.Data).isGroup=1 then
     CCNodeExtFilterObj.conditionSQL:=CCNodeExtFilterObj.conditionSQL+
     ' or ccnode.code in (select nodecode from ccnode2nodegroup n2g where n2g.nodegrpcode='+IntToStr(CCNodeExtShort(parentNode.Data).code)+')';

  CCNodeExtFilterObj.orderBySQL := 'ccnode.voltage desc, nodeisgroup(ccnode.code) desc, ccnode.name';
  CCNodeExtList := TempCCNodeExt.getScrollableFilteredList(CCNodeExtFilterObj, 0, -1);

  for i:=0 to High(CCNodeExtList.list) do
  begin
    currNode := MainTree.Items.AddChildObject(parentNode,CCNodeExtList.list[i].name,pointer(CCNodeExtList.list[i]));
    if CCNodeExtList.list[i].countChildren>0 then currNode.HasChildren:=true;
    if CCNodeExtList.list[i].isGroup=1 then
       currNode.ImageIndex:=9
    else
    if StrToFloat(CCNodeExtList.list[i].voltage.DecimalString)>150 then
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode+9
    else
       currNode.ImageIndex:=CCNodeExtList.list[i].nodetypeCode;
    currNode.StateIndex:=-1;
    currNode.ExpandedImageIndex:=currNode.ImageIndex;
    currNode.SelectedIndex:=currNode.ImageIndex;
  end;

  if parentNode.Count=0 then parentNode.HasChildren:=False;

  MainTree.Items.EndUpdate;

end;

procedure TfrmCCTreeShow.MainTreeAdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
begin
  if (Node.Parent<>nil) and (CCNodeExtShort(Node.Parent.Data).isGroup=1) then
  begin
    // От группы
    if CCNodeExtShort(Node.Data).parentnodeCode = CCNodeExtShort(Node.Parent.Parent.Data).code then
    begin
       // Узел в составе группы
       if (CCNodeExtShort(Node.Data).parentnodeCode<>CCNodeExtShort(Node.Data).parentnormalCode) then
       begin
          // причем находится в оперативном переключении
          Sender.Canvas.Font.Color := TColor($0080FF)
       end
    end
    else
       // Узла нет в составе группы
       Sender.Canvas.Font.Color := TColor($CCBBBB);
  end
  else
  begin
    // От обычного узла
    if (Node.Parent<>nil) and (CCNodeExtShort(Node.Data).parentnodeCode<>CCNodeExtShort(Node.Data).parentnormalCode) {and not (cdsSelected in State)} then
    begin
      if CCNodeExtShort(Node.Data).parentnodeCode = CCNodeExtShort(Node.Parent.Data).code then
        // Узел в оперативном переключении, текущее положение
        Sender.Canvas.Font.Color := TColor($0080FF)
      else
        // Узел в оперативном переключении, положение по схеме норм. реж.
        Sender.Canvas.Font.Color := TColor($CCBBBB);
    end;
  end;

  //if not (cdsSelected in State) then
  if CCNodeExtShort(Node.Data).isOff in [0,1] then
  case CCNodeExtShort(Node.Data).isOff of
    1: begin
      //Sender.Canvas.Brush.Color:= TColor($C1C4FF);
      Node.StateIndex:=1;
    end;
    0: begin
      //Sender.Canvas.Brush.Color:= TColor($AAE8EE);
      Node.StateIndex:=2;
    end;
  end
  else
  if CCNodeExtShort(Node.Data).probablyOff in [0,1] then
  case CCNodeExtShort(Node.Data).probablyOff of
    1: begin
      Node.StateIndex:=3;
    end;
    0: begin
      Node.StateIndex:=4;
    end;
  end
  else
    Node.StateIndex:=-1;
end;

procedure TfrmCCTreeShow.MainTreeClick(Sender: TObject);
begin
  inherited;
  updateSO2NodeBySelectedNode;
end;

procedure TfrmCCTreeShow.MainTreeExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
    UpdateMainTreeBranch(Node);
end;

procedure TfrmCCTreeShow.MainTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   Item: TTreeNode;
begin
   Item := MainTree.GetNodeAt(X, Y);
   if Assigned(Item) then
   Item.Selected := True
end;


procedure TfrmCCTreeShow.MenuItem1Click(Sender: TObject);
Var
  ccNodeCode: Integer;
begin
   try
     ccNodeCode := StrToInt(sgENSO2Node.Cells[1,sgENSO2Node.Row]);
   except
   on EConvertError do Exit;
  end;
  ShowNodeInTree(ccNodeCode);
  updateSO2NodeBySelectedNode;
end;

procedure TfrmCCTreeShow.MenuItem33Click(Sender: TObject);

begin

  ENSO2NodeObj:=ENSO2Node.Create;
  SetNullIntProps(ENSO2NodeObj);
  SetNullXSProps(ENSO2NodeObj);

  ENSO2NodeObj.ccNodeCode := CCNodeExtShort(MainTree.Selected.Data).code;

  try
    frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsInsert);
    frmENSO2NodeEdit.edtCcNodeCode.Text := IntToStr(CCNodeExtShort(MainTree.Selected.Data).code);
    frmENSO2NodeEdit.DisableControls([frmENSO2NodeEdit.edtCcNodeCode, frmENSO2NodeEdit.edtServicesName, frmENSO2NodeEdit.edtCCTowerCode]);
    try
      if frmENSO2NodeEdit.ShowModal = mrOk then
      begin
        if ENSO2NodeObj<>nil then
            updateSO2NodeBySelectedNode;
      end;
    finally
      frmENSO2NodeEdit.Free;
      frmENSO2NodeEdit:=nil;
    end;
  finally
    ENSO2NodeObj.Free;
  end;
end;

procedure TfrmCCTreeShow.MenuItem34Click(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  try
    ENSO2NodeObj := TempENSO2Node.getObject(StrToInt(sgENSO2Node.Cells[0,sgENSO2Node.Row]));
  except
    on EConvertError do Exit;
  end;

  try
    frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsEdit);
    try
      if frmENSO2NodeEdit.ShowModal = mrOk then
      begin
        if ENSO2NodeObj<>nil then
            updateSO2NodeBySelectedNode;
      end;
    finally
      frmENSO2NodeEdit.Free;
      frmENSO2NodeEdit:=nil;
    end;
  finally
    ENSO2NodeObj.Free;
  end;
end;

procedure TfrmCCTreeShow.N2Click(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
begin
  TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  try
    ENSO2NodeObj := TempENSO2Node.getObject(StrToInt(sgENSO2Node.Cells[0,sgENSO2Node.Row]));
  except
    on EConvertError do Exit;
  end;

  try
    frmENSO2NodeEdit:=TfrmENSO2NodeEdit.Create(Application, dsEdit);
    frmENSO2NodeEdit.DisableControls([frmENSO2NodeEdit.edtCcNodeCode, frmENSO2NodeEdit.edtServicesName, frmENSO2NodeEdit.edtCCTowerCode ]);
    try
      if frmENSO2NodeEdit.ShowModal = mrOk then
      begin
        if ENSO2NodeObj<>nil then
            updateSO2NodeBySelectedNode;
      end;
    finally
      frmENSO2NodeEdit.Free;
      frmENSO2NodeEdit:=nil;
    end;
  finally
    ENSO2NodeObj.Free;
  end;
end;

procedure TfrmCCTreeShow.N3Click(Sender: TObject);
Var TempENSO2Node: ENSO2NodeControllerSoapPort;
    i , ObjCode: integer;
    state_, isSel : boolean;
begin
 TempENSO2Node := HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить выбранные строки (Связка ServicesObject с узлом дерева CallCentre) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

      state_ := false;
      isSel := false;

      for i:=1 to sgENSO2Node.RowCount - 1 do
      begin
         sgENSO2Node.GetCheckBoxState(1,i,state_);
         if state_ then
         begin
           isSel := true;
         end;
      end;

      if not isSel then
      begin
         Application.MessageBox(PChar('Виберіть хоча б одну точку !!!'), PChar('Увага !'),MB_ICONWARNING);
         Exit;
      end;


      for i:=1 to sgENSO2Node.RowCount - 1 do
      begin
         sgENSO2Node.GetCheckBoxState(1,i,state_);
         if state_ then
         begin

            try
              ObjCode := StrToInt( sgENSO2Node.Cells[0, i ]);
            except
              on EConvertError do Exit;
            end;

           TempENSO2Node.remove(ObjCode);


         end;
      end;

       updateSO2NodeBySelectedNode;
   end;
end;

procedure TfrmCCTreeShow.N4Click(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesConnectionObj := TempENServicesCalculation.getObject(Integer(sgENSO2Node.Objects[0,sgENSO2Node.Row]));

  except
    on EConvertError do Exit;
  end;

  frmENServicesConnectionEdit:=TfrmENServicesConnectionEdit.Create(Application, dsView);
  frmENServicesConnectionEdit.priconnections := True;

  try
    if frmENServicesConnectionEdit.ShowModal= mrOk then
      begin

      end;

  finally
    frmENServicesConnectionEdit.Free;
    frmENServicesConnectionEdit:=nil;
  end;
end;

procedure TfrmCCTreeShow.sgENSO2NodeDblClick(Sender: TObject);
begin
  inherited;
  N4Click(Sender);
end;

procedure TfrmCCTreeShow.updateSO2NodeBySelectedNode;
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  i: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
begin

  ClearGrid(sgENSO2Node);
  SetGridHeaders(ENSO2NodeHeaders, sgENSO2Node.ColumnHeaders);
  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

   so2nodeFilter := ENSO2NodeFilter.Create;
   SetNullIntProps(so2nodeFilter);
   SetNullXSProps(so2nodeFilter);
   so2nodeFilter.ccNodeCode := CCNodeExtShort(MainTree.Selected.Data).code;

  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,-1);
  nodeLastCount:=High(ENSO2NodeList.list);

  if nodeLastCount > -1 then
     sgENSO2Node.RowCount:=nodeLastCount+2
  else
     sgENSO2Node.RowCount:=2;

   with sgENSO2Node do
    for i:=0 to nodeLastCount do
      begin
         Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);

        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);

          Cells[2,i+1] := ENSO2NodeList.list[i].ccelementdataname;

        if ENSO2NodeList.list[i].ccTowerCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENSO2NodeList.list[i].ccTowerCode);

          Cells[4,i+1] := ENSO2NodeList.list[i].towerName;

          if ENSO2NodeList.list[i].power <> nil then
          Cells[5,i+1] := ENSO2NodeList.list[i].power.DecimalString
          else
          Cells[5,i+1] := '';

          if ENSO2NodeList.list[i].tc_currpower <> nil then
          Cells[6,i+1] := ENSO2NodeList.list[i].tc_currpower.DecimalString
          else
          Cells[6,i+1] := '';

          Cells[7,i+1] := ENSO2NodeList.list[i].tc_conpowpoint;         //19
          Cells[8,i+1] := ENSO2NodeList.list[i].tc_conpowplaces;       //20
          Cells[9,i+1] := ENSO2NodeList.list[i].work_directly_on_joining;

          Cells[10,i+1] := ENSO2NodeList.list[i].description;

          if (ENSO2NodeList.list[i].isCalc = 1) then
          Cells[11,i+1] := 'Так'
        else
          Cells[11,i+1] := '';

          Cells[12,i+1] := ENSO2NodeList.list[i].so2nodeTypeName;

          Cells[13,i+1] := ENSO2NodeList.list[i].servicesobjectContractNumberServices + '\' +
                          ENSO2NodeList.list[i].servicesobjectContractNumber + ' від ' +
                          XSDate2String(ENSO2NodeList.list[i].servicesobjectContractDateServices);

          Cells[14,i+1] := ENSO2NodeList.list[i].servicesobjectContragentName;
          //Статус договору
          Cells[15,i+1] := ENSO2NodeList.list[i].servicesobjectContractStatusRefName;

          Cells[16,i+1] := ENSO2NodeList.list[i].tc_building;
          Cells[17,i+1] := ENSO2NodeList.list[i].tc_address;

          if ENSO2NodeList.list[i].tc_servvoltage <> nil then
          Cells[18,i+1] := ENSO2NodeList.list[i].tc_servvoltage.DecimalString
          else
          Cells[18,i+1] := '';

          if ENSO2NodeList.list[i].tc_currvoltage <> nil then
          Cells[19,i+1] := ENSO2NodeList.list[i].tc_currvoltage.DecimalString
          else
          Cells[19,i+1] := '';

          Cells[20,i+1] := ENSO2NodeList.list[i].dep_name;
          Cells[21,i+1] := ENSO2NodeList.list[i].tc_number;
          if ENSO2NodeList.list[i].tc_dategen <> nil then
            Cells[22,i+1] := XSDate2String(ENSO2NodeList.list[i].tc_dategen)
          else
            Cells[22,i+1] := '';
          Cells[23,i+1] := ENSO2NodeList.list[i].connectionkindname;
          if ENSO2NodeList.list[i].fact_conn_date <> nil then
            Cells[24,i+1] := XSDate2String(ENSO2NodeList.list[i].fact_conn_date)
          else
            Cells[24,i+1] := '';
          Cells[25,i+1] := ENSO2NodeList.list[i].f04;
          Cells[26,i+1] := ENSO2NodeList.list[i].s10;
          Cells[27,i+1] := ENSO2NodeList.list[i].f10;
          Cells[28,i+1] := ENSO2NodeList.list[i].s35;
          Cells[29,i+1] := ENSO2NodeList.list[i].f35;
          Cells[30,i+1] := ENSO2NodeList.list[i].s150;
          Cells[31,i+1] := ENSO2NodeList.list[i].f150;

         Cells[32,i+1] := ENSO2NodeList.list[i].userGen;

        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[33,i+1] := ''
        else
          Cells[33,i+1] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);

        Objects[0,i+1] := TObject(ENSO2NodeList.list[i].servicesobjectCode);

        LastRow:=i+1;
        sgENSO2Node.RowCount:=LastRow+1;

      end;

    nodeColCount:=nodeColCount+1;
    sgENSO2Node.Row:=1;
end;

procedure TfrmCCTreeShow.updateSO2NodeByChildNodes;
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  TempCCNodeExt: CCNodeExtControllerSoapPort;
  i: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
  intCodesList: CCNodeExtController.ArrayOfInteger;
  strCodesList: String;
begin
  if MainTree.Selected = nil then
  begin
        ShowMessage('Виберіть точку приєднання з дерева об''єктів CallCentre');
        exit;
  end;

  ClearGrid(sgENSO2Node);
  SetGridHeaders(ENSO2NodeHeaders, sgENSO2Node.ColumnHeaders);
  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
  TempCCNodeExt:= HTTPRIOCCNodeExt as  CCNodeExtControllerSoapPort;


    intCodesList := TempCCNodeExt.getChildNodesCodeArray(CCNodeExtShort(MainTree.Selected.Data).code);
    for i:=0 to High(intCodesList) do
    begin
        if strCodesList <> '' then strCodesList := strCodesList + ', ';
        strCodesList := strCodesList + IntToStr(intCodesList[i]);
    end;

   so2nodeFilter := ENSO2NodeFilter.Create;
   SetNullIntProps(so2nodeFilter);
   SetNullXSProps(so2nodeFilter);

    if strCodesList <> '' then
    begin // если есть связанные планы
     so2nodeFilter.conditionSQL := 'ccnodecode in (' + strCodesList + ')';
    end;


  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,-1);
  nodeLastCount:=High(ENSO2NodeList.list);

  if nodeLastCount > -1 then
     sgENSO2Node.RowCount:=nodeLastCount+2
  else
     sgENSO2Node.RowCount:=2;

   with sgENSO2Node do
    for i:=0 to nodeLastCount do
      begin
         Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);

        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);

          Cells[2,i+1] := ENSO2NodeList.list[i].ccelementdataname;

        if ENSO2NodeList.list[i].ccTowerCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENSO2NodeList.list[i].ccTowerCode);

          Cells[4,i+1] := ENSO2NodeList.list[i].towerName;

          if ENSO2NodeList.list[i].power <> nil then
          Cells[5,i+1] := ENSO2NodeList.list[i].power.DecimalString
          else
          Cells[5,i+1] := '';

          if ENSO2NodeList.list[i].tc_currpower <> nil then
          Cells[6,i+1] := ENSO2NodeList.list[i].tc_currpower.DecimalString
          else
          Cells[6,i+1] := '';

          Cells[7,i+1] := ENSO2NodeList.list[i].tc_conpowpoint;         //19
          Cells[8,i+1] := ENSO2NodeList.list[i].tc_conpowplaces;       //20
          Cells[9,i+1] := ENSO2NodeList.list[i].work_directly_on_joining;

          Cells[10,i+1] := ENSO2NodeList.list[i].description;

          if (ENSO2NodeList.list[i].isCalc = 1) then
          Cells[11,i+1] := 'Так'
        else
          Cells[11,i+1] := '';

          Cells[12,i+1] := ENSO2NodeList.list[i].so2nodeTypeName;

          Cells[13,i+1] := ENSO2NodeList.list[i].servicesobjectContractNumberServices + '\' +
                          ENSO2NodeList.list[i].servicesobjectContractNumber + ' від ' +
                          XSDate2String(ENSO2NodeList.list[i].servicesobjectContractDateServices);

          Cells[14,i+1] := ENSO2NodeList.list[i].servicesobjectContragentName;
          //Статус договору
          Cells[15,i+1] := ENSO2NodeList.list[i].servicesobjectContractStatusRefName;

          Cells[16,i+1] := ENSO2NodeList.list[i].tc_building;
          Cells[17,i+1] := ENSO2NodeList.list[i].tc_address;

          if ENSO2NodeList.list[i].tc_servvoltage <> nil then
          Cells[18,i+1] := ENSO2NodeList.list[i].tc_servvoltage.DecimalString
          else
          Cells[18,i+1] := '';

          if ENSO2NodeList.list[i].tc_currvoltage <> nil then
          Cells[19,i+1] := ENSO2NodeList.list[i].tc_currvoltage.DecimalString
          else
          Cells[19,i+1] := '';

          Cells[20,i+1] := ENSO2NodeList.list[i].dep_name;
          Cells[21,i+1] := ENSO2NodeList.list[i].tc_number;
          if ENSO2NodeList.list[i].tc_dategen <> nil then
            Cells[22,i+1] := XSDate2String(ENSO2NodeList.list[i].tc_dategen)
          else
            Cells[22,i+1] := '';
          Cells[23,i+1] := ENSO2NodeList.list[i].connectionkindname;
          if ENSO2NodeList.list[i].fact_conn_date <> nil then
            Cells[24,i+1] := XSDate2String(ENSO2NodeList.list[i].fact_conn_date)
          else
            Cells[24,i+1] := '';
          Cells[25,i+1] := ENSO2NodeList.list[i].f04;
          Cells[26,i+1] := ENSO2NodeList.list[i].s10;
          Cells[27,i+1] := ENSO2NodeList.list[i].f10;
          Cells[28,i+1] := ENSO2NodeList.list[i].s35;
          Cells[29,i+1] := ENSO2NodeList.list[i].f35;
          Cells[30,i+1] := ENSO2NodeList.list[i].s150;
          Cells[31,i+1] := ENSO2NodeList.list[i].f150;

         Cells[32,i+1] := ENSO2NodeList.list[i].userGen;

        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[33,i+1] := ''
        else
          Cells[33,i+1] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);

        Objects[0,i+1] := TObject(ENSO2NodeList.list[i].servicesobjectCode);

        LastRow:=i+1;
        sgENSO2Node.RowCount:=LastRow+1;

      end;

    nodeColCount:=nodeColCount+1;
    sgENSO2Node.Row:=1;
end;


end.
