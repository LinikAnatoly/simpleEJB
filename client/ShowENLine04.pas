
unit ShowENLine04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLine04Controller, AdvObj;


type
  TfrmENLine04Show = class(TChildForm)  
  HTTPRIOENLine04: THTTPRIO;
    ilENLine04: TImageList;
    sgENLine04: TAdvStringGrid;
    actnLstENLine04: TActionList;
    actView: TAction;
    actENLine04Insert: TAction;
    actENLine04Delete: TAction;
    actENLine04Edit: TAction;
    actENLine04Update: TAction;
    actENLine04Filter: TAction;
    actENLine04NoFilter: TAction;
    pmENLine04: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    tlBrENline04: TToolBar;
    tlBtnENLine04View: TToolButton;
    tlBtnENLine04Insert: TToolButton;
    tlBtnENLine04Delete: TToolButton;
    tlBtnENLine04Edit: TToolButton;
    tlBtnENLine04Update: TToolButton;
    tlBtnENLine04Filter: TToolButton;
    tlBtnENLine04NoFilter: TToolButton;
    actENLine04SchemeList: TAction;
    tlBtnENLine04SchemeList: TToolButton;
    actExpExcel: TAction;
    N5: TMenuItem;
    N9: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENLine04TopLeftChanged(Sender: TObject);
    procedure sgENLine04DblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actENLine04EditExecute(Sender: TObject);
    procedure actENLine04DeleteExecute(Sender: TObject);
    procedure actENLine04InsertExecute(Sender: TObject);
    procedure actENLine04UpdateExecute(Sender: TObject);
    procedure actENLine04FilterExecute(Sender: TObject);
    procedure actENLine04NoFilterExecute(Sender: TObject);
    procedure actENLine04SchemeListExecute(Sender: TObject);
    procedure sgENLine04MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure actExpExcelExecute(Sender: TObject);

    private
      { Private declarations }
    public
      { Public declarations }
    procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENLine04Show : TfrmENLine04Show;
 // ENLine04Obj: ENLine04;
 // ENLine04FilterObj: ENLine04Filter;
  
var Code04: Integer;
  Invnumber04, Name04, Buhname04, Linelength04,
  Yearbuild04, Yearworkingstart04, Lastrepairdate04,
  NameProject04, NameBuilder04: String;
  Belonging04, Owner04: Integer;
    
implementation

uses Main, EditENLine04, EditENLine04Filter, ENElementController,
  ShowENScheme, ENSchemeController, DMReportsUnit;

{$R *.dfm}

var
  //frmENLine04Show : TfrmENLine04Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLine04Headers: array [1..9] of String =
        ( 'Код'
          ,'Інвентарній номер'
          ,'Найменування лінії 0.4'
          ,'Підрозділ'
          ,'Бухгалтерське найменування лінії 0.4'
          ,'Будівельна довжина лінії, км'
          ,'Рік будівництва'
          ,'Рік введення у роботу'
          ,'Дата останнього кап. ремонту'
        );
   

procedure TfrmENLine04Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLine04Show:=nil;
    inherited;
  end;


