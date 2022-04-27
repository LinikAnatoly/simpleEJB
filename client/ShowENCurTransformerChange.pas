//История замен Трансформаторов Тока
unit ShowENCurTransformerChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCurTransformerChangeController, AdvObj ;


type
  TfrmENCurTransformerChangeShow = class(TChildForm)  
  HTTPRIOENCurTransformerChange: THTTPRIO;
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
    sgENCurTransformerChange: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENCurTransformerChangeTopLeftChanged(Sender: TObject);
procedure sgENCurTransformerChangeDblClick(Sender: TObject);
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
 frmENCurTransformerChangeShow : TfrmENCurTransformerChangeShow;
 // ENCurTransformerChangeObj: ENCurTransformerChange;
 // ENCurTransformerChangeFilterObj: ENCurTransformerChangeFilter;
  
  
implementation

uses Main, EditENCurTransformerChange, EditENCurTransformerChangeFilter;


{$R *.dfm}

var
  //frmENCurTransformerChangeShow : TfrmENCurTransformerChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCurTransformerChangeHeaders: array [1..15] of String =
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
   

procedure TfrmENCurTransformerChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCurTransformerChangeShow:=nil;
    inherited;
  end;


procedure TfrmENCurTransformerChangeShow.FormShow(Sender: TObject);
var
  TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
  i: Integer;
  ENCurTransformerChangeList: ENCurTransformerChangeShortList;
begin
  SetGridHeaders(ENCurTransformerChangeHeaders, sgENCurTransformerChange.ColumnHeaders);
  ColCount:=100;
  TempENCurTransformerChange :=  HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENCurTransformerChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENCurTransformerChangeList :=
    TempENCurTransformerChange.getScrollableFilteredList(
      ENCurTransformerChangeFilter(FilterObject), 0, ColCount);

  LastCount:=High(ENCurTransformerChangeList.list);

  if LastCount > -1 then
     sgENCurTransformerChange.RowCount:=LastCount+2
  else
     sgENCurTransformerChange.RowCount:=2;

   with sgENCurTransformerChange do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        //Код Истории
        if ENCurTransformerChangeList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENCurTransformerChangeList.list[i].code)
        else
        Cells[0, i + 1] := '';
        //Характер замены
        Cells[1, i + 1] := ENCurTransformerChangeList.list[i].name;
        //Установлено
        if ENCurTransformerChangeList.list[i].installDate = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] := XSDate2String(ENCurTransformerChangeList.list[i].installDate);
        //Снято
        if ENCurTransformerChangeList.list[i].uninstallDate = nil then
          Cells[3, i + 1] := ''
        else
          Cells[3, i + 1] := XSDate2String(ENCurTransformerChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4, i + 1] := ENCurTransformerChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENCurTransformerChangeList.list[i].dateWorkOrder = nil then
          Cells[5, i + 1] := ''
        else
          Cells[5, i + 1] := XSDate2String(ENCurTransformerChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6, i + 1] := ENCurTransformerChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENCurTransformerChangeList.list[i].actDateGen = nil then
          Cells[7, i + 1] := ''
        else
          Cells[7, i + 1] := XSDate2String(ENCurTransformerChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8, i + 1] := ENCurTransformerChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENCurTransformerChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENCurTransformerChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENCurTransformerChangeList.list[i].CurTransformerRefName;
        //Код оборудования
        if ENCurTransformerChangeList.list[i].CurTransformerRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENCurTransformerChangeList.list[i].CurTransformerRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENCurTransformerChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENCurTransformerChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[14, i + 1] :=
              ENCurTransformerChangeList.list[i].substation04RefName;
            if ENCurTransformerChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENCurTransformerChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //Код Трансформатора
        if ENCurTransformerChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENCurTransformerChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENCurTransformerChangeList.list[i].transformerRefName;
            if ENCurTransformerChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENCurTransformerChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //Код Высоковольтной Ячейки
        if ENCurTransformerChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENCurTransformerChangeList.list[i].highVoltCellRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. Високовольтна ланка № ' +
              ENCurTransformerChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';

        LastRow := i + 1;
        sgENCurTransformerChange.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  sgENCurTransformerChange.Row := 1;
end;

