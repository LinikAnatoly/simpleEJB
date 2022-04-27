
unit ShowENLoadSwitch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLoadSwitchController, AdvObj ;


type
  TfrmENLoadSwitchShow = class(TChildForm)  
  HTTPRIOENLoadSwitch: THTTPRIO;
    ImageList1: TImageList;
    sgENLoadSwitch: TAdvStringGrid;
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
procedure sgENLoadSwitchTopLeftChanged(Sender: TObject);
procedure sgENLoadSwitchDblClick(Sender: TObject);
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
 frmENLoadSwitchShow : TfrmENLoadSwitchShow;
 // ENLoadSwitchObj: ENLoadSwitch;
 // ENLoadSwitchFilterObj: ENLoadSwitchFilter;
  
  
implementation

uses Main, EditENLoadSwitch, EditENLoadSwitchFilter;


{$R *.dfm}

var
  //frmENLoadSwitchShow : TfrmENLoadSwitchShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLoadSwitchHeaders: array [1..8] of String =
        ('Код'
       , 'Вимикач навантаження'
       , 'Диспетчерська назва'
       , 'Привід'
       , 'Напруга ном., кВ'
       , 'Струм ном., А'
       , 'ТП 6 - 10 / 0,4 кВ'
       , '№ Високовольтної Ланки');


procedure TfrmENLoadSwitchShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLoadSwitchShow:=nil;
    inherited;
  end;


procedure TfrmENLoadSwitchShow.FormShow(Sender: TObject);
var
  TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  i: Integer;
  ENLoadSwitchList: ENLoadSwitchShortList;
  begin
  SetGridHeaders(ENLoadSwitchHeaders, sgENLoadSwitch.ColumnHeaders);
  ColCount:=100;
  TempENLoadSwitch :=  HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENLoadSwitchFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLoadSwitchList := TempENLoadSwitch.getScrollableFilteredList(ENLoadSwitchFilter(FilterObject),0,ColCount);


  LastCount:=High(ENLoadSwitchList.list);

  if LastCount > -1 then
     sgENLoadSwitch.RowCount:=LastCount+2
  else
     sgENLoadSwitch.RowCount:=2;

   with sgENLoadSwitch do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLoadSwitchList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENLoadSwitchList.list[i].code)
        else //Код Выключателя нагрузки
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENLoadSwitchList.list[i].materialRefName; //Выключатель нагрузки из Нормативных материалов
        Cells[2, i + 1] := ENLoadSwitchList.list[i].name; //Диспетчерское название
        Cells[3, i + 1] := ENLoadSwitchList.list[i].matDriveRefName; //Привод Разъединителя
        if ENLoadSwitchList.list[i].ratedVoltage = nil then
          Cells[4, i + 1] := ''
        else //Номинальное напряжение, кВ
          Cells[4, i + 1] := ENLoadSwitchList.list[i].ratedVoltage.DecimalString;
        if ENLoadSwitchList.list[i].ratedCurrent = nil then
          Cells[5, i + 1] := ''
        else //Номинальный ток, А
          Cells[5, i + 1] := ENLoadSwitchList.list[i].ratedCurrent.DecimalString;
        Cells[6, i + 1] := ENLoadSwitchList.list[i].substation04Name; //ТП 6 - 10 / 0,4 кВ
        Cells[7, i + 1] := ENLoadSwitchList.list[i].highvoltageSellNumberGen; //Номер Високовольтної Ланки
        LastRow := i + 1;
        sgENLoadSwitch.RowCount:=LastRow+1;
      end;
   ColCount := ColCount + 1;
   sgENLoadSwitch.Row := 1;
end;

