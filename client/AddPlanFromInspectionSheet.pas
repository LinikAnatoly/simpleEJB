
unit AddPlanFromInspectionSheet;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, DateUtils,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENPlanWorkController, ENInspectionSheetController;

type
    TfrmAddPlanFromInspectionSheet = class(TDialogForm)

    btnOk: TButton;
    btnCancel: TButton;
    lblPlanWorkForm: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    lblMonthGen: TLabel;
    lblYearGen: TLabel;
    cbENPlanWorkFormName: TComboBox;
    spbType: TSpeedButton;
    spbENPlanWorkState: TSpeedButton;
    edtWorkState: TEdit;
    edtTypeName: TEdit;
    lblWorkState: TLabel;
    lblTypeName: TLabel;
    spbENBudget: TSpeedButton;
    edtENBudgetName: TEdit;
    lblENBudgetName: TLabel;
    lblDateFinal: TLabel;
    lblDateStart: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    lblResponsibility: TLabel;
    edtResponsibility: TEdit;
    spbResponsibility: TSpeedButton;
    lblENPlanWorkKindKindName: TLabel;
    cbPlanWorkKind: TComboBox;
    edtFINExecutorName: TEdit;
    lblExecuter: TLabel;
    spbFINExecutor: TSpeedButton;
    HTTPRIOENInspectionSheet: THTTPRIO;
    chkCauseDisconnection: TCheckBox;
    HTTPRIOENPlanWork: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbResponsibilityClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure edtDateStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDateFinalClick(Sender: TObject);
    procedure edtDateStartChange(Sender: TObject);
    procedure chkCauseDisconnectionClick(Sender: TObject);
    procedure verifyCauseDisconnection();
  
  private
    { Private declarations }
  public
    { Public declarations }
    inspectionSheetCode: Integer;
    ENPlanWorkObj: ENPlanWork;
end;

var
  frmAddPlanFromInspectionSheet: TfrmAddPlanFromInspectionSheet;

implementation


uses
  ShowFINExecutorTree, DMReportsUnit, FINExecutorController, ENConsts,
  ShowENDepartment, ENDepartmentController, ENDepartmentTypeController,
  showENPlanWorkState, ENPlanWorkStateController, ENElementController,
  ShowENPlanWorkType, ENPlanWorkTypeController, ENPlanWorkKindController,
  ENPlanWorkFormController, ENPlanWorkSourceController;

{$R *.dfm}



procedure TfrmAddPlanFromInspectionSheet.FormShow(Sender: TObject);
begin
  DisableControls([edtTypeName, edtWorkState, edtENBudgetName, edtResponsibility, edtFINExecutorName]);
  DenyBlankValues([edtYearGen, edtMonthGen, edtDateStart, edtDateFinal, cbENPlanWorkFormName,
      edtTypeName, edtWorkState, edtENBudgetName, edtResponsibility, cbPlanWorkKind, edtFINExecutorName]);

  edtDateStartClick(Sender);
end;


