
unit ShowRQAllocationListStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQAllocationListStatusController ;


type
  TfrmRQAllocationListStatusShow = class(TChildForm)  
  HTTPRIORQAllocationListStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQAllocationListStatus: TAdvStringGrid;
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
procedure sgRQAllocationListStatusTopLeftChanged(Sender: TObject);
procedure sgRQAllocationListStatusDblClick(Sender: TObject);
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

//var
 // RQAllocationListStatusObj: RQAllocationListStatus;
 // RQAllocationListStatusFilterObj: RQAllocationListStatusFilter;
  
  
implementation

uses Main, EditRQAllocationListStatus, EditRQAllocationListStatusFilter;


{$R *.dfm}

var
  //frmRQAllocationListStatusShow : TfrmRQAllocationListStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQAllocationListStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва стану'
        );
   

procedure TfrmRQAllocationListStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQAllocationListStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQAllocationListStatusShow.FormShow(Sender: TObject);
var
  TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort;
  i: Integer;
  RQAllocationListStatusList: RQAllocationListStatusShortList;
  begin
  SetGridHeaders(RQAllocationListStatusHeaders, sgRQAllocationListStatus.ColumnHeaders);
  ColCount:=100;
  TempRQAllocationListStatus :=  HTTPRIORQAllocationListStatus as RQAllocationListStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListStatusList := TempRQAllocationListStatus.getScrollableFilteredList(RQAllocationListStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQAllocationListStatusList.list);

  if LastCount > -1 then
     sgRQAllocationListStatus.RowCount:=LastCount+2
  else
     sgRQAllocationListStatus.RowCount:=2;

   with sgRQAllocationListStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQAllocationListStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQAllocationListStatusList.list[i].name;
        LastRow:=i+1;
        sgRQAllocationListStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQAllocationListStatus.Row:=1;
end;

procedure TfrmRQAllocationListStatusShow.sgRQAllocationListStatusTopLeftChanged(Sender: TObject);
var
  TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQAllocationListStatusList: RQAllocationListStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQAllocationListStatus.TopRow + sgRQAllocationListStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQAllocationListStatus :=  HTTPRIORQAllocationListStatus as RQAllocationListStatusControllerSoapPort;
      CurrentRow:=sgRQAllocationListStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListStatusList := TempRQAllocationListStatus.getScrollableFilteredList(RQAllocationListStatusFilter(FilterObject),ColCount-1, 100);



  sgRQAllocationListStatus.RowCount:=sgRQAllocationListStatus.RowCount+100;
  LastCount:=High(RQAllocationListStatusList.list);
  with sgRQAllocationListStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQAllocationListStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQAllocationListStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQAllocationListStatus.Row:=CurrentRow-5;
   sgRQAllocationListStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQAllocationListStatusShow.sgRQAllocationListStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQAllocationListStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQAllocationListStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQAllocationListStatus.RowCount-1 do
   for j:=0 to sgRQAllocationListStatus.ColCount-1 do
     sgRQAllocationListStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQAllocationListStatusShow.actViewExecute(Sender: TObject);
Var TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort;
begin
 TempRQAllocationListStatus := HTTPRIORQAllocationListStatus as RQAllocationListStatusControllerSoapPort;
   try
     RQAllocationListStatusObj := TempRQAllocationListStatus.getObject(StrToInt(sgRQAllocationListStatus.Cells[0,sgRQAllocationListStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListStatusEdit:=TfrmRQAllocationListStatusEdit.Create(Application, dsView);
  try
    frmRQAllocationListStatusEdit.ShowModal;
  finally
    frmRQAllocationListStatusEdit.Free;
    frmRQAllocationListStatusEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListStatusShow.actEditExecute(Sender: TObject);
Var TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort;
begin
 TempRQAllocationListStatus := HTTPRIORQAllocationListStatus as RQAllocationListStatusControllerSoapPort;
   try
     RQAllocationListStatusObj := TempRQAllocationListStatus.getObject(StrToInt(sgRQAllocationListStatus.Cells[0,sgRQAllocationListStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListStatusEdit:=TfrmRQAllocationListStatusEdit.Create(Application, dsEdit);
  try
    if frmRQAllocationListStatusEdit.ShowModal= mrOk then
      begin
        //TempRQAllocationListStatus.save(RQAllocationListStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQAllocationListStatusEdit.Free;
    frmRQAllocationListStatusEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQAllocationListStatus := HTTPRIORQAllocationListStatus as RQAllocationListStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQAllocationListStatus.Cells[0,sgRQAllocationListStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Стан відомості розподілу залишків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQAllocationListStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQAllocationListStatusShow.actInsertExecute(Sender: TObject);
// Var TempRQAllocationListStatus: RQAllocationListStatusControllerSoapPort; 
begin
  // TempRQAllocationListStatus := HTTPRIORQAllocationListStatus as RQAllocationListStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQAllocationListStatusObj:=RQAllocationListStatus.Create;



  try
    frmRQAllocationListStatusEdit:=TfrmRQAllocationListStatusEdit.Create(Application, dsInsert);
    try
      if frmRQAllocationListStatusEdit.ShowModal = mrOk then
      begin
        if RQAllocationListStatusObj<>nil then
            //TempRQAllocationListStatus.add(RQAllocationListStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQAllocationListStatusEdit.Free;
      frmRQAllocationListStatusEdit:=nil;
    end;
  finally
    RQAllocationListStatusObj.Free;
  end;
end;

procedure TfrmRQAllocationListStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQAllocationListStatusFilterEdit:=TfrmRQAllocationListStatusFilterEdit.Create(Application, dsInsert);
  try
    RQAllocationListStatusFilterObj := RQAllocationListStatusFilter.Create;
    SetNullIntProps(RQAllocationListStatusFilterObj);
    SetNullXSProps(RQAllocationListStatusFilterObj);

    if frmRQAllocationListStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQAllocationListStatusFilter.Create;
      FilterObject := RQAllocationListStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQAllocationListStatusFilterEdit.Free;
    frmRQAllocationListStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQAllocationListStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.