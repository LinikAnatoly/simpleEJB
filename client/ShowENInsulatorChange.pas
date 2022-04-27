//История замен Изоляторов
unit ShowENInsulatorChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENInsulatorChangeController, AdvObj ;


type
  TfrmENInsulatorChangeShow = class(TChildForm)  
  HTTPRIOENInsulatorChange: THTTPRIO;
    ImageList1: TImageList;
    sgENInsulatorChange: TAdvStringGrid;
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
procedure sgENInsulatorChangeTopLeftChanged(Sender: TObject);
procedure sgENInsulatorChangeDblClick(Sender: TObject);
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
 frmENInsulatorChangeShow : TfrmENInsulatorChangeShow;
 // ENInsulatorChangeObj: ENInsulatorChange;
 // ENInsulatorChangeFilterObj: ENInsulatorChangeFilter;
  
  
implementation

uses Main, EditENInsulatorChange, EditENInsulatorChangeFilter;


{$R *.dfm}

var
  //frmENInsulatorChangeShow : TfrmENInsulatorChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInsulatorChangeHeaders: array [1..17] of String =
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
   

procedure TfrmENInsulatorChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENInsulatorChangeShow:=nil;
    inherited;
  end;


procedure TfrmENInsulatorChangeShow.FormShow(Sender: TObject);
var
  TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
  i: Integer;
  ENInsulatorChangeList: ENInsulatorChangeShortList;
  begin
  SetGridHeaders(ENInsulatorChangeHeaders, sgENInsulatorChange.ColumnHeaders);
  ColCount:=100;
  TempENInsulatorChange :=  HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENInsulatorChangeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENInsulatorChangeList := TempENInsulatorChange.getScrollableFilteredList(ENInsulatorChangeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENInsulatorChangeList.list);

  if LastCount > -1 then
     sgENInsulatorChange.RowCount:=LastCount+2
  else
     sgENInsulatorChange.RowCount:=2;

   with sgENInsulatorChange do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        //Код Истории
        if ENInsulatorChangeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENInsulatorChangeList.list[i].code)
        else
          Cells[0,i+1] := '';
        //Характер замены
        Cells[1,i+1] := ENInsulatorChangeList.list[i].name;
        //Дата установки
        if ENInsulatorChangeList.list[i].installDate = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] := XSDate2String(
            ENInsulatorChangeList.list[i].installDate);
        //Дата снятия
        if ENInsulatorChangeList.list[i].uninstallDate = nil then
          Cells[3, i + 1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENInsulatorChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4,i+1] := ENInsulatorChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENInsulatorChangeList.list[i].dateWorkOrder = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENInsulatorChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6,i+1] := ENInsulatorChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENInsulatorChangeList.list[i].actDateGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENInsulatorChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8,i+1] := ENInsulatorChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENInsulatorChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENInsulatorChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENInsulatorChangeList.list[i].insulatorRefName;
        //Код оборудования
        if ENInsulatorChangeList.list[i].InsulatorRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENInsulatorChangeList.list[i].InsulatorRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENInsulatorChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENInsulatorChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[16, i + 1] :=
              ENInsulatorChangeList.list[i].substation04RefName;
            if ENInsulatorChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[16, i + 1] := Cells[16, i + 1] + ', Інв. № ' +
                ENInsulatorChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //Код Трансформатора
        if ENInsulatorChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENInsulatorChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENInsulatorChangeList.list[i].transformerRefName;
            if ENInsulatorChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENInsulatorChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //Код Высоковольтной Ячейки
        if ENInsulatorChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENInsulatorChangeList.list[i].highVoltCellRefCode);
            Cells[16, i + 1] := Cells[16, i + 1] + '. Високовольтна ланка № ' +
              ENInsulatorChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';
        //Код ВЛ 6 - 10 кВ
        if ENInsulatorChangeList.list[i].line10RefCode <> low(Integer) then
          begin
            Cells[14, i + 1] :=
              IntToStr(ENInsulatorChangeList.list[i].line10RefCode);
            //Место установки
            Cells[16, i + 1] := ENInsulatorChangeList.list[i].line10RefName;
            if ENInsulatorChangeList.list[i].line10RefInvNumber <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + ', Інв. № ' +
                ENInsulatorChangeList.list[i].line10RefInvNumber;
          end
        else
          Cells[14, i + 1] := '';
        //Код Опоры
        if ENInsulatorChangeList.list[i].postRefCode <> low(Integer) then
          begin
            Cells[15, i + 1] :=
              IntToStr(ENInsulatorChangeList.list[i].postRefCode);
            //Место установки
            Cells[16, i + 1] := Cells[16, i + 1] + '. Опора № ' +
              ENInsulatorChangeList.list[i].postRefPostNumberGen;
          end
        else
          Cells[15, i + 1] := '';

        LastRow:=i+1;
        sgENInsulatorChange.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENInsulatorChange.Row:=1;
end;

