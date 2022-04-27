
unit ShowFINExecutorTree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDepartmentController, paramtreeview, treelist, FINExecutorController;

type
  TProcChooseFINExecutorHandler = reference to procedure(selectedObj: FINExecutorShort; node : TTreeNode);

type
  TUpdateMode = (umInsert, umEdit, umDelete);
  
  TfrmFINExecutorTreeShow = class(TChildForm)
    HTTPRIOENDepartment: THTTPRIO;
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
    tvDep: TTreeList;
    actSelect: TAction;
    ToolButton4: TToolButton;
    N5: TMenuItem;
    HTTPRIOFINExecutor: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);


procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure tvDep1DblClick(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   ForDriversReport : Boolean; 
   procedure UpdateGrid(Sender: TObject; updateMode: TUpdateMode);
   class procedure chooseFromList(proc: TProcChooseFINExecutorHandler); overload; stdcall; static;
 end;

//var
 // ENDepartmentObj: ENDepartment;
 // ENDepartmentFilterObj: ENDepartmentFilter;
  
  
implementation

uses Main, EditENDepartment, EditENDepartmentFilter,
  ENDepartmentTypeController{, StrUtils};


{$R *.dfm}

type
  DEPData = ^EPDepartmentShort; //TENData;

  TENData = record
    elementCode: Integer;
    type_: Integer;
  end;

var
  frmFINExecutorTreeShow : TfrmFINExecutorTreeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDepartmentHeaders: array [1..5] of String =
        ( 'Код'
          ,'Скорочена назва підрозділу'
          ,'Верхній рівень'
          ,'Початок дії'
          ,'Кінець дії'
        );

class procedure TfrmFINExecutorTreeShow.chooseFromList(proc: TProcChooseFINExecutorHandler);
var
  frmFINExecutorShow: TfrmFINExecutorTreeShow;
  selectedObj : FINExecutorShort;
begin
  frmFINExecutorShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
  try
    with frmFINExecutorShow do begin
      DisableActions([actInsert, actUpdate, actDelete]);
      if ShowModal = mrOk then
      begin
        try
            selectedObj := FINExecutorShort(tvDep.Selected.Data);
            proc(selectedObj, tvDep.Selected);
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmFINExecutorShow.Free;
  end;
end;

procedure TfrmFINExecutorTreeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDepartmentShow:=nil;
    inherited;
  end;


procedure TfrmFINExecutorTreeShow.FormShow(Sender: TObject);

var
  TempFINExecutor: FINExecutorControllerSoapPort;
  i: Integer;
  FINExecutorList: FINExecutorShortList;
  begin

  //SetGridHeaders(ENElementTypeHeaders, sgENElementType.ColumnHeaders);

  TempFINExecutor :=  HTTPRIOFINExecutor as FINExecutorControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINExecutorFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     //FINExecutorFilter(FilterObject).conditionSQL := 'p.Main_Podr_Id = 1'; // ХОЕ

     FINExecutorFilter(FilterObject).finCehCode := StrToInt('1'); // ХОЕ
  end;




  FINExecutorList := TempFINExecutor.getFINExecutorList(FINExecutorFilter(FilterObject),0,-1);

   tvDep.Items.Clear;


    for i:=0 to High(FINExecutorList.list) do
      begin
        ///////
        tvDep.Items.AddChild(nil, FINExecutorList.list[i].name + ';;;;;' + FINExecutorList.list[i].finKindName ).Data := FINExecutorList.list[i];
      end;

end;



procedure TfrmFINExecutorTreeShow.UpdateGrid(Sender: TObject; updateMode : TUpdateMode);
Var i, j: Integer;
begin
{
 for i:=1 to sgENDepartment.RowCount-1 do
   for j:=0 to sgENDepartment.ColCount-1 do
     sgENDepartment.Cells[j,i]:='';
   FormShow(Sender);
}
if tvDep.Selected <> nil then
begin
  if updateMode in [umEdit, umDelete] then
        if tvDep.Selected.Parent <> nil then
        begin
          tvDep.Selected.Parent.DeleteChildren;
        end;

   tvDep.Selected.DeleteChildren;
   tvDep1DblClick(Sender);
   tvDep.Selected.Expand(false);
end;

end;

procedure TfrmFINExecutorTreeShow.actViewExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
begin
{
 TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
   try
     //ENDepartmentObj := TempENDepartment.getObject(StrToInt(sgENDepartment.Cells[0,sgENDepartment.Row]));
     ENDepartmentObj := TempENDepartment.getObject( ENDepartmentShort(tvDep.Selected.Data).code );
   except
     Exit;
  end;
  frmENDepartmentEdit:=TfrmENDepartmentEdit.Create(Application, dsView);
  try
    frmENDepartmentEdit.ShowModal;
  finally
    frmENDepartmentEdit.Free;
    frmENDepartmentEdit:=nil;
  end;
}
end;

procedure TfrmFINExecutorTreeShow.actEditExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
begin
 {
 TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
   try
     ENDepartmentObj := TempENDepartment.getObject( ENDepartmentShort(tvDep.Selected.Data).code );
   except
     Exit;
  end;
  frmENDepartmentEdit:=TfrmENDepartmentEdit.Create(Application, dsEdit);
  try
    if frmENDepartmentEdit.ShowModal= mrOk then
      begin
        //TempENDepartment.save(ENDepartmentObj);
        UpdateGrid(Sender, umEdit);
      end;
  finally
    frmENDepartmentEdit.Free;
    frmENDepartmentEdit:=nil;
  end;
  }
end;

procedure TfrmFINExecutorTreeShow.actDeleteExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
  ObjCode: Integer;
begin
{
 TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
   try
     ObjCode :=  ENDepartmentShort(tvDep.Selected.Data).code ;
   except
     Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Підрозділи) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDepartment.remove(ObjCode);
      UpdateGrid(Sender, umDelete);
  end;
 }
 end;

