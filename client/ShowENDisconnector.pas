
unit ShowENDisconnector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  ENDisconnectorController, AdvObj ;


type
  TfrmENDisconnectorShow = class(TChildForm)  
  HTTPRIOENDisconnector: THTTPRIO;
    ImageList1: TImageList;
    sgENDisconnector: TAdvStringGrid;
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
procedure sgENDisconnectorTopLeftChanged(Sender: TObject);
procedure sgENDisconnectorDblClick(Sender: TObject);
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
 frmENDisconnectorShow : TfrmENDisconnectorShow;
 // ENDisconnectorObj: ENDisconnector;
 // ENDisconnectorFilterObj: ENDisconnectorFilter;
  
  
implementation

uses Main, EditENDisconnector, EditENDisconnectorFilter;


{$R *.dfm}

var
  //frmENDisconnectorShow : TfrmENDisconnectorShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDisconnectorHeaders: array [1..10] of String =
        ('Код'
       , 'Роз''єднувач'
       , 'Диспетчерська назва'
       , 'Привід'
       , 'Напруга ном., кВ'
       , 'Струм ном., А'
       , 'ТП 6 - 10 / 0,4 кВ'
       , '№ Високовольтної Ланки'
       , 'ПЛ 6 - 10 кВ'
       , '№ Опори');


procedure TfrmENDisconnectorShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDisconnectorShow:=nil;
    inherited;
  end;


procedure TfrmENDisconnectorShow.FormShow(Sender: TObject);
var
  TempENDisconnector: ENDisconnectorControllerSoapPort;
  i: Integer;
  ENDisconnectorList: ENDisconnectorShortList;
begin
  SetGridHeaders(ENDisconnectorHeaders, sgENDisconnector.ColumnHeaders);
  ColCount := 100;
  TempENDisconnector :=
    HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENDisconnectorFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENDisconnectorList := TempENDisconnector.getScrollableFilteredList(
    ENDisconnectorFilter(FilterObject), 0, ColCount);

  LastCount := High(ENDisconnectorList.list);

  if LastCount > -1 then
     sgENDisconnector.RowCount := LastCount + 2
  else
     sgENDisconnector.RowCount := 2;

   with sgENDisconnector do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENDisconnectorList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENDisconnectorList.list[i].code)
        else //Код Разъединителя
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENDisconnectorList.list[i].materialRefName; //Разъединитель из Нормативных материалов
        Cells[2, i + 1] := ENDisconnectorList.list[i].name; //Диспетчерское название
        Cells[3, i + 1] := ENDisconnectorList.list[i].matDriveRefName;  //Привод разъединителя из Нормативных материалов
          //Привод Разъединителя
        if ENDisconnectorList.list[i].ratedVoltage = nil then
          Cells[4, i + 1] := ''
        else //Номинальное напряжение, кВ
          Cells[4, i + 1] := ENDisconnectorList.list[i].ratedVoltage.DecimalString;
        if ENDisconnectorList.list[i].ratedCurrent = nil then
          Cells[5, i + 1] := ''
        else //Номинальный ток, А
          Cells[5, i + 1] := ENDisconnectorList.list[i].ratedCurrent.DecimalString;
        Cells[6, i + 1] := ENDisconnectorList.list[i].substation04Name; //ТП 6 - 10 / 0,4 кВ'
        Cells[7, i + 1] := ENDisconnectorList.list[i].highvoltageSellNumberGen; //№ Высоковольтной Ячейки
        Cells[8, i + 1] := ENDisconnectorList.list[i].line10RefName; //ВЛ 6 - 10 кВ
        Cells[9, i + 1] := ENDisconnectorList.list[i].postRefPostNumberGen; //№ Опоры'

        LastRow := i + 1;
        sgENDisconnector.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENDisconnector.Row := 1;
end;