procedure TfrmAddPlanFromInspectionSheet.spbENBudgetClick(Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f: ENDepartmentFilter;
begin
  inherited;
  if ENPlanWorkObj = nil then Exit;

  chkCauseDisconnection.Checked := False;
  ENPlanWorkObj.causeDisconnection := NO;

  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.typeRef := ENDepartmentTypeRef.Create;
  f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
  f.conditionSQL := ' parentrefcode is null';

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
           if ENPlanWorkObj.budgetRef = nil then ENPlanWorkObj.budgetRef := ENDepartmentRef.Create();
           ENPlanWorkObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
           edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmAddPlanFromInspectionSheet.spbENPlanWorkStateClick(Sender: TObject);
var
  frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
  f: ENPlanWorkStateFilter;
  e: ENElement;
begin
  inherited;
  if ENPlanWorkObj = nil then Exit;

  if ENPlanWorkObj.typeRef = nil then
  begin
    Application.MessageBox(PChar('Спочатку оберіть ПідВид робіт !!!'), PChar('Ошибка'), MB_ICONERROR);
    Exit;
  end
  else
  if ENPlanWorkObj.typeRef.code = LOW_INT then
  begin
    Application.MessageBox(PChar('Спочатку оберіть ПідВид робіт !!!'), PChar('Ошибка'), MB_ICONERROR);
    Exit;
  end;

   f:= ENPlanWorkStateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.orderBySQL := 'ordered';
   f.conditionSQL := 'enplanworkstate.code in (select enplantype2planstate.staterefcode from enplantype2planstate where enplantype2planstate.typerefcode = '+ IntToStr(ENPlanWorkObj.typeRef.code) +')';

   // AS .. нфиг логику без ЭЛЕМЕНТА !!!
   if ENPlanWorkObj.elementRef <> nil then
     if  ENPlanWorkObj.elementRef.code <> LOW_INT then
     begin
       e := DMReports.getElementByCode(ENPlanWorkObj.elementRef.code);
       if (e.typeRef.code <> EN_SUBSTATION150) and
          {SUPP-62192}(e.typeRef.code <> EN_LINE150) and
          (e.typeRef.code <> EN_BUILDER) and
          (e.typeRef.code <> EN_METROLOGY_COUNTER) and
          (e.typeRef.code <> EN_METROLOGY_DEVICE) and
          (e.typeRef.code <> EN_METROLOGY_OBJECT) and
          (e.typeRef.code <> EN_BYT) and
          (e.typeRef.code <> EN_TRANSPORT) and
          (e.typeRef.code <> EN_SIT) and
          (e.typeRef.code <> EN_PURCHASES_OBJECT) and
          (e.typeRef.code <> EN_PURCHASES_NO_OBJECT) and
          (e.typeRef.code <> EN_SIZ_OBJECT) and
          (e.typeRef.code <> EN_SERVICES_OBJECT) and
          (e.typeRef.code <> EN_PREPRODUCTION_OBJECT) and
          (e.typeRef.code <> EN_EQUIPMENT_REPAIR) and
          {SUPP-61652}(e.typeRef.code <> EN_EQUIPMENT) then
           f.conditionSQL := f.conditionSQL + ' and enplanworkstate.code <> ' + IntToStr(ENPLANWORKSTATE_CURRENTREPAIR);

       if ( e.typeRef.code = EN_EQUIPMENT) then
       begin
         //f.conditionSQL := f.conditionSQL + ' and enplanworkstate.code = ' + ;
         //f.code := ENPLANWORKSTATE_CAPITALREPAIR;
         {SUPP-7483}
         f.conditionSQL := f.conditionSQL + ' and enplanworkstate.code in (' + IntToStr(ENPLANWORKSTATE_CAPITALREPAIR) + ', ' + IntToStr(ENPLANWORKSTATE_TECHNICALSERVICE)
         {SUPP-61652}
         + ', ' + IntToStr(ENPLANWORKSTATE_CURRENTREPAIR) +')';
       end;
     end;

  frmENPlanWorkStateShow := TfrmENPlanWorkStateShow.Create(Application,fmNormal,f);
  try
    with frmENPlanWorkStateShow do begin
      DisableActions([ actEdit, actInsert, actDelete, actNoFilter, actFilter ]);
      if ShowModal = mrOk then
      begin
        try
           if ENPlanWorkObj.stateRef = nil then ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create();
           ENPlanWorkObj.stateRef.code := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
           edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENPlanWorkStateShow.Free;
  end;
end;


procedure TfrmAddPlanFromInspectionSheet.spbFINExecutorClick(Sender: TObject);
var
  frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
begin
  inherited;
  if ENPlanWorkObj = nil then Exit;

  frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application,fmNormal);
  try
    with frmFINExecutorTreeShow do begin
      DisableActions([ actEdit, actInsert ]);

      if ShowModal = mrOk then
      begin
        try
          ENPlanWorkObj.finExecutor :=
          DMReports.finExecutorShort2finExecutor(
            FINExecutorShort(tvDep.Selected.Data),
            DMReports.getFullExecutorName(tvDep.Selected));

          edtFINExecutorName.Text := ENPlanWorkObj.finExecutor.name;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmFINExecutorTreeShow.Free;
  end;
end;


procedure TfrmAddPlanFromInspectionSheet.spbResponsibilityClick(Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f: ENDepartmentFilter;
begin
  inherited;
  if ENPlanWorkObj = nil then Exit;

  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.typeRef := ENDepartmentTypeRef.Create;
  f.typeRef.code := ENDEPARTMENTTYPE_RESPOSIBILITY;
  f.conditionSQL := ' parentrefcode is null';

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
           if ENPlanWorkObj.responsibilityRef = nil then ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create();
           ENPlanWorkObj.responsibilityRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
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


procedure TfrmAddPlanFromInspectionSheet.spbTypeClick(Sender: TObject);
var
  frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
  f: ENPlanWorkTypeFilter;
begin
  inherited;
  if ENPlanWorkObj = nil then Exit;

  chkCauseDisconnection.Checked := False;
  ENPlanWorkObj.causeDisconnection := NO;

  if ENPlanWorkObj.stateRef = nil then ENPlanWorkObj.stateRef := ENPlanWorkStateRef.Create();
  ENPlanWorkObj.stateRef.code := Low(Integer);
  edtWorkState.Text := '';

  if (ENPlanWorkObj.elementRef = nil) or (ENPlanWorkObj.elementRef.code = LOW_INT) then
  begin
    Application.MessageBox(PChar('Спочатку оберіть Об''єкт планування !!!'), PChar('Ошибка'), MB_ICONERROR);
    Exit;
  end;

  f := ENPlanWorkTypeFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'ordered';

  frmENPlanWorkTypeShow := TfrmENPlanWorkTypeShow.Create(Application,fmNormal,f);
  try
    with frmENPlanWorkTypeShow do begin
      DisableActions([ actEdit, actInsert , actDelete]);
      if ShowModal = mrOk then
      begin
        try
           if ENPlanWorkObj.typeRef = nil then ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create();
           ENPlanWorkObj.typeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType,0));
           edtTypeName.Text := GetReturnValue(sgENPlanWorkType,1);
        except
           on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENPlanWorkTypeShow.Free;
  end;
