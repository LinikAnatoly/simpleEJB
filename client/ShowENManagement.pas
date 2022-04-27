
unit ShowENManagement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENManagementController, AdvObj ;


type
  TfrmENManagementShow = class(TChildForm)  
  HTTPRIOENManagement: THTTPRIO;
    ImageList1: TImageList;
    sgENManagement: TAdvStringGrid;
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
procedure sgENManagementTopLeftChanged(Sender: TObject);
procedure sgENManagementDblClick(Sender: TObject);
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
 frmENManagementShow : TfrmENManagementShow;
 // ENManagementObj: ENManagement;
 // ENManagementFilterObj: ENManagementFilter;
  
  
implementation

uses Main, EditENManagement, EditENManagementFilter;


{$R *.dfm}

var
  //frmENManagementShow : TfrmENManagementShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENManagementHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENManagementShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENManagementShow:=nil;
    inherited;
  end;


procedure TfrmENManagementShow.FormShow(Sender: TObject);
var
  TempENManagement: ENManagementControllerSoapPort;
  i: Integer;
  ENManagementList: ENManagementShortList;
  begin
  SetGridHeaders(ENManagementHeaders, sgENManagement.ColumnHeaders);
  ColCount:=100;
  TempENManagement :=  HTTPRIOENManagement as ENManagementControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENManagementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENManagementList := TempENManagement.getScrollableFilteredList(ENManagementFilter(FilterObject),0,ColCount);


  LastCount:=High(ENManagementList.list);

  if LastCount > -1 then
     sgENManagement.RowCount:=LastCount+2
  else
     sgENManagement.RowCount:=2;

   with sgENManagement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENManagementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENManagementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENManagementList.list[i].name;
        LastRow:=i+1;
        sgENManagement.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENManagement.Row:=1;
end;

procedure TfrmENManagementShow.sgENManagementTopLeftChanged(Sender: TObject);
var
  TempENManagement: ENManagementControllerSoapPort;
  i,CurrentRow: Integer;
  ENManagementList: ENManagementShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENManagement.TopRow + sgENManagement.VisibleRowCount) = ColCount
  then
    begin
      TempENManagement :=  HTTPRIOENManagement as ENManagementControllerSoapPort;
      CurrentRow:=sgENManagement.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENManagementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENManagementList := TempENManagement.getScrollableFilteredList(ENManagementFilter(FilterObject),ColCount-1, 100);



  sgENManagement.RowCount:=sgENManagement.RowCount+100;
  LastCount:=High(ENManagementList.list);
  with sgENManagement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENManagementList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENManagementList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENManagementList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENManagement.Row:=CurrentRow-5;
   sgENManagement.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENManagementShow.sgENManagementDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENManagement,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENManagementShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENManagement.RowCount-1 do
   for j:=0 to sgENManagement.ColCount-1 do
     sgENManagement.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENManagementShow.actViewExecute(Sender: TObject);
Var TempENManagement: ENManagementControllerSoapPort;
begin
 TempENManagement := HTTPRIOENManagement as ENManagementControllerSoapPort;
   try
     ENManagementObj := TempENManagement.getObject(StrToInt(sgENManagement.Cells[0,sgENManagement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENManagementEdit:=TfrmENManagementEdit.Create(Application, dsView);
  try
    frmENManagementEdit.ShowModal;
  finally
    frmENManagementEdit.Free;
    frmENManagementEdit:=nil;
  end;
end;

procedure TfrmENManagementShow.actEditExecute(Sender: TObject);
Var TempENManagement: ENManagementControllerSoapPort;
begin
 TempENManagement := HTTPRIOENManagement as ENManagementControllerSoapPort;
   try
     ENManagementObj := TempENManagement.getObject(StrToInt(sgENManagement.Cells[0,sgENManagement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENManagementEdit:=TfrmENManagementEdit.Create(Application, dsEdit);
  try
    if frmENManagementEdit.ShowModal= mrOk then
      begin
        //TempENManagement.save(ENManagementObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENManagementEdit.Free;
    frmENManagementEdit:=nil;
  end;
end;

procedure TfrmENManagementShow.actDeleteExecute(Sender: TObject);
Var TempENManagement: ENManagementControllerSoapPort;
  ObjCode: Integer;
begin
 TempENManagement := HTTPRIOENManagement as ENManagementControllerSoapPort;
   try
     ObjCode := StrToInt(sgENManagement.Cells[0,sgENManagement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Дирекція) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENManagement.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENManagementShow.actInsertExecute(Sender: TObject);
Var TempENManagement: ENManagementControllerSoapPort;
begin
  TempENManagement := HTTPRIOENManagement as ENManagementControllerSoapPort;
  ENManagementObj:=ENManagement.Create;



  try
    frmENManagementEdit:=TfrmENManagementEdit.Create(Application, dsInsert);
    try
      if frmENManagementEdit.ShowModal = mrOk then
      begin
        if ENManagementObj<>nil then
            //TempENManagement.add(ENManagementObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENManagementEdit.Free;
      frmENManagementEdit:=nil;
    end;
  finally
    ENManagementObj.Free;
  end;
end;

procedure TfrmENManagementShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENManagementShow.actFilterExecute(Sender: TObject);
begin
{frmENManagementFilterEdit:=TfrmENManagementFilterEdit.Create(Application, dsInsert);
  try
    ENManagementFilterObj := ENManagementFilter.Create;
    SetNullIntProps(ENManagementFilterObj);
    SetNullXSProps(ENManagementFilterObj);

    if frmENManagementFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENManagementFilter.Create;
      FilterObject := ENManagementFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENManagementFilterEdit.Free;
    frmENManagementFilterEdit:=nil;
  end;}
end;

procedure TfrmENManagementShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.