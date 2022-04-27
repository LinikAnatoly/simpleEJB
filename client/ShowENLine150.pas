
unit ShowENLine150;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLine150Controller, AdvObj ;


type
  TfrmENLine150Show = class(TChildForm)  
  HTTPRIOENLine150: THTTPRIO;
    ImageList1: TImageList;
    sgENLine150: TAdvStringGrid;
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

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENLine150TopLeftChanged(Sender: TObject);
procedure sgENLine150DblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSchemeListExecute(Sender: TObject);
    procedure sgENLine150MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);


  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENLine150Show : TfrmENLine150Show;
 // ENLine150Obj: ENLine150;
 // ENLine150FilterObj: ENLine150Filter;
  
var Code150: Integer;
  Invnumber150, Name150, Buhname150, Linelength150, Yearbuild150,
  Yearworkingstart150, Lastrepairdate150, Chainslength, Chains2length,
  NameProject150, NameBuilder150, VoltageNominal150,
  Kruserial, Battery, Operativeiconst, Operativeivar: String;

implementation

uses Main, EditENLine150, EditENLine150Filter, ENElementController,
  ShowENScheme, ENSchemeController;

{$R *.dfm}

var
  //frmENLine150Show : TfrmENLine150Show;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLine150Headers: array [1..10] of String =
        ( 'Код'
          ,'Інвентарний номер'
          ,'Найменування лінії 35-150 кВ'
          ,'Бухгалтерське найменування лінії 35-150'
          ,'Будівельна довжина лінії, км'
          ,'Рік будівництва'
          ,'Рік введення у роботу'
          ,'Довжина 1 ланцюгової ділянки, км'
          ,'Довжина 2-х ланцюгової ділянки, км'
          ,'Дата останнього кап. ремонту'
        );
   

procedure TfrmENLine150Show.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLine150Show:=nil;
    inherited;
  end;


procedure TfrmENLine150Show.FormShow(Sender: TObject);
var
  TempENLine150: ENLine150ControllerSoapPort;
  i: Integer;
  ENLine150List: ENLine150ShortList;
  begin
  SetGridHeaders(ENLine150Headers, sgENLine150.ColumnHeaders);
  ColCount:=100;
  TempENLine150 :=  HTTPRIOENLine150 as ENLine150ControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLine150Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine150List := TempENLine150.getScrollableFilteredList(ENLine150Filter(FilterObject),0,ColCount);


  LastCount:=High(ENLine150List.list);

  if LastCount > -1 then
     sgENLine150.RowCount:=LastCount+2
  else
     sgENLine150.RowCount:=2;

   with sgENLine150 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine150List.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLine150List.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLine150List.list[i].invNumber;
        Cells[2,i+1] := ENLine150List.list[i].name;
        Cells[3,i+1] := ENLine150List.list[i].buhName;
        if ENLine150List.list[i].lineLength = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENLine150List.list[i].lineLength.DecimalString;
        if ENLine150List.list[i].yearBuild = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENLine150List.list[i].yearBuild);
        if ENLine150List.list[i].yearWorkingStart = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENLine150List.list[i].yearWorkingStart);

        if ENLine150List.list[i].chainsLength = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENLine150List.list[i].chainsLength.DecimalString;
        if ENLine150List.list[i].chains2Length = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENLine150List.list[i].chains2Length.DecimalString;
          
        if ENLine150List.list[i].lastRepairDate = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENLine150List.list[i].lastRepairDate);
        LastRow:=i+1;
        sgENLine150.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLine150.Row:=1;
end;

procedure TfrmENLine150Show.sgENLine150TopLeftChanged(Sender: TObject);
var
  TempENLine150: ENLine150ControllerSoapPort;
  i,CurrentRow: Integer;
  ENLine150List: ENLine150ShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLine150.TopRow + sgENLine150.VisibleRowCount) = ColCount
  then
    begin
      TempENLine150 :=  HTTPRIOENLine150 as ENLine150ControllerSoapPort;
      CurrentRow:=sgENLine150.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLine150Filter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLine150List := TempENLine150.getScrollableFilteredList(ENLine150Filter(FilterObject),ColCount-1, 100);



  sgENLine150.RowCount:=sgENLine150.RowCount+100;
  LastCount:=High(ENLine150List.list);
  with sgENLine150 do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLine150List.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLine150List.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLine150List.list[i].invNumber;
        Cells[2,i+CurrentRow] := ENLine150List.list[i].name;
        Cells[3,i+CurrentRow] := ENLine150List.list[i].buhName;
        if ENLine150List.list[i].lineLength = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENLine150List.list[i].lineLength.DecimalString;
        if ENLine150List.list[i].yearBuild = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(ENLine150List.list[i].yearBuild);
        if ENLine150List.list[i].yearWorkingStart = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENLine150List.list[i].yearWorkingStart);

        if ENLine150List.list[i].chainsLength = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENLine150List.list[i].chainsLength.DecimalString;
        if ENLine150List.list[i].chains2Length = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := ENLine150List.list[i].chains2Length.DecimalString;


        if ENLine150List.list[i].lastRepairDate = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(ENLine150List.list[i].lastRepairDate);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLine150.Row:=CurrentRow-5;
   sgENLine150.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLine150Show.sgENLine150DblClick(Sender: TObject);
