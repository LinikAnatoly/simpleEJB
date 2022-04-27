
unit ShowENSubst150Battery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150BatteryController ;


type
  TfrmENSubst150BatteryShow = class(TChildForm)  
  HTTPRIOENSubst150Battery: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150Battery: TAdvStringGrid;
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
procedure sgENSubst150BatteryTopLeftChanged(Sender: TObject);
procedure sgENSubst150BatteryDblClick(Sender: TObject);
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
 // ENSubst150BatteryObj: ENSubst150Battery;
 // ENSubst150BatteryFilterObj: ENSubst150BatteryFilter;
  
  
implementation

uses Main, EditENSubst150Battery, EditENSubst150BatteryFilter;


{$R *.dfm}

var
  //frmENSubst150BatteryShow : TfrmENSubst150BatteryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150BatteryHeaders: array [1..7] of String =
        ( 'Код'
          ,'Диспетч. наименование'
          ,'Заводской номер'
          ,'Номинальное напряжение, В'
          ,'Номинальная ёмкость, Ач'
          ,'Примечание'
          ,'Пользователь, внесший изменения'
        );
   

procedure TfrmENSubst150BatteryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSubst150BatteryShow:=nil;
    inherited;
  end;


procedure TfrmENSubst150BatteryShow.FormShow(Sender: TObject);
var
  TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
  i: Integer;
  ENSubst150BatteryList: ENSubst150BatteryShortList;
  begin
  SetGridHeaders(ENSubst150BatteryHeaders, sgENSubst150Battery.ColumnHeaders);
  ColCount:=100;
  TempENSubst150Battery :=  HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150BatteryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150BatteryList := TempENSubst150Battery.getScrollableFilteredList(ENSubst150BatteryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSubst150BatteryList.list);

  if LastCount > -1 then
     sgENSubst150Battery.RowCount:=LastCount+2
  else
     sgENSubst150Battery.RowCount:=2;

   with sgENSubst150Battery do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150BatteryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubst150BatteryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubst150BatteryList.list[i].name;
        Cells[2,i+1] := ENSubst150BatteryList.list[i].factoryNumber;
        if ENSubst150BatteryList.list[i].voltage = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENSubst150BatteryList.list[i].voltage.DecimalString;
        if ENSubst150BatteryList.list[i].capacity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENSubst150BatteryList.list[i].capacity.DecimalString;
        Cells[5,i+1] := ENSubst150BatteryList.list[i].commentGen;
        Cells[6,i+1] := ENSubst150BatteryList.list[i].userGen;
        LastRow:=i+1;
        sgENSubst150Battery.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubst150Battery.Row:=1;
end;

procedure TfrmENSubst150BatteryShow.sgENSubst150BatteryTopLeftChanged(Sender: TObject);
var
  TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150BatteryList: ENSubst150BatteryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSubst150Battery.TopRow + sgENSubst150Battery.VisibleRowCount) = ColCount
  then
    begin
      TempENSubst150Battery :=  HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
      CurrentRow:=sgENSubst150Battery.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSubst150BatteryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubst150BatteryList := TempENSubst150Battery.getScrollableFilteredList(ENSubst150BatteryFilter(FilterObject),ColCount-1, 100);



  sgENSubst150Battery.RowCount:=sgENSubst150Battery.RowCount+100;
  LastCount:=High(ENSubst150BatteryList.list);
  with sgENSubst150Battery do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150BatteryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSubst150BatteryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSubst150BatteryList.list[i].name;
        Cells[2,i+CurrentRow] := ENSubst150BatteryList.list[i].factoryNumber;
        if ENSubst150BatteryList.list[i].voltage = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENSubst150BatteryList.list[i].voltage.DecimalString;
        if ENSubst150BatteryList.list[i].capacity = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENSubst150BatteryList.list[i].capacity.DecimalString;
        Cells[5,i+CurrentRow] := ENSubst150BatteryList.list[i].commentGen;
        Cells[6,i+CurrentRow] := ENSubst150BatteryList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubst150Battery.Row:=CurrentRow-5;
   sgENSubst150Battery.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSubst150BatteryShow.sgENSubst150BatteryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubst150Battery,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSubst150BatteryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150Battery.RowCount-1 do
   for j:=0 to sgENSubst150Battery.ColCount-1 do
     sgENSubst150Battery.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150BatteryShow.actViewExecute(Sender: TObject);
Var TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
begin
 TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
   try
     ENSubst150BatteryObj := TempENSubst150Battery.getObject(StrToInt(sgENSubst150Battery.Cells[0,sgENSubst150Battery.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150BatteryEdit:=TfrmENSubst150BatteryEdit.Create(Application, dsView);
  try
    frmENSubst150BatteryEdit.ShowModal;
  finally
    frmENSubst150BatteryEdit.Free;
    frmENSubst150BatteryEdit:=nil;
  end;
end;

procedure TfrmENSubst150BatteryShow.actEditExecute(Sender: TObject);
Var TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
begin
 TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
   try
     ENSubst150BatteryObj := TempENSubst150Battery.getObject(StrToInt(sgENSubst150Battery.Cells[0,sgENSubst150Battery.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150BatteryEdit:=TfrmENSubst150BatteryEdit.Create(Application, dsEdit);
  try
    if frmENSubst150BatteryEdit.ShowModal= mrOk then
      begin
        //TempENSubst150Battery.save(ENSubst150BatteryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150BatteryEdit.Free;
    frmENSubst150BatteryEdit:=nil;
  end;
end;

procedure TfrmENSubst150BatteryShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150Battery: ENSubst150BatteryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150Battery.Cells[0,sgENSubst150Battery.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Аккумуляторная батарея) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150Battery.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150BatteryShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150Battery: ENSubst150BatteryControllerSoapPort; 
begin
  // TempENSubst150Battery := HTTPRIOENSubst150Battery as ENSubst150BatteryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150BatteryObj:=ENSubst150Battery.Create;

   //ENSubst150BatteryObj.voltage:= TXSDecimal.Create;
   //ENSubst150BatteryObj.capacity:= TXSDecimal.Create;
   //ENSubst150BatteryObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150BatteryEdit:=TfrmENSubst150BatteryEdit.Create(Application, dsInsert);
    try
      if frmENSubst150BatteryEdit.ShowModal = mrOk then
      begin
        if ENSubst150BatteryObj<>nil then
            //TempENSubst150Battery.add(ENSubst150BatteryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150BatteryEdit.Free;
      frmENSubst150BatteryEdit:=nil;
    end;
  finally
    ENSubst150BatteryObj.Free;
  end;
end;

procedure TfrmENSubst150BatteryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150BatteryShow.actFilterExecute(Sender: TObject);
begin
{frmENSubst150BatteryFilterEdit:=TfrmENSubst150BatteryFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150BatteryFilterObj := ENSubst150BatteryFilter.Create;
    SetNullIntProps(ENSubst150BatteryFilterObj);
    SetNullXSProps(ENSubst150BatteryFilterObj);

    if frmENSubst150BatteryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150BatteryFilter.Create;
      FilterObject := ENSubst150BatteryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150BatteryFilterEdit.Free;
    frmENSubst150BatteryFilterEdit:=nil;
  end;}
end;

procedure TfrmENSubst150BatteryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.