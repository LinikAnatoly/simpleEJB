
unit ShowENServicesConnection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesObjectController, AdvObj, ENSO2NodeController;

 type
  TProcChooseENServicesObjectHandler = reference to procedure(selectedObj: ENServicesObjectShort);

type
  TfrmENServicesConnectionShow = class(TChildForm)
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
    miActSigned: TMenuItem;
    miActUnSigned: TMenuItem;
    actCountersActSigned: TAction;
    actCountersActUnSigned: TAction;
    actFinishWork: TAction;
    N18: TMenuItem;
    actPrepaid: TAction;
    actUnPrepaid: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    miActDisclaimerCustomerServices: TMenuItem;
    actDisclaimerCustomerServices: TAction;
    miChangeCustomerType: TMenuItem;
    actChangeCustomerType: TAction;
    actUpdatePersonalAccount: TAction;
    N22: TMenuItem;
    N23: TMenuItem;
    actChangeContractFin: TAction;
    N24: TMenuItem;
    actChangeConnectionType: TAction;
    N25: TMenuItem;
    actChangeAddress: TAction;
    N26: TMenuItem;

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
    procedure actCountersActSignedExecute(Sender: TObject);
    procedure actCountersActUnSignedExecute(Sender: TObject);
    procedure actFinishWorkExecute(Sender: TObject);
    procedure actPrepaidExecute(Sender: TObject);
    procedure actUnPrepaidExecute(Sender: TObject);
    procedure actDisclaimerCustomerServicesExecute(Sender: TObject);
    procedure actChangeCustomerTypeExecute(Sender: TObject);
    procedure actUpdatePersonalAccountExecute(Sender: TObject);
    procedure actChangeContractFinExecute(Sender: TObject);
    procedure actChangeConnectionTypeExecute(Sender: TObject);
    procedure actChangeAddressExecute(Sender: TObject);

  private
   { Private declarations }
   isFiltered  : boolean;
   priconnections : Boolean;

 public
   { Public declarations }
   substation04Code : Integer;
   notStandartConnection : Boolean;
   procedure UpdateGrid(Sender: TObject);
   class procedure chooseFromList(proc: TProcChooseENServicesObjectHandler); overload; stdcall; static;
   class procedure chooseFromListConnection(proc: TProcChooseENServicesObjectHandler); stdcall; static;
   class procedure chooseFromList(filter : ENServicesObjectFilter; proc: TProcChooseENServicesObjectHandler); overload; stdcall; static;
 end;

var
 frmENServicesConnectionShow : TfrmENServicesConnectionShow;
 // ENServicesConnectionObj: ENServicesObject;
 // ENServicesObjectFilterObj: ENServicesObjectFilter;

var servObjCode: Integer;

implementation

uses Main, EditENServicesObjectFilter,
  EditENServicesConnection, DMReportsUnit, ENConsts,
  ENServicesContractKindController, ENServicesContractTypeController,
  EditENServicesContragentType, EditPersonalAccountForServicesObject,
  ShowFINServicesObject, EditENConnectionKind, ShowENServicesCalculation,
  EditCustomerAddress;


{$R *.dfm}

var
  //frmENServicesCalculObjectShow : TfrmENServicesCalculObjectShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesCalculationHeaders: array [1..15] of String =
        ( 'Код'
          ,'№ дог./№ фін.кол.'
          ,'Дата дог.'
          ,'Замовник'
          ,'Код замовника'
          ,'Тип замовника'
          ,'Підрозділ'
          ,'Тип договору'
          ,'Статус договору'
          ,'Бух. статус'
          ,'Наличие связки с деревом CC'
          ,'Количество связок с деревом СС'
          ,'Адреса місця виконання робіт'
          ,'Номер ТУ'
          ,'Дата ТУ'

        );

class procedure TfrmENServicesConnectionShow.chooseFromListConnection(proc: TProcChooseENServicesObjectHandler);
var
  f : ENServicesObjectFilter;
begin
     f := ENServicesObjectFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.contractTypeRef := ENServicesContractTypeRef.Create;
     f.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION;
     f.contractKindRef := ENServicesContractKindRef.Create;
     f.contractKindRef.code := SERVICES_CONTRACT_KIND_SERVICES;

     TfrmENServicesConnectionShow.chooseFromList(f, proc);
end;

class procedure TfrmENServicesConnectionShow.chooseFromList(proc: TProcChooseENServicesObjectHandler);
begin
     TfrmENServicesConnectionShow.chooseFromList(nil, proc);
end;

class procedure TfrmENServicesConnectionShow.chooseFromList(filter : ENServicesObjectFilter; proc: TProcChooseENServicesObjectHandler);
var
  f1 : ENServicesObjectFilter;
  frmENServicesConnectionShow : TfrmENServicesConnectionShow;
  selected : ENServicesObjectShort;
begin
  inherited;
    if filter <> nil then begin
       f1 := filter;
    end else begin
       f1 := ENServicesObjectFilter.Create;
       SetNullXSProps(f1);
       SetNullIntProps(f1);
    end;

     frmENServicesConnectionShow := TfrmENServicesConnectionShow.Create(Application,fmNormal, f1);

       try
          with frmENServicesConnectionShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENServicesObjectShort(sgENServicesObject.Objects[0, sgENServicesObject.Row]);
                  proc(selected);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmENServicesConnectionShow.Free;
       end;

end;

procedure TfrmENServicesConnectionShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormMode = fmChild) then
  begin
    {
    if (FilterObject <> nil) then
    begin
      if (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil)
          and (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION)
      then frmENServicesConnectionShow := nil
      else
        frmENServicesCalculationShow := nil;
    end
    else

      frmENServicesCalculationShow := nil;
    }
    frmENServicesConnectionShow := nil;
  end;

   inherited;
end;


procedure TfrmENServicesConnectionShow.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
begin
  if FormMode=fmFiltered then DisableActions([actFilter, actNoFilter]);

  if (FilterObject <> nil) and (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil) and
     (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_CONNECTION) then
  begin
    priconnections := True;
    ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
    DisableActions([actInsert, actDelete]);
  end;

  DisableActions([actNoFilter]);
  SetGridHeaders(ENServicesCalculationHeaders, sgENServicesObject.ColumnHeaders);

  if (priconnections) then
  begin
    sgENServicesObject.ColWidths[7] := 150;
    sgENServicesObject.ColumnHeaders[7] := 'Тип договору / Тип приєднання';
  end;

  ColCount:=100;
  TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     //ENServicesObjectFilter(FilterObject).conditionSQL := 'contractnumberservices is not null';
     ENServicesObjectFilter(FilterObject).conditionSQL := '(contractnumberservices is not null and ' +
                                                          ' coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_CONNECTION) + ')';
     ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';

     ENServicesObjectFilter(FilterObject).contractKindRef := ENServicesContractKindRef.Create;
     ENServicesObjectFilter(FilterObject).contractKindRef.code := SERVICES_CONTRACT_KIND_SERVICES;

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

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumberServices + '/' + ENServicesObjectList.list[i].contractNumber
        else
        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumberServices;

        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

        Cells[3,i+1] := ENServicesObjectList.list[i].contragentname;
        Cells[4,i+1] := ENServicesObjectList.list[i].contragentokpo;

        // тип заказчика
        Cells[5,i+1] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[6,i+1] := ENServicesObjectList.list[i].departmentShortName;
        // Тип договора
        Cells[7,i+1] := ENServicesObjectList.list[i].contractTypeRefName;
        // Статус договора
        Cells[8,i+1] := ENServicesObjectList.list[i].contractStatusRefName;

        // Бух. статус
        Cells[9,i+1] := ENServicesObjectList.list[i].statusRefName;

        Cells[10,i+1] := ENServicesObjectList.list[i].node_exist;
        //Количество связок с деревом СС
        Cells[11,i+1] := IntToStr(ENServicesObjectList.list[i].nodeCount);
        //Адреса місця виконання робіт
        Cells[12,i+1] := ENServicesObjectList.list[i].contragentAddressWork;
        //Номер ТУ
        Cells[13,i+1] := ENServicesObjectList.list[i].techConObjectsNumberGen;
        Cells[14,i+1] := XSDate2String(ENServicesObjectList.list[i].techConObjectsDateGen);

        LastRow:=i+1;
        sgENServicesObject.RowCount:=LastRow+1;

        Objects[0,i+1] := ENServicesObjectList.list[i];
      end;
   ColCount:=ColCount+1;
   sgENServicesObject.Row:=1;
end;

procedure TfrmENServicesConnectionShow.sgENServicesObjectTopLeftChanged(Sender: TObject);
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

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        Cells[1,i+CurrentRow] := ENServicesObjectList.list[i].contractNumberServices + '/' + ENServicesObjectList.list[i].contractNumber
        else
        Cells[1,i+CurrentRow] := ENServicesObjectList.list[i].contractNumberServices;

        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

        Cells[3,i+CurrentRow] := ENServicesObjectList.list[i].contragentname;
        Cells[4,i+CurrentRow] := ENServicesObjectList.list[i].contragentokpo;

        // тип заказчика
        Cells[5,i+CurrentRow] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[6,i+CurrentRow] := ENServicesObjectList.list[i].departmentShortName;
        // Тип договора
        Cells[7,i+CurrentRow] := ENServicesObjectList.list[i].contractTypeRefName;
        // Статус договора
        Cells[8,i+CurrentRow] := ENServicesObjectList.list[i].contractStatusRefName;
        // Бух. статус
        Cells[9,i+CurrentRow] := ENServicesObjectList.list[i].statusRefName;

        Cells[10,i+CurrentRow] := ENServicesObjectList.list[i].node_exist;
        //Количество связок с деревом СС
        Cells[11,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].nodeCount);
        //Адреса місця виконання робіт
        Cells[12,i+CurrentRow] := ENServicesObjectList.list[i].contragentAddressWork;
        //Номер ТУ
        Cells[13,i+CurrentRow] := ENServicesObjectList.list[i].techConObjectsNumberGen;
        Cells[14,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].techConObjectsDateGen);

        LastRow:=i+CurrentRow;

        Objects[0,i+CurrentRow] := ENServicesObjectList.list[i];
      end;
   ColCount:=ColCount+100;
   sgENServicesObject.Row:=CurrentRow-5;
   sgENServicesObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesConnectionShow.sgENServicesObjectDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      servObjCode := StrToInt(GetReturnValue(sgENServicesObject, 0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENServicesConnectionShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesObject.RowCount-1 do
   for j:=0 to sgENServicesObject.ColCount-1 do
     sgENServicesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesConnectionShow.actViewExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
 TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ENServicesConnectionObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
   except
   on EConvertError do Exit;
  end;

  frmENServicesConnectionEdit := TfrmENServicesConnectionEdit.Create(Application, dsView);
  if (priconnections)
    then frmENServicesConnectionEdit.priconnections := True;

  frmENServicesConnectionEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
  try
    frmENServicesConnectionEdit.ShowModal;
  finally
    frmENServicesConnectionEdit.Free;
    frmENServicesConnectionEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionShow.actEditExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesConnectionObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
  except
    on EConvertError do Exit;
  end;

  if (ENServicesConnectionObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) or
     (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Підписаний" або "Сплачений" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CANCELED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Відмінений" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Роботи виконані" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Скасований" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DISCLAIMER) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Відмова замовника від послуг" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CLOSE) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Закритий" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENServicesConnectionEdit:=TfrmENServicesConnectionEdit.Create(Application, dsEdit);
  if (priconnections)
     then frmENServicesConnectionEdit.priconnections := True;

  try
    frmENServicesConnectionEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
    if frmENServicesConnectionEdit.ShowModal= mrOk then
      begin

        UpdateGrid(Sender);
      end;
    //UpdateGrid(Sender);
  finally
    frmENServicesConnectionEdit.Free;
    frmENServicesConnectionEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionShow.actDeleteExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  ENServicesConnectionObj := TempENServicesCalculation.getObject(ObjCode);

  if (ENServicesConnectionObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, видаляти не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesConnectionObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Підписаний" або "Сплачений" видаляти не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Об''єкти - послуги на сторону) ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
      TempENServicesCalculation.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesConnectionShow.actInsertExecute(Sender: TObject);
begin
  ENServicesConnectionObj := ENServicesObject.Create;
  SetNullIntProps(ENServicesConnectionObj);
  SetNullXSProps(ENServicesConnectionObj);

  // ENServicesConnectionObj.contractDate:= TXSDate.Create;
  // ENServicesConnectionObj.dateEdit:= TXSDate.Create;

  try
    frmENServicesConnectionEdit := TfrmENServicesConnectionEdit.Create(Application, dsInsert);
    if (priconnections)
      then frmENServicesConnectionEdit.priconnections := True;

    try
      if frmENServicesConnectionEdit.ShowModal = mrOk then
      begin
        if ENServicesConnectionObj<>nil then
        begin
            //TempENServicesObject.add(ENServicesConnectionObj);
            UpdateGrid(Sender);
        end;
      end;
    finally
      frmENServicesConnectionEdit.Free;
      frmENServicesConnectionEdit:=nil;
    end;
  finally
    ENServicesConnectionObj.Free;
  end;
end;

procedure TfrmENServicesConnectionShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesConnectionShow.actUpdatePersonalAccountExecute(
  Sender: TObject);
var
  ObjCode: Integer;
begin
  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  frmPersonalAccountForServicesObjectEdit := TfrmPersonalAccountForServicesObjectEdit.Create(Application, dsInsert);
  try
    frmPersonalAccountForServicesObjectEdit.servicesObjectCode := ObjCode;
    frmPersonalAccountForServicesObjectEdit.ShowModal;
  finally
    frmPersonalAccountForServicesObjectEdit.Free;
    frmPersonalAccountForServicesObjectEdit := nil;
  end;
end;

procedure TfrmENServicesConnectionShow.actFilterExecute(Sender: TObject);
var
    contractKindCode{, contractTypeCode }: Integer;
    conditionSQL : String;
begin
  contractKindCode := -1;
  //contractTypeCode := -1;
  
  frmENServicesObjectFilterEdit := TfrmENServicesObjectFilterEdit.Create(Application, dsInsert);
  try
    frmENServicesObjectFilterEdit.priconnections := priconnections;

    ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
    SetNullIntProps(ENServicesObjectFilterObj);
    SetNullXSProps(ENServicesObjectFilterObj);

    if FilterObject <> nil then
    begin
      if ENServicesObjectFilter(FilterObject).contractKindRef <> nil then
         contractKindCode := ENServicesObjectFilter(FilterObject).contractKindRef.code;

      //if ENServicesObjectFilter(FilterObject).contractTypeRef <> nil then
      //   contractTypeCode := ENServicesObjectFilter(FilterObject).contractTypeRef.code;
    end;

    if frmENServicesObjectFilterEdit.ShowModal = mrOk then
    begin
      {
      if (contractTypeCode <> -1) then
      begin
        ENServicesObjectFilterObj.contractTypeRef := ENServicesContractTypeRef.Create;
        ENServicesObjectFilterObj.contractTypeRef.code := contractTypeCode;
      end;
      }

      if priconnections then
      begin
        ENServicesObjectFilterObj.contractTypeRef := ENServicesContractTypeRef.Create;
        ENServicesObjectFilterObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION;
      end;

      if (contractKindCode <> -1) then
      begin
        ENServicesObjectFilterObj.contractKindRef := ENServicesContractKindRef.Create;
        ENServicesObjectFilterObj.contractKindRef.code := contractKindCode;
      end;

      //FilterObject := ENServicesObjectFilter.Create;
      FilterObject := ENServicesObjectFilterObj;
      conditionSQL := ENServicesObjectFilter(FilterObject).conditionSQL;
      AddCondition(conditionSQL, 'contractnumberservices is not null');

      if not priconnections then
        AddCondition(conditionSQL, 'coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_CONNECTION));


      if notStandartConnection then
         AddCondition(conditionSQL, ' ENSERVICESOBJECT.code in ' +
                    '( ' +
                    ' select so2tc.servicesobjectrefcode ' +
                    '   from enservicesobject2techcondtnsservices so2tc, ' +
                    '        entechconditionsservcs tc ' +
                    '  where so2tc.techcondservrefcode = tc.code ' +
                    '   and tc.s04refcode = ' + IntToStr(substation04Code) +
                    '   and tc.connectionkindrefcode = ' + IntToStr(ENCONNECTIONKIND_NO_STANDART) +
                    ') ' );


      ENServicesObjectFilter(FilterObject).conditionSQL := conditionSQL;
      ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesObjectFilterEdit.Free;
    frmENServicesObjectFilterEdit:=nil;
  end;
end;


procedure TfrmENServicesConnectionShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENServicesConnectionShow.actBudgetApprovedExecute(
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

  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити кошторис ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject.budgetApproved(objCode, planCode);

    Application.MessageBox(PChar('Кошторис затверджено ...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesConnectionShow.actUnBudgetApprovedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження кошторису ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempENServicesObject.unBudgetApproved(objCode);

    Application.MessageBox(PChar('Затвердження відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;



procedure TfrmENServicesConnectionShow.actSignedExecute(Sender: TObject);
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

  // Для новых договоров банковские реквизиты - обязательные поля (для юр. лиц небюджет)!
  if (servicesObject.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT) then
  begin
    if (servicesObject.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET) then
      if (servicesObject.contragentBankName = '') or
         (servicesObject.contragentBankAccount = '') { or
         (servicesObject.contragentBankMfo = '') } then
      begin
        Application.MessageBox(PChar('Введіть банківські реквізити Замовника!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        actEditExecute(Sender);
        Exit;
      end;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.signedPriconnections(objCode);

    Application.MessageBox(PChar('Договір підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesConnectionShow.actUnSignedExecute(
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

    TempENServicesObject.unSignedPriconnections(objCode);

    Application.MessageBox(PChar('Підписання відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesConnectionShow.actPaidExecute(Sender: TObject);
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

procedure TfrmENServicesConnectionShow.actUnPaidExecute(Sender: TObject);
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

procedure TfrmENServicesConnectionShow.actCanceledExecute(
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


procedure TfrmENServicesConnectionShow.actChangeAddressExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesObjectObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
  except
    on EConvertError do Exit;
  end;


  frmCustomerAddressEdit:=TfrmCustomerAddressEdit.Create(Application, dsEdit);
  try
    if frmCustomerAddressEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
  finally
    frmCustomerAddressEdit.Free;
    frmCustomerAddressEdit:=nil;
  end;
end;

procedure TfrmENServicesConnectionShow.actChangeConnectionTypeExecute(
  Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  objCode, connectionKindCode: Integer;
  servicesObject: ENServicesObject;
begin
  inherited;

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  frmENConnectionKindEdit := TfrmENConnectionKindEdit.Create(Application, dsInsert);
  try
    if frmENConnectionKindEdit.ShowModal = mrOk then
    begin
      if (frmENConnectionKindEdit.cbConectionKind.ItemIndex <> -1) then
      begin
        if (frmENConnectionKindEdit.cbConectionKind.ItemIndex = 0) then
          connectionKindCode := ENCONNECTIONKIND_STANDART
        else if (frmENConnectionKindEdit.cbConectionKind.ItemIndex = 1) then
          connectionKindCode := ENCONNECTIONKIND_NO_STANDART
        else if (frmENConnectionKindEdit.cbConectionKind.ItemIndex = 2) then
          connectionKindCode := ENCONNECTIONKIND_UNDEFINED
        else if (frmENConnectionKindEdit.cbConectionKind.ItemIndex = 3) then
          connectionKindCode := ENCONNECTIONKIND_NO_STANDART_READY_MADE;

        TempENServicesObject.changeConnectionKind(objCode, connectionKindCode);
      end;

      UpdateGrid(Sender);
    end;
  finally
    frmENConnectionKindEdit.Free;
  end;
end;

procedure TfrmENServicesConnectionShow.actChangeContractFinExecute(Sender: TObject);
var
  frmFINServicesObjectShow: TfrmFINServicesObjectShow;
  f: ENServicesObjectFilter;
  soObj: ENServicesObject;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  inherited;
  f := ENServicesObjectFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

  frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application, fmNormal, f);
  frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;

  try
    with frmFINServicesObjectShow do
    if ShowModal = mrOk then
    begin
      try
        soObj := ENServicesObject.Create;
        try
          soObj.code := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
        except
          on EConvertError do Exit;
        end;

        TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

        soObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
        soObj.contractDate := TXSDate.Create;
        soObj.contractDate.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject, 2))));
        soObj.name := GetReturnValue(sgFINServicesObject, 3);
        soObj.partnerCode:= GetReturnValue(sgFINServicesObject, 4);
        soObj.finDocCode := GetReturnValue(sgFINServicesObject, 5);
        soObj.finDocID := StrToInt(GetReturnValue(sgFINServicesObject, 6));
        soObj.commentGen := GetReturnValue(sgFINServicesObject, 7);

        TempENServicesObject.changeContractFin(soObj);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmFINServicesObjectShow.Close;
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesConnectionShow.actChangeCustomerTypeExecute(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  objCode: Integer;
  servicesObject: ENServicesObject;
begin
  inherited;

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  frmENServicesContragentTypeEdit := TfrmENServicesContragentTypeEdit.Create(Application, dsInsert);
  try
    if frmENServicesContragentTypeEdit.ShowModal = mrOk then
    begin
      if (frmENServicesContragentTypeEdit.cbContragentType.ItemIndex <> -1) then
      begin
        if (frmENServicesContragentTypeEdit.cbContragentType.ItemIndex = 0) then
          servicesObject.contragentTypeRef.code := ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL
        else
          servicesObject.contragentTypeRef.code := ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET;

        servicesObject.personalAccountNumber := '';
        servicesObject.personalAccountCode := LOW_INT;

        TempENServicesObject.save(servicesObject);
      end;

      UpdateGrid(Sender);
    end;
  finally
    frmENServicesContragentTypeEdit.Free;
  end;
end;


procedure TfrmENServicesConnectionShow.PopupMenu1Popup(Sender: TObject);
var calc : ENServicesObject;
    ObjCode : Integer;
begin

   miActSigned.Visible := False;
   miActUnSigned.Visible := False;

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

   if (calc <> nil) then
   begin
     if (DMReports.CheckCounters(ObjCode)) then
     begin
       miActSigned.Visible := True;
       miActUnSigned.Visible := True;
     end;
   end;

   // SUPP - 3740... +++ отказ заказчика от услуг - пока не проведен в ФК и не присоединение!!!
   actDisclaimerCustomerServices.Enabled :=
      ((calc.contractStatusRef.code <> ENSERVICESOBJECTSTATUS_DISCLAIMER) and (calc.statusRef.code = ENSERVICESOBJECT_FINSTATUS_GOOD)
          and (calc.contractTypeRef.code <> ENSERVICESOBJECTTYPE_CONNECTION));

   actCanceled.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT;
   actBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DRAFT;
   actUnBudgetApproved.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
   actSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_BUDGETAPPROVED;
   actUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;

   if calc.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_CALCULATION then
   begin
     HideActions([actPrepaid, actUnPrepaid, actFinishWork]);
     actPaid.Caption := 'Сплатити рахунок';
     actUnPaid.Caption := 'Відмінити сплату рахунка';

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;
     actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;
   end
   else if calc.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
   begin
     HideActions([actPrepaid, actUnPrepaid, actFinishWork], false);
     actPaid.Caption := 'Сплатити остаточний рахунок';
     actUnPaid.Caption := 'Відмінити сплату остаточного рахунка';

     ///// 14.05.13 NET-4235
     //actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actPrepaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actUnPrepaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID;

     //actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) and
     //                         (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);

     // Если это юр. лицо бюджет, то работы могут быть выполнены, не дожидаясь оплаты, иначе - после "Оплаты"
     if calc.contragentTypeRef.code = ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET then
       actFinishWork.Enabled := ((calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
                                 (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID)) and
                                (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED)
     else
       actFinishWork.Enabled := (calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) and
                                (calc.statusRef.code <> ENSERVICESOBJECT_FINSTATUS_CLOSED);

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     /////
   
     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID; //ENSERVICESOBJECTSTATUS_PAID;
     actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;
  end
  else
    raise Exception.Create('NET-4235 Невідомий тип розрахунку для договору! Код договору: ' + IntToStr(ObjCode));
end;

procedure TfrmENServicesConnectionShow.actExpExcelExecute(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку ... '+#10#13+' Зберегти в Ексель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgENServicesObject, 'Список_договорів_');
  end;

end;

procedure TfrmENServicesConnectionShow.actCountersActSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати акт прийому лічильників?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.actSigned(objCode);

    Application.MessageBox(PChar('Акт підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesConnectionShow.actCountersActUnSignedExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання акту?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.actUnSigned(objCode);

    Application.MessageBox(PChar('Підписання акту відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesConnectionShow.actFinishWorkExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
    servicesObject: ENServicesObject;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(objCode);

  {
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
  }

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести договір у статус "Роботи виконані"?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject.finishWorks(objCode);
    Application.MessageBox(PChar('Договір переведено в статус "Роботи виконані"!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesConnectionShow.actPrepaidExecute(Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте сплатити попередній рахунок за договором?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.prepaid(objCode);

    Application.MessageBox(PChar('Попередній рахунок сплачено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesConnectionShow.actUnPrepaidExecute(
  Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити сплату попереднього рахунку?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    TempENServicesObject.unPrepaid(objCode);

    Application.MessageBox(PChar('Сплату попереднього рахунку відмінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesConnectionShow.actDisclaimerCustomerServicesExecute(
  Sender: TObject);
var TempENServicesObject : ENServicesObjectControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести договір у статус "Відмова замовника від послуг"???'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.disclaimerCustomerServices(objCode);

    Application.MessageBox(PChar('Статус договіру змінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


end.
