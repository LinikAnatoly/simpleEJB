
unit ShowRQPlanPayItemFirst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQPlanPayItemFirstController, AdvObj ;


type
  TfrmRQPlanPayItemFirstShow = class(TChildForm)  
  HTTPRIORQPlanPayItemFirst: THTTPRIO;
    ImageList1: TImageList;
    sgRQPlanPayItemFirst: TAdvStringGrid;
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
procedure sgRQPlanPayItemFirstTopLeftChanged(Sender: TObject);
procedure sgRQPlanPayItemFirstDblClick(Sender: TObject);
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
 // RQPlanPayItemFirstObj: RQPlanPayItemFirst;
 // RQPlanPayItemFirstFilterObj: RQPlanPayItemFirstFilter;
  
  
implementation

uses Main, EditRQPlanPayItemFirst, EditRQPlanPayItemFirstFilter;


{$R *.dfm}

var
  //frmRQPlanPayItemFirstShow : TfrmRQPlanPayItemFirstShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPlanPayItemFirstHeaders: array [1..28] of String =
        ( 'Код'
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
          ,'Стоимость с НДС'
          ,'Дата поставки (со строки заявки)'
          ,'кол-во дней поставки'
          ,'Строка кодов строк счета'
          ,'Минимальная дата поставки'
          ,'Плановая дата поставки'
          ,'Вид оплаты'
          ,'значение вида оплат'
          ,'Плановая сумма оплаты'
          ,'Дата оплаты (расчетная)'
          ,'Наименование вида оплат (первоначальное)'
          ,'Значение вида оплат (первоначальное)'
          ,'Наименование бюджетодержателя'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );
   

procedure TfrmRQPlanPayItemFirstShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQPlanPayItemFirstShow:=nil;
    inherited;
  end;


