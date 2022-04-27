
unit EditENPlanWorkFilter;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons, DateUtils
  ,EnergyproController, EnergyproController2, ENPlanWorkController
  ,ShowENPlanWork, EditENPlanWorkStateFilter, ShowFINExecutorTree, FINExecutorController
  ;

type
  TfrmENPlanWorkFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblYearGen : TLabel;
    lblMonthGen : TLabel;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENPlanWorkStatusName : TLabel;
  edtENPlanWorkStatusName: TEdit;
  spbENPlanWorkStatus: TSpeedButton;
  

  HTTPRIOENPlanWork: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbType: TSpeedButton;
    edtTypeName: TEdit;
    lblTypeName: TLabel;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbResponsibility: TSpeedButton;
    spbDepartment: TSpeedButton;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    edtResponsibility: TEdit;
    lblResponsibility: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    cbElementType: TComboBox;
    lblElementType: TLabel;
    lblENPlanWorkKindKindName: TLabel;
    cbPlanWorkKind: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    lblWorkState: TLabel;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    edtWorkOrderNumber: TEdit;
    lblWorkOrderNumber: TLabel;
    cbENPlanWorkFormName: TComboBox;
    lblPlanWorkForm: TLabel;
    lblNumberList: TLabel;
    edtNumberList: TEdit;
    lblPriConnectionNumber: TLabel;
    edtPriConnectionNumber: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    cbShowPlanEneOz: TCheckBox;
    lblPlanStatus: TLabel;
    cbPlanStatus: TComboBox;
    gbPlanFact: TGroupBox;
    gbPlanFactPeriod: TGroupBox;
    Label1: TLabel;
    edtStartDate: TDateTimePicker;
    Label2: TLabel;
    edtEndDate: TDateTimePicker;
    cbCompletionPlan: TComboBox;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    chbChildFinExecutor: TCheckBox;
    btnSomeBudgets: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPlanWorkStatusClick(Sender : TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbResponsibilityClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure toggleChbChildFinExecutor;
    procedure edtYearGenDropDown(Sender: TObject);
    procedure btnSomeBudgetsClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    viewPlanWork : Integer;
    isFilter_, isTransport, isOperative, isWriteOffProtection : boolean;
    disableControlsType : TDisableType;
    executorFinCode : Integer;
    axorgID: string;
    usesDAXData: Boolean;
    elementCode: Integer;
    elementName: String;
    typeCode: Integer;
    typeName: String;
    stateCode: Integer;
    stateName: String;
    strBudget: string;
end;

var
  frmENPlanWorkFilterEdit: TfrmENPlanWorkFilterEdit;
  ENPlanWorkFilterObj: ENPlanWorkFilter;

implementation

uses
  ShowENPlanWorkStatus
  ,ENPlanWorkStatusController
, ENElementController, ShowENElement, DMReportsUnit,
  ENDepartmentController, ShowENDepartment, ENDepartmentTypeController,
  ENConsts, ShowENPlanWorkType, ENPlanWorkTypeController,
  ENElementTypeController, ENPlanWorkKindController, EditENPlanWorkState,
  ShowENPlanWorkState, ENPlanWorkMoveReasonController,
  ENPlanWorkStateController, ENPlanWorkFormController, BaseUtilsUnit,
  budgetList;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkFilterEdit.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i, idx, idxOperative , idxNoObject : integer;
begin
   //edtYearGen.ItemIndex := 2;
   //edtMonthGen.ItemIndex := monthof(date);

  /////
  btnOk.Top := 380;
  btnCancel.Top := 380;
  Height := btnOk.Top + btnOk.Height + 50;
  /////

  usesDAXData := DMReports.UsesMDAXData;

  SetIntStyle([edtCode]);

  if disableControlsType = dtMetrology then
  begin
    ENPlanWorkFilterObj.kind := ENPlanWorkKind.Create;
    ENPlanWorkFilterObj.kind.code := ENPLANWORKKIND_CURRENT;
    cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT ;

    cbElementType.Clear;
    cbElementType.Items.AddObject(':)', TObject(LOW_INT));
    cbElementType.Items.AddObject('Метрологія - поточні плани', TObject(EN_METROLOGY_OBJECT));
    cbElementType.ItemIndex := 1;

    edtENBudgetName.Text := 'Метрологія';
    ENPlanWorkFilterObj.budgetRef := ENDepartmentRef.Create;
    ENPlanWorkFilterObj.budgetRef.code := ENBUDGET_METROLOGY;

    DisableControls([cbPlanWorkKind, cbElementType]);

    ///// 15.02.18 NET-4561 Списание пломб
    if elementCode > 0 then
    begin
      ENPlanWorkFilterObj.elementRef := ENElementRef.Create;
      ENPlanWorkFilterObj.elementRef.code := elementCode;

      edtENElementName.Text := elementName;

      DisableControls([edtENElementName, spbENElement]);
    end;
    /////
  end
  else
  begin
      cbElementType.Clear;

      f:= ENElementTypeFilter.Create;
      SetNullIntProps(f);
      //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10)';
      //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10,11)';
      f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';
      f.orderBySQL := 'code';

      idxOperative := -1;

      //cbElementType.Items.Add('');
      cbElementType.Items.AddObject(' ', TObject(LOW_INT));

      TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
      ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
      for i:=0 to ENElementTypeList.totalCount-1 do
      begin
        idx := cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
        if ENElementTypeList.list[i].code = EN_OPERATIVE_OBJECT then
          idxOperative := idx;
        if ENElementTypeList.list[i].code = EN_WRITING_NO_OBJECT then
          idxNoObject := idx;
       end;

      if isOperative then
        if idxOperative > -1 then
        begin
          cbElementType.ItemIndex := idxOperative;
          DisableControls([cbElementType]);
        end;

      cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;
  end;

  ///// 15.02.18 NET-4561 Списание пломб
  if typeCode <> LOW_INT then
  begin
    ENPlanWorkFilterObj.typeRef := ENPlanWorkTypeRef.Create;
    ENPlanWorkFilterObj.typeRef.code := typeCode;

    edtTypeName.Text := typeName;

    DisableControls([edtTypeName, spbType]);
  end;

  if stateCode <> LOW_INT then
  begin
    ENPlanWorkFilterObj.stateRef := ENPlanWorkStateRef.Create;
    ENPlanWorkFilterObj.stateRef.code := stateCode;

    edtWorkState.Text := stateName;

    DisableControls([edtWorkState, spbENPlanWorkState]);
  end;
  /////

  if isWriteOffProtection then
   begin
   DisableControls([cbElementType]);
   cbElementType.ItemIndex := idxNoObject;
   end;


  HideControls([lblPlanStatus, cbPlanStatus]);
  if (viewPlanWork = PLANWORKSHOW_LIGHT) then
  begin
    HideControls([lblENPlanWorkStatusName, edtENPlanWorkStatusName, spbENPlanWorkStatus,
         lblENPlanWorkKindKindName, cbPlanWorkKind,
         lblWorkOrderNumber, edtWorkOrderNumber,
         lblCode, edtCode, lblNumberList, edtNumberList,
         lblPriConnectionNumber, edtPriConnectionNumber]);
    HideControls([lblPlanStatus, cbPlanStatus], False);
    lblPlanStatus.Left := 14;
    lblPlanStatus.Top := 254;
    cbPlanStatus.Left := 126;
    cbPlanStatus.Top := 254;

    gbPlanFact.Top := 94;
    gbPlanFact.Left := 406;
  end;


{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtYearGen
      ,edtMonthGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENPlanWorkObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkObj.dateGen.Year,ENPlanWorkObj.dateGen.Month,ENPlanWorkObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENPlanWorkObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENPlanWorkObj.yearGen)
    else
       edtYearGen.Text := '';



    if ( ENPlanWorkObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(ENPlanWorkObj.monthGen)
    else
       edtMonthGen.Text := '';



    edtCommentGen.Text := ENPlanWorkObj.commentGen; 



    edtUserGen.Text := ENPlanWorkObj.userGen; 



      if ENPlanWorkObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkObj.dateEdit.Year,ENPlanWorkObj.dateEdit.Month,ENPlanWorkObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;

}


end;



procedure TfrmENPlanWorkFilterEdit.btnSomeBudgetsClick(Sender: TObject);
var
  i: integer;
begin

  frmbudgetList := TfrmbudgetList.Create(Application, dsInsert);
   try

   if frmbudgetList.ShowModal = mrOk then
    begin
      strBudget := '';
     /// собираем строку кодов бюджетодержателей
      for i := 0 to frmbudgetList.ListBudget.Count - 1 do
      begin
           if  frmbudgetList.ListBudget.Checked[i] then
            if strBudget <>  '' then
            strBudget := strBudget + ' , ' + IntToStr(Integer(frmbudgetList.ListBudget.Items.Objects[i]))
             else
            strBudget := strBudget + IntToStr(Integer(frmbudgetList.ListBudget.Items.Objects[i]));
      end;

    end;
  finally
    frmbudgetList.Free;
  end;
end;

procedure TfrmENPlanWorkFilterEdit.edtYearGenDropDown(Sender: TObject);
begin
  inherited;
  if edtYearGen.ItemIndex = -1 then begin
    edtYearGen.ItemIndex := edtYearGen.Items.Count - 3;
  end;
end;

procedure TfrmENPlanWorkFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  kindCode, i : Integer;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  condition, planCodesByWorkOrder, childFinExecutorCond : String;
begin
  if (ModalResult = mrOk)  then
  begin
     //isFilter := true;

     if edtCommentGen.Text <> '' then
     begin
       ENPlanWorkFilterObj.commentGen := edtCommentGen.Text;
       isFilter_ := true;
     end;

     if (edtCode.Text <> '') then
     begin
       try
         ENPlanWorkFilterObj.code := StrToInt(edtCode.Text);
         isFilter_ := true;
       except
         on EConvertError do
         begin
           ENPlanWorkFilterObj.code := LOW_INT;
           //isFilter_ := false;
         end;
       end;
     end;

     if (edtYearGen.ItemIndex >= 1) then
     begin
       ENPlanWorkFilterObj.yearGen := edtYearGen.ItemIndex + 2008;
       isFilter_ := true;
     end
     else
       ENPlanWorkFilterObj.yearGen := Low(Integer) ;

     if cbENPlanWorkFormName.ItemIndex > 0 then
     begin
        ENPlanWorkFilterObj.formRef := ENPlanWorkFormRef.Create;
        ENPlanWorkFilterObj.formRef.code := cbENPlanWorkFormName.ItemIndex;
        isFilter_ := true;
     end;

     if (edtMonthGen.ItemIndex >= 1) then
     begin
       ENPlanWorkFilterObj.monthGen := edtMonthGen.ItemIndex;
       isFilter_ := true;
     end
     else
       ENPlanWorkFilterObj.monthGen := Low(Integer) ;

     if cbPlanWorkKind.ItemIndex > 0 then
     begin
        if ENPlanWorkFilterObj.kind = nil then ENPlanWorkFilterObj.kind := ENPlanWorkKind.Create;
        ENPlanWorkFilterObj.kind.code := cbPlanWorkKind.ItemIndex ;
        isFilter_ := true;
     end;
   {   if edtWorkState.Text <> '' then
     begin
        if ENPlanWorkFilterObj.stateRef = nil then ENPlanWorkFilterObj.stateRef := ENPlanWorkStateRef.Create;
        ENPlanWorkFilterObj.stateRef.code := ENPlanWorkStateRef ;
     end;       }
     condition := '';

     if edtdateStart.checked then
     begin
       AddCondition(condition, 'enplanwork.datestart >= to_date(''' + DateToStr(edtDateStart.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := true;
     end;

     if edtdateFinal.checked then
     begin
       AddCondition(condition, 'enplanwork.datefinal <= to_date(''' + DateToStr(edtDateFinal.Date) + ''', ''dd.MM.yyyy'')');
       isFilter_ := true;
     end;

     if cbElementType.ItemIndex > 0 then
     begin
       AddCondition(condition, 'enplanwork.elementrefcode in (select enelement.code from enelement where enelement.typerefcode = '+ IntToStr(Integer(cbElementTYpe.Items.Objects[cbElementType.ItemIndex])) +')');
       isFilter_ := true;
     end;

     if edtWorkOrderNumber.Text <> '' then
     begin
        /// 26.12.2013 небольшая оптимизация
       {
       AddCondition(condition,
         ' EXISTS ' +
         '(select wp.plancode from enworkorder2enplanwork wp ' +
         ' inner join enworkorder w on wp.workordercode = w.code where ' +
         ' UPPER(w.workordernumber) like UPPER(''' + ToLIKE(edtWorkOrderNumber.Text) + ''')' +
         ' and wp.plancode = ENPLANWORK.CODE) ' +
         ' and enplanwork.kindcode in (' + IntToStr(ENPLANWORKKIND_NPZ) + ', ' + IntToStr(ENPLANWORKKIND_FACT) + ')'
       );
       isFilter_ := true;
       }
       isFilter_ := true;
       planCodesByWorkOrder := DMReports.getPlanCodesByWorkOrder(edtWorkOrderNumber.Text);
       if (planCodesByWorkOrder <> '') then
       begin
         AddCondition(condition, ' enplanwork.code in (' + planCodesByWorkOrder + ') ');
       end else begin
        {SUPP-56649 Значит такого наряда нет}
         AddCondition(condition, ' enplanwork.code in (-1) ');
       end;
     end;

     if edtNumberList.Text <> '' then
     begin
       AddCondition(condition,
         'enplanwork.code in ' +
         '(select ti.planrefcode from entransportitem ti ' +
         ' where ti.numberlist like UPPER(''' + ToLIKE(edtNumberList.Text) + ''') ' +
         ') '
       );
       isFilter_ := true;
     end;

     if edtPriConnectionNumber.Text <> '' then
     begin
       ENPlanWorkFilterObj.priConnectionNumber := edtPriConnectionNumber.Text;
       isFilter_ := true;
     end;

     // не показываем кошторис единичный
     AddCondition(condition, ' kindcode <> ' + IntToStr(ENPLANWORKKIND_CALCULATION_SINGLE) );

     if cbShowPlanEneOz.Checked then
     begin
         AddCondition(condition, '((enplanwork.budgetrefcode is null) or (enplanwork.budgetrefcode <> 240000001))');
     end;

     if strBudget <> '' then
     begin
         AddCondition(condition, '(enplanwork.budgetrefcode in ('+ strBudget + '))');
         ENPlanWorkFilterObj.budgetRef := nil;
         isFilter_ := true;
     end;

     // SUPP-13016... 28.02.2014 +++ фильтруем по исполнителю...

     if (usesDAXData) then
     begin
       if (axorgID <> '') then begin
        if chbChildFinExecutor.Checked then begin
          childFinExecutorCond := DMReports.getStrAllFINExecutorIdsByParent(axorgID);

         AddCondition(condition, '(enplanwork.finexecutorcode in (' +
            'select fe.code from finexecutor fe where fe.axorgid in (' + childFinExecutorCond + ')))');

        end else begin
         AddCondition(condition, '(enplanwork.finexecutorcode in (' +
            'select fe.code from finexecutor fe where fe.axorgid = '''+ axorgID +'''))');
        end;

         isFilter_ := true;
       end;
     end else begin
       if (executorFinCode <> LOW_INT) then
       begin
       if chbChildFinExecutor.Checked then begin
          childFinExecutorCond := DMReports.getStrAllFINExecutorIdsByParent(IntToStr(executorFinCode));

         AddCondition(condition, '(enplanwork.finexecutorcode in (' +
            'select fe.code from finexecutor fe where fe.fincode in (' + childFinExecutorCond + ')))');

        end else begin
         AddCondition(condition, '(enplanwork.finexecutorcode in (' +
            'select fe.code from finexecutor fe where fe.fincode = '+ IntToStr(executorFinCode) +'))');
        end;
         isFilter_ := true;
       end;
     end;




     ////////////////////
     // типа упрощенный вариант
     
     if (cbPlanStatus.ItemIndex > 0) and (viewPlanWork = PLANWORKSHOW_LIGHT) then
     begin
       // 1) "Попередній" (есть черновой Годовой план);
       if (cbPlanStatus.ItemIndex = 1) then
       begin
         AddCondition(condition, ' ( kindcode = ' + IntToStr(ENPLANWORKKIND_YEAR) +
            ' and statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) + ')' );
         isFilter_ := true;
       end
       else
       // 2) "Затверджений" (есть черновой Месячный план);
       if (cbPlanStatus.ItemIndex = 2) then
       begin
         AddCondition(condition, '( kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT) +
           ' and statuscode in (' + IntToStr(ENPLANWORKSTATUS_GOOD) + ', ' + IntToStr(ENPLANWORKSTATUS_PRECONFIRMED) + '))' );
         isFilter_ := true;  
       end
       else
       // 3) "Роботи виконуються" (есть Задания-Планы);
       if (cbPlanStatus.ItemIndex = 3) then
       begin
         // AddCondition(condition, '( kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT) +
         //  ' and statuscode = ' + IntToStr(ENPLANWORKSTATUS_LOCKED) + ')' );

        AddCondition(condition, 'kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT) +
         ' and statuscode = ' + IntToStr(ENPLANWORKSTATUS_LOCKED) +
         ' and enplanwork.code in ( ' +
         ' select distinct (select * from net.get_codemonthplan_byanycodeplan(p.code::numeric)) as codemonthplan ' +
         ' from enplanwork p where p.kindcode = ' + IntToStr(ENPLANWORKKIND_NPZ) + ')' );

         isFilter_ := true;  
       end
       else
       // 4) "Роботи повністю завершено"
       if (cbPlanStatus.ItemIndex = 4) then
       begin
         AddCondition(condition, '( kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT) +
           ' and statuscode = ' + IntToStr(ENPLANWORKSTATUS_WORKS_FINISHED) + ')' );
         isFilter_ := true;  
       end
     end else
     if (viewPlanWork = PLANWORKSHOW_LIGHT) then
     begin
       // показываем годовой(черновой) и месячный(любой) //
       AddCondition(condition, '((statuscode in (' + IntToStr(ENPLANWORKSTATUS_GOOD) + ', ' + IntToStr(ENPLANWORKSTATUS_PRECONFIRMED) + ')' +
         ' and kindcode = ' + IntToStr(ENPLANWORKKIND_YEAR) + ')' +
             ' or kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT) + ')' );
       ENPlanWorkFilterObj.orderBySQL := ' datestart, kindcode, code';
       isFilter_ := true;
     end;

     if (cbCompletionPlan.ItemIndex > 0) then
     begin
       if ((not edtStartDate.Checked) or (not edtEndDate.Checked)) then
       begin
         Application.MessageBox(PChar('Оберіть період...'), PChar('Увага'), MB_ICONWARNING);
         Action := caNone;
         Exit;
       end;


       // 1 - Формування наряд-завдання
       // черновые наряд-задания
       if (cbCompletionPlan.ItemIndex = 1) then
       begin
        AddCondition(condition, 'enplanwork.code in ( ' +
         ' select distinct (select * from net.get_codemonthplan_byanycodeplan(p.code::numeric)) as codemonthplan ' +
         ' from enplanwork p where p.kindcode = ' + IntToStr(ENPLANWORKKIND_NPZ) +
         '  and p.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) +
         '  and p.datestart between to_date(''' + DateToStr(edtStartDate.Date) + ''', ''dd.MM.yyyy'') ' +
         '      and to_date(''' + DateToStr(edtEndDate.Date) + ''', ''dd.MM.yyyy'')  )');
         
        isFilter_ := true;
       end;

       // 2 - Виконується
       // черновые факты - без актов
       if (cbCompletionPlan.ItemIndex = 2) then
       begin
        AddCondition(condition, 'enplanwork.code in ( ' +
         ' select distinct (select * from net.get_codemonthplan_byanycodeplan(p.code::numeric)) as codemonthplan ' +
         ' from enplanwork p where p.kindcode = ' + IntToStr(ENPLANWORKKIND_FACT) +
         '  and p.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) +
         '  and p.datestart between to_date(''' + DateToStr(edtStartDate.Date) + ''', ''dd.MM.yyyy'') ' +
         '      and to_date(''' + DateToStr(edtEndDate.Date) + ''', ''dd.MM.yyyy'')' +
         '  and p.code not in (select ap.plancode from enact2enplanwork ap) )');

        isFilter_ := true;
       end;

       // 3 - Виконано (Акт не проведено)
       // черновые факты - включенные в акт
       if (cbCompletionPlan.ItemIndex = 3) then
       begin
        AddCondition(condition, 'enplanwork.code in ( ' +
         ' select distinct (select * from net.get_codemonthplan_byanycodeplan(p.code::numeric)) as codemonthplan ' +
         ' from enplanwork p, enact2enplanwork ap, enact a ' +
         ' where ap.plancode = p.code ' +
         '  and a.code = ap.actrefcode ' +
         '  and a.statusrefcode <> ' + IntToStr(ENACT_CLOSED) +
         '  and p.kindcode = ' + IntToStr(ENPLANWORKKIND_FACT) +
         '  and p.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) +
         '  and p.datestart between to_date(''' + DateToStr(edtStartDate.Date) + ''', ''dd.MM.yyyy'') ' +
         '      and to_date(''' + DateToStr(edtEndDate.Date) + ''', ''dd.MM.yyyy'')  )');
         
        isFilter_ := true;
       end;

       // 4 - Виконано (Проведено бухгалтером)
       // утвержденный факт - акт проведен
       if (cbCompletionPlan.ItemIndex = 4) then
       begin
        AddCondition(condition, 'enplanwork.code in ( ' +
         ' select distinct (select * from net.get_codemonthplan_byanycodeplan(p.code::numeric)) as codemonthplan ' +
         ' from enplanwork p, enact2enplanwork ap, enact a ' +
         ' where ap.plancode = p.code ' +
         '  and a.code = ap.actrefcode ' +
         '  and a.statusrefcode = ' + IntToStr(ENACT_CLOSED) +
         '  and p.kindcode = ' + IntToStr(ENPLANWORKKIND_FACT) +
         '  and p.statuscode = ' + IntToStr(ENPLANWORKSTATUS_LOCKED) +
         '  and p.datestart between to_date(''' + DateToStr(edtStartDate.Date) + ''', ''dd.MM.yyyy'') ' +
         '      and to_date(''' + DateToStr(edtEndDate.Date) + ''', ''dd.MM.yyyy'')  )');
         
        isFilter_ := true;
       end;

       // 5 - Виконано (Без необхідності проведення бухгалтером)
       // утвержденный факт - без акта
       if (cbCompletionPlan.ItemIndex = 5) then
       begin
        AddCondition(condition, 'enplanwork.code in ( ' +
         ' select distinct (select * from net.get_codemonthplan_byanycodeplan(p.code::numeric)) as codemonthplan ' +
         ' from enplanwork p where p.kindcode = ' + IntToStr(ENPLANWORKKIND_FACT) +
         '  and p.statuscode = ' + IntToStr(ENPLANWORKSTATUS_LOCKED) +
         '  and p.datestart between to_date(''' + DateToStr(edtStartDate.Date) + ''', ''dd.MM.yyyy'') ' +
         '      and to_date(''' + DateToStr(edtEndDate.Date) + ''', ''dd.MM.yyyy'')' +
         '  and p.code not in (select ap.plancode from enact2enplanwork ap) )');
         
        isFilter_ := true;
       end;

     end;


     ENPlanWorkFilterObj.conditionSQL := condition;

     if not isFilter_ then
     begin
        Application.MessageBox(PChar('Виберіть хоча б один критерій пошуку ...'), PChar('Увага'), MB_ICONWARNING);
        Action := caNone;
        Exit;
     end;
  end;
end;

procedure TfrmENPlanWorkFilterEdit.spbENPlanWorkStatusClick(Sender : TObject);
var
   frmENPlanWorkStatusShow: TfrmENPlanWorkStatusShow;
begin
   frmENPlanWorkStatusShow:=TfrmENPlanWorkStatusShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.status = nil then ENPlanWorkFilterObj.status := ENPlanWorkStatus.Create();
               ENPlanWorkFilterObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               edtENPlanWorkStatusName.Text:=GetReturnValue(sgENPlanWorkStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkStatusShow.Free;
   end;
end;


procedure TfrmENPlanWorkFilterEdit.spbFINExecutorClick(Sender: TObject);
var
  frmFINExecutorTreeShow : TfrmFINExecutorTreeShow;

  {
  function getFullExecutorName(node : TTreeNode) : String;
  var
   outStr : String;
   tmpNode : TTreeNode;
  begin
    tmpNode := node;
    outStr := '';
      while  tmpNode <> nil do
      begin
        if FINExecutorShort(tmpNode.Data).finKindName <> '' then
        begin
          if length(outStr) = 0 then
            outStr := FINExecutorShort(tmpNode.Data).name
          else
            outStr := outStr + ' ' + FINExecutorShort(tmpNode.Data).name ;
        end;
        if tmpNode.Parent <> nil then
          if tmpNode.Parent.Level = 0 then
            break;
        tmpNode := tmpNode.Parent;
      end;
    result := outStr;
  end;
  }
begin
  frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application,fmNormal);

  try
    with frmFINExecutorTreeShow do
    begin
      DisableActions([actEdit, actInsert]);
      if ShowModal = mrOk then
      begin
        try
          if (usesDAXData) then begin
            axorgID := FINExecutorShort(tvDep.Selected.Data).axOrgId;
            isFilter_ := true;
            edtFINExecutorName.Text := DMReports.getFullExecutorName(tvDep.Selected);
          end else begin
            executorFinCode := FINExecutorShort(tvDep.Selected.Data).finCode;
            isFilter_ := true;
            edtFINExecutorName.Text := DMReports.getFullExecutorName(tvDep.Selected);
          end;
          toggleChbChildFinExecutor;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmFINExecutorTreeShow.Free;
  end;
end;


procedure TfrmENPlanWorkFilterEdit.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f : ENElementFilter;
   invNum , depName: String;
   depCode : Integer;
   depShort : ENDepartmentShort;
   //o : EN
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';
     //f.conditionSQL := 'code in (select elementrefcode from enline10 union all select elementcode from enlin150 union all select elementrefcode from ensubstation10 union all select elementrefcode from ensubstation150)
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
   try
     if isTransport then frmENElementShow.isTransport := true;
     if isOperative then frmENElementShow.isOperative := true;
     if isWriteOffProtection then frmENElementShow.isWriteOffProtection := true;
      with frmENElementShow do
        if ShowModal = mrOk then
        begin

            try
               //enObj := DMReports.getIByElement(StrToInt(GetReturnValue(sgENElement,0)));
               {
               invNum := GetReturnValue(sgENElement,3) ; //DMReports.getInvNumByElement(StrToInt(GetReturnValue(sgENElement,0)));
               if (length(invNum) < 5) then
               begin
                   Application.MessageBox(PChar('Плани можливо заносити тільки для об"єктів з інвентарним номером !!!' + ' ' + invNum +' < 5 символов'), PChar('Ошибка'), MB_ICONERROR);
                   exit;
               end;
               }


               if ENPlanWorkFilterObj.elementRef = nil then ENPlanWorkFilterObj.elementRef := ENElementRef.Create();
              // ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               ENPlanWorkFilterObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);
               isFilter_ := true;
               {
               if  ENPlanWorkFilterObj.renRef = nil then ENPlanWorkFilterObj.renRef := EPRenRef.Create;
               ENPlanWorkFilterObj.renRef.code := ENElementShort(sgENElement.Objects[0,sgENElement.Row]).renRefCode ;
               edtEPRenName.Text := GetReturnValue(sgENElement,2);

               // подкинуть депртамент ...
              depShort := DMReports.getDepartmentByRenCode(ENPlanWorkFilterObj.renRef.code);
              if depShort <> nil then
              begin
                  if ENPlanWorkFilterObj.departmentRef = nil then  ENPlanWorkFilterObj.departmentRef := ENDepartmentRef.Create;
                  ENPlanWorkFilterObj.departmentRef.code := depShort.code;
                  edtDepartment.Text:= depShort.shortName;
              end;
              }
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENPlanWorkFilterEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;

begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';
   
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if (ShowModal = mrOk) and (strBudget = '') then
        begin
            try
               if ENPlanWorkFilterObj.budgetRef = nil then ENPlanWorkFilterObj.budgetRef := ENDepartmentRef.Create();
               ENPlanWorkFilterObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPlanWorkFilterEdit.spbResponsibilityClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_RESPOSIBILITY;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.responsibilityRef = nil then ENPlanWorkFilterObj.responsibilityRef := ENDepartmentRef.Create();
               ENPlanWorkFilterObj.responsibilityRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtResponsibility.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPlanWorkFilterEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;
   if ENPlanWorkFilterObj.elementRef <> nil then
      if ENPlanWorkFilterObj.elementRef.code > low(Integer) then
         if ENPlanWorkFilterObj.renRef <> nil then
            if ENPlanWorkFilterObj.renRef.code > low(Integer) then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkFilterObj.renRef.code) +')';
               f.code := Low(integer);
            end;





   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.departmentRef = nil then ENPlanWorkFilterObj.departmentRef := ENDepartmentRef.Create();
               ENPlanWorkFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPlanWorkFilterEdit.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f : ENPlanWorkTypeFilter;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.typeRef = nil then ENPlanWorkFilterObj.typeRef := ENPlanWorkTypeRef.Create();
               ENPlanWorkFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtTypeName.Text:= GetReturnValue(sgENPlanWorkType,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;
end;

procedure TfrmENPlanWorkFilterEdit.spbENPlanWorkStateClick(
  Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
    planStateFilter : ENPlanWorkStateFilter;
begin

   if  ENPlanWorkFilterObj.typeRef <> nil then
   begin
     planStateFilter:= ENPlanWorkStateFilter.Create;
     SetNullIntProps(planStateFilter);
     SetNullXSProps(planStateFilter);
     planStateFilter.orderBySQL := 'ordered';
     planStateFilter.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode from enplantype2planstate where enplantype2planstate.typerefcode = '+ IntToStr(ENPlanWorkFilterObj.typeRef.code) +')';
     frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal,planStateFilter);
     end
     else
    frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal);

   try
      with frmENPlanWorkStateShow do begin

      DisableActions([ actEdit, actInsert ],DialogState = dsView  );
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkFilterObj.stateRef = nil then ENPlanWorkFilterObj.stateRef := ENPlanWorkStateRef.Create();
               ENPlanWorkFilterObj.stateRef.code := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               isFilter_ := true;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmENPlanWorkFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  isFilter_ := false;
  executorFinCode := LOW_INT;
  axorgID := '';
  elementCode := LOW_INT;
  elementName := '';
  typeCode := LOW_INT;
  typeName := '';
  stateCode := LOW_INT;
  stateName := '';
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, false);
end;

procedure TfrmENPlanWorkFilterEdit.toggleChbChildFinExecutor;
begin
  if (usesDAXData) then begin
    if Length(axorgID) > 0 then begin
        chbChildFinExecutor.Visible := True;
        chbChildFinExecutor.Checked := False;
    end else begin
        chbChildFinExecutor.Visible := False;
        chbChildFinExecutor.Checked := False;
    end;

  end else begin
    if executorFinCode <> LOW_INT then begin
        chbChildFinExecutor.Visible := True;
        chbChildFinExecutor.Checked := False;
    end else begin
        chbChildFinExecutor.Visible := False;
        chbChildFinExecutor.Checked := False;
    end;
  end;
end;

end.
