
unit ShowENTransportDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportDepartmentController, AdvObj ;


type
  TfrmENTransportDepartmentShow = class(TChildForm)  
  HTTPRIOENTransportDepartment: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportDepartment: TAdvStringGrid;
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
procedure sgENTransportDepartmentTopLeftChanged(Sender: TObject);
procedure sgENTransportDepartmentDblClick(Sender: TObject);
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
 frmENTransportDepartmentShow : TfrmENTransportDepartmentShow;
 // ENTransportDepartmentObj: ENTransportDepartment;
 // ENTransportDepartmentFilterObj: ENTransportDepartmentFilter;
  
  
implementation

uses Main, EditENTransportDepartment, EditENTransportDepartmentFilter;


{$R *.dfm}

var
  //frmENTransportDepartmentShow : TfrmENTransportDepartmentShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportDepartmentHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування підрозділа заявки'
        );
   

procedure TfrmENTransportDepartmentShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportDepartmentShow:=nil;
    inherited;
  end;


procedure TfrmENTransportDepartmentShow.FormShow(Sender: TObject);
var
  TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
  i: Integer;
  ENTransportDepartmentList: ENTransportDepartmentShortList;
  begin

  DisableActions([actInsert, actDelete, actEdit],true);
  SetGridHeaders(ENTransportDepartmentHeaders, sgENTransportDepartment.ColumnHeaders);
  ColCount:=100;
  TempENTransportDepartment :=  HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportDepartmentList := TempENTransportDepartment.getScrollableFilteredList(ENTransportDepartmentFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportDepartmentList.list);

  if LastCount > -1 then
     sgENTransportDepartment.RowCount:=LastCount+2
  else
     sgENTransportDepartment.RowCount:=2;

   with sgENTransportDepartment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportDepartmentList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportDepartmentList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTransportDepartmentList.list[i].name;
        LastRow:=i+1;
        sgENTransportDepartment.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportDepartment.Row:=1;
end;

procedure TfrmENTransportDepartmentShow.sgENTransportDepartmentTopLeftChanged(Sender: TObject);
var
  TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportDepartmentList: ENTransportDepartmentShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportDepartment.TopRow + sgENTransportDepartment.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportDepartment :=  HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
      CurrentRow:=sgENTransportDepartment.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportDepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportDepartmentList := TempENTransportDepartment.getScrollableFilteredList(ENTransportDepartmentFilter(FilterObject),ColCount-1, 100);



  sgENTransportDepartment.RowCount:=sgENTransportDepartment.RowCount+100;
  LastCount:=High(ENTransportDepartmentList.list);
  with sgENTransportDepartment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportDepartmentList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportDepartmentList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTransportDepartmentList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportDepartment.Row:=CurrentRow-5;
   sgENTransportDepartment.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportDepartmentShow.sgENTransportDepartmentDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportDepartment,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportDepartmentShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportDepartment.RowCount-1 do
   for j:=0 to sgENTransportDepartment.ColCount-1 do
     sgENTransportDepartment.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportDepartmentShow.actViewExecute(Sender: TObject);
Var TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
begin
 TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
   try
     ENTransportDepartmentObj := TempENTransportDepartment.getObject(StrToInt(sgENTransportDepartment.Cells[0,sgENTransportDepartment.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportDepartmentEdit:=TfrmENTransportDepartmentEdit.Create(Application, dsView);
  try
    frmENTransportDepartmentEdit.ShowModal;
  finally
    frmENTransportDepartmentEdit.Free;
    frmENTransportDepartmentEdit:=nil;
  end;
end;

procedure TfrmENTransportDepartmentShow.actEditExecute(Sender: TObject);
Var TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
begin
 TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
   try
     ENTransportDepartmentObj := TempENTransportDepartment.getObject(StrToInt(sgENTransportDepartment.Cells[0,sgENTransportDepartment.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportDepartmentEdit:=TfrmENTransportDepartmentEdit.Create(Application, dsEdit);
  try
    if frmENTransportDepartmentEdit.ShowModal= mrOk then
      begin
        //TempENTransportDepartment.save(ENTransportDepartmentObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportDepartmentEdit.Free;
    frmENTransportDepartmentEdit:=nil;
  end;
end;

procedure TfrmENTransportDepartmentShow.actDeleteExecute(Sender: TObject);
Var TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportDepartment.Cells[0,sgENTransportDepartment.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Подразделения транспорта) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportDepartment.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportDepartmentShow.actInsertExecute(Sender: TObject);
Var TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
begin
  TempENTransportDepartment := HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
  ENTransportDepartmentObj:=ENTransportDepartment.Create;



  try
    frmENTransportDepartmentEdit:=TfrmENTransportDepartmentEdit.Create(Application, dsInsert);
    try
      if frmENTransportDepartmentEdit.ShowModal = mrOk then
      begin
        if ENTransportDepartmentObj<>nil then
            //TempENTransportDepartment.add(ENTransportDepartmentObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportDepartmentEdit.Free;
      frmENTransportDepartmentEdit:=nil;
    end;
  finally
    ENTransportDepartmentObj.Free;
  end;
end;

procedure TfrmENTransportDepartmentShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportDepartmentShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportDepartmentFilterEdit:=TfrmENTransportDepartmentFilterEdit.Create(Application, dsInsert);
  try
    ENTransportDepartmentFilterObj := ENTransportDepartmentFilter.Create;
    SetNullIntProps(ENTransportDepartmentFilterObj);
    SetNullXSProps(ENTransportDepartmentFilterObj);

    if frmENTransportDepartmentFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportDepartmentFilter.Create;
      FilterObject := ENTransportDepartmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportDepartmentFilterEdit.Free;
    frmENTransportDepartmentFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportDepartmentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.