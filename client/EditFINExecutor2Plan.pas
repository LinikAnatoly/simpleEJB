
unit EditFINExecutor2Plan;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, FINExecutor2PlanController,
  ShowENDepartment, ENDepartmentController, ENDepartmentTypeController ;

type
  TfrmFINExecutor2PlanEdit = class(TDialogForm)

  lblCode : TLabel;
  edtCode : TEdit;
  lblPercentLoad : TLabel;
  edtPercentLoad: TEdit;
  lblDateStart : TLabel;
  edtDateStart: TDateTimePicker;
  lblDateFinal : TLabel;
  edtDateFinal: TDateTimePicker;
  lblTotalTimeHours : TLabel;
  edtTotalTimeHours: TEdit;
  lblTotalTimeDays : TLabel;
  edtTotalTimeDays: TEdit;
  lblUserGen : TLabel;
  edtUserGen: TEdit;
  lblDateEdit : TLabel;
  edtDateEdit: TDateTimePicker;

  HTTPRIOFINExecutor2Plan: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  lblExecuter: TLabel;
  edtFINExecutorName: TEdit;
  spbFINExecutor: TSpeedButton;
  lblExecutorType: TLabel;
  edtExecutorType: TEdit;
  HTTPRIOFINExecutorType: THTTPRIO;
  HTTPRIOFINExecutor: THTTPRIO;
  lblENBudgetName: TLabel;
  edtENBudgetName: TEdit;
  spbENBudget: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbFINExecutorClick(Sender: TObject);
  procedure spbENBudgetClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFINExecutor2PlanEdit: TfrmFINExecutor2PlanEdit;
  FINExecutor2PlanObj: FINExecutor2Plan;

implementation


{uses  
    EnergyproController, EnergyproController2, FINExecutor2PlanController  ;
}

uses FINExecutorTypeController, FINExecutorController,
     ShowFINExecutorTree, ENConsts, DMReportsUnit;

{$R *.dfm}



procedure TfrmFINExecutor2PlanEdit.FormShow(Sender: TObject);
var
  TempFINExecutorType : FINExecutorTypeControllerSoapPort;
  TempFINExecutor : FINExecutorControllerSoapPort;
  TempENDepartment : ENDepartmentControllerSoapPort;
begin

  DisableControls([edtCode, edtExecutorType, edtFINExecutorName, edtDateFinal, edtENBudgetName]);
  SetFloatStyle([edtPercentLoad]);

  if DialogState = dsView then
  begin
    DisableControls([spbFINExecutor, spbENBudget]);
  end;

  if DialogState = dsInsert then
  begin
    edtExecutorType.Text := 'Додатковий';
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtFINExecutorName, edtPercentLoad, edtENBudgetName]);
  end;

  if (DialogState = dsEdit) then
  begin
    DisableControls([spbFINExecutor], FINExecutor2PlanObj.finExecutorTypeRef.code = FINEXECUTOR_TYPE_PRIMARY);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtCode.Text := IntToStr(FINExecutor2PlanObj.code);

    HideControls([lblENBudgetName, edtENBudgetName, spbENBudget], FINExecutor2PlanObj.finExecutorTypeRef.code = FINEXECUTOR_TYPE_PRIMARY);

    if (FINExecutor2PlanObj.finExecutorTypeRef.code <> low(Integer)) then
    begin
      TempFINExecutorType := HTTPRIOFINExecutorType as FINExecutorTypeControllerSoapPort;
      edtExecutorType.Text := TempFINExecutorType.getObject(FINExecutor2PlanObj.finExecutorTypeRef.code).name;
    end;

    if (FINExecutor2PlanObj.finExecutor.code <> low(Integer)) then
    begin
      TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
      edtFINExecutorName.Text := TempFINExecutor.getObject(FINExecutor2PlanObj.finExecutor.code).name;
    end;

    if (FINExecutor2PlanObj.budgetRef.code <> low(Integer)) then
    begin
      TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      edtENBudgetName.Text := TempENDepartment.getObject(FINExecutor2PlanObj.budgetRef.code).name;
    end;

    if (FINExecutor2PlanObj.percentLoad <> nil ) then
       edtPercentLoad.Text := FINExecutor2PlanObj.percentLoad.decimalString
    else
       edtPercentLoad.Text := '';

    if FINExecutor2PlanObj.dateStart <> nil then
    begin
      edtDateStart.DateTime:=EncodeDate(FINExecutor2PlanObj.dateStart.Year,FINExecutor2PlanObj.dateStart.Month,FINExecutor2PlanObj.dateStart.Day);
      edtDateStart.checked := true;
    end
    else
    begin
      edtDateStart.DateTime:=SysUtils.Date;
      edtDateStart.checked := false;
    end;

    if FINExecutor2PlanObj.dateFinal <> nil then
    begin
      edtDateFinal.DateTime:=EncodeDate(FINExecutor2PlanObj.dateFinal.Year,FINExecutor2PlanObj.dateFinal.Month,FINExecutor2PlanObj.dateFinal.Day);
      edtDateFinal.checked := true;
    end
    else
    begin
      edtDateFinal.DateTime:=SysUtils.Date;
      edtDateFinal.checked := false;
    end;

    if ( FINExecutor2PlanObj.totalTimeHours <> nil ) then
       edtTotalTimeHours.Text := FINExecutor2PlanObj.totalTimeHours.decimalString
    else
       edtTotalTimeHours.Text := '';
    if ( FINExecutor2PlanObj.totalTimeDays <> nil ) then
       edtTotalTimeDays.Text := FINExecutor2PlanObj.totalTimeDays.decimalString
    else
       edtTotalTimeDays.Text := '';
    edtUserGen.Text := FINExecutor2PlanObj.userGen;

    if FINExecutor2PlanObj.dateEdit <> nil then
    begin
      edtDateEdit.DateTime:=EncodeDate(FINExecutor2PlanObj.dateEdit.Year,FINExecutor2PlanObj.dateEdit.Month,FINExecutor2PlanObj.dateEdit.Day);
      edtDateEdit.checked := true;
    end
    else
    begin
      edtDateEdit.DateTime:=SysUtils.Date;
      edtDateEdit.checked := false;
    end;

  end;
