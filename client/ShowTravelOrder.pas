
unit ShowTravelOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetItemController, AdvObj ;


type
  TfrmTravelOrderShow = class(TChildForm)
  HTTPRIOENTravelSheetItem: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetItem: TAdvStringGrid;
    ActionList1: TActionList;
    actUpdate: TAction;
    PopupMenu1: TPopupMenu;
    N6: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton11: TToolButton;
    btnUp: TToolButton;
    btnDown: TToolButton;
    actOrderUp: TAction;
    actOrderDown: TAction;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTravelSheetItemTopLeftChanged(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
    procedure actOrderUpExecute(Sender: TObject);
    procedure actOrderDownExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

 var
 // ENTravelSheetItemObj: ENTravelSheetItem;
 ENTravelSheetItemFilterObj : ENTravelSheetItemFilter;


implementation

uses Main, EditENTravelSheetItem, EditENTravelSheetItemFilter,
  ENTravelSheetItemKindController, ENConsts;


{$R *.dfm}

var
  frmTravelOrderShow : TfrmTravelOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер наряду'
          ,'Маршрут куди'
          ,'Час прибуття'
          ,'Час вибуття'
          ,'Показання спідометра при виїзді'
          ,'Показання спідометра при поверненні'
          ,'пробіг, км'
          ,'машиногодини'
          ,'Дата зміни'
          ,'користувач'
        );
   

procedure TfrmTravelOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmTravelOrderShow:=nil;

    inherited;
  end;


procedure TfrmTravelOrderShow.FormShow(Sender: TObject);
var
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  i: Integer;
  ENTravelSheetItemList: ENTravelSheetItemShortList;
  begin
  SetGridHeaders(ENTravelSheetItemHeaders, sgENTravelSheetItem.ColumnHeaders);
  ColCount:=100;
  TempENTravelSheetItem :=  HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetItemList := TempENTravelSheetItem.getScrollableFilteredList(ENTravelSheetItemFilter(FilterObject),0,ColCount);

  LastCount:=High(ENTravelSheetItemList.list);

  if LastCount > -1 then
     sgENTravelSheetItem.RowCount:=LastCount+2
  else
     sgENTravelSheetItem.RowCount:=2;

   with sgENTravelSheetItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetItemList.list[i].workOrderNumber;
        Cells[2,i+1] := ENTravelSheetItemList.list[i].travelTo;

        if ENTravelSheetItemList.list[i].parentItemRefTimeStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].parentItemRefTimeStart);

        if ENTravelSheetItemList.list[i].parentItemRefTimeFinal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].parentItemRefTimeFinal);

        if ENTravelSheetItemList.list[i].speedometerStart = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTravelSheetItemList.list[i].speedometerStart.DecimalString;
        if ENTravelSheetItemList.list[i].speedometerFinal = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTravelSheetItemList.list[i].speedometerFinal.DecimalString;
        if ENTravelSheetItemList.list[i].sumDistances = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENTravelSheetItemList.list[i].sumDistances.DecimalString;
        if ENTravelSheetItemList.list[i].sumMachineHours = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENTravelSheetItemList.list[i].sumMachineHours.DecimalString;
        if ENTravelSheetItemList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].dateEdit);
        Cells[10,i+1] := ENTravelSheetItemList.list[i].userGen;
        LastRow:=i+1;
        sgENTravelSheetItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTravelSheetItem.Row:=1;
end;

procedure TfrmTravelOrderShow.sgENTravelSheetItemTopLeftChanged(Sender: TObject);
var
  TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetItemList: ENTravelSheetItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTravelSheetItem.TopRow + sgENTravelSheetItem.VisibleRowCount) = ColCount
  then
    begin
      TempENTravelSheetItem :=  HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
      CurrentRow:=sgENTravelSheetItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTravelSheetItemList := TempENTravelSheetItem.getScrollableFilteredList(ENTravelSheetItemFilter(FilterObject),ColCount-1, 100);



  sgENTravelSheetItem.RowCount:=sgENTravelSheetItem.RowCount+100;
  LastCount:=High(ENTravelSheetItemList.list);
  with sgENTravelSheetItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTravelSheetItemList.list[i].travelFrom;
        Cells[2,i+CurrentRow] := ENTravelSheetItemList.list[i].travelTo;
        if ENTravelSheetItemList.list[i].timeStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].timeStart);		  
        if ENTravelSheetItemList.list[i].timeFinal = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].timeFinal);		  
        if ENTravelSheetItemList.list[i].speedometerStart = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENTravelSheetItemList.list[i].speedometerStart.DecimalString;
        if ENTravelSheetItemList.list[i].speedometerFinal = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENTravelSheetItemList.list[i].speedometerFinal.DecimalString;
        if ENTravelSheetItemList.list[i].sumDistances = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENTravelSheetItemList.list[i].sumDistances.DecimalString;
        if ENTravelSheetItemList.list[i].sumMachineHours = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENTravelSheetItemList.list[i].sumMachineHours.DecimalString;
        if ENTravelSheetItemList.list[i].dateEdit = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].dateEdit);		  
        Cells[10,i+CurrentRow] := ENTravelSheetItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTravelSheetItem.Row:=CurrentRow-5;
   sgENTravelSheetItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmTravelOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetItem.RowCount-1 do
   for j:=0 to sgENTravelSheetItem.ColCount-1 do
     sgENTravelSheetItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmTravelOrderShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetItem.Cells[0,sgENTravelSheetItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строка маршрутного листу) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheetItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmTravelOrderShow.actOrderDownExecute(Sender: TObject);
var
   TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
   ObjCode : Integer;
   travelSheetItem : ENTravelSheetItem;
begin
   TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetItem.Cells[0,sgENTravelSheetItem.Row]);
   except
   on EConvertError do Exit;
  end;
     travelSheetItem := TempENTravelSheetItem.getObject(ObjCode);

  if travelSheetItem.travelOrder = LastCount+1 then
  Exit;

  TempENTravelSheetItem.changeOrder(travelSheetItem.code, travelSheetItem.travelOrder+1);
  UpdateGrid(Sender);

end;

procedure TfrmTravelOrderShow.actOrderUpExecute(Sender: TObject);
var
   TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
   ObjCode : Integer;
   travelSheetItem : ENTravelSheetItem;
begin
   TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheetItem.Cells[0,sgENTravelSheetItem.Row]);
   except
   on EConvertError do Exit;
  end;
     travelSheetItem := TempENTravelSheetItem.getObject(ObjCode);

  if travelSheetItem.travelOrder = 1 then
  Exit;

  TempENTravelSheetItem.changeOrder(travelSheetItem.code, travelSheetItem.travelOrder-1);
  UpdateGrid(Sender);
end;

procedure TfrmTravelOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


end.
