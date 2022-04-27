
unit ShowRQPlanPayItemSecond;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPlanPayItemSecondController, AdvObj ;


type
  TfrmRQPlanPayItemSecondShow = class(TChildForm)  
  HTTPRIORQPlanPayItemSecond: THTTPRIO;
    ImageList1: TImageList;
    sgRQPlanPayItemSecond: TAdvStringGrid;
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
procedure sgRQPlanPayItemSecondTopLeftChanged(Sender: TObject);
procedure sgRQPlanPayItemSecondDblClick(Sender: TObject);
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

//var
 // RQPlanPayItemSecondObj: RQPlanPayItemSecond;
 // RQPlanPayItemSecondFilterObj: RQPlanPayItemSecondFilter;
  
  
implementation

uses Main, EditRQPlanPayItemSecond, EditRQPlanPayItemSecondFilter;


{$R *.dfm}

var
  //frmRQPlanPayItemSecondShow : TfrmRQPlanPayItemSecondShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPlanPayItemSecondHeaders: array [1..35] of String =
        ( 'Код 1'
          ,'Код ДДС'
          ,'Наименование проекта'
          ,'Наименование заявки'
          ,'Дата заявки'
          ,'Статус заявки (сокращенное наименование статуса)'
          ,'Наименование материала (номенклатура закупки)'
          ,'Договор'
          ,'ОКПО Поставщика (контрагента)'
          ,'Поставщик (контрагент)'
          ,'Наименование единицы изменения'
          ,'Необходимое количество'
          ,'Цена за единицу с НДС'
          ,'Стоимость, с НДС'
          ,'Дата поставки (со строки заявки)'
          ,'Код 2'
          ,'Фактическое количество (в приходе)'
          ,'Цена за единицу с НДС (в приходе)'
          ,'стоимость с НДС (в приходе)'
          ,'Дата прихода'
          ,'Сумма к оплате (плановая)'
          ,'Дата плановой оплаты'
          ,'Дата фактической оплаты'
          ,'Цена за единицу с НДС (в оплатах)'
          ,'Стоимость с НДС (в оплатах)'
          ,'Количество (в оплатах)'
          ,'номер счета'
          ,'Ответственная служба (бюджетодержатель)'
          ,'Наименование вида оплат'
          ,'Значение вида оплат'
          ,'Дата оплаты (расчетная)'
          ,'Признак оплаты'
          ,'Наименование вида оплат (первоначальное)'
          ,'Значение вида оплат (первоначальное)'
          ,'строка кодов счетов'

        );


procedure TfrmRQPlanPayItemSecondShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPlanPayItemSecondShow:=nil;
    inherited;
  end;


