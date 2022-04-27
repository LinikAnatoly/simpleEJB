//История замен Трансформаторов
unit ShowENTransformerChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, EnergyProController,
  EnergyProController2, ENTransformerChangeController, AdvObj;


type
  TfrmENTransformerChangeShow = class(TChildForm)  
  HTTPRIOENTransformerChange: THTTPRIO;
    ImageList1: TImageList;
    sgENTransformerChange: TAdvStringGrid;
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
procedure sgENTransformerChangeTopLeftChanged(Sender: TObject);
procedure sgENTransformerChangeDblClick(Sender: TObject);
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
 frmENTransformerChangeShow : TfrmENTransformerChangeShow;
 // ENTransformerChangeObj: ENTransformerChange;
 // ENTransformerChangeFilterObj: ENTransformerChangeFilter;
  
  
implementation

uses Main, EditENTransformerChange, EditENTransformerChangeFilter;


{$R *.dfm}

var
  //frmENTransformerChangeShow : TfrmENTransformerChangeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransformerChangeHeaders: array [1..13] of String =
        ( 'Код'
          ,'Характер замены'
          ,'Установлено'
          ,'Снято'
          ,'Наряд №'
          ,'Дата наряда'
          ,'Акт №'
          ,'Дата проведения акта'
          ,'Производил замену'
          ,'Оборудование'
          ,'Код Оборудования'
          ,'Код ТП 10 - 6 / 0,4 кВ'
          ,'Место установки'
        );


procedure TfrmENTransformerChangeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransformerChangeShow:=nil;
    inherited;
  end;


procedure TfrmENTransformerChangeShow.FormShow(Sender: TObject);
var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
  i: Integer;
  ENTransformerChangeList: ENTransformerChangeShortList;
begin
  SetGridHeaders(ENTransformerChangeHeaders, sgENTransformerChange.ColumnHeaders);
  ColCount:=100;
  TempENTransformerChange :=  HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransformerChangeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransformerChangeList := TempENTransformerChange.getScrollableFilteredList(ENTransformerChangeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransformerChangeList.list);

  if LastCount > -1 then
     sgENTransformerChange.RowCount:=LastCount+2
  else
     sgENTransformerChange.RowCount:=2;

   with sgENTransformerChange do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransformerChangeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransformerChangeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTransformerChangeList.list[i].name;
        if ENTransformerChangeList.list[i].installDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTransformerChangeList.list[i].installDate);
        if ENTransformerChangeList.list[i].uninstallDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENTransformerChangeList.list[i].uninstallDate);
        Cells[4,i+1] := ENTransformerChangeList.list[i].workOrderNumber;
        if ENTransformerChangeList.list[i].dateWorkOrder = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENTransformerChangeList.list[i].dateWorkOrder);
        Cells[6,i+1] := ENTransformerChangeList.list[i].actNumberGen;
        if ENTransformerChangeList.list[i].actDateGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(ENTransformerChangeList.list[i].actDateGen);
        Cells[8,i+1] := ENTransformerChangeList.list[i].workerEquipChange;

        //Оборудование
        Cells[9, i + 1] := ENTransformerChangeList.list[i].transformerRefName;
        if ENTransformerChangeList.list[i].transformerRefInvNumber <> '' then
          Cells[9, i + 1] := Cells[9, i + 1] + ', Інв. № ' +
            ENTransformerChangeList.list[i].transformerRefInvNumber;
        if ENTransformerChangeList.list[i].transformerRefNominalPower <> nil
        then
          Cells[9, i + 1] := Cells[9, i + 1] + ', P = ' +
            ENTransformerChangeList.list[i
              ].transformerRefNominalPower.DecimalString;
        //Код Оборудования
        if ENTransformerChangeList.list[i].transformerRefCode <> low(Integer)
        then
          Cells[10, i + 1] := Cells[10, i + 1] +
            IntToStr(ENTransformerChangeList.list[i].transformerRefCode)
        else
          Cells[10, i + 1] := '';
        //Код ТП 10 - 6 / 0,4 кВ
        if ENTransformerChangeList.list[i].substation04RefCode <> low(Integer)
        then
          begin
            Cells[11, i + 1] :=
              IntToStr(ENTransformerChangeList.list[i].substation04RefCode);
            //Место установки
            Cells[12, i + 1] :=
              ENTransformerChangeList.list[i].substation04RefName;
            if ENTransformerChangeList.list[i].substation04RefInvNumber <> ''
            then
              Cells[12, i + 1] := Cells[12, i + 1] + ', Інв. № ' +
                ENTransformerChangeList.list[i].substation04RefInvNumber;
            if ENTransformerChangeList.list[i].substation04RefNominalPower
              <> nil
            then
              Cells[12, i + 1] := Cells[12, i + 1] + ', P = ' +
                ENTransformerChangeList.list[i
                  ].substation04RefNominalPower.DecimalString + ' кВА';
          end
        else
          begin
            Cells[11, i + 1] := '';
            Cells[12, i + 1] := '';
          end;

        LastRow:=i+1;
        sgENTransformerChange.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransformerChange.Row:=1;
