unit EditENMetrologyPlans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Grids, BaseGrid, AdvGrid, InvokeRegistry, Rio,
  SOAPHTTPClient, Menus, ActnList, ImgList, Buttons, StdCtrls, TB2Item,
  TB2Dock, TB2Toolbar, FINWorkerController, ENPlanWorkController, AdvObj;

type
  TfrmENMetrologyPlansEdit = class(TDialogForm)
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    pmActions: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    lblPlans: TLabel;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem47: TTBItem;
    TBItem46: TTBItem;
    sgENPlanWorkItem: TAdvStringGrid;
    actViewPlanWorkItem: TAction;
    actInsertPlanWorkItem: TAction;
    actEditPlanWorkItem: TAction;
    actDeletePlanWorkItem: TAction;
    actUpdatePlanWorkItem: TAction;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem6: TTBItem;
    TBItem2: TTBItem;
    TBItem7: TTBItem;
    TBItem3: TTBItem;
    pmPlanWorkItemActions: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    btnCheckAll: TBitBtn;
    btnUnCheckAll: TBitBtn;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENHumenItem: THTTPRIO;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtFINWorkerName: TEdit;
    spbFINWorker: TSpeedButton;
    spbFINWorkerClear: TSpeedButton;
    btnChangeOnSelected: TButton;
    N2: TMenuItem;
    N4: TMenuItem;
    actClosePlan: TAction;
    TBItem4: TTBItem;
    N6: TMenuItem;
    N7: TMenuItem;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    spbFINMol: TSpeedButton;
    spbFINMolClear: TSpeedButton;
    edtFinMolName: TEdit;
    btnCreateWorkOrders: TButton;
    edtFinMolCode: TEdit;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIOENWorkOrder2ENPlanWork: THTTPRIO;
    btnMaterialsBinding: TButton;
    actFilter: TAction;
    TBItem8: TTBItem;
    HTTPRIOENAct2ENPlanWork: THTTPRIO;
    HTTPRIOENWorkOrder: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENAct: THTTPRIO;
    btnAct: TButton;
    HTTPRIOFINMolData: THTTPRIO;
    lblAccount: TLabel;
    cbAccount: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actInsertPlanWorkItemExecute(Sender: TObject);
    procedure btnCheckAllClick(Sender: TObject);
    procedure btnUnCheckAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbFINWorkerClearClick(Sender: TObject);
    procedure spbFINWorkerClick(Sender: TObject);
    procedure sgENPlanWorkClick(Sender: TObject);
    procedure actViewPlanWorkItemExecute(Sender: TObject);
    procedure actEditPlanWorkItemExecute(Sender: TObject);
    procedure actUpdatePlanWorkItemExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnChangeOnSelectedClick(Sender: TObject);
    procedure actClosePlanExecute(Sender: TObject);
    procedure spbFINMolClick(Sender: TObject);
    procedure spbFINMolClearClick(Sender: TObject);
    procedure btnCreateWorkOrdersClick(Sender: TObject);
    procedure btnMaterialsBindingClick(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure btnActClick(Sender: TObject);
    procedure cbAccountChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planCodes: String;
    planFilterCondition: String;
    parentPlanCode: Integer;
    finWorkerObj: FINWorker;
    planFilterObj: ENPlanWorkFilter;
    isForWriteOff: Boolean;
    procedure UpdatePlanWorkItems(planCode: Integer);
    procedure ChangeFinWorker(planItemCode: Integer);
  end;

var
  frmENMetrologyPlansEdit: TfrmENMetrologyPlansEdit;

implementation

uses {ENPlanWorkController, }GridHeadersUnit, DMReportsUnit, EditENPlanWork,
  ENConsts, ShowTKTechCard, TKTechCardController, ChildFormUnit, XSBuiltIns,
  EditENPlanWorkItemSimple, ENPlanWorkItemController, ShowFINWorker,
  ENHumenItemController, EditENPlanWorkItem, FINMolController, ShowFINMol,
  ENDepartment2EPRenController, ENDepartmentController,
  ENWorkOrder2ENPlanWorkController, ENWorkOrderController,
  EditFINMaterialsData, EditENPlanWorkFilter, ENAct2ENPlanWorkController,
  Math, ENElementController, ENActController, ShowENAct, ENActStatusController,
  FINWorkerKindController, FINMolDataController, FINMolTypeController,
  ENPlanWorkStateController;


{$R *.dfm}

const
  ENPlanWorkHeaders: array [1..19] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          ,'Вид робіт'
          ,'Тип робіт'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          //,'Дата складання плану'
          ,'№ наряда'
          ,'№ акта'
          ,'Рахунок'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  ENPlanWorkItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'Джерело нормативу'
          ,'Кількість'
          ,'Норма часу на од.'
          ,'Всього часу'
          ,'Час з коеф.'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );        
        
  MonthesNames: array [1..12] of String =
        (
          'січень',
          'лютий',
          'березень',
          'квітень',
          'травень',
          'червень',
          'липень',
          'серпень',
          'вересень',
          'жовтень',
          'листопад',
          'грудень'
        );

procedure TfrmENMetrologyPlansEdit.FormShow(Sender: TObject);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
    planFilter: ENPlanWorkFilter;

    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;    
begin
  DisableControls([edtFINWorkerName, edtFinMolCode, edtFinMolName]);

  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);
  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);

  if isForWriteOff then
  begin
    cbAccount.Clear;
    cbAccount.Items.Add('');
    cbAccount.Items.Add('1127');
    cbAccount.Items.Add('0732');
  end;

  //////////////////////////////////////////////////////////////////////////////
  actFilter.Visible := false;

  if planCodes = '' then
  begin
    //HideControls([btnMaterialsBinding]);
    lblPlans.Caption := 'Знайдені плани робіт';  
    actFilter.Visible := true;
    if planFilterObj = nil then Exit;
  end
  else begin
    lblPlans.Caption := 'Сформовані Завдання-плани'; 

    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planFilter.conditionSQL := 'enplanwork.code in (' + planCodes + ')';
  end;
  //////////////////////////////////////////////////////////////////////////////


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  if planCodes <> '' then
    //ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1)
    ENPlanWorkList := TempENPlanWork.getScrollableFilteredListForMetrologyCounters(planFilter, 0, -1)
  else
    //ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilterObj, 0, -1);
    ENPlanWorkList := TempENPlanWork.getScrollableFilteredListForMetrologyCounters(planFilterObj, 0, -1);

  //if ENPlanWorkList <> nil then
  //  ShowMessage(IntToStr(ENPlanWorkList.totalCount));

  /////
  for i := 1 to sgENPlanWork.RowCount - 1 do
    for j := 0 to sgENPlanWork.ColCount - 1 do
    begin
      sgENPlanWork.Cells[j, i] := '';
      sgENPlanWork.RemoveCheckBox(1, i);
    end;

  sgENPlanWork.RowCount := 2;
  /////

  LastCount:=High(ENPlanWorkList.list);

  if LastCount > -1 then
     sgENPlanWork.RowCount:=LastCount+2
  else
     sgENPlanWork.RowCount:=2;

   with sgENPlanWork do
    for i:=0 to LastCount do
      begin
        //Application.ProcessMessages;

        n := 0;

        if ENPlanWorkList.list[i].code <> Low(Integer) then
        begin
          Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].code);
        end
        else
          Cells[n,i+1] := '';
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].objectName;
        AddCheckBox(n, i+1, false, false);
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].invNumber;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].renRefName;
        inc(n);

        if ENPlanWorkList.list[i].yearGen <> Low(Integer) then
          Cells[n,i+1] := IntToStr(ENPlanWorkList.list[i].yearGen)
        else
          Cells[n,i+1] := '';
        inc(n);

        if ENPlanWorkList.list[i].monthGen <> Low(Integer) then
          //Cells[4,i+1] := IntToStr(ENPlanWorkList.list[i].monthGen)
          Cells[n,i+1] := MonthesNames[ENPlanWorkList.list[i].monthGen]
        else
          Cells[n,i+1] := '';
        inc(n);

        if ENPlanWorkList.list[i].dateStart = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateStart);
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].typeRefName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].stateRefShortName;
        inc(n);


        Cells[n,i+1] := ENPlanWorkList.list[i].kindName ;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].statusName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].departmentRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].budgetRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].responsibilityRefShortName;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].workOrderNumber;
        inc(n);

{
        if ENPlanWorkList.list[i].dateGen = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateGen);
        inc(n);
}

        Cells[n,i+1] := ENPlanWorkList.list[i].actRefNumber;
        inc(n);

        // в этом поле на самом деле бух. счет, на котором находится счетчик
        Cells[n,i+1] := ENPlanWorkList.list[i].actInfo;
        inc(n);

        Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
        inc(n);

        if ENPlanWorkList.list[i].dateEdit = nil then
          Cells[n,i+1] := ''
        else
          Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
        inc(n);

        Objects[1,i+1] := TObject(ENPlanWorkList.list[i].kindCode);
        Objects[2,i+1] := TObject(ENPlanWorkList.list[i].statusCode);

        //Objects[0,i+1] := ENPlanWorkShort.Create;
        //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

        sgENPlanWork.RowCount := i + 2;
      end;

  sgENPlanWork.Row := 1;
  sgENPlanWorkClick(Sender);
end;

procedure TfrmENMetrologyPlansEdit.actViewExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
objCode, selectedRow : Integer;
begin

  try
    objCode:=StrToInt( sgENPlanWork.Cells[0, sgENPlanWork.row] );
  except
    on EConvertError do Exit;
  end;


  tPlan := DMReports.getPlanByCode( objCode );

  if tPlan = nil then
  begin
      exit;
  end;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
  try

    try
      frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject( objCode );
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmENMetrologyPlansEdit.FormCreate(Sender: TObject);
begin
  planCodes := '';
  planFilterCondition := '';
  parentPlanCode := LOW_INT;
  planFilterObj := nil;
  isForWriteOff := false;
