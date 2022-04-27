//История замен Разъединителей
unit ShowENDisconnectorChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDisconnectorChangeController, AdvObj ;


type
  TfrmENDisconnectorChangeShow = class(TChildForm)  
  HTTPRIOENDisconnectorChange: THTTPRIO;
    ImageList1: TImageList;
    sgENDisconnectorChange: TAdvStringGrid;
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
procedure sgENDisconnectorChangeTopLeftChanged(Sender: TObject);
procedure sgENDisconnectorChangeDblClick(Sender: TObject);
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
  frmENDisconnectorChangeShow: TfrmENDisconnectorChangeShow;

implementation

uses Main, EditENDisconnectorChange, EditENDisconnectorChangeFilter;


{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDisconnectorChangeHeaders: array [1..17] of String =
        (  'Код Истории'
          ,'Характер замены'
          ,'Установлено'
          ,'Снято'
          ,'Номер наряда'
          ,'Дата наряда'
          ,'Номер акта'
          ,'Дата проведения акта'
          ,'Производил замену'
          ,'Оборудование'
          ,'Код оборудования'
          ,'Код ТП 10 - 6 / 0,4 кВ'
          ,'Код Трансформатора'
          ,'Код Высоковольтной Ячейки'
          ,'Код ВЛ 6 - 10 кВ'
          ,'Код Опоры'
          ,'Место установки'
        );
   

procedure TfrmENDisconnectorChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDisconnectorChangeShow:=nil;
    inherited;
  end;


procedure TfrmENDisconnectorChangeShow.FormShow(Sender: TObject);
var
  TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
  i: Integer;
  ENDisconnectorChangeList: ENDisconnectorChangeShortList;
begin
  SetGridHeaders(
    ENDisconnectorChangeHeaders, sgENDisconnectorChange.ColumnHeaders);
  ColCount := 100;
  TempENDisconnectorChange :=
    HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
  if FilterObject = nil then
    begin
      FilterObject := ENDisconnectorChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENDisconnectorChangeList :=
    TempENDisconnectorChange.getScrollableFilteredList(
      ENDisconnectorChangeFilter(FilterObject), 0, ColCount);


  LastCount := High(ENDisconnectorChangeList.list);

  if LastCount > -1 then
    sgENDisconnectorChange.RowCount := LastCount + 2
  else
    sgENDisconnectorChange.RowCount := 2;

  with sgENDisconnectorChange do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        //Код Истории
        if ENDisconnectorChangeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENDisconnectorChangeList.list[i].code)
        else
          Cells[0,i+1] := '';
        //Характер замены
        Cells[1,i+1] := ENDisconnectorChangeList.list[i].name;
        //Дата установки
        if ENDisconnectorChangeList.list[i].installDate = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] := XSDate2String(
            ENDisconnectorChangeList.list[i].installDate);
        //Дата снятия
        if ENDisconnectorChangeList.list[i].uninstallDate = nil then
          Cells[3, i + 1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENDisconnectorChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4,i+1] := ENDisconnectorChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENDisconnectorChangeList.list[i].dateWorkOrder = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENDisconnectorChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6,i+1] := ENDisconnectorChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENDisconnectorChangeList.list[i].actDateGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENDisconnectorChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8,i+1] := ENDisconnectorChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENDisconnectorChangeList.list[i].materialRefCode <> low(Integer)
        then
          begin
            Cells[9, i + 1] := ENDisconnectorChangeList.list[i].materialRefName;
            if ENDisconnectorChangeList.list[i].matDriveRefCode <> low(Integer)
            then
              Cells[9, i + 1] := Cells[9, i + 1] + '. ' +
                ENDisconnectorChangeList.list[i].matDriveRefName;
          end
        else
          Cells[9, i + 1] := ENDisconnectorChangeList.list[i].disconnectorRefName;
        //Код оборудования
        if ENDisconnectorChangeList.list[i].disconnectorRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENDisconnectorChangeList.list[i].disconnectorRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENDisconnectorChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENDisconnectorChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[16, i + 1] :=
              ENDisconnectorChangeList.list[i].substation04RefName;
            if ENDisconnectorChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[16, i + 1] := Cells[16, i + 1] + ', Інв. № ' +
                ENDisconnectorChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //Код Трансформатора
        if ENDisconnectorChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENDisconnectorChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENDisconnectorChangeList.list[i].transformerRefName;
            if ENDisconnectorChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENDisconnectorChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //Код Высоковольтной Ячейки
        if ENDisconnectorChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENDisconnectorChangeList.list[i].highVoltCellRefCode);
            Cells[16, i + 1] := Cells[16, i + 1] + '. Високовольтна ланка № ' +
              ENDisconnectorChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';
        //Код ВЛ 6 - 10 кВ
        if ENDisconnectorChangeList.list[i].line10RefCode <> low(Integer) then
          begin
            Cells[14, i + 1] :=
              IntToStr(ENDisconnectorChangeList.list[i].line10RefCode);
            //Место установки
            Cells[16, i + 1] := ENDisconnectorChangeList.list[i].line10RefName;
            if ENDisconnectorChangeList.list[i].line10RefInvNumber <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + ', Інв. № ' +
                ENDisconnectorChangeList.list[i].line10RefInvNumber;
          end
        else
          Cells[14, i + 1] := '';
        //Код Опоры
        if ENDisconnectorChangeList.list[i].postRefCode <> low(Integer) then
          begin
            Cells[15, i + 1] :=
              IntToStr(ENDisconnectorChangeList.list[i].postRefCode);
            //Место установки
            Cells[16, i + 1] := Cells[16, i + 1] + '. Опора № ' +
              ENDisconnectorChangeList.list[i].postRefPostNumberGen;
          end
        else
          Cells[15, i + 1] := '';

        LastRow := i + 1;
        sgENDisconnectorChange.RowCount := LastRow + 1;
      end; //for i := 0 to LastCount do
  ColCount := ColCount + 1;
  sgENDisconnectorChange.Row := 1;