end;

procedure TfrmENTransformerChangeShow.sgENTransformerChangeTopLeftChanged(Sender: TObject);
var
  TempENTransformerChange: ENTransformerChangeControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransformerChangeList: ENTransformerChangeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransformerChange.TopRow + sgENTransformerChange.VisibleRowCount) = ColCount
  then
    begin
      TempENTransformerChange :=
        HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
      CurrentRow:=sgENTransformerChange.RowCount;

      if FilterObject = nil then
      begin
         FilterObject := ENTransformerChangeFilter.Create;
         SetNullIntProps(FilterObject);
         SetNullXSProps(FilterObject);
      end;

      ENTransformerChangeList :=
        TempENTransformerChange.getScrollableFilteredList(
          ENTransformerChangeFilter(FilterObject), ColCount - 1, 100);

      sgENTransformerChange.RowCount:=sgENTransformerChange.RowCount+100;
      LastCount:=High(ENTransformerChangeList.list);
      with sgENTransformerChange do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENTransformerChangeList.list[i].code <> Low(Integer) then
            Cells[0,i+CurrentRow] := IntToStr(ENTransformerChangeList.list[i].code)
            else
            Cells[0,i+CurrentRow] := '';
            Cells[1,i+CurrentRow] := ENTransformerChangeList.list[i].name;
            if ENTransformerChangeList.list[i].installDate = nil then
              Cells[2,i+CurrentRow] := ''
            else
              Cells[2,i+CurrentRow] := XSDate2String(ENTransformerChangeList.list[i].installDate);
            if ENTransformerChangeList.list[i].uninstallDate = nil then
              Cells[3,i+CurrentRow] := ''
            else
              Cells[3,i+CurrentRow] := XSDate2String(ENTransformerChangeList.list[i].uninstallDate);
            Cells[4,i+CurrentRow] := ENTransformerChangeList.list[i].workOrderNumber;
            if ENTransformerChangeList.list[i].dateWorkOrder = nil then
              Cells[5,i+CurrentRow] := ''
            else
              Cells[5,i+CurrentRow] := XSDate2String(ENTransformerChangeList.list[i].dateWorkOrder);
            Cells[6,i+CurrentRow] := ENTransformerChangeList.list[i].actNumberGen;
            if ENTransformerChangeList.list[i].actDateGen = nil then
              Cells[7,i+CurrentRow] := ''
            else
              Cells[7,i+CurrentRow] := XSDate2String(ENTransformerChangeList.list[i].actDateGen);
            Cells[8,i+CurrentRow] := ENTransformerChangeList.list[i].workerEquipChange;

            //Оборудование
            Cells[9, i + CurrentRow] := ENTransformerChangeList.list[i].transformerRefName;
            if ENTransformerChangeList.list[i].transformerRefInvNumber <> '' then
              Cells[9, i + CurrentRow] := Cells[9, i + CurrentRow] + ', Інв. № ' +
                ENTransformerChangeList.list[i].transformerRefInvNumber;
            if ENTransformerChangeList.list[i].transformerRefNominalPower <> nil
            then
              Cells[9, i + CurrentRow] := Cells[9, i + CurrentRow] + ', P = ' +
                ENTransformerChangeList.list[i
                  ].transformerRefNominalPower.DecimalString;
            //Код Оборудования
            if ENTransformerChangeList.list[i].transformerRefCode <> low(Integer)
            then
              Cells[10, i + CurrentRow] := Cells[10, i + CurrentRow] +
                IntToStr(ENTransformerChangeList.list[i].transformerRefCode)
            else
              Cells[10, i + CurrentRow] := '';
            //Код ТП 10 - 6 / 0,4 кВ
            if ENTransformerChangeList.list[i].substation04RefCode <> low(Integer)
            then
              begin
                Cells[11, i + CurrentRow] :=
                  IntToStr(ENTransformerChangeList.list[i].substation04RefCode);
                //Место установки
                Cells[12, i + CurrentRow] :=
                  ENTransformerChangeList.list[i].substation04RefName;
                if ENTransformerChangeList.list[i].substation04RefInvNumber <> ''
                then
                  Cells[12, i + CurrentRow] := Cells[12, i + CurrentRow] + ', Інв. № ' +
                    ENTransformerChangeList.list[i].substation04RefInvNumber;
                if ENTransformerChangeList.list[i].substation04RefNominalPower
                  <> nil
                then
                  Cells[12, i + CurrentRow] := Cells[12, i + CurrentRow] + ', P = ' +
                    ENTransformerChangeList.list[i
                      ].substation04RefNominalPower.DecimalString + ' кВА';
              end
            else
              begin
                Cells[11, i + CurrentRow] := '';
                Cells[12, i + CurrentRow] := '';
              end;

            LastRow := i + CurrentRow;
          end;
       ColCount := ColCount + 100;
       sgENTransformerChange.Row := CurrentRow - 5;
       sgENTransformerChange.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENTransformerChangeShow.sgENTransformerChangeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransformerChange,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransformerChangeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransformerChange.RowCount-1 do
   for j:=0 to sgENTransformerChange.ColCount-1 do
     sgENTransformerChange.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransformerChangeShow.actViewExecute(Sender: TObject);
