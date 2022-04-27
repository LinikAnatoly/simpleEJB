
unit ShowENTravelSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTravelSheetController, AdvObj ;


type
  TfrmENTravelSheetShow = class(TChildForm)  
  HTTPRIOENTravelSheet: THTTPRIO;
    ImageList1: TImageList;
    sgENTravelSheet: TAdvStringGrid;
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
    actClose: TAction;
    actUnClose: TAction;
    miClose: TMenuItem;
    miUnClose: TMenuItem;
    N10: TMenuItem;
    actCopy: TAction;
    N5: TMenuItem;
    N9: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTravelSheetTopLeftChanged(Sender: TObject);
procedure sgENTravelSheetDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actUnCloseExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);

/////////////////////
procedure sgENTravelSheetTopLeftChanged__(Sender: TObject);
procedure restoreGridPosition(Sender: TObject);
/////////////////////////


  private
   { Private declarations }
   isFiltered  : boolean;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENTravelSheetShow : TfrmENTravelSheetShow;
 // ENTravelSheetObj: ENTravelSheet;
 // ENTravelSheetFilterObj: ENTravelSheetFilter;
  
  
implementation

uses Main, EditENTravelSheet, EditENTravelSheetFilter, ENConsts, 
  ENTravelSheetStatusController, ENDepartmentController,
  TKTransportRealController, FINWorkerController, FINWorkerKindController,
  DMReportsUnit, ENTravelWorkModeController, TKFuelCalcTypeController;


{$R *.dfm}

var
  //frmENTravelSheetShow : TfrmENTravelSheetShow;

  ColCount: Integer = 0;
  selectedRow : Integer = 1;
  LastCount : Integer;
  LastRow: Integer = 1;
  ENTravelSheetHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер под.листа'
          ,'Дата'
          ,'№ авто'
          ,'Назва авто'
          ,'Водій'
          ,'Тип'
          ,'Статус'
          ,'Дата зміни'
          ,'користувач'
        );


  ENTravelSheetHeaders_: array [1..10] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата з'
          ,'Дата по'
          ,'Показання спідометра при виїзді'
          ,'Показання спідометра при поверненні'
          ,'Фактичний час виїзда з гаража'
          ,'Фактичний час повернення до гаражу'
          ,'Дата зміни'
          ,'користувач'
        );


procedure TfrmENTravelSheetShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    selectedRow := 1;
    if FormMode = fmChild then
      frmENTravelSheetShow:=nil;
    inherited;
  end;


procedure TfrmENTravelSheetShow.FormShow(Sender: TObject);
var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  i: Integer;
  ENTravelSheetList: ENTravelSheetShortList;
  begin
  SetGridHeaders(ENTravelSheetHeaders, sgENTravelSheet.ColumnHeaders);

  //if ColCount <= 100 then
    ColCount:=100;

  TempENTravelSheet :=  HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTravelSheetFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENTravelSheetFilter(FilterObject).orderBySQL := 'datestart desc, cast(numbergen as integer) desc';
     //ENTravelSheetFilter(FilterObject).orderBySQL := 'cast(numbergen as integer) desc, datestart desc';
     isFiltered := false;
  end
  else
     isFiltered := true;

  if not isFiltered then
  begin
     actFilterExecute(Sender);
     exit;
  end;

  ENTravelSheetList := TempENTravelSheet.getScrollableFilteredList(ENTravelSheetFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTravelSheetList.list);

  if LastCount > -1 then
     sgENTravelSheet.RowCount:=LastCount+2
  else
     sgENTravelSheet.RowCount:=2;

   with sgENTravelSheet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetList.list[i].numberGen;
        if ENTravelSheetList.list[i].dateStart = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTravelSheetList.list[i].dateStart);

        Cells[3, i+1] := ENTravelSheetList.list[i].transportRealGosNumber;
        Cells[4, i+1] := ENTravelSheetList.list[i].transportRealName;
        Cells[5, i+1] := ENTravelSheetList.list[i].finWorkerName;
        Cells[6, i+1] := ENTravelSheetList.list[i].typeRefName;
        Cells[7, i+1] := ENTravelSheetList.list[i].statusRefName;

          {
        ( 'Код'
          ,'Номер под.листа'
          ,'Дата'
          ,'№ авто'
          ,'Назва авто'
          ,'Водій'
          ,'Type'
          ,'Статус'
          ,'Дата зміни'
          ,'користувач'
        if ENTravelSheetList.list[i].dateFinal = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENTravelSheetList.list[i].dateFinal);


        if ENTravelSheetList.list[i].speedometerStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTravelSheetList.list[i].speedometerStart.DecimalString;
        if ENTravelSheetList.list[i].speedometerFinal = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTravelSheetList.list[i].speedometerFinal.DecimalString;
        if ENTravelSheetList.list[i].timeStart = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENTravelSheetList.list[i].timeStart);
        if ENTravelSheetList.list[i].timeFinal = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENTravelSheetList.list[i].timeFinal);
          }
        if ENTravelSheetList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDateTimeWithDate2String(ENTravelSheetList.list[i].dateEdit);
        Cells[9,i+1] := ENTravelSheetList.list[i].userGen;
        LastRow:=i+1;
        sgENTravelSheet.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;

   //sgENTravelSheet.Row:= selectedRow; //1;
      if  sgENTravelSheet.RowCount > selectedRow then
      begin
        sgENTravelSheet.Row := selectedRow;
        if selectedRow > 10 then
          sgENTravelSheet.TopRow := selectedRow - 10;
      end
      else
        sgENTravelSheet.Row := sgENTravelSheet.RowCount-1;

   ENTravelSheetList.Free;

