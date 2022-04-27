
unit ShowENTravelSheetItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetItemController, AdvObj ;


type
  TfrmENTravelSheetItemShow = class(TChildForm)  
  HTTPRIOENTravelSheetItem: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheetItem: TAdvStringGrid;
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
procedure sgENTravelSheetItemTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetItemDblClick(Sender: TObject);
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
 // ENTravelSheetItemObj: ENTravelSheetItem;
 // ENTravelSheetItemFilterObj: ENTravelSheetItemFilter;
  
  
implementation

uses Main, EditENTravelSheetItem, EditENTravelSheetItemFilter;


{$R *.dfm}

var
  //frmENTravelSheetItemShow : TfrmENTravelSheetItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTravelSheetItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Маршрут звідки'
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
   

procedure TfrmENTravelSheetItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTravelSheetItemShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetItemShow.FormShow(Sender: TObject);
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
        Cells[1,i+1] := ENTravelSheetItemList.list[i].travelFrom;
        Cells[2,i+1] := ENTravelSheetItemList.list[i].travelTo;
        if ENTravelSheetItemList.list[i].timeStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].timeStart);
        if ENTravelSheetItemList.list[i].timeFinal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENTravelSheetItemList.list[i].timeFinal);
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

procedure TfrmENTravelSheetItemShow.sgENTravelSheetItemTopLeftChanged(Sender: TObject);
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

procedure TfrmENTravelSheetItemShow.sgENTravelSheetItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheetItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheetItem.RowCount-1 do
   for j:=0 to sgENTravelSheetItem.ColCount-1 do
     sgENTravelSheetItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetItemShow.actViewExecute(Sender: TObject);
Var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
begin
 TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
   try
     ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItem.Cells[0,sgENTravelSheetItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetItemEdit:=TfrmENTravelSheetItemEdit.Create(Application, dsView);
  try
    frmENTravelSheetItemEdit.ShowModal;
  finally
    frmENTravelSheetItemEdit.Free;
    frmENTravelSheetItemEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetItemShow.actEditExecute(Sender: TObject);
Var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
begin
 TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
   try
     ENTravelSheetItemObj := TempENTravelSheetItem.getObject(StrToInt(sgENTravelSheetItem.Cells[0,sgENTravelSheetItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetItemEdit:=TfrmENTravelSheetItemEdit.Create(Application, dsEdit);
  try
    if frmENTravelSheetItemEdit.ShowModal= mrOk then
      begin
        //TempENTravelSheetItem.save(ENTravelSheetItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTravelSheetItemEdit.Free;
    frmENTravelSheetItemEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetItemShow.actDeleteExecute(Sender: TObject);
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

procedure TfrmENTravelSheetItemShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheetItem: ENTravelSheetItemControllerSoapPort;
begin
  TempENTravelSheetItem := HTTPRIOENTravelSheetItem as ENTravelSheetItemControllerSoapPort;
  ENTravelSheetItemObj:=ENTravelSheetItem.Create;

   //ENTravelSheetItemObj.timeStart:= TXSDateTime.Create;
   
   //ENTravelSheetItemObj.timeFinal:= TXSDateTime.Create;
   
   //ENTravelSheetItemObj.speedometerStart:= TXSDecimal.Create;
   //ENTravelSheetItemObj.speedometerFinal:= TXSDecimal.Create;
   //ENTravelSheetItemObj.sumDistances:= TXSDecimal.Create;
   //ENTravelSheetItemObj.sumMachineHours:= TXSDecimal.Create;
   //ENTravelSheetItemObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENTravelSheetItemEdit:=TfrmENTravelSheetItemEdit.Create(Application, dsInsert);
    try
      if frmENTravelSheetItemEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetItemObj<>nil then
            //TempENTravelSheetItem.add(ENTravelSheetItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetItemEdit.Free;
      frmENTravelSheetItemEdit:=nil;
    end;
  finally
    ENTravelSheetItemObj.Free;
  end;
end;

procedure TfrmENTravelSheetItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTravelSheetItemShow.actFilterExecute(Sender: TObject);
begin
{frmENTravelSheetItemFilterEdit:=TfrmENTravelSheetItemFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetItemFilterObj := ENTravelSheetItemFilter.Create;
    SetNullIntProps(ENTravelSheetItemFilterObj);
    SetNullXSProps(ENTravelSheetItemFilterObj);

    if frmENTravelSheetItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetItemFilter.Create;
      FilterObject := ENTravelSheetItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTravelSheetItemFilterEdit.Free;
    frmENTravelSheetItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENTravelSheetItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.