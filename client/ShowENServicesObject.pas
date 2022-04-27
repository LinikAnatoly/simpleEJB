
unit ShowENServicesObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesObjectController, AdvObj ;


type
  TfrmENServicesObjectShow = class(TChildForm)  
  HTTPRIOENServicesObject: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesObject: TAdvStringGrid;
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
procedure sgENServicesObjectTopLeftChanged(Sender: TObject);
procedure sgENServicesObjectDblClick(Sender: TObject);
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
 frmENServicesObjectShow : TfrmENServicesObjectShow;
 // ENServicesObjectObj: ENServicesObject;
 // ENServicesObjectFilterObj: ENServicesObjectFilter;
  
  
implementation

uses Main, EditENServicesObject, EditENServicesObjectFilter;


{$R *.dfm}

var
  //frmENServicesObjectShow : TfrmENServicesObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesObjectHeaders: array [1..25] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Найменування організації'
          ,'код організації'
          ,'код договору у фін.кол.'
          ,'PK договору у фін.кол.'
          ,'Примітка'
          ,'Номер договору по послугам на сторону'
          ,'Дата договору'
          ,'Замовник'
          ,'Адреса замовника'
          ,'ОКПО(ІПН) замовника'
          ,'Розрахунковий рахунок замовника'
          ,'Найменування банку замовника'
          ,'МФО банку замовника'
          ,'Керівник'
          ,'Паспортні дані замовника'
          ,'Сумма по договору'
          ,'Мощность по договору'
          ,'Примітка для договору по роботам на сторону'
          ,'Расстояние до объекта по договору'
          ,'Количество дней в течении которого обязуемся выполнить работы'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENServicesObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENServicesObjectShow:=nil;
    inherited;
  end;


procedure TfrmENServicesObjectShow.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
  begin
  SetGridHeaders(ENServicesObjectHeaders, sgENServicesObject.ColumnHeaders);
  ColCount:=100;
  TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesObjectList := TempENServicesObject.getEasyShortList(ENServicesObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENServicesObjectList.list);

  if LastCount > -1 then
     sgENServicesObject.RowCount:=LastCount+2
  else
     sgENServicesObject.RowCount:=2;

   with sgENServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumber;
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        Cells[3,i+1] := ENServicesObjectList.list[i].name;
        Cells[4,i+1] := ENServicesObjectList.list[i].partnerCode;
        Cells[5,i+1] := ENServicesObjectList.list[i].finDocCode;
        if ENServicesObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENServicesObjectList.list[i].finDocID);
        Cells[7,i+1] := ENServicesObjectList.list[i].commentGen;
        Cells[8,i+1] := ENServicesObjectList.list[i].contractNumberServices;
        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);
        Cells[10,i+1] := ENServicesObjectList.list[i].contragentName;
        Cells[11,i+1] := ENServicesObjectList.list[i].contragentAddress;
        Cells[12,i+1] := ENServicesObjectList.list[i].contragentOkpo;
        Cells[13,i+1] := ENServicesObjectList.list[i].contragentBankAccount;
        Cells[14,i+1] := ENServicesObjectList.list[i].contragentBankName;
        Cells[15,i+1] := ENServicesObjectList.list[i].contragentBankMfo;
        Cells[16,i+1] := ENServicesObjectList.list[i].contragentBossName;
        Cells[17,i+1] := ENServicesObjectList.list[i].contragentPassport;
        if ENServicesObjectList.list[i].contractServicesSumma = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := ENServicesObjectList.list[i].contractServicesSumma.DecimalString;
        if ENServicesObjectList.list[i].contractServicesPower = nil then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := ENServicesObjectList.list[i].contractServicesPower.DecimalString;
        Cells[20,i+1] := ENServicesObjectList.list[i].commentServicesGen;
        if ENServicesObjectList.list[i].contractServicesDistance = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := ENServicesObjectList.list[i].contractServicesDistance.DecimalString;
        if ENServicesObjectList.list[i].contractServicesDay = nil then
          Cells[22,i+1] := ''
        else
          Cells[22,i+1] := ENServicesObjectList.list[i].contractServicesDay.DecimalString;
        Cells[23,i+1] := ENServicesObjectList.list[i].userGen;
        if ENServicesObjectList.list[i].dateEdit = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := XSDate2String(ENServicesObjectList.list[i].dateEdit);
        LastRow:=i+1;
        sgENServicesObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesObject.Row:=1;
end;

