
unit ShowENDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDepartmentController, paramtreeview, treelist ;

type
  TProcChooseENDepartmentHandler = reference to procedure(selectedObj: ENDepartmentShort);

type
  TUpdateMode = (umInsert, umEdit, umDelete);

  TfrmENDepartmentShow = class(TChildForm)  
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
   // Процедура для выбора пользователем подразделения - только верхний уровень
   // и выбираются подразделения с посланным типом подразделения - departmentType
   class procedure chooseFromListTopLevel(departmentType : Integer; proc: TProcChooseENDepartmentHandler);
   { Private declarations }
 public
   { Public declarations }
   isShowAll : boolean;
   isCheckPodr  : boolean; // переменная по умолчанию False (если True то моно выбиирать Апарат Управления и Херсоноблэнерго )
   procedure UpdateGrid(Sender: TObject; updateMode: TUpdateMode);
   class procedure chooseFromList(proc: TProcChooseENDepartmentHandler); overload; stdcall; static;
   class function chooseFromList (checkPodr : boolean; filter : ENDepartmentFilter) : ENDepartmentShort; overload; stdcall; static;
   class procedure chooseFromList(checkPodr : boolean; proc: TProcChooseENDepartmentHandler); overload; stdcall; static;
   // Выбор бюджетодержателя
   class procedure chooseFromListBudgets(proc: TProcChooseENDepartmentHandler); stdcall; static;
   // Выбор центра финансовой ответственности
   class procedure chooseFromListResponsibility(proc: TProcChooseENDepartmentHandler); stdcall; static;
 end;


 // ENDepartmentObj: ENDepartment;
 // ENDepartmentFilterObj: ENDepartmentFilter;

  
implementation

uses Main, EditENDepartment, EditENDepartmentFilter,
  ENDepartmentTypeController, ENConsts {, StrUtils};


{$R *.dfm}

type
  DEPData = ^EPDepartmentShort; //TENData;

  TENData = record
    elementCode: Integer;
    type_: Integer;
  end;

var
  frmENDepartmentShow : TfrmENDepartmentShow;

  
  //ColCount, LastCount: Integer; //Исключено объявление не используемых переменных
  LastRow: Integer = 1;
  ENDepartmentHeaders: array [1..5] of String =
        ( 'Код'
          ,'Скорочена назва підрозділу'
          ,'Верхній рівень'
          ,'Початок дії'
          ,'Кінець дії'
        );

class procedure TfrmENDepartmentShow.chooseFromList(proc: TProcChooseENDepartmentHandler);
begin
  chooseFromList(false, proc);
end;
class function TfrmENDepartmentShow.chooseFromList(checkPodr : Boolean; filter : ENDepartmentFilter) : ENDepartmentShort;
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f : ENDepartmentFilter;
  selectedObj : ENDepartmentShort;
begin
  if not Assigned(filter) then begin
    f := ENDepartmentFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.code := 1;
  end else begin
    f := filter;
  end;
  Result := nil;
  selectedObj := nil;
  frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
  frmENDepartmentShow.isCheckPodr := checkPodr;
  try
    frmENDepartmentShow.isShowAll := true;
    with frmENDepartmentShow do begin
      DisableActions([actInsert, actUpdate, actDelete]);
      if ShowModal = mrOk then
      begin
        try
            selectedObj := ENDepartmentShort(tvDep.Selected.Data);
            Result := selectedObj;
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

class procedure TfrmENDepartmentShow.chooseFromList(checkPodr: boolean; proc: TProcChooseENDepartmentHandler);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f : ENDepartmentFilter;
  selectedObj : ENDepartmentShort;
begin
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.code := 1;

  frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
  frmENDepartmentShow.isCheckPodr := checkPodr;
  try
    frmENDepartmentShow.isShowAll := true;
    with frmENDepartmentShow do begin
      DisableActions([actInsert, actUpdate, actDelete]);
      if ShowModal = mrOk then
      begin
        try
            selectedObj := ENDepartmentShort(tvDep.Selected.Data);
            proc(selectedObj);
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

class procedure TfrmENDepartmentShow.chooseFromListTopLevel(departmentType : Integer; proc: TProcChooseENDepartmentHandler);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f : ENDepartmentFilter;
  selectedObj : ENDepartmentShort;
begin
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.typeRef := ENDepartmentTypeRef.Create;
  f.typeRef.code := departmentType;
  f.conditionSQL := ' parentrefcode is null';

  frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
    with frmENDepartmentShow do begin
      DisableActions([actInsert, actUpdate, actDelete]);
      if ShowModal = mrOk then
      begin
        try
            selectedObj := ENDepartmentShort(tvDep.Selected.Data);
            proc(selectedObj);
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

class procedure TfrmENDepartmentShow.chooseFromListBudgets(proc: TProcChooseENDepartmentHandler);
begin
    TfrmENDepartmentShow.chooseFromListTopLevel(ENDEPARTMENTTYPE_BUDGET, proc);
end;

class procedure TfrmENDepartmentShow.chooseFromListResponsibility(proc: TProcChooseENDepartmentHandler);
begin
    TfrmENDepartmentShow.chooseFromListTopLevel(ENDEPARTMENTTYPE_RESPOSIBILITY, proc);
end;


procedure TfrmENDepartmentShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDepartmentShow:=nil;
    inherited;
  end;


procedure TfrmENDepartmentShow.FormShow(Sender: TObject);

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

  // 27.02.12 Сразу же пытаемся развернуть корневой узел
  if tvDep.Items.Count > 0 then
  begin
    tvDep.Items[0].Selected := true;
    tvDep1DblClick(Sender);
  end;
end;



procedure TfrmENDepartmentShow.UpdateGrid(Sender: TObject; updateMode : TUpdateMode);
//Var i, j: Integer; //Исключено объявление не используемых переменных
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

procedure TfrmENDepartmentShow.actViewExecute(Sender: TObject);
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

procedure TfrmENDepartmentShow.actEditExecute(Sender: TObject);
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

procedure TfrmENDepartmentShow.actDeleteExecute(Sender: TObject);
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

procedure TfrmENDepartmentShow.actInsertExecute(Sender: TObject);
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

procedure TfrmENDepartmentShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender, umEdit);
end;


procedure TfrmENDepartmentShow.actFilterExecute(Sender: TObject);
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

procedure TfrmENDepartmentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  if isShowAll then
    FormShow(Sender)
  else
    UpdateGrid(Sender,umEdit);
end;

procedure TfrmENDepartmentShow.tvDep1DblClick(Sender: TObject);
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
 //showmessage(ENDepartmentShort(tvDep.Selected.Data).typeRefName);
end;

procedure TfrmENDepartmentShow.actSelectExecute(Sender: TObject);
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

procedure TfrmENDepartmentShow.FormCreate(Sender: TObject);
begin

   isCheckPodr := False;

end;

end.