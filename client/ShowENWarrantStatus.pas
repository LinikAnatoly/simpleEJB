
unit ShowENWarrantStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENWarrantStatusController, AdvObj ;


type
  TfrmENWarrantStatusShow = class(TChildForm)  
  HTTPRIOENWarrantStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENWarrantStatus: TAdvStringGrid;
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
procedure sgENWarrantStatusTopLeftChanged(Sender: TObject);
procedure sgENWarrantStatusDblClick(Sender: TObject);
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
 frmENWarrantStatusShow : TfrmENWarrantStatusShow;
 // ENWarrantStatusObj: ENWarrantStatus;
 // ENWarrantStatusFilterObj: ENWarrantStatusFilter;
  
  
implementation

uses Main, EditENWarrantStatus, EditENWarrantStatusFilter;


{$R *.dfm}

var
  //frmENWarrantStatusShow : TfrmENWarrantStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWarrantStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус (действительная/нет)'
        );
   

procedure TfrmENWarrantStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENWarrantStatusShow:=nil;
    inherited;
  end;


procedure TfrmENWarrantStatusShow.FormShow(Sender: TObject);
var
  TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
  i: Integer;
  ENWarrantStatusList: ENWarrantStatusShortList;
  begin
  SetGridHeaders(ENWarrantStatusHeaders, sgENWarrantStatus.ColumnHeaders);
  ColCount:=100;
  TempENWarrantStatus :=  HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWarrantStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWarrantStatusList := TempENWarrantStatus.getScrollableFilteredList(ENWarrantStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENWarrantStatusList.list);

  if LastCount > -1 then
     sgENWarrantStatus.RowCount:=LastCount+2
  else
     sgENWarrantStatus.RowCount:=2;

   with sgENWarrantStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWarrantStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWarrantStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENWarrantStatusList.list[i].name;
        LastRow:=i+1;
        sgENWarrantStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENWarrantStatus.Row:=1;
end;

procedure TfrmENWarrantStatusShow.sgENWarrantStatusTopLeftChanged(Sender: TObject);
var
  TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENWarrantStatusList: ENWarrantStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENWarrantStatus.TopRow + sgENWarrantStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENWarrantStatus :=  HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;
      CurrentRow:=sgENWarrantStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENWarrantStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWarrantStatusList := TempENWarrantStatus.getScrollableFilteredList(ENWarrantStatusFilter(FilterObject),ColCount-1, 100);



  sgENWarrantStatus.RowCount:=sgENWarrantStatus.RowCount+100;
  LastCount:=High(ENWarrantStatusList.list);
  with sgENWarrantStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWarrantStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENWarrantStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENWarrantStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWarrantStatus.Row:=CurrentRow-5;
   sgENWarrantStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENWarrantStatusShow.sgENWarrantStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWarrantStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENWarrantStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENWarrantStatus.RowCount-1 do
   for j:=0 to sgENWarrantStatus.ColCount-1 do
     sgENWarrantStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENWarrantStatusShow.actViewExecute(Sender: TObject);
Var TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
begin
 TempENWarrantStatus := HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;
   try
     ENWarrantStatusObj := TempENWarrantStatus.getObject(StrToInt(sgENWarrantStatus.Cells[0,sgENWarrantStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWarrantStatusEdit:=TfrmENWarrantStatusEdit.Create(Application, dsView);
  try
    frmENWarrantStatusEdit.ShowModal;
  finally
    frmENWarrantStatusEdit.Free;
    frmENWarrantStatusEdit:=nil;
  end;
end;

procedure TfrmENWarrantStatusShow.actEditExecute(Sender: TObject);
Var TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
begin
 TempENWarrantStatus := HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;
   try
     ENWarrantStatusObj := TempENWarrantStatus.getObject(StrToInt(sgENWarrantStatus.Cells[0,sgENWarrantStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENWarrantStatusEdit:=TfrmENWarrantStatusEdit.Create(Application, dsEdit);
  try
    if frmENWarrantStatusEdit.ShowModal= mrOk then
      begin
        //TempENWarrantStatus.save(ENWarrantStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWarrantStatusEdit.Free;
    frmENWarrantStatusEdit:=nil;
  end;
end;

procedure TfrmENWarrantStatusShow.actDeleteExecute(Sender: TObject);
Var TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWarrantStatus := HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWarrantStatus.Cells[0,sgENWarrantStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус доверенности) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWarrantStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWarrantStatusShow.actInsertExecute(Sender: TObject);
Var TempENWarrantStatus: ENWarrantStatusControllerSoapPort;
begin
  TempENWarrantStatus := HTTPRIOENWarrantStatus as ENWarrantStatusControllerSoapPort;
  ENWarrantStatusObj:=ENWarrantStatus.Create;



  try
    frmENWarrantStatusEdit:=TfrmENWarrantStatusEdit.Create(Application, dsInsert);
    try
      if frmENWarrantStatusEdit.ShowModal = mrOk then
      begin
        if ENWarrantStatusObj<>nil then
            //TempENWarrantStatus.add(ENWarrantStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWarrantStatusEdit.Free;
      frmENWarrantStatusEdit:=nil;
    end;
  finally
    ENWarrantStatusObj.Free;
  end;
end;

procedure TfrmENWarrantStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENWarrantStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENWarrantStatusFilterEdit:=TfrmENWarrantStatusFilterEdit.Create(Application, dsInsert);
  try
    ENWarrantStatusFilterObj := ENWarrantStatusFilter.Create;
    SetNullIntProps(ENWarrantStatusFilterObj);
    SetNullXSProps(ENWarrantStatusFilterObj);

    if frmENWarrantStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENWarrantStatusFilter.Create;
      FilterObject := ENWarrantStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWarrantStatusFilterEdit.Free;
    frmENWarrantStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENWarrantStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.