Var TempENLine150: ENLine150ControllerSoapPort;
  ENLine150Obj: ENLine150;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      Code150 := StrToInt(GetReturnValue(sgENLine150,0)); //Код
      Invnumber150 := sgENLine150.Cells[1, sgENLine150.Row]; //Інвентарний номер
      Name150 := sgENLine150.Cells[2, sgENLine150.Row]; //Найменування лінії 35-150 кВ
      Buhname150 := sgENLine150.Cells[3, sgENLine150.Row]; //Бухгалтерське найменування лінії 35-150
      Linelength150 := sgENLine150.Cells[4, sgENLine150.Row]; //Будівельна довжина лінії, км
      Yearbuild150 := sgENLine150.Cells[5, sgENLine150.Row]; //Рік будівництва
      Yearworkingstart150 := sgENLine150.Cells[6, sgENLine150.Row]; //Рік введення у роботу
      Lastrepairdate150 := sgENLine150.Cells[9, sgENLine150.Row]; //Дата останнього кап. ремонту
      Chainslength := sgENLine150.Cells[7, sgENLine150.Row]; //Довжина 1 ланцюгової ділянки, км
      Chains2length := sgENLine150.Cells[8, sgENLine150.Row]; //Довжина 2-х ланцюгової ділянки, км
      //
      TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;
      ENLine150Obj := TempENLine150.getObject(StrToInt(sgENLine150.Cells[0, sgENLine150.Row]));
      VoltageNominal150 := ENLine150Obj.voltagenominal.value.DecimalString;
      NameProject150 := ENLine150Obj.nameProject;
      NameBuilder150 := ENLine150Obj.nameBuilder;

      Kruserial := '';
      Battery := '';
      Operativeiconst := '';
      Operativeivar := '';
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLine150Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLine150.RowCount-1 do
   for j:=0 to sgENLine150.ColCount-1 do
     sgENLine150.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLine150Show.actViewExecute(Sender: TObject);
Var TempENLine150: ENLine150ControllerSoapPort;
begin
 TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;
   try
     ENLine150Obj := TempENLine150.getObject(StrToInt(sgENLine150.Cells[0,sgENLine150.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine150Edit:=TfrmENLine150Edit.Create(Application, dsView);
  try
    frmENLine150Edit.ShowModal;
  finally
    frmENLine150Edit.Free;
    frmENLine150Edit:=nil;
  end;
end;

procedure TfrmENLine150Show.actEditExecute(Sender: TObject);
Var TempENLine150: ENLine150ControllerSoapPort;
begin
 TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;
   try
     ENLine150Obj := TempENLine150.getObject(StrToInt(sgENLine150.Cells[0,sgENLine150.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLine150Edit:=TfrmENLine150Edit.Create(Application, dsEdit);
  try
    if frmENLine150Edit.ShowModal= mrOk then
      begin
        //TempENLine150.save(ENLine150Obj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLine150Edit.Free;
    frmENLine150Edit:=nil;
  end;
end;

procedure TfrmENLine150Show.actDeleteExecute(Sender: TObject);
Var TempENLine150: ENLine150ControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLine150.Cells[0,sgENLine150.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Повітряна лінія 35-150 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLine150.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLine150Show.actInsertExecute(Sender: TObject);
Var TempENLine150: ENLine150ControllerSoapPort;
begin
  TempENLine150 := HTTPRIOENLine150 as ENLine150ControllerSoapPort;
  ENLine150Obj:=ENLine150.Create;

   ENLine150Obj.lineLength:= TXSDecimal.Create;
   ENLine150Obj.chainsLength:= TXSDecimal.Create;
   ENLine150Obj.lastRepairDate:= TXSDate.Create;
   ENLine150Obj.dateGen:= TXSDate.Create;

   ENLine150Obj.element := ENElement.Create;
   

  try
    frmENLine150Edit:=TfrmENLine150Edit.Create(Application, dsInsert);
    try
      if frmENLine150Edit.ShowModal = mrOk then
      begin
        if ENLine150Obj<>nil then
            //TempENLine150.add(ENLine150Obj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLine150Edit.Free;
      frmENLine150Edit:=nil;
    end;
  finally
    ENLine150Obj.Free;
  end;
end;

procedure TfrmENLine150Show.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLine150Show.actFilterExecute(Sender: TObject);
begin
frmENLine150FilterEdit:=TfrmENLine150FilterEdit.Create(Application, dsEdit);
  try
    ENLine150FilterObj := ENLine150Filter.Create;
    SetNullIntProps(ENLine150FilterObj);
    SetNullXSProps(ENLine150FilterObj);

    if frmENLine150FilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLine150Filter.Create;
      FilterObject := ENLine150FilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLine150FilterEdit.Free;
    frmENLine150FilterEdit:=nil;
  end;
end;

procedure TfrmENLine150Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENLine150Show.actSchemeListExecute(Sender: TObject);
Var TempENLine150: ENLine150ControllerSoapPort;
  ENLine150Obj: ENLine150;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENLine150 := HTTPRIOENLine150 as
    ENLine150ControllerSoapPort;
  try
    ENLine150Obj := TempENLine150.getObject(StrToInt(
      sgENLine150.Cells[0,sgENLine150.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := ENLine150Obj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

procedure TfrmENLine150Show.sgENLine150MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crArrow;
end;

end.