procedure TfrmENLine04Show.FormShow(Sender: TObject);
var
  TempENLine04: ENLine04ControllerSoapPort;
  i: Integer;
  ENLine04List: ENLine04ShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENLine04Headers, sgENLine04.ColumnHeaders);
  ColCount:=100;
  TempENLine04 :=  HTTPRIOENLine04 as ENLine04ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLine04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine04List := TempENLine04.getScrollableFilteredList(ENLine04Filter(FilterObject),0,ColCount);


  LastCount:=High(ENLine04List.list);

  if LastCount > -1 then
     sgENLine04.RowCount:=LastCount+2
  else
     sgENLine04.RowCount:=2;

   with sgENLine04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine04List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLine04List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLine04List.list[i].invNumber;
        Cells[2,i+1] := ENLine04List.list[i].name;
        Cells[3,i+1] := ENLine04List.list[i].renRefName;
        Cells[4,i+1] := ENLine04List.list[i].buhName;
        if ENLine04List.list[i].lineLength = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENLine04List.list[i].lineLength.DecimalString;
        if ENLine04List.list[i].yearBuild = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENLine04List.list[i].yearBuild);
        if ENLine04List.list[i].yearWorkingStart = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENLine04List.list[i].yearWorkingStart);
        if ENLine04List.list[i].lastRepairDate = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENLine04List.list[i].lastRepairDate);
        LastRow:=i+1;
        sgENLine04.RowCount:=LastRow+1;
        if Cells[0, LastRow] = Cells[0, i] then //Избежание повтора Воздушных Линий 0,4 кВ, для которых
          sgENLine04.RowHeights[LastRow] := 0;  //было создано несколько Присоединений к ТП 6 - 10 / 0,4 кВ
      end;
   ColCount:=ColCount+1;
   sgENLine04.Row:=1;
end;

procedure TfrmENLine04Show.sgENLine04TopLeftChanged(Sender: TObject);
var
  TempENLine04: ENLine04ControllerSoapPort;
  i,CurrentRow: Integer;
  ENLine04List: ENLine04ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLine04.TopRow + sgENLine04.VisibleRowCount) = ColCount
  then
    begin
      TempENLine04 :=  HTTPRIOENLine04 as ENLine04ControllerSoapPort;
      CurrentRow:=sgENLine04.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLine04Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine04List := TempENLine04.getScrollableFilteredList(ENLine04Filter(FilterObject),ColCount-1, 100);



  sgENLine04.RowCount:=sgENLine04.RowCount+100;
  LastCount:=High(ENLine04List.list);
  with sgENLine04 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine04List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLine04List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLine04List.list[i].invNumber;
        Cells[2,i+CurrentRow] := ENLine04List.list[i].name;
        Cells[3,i+CurrentRow] := ENLine04List.list[i].renRefName;
        Cells[4,i+CurrentRow] := ENLine04List.list[i].buhName;
        if ENLine04List.list[i].lineLength = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENLine04List.list[i].lineLength.DecimalString;
        if ENLine04List.list[i].yearBuild = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENLine04List.list[i].yearBuild);
        if ENLine04List.list[i].yearWorkingStart = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENLine04List.list[i].yearWorkingStart);
        if ENLine04List.list[i].lastRepairDate = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENLine04List.list[i].lastRepairDate);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLine04.Row:=CurrentRow-5;
   sgENLine04.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLine04Show.sgENLine04DblClick(Sender: TObject);
Var TempENLine04: ENLine04ControllerSoapPort;
  ENLine04Obj: ENLine04;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      Code04 := StrToInt(GetReturnValue(sgENLine04,0)); //Код
      Invnumber04 := sgENLine04.Cells[1, sgENLine04.Row]; //Інвентарний номер
      Name04 := sgENLine04.Cells[2, sgENLine04.Row]; //Найменування лінії 0.4
      Buhname04 := sgENLine04.Cells[4, sgENLine04.Row]; //Бухгалтерське найменування лінії 0.4
      Linelength04 := sgENLine04.Cells[5, sgENLine04.Row]; //Будівельна довжина лінії, км
      Yearbuild04 := sgENLine04.Cells[6, sgENLine04.Row]; //Рік будівництва
      Yearworkingstart04 := sgENLine04.Cells[7, sgENLine04.Row]; //Рік введення у роботу
      Lastrepairdate04 := sgENLine04.Cells[8, sgENLine04.Row]; //Дата останнього кап. ремонту

      //Закомментированный ниже фрагмент кода требует поддержки большого количества модулей
      //EnergyPro и EnergyNet. Синхронизация проектов остаётся актуальной задачей...
      (*TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
      ENLine04Obj := TempENLine04.getObject(StrToInt(sgENLine04.Cells[0,sgENLine04.Row]));
      NameProject04 := ENLine04Obj.nameProject;
      NameBuilder04 := ENLine04Obj.nameBuilder;
      Belonging04 := ENLine04Obj.belongingRef.code;
      Owner04 := ENLine04Obj.ownerRef.code;*)
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLine04Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLine04.RowCount-1 do
   for j:=0 to sgENLine04.ColCount-1 do
     sgENLine04.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLine04Show.actViewExecute(Sender: TObject);
