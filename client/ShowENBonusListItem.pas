
unit ShowENBonusListItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBonusListItemController, AdvObj ;


type
  TfrmENBonusListItemShow = class(TChildForm)  
  HTTPRIOENBonusListItem: THTTPRIO;
    ImageList1: TImageList;
    sgENBonusListItem: TAdvStringGrid;
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
procedure sgENBonusListItemTopLeftChanged(Sender: TObject);
procedure sgENBonusListItemDblClick(Sender: TObject);
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
 // ENBonusListItemObj: ENBonusListItem;
 // ENBonusListItemFilterObj: ENBonusListItemFilter;
  
  
implementation

uses Main, EditENBonusListItem, EditENBonusListItemFilter;


{$R *.dfm}

var
  //frmENBonusListItemShow : TfrmENBonusListItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBonusListItemHeaders: array [1..20] of String =
        ( 'Код'
          ,'Код підрозділу робітника(бригада)'
          ,'Назва підрозділу робітника(бригада)'
          ,'ПІБ'
          ,'Табельний номер'
          ,'Посада'
          ,'Фонд робочого часу за звітний місяць для робітника'
          ,'Кількість годин, які повинні відпрацювати електромонтери за місяць з урахуванням невиходів'
          ,'"Робота з персоналом, 5% від кількості годин, які повинні відпрацювати електромонтери з урахуванням невиходів "'
          ,'Витрати часу на проїзд по всім видам робіт'
          ,'Кількість відпрацьованого часу при виконанні планових робіт'
          ,'Кількість відпрацьованого часу при виконанні непланових робіт'
          ,'Кількість годин відрацьованих виконувачем робіт виробничого характеру '
          ,'"Відсоток завантаженості електромонтерів на роботах виробничого характеру'
          ,'Відсоток завантаженості електромонтерів на планових роботах'
          ,'Відсоток завантаженості електромонтерів на не планових роботах'
          ,'Відсоток премії відповідно до шкали заватаження виконувача робіт виробничого характеру'
          ,'Коефіцієнт виконання планів за звітний місяць'
          ,'Розмір премії для нарахування відповідно до Положення'
          ,'Фактична кількість відпрацьованих днів'
        );
   

procedure TfrmENBonusListItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBonusListItemShow:=nil;
    inherited;
  end;


procedure TfrmENBonusListItemShow.FormShow(Sender: TObject);
var
  TempENBonusListItem: ENBonusListItemControllerSoapPort;
  i: Integer;
  ENBonusListItemList: ENBonusListItemShortList;
  begin
  SetGridHeaders(ENBonusListItemHeaders, sgENBonusListItem.ColumnHeaders);
  ColCount:=100;
  TempENBonusListItem :=  HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBonusListItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBonusListItemList := TempENBonusListItem.getScrollableFilteredList(ENBonusListItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBonusListItemList.list);

  if LastCount > -1 then
     sgENBonusListItem.RowCount:=LastCount+2
  else
     sgENBonusListItem.RowCount:=2;

   with sgENBonusListItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBonusListItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBonusListItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBonusListItemList.list[i].podrId;
        Cells[2,i+1] := ENBonusListItemList.list[i].podrName;
        Cells[3,i+1] := ENBonusListItemList.list[i].fio;
        Cells[4,i+1] := ENBonusListItemList.list[i].tabNumber;
          Cells[5,i+1] := ENBonusListItemList.list[i].positionName;
        if ENBonusListItemList.list[i].fundWorkTime = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENBonusListItemList.list[i].fundWorkTime.DecimalString;
        if ENBonusListItemList.list[i].workTimeFact = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENBonusListItemList.list[i].workTimeFact.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedWithStaff = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENBonusListItemList.list[i].hoursWorkedWithStaff.DecimalString;
        if ENBonusListItemList.list[i].timeDelivery = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENBonusListItemList.list[i].timeDelivery.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedPlan = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENBonusListItemList.list[i].hoursWorkedPlan.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedNotPlan = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := ENBonusListItemList.list[i].hoursWorkedNotPlan.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedSum = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := ENBonusListItemList.list[i].hoursWorkedSum.DecimalString;
        if ENBonusListItemList.list[i].percentLoadWork = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := ENBonusListItemList.list[i].percentLoadWork.DecimalString;
        if ENBonusListItemList.list[i].percentLoadByPlanWork = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := ENBonusListItemList.list[i].percentLoadByPlanWork.DecimalString;
        if ENBonusListItemList.list[i].percentLoadByNotPlanWork = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := ENBonusListItemList.list[i].percentLoadByNotPlanWork.DecimalString;
        if ENBonusListItemList.list[i].percentBonus = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := ENBonusListItemList.list[i].percentBonus.DecimalString;
        if ENBonusListItemList.list[i].coefficient = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := ENBonusListItemList.list[i].coefficient.DecimalString;
        if ENBonusListItemList.list[i].percentBonusForCharging = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := ENBonusListItemList.list[i].percentBonusForCharging.DecimalString;
        if ENBonusListItemList.list[i].countFactWorkedDays = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := ENBonusListItemList.list[i].countFactWorkedDays.DecimalString;
        LastRow:=i+1;
        sgENBonusListItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBonusListItem.Row:=1;