end;

procedure TfrmENMetrologyPlansEdit.actInsertPlanWorkItemExecute(
  Sender: TObject);
var i, newPlanWorkItemCode: Integer;
    state, selected: Boolean;
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemObj: ENPlanWorkItem;
    
    pwiF: ENPlanWorkItemFilter;
    pwiList: ENPlanWorkItemShortList;
    err, msg: String;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    humenFilter: ENHumenItemFilter;
    humenList: ENHumenItemShortList;
    humenObj: ENHumenItem;
begin
  selected := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбран ни один план
  begin
    Application.MessageBox(PChar('Необхідно вибрати плани, в які потрібно додати роботу!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENPlanWorkItemSimpleEdit := TfrmENPlanWorkItemSimpleEdit.Create(Application, dsInsert);
  try
    frmENPlanWorkItemSimpleEdit.techCardSourceCondition := 'tktechcardsource.code in (75000044, 75000047, 75000049)';
    if frmENPlanWorkItemSimpleEdit.ShowModal = mrOk then
    begin
      if frmENPlanWorkItemSimpleEdit.techCardCode < 0 then
      begin
        Application.MessageBox(PChar('Невідомий код роботи!'),
                               PChar('Помилка!'), MB_ICONERROR);
        Exit;
      end;

      state := false;

      TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
      TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

      for i := 1 to sgENPlanWork.RowCount - 1 do
      begin
        sgENPlanWork.GetCheckBoxState(1, i, state);

        if state then
        begin
          //ShowMessage(sgENPlanWork.Cells[0, i]);

          ENPlanWorkItemObj := ENPlanWorkItem.Create;
          SetNullIntProps(ENPlanWorkItemObj);
          SetNullXSProps(ENPlanWorkItemObj);

          ENPlanWorkItemObj.kartaRef := TKTechCardRef.Create;
          ENPlanWorkItemObj.kartaRef.code := frmENPlanWorkItemSimpleEdit.techCardCode;

          ENPlanWorkItemObj.countGen := TXSDecimal.Create;
          if frmENPlanWorkItemSimpleEdit.edtCountGen.Text <> '' then
            ENPlanWorkItemObj.countGen.DecimalString := frmENPlanWorkItemSimpleEdit.edtCountGen.Text
          else
            ENPlanWorkItemObj.countGen := nil;

          //ENPlanWorkItemObj.dateEdit := TXSDate.Create;
          ENPlanWorkItemObj.planRef := ENPlanWorkRef.Create;
          try
            ENPlanWorkItemObj.planRef.code := StrToInt(sgENPlanWork.Cells[0, i]);
          except
            on EConvertError do Continue;
          end;

          if ENPlanWorkItemObj.countGen <> nil then
            try
              if StrToFloat(ENPlanWorkItemObj.countGen.DecimalString) < 0.000001 then
              begin
                Application.MessageBox(PChar('Додавати роботу з нульовою кількістю неможна!'), PChar('Увага!'), MB_ICONWARNING);
                Exit;
              end;
            except
              raise;
            end;

          // проверить, нет ли такой работы в плане ....
          pwiF := ENPlanWorkItemFilter.Create;
          SetNullIntProps(pwiF);
          SetNullXSProps(pwiF);
          pwiF.planRef := ENPlanWorkRef.Create;
          pwiF.planRef.code := ENPlanWorkItemObj.planRef.code;
          pwiF.kartaRef := TKTechCardRef.Create;
          pwiF.kartaRef.code := ENPlanWorkItemObj.kartaRef.code;
          pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiF, 0, -1);
          if (pwiList.totalCount > 0) then
          begin
            //err := 'На цей план вже є робота з кодом ' + pwiList.list[0].kartaNum +  ' у кількості ' + pwiList.list[0].countGen.DecimalString;
            err := 'У плані ' + IntToStr(ENPlanWorkItemObj.planRef.code) +
                   ' вже є робота з номером ' + pwiList.list[0].kartaNum +  ' у кількості ' + pwiList.list[0].countGen.DecimalString;
            Application.MessageBox(PChar(err), PChar('Помилка !!!'), MB_ICONERROR);
            Exit;
          end;

          newPlanWorkItemCode := LOW_INT;
          ENPlanWorkItemObj.code := LOW_INT;
          // Добавляем работу в план
          newPlanWorkItemCode := TempENPlanWorkItem.add(ENPlanWorkItemObj);

          //////////////////////////////////////////////////////////////////////
          // Если в работе только 1 нормативная должность,
          // цепляем на нее выбранного реального работника
          if finWorkerObj = nil then Continue;

          ChangeFinWorker(newPlanWorkItemCode);
          { !!!!! ВЫНЕСЕНО В ПРОЦЕДУРУ ChangeFinWorker !!!!!
          ENPlanWorkItemObj := TempENPlanWorkItem.getObject(newPlanWorkItemCode);
          if ENPlanWorkItemObj <> nil then
            if ENPlanWorkItemObj.code > LOW_INT then
            begin
              humenFilter := ENHumenItemFilter.Create;
              SetNullIntProps(humenFilter);
              SetNullXSProps(humenFilter);

              humenFilter.planItemRef := ENPlanWorkItemRef.Create;
              humenFilter.planItemRef.code := ENPlanWorkItemObj.code;

              humenList := TempENHumenItem.getScrollableFilteredList(humenFilter, 0, -1);
              if humenList <> nil then
                if High(humenList.list) = 0 then // Если 1 нормативный работник
                  if humenList.list[0] <> nil then
                  begin
                    humenObj := TempENHumenItem.getObject(humenList.list[0].code);
                    if humenObj <> nil then
                    begin
                      humenObj.finWorker := FINWorker.Create;
                      if finWorkerObj <> nil then
                      begin
                        humenObj.finWorker.code := LOW_INT;
                        humenObj.finWorker.name := finWorkerObj.name;
                        humenObj.finWorker.tabNumber := finWorkerObj.tabNumber;
                        humenObj.finWorker.positionName := finWorkerObj.positionName;
                        humenObj.finWorker.positionCode := finWorkerObj.positionCode;
                        humenObj.finWorker.departmentName := finWorkerObj.departmentName;
                        humenObj.finWorker.departmentCode := finWorkerObj.departmentCode;

                        if finWorkerObj.priceGen <> nil then
                        begin
                          humenObj.finWorker.priceGen := TXSDecimal.Create;
                          humenObj.finWorker.priceGen.DecimalString := finWorkerObj.priceGen.DecimalString;
                        end;

                        if finWorkerObj.kindRef <> nil then
                        begin
                          humenObj.finWorker.kindRef := FINWorkerKindRef.Create;
                          humenObj.finWorker.kindRef.code := finWorkerObj.kindRef.code;
                        end;
                        
                        humenObj.finWorker.categor := finWorkerObj.categor;
                        humenObj.finWorker.finCode := finWorkerObj.finCode;
                        humenObj.finWorker.isSentAssignment := 0;
                      end;
                      TempENHumenItem.save(humenObj);
                    end; // if humenObj <> nil
                  end; // if humenList.list[0] <> nil
            end; // if ENPlanWorkItemObj.code > LOW_INT }
          //////////////////////////////////////////////////////////////////////
        end; // if state
      end; // for i := 1 to sgENPlanWork.RowCount - 1

      if finWorkerObj = nil then
        msg := 'Робота додана у вибрані плани без виконавця !'
      else
        msg := 'Робота додана у вибрані плани (з виконавцем ' + edtFINWorkerName.Text + ') !';

      Application.MessageBox(PChar(msg),
                             PChar('Повідомлення'), MB_ICONINFORMATION);

      sgENPlanWorkClick(Sender);

    end; // if frmENPlanWorkItemSimpleEdit.ShowModal = mrOk
  finally
    frmENPlanWorkItemSimpleEdit.Free;
  end;
end;

procedure TfrmENMetrologyPlansEdit.btnCheckAllClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
    sgENPlanWork.SetCheckBoxState(1, i, true);
end;

procedure TfrmENMetrologyPlansEdit.btnUnCheckAllClick(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENPlanWork.RowCount - 1 do
    sgENPlanWork.SetCheckBoxState(1, i, false);
end;

procedure TfrmENMetrologyPlansEdit.cbAccountChange(Sender: TObject);
var accountCondition, condition: String;
begin
  if planFilterObj = nil then Exit;

  condition := '';

  if planFilterObj.conditionSQL = '' then
  begin
    AddCondition(condition, '(enplanwork.elementrefcode in (select e.code from enelement e where e.typerefcode = ' +
                            IntToStr(EN_METROLOGY_COUNTER) + '))');
    AddCondition(condition, '(enplanwork.kindcode in (3, 4))');
    //AddCondition(condition, '(enplanwork.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) + ')');
    AddCondition(condition, '(enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');

    // сохраним condition в глобальной переменной
    planFilterCondition := condition;
  end
  else
    condition := planFilterCondition;

  ///// NET-4392 Доп. условие по счету
  if cbAccount.ItemIndex > 0 then
    AddCondition(condition,
                 '(select mc.account ' +
                 '   from enmetrologycounter mc ' +
                 '  where mc.elementcode = ENPLANWORK.elementrefcode) = ''' + Trim(cbAccount.Text) + '''');
  /////

  planFilterObj.conditionSQL := condition;

  actUpdateExecute(Sender);
end;

procedure TfrmENMetrologyPlansEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
  inherited;
end;

procedure TfrmENMetrologyPlansEdit.spbFINWorkerClearClick(Sender: TObject);
begin
  inherited;
  finWorkerObj := nil;
  edtFINWorkerName.Text := '';
end;

procedure TfrmENMetrologyPlansEdit.spbFINWorkerClick(Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f: FINWorkerFilter;
   plan: ENPlanWork;
   w: FINWorker;
   TempFINWorker: FINWorkerControllerSoapPort;
begin
  plan := DMReports.getPlanByCode(parentPlanCode);

  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if plan <> nil then
  begin
    f.departmentCode := IntToStr(plan.departmentRef.code);

    if plan.finExecutor <> nil then
    begin
      if plan.finExecutor.code > LOW_INT then
      begin
        // MDAX-441
        if DMReports.UsesMDAXData then
         f.departmentCode := plan.finExecutor.axOrgId
        else
         f.departmentCode := intToStr( plan.finExecutor.finCode );
      end;
    end;
  end;

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
   try

     frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
        {
            if (GetReturnValue(sgFINWorker,8)) <> '1' then
            begin
              Application.MessageBox(PChar('У цього працівника не встановлений признак участі в НВЗ !!! '+ #13#10+'Звертайтесь у Відділ Праці та ЗП ...'),
                                PChar('Увага !'), MB_ICONWARNING);
              exit;

            end;
       }
            try
              if finWorkerObj = nil then
              begin
                finWorkerObj := FINWorker.Create;
                finWorkerObj.code := LOW_INT;
              end;

              finWorkerObj.name := GetReturnValue(sgFINWorker,1);
              finWorkerObj.tabNumber := GetReturnValue(sgFINWorker,2);
              finWorkerObj.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                finWorkerObj.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                finWorkerObj.positionCode := LOW_INT;

              finWorkerObj.departmentName := GetReturnValue(sgFINWorker,5);
              finWorkerObj.departmentCode := (GetReturnValue(sgFINWorker,6));

              if finWorkerObj.priceGen = nil then finWorkerObj.priceGen := TXSDecimal.Create;
              finWorkerObj.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              /// 17.06.10
              {
              if GetReturnValue(sgFINWorker,8) = '' then
                finWorkerObj.categor := LOW_INT
              else
                finWorkerObj.categor := StrToInt(GetReturnValue(sgFINWorker,8));
              }
                            
              finWorkerObj.kindRef := FINWorkerKindRef.Create;
              finWorkerObj.categor := LOW_INT;

              if GetReturnValue(sgFINWorker,8) = '' then
                finWorkerObj.kindRef.code := FINWORKER_KIND_OTHER
              else
                finWorkerObj.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
              ///

              if (GetReturnValue(sgFINWorker,9) <> '') then
                FINWorkerObj.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                FINWorkerObj.finCode := LOW_INT;

              // 26.02.2015
              if (GetReturnValue(sgFINWorker,12) <> '') then
                FINWorkerObj.categorId := StrToInt(GetReturnValue(sgFINWorker,12))
              else
                FINWorkerObj.categorId := LOW_INT;

              FINWorkerObj.categorName := GetReturnValue(sgFINWorker,13);
              FINWorkerObj.workTimeId := GetReturnValue(sgFINWorker,14);
              FINWorkerObj.positionId := GetReturnValue(sgFINWorker,15);

              edtFINWorkerName.Text := finWorkerObj.name;
              //edtENManningTableManningTableName.Text := finWorkerObj.positionName;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENMetrologyPlansEdit.sgENPlanWorkClick(Sender: TObject);
var i, j, planCode: Integer;
begin
  try
    planCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do
    begin
      for i := 1 to sgENPlanWorkItem.RowCount - 1 do
        for j := 0 to sgENPlanWorkItem.ColCount - 1 do
          sgENPlanWorkItem.Cells[j, i] := '';
      sgENPlanWorkItem.RowCount := 2;
      
      Exit;
    end;
  end;

  UpdatePlanWorkItems(planCode);
end;

procedure TfrmENMetrologyPlansEdit.actViewPlanWorkItemExecute(
  Sender: TObject);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    objCode: Integer;
begin
  try
    objCode := StrToInt(sgENPlanWorkItem.Cells[0, sgENPlanWorkItem.row]);
  except
    on EConvertError do Exit;
  end;

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  try
    ENPlanWorkItemObj := TempENPlanWorkItem.getObject(objCode);
  except
    on EConvertError do Exit;
  end;

  frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsView);
  try
    //frmENPlanWorkItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
    frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];
    if frmENPlanWorkItemEdit.ShowModal= mrOk then
    begin
      //TempENLine04.save(ENLine04Obj);
      //UpdateGrid(Sender);
    end;
  finally
    frmENPlanWorkItemEdit.Free;
    frmENPlanWorkItemEdit:=nil;
  end;
end;

procedure TfrmENMetrologyPlansEdit.actEditPlanWorkItemExecute(
  Sender: TObject);
var tmpPlan: ENPlanWork;
    selectedRow, objCode: Integer;
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  try
    objCode := StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tmpPlan := DMReports.getPlanByCode(objCode);

  if tmpPlan = nil then
  begin
    Application.MessageBox(PChar('План не знайдено!'), PChar('Увага'), MB_ICONERROR);
    Exit;
  end;

  if (not (tmpPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]))
     and (tmpPlan.kind.code <> ENPLANWORKKIND_CURRENT) then
  begin
    //Application.MessageBox(PChar('План ВЖЕ затверджений або видалений !'), PChar('Увага!'), MB_ICONWARNING);
    Application.MessageBox(PChar('План ВЖЕ затверджений!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

    selectedRow := sgENPlanWorkItem.Row;
    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsEdit);
    try
      //frmENPlanWorkItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[8,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[9,sgENPlanWorkItem.Row];
      
      if frmENPlanWorkItemEdit.ShowModal= mrOk then
        begin
          //TempENLine04.save(ENLine04Obj);
          //UpdateGrid(Sender);
          UpdatePlanWorkItems(tmpPlan.code);
        end;

        if  sgENPlanWorkItem.RowCount > selectedRow then
           sgENPlanWorkItem.Row := selectedRow
        else
           sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;
end;

procedure TfrmENMetrologyPlansEdit.UpdatePlanWorkItems(planCode: Integer);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemList: ENPlanWorkItemShortList;
    i, j, k, n, iLastCount: Integer;
    planItemFilter: ENPlanWorkItemFilter;
    //condition: String;
    vNormOfTime, vCountGen, vMaterialCount: Double;
begin
  for i := 1 to sgENPlanWorkItem.RowCount - 1 do
    for j := 0 to sgENPlanWorkItem.ColCount - 1 do
      sgENPlanWorkItem.Cells[j, i] := '';

  sgENPlanWorkItem.RowCount := 2;

  planItemFilter := ENPlanWorkItemFilter.Create;
  SetNullIntProps(planItemFilter);
  SetNullXSProps(planItemFilter);

  planItemFilter.planRef := ENPlanWorkRef.Create;
  planItemFilter.planRef.code := planCode;

  planItemFilter.orderBySQL := ' enplanworkitem.kartarefcode';

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

  iLastCount:=High(ENPlanWorkItemList.list);

  if iLastCount > -1 then
     sgENPlanWorkItem.RowCount:=iLastCount+2
  else
     sgENPlanWorkItem.RowCount:=2;

  with sgENPlanWorkItem do
    for i:=0 to iLastCount do
      begin
        //Application.ProcessMessages;
        
        if ENPlanWorkItemList.list[i].code <> Low(Integer) then
          Cells[0, i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
        else
          Cells[0, i+1] := '';

        Cells[1, i+1] := ENPlanWorkItemList.list[i].kartaNum;
        Cells[2, i+1] := ENPlanWorkItemList.list[i].kartaRefName;
        Cells[3, i+1] := ENPlanWorkItemList.list[i].sourceName;

        vCountGen := 0;

        if ENPlanWorkItemList.list[i].countGen = nil then
          Cells[4, i+1] := ''
        else begin
          Cells[4, i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;
          try
            vCountGen := StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString);
          except
            vCountGen := 0;
          end;
        end;

        vNormOfTime := 0;

        if ENPlanWorkItemList.list[i].normOfTime = nil then
          Cells[5, i+1] := ''
        else begin
          Cells[5, i+1] := ENPlanWorkItemList.list[i].normOfTime.DecimalString;
          try
            vNormOfTime := StrToFloat(ENPlanWorkItemList.list[i].normOfTime.DecimalString);
          except
            vNormOfTime := 0;
          end;
        end;

        Cells[6, i+1] := FloatToStr(Conv(vNormOfTime * vCountGen, 3));

        if ENPlanWorkItemList.list[i].timeGen <> nil then
          Cells[7, i+1] := ENPlanWorkItemList.list[i].timeGen.DecimalString
        else
          Cells[7, i+1] := '';
          
        Cells[8, i+1] := ENPlanWorkItemList.list[i].meter;
        Cells[9, i+1] := ENPlanWorkItemList.list[i].measurementUnit;

        Cells[10, i+1] := ENPlanWorkItemList.list[i].userGen;

        {if ENPlanWorkItemList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);}

        //Cells[9,i+1] := FloatToStr(Conv(vNormOfTime * vCountGen, 3));

        /////
        try
          RowColor[i+1] := clWindow;

          // Если работа с нулевым кол-вом, выделяем строку красным цветом
          if ENPlanWorkItemList.list[i].countGen <> nil then
            if StrToFloat(ENPlanWorkItemList.list[i].countGen.DecimalString) = 0 then
              RowColor[i+1] := clRed;
        except
        end;
        /////

        //iLastRow:=i+1;
        sgENPlanWorkItem.RowCount := i+2;
      end;

   //iColCount:=iColCount+1;
   sgENPlanWorkItem.Row := 1;
end;

procedure TfrmENMetrologyPlansEdit.actUpdatePlanWorkItemExecute(
  Sender: TObject);
begin
  sgENPlanWorkClick(Sender);
end;

procedure TfrmENMetrologyPlansEdit.actUpdateExecute(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TfrmENMetrologyPlansEdit.actEditExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    tPlan : ENPlanWork;
    selectedRow, objCode: Integer;
begin
  try
    objCode := StrToInt(sgENPlanWork.Cells[0, sgENPlanWork.Row]);
  except
    on EConvertError do Exit;
  end;

  tPlan := DMReports.getPlanByCode(objCode);

  if tPlan = nil then
  begin
    Exit;
  end;


  //ShowMessage( ENPlanWorkShort(sgENPlanWork.Objects[0,sgENPlanWork.Row]).statusName );
  //if  Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) <> ENPLANWORKSTATUS_GOOD then


  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

if (tPlan.status.code = ENPLANWORKSTATUS_PRECONFIRMED)  then
begin
  try
      TempENPlanWork.editPreConfirm(tPlan.code);
  except
      Application.MessageBox(PChar('Цей план можуть коригувати тільки у ХОЕ !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;
end;

  if not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION, ENPLANWORKSTATUS_PRECONFIRMED])

      //and
      //not ( tPlan.kind.code in [ENPLANWORKKIND_CURRENT ])
  then
  begin
      Application.MessageBox(PChar('План затверджений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  selectedRow := sgENPlanWork.Row;

  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsEdit);
  try

     try
       frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(StrToInt(sgENPlanWork.Cells[0,sgENPlanWork.Row]));
     except
     on EConvertError do Exit;
    end;

    if frmENPlanWorkEdit.ShowModal= mrOk then
      begin
        //TempENPlanWork.save(ENPlanWorkObj);
        //UpdateGrid(Sender);

        actUpdateExecute(Sender);

          {
          if sgENPlanWork.RowCount > 100 then
            sgENPlanWork.RowCount:=sgENPlanWork.RowCount-99
          else
            sgENPlanWork.RowCount:= 2;
          }
          
            {
            ColCount := ColCount - 99;

            if selectedRow > 100 then
              //CounterGridTopLeftChanged(Sender)
              sgENPlanWorkTopLeftChanged(Sender)
            else
            begin
              //SetGridHeaders(TMPCounterHeaders, CounterGrid.ColumnHeaders);
              //btnSearchNomenclatureClick(Sender);
              //FormShow(Sender);
              //UpdateGrid(Sender);
              actUpdateExecute(Sender);
            end;
            }

      end;

        if  sgENPlanWork.RowCount > selectedRow then
           sgENPlanWork.Row := selectedRow
        else
           sgENPlanWork.Row :=  sgENPlanWork.RowCount-1;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;

end;

procedure TfrmENMetrologyPlansEdit.btnChangeOnSelectedClick(
  Sender: TObject);
var i, j, newPlanWorkItemCode, planCode: Integer;
    state, selected: Boolean;
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemObj: ENPlanWorkItem;
    
    pwiF: ENPlanWorkItemFilter;
    pwiList: ENPlanWorkItemShortList;
    err, msg: String;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    humenFilter: ENHumenItemFilter;
    humenList: ENHumenItemShortList;
    humenObj: ENHumenItem;
begin
  if finWorkerObj = nil then
  begin
    Application.MessageBox(PChar('Спочатку вкажіть виконавця!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtFINWorkerName.SetFocus;
    Exit;
  end;

  selected := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбран ни один план
  begin
    Application.MessageBox(PChar('Необхідно вибрати плани, в яких потрібно змінити виконавця!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end; 

  state := false;

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, state);

    if state then
    begin
      //ShowMessage(sgENPlanWork.Cells[0, i]);
      try
        planCode := StrToInt(sgENPlanWork.Cells[0, i]);
      except
        on EConvertError do Continue;
      end;

      // Вытягиваем все работы с плана
      pwiF := ENPlanWorkItemFilter.Create;
      SetNullIntProps(pwiF);
      SetNullXSProps(pwiF);
      pwiF.planRef := ENPlanWorkRef.Create;
      pwiF.planRef.code := planCode;

      pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiF, 0, -1);
      if pwiList <> nil then
        if High(pwiList.list) > -1 then
        begin
          for j := 0 to High(pwiList.list) do
          begin
            //////////////////////////////////////////////////////////////////////
            ChangeFinWorker(pwiList.list[j].code);
            { !!!!! ВЫНЕСЕНО В ПРОЦЕДУРУ ChangeFinWorker !!!!!
            ENPlanWorkItemObj := TempENPlanWorkItem.getObject(pwiList.list[j].code);
            if ENPlanWorkItemObj <> nil then
              if ENPlanWorkItemObj.code > LOW_INT then
              begin
                humenFilter := ENHumenItemFilter.Create;
                SetNullIntProps(humenFilter);
                SetNullXSProps(humenFilter);

                humenFilter.planItemRef := ENPlanWorkItemRef.Create;
                humenFilter.planItemRef.code := ENPlanWorkItemObj.code;

                humenList := TempENHumenItem.getScrollableFilteredList(humenFilter, 0, -1);
                if humenList <> nil then
                  if High(humenList.list) = 0 then // Если 1 нормативный работник
                    if humenList.list[0] <> nil then
                    begin
                      humenObj := TempENHumenItem.getObject(humenList.list[0].code);
                      if humenObj <> nil then
                      begin
                        humenObj.finWorker := FINWorker.Create;
                        if finWorkerObj <> nil then
                        begin
                          humenObj.finWorker.code := LOW_INT;
                          humenObj.finWorker.name := finWorkerObj.name;
                          humenObj.finWorker.tabNumber := finWorkerObj.tabNumber;
                          humenObj.finWorker.positionName := finWorkerObj.positionName;
                          humenObj.finWorker.positionCode := finWorkerObj.positionCode;
                          humenObj.finWorker.departmentName := finWorkerObj.departmentName;
                          humenObj.finWorker.departmentCode := finWorkerObj.departmentCode;

                          if finWorkerObj.priceGen <> nil then
                          begin
                            humenObj.finWorker.priceGen := TXSDecimal.Create;
                            humenObj.finWorker.priceGen.DecimalString := finWorkerObj.priceGen.DecimalString;
                          end;

                          humenObj.finWorker.categor := finWorkerObj.categor;
                          humenObj.finWorker.finCode := finWorkerObj.finCode;
                          humenObj.finWorker.isSentAssignment := 0;
                        end;
                        TempENHumenItem.save(humenObj);
                      end;
                    end; // if humenList.list[0] <> nil
              end; // if ENPlanWorkItemObj.code > LOW_INT }
            //////////////////////////////////////////////////////////////////////
          end; // for j := 0 to High(pwiList.list)
        end; // if High(pwiList.list) > -1

    end; // if state
  end; // for i := 1 to sgENPlanWork.RowCount - 1

  Application.MessageBox(PChar('Виконавця змінено (в тих роботах, де є одна нормативна посада)!'),
                         PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmENMetrologyPlansEdit.actClosePlanExecute(Sender: TObject);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    i, ObjCode, planCode, newPlanCode: Integer;
    ENPlanWorkObj: ENPlanWork;
    tPlan : ENPlanWork;
    selected, state: Boolean;
begin
  selected := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбран ни один план
  begin
    Application.MessageBox(PChar('Необхідно вибрати плани, які потрібно затвердити!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте затвердити вибрані плани?'),
                    PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

    
  state := false;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, state);

    if state then
    begin
      try
        planCode := StrToInt(sgENPlanWork.Cells[0, i]);
      except
        on EConvertError do Continue; 
      end;

      //if not (Integer(sgENPlanWork.Objects[0,sgENPlanWork.Row]) in [ ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION]) then
      tPlan := DMReports.getPlanByCode(planCode);
      if tPlan = nil then
      begin
        Application.MessageBox(PChar('План з кодом ' + IntToStr(planCode) + ' не знайдено!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;

      if
        (
          not (tPlan.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION])
        )
        and ( tPlan.kind.code <> ENPLANWORKKIND_CURRENT )
        then
      begin
        Application.MessageBox(PChar('План з кодом ' + IntToStr(planCode) + ' ВЖЕ затверджений!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;

      // Комментируем, чтобы Метрология могла закрывать (массово) свои факты по ТО, для которых не надо сдавать Акт
      {
      if tPlan.kind.code = ENPLANWORKKIND_FACT then
      begin
        Application.MessageBox(PChar('План з кодом ' + IntToStr(planCode) + ' неможна затверджувати - це вже Завдання-ФАКТ!'), PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
      }

      newPlanCode := TempENPlanWork.closePlanWork(planCode);
      //if newPlanCode > LOW_INT then //*****
      if (newPlanCode > LOW_INT) and (planCodes <> '') then
        AddListPos(planCodes, IntToStr(newPlanCode));
    end;
  end;

  Application.MessageBox(PChar('Затвердження планів завершено!'), PChar('Повідомлення'), MB_ICONINFORMATION);

  actUpdateExecute(Sender);
end;

procedure TfrmENMetrologyPlansEdit.spbFINMolClick(Sender: TObject);
var
  f : FINMolFilter;
  frmFINMolShow : TfrmFINMolShow;

  //TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  //i: Integer;
  //ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  //renFilter : ENDepartment2EPRenFilter;
  //renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;

  //molSel : boolean;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  {
  plan := DMReports.getPlanByCode(parentPlanCode);

   if plan.departmentRef <> nil then
     if plan.departmentRef.code <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := plan.departmentRef.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;
  }
  f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = 27';

  frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

  try
    if length(f.conditionSQL) > 0 then
      frmFINMolShow.isFiltered := true;

    with frmFINMolShow do begin
      DisableActions([ actEdit, actInsert ]);
      if ShowModal = mrOk then
      begin
        try
          edtFinMolCode.Text := GetReturnValue(sgFINMol,0);
          edtFINMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
          //ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := GetReturnValue(sgFINMol,0);
          //ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := GetReturnValue(sgFINMol,1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmFINMolShow.Free;
  end;

 {

 if not Assigned(frmFINMolShow) then
    frmFINMolShow := TfrmFINMolShow.Create(Application,fmChild,f);
 frmFINMolShow.Show;
 }

end;

procedure TfrmENMetrologyPlansEdit.spbFINMolClearClick(Sender: TObject);
begin
  ClearControls([edtFinMolCode, edtFinMolName]);
end;

procedure TfrmENMetrologyPlansEdit.btnCreateWorkOrdersClick(
  Sender: TObject);
var selected, state, workOrderExists, finMolDataExists: Boolean;
    i, planCode, wo2planCode: Integer;
    planObj: ENPlanWork;

    TempENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWorkControllerSoapPort;
    ENWorkOrder2ENPlanWorkObj: ENWorkOrder2ENPlanWork;
    wo2planFilter: ENWorkOrder2ENPlanWorkFilter;
    wo2planList: ENWorkOrder2ENPlanWorkShortList;

    f: FINMOLDataFilter;
    TempFINMolData: FINMolDataControllerSoapPort;
    FINMolDataList: FINMolDataShortList;
    FINMolDataObj: FINMolData;
begin
{
    Application.MessageBox(PChar('Тимчасово створюйте НАРЯДИ з Планів ...'),
                           PChar('Увага!'), MB_ICONWARNING);
    //edtFinMolCode.SetFocus;
    Exit;
}

  if (edtFinMolCode.Text = '') or (edtFinMolName.Text = '') then
  begin
    Application.MessageBox(PChar('Спочатку вкажіть матеріально відповідальну особу (майстра)!'),
                           PChar('Увага!'), MB_ICONWARNING);
    edtFinMolCode.SetFocus;
    Exit;
  end;

  selected := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбран ни один план
  begin
    Application.MessageBox(PChar('Необхідно вибрати плани, для яких потрібно створити наряд-завдання!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  state := false;

  TempENWorkOrder2ENPlanWork := HTTPRIOENWorkOrder2ENPlanWork as ENWorkOrder2ENPlanWorkControllerSoapPort;
  TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, state);

    if state then
    begin
      try
        planCode := StrToInt(sgENPlanWork.Cells[0, i]);
      except
        on EConvertError do Continue;
      end;

      planObj := DMReports.getPlanByCode(planCode);
      if planObj = nil then Continue;

      if planObj.kind.code <> ENPLANWORKKIND_NPZ then
      begin
        Application.MessageBox(PChar('Наряд-завдання можливо створити тільки для Завдань-Планів!' + #13#10 +
                                     IntToStr(planCode) + ' - це Завдання-Факт!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Continue;
      end;

      if planObj.status.code <> ENPLANWORKSTATUS_GOOD then
      begin
        Application.MessageBox(PChar('Завдання-План з кодом ' + IntToStr(planCode) + ' вже затверджено!' + #13#10 +
                                     'Наряд-завдання для нього не буде створено!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Continue;
      end;

      //////////////////////////////////////////////////////////////////////////
      ///// ПЕРЕД СОЗДАНИЕМ НАРЯД-ЗАДАНИЯ ПРОВЕРЯЕМ, НЕТ ЛИ ЕГО ЕЩЕ НА ПЛАНЕ.
      ///// ЕСЛИ ЕЩЕ НЕТ - ВЫЗЫВАЕМ add, ИНАЧЕ save
      workOrderExists := false;

      wo2planFilter := ENWorkOrder2ENPlanWorkFilter.Create;
      SetNullIntProps(wo2planFilter);
      SetNullXSProps(wo2planFilter);

      wo2planFilter.plan := ENPlanWork.Create;
      SetNullIntProps(wo2planFilter.plan);
      SetNullXSProps(wo2planFilter.plan);

      wo2planFilter.plan.code := planCode;
      wo2planList := TempENWorkOrder2ENPlanWork.getScrollableFilteredList(wo2planFilter, 0, -1);

      if wo2planList <> nil then
        if High(wo2planList.list) > -1 then
        begin
          ENWorkOrder2ENPlanWorkObj := TempENWorkOrder2ENPlanWork.getObject(wo2planList.list[0].code);
          if ENWorkOrder2ENPlanWorkObj <> nil then
          begin
            if ENWorkOrder2ENPlanWorkObj.workOrder = nil then // такого теоретически никогда быть не может, но....... ;-)
            begin
              ENWorkOrder2ENPlanWorkObj.workOrder := ENWorkOrder.Create;
              ENWorkOrder2ENPlanWorkObj.workOrder.code := wo2planList.list[0].code; //LOW_INT;

              if planObj.departmentRef <> nil then
              begin
                ENWorkOrder2ENPlanWorkObj.workOrder.department := ENDepartment.Create;
                ENWorkOrder2ENPlanWorkObj.workOrder.department.code := planObj.departmentRef.code;
              end;

              ENWorkOrder2ENPlanWorkObj.workOrder.dateGen := TXSDate.Create;
              ENWorkOrder2ENPlanWorkObj.workOrder.dateGen.XSToNative(GetXSDate(EncodeDate(planObj.dateStart.Year,
                                                                                          planObj.dateStart.Month,
                                                                                          planObj.dateStart.Day)));
            end;
            ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := edtFinMolCode.Text;
            ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := edtFinMolName.Text;
            //ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicCode := edtFinMolCode.Text;
            //ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicName := edtFinMolName.Text;

            TempENWorkOrder2ENPlanWork.save(ENWorkOrder2ENPlanWorkObj);

            wo2planCode := ENWorkOrder2ENPlanWorkObj.code;
          end;

          workOrderExists := true;
        end;

      if not workOrderExists then // Если наряд не найден, создаем его
      begin
        ENWorkOrder2ENPlanWorkObj := ENWorkOrder2ENPlanWork.Create;
        ENWorkOrder2ENPlanWorkObj.code := LOW_INT;
        ENWorkOrder2ENPlanWorkObj.plan := ENPlanWork.Create;
        ENWorkOrder2ENPlanWorkObj.plan.code := planCode;
        ENWorkOrder2ENPlanWorkObj.workOrder := ENWorkOrder.Create;
        ENWorkOrder2ENPlanWorkObj.workOrder.code := LOW_INT;

        if planObj.departmentRef <> nil then
        begin
          ENWorkOrder2ENPlanWorkObj.workOrder.department := ENDepartment.Create;
          ENWorkOrder2ENPlanWorkObj.workOrder.department.code := planObj.departmentRef.code;
        end;

        ENWorkOrder2ENPlanWorkObj.workOrder.dateGen := TXSDate.Create;
        ENWorkOrder2ENPlanWorkObj.workOrder.dateGen.XSToNative(GetXSDate(EncodeDate(planObj.dateStart.Year,
                                                                                    planObj.dateStart.Month,
                                                                                    planObj.dateStart.Day)));

        //ENWorkOrder2ENPlanWorkObj.workOrder.commentGen := edtWorkOrderCommentGen.Text;

        ENWorkOrder2ENPlanWorkObj.workOrder.finMolCode := edtFinMolCode.Text;
        ENWorkOrder2ENPlanWorkObj.workOrder.finMolName := edtFinMolName.Text;
        //ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicCode := edtFinMolCode.Text;
        //ENWorkOrder2ENPlanWorkObj.workOrder.finMechanicName := edtFinMolName.Text;

        //wo2planCode := TempENWorkOrder2ENPlanWork.add(ENWorkOrder2ENPlanWorkObj);
        wo2planCode := TempENWorkOrder2ENPlanWork.addWithCheck(ENWorkOrder2ENPlanWorkObj,false);{SUPP-104240}
      end;
      //////////////////////////////////////////////////////////////////////////

      //// ДОБАВЛЕНИЕ МОЛа (ИЛИ ИЗМЕНЕНИЕ, ЕСЛИ ОН УЖЕ ЕСТЬ) В НАРЯД ///////////
      // На всякий случай перечитаем
      ENWorkOrder2ENPlanWorkObj := TempENWorkOrder2ENPlanWork.getObject(wo2planCode);

      if ENWorkOrder2ENPlanWorkObj = nil then
      begin
        Application.MessageBox(PChar('Помилка при формуванні наряд-завдання <ENWorkOrder2ENPlanWorkObj>!'),
                               PChar('Увага!'), MB_ICONERROR);
        Exit;
      end;

      if ENWorkOrder2ENPlanWorkObj.workOrder = nil then
      begin
        Application.MessageBox(PChar('Помилка при формуванні наряд-завдання <ENWorkOrder2ENPlanWorkObj.workOrder>!'),
                               PChar('Увага!'), MB_ICONERROR);
        Exit;
      end;

      if ENWorkOrder2ENPlanWorkObj.workOrder.code = LOW_INT then
      begin
        Application.MessageBox(PChar('Помилка при формуванні наряд-завдання <ENWorkOrder2ENPlanWorkObj.workOrder.code>!'),
                               PChar('Увага!'), MB_ICONERROR);
        Exit;
      end;

      // Проверяем, есть ли уже МОЛ на наряде
      f := FINMOLDataFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

      f.workOrder := ENWorkOrder.Create;
      f.workOrder.code := ENWorkOrder2ENPlanWorkObj.workOrder.code;
      FINMolDataList := TempFINMolData.getScrollableFilteredList(f, 0, -1);

      finMolDataExists := false;
      
      if FINMolDataList <> nil then
        if High(FINMolDataList.list) > -1 then
          if FINMolDataList.list[0] <> nil then
          begin
            finMolDataExists := true;

            FINMolDataObj := TempFINMolData.getObject(FINMolDataList.list[0].code);
            if FINMolDataObj = nil then // Ну мало ли что?? ;)
            begin
              Application.MessageBox(PChar('Помилка при формуванні наряд-завдання <FINMolDataObj>!'),
                                     PChar('Увага!'), MB_ICONERROR);
              Exit;
            end;

            FINMolDataObj.finMolCode := edtFinMolCode.Text;
            FINMolDataObj.finMolName := edtFinMolName.Text;

            TempFINMolData.save(FINMolDataObj, ENWorkOrder2ENPlanWorkObj.workOrder.code, 1);
          end;

      if not finMolDataExists then
      begin
        FINMolDataObj := FINMolData.Create;
        FINMolDataObj.code := LOW_INT;
        
        FINMolDataObj.workOrder := ENWorkOrder.Create;
        FINMolDataObj.workOrder.code := ENWorkOrder2ENPlanWorkObj.workOrder.code;

        FINMolDataObj.molTypeRef := FINMolTypeRef.Create;
        FINMolDataObj.molTypeRef.code := FINMOLTYPE_MASTER;

        FINMolDataObj.finMolCode := edtFinMolCode.Text;
        FINMolDataObj.finMolName := edtFinMolName.Text;

        TempFINMolData.add(FINMolDataObj, ENWorkOrder2ENPlanWorkObj.workOrder.code, 1);
      end;
      //////////////////////////////////////////////////////////////////////////
    end;

  end;

  Application.MessageBox(PChar('Створення наряд-завдань завершено!'),
                         PChar('Повідомлення'), MB_ICONINFORMATION);
  actUpdateExecute(Sender);
end;

procedure TfrmENMetrologyPlansEdit.btnMaterialsBindingClick(Sender: TObject);
var tmpPlanCodes: String;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i: Integer;
begin
  frmFINMaterialsDataEdit:= TfrmFINMaterialsDataEdit.Create(Application, dsInsert);
  try
    frmFINMaterialsDataEdit.planCode := LOW_INT;
    frmFINMaterialsDataEdit.estimateItemKind := ENESTIMATEITEMKIND_MATERIALS;
    frmFINMaterialsDataEdit.estimateCode := LOW_INT;

    if planCodes = '' then
    begin
      if planFilterObj <> nil then
      begin
        TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
        ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilterObj, 0, -1);
        tmpPlanCodes := '';
        if ENPlanWorkList <> nil then
          for i := 0 to High(ENPlanWorkList.list) do
            AddListPos(tmpPlanCodes, IntToStr(ENPlanWorkList.list[i].code));

        if tmpPlanCodes <> '' then
          frmFINMaterialsDataEdit.planCodes := tmpPlanCodes
        else begin
          Application.MessageBox(PChar('Перелік планів не має бути порожнім!'),
                                 PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;
      end
      else begin
        Application.MessageBox(PChar('Перелік планів не має бути порожнім!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end
    else
      frmFINMaterialsDataEdit.planCodes := planCodes;

    if frmFINMaterialsDataEdit.ShowModal = mrOk then
    begin
    end;
  finally
    frmFINMaterialsDataEdit.Free;
  end;
end;

procedure TfrmENMetrologyPlansEdit.actFilterExecute(Sender: TObject);
var condition: String;
begin
  frmENPlanWorkFilterEdit:=TfrmENPlanWorkFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
    SetNullIntProps(ENPlanWorkFilterObj);
    SetNullXSProps(ENPlanWorkFilterObj);

    with frmENPlanWorkFilterEdit do
    begin
      HideControls([lblElementType, cbElementType,
                    //lblENPlanWorkKindKindName, cbPlanWorkKind,
                    lblENBudgetName, edtENBudgetName, spbENBudget]);

      if isForWriteOff then
      begin
        typeCode := ENPLANWORKTYPE_WRITING_OFF;
        typeName := 'Списання матеріалів';

        stateCode := ENPLANWORKSTATE_MATERIALS_TMC;
        stateName := 'Списання використаних матеріальних цінностей';

        isFilter_ := true;
      end;
    end;

    if frmENPlanWorkFilterEdit.ShowModal = mrOk then
    begin
      condition := ENPlanWorkFilterObj.conditionSQL;
      AddCondition(condition, '(enplanwork.elementrefcode in (select e.code from enelement e where e.typerefcode = ' +
                              IntToStr(EN_METROLOGY_COUNTER) + '))');
      AddCondition(condition, '(enplanwork.kindcode in (3, 4))');
      //AddCondition(condition, '(enplanwork.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) + ')');
      AddCondition(condition, '(enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')');

      // сохраним condition в глобальной переменной
      planFilterCondition := condition;

      ///// NET-4392 Доп. условие по счету
      if cbAccount.ItemIndex > 0 then
        AddCondition(condition,
                     '(select mc.account ' +
                     '   from enmetrologycounter mc ' +
                     '  where mc.elementcode = ENPLANWORK.elementrefcode) = ''' + Trim(cbAccount.Text) + '''')
      else if isForWriteOff then // 22.02.2018 NET-4561 Для списания пломб при проведении экспертизы счетчиков
        AddCondition(condition,
                     '(select mc.account ' +
                     '   from enmetrologycounter mc ' +
                     '  where mc.elementcode = ENPLANWORK.elementrefcode) in (''1127'', ''0732'')');
      /////

      ENPlanWorkFilterObj.conditionSQL := condition;
      // Самые свежие планы - первыми (Метрология хотела такое)
      ENPlanWorkFilterObj.orderBySQL := 'yeargen desc, monthgen desc, datestart desc, enplanwork.code desc';

      planFilterObj := ENPlanWorkFilter.Create;
      planFilterObj := ENPlanWorkFilterObj;
      //actUpdateExecute(Sender);
    end;

    ENPlanWorkFilterObj := nil;
  finally
    frmENPlanWorkFilterEdit.Free;
    frmENPlanWorkFilterEdit:=nil;
  end;

  FormShow(Sender);
end;

procedure TfrmENMetrologyPlansEdit.btnActClick(Sender: TObject);
var selected, state: Boolean;
    i, plansType, planCode, kindCode, statusCode, actCode, {tmpActCode,}
    tmpStateCode, tmpTypeCode, tmpElementInCode, selectedActCode: Integer;

    planObj: ENPlanWork;
    tmpPlanCodes, tmpFinMolCode{, tmpFinMechanicCode}, tmpAccount: String;
    {tmpMaxDate}actDate, tmpDate: TDate;

    TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
    Act2PlanFilter: ENAct2ENPlanWorkFilter;
    Act2PlanList: ENAct2ENPlanWorkShortList;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    planFilter: ENPlanWorkFilter;
    planList: ENPlanWorkShortList;

    {TempENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWorkControllerSoapPort;
    workOrder2planFilter: ENWorkOrder2ENPlanWorkFilter;
    workOrder2planList: ENWorkOrder2ENPlanWorkShortList;}

    TempENWorkOrder: ENWorkOrderControllerSoapPort;
    workOrderFilter: ENWorkOrderFilter;
    workOrderList: ENWorkOrderShortList;

    TempENElement: ENElementControllerSoapPort;
    elementFilter: ENElementFilter;
    elementList: ENElementShortList;

    //--------------------------------------------------------------------------
    TempENAct: ENActControllerSoapPort;
    ENActList: ENActShortList;
    f : ENActFilter;
    frmENActShow : TfrmENActShow;
    ActObj: ENAct;

    //ENAct2ENPlanWorkObj : ENAct2ENPlanWork;
    a2 : ENAct2ENPlanWork;

    a2Filter : ENAct2ENPlanWorkFilter;
    a2List: ENAct2ENPlanWorkShortList;
    //plansType, {ElementTypeCode, }ElementInCode : Integer;
    //element: ENElement;
    //--------------------------------------------------------------------------
begin
  selected := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбран ни один план
  begin
    Application.MessageBox(PChar('Необхідно вибрати Завдання-Факти, які потрібно включити до акту!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  state := false;

  tmpPlanCodes := '';

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, state);

    kindCode   := LOW_INT;
    statusCode := LOW_INT;

    if state then
    begin
      try
        planCode := StrToInt(sgENPlanWork.Cells[0, i]);
      except
        on EConvertError do Continue;
      end;

      {
      planObj := DMReports.getPlanByCode(planCode);
      if planObj = nil then Continue;
      if planObj.code = LOW_INT then Continue;

      if planObj.kind.code <> ENPLANWORKKIND_FACT then Continue;
      //if planObj.
      }
      
      kindCode   := Integer(sgENPlanWork.Objects[1, i]);
      statusCode := Integer(sgENPlanWork.Objects[2, i]);

      if (kindCode = ENPLANWORKKIND_FACT) and (statusCode = ENPLANWORKSTATUS_GOOD) then
        AddListPos(tmpPlanCodes, IntToStr(planCode))
      else
      begin
        Application.MessageBox(PChar('Для включення до акту необхідно вибирати тільки Завдання-Факти зі статусом "Чорновий"!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;

    end; // if state

  end; // for i := 1 to sgENPlanWork.RowCount - 1

  //ShowMessage(tmpPlanCodes);

  if tmpPlanCodes = '' then
  begin
    Application.MessageBox(PChar('Для включення до акту необхідно вибирати тільки Завдання-Факти зі статусом "Чорновий"!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  tmpStateCode := LOW_INT;
  tmpTypeCode  := LOW_INT;
  //tmpActCode   := LOW_INT;
  tmpElementInCode := LOW_INT;
  tmpFinMolCode := '';
  //tmpFinMechanicCode := '';
  tmpAccount := '';

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);
  planFilter.conditionSQL := 'enplanwork.code in (' + tmpPlanCodes + ')';

  //planList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
  planList := TempENPlanWork.getScrollableFilteredListForMetrologyCounters(planFilter, 0, -1);

  if planList = nil then
  begin
    Application.MessageBox(PChar('Помилка при отриманні переліку планів!'),
                           PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;
  if High(planList.list) < 0 then
  begin
    Application.MessageBox(PChar('Помилка при отриманні переліку планів!'),
                           PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;
  if planList.list[0] = nil then
  begin
    Application.MessageBox(PChar('Помилка при отриманні переліку планів!'),
                           PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;

  /// Проверки на совпадение атрибутов выбранных Заданий-Фактов ////////////////
  tmpStateCode := planList.list[0].stateRefCode;
  for i := 0 to High(planList.list) do
  begin
    if tmpStateCode <> planList.list[i].stateRefCode then
    begin
      Application.MessageBox(PChar('Вибрані Завдання-Факти мають різний тип робіт!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  tmpTypeCode := planList.list[0].typeRefCode;
  for i := 0 to High(planList.list) do
  begin
    if tmpTypeCode <> planList.list[i].typeRefCode then
    begin
      Application.MessageBox(PChar('Вибрані Завдання-Факти мають різний вид робіт!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;

  elementFilter := ENElementFilter.Create;
  SetNullIntProps(elementFilter);
  SetNullXSProps(elementFilter);

  elementFilter.conditionSQL := 'enelement.code in ' +
    '(select p.elementrefcode from enplanwork p where p.code in (' + tmpPlanCodes + '))';

  elementList := TempENElement.getScrollableFilteredList(elementFilter, 0, -1);
  
  if elementList = nil then
  begin
    Application.MessageBox(PChar('Помилка при отриманні переліку елементів!'),
                           PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;
  if High(elementList.list) < 0 then
  begin
    Application.MessageBox(PChar('Помилка при отриманні переліку елементів!'),
                           PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;
  if elementList.list[0] = nil then
  begin
    Application.MessageBox(PChar('Помилка при отриманні переліку елементів!'),
                           PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;

  tmpElementInCode := elementList.list[0].elementInRefCode;

  if tmpElementInCode = LOW_INT then
  begin
    Application.MessageBox(PChar('Для лічильника ' + elementList.list[0].objectName +
                                 ' (інв. №' + elementList.list[0].objectInvNumber + ')' +
                                 ' не вказано тип!'),
                           PChar('Помилка!'), MB_ICONERROR);
    Exit;
  end;

  for i := 0 to High(elementList.list) do
  begin
    if (tmpElementInCode <> elementList.list[i].elementInRefCode) then
    begin
      Application.MessageBox(PChar('Вибрані лічильники мають різні типи!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  TempENWorkOrder := HTTPRIOENWorkOrder as ENWorkOrderControllerSoapPort;

  workOrderFilter := ENWorkOrderFilter.Create;
  SetNullIntProps(workOrderFilter);
  SetNullXSProps(workOrderFilter);

  //workOrderFilter.conditionSQL := 'enworkorder2enplanwork.plancode in (' + tmpPlanCodes + ')';
  workOrderFilter.conditionSQL := 'enworkorder.code in ' +
    '(select w2p.workordercode from enworkorder2enplanwork w2p where w2p.plancode in (' + tmpPlanCodes + '))';

  workOrderList := TempENWorkOrder.getScrollableFilteredList(workOrderFilter, 0, -1);
  if workOrderList = nil then Exit;
  if High(workOrderList.list) < 0 then Exit;

  tmpFinMolCode := workOrderList.list[0].finMolCode;
  //tmpFinMechanicCode := workOrderList.list[0].finMechanicCode;

  for i := 0 to High(workOrderList.list) do
  begin
    if (tmpFinMolCode <> workOrderList.list[i].finMolCode) {or
       (tmpFinMechanicCode <> workOrderList.list[i].finMechanicCode)} then
    begin
      Application.MessageBox(PChar('Вибрані Завдання-Факти мають наряди з різними матеріально-відповідальними особами!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  // 26.08.14 NET-4392 Для актов дефектации счетчиков проверяем счетчики на совпадение бух. счетов
  if tmpStateCode = ENPLANWORKSTATE_COUNTERS_ACT_DEFECT then
  begin
    tmpAccount := planList.list[0].actInfo;

    // Для актов дефектации счетчики можно брать только со счетов 1126 и 2096
    if (tmpAccount <> '1126') and (tmpAccount <> '2096') then
    begin
      Application.MessageBox(PChar('Для актів дефектації лічильники можливо обирати тільки з рахунків 1126 та 2096!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    for i := 0 to High(planList.list) do
    begin
      if tmpAccount <> planList.list[i].actInfo then
      begin
        Application.MessageBox(PChar('Вибрані лічильники мають різний бух. рахунок!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;
  end;

  //////////////////////////////////////////////////////////////////////////////

  ///// ------------------------------------------------------------------------

  TempENAct2ENPlanWork := HTTPRIOENAct2ENPlanWork as ENAct2ENPlanWorkControllerSoapPort;
  
(*
  Act2PlanFilter := ENAct2ENPlanWorkFilter.Create;
  SetNullIntProps(Act2PlanFilter);
  SetNullXSProps(Act2PlanFilter);

  Act2PlanFilter.conditionSQL := 'enact2enplanwork.plancode in (' + tmpPlanCodes + ')';

  Act2PlanList := TempENAct2ENPlanWork.getScrollableFilteredList(Act2PlanFilter, 0, -1);

  //if Act2PlanList = nil then Exit;
  //if High(Act2PlanList.list) < 0 then Exit;

  if Act2PlanList <> nil then
    if High(Act2PlanList.list) >= 0 then
    begin
      if Act2PlanList.list[0] = nil then
      begin
        Application.MessageBox(PChar('Помилка в зв''язку фактів з актом!'),
                               PChar('Помилка!'), MB_ICONERROR);
        Exit;
      end;

      if Act2PlanList.list[0].actRefCode = LOW_INT then
      begin
        Application.MessageBox(PChar('Помилка в зв''язку фактів з актом!'),
                               PChar('Помилка!'), MB_ICONERROR);
        Exit;
      end;

      {
      tmpActCode := Act2PlanList.list[0].actRefCode;

      for i := 0 to High(Act2PlanList.list) do
      begin
        if tmpActCode <> Act2PlanList.list[i].actRefCode then
        begin
          Application.MessageBox(PChar('Вибрані Завдання-Факти вже включені до РІЗНИХ актів! Перегляньте ці Завдання-Факти!'),
                                 PChar('Увага!'), MB_ICONWARNING);

          /// Ну и что, что они в разных актах... главное, чтоб все осн. реквизиты совпадали
          /// (типы работ, МОЛы и т.д.). Может, пользователь хочет перекинуть 2 наряда из
          /// 2-х разных актов в третий. Надо давать ему такую возможность...

          Exit;
        end;
      end;
      }
    end; // if High(Act2PlanList.list) >= 0
*)    

  // Определяем максимальную дату наряда из всех выбранных фактов, чтобы добавить условие в фильтр по актам
  { это сделаем в запросе !!!
  tmpMaxDate := EncodeDate(planList.list[0].dateStart.Year, planList.list[0].dateStart.Month, planList.list[0].dateStart.Day);
  for i := 0 to High(planList.list) do
  begin
    tmpDate := EncodeDate(planList.list[i].dateStart.Year,
                          planList.list[i].dateStart.Month,
                          planList.list[i].dateStart.Day);
    if tmpDate > tmpMaxDate then
      tmpMaxDate := tmpDate;
  end;

  ShowMessage(DateToStr(tmpMaxDate));
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  f := ENActFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

{
  if tmpActCode > LOW_INT then
  begin
    f.code := tmpActCode;
  end
  else begin
}
    f.element := ENElement.Create;
    f.element.code := tmpElementInCode;

    f.statusRef := ENActStatusRef.Create;
    f.statusRef.code := ENACT_GOOD;

    // ограничим по ДАТЕ !!! выполнения и АКТА !!!

    f.conditionSQL := //' enact.finmolcode = ' + tmpFinMolCode +
                      //' and enact.finmechaniccode = ' + tmpFinMolCode +

                      '((enact.finmolcode is null) or (enact.finmolcode in (' +

                      ' select finmoldata.finmolcode from ' +
                      '   FINMOLDATA, ' +
                      '   enworkorder2enplanwork ' +
                      '   where  ' +
                      '    enworkorder2enplanwork.workordercode = FINMOLDATA.workordercode ' +
                      '   and enworkorder2enplanwork.plancode in (' + tmpPlanCodes + ')' +
                      '   and finmoldata.moltyperefcode = '+ IntToStr(FINMOLTYPE_MASTER) + ')))' +

                      ' and enact.dategen >= ' +
                      '  (select max(enworkorder.dategen) from enworkorder, enworkorder2enplanwork ' +
                      '   where enworkorder2enplanwork.workordercode = enworkorder.code ' +
                      '     and enworkorder2enplanwork.plancode in (' + tmpPlanCodes + '))';
//  end;

   f.actTypeRef := ENPlanWorkStateRef.Create;
   f.actTypeRef.code := planList.list[0].stateRefCode;

   frmENActShow:=TfrmENActShow.Create(Application, fmNormal, f);
   try
      frmENActShow.planCode := planList.list[0].code;
      frmENActShow.isFiltered := true;

      if planList.list[0].stateRefCode > LOW_INT then
      begin
        frmENActShow.planStateCode := planList.list[0].stateRefCode;
        frmENActShow.planStateName := planList.list[0].stateRefName;
      end;

      with frmENActShow do
      begin
        DisableActions([actEdit, actDelete, actFilter, actNoFilter]);
        if ShowModal = mrOk then
        begin
          try
            selectedActCode := StrToInt(GetReturnValue(sgENAct, 0));
          except
            on EConvertError do
            begin
              Application.MessageBox(PChar('Не вдалося отримати код акту! Оберіть акт знову!'),
                                     PChar('Помилка!'), MB_ICONERROR);
              //edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
              Exit;
            end;
          end;

          TempENAct := Self.HTTPRIOENAct as ENActControllerSoapPort;
          ActObj := TempENAct.getObject(selectedActCode);

          if ActObj = nil then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;

          if ActObj.code = LOW_INT then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;

          if ActObj.element = nil then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;
          if ActObj.element.code = LOW_INT then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;

          if ActObj.actTypeRef = nil then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;
          if ActObj.actTypeRef.code = LOW_INT then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;

          if ActObj.statusRef = nil then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;
          if ActObj.statusRef.code = LOW_INT then
          begin
            Application.MessageBox(PChar('Помилка при виборі акту!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;

          if ActObj.dateGen = nil then
          begin
            Application.MessageBox(PChar('У вибраного акта не встановлена дата!'),
                                   PChar('Помилка!'), MB_ICONERROR);
            Exit;
          end;

          //////////////////////////////////////////////////////////////////////
          // Теперь после выбора акта проверяем, чтобы все его параметры нам подходили
          if ActObj.element.code <> tmpElementInCode then
          begin
            Application.MessageBox(PChar('Тип лічильника в обраному акті не співпадає з типом обраних лічильників!' + #13#10 +
                                         'Оберіть інший акт!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;

          if ActObj.actTypeRef.code <> tmpStateCode then
          begin
            Application.MessageBox(PChar('Тип обраного акту не співпадає з типом робіт в обраних Завданнях-Фактах!' + #13#10 +
                                         'Оберіть інший акт!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;

          if ActObj.finMolCode <> tmpFinMolCode then
          begin
            Application.MessageBox(PChar('Майстер у вибраному акті не співпадає з майстром в обраних Завданнях-Фактах!' + #13#10 +
                                         'Оберіть інший акт!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;

          {if ActObj.finMechanicCode <> tmpFinMechanicCode then
          begin
            Application.MessageBox(PChar('Механік у вибраному акті не співпадає з механіком в обраних Завданнях-Фактах!' + #13#10 +
                                         'Оберіть інший акт!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;}

          if ActObj.statusRef.code <> ENACT_GOOD then
          begin
            Application.MessageBox(PChar('Акт повинен мати статус "Чорновий"!' + #13#10 +
                                         'Оберіть інший акт!'),
                                   PChar('Увага!'), MB_ICONWARNING);
            Exit;
          end;

          // Проверим, чтобы дата акта была >= даты любого из включаемых в него нарядов
          actDate := EncodeDate(ActObj.dateGen.Year, ActObj.dateGen.Month, ActObj.dateGen.Day);
          for i := 0 to High(workOrderList.list) do
          begin
            tmpDate := EncodeDate(workOrderList.list[i].dateGen.Year,
                                  workOrderList.list[i].dateGen.Month,
                                  workOrderList.list[i].dateGen.Day);
            if tmpDate > actDate then
            begin
              Application.MessageBox(PChar('В акт можливо включити тільки Завдання-Факти з датою, меншою, ніж дата акта (або з такою ж)!' + #13#10 +
                                           'Оберіть інший акт або зменіть дату у обраного акту!'),
                                     PChar('Увага!'), MB_ICONWARNING);
              Exit;
            end;
          end;
          //////////////////////////////////////////////////////////////////////


          //********************************************************************
          // Поехали закидывать факты (наряды) в Акт
          for i := 0 to High(planList.list) do
          begin
            actCode := LOW_INT;

            a2Filter := ENAct2ENPlanWorkFilter.Create;
            SetNullIntProps(a2Filter);
            SetNullXSProps(a2Filter);

            a2Filter.plan := ENPlanWork.Create;
            a2Filter.plan.code := planList.list[i].code;

            a2List := TempENAct2ENPlanWork.getScrollableFilteredList(a2Filter, 0, -1);
            if a2List.totalCount > 0 then
            begin
              actCode := a2List.list[0].actRefCode; //ENAct2ENPlanWorkList.list[0].code;
              //edtENActNumber.Text := ENAct2ENPlanWorkList.list[0].actRefNumberGen + ' ' + ENAct2ENPlanWorkList.list[0].actRefFinMolName;
            end
            else begin
              actCode := LOW_INT;
              //edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
            end;


            if (actCode = LOW_INT) then
            begin
              a2:=ENAct2ENPlanWork.Create;
              a2.actRef := ENActRef.Create;
              a2.plan := ENPlanWork.Create;

              a2.code := LOW_INT;
              a2.plan.code := planList.list[i].code; {*******************} //ENPlanWorkObj.code;
            end
            else begin
              {
              if actCode <> tmpActCode then
              begin
                Application.MessageBox(PChar('Завдання-Факт для інв. №' + planList.list[i].invNumber +
                                             ' (код ' + IntToStr(planList.list[i].code) + ') вже включено до акту №' +
                                             a2List.list[0].actRefNumberGen +
                                             ' (код ' + IntToStr(actCode) + ')!' + #13#10 +
                                             'Оберіть інший акт!'),
                                       PChar('Увага!'), MB_ICONWARNING);
                Exit;
              end;
              }
              
              a2Filter := ENAct2ENPlanWorkFilter.Create();
              SetNullIntProps(a2Filter);
              SetNullXSProps(a2Filter);

              a2Filter.actRef := ENActRef.Create;
              a2Filter.actRef.code := actCode;
              a2Filter.plan := ENPlanWork.Create;
              a2Filter.plan.code := planList.list[i].code; {*******************} //ENPlanWorkObj.code;

              a2List := TempENAct2ENPlanWork.getScrollableFilteredList(a2Filter, 0, -1);
              if (a2List.totalCount = 1) then
              begin
                a2 :=  TempENAct2ENPlanWork.getObject( a2List.list[0].code );
              end
              else begin
                Application.MessageBox(PChar('Помилка з кількістю актів, до яких включено Завдання-ФАКТ!!!'),
                                       PChar('Помилка!'), MB_ICONERROR);
                Exit;
              end;
            end;

            a2.actRef.code := selectedActCode;
            //edtENActNumber.Text := GetReturnValue(sgENAct,1) + ' ' + GetReturnValue(sgENAct,3);

            // проверим типы-виды планов которые, ВОЗМОЖНО, висят на этом акте
            plansType := DMReports.getPlanTypeByActCode(selectedActCode);
            if (plansType > -1) and (plansType <> planList.list[i].typeRefCode) then
            begin
              Application.MessageBox(PChar('Відрізняються ВИДИ робіт!'),
                                     PChar('Помилка!'), MB_ICONWARNING);
              //edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
              Exit;
            end;

            try
              if (a2.code = LOW_INT) then
                a2.code := TempENAct2ENPlanWork.add(a2, 1)
              else
              begin
                //TempENAct2ENPlanWork.save(a2);
                ShowMessage('Так делать нельзя ...');
              end;

              //actCode := a2.actRef.code; //ENAct2ENPlanWorkObj.code;

            except
              Application.MessageBox(PChar('Не вдалося зв''язати акт з планом!!! Оберіть акт знову ...'),
                                      PChar('Помилка!'), MB_ICONERROR);
              //edtENActNumber.Text := 'НЕ ВЫБРАНО !!!';
              raise;
              Exit;
            end;

          end; // for i := 0 to High(planList.list)

          //********************************************************************

        end // if ShowModal = mrOk
        else
          Exit;
      end; // with frmENActShow

   finally
     frmENActShow.Free;
   end;

  Application.MessageBox(PChar('Включення Завдань-Фактів до акту завершено!'),
                         PChar('Повідомлення'), MB_ICONINFORMATION);
  actUpdateExecute(Sender);
end;

procedure TfrmENMetrologyPlansEdit.ChangeFinWorker(planItemCode: Integer);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemObj: ENPlanWorkItem;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    humenFilter: ENHumenItemFilter;
    humenList: ENHumenItemShortList;
    humenObj: ENHumenItem;
begin
  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
  
  //////////////////////////////////////////////////////////////////////
  ENPlanWorkItemObj := TempENPlanWorkItem.getObject(planItemCode);
  if ENPlanWorkItemObj <> nil then
    if ENPlanWorkItemObj.code > LOW_INT then
    begin
      humenFilter := ENHumenItemFilter.Create;
      SetNullIntProps(humenFilter);
      SetNullXSProps(humenFilter);

      humenFilter.planItemRef := ENPlanWorkItemRef.Create;
      humenFilter.planItemRef.code := ENPlanWorkItemObj.code;

      humenList := TempENHumenItem.getScrollableFilteredList(humenFilter, 0, -1);
      if humenList <> nil then
        if High(humenList.list) = 0 then // Если 1 нормативный работник
          if humenList.list[0] <> nil then
          begin
            humenObj := TempENHumenItem.getObject(humenList.list[0].code);
            if humenObj <> nil then
            begin
              humenObj.finWorker := FINWorker.Create;
              if finWorkerObj <> nil then
              begin
                humenObj.finWorker.code := LOW_INT;
                humenObj.finWorker.name := finWorkerObj.name;
                humenObj.finWorker.tabNumber := finWorkerObj.tabNumber;
                humenObj.finWorker.positionName := finWorkerObj.positionName;
                humenObj.finWorker.positionCode := finWorkerObj.positionCode;
                humenObj.finWorker.departmentName := finWorkerObj.departmentName;
                humenObj.finWorker.departmentCode := finWorkerObj.departmentCode;

                if finWorkerObj.priceGen <> nil then
                begin
                  humenObj.finWorker.priceGen := TXSDecimal.Create;
                  humenObj.finWorker.priceGen.DecimalString := finWorkerObj.priceGen.DecimalString;
                end;

                if finWorkerObj.kindRef <> nil then
                begin
                  humenObj.finWorker.kindRef := FINWorkerKindRef.Create;
                  humenObj.finWorker.kindRef.code := finWorkerObj.kindRef.code;
                end;

                humenObj.finWorker.categor := finWorkerObj.categor;
                humenObj.finWorker.finCode := finWorkerObj.finCode;
                humenObj.finWorker.isSentAssignment := 0;

                //26.02.2015
                humenObj.finWorker.categorId := finWorkerObj.categorId;
                humenObj.finWorker.categorName := finWorkerObj.categorName;
                humenObj.finWorker.workTimeId := finWorkerObj.workTimeId;

                humenObj.finWorker.positionId := finWorkerObj.positionId;

              end;
              TempENHumenItem.save(humenObj);
            end; // if humenObj <> nil
          end; // if humenList.list[0] <> nil
    end; // if ENPlanWorkItemObj.code > LOW_INT
  //////////////////////////////////////////////////////////////////////
end;

end.