end;

procedure TfrmENTravelSheetShow.sgENTravelSheetTopLeftChanged(Sender: TObject);
  begin

    if LastCount < 99 then Exit;

    if (sgENTravelSheet.TopRow + sgENTravelSheet.VisibleRowCount) = ColCount then
    begin
        sgENTravelSheetTopLeftChanged__(Sender);
    end;

end;

procedure TfrmENTravelSheetShow.sgENTravelSheetTopLeftChanged__(Sender: TObject);
var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  i,CurrentRow: Integer;
  ENTravelSheetList: ENTravelSheetShortList;
  begin
    if LastCount < 99 then Exit;
    //if (sgENTravelSheet.TopRow + sgENTravelSheet.VisibleRowCount) = ColCount then
    begin
        TempENTravelSheet :=  HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
        CurrentRow:=sgENTravelSheet.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := ENTravelSheetFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

    ENTravelSheetList := TempENTravelSheet.getScrollableFilteredList(ENTravelSheetFilter(FilterObject),ColCount-1, 100);

    sgENTravelSheet.RowCount:=sgENTravelSheet.RowCount+100;
    LastCount:=High(ENTravelSheetList.list);
    with sgENTravelSheet do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENTravelSheetList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENTravelSheetList.list[i].code)
          else
          Cells[0,i+CurrentRow] := '';
          Cells[1,i+CurrentRow] := ENTravelSheetList.list[i].numberGen;
          if ENTravelSheetList.list[i].dateStart = nil then
            Cells[2,i+CurrentRow] := ''
          else
            Cells[2,i+CurrentRow] := XSDate2String(ENTravelSheetList.list[i].dateStart);

          Cells[3, i+CurrentRow] := ENTravelSheetList.list[i].transportRealGosNumber;
          Cells[4, i+CurrentRow] := ENTravelSheetList.list[i].transportRealName;
          Cells[5, i+CurrentRow] := ENTravelSheetList.list[i].finWorkerName;
          Cells[6, i+CurrentRow] := ENTravelSheetList.list[i].typeRefName;
          Cells[7, i+CurrentRow] := ENTravelSheetList.list[i].statusRefName;


  {
          if ENTravelSheetList.list[i].dateFinal = nil then
            Cells[3,i+CurrentRow] := ''
          else
            Cells[3,i+CurrentRow] := XSDate2String(ENTravelSheetList.list[i].dateFinal);
          if ENTravelSheetList.list[i].speedometerStart = nil then
            Cells[4,i+CurrentRow] := ''
          else
            Cells[4,i+CurrentRow] := ENTravelSheetList.list[i].speedometerStart.DecimalString;
          if ENTravelSheetList.list[i].speedometerFinal = nil then
            Cells[5,i+CurrentRow] := ''
          else
            Cells[5,i+CurrentRow] := ENTravelSheetList.list[i].speedometerFinal.DecimalString;
          if ENTravelSheetList.list[i].timeStart = nil then
            Cells[6,i+CurrentRow] := ''
          else
            Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENTravelSheetList.list[i].timeStart);		  
          if ENTravelSheetList.list[i].timeFinal = nil then
            Cells[7,i+CurrentRow] := ''
          else
            Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENTravelSheetList.list[i].timeFinal);
  }
          if ENTravelSheetList.list[i].dateEdit = nil then
            Cells[8,i+CurrentRow] := ''
          else
            Cells[8,i+CurrentRow] := XSDateTimeWithDate2String(ENTravelSheetList.list[i].dateEdit);		  
          Cells[9,i+CurrentRow] := ENTravelSheetList.list[i].userGen;
            LastRow:=i+CurrentRow;
        end;
     ColCount:=ColCount+100;
     //sgENTravelSheet.Row:=CurrentRow-5;
     sgENTravelSheet.RowCount:=LastRow+1;
    end;