procedure TfrmRQPlanPayItemSecondShow.FormShow(Sender: TObject);
var
  TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
  i: Integer;
  RQPlanPayItemSecondList: RQPlanPayItemSecondShortList;
  begin
  SetGridHeaders(RQPlanPayItemSecondHeaders, sgRQPlanPayItemSecond.ColumnHeaders);
  ColCount:=100;
  TempRQPlanPayItemSecond :=  HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayItemSecondFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayItemSecondList := TempRQPlanPayItemSecond.getScrollableFilteredList(RQPlanPayItemSecondFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPlanPayItemSecondList.list);

  if LastCount > -1 then
     sgRQPlanPayItemSecond.RowCount:=LastCount+2
  else
     sgRQPlanPayItemSecond.RowCount:=2;

   with sgRQPlanPayItemSecond do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayItemSecondList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].planPayItemFirstRefcode)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefDdscode;
        Cells[2,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefProject;
        Cells[3,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefNumberdoc;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstReforderdate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].planPayItemFirstReforderdate);

         Cells[5,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefstatussymbol;
        Cells[6,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefmname;
        Cells[7,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefcontract;
        Cells[8,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstReforgokpo;
        Cells[9,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstReforg;
        Cells[10,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefmeas;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefcountfact = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefcountfact.DecimalString;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefpricewithnds = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefpricewithnds.DecimalString;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefsumma = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := RQPlanPayItemSecondList.list[i].planPayItemFirstRefsumma.DecimalString;

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefpostavka_date = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].planPayItemFirstRefpostavka_date);

        if RQPlanPayItemSecondList.list[i].planPayItemFirstRefdeliverytime = Low(Integer) then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].planPayItemFirstRefdeliverytime);

        if RQPlanPayItemSecondList.list[i].prihod_count = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := RQPlanPayItemSecondList.list[i].prihod_count.DecimalString;

        if RQPlanPayItemSecondList.list[i].code <> Low(Integer) then
        Cells[17,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].code)
        else
        Cells[17,i+1] := '';

        if RQPlanPayItemSecondList.list[i].prihod_price = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := RQPlanPayItemSecondList.list[i].prihod_price.DecimalString;

        if RQPlanPayItemSecondList.list[i].prihod_summa = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := RQPlanPayItemSecondList.list[i].prihod_summa.DecimalString;

        if RQPlanPayItemSecondList.list[i].prihod_date = nil then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].prihod_date);

        if RQPlanPayItemSecondList.list[i].pay_plan_summa = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := RQPlanPayItemSecondList.list[i].pay_plan_summa.DecimalString;

        if RQPlanPayItemSecondList.list[i].pay_plan_date = nil then
          Cells[22,i+1] := ''
        else
          Cells[22,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_plan_date);

        if RQPlanPayItemSecondList.list[i].pay_fact_date = nil then
          Cells[23,i+1] := ''
        else
          Cells[23,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_fact_date);

        if RQPlanPayItemSecondList.list[i].pay_fact_price = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := RQPlanPayItemSecondList.list[i].pay_fact_price.DecimalString;

        if RQPlanPayItemSecondList.list[i].pay_fact_summa = nil then
          Cells[25,i+1] := ''
        else
          Cells[25,i+1] := RQPlanPayItemSecondList.list[i].pay_fact_summa.DecimalString;

        if RQPlanPayItemSecondList.list[i].pay_fact_count = nil then
          Cells[26,i+1] := ''
        else
          Cells[26,i+1] := RQPlanPayItemSecondList.list[i].pay_fact_count.DecimalString;

        Cells[27,i+1] := RQPlanPayItemSecondList.list[i].bill_num;
        Cells[28,i+1] := RQPlanPayItemSecondList.list[i].budget_name;
        Cells[29,i+1] := RQPlanPayItemSecondList.list[i].pay_type_name;

        if RQPlanPayItemSecondList.list[i].pay_type_value = Low(Integer) then
          Cells[30,i+1] := ''
        else
          Cells[30,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].pay_type_value);

        if RQPlanPayItemSecondList.list[i].pay_date = nil then
          Cells[31,i+1] := ''
        else
          Cells[31,i+1] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_date);

        if RQPlanPayItemSecondList.list[i].pay_sign = Low(Integer) then
          Cells[32,i+1] := ''
        else
          Cells[32,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].pay_sign);

        Cells[33,i+1] := RQPlanPayItemSecondList.list[i].pay_type_name_initial;

        if RQPlanPayItemSecondList.list[i].pay_type_value_initial = Low(Integer) then
          Cells[34,i+1] := ''
        else
          Cells[34,i+1] := IntToStr(RQPlanPayItemSecondList.list[i].pay_type_value_initial);

        Cells[35,i+1] := RQPlanPayItemSecondList.list[i].billitemcodes;

        LastRow:=i+1;
        sgRQPlanPayItemSecond.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPlanPayItemSecond.Row:=1;
end;

