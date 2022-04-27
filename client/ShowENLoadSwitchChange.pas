//История замен Выключателей Нагрузки
unit ShowENLoadSwitchChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLoadSwitchChangeController, AdvObj ;


type
  TfrmENLoadSwitchChangeShow = class(TChildForm)  
  HTTPRIOENLoadSwitchChange: THTTPRIO;
    ImageList1: TImageList;
    sgENLoadSwitchChange: TAdvStringGrid;
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
procedure sgENLoadSwitchChangeTopLeftChanged(Sender: TObject);
procedure sgENLoadSwitchChangeDblClick(Sender: TObject);
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
 frmENLoadSwitchChangeShow : TfrmENLoadSwitchChangeShow;
 // ENLoadSwitchChangeObj: ENLoadSwitchChange;
 // ENLoadSwitchChangeFilterObj: ENLoadSwitchChangeFilter;
  
  
implementation

uses Main, EditENLoadSwitchChange, EditENLoadSwitchChangeFilter;


{$R *.dfm}

var
  //frmENLoadSwitchChangeShow : TfrmENLoadSwitchChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLoadSwitchChangeHeaders: array [1..15] of String =
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
          ,'Место установки'
        );
   

procedure TfrmENLoadSwitchChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLoadSwitchChangeShow:=nil;
    inherited;
  end;


procedure TfrmENLoadSwitchChangeShow.FormShow(Sender: TObject);
var
  TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
  i: Integer;
  ENLoadSwitchChangeList: ENLoadSwitchChangeShortList;
begin
  SetGridHeaders(ENLoadSwitchChangeHeaders, sgENLoadSwitchChange.ColumnHeaders);
  ColCount:=100;
  TempENLoadSwitchChange :=  HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENLoadSwitchChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENLoadSwitchChangeList := TempENLoadSwitchChange.getScrollableFilteredList(ENLoadSwitchChangeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLoadSwitchChangeList.list);

  if LastCount > -1 then
    sgENLoadSwitchChange.RowCount:=LastCount+2
  else
    sgENLoadSwitchChange.RowCount:=2;

  with sgENLoadSwitchChange do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        //Код Истории
        if ENLoadSwitchChangeList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENLoadSwitchChangeList.list[i].code)
        else
        Cells[0, i + 1] := '';
        //Характер замены
        Cells[1, i + 1] := ENLoadSwitchChangeList.list[i].name;
        //Установлено
        if ENLoadSwitchChangeList.list[i].installDate = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] := XSDate2String(ENLoadSwitchChangeList.list[i].installDate);
        //Снято
        if ENLoadSwitchChangeList.list[i].uninstallDate = nil then
          Cells[3, i + 1] := ''
        else
          Cells[3, i + 1] := XSDate2String(ENLoadSwitchChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4, i + 1] := ENLoadSwitchChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENLoadSwitchChangeList.list[i].dateWorkOrder = nil then
          Cells[5, i + 1] := ''
        else
          Cells[5, i + 1] := XSDate2String(ENLoadSwitchChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6, i + 1] := ENLoadSwitchChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENLoadSwitchChangeList.list[i].actDateGen = nil then
          Cells[7, i + 1] := ''
        else
          Cells[7, i + 1] := XSDate2String(ENLoadSwitchChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8, i + 1] := ENLoadSwitchChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENLoadSwitchChangeList.list[i].materialRefCode <> low(Integer)
        then
          begin
            Cells[9, i + 1] := ENLoadSwitchChangeList.list[i].materialRefName;
            if ENLoadSwitchChangeList.list[i].matDriveRefCode <> low(Integer)
            then
              Cells[9, i + 1] := Cells[9, i + 1] + '. ' +
                ENLoadSwitchChangeList.list[i].matDriveRefName;
          end
        else
          Cells[9, i + 1] := ENLoadSwitchChangeList.list[i].LoadSwitchRefName;
        //Код оборудования
        if ENLoadSwitchChangeList.list[i].LoadSwitchRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENLoadSwitchChangeList.list[i].LoadSwitchRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENLoadSwitchChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENLoadSwitchChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[14, i + 1] :=
              ENLoadSwitchChangeList.list[i].substation04RefName;
            if ENLoadSwitchChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENLoadSwitchChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //Код Трансформатора
        if ENLoadSwitchChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENLoadSwitchChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENLoadSwitchChangeList.list[i].transformerRefName;
            if ENLoadSwitchChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENLoadSwitchChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //Код Высоковольтной Ячейки
        if ENLoadSwitchChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENLoadSwitchChangeList.list[i].highVoltCellRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. Високовольтна ланка № ' +
              ENLoadSwitchChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';

        LastRow:=i+1;
        sgENLoadSwitchChange.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENLoadSwitchChange.Row:=1;
end;