end;


procedure TfrmENTravelSheetShow.sgENTravelSheetDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTravelSheet,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTravelSheetShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTravelSheet.RowCount-1 do
   for j:=0 to sgENTravelSheet.ColCount-1 do
     sgENTravelSheet.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTravelSheetShow.actViewExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgENTravelSheet.Cells[0,sgENTravelSheet.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsView);
  try
    frmENTravelSheetEdit.ShowModal;
  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetShow.actEditExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
prevTravelSheet : ENTravelSheet;
isLastClosed : boolean;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ENTravelSheetObj := TempENTravelSheet.getObject(StrToInt(sgENTravelSheet.Cells[0,sgENTravelSheet.Row]));
   except
   on EConvertError do Exit;
  end;

  if  ENTravelSheetObj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
     Application.MessageBox(PChar('Подорожній лист затверджений ... !'),PChar('Увагв !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

        prevTravelSheet := DMReports.getPrevTravelSheet(ENTravelSheetObj);
        if prevTravelSheet <> nil then
        begin
          //if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) and ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_WRITINGOFF_GSM ) then
          if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) then
            isLastClosed := False
          else
            isLastClosed := True;
       end
       else
        isLastClosed := True;
  //selectedRow := sgENTravelSheet.Row;

  frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsEdit);
  try
    frmENTravelSheetEdit.isLastClosed := isLastClosed;
    if frmENTravelSheetEdit.ShowModal= mrOk then
      begin

       restoreGridPosition(Sender);

      end;

  finally
    frmENTravelSheetEdit.Free;
    frmENTravelSheetEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetShow.restoreGridPosition(Sender: TObject);
begin

        selectedRow := sgENTravelSheet.Row;

        if sgENTravelSheet.RowCount > 101 then
          sgENTravelSheet.RowCount:=sgENTravelSheet.RowCount - (LastCount + 1)
        else
          sgENTravelSheet.RowCount:= 2;

        ColCount := ColCount - 100;

        if selectedRow > 100 then
        begin
          LastCount := 99;
          sgENTravelSheetTopLeftChanged__(Sender);
        end
        else
        begin
          UpdateGrid(Sender);
        end;

        if  sgENTravelSheet.RowCount > selectedRow then
        begin
          sgENTravelSheet.Row := selectedRow;
          if selectedRow > 10 then
            sgENTravelSheet.TopRow := selectedRow - 10;
        end
        else
          sgENTravelSheet.Row :=  sgENTravelSheet.RowCount-1;

end;

procedure TfrmENTravelSheetShow.actDeleteExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTravelSheet.Cells[0,sgENTravelSheet.Row]);
   except
   on EConvertError do Exit;
  end;

  try
     ENTravelSheetObj := TempENTravelSheet.getObject(ObjCode);
   except
   on EConvertError do Exit;
  end;

  if  (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_GOOD) and
      (ENTravelSheetObj.statusRef.code <> TRAVEL_STATUS_PLAN)
  then
  begin
     Application.MessageBox(PChar('Видаляти можна тільки Черновий подорожній лист або подорожный лист з видаленими нарядами... !'),PChar('Увагa !'),MB_ICONWARNING+MB_OK);
     Exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить (Подорожній лист) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTravelSheet.remove(ObjCode);
      restoreGridPosition(Sender);
  end;
end;

