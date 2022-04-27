unit EditENPurchasesBinding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmENPurchasesBindingEdit = class(TDialogForm)
    lblEnPlan: TLabel;
    edtParentPlan: TEdit;
    spbParentPlan: TSpeedButton;
    spbParentPlanClear: TSpeedButton;
    sgENPlanWork: TAdvStringGrid;
    HTTPRIOENPlanWork: THTTPRIO;
    btnBind: TButton;
    procedure spbParentPlanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure spbParentPlanClearClick(Sender: TObject);
    procedure btnBindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    parentPlanCode: Integer;
  end;

var
  frmENPurchasesBindingEdit: TfrmENPurchasesBindingEdit;

implementation

uses ENConsts, ENPlanWorkController, ShowENPlanWork,
  ENPlanWorkKindController, ChildFormUnit, ENPlanWorkTypeController,
  ENPlanWorkStateController, ENDepartmentController, GridHeadersUnit;

{$R *.dfm}

const
  ENPlanWorkHeaders: array [1..17] of String =
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
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

procedure TfrmENPurchasesBindingEdit.spbParentPlanClick(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
  planObj: ENPlanWork;
  parentPlanFilter, planFilter: ENPlanWorkFilter;
  frmENPlanWorkShow: TfrmENPlanWorkShow;

  //TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
  //ENPlanWorkTypeObj: ENPlanWorkType;
  //TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
  //ENPlanWorkStateObj: ENPlanWorkState;
  //TempENDepartment: ENDepartmentControllerSoapPort;
  //ENDepartmentObj: ENDepartment;

  ENPlanWorkList: ENPlanWorkShortList;
  i, j, n, LastCount: Integer;
begin
  parentPlanFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(parentPlanFilter);
  SetNullXSProps(parentPlanFilter);

  parentPlanFilter.kind := ENPlanWorkKind.Create;
  parentPlanFilter.kind.code := ENPLANWORKKIND_CURRENT;
  parentPlanFilter.conditionSQL := 'enplanwork.elementrefcode in ' +
                                     '(select enelement.code from enelement where typerefcode in (' +
                                       IntToStr(EN_PURCHASES_OBJECT) + '))';  // + EN_PURCHASES_NO_OBJECT ??

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  //TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
  //TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
  //TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

  frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, parentPlanFilter);
  try
    with frmENPlanWorkShow do
    begin
      // Пока что фильтр лочим, а потом просто не будем давать выбирать
      // неподходящие планы, но будем давать им возможность искать свои
      DisableActions([frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actDelete,
                      frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actAddPlanItems,
                      frmENPlanWorkShow.actFilter, frmENPlanWorkShow.actNoFilter]);
      isFiltered := true;
      if ShowModal = mrOk then
      begin
        try
          parentPlanCode := StrToInt(GetReturnValue(sgENPlanWork, 0));
          planObj := TempENPlanWork.getObject(parentPlanCode);

          if planObj <> nil then
          begin
            ////////////////////////////////////////////////////////////////////
            planFilter := ENPlanWorkFilter.Create;
            SetNullIntProps(planFilter);
            SetNullXSProps(planFilter);

            planFilter.yearGen := planObj.yearGen;
            planFilter.monthGen := planObj.monthGen;
            planFilter.kind := ENPlanWorkKind.Create;
            planFilter.kind.code := ENPLANWORKKIND_NPZ; // ENPLANWORKKIND_FACT 
            planFilter.typeRef := ENPlanWorkTypeRef.Create;
            planFilter.typeRef.code := planObj.typeRef.code;
            planFilter.stateRef := ENPlanWorkStateRef.Create;
            planFilter.stateRef.code := planObj.stateRef.code;
            planFilter.departmentRef := ENDepartmentRef.Create;
            planFilter.departmentRef.code := planObj.departmentRef.code;
            planFilter.budgetRef := ENDepartmentRef.Create;
            planFilter.budgetRef.code := planObj.budgetRef.code;

            planFilter.conditionSQL := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ') and ' +
