
unit ShowENPlanProject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPlanProjectController, AdvObj ;


type
    TfrmENPlanProjectShow = class(TChildForm)  
    HTTPRIOENPlanProject: THTTPRIO;
    ImageListProject: TImageList;
    sgENPlanProject: TAdvStringGrid;
    ActionListProject: TActionList;
    actViewproject: TAction;
    actInsertproject: TAction;
    actDeleteproject: TAction;
    actEditproject: TAction;
    actUpdateproject: TAction;
    actFilterproject: TAction;
    actNoFilterproject: TAction;
    PopupMenuProject: TPopupMenu;
    N1viewproject: TMenuItem;
    N2insertproject: TMenuItem;
    N3deleteproject: TMenuItem;
    N4editproject: TMenuItem;
    N6updateproject: TMenuItem;
    N7filterproject: TMenuItem;
    N8nofilterproject: TMenuItem;
    ToolBarProject: TToolBar;
    ToolButton1project: TToolButton;
    ToolButton6project: TToolButton;
    ToolButton7project: TToolButton;
    ToolButton8project: TToolButton;
    ToolButton11project: TToolButton;
    ToolButton2project: TToolButton;
    ToolButton3project: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENPlanProjectTopLeftChanged(Sender: TObject);
    procedure sgENPlanProjectDblClick(Sender: TObject);
    procedure actViewprojectExecute(Sender: TObject);
    procedure actEditprojectExecute(Sender: TObject);
    procedure actDeleteprojectExecute(Sender: TObject);
    procedure actInsertprojectExecute(Sender: TObject);
    procedure actUpdateprojectExecute(Sender: TObject);
    procedure actFilterprojectExecute(Sender: TObject);
    procedure actNoFilterprojectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENPlanProjectShow : TfrmENPlanProjectShow;
 // ENPlanProjectObj: ENPlanProject;
 // ENPlanProjectFilterObj: ENPlanProjectFilter;
  
  
implementation

uses Main, EditENPlanProject, EditENPlanProjectFilter;


{$R *.dfm}

var
  //frmENPlanProjectShow : TfrmENPlanProjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanProjectHeaders: array [1..5] of String =
        ( 'Код'
          ,'шифр проекта '
          ,'название проекта '
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENPlanProjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPlanProjectShow:=nil;
  inherited;
end;


procedure TfrmENPlanProjectShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENPlanProjectShow.FormShow(Sender: TObject);
var
  TempENPlanProject: ENPlanProjectControllerSoapPort;
  i: Integer;
  ENPlanProjectList: ENPlanProjectShortList;
begin
  SetGridHeaders(ENPlanProjectHeaders, sgENPlanProject.ColumnHeaders);
  ColCount:=100;
  TempENPlanProject :=  HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanProjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanProjectList := TempENPlanProject.getScrollableFilteredList(ENPlanProjectFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPlanProjectList.list);

  if LastCount > -1 then
     sgENPlanProject.RowCount:=LastCount+2
  else
     sgENPlanProject.RowCount:=2;

   with sgENPlanProject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanProjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanProjectList.list[i].projectCipher;
        Cells[2,i+1] := ENPlanProjectList.list[i].projectName;
        Cells[3,i+1] := ENPlanProjectList.list[i].userGen;
        if ENPlanProjectList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENPlanProjectList.list[i].dateEdit);
        LastRow:=i+1;
        sgENPlanProject.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPlanProject.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPlanProject.RowCount > selectedRow then
      sgENPlanProject.Row := selectedRow
    else
      sgENPlanProject.Row := sgENPlanProject.RowCount - 1;
    end
    else
      sgENPlanProject.Row:=1;   
end;