procedure TfrmENLoadSwitchChangeShow.sgENLoadSwitchChangeTopLeftChanged(Sender: TObject);
var
  TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
  i,CurrentRow: Integer;
  ENLoadSwitchChangeList: ENLoadSwitchChangeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLoadSwitchChange.TopRow + sgENLoadSwitchChange.VisibleRowCount) = ColCount
  then
    begin
      TempENLoadSwitchChange :=  HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
      CurrentRow:=sgENLoadSwitchChange.RowCount;

      if FilterObject = nil then
      begin
         FilterObject := ENLoadSwitchChangeFilter.Create;
         SetNullIntProps(FilterObject);
         SetNullXSProps(FilterObject);
      end;

      ENLoadSwitchChangeList := TempENLoadSwitchChange.getScrollableFilteredList(ENLoadSwitchChangeFilter(FilterObject),ColCount-1, 100);

      sgENLoadSwitchChange.RowCount:=sgENLoadSwitchChange.RowCount+100;
      LastCount:=High(ENLoadSwitchChangeList.list);
      with sgENLoadSwitchChange do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENLoadSwitchChangeList.list[i].code <> Low(Integer) then
            Cells[0, i + CurrentRow] := IntToStr(ENLoadSwitchChangeList.list[i].code)
            else
            Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENLoadSwitchChangeList.list[i].name;
            //Установлено
            if ENLoadSwitchChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENLoadSwitchChangeList.list[i].installDate);
            //Снято
            if ENLoadSwitchChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENLoadSwitchChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENLoadSwitchChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENLoadSwitchChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENLoadSwitchChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENLoadSwitchChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENLoadSwitchChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENLoadSwitchChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENLoadSwitchChangeList.list[i].workerEquipChange;

            //Оборудование
            if ENLoadSwitchChangeList.list[i].materialRefCode <> low(Integer)
            then
              begin
                Cells[9, i + CurrentRow] := ENLoadSwitchChangeList.list[i].materialRefName;
                if ENLoadSwitchChangeList.list[i].matDriveRefCode <> low(Integer)
                then
                  Cells[9, i + CurrentRow] := Cells[9, i + CurrentRow] + '. ' +
                    ENLoadSwitchChangeList.list[i].matDriveRefName;
              end
            else
              Cells[9, i + CurrentRow] := ENLoadSwitchChangeList.list[i].LoadSwitchRefName;
            //Код оборудования
            if ENLoadSwitchChangeList.list[i].LoadSwitchRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENLoadSwitchChangeList.list[i].LoadSwitchRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENLoadSwitchChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENLoadSwitchChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[14, i + CurrentRow] :=
                  ENLoadSwitchChangeList.list[i].substation04RefName;
                if ENLoadSwitchChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + ', Інв. № ' +
                    ENLoadSwitchChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';
            //Код Высоковольтной Ячейки
            if ENLoadSwitchChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENLoadSwitchChangeList.list[i].highVoltCellRefCode);
                //Место установки
                Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + '. Високовольтна ланка № ' +
                  ENLoadSwitchChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';

            LastRow:=i+CurrentRow;
          end;
       ColCount:=ColCount+100;
       sgENLoadSwitchChange.Row:=CurrentRow-5;
       sgENLoadSwitchChange.RowCount:=LastRow+1;
    end;
end;

procedure TfrmENLoadSwitchChangeShow.sgENLoadSwitchChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLoadSwitchChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLoadSwitchChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLoadSwitchChange.RowCount-1 do
   for j:=0 to sgENLoadSwitchChange.ColCount-1 do
     sgENLoadSwitchChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLoadSwitchChangeShow.actViewExecute(Sender: TObject);
Var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
begin
 TempENLoadSwitchChange := HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
   try
     ENLoadSwitchChangeObj := TempENLoadSwitchChange.getObject(StrToInt(sgENLoadSwitchChange.Cells[0,sgENLoadSwitchChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchChangeEdit:=TfrmENLoadSwitchChangeEdit.Create(Application, dsView);
  try
    frmENLoadSwitchChangeEdit.ShowModal;
  finally
    frmENLoadSwitchChangeEdit.Free;
    frmENLoadSwitchChangeEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchChangeShow.actEditExecute(Sender: TObject);
Var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
begin
 TempENLoadSwitchChange := HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
   try
     ENLoadSwitchChangeObj := TempENLoadSwitchChange.getObject(StrToInt(sgENLoadSwitchChange.Cells[0,sgENLoadSwitchChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchChangeEdit:=TfrmENLoadSwitchChangeEdit.Create(Application, dsEdit);
  try
    if frmENLoadSwitchChangeEdit.ShowModal= mrOk then
      begin
        //TempENLoadSwitchChange.save(ENLoadSwitchChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLoadSwitchChangeEdit.Free;
    frmENLoadSwitchChangeEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchChangeShow.actDeleteExecute(Sender: TObject);
Var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLoadSwitchChange := HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLoadSwitchChange.Cells[0,sgENLoadSwitchChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена разъединителей) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLoadSwitchChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLoadSwitchChangeShow.actInsertExecute(Sender: TObject);
Var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
begin
  TempENLoadSwitchChange := HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
  ENLoadSwitchChangeObj:=ENLoadSwitchChange.Create;

   //ENLoadSwitchChangeObj.installDate:= TXSDate.Create;
   //ENLoadSwitchChangeObj.uninstallDate:= TXSDate.Create;
   //ENLoadSwitchChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENLoadSwitchChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENLoadSwitchChangeEdit:=TfrmENLoadSwitchChangeEdit.Create(Application, dsInsert);
    try
      if frmENLoadSwitchChangeEdit.ShowModal = mrOk then
      begin
        if ENLoadSwitchChangeObj<>nil then
            //TempENLoadSwitchChange.add(ENLoadSwitchChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLoadSwitchChangeEdit.Free;
      frmENLoadSwitchChangeEdit:=nil;
    end;
  finally
    ENLoadSwitchChangeObj.Free;
  end;
end;

procedure TfrmENLoadSwitchChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLoadSwitchChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENLoadSwitchChangeFilterEdit:=TfrmENLoadSwitchChangeFilterEdit.Create(Application, dsInsert);
  try
    ENLoadSwitchChangeFilterObj := ENLoadSwitchChangeFilter.Create;
    SetNullIntProps(ENLoadSwitchChangeFilterObj);
    SetNullXSProps(ENLoadSwitchChangeFilterObj);

    if frmENLoadSwitchChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLoadSwitchChangeFilter.Create;
      FilterObject := ENLoadSwitchChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLoadSwitchChangeFilterEdit.Free;
    frmENLoadSwitchChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENLoadSwitchChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.