end;

procedure TfrmENDisconnectorChangeShow.sgENDisconnectorChangeTopLeftChanged(Sender: TObject);
var
  TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
  i,CurrentRow: Integer;
  ENDisconnectorChangeList: ENDisconnectorChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENDisconnectorChange.TopRow + sgENDisconnectorChange.VisibleRowCount) = ColCount
  then
    begin
      TempENDisconnectorChange :=  HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
      CurrentRow:=sgENDisconnectorChange.RowCount;

      if FilterObject = nil then
      begin
         FilterObject := ENDisconnectorChangeFilter.Create;
         SetNullIntProps(FilterObject);
         SetNullXSProps(FilterObject);
      end;

      ENDisconnectorChangeList := TempENDisconnectorChange.getScrollableFilteredList(ENDisconnectorChangeFilter(FilterObject),ColCount-1, 100);

      sgENDisconnectorChange.RowCount:=sgENDisconnectorChange.RowCount+100;
      LastCount:=High(ENDisconnectorChangeList.list);
      with sgENDisconnectorChange do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENDisconnectorChangeList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENDisconnectorChangeList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENDisconnectorChangeList.list[i].name;
            //Дата установки
            if ENDisconnectorChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(
                ENDisconnectorChangeList.list[i].installDate);
            //Дата снятия
            if ENDisconnectorChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENDisconnectorChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENDisconnectorChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENDisconnectorChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENDisconnectorChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENDisconnectorChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENDisconnectorChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENDisconnectorChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENDisconnectorChangeList.list[i].workerEquipChange;
            //Оборудование
            if ENDisconnectorChangeList.list[i].materialRefCode <> low(Integer)
            then
              begin
                Cells[9, i + CurrentRow] := ENDisconnectorChangeList.list[i].materialRefName;
                if ENDisconnectorChangeList.list[i].matDriveRefCode <> low(Integer)
                then
                  Cells[9, i + CurrentRow] := Cells[9, i + CurrentRow] + '. ' +
                    ENDisconnectorChangeList.list[i].matDriveRefName;
              end
            else
              Cells[9, i + CurrentRow] := ENDisconnectorChangeList.list[i].disconnectorRefName;
            //Код оборудования
            if ENDisconnectorChangeList.list[i].disconnectorRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENDisconnectorChangeList.list[i].disconnectorRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENDisconnectorChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENDisconnectorChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[16, i + CurrentRow] :=
                  ENDisconnectorChangeList.list[i].substation04RefName;
                if ENDisconnectorChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + ', Інв. № ' +
                    ENDisconnectorChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';
            //Код Высоковольтной Ячейки
            if ENDisconnectorChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENDisconnectorChangeList.list[i].highVoltCellRefCode);
                Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. Високовольтна ланка № ' +
                  ENDisconnectorChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';
            //Код ВЛ 6 - 10 кВ
            if ENDisconnectorChangeList.list[i].line10RefCode <> low(Integer) then
              begin
                Cells[14, i + CurrentRow] :=
                  IntToStr(ENDisconnectorChangeList.list[i].line10RefCode);
                //Место установки
                Cells[16, i + CurrentRow] := ENDisconnectorChangeList.list[i].line10RefName;
                if ENDisconnectorChangeList.list[i].line10RefInvNumber <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + ', Інв. № ' +
                    ENDisconnectorChangeList.list[i].line10RefInvNumber;
              end
            else
              Cells[14, i + CurrentRow] := '';
            //Код Опоры
            if ENDisconnectorChangeList.list[i].postRefCode <> low(Integer) then
              begin
                Cells[15, i + CurrentRow] :=
                  IntToStr(ENDisconnectorChangeList.list[i].postRefCode);
                //Место установки
                Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. Опора № ' +
                  ENDisconnectorChangeList.list[i].postRefPostNumberGen;
              end
            else
              Cells[15, i + CurrentRow] := '';

            LastRow:=i+CurrentRow;
          end;
        ColCount:=ColCount+100;
        sgENDisconnectorChange.Row:=CurrentRow-5;
        sgENDisconnectorChange.RowCount:=LastRow+1;
    end;
