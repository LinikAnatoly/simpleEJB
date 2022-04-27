
unit ShowENConnectionTariff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENConnectionTariffController, AdvObj ;


type
  TfrmENConnectionTariffShow = class(TChildForm)  
  HTTPRIOENConnectionTariff: THTTPRIO;
    ImageList1: TImageList;
    sgENConnectionTariff: TAdvStringGrid;
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
procedure sgENConnectionTariffTopLeftChanged(Sender: TObject);
procedure sgENConnectionTariffDblClick(Sender: TObject);
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

  dateTY : TXSDate;
  tyServicesPower : Double;
  procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENConnectionTariffShow : TfrmENConnectionTariffShow;
 // ENConnectionTariffObj: ENConnectionTariff;
 // ENConnectionTariffFilterObj: ENConnectionTariffFilter;
  
  
implementation

uses Main, EditENConnectionTariff, EditENConnectionTariffFilter, DateUtils,
  ENConnectionLevelController, ENConsts;


{$R *.dfm}

var
  //frmENConnectionTariffShow : TfrmENConnectionTariffShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConnectionTariffHeaders: array [1..13] of String =
        ( 'Код'
          ,'Назва'
          ,'Ставка (тис. грн/1 кВт) без ПДВ'
          ,'Тип ставки'
          ,'Ступінь ставки'
          ,'Категорія надійності'
          ,'Ступінь напруги в точці приєднання'
          ,'Фазність приєднання'
          ,'Тип лінії приєднання'
          ,'Тип електроустановки'
          ,'Розташування точки приєднання'
          ,'Підрозділ'
          ,'Дата тарифу'
        );
   

procedure TfrmENConnectionTariffShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENConnectionTariffShow:=nil;
    inherited;
  end;


procedure TfrmENConnectionTariffShow.FormShow(Sender: TObject);
var
  TempENConnectionTariff: ENConnectionTariffControllerSoapPort;
  i: Integer;
  ENConnectionTariffList: ENConnectionTariffShortList;
begin
  SetGridHeaders(ENConnectionTariffHeaders, sgENConnectionTariff.ColumnHeaders);
  ColCount:=100;
  TempENConnectionTariff :=  HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENConnectionTariffFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  if (tyServicesPower <> 0) then
  begin
    if (tyServicesPower <= STANDART_CONNECTIONS_POWER_16) then
    begin
      if ENConnectionTariffFilter(FilterObject).levelRef = nil
        then ENConnectionTariffFilter(FilterObject).levelRef := ENConnectionLevelRef.Create;
      ENConnectionTariffFilter(FilterObject).levelRef.code := ENCONNECTIONLEVEL_FIRST;
    end;

    if (tyServicesPower > STANDART_CONNECTIONS_POWER_16) and (tyServicesPower <= STANDART_CONNECTIONS_POWER_50) then
    begin
      if ENConnectionTariffFilter(FilterObject).levelRef = nil
        then ENConnectionTariffFilter(FilterObject).levelRef := ENConnectionLevelRef.Create;
      ENConnectionTariffFilter(FilterObject).levelRef.code := ENCONNECTIONLEVEL_SECOND;
    end;
  end;

  if (dateTY = nil) then
  begin
    dateTY := TXSDate.Create;
    dateTY.XSToNative(GetXSDate(EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now))));
  end;

  ENConnectionTariffList := TempENConnectionTariff.getScrollableFilteredList(
  ENConnectionTariffFilter(FilterObject), 0, ColCount, dateTY);

  LastCount:=High(ENConnectionTariffList.list);

  if LastCount > -1 then
     sgENConnectionTariff.RowCount:=LastCount+2
  else
     sgENConnectionTariff.RowCount:=2;

   with sgENConnectionTariff do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionTariffList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConnectionTariffList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConnectionTariffList.list[i].name;

        if ENConnectionTariffList.list[i].value = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENConnectionTariffList.list[i].value.DecimalString;

        Cells[3,i+1] := ENConnectionTariffList.list[i].tarifTypeRefName;
        Cells[4,i+1] := ENConnectionTariffList.list[i].levelRefName;
        Cells[5,i+1] := ENConnectionTariffList.list[i].categoryRefName;
        Cells[6,i+1] := ENConnectionTariffList.list[i].powerPointRefName;
        Cells[7,i+1] := ENConnectionTariffList.list[i].phasityRefName;
        Cells[8,i+1] := ENConnectionTariffList.list[i].lineTypeRefName;
        Cells[9,i+1] := ENConnectionTariffList.list[i].installationTypeRefName;
        Cells[10,i+1] := ENConnectionTariffList.list[i].locationTypeRefName;
        Cells[11,i+1] := ENConnectionTariffList.list[i].departmentRefShortName;

        if ENConnectionTariffList.list[i].startDate = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(ENConnectionTariffList.list[i].startDate);

        LastRow:=i+1;
        sgENConnectionTariff.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENConnectionTariff.Row:=1;
end;

