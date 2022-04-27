
unit ShowENDeliveryTimePlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDeliveryTimePlanController ;


type
  TfrmENDeliveryTimePlanShow = class(TChildForm)  
  HTTPRIOENDeliveryTimePlan: THTTPRIO;
    ImageList1: TImageList;
    sgENDeliveryTimePlan: TAdvStringGrid;
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
procedure sgENDeliveryTimePlanTopLeftChanged(Sender: TObject);
procedure sgENDeliveryTimePlanDblClick(Sender: TObject);
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
 // ENDeliveryTimePlanObj: ENDeliveryTimePlan;
 // ENDeliveryTimePlanFilterObj: ENDeliveryTimePlanFilter;
  
  
implementation

uses Main, EditENDeliveryTimePlan, EditENDeliveryTimePlanFilter;


{$R *.dfm}

var
  //frmENDeliveryTimePlanShow : TfrmENDeliveryTimePlanShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDeliveryTimePlanHeaders: array [1..4] of String =
        ( 'Код'
          ,'Час на доствку нормативний (год)'
          ,'Час на доствку фактичний(год)'
          ,'Загальна відстань до обєкта'
        );
   

procedure TfrmENDeliveryTimePlanShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDeliveryTimePlanShow:=nil;
    inherited;
  end;


procedure TfrmENDeliveryTimePlanShow.FormShow(Sender: TObject);
var
  TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
  i: Integer;
  ENDeliveryTimePlanList: ENDeliveryTimePlanShortList;
  begin
  SetGridHeaders(ENDeliveryTimePlanHeaders, sgENDeliveryTimePlan.ColumnHeaders);
  ColCount:=100;
  TempENDeliveryTimePlan :=  HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryTimePlanFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryTimePlanList := TempENDeliveryTimePlan.getScrollableFilteredList(ENDeliveryTimePlanFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDeliveryTimePlanList.list);

  if LastCount > -1 then
     sgENDeliveryTimePlan.RowCount:=LastCount+2
  else
     sgENDeliveryTimePlan.RowCount:=2;

   with sgENDeliveryTimePlan do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryTimePlanList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDeliveryTimePlanList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENDeliveryTimePlanList.list[i].deliveryTimePlan = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENDeliveryTimePlanList.list[i].deliveryTimePlan.DecimalString;
        if ENDeliveryTimePlanList.list[i].deliveryTimeFact = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENDeliveryTimePlanList.list[i].deliveryTimeFact.DecimalString;
        if ENDeliveryTimePlanList.list[i].deliveryDistance = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENDeliveryTimePlanList.list[i].deliveryDistance.DecimalString;
        LastRow:=i+1;
        sgENDeliveryTimePlan.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDeliveryTimePlan.Row:=1;
end;

procedure TfrmENDeliveryTimePlanShow.sgENDeliveryTimePlanTopLeftChanged(Sender: TObject);
var
  TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
  i,CurrentRow: Integer;
  ENDeliveryTimePlanList: ENDeliveryTimePlanShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDeliveryTimePlan.TopRow + sgENDeliveryTimePlan.VisibleRowCount) = ColCount
  then
    begin
      TempENDeliveryTimePlan :=  HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
      CurrentRow:=sgENDeliveryTimePlan.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDeliveryTimePlanFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDeliveryTimePlanList := TempENDeliveryTimePlan.getScrollableFilteredList(ENDeliveryTimePlanFilter(FilterObject),ColCount-1, 100);



  sgENDeliveryTimePlan.RowCount:=sgENDeliveryTimePlan.RowCount+100;
  LastCount:=High(ENDeliveryTimePlanList.list);
  with sgENDeliveryTimePlan do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDeliveryTimePlanList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDeliveryTimePlanList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENDeliveryTimePlanList.list[i].deliveryTimePlan = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENDeliveryTimePlanList.list[i].deliveryTimePlan.DecimalString;
        if ENDeliveryTimePlanList.list[i].deliveryTimeFact = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENDeliveryTimePlanList.list[i].deliveryTimeFact.DecimalString;
        if ENDeliveryTimePlanList.list[i].deliveryDistance = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENDeliveryTimePlanList.list[i].deliveryDistance.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDeliveryTimePlan.Row:=CurrentRow-5;
   sgENDeliveryTimePlan.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDeliveryTimePlanShow.sgENDeliveryTimePlanDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDeliveryTimePlan,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDeliveryTimePlanShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDeliveryTimePlan.RowCount-1 do
   for j:=0 to sgENDeliveryTimePlan.ColCount-1 do
     sgENDeliveryTimePlan.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDeliveryTimePlanShow.actViewExecute(Sender: TObject);
