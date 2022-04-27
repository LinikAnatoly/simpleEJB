
unit ShowENServicesSales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENServicesObjectController, AdvObj;


type
  TfrmENServicesSalesShow = class(TChildForm)
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
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    actBudgetApproved: TAction;
    actUnBudgetApproved: TAction;
    actSigned: TAction;
    actUnSigned: TAction;
    actPaid: TAction;
    actUnPaid: TAction;
    actCanceled: TAction;
    N16: TMenuItem;
    actExpExcel: TAction;
    N17: TMenuItem;

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
    procedure actBudgetApprovedExecute(Sender: TObject);
    procedure actUnBudgetApprovedExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure actPaidExecute(Sender: TObject);
    procedure actUnPaidExecute(Sender: TObject);
    procedure actCanceledExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actExpExcelExecute(Sender: TObject);

  private
   { Private declarations }
   isFiltered  : boolean;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;


  
implementation

uses Main, EditENSaleObjectFilter,
  EditENServicesSales, DMReportsUnit, ENConsts,
  ENServicesContractKindController;



{$R *.dfm}

var
  //frmENServicesCalculObjectShow : TfrmENServicesCalculObjectShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesSalesHeaders: array [1..12] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Покупець'
          ,'Код покупця'
          ,'Тип покупця'
          ,'Підрозділ'
          ,'Вип договору'
          ,'Статус договору'
          ,'Бух. статус'
          ,'Примітка'
          ,'Адреса покупця'
          {,'пользователь внесший изменение'
          ,'дата последнего изменения'}
        );
   

procedure TfrmENServicesSalesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENServicesSalesShow:=nil;
    inherited;
  end;


procedure TfrmENServicesSalesShow.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
  begin
  DisableActions([actNoFilter]);
  SetGridHeaders(ENServicesSalesHeaders, sgENServicesObject.ColumnHeaders);
  ColCount:=100;
  TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     ENServicesObjectFilter(FilterObject).conditionSQL := 'contractnumberservices is not null';
     ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';

     ENServicesObjectFilter(FilterObject).contractKindRef := ENServicesContractKindRef.Create;
     ENServicesObjectFilter(FilterObject).contractKindRef.code := SERVICES_CONTRACT_KIND_SALES; 

     isFiltered := false;
  end
  else
     isFiltered := true;

  if not isFiltered then
  begin
     actFilterExecute(Sender);
     exit;
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
        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumberServices;

        /// 21.09.11 Нужно выводить дату нашу, а не с ФК (если нашей нет, тогда с ФК)!
        if ENServicesObjectList.list[i].contractDateServices = nil then
        begin
          if ENServicesObjectList.list[i].contractDate = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        end
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);
        ///

        Cells[3,i+1] := ENServicesObjectList.list[i].contragentname;
        Cells[4,i+1] := ENServicesObjectList.list[i].contragentokpo;
        // тип заказчика 
        Cells[5,i+1] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[6,i+1] := ENServicesObjectList.list[i].departmentShortName;
        // Вип договора
        Cells[7,i+1] := ENServicesObjectList.list[i].contractKindRefName;
        // Статус договора
        Cells[8,i+1] := ENServicesObjectList.list[i].contractStatusRefName;

        // Бух. статус
        Cells[9,i+1] := ENServicesObjectList.list[i].statusRefName;

        Cells[10,i+1] := ENServicesObjectList.list[i].commentGen;

        Cells[11,i+1] := ENServicesObjectList.list[i].contragentAddress;

        LastRow:=i+1;
        sgENServicesObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesObject.Row:=1;
end;

procedure TfrmENServicesSalesShow.sgENServicesObjectTopLeftChanged(Sender: TObject);
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
     ENServicesObjectFilter(FilterObject).conditionSQL := 'contractnumberservices is not null';
     ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
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
        Cells[1,i+CurrentRow] := ENServicesObjectList.list[i].contractNumberServices;
        /// 21.09.11 Нужно выводить дату нашу, а не с ФК (если нашей нет, тогда с ФК)!
        if ENServicesObjectList.list[i].contractDateServices = nil then
        begin
          if ENServicesObjectList.list[i].contractDate = nil then
            Cells[2,i+CurrentRow] := ''
          else
            Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        end
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);
        ///
        Cells[3,i+CurrentRow] := ENServicesObjectList.list[i].contragentname;
        Cells[4,i+CurrentRow] := ENServicesObjectList.list[i].contragentokpo;
        // тип заказчика 
        Cells[5,i+CurrentRow] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[6,i+CurrentRow] := ENServicesObjectList.list[i].departmentShortName;
        // Вип договора
        Cells[7,i+CurrentRow] := ENServicesObjectList.list[i].contractKindRefName;
        // Статус договора
        Cells[8,i+CurrentRow] := ENServicesObjectList.list[i].contractStatusRefName;

        // Бух. статус
        Cells[9,i+CurrentRow] := ENServicesObjectList.list[i].statusRefName;

        Cells[10,i+CurrentRow] := ENServicesObjectList.list[i].commentGen;

        Cells[11,i+CurrentRow] := ENServicesObjectList.list[i].contragentAddress;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesObject.Row:=CurrentRow-5;
   sgENServicesObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesSalesShow.sgENServicesObjectDblClick(Sender: TObject);
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

procedure TfrmENServicesSalesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesObject.RowCount-1 do
   for j:=0 to sgENServicesObject.ColCount-1 do
     sgENServicesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesSalesShow.actViewExecute(Sender: TObject);
Var TempENServicesSales: ENServicesObjectControllerSoapPort;
begin
 TempENServicesSales := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ENServicesSaleObj := TempENServicesSales.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesSalesEdit:=TfrmENServicesSalesEdit.Create(Application, dsView);
//  frmENServicesSalesEdit.edtStatus.Text := sgENServicesObject.Cells[8,sgENServicesObject.Row];
  try
    frmENServicesSalesEdit.ShowModal;
  finally
    frmENServicesSalesEdit.Free;
    frmENServicesSalesEdit:=nil;
  end;
end;

procedure TfrmENServicesSalesShow.actEditExecute(Sender: TObject);
Var TempENServicesSales: ENServicesObjectControllerSoapPort;
begin
  TempENServicesSales := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesSaleObj := TempENServicesSales.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
  except
    on EConvertError do Exit;
  end;

  if (ENServicesSaleObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  {
  if (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Підписаний" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;
  }

  if (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CANCELED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Відмінений" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENServicesSalesEdit:=TfrmENServicesSalesEdit.Create(Application, dsEdit);
  try
    // frmENServicesSalesEdit.edtStatus.Text := sgENServicesObject.Cells[8,sgENServicesObject.Row];
    if frmENServicesSalesEdit.ShowModal= mrOk then
      begin

        //UpdateGrid(Sender);
      end;
    UpdateGrid(Sender);
  finally
    frmENServicesSalesEdit.Free;
    frmENServicesSalesEdit:=nil;
  end;
end;

procedure TfrmENServicesSalesShow.actDeleteExecute(Sender: TObject);
Var TempENServicesSales: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  TempENServicesSales := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  ENServicesSaleObj := TempENServicesSales.getObject(ObjCode);

  if (ENServicesSaleObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, видаляти не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesSaleObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Підписаний" або "Сплачений" видаляти не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Об''єкти - послуги на сторону) ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
      TempENServicesSales.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesSalesShow.actInsertExecute(Sender: TObject);
begin
  ENServicesSaleObj := ENServicesObject.Create;
  SetNullIntProps(ENServicesSaleObj);
  SetNullXSProps(ENServicesSaleObj);

  // ENServicesSaleObj.contractDate:= TXSDate.Create;
  // ENServicesSaleObj.dateEdit:= TXSDate.Create;
  try
    frmENServicesSalesEdit := TfrmENServicesSalesEdit.Create(Application, dsInsert);
    try
      if frmENServicesSalesEdit.ShowModal = mrOk then
      begin
        if ENServicesSaleObj <> nil then
        begin
          UpdateGrid(Sender);
        end;
      end;
    finally
      frmENServicesSalesEdit.Free;
      frmENServicesSalesEdit:=nil;
    end;
  finally
    ENServicesSaleObj.Free;
  end;
end;


procedure TfrmENServicesSalesShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesSalesShow.actFilterExecute(Sender: TObject);
var conditionSQL: String;
    contractKindCode : Integer;
begin
  contractKindCode := -1;
  frmENSaleObjectFilterEdit := TfrmENSaleObjectFilterEdit.Create(Application, dsInsert);
  frmENSaleObjectFilterEdit.Caption := 'Пошук Об''єкти - ралізація товарів';
  try
    ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
    SetNullIntProps(ENServicesObjectFilterObj);
    SetNullXSProps(ENServicesObjectFilterObj);

    if FilterObject <> nil then
      if ENServicesObjectFilter(FilterObject).contractKindRef <> nil then
         contractKindCode := ENServicesObjectFilter(FilterObject).contractKindRef.code;

    ENServicesObjectFilterObj.contractKindRef := ENServicesContractKindRef.Create;
    ENServicesObjectFilterObj.contractKindRef.code := contractKindCode;

    if frmENSaleObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENServicesObjectFilter.Create;
      FilterObject := ENServicesObjectFilterObj;
      conditionSQL := ENServicesObjectFilter(FilterObject).conditionSQL;
      AddCondition(conditionSQL, 'contractnumberservices is not null');
      ENServicesObjectFilter(FilterObject).conditionSQL := conditionSQL;
      ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
      actUpdateExecute(Sender);
    end;
  finally
    frmENSaleObjectFilterEdit.Free;
    frmENSaleObjectFilterEdit:=nil;
  end;
end;


procedure TfrmENServicesSalesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENServicesSalesShow.actBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode, planCode : Integer;
    svoObject : ENServicesObject;
begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
    svoObject := TempENServicesObject.getObject(objCode);
    planCode := DMReports.getPlanCodeForCalculationByElement(svoObject.element.code);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити специфікацію?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject.budgetApproved(objCode, planCode);

    Application.MessageBox(PChar('Специфікацію затверджено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesSalesShow.actUnBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження специфікації?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempENServicesObject.unBudgetApproved(objCode);

    Application.MessageBox(PChar('Затвердження відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;



procedure TfrmENServicesSalesShow.actSignedExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
    servicesObject : ENServicesObject;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  if (servicesObject.finDocID = LOW_INT) then
  begin
    Application.MessageBox(PChar('Не вибрано договір з Фін. Колекції!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  if (servicesObject.contragentName = '') then
  begin
    Application.MessageBox(PChar('Не вибрано замовника у договорі!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.signed(objCode);

    Application.MessageBox(PChar('Договір підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesSalesShow.actUnSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання договору?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unSigned(objCode);

    Application.MessageBox(PChar('Підписання відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesSalesShow.actPaidExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте сплатити рахунок за договором?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.paid(objCode);

    Application.MessageBox(PChar('Рахунок сплачено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesSalesShow.actUnPaidExecute(Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити оплату?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unPaid(objCode);

    Application.MessageBox(PChar('Оплату відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesSalesShow.actCanceledExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.canceled(objCode);

    Application.MessageBox(PChar('Договір відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesSalesShow.PopupMenu1Popup(Sender: TObject);
var calc : ENServicesObject;
    ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
   except
     on EConvertError do Exit;
   end;

   calc := DMReports.getServicesObjectByCode(ObjCode);
   if calc = nil then
   begin
     Exit;
   end;

   actCanceled.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT;
   actBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT;
   actUnBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
   actSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
   actUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
   actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
   actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

end;

procedure TfrmENServicesSalesShow.actExpExcelExecute(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку ... '+#10#13+' Зберегти в Ексель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgENServicesObject, 'Список_договорів_');
  end;

end;

end.
