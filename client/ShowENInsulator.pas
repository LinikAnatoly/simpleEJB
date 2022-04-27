
unit ShowENInsulator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENInsulatorController, AdvObj ;


type
  TfrmENInsulatorShow = class(TChildForm)  
  HTTPRIOENInsulator: THTTPRIO;
    ImageList1: TImageList;
    sgENInsulator: TAdvStringGrid;
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
procedure sgENInsulatorTopLeftChanged(Sender: TObject);
procedure sgENInsulatorDblClick(Sender: TObject);
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

var
 frmENInsulatorShow : TfrmENInsulatorShow;
 // ENInsulatorObj: ENInsulator;
 // ENInsulatorFilterObj: ENInsulatorFilter;
  
  
implementation

uses Main, EditENInsulator, EditENInsulatorFilter;


{$R *.dfm}

var
  //frmENInsulatorShow : TfrmENInsulatorShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInsulatorHeaders: array [1..8] of String =
        (   'Код'
          , 'Изолятор'
          , 'Диспетчерское название'
          , 'Напряжение, кВ'
          , 'ТП 6 - 10 / 0,4 кВ'
          , '№ Високовольтної Ланки'
          , 'ПЛ 6 - 10 кВ'
          , '№ Опори'
        );
   

procedure TfrmENInsulatorShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENInsulatorShow:=nil;
    inherited;
  end;


procedure TfrmENInsulatorShow.FormShow(Sender: TObject);
var
  TempENInsulator: ENInsulatorControllerSoapPort;
  i: Integer;
  ENInsulatorList: ENInsulatorShortList;
begin
  FormatSettings.DecimalSeparator := '.';
  SetGridHeaders(ENInsulatorHeaders, sgENInsulator.ColumnHeaders);
  ColCount := 100;
  TempENInsulator :=  HTTPRIOENInsulator as ENInsulatorControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENInsulatorFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENInsulatorList := TempENInsulator.getScrollableFilteredList(
    ENInsulatorFilter(FilterObject),0,ColCount);

  LastCount:=High(ENInsulatorList.list);

  if LastCount > -1 then
     sgENInsulator.RowCount := LastCount + 2
  else
     sgENInsulator.RowCount := 2;

   with sgENInsulator do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInsulatorList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENInsulatorList.list[i].code)
        else //Код Изолятора
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENInsulatorList.list[i].materialRefName; //Изолятор из Нормативных материалов
        Cells[2, i + 1] := ENInsulatorList.list[i].name; //Диспетчерское название
        if ENInsulatorList.list[i].voltage = nil then
          Cells[3, i + 1] := ''
        else //Напряжение, кВ
          Cells[3, i + 1] := ENInsulatorList.list[i].voltage.DecimalString;
        Cells[4, i + 1] := ENInsulatorList.list[i].substation04Name; //Трансформаторная Подстанция 6 - 10 / 0,4 кВ
        Cells[5, i + 1] := ENInsulatorList.list[i].highvoltageSellNumberGen; //№ Высоковольтной Ячейки
        Cells[6, i + 1] := ENInsulatorList.list[i].line10RefName; //Воздушная Линия 6 - 10 кВ
        Cells[7, i + 1] := ENInsulatorList.list[i].postRefPostNumberGen; //№ Опоры, удерживающей ВЛ 6 - 10 кВ

        LastRow := i + 1;
        sgENInsulator.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENInsulator.Row := 1;
end;