end;

procedure TfrmENBonusListItemShow.sgENBonusListItemTopLeftChanged(Sender: TObject);
var
  TempENBonusListItem: ENBonusListItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENBonusListItemList: ENBonusListItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBonusListItem.TopRow + sgENBonusListItem.VisibleRowCount) = ColCount
  then
    begin
      TempENBonusListItem :=  HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
      CurrentRow:=sgENBonusListItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBonusListItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBonusListItemList := TempENBonusListItem.getScrollableFilteredList(ENBonusListItemFilter(FilterObject),ColCount-1, 100);



  sgENBonusListItem.RowCount:=sgENBonusListItem.RowCount+100;
  LastCount:=High(ENBonusListItemList.list);
  with sgENBonusListItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBonusListItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBonusListItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBonusListItemList.list[i].podrId;
        Cells[2,i+CurrentRow] := ENBonusListItemList.list[i].podrName;
        Cells[3,i+CurrentRow] := ENBonusListItemList.list[i].fio;
        Cells[4,i+CurrentRow] := ENBonusListItemList.list[i].tabNumber;
        Cells[5,i+CurrentRow] := ENBonusListItemList.list[i].positionName;
        if ENBonusListItemList.list[i].fundWorkTime = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENBonusListItemList.list[i].fundWorkTime.DecimalString;
        if ENBonusListItemList.list[i].workTimeFact = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENBonusListItemList.list[i].workTimeFact.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedWithStaff = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENBonusListItemList.list[i].hoursWorkedWithStaff.DecimalString;
        if ENBonusListItemList.list[i].timeDelivery = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := ENBonusListItemList.list[i].timeDelivery.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedPlan = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := ENBonusListItemList.list[i].hoursWorkedPlan.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedNotPlan = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := ENBonusListItemList.list[i].hoursWorkedNotPlan.DecimalString;
        if ENBonusListItemList.list[i].hoursWorkedSum = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := ENBonusListItemList.list[i].hoursWorkedSum.DecimalString;
        if ENBonusListItemList.list[i].percentLoadWork = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := ENBonusListItemList.list[i].percentLoadWork.DecimalString;
        if ENBonusListItemList.list[i].percentLoadByPlanWork = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := ENBonusListItemList.list[i].percentLoadByPlanWork.DecimalString;
        if ENBonusListItemList.list[i].percentLoadByNotPlanWork = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := ENBonusListItemList.list[i].percentLoadByNotPlanWork.DecimalString;
        if ENBonusListItemList.list[i].percentBonus = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := ENBonusListItemList.list[i].percentBonus.DecimalString;
        if ENBonusListItemList.list[i].coefficient = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := ENBonusListItemList.list[i].coefficient.DecimalString;
        if ENBonusListItemList.list[i].percentBonusForCharging = nil then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := ENBonusListItemList.list[i].percentBonusForCharging.DecimalString;
        if ENBonusListItemList.list[i].countFactWorkedDays = nil then
          Cells[19,i+CurrentRow] := ''
        else
          Cells[19,i+CurrentRow] := ENBonusListItemList.list[i].countFactWorkedDays.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBonusListItem.Row:=CurrentRow-5;
   sgENBonusListItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBonusListItemShow.sgENBonusListItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBonusListItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBonusListItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBonusListItem.RowCount-1 do
   for j:=0 to sgENBonusListItem.ColCount-1 do
     sgENBonusListItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBonusListItemShow.actViewExecute(Sender: TObject);