procedure TfrmENTravelSheetShow.actInsertExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
prevTravelSheet : ENTravelSheet;
isLastClosed : Boolean;
begin
  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  ENTravelSheetObj:=ENTravelSheet.Create;

  ENTravelSheetObj.statusRef := ENTravelSheetStatusRef.Create;
  ENTravelSheetObj.statusRef.code := TRAVEL_STATUS_GOOD;
  
	Application.MessageBox(PChar('Заборонено вручну додавати подорожні листи. Скористайтеся інтерфейсом "Управління транспорту"'),
                    PChar('Увага !'),MB_ICONWARNING);
	Exit;
   //ENTravelSheetObj.dateStart:= TXSDate.Create;
   //ENTravelSheetObj.dateFinal:= TXSDate.Create;
   //ENTravelSheetObj.speedometerStart:= TXSDecimal.Create;
   //ENTravelSheetObj.speedometerFinal:= TXSDecimal.Create;
   //ENTravelSheetObj.timeStart:= TXSDateTime.Create;

   //ENTravelSheetObj.timeFinal:= TXSDateTime.Create;

   //ENTravelSheetObj.dateEdit:= TXSDateTime.Create;


  try
    frmENTravelSheetEdit:=TfrmENTravelSheetEdit.Create(Application, dsInsert);
    try

      //frmENTravelSheetEdit.isLastClosed := True;

      if frmENTravelSheetEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetObj<>nil then
        begin
          restoreGridPosition(Sender);
        end;
      end;
    finally
      frmENTravelSheetEdit.Free;
      frmENTravelSheetEdit:=nil;
    end;
  finally
    ENTravelSheetObj.Free;
  end;
end;

procedure TfrmENTravelSheetShow.actUpdateExecute(Sender: TObject);
  begin
  //UpdateGrid(Sender);
  restoreGridPosition(Sender);
end;


procedure TfrmENTravelSheetShow.actFilterExecute(Sender: TObject);
begin
  frmENTravelSheetFilterEdit:=TfrmENTravelSheetFilterEdit.Create(Application, dsInsert);
  try
    ENTravelSheetFilterObj := ENTravelSheetFilter.Create;
    SetNullIntProps(ENTravelSheetFilterObj);
    SetNullXSProps(ENTravelSheetFilterObj);

    if frmENTravelSheetFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTravelSheetFilter.Create;
      FilterObject := ENTravelSheetFilterObj;
      ENTravelSheetFilter(FilterObject).orderBySQL := 'datestart desc, cast(numbergen as integer) desc'; //'cast(numbergen as integer) desc, datestart desc';
      //actUpdateExecute(Sender);
      UpdateGrid(Sender);
    end;
  finally
    frmENTravelSheetFilterEdit.Free;
    frmENTravelSheetFilterEdit:=nil;
  end;
end;

procedure TfrmENTravelSheetShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
  //sgENTravelSheet.Row := 1;
end;