procedure TfrmENInsulatorShow.sgENInsulatorTopLeftChanged(Sender: TObject);
var TempENInsulator: ENInsulatorControllerSoapPort;
  i, CurrentRow: Integer;
  ENInsulatorList: ENInsulatorShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENInsulator.TopRow + sgENInsulator.VisibleRowCount) = ColCount then
    begin
      TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
      CurrentRow := sgENInsulator.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENInsulatorFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENInsulatorList := TempENInsulator.getScrollableFilteredList(
        ENInsulatorFilter(FilterObject), ColCount - 1, 100);

      sgENInsulator.RowCount := sgENInsulator.RowCount + 100;
      LastCount:=High(ENInsulatorList.list);
      with sgENInsulator do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENInsulatorList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENInsulatorList.list[i].code)
            else //Код Изолятора
              Cells[0, i + CurrentRow] := '';
            Cells[1, i + CurrentRow] := ENInsulatorList.list[i].materialRefName; //Изолятор из Нормативных материалов
            Cells[2, i + CurrentRow] := ENInsulatorList.list[i].name; //Диспетчерское название
            if ENInsulatorList.list[i].voltage = nil then
              Cells[3, i + CurrentRow] := ''
            else //Напряжение, кВ
              Cells[3, i + CurrentRow] := ENInsulatorList.list[i].voltage.DecimalString;
            Cells[4, i + CurrentRow] := ENInsulatorList.list[i].substation04Name; //Трансформаторная Подстанция 6 - 10 / 0,4 кВ
            Cells[5, i + CurrentRow] := ENInsulatorList.list[i].highvoltageSellNumberGen; //№ Высоковольтной Ячейки
            Cells[6, i + CurrentRow] := ENInsulatorList.list[i].line10RefName; //Воздушная Линия 6 - 10 кВ
            Cells[7, i + CurrentRow] := ENInsulatorList.list[i].postRefPostNumberGen; //№ Опоры, удерживающей ВЛ 6 - 10 кВ
            LastRow := i + CurrentRow;
          end;
       ColCount:=ColCount+100;
       sgENInsulator.Row:=CurrentRow-5;
       sgENInsulator.RowCount:=LastRow+1;
    end;
end;

procedure TfrmENInsulatorShow.sgENInsulatorDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENInsulator,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENInsulatorShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENInsulator.RowCount-1 do
   for j:=0 to sgENInsulator.ColCount-1 do
     sgENInsulator.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENInsulatorShow.actViewExecute(Sender: TObject);
Var TempENInsulator: ENInsulatorControllerSoapPort;
begin
 TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
   try
     ENInsulatorObj := TempENInsulator.getObject(StrToInt(sgENInsulator.Cells[0,sgENInsulator.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInsulatorEdit:=TfrmENInsulatorEdit.Create(Application, dsView);
  try
    frmENInsulatorEdit.ShowModal;
  finally
    frmENInsulatorEdit.Free;
    frmENInsulatorEdit:=nil;
  end;
end;

procedure TfrmENInsulatorShow.actEditExecute(Sender: TObject);
Var TempENInsulator: ENInsulatorControllerSoapPort;
begin
 TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
   try
     ENInsulatorObj := TempENInsulator.getObject(StrToInt(sgENInsulator.Cells[0,sgENInsulator.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInsulatorEdit:=TfrmENInsulatorEdit.Create(Application, dsEdit);
  try
    if frmENInsulatorEdit.ShowModal= mrOk then
      begin
        //TempENInsulator.save(ENInsulatorObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENInsulatorEdit.Free;
    frmENInsulatorEdit:=nil;
  end;
end;

procedure TfrmENInsulatorShow.actDeleteExecute(Sender: TObject);
Var TempENInsulator: ENInsulatorControllerSoapPort;
  ObjCode: Integer;
begin
 TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
   try
     ObjCode := StrToInt(sgENInsulator.Cells[0,sgENInsulator.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Изолятор) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENInsulator.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENInsulatorShow.actInsertExecute(Sender: TObject);
Var TempENInsulator: ENInsulatorControllerSoapPort;
begin
  TempENInsulator := HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
  ENInsulatorObj:=ENInsulator.Create;

   //ENInsulatorObj.voltage:= TXSDecimal.Create;
   //ENInsulatorObj.numberGen:= TXSDecimal.Create;


  try
    frmENInsulatorEdit:=TfrmENInsulatorEdit.Create(Application, dsInsert);
    try
      if frmENInsulatorEdit.ShowModal = mrOk then
      begin
        if ENInsulatorObj<>nil then
            //TempENInsulator.add(ENInsulatorObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENInsulatorEdit.Free;
      frmENInsulatorEdit:=nil;
    end;
  finally
    ENInsulatorObj.Free;
  end;
end;

procedure TfrmENInsulatorShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENInsulatorShow.actFilterExecute(Sender: TObject);
begin
{frmENInsulatorFilterEdit:=TfrmENInsulatorFilterEdit.Create(Application, dsInsert);
  try
    ENInsulatorFilterObj := ENInsulatorFilter.Create;
    SetNullIntProps(ENInsulatorFilterObj);
    SetNullXSProps(ENInsulatorFilterObj);

    if frmENInsulatorFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENInsulatorFilter.Create;
      FilterObject := ENInsulatorFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENInsulatorFilterEdit.Free;
    frmENInsulatorFilterEdit:=nil;
  end;}
end;

procedure TfrmENInsulatorShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.