procedure TfrmRQPlanPayItemFirstShow.FormShow(Sender: TObject);
var
  TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort;
  i: Integer;
  RQPlanPayItemFirstList: RQPlanPayItemFirstShortList;
  begin
  SetGridHeaders(RQPlanPayItemFirstHeaders, sgRQPlanPayItemFirst.ColumnHeaders);
  ColCount:=100;
  TempRQPlanPayItemFirst :=  HTTPRIORQPlanPayItemFirst as RQPlanPayItemFirstControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayItemFirstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayItemFirstList := TempRQPlanPayItemFirst.getScrollableFilteredList(RQPlanPayItemFirstFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPlanPayItemFirstList.list);

  if LastCount > -1 then
     sgRQPlanPayItemFirst.RowCount:=LastCount+2
  else
     sgRQPlanPayItemFirst.RowCount:=2;

   with sgRQPlanPayItemFirst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayItemFirstList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPlanPayItemFirstList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPlanPayItemFirstList.list[i].ddscode;
        Cells[2,i+1] := RQPlanPayItemFirstList.list[i].project;
        Cells[3,i+1] := RQPlanPayItemFirstList.list[i].numberdoc;
        if RQPlanPayItemFirstList.list[i].orderdate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(RQPlanPayItemFirstList.list[i].orderdate);
        Cells[5,i+1] := RQPlanPayItemFirstList.list[i].statussymbol;
        Cells[6,i+1] := RQPlanPayItemFirstList.list[i].mname;
        Cells[7,i+1] := RQPlanPayItemFirstList.list[i].contract;
        Cells[8,i+1] := RQPlanPayItemFirstList.list[i].orgokpo;
        Cells[9,i+1] := RQPlanPayItemFirstList.list[i].org;
        Cells[10,i+1] := RQPlanPayItemFirstList.list[i].meas;
        if RQPlanPayItemFirstList.list[i].countfact = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := RQPlanPayItemFirstList.list[i].countfact.DecimalString;
        if RQPlanPayItemFirstList.list[i].pricewithnds = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := RQPlanPayItemFirstList.list[i].pricewithnds.DecimalString;
        if RQPlanPayItemFirstList.list[i].summa = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := RQPlanPayItemFirstList.list[i].summa.DecimalString;
        if RQPlanPayItemFirstList.list[i].postavka_date = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := XSDate2String(RQPlanPayItemFirstList.list[i].postavka_date);
        if RQPlanPayItemFirstList.list[i].deliverytime = Low(Integer) then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := IntToStr(RQPlanPayItemFirstList.list[i].deliverytime);
        Cells[16,i+1] := RQPlanPayItemFirstList.list[i].billitemcodes;
        if RQPlanPayItemFirstList.list[i].min_postavka_date = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := XSDate2String(RQPlanPayItemFirstList.list[i].min_postavka_date);
        if RQPlanPayItemFirstList.list[i].planeddatepays = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := XSDate2String(RQPlanPayItemFirstList.list[i].planeddatepays);
        Cells[19,i+1] := RQPlanPayItemFirstList.list[i].paymenttypename;
        if RQPlanPayItemFirstList.list[i].paymentvalue = Low(Integer) then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := IntToStr(RQPlanPayItemFirstList.list[i].paymentvalue);
        if RQPlanPayItemFirstList.list[i].plansumpay = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := RQPlanPayItemFirstList.list[i].plansumpay.DecimalString;
        if RQPlanPayItemFirstList.list[i].reestr_date = nil then
          Cells[22,i+1] := ''
        else
          Cells[22,i+1] := XSDate2String(RQPlanPayItemFirstList.list[i].reestr_date);
        Cells[23,i+1] := RQPlanPayItemFirstList.list[i].paymenttypename_initial;
        if RQPlanPayItemFirstList.list[i].paymentvalue_initial = Low(Integer) then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := IntToStr(RQPlanPayItemFirstList.list[i].paymentvalue_initial);
        Cells[25,i+1] := RQPlanPayItemFirstList.list[i].budgetrefname;
        Cells[26,i+1] := RQPlanPayItemFirstList.list[i].userGen;
        if RQPlanPayItemFirstList.list[i].dateEdit = nil then
          Cells[27,i+1] := ''
        else
          Cells[27,i+1] := XSDate2String(RQPlanPayItemFirstList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQPlanPayItemFirst.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPlanPayItemFirst.Row:=1;
end;

procedure TfrmRQPlanPayItemFirstShow.sgRQPlanPayItemFirstTopLeftChanged(Sender: TObject);
var
  TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort;
  i,CurrentRow: Integer;
  RQPlanPayItemFirstList: RQPlanPayItemFirstShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPlanPayItemFirst.TopRow + sgRQPlanPayItemFirst.VisibleRowCount) = ColCount
  then
    begin
      TempRQPlanPayItemFirst :=  HTTPRIORQPlanPayItemFirst as RQPlanPayItemFirstControllerSoapPort;
      CurrentRow:=sgRQPlanPayItemFirst.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPlanPayItemFirstFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPlanPayItemFirstList := TempRQPlanPayItemFirst.getScrollableFilteredList(RQPlanPayItemFirstFilter(FilterObject),ColCount-1, 100);



  sgRQPlanPayItemFirst.RowCount:=sgRQPlanPayItemFirst.RowCount+100;
  LastCount:=High(RQPlanPayItemFirstList.list);
  with sgRQPlanPayItemFirst do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPlanPayItemFirstList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPlanPayItemFirstList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPlanPayItemFirstList.list[i].ddscode;
        Cells[2,i+CurrentRow] := RQPlanPayItemFirstList.list[i].project;
        Cells[3,i+CurrentRow] := RQPlanPayItemFirstList.list[i].numberdoc;
        if RQPlanPayItemFirstList.list[i].orderdate = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(RQPlanPayItemFirstList.list[i].orderdate);
        Cells[5,i+CurrentRow] := RQPlanPayItemFirstList.list[i].statussymbol;
        Cells[6,i+CurrentRow] := RQPlanPayItemFirstList.list[i].mname;
        Cells[7,i+CurrentRow] := RQPlanPayItemFirstList.list[i].contract;
        Cells[8,i+CurrentRow] := RQPlanPayItemFirstList.list[i].orgokpo;
        Cells[9,i+CurrentRow] := RQPlanPayItemFirstList.list[i].org;
        Cells[10,i+CurrentRow] := RQPlanPayItemFirstList.list[i].meas;
        if RQPlanPayItemFirstList.list[i].countfact = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := RQPlanPayItemFirstList.list[i].countfact.DecimalString;
        if RQPlanPayItemFirstList.list[i].pricewithnds = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := RQPlanPayItemFirstList.list[i].pricewithnds.DecimalString;
        if RQPlanPayItemFirstList.list[i].summa = nil then
          Cells[13,i+CurrentRow] := ''
        else
          Cells[13,i+CurrentRow] := RQPlanPayItemFirstList.list[i].summa.DecimalString;
        if RQPlanPayItemFirstList.list[i].postavka_date = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := XSDate2String(RQPlanPayItemFirstList.list[i].postavka_date);
        if RQPlanPayItemFirstList.list[i].deliverytime = Low(Integer) then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := IntToStr(RQPlanPayItemFirstList.list[i].deliverytime);
        Cells[16,i+CurrentRow] := RQPlanPayItemFirstList.list[i].billitemcodes;
        if RQPlanPayItemFirstList.list[i].min_postavka_date = nil then
          Cells[17,i+CurrentRow] := ''
        else
          Cells[17,i+CurrentRow] := XSDate2String(RQPlanPayItemFirstList.list[i].min_postavka_date);
        if RQPlanPayItemFirstList.list[i].planeddatepays = nil then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := XSDate2String(RQPlanPayItemFirstList.list[i].planeddatepays);
        Cells[19,i+CurrentRow] := RQPlanPayItemFirstList.list[i].paymenttypename;
        if RQPlanPayItemFirstList.list[i].paymentvalue = Low(Integer) then
          Cells[20,i+CurrentRow] := ''
        else
          Cells[20,i+CurrentRow] := IntToStr(RQPlanPayItemFirstList.list[i].paymentvalue);
        if RQPlanPayItemFirstList.list[i].plansumpay = nil then
          Cells[21,i+CurrentRow] := ''
        else
          Cells[21,i+CurrentRow] := RQPlanPayItemFirstList.list[i].plansumpay.DecimalString;
        if RQPlanPayItemFirstList.list[i].reestr_date = nil then
          Cells[22,i+CurrentRow] := ''
        else
          Cells[22,i+CurrentRow] := XSDate2String(RQPlanPayItemFirstList.list[i].reestr_date);
        Cells[23,i+CurrentRow] := RQPlanPayItemFirstList.list[i].paymenttypename_initial;
        if RQPlanPayItemFirstList.list[i].paymentvalue_initial = Low(Integer) then
          Cells[24,i+CurrentRow] := ''
        else
          Cells[24,i+CurrentRow] := IntToStr(RQPlanPayItemFirstList.list[i].paymentvalue_initial);
        Cells[25,i+CurrentRow] := RQPlanPayItemFirstList.list[i].budgetrefname;
        Cells[26,i+CurrentRow] := RQPlanPayItemFirstList.list[i].userGen;
        if RQPlanPayItemFirstList.list[i].dateEdit = nil then
          Cells[27,i+CurrentRow] := ''
        else
          Cells[27,i+CurrentRow] := XSDate2String(RQPlanPayItemFirstList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPlanPayItemFirst.Row:=CurrentRow-5;
   sgRQPlanPayItemFirst.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPlanPayItemFirstShow.sgRQPlanPayItemFirstDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPlanPayItemFirst,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPlanPayItemFirstShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPlanPayItemFirst.RowCount-1 do
   for j:=0 to sgRQPlanPayItemFirst.ColCount-1 do
     sgRQPlanPayItemFirst.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPlanPayItemFirstShow.actViewExecute(Sender: TObject);
Var TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort;
begin
 TempRQPlanPayItemFirst := HTTPRIORQPlanPayItemFirst as RQPlanPayItemFirstControllerSoapPort;
   try
     RQPlanPayItemFirstObj := TempRQPlanPayItemFirst.getObject(StrToInt(sgRQPlanPayItemFirst.Cells[0,sgRQPlanPayItemFirst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayItemFirstEdit:=TfrmRQPlanPayItemFirstEdit.Create(Application, dsView);
  try
    frmRQPlanPayItemFirstEdit.ShowModal;
  finally
    frmRQPlanPayItemFirstEdit.Free;
    frmRQPlanPayItemFirstEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayItemFirstShow.actEditExecute(Sender: TObject);
Var TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort;
begin
 TempRQPlanPayItemFirst := HTTPRIORQPlanPayItemFirst as RQPlanPayItemFirstControllerSoapPort;
   try
     RQPlanPayItemFirstObj := TempRQPlanPayItemFirst.getObject(StrToInt(sgRQPlanPayItemFirst.Cells[0,sgRQPlanPayItemFirst.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPlanPayItemFirstEdit:=TfrmRQPlanPayItemFirstEdit.Create(Application, dsEdit);
  try
    if frmRQPlanPayItemFirstEdit.ShowModal= mrOk then
      begin
        //TempRQPlanPayItemFirst.save(RQPlanPayItemFirstObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPlanPayItemFirstEdit.Free;
    frmRQPlanPayItemFirstEdit:=nil;
  end;
end;

procedure TfrmRQPlanPayItemFirstShow.actDeleteExecute(Sender: TObject);
Var TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPlanPayItemFirst := HTTPRIORQPlanPayItemFirst as RQPlanPayItemFirstControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPlanPayItemFirst.Cells[0,sgRQPlanPayItemFirst.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки плана оплат (заявка) ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPlanPayItemFirst.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPlanPayItemFirstShow.actInsertExecute(Sender: TObject);
// Var TempRQPlanPayItemFirst: RQPlanPayItemFirstControllerSoapPort; 
begin
  // TempRQPlanPayItemFirst := HTTPRIORQPlanPayItemFirst as RQPlanPayItemFirstControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPlanPayItemFirstObj:=RQPlanPayItemFirst.Create;

   //RQPlanPayItemFirstObj.orderdate:= TXSDate.Create;
   //RQPlanPayItemFirstObj.countfact:= TXSDecimal.Create;
   //RQPlanPayItemFirstObj.pricewithnds:= TXSDecimal.Create;
   //RQPlanPayItemFirstObj.summa:= TXSDecimal.Create;
   //RQPlanPayItemFirstObj.postavka_date:= TXSDate.Create;
   //RQPlanPayItemFirstObj.min_postavka_date:= TXSDate.Create;
   //RQPlanPayItemFirstObj.planeddatepays:= TXSDate.Create;
   //RQPlanPayItemFirstObj.plansumpay:= TXSDecimal.Create;
   //RQPlanPayItemFirstObj.reestr_date:= TXSDate.Create;
   //RQPlanPayItemFirstObj.dateEdit:= TXSDate.Create;


  try
    frmRQPlanPayItemFirstEdit:=TfrmRQPlanPayItemFirstEdit.Create(Application, dsInsert);
    try
      if frmRQPlanPayItemFirstEdit.ShowModal = mrOk then
      begin
        if RQPlanPayItemFirstObj<>nil then
            //TempRQPlanPayItemFirst.add(RQPlanPayItemFirstObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPlanPayItemFirstEdit.Free;
      frmRQPlanPayItemFirstEdit:=nil;
    end;
  finally
    RQPlanPayItemFirstObj.Free;
  end;
end;

procedure TfrmRQPlanPayItemFirstShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPlanPayItemFirstShow.actFilterExecute(Sender: TObject);
begin
{frmRQPlanPayItemFirstFilterEdit:=TfrmRQPlanPayItemFirstFilterEdit.Create(Application, dsInsert);
  try
    RQPlanPayItemFirstFilterObj := RQPlanPayItemFirstFilter.Create;
    SetNullIntProps(RQPlanPayItemFirstFilterObj);
    SetNullXSProps(RQPlanPayItemFirstFilterObj);

    if frmRQPlanPayItemFirstFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQPlanPayItemFirstFilter.Create;
      FilterObject := RQPlanPayItemFirstFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPlanPayItemFirstFilterEdit.Free;
    frmRQPlanPayItemFirstFilterEdit:=nil;
  end;}
end;

procedure TfrmRQPlanPayItemFirstShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.