procedure TfrmRQPlanPayItemSecondShow.sgRQPlanPayItemSecondTopLeftChanged(Sender: TObject);
var
  TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
  i,CurrentRow: Integer;
  RQPlanPayItemSecondList: RQPlanPayItemSecondShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPlanPayItemSecond.TopRow + sgRQPlanPayItemSecond.VisibleRowCount) = ColCount
  then
    begin
      TempRQPlanPayItemSecond :=  HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;
      CurrentRow:=sgRQPlanPayItemSecond.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayItemSecondFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayItemSecondList := TempRQPlanPayItemSecond.getScrollableFilteredList(RQPlanPayItemSecondFilter(FilterObject),ColCount-1, 100);



  sgRQPlanPayItemSecond.RowCount:=sgRQPlanPayItemSecond.RowCount+100;
  LastCount:=High(RQPlanPayItemSecondList.list);
  with sgRQPlanPayItemSecond do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayItemSecondList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPlanPayItemSecondList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQPlanPayItemSecondList.list[i].prihod_count = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQPlanPayItemSecondList.list[i].prihod_count.DecimalString;
        if RQPlanPayItemSecondList.list[i].prihod_price = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := RQPlanPayItemSecondList.list[i].prihod_price.DecimalString;
        if RQPlanPayItemSecondList.list[i].prihod_summa = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := RQPlanPayItemSecondList.list[i].prihod_summa.DecimalString;
        if RQPlanPayItemSecondList.list[i].prihod_date = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(RQPlanPayItemSecondList.list[i].prihod_date);
        if RQPlanPayItemSecondList.list[i].pay_plan_summa = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := RQPlanPayItemSecondList.list[i].pay_plan_summa.DecimalString;
        if RQPlanPayItemSecondList.list[i].pay_plan_date = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_plan_date);
        if RQPlanPayItemSecondList.list[i].pay_fact_date = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_fact_date);
        if RQPlanPayItemSecondList.list[i].pay_fact_price = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := RQPlanPayItemSecondList.list[i].pay_fact_price.DecimalString;
        if RQPlanPayItemSecondList.list[i].pay_fact_summa = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := RQPlanPayItemSecondList.list[i].pay_fact_summa.DecimalString;
        if RQPlanPayItemSecondList.list[i].pay_fact_count = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := RQPlanPayItemSecondList.list[i].pay_fact_count.DecimalString;
        Cells[11,i+CurrentRow] := RQPlanPayItemSecondList.list[i].bill_num;
        Cells[12,i+CurrentRow] := RQPlanPayItemSecondList.list[i].budget_name;
        Cells[13,i+CurrentRow] := RQPlanPayItemSecondList.list[i].pay_type_name;
        if RQPlanPayItemSecondList.list[i].pay_type_value = Low(Integer) then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := IntToStr(RQPlanPayItemSecondList.list[i].pay_type_value);
        if RQPlanPayItemSecondList.list[i].pay_date = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := XSDate2String(RQPlanPayItemSecondList.list[i].pay_date);
        if RQPlanPayItemSecondList.list[i].pay_sign = Low(Integer) then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := IntToStr(RQPlanPayItemSecondList.list[i].pay_sign);
        Cells[17,i+CurrentRow] := RQPlanPayItemSecondList.list[i].pay_type_name_initial;
        if RQPlanPayItemSecondList.list[i].pay_type_value_initial = Low(Integer) then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := IntToStr(RQPlanPayItemSecondList.list[i].pay_type_value_initial);
        Cells[19,i+CurrentRow] := RQPlanPayItemSecondList.list[i].billitemcodes;
        Cells[20,i+CurrentRow] := RQPlanPayItemSecondList.list[i].userGen;
        if RQPlanPayItemSecondList.list[i].dateEdit = nil then
          Cells[21,i+CurrentRow] := ''
        else
          Cells[21,i+CurrentRow] := XSDateTime2String(RQPlanPayItemSecondList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPlanPayItemSecond.Row:=CurrentRow-5;
   sgRQPlanPayItemSecond.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPlanPayItemSecondShow.sgRQPlanPayItemSecondDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPlanPayItemSecond,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPlanPayItemSecondShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPlanPayItemSecond.RowCount-1 do
   for j:=0 to sgRQPlanPayItemSecond.ColCount-1 do
     sgRQPlanPayItemSecond.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPlanPayItemSecondShow.actViewExecute(Sender: TObject);
Var TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
begin
 TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;
   try
     RQPlanPayItemSecondObj := TempRQPlanPayItemSecond.getObject(StrToInt(sgRQPlanPayItemSecond.Cells[0,sgRQPlanPayItemSecond.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayItemSecondEdit:=TfrmRQPlanPayItemSecondEdit.Create(Application, dsView);
  try
    frmRQPlanPayItemSecondEdit.ShowModal;
  finally
    frmRQPlanPayItemSecondEdit.Free;
    frmRQPlanPayItemSecondEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayItemSecondShow.actEditExecute(Sender: TObject);
Var TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
begin
 TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;
   try
     RQPlanPayItemSecondObj := TempRQPlanPayItemSecond.getObject(StrToInt(sgRQPlanPayItemSecond.Cells[0,sgRQPlanPayItemSecond.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayItemSecondEdit:=TfrmRQPlanPayItemSecondEdit.Create(Application, dsEdit);
  try
    if frmRQPlanPayItemSecondEdit.ShowModal= mrOk then
      begin
        //TempRQPlanPayItemSecond.save(RQPlanPayItemSecondObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPlanPayItemSecondEdit.Free;
    frmRQPlanPayItemSecondEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayItemSecondShow.actDeleteExecute(Sender: TObject);
Var TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPayItemSecond.Cells[0,sgRQPlanPayItemSecond.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки плана оплат (счета,оплаты,приходы) ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPayItemSecond.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPayItemSecondShow.actInsertExecute(Sender: TObject);
// Var TempRQPlanPayItemSecond: RQPlanPayItemSecondControllerSoapPort; 
begin
  // TempRQPlanPayItemSecond := HTTPRIORQPlanPayItemSecond as RQPlanPayItemSecondControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPlanPayItemSecondObj:=RQPlanPayItemSecond.Create;

   //RQPlanPayItemSecondObj.prihod_count:= TXSDecimal.Create;
   //RQPlanPayItemSecondObj.prihod_price:= TXSDecimal.Create;
   //RQPlanPayItemSecondObj.prihod_summa:= TXSDecimal.Create;
   //RQPlanPayItemSecondObj.prihod_date:= TXSDate.Create;
   //RQPlanPayItemSecondObj.pay_plan_summa:= TXSDecimal.Create;
   //RQPlanPayItemSecondObj.pay_plan_date:= TXSDate.Create;
   //RQPlanPayItemSecondObj.pay_fact_date:= TXSDate.Create;
   //RQPlanPayItemSecondObj.pay_fact_price:= TXSDecimal.Create;
   //RQPlanPayItemSecondObj.pay_fact_summa:= TXSDecimal.Create;
   //RQPlanPayItemSecondObj.pay_fact_count:= TXSDecimal.Create;
   //RQPlanPayItemSecondObj.pay_date:= TXSDate.Create;
   //RQPlanPayItemSecondObj.dateEdit:= TXSDate.Create;


  try
    frmRQPlanPayItemSecondEdit:=TfrmRQPlanPayItemSecondEdit.Create(Application, dsInsert);
    try
      if frmRQPlanPayItemSecondEdit.ShowModal = mrOk then
      begin
        if RQPlanPayItemSecondObj<>nil then
            //TempRQPlanPayItemSecond.add(RQPlanPayItemSecondObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPlanPayItemSecondEdit.Free;
      frmRQPlanPayItemSecondEdit:=nil;
    end;
  finally
    RQPlanPayItemSecondObj.Free;
  end;
end;

procedure TfrmRQPlanPayItemSecondShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPlanPayItemSecondShow.actFilterExecute(Sender: TObject);
begin
{frmRQPlanPayItemSecondFilterEdit:=TfrmRQPlanPayItemSecondFilterEdit.Create(Application, dsInsert);
  try
    RQPlanPayItemSecondFilterObj := RQPlanPayItemSecondFilter.Create;
    SetNullIntProps(RQPlanPayItemSecondFilterObj);
    SetNullXSProps(RQPlanPayItemSecondFilterObj);

    if frmRQPlanPayItemSecondFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPlanPayItemSecondFilter.Create;
      FilterObject := RQPlanPayItemSecondFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPlanPayItemSecondFilterEdit.Free;
    frmRQPlanPayItemSecondFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPlanPayItemSecondShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.