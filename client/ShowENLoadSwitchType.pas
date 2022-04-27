
unit ShowENLoadSwitchType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLoadSwitchTypeController, AdvObj ;


type
  TfrmENLoadSwitchTypeShow = class(TChildForm)  
  HTTPRIOENLoadSwitchType: THTTPRIO;
    ImageList1: TImageList;
    sgENLoadSwitchType: TAdvStringGrid;
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
procedure sgENLoadSwitchTypeTopLeftChanged(Sender: TObject);
procedure sgENLoadSwitchTypeDblClick(Sender: TObject);
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
 frmENLoadSwitchTypeShow : TfrmENLoadSwitchTypeShow;
 // ENLoadSwitchTypeObj: ENLoadSwitchType;
 // ENLoadSwitchTypeFilterObj: ENLoadSwitchTypeFilter;
  
  
implementation

uses Main, EditENLoadSwitchType, EditENLoadSwitchTypeFilter;


{$R *.dfm}

var
  //frmENLoadSwitchTypeShow : TfrmENLoadSwitchTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLoadSwitchTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип выключателя нагрузки'
        );
   

procedure TfrmENLoadSwitchTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLoadSwitchTypeShow:=nil;
    inherited;
  end;


procedure TfrmENLoadSwitchTypeShow.FormShow(Sender: TObject);
var
  TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
  i: Integer;
  ENLoadSwitchTypeList: ENLoadSwitchTypeShortList;
  begin
  SetGridHeaders(ENLoadSwitchTypeHeaders, sgENLoadSwitchType.ColumnHeaders);
  ColCount:=100;
  TempENLoadSwitchType :=  HTTPRIOENLoadSwitchType as ENLoadSwitchTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLoadSwitchTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLoadSwitchTypeList := TempENLoadSwitchType.getScrollableFilteredList(ENLoadSwitchTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLoadSwitchTypeList.list);

  if LastCount > -1 then
     sgENLoadSwitchType.RowCount:=LastCount+2
  else
     sgENLoadSwitchType.RowCount:=2;

   with sgENLoadSwitchType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLoadSwitchTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLoadSwitchTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLoadSwitchTypeList.list[i].name;
        LastRow:=i+1;
        sgENLoadSwitchType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLoadSwitchType.Row:=1;
end;

procedure TfrmENLoadSwitchTypeShow.sgENLoadSwitchTypeTopLeftChanged(Sender: TObject);
var
  TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENLoadSwitchTypeList: ENLoadSwitchTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLoadSwitchType.TopRow + sgENLoadSwitchType.VisibleRowCount) = ColCount
  then
    begin
      TempENLoadSwitchType :=  HTTPRIOENLoadSwitchType as ENLoadSwitchTypeControllerSoapPort;
      CurrentRow:=sgENLoadSwitchType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLoadSwitchTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLoadSwitchTypeList := TempENLoadSwitchType.getScrollableFilteredList(ENLoadSwitchTypeFilter(FilterObject),ColCount-1, 100);



  sgENLoadSwitchType.RowCount:=sgENLoadSwitchType.RowCount+100;
  LastCount:=High(ENLoadSwitchTypeList.list);
  with sgENLoadSwitchType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLoadSwitchTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLoadSwitchTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLoadSwitchTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLoadSwitchType.Row:=CurrentRow-5;
   sgENLoadSwitchType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLoadSwitchTypeShow.sgENLoadSwitchTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLoadSwitchType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLoadSwitchTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLoadSwitchType.RowCount-1 do
   for j:=0 to sgENLoadSwitchType.ColCount-1 do
     sgENLoadSwitchType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLoadSwitchTypeShow.actViewExecute(Sender: TObject);
Var TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
begin
 TempENLoadSwitchType := HTTPRIOENLoadSwitchType as ENLoadSwitchTypeControllerSoapPort;
   try
     ENLoadSwitchTypeObj := TempENLoadSwitchType.getObject(StrToInt(sgENLoadSwitchType.Cells[0,sgENLoadSwitchType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchTypeEdit:=TfrmENLoadSwitchTypeEdit.Create(Application, dsView);
  try
    frmENLoadSwitchTypeEdit.ShowModal;
  finally
    frmENLoadSwitchTypeEdit.Free;
    frmENLoadSwitchTypeEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchTypeShow.actEditExecute(Sender: TObject);
Var TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
begin
 TempENLoadSwitchType := HTTPRIOENLoadSwitchType as ENLoadSwitchTypeControllerSoapPort;
   try
     ENLoadSwitchTypeObj := TempENLoadSwitchType.getObject(StrToInt(sgENLoadSwitchType.Cells[0,sgENLoadSwitchType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchTypeEdit:=TfrmENLoadSwitchTypeEdit.Create(Application, dsEdit);
  try
    if frmENLoadSwitchTypeEdit.ShowModal= mrOk then
      begin
        //TempENLoadSwitchType.save(ENLoadSwitchTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLoadSwitchTypeEdit.Free;
    frmENLoadSwitchTypeEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchTypeShow.actDeleteExecute(Sender: TObject);
Var TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLoadSwitchType := HTTPRIOENLoadSwitchType as ENLoadSwitchTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLoadSwitchType.Cells[0,sgENLoadSwitchType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип выключателя нагрузки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLoadSwitchType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLoadSwitchTypeShow.actInsertExecute(Sender: TObject);
Var TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
begin
  TempENLoadSwitchType := HTTPRIOENLoadSwitchType as ENLoadSwitchTypeControllerSoapPort;
  ENLoadSwitchTypeObj:=ENLoadSwitchType.Create;



  try
    frmENLoadSwitchTypeEdit:=TfrmENLoadSwitchTypeEdit.Create(Application, dsInsert);
    try
      if frmENLoadSwitchTypeEdit.ShowModal = mrOk then
      begin
        if ENLoadSwitchTypeObj<>nil then
            //TempENLoadSwitchType.add(ENLoadSwitchTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLoadSwitchTypeEdit.Free;
      frmENLoadSwitchTypeEdit:=nil;
    end;
  finally
    ENLoadSwitchTypeObj.Free;
  end;
end;

procedure TfrmENLoadSwitchTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLoadSwitchTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENLoadSwitchTypeFilterEdit:=TfrmENLoadSwitchTypeFilterEdit.Create(Application, dsInsert);
  try
    ENLoadSwitchTypeFilterObj := ENLoadSwitchTypeFilter.Create;
    SetNullIntProps(ENLoadSwitchTypeFilterObj);
    SetNullXSProps(ENLoadSwitchTypeFilterObj);

    if frmENLoadSwitchTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLoadSwitchTypeFilter.Create;
      FilterObject := ENLoadSwitchTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLoadSwitchTypeFilterEdit.Free;
    frmENLoadSwitchTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENLoadSwitchTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.