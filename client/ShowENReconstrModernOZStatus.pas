
unit ShowENReconstrModernOZStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENReconstrModernOZStatusController ;


type
  TfrmENReconstrModernOZStatusShow = class(TChildForm)  
  HTTPRIOENReconstrModernOZStatus: THTTPRIO;
    ImageList1: TImageList;
    sgENReconstrModernOZStatus: TAdvStringGrid;
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
procedure sgENReconstrModernOZStatusTopLeftChanged(Sender: TObject);
procedure sgENReconstrModernOZStatusDblClick(Sender: TObject);
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
 // ENReconstrModernOZStatusObj: ENReconstrModernOZStatus;
 // ENReconstrModernOZStatusFilterObj: ENReconstrModernOZStatusFilter;
  
  
implementation

uses Main;


{$R *.dfm}

var
  //frmENReconstrModernOZStatusShow : TfrmENReconstrModernOZStatusShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENReconstrModernOZStatusHeaders: array [1..2] of String =
        ( 'Код'
          ,'Статус документу по РМ'
        );
   

procedure TfrmENReconstrModernOZStatusShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENReconstrModernOZStatusShow:=nil;
    inherited;
  end;


procedure TfrmENReconstrModernOZStatusShow.FormShow(Sender: TObject);
var
  TempENReconstrModernOZStatus: ENReconstrModernOZStatusControllerSoapPort;
  i: Integer;
  ENReconstrModernOZStatusList: ENReconstrModernOZStatusShortList;
  begin
  SetGridHeaders(ENReconstrModernOZStatusHeaders, sgENReconstrModernOZStatus.ColumnHeaders);
  ColCount:=100;
  TempENReconstrModernOZStatus :=  HTTPRIOENReconstrModernOZStatus as ENReconstrModernOZStatusControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModernOZStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModernOZStatusList := TempENReconstrModernOZStatus.getScrollableFilteredList(ENReconstrModernOZStatusFilter(FilterObject),0,ColCount);


  LastCount:=High(ENReconstrModernOZStatusList.list);

  if LastCount > -1 then
     sgENReconstrModernOZStatus.RowCount:=LastCount+2
  else
     sgENReconstrModernOZStatus.RowCount:=2;

   with sgENReconstrModernOZStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReconstrModernOZStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENReconstrModernOZStatusList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENReconstrModernOZStatusList.list[i].name;
        LastRow:=i+1;
        sgENReconstrModernOZStatus.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENReconstrModernOZStatus.Row:=1;
end;

procedure TfrmENReconstrModernOZStatusShow.sgENReconstrModernOZStatusTopLeftChanged(Sender: TObject);
var
  TempENReconstrModernOZStatus: ENReconstrModernOZStatusControllerSoapPort;
  i,CurrentRow: Integer;
  ENReconstrModernOZStatusList: ENReconstrModernOZStatusShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENReconstrModernOZStatus.TopRow + sgENReconstrModernOZStatus.VisibleRowCount) = ColCount
  then
    begin
      TempENReconstrModernOZStatus :=  HTTPRIOENReconstrModernOZStatus as ENReconstrModernOZStatusControllerSoapPort;
      CurrentRow:=sgENReconstrModernOZStatus.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModernOZStatusFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModernOZStatusList := TempENReconstrModernOZStatus.getScrollableFilteredList(ENReconstrModernOZStatusFilter(FilterObject),ColCount-1, 100);



  sgENReconstrModernOZStatus.RowCount:=sgENReconstrModernOZStatus.RowCount+100;
  LastCount:=High(ENReconstrModernOZStatusList.list);
  with sgENReconstrModernOZStatus do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReconstrModernOZStatusList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENReconstrModernOZStatusList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENReconstrModernOZStatusList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENReconstrModernOZStatus.Row:=CurrentRow-5;
   sgENReconstrModernOZStatus.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENReconstrModernOZStatusShow.sgENReconstrModernOZStatusDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENReconstrModernOZStatus,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENReconstrModernOZStatusShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENReconstrModernOZStatus.RowCount-1 do
   for j:=0 to sgENReconstrModernOZStatus.ColCount-1 do
     sgENReconstrModernOZStatus.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENReconstrModernOZStatusShow.actViewExecute(Sender: TObject);
