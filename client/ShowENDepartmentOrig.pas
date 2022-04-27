
unit ShowENDepartmentOrig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDepartmentController, paramtreeview, treelist ;


type
  TUpdateMode = (umInsert, umEdit, umDelete);

  TfrmENDepartmentOrigShow = class(TChildForm)  
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
    actTvDepUpdate: TAction;

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
   isShowAll : boolean;
   isCheckPodr  : boolean; // переменная по умолчанию False (если True то моно выбиирать Апарат Управления и Херсоноблэнерго )



   procedure UpdateGrid(Sender: TObject; updateMode: TUpdateMode);
 end;


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
//  frmENDepartmentOrigShow : TfrmENDepartmentOrigShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDepartmentHeaders: array [1..5] of String =
        ( 'Код'
          ,'Скорочена назва підрозділу'
          ,'Верхній рівень'
          ,'Початок дії'
          ,'Кінець дії'
        );


procedure TfrmENDepartmentOrigShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDepartmentOrigShow:=nil;
    inherited;
  end;


procedure TfrmENDepartmentOrigShow.FormShow(Sender: TObject);

var
  TempENDepartment: ENDepartmentControllerSoapPort;
  i: Integer;
  ENDepartmentList: ENDepartmentShortList;
  begin

  //SetGridHeaders(ENElementTypeHeaders, sgENElementType.ColumnHeaders);

  TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     if isShowAll then
       ENDepartmentFilter(FilterObject).code := 1
     else
       ENDepartmentFilter(FilterObject).conditionSQL := 'parentrefcode is null';
  end;



  ENDepartmentList := TempENDepartment.getScrollableFilteredList(ENDepartmentFilter(FilterObject),0,-1);

   tvDep.Items.Clear;


    for i:=0 to High(ENDepartmentList.list) do
      begin
        ///////
        tvDep.Items.AddChild(nil, ENDepartmentList.list[i].shortName + ';;;;;' + ENDepartmentList.list[i].typeRefName ).Data := ENDepartmentList.list[i];
      end;

end;



procedure TfrmENDepartmentOrigShow.UpdateGrid(Sender: TObject; updateMode : TUpdateMode);
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

procedure TfrmENDepartmentOrigShow.actViewExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
begin

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

end;

procedure TfrmENDepartmentOrigShow.actEditExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
begin
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
end;

procedure TfrmENDepartmentOrigShow.actDeleteExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
  ObjCode: Integer;
begin
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
end;

procedure TfrmENDepartmentOrigShow.actInsertExecute(Sender: TObject);
Var TempENDepartment: ENDepartmentControllerSoapPort;
begin
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
end;

procedure TfrmENDepartmentOrigShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender, umEdit);
end;


procedure TfrmENDepartmentOrigShow.actFilterExecute(Sender: TObject);
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

procedure TfrmENDepartmentOrigShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  if isShowAll then
    FormShow(Sender)
  else
    UpdateGrid(Sender,umEdit);
end;

procedure TfrmENDepartmentOrigShow.tvDep1DblClick(Sender: TObject);
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
         //tn := tvDep.Items.AddChild(tvDep.Selected, ENDepartmentList.list[i].shortName);
         //tn := tvDep.Items.AddChild(tvDep.Selected, AnsiReplaceText(ENDepartmentList.list[i].shortName, ';', '/'));

         tn := tvDep.Items.AddChild(tvDep.Selected, ENDepartmentList.list[i].shortName
         + ';;;;;' + ''
         + ';;;;;' + ENDepartmentList.list[i].shpzBalans);
         //+ ';;;;;' + ENDepartmentList.list[i].kau_1884
         //+ ';;;;;' + ENDepartmentList.list[i].name_1884);

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
 //showmessage(ENDepartmentShort(tvDep.Selected.Data).typeRefName);
end;

procedure TfrmENDepartmentOrigShow.actSelectExecute(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      if tvDep.Selected <> nil then
      begin
        //if tvDep.Selected.Parent <> nil then
          temp:=  ENDepartmentShort(tvDep.Selected.Data).code;
        //else
        //   exit

        // выбирают ХРЕНЬ !!!  +ЦО + БЮджетодерж ...
        if ((temp in [1,3]) and (isCheckPodr = False)) or (temp = 731) or (temp = 1001) or (temp = 1002) or (temp = 1003) then
        begin
          ShowMessage('Ці Підрозділи/ЦВ/Бюджетотримачей вибирати не можна !!! ...');
          exit;
        end;
      end
      else
         exit;
    except
       Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDepartmentOrigShow.FormCreate(Sender: TObject);
begin

   isCheckPodr := False;

end;

end.