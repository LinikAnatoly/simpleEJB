
unit ShowENMetrologyDevice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMetrologyDeviceController ;


type
  TfrmENMetrologyDeviceShow = class(TChildForm)  
  HTTPRIOENMetrologyDevice: THTTPRIO;
    ImageList1: TImageList;
    sgENMetrologyDevice: TAdvStringGrid;
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
procedure sgENMetrologyDeviceTopLeftChanged(Sender: TObject);
procedure sgENMetrologyDeviceDblClick(Sender: TObject);
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
 // ENMetrologyDeviceObj: ENMetrologyDevice;
 // ENMetrologyDeviceFilterObj: ENMetrologyDeviceFilter;
  
  
implementation

uses Main, EditENMetrologyDevice, EditENMetrologyDeviceFilter;


{$R *.dfm}

var
  //frmENMetrologyDeviceShow : TfrmENMetrologyDeviceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMetrologyDeviceHeaders: array [1..5] of String =
        ( 'Код'
          ,'Найменування об''єкту'
          ,'Заводський/серійний номер'
          ,'Інвентарний/номенклатурний номер об''єкту'
          ,'Бухгалтерське найменування об''єкту'
        );
   

procedure TfrmENMetrologyDeviceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMetrologyDeviceShow:=nil;
    inherited;
  end;


procedure TfrmENMetrologyDeviceShow.FormShow(Sender: TObject);
var
  TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
  i: Integer;
  ENMetrologyDeviceList: ENMetrologyDeviceShortList;
  begin
  SetGridHeaders(ENMetrologyDeviceHeaders, sgENMetrologyDevice.ColumnHeaders);
  ColCount:=100;
  TempENMetrologyDevice :=  HTTPRIOENMetrologyDevice as ENMetrologyDeviceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyDeviceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMetrologyDeviceList := TempENMetrologyDevice.getScrollableFilteredList(ENMetrologyDeviceFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMetrologyDeviceList.list);

  if LastCount > -1 then
     sgENMetrologyDevice.RowCount:=LastCount+2
  else
     sgENMetrologyDevice.RowCount:=2;

   with sgENMetrologyDevice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyDeviceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMetrologyDeviceList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMetrologyDeviceList.list[i].name;
        Cells[2,i+1] := ENMetrologyDeviceList.list[i].buildNumber;
        Cells[3,i+1] := ENMetrologyDeviceList.list[i].invNumber;
        Cells[4,i+1] := ENMetrologyDeviceList.list[i].buhName;
        LastRow:=i+1;
        sgENMetrologyDevice.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMetrologyDevice.Row:=1;
end;

procedure TfrmENMetrologyDeviceShow.sgENMetrologyDeviceTopLeftChanged(Sender: TObject);
var
  TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
  i,CurrentRow: Integer;
  ENMetrologyDeviceList: ENMetrologyDeviceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMetrologyDevice.TopRow + sgENMetrologyDevice.VisibleRowCount) = ColCount
  then
    begin
      TempENMetrologyDevice :=  HTTPRIOENMetrologyDevice as ENMetrologyDeviceControllerSoapPort;
      CurrentRow:=sgENMetrologyDevice.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyDeviceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMetrologyDeviceList := TempENMetrologyDevice.getScrollableFilteredList(ENMetrologyDeviceFilter(FilterObject),ColCount-1, 100);



  sgENMetrologyDevice.RowCount:=sgENMetrologyDevice.RowCount+100;
  LastCount:=High(ENMetrologyDeviceList.list);
  with sgENMetrologyDevice do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyDeviceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMetrologyDeviceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMetrologyDeviceList.list[i].name;
        Cells[2,i+CurrentRow] := ENMetrologyDeviceList.list[i].buildNumber;
        Cells[3,i+CurrentRow] := ENMetrologyDeviceList.list[i].invNumber;
        Cells[4,i+CurrentRow] := ENMetrologyDeviceList.list[i].buhName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMetrologyDevice.Row:=CurrentRow-5;
   sgENMetrologyDevice.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMetrologyDeviceShow.sgENMetrologyDeviceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMetrologyDevice,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMetrologyDeviceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMetrologyDevice.RowCount-1 do
   for j:=0 to sgENMetrologyDevice.ColCount-1 do
     sgENMetrologyDevice.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMetrologyDeviceShow.actViewExecute(Sender: TObject);
