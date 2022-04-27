
unit ShowENLineCable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLineCableController, AdvObj, DMReportsUnit ;


type
  TfrmENLineCableShow = class(TChildForm)  
  HTTPRIOENLineCable: THTTPRIO;
    ImageList1: TImageList;
    sgENLineCable: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    actSchemeList: TAction;
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
    tbSchemeList: TToolButton;
    actlLineCableExpExcel: TAction;
    xls1: TMenuItem;
    ToolButton4: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENLineCableTopLeftChanged(Sender: TObject);
procedure sgENLineCableDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSchemeListExecute(Sender: TObject);
    procedure sgENLineCableMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure actlLineCableExpExcelExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENLineCableShow : TfrmENLineCableShow;
 // ENLineCableObj: ENLineCable;
 // ENLineCableFilterObj: ENLineCableFilter;

var CodeCable, BelongingCable, OwnerCable: Integer;
  InvnumberCable, NameCable, BuhnameCable, LinelengthCable,
  YearbuildCable, YearworkingstartCable, LastrepairdateCable,
  VoltageNominalCable, Maincustomersdata, Moredate: String;

implementation

uses Main, EditENLineCable, EditENLineCableFilter, ENElementController,
  ShowENScheme, ENSchemeController;


{$R *.dfm}

var
  //frmENLineCableShow : TfrmENLineCableShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLineCableHeaders: array [1..8] of String =
        ( 'Код'
          ,'Інвентарній номер'
          ,'Найменування кабельноъ лінії 0.4-6-10 кВ'
          ,'Бухгалтерське найменування кабельноъ лінії 0.4-6-10 кВ'
          ,'Будівельна довжина лінії, км'
          ,'Рік будівництва'
          ,'Рік введення у роботу'
          ,'Дата останнього кап. ремонту'
        );
   

procedure TfrmENLineCableShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLineCableShow:=nil;
    inherited;
  end;


procedure TfrmENLineCableShow.FormShow(Sender: TObject);
var
  TempENLineCable: ENLineCableControllerSoapPort;
  i: Integer;
  ENLineCableList: ENLineCableShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENLineCableHeaders, sgENLineCable.ColumnHeaders);
  ColCount:=100;
  TempENLineCable :=  HTTPRIOENLineCable as ENLineCableControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLineCableFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLineCableList := TempENLineCable.getScrollableFilteredList(ENLineCableFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLineCableList.list);

  if LastCount > -1 then
     sgENLineCable.RowCount:=LastCount+2
  else
     sgENLineCable.RowCount:=2;

   with sgENLineCable do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLineCableList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENLineCableList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENLineCableList.list[i].invNumber;
        Cells[2,i+1] := ENLineCableList.list[i].name;
        Cells[3,i+1] := ENLineCableList.list[i].buhName;
        if ENLineCableList.list[i].lineLength = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENLineCableList.list[i].lineLength.DecimalString;
        if ENLineCableList.list[i].yearBuild = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENLineCableList.list[i].yearBuild);
        if ENLineCableList.list[i].yearWorkingStart = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENLineCableList.list[i].yearWorkingStart);
        if ENLineCableList.list[i].lastRepairDate = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENLineCableList.list[i].lastRepairDate);
        LastRow:=i+1;
        sgENLineCable.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLineCable.Row:=1;
end;

procedure TfrmENLineCableShow.sgENLineCableTopLeftChanged(Sender: TObject);
var
  TempENLineCable: ENLineCableControllerSoapPort;
  i,CurrentRow: Integer;
  ENLineCableList: ENLineCableShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLineCable.TopRow + sgENLineCable.VisibleRowCount) = ColCount
  then
    begin
      TempENLineCable :=  HTTPRIOENLineCable as ENLineCableControllerSoapPort;
      CurrentRow:=sgENLineCable.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLineCableFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLineCableList := TempENLineCable.getScrollableFilteredList(ENLineCableFilter(FilterObject),ColCount-1, 100);



  sgENLineCable.RowCount:=sgENLineCable.RowCount+100;
  LastCount:=High(ENLineCableList.list);
  with sgENLineCable do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLineCableList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLineCableList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLineCableList.list[i].invNumber;
        Cells[2,i+CurrentRow] := ENLineCableList.list[i].name;
        Cells[3,i+CurrentRow] := ENLineCableList.list[i].buhName;
        if ENLineCableList.list[i].lineLength = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENLineCableList.list[i].lineLength.DecimalString;
        if ENLineCableList.list[i].yearBuild = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(ENLineCableList.list[i].yearBuild);
        if ENLineCableList.list[i].yearWorkingStart = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENLineCableList.list[i].yearWorkingStart);
        if ENLineCableList.list[i].lastRepairDate = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDate2String(ENLineCableList.list[i].lastRepairDate);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLineCable.Row:=CurrentRow-5;
   sgENLineCable.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLineCableShow.sgENLineCableDblClick(Sender: TObject);