Var TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
begin
 TempENDeliveryTimePlan := HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
   try
     ENDeliveryTimePlanObj := TempENDeliveryTimePlan.getObject(StrToInt(sgENDeliveryTimePlan.Cells[0,sgENDeliveryTimePlan.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryTimePlanEdit:=TfrmENDeliveryTimePlanEdit.Create(Application, dsView);
  try
    frmENDeliveryTimePlanEdit.ShowModal;
  finally
    frmENDeliveryTimePlanEdit.Free;
    frmENDeliveryTimePlanEdit:=nil;
  end;
end;

procedure TfrmENDeliveryTimePlanShow.actEditExecute(Sender: TObject);
Var TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
begin
 TempENDeliveryTimePlan := HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
   try
     ENDeliveryTimePlanObj := TempENDeliveryTimePlan.getObject(StrToInt(sgENDeliveryTimePlan.Cells[0,sgENDeliveryTimePlan.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDeliveryTimePlanEdit:=TfrmENDeliveryTimePlanEdit.Create(Application, dsEdit);
  try
    if frmENDeliveryTimePlanEdit.ShowModal= mrOk then
      begin
        //TempENDeliveryTimePlan.save(ENDeliveryTimePlanObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDeliveryTimePlanEdit.Free;
    frmENDeliveryTimePlanEdit:=nil;
  end;
end;

procedure TfrmENDeliveryTimePlanShow.actDeleteExecute(Sender: TObject);
Var TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDeliveryTimePlan := HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDeliveryTimePlan.Cells[0,sgENDeliveryTimePlan.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Загальний час на доставку персонала на объект ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDeliveryTimePlan.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDeliveryTimePlanShow.actInsertExecute(Sender: TObject);
Var TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
begin
  TempENDeliveryTimePlan := HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;
  ENDeliveryTimePlanObj:=ENDeliveryTimePlan.Create;

   ENDeliveryTimePlanObj.deliveryTimePlan:= TXSDecimal.Create;
   ENDeliveryTimePlanObj.deliveryTimeFact:= TXSDecimal.Create;
   ENDeliveryTimePlanObj.deliveryDistance:= TXSDecimal.Create;


  try
    frmENDeliveryTimePlanEdit:=TfrmENDeliveryTimePlanEdit.Create(Application, dsInsert);
    try
      if frmENDeliveryTimePlanEdit.ShowModal = mrOk then
      begin
        if ENDeliveryTimePlanObj<>nil then
            //TempENDeliveryTimePlan.add(ENDeliveryTimePlanObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDeliveryTimePlanEdit.Free;
      frmENDeliveryTimePlanEdit:=nil;
    end;
  finally
    ENDeliveryTimePlanObj.Free;
  end;
end;

procedure TfrmENDeliveryTimePlanShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDeliveryTimePlanShow.actFilterExecute(Sender: TObject);
begin
{frmENDeliveryTimePlanFilterEdit:=TfrmENDeliveryTimePlanFilterEdit.Create(Application, dsEdit);
  try
    ENDeliveryTimePlanFilterObj := ENDeliveryTimePlanFilter.Create;
    SetNullIntProps(ENDeliveryTimePlanFilterObj);
    SetNullXSProps(ENDeliveryTimePlanFilterObj);

    if frmENDeliveryTimePlanFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDeliveryTimePlanFilter.Create;
      FilterObject := ENDeliveryTimePlanFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDeliveryTimePlanFilterEdit.Free;
    frmENDeliveryTimePlanFilterEdit:=nil;
  end;}
end;

procedure TfrmENDeliveryTimePlanShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.