Var TempENBonusListItem: ENBonusListItemControllerSoapPort;
begin
 TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     ENBonusListItemObj := TempENBonusListItem.getObject(StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBonusListItemEdit:=TfrmENBonusListItemEdit.Create(Application, dsView);
  try
    frmENBonusListItemEdit.ShowModal;
  finally
    frmENBonusListItemEdit.Free;
    frmENBonusListItemEdit:=nil;
  end;
end;

procedure TfrmENBonusListItemShow.actEditExecute(Sender: TObject);
Var TempENBonusListItem: ENBonusListItemControllerSoapPort;
begin
 TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     ENBonusListItemObj := TempENBonusListItem.getObject(StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBonusListItemEdit:=TfrmENBonusListItemEdit.Create(Application, dsEdit);
  try
    if frmENBonusListItemEdit.ShowModal= mrOk then
      begin
        //TempENBonusListItem.save(ENBonusListItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBonusListItemEdit.Free;
    frmENBonusListItemEdit:=nil;
  end;
end;

procedure TfrmENBonusListItemShow.actDeleteExecute(Sender: TObject);
Var TempENBonusListItem: ENBonusListItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBonusListItem.Cells[0,sgENBonusListItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки відомості нарахування премії для співробітників) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBonusListItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBonusListItemShow.actInsertExecute(Sender: TObject);
// Var TempENBonusListItem: ENBonusListItemControllerSoapPort; 
begin
  // TempENBonusListItem := HTTPRIOENBonusListItem as ENBonusListItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBonusListItemObj:=ENBonusListItem.Create;

   //ENBonusListItemObj.fundWorkTime:= TXSDecimal.Create;
   //ENBonusListItemObj.workTimeFact:= TXSDecimal.Create;
   //ENBonusListItemObj.hoursWorkedWithStaff:= TXSDecimal.Create;
   //ENBonusListItemObj.timeDelivery:= TXSDecimal.Create;
   //ENBonusListItemObj.hoursWorkedPlan:= TXSDecimal.Create;
   //ENBonusListItemObj.hoursWorkedNotPlan:= TXSDecimal.Create;
   //ENBonusListItemObj.hoursWorkedSum:= TXSDecimal.Create;
   //ENBonusListItemObj.percentLoadWork:= TXSDecimal.Create;
   //ENBonusListItemObj.percentLoadByPlanWork:= TXSDecimal.Create;
   //ENBonusListItemObj.percentLoadByNotPlanWork:= TXSDecimal.Create;
   //ENBonusListItemObj.percentBonus:= TXSDecimal.Create;
   //ENBonusListItemObj.coefficient:= TXSDecimal.Create;
   //ENBonusListItemObj.percentBonusForCharging:= TXSDecimal.Create;
   //ENBonusListItemObj.countFactWorkedDays:= TXSDecimal.Create;


  try
    frmENBonusListItemEdit:=TfrmENBonusListItemEdit.Create(Application, dsInsert);
    try
      if frmENBonusListItemEdit.ShowModal = mrOk then
      begin
        if ENBonusListItemObj<>nil then
            //TempENBonusListItem.add(ENBonusListItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBonusListItemEdit.Free;
      frmENBonusListItemEdit:=nil;
    end;
  finally
    ENBonusListItemObj.Free;
  end;
end;

procedure TfrmENBonusListItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBonusListItemShow.actFilterExecute(Sender: TObject);
begin
{frmENBonusListItemFilterEdit:=TfrmENBonusListItemFilterEdit.Create(Application, dsInsert);
  try
    ENBonusListItemFilterObj := ENBonusListItemFilter.Create;
    SetNullIntProps(ENBonusListItemFilterObj);
    SetNullXSProps(ENBonusListItemFilterObj);

    if frmENBonusListItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBonusListItemFilter.Create;
      FilterObject := ENBonusListItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBonusListItemFilterEdit.Free;
    frmENBonusListItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENBonusListItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.