end;

procedure TfrmENDisconnectorChangeShow.sgENDisconnectorChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDisconnectorChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDisconnectorChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDisconnectorChange.RowCount-1 do
   for j:=0 to sgENDisconnectorChange.ColCount-1 do
     sgENDisconnectorChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDisconnectorChangeShow.actViewExecute(Sender: TObject);
Var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
begin
 TempENDisconnectorChange := HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
   try
     ENDisconnectorChangeObj := TempENDisconnectorChange.getObject(StrToInt(sgENDisconnectorChange.Cells[0,sgENDisconnectorChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorChangeEdit:=TfrmENDisconnectorChangeEdit.Create(Application, dsView);
  try
    frmENDisconnectorChangeEdit.ShowModal;
  finally
    frmENDisconnectorChangeEdit.Free;
    frmENDisconnectorChangeEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorChangeShow.actEditExecute(Sender: TObject);
Var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
begin
 TempENDisconnectorChange := HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
   try
     ENDisconnectorChangeObj := TempENDisconnectorChange.getObject(StrToInt(sgENDisconnectorChange.Cells[0,sgENDisconnectorChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDisconnectorChangeEdit:=TfrmENDisconnectorChangeEdit.Create(Application, dsEdit);
  try
    if frmENDisconnectorChangeEdit.ShowModal= mrOk then
      begin
        //TempENDisconnectorChange.save(ENDisconnectorChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDisconnectorChangeEdit.Free;
    frmENDisconnectorChangeEdit:=nil;
  end;
end;

procedure TfrmENDisconnectorChangeShow.actDeleteExecute(Sender: TObject);
Var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDisconnectorChange := HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDisconnectorChange.Cells[0,sgENDisconnectorChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена разъединителей) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDisconnectorChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDisconnectorChangeShow.actInsertExecute(Sender: TObject);
Var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
begin
  TempENDisconnectorChange := HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
  ENDisconnectorChangeObj:=ENDisconnectorChange.Create;

   //ENDisconnectorChangeObj.installDate:= TXSDate.Create;
   //ENDisconnectorChangeObj.uninstallDate:= TXSDate.Create;
   //ENDisconnectorChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENDisconnectorChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENDisconnectorChangeEdit:=TfrmENDisconnectorChangeEdit.Create(Application, dsInsert);
    try
      if frmENDisconnectorChangeEdit.ShowModal = mrOk then
      begin
        if ENDisconnectorChangeObj<>nil then
            //TempENDisconnectorChange.add(ENDisconnectorChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDisconnectorChangeEdit.Free;
      frmENDisconnectorChangeEdit:=nil;
    end;
  finally
    ENDisconnectorChangeObj.Free;
  end;
end;

procedure TfrmENDisconnectorChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDisconnectorChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENDisconnectorChangeFilterEdit:=TfrmENDisconnectorChangeFilterEdit.Create(Application, dsInsert);
  try
    ENDisconnectorChangeFilterObj := ENDisconnectorChangeFilter.Create;
    SetNullIntProps(ENDisconnectorChangeFilterObj);
    SetNullXSProps(ENDisconnectorChangeFilterObj);

    if frmENDisconnectorChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDisconnectorChangeFilter.Create;
      FilterObject := ENDisconnectorChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDisconnectorChangeFilterEdit.Free;
    frmENDisconnectorChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENDisconnectorChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