procedure TfrmENLoadSwitchShow.sgENLoadSwitchTopLeftChanged(Sender: TObject);
var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  i, CurrentRow: Integer;
  ENLoadSwitchList: ENLoadSwitchShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENLoadSwitch.TopRow + sgENLoadSwitch.VisibleRowCount) = ColCount then
    begin
      TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
      CurrentRow := sgENLoadSwitch.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENLoadSwitchFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENLoadSwitchList := TempENLoadSwitch.getScrollableFilteredList(
        ENLoadSwitchFilter(FilterObject), ColCount - 1, 100);

      sgENLoadSwitch.RowCount := sgENLoadSwitch.RowCount + 100;
      LastCount := High(ENLoadSwitchList.list);
      with sgENLoadSwitch do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENLoadSwitchList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENLoadSwitchList.list[i].code)
            else //Код Выключателя нагрузки
              Cells[0, i + CurrentRow] := '';
            Cells[1, i + CurrentRow] := ENLoadSwitchList.list[i].materialRefName; //Выключатель нагрузки из Нормативных материалов
            Cells[2, i + CurrentRow] := ENLoadSwitchList.list[i].name; //Диспетчерское название
            Cells[3, i + CurrentRow] := ENLoadSwitchList.list[i].matDriveRefName; //Привод Разъединителя
            if ENLoadSwitchList.list[i].ratedVoltage = nil then
              Cells[4, i + CurrentRow] := ''
            else //Номинальное напряжение, кВ
              Cells[4, i + CurrentRow] := ENLoadSwitchList.list[i].ratedVoltage.DecimalString;
            if ENLoadSwitchList.list[i].ratedCurrent = nil then
              Cells[5, i + CurrentRow] := ''
            else //Номинальный ток, А
              Cells[5, i + CurrentRow] := ENLoadSwitchList.list[i].ratedCurrent.DecimalString;
            Cells[6, i + CurrentRow] := ENLoadSwitchList.list[i].substation04Name; //ТП 6 - 10 / 0,4 кВ
            Cells[7, i + CurrentRow] := ENLoadSwitchList.list[i].highvoltageSellNumberGen; //Номер Високовольтної Ланки
            LastRow := i + CurrentRow;
          end;
      ColCount := ColCount + 100;
      sgENLoadSwitch.Row := CurrentRow - 5;
      sgENLoadSwitch.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENLoadSwitchShow.sgENLoadSwitchDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENLoadSwitch,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLoadSwitchShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLoadSwitch.RowCount-1 do
   for j:=0 to sgENLoadSwitch.ColCount-1 do
     sgENLoadSwitch.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLoadSwitchShow.actViewExecute(Sender: TObject);
Var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
begin
 TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
   try
     ENLoadSwitchObj := TempENLoadSwitch.getObject(StrToInt(sgENLoadSwitch.Cells[0,sgENLoadSwitch.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchEdit:=TfrmENLoadSwitchEdit.Create(Application, dsView);
  try
    frmENLoadSwitchEdit.ShowModal;
  finally
    frmENLoadSwitchEdit.Free;
    frmENLoadSwitchEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchShow.actEditExecute(Sender: TObject);
Var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
begin
 TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
   try
     ENLoadSwitchObj := TempENLoadSwitch.getObject(StrToInt(sgENLoadSwitch.Cells[0,sgENLoadSwitch.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLoadSwitchEdit:=TfrmENLoadSwitchEdit.Create(Application, dsEdit);
  try
    if frmENLoadSwitchEdit.ShowModal= mrOk then
      begin
        //TempENLoadSwitch.save(ENLoadSwitchObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLoadSwitchEdit.Free;
    frmENLoadSwitchEdit:=nil;
  end;
end;

procedure TfrmENLoadSwitchShow.actDeleteExecute(Sender: TObject);
Var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLoadSwitch.Cells[0,sgENLoadSwitch.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Выключатель нагрузки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLoadSwitch.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLoadSwitchShow.actInsertExecute(Sender: TObject);
Var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
begin
  TempENLoadSwitch := HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
  ENLoadSwitchObj:=ENLoadSwitch.Create;

   //ENLoadSwitchObj.ratedVoltage:= TXSDecimal.Create;
   //ENLoadSwitchObj.ratedCurrent:= TXSDecimal.Create;


  try
    frmENLoadSwitchEdit:=TfrmENLoadSwitchEdit.Create(Application, dsInsert);
    try
      if frmENLoadSwitchEdit.ShowModal = mrOk then
      begin
        if ENLoadSwitchObj<>nil then
            //TempENLoadSwitch.add(ENLoadSwitchObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLoadSwitchEdit.Free;
      frmENLoadSwitchEdit:=nil;
    end;
  finally
    ENLoadSwitchObj.Free;
  end;
end;

procedure TfrmENLoadSwitchShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLoadSwitchShow.actFilterExecute(Sender: TObject);
begin
{frmENLoadSwitchFilterEdit:=TfrmENLoadSwitchFilterEdit.Create(Application, dsInsert);
  try
    ENLoadSwitchFilterObj := ENLoadSwitchFilter.Create;
    SetNullIntProps(ENLoadSwitchFilterObj);
    SetNullXSProps(ENLoadSwitchFilterObj);

    if frmENLoadSwitchFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLoadSwitchFilter.Create;
      FilterObject := ENLoadSwitchFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLoadSwitchFilterEdit.Free;
    frmENLoadSwitchFilterEdit:=nil;
  end;}
end;

procedure TfrmENLoadSwitchShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.