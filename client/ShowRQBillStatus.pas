
unit ShowRQBillStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQBillStatusController ;


type
  TfrmRQBillStatusShow = class(TChildForm)  
  HTTPRIORQBillStatus: THTTPRIO;
    ImageList1: TImageList;
    sgRQBillStatus: TAdvStringGrid;
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
procedure sgRQBillStatusTopLeftChanged(Sender: TObject);
procedure sgRQBillStatusDblClick(Sender: TObject);
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
 // RQBillStatusObj: RQBillStatus;
 // RQBillStatusFilterObj: RQBillStatusFilter;
  
  
implementation

uses Main, EditRQBillStatus, EditRQBillStatusFilter;


{$R *.dfm}

var
  //frmRQBillStatusShow : TfrmRQBillStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQBillStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус рахунку'
        );
   

procedure TfrmRQBillStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQBillStatusShow:=nil;
    inherited;
  end;


procedure TfrmRQBillStatusShow.FormShow(Sender: TObject);
var
  TempRQBillStatus: RQBillStatusControllerSoapPort;
  i: Integer;
  RQBillStatusList: RQBillStatusShortList;
  begin
  SetGridHeaders(RQBillStatusHeaders, sgRQBillStatus.ColumnHeaders);
  ColCount:=100;
  TempRQBillStatus :=  HTTPRIORQBillStatus as RQBillStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQBillStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBillStatusList := TempRQBillStatus.getScrollableFilteredList(RQBillStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(RQBillStatusList.list);

  if LastCount > -1 then
     sgRQBillStatus.RowCount:=LastCount+2
  else
     sgRQBillStatus.RowCount:=2;

   with sgRQBillStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBillStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQBillStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQBillStatusList.list[i].name;
        LastRow:=i+1;
        sgRQBillStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQBillStatus.Row:=1;
end;

procedure TfrmRQBillStatusShow.sgRQBillStatusTopLeftChanged(Sender: TObject);
var
  TempRQBillStatus: RQBillStatusControllerSoapPort;
  i,CurrentRow: Integer;
  RQBillStatusList: RQBillStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQBillStatus.TopRow + sgRQBillStatus.VisibleRowCount) = ColCount
  then
    begin
      TempRQBillStatus :=  HTTPRIORQBillStatus as RQBillStatusControllerSoapPort;
      CurrentRow:=sgRQBillStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQBillStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQBillStatusList := TempRQBillStatus.getScrollableFilteredList(RQBillStatusFilter(FilterObject),ColCount-1, 100);



  sgRQBillStatus.RowCount:=sgRQBillStatus.RowCount+100;
  LastCount:=High(RQBillStatusList.list);
  with sgRQBillStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBillStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQBillStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQBillStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQBillStatus.Row:=CurrentRow-5;
   sgRQBillStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQBillStatusShow.sgRQBillStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQBillStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQBillStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQBillStatus.RowCount-1 do
   for j:=0 to sgRQBillStatus.ColCount-1 do
     sgRQBillStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQBillStatusShow.actViewExecute(Sender: TObject);
Var TempRQBillStatus: RQBillStatusControllerSoapPort;
begin
 TempRQBillStatus := HTTPRIORQBillStatus as RQBillStatusControllerSoapPort;
   try
     RQBillStatusObj := TempRQBillStatus.getObject(StrToInt(sgRQBillStatus.Cells[0,sgRQBillStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBillStatusEdit:=TfrmRQBillStatusEdit.Create(Application, dsView);
  try
    frmRQBillStatusEdit.ShowModal;
  finally
    frmRQBillStatusEdit.Free;
    frmRQBillStatusEdit:=nil;
  end;
end;

procedure TfrmRQBillStatusShow.actEditExecute(Sender: TObject);
Var TempRQBillStatus: RQBillStatusControllerSoapPort;
begin
 TempRQBillStatus := HTTPRIORQBillStatus as RQBillStatusControllerSoapPort;
   try
     RQBillStatusObj := TempRQBillStatus.getObject(StrToInt(sgRQBillStatus.Cells[0,sgRQBillStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQBillStatusEdit:=TfrmRQBillStatusEdit.Create(Application, dsEdit);
  try
    if frmRQBillStatusEdit.ShowModal= mrOk then
      begin
        //TempRQBillStatus.save(RQBillStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQBillStatusEdit.Free;
    frmRQBillStatusEdit:=nil;
  end;
end;

procedure TfrmRQBillStatusShow.actDeleteExecute(Sender: TObject);
Var TempRQBillStatus: RQBillStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQBillStatus := HTTPRIORQBillStatus as RQBillStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBillStatus.Cells[0,sgRQBillStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус рахунку (создан/отраб и т.д.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQBillStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQBillStatusShow.actInsertExecute(Sender: TObject);
Var TempRQBillStatus: RQBillStatusControllerSoapPort;
begin
  TempRQBillStatus := HTTPRIORQBillStatus as RQBillStatusControllerSoapPort;
  RQBillStatusObj:=RQBillStatus.Create;



  try
    frmRQBillStatusEdit:=TfrmRQBillStatusEdit.Create(Application, dsInsert);
    try
      if frmRQBillStatusEdit.ShowModal = mrOk then
      begin
        if RQBillStatusObj<>nil then
            //TempRQBillStatus.add(RQBillStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQBillStatusEdit.Free;
      frmRQBillStatusEdit:=nil;
    end;
  finally
    RQBillStatusObj.Free;
  end;
end;

procedure TfrmRQBillStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQBillStatusShow.actFilterExecute(Sender: TObject);
begin
{frmRQBillStatusFilterEdit:=TfrmRQBillStatusFilterEdit.Create(Application, dsEdit);
  try
    RQBillStatusFilterObj := RQBillStatusFilter.Create;
    SetNullIntProps(RQBillStatusFilterObj);
    SetNullXSProps(RQBillStatusFilterObj);

    if frmRQBillStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQBillStatusFilter.Create;
      FilterObject := RQBillStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQBillStatusFilterEdit.Free;
    frmRQBillStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmRQBillStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.