procedure TfrmENInsulatorChangeShow.sgENInsulatorChangeTopLeftChanged(Sender: TObject);
var
  TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
  i,CurrentRow: Integer;
  ENInsulatorChangeList: ENInsulatorChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENInsulatorChange.TopRow + sgENInsulatorChange.VisibleRowCount) = ColCount
  then
    begin
      TempENInsulatorChange :=  HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
      CurrentRow:=sgENInsulatorChange.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENInsulatorChangeFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENInsulatorChangeList := TempENInsulatorChange.getScrollableFilteredList(ENInsulatorChangeFilter(FilterObject),ColCount-1, 100);

      sgENInsulatorChange.RowCount:=sgENInsulatorChange.RowCount+100;
      LastCount:=High(ENInsulatorChangeList.list);
      with sgENInsulatorChange do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENInsulatorChangeList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENInsulatorChangeList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENInsulatorChangeList.list[i].name;
            //Дата установки
            if ENInsulatorChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(
                ENInsulatorChangeList.list[i].installDate);
            //Дата снятия
            if ENInsulatorChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENInsulatorChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENInsulatorChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENInsulatorChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENInsulatorChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENInsulatorChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENInsulatorChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENInsulatorChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENInsulatorChangeList.list[i].workerEquipChange;
            //Оборудование
            if ENInsulatorChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] := ENInsulatorChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] := ENInsulatorChangeList.list[i].InsulatorRefName;
            //Код оборудования
            if ENInsulatorChangeList.list[i].InsulatorRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENInsulatorChangeList.list[i].InsulatorRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENInsulatorChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENInsulatorChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[16, i + CurrentRow] :=
                  ENInsulatorChangeList.list[i].substation04RefName;
                if ENInsulatorChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + ', Інв. № ' +
                    ENInsulatorChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';
            //Код Высоковольтной Ячейки
            if ENInsulatorChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENInsulatorChangeList.list[i].highVoltCellRefCode);
                Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. Високовольтна ланка № ' +
                  ENInsulatorChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';
            //Код ВЛ 6 - 10 кВ
            if ENInsulatorChangeList.list[i].line10RefCode <> low(Integer) then
              begin
                Cells[14, i + CurrentRow] :=
                  IntToStr(ENInsulatorChangeList.list[i].line10RefCode);
                //Место установки
                Cells[16, i + CurrentRow] := ENInsulatorChangeList.list[i].line10RefName;
                if ENInsulatorChangeList.list[i].line10RefInvNumber <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + ', Інв. № ' +
                    ENInsulatorChangeList.list[i].line10RefInvNumber;
              end
            else
              Cells[14, i + CurrentRow] := '';
            //Код Опоры
            if ENInsulatorChangeList.list[i].postRefCode <> low(Integer) then
              begin
                Cells[15, i + CurrentRow] :=
                  IntToStr(ENInsulatorChangeList.list[i].postRefCode);
                //Место установки
                Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. Опора № ' +
                  ENInsulatorChangeList.list[i].postRefPostNumberGen;
              end
            else
              Cells[15, i + CurrentRow] := '';

            LastRow := i + CurrentRow;
          end;
       ColCount:=ColCount + 100;
       sgENInsulatorChange.Row := CurrentRow - 5;
       sgENInsulatorChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENInsulatorChangeShow.sgENInsulatorChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENInsulatorChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENInsulatorChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENInsulatorChange.RowCount-1 do
   for j:=0 to sgENInsulatorChange.ColCount-1 do
     sgENInsulatorChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENInsulatorChangeShow.actViewExecute(Sender: TObject);
Var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
begin
 TempENInsulatorChange := HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
   try
     ENInsulatorChangeObj := TempENInsulatorChange.getObject(StrToInt(sgENInsulatorChange.Cells[0,sgENInsulatorChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInsulatorChangeEdit:=TfrmENInsulatorChangeEdit.Create(Application, dsView);
  try
    frmENInsulatorChangeEdit.ShowModal;
  finally
    frmENInsulatorChangeEdit.Free;
    frmENInsulatorChangeEdit:=nil;
  end;
end;

procedure TfrmENInsulatorChangeShow.actEditExecute(Sender: TObject);
Var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
begin
 TempENInsulatorChange := HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
   try
     ENInsulatorChangeObj := TempENInsulatorChange.getObject(StrToInt(sgENInsulatorChange.Cells[0,sgENInsulatorChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENInsulatorChangeEdit:=TfrmENInsulatorChangeEdit.Create(Application, dsEdit);
  try
    if frmENInsulatorChangeEdit.ShowModal= mrOk then
      begin
        //TempENInsulatorChange.save(ENInsulatorChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENInsulatorChangeEdit.Free;
    frmENInsulatorChangeEdit:=nil;
  end;
end;

procedure TfrmENInsulatorChangeShow.actDeleteExecute(Sender: TObject);
Var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENInsulatorChange := HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENInsulatorChange.Cells[0,sgENInsulatorChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена изоляторов) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENInsulatorChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENInsulatorChangeShow.actInsertExecute(Sender: TObject);
Var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
begin
  TempENInsulatorChange := HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
  ENInsulatorChangeObj:=ENInsulatorChange.Create;

   //ENInsulatorChangeObj.installDate:= TXSDate.Create;
   //ENInsulatorChangeObj.uninstallDate:= TXSDate.Create;
   //ENInsulatorChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENInsulatorChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENInsulatorChangeEdit:=TfrmENInsulatorChangeEdit.Create(Application, dsInsert);
    try
      if frmENInsulatorChangeEdit.ShowModal = mrOk then
      begin
        if ENInsulatorChangeObj<>nil then
            //TempENInsulatorChange.add(ENInsulatorChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENInsulatorChangeEdit.Free;
      frmENInsulatorChangeEdit:=nil;
    end;
  finally
    ENInsulatorChangeObj.Free;
  end;
end;

procedure TfrmENInsulatorChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENInsulatorChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENInsulatorChangeFilterEdit:=TfrmENInsulatorChangeFilterEdit.Create(Application, dsInsert);
  try
    ENInsulatorChangeFilterObj := ENInsulatorChangeFilter.Create;
    SetNullIntProps(ENInsulatorChangeFilterObj);
    SetNullXSProps(ENInsulatorChangeFilterObj);

    if frmENInsulatorChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENInsulatorChangeFilter.Create;
      FilterObject := ENInsulatorChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENInsulatorChangeFilterEdit.Free;
    frmENInsulatorChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENInsulatorChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.