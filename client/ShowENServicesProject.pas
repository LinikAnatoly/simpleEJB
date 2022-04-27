
unit ShowENServicesProject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesObjectController, AdvObj;


type
  TfrmENServicesProjectShow = class(TChildForm)
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actBudgetApproved: TAction;
    actUnBudgetApproved: TAction;
    actSigned: TAction;
    actUnSigned: TAction;
    actPaid: TAction;
    actUnPaid: TAction;
    actCanceled: TAction;
    actExpExcel: TAction;
    actCountersActSigned: TAction;
    actCountersActUnSigned: TAction;
    actFinishWork: TAction;
    actPrepaid: TAction;
    actUnPrepaid: TAction;
    actDisclaimerCustomerServices: TAction;
    HTTPRIOENFamilySize2ServicesObject: THTTPRIO;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N10: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    miActSigned: TMenuItem;
    miActUnSigned: TMenuItem;
    N15: TMenuItem;
    N21: TMenuItem;
    miActDisclaimerCustomerServices: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    N23: TMenuItem;
    N1: TMenuItem;
    actUndoFinishWorks: TAction;

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
    function checkFamilySize2ServicesObject(servicesObjCode: Integer) : Boolean;
    procedure actUndoFinishWorksExecute(Sender: TObject);

  private
   { Private declarations }
   isFiltered  : boolean;
   project : Boolean;

 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENServicesObjectObj: ENServicesObject;
 // ENServicesObjectFilterObj: ENServicesObjectFilter;

var servObjCode: Integer;

implementation

uses Main, EditENServicesObjectFilter,
  EditENServicesProject, DMReportsUnit, ENConsts,
  ENServicesContractKindController, ENServicesContractTypeController,
  ENFamilySize2ServicesObjectController;



{$R *.dfm}

var
  //frmENServicesCalculObjectShow : TfrmENServicesCalculObjectShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesCalculationHeaders: array [1..14] of String =
        ( 'Код'
          ,'Порядковий № дог.'
          ,'Дата дог.(порядковий)'
          ,'№ дог. фін.кол.'
          ,'Дата дог. фін.кол.'
          ,'Замовник'
          ,'Код замовника'
          ,'Тип замовника'
          ,'Підрозділ'
          ,'Тип договору'
          ,'Статус договору'
          ,'Бух. статус'
          ,'Примітка'
          ,'Адреса замовника'
          {,'пользователь внесший изменение'
          ,'дата последнего изменения'}
        );
   

procedure TfrmENServicesProjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormMode = fmChild) then
  begin
    if (FilterObject <> nil) then
    begin
      if (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil)
          and (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_PROJECT)
      then frmENServicesProjectShow := nil
      else
        frmENServicesProjectShow := nil;
    end
    else
      frmENServicesProjectShow := nil;
  end;

   inherited;
end;


procedure TfrmENServicesProjectShow.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
begin
  if (FilterObject <> nil) and (ENServicesObjectFilter(FilterObject).contractTypeRef <> nil) and
     (ENServicesObjectFilter(FilterObject).contractTypeRef.code = ENSERVICESOBJECTTYPE_PROJECT) then
  begin
    project := True;
    ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
  end;

  DisableActions([actNoFilter]);
  SetGridHeaders(ENServicesCalculationHeaders, sgENServicesObject.ColumnHeaders);

  if (project) then
  begin
    sgENServicesObject.ColWidths[9] := 150;
    sgENServicesObject.ColumnHeaders[9] := 'Тип договору';
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
                                                          ' coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_PROJECT) + ')';
     ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';

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
        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
          Cells[3,i+1] := ENServicesObjectList.list[i].contractNumber
        else
          Cells[3,i+1] := '';

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);

        Cells[5,i+1] := ENServicesObjectList.list[i].contragentname;
        Cells[6,i+1] := ENServicesObjectList.list[i].contragentokpo;

        // тип заказчика
        Cells[7,i+1] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[8,i+1] := ENServicesObjectList.list[i].departmentShortName;
        // Кайнд договора
        Cells[9,i+1] := ENServicesObjectList.list[i].contractKindRefName;
        // Статус договора
        Cells[10,i+1] := ENServicesObjectList.list[i].contractStatusRefName;

        // Бух. статус
        Cells[11,i+1] := ENServicesObjectList.list[i].statusRefName;

        Cells[12,i+1] := ENServicesObjectList.list[i].commentGen;

        Cells[13,i+1] := ENServicesObjectList.list[i].contragentAddress;

        LastRow:=i+1;
        sgENServicesObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesObject.Row:=1;
