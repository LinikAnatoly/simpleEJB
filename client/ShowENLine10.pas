
unit ShowENLine10;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
    ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
    DialogFormUnit, DlgUnit, GridHeadersUnit,
    EnergyProController, EnergyProController2,
    ENLine10Controller, AdvObj ;


type
    TfrmENLine10Show = class(TChildForm)
    ImageList1: TImageList;
    sgENLine10: TAdvStringGrid;
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
    HTTPRIOENLine10: THTTPRIO;
    tbSchemeList: TToolButton;
    actSchemeList: TAction;
    actExpExcel: TAction;
    N5: TMenuItem;
    N9: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENLine10TopLeftChanged(Sender: TObject);
    procedure sgENLine10DblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actSchemeListExecute(Sender: TObject);
    procedure sgENLine10MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure actExpExcelExecute(Sender: TObject);
  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENLine10Show : TfrmENLine10Show;
 // ENLine10Obj: ENLine10;
 // ENLine10FilterObj: ENLine10Filter;
  
var Code10: Integer;
  Invnumber10, Name10, Buhname10, Linelength10,
  Yearbuild10, Yearworkingstart10, Lastrepairdate10,
  VoltageNominal10, NameProject10, NameBuilder10: String;
  Belonging10, Owner10: Integer;
    
implementation

uses Main, EditENLine10, EditENLine10Filter, ENElementController,
  ShowENScheme, ENSchemeController, DMReportsUnit;

{$R *.dfm}

var
  //frmENLine10Show : TfrmENLine10Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLine10Headers: array [1..9] of String =
        ( 'Код'
          ,'Інвентарній номер'
          ,'Найменування лінії 6-10 кВ'
          ,'Підрозділ'
          ,'Бухгалтерське найменування лінії 6-10'
          ,'Будівельна довжина лінії, км'
          ,'Рік будівництва'
          ,'Рік введення у роботу'
          ,'Дата останнього кап. ремонту'
        );
   

procedure TfrmENLine10Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLine10Show:=nil;
    inherited;
  end;


procedure TfrmENLine10Show.FormShow(Sender: TObject);
var
  TempENLine10: ENLine10ControllerSoapPort;
  i: Integer;
  ENLine10List: ENLine10ShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENLine10Headers, sgENLine10.ColumnHeaders);
  ColCount:=100;
  TempENLine10 :=  HTTPRIOENLine10 as ENLine10ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLine10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine10List := TempENLine10.getScrollableFilteredList(ENLine10Filter(FilterObject),0,ColCount);


  LastCount:=High(ENLine10List.list);

  if LastCount > -1 then
     sgENLine10.RowCount:=LastCount+2
  else
     sgENLine10.RowCount:=2;

   with sgENLine10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine10List.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENLine10List.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENLine10List.list[i].invNumber;
        Cells[2,i+1] := ENLine10List.list[i].name;
        Cells[3,i+1] := ENLine10List.list[i].renRefName;
        Cells[4,i+1] := ENLine10List.list[i].buhName;
        if ENLine10List.list[i].lineLength = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENLine10List.list[i].lineLength.DecimalString;
        if ENLine10List.list[i].yearBuild = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENLine10List.list[i].yearBuild);
        if ENLine10List.list[i].yearWorkingStart = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENLine10List.list[i].yearWorkingStart);
        if ENLine10List.list[i].lastRepairDate = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENLine10List.list[i].lastRepairDate);
        LastRow:=i+1;
        sgENLine10.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLine10.Row:=1;
end;

procedure TfrmENLine10Show.sgENLine10TopLeftChanged(Sender: TObject);
var
  TempENLine10: ENLine10ControllerSoapPort;
  i,CurrentRow: Integer;
  ENLine10List: ENLine10ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLine10.TopRow + sgENLine10.VisibleRowCount) = ColCount
  then
    begin
      TempENLine10 :=  HTTPRIOENLine10 as ENLine10ControllerSoapPort;
      CurrentRow:=sgENLine10.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLine10Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine10List := TempENLine10.getScrollableFilteredList(ENLine10Filter(FilterObject),ColCount-1, 100);



  sgENLine10.RowCount:=sgENLine10.RowCount+100;
  LastCount:=High(ENLine10List.list);
  with sgENLine10 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine10List.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENLine10List.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLine10List.list[i].invNumber;
        Cells[2,i+CurrentRow] := ENLine10List.list[i].name;
        Cells[3,i+CurrentRow] := ENLine10List.list[i].renRefName;
        Cells[4,i+CurrentRow] := ENLine10List.list[i].buhName;
        if ENLine10List.list[i].lineLength = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENLine10List.list[i].lineLength.DecimalString;
        if ENLine10List.list[i].yearBuild = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENLine10List.list[i].yearBuild);
        if ENLine10List.list[i].yearWorkingStart = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENLine10List.list[i].yearWorkingStart);
        if ENLine10List.list[i].lastRepairDate = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENLine10List.list[i].lastRepairDate);

        LastRow:=i+CurrentRow;
      end;
      

   ColCount:=ColCount+100;
   sgENLine10.Row:=CurrentRow-5;
   sgENLine10.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLine10Show.sgENLine10DblClick(Sender: TObject);