Var TempENLine04: ENLine04ControllerSoapPort;
begin
 TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
   try
     ENLine04Obj := TempENLine04.getObject(StrToInt(sgENLine04.Cells[0,sgENLine04.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine04Edit:=TfrmENLine04Edit.Create(Application, dsView);
  try
    frmENLine04Edit.ShowModal;
  finally
    frmENLine04Edit.Free;
    frmENLine04Edit:=nil;
  end;
end;

procedure TfrmENLine04Show.actENLine04EditExecute(Sender: TObject);
Var TempENLine04: ENLine04ControllerSoapPort;
begin
 TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
   try
     ENLine04Obj := TempENLine04.getObject(StrToInt(sgENLine04.Cells[0,sgENLine04.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine04Edit:=TfrmENLine04Edit.Create(Application, dsEdit);
  try
    if frmENLine04Edit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLine04Edit.Free;
    frmENLine04Edit:=nil;
  end;
end;

procedure TfrmENLine04Show.actENLine04DeleteExecute(Sender: TObject);
Var TempENLine04: ENLine04ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLine04.Cells[0,sgENLine04.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Повітряна лінія 0.4) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLine04.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLine04Show.actENLine04InsertExecute(Sender: TObject);
Var TempENLine04: ENLine04ControllerSoapPort;
begin
  TempENLine04 := HTTPRIOENLine04 as ENLine04ControllerSoapPort;
  ENLine04Obj:=ENLine04.Create;
  ENLine04Obj.element := ENElement.Create();
  ENLine04Obj.dateGen:= TXSDate.Create;


  try
    frmENLine04Edit:=TfrmENLine04Edit.Create(Application, dsInsert);
    try
      if frmENLine04Edit.ShowModal = mrOk then
      begin
        if ENLine04Obj<>nil then
            //TempENLine04.add(ENLine04Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLine04Edit.Free;
      frmENLine04Edit:=nil;
    end;
  finally
    ENLine04Obj.Free;
  end;
end;


procedure TfrmENLine04Show.actENLine04UpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENLine04Show.actExpExcelExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку... '+#10#13+' Зберегти в Ексель?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgENLine04, 'Список_ліній_04_');
  end;
end;


procedure TfrmENLine04Show.actENLine04FilterExecute(Sender: TObject);
begin
  frmENLine04FilterEdit:=TfrmENLine04FilterEdit.Create(Application, dsInsert);
  try
    ENLine04FilterObj := ENLine04Filter.Create;
    SetNullIntProps(ENLine04FilterObj);
    SetNullXSProps(ENLine04FilterObj);

    if frmENLine04FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLine04Filter.Create;
      FilterObject := ENLine04FilterObj;
      actENLine04UpdateExecute(Sender);
    end;
  finally
    frmENLine04FilterEdit.Free;
    frmENLine04FilterEdit:=nil;
  end;
end;

procedure TfrmENLine04Show.actENLine04NoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENLine04Show.actENLine04SchemeListExecute(Sender: TObject);
Var TempENLine04: ENLine04ControllerSoapPort;
  ENLine04Obj: ENLine04;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENLine04 := HTTPRIOENLine04 as
    ENLine04ControllerSoapPort;
  try
    ENLine04Obj := TempENLine04.getObject(StrToInt(
      sgENLine04.Cells[0,sgENLine04.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := ENLine04Obj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

procedure TfrmENLine04Show.sgENLine04MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crArrow;
end;

end.