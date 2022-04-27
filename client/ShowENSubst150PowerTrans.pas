unit ShowENSubst150PowerTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSubst150PowerTransController, AdvObj, StdCtrls ;


type
  TfrmENSubst150PowerTransShow = class(TChildForm)  
  HTTPRIOENSubst150PowerTrans: THTTPRIO;
    ImageList1: TImageList;
    sgENSubst150PowerTrans: TAdvStringGrid;
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
    tlBtn1: TToolButton;
    chkIsVirtStation: TCheckBox;
    btnOK: TButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENSubst150PowerTransTopLeftChanged(Sender: TObject);
procedure sgENSubst150PowerTransDblClick(Sender: TObject);
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
  frmENSubst150PowerTransShow: TfrmENSubst150PowerTransShow;
  //ENSubst150PowerTransObj: ENSubst150PowerTrans;
  //ENSubst150PowerTransFilterObj: ENSubst150PowerTransFilter;
  st150PowTransCode: Integer;           //Код
  st150PowTransName,                    //Диспетчерское наименование
  st150PowTransFactoryNumber: String;   //Заводской номер
  st150PowTransVoltageVN,               //Напряжение ВН, кВ
  st150PowTransVoltageSN,               //Напряжение СН, кВ
  st150PowTransVoltageNN,               //Напряжение НН, кВ
  st150PowTransCurrentVN,               //Ток ВН, А
  st150PowTransCurrentSN,               //Ток СН, А
  st150PowTransCurrentNN,               //Ток НН, А
  st150PowTransPowerVN,                 //Мощность ВН, кВА
  st150PowTransPowerSN,                 //Мощность СН, кВА
  st150PowTransPowerNN: Real;           //Мощность НН, кВА
  isVirtStation: Boolean = False;

implementation

uses Main, EditENSubst150PowerTrans, EditENSubst150PowerTransFilter;