procedure TfrmENPlanProjectShow.sgENPlanProjectTopLeftChanged(Sender: TObject);
var
  TempENPlanProject: ENPlanProjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanProjectList: ENPlanProjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanProject.TopRow + sgENPlanProject.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanProject :=  HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
      CurrentRow:=sgENPlanProject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanProjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanProjectList := TempENPlanProject.getScrollableFilteredList(ENPlanProjectFilter(FilterObject),ColCount-1, 100);


  sgENPlanProject.RowCount:=sgENPlanProject.RowCount+100;
  LastCount:=High(ENPlanProjectList.list);
  with sgENPlanProject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanProjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanProjectList.list[i].projectCipher;
        Cells[2,i+CurrentRow] := ENPlanProjectList.list[i].projectName;
        Cells[3,i+CurrentRow] := ENPlanProjectList.list[i].userGen;
        if ENPlanProjectList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanProjectList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanProject.Row:=CurrentRow-5;
   sgENPlanProject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanProjectShow.sgENPlanProjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanProject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPlanProjectShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENPlanProject.RowCount-1 do
   for j:=0 to sgENPlanProject.ColCount-1 do
     sgENPlanProject.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPlanProjectShow.actViewprojectExecute(Sender: TObject);
var 
  TempENPlanProject: ENPlanProjectControllerSoapPort;
begin
  TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
  try
    ENPlanProjectObj := TempENPlanProject.getObject(StrToInt(sgENPlanProject.Cells[0,sgENPlanProject.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanProject.Row;
  frmENPlanProjectEdit:=TfrmENPlanProjectEdit.Create(Application, dsView);
  
  try
    frmENPlanProjectEdit.ShowModal;
  finally
    frmENPlanProjectEdit.Free;
    frmENPlanProjectEdit:=nil;
  end;

  if sgENPlanProject.RowCount > selectedRow then
    sgENPlanProject.Row := selectedRow
  else
    sgENPlanProject.Row := sgENPlanProject.RowCount - 1;
  
end;


procedure TfrmENPlanProjectShow.actEditprojectExecute(Sender: TObject);
var 
  TempENPlanProject: ENPlanProjectControllerSoapPort;
begin
  TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
  try
    ENPlanProjectObj := TempENPlanProject.getObject(StrToInt(sgENPlanProject.Cells[0,sgENPlanProject.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanProject.Row;
  frmENPlanProjectEdit:=TfrmENPlanProjectEdit.Create(Application, dsEdit);
  
  try
    if frmENPlanProjectEdit.ShowModal= mrOk then
      begin
        //TempENPlanProject.save(ENPlanProjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanProjectEdit.Free;
    frmENPlanProjectEdit:=nil;
  end;

  if sgENPlanProject.RowCount > selectedRow then
    sgENPlanProject.Row := selectedRow
  else
    sgENPlanProject.Row := sgENPlanProject.RowCount - 1;
  
end;


procedure TfrmENPlanProjectShow.actDeleteprojectExecute(Sender: TObject);
Var TempENPlanProject: ENPlanProjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanProject.Cells[0,sgENPlanProject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки тегов для названия работы по проектированию) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanProject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanProjectShow.actInsertprojectExecute(Sender: TObject);
// Var TempENPlanProject: ENPlanProjectControllerSoapPort; 
begin
  // TempENPlanProject := HTTPRIOENPlanProject as ENPlanProjectControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanProjectObj:=ENPlanProject.Create;
  SetNullIntProps(ENPlanProjectObj);
  SetNullXSProps(ENPlanProjectObj);

   //ENPlanProjectObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENPlanProjectEdit:=TfrmENPlanProjectEdit.Create(Application, dsInsert);
    try
      if frmENPlanProjectEdit.ShowModal = mrOk then
      begin
        if ENPlanProjectObj<>nil then
            //TempENPlanProject.add(ENPlanProjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanProjectEdit.Free;
      frmENPlanProjectEdit:=nil;
    end;
  finally
    ENPlanProjectObj.Free;
  end;
end;


procedure TfrmENPlanProjectShow.actUpdateprojectExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPlanProjectShow.actFilterprojectExecute(Sender: TObject);
begin
{frmENPlanProjectFilterEdit:=TfrmENPlanProjectFilterEdit.Create(Application, dsInsert);
  try
    ENPlanProjectFilterObj := ENPlanProjectFilter.Create;
    SetNullIntProps(ENPlanProjectFilterObj);
    SetNullXSProps(ENPlanProjectFilterObj);

    if frmENPlanProjectFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENPlanProjectFilter.Create;
      FilterObject := ENPlanProjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanProjectFilterEdit.Free;
    frmENPlanProjectFilterEdit:=nil;
  end;}
end;


procedure TfrmENPlanProjectShow.actNoFilterprojectExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.