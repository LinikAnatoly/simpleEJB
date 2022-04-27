//История замен Электрических Шин
unit ShowENBusChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBusChangeController, AdvObj ;


type
  TfrmENBusChangeShow = class(TChildForm)  
  HTTPRIOENBusChange: THTTPRIO;
    ImageList1: TImageList;
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
    sgENBusChange: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENBusChangeTopLeftChanged(Sender: TObject);
procedure sgENBusChangeDblClick(Sender: TObject);
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
 frmENBusChangeShow : TfrmENBusChangeShow;
 // ENBusChangeObj: ENBusChange;
 // ENBusChangeFilterObj: ENBusChangeFilter;
  
  
implementation

uses Main, EditENBusChange, EditENBusChangeFilter;


{$R *.dfm}

var
  //frmENBusChangeShow : TfrmENBusChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBusChangeHeaders: array [1..15] of String =
        ( 'Код Истории'
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
          ,'Место установки'
        );
   

procedure TfrmENBusChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBusChangeShow:=nil;
    inherited;
  end;


procedure TfrmENBusChangeShow.FormShow(Sender: TObject);
var TempENBusChange: ENBusChangeControllerSoapPort;
  i: Integer;
  ENBusChangeList: ENBusChangeShortList;
begin
  SetGridHeaders(ENBusChangeHeaders, sgENBusChange.ColumnHeaders);
  ColCount:=100;
  TempENBusChange :=  HTTPRIOENBusChange as ENBusChangeControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENBusChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENBusChangeList := TempENBusChange.getScrollableFilteredList(ENBusChangeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBusChangeList.list);

  if LastCount > -1 then
    sgENBusChange.RowCount := LastCount + 2
  else
    sgENBusChange.RowCount := 2;

  with sgENBusChange do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        //Код Истории
        if ENBusChangeList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENBusChangeList.list[i].code)
        else
        Cells[0, i + 1] := '';
        //Характер замены
        Cells[1, i + 1] := ENBusChangeList.list[i].name;
        //Установлено
        if ENBusChangeList.list[i].installDate = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] := XSDate2String(ENBusChangeList.list[i].installDate);
        //Снято
        if ENBusChangeList.list[i].uninstallDate = nil then
          Cells[3, i + 1] := ''
        else
          Cells[3, i + 1] := XSDate2String(ENBusChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4, i + 1] := ENBusChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENBusChangeList.list[i].dateWorkOrder = nil then
          Cells[5, i + 1] := ''
        else
          Cells[5, i + 1] := XSDate2String(ENBusChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6, i + 1] := ENBusChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENBusChangeList.list[i].actDateGen = nil then
          Cells[7, i + 1] := ''
        else
          Cells[7, i + 1] := XSDate2String(ENBusChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8, i + 1] := ENBusChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENBusChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENBusChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENBusChangeList.list[i].BusRefName;
        //Код оборудования
        if ENBusChangeList.list[i].BusRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENBusChangeList.list[i].BusRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENBusChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENBusChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[14, i + 1] :=
              ENBusChangeList.list[i].substation04RefName;
            if ENBusChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENBusChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //Код Трансформатора
        if ENBusChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENBusChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENBusChangeList.list[i].transformerRefName;
            if ENBusChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENBusChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //Код Высоковольтной Ячейки
        if ENBusChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENBusChangeList.list[i].highVoltCellRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. Високовольтна ланка № ' +
              ENBusChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';

        LastRow := i + 1;
        sgENBusChange.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENBusChange.Row := 1;
end;