end;


procedure TfrmENServicesProjectShow.sgENServicesObjectTopLeftChanged(Sender: TObject);
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

        if ENServicesObjectList.list[i].contractDateServices = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDateServices);

          
        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
          Cells[3,i+CurrentRow] := ENServicesObjectList.list[i].contractNumber
        else
          Cells[3,i+CurrentRow] := '';

        if ENServicesObjectList.list[i].finDocID <> Low(Integer) then
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);

        {
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
        }

        Cells[5,i+CurrentRow] := ENServicesObjectList.list[i].contragentname;
        Cells[6,i+CurrentRow] := ENServicesObjectList.list[i].contragentokpo;
        // тип заказчика
        Cells[7,i+CurrentRow] := ENServicesObjectList.list[i].contragentTypeRefName;
        // подразделенин
        Cells[8,i+CurrentRow] := ENServicesObjectList.list[i].departmentShortName;
        // Тип договора
        Cells[9,i+CurrentRow] := ENServicesObjectList.list[i].contractTypeRefName;
        // Статус договора
        Cells[10,i+CurrentRow] := ENServicesObjectList.list[i].contractStatusRefName;

        // Бух. статус
        Cells[11,i+CurrentRow] := ENServicesObjectList.list[i].statusRefName;

        Cells[12,i+CurrentRow] := ENServicesObjectList.list[i].commentGen;

        Cells[13,i+CurrentRow] := ENServicesObjectList.list[i].contragentAddress;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesObject.Row:=CurrentRow-5;
   sgENServicesObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesProjectShow.sgENServicesObjectDblClick(Sender: TObject);
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

procedure TfrmENServicesProjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesObject.RowCount-1 do
   for j:=0 to sgENServicesObject.ColCount-1 do
     sgENServicesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesProjectShow.actViewExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
 TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ENServicesProjectObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
   except
   on EConvertError do Exit;
  end;

  frmENServicesProjectEdit := TfrmENServicesProjectEdit.Create(Application, dsView);
  if (project)
    then frmENServicesProjectEdit.project := True;

  frmENServicesProjectEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
  try
    frmENServicesProjectEdit.ShowModal;
  finally
    frmENServicesProjectEdit.Free;
    frmENServicesProjectEdit:=nil;
  end;
end;