end;


procedure TfrmAddPlanFromInspectionSheet.chkCauseDisconnectionClick(Sender: TObject);
var
  TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  inherited;
  // В Delphi даже программная устновка Checked вызывает onClick
  if not TWinControl(Sender).Focused then Exit;

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  try
    if chkCauseDisconnection.Checked then
    begin
      TempENPlanWork.checkCauseDisconnectionOn(ENPlanWorkObj);
      ENPlanWorkObj.causeDisconnection := YES;
    end else
    begin
      ENPlanWorkObj.causeDisconnection := NO;
    end;
  finally
    verifyCauseDisconnection;
  end;
end;


procedure TfrmAddPlanFromInspectionSheet.verifyCauseDisconnection();
var
  chkStateInDB: Boolean;
begin

  chkStateInDB := not chkCauseDisconnection.Checked;

  try
    if ENPlanWorkObj.causeDisconnection = YES then
      chkStateInDB := True
    else
    begin
      chkStateInDB := False;
      ENPlanWorkObj.causeDisconnection := NO;
    end;
  finally
    if (chkCauseDisconnection.Checked <> chkStateInDB) then
    begin
      chkCauseDisconnection.OnClick := nil;
      chkCauseDisconnection.Checked := chkStateInDB;
      chkCauseDisconnection.OnClick := chkCauseDisconnectionClick;
    end;
  end;
end;


procedure TfrmAddPlanFromInspectionSheet.edtDateFinalClick(Sender: TObject);
var
  year: Integer;
begin
  inherited;
  year := StrToInt(edtYearGen.Text);
  edtDateStart.DateTime := EncodeDate(year, edtMonthGen.ItemIndex + 1, 1);
  edtDateFinal.DateTime := EncodeDate(year, edtMonthGen.ItemIndex + 1, DaysInMonth(edtDateStart.DateTime));
end;


procedure TfrmAddPlanFromInspectionSheet.edtDateStartChange(Sender: TObject);
begin
  inherited;
  edtDateFinal.DateTime := EncodeDate(YearOf(edtDateStart.DateTime), MonthOf(edtDateStart.DateTime), DaysInMonth(edtDateStart.DateTime));
end;


procedure TfrmAddPlanFromInspectionSheet.edtDateStartClick(Sender: TObject);
var
  year: Integer;
begin
  inherited;
  year := StrToInt(edtYearGen.Text);
  edtDateStart.DateTime := EncodeDate(year, edtMonthGen.ItemIndex + 1, 1);
  edtDateFinal.DateTime := EncodeDate(year, edtMonthGen.ItemIndex + 1, DaysInMonth(edtDateStart.DateTime));
end;


procedure TfrmAddPlanFromInspectionSheet.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  if inspectionSheetCode = Low(Integer) then Exit;

// edtFINExecutorName, edtResponsibility, edtENBudgetName, edtTypeName, edtWorkState
//

  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  if edtdateStart.checked then
  begin
    if ENPlanWorkObj.dateStart = nil then
      ENPlanWorkObj.dateStart := TXSDate.Create;
    ENPlanWorkObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
  end
  else
    ENPlanWorkObj.dateStart := nil;

  if edtdateFinal.checked then
  begin
    if ENPlanWorkObj.dateFinal = nil then
      ENPlanWorkObj.dateFinal := TXSDate.Create;
    ENPlanWorkObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
  end
  else
    ENPlanWorkObj.dateFinal := nil;

  if ENPlanWorkObj.kind = nil then ENPlanWorkObj.kind := ENPlanWorkKind.Create;
  ENPlanWorkObj.kind.code := cbPlanWorkKind.ItemIndex + 1;

  if (edtYearGen.ItemIndex >= 0) then
    ENPlanWorkObj.yearGen := edtYearGen.ItemIndex + 2009
  else
    ENPlanWorkObj.yearGen := Low(Integer);

  if (edtMonthGen.ItemIndex >= 0) then
    ENPlanWorkObj.monthGen := edtMonthGen.ItemIndex + 1
  else
    ENPlanWorkObj.monthGen := Low(Integer);

  if ENPlanWorkObj.formRef = nil then ENPlanWorkObj.formRef := ENPlanWorkFormRef.Create;
    ENPlanWorkObj.formRef.code := cbENPlanWorkFormName.ItemIndex + 1;

  ENPlanWorkObj.code := Low(Integer);

  /////
  ENPlanWorkObj.yearOriginal := Low(Integer);
  ENPlanWorkObj.monthOriginal := Low(Integer);
  /////
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if DialogState = dsInsert then
    TempENInspectionSheet.createPlanFromInspectionSheet(inspectionSheetCode, ENPlanWorkObj);

end;


procedure TfrmAddPlanFromInspectionSheet.FormCreate(Sender: TObject);
begin
  inherited;
  inspectionSheetCode := Low(Integer);
  // Для удобства при добавлении поля год и месяц сетяться по текущей дате
  // При открытии уже существующего плана значения полей перетруться при FormShow
  // на те, что в объекте
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);
end;


end.