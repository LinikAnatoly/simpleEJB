//История замен Предохранителей
unit ShowENFuseChange;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2, ENFuseChangeController, AdvObj;


type
  TfrmENFuseChangeShow = class(TChildForm)  
  HTTPRIOENFuseChange: THTTPRIO;
    ImageList1: TImageList;
    sgENFuseChange: TAdvStringGrid;
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
    procedure sgENFuseChangeTopLeftChanged(Sender: TObject);
    procedure sgENFuseChangeDblClick(Sender: TObject);
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
  frmENFuseChangeShow: TfrmENFuseChangeShow;

implementation

uses Main, EditENFuseChange, EditENFuseChangeFilter;

{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuseChangeHeaders: array [1..18] of String =
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
          ,'Код Низковольтного Щита'
          ,'Код Панели НВЩ'
          ,'Код Отходящего Присоединения'
          ,'Место установки'
        );
   

procedure TfrmENFuseChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuseChangeShow:=nil;
    inherited;
  end;


procedure TfrmENFuseChangeShow.FormShow(Sender: TObject);
var TempENFuseChange: ENFuseChangeControllerSoapPort;
  i: Integer;
  ENFuseChangeList: ENFuseChangeShortList;
begin
  SetGridHeaders(ENFuseChangeHeaders, sgENFuseChange.ColumnHeaders);
  ColCount:=100;
  TempENFuseChange :=  HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENFuseChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENFuseChangeList := TempENFuseChange.getScrollableFilteredList(
    ENFuseChangeFilter(FilterObject), 0, ColCount);

  LastCount := High(ENFuseChangeList.list);

  if LastCount > -1 then
    sgENFuseChange.RowCount:=LastCount+2
  else
    sgENFuseChange.RowCount:=2;

  with sgENFuseChange do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        //Код Истории
        if ENFuseChangeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENFuseChangeList.list[i].code)
        else
          Cells[0,i+1] := '';
        //Характер замены
        Cells[1,i+1] := ENFuseChangeList.list[i].name;
        //Установлено
        if ENFuseChangeList.list[i].installDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENFuseChangeList.list[i].installDate);
        //Снято
        if ENFuseChangeList.list[i].uninstallDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENFuseChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4,i+1] := ENFuseChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENFuseChangeList.list[i].dateWorkOrder = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENFuseChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6,i+1] := ENFuseChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENFuseChangeList.list[i].actDateGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENFuseChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8,i+1] := ENFuseChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENFuseChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENFuseChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENFuseChangeList.list[i].FuseRefName;
        //Код оборудования
        if ENFuseChangeList.list[i].FuseRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENFuseChangeList.list[i].FuseRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENFuseChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENFuseChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[17, i + 1] :=
              ENFuseChangeList.list[i].substation04RefName;
            if ENFuseChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[17, i + 1] := Cells[17, i + 1] + ', Інв. № ' +
                ENFuseChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //Код Трансформатора
        if ENFuseChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENFuseChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENFuseChangeList.list[i].transformerRefName;
            if ENFuseChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENFuseChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //Код Высоковольтной Ячейки
        if ENFuseChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENFuseChangeList.list[i].highVoltCellRefCode);
            //Место установки
            Cells[17, i + 1] := Cells[17, i + 1] + '. Високовольтна ланка № ' +
              ENFuseChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';

        //Код Низковольтного Щита
        if ENFuseChangeList.list[i].lvbRefCode <> low(Integer) then
          begin
            Cells[14, i + 1] := IntToStr(ENFuseChangeList.list[i].lvbRefCode);
            //Место установки
            if ENFuseChangeList.list[i].lvbRefName <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENFuseChangeList.list[i].lvbRefName;
          end //if ENFuseChangeList.list[i].lvbRefCode <> low(Integer) then
        else
          Cells[14, i + 1] := '';
        //Код Панели НВЩ
        if ENFuseChangeList.list[i].pnlRefCode <> low(Integer) then
          begin
            Cells[15, i + 1] := IntToStr(ENFuseChangeList.list[i].pnlRefCode);
            //Место установки
            if ENFuseChangeList.list[i].pnlRefName <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENFuseChangeList.list[i].pnlRefName;
          end //if ENFuseChangeList.list[i].pnlRefCode <> low(Integer) then
        else
          Cells[15, i + 1] := '';
        //Код Отходящего Присоединения
        if ENFuseChangeList.list[i].branchRefCode <> low(Integer) then
          begin
            Cells[16, i + 1] := IntToStr(ENFuseChangeList.list[i].branchRefCode);
            //Место установки
            if ENFuseChangeList.list[i].branchRefNumberGen <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENFuseChangeList.list[i].branchRefNumberGen;
            if ENFuseChangeList.list[i].branchRefName <> '' then
              Cells[17, i + 1] := Cells[17, i + 1] + '. ' +
                ENFuseChangeList.list[i].branchRefName;
          end //if ENFuseChangeList.list[i].branchRefCode <> low(Integer) then
        else
          Cells[16, i + 1] := '';

        LastRow := i + 1;
        sgENFuseChange.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENFuseChange.Row := 1;