procedure TfrmENConnectionTariffShow.sgENConnectionTariffTopLeftChanged(Sender: TObject);
var
  TempENConnectionTariff: ENConnectionTariffControllerSoapPort;
  i,CurrentRow: Integer;
  ENConnectionTariffList: ENConnectionTariffShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConnectionTariff.TopRow + sgENConnectionTariff.VisibleRowCount) = ColCount
  then
    begin
      TempENConnectionTariff :=  HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
      CurrentRow:=sgENConnectionTariff.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConnectionTariffFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConnectionTariffList := TempENConnectionTariff.getScrollableFilteredList(
    ENConnectionTariffFilter(FilterObject),ColCount-1, 100, dateTY);

  sgENConnectionTariff.RowCount:=sgENConnectionTariff.RowCount+100;
  LastCount:=High(ENConnectionTariffList.list);
  with sgENConnectionTariff do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConnectionTariffList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConnectionTariffList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConnectionTariffList.list[i].name;

        if ENConnectionTariffList.list[i].value = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENConnectionTariffList.list[i].value.DecimalString;

        Cells[3,i+CurrentRow] := ENConnectionTariffList.list[i].tarifTypeRefName;
        Cells[4,i+CurrentRow] := ENConnectionTariffList.list[i].levelRefName;
        Cells[5,i+CurrentRow] := ENConnectionTariffList.list[i].categoryRefName;
        Cells[6,i+CurrentRow] := ENConnectionTariffList.list[i].powerPointRefName;
        Cells[7,i+CurrentRow] := ENConnectionTariffList.list[i].phasityRefName;
        Cells[8,i+CurrentRow] := ENConnectionTariffList.list[i].lineTypeRefName;
        Cells[9,i+CurrentRow] := ENConnectionTariffList.list[i].installationTypeRefName;
        Cells[10,i+CurrentRow] := ENConnectionTariffList.list[i].locationTypeRefName;
        Cells[11,i+CurrentRow] := ENConnectionTariffList.list[i].departmentRefShortName;

        if ENConnectionTariffList.list[i].startDate = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := XSDate2String(ENConnectionTariffList.list[i].startDate);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConnectionTariff.Row:=CurrentRow-5;
   sgENConnectionTariff.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConnectionTariffShow.sgENConnectionTariffDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConnectionTariff,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENConnectionTariffShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENConnectionTariff.RowCount-1 do
   for j:=0 to sgENConnectionTariff.ColCount-1 do
     sgENConnectionTariff.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENConnectionTariffShow.actViewExecute(Sender: TObject);
Var TempENConnectionTariff: ENConnectionTariffControllerSoapPort;
begin
 TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
   try
     ENConnectionTariffObj := TempENConnectionTariff.getObject(StrToInt(sgENConnectionTariff.Cells[0,sgENConnectionTariff.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionTariffEdit:=TfrmENConnectionTariffEdit.Create(Application, dsView);
  try
    frmENConnectionTariffEdit.ShowModal;
  finally
    frmENConnectionTariffEdit.Free;
    frmENConnectionTariffEdit:=nil;
  end;
end;

procedure TfrmENConnectionTariffShow.actEditExecute(Sender: TObject);
Var TempENConnectionTariff: ENConnectionTariffControllerSoapPort;
begin
 TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
   try
     ENConnectionTariffObj := TempENConnectionTariff.getObject(StrToInt(sgENConnectionTariff.Cells[0,sgENConnectionTariff.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConnectionTariffEdit:=TfrmENConnectionTariffEdit.Create(Application, dsEdit);
  try
    if frmENConnectionTariffEdit.ShowModal= mrOk then
      begin
        //TempENConnectionTariff.save(ENConnectionTariffObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConnectionTariffEdit.Free;
    frmENConnectionTariffEdit:=nil;
  end;

end;

procedure TfrmENConnectionTariffShow.actDeleteExecute(Sender: TObject);
Var TempENConnectionTariff: ENConnectionTariffControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConnectionTariff.Cells[0,sgENConnectionTariff.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ставки плати за стандартне приєднання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConnectionTariff.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConnectionTariffShow.actInsertExecute(Sender: TObject);
// Var TempENConnectionTariff: ENConnectionTariffControllerSoapPort; 
begin
  // TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENConnectionTariffObj:=ENConnectionTariff.Create;

  try
    frmENConnectionTariffEdit:=TfrmENConnectionTariffEdit.Create(Application, dsInsert);
    try
      if frmENConnectionTariffEdit.ShowModal = mrOk then
      begin
        if ENConnectionTariffObj<>nil then
            //TempENConnectionTariff.add(ENConnectionTariffObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConnectionTariffEdit.Free;
      frmENConnectionTariffEdit:=nil;
    end;
  finally
    ENConnectionTariffObj.Free;
  end;
end;

procedure TfrmENConnectionTariffShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENConnectionTariffShow.actFilterExecute(Sender: TObject);
begin
frmENConnectionTariffFilterEdit:=TfrmENConnectionTariffFilterEdit.Create(Application, dsInsert);
  try
    ENConnectionTariffFilterObj := ENConnectionTariffFilter.Create;
    SetNullIntProps(ENConnectionTariffFilterObj);
    SetNullXSProps(ENConnectionTariffFilterObj);

    if frmENConnectionTariffFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENConnectionTariffFilter.Create;
      FilterObject := ENConnectionTariffFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConnectionTariffFilterEdit.Free;
    frmENConnectionTariffFilterEdit:=nil;
  end;
end;

procedure TfrmENConnectionTariffShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.