procedure TfrmFINExecutorTreeShow.actInsertExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
begin
{
  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
  ENDepartmentObj:=ENDepartment.Create;

   ENDepartmentObj.dateStart:= TXSDate.Create;
   ENDepartmentObj.dateFinal:= TXSDate.Create;

  ENDepartmentObj.parentRef := ENDepartmentRef.Create;
  ENDepartmentObj.parentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;

  ENDepartmentObj.typeRef := ENDepartmentTypeRef.Create;
  ENDepartmentObj.typeRef.code := ENDepartmentShort(tvDep.Selected.Data).typeRefCode;

  try
    frmENDepartmentEdit:=TfrmENDepartmentEdit.Create(Application, dsInsert);
    try
      if frmENDepartmentEdit.ShowModal = mrOk then
      begin
        if ENDepartmentObj<>nil then
            //TempENDepartment.add(ENDepartmentObj);
            UpdateGrid(Sender, umInsert);
      end;
    finally
      frmENDepartmentEdit.Free;
      frmENDepartmentEdit:=nil;
    end;
  finally
    ENDepartmentObj.Free;
  end;
}
end;

procedure TfrmFINExecutorTreeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender, umEdit);
end;


procedure TfrmFINExecutorTreeShow.actFilterExecute(Sender: TObject);
begin
{frmENDepartmentFilterEdit:=TfrmENDepartmentFilterEdit.Create(Application, dsEdit);
  try
    if frmENDepartmentFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENDepartmentFilter.Create;
      FilterObject := ENDepartmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDepartmentFilterEdit.Free;
    frmENDepartmentFilterEdit:=nil;
  end;}
end;

procedure TfrmFINExecutorTreeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender,umEdit);
end;

procedure TfrmFINExecutorTreeShow.tvDep1DblClick(Sender: TObject);
var
  c: FINExecutorControllerSoapPort;
  i: Integer;
  FINExecutorList, tempList : FINExecutorShortList;

  f , f1 : FINExecutorFilter;
  //c: ENDepartmentControllerSoapPort;
  //ENDepartmentList , tempList : ENDepartmentShortList;
  tn : TTreeNode;

  kindName: String;
begin
  if tvDep.Selected = nil then Exit;
  if tvDep.Selected.Data = nil then Exit;

   c := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
   f := FINExecutorFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   //f.conditionSQL := ' p.Main_Podr_Id = ' + IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode) ;

   f.finCehCode := FINExecutorShort(tvDep.Selected.Data).finCode;
   // MDAX-441
   f.axParentOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;

   f.orderBySQL := 'p.Nazv';

   tvDep.Selected.DeleteChildren;

  FINExecutorList := c.getFINExecutorList(f, 0, -1);

  for i:=0 to High(FINExecutorList.list) do
  begin
         /////
         if FINExecutorList.list[i].axOrgId <> '' then
           kindName := FINExecutorList.list[i].axOrgTypeName
         else
           kindName := FINExecutorList.list[i].finKindName;
         /////

         //*** tn := tvDep.Items.AddChild(tvDep.Selected, FINExecutorList.list[i].name + ';;;;;' + FINExecutorList.list[i].finKindName);
         tn := tvDep.Items.AddChild(tvDep.Selected, FINExecutorList.list[i].name + ';;;;;' + kindName);

         //tn := tvDep.Items.AddChild(tvDep.Selected, AnsiReplaceText(ENDepartmentList.list[i].shortName, ';', '/'));

         tn.Data := FINExecutorList.list[i];

         f1 := FINExecutorFilter.Create;
         SetNullIntProps(f1);
         SetNullXSProps(f1);

         //f1.conditionSQL := ' p.Main_Podr_Id = ' + intToStr(FINExecutorList.list[i].finCode) ;

         f1.finCehCode := FINExecutorList.list[i].finCode;
         // MDAX-441
         f1.axParentOrgId := FINExecutorList.list[i].axOrgId;

         tempList := c.getFINExecutorList(f1, 0, -1);

         tn.HasChildren := tempList.totalCount > 0;
  end;
  tvDep.Selected.Expand(false);
 //showmessage(ENDepartmentShort(tvDep.Selected.Data).typeRefName);
end;

procedure TfrmFINExecutorTreeShow.actSelectExecute(Sender: TObject);
Var
  temp, temp2 : Integer;
  axOrgId, axParentOrgId: String;
begin
  if FormMode = fmNormal then
  begin
    try
      if tvDep.Selected <> nil then
      begin
        //if tvDep.Selected.Parent <> nil then
        //temp := FINExecutorShort(tvDep.Selected.Data).code;
        temp2 := FINExecutorShort(tvDep.Selected.Data).finCode;

        axOrgId := FINExecutorShort(tvDep.Selected.Data).axOrgId;
        axParentOrgId := FINExecutorShort(tvDep.Selected.Data).axParentOrgId;

        if ForDriversReport = false then
        begin
          if (temp2 = 3) or (temp2 = 731) then
          begin
            ShowMessage('Такий підрозділ не вибирається !!!');
            Exit;
          end;

          if (axOrgId <> '') and (axParentOrgId = '') then
          begin
            ShowMessage('Такий підрозділ не вибирається !!!');
            Exit;
          end;
        end;
        //else
        //   exit
      end
      else
         exit;
    except
       Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
   // actViewExecute(Sender);
  end;
end;

procedure TfrmFINExecutorTreeShow.FormCreate(Sender: TObject);
begin
  ForDriversReport := False;
end;

end.