
unit ShowENMeasurDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMeasurDeviceController, AdvObj ;


type
  TfrmENMeasurDeviceShow = class(TChildForm)  
  HTTPRIOENMeasurDevice: THTTPRIO;
    ImageList1: TImageList;
    sgENMeasurDevice: TAdvStringGrid;
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
procedure sgENMeasurDeviceTopLeftChanged(Sender: TObject);
procedure sgENMeasurDeviceDblClick(Sender: TObject);
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
 frmENMeasurDeviceShow : TfrmENMeasurDeviceShow;
 // ENMeasurDeviceObj: ENMeasurDevice;
 // ENMeasurDeviceFilterObj: ENMeasurDeviceFilter;
  
  
implementation

uses Main, EditENMeasurDevice, EditENMeasurDeviceFilter;


{$R *.dfm}

var
  //frmENMeasurDeviceShow : TfrmENMeasurDeviceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMeasurDeviceHeaders: array [1..6] of String =
        ('Код'
         ,'Измерительный прибор'
         ,'Диспетчерское назание'
         ,'Заводской номер'
         ,'Тип прибора'
         ,'Шкала');


procedure TfrmENMeasurDeviceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMeasurDeviceShow:=nil;
    inherited;
  end;


procedure TfrmENMeasurDeviceShow.FormShow(Sender: TObject);
var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  i: Integer;
  ENMeasurDeviceList: ENMeasurDeviceShortList;
begin
  SetGridHeaders(ENMeasurDeviceHeaders, sgENMeasurDevice.ColumnHeaders);
  ColCount := 100;
  TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMeasurDeviceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMeasurDeviceList := TempENMeasurDevice.getScrollableFilteredList(
    ENMeasurDeviceFilter(FilterObject), 0, ColCount);


  LastCount := High(ENMeasurDeviceList.list);

  if LastCount > -1 then
     sgENMeasurDevice.RowCount := LastCount+2
  else
     sgENMeasurDevice.RowCount := 2;

  with sgENMeasurDevice do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMeasurDeviceList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENMeasurDeviceList.list[i].code)
        else //Код Измерительного прибора
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENMeasurDeviceList.list[i].materialRefName; //Измерительный прибор из Нормативных материалов
        Cells[2, i + 1] := ENMeasurDeviceList.list[i].name; //Диспетчерское наименование
        Cells[3, i + 1] := ENMeasurDeviceList.list[i].workNumber; //Заводской номер
        Cells[4, i + 1] := ENMeasurDeviceList.list[i].measurDeviceTypeName; //Тип измерительного прибора
        Cells[5, i + 1] := ENMeasurDeviceList.list[i].scaleName; //Шкала
        LastRow := i + 1;
        sgENMeasurDevice.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENMeasurDevice.Row := 1;
end;

procedure TfrmENMeasurDeviceShow.sgENMeasurDeviceTopLeftChanged(Sender: TObject);
var
  TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  i,CurrentRow: Integer;
  ENMeasurDeviceList: ENMeasurDeviceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMeasurDevice.TopRow + sgENMeasurDevice.VisibleRowCount) = ColCount
  then
    begin
      TempENMeasurDevice :=  HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
      CurrentRow:=sgENMeasurDevice.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMeasurDeviceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMeasurDeviceList := TempENMeasurDevice.getScrollableFilteredList(ENMeasurDeviceFilter(FilterObject),ColCount-1, 100);



  sgENMeasurDevice.RowCount:=sgENMeasurDevice.RowCount+100;
  LastCount:=High(ENMeasurDeviceList.list);
  with sgENMeasurDevice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMeasurDeviceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMeasurDeviceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMeasurDeviceList.list[i].name;
        Cells[2,i+CurrentRow] := ENMeasurDeviceList.list[i].workNumber;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMeasurDevice.Row:=CurrentRow-5;
   sgENMeasurDevice.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMeasurDeviceShow.sgENMeasurDeviceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMeasurDevice,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMeasurDeviceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMeasurDevice.RowCount-1 do
   for j:=0 to sgENMeasurDevice.ColCount-1 do
     sgENMeasurDevice.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMeasurDeviceShow.actViewExecute(Sender: TObject);
Var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
 TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
   try
     ENMeasurDeviceObj := TempENMeasurDevice.getObject(StrToInt(sgENMeasurDevice.Cells[0,sgENMeasurDevice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMeasurDeviceEdit:=TfrmENMeasurDeviceEdit.Create(Application, dsView);
  try
    frmENMeasurDeviceEdit.ShowModal;
  finally
    frmENMeasurDeviceEdit.Free;
    frmENMeasurDeviceEdit:=nil;
  end;
end;

procedure TfrmENMeasurDeviceShow.actEditExecute(Sender: TObject);
Var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
 TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
   try
     ENMeasurDeviceObj := TempENMeasurDevice.getObject(StrToInt(sgENMeasurDevice.Cells[0,sgENMeasurDevice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMeasurDeviceEdit:=TfrmENMeasurDeviceEdit.Create(Application, dsEdit);
  try
    if frmENMeasurDeviceEdit.ShowModal= mrOk then
      begin
        //TempENMeasurDevice.save(ENMeasurDeviceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMeasurDeviceEdit.Free;
    frmENMeasurDeviceEdit:=nil;
  end;
end;

procedure TfrmENMeasurDeviceShow.actDeleteExecute(Sender: TObject);
Var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMeasurDevice.Cells[0,sgENMeasurDevice.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Измерительные приборы) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMeasurDevice.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMeasurDeviceShow.actInsertExecute(Sender: TObject);
Var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
begin
  TempENMeasurDevice := HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
  ENMeasurDeviceObj:=ENMeasurDevice.Create;



  try
    frmENMeasurDeviceEdit:=TfrmENMeasurDeviceEdit.Create(Application, dsInsert);
    try
      if frmENMeasurDeviceEdit.ShowModal = mrOk then
      begin
        if ENMeasurDeviceObj<>nil then
            //TempENMeasurDevice.add(ENMeasurDeviceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMeasurDeviceEdit.Free;
      frmENMeasurDeviceEdit:=nil;
    end;
  finally
    ENMeasurDeviceObj.Free;
  end;
end;

procedure TfrmENMeasurDeviceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMeasurDeviceShow.actFilterExecute(Sender: TObject);
begin
{frmENMeasurDeviceFilterEdit:=TfrmENMeasurDeviceFilterEdit.Create(Application, dsInsert);
  try
    ENMeasurDeviceFilterObj := ENMeasurDeviceFilter.Create;
    SetNullIntProps(ENMeasurDeviceFilterObj);
    SetNullXSProps(ENMeasurDeviceFilterObj);

    if frmENMeasurDeviceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMeasurDeviceFilter.Create;
      FilterObject := ENMeasurDeviceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMeasurDeviceFilterEdit.Free;
    frmENMeasurDeviceFilterEdit:=nil;
  end;}
end;

procedure TfrmENMeasurDeviceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.