{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSubst150PowerTransHeaders: array [1..14] of String =
    ('Код'
    ,'Диспетчерское наименование'
    ,'Заводской номер'
    ,'Напряжение ВН, кВ'
    ,'Напряжение СН, кВ'
    ,'Напряжение НН, кВ'
    ,'Ток ВН, А'
    ,'Ток СН, А'
    ,'Ток НН, А'
    ,'Мощность ВН, кВА'
    ,'Мощность СН, кВА'
    ,'Мощность НН, кВА'
    ,'Понижающая Станция; Примечание'
    ,'Пользователь, внесший изменения'
    );
   

procedure TfrmENSubst150PowerTransShow.FormClose(
  Sender: TObject; var Action: TCloseAction);
var strSt150PowTransCode: string; //Задание в переменные
begin //Кода, Диспетчерского Наименования и Признака Виртуальности Станции
  strSt150PowTransCode := GetReturnValue(sgENSubst150PowerTrans, 0);
  if strSt150PowTransCode = '' then
    Exit; //SUPP-42755. Избежание генерации ошибки is not a valid integer value
  st150PowTransCode := StrToInt(strSt150PowTransCode);
  st150PowTransName := GetReturnValue(sgENSubst150PowerTrans, 1);
  isVirtStation := chkIsVirtStation.Checked;
  if FormMode = fmChild then
    frmENSubst150PowerTransShow := nil;
  inherited;
end;


procedure TfrmENSubst150PowerTransShow.FormShow(Sender: TObject);
var i: Integer;
  TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  ENSubst150PowerTransList: ENSubst150PowerTransShortList;
begin
  SetGridHeaders(
    ENSubst150PowerTransHeaders, sgENSubst150PowerTrans.ColumnHeaders);
  ColCount := 100;
  TempENSubst150PowerTrans :=
    HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
  if FilterObject = nil then
    begin
      FilterObject := ENSubst150PowerTransFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENSubst150PowerTransList :=
    TempENSubst150PowerTrans.getScrollableFilteredList(
      ENSubst150PowerTransFilter(FilterObject), 0, ColCount);

  LastCount := High(ENSubst150PowerTransList.list);

  if LastCount > -1 then
    sgENSubst150PowerTrans.RowCount := LastCount + 2
  else
    sgENSubst150PowerTrans.RowCount := 2;

   with sgENSubst150PowerTrans do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSubst150PowerTransList.list[i].code <> Low(Integer) then
        Cells[0, i + 1] := IntToStr(ENSubst150PowerTransList.list[i].code)
        else
        Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENSubst150PowerTransList.list[i].name;
        Cells[2, i + 1] := ENSubst150PowerTransList.list[i].factoryNumber;
        if ENSubst150PowerTransList.list[i].voltageVN = nil then
          Cells[3, i + 1] := ''
        else Cells[3, i + 1] :=
          ENSubst150PowerTransList.list[i].voltageVN.DecimalString;
        if ENSubst150PowerTransList.list[i].voltageSN = nil then
          Cells[4, i + 1] := ''
        else Cells[4, i + 1] :=
          ENSubst150PowerTransList.list[i].voltageSN.DecimalString;
        if ENSubst150PowerTransList.list[i].voltageNN = nil then
          Cells[5, i + 1] := ''
        else Cells[5, i + 1] :=
          ENSubst150PowerTransList.list[i].voltageNN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentVN = nil then
          Cells[6, i + 1] := ''
        else Cells[6, i + 1] :=
          ENSubst150PowerTransList.list[i].currentVN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentSN = nil then
          Cells[7, i + 1] := ''
        else Cells[7, i + 1] :=
          ENSubst150PowerTransList.list[i].currentSN.DecimalString;
        if ENSubst150PowerTransList.list[i].currentNN = nil then
          Cells[8, i + 1] := ''
        else Cells[8, i + 1] :=
          ENSubst150PowerTransList.list[i].currentNN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerVN = nil then
          Cells[9, i + 1] := ''
        else Cells[9, i + 1] :=
          ENSubst150PowerTransList.list[i].powerVN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerSN = nil then
          Cells[10, i + 1] := ''
        else Cells[10, i + 1] :=
          ENSubst150PowerTransList.list[i].powerSN.DecimalString;
        if ENSubst150PowerTransList.list[i].powerNN = nil then
          Cells[11, i + 1] := ''
        else Cells[11, i + 1] :=
          ENSubst150PowerTransList.list[i].powerNN.DecimalString;

        Cells[12, i + 1] := ENSubst150PowerTransList.list[i].substationRefName;
        if (ENSubst150PowerTransList.list[i].commentGen <> '') then
          begin
            if (Cells[12, i + 1] <> '') then
              Cells[12, i + 1] := Cells[12, i + 1] + '; ';
            Cells[12, i + 1] := Cells[12, i + 1] +
              ENSubst150PowerTransList.list[i].commentGen;
          end;
        Cells[13, i + 1] := ENSubst150PowerTransList.list[i].userGen;

        LastRow := i + 1;
        sgENSubst150PowerTrans.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENSubst150PowerTrans.Row := 1;
end;

procedure TfrmENSubst150PowerTransShow.sgENSubst150PowerTransTopLeftChanged(
  Sender: TObject);
var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  i,CurrentRow: Integer;
  ENSubst150PowerTransList: ENSubst150PowerTransShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENSubst150PowerTrans.TopRow + sgENSubst150PowerTrans.VisibleRowCount) =
    ColCount
  then
    begin
      TempENSubst150PowerTrans :=
        HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
      CurrentRow:=sgENSubst150PowerTrans.RowCount;

      if FilterObject = nil then
        begin
          FilterObject := ENSubst150PowerTransFilter.Create;
          SetNullIntProps(FilterObject);
          SetNullXSProps(FilterObject);
        end;

      ENSubst150PowerTransList :=
        TempENSubst150PowerTrans.getScrollableFilteredList(
          ENSubst150PowerTransFilter(FilterObject), ColCount - 1, 100);

      sgENSubst150PowerTrans.RowCount := sgENSubst150PowerTrans.RowCount + 100;
      LastCount := High(ENSubst150PowerTransList.list);
      with sgENSubst150PowerTrans do
        for i := 0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENSubst150PowerTransList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] :=
                IntToStr(ENSubst150PowerTransList.list[i].code)
            else
              Cells[0, i + CurrentRow] := '';
            Cells[1, i + CurrentRow] := ENSubst150PowerTransList.list[i].name;
            Cells[2, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].factoryNumber;
            if ENSubst150PowerTransList.list[i].voltageVN = nil then
              Cells[3, i + CurrentRow] := ''
            else Cells[3, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].voltageVN.DecimalString;
            if ENSubst150PowerTransList.list[i].voltageSN = nil then
              Cells[4, i + CurrentRow] := ''
            else Cells[4, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].voltageSN.DecimalString;
            if ENSubst150PowerTransList.list[i].voltageNN = nil then
              Cells[5, i + CurrentRow] := ''
            else Cells[5, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].voltageNN.DecimalString;
            if ENSubst150PowerTransList.list[i].currentVN = nil then
              Cells[6, i + CurrentRow] := ''
            else Cells[6, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].currentVN.DecimalString;
            if ENSubst150PowerTransList.list[i].currentSN = nil then
              Cells[7, i + CurrentRow] := ''
            else Cells[7, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].currentSN.DecimalString;
            if ENSubst150PowerTransList.list[i].currentNN = nil then
              Cells[8, i + CurrentRow] := ''
            else Cells[8, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].currentNN.DecimalString;
            if ENSubst150PowerTransList.list[i].powerVN = nil then
              Cells[9, i + CurrentRow] := ''
            else Cells[9, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].powerVN.DecimalString;
            if ENSubst150PowerTransList.list[i].powerSN = nil then
              Cells[10, i + CurrentRow] := ''
            else Cells[10, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].powerSN.DecimalString;
            if ENSubst150PowerTransList.list[i].powerNN = nil then
              Cells[11, i + CurrentRow] := ''
            else Cells[11, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].powerNN.DecimalString;
            Cells[12, i + 1] :=
              ENSubst150PowerTransList.list[i].substationRefName;
            if (ENSubst150PowerTransList.list[i].commentGen <> '') then
              begin
                if (Cells[12, i + 1] <> '') then
                  Cells[12, i + 1] := Cells[12, i + 1] + '; ';
                Cells[12, i + 1] := Cells[12, i + 1] +
                  ENSubst150PowerTransList.list[i].commentGen;
              end;
            Cells[13, i + CurrentRow] :=
              ENSubst150PowerTransList.list[i].userGen;
            LastRow := i + CurrentRow;
          end;
        ColCount := ColCount + 100;
        sgENSubst150PowerTrans.Row := CurrentRow - 5;
        sgENSubst150PowerTrans.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENSubst150PowerTransShow.sgENSubst150PowerTransDblClick(
  Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
    begin
      try
        st150PowTransCode := //Код
          StrToInt(GetReturnValue(sgENSubst150PowerTrans, 0));
        st150PowTransName := //Диспетчерское наименование
          GetReturnValue(sgENSubst150PowerTrans, 1);
        st150PowTransFactoryNumber := //Заводской номер
          GetReturnValue(sgENSubst150PowerTrans, 2);

        if sgENSubst150PowerTrans.Cells[3, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransVoltageVN := //Напряжение ВН, кВ
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 3));

        if sgENSubst150PowerTrans.Cells[4, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransVoltageSN := //Напряжение СН, кВ
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 4));

        if sgENSubst150PowerTrans.Cells[5, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransVoltageNN := //Напряжение НН, кВ
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 5));

        if sgENSubst150PowerTrans.Cells[6, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransCurrentVN := //Ток ВН, А
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 6));

        if sgENSubst150PowerTrans.Cells[7, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransCurrentSN := //Ток СН, А
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 7));

        if sgENSubst150PowerTrans.Cells[8, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransCurrentNN := //Ток НН, А
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 8));

        if sgENSubst150PowerTrans.Cells[9, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransPowerVN := //Мощность ВН, кВА
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 9));

        if sgENSubst150PowerTrans.Cells[10, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransPowerSN := //Мощность СН, кВА
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 10));

        if sgENSubst150PowerTrans.Cells[11, sgENSubst150PowerTrans.Row] <> ''
        then
          st150PowTransPowerNN := //Мощность НН, кВА
            StrToFloat(GetReturnValue(sgENSubst150PowerTrans, 11));
      except
        on EConvertError do Exit;
      end;
      ModalResult := mrOk;
    end //if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  else
    begin
      actViewExecute(Sender);
    end;