Var TempENLineCable: ENLineCableControllerSoapPort;
  ENLineCableObj: ENLineCable;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try      
      CodeCable := StrToInt(GetReturnValue(sgENLineCable,0)); //Код
      InvnumberCable := sgENLineCable.Cells[1, sgENLineCable.Row]; //Інвентарний номер
      NameCable := sgENLineCable.Cells[2, sgENLineCable.Row]; //Найменування кабельноъ лінії 0.4-6-10 кВ
      BuhnameCable := sgENLineCable.Cells[3, sgENLineCable.Row]; //Бухгалтерське найменування кабельноъ лінії 0.4-6-10 кВ
      LinelengthCable := sgENLineCable.Cells[4, sgENLineCable.Row]; //Будівельна довжина лінії, км
      YearbuildCable := sgENLineCable.Cells[5, sgENLineCable.Row]; //Рік будівництва
      YearworkingstartCable := sgENLineCable.Cells[6, sgENLineCable.Row]; //Рік введення у роботу
      LastrepairdateCable := sgENLineCable.Cells[7, sgENLineCable.Row]; //Дата останнього кап. ремонту
      //
      TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;
      ENLineCableObj := TempENLineCable.getObject(StrToInt(sgENLineCable.Cells[0, sgENLineCable.Row]));
      BelongingCable := ENLineCableObj.belongingRef.code;
      OwnerCable := ENLineCableObj.ownerRef.code;
      VoltageNominalCable := ENLineCableObj.voltagenominal.value.DecimalString;
      Maincustomersdata := ENLineCableObj.mainCustomersData;
      Moredate := ENLineCableObj.moreData;
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLineCableShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLineCable.RowCount-1 do
   for j:=0 to sgENLineCable.ColCount-1 do
     sgENLineCable.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLineCableShow.actViewExecute(Sender: TObject);
Var TempENLineCable: ENLineCableControllerSoapPort;
begin
 TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;
   try
     ENLineCableObj := TempENLineCable.getObject(StrToInt(sgENLineCable.Cells[0,sgENLineCable.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLineCableEdit:=TfrmENLineCableEdit.Create(Application, dsView);
  try
    frmENLineCableEdit.ShowModal;
  finally
    frmENLineCableEdit.Free;
    frmENLineCableEdit:=nil;
  end;
end;

procedure TfrmENLineCableShow.actEditExecute(Sender: TObject);
Var TempENLineCable: ENLineCableControllerSoapPort;
begin
 TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;
   try
     ENLineCableObj := TempENLineCable.getObject(StrToInt(sgENLineCable.Cells[0,sgENLineCable.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLineCableEdit:=TfrmENLineCableEdit.Create(Application, dsEdit);
  try
    if frmENLineCableEdit.ShowModal= mrOk then
      begin
        //TempENLineCable.save(ENLineCableObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLineCableEdit.Free;
    frmENLineCableEdit:=nil;
  end;
end;

procedure TfrmENLineCableShow.actDeleteExecute(Sender: TObject);
Var TempENLineCable: ENLineCableControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLineCable.Cells[0,sgENLineCable.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Кабельна лінія 0.4-6-10 кВ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLineCable.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLineCableShow.actInsertExecute(Sender: TObject);
Var TempENLineCable: ENLineCableControllerSoapPort;
begin
  TempENLineCable := HTTPRIOENLineCable as ENLineCableControllerSoapPort;

  ENLineCableObj := ENLineCable.Create;
  ENLineCableObj.element := ENElement.Create();
  ENLineCableObj.lineLength := TXSDecimal.Create;
  ENLineCableObj.lastRepairDate := TXSDate.Create;
  ENLineCableObj.dateGen := TXSDate.Create;

  try
    frmENLineCableEdit:=TfrmENLineCableEdit.Create(Application, dsInsert);
    try
      if frmENLineCableEdit.ShowModal = mrOk then
      begin
        if ENLineCableObj<>nil then
            //TempENLineCable.add(ENLineCableObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLineCableEdit.Free;
      frmENLineCableEdit:=nil;
    end;
  finally
    ENLineCableObj.Free;
  end;
end;

procedure TfrmENLineCableShow.actlLineCableExpExcelExecute(Sender: TObject);
begin
  DMReports.exportGrid(sgENLineCable, 'sgENLineCable_');
end;

procedure TfrmENLineCableShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLineCableShow.actFilterExecute(Sender: TObject);
begin
frmENLineCableFilterEdit:=TfrmENLineCableFilterEdit.Create(Application, dsEdit);
  try
    ENLineCableFilterObj := ENLineCableFilter.Create;
    SetNullIntProps(ENLineCableFilterObj);
    SetNullXSProps(ENLineCableFilterObj);

    if frmENLineCableFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLineCableFilter.Create;
      FilterObject := ENLineCableFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLineCableFilterEdit.Free;
    frmENLineCableFilterEdit:=nil;
  end;
end;

procedure TfrmENLineCableShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENLineCableShow.actSchemeListExecute(Sender: TObject);
Var TempENLineCable: ENLineCableControllerSoapPort;
  ENLineCableObj: ENLineCable;
  ENSchemeFilterObj: ENSchemeFilter;
  fENSchemeShow: TfrmENSchemeShow;
begin
  TempENLineCable := HTTPRIOENLineCable as
    ENLineCableControllerSoapPort;
  try
    ENLineCableObj := TempENLineCable.getObject(StrToInt(
      sgENLineCable.Cells[0,sgENLineCable.Row]));
  except
    on EConvertError do Exit;
  end;

  ENSchemeFilterObj := ENSchemeFilter.Create;
  SetNullIntProps(ENSchemeFilterObj);
  SetNullXSProps(ENSchemeFilterObj);
  ENSchemeFilterObj.elementRef := ENElementRef.Create;
  ENSchemeFilterObj.elementRef.code := ENLineCableObj.element.code;

  fENSchemeShow :=
    TfrmENSchemeShow.Create(Application, fmNormal, ENSchemeFilterObj);
  try
    fENSchemeShow.ShowModal;
  finally
    fENSchemeShow.Free;
  end;
end;

procedure TfrmENLineCableShow.sgENLineCableMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor := crArrow;
end;

end.