'(enplanwork.elementrefcode in ' +
'(select e.code from enelement e where e.typerefcode in ' +
'(select po.elementtyperefcode from enpurchasesobject po where po.elementcode = ' + IntToStr(planObj.elementRef.code) + '))) ';

            ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(planFilter, 0, -1);
            //if ENPlanWorkList <> nil then
            //  ShowMessage(IntToStr(ENPlanWorkList.totalCount));

            /////
            for i := 1 to Self.sgENPlanWork.RowCount - 1 do
              for j := 0 to Self.sgENPlanWork.ColCount - 1 do
                Self.sgENPlanWork.Cells[j, i] := '';

            Self.sgENPlanWork.RowCount := 2;
            /////

            LastCount:=High(ENPlanWorkList.list);

            if LastCount > -1 then
               Self.sgENPlanWork.RowCount:=LastCount+2
            else
               Self.sgENPlanWork.RowCount:=2;

             with Self.sgENPlanWork do
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
                  Cells[n,i+1] := ENPlanWorkList.list[i].userGen;
                  inc(n);

                  if ENPlanWorkList.list[i].dateEdit = nil then
                    Cells[n,i+1] := ''
                  else
                    Cells[n,i+1] := XSDate2String(ENPlanWorkList.list[i].dateEdit);
                  inc(n);

                  //Objects[0,i+1] := ENPlanWorkShort.Create;
                  //Objects[0,i+1] := TObject(ENPlanWorkList.list[i]); //TObject(ENPlanWorkList.list[i].statusCode);

                  Self.sgENPlanWork.RowCount := i + 2;
                end;

            Self.sgENPlanWork.Row := 1;
            ////////////////////////////////////////////////////////////////////


            {
            if planObj.elementRef <> nil then
              elementInCode := planObj.elementRef.code;

            ////////////////////////////////////////////////////////////////////
            // ЗАПОЛНЯЕМ ПАРАМЕТРЫ РАБОТ (ВИД, ТИП РАБОТ И Т.Д.) С ВЫБРАННОГО ТЕКУЩЕГО ПЛАНА
            if planObj.dateStart <> nil then
            begin
              edtDateStart.DateTime := EncodeDate(planObj.dateStart.Year, planObj.dateStart.Month, planObj.dateStart.Day);
              edtDateStart.Checked := false;
            end;

            if planObj.typeRef <> nil then
            begin
              planTypeCode := planObj.typeRef.code;
              ENPlanWorkTypeObj := TempENPlanWorkType.getObject(planTypeCode);
              if ENPlanWorkTypeObj <> nil then
                edtTypeName.Text := ENPlanWorkTypeObj.name
              else
                edtTypeName.Text := '';
              DisableControls([spbType, spbTypeClear]);
            end
            else begin
              planTypeCode := LOW_INT;
              edtTypeName.Text := '';
            end;

            if planObj.stateRef <> nil then
            begin
              planStateCode := planObj.stateRef.code;
              ENPlanWorkStateObj := TempENPlanWorkState.getObject(planStateCode);
              if ENPlanWorkStateObj <> nil then
                edtWorkState.Text := ENPlanWorkStateObj.name
              else
                edtWorkState.Text := '';
              DisableControls([spbENPlanWorkState, spbENPlanWorkStateClear]);
            end
            else begin
              planStateCode := LOW_INT;
              edtWorkState.Text := '';
            end;

            if planObj.departmentRef <> nil then
            begin
              departmentCode := planObj.departmentRef.code;
              ENDepartmentObj := TempENDepartment.getObject(departmentCode);
              if ENDepartmentObj <> nil then
                edtDepartment.Text := ENDepartmentObj.name
              else
                edtDepartment.Text := '';
              DisableControls([spbDepartment, spbDepartmentClear]);
            end
            else begin
              departmentCode := LOW_INT;
              edtDepartment.Text := '';
            end;
            ////////////////////////////////////////////////////////////////////
            }
          end
          else
            parentPlanCode := LOW_INT;
        except
          on EConvertError do Exit;
        end;
        edtParentPlan.Text := GetReturnValue(sgENPlanWork, 1);
      end;
    end;
  finally
    frmENPlanWorkShow.Free;
  end;
end;

procedure TfrmENPurchasesBindingEdit.FormCreate(Sender: TObject);
begin
  parentPlanCode := LOW_INT;
end;

procedure TfrmENPurchasesBindingEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
  inherited;
end;

procedure TfrmENPurchasesBindingEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtParentPlan]);
  DenyBlankValues([edtParentPlan]);

  SetGridHeaders(ENPlanWorkHeaders, sgENPlanWork.ColumnHeaders);  
end;

procedure TfrmENPurchasesBindingEdit.spbParentPlanClearClick(
  Sender: TObject);
var i, j: Integer;
begin
  parentPlanCode := LOW_INT;
  //elementInCode := LOW_INT;
  edtParentPlan.Text := '';

  /////
  for i := 1 to Self.sgENPlanWork.RowCount - 1 do
    for j := 0 to Self.sgENPlanWork.ColCount - 1 do
    begin
      Self.sgENPlanWork.Cells[j, i] := '';
      Self.sgENPlanWork.RemoveCheckBox(j, i);
    end;

  Self.sgENPlanWork.RowCount := 2;
  /////
end;

procedure TfrmENPurchasesBindingEdit.btnBindClick(Sender: TObject);
var selected, state: Boolean;
    i, planCode: Integer;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    planObj: ENPlanWork;
begin
  selected := false;

  for i := 1 to sgENPlanWork.RowCount - 1 do
  begin
    sgENPlanWork.GetCheckBoxState(1, i, selected);
    if selected then break;
  end;

  if not selected then // Если не выбран ни один план
  begin
    Application.MessageBox(PChar('Необхідно вибрати Завдання-Плани, які потрібно прив''язати до Поточного плану!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

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

      {planObj := DMReports.getPlanByCode(planCode);
      if planObj = nil then
        Continue;}

      TempENPlanWork.bind2parentPlan(planCode, parentPlanCode, CORRECTREASON_PURCHASES_BINDING);
    end;
  end;

  Application.MessageBox(PChar('Прив''язку планів завершено!'),
                         PChar('Повідомлення'), MB_ICONINFORMATION);
end;

end.