procedure TfrmENCurTransformerChangeShow.sgENCurTransformerChangeTopLeftChanged(Sender: TObject);
var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
  i, CurrentRow: Integer;
  ENCurTransformerChangeList: ENCurTransformerChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENCurTransformerChange.TopRow + sgENCurTransformerChange.VisibleRowCount) = ColCount
  then
    begin
      TempENCurTransformerChange :=  HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
      CurrentRow:=sgENCurTransformerChange.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENCurTransformerChangeFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENCurTransformerChangeList :=
        TempENCurTransformerChange.getScrollableFilteredList(
          ENCurTransformerChangeFilter(FilterObject), ColCount - 1, 100);

      sgENCurTransformerChange.RowCount:=sgENCurTransformerChange.RowCount + 100;
      LastCount := High(ENCurTransformerChangeList.list);
      with sgENCurTransformerChange do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENCurTransformerChangeList.list[i].code <> Low(Integer) then
            Cells[0, i + CurrentRow] := IntToStr(ENCurTransformerChangeList.list[i].code)
            else
            Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENCurTransformerChangeList.list[i].name;
            //Установлено
            if ENCurTransformerChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENCurTransformerChangeList.list[i].installDate);
            //Снято
            if ENCurTransformerChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENCurTransformerChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENCurTransformerChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENCurTransformerChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENCurTransformerChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENCurTransformerChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENCurTransformerChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENCurTransformerChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENCurTransformerChangeList.list[i].workerEquipChange;

            //Оборудование
            if ENCurTransformerChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] := ENCurTransformerChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] := ENCurTransformerChangeList.list[i].CurTransformerRefName;
            //Код оборудования
            if ENCurTransformerChangeList.list[i].CurTransformerRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENCurTransformerChangeList.list[i].CurTransformerRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENCurTransformerChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENCurTransformerChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[14, i + CurrentRow] :=
                  ENCurTransformerChangeList.list[i].substation04RefName;
                if ENCurTransformerChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + ', Інв. № ' +
                    ENCurTransformerChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';
            //Код Высоковольтной Ячейки
            if ENCurTransformerChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENCurTransformerChangeList.list[i].highVoltCellRefCode);
                //Место установки
                Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + '. Високовольтна ланка № ' +
                  ENCurTransformerChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';

            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENCurTransformerChange.Row := CurrentRow - 5;
       sgENCurTransformerChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENCurTransformerChangeShow.sgENCurTransformerChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCurTransformerChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCurTransformerChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCurTransformerChange.RowCount-1 do
   for j:=0 to sgENCurTransformerChange.ColCount-1 do
     sgENCurTransformerChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCurTransformerChangeShow.actViewExecute(Sender: TObject);
Var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
begin
 TempENCurTransformerChange := HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
   try
     ENCurTransformerChangeObj := TempENCurTransformerChange.getObject(StrToInt(sgENCurTransformerChange.Cells[0,sgENCurTransformerChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCurTransformerChangeEdit:=TfrmENCurTransformerChangeEdit.Create(Application, dsView);
  try
    frmENCurTransformerChangeEdit.ShowModal;
  finally
    frmENCurTransformerChangeEdit.Free;
    frmENCurTransformerChangeEdit:=nil;
  end;
end;

procedure TfrmENCurTransformerChangeShow.actEditExecute(Sender: TObject);
Var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
begin
 TempENCurTransformerChange := HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
   try
     ENCurTransformerChangeObj := TempENCurTransformerChange.getObject(StrToInt(sgENCurTransformerChange.Cells[0,sgENCurTransformerChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCurTransformerChangeEdit:=TfrmENCurTransformerChangeEdit.Create(Application, dsEdit);
  try
    if frmENCurTransformerChangeEdit.ShowModal= mrOk then
      begin
        //TempENCurTransformerChange.save(ENCurTransformerChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCurTransformerChangeEdit.Free;
    frmENCurTransformerChangeEdit:=nil;
  end;
end;

procedure TfrmENCurTransformerChangeShow.actDeleteExecute(Sender: TObject);
Var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCurTransformerChange := HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCurTransformerChange.Cells[0,sgENCurTransformerChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена трансформаторов тока) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCurTransformerChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCurTransformerChangeShow.actInsertExecute(Sender: TObject);
Var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
begin
  TempENCurTransformerChange := HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
  ENCurTransformerChangeObj:=ENCurTransformerChange.Create;

   //ENCurTransformerChangeObj.installDate:= TXSDate.Create;
   //ENCurTransformerChangeObj.uninstallDate:= TXSDate.Create;
   //ENCurTransformerChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENCurTransformerChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENCurTransformerChangeEdit:=TfrmENCurTransformerChangeEdit.Create(Application, dsInsert);
    try
      if frmENCurTransformerChangeEdit.ShowModal = mrOk then
      begin
        if ENCurTransformerChangeObj<>nil then
            //TempENCurTransformerChange.add(ENCurTransformerChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCurTransformerChangeEdit.Free;
      frmENCurTransformerChangeEdit:=nil;
    end;
  finally
    ENCurTransformerChangeObj.Free;
  end;
end;

procedure TfrmENCurTransformerChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCurTransformerChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENCurTransformerChangeFilterEdit:=TfrmENCurTransformerChangeFilterEdit.Create(Application, dsInsert);
  try
    ENCurTransformerChangeFilterObj := ENCurTransformerChangeFilter.Create;
    SetNullIntProps(ENCurTransformerChangeFilterObj);
    SetNullXSProps(ENCurTransformerChangeFilterObj);

    if frmENCurTransformerChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCurTransformerChangeFilter.Create;
      FilterObject := ENCurTransformerChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCurTransformerChangeFilterEdit.Free;
    frmENCurTransformerChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENCurTransformerChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.