procedure TfrmENServicesObjectShow.sgENServicesObjectTopLeftChanged(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServicesObject.TopRow + sgENServicesObject.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      CurrentRow:=sgENServicesObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesObjectList := TempENServicesObject.getEasyShortList(ENServicesObjectFilter(FilterObject),ColCount-1, 100);

  sgENServicesObject.RowCount:=sgENServicesObject.RowCount+100;
  LastCount:=High(ENServicesObjectList.list);
  with sgENServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENServicesObjectList.list[i].contractNumber;
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        Cells[3,i+CurrentRow] := ENServicesObjectList.list[i].name;
        Cells[4,i+CurrentRow] := ENServicesObjectList.list[i].partnerCode;
        Cells[5,i+CurrentRow] := ENServicesObjectList.list[i].finDocCode;
        if ENServicesObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].finDocID);
        Cells[7,i+CurrentRow] := ENServicesObjectList.list[i].commentGen;
        Cells[8,i+CurrentRow] := ENServicesObjectList.list[i].contractNumberServices;
        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);
        Cells[10,i+CurrentRow] := ENServicesObjectList.list[i].contragentName;
        Cells[11,i+CurrentRow] := ENServicesObjectList.list[i].contragentAddress;
        Cells[12,i+CurrentRow] := ENServicesObjectList.list[i].contragentOkpo;
        Cells[13,i+CurrentRow] := ENServicesObjectList.list[i].contragentBankAccount;
        Cells[14,i+CurrentRow] := ENServicesObjectList.list[i].contragentBankName;
        Cells[15,i+CurrentRow] := ENServicesObjectList.list[i].contragentBankMfo;
        Cells[16,i+CurrentRow] := ENServicesObjectList.list[i].contragentBossName;
        Cells[17,i+CurrentRow] := ENServicesObjectList.list[i].contragentPassport;
        if ENServicesObjectList.list[i].contractServicesSumma = nil then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := ENServicesObjectList.list[i].contractServicesSumma.DecimalString;
        if ENServicesObjectList.list[i].contractServicesPower = nil then
          Cells[19,i+CurrentRow] := ''
        else
          Cells[19,i+CurrentRow] := ENServicesObjectList.list[i].contractServicesPower.DecimalString;
        Cells[20,i+CurrentRow] := ENServicesObjectList.list[i].commentServicesGen;
        if ENServicesObjectList.list[i].contractServicesDistance = nil then
          Cells[21,i+CurrentRow] := ''
        else
          Cells[21,i+CurrentRow] := ENServicesObjectList.list[i].contractServicesDistance.DecimalString;
        if ENServicesObjectList.list[i].contractServicesDay = nil then
          Cells[22,i+CurrentRow] := ''
        else
          Cells[22,i+CurrentRow] := ENServicesObjectList.list[i].contractServicesDay.DecimalString;
        Cells[23,i+CurrentRow] := ENServicesObjectList.list[i].userGen;
        if ENServicesObjectList.list[i].dateEdit = nil then
          Cells[24,i+CurrentRow] := ''
        else
          Cells[24,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesObject.Row:=CurrentRow-5;
   sgENServicesObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesObjectShow.sgENServicesObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServicesObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENServicesObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesObject.RowCount-1 do
   for j:=0 to sgENServicesObject.ColCount-1 do
     sgENServicesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesObjectShow.actViewExecute(Sender: TObject);
Var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
 TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ENServicesObjectObj := TempENServicesObject.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesObjectEdit:=TfrmENServicesObjectEdit.Create(Application, dsView);
  try
    frmENServicesObjectEdit.ShowModal;
  finally
    frmENServicesObjectEdit.Free;
    frmENServicesObjectEdit:=nil;
  end;
end;

procedure TfrmENServicesObjectShow.actEditExecute(Sender: TObject);
Var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
 TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ENServicesObjectObj := TempENServicesObject.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesObjectEdit:=TfrmENServicesObjectEdit.Create(Application, dsEdit);
  try
    if frmENServicesObjectEdit.ShowModal= mrOk then
      begin
        //TempENServicesObject.save(ENServicesObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServicesObjectEdit.Free;
    frmENServicesObjectEdit:=nil;
  end;
end;

procedure TfrmENServicesObjectShow.actDeleteExecute(Sender: TObject);
Var TempENServicesObject: ENServicesObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьєкти - послуги на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesObjectShow.actInsertExecute(Sender: TObject);
begin
  ENServicesObjectObj := ENServicesObject.Create;
  SetNullIntProps(ENServicesObjectObj);
  SetNullXSProps(ENServicesObjectObj);

  // ENServicesObjectObj.contractDate:= TXSDate.Create;
  // ENServicesObjectObj.dateEdit:= TXSDate.Create;

  try
    frmENServicesObjectEdit:=TfrmENServicesObjectEdit.Create(Application, dsInsert);
    try
      if frmENServicesObjectEdit.ShowModal = mrOk then
      begin
        if ENServicesObjectObj<>nil then
            //TempENServicesObject.add(ENServicesObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServicesObjectEdit.Free;
      frmENServicesObjectEdit:=nil;
    end;
  finally
    ENServicesObjectObj.Free;
  end;
end;

procedure TfrmENServicesObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesObjectShow.actFilterExecute(Sender: TObject);
begin
frmENServicesObjectFilterEdit:=TfrmENServicesObjectFilterEdit.Create(Application, dsInsert);
  try
    ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
    SetNullIntProps(ENServicesObjectFilterObj);
    SetNullXSProps(ENServicesObjectFilterObj);

    if frmENServicesObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENServicesObjectFilter.Create;
      FilterObject := ENServicesObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesObjectFilterEdit.Free;
    frmENServicesObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENServicesObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.