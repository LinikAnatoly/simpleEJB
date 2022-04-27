
unit ShowENPlanWorkStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkStatusController, AdvObj ;


type
  TfrmENPlanWorkStatusShow = class(TChildForm)  
  HTTPRIOENPlanWorkStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkStatus: TAdvStringGrid;
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
procedure sgENPlanWorkStatusTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkStatusDblClick(Sender: TObject);
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
 planWorkStatusCode: Integer;
 frmENPlanWorkStatusShow : TfrmENPlanWorkStatusShow;
 // ENPlanWorkStatusObj: ENPlanWorkStatus;
 // ENPlanWorkStatusFilterObj: ENPlanWorkStatusFilter;
  
  
implementation

uses Main, EditENPlanWorkStatus, EditENPlanWorkStatusFilter;


{$R *.dfm}

var
  //frmENPlanWorkStatusShow : TfrmENPlanWorkStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус плана робіт'
        );
   

procedure TfrmENPlanWorkStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkStatusShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkStatusShow.FormShow(Sender: TObject);
var
  TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
  i: Integer;
  ENPlanWorkStatusList: ENPlanWorkStatusShortList;
  begin
  SetGridHeaders(ENPlanWorkStatusHeaders, sgENPlanWorkStatus.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkStatus :=  HTTPRIOENPlanWorkStatus as ENPlanWorkStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkStatusList := TempENPlanWorkStatus.getScrollableFilteredList(ENPlanWorkStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkStatusList.list);

  if LastCount > -1 then
     sgENPlanWorkStatus.RowCount:=LastCount+2
  else
     sgENPlanWorkStatus.RowCount:=2;

   with sgENPlanWorkStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanWorkStatusList.list[i].name;
        LastRow:=i+1;
        sgENPlanWorkStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkStatus.Row:=1;
end;

procedure TfrmENPlanWorkStatusShow.sgENPlanWorkStatusTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkStatusList: ENPlanWorkStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkStatus.TopRow + sgENPlanWorkStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkStatus :=  HTTPRIOENPlanWorkStatus as ENPlanWorkStatusControllerSoapPort;
      CurrentRow:=sgENPlanWorkStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkStatusList := TempENPlanWorkStatus.getScrollableFilteredList(ENPlanWorkStatusFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkStatus.RowCount:=sgENPlanWorkStatus.RowCount+100;
  LastCount:=High(ENPlanWorkStatusList.list);
  with sgENPlanWorkStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanWorkStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkStatus.Row:=CurrentRow-5;
   sgENPlanWorkStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkStatusShow.sgENPlanWorkStatusDblClick(Sender: TObject);
begin
  if FormMode = fmNormal then
    begin
      try
        planWorkStatusCode := StrToInt(GetReturnValue(sgENPlanWorkStatus, 0));
      except
        on EConvertError do Exit;
      end;
      ModalResult := mrOk;
    end
  else actViewExecute(Sender);
end;

procedure TfrmENPlanWorkStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkStatus.RowCount-1 do
   for j:=0 to sgENPlanWorkStatus.ColCount-1 do
     sgENPlanWorkStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkStatusShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
begin
 TempENPlanWorkStatus := HTTPRIOENPlanWorkStatus as ENPlanWorkStatusControllerSoapPort;
   try
     ENPlanWorkStatusObj := TempENPlanWorkStatus.getObject(StrToInt(sgENPlanWorkStatus.Cells[0,sgENPlanWorkStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkStatusEdit:=TfrmENPlanWorkStatusEdit.Create(Application, dsView);
  try
    frmENPlanWorkStatusEdit.ShowModal;
  finally
    frmENPlanWorkStatusEdit.Free;
    frmENPlanWorkStatusEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkStatusShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
begin
 TempENPlanWorkStatus := HTTPRIOENPlanWorkStatus as ENPlanWorkStatusControllerSoapPort;
   try
     ENPlanWorkStatusObj := TempENPlanWorkStatus.getObject(StrToInt(sgENPlanWorkStatus.Cells[0,sgENPlanWorkStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkStatusEdit:=TfrmENPlanWorkStatusEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkStatusEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkStatus.save(ENPlanWorkStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkStatusEdit.Free;
    frmENPlanWorkStatusEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkStatusShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkStatus := HTTPRIOENPlanWorkStatus as ENPlanWorkStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkStatus.Cells[0,sgENPlanWorkStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус плана робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkStatusShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
begin
  TempENPlanWorkStatus := HTTPRIOENPlanWorkStatus as ENPlanWorkStatusControllerSoapPort;
  ENPlanWorkStatusObj:=ENPlanWorkStatus.Create;



  try
    frmENPlanWorkStatusEdit:=TfrmENPlanWorkStatusEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkStatusEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkStatusObj<>nil then
            //TempENPlanWorkStatus.add(ENPlanWorkStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkStatusEdit.Free;
      frmENPlanWorkStatusEdit:=nil;
    end;
  finally
    ENPlanWorkStatusObj.Free;
  end;
end;

procedure TfrmENPlanWorkStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkStatusFilterEdit:=TfrmENPlanWorkStatusFilterEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkStatusFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanWorkStatusFilter.Create;
      FilterObject := ENPlanWorkStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkStatusFilterEdit.Free;
    frmENPlanWorkStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.