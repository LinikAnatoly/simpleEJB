//История замен Рубильников
unit ShowENContBreakChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENContBreakChangeController, AdvObj ;


type
  TfrmENContBreakChangeShow = class(TChildForm)  
  HTTPRIOENContBreakChange: THTTPRIO;
    ImageList1: TImageList;
    sgENContBreakChange: TAdvStringGrid;
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
procedure sgENContBreakChangeTopLeftChanged(Sender: TObject);
procedure sgENContBreakChangeDblClick(Sender: TObject);
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
 frmENContBreakChangeShow : TfrmENContBreakChangeShow;
 // ENContBreakChangeObj: ENContBreakChange;
 // ENContBreakChangeFilterObj: ENContBreakChangeFilter;
  
  
implementation

uses Main, EditENContBreakChange, EditENContBreakChangeFilter;


{$R *.dfm}

var
  //frmENContBreakChangeShow : TfrmENContBreakChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENContBreakChangeHeaders: array [1..17] of String =
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
          ,'Код Низковольтного Щита'
          ,'Код Панели НВЩ'
          ,'Код Отходящего Присоединения'
          ,'Место установки'
        );
   

procedure TfrmENContBreakChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENContBreakChangeShow:=nil;
    inherited;
  end;


procedure TfrmENContBreakChangeShow.FormShow(Sender: TObject);
var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
  i: Integer;
  ENContBreakChangeList: ENContBreakChangeShortList;