procedure TfrmENTravelSheetShow.PopupMenu1Popup(Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;
  
  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
     objCode := StrToInt(sgENTravelSheet.Cells[0,sgENTravelSheet.Row]);
   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  DisableActions([actClose, actUnClose]);

  //actClose.Visible := actClose.Enabled;
  //actUnClose.Visible := actUnClose.Enabled;

  miClose.Visible := False;
  miUnClose.Visible := False;

  if (obj.statusRef.code = TRAVEL_STATUS_PLAN) or (obj.statusRef.code = TRAVEL_STATUS_GOOD) then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Скласти Факт';
      miClose.Visible := actClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_FACT then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Затвердити';
      miClose.Visible := actClose.Enabled;

      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у План';
      miUnClose.Visible := actUnClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
  begin
      actClose.Enabled := True;
      miClose.Caption := 'Затвердити';
      miClose.Visible := actClose.Enabled;

      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у Факт';
      miUnClose.Visible := actUnClose.Enabled;
  end;

  if obj.statusRef.code = TRAVEL_STATUS_CLOSED then
  begin
      actUnClose.Enabled := True;
      miUnClose.Caption := 'Повернути у Списання ПММ';
      miUnClose.Visible := actUnClose.Enabled;
  end;

end;


procedure TfrmENTravelSheetShow.actCloseExecute(Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
     objCode := StrToInt(sgENTravelSheet.Cells[0,sgENTravelSheet.Row]);
   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  if (obj.statusRef.code = TRAVEL_STATUS_GOOD) or (obj.statusRef.code = TRAVEL_STATUS_PLAN ) then
    TempENTravelSheet.closePlan(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_FACT then
    TempENTravelSheet.closeFact(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
     TempENTravelSheet.closeWritingOff(Obj.code)
  else
  begin
    ShowMessage('Error on status TS');
  end;

  //UpdateGrid(Sender);
  restoreGridPosition(Sender);
end;

procedure TfrmENTravelSheetShow.actUnCloseExecute(Sender: TObject);
Var
  TempENTravelSheet: ENTravelSheetControllerSoapPort;
  objCode : Integer;
  obj : ENTravelSheet;
begin
  inherited;

  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;
  try
     objCode := StrToInt(sgENTravelSheet.Cells[0,sgENTravelSheet.Row]);
   except
   on EConvertError do Exit;
  end;

  obj := TempENTravelSheet.getObject(objCode);

  if obj = nil then Exit;

  if obj.statusRef.code = TRAVEL_STATUS_FACT then
    TempENTravelSheet.unClosePlan(Obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_WRITINGOFF_GSM then
    TempENTravelSheet.unCloseWritingOff(obj.code)
  else
  if obj.statusRef.code = TRAVEL_STATUS_CLOSED then
    TempENTravelSheet.unCloseTravelSheet(Obj.code)
  else
     ShowMessage('Error on status TS');

  //UpdateGrid(Sender);
  restoreGridPosition(Sender);
  
end;

procedure TfrmENTravelSheetShow.actCopyExecute(Sender: TObject);
Var TempENTravelSheet: ENTravelSheetControllerSoapPort;
    oldTravelSheet, prevTravelSheet: ENTravelSheet;
    str: String;
    isLastClosed : boolean;
begin
  TempENTravelSheet := HTTPRIOENTravelSheet as ENTravelSheetControllerSoapPort;

  Application.MessageBox(PChar('Заборонено вручну додавати подорожні листи. Скористайтеся інтерфейсом "Управління транспорту"'),
                    PChar('Увага !'),MB_ICONWARNING);
	Exit;

  try
    oldTravelSheet := TempENTravelSheet.getObject(StrToInt(sgENTravelSheet.Cells[0, sgENTravelSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  ENTravelSheetObj := ENTravelSheet.Create;
  ENTravelSheetObj.code := LOW_INT;

  ENTravelSheetObj.statusRef := ENTravelSheetStatusRef.Create;
  ENTravelSheetObj.statusRef.code := TRAVEL_STATUS_GOOD;

  try
    frmENTravelSheetEdit := TfrmENTravelSheetEdit.Create(Application, dsInsert);
    try
      frmENTravelSheetEdit.edtDateStart.Checked := true;
      frmENTravelSheetEdit.edtDateFinal.Checked := true;
      
      if oldTravelSheet.department <> nil then
      begin
        ENTravelSheetObj.department := ENDepartment.Create();
        ENTravelSheetObj.department.code := oldTravelSheet.department.code;
        frmENTravelSheetEdit.edtENDepartmentDepartmentName.Text := oldTravelSheet.department.shortName;
      end;

      if oldTravelSheet.transportReal <> nil then
      begin
        ENTravelSheetObj.transportReal := TKTransportReal.Create();
        ENTravelSheetObj.transportReal.code := oldTravelSheet.transportReal.code;
        frmENTravelSheetEdit.edtTKTransportRealTransportRealName.Text := oldTravelSheet.transportReal.name;
        frmENTravelSheetEdit.edtTKTransportRealGosNumber.Text := oldTravelSheet.transportReal.gosNumber;

        frmENTravelSheetEdit.cbTravelSheetType.ItemIndex := oldTravelSheet.transportReal.travelSheetTypeRef.code - 1;
        frmENTravelSheetEdit.DisableControls([frmENTravelSheetEdit.cbTravelSheetType]);

        if oldTravelSheet.transportReal.fuelCalcTypeRef <> nil then
        begin
          ENTravelSheetObj.transportReal.fuelCalcTypeRef := TKFuelCalcTypeRef.Create();
          ENTravelSheetObj.transportReal.fuelCalcTypeRef.code := oldTravelSheet.transportReal.fuelCalcTypeRef.code;
          frmENTravelSheetEdit.HideControls([frmENTravelSheetEdit.lblFuelCounterStart, frmENTravelSheetEdit.edtFuelCounterStart], False);
        end;

        frmENTravelSheetEdit.Caption := 'Подорожній лист для ' + oldTravelSheet.transportReal.name;

        isLastClosed := True;

        prevTravelSheet := DMReports.getLastTravelSheet(oldTravelSheet);

        //if prevTravelSheet <> nil then
        //  prevTravelSheet := DMReports.getPrevTravelSheet(prevTravelSheet);

        if prevTravelSheet <> nil then
        begin
          if ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_CLOSED ) and ( prevTravelSheet.statusRef.code <> TRAVEL_STATUS_WRITINGOFF_GSM ) then
          begin
            str := prevTravelSheet.numberGen;
            Application.MessageBox(PChar('Попередній подорожній лист № ' + str + ' не Затверджено ... !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
            //Self.ModalResult := mrNone;
            //Self.Close;
            //Exit;
            //isLastClosed := False;
          end;
          //else
          //  isLastClosed := True;

          //frmENTravelSheetEdit.isLastClosed := isLastClosed;
          {
          if ( isLastClosed ) then
          begin
            if  prevTravelSheet.transportReal.fuelCalcTypeRef.code = TKFUELTYPECALC_BY_COUNTER then
            begin
              frmENTravelSheetEdit.edtFuelCounterStart.Text := prevTravelSheet.fuelCounterFinal.DecimalString;
              frmENTravelSheetEdit.DisableControls([frmENTravelSheetEdit.edtFuelCounterStart]);
              //frmENTravelSheetEdit.HideControls([frmENTravelSheetEdit.lblFuelCounterStart, frmENTravelSheetEdit.edtFuelCounterStart]);
            end;

            frmENTravelSheetEdit.edtSpeedometerStart.Text := prevTravelSheet.speedometerFinal.DecimalString;
            frmENTravelSheetEdit.DisableControls([frmENTravelSheetEdit.edtSpeedometerStart]);


          end;
          }

          ENTravelSheetObj.workModeRef := ENTravelWorkModeRef.Create;
          ENTravelSheetObj.workModeRef.code := prevTravelSheet.workModeRef.code;
          frmENTravelSheetEdit.cbENTravelWorkMode.ItemIndex := ENTravelSheetObj.workModeRef.code - 1;

        end;
      end;

      if oldTravelSheet.finWorker <> nil then
      begin
        ENTravelSheetObj.finWorker := FINWorker.Create;
        ENTravelSheetObj.finWorker.code :=  LOW_INT;
        ENTravelSheetObj.finWorker.name := oldTravelSheet.finWorker.name ;
        ENTravelSheetObj.finWorker.tabNumber := oldTravelSheet.finWorker.tabNumber ;
        ENTravelSheetObj.finWorker.positionName := oldTravelSheet.finWorker.positionName ;
        ENTravelSheetObj.finWorker.positionCode := oldTravelSheet.finWorker.positionCode ;
        ENTravelSheetObj.finWorker.departmentName := oldTravelSheet.finWorker.departmentName ;
        ENTravelSheetObj.finWorker.departmentCode := oldTravelSheet.finWorker.departmentCode ;
        ENTravelSheetObj.finWorker.categor := oldTravelSheet.finWorker.categor ;
        ENTravelSheetObj.finWorker.finCode := oldTravelSheet.finWorker.finCode ;
        ENTravelSheetObj.finWorker.isSentAssignment := oldTravelSheet.finWorker.isSentAssignment ;
        ENTravelSheetObj.finWorker.kindRef :=  FINWorkerKindRef.Create;
        ENTravelSheetObj.finWorker.kindRef.code := oldTravelSheet.finWorker.kindRef.code ;
        ENTravelSheetObj.finWorker.priceGen := TXSDecimal.Create;
        ENTravelSheetObj.finWorker.priceGen.DecimalString := oldTravelSheet.finWorker.priceGen.DecimalString ;
        frmENTravelSheetEdit.edtFINWorkerFinWorkerName.Text := oldTravelSheet.finWorker.name;

        // номер прав ...
        frmENTravelSheetEdit.edtDriverSertificateNumber.Text := frmENTravelSheetEdit.getDriverSertificateNumber(ENTravelSheetObj.finWorker.tabNumber);
        frmENTravelSheetEdit.DisableControls([frmENTravelSheetEdit.edtDriverSertificateNumber], frmENTravelSheetEdit.edtDriverSertificateNumber.Text <> '');
      end;

      //frmENTravelSheetEdit.DisableControls([frmENTravelSheetEdit.edtSpeedometerStart], not isLastClosed );

      //frmENTravelSheetEdit.isLastClosed := isLastClosed;

      if frmENTravelSheetEdit.ShowModal = mrOk then
      begin
        if ENTravelSheetObj<>nil then
            //TempENTravelSheet.add(ENTravelSheetObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTravelSheetEdit.Free;
      frmENTravelSheetEdit:=nil;
    end;
  finally
    ENTravelSheetObj.Free;
  end;
end;

end.