procedure TfrmENDisconnectorShow.sgENDisconnectorTopLeftChanged(Sender: TObject);
var TempENDisconnector: ENDisconnectorControllerSoapPort;
  i, CurrentRow: Integer;
  ENDisconnectorList: ENDisconnectorShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENDisconnector.TopRow + sgENDisconnector.VisibleRowCount) = ColCount
  then
    begin
      TempENDisconnector :=
        HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
      CurrentRow := sgENDisconnector.RowCount;

      if FilterObject = nil then
        begin
           FilterObject := ENDisconnectorFilter.Create;
           SetNullIntProps(FilterObject);
           SetNullXSProps(FilterObject);
        end;

      ENDisconnectorList := TempENDisconnector.getScrollableFilteredList(
        ENDisconnectorFilter(FilterObject), ColCount - 1, 100);

      sgENDisconnector.RowCount:=sgENDisconnector.RowCount + 100;
      LastCount := High(ENDisconnectorList.list);
      with sgENDisconnector do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENDisconnectorList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENDisconnectorList.list[i].code)
            else //Код Разъединителя
              Cells[0, i + CurrentRow] := '';
            Cells[1, i + CurrentRow] := ENDisconnectorList.list[i].materialRefName; //Разъединитель из Нормативных материалов
            Cells[2, i + CurrentRow] := ENDisconnectorList.list[i].name; //Диспетчерское название
            Cells[3, i + CurrentRow] := ENDisconnectorList.list[i].matDriveRefName;  //Привод разъединителя из Нормативных материалов
              //Привод Разъединителя
            if ENDisconnectorList.list[i].ratedVoltage = nil then
              Cells[4, i + CurrentRow] := ''
            else //Номинальное напряжение, кВ
              Cells[4, i + CurrentRow] := ENDisconnectorList.list[i].ratedVoltage.DecimalString;
            if ENDisconnectorList.list[i].ratedCurrent = nil then
              Cells[5, i + CurrentRow] := ''
            else //Номинальный ток, А
              Cells[5, i + CurrentRow] := ENDisconnectorList.list[i].ratedCurrent.DecimalString;
            Cells[6, i + CurrentRow] := ENDisconnectorList.list[i].substation04Name; //ТП 6 - 10 / 0,4 кВ'
            Cells[7, i + CurrentRow] := ENDisconnectorList.list[i].highvoltageSellNumberGen; //№ Высоковольтной Ячейки
            Cells[8, i + CurrentRow] := ENDisconnectorList.list[i].line10RefName; //ВЛ 6 - 10 кВ
            Cells[9, i + CurrentRow] := ENDisconnectorList.list[i].postRefPostNumberGen; //№ Опоры'
            LastRow := i + CurrentRow;
          end;
        ColCount := ColCount + 100;
        sgENDisconnector.Row := CurrentRow - 5;
        sgENDisconnector.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENDisconnectorShow.sgENDisconnectorDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDisconnector,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDisconnectorShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDisconnector.RowCount-1 do
   for j:=0 to sgENDisconnector.ColCount-1 do
     sgENDisconnector.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDisconnectorShow.actViewExecute(Sender: TObject);
Var TempENDisconnector: ENDisconnectorControllerSoapPort;
begin
 TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
   try
     ENDisconnectorObj := TempENDisconnector.getObject(StrToInt(sgENDisconnector.Cells[0,sgENDisconnector.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorEdit:=TfrmENDisconnectorEdit.Create(Application, dsView);
  try
    frmENDisconnectorEdit.ShowModal;
  finally
    frmENDisconnectorEdit.Free;
    frmENDisconnectorEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorShow.actEditExecute(Sender: TObject);
Var TempENDisconnector: ENDisconnectorControllerSoapPort;
begin
 TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
   try
     ENDisconnectorObj := TempENDisconnector.getObject(StrToInt(sgENDisconnector.Cells[0,sgENDisconnector.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorEdit:=TfrmENDisconnectorEdit.Create(Application, dsEdit);
  try
    if frmENDisconnectorEdit.ShowModal= mrOk then
      begin
        //TempENDisconnector.save(ENDisconnectorObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDisconnectorEdit.Free;
    frmENDisconnectorEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorShow.actDeleteExecute(Sender: TObject);
Var TempENDisconnector: ENDisconnectorControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDisconnector.Cells[0,sgENDisconnector.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Разъединитель) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDisconnector.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDisconnectorShow.actInsertExecute(Sender: TObject);
Var TempENDisconnector: ENDisconnectorControllerSoapPort;
begin
  TempENDisconnector := HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
  ENDisconnectorObj:=ENDisconnector.Create;

   //ENDisconnectorObj.ratedVoltage:= TXSDecimal.Create;
   //ENDisconnectorObj.ratedCurrent:= TXSDecimal.Create;


  try
    frmENDisconnectorEdit:=TfrmENDisconnectorEdit.Create(Application, dsInsert);
    try
      if frmENDisconnectorEdit.ShowModal = mrOk then
      begin
        if ENDisconnectorObj<>nil then
            //TempENDisconnector.add(ENDisconnectorObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDisconnectorEdit.Free;
      frmENDisconnectorEdit:=nil;
    end;
  finally
    ENDisconnectorObj.Free;
  end;
end;

procedure TfrmENDisconnectorShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDisconnectorShow.actFilterExecute(Sender: TObject);
begin
{frmENDisconnectorFilterEdit:=TfrmENDisconnectorFilterEdit.Create(Application, dsInsert);
  try
    ENDisconnectorFilterObj := ENDisconnectorFilter.Create;
    SetNullIntProps(ENDisconnectorFilterObj);
    SetNullXSProps(ENDisconnectorFilterObj);

    if frmENDisconnectorFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDisconnectorFilter.Create;
      FilterObject := ENDisconnectorFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDisconnectorFilterEdit.Free;
    frmENDisconnectorFilterEdit:=nil;
  end;}
end;

procedure TfrmENDisconnectorShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.