
unit ShowENMeasurDeviceType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMeasurDeviceTypeController, AdvObj ;


type
  TfrmENMeasurDeviceTypeShow = class(TChildForm)  
  HTTPRIOENMeasurDeviceType: THTTPRIO;
    ImageList1: TImageList;
    sgENMeasurDeviceType: TAdvStringGrid;
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
procedure sgENMeasurDeviceTypeTopLeftChanged(Sender: TObject);
procedure sgENMeasurDeviceTypeDblClick(Sender: TObject);
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
 frmENMeasurDeviceTypeShow : TfrmENMeasurDeviceTypeShow;
 // ENMeasurDeviceTypeObj: ENMeasurDeviceType;
 // ENMeasurDeviceTypeFilterObj: ENMeasurDeviceTypeFilter;
  
  
implementation

uses Main, EditENMeasurDeviceType, EditENMeasurDeviceTypeFilter;


{$R *.dfm}

var
  //frmENMeasurDeviceTypeShow : TfrmENMeasurDeviceTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMeasurDeviceTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип измерительного устройства'
        );
   

procedure TfrmENMeasurDeviceTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMeasurDeviceTypeShow:=nil;
    inherited;
  end;


procedure TfrmENMeasurDeviceTypeShow.FormShow(Sender: TObject);
var
  TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
  i: Integer;
  ENMeasurDeviceTypeList: ENMeasurDeviceTypeShortList;
  begin
  SetGridHeaders(ENMeasurDeviceTypeHeaders, sgENMeasurDeviceType.ColumnHeaders);
  ColCount:=100;
  TempENMeasurDeviceType :=  HTTPRIOENMeasurDeviceType as ENMeasurDeviceTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMeasurDeviceTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMeasurDeviceTypeList := TempENMeasurDeviceType.getScrollableFilteredList(ENMeasurDeviceTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMeasurDeviceTypeList.list);

  if LastCount > -1 then
     sgENMeasurDeviceType.RowCount:=LastCount+2
  else
     sgENMeasurDeviceType.RowCount:=2;

   with sgENMeasurDeviceType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMeasurDeviceTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMeasurDeviceTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMeasurDeviceTypeList.list[i].name;
        LastRow:=i+1;
        sgENMeasurDeviceType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMeasurDeviceType.Row:=1;
end;

procedure TfrmENMeasurDeviceTypeShow.sgENMeasurDeviceTypeTopLeftChanged(Sender: TObject);
var
  TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENMeasurDeviceTypeList: ENMeasurDeviceTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMeasurDeviceType.TopRow + sgENMeasurDeviceType.VisibleRowCount) = ColCount
  then
    begin
      TempENMeasurDeviceType :=  HTTPRIOENMeasurDeviceType as ENMeasurDeviceTypeControllerSoapPort;
      CurrentRow:=sgENMeasurDeviceType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMeasurDeviceTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMeasurDeviceTypeList := TempENMeasurDeviceType.getScrollableFilteredList(ENMeasurDeviceTypeFilter(FilterObject),ColCount-1, 100);



  sgENMeasurDeviceType.RowCount:=sgENMeasurDeviceType.RowCount+100;
  LastCount:=High(ENMeasurDeviceTypeList.list);
  with sgENMeasurDeviceType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMeasurDeviceTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMeasurDeviceTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMeasurDeviceTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMeasurDeviceType.Row:=CurrentRow-5;
   sgENMeasurDeviceType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMeasurDeviceTypeShow.sgENMeasurDeviceTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMeasurDeviceType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMeasurDeviceTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMeasurDeviceType.RowCount-1 do
   for j:=0 to sgENMeasurDeviceType.ColCount-1 do
     sgENMeasurDeviceType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMeasurDeviceTypeShow.actViewExecute(Sender: TObject);
Var TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
begin
 TempENMeasurDeviceType := HTTPRIOENMeasurDeviceType as ENMeasurDeviceTypeControllerSoapPort;
   try
     ENMeasurDeviceTypeObj := TempENMeasurDeviceType.getObject(StrToInt(sgENMeasurDeviceType.Cells[0,sgENMeasurDeviceType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMeasurDeviceTypeEdit:=TfrmENMeasurDeviceTypeEdit.Create(Application, dsView);
  try
    frmENMeasurDeviceTypeEdit.ShowModal;
  finally
    frmENMeasurDeviceTypeEdit.Free;
    frmENMeasurDeviceTypeEdit:=nil;
  end;
end;

procedure TfrmENMeasurDeviceTypeShow.actEditExecute(Sender: TObject);
Var TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
begin
 TempENMeasurDeviceType := HTTPRIOENMeasurDeviceType as ENMeasurDeviceTypeControllerSoapPort;
   try
     ENMeasurDeviceTypeObj := TempENMeasurDeviceType.getObject(StrToInt(sgENMeasurDeviceType.Cells[0,sgENMeasurDeviceType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMeasurDeviceTypeEdit:=TfrmENMeasurDeviceTypeEdit.Create(Application, dsEdit);
  try
    if frmENMeasurDeviceTypeEdit.ShowModal= mrOk then
      begin
        //TempENMeasurDeviceType.save(ENMeasurDeviceTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMeasurDeviceTypeEdit.Free;
    frmENMeasurDeviceTypeEdit:=nil;
  end;
end;

procedure TfrmENMeasurDeviceTypeShow.actDeleteExecute(Sender: TObject);
Var TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMeasurDeviceType := HTTPRIOENMeasurDeviceType as ENMeasurDeviceTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMeasurDeviceType.Cells[0,sgENMeasurDeviceType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типы измерительных устройств) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMeasurDeviceType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMeasurDeviceTypeShow.actInsertExecute(Sender: TObject);
Var TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
begin
  TempENMeasurDeviceType := HTTPRIOENMeasurDeviceType as ENMeasurDeviceTypeControllerSoapPort;
  ENMeasurDeviceTypeObj:=ENMeasurDeviceType.Create;



  try
    frmENMeasurDeviceTypeEdit:=TfrmENMeasurDeviceTypeEdit.Create(Application, dsInsert);
    try
      if frmENMeasurDeviceTypeEdit.ShowModal = mrOk then
      begin
        if ENMeasurDeviceTypeObj<>nil then
            //TempENMeasurDeviceType.add(ENMeasurDeviceTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMeasurDeviceTypeEdit.Free;
      frmENMeasurDeviceTypeEdit:=nil;
    end;
  finally
    ENMeasurDeviceTypeObj.Free;
  end;
end;

procedure TfrmENMeasurDeviceTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMeasurDeviceTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENMeasurDeviceTypeFilterEdit:=TfrmENMeasurDeviceTypeFilterEdit.Create(Application, dsInsert);
  try
    ENMeasurDeviceTypeFilterObj := ENMeasurDeviceTypeFilter.Create;
    SetNullIntProps(ENMeasurDeviceTypeFilterObj);
    SetNullXSProps(ENMeasurDeviceTypeFilterObj);

    if frmENMeasurDeviceTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMeasurDeviceTypeFilter.Create;
      FilterObject := ENMeasurDeviceTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMeasurDeviceTypeFilterEdit.Free;
    frmENMeasurDeviceTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENMeasurDeviceTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.