end;

procedure TfrmENFuseChangeShow.sgENFuseChangeTopLeftChanged(Sender: TObject);
var TempENFuseChange: ENFuseChangeControllerSoapPort;
  i, CurrentRow: Integer;
  ENFuseChangeList: ENFuseChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENFuseChange.TopRow + sgENFuseChange.VisibleRowCount) = ColCount then
    begin
      TempENFuseChange :=  HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
      CurrentRow:=sgENFuseChange.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENFuseChangeFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENFuseChangeList := TempENFuseChange.getScrollableFilteredList(
        ENFuseChangeFilter(FilterObject), ColCount - 1, 100);

      sgENFuseChange.RowCount:=sgENFuseChange.RowCount+100;
      LastCount:=High(ENFuseChangeList.list);
      with sgENFuseChange do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENFuseChangeList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENFuseChangeList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENFuseChangeList.list[i].name;
            //Установлено
            if ENFuseChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENFuseChangeList.list[i].installDate);
            //Снято
            if ENFuseChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENFuseChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENFuseChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENFuseChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENFuseChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENFuseChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENFuseChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENFuseChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENFuseChangeList.list[i].workerEquipChange;

            //Оборудование
            if ENFuseChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] := ENFuseChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] := ENFuseChangeList.list[i].FuseRefName;
            //Код оборудования
            if ENFuseChangeList.list[i].FuseRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENFuseChangeList.list[i].FuseRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENFuseChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENFuseChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[17, i + CurrentRow] :=
                  ENFuseChangeList.list[i].substation04RefName;
                if ENFuseChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + ', Інв. № ' +
                    ENFuseChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';
            //Код Высоковольтной Ячейки
            if ENFuseChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENFuseChangeList.list[i].highVoltCellRefCode);
                //Место установки
                Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. Високовольтна ланка № ' +
                  ENFuseChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';

            //Код Низковольтного Щита
            if ENFuseChangeList.list[i].lvbRefCode <> low(Integer) then
              begin
                Cells[14, i + CurrentRow] := IntToStr(ENFuseChangeList.list[i].lvbRefCode);
                //Место установки
                if ENFuseChangeList.list[i].lvbRefName <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENFuseChangeList.list[i].lvbRefName;
              end //if ENFuseChangeList.list[i].lvbRefCode <> low(Integer) then
            else
              Cells[14, i + CurrentRow] := '';
            //Код Панели НВЩ
            if ENFuseChangeList.list[i].pnlRefCode <> low(Integer) then
              begin
                Cells[15, i + CurrentRow] := IntToStr(ENFuseChangeList.list[i].pnlRefCode);
                //Место установки
                if ENFuseChangeList.list[i].pnlRefName <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENFuseChangeList.list[i].pnlRefName;
              end //if ENFuseChangeList.list[i].pnlRefCode <> low(Integer) then
            else
              Cells[15, i + CurrentRow] := '';
            //Код Отходящего Присоединения
            if ENFuseChangeList.list[i].branchRefCode <> low(Integer) then
              begin
                Cells[16, i + CurrentRow] := IntToStr(ENFuseChangeList.list[i].branchRefCode);
                //Место установки
                if ENFuseChangeList.list[i].branchRefNumberGen <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENFuseChangeList.list[i].branchRefNumberGen;
                if ENFuseChangeList.list[i].branchRefName <> '' then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + '. ' +
                    ENFuseChangeList.list[i].branchRefName;
              end //if ENFuseChangeList.list[i].branchRefCode <> low(Integer) then
            else
              Cells[16, i + CurrentRow] := '';

            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENFuseChange.Row := CurrentRow - 5;
       sgENFuseChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENFuseChangeShow.sgENFuseChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuseChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuseChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuseChange.RowCount-1 do
   for j:=0 to sgENFuseChange.ColCount-1 do
     sgENFuseChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuseChangeShow.actViewExecute(Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
begin
 TempENFuseChange := HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
   try
     ENFuseChangeObj := TempENFuseChange.getObject(StrToInt(sgENFuseChange.Cells[0,sgENFuseChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuseChangeEdit:=TfrmENFuseChangeEdit.Create(Application, dsView);
  try
    frmENFuseChangeEdit.ShowModal;
  finally
    frmENFuseChangeEdit.Free;
    frmENFuseChangeEdit:=nil;
  end;
end;

procedure TfrmENFuseChangeShow.actEditExecute(Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
begin
 TempENFuseChange := HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
   try
     ENFuseChangeObj := TempENFuseChange.getObject(StrToInt(sgENFuseChange.Cells[0,sgENFuseChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuseChangeEdit:=TfrmENFuseChangeEdit.Create(Application, dsEdit);
  try
    if frmENFuseChangeEdit.ShowModal= mrOk then
      begin
        //TempENFuseChange.save(ENFuseChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuseChangeEdit.Free;
    frmENFuseChangeEdit:=nil;
  end;
end;

procedure TfrmENFuseChangeShow.actDeleteExecute(Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuseChange := HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuseChange.Cells[0,sgENFuseChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена предохранителей) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuseChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuseChangeShow.actInsertExecute(Sender: TObject);
Var TempENFuseChange: ENFuseChangeControllerSoapPort;
begin
  TempENFuseChange := HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
  ENFuseChangeObj:=ENFuseChange.Create;

   //ENFuseChangeObj.installDate:= TXSDate.Create;
   //ENFuseChangeObj.uninstallDate:= TXSDate.Create;
   //ENFuseChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENFuseChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENFuseChangeEdit:=TfrmENFuseChangeEdit.Create(Application, dsInsert);
    try
      if frmENFuseChangeEdit.ShowModal = mrOk then
      begin
        if ENFuseChangeObj<>nil then
            //TempENFuseChange.add(ENFuseChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuseChangeEdit.Free;
      frmENFuseChangeEdit:=nil;
    end;
  finally
    ENFuseChangeObj.Free;
  end;
end;

procedure TfrmENFuseChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuseChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENFuseChangeFilterEdit:=TfrmENFuseChangeFilterEdit.Create(Application, dsInsert);
  try
    ENFuseChangeFilterObj := ENFuseChangeFilter.Create;
    SetNullIntProps(ENFuseChangeFilterObj);
    SetNullXSProps(ENFuseChangeFilterObj);

    if frmENFuseChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuseChangeFilter.Create;
      FilterObject := ENFuseChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuseChangeFilterEdit.Free;
    frmENFuseChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuseChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.