// Var TempENReconstrModernOZStatus: ENReconstrModernOZStatusControllerSoapPort;
begin
 {TempENReconstrModernOZStatus := HTTPRIOENReconstrModernOZStatus as ENReconstrModernOZStatusControllerSoapPort;
   try
     ENReconstrModernOZStatusObj := TempENReconstrModernOZStatus.getObject(StrToInt(sgENReconstrModernOZStatus.Cells[0,sgENReconstrModernOZStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENReconstrModernOZStatusEdit:=TfrmENReconstrModernOZStatusEdit.Create(Application, dsView);
  try
    frmENReconstrModernOZStatusEdit.ShowModal;
  finally
    frmENReconstrModernOZStatusEdit.Free;
    frmENReconstrModernOZStatusEdit:=nil;
  end;}
end;

procedure TfrmENReconstrModernOZStatusShow.actEditExecute(Sender: TObject);
// Var TempENReconstrModernOZStatus: ENReconstrModernOZStatusControllerSoapPort;
begin
{ TempENReconstrModernOZStatus := HTTPRIOENReconstrModernOZStatus as ENReconstrModernOZStatusControllerSoapPort;
   try
     ENReconstrModernOZStatusObj := TempENReconstrModernOZStatus.getObject(StrToInt(sgENReconstrModernOZStatus.Cells[0,sgENReconstrModernOZStatus.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENReconstrModernOZStatusEdit:=TfrmENReconstrModernOZStatusEdit.Create(Application, dsEdit);
  try
    if frmENReconstrModernOZStatusEdit.ShowModal= mrOk then
      begin
        //TempENReconstrModernOZStatus.save(ENReconstrModernOZStatusObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENReconstrModernOZStatusEdit.Free;
    frmENReconstrModernOZStatusEdit:=nil;
  end; }
end;

procedure TfrmENReconstrModernOZStatusShow.actDeleteExecute(Sender: TObject);
Var TempENReconstrModernOZStatus: ENReconstrModernOZStatusControllerSoapPort;
  ObjCode: Integer;
begin
 TempENReconstrModernOZStatus := HTTPRIOENReconstrModernOZStatus as ENReconstrModernOZStatusControllerSoapPort;
   try
     ObjCode := StrToInt(sgENReconstrModernOZStatus.Cells[0,sgENReconstrModernOZStatus.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Статус реконструкція модернізація Основних засобів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENReconstrModernOZStatus.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENReconstrModernOZStatusShow.actInsertExecute(Sender: TObject);
// Var TempENReconstrModernOZStatus: ENReconstrModernOZStatusControllerSoapPort; 
begin
  // TempENReconstrModernOZStatus := HTTPRIOENReconstrModernOZStatus as ENReconstrModernOZStatusControllerSoapPort;  /// Это здесь уже лишнее!!!
 { ENReconstrModernOZStatusObj:=ENReconstrModernOZStatus.Create;



  try
    frmENReconstrModernOZStatusEdit:=TfrmENReconstrModernOZStatusEdit.Create(Application, dsInsert);
    try
      if frmENReconstrModernOZStatusEdit.ShowModal = mrOk then
      begin
        if ENReconstrModernOZStatusObj<>nil then
            //TempENReconstrModernOZStatus.add(ENReconstrModernOZStatusObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENReconstrModernOZStatusEdit.Free;
      frmENReconstrModernOZStatusEdit:=nil;
    end;
  finally
    ENReconstrModernOZStatusObj.Free;
  end; } 
end;

procedure TfrmENReconstrModernOZStatusShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENReconstrModernOZStatusShow.actFilterExecute(Sender: TObject);
begin
{frmENReconstrModernOZStatusFilterEdit:=TfrmENReconstrModernOZStatusFilterEdit.Create(Application, dsInsert);
  try
    ENReconstrModernOZStatusFilterObj := ENReconstrModernOZStatusFilter.Create;
    SetNullIntProps(ENReconstrModernOZStatusFilterObj);
    SetNullXSProps(ENReconstrModernOZStatusFilterObj);

    if frmENReconstrModernOZStatusFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENReconstrModernOZStatusFilter.Create;
      FilterObject := ENReconstrModernOZStatusFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENReconstrModernOZStatusFilterEdit.Free;
    frmENReconstrModernOZStatusFilterEdit:=nil;
  end;}
end;

procedure TfrmENReconstrModernOZStatusShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.