end;



procedure TfrmFINExecutor2PlanEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINExecutor2Plan: FINExecutor2PlanControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtFINExecutorName, edtPercentLoad, edtDateStart{, edtDateFinal}]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else

  if (FINExecutor2PlanObj.finExecutorTypeRef.code = FINEXECUTOR_TYPE_ADDITIONAL) and (not NoBlankValues([edtENBudgetName])) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else

  begin
    if (FINExecutor2PlanObj.planRef = nil) then
    begin
      Application.MessageBox(PChar('Не задан код плана !'), PChar('Внимание !'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    if (FINExecutor2PlanObj.planRef.code = LOW_INT) then
    begin
      Application.MessageBox(PChar('Не задан код плана !'), PChar('Внимание !'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    TempFINExecutor2Plan := HTTPRIOFINExecutor2Plan as FINExecutor2PlanControllerSoapPort;

    if (FINExecutor2PlanObj.percentLoad = nil) then
      FINExecutor2PlanObj.percentLoad := TXSDecimal.Create;

    if edtPercentLoad.Text <> '' then
      FINExecutor2PlanObj.percentLoad.decimalString := edtPercentLoad.Text
    else
      FINExecutor2PlanObj.percentLoad := nil;

    if edtdateStart.checked then
    begin
     if FINExecutor2PlanObj.dateStart = nil then
        FINExecutor2PlanObj.dateStart := TXSDate.Create;
     FINExecutor2PlanObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
    end
    else
     FINExecutor2PlanObj.dateStart := nil;

    { ////////// Это все автоматически заполняется на серваке
    if edtdateFinal.checked then
    begin
     if FINExecutor2PlanObj.dateFinal = nil then
        FINExecutor2PlanObj.dateFinal := TXSDate.Create;
     FINExecutor2PlanObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
    end
    else
     FINExecutor2PlanObj.dateFinal := nil;

    if (FINExecutor2PlanObj.totalTimeHours = nil ) then
     FINExecutor2PlanObj.totalTimeHours := TXSDecimal.Create;
    if edtTotalTimeHours.Text <> '' then
     FINExecutor2PlanObj.totalTimeHours.decimalString := edtTotalTimeHours.Text
    else
     FINExecutor2PlanObj.totalTimeHours := nil;

    if (FINExecutor2PlanObj.totalTimeDays = nil ) then
     FINExecutor2PlanObj.totalTimeDays := TXSDecimal.Create;
    if edtTotalTimeDays.Text <> '' then
     FINExecutor2PlanObj.totalTimeDays.decimalString := edtTotalTimeDays.Text
    else
     FINExecutor2PlanObj.totalTimeDays := nil;

    FINExecutor2PlanObj.userGen := edtUserGen.Text;

    if edtdateEdit.checked then
    begin
     if FINExecutor2PlanObj.dateEdit = nil then
        FINExecutor2PlanObj.dateEdit := TXSDateTime.Create;
     FINExecutor2PlanObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
    end
    else
     FINExecutor2PlanObj.dateEdit := nil;
    ////////// }

    if DialogState = dsInsert then
    begin
      FINExecutor2PlanObj.code:=low(Integer);
      TempFINExecutor2Plan.add(FINExecutor2PlanObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINExecutor2Plan.save(FINExecutor2PlanObj);
    end;
  end;
end;


procedure TfrmFINExecutor2PlanEdit.spbENBudgetClick(Sender: TObject);
var
  frmENDepartmentShow : TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  inherited;
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
          if FINExecutor2PlanObj.budgetRef = nil then FINExecutor2PlanObj.budgetRef := ENDepartmentRef.Create();
          FINExecutor2PlanObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
          edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmFINExecutor2PlanEdit.spbFINExecutorClick(Sender: TObject);
var
  frmFINExecutorTreeShow : TfrmFINExecutorTreeShow;
begin
   frmFINExecutorTreeShow := TfrmFINExecutorTreeShow.Create(Application,fmNormal);

   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              FINExecutor2PlanObj.finExecutor :=
                DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                       DMReports.getFullExecutorName(tvDep.Selected));
              edtFINExecutorName.Text := FINExecutor2PlanObj.finExecutor.name;
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

end.