procedure TfrmENBusChangeShow.sgENBusChangeTopLeftChanged(Sender: TObject);
var
  TempENBusChange: ENBusChangeControllerSoapPort;
  i,CurrentRow: Integer;
  ENBusChangeList: ENBusChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENBusChange.TopRow + sgENBusChange.VisibleRowCount) = ColCount
  then
    begin
      TempENBusChange :=  HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
      CurrentRow:=sgENBusChange.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENBusChangeFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENBusChangeList := TempENBusChange.getScrollableFilteredList(
        ENBusChangeFilter(FilterObject), ColCount - 1, 100);

      sgENBusChange.RowCount := sgENBusChange.RowCount + 100;
      LastCount := High(ENBusChangeList.list);
      with sgENBusChange do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENBusChangeList.list[i].code <> Low(Integer) then
            Cells[0, i + CurrentRow] := IntToStr(ENBusChangeList.list[i].code)
            else
            Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENBusChangeList.list[i].name;
            //Установлено
            if ENBusChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENBusChangeList.list[i].installDate);
            //Снято
            if ENBusChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENBusChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENBusChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENBusChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENBusChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENBusChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENBusChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENBusChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENBusChangeList.list[i].workerEquipChange;

            //Оборудование
            if ENBusChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] := ENBusChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] := ENBusChangeList.list[i].BusRefName;
            //Код оборудования
            if ENBusChangeList.list[i].BusRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENBusChangeList.list[i].BusRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENBusChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENBusChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[14, i + CurrentRow] :=
                  ENBusChangeList.list[i].substation04RefName;
                if ENBusChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + ', Інв. № ' +
                    ENBusChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';
            //Код Высоковольтной Ячейки
            if ENBusChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENBusChangeList.list[i].highVoltCellRefCode);
                //Место установки
                Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + '. Високовольтна ланка № ' +
                  ENBusChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';

            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENBusChange.Row := CurrentRow - 5;
       sgENBusChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENBusChangeShow.sgENBusChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBusChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBusChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBusChange.RowCount-1 do
   for j:=0 to sgENBusChange.ColCount-1 do
     sgENBusChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBusChangeShow.actViewExecute(Sender: TObject);
Var TempENBusChange: ENBusChangeControllerSoapPort;
begin
 TempENBusChange := HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
   try
     ENBusChangeObj := TempENBusChange.getObject(StrToInt(sgENBusChange.Cells[0,sgENBusChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBusChangeEdit:=TfrmENBusChangeEdit.Create(Application, dsView);
  try
    frmENBusChangeEdit.ShowModal;
  finally
    frmENBusChangeEdit.Free;
    frmENBusChangeEdit:=nil;
  end;
end;

procedure TfrmENBusChangeShow.actEditExecute(Sender: TObject);
Var TempENBusChange: ENBusChangeControllerSoapPort;
begin
 TempENBusChange := HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
   try
     ENBusChangeObj := TempENBusChange.getObject(StrToInt(sgENBusChange.Cells[0,sgENBusChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBusChangeEdit:=TfrmENBusChangeEdit.Create(Application, dsEdit);
  try
    if frmENBusChangeEdit.ShowModal= mrOk then
      begin
        //TempENBusChange.save(ENBusChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBusChangeEdit.Free;
    frmENBusChangeEdit:=nil;
  end;
end;

procedure TfrmENBusChangeShow.actDeleteExecute(Sender: TObject);
Var TempENBusChange: ENBusChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBusChange := HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBusChange.Cells[0,sgENBusChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена шин) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBusChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBusChangeShow.actInsertExecute(Sender: TObject);
Var TempENBusChange: ENBusChangeControllerSoapPort;
begin
  TempENBusChange := HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
  ENBusChangeObj:=ENBusChange.Create;

   //ENBusChangeObj.installDate:= TXSDate.Create;
   //ENBusChangeObj.uninstallDate:= TXSDate.Create;
   //ENBusChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENBusChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENBusChangeEdit:=TfrmENBusChangeEdit.Create(Application, dsInsert);
    try
      if frmENBusChangeEdit.ShowModal = mrOk then
      begin
        if ENBusChangeObj<>nil then
            //TempENBusChange.add(ENBusChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBusChangeEdit.Free;
      frmENBusChangeEdit:=nil;
    end;
  finally
    ENBusChangeObj.Free;
  end;
end;

procedure TfrmENBusChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBusChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENBusChangeFilterEdit:=TfrmENBusChangeFilterEdit.Create(Application, dsInsert);
  try
    ENBusChangeFilterObj := ENBusChangeFilter.Create;
    SetNullIntProps(ENBusChangeFilterObj);
    SetNullXSProps(ENBusChangeFilterObj);

    if frmENBusChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBusChangeFilter.Create;
      FilterObject := ENBusChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBusChangeFilterEdit.Free;
    frmENBusChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENBusChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.