Var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
begin
 TempENTransformerChange := HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
   try
     ENTransformerChangeObj := TempENTransformerChange.getObject(StrToInt(sgENTransformerChange.Cells[0,sgENTransformerChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerChangeEdit:=TfrmENTransformerChangeEdit.Create(Application, dsView);
  try
    frmENTransformerChangeEdit.ShowModal;
  finally
    frmENTransformerChangeEdit.Free;
    frmENTransformerChangeEdit:=nil;
  end;
end;

procedure TfrmENTransformerChangeShow.actEditExecute(Sender: TObject);
Var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
begin
 TempENTransformerChange := HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
   try
     ENTransformerChangeObj := TempENTransformerChange.getObject(StrToInt(sgENTransformerChange.Cells[0,sgENTransformerChange.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerChangeEdit:=TfrmENTransformerChangeEdit.Create(Application, dsEdit);
  try
    if frmENTransformerChangeEdit.ShowModal= mrOk then
      begin
        //TempENTransformerChange.save(ENTransformerChangeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransformerChangeEdit.Free;
    frmENTransformerChangeEdit:=nil;
  end;
end;

procedure TfrmENTransformerChangeShow.actDeleteExecute(Sender: TObject);
Var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransformerChange := HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransformerChange.Cells[0,sgENTransformerChange.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замена трансформаторов) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransformerChange.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransformerChangeShow.actInsertExecute(Sender: TObject);
Var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
begin
  TempENTransformerChange := HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
  ENTransformerChangeObj:=ENTransformerChange.Create;

   //ENTransformerChangeObj.installDate:= TXSDate.Create;
   //ENTransformerChangeObj.uninstallDate:= TXSDate.Create;
   //ENTransformerChangeObj.dateWorkOrder:= TXSDate.Create;
   //ENTransformerChangeObj.actDateGen:= TXSDate.Create;


  try
    frmENTransformerChangeEdit:=TfrmENTransformerChangeEdit.Create(Application, dsInsert);
    try
      if frmENTransformerChangeEdit.ShowModal = mrOk then
      begin
        if ENTransformerChangeObj<>nil then
            //TempENTransformerChange.add(ENTransformerChangeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransformerChangeEdit.Free;
      frmENTransformerChangeEdit:=nil;
    end;
  finally
    ENTransformerChangeObj.Free;
  end;
end;

procedure TfrmENTransformerChangeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransformerChangeShow.actFilterExecute(Sender: TObject);
begin
{frmENTransformerChangeFilterEdit:=TfrmENTransformerChangeFilterEdit.Create(Application, dsInsert);
  try
    ENTransformerChangeFilterObj := ENTransformerChangeFilter.Create;
    SetNullIntProps(ENTransformerChangeFilterObj);
    SetNullXSProps(ENTransformerChangeFilterObj);

    if frmENTransformerChangeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransformerChangeFilter.Create;
      FilterObject := ENTransformerChangeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransformerChangeFilterEdit.Free;
    frmENTransformerChangeFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransformerChangeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.