Var TempENLine10: ENLine10ControllerSoapPort;
  ENLine10Obj: ENLine10;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      Code10 := StrToInt(GetReturnValue(sgENLine10, 0)); //Код
      Invnumber10 := sgENLine10.Cells[1, sgENLine10.Row]; //Інвентарний номер
      Name10 := sgENLine10.Cells[2, sgENLine10.Row]; //Найменування лінії 6-10 кВ
      Buhname10 := sgENLine10.Cells[4, sgENLine10.Row]; //Бухгалтерське найменування лінії 6-10
      Linelength10 := sgENLine10.Cells[5, sgENLine10.Row]; //Будівельна довжина лінії, км
      Yearbuild10 := sgENLine10.Cells[6, sgENLine10.Row]; //Рік будівництва
      Yearworkingstart10 := sgENLine10.Cells[7, sgENLine10.Row]; //Рік введення у роботу
      Lastrepairdate10 := sgENLine10.Cells[8, sgENLine10.Row]; //Дата останнього кап. ремонту
      //
      TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
      ENLine10Obj := TempENLine10.getObject(StrToInt(sgENLine10.Cells[0, sgENLine10.Row]));
      VoltageNominal10 := ENLine10Obj.voltagenominal.value.DecimalString;
      NameProject10 := ENLine10Obj.nameProject;
      NameBuilder10 := ENLine10Obj.nameBuilder;
      Belonging10 := ENLine10Obj.belongingRef.code;
      Owner10 := ENLine10Obj.ownerRef.code;
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLine10Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLine10.RowCount-1 do
   for j:=0 to sgENLine10.ColCount-1 do
     sgENLine10.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLine10Show.actViewExecute(Sender: TObject);
Var TempENLine10: ENLine10ControllerSoapPort;
begin
 TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
   try
     ENLine10Obj := TempENLine10.getObject(StrToInt(sgENLine10.Cells[0,sgENLine10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine10Edit:=TfrmENLine10Edit.Create(Application, dsView);
  try
    frmENLine10Edit.ShowModal;
  finally
    frmENLine10Edit.Free;
    frmENLine10Edit:=nil;
  end;
end;

procedure TfrmENLine10Show.actEditExecute(Sender: TObject);
Var TempENLine10: ENLine10ControllerSoapPort;
begin
 TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
   try
     ENLine10Obj := TempENLine10.getObject(StrToInt(sgENLine10.Cells[0,sgENLine10.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine10Edit:=TfrmENLine10Edit.Create(Application, dsEdit);
  try
    if frmENLine10Edit.ShowModal= mrOk then
      begin
        //TempENLine10.save(ENLine10Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLine10Edit.Free;
    frmENLine10Edit:=nil;
  end;
end;


procedure TfrmENLine10Show.actExpExcelExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку... '+#10#13+' Зберегти в Ексель?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgENLine10, 'Список_ліній_6-10_');
  end;
end;


procedure TfrmENLine10Show.actDeleteExecute(Sender: TObject);
Var TempENLine10: ENLine10ControllerSoapPort; ObjCode: Integer;
begin
  TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
  try
    ObjCode := StrToInt(sgENLine10.Cells[0,sgENLine10.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Ви дійсно бажаєте видалити Повітряну Лінія 6 - 10 кВ?'),
    PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENLine10.remove(ObjCode);
      UpdateGrid(Sender);
    end;
end;

procedure TfrmENLine10Show.actInsertExecute(Sender: TObject);
Var TempENLine10: ENLine10ControllerSoapPort;
begin
  TempENLine10 := HTTPRIOENLine10 as ENLine10ControllerSoapPort;
  ENLine10Obj:=ENLine10.Create;
  ENLine10Obj.element := ENElement.Create();
  
  //ENLine10Obj.dateGen:= TXSDate.Create;


  try
    frmENLine10Edit:=TfrmENLine10Edit.Create(Application, dsInsert);
    try
      if frmENLine10Edit.ShowModal = mrOk then
      begin
        if ENLine10Obj<>nil then
            //TempENLine10.add(ENLine10Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLine10Edit.Free;
      frmENLine10Edit:=nil;
    end;
  finally
    ENLine10Obj.Free;
  end;
end;

procedure TfrmENLine10Show.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLine10Show.actFilterExecute(Sender: TObject);
begin
  frmENLine10FilterEdit:=TfrmENLine10FilterEdit.Create(Application, dsInsert);
  try
    ENLine10FilterObj := ENLine10Filter.Create;
    SetNullIntProps(ENLine10FilterObj);
    SetNullXSProps(ENLine10FilterObj);

    if frmENLine10FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLine10Filter.Create;
      FilterObject := ENLine10FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLine10FilterEdit.Free;
    frmENLine10FilterEdit:=nil;
  end;
end;

procedure TfrmENLine10Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENLine10Show.actSchemeListExecute(Sender: TObject);
Var TempENLine10: ENLine10ControllerSoapPort;
  ENLine10Obj: ENLine10;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENLine10 := HTTPRIOENLine10 as
    ENLine10ControllerSoapPort;
  try
    ENLine10Obj := TempENLine10.getObject(StrToInt(
      sgENLine10.Cells[0,sgENLine10.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := ENLine10Obj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

procedure TfrmENLine10Show.sgENLine10MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crArrow;
end;

end.