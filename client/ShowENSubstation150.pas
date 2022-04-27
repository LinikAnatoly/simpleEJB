unit ShowENSubstation150;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubstation150Controller, AdvObj, StdCtrls ;


type
    TfrmENSubstation150Show = class(TChildForm)
    HTTPRIOENSubstation150: THTTPRIO;
    ImageList1: TImageList;
    sgENSubstation150: TAdvStringGrid;
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
    actSchemeList: TAction;
    tbSchemeList: TToolButton;
    btnOK: TButton;
    chkIsVirtStation: TCheckBox;
    ToolButton4: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENSubstation150TopLeftChanged(Sender: TObject);
    procedure sgENSubstation150DblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actSchemeListExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENSubstation150Obj: ENSubstation150;
 // ENSubstation150FilterObj: ENSubstation150Filter;

var
  frmENSubstation150Show : TfrmENSubstation150Show;
  CodeS150: Integer;
  NameS150, BuhnameS150, InvnumberS150,
  OperativeService, RepairService,
  NominalpowerS150, VoltageNominalS150,
  Kruserial, Battery, Operativeiconst, Operativeivar: String;
  isVirtStation: Boolean = False;



implementation

uses Main, EditENSubstation150, EditENSubstation150Filter,
  ENElementController, ShowENScheme, ENSchemeController, Globals, ENConsts,
  DataModuleReportsENetObject;


{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubstation150Headers: array [1..9] of String =
        ( 'Код'
          ,'Назва підстанції 35-150/6-10-35'
          ,'Проектна потужність, мВА'
          ,'Форма оперативного обслуговування'
          ,'Форма ремонтного обслуговування'
          ,'Бухгалтерське найменування підстанції '
          ,'Інвентарний номер споруди підстанції'
          ,'Кількість трансформаторів'
          ,'Коефіцієнт важливості та категорійності'
        );
   

procedure TfrmENSubstation150Show.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSubstation150Show := nil;
  inherited;
end;


procedure TfrmENSubstation150Show.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSubstation150Show.FormShow(Sender: TObject);
var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  i: Integer;
  ENSubstation150List: ENSubstation150ShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENSubstation150Headers, sgENSubstation150.ColumnHeaders);
  ColCount:=100;
  TempENSubstation150 :=  HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSubstation150Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSubstation150List := TempENSubstation150.getScrollableFilteredList(ENSubstation150Filter(FilterObject),0,ColCount);
  LastCount:=High(ENSubstation150List.list);

  if LastCount > -1 then
     sgENSubstation150.RowCount:=LastCount+2
  else
     sgENSubstation150.RowCount:=2;

   with sgENSubstation150 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation150List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSubstation150List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSubstation150List.list[i].name;
        if ENSubstation150List.list[i].projectPower = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENSubstation150List.list[i].projectPower.DecimalString;

        Cells[3,i+1] := ENSubstation150List.list[i].operativeService;
        Cells[4,i+1] := ENSubstation150List.list[i].repairService;
        Cells[5,i+1] := ENSubstation150List.list[i].buhName;
        Cells[6,i+1] := ENSubstation150List.list[i].invNumber;

        if ENSubstation150List.list[i].transformerCnt = Low(Integer) then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := IntToStr(ENSubstation150List.list[i].transformerCnt);

        if ENSubstation150List.list[i].coeffCategory = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENSubstation150List.list[i].coeffCategory.DecimalString;

        LastRow:=i+1;
        sgENSubstation150.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSubstation150.Row:=1;
end;


procedure TfrmENSubstation150Show.sgENSubstation150TopLeftChanged(Sender: TObject);
var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubstation150List: ENSubstation150ShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENSubstation150.TopRow + sgENSubstation150.VisibleRowCount) = ColCount
  then
  begin
    TempENSubstation150 :=  HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
    CurrentRow := sgENSubstation150.RowCount;

    if FilterObject = nil then
    begin
      FilterObject := ENSubstation150Filter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

    ENSubstation150List := TempENSubstation150.getScrollableFilteredList(ENSubstation150Filter(FilterObject),ColCount-1, 100);
    sgENSubstation150.RowCount:=sgENSubstation150.RowCount+100;
    LastCount:=High(ENSubstation150List.list);

    with sgENSubstation150 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubstation150List.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENSubstation150List.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENSubstation150List.list[i].name;

        if ENSubstation150List.list[i].projectPower = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENSubstation150List.list[i].projectPower.DecimalString;

        Cells[3,i+CurrentRow] := ENSubstation150List.list[i].operativeService;
        Cells[4,i+CurrentRow] := ENSubstation150List.list[i].repairService;
        Cells[5,i+CurrentRow] := ENSubstation150List.list[i].buhName;
        Cells[6,i+CurrentRow] := ENSubstation150List.list[i].invNumber;

        if ENSubstation150List.list[i].transformerCnt = Low(Integer) then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := IntToStr(ENSubstation150List.list[i].transformerCnt);

        if ENSubstation150List.list[i].coeffCategory = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENSubstation150List.list[i].coeffCategory.DecimalString;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSubstation150.Row:=CurrentRow-5;
   sgENSubstation150.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENSubstation150Show.sgENSubstation150DblClick(Sender: TObject);
