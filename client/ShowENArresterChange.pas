//История замен Разрядников
unit ShowENArresterChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENArresterChangeController, AdvObj ;


type
  TfrmENArresterChangeShow = class(TChildForm)  
  HTTPRIOENArresterChange: THTTPRIO;
    ImageList1: TImageList;
    sgENArresterChange: TAdvStringGrid;
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
procedure sgENArresterChangeTopLeftChanged(Sender: TObject);
procedure sgENArresterChangeDblClick(Sender: TObject);
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
 frmENArresterChangeShow : TfrmENArresterChangeShow;
 // ENArresterChangeObj: ENArresterChange;
 // ENArresterChangeFilterObj: ENArresterChangeFilter;
  
  
implementation

uses Main, EditENArresterChange, EditENArresterChangeFilter;


{$R *.dfm}

var
  //frmENArresterChangeShow : TfrmENArresterChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENArresterChangeHeaders: array [1..15] of String =
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
   

procedure TfrmENArresterChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENArresterChangeShow:=nil;
    inherited;
  end;


procedure TfrmENArresterChangeShow.FormShow(Sender: TObject);
var TempENArresterChange: ENArresterChangeControllerSoapPort;
  i: Integer;
  ENArresterChangeList: ENArresterChangeShortList;
begin
  SetGridHeaders(ENArresterChangeHeaders, sgENArresterChange.ColumnHeaders);
  ColCount:=100;
  TempENArresterChange :=  HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENArresterChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENArresterChangeList := TempENArresterChange.getScrollableFilteredList(
    ENArresterChangeFilter(FilterObject), 0, ColCount);

  LastCount := High(ENArresterChangeList.list);

  if LastCount > -1 then
    sgENArresterChange.RowCount:=LastCount+2
  else
    sgENArresterChange.RowCount:=2;

  with sgENArresterChange do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        //Код Истории
        if ENArresterChangeList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENArresterChangeList.list[i].code)
        else
        Cells[0, i + 1] := '';
        //Характер замены
        Cells[1, i + 1] := ENArresterChangeList.list[i].name;
        //Установлено
        if ENArresterChangeList.list[i].installDate = nil then
          Cells[2, i + 1] := ''
        else
          Cells[2, i + 1] := XSDate2String(ENArresterChangeList.list[i].installDate);
        //Снято
        if ENArresterChangeList.list[i].uninstallDate = nil then
          Cells[3, i + 1] := ''
        else
          Cells[3, i + 1] := XSDate2String(ENArresterChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4, i + 1] := ENArresterChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENArresterChangeList.list[i].dateWorkOrder = nil then
          Cells[5, i + 1] := ''
        else
          Cells[5, i + 1] := XSDate2String(ENArresterChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6, i + 1] := ENArresterChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENArresterChangeList.list[i].actDateGen = nil then
          Cells[7, i + 1] := ''
        else
          Cells[7, i + 1] := XSDate2String(ENArresterChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8, i + 1] := ENArresterChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENArresterChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENArresterChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENArresterChangeList.list[i].arresterRefName;
        //Код оборудования
        if ENArresterChangeList.list[i].ArresterRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENArresterChangeList.list[i].ArresterRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENArresterChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENArresterChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[14, i + 1] :=
              ENArresterChangeList.list[i].substation04RefName;
            if ENArresterChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENArresterChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';
        //Код Трансформатора
        if ENArresterChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENArresterChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENArresterChangeList.list[i].transformerRefName;
            if ENArresterChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENArresterChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';
        //Код Высоковольтной Ячейки
        if ENArresterChangeList.list[i].highVoltCellRefCode <> low(Integer)
        then
          begin
            Cells[13, i + 1] :=
              IntToStr(ENArresterChangeList.list[i].highVoltCellRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. Високовольтна ланка № ' +
              ENArresterChangeList.list[i].highVoltCellRefNumberGen;
          end
        else
          Cells[13, i + 1] := '';

        LastRow := i + 1;
        sgENArresterChange.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  sgENArresterChange.Row := 1;
end;

procedure TfrmENArresterChangeShow.sgENArresterChangeTopLeftChanged(Sender: TObject);
var
  TempENArresterChange: ENArresterChangeControllerSoapPort;
  i,CurrentRow: Integer;
  ENArresterChangeList: ENArresterChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENArresterChange.TopRow + sgENArresterChange.VisibleRowCount) = ColCount
  then
    begin
      TempENArresterChange :=  HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
      CurrentRow:=sgENArresterChange.RowCount;

      if FilterObject = nil then
      begin
         FilterObject := ENArresterChangeFilter.Create;
         SetNullIntProps(FilterObject);
         SetNullXSProps(FilterObject);
      end;

      ENArresterChangeList := TempENArresterChange.getScrollableFilteredList(ENArresterChangeFilter(FilterObject),ColCount-1, 100);

      sgENArresterChange.RowCount:=sgENArresterChange.RowCount+100;
      LastCount:=High(ENArresterChangeList.list);
      with sgENArresterChange do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENArresterChangeList.list[i].code <> Low(Integer) then
            Cells[0, i + CurrentRow] := IntToStr(ENArresterChangeList.list[i].code)
            else
            Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENArresterChangeList.list[i].name;
            //Установлено
            if ENArresterChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENArresterChangeList.list[i].installDate);
            //Снято
            if ENArresterChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENArresterChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENArresterChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENArresterChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENArresterChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENArresterChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENArresterChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENArresterChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENArresterChangeList.list[i].workerEquipChange;

            //Оборудование
            if ENArresterChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] := ENArresterChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] := ENArresterChangeList.list[i].arresterRefName;
            //Код оборудования
            if ENArresterChangeList.list[i].ArresterRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENArresterChangeList.list[i].ArresterRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENArresterChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENArresterChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[14, i + CurrentRow] :=
                  ENArresterChangeList.list[i].substation04RefName;
                if ENArresterChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + ', Інв. № ' +
                    ENArresterChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';
            //Код Высоковольтной Ячейки
            if ENArresterChangeList.list[i].highVoltCellRefCode <> low(Integer)
            then
              begin
                Cells[13, i + CurrentRow] :=
                  IntToStr(ENArresterChangeList.list[i].highVoltCellRefCode);
                //Место установки
                Cells[14, i + CurrentRow] := Cells[14, i + CurrentRow] + '. Високовольтна ланка № ' +
                  ENArresterChangeList.list[i].highVoltCellRefNumberGen;
              end
            else
              Cells[13, i + CurrentRow] := '';

            LastRow:=i+CurrentRow;
          end;
       ColCount:=ColCount+100;
       sgENArresterChange.Row:=CurrentRow-5;
       sgENArresterChange.RowCount:=LastRow+1;
    end;