begin
  SetGridHeaders(ENContBreakChangeHeaders, sgENContBreakChange.ColumnHeaders);
  ColCount:=100;
  TempENContBreakChange :=
    HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENContBreakChangeFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENContBreakChangeList := TempENContBreakChange.getScrollableFilteredList(
    ENContBreakChangeFilter(FilterObject), 0, ColCount);


  LastCount:=High(ENContBreakChangeList.list);

  if LastCount > -1 then
    sgENContBreakChange.RowCount:=LastCount+2
  else
    sgENContBreakChange.RowCount:=2;

  with sgENContBreakChange do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        //Код Истории
        if ENContBreakChangeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContBreakChangeList.list[i].code)
        else
          Cells[0,i+1] := '';
        //Характер замены
        Cells[1,i+1] := ENContBreakChangeList.list[i].name;
        //Установлено
        if ENContBreakChangeList.list[i].installDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENContBreakChangeList.list[i].installDate);
        //Снято
        if ENContBreakChangeList.list[i].uninstallDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENContBreakChangeList.list[i].uninstallDate);
        //Номер наряда
        Cells[4,i+1] := ENContBreakChangeList.list[i].workOrderNumber;
        //Дата наряда
        if ENContBreakChangeList.list[i].dateWorkOrder = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENContBreakChangeList.list[i].dateWorkOrder);
        //Номер акта
        Cells[6,i+1] := ENContBreakChangeList.list[i].actNumberGen;
        //Дата проведения акта
        if ENContBreakChangeList.list[i].actDateGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENContBreakChangeList.list[i].actDateGen);
        //Производил замену
        Cells[8,i+1] := ENContBreakChangeList.list[i].workerEquipChange;

        //Оборудование
        if ENContBreakChangeList.list[i].materialRefCode <> low(Integer)
        then
          Cells[9, i + 1] := ENContBreakChangeList.list[i].materialRefName
        else
          Cells[9, i + 1] := ENContBreakChangeList.list[i].contactBreakerRefName;
        //Код оборудования
        if ENContBreakChangeList.list[i].contactBreakerRefCode <> low(Integer)
        then
          Cells[10, i + 1] :=
            IntToStr(ENContBreakChangeList.list[i].contactBreakerRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENContBreakChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENContBreakChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[17, i + 1] :=
              ENContBreakChangeList.list[i].substation04RefName;
            if ENContBreakChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[17, i + 1] := Cells[17, i + 1] + ', Інв. № ' +
                ENContBreakChangeList.list[i].substation04RefInvNumber;
          end
        else
          Cells[11, i + 1] := '';

        //Код Трансформатора
        if ENContBreakChangeList.list[i].transformerRefCode <> low(Integer) then
          begin
            Cells[12, i + 1] :=
              IntToStr(ENContBreakChangeList.list[i].transformerRefCode);
            //Место установки
            Cells[14, i + 1] := Cells[14, i + 1] + '. ' +
              ENContBreakChangeList.list[i].transformerRefName;
            if ENContBreakChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[14, i + 1] := Cells[14, i + 1] + ', Інв. № ' +
                ENContBreakChangeList.list[i].transformerRefInvNumber;
          end
        else
          Cells[12, i + 1] := '';

        //Код Низковольтного Щита
        if ENContBreakChangeList.list[i].lvbRefCode <> low(Integer) then
          begin
            Cells[13, i + 1] := IntToStr(ENContBreakChangeList.list[i].lvbRefCode);
            //Место установки
            if ENContBreakChangeList.list[i].lvbRefName <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENContBreakChangeList.list[i].lvbRefName;
          end //if ENContBreakChangeList.list[i].lvbRefCode <> low(Integer) then
        else
          Cells[16, i + 1] := '';
        //Код Панели НВЩ
        if ENContBreakChangeList.list[i].pnlRefCode <> low(Integer) then
          begin
            Cells[14, i + 1] := IntToStr(ENContBreakChangeList.list[i].pnlRefCode);
            //Место установки
            if ENContBreakChangeList.list[i].pnlRefName <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENContBreakChangeList.list[i].pnlRefName;
          end //if ENContBreakChangeList.list[i].pnlRefCode <> low(Integer) then
        else
          Cells[14, i + 1] := '';
        //Код Отходящего Присоединения
        if ENContBreakChangeList.list[i].branchRefCode <> low(Integer) then
          begin
            Cells[15, i + 1] := IntToStr(ENContBreakChangeList.list[i].branchRefCode);
            //Место установки
            if ENContBreakChangeList.list[i].branchRefNumberGen <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENContBreakChangeList.list[i].branchRefNumberGen;
            if ENContBreakChangeList.list[i].branchRefName <> '' then
              Cells[16, i + 1] := Cells[16, i + 1] + '. ' +
                ENContBreakChangeList.list[i].branchRefName;
          end //if ENContBreakChangeList.list[i].branchRefCode <> low(Integer) then
        else
          Cells[15, i + 1] := '';

        LastRow := i + 1;
        sgENContBreakChange.RowCount := LastRow + 1;
      end; //for i := 0 to LastCount do
   ColCount := ColCount + 1;
   sgENContBreakChange.Row := 1;
end;

procedure TfrmENContBreakChangeShow.sgENContBreakChangeTopLeftChanged(
  Sender: TObject);
var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
  i,CurrentRow: Integer;
  ENContBreakChangeList: ENContBreakChangeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENContBreakChange.TopRow + sgENContBreakChange.VisibleRowCount) = ColCount
  then
    begin
      TempENContBreakChange :=
        HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
      CurrentRow:=sgENContBreakChange.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENContBreakChangeFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENContBreakChangeList :=
        TempENContBreakChange.getScrollableFilteredList(
          ENContBreakChangeFilter(FilterObject), ColCount - 1, 100);

      sgENContBreakChange.RowCount:=sgENContBreakChange.RowCount + 100;
      LastCount := High(ENContBreakChangeList.list);
      with sgENContBreakChange do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;

            //Код Истории
            if ENContBreakChangeList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENContBreakChangeList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            //Характер замены
            Cells[1, i + CurrentRow] := ENContBreakChangeList.list[i].name;
            //Установлено
            if ENContBreakChangeList.list[i].installDate = nil then
              Cells[2, i + CurrentRow] := ''
            else
              Cells[2, i + CurrentRow] := XSDate2String(ENContBreakChangeList.list[i].installDate);
            //Снято
            if ENContBreakChangeList.list[i].uninstallDate = nil then
              Cells[3, i + CurrentRow] := ''
            else
              Cells[3, i + CurrentRow] := XSDate2String(ENContBreakChangeList.list[i].uninstallDate);
            //Номер наряда
            Cells[4, i + CurrentRow] := ENContBreakChangeList.list[i].workOrderNumber;
            //Дата наряда
            if ENContBreakChangeList.list[i].dateWorkOrder = nil then
              Cells[5, i + CurrentRow] := ''
            else
              Cells[5, i + CurrentRow] := XSDate2String(ENContBreakChangeList.list[i].dateWorkOrder);
            //Номер акта
            Cells[6, i + CurrentRow] := ENContBreakChangeList.list[i].actNumberGen;
            //Дата проведения акта
            if ENContBreakChangeList.list[i].actDateGen = nil then
              Cells[7, i + CurrentRow] := ''
            else
              Cells[7, i + CurrentRow] := XSDate2String(ENContBreakChangeList.list[i].actDateGen);
            //Производил замену
            Cells[8, i + CurrentRow] := ENContBreakChangeList.list[i].workerEquipChange;

            //Оборудование
            if ENContBreakChangeList.list[i].materialRefCode <> low(Integer)
            then
              Cells[9, i + CurrentRow] :=
                ENContBreakChangeList.list[i].materialRefName
            else
              Cells[9, i + CurrentRow] :=
                ENContBreakChangeList.list[i].contactBreakerRefName;
            //Код оборудования
            if ENContBreakChangeList.list[i].contactBreakerRefCode
              <> low(Integer)
            then
              Cells[10, i + CurrentRow] :=
                IntToStr(ENContBreakChangeList.list[i].contactBreakerRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENContBreakChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENContBreakChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[17, i + CurrentRow] :=
                  ENContBreakChangeList.list[i].substation04RefName;
                if ENContBreakChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[17, i + CurrentRow] := Cells[17, i + CurrentRow] + ', Інв. № ' +
                    ENContBreakChangeList.list[i].substation04RefInvNumber;
              end
            else
              Cells[11, i + CurrentRow] := '';
            //Код Трансформатора
            Cells[12, i + CurrentRow] := '';

            //Код Низковольтного Щита
            if ENContBreakChangeList.list[i].lvbRefCode <> low(Integer) then
              begin
                Cells[13, i + CurrentRow] := IntToStr(ENContBreakChangeList.list[i].lvbRefCode);
                //Место установки
                if ENContBreakChangeList.list[i].lvbRefName <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENContBreakChangeList.list[i].lvbRefName;
              end //if ENContBreakChangeList.list[i].lvbRefCode <> low(Integer) then
            else
              Cells[16, i + CurrentRow] := '';
            //Код Панели НВЩ
            if ENContBreakChangeList.list[i].pnlRefCode <> low(Integer) then
              begin
                Cells[14, i + CurrentRow] := IntToStr(ENContBreakChangeList.list[i].pnlRefCode);
                //Место установки
                if ENContBreakChangeList.list[i].pnlRefName <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENContBreakChangeList.list[i].pnlRefName;
              end //if ENContBreakChangeList.list[i].pnlRefCode <> low(Integer) then
            else
              Cells[14, i + CurrentRow] := '';
            //Код Отходящего Присоединения
            if ENContBreakChangeList.list[i].branchRefCode <> low(Integer) then
              begin
                Cells[15, i + CurrentRow] := IntToStr(ENContBreakChangeList.list[i].branchRefCode);
                //Место установки
                if ENContBreakChangeList.list[i].branchRefNumberGen <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENContBreakChangeList.list[i].branchRefNumberGen;
                if ENContBreakChangeList.list[i].branchRefName <> '' then
                  Cells[16, i + CurrentRow] := Cells[16, i + CurrentRow] + '. ' +
                    ENContBreakChangeList.list[i].branchRefName;
              end //if ENContBreakChangeList.list[i].branchRefCode <> low(Integer) then
            else
              Cells[15, i + CurrentRow] := '';

            LastRow := i + CurrentRow;
          end;
      ColCount := ColCount + 100;
      sgENContBreakChange.Row := CurrentRow - 5;
      sgENContBreakChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENContBreakChangeShow.sgENContBreakChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENContBreakChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENContBreakChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENContBreakChange.RowCount-1 do
   for j:=0 to sgENContBreakChange.ColCount-1 do
     sgENContBreakChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENContBreakChangeShow.actViewExecute(Sender: TObject);
Var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
begin
 TempENContBreakChange := HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
   try
     ENContBreakChangeObj := TempENContBreakChange.getObject(StrToInt(sgENContBreakChange.Cells[0,sgENContBreakChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContBreakChangeEdit:=TfrmENContBreakChangeEdit.Create(Application, dsView);
  try
    frmENContBreakChangeEdit.ShowModal;
  finally
    frmENContBreakChangeEdit.Free;
    frmENContBreakChangeEdit:=nil;
  end;
end;

procedure TfrmENContBreakChangeShow.actEditExecute(Sender: TObject);
Var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
begin
 TempENContBreakChange := HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
   try
     ENContBreakChangeObj := TempENContBreakChange.getObject(StrToInt(sgENContBreakChange.Cells[0,sgENContBreakChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContBreakChangeEdit:=TfrmENContBreakChangeEdit.Create(Application, dsEdit);
  try
    if frmENContBreakChangeEdit.ShowModal= mrOk then
      begin
        //TempENContBreakChange.save(ENContBreakChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENContBreakChangeEdit.Free;
    frmENContBreakChangeEdit:=nil;
  end;
end;

procedure TfrmENContBreakChangeShow.actDeleteExecute(Sender: TObject);
Var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContBreakChange := HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContBreakChange.Cells[0,sgENContBreakChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена рубильников) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContBreakChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENContBreakChangeShow.actInsertExecute(Sender: TObject);
Var TempENContBreakChange: ENContBreakChangeControllerSoapPort;
begin
  TempENContBreakChange := HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
  ENContBreakChangeObj:=ENContBreakChange.Create;

   //ENContBreakChangeObj.installDate:= TXSDate.Create;
   //ENContBreakChangeObj.uninstallDate:= TXSDate.Create;
   //ENContBreakChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENContBreakChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENContBreakChangeEdit:=TfrmENContBreakChangeEdit.Create(Application, dsInsert);
    try
      if frmENContBreakChangeEdit.ShowModal = mrOk then
      begin
        if ENContBreakChangeObj<>nil then
            //TempENContBreakChange.add(ENContBreakChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENContBreakChangeEdit.Free;
      frmENContBreakChangeEdit:=nil;
    end;
  finally
    ENContBreakChangeObj.Free;
  end;
end;

procedure TfrmENContBreakChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENContBreakChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENContBreakChangeFilterEdit:=TfrmENContBreakChangeFilterEdit.Create(Application, dsInsert);
  try
    ENContBreakChangeFilterObj := ENContBreakChangeFilter.Create;
    SetNullIntProps(ENContBreakChangeFilterObj);
    SetNullXSProps(ENContBreakChangeFilterObj);

    if frmENContBreakChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContBreakChangeFilter.Create;
      FilterObject := ENContBreakChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENContBreakChangeFilterEdit.Free;
    frmENContBreakChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENContBreakChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.