Var TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
begin
 TempENMetrologyDevice := HTTPRIOENMetrologyDevice as ENMetrologyDeviceControllerSoapPort;
   try
     ENMetrologyDeviceObj := TempENMetrologyDevice.getObject(StrToInt(sgENMetrologyDevice.Cells[0,sgENMetrologyDevice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyDeviceEdit:=TfrmENMetrologyDeviceEdit.Create(Application, dsView);
  try
    frmENMetrologyDeviceEdit.ShowModal;
  finally
    frmENMetrologyDeviceEdit.Free;
    frmENMetrologyDeviceEdit:=nil;
  end;
end;

procedure TfrmENMetrologyDeviceShow.actEditExecute(Sender: TObject);
Var TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
begin
 TempENMetrologyDevice := HTTPRIOENMetrologyDevice as ENMetrologyDeviceControllerSoapPort;
   try
     ENMetrologyDeviceObj := TempENMetrologyDevice.getObject(StrToInt(sgENMetrologyDevice.Cells[0,sgENMetrologyDevice.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyDeviceEdit:=TfrmENMetrologyDeviceEdit.Create(Application, dsEdit);
  try
    if frmENMetrologyDeviceEdit.ShowModal= mrOk then
      begin
        //TempENMetrologyDevice.save(ENMetrologyDeviceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMetrologyDeviceEdit.Free;
    frmENMetrologyDeviceEdit:=nil;
  end;
end;

procedure TfrmENMetrologyDeviceShow.actDeleteExecute(Sender: TObject);
Var TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMetrologyDevice := HTTPRIOENMetrologyDevice as ENMetrologyDeviceControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMetrologyDevice.Cells[0,sgENMetrologyDevice.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Прилади вимірювання та інші обьекти Метрології) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMetrologyDevice.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMetrologyDeviceShow.actInsertExecute(Sender: TObject);
Var TempENMetrologyDevice: ENMetrologyDeviceControllerSoapPort;
begin
  TempENMetrologyDevice := HTTPRIOENMetrologyDevice as ENMetrologyDeviceControllerSoapPort;
  ENMetrologyDeviceObj:=ENMetrologyDevice.Create;



  try
    frmENMetrologyDeviceEdit:=TfrmENMetrologyDeviceEdit.Create(Application, dsInsert);
    try
      if frmENMetrologyDeviceEdit.ShowModal = mrOk then
      begin
        if ENMetrologyDeviceObj<>nil then
            //TempENMetrologyDevice.add(ENMetrologyDeviceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMetrologyDeviceEdit.Free;
      frmENMetrologyDeviceEdit:=nil;
    end;
  finally
    ENMetrologyDeviceObj.Free;
  end;
end;

procedure TfrmENMetrologyDeviceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMetrologyDeviceShow.actFilterExecute(Sender: TObject);
begin
{frmENMetrologyDeviceFilterEdit:=TfrmENMetrologyDeviceFilterEdit.Create(Application, dsEdit);
  try
    ENMetrologyDeviceFilterObj := ENMetrologyDeviceFilter.Create;
    SetNullIntProps(ENMetrologyDeviceFilterObj);
    SetNullXSProps(ENMetrologyDeviceFilterObj);

    if frmENMetrologyDeviceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMetrologyDeviceFilter.Create;
      FilterObject := ENMetrologyDeviceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMetrologyDeviceFilterEdit.Free;
    frmENMetrologyDeviceFilterEdit:=nil;
  end;}
end;

procedure TfrmENMetrologyDeviceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.