end;

procedure TfrmENArresterChangeShow.sgENArresterChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENArresterChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENArresterChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENArresterChange.RowCount-1 do
   for j:=0 to sgENArresterChange.ColCount-1 do
     sgENArresterChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENArresterChangeShow.actViewExecute(Sender: TObject);
Var TempENArresterChange: ENArresterChangeControllerSoapPort;
begin
 TempENArresterChange := HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
   try
     ENArresterChangeObj := TempENArresterChange.getObject(StrToInt(sgENArresterChange.Cells[0,sgENArresterChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENArresterChangeEdit:=TfrmENArresterChangeEdit.Create(Application, dsView);
  try
    frmENArresterChangeEdit.ShowModal;
  finally
    frmENArresterChangeEdit.Free;
    frmENArresterChangeEdit:=nil;
  end;
end;

procedure TfrmENArresterChangeShow.actEditExecute(Sender: TObject);
Var TempENArresterChange: ENArresterChangeControllerSoapPort;
begin
 TempENArresterChange := HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
   try
     ENArresterChangeObj := TempENArresterChange.getObject(StrToInt(sgENArresterChange.Cells[0,sgENArresterChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENArresterChangeEdit:=TfrmENArresterChangeEdit.Create(Application, dsEdit);
  try
    if frmENArresterChangeEdit.ShowModal= mrOk then
      begin
        //TempENArresterChange.save(ENArresterChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENArresterChangeEdit.Free;
    frmENArresterChangeEdit:=nil;
  end;
end;

procedure TfrmENArresterChangeShow.actDeleteExecute(Sender: TObject);
Var TempENArresterChange: ENArresterChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENArresterChange := HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENArresterChange.Cells[0,sgENArresterChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена разрядников) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENArresterChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENArresterChangeShow.actInsertExecute(Sender: TObject);
Var TempENArresterChange: ENArresterChangeControllerSoapPort;
begin
  TempENArresterChange := HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
  ENArresterChangeObj:=ENArresterChange.Create;

   //ENArresterChangeObj.installDate:= TXSDate.Create;
   //ENArresterChangeObj.uninstallDate:= TXSDate.Create;
   //ENArresterChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENArresterChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENArresterChangeEdit:=TfrmENArresterChangeEdit.Create(Application, dsInsert);
    try
      if frmENArresterChangeEdit.ShowModal = mrOk then
      begin
        if ENArresterChangeObj<>nil then
            //TempENArresterChange.add(ENArresterChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENArresterChangeEdit.Free;
      frmENArresterChangeEdit:=nil;
    end;
  finally
    ENArresterChangeObj.Free;
  end;
end;

procedure TfrmENArresterChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENArresterChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENArresterChangeFilterEdit:=TfrmENArresterChangeFilterEdit.Create(Application, dsInsert);
  try
    ENArresterChangeFilterObj := ENArresterChangeFilter.Create;
    SetNullIntProps(ENArresterChangeFilterObj);
    SetNullXSProps(ENArresterChangeFilterObj);

    if frmENArresterChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENArresterChangeFilter.Create;
      FilterObject := ENArresterChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENArresterChangeFilterEdit.Free;
    frmENArresterChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENArresterChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.