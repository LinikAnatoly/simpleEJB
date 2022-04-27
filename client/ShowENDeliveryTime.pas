
unit ShowENDeliveryTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDeliveryTimeController ;


type
  TfrmENDeliveryTimeShow = class(TChildForm)  
  HTTPRIOENDeliveryTime: THTTPRIO;
    ImageList1: TImageList;
    sgENDeliveryTime: TAdvStringGrid;
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
procedure sgENDeliveryTimeTopLeftChanged(Sender: TObject);
procedure sgENDeliveryTimeDblClick(Sender: TObject);
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
 // ENDeliveryTimeObj: ENDeliveryTime;
 // ENDeliveryTimeFilterObj: ENDeliveryTimeFilter;
  
  
implementation

uses Main, EditENDeliveryTime, EditENDeliveryTimeFilter;


{$R *.dfm}

var
  //frmENDeliveryTimeShow : TfrmENDeliveryTimeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDeliveryTimeHeaders: array [1..4] of String =
        ( 'Код'
          ,'Час на доставку нормативний (год)'
          ,'Час на доставку фактичний(год)'
          ,'Транспорт'
        );
   

procedure TfrmENDeliveryTimeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDeliveryTimeShow:=nil;
    inherited;
  end;


procedure TfrmENDeliveryTimeShow.FormShow(Sender: TObject);
var
  TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
  i: Integer;
  ENDeliveryTimeList: ENDeliveryTimeShortList;
  begin
  SetGridHeaders(ENDeliveryTimeHeaders, sgENDeliveryTime.ColumnHeaders);
  ColCount:=100;
  TempENDeliveryTime :=  HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryTimeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryTimeList := TempENDeliveryTime.getScrollableFilteredList(ENDeliveryTimeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDeliveryTimeList.list);

  if LastCount > -1 then
     sgENDeliveryTime.RowCount:=LastCount+2
  else
     sgENDeliveryTime.RowCount:=2;

   with sgENDeliveryTime do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryTimeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDeliveryTimeList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENDeliveryTimeList.list[i].deliveryTimePlan = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENDeliveryTimeList.list[i].deliveryTimePlan.DecimalString;
        if ENDeliveryTimeList.list[i].deliveryTimeFact = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENDeliveryTimeList.list[i].deliveryTimeFact.DecimalString;
        LastRow:=i+1;
        sgENDeliveryTime.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDeliveryTime.Row:=1;
end;

procedure TfrmENDeliveryTimeShow.sgENDeliveryTimeTopLeftChanged(Sender: TObject);
var
  TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDeliveryTimeList: ENDeliveryTimeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDeliveryTime.TopRow + sgENDeliveryTime.VisibleRowCount) = ColCount
  then
    begin
      TempENDeliveryTime :=  HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;
      CurrentRow:=sgENDeliveryTime.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryTimeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryTimeList := TempENDeliveryTime.getScrollableFilteredList(ENDeliveryTimeFilter(FilterObject),ColCount-1, 100);



  sgENDeliveryTime.RowCount:=sgENDeliveryTime.RowCount+100;
  LastCount:=High(ENDeliveryTimeList.list);
  with sgENDeliveryTime do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryTimeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDeliveryTimeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENDeliveryTimeList.list[i].deliveryTimePlan = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENDeliveryTimeList.list[i].deliveryTimePlan.DecimalString;
        if ENDeliveryTimeList.list[i].deliveryTimeFact = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENDeliveryTimeList.list[i].deliveryTimeFact.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDeliveryTime.Row:=CurrentRow-5;
   sgENDeliveryTime.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDeliveryTimeShow.sgENDeliveryTimeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDeliveryTime,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDeliveryTimeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDeliveryTime.RowCount-1 do
   for j:=0 to sgENDeliveryTime.ColCount-1 do
     sgENDeliveryTime.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDeliveryTimeShow.actViewExecute(Sender: TObject);
Var TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
 TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;
   try
     ENDeliveryTimeObj := TempENDeliveryTime.getObject(StrToInt(sgENDeliveryTime.Cells[0,sgENDeliveryTime.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryTimeEdit:=TfrmENDeliveryTimeEdit.Create(Application, dsView);
  try
    frmENDeliveryTimeEdit.ShowModal;
  finally
    frmENDeliveryTimeEdit.Free;
    frmENDeliveryTimeEdit:=nil;
  end;
end;

procedure TfrmENDeliveryTimeShow.actEditExecute(Sender: TObject);
Var TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
 TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;
   try
     ENDeliveryTimeObj := TempENDeliveryTime.getObject(StrToInt(sgENDeliveryTime.Cells[0,sgENDeliveryTime.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryTimeEdit:=TfrmENDeliveryTimeEdit.Create(Application, dsEdit);
  try
    if frmENDeliveryTimeEdit.ShowModal= mrOk then
      begin
        //TempENDeliveryTime.save(ENDeliveryTimeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDeliveryTimeEdit.Free;
    frmENDeliveryTimeEdit:=nil;
  end;
end;

procedure TfrmENDeliveryTimeShow.actDeleteExecute(Sender: TObject);
Var TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDeliveryTime.Cells[0,sgENDeliveryTime.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Час на доставку персонала на объект) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDeliveryTime.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDeliveryTimeShow.actInsertExecute(Sender: TObject);
Var TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
  TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;
  ENDeliveryTimeObj:=ENDeliveryTime.Create;

   ENDeliveryTimeObj.deliveryTimePlan:= TXSDecimal.Create;
   ENDeliveryTimeObj.deliveryTimeFact:= TXSDecimal.Create;


  try
    frmENDeliveryTimeEdit:=TfrmENDeliveryTimeEdit.Create(Application, dsInsert);
    try
      if frmENDeliveryTimeEdit.ShowModal = mrOk then
      begin
        if ENDeliveryTimeObj<>nil then
            //TempENDeliveryTime.add(ENDeliveryTimeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDeliveryTimeEdit.Free;
      frmENDeliveryTimeEdit:=nil;
    end;
  finally
    ENDeliveryTimeObj.Free;
  end;
end;

procedure TfrmENDeliveryTimeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDeliveryTimeShow.actFilterExecute(Sender: TObject);
begin
{frmENDeliveryTimeFilterEdit:=TfrmENDeliveryTimeFilterEdit.Create(Application, dsEdit);
  try
    ENDeliveryTimeFilterObj := ENDeliveryTimeFilter.Create;
    SetNullIntProps(ENDeliveryTimeFilterObj);
    SetNullXSProps(ENDeliveryTimeFilterObj);

    if frmENDeliveryTimeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDeliveryTimeFilter.Create;
      FilterObject := ENDeliveryTimeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDeliveryTimeFilterEdit.Free;
    frmENDeliveryTimeFilterEdit:=nil;
  end;}
end;

procedure TfrmENDeliveryTimeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.