end; //procedure TfrmENSubst150PowerTransShow.sgENSubst150PowerTransDblClick(...

procedure TfrmENSubst150PowerTransShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSubst150PowerTrans.RowCount-1 do
   for j:=0 to sgENSubst150PowerTrans.ColCount-1 do
     sgENSubst150PowerTrans.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSubst150PowerTransShow.actViewExecute(Sender: TObject);
Var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
begin
 TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
   try
     ENSubst150PowerTransObj := TempENSubst150PowerTrans.getObject(StrToInt(sgENSubst150PowerTrans.Cells[0,sgENSubst150PowerTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150PowerTransEdit:=TfrmENSubst150PowerTransEdit.Create(Application, dsView);
  try
    frmENSubst150PowerTransEdit.ShowModal;
  finally
    frmENSubst150PowerTransEdit.Free;
    frmENSubst150PowerTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150PowerTransShow.actEditExecute(Sender: TObject);
Var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
begin
 TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
   try
     ENSubst150PowerTransObj := TempENSubst150PowerTrans.getObject(StrToInt(sgENSubst150PowerTrans.Cells[0,sgENSubst150PowerTrans.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSubst150PowerTransEdit:=TfrmENSubst150PowerTransEdit.Create(Application, dsEdit);
  try
    if frmENSubst150PowerTransEdit.ShowModal= mrOk then
      begin
        //TempENSubst150PowerTrans.save(ENSubst150PowerTransObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSubst150PowerTransEdit.Free;
    frmENSubst150PowerTransEdit:=nil;
  end;
end;

procedure TfrmENSubst150PowerTransShow.actDeleteExecute(Sender: TObject);
Var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSubst150PowerTrans.Cells[0,sgENSubst150PowerTrans.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить Силовой трансформаторы ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSubst150PowerTrans.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSubst150PowerTransShow.actInsertExecute(Sender: TObject);
// Var TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort; 
begin
  // TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as ENSubst150PowerTransControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSubst150PowerTransObj:=ENSubst150PowerTrans.Create;

   //ENSubst150PowerTransObj.voltageVN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.voltageSN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.voltageNN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.currentVN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.currentSN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.currentNN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.powerVN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.powerSN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.powerNN:= TXSDecimal.Create;
   //ENSubst150PowerTransObj.dateEdit:= TXSDate.Create;


  try
    frmENSubst150PowerTransEdit:=TfrmENSubst150PowerTransEdit.Create(Application, dsInsert);
    try
      if frmENSubst150PowerTransEdit.ShowModal = mrOk then
      begin
        if ENSubst150PowerTransObj<>nil then
            //TempENSubst150PowerTrans.add(ENSubst150PowerTransObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSubst150PowerTransEdit.Free;
      frmENSubst150PowerTransEdit:=nil;
    end;
  finally
    ENSubst150PowerTransObj.Free;
  end;
end;

procedure TfrmENSubst150PowerTransShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSubst150PowerTransShow.actFilterExecute(Sender: TObject);
begin
  frmENSubst150PowerTransFilterEdit := TfrmENSubst150PowerTransFilterEdit.Create(Application, dsInsert);
  try
    ENSubst150PowerTransFilterObj := ENSubst150PowerTransFilter.Create;
    SetNullIntProps(ENSubst150PowerTransFilterObj);
    SetNullXSProps(ENSubst150PowerTransFilterObj);

    if frmENSubst150PowerTransFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSubst150PowerTransFilter.Create;
      FilterObject := ENSubst150PowerTransFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSubst150PowerTransFilterEdit.Free;
    frmENSubst150PowerTransFilterEdit:=nil;
  end;
end;

procedure TfrmENSubst150PowerTransShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.