var
  temp: Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSubstation150, 0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSubstation150Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubstation150.RowCount-1 do
   for j:=0 to sgENSubstation150.ColCount-1 do
     sgENSubstation150.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSubstation150Show.actViewExecute(Sender: TObject);
Var TempENSubstation150: ENSubstation150ControllerSoapPort;
begin
 TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
   try
     ENSubstation150Obj := TempENSubstation150.getObject(StrToInt(sgENSubstation150.Cells[0,sgENSubstation150.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubstation150Edit:=TfrmENSubstation150Edit.Create(Application, dsView);
  try
    frmENSubstation150Edit.ShowModal;
  finally
    frmENSubstation150Edit.Free;
    frmENSubstation150Edit:=nil;
  end;
end;


procedure TfrmENSubstation150Show.actEditExecute(Sender: TObject);
var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
begin
  TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
  try
    ENSubstation150Obj := TempENSubstation150.getObject(StrToInt(sgENSubstation150.Cells[0,sgENSubstation150.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENSubstation150.Row;

  frmENSubstation150Edit := TfrmENSubstation150Edit.Create(Application, dsEdit);
  try
    if frmENSubstation150Edit.ShowModal= mrOk then
      begin
        //TempENSubstation150.save(ENSubstation150Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubstation150Edit.Free;
    frmENSubstation150Edit:=nil;
  end;

  if sgENSubstation150.RowCount > selectedRow then
    sgENSubstation150.Row := selectedRow
  else
    sgENSubstation150.Row := sgENSubstation150.RowCount - 1;
end;


procedure TfrmENSubstation150Show.actDeleteExecute(Sender: TObject);
var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubstation150.Cells[0,sgENSubstation150.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Трансформаторна підстанція 35-150/6-10-35 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubstation150.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENSubstation150Show.actInsertExecute(Sender: TObject);
var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
begin
  TempENSubstation150 := HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
  ENSubstation150Obj:=ENSubstation150.Create;

   ENSubstation150Obj.projectPower:= TXSDecimal.Create;
   ENSubstation150Obj.operativeIConst:= TXSDecimal.Create;
   ENSubstation150Obj.operativeIVar:= TXSDecimal.Create;
   ENSubstation150Obj.OPUCount:= TXSDecimal.Create;
   ENSubstation150Obj.ZRUCount:= TXSDecimal.Create;
   ENSubstation150Obj.basementTransformersCount:= TXSDecimal.Create;
   ENSubstation150Obj.squareInFence:= TXSDecimal.Create;
   ENSubstation150Obj.waterHole:= TXSDecimal.Create;
   ENSubstation150Obj.waterNet:= TXSDecimal.Create;
   ENSubstation150Obj.canalizationSink:= TXSDecimal.Create;
   ENSubstation150Obj.canalizationLocal:= TXSDecimal.Create;

   ENSubstation150Obj.element := ENElement.Create;

  try
    frmENSubstation150Edit:=TfrmENSubstation150Edit.Create(Application, dsInsert);
    try
      if frmENSubstation150Edit.ShowModal = mrOk then
      begin
        if ENSubstation150Obj<>nil then
            //TempENSubstation150.add(ENSubstation150Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubstation150Edit.Free;
      frmENSubstation150Edit:=nil;
    end;
  finally
    ENSubstation150Obj.Free;
  end;
end;



procedure TfrmENSubstation150Show.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubstation150Show.actFilterExecute(Sender: TObject);
begin
  frmENSubstation150FilterEdit :=
    TfrmENSubstation150FilterEdit.Create(Application, dsEdit);
  try
    frmENSubstation150FilterEdit.edtName.Text :=
      '*' + ShowENSubstation150.NameS150 + '*';
    ENSubstation150FilterObj := ENSubstation150Filter.Create;
    SetNullIntProps(ENSubstation150FilterObj);
    SetNullXSProps(ENSubstation150FilterObj);

    if frmENSubstation150FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubstation150Filter.Create;
      FilterObject := ENSubstation150FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubstation150FilterEdit.Free;
    frmENSubstation150FilterEdit:=nil;
  end;
end;

procedure TfrmENSubstation150Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENSubstation150Show.actSchemeListExecute(Sender: TObject);
Var TempENSubstation150: ENSubstation150ControllerSoapPort;
  ENSubstation150Obj: ENSubstation150;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENSubstation150 := HTTPRIOENSubstation150 as
    ENSubstation150ControllerSoapPort;
  try
    ENSubstation150Obj := TempENSubstation150.getObject(StrToInt(
      sgENSubstation150.Cells[0,sgENSubstation150.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := ENSubstation150Obj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

end.
