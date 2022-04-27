
unit ShowENLoadSwitchDriveType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLoadSwitchDriveTypeController, AdvObj ;


type
  TfrmENLoadSwitchDriveTypeShow = class(TChildForm)  
  HTTPRIOENLoadSwitchDriveType: THTTPRIO;
    ImageList1: TImageList;
    sgENLoadSwitchDriveType: TAdvStringGrid;
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
procedure sgENLoadSwitchDriveTypeTopLeftChanged(Sender: TObject);
procedure sgENLoadSwitchDriveTypeDblClick(Sender: TObject);
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
 frmENLoadSwitchDriveTypeShow : TfrmENLoadSwitchDriveTypeShow;
 // ENLoadSwitchDriveTypeObj: ENLoadSwitchDriveType;
 // ENLoadSwitchDriveTypeFilterObj: ENLoadSwitchDriveTypeFilter;
  
  
implementation

uses Main, EditENLoadSwitchDriveType, EditENLoadSwitchDriveTypeFilter;


{$R *.dfm}

var
  //frmENLoadSwitchDriveTypeShow : TfrmENLoadSwitchDriveTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLoadSwitchDriveTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип привода выключателя нагрузки'
        );
   

procedure TfrmENLoadSwitchDriveTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLoadSwitchDriveTypeShow:=nil;
    inherited;
  end;


procedure TfrmENLoadSwitchDriveTypeShow.FormShow(Sender: TObject);
var
  TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
  i: Integer;
  ENLoadSwitchDriveTypeList: ENLoadSwitchDriveTypeShortList;
  begin
  SetGridHeaders(ENLoadSwitchDriveTypeHeaders, sgENLoadSwitchDriveType.ColumnHeaders);
  ColCount:=100;
  TempENLoadSwitchDriveType :=  HTTPRIOENLoadSwitchDriveType as ENLoadSwitchDriveTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLoadSwitchDriveTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLoadSwitchDriveTypeList := TempENLoadSwitchDriveType.getScrollableFilteredList(ENLoadSwitchDriveTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLoadSwitchDriveTypeList.list);

  if LastCount > -1 then
     sgENLoadSwitchDriveType.RowCount:=LastCount+2
  else
     sgENLoadSwitchDriveType.RowCount:=2;

   with sgENLoadSwitchDriveType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLoadSwitchDriveTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLoadSwitchDriveTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLoadSwitchDriveTypeList.list[i].name;
        LastRow:=i+1;
        sgENLoadSwitchDriveType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLoadSwitchDriveType.Row:=1;
end;

procedure TfrmENLoadSwitchDriveTypeShow.sgENLoadSwitchDriveTypeTopLeftChanged(Sender: TObject);
var
  TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENLoadSwitchDriveTypeList: ENLoadSwitchDriveTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLoadSwitchDriveType.TopRow + sgENLoadSwitchDriveType.VisibleRowCount) = ColCount
  then
    begin
      TempENLoadSwitchDriveType :=  HTTPRIOENLoadSwitchDriveType as ENLoadSwitchDriveTypeControllerSoapPort;
      CurrentRow:=sgENLoadSwitchDriveType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLoadSwitchDriveTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLoadSwitchDriveTypeList := TempENLoadSwitchDriveType.getScrollableFilteredList(ENLoadSwitchDriveTypeFilter(FilterObject),ColCount-1, 100);



  sgENLoadSwitchDriveType.RowCount:=sgENLoadSwitchDriveType.RowCount+100;
  LastCount:=High(ENLoadSwitchDriveTypeList.list);
  with sgENLoadSwitchDriveType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLoadSwitchDriveTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLoadSwitchDriveTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLoadSwitchDriveTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLoadSwitchDriveType.Row:=CurrentRow-5;
   sgENLoadSwitchDriveType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLoadSwitchDriveTypeShow.sgENLoadSwitchDriveTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLoadSwitchDriveType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLoadSwitchDriveTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLoadSwitchDriveType.RowCount-1 do
   for j:=0 to sgENLoadSwitchDriveType.ColCount-1 do
     sgENLoadSwitchDriveType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLoadSwitchDriveTypeShow.actViewExecute(Sender: TObject);
Var TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
begin
 TempENLoadSwitchDriveType := HTTPRIOENLoadSwitchDriveType as ENLoadSwitchDriveTypeControllerSoapPort;
   try
     ENLoadSwitchDriveTypeObj := TempENLoadSwitchDriveType.getObject(StrToInt(sgENLoadSwitchDriveType.Cells[0,sgENLoadSwitchDriveType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchDriveTypeEdit:=TfrmENLoadSwitchDriveTypeEdit.Create(Application, dsView);
  try
    frmENLoadSwitchDriveTypeEdit.ShowModal;
  finally
    frmENLoadSwitchDriveTypeEdit.Free;
    frmENLoadSwitchDriveTypeEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchDriveTypeShow.actEditExecute(Sender: TObject);
Var TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
begin
 TempENLoadSwitchDriveType := HTTPRIOENLoadSwitchDriveType as ENLoadSwitchDriveTypeControllerSoapPort;
   try
     ENLoadSwitchDriveTypeObj := TempENLoadSwitchDriveType.getObject(StrToInt(sgENLoadSwitchDriveType.Cells[0,sgENLoadSwitchDriveType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchDriveTypeEdit:=TfrmENLoadSwitchDriveTypeEdit.Create(Application, dsEdit);
  try
    if frmENLoadSwitchDriveTypeEdit.ShowModal= mrOk then
      begin
        //TempENLoadSwitchDriveType.save(ENLoadSwitchDriveTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLoadSwitchDriveTypeEdit.Free;
    frmENLoadSwitchDriveTypeEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchDriveTypeShow.actDeleteExecute(Sender: TObject);
Var TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLoadSwitchDriveType := HTTPRIOENLoadSwitchDriveType as ENLoadSwitchDriveTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLoadSwitchDriveType.Cells[0,sgENLoadSwitchDriveType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип привода выключателя нагрузки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLoadSwitchDriveType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLoadSwitchDriveTypeShow.actInsertExecute(Sender: TObject);
Var TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
begin
  TempENLoadSwitchDriveType := HTTPRIOENLoadSwitchDriveType as ENLoadSwitchDriveTypeControllerSoapPort;
  ENLoadSwitchDriveTypeObj:=ENLoadSwitchDriveType.Create;



  try
    frmENLoadSwitchDriveTypeEdit:=TfrmENLoadSwitchDriveTypeEdit.Create(Application, dsInsert);
    try
      if frmENLoadSwitchDriveTypeEdit.ShowModal = mrOk then
      begin
        if ENLoadSwitchDriveTypeObj<>nil then
            //TempENLoadSwitchDriveType.add(ENLoadSwitchDriveTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLoadSwitchDriveTypeEdit.Free;
      frmENLoadSwitchDriveTypeEdit:=nil;
    end;
  finally
    ENLoadSwitchDriveTypeObj.Free;
  end;
end;

procedure TfrmENLoadSwitchDriveTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLoadSwitchDriveTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENLoadSwitchDriveTypeFilterEdit:=TfrmENLoadSwitchDriveTypeFilterEdit.Create(Application, dsInsert);
  try
    ENLoadSwitchDriveTypeFilterObj := ENLoadSwitchDriveTypeFilter.Create;
    SetNullIntProps(ENLoadSwitchDriveTypeFilterObj);
    SetNullXSProps(ENLoadSwitchDriveTypeFilterObj);

    if frmENLoadSwitchDriveTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLoadSwitchDriveTypeFilter.Create;
      FilterObject := ENLoadSwitchDriveTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLoadSwitchDriveTypeFilterEdit.Free;
    frmENLoadSwitchDriveTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENLoadSwitchDriveTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.