procedure TfrmENServicesProjectShow.actEditExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesProjectObj := TempENServicesCalculation.getObject(StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]));
  except
    on EConvertError do Exit;
  end;

  if (ENServicesProjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID) or
     (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Підписаний" або "Сплачений" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_CANCELED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Відмінений" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Роботи виконані" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_TERMINATED) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Скасований" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_DISCLAIMER) then
  begin
    Application.MessageBox(PChar('Договори зі статусом "Відмова замовника від послуг" редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENServicesProjectEdit:=TfrmENServicesProjectEdit.Create(Application, dsEdit);
  if (project)
     then frmENServicesProjectEdit.project := True;

  try
    frmENServicesProjectEdit.edtStatus.Text := sgENServicesObject.Cells[10,sgENServicesObject.Row];
    if frmENServicesProjectEdit.ShowModal= mrOk then
      begin

        UpdateGrid(Sender);
      end;
    //UpdateGrid(Sender);
  finally
    frmENServicesProjectEdit.Free;
    frmENServicesProjectEdit:=nil;
  end;
end;

procedure TfrmENServicesProjectShow.actDeleteExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
    ObjCode: Integer;
begin
  TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  try
    ObjCode := StrToInt(sgENServicesObject.Cells[0,sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  ENServicesProjectObj := TempENServicesCalculation.getObject(ObjCode);

  if (ENServicesProjectObj.statusRef.code = ENSERVICESOBJECT_FINSTATUS_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, видаляти не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED) or
     (ENServicesProjectObj.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID) then
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

procedure TfrmENServicesProjectShow.actInsertExecute(Sender: TObject);
begin
  ENServicesProjectObj := ENServicesObject.Create;
  SetNullIntProps(ENServicesProjectObj);
  SetNullXSProps(ENServicesProjectObj);

  // ENServicesProjectObj.contractDate:= TXSDate.Create;
  // ENServicesProjectObj.dateEdit:= TXSDate.Create;

  try
    frmENServicesProjectEdit := TfrmENServicesProjectEdit.Create(Application, dsInsert);
    if (project)
      then frmENServicesProjectEdit.project := True;

    try
      if frmENServicesProjectEdit.ShowModal = mrOk then
      begin
        if ENServicesProjectObj<>nil then
        begin
            //TempENServicesObject.add(ENServicesProjectObj);
            UpdateGrid(Sender);
        end;
      end;
    finally
      frmENServicesProjectEdit.Free;
      frmENServicesProjectEdit:=nil;
    end;
  finally
    ENServicesProjectObj.Free;
  end;
end;

procedure TfrmENServicesProjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesProjectShow.actFilterExecute(Sender: TObject);
var
    contractKindCode{, contractTypeCode }: Integer;
    conditionSQL : String;
begin
  contractKindCode := -1;
  //contractTypeCode := -1;
  
  frmENServicesObjectFilterEdit := TfrmENServicesObjectFilterEdit.Create(Application, dsInsert);
  try
    frmENServicesObjectFilterEdit.project := project;

    ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
    SetNullIntProps(ENServicesObjectFilterObj);
    SetNullXSProps(ENServicesObjectFilterObj);

    if FilterObject <> nil then
    begin
      if ENServicesObjectFilter(FilterObject).contractKindRef <> nil then
         contractKindCode := ENServicesObjectFilter(FilterObject).contractKindRef.code;
    end;

    if frmENServicesObjectFilterEdit.ShowModal = mrOk then
    begin

      if project then
      begin
        ENServicesObjectFilterObj.contractTypeRef := ENServicesContractTypeRef.Create;
        ENServicesObjectFilterObj.contractTypeRef.code := ENSERVICESOBJECTTYPE_PROJECT;
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

      if not project then
        AddCondition(conditionSQL, 'coalesce(contracttyperefcode, -1) <> ' + IntToStr(ENSERVICESOBJECTTYPE_PROJECT));

      ENServicesObjectFilter(FilterObject).conditionSQL := conditionSQL;
      ENServicesObjectFilter(FilterObject).orderBySQL := 'dateedit desc, code desc';
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesObjectFilterEdit.Free;
    frmENServicesObjectFilterEdit:=nil;
  end;
end;


procedure TfrmENServicesProjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENServicesProjectShow.actBudgetApprovedExecute(
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


procedure TfrmENServicesProjectShow.actUnBudgetApprovedExecute(
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



procedure TfrmENServicesProjectShow.actUndoFinishWorksExecute(Sender: TObject);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENServicesObject.Cells[0, sgENServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити переведення договору в статус "Роботи виконані"?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    TempENServicesObject.undoFinishWorks(objCode);

    Application.MessageBox(PChar('Переведення в статус "Роботи виконані" відмінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesProjectShow.actSignedExecute(Sender: TObject);
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
         (servicesObject.contragentBankAccount = '') or
         (servicesObject.contragentBankMfo = '') then
      begin
        Application.MessageBox(PChar('Введіть банківські реквізити Замовника!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        actEditExecute(Sender);
        Exit;
      end;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesObject.signed(objCode);

    Application.MessageBox(PChar('Договір підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesProjectShow.actUnSignedExecute(
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

procedure TfrmENServicesProjectShow.actPaidExecute(Sender: TObject);
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

procedure TfrmENServicesProjectShow.actUnPaidExecute(Sender: TObject);
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

procedure TfrmENServicesProjectShow.actCanceledExecute(
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


procedure TfrmENServicesProjectShow.PopupMenu1Popup(Sender: TObject);
var
  calc : ENServicesObject;
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
     HideActions([actPrepaid, actUnPrepaid, actFinishWork, actUndoFinishWorks]);
     actPaid.Caption := 'Сплатити рахунок';
     actUnPaid.Caption := 'Відмінити сплату рахунка';

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_SIGNED;
     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;
     actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;
   end
   else if calc.calcTypeRef.code = ENSERVICESOBJECT_CALCTYPE_BY_FACT then
   begin
     HideActions([actPrepaid, actUnPrepaid, actFinishWork, actUndoFinishWorks], false);
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

     actUndoFinishWorks.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;

     actPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_COMPLETED;
     /////
   
     actUnPaid.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PAID;

     actCountersActSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_PREPAID; //ENSERVICESOBJECTSTATUS_PAID;
     actCountersActUnSigned.Enabled := calc.contractStatusRef.code = ENSERVICESOBJECTSTATUS_ACT_SIGNED;
  end
  else
    raise Exception.Create('NET-4235 Невідомий тип розрахунку для договору! Код договору: ' + IntToStr(ObjCode));
end;


procedure TfrmENServicesProjectShow.actExpExcelExecute(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку ... '+#10#13+' Зберегти в Ексель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgENServicesObject, 'Список_договорів_');
  end;

end;

procedure TfrmENServicesProjectShow.actCountersActSignedExecute(
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

procedure TfrmENServicesProjectShow.actCountersActUnSignedExecute(
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


procedure TfrmENServicesProjectShow.actFinishWorkExecute(
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

procedure TfrmENServicesProjectShow.actPrepaidExecute(Sender: TObject);
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

procedure TfrmENServicesProjectShow.actUnPrepaidExecute(
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

procedure TfrmENServicesProjectShow.actDisclaimerCustomerServicesExecute(
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


function TfrmENServicesProjectShow.checkFamilySize2ServicesObject(servicesObjCode: Integer): Boolean;
var
  i : Integer;
  TempENFamilySize2ServicesObject : ENFamilySize2ServicesObjectControllerSoapPort;
  familySize2ServicesObjectFilter : ENFamilySize2ServicesObjectFilter;
  familySizeArr : ENFamilySize2ServicesObjectController.ArrayOfInteger;
begin
  Result := False;
  if (servicesObjCode = Low(Integer)) then Exit;

  TempENFamilySize2ServicesObject := HTTPRIOENFamilySize2ServicesObject as ENFamilySize2ServicesObjectControllerSoapPort;

  familySize2ServicesObjectFilter := ENFamilySize2ServicesObjectFilter.Create;
  SetNullIntProps(familySize2ServicesObjectFilter);
  SetNullXSProps(familySize2ServicesObjectFilter);
  familySize2ServicesObjectFilter.servicesObjectRef := ENServicesObjectRef.Create;
  familySize2ServicesObjectFilter.servicesObjectRef.code := servicesObjCode;

  familySizeArr := TempENFamilySize2ServicesObject.getScrollableFilteredCodeArray(familySize2ServicesObjectFilter,0,-1);
  if High(familySizeArr) > -1 then
    Result := True;
end;


end.
