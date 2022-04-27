unit EditENPlanWorkAttributes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs
  , DialogFormUnit, ChildFormUnit
  ,ENPlanWorkController, Buttons, StdCtrls, ComCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient
  ,XSBuiltIns
  ,ENMOL2PlanWorkController, ExtCtrls
  ;

type
  TfrmEditENPlanWorkAttributes = class(TDialogForm)
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWorkState: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    Panel1: TPanel;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    lblWorkState: TLabel;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    lblResponsibility: TLabel;
    edtResponsibility: TEdit;
    spbResponsibility: TSpeedButton;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    lblPriConnectionNumber: TLabel;
    edtPriConnectionNumber: TEdit;
    spbPriconnectionAgreeNumber: TSpeedButton;
    spbPriConnectionNumberClear: TSpeedButton;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    lblServicesFromSide: TLabel;
    edtServicesFromSide: TEdit;
    spbServicesFromSide: TSpeedButton;
    gbButtons: TGroupBox;
    lblPK: TLabel;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    spbENPlanWorkType: TSpeedButton;
    lblENPlanWorkType: TLabel;
    edtENPlanWorkType: TEdit;
    gbENElement: TGroupBox;
    gbENPlanWorkType: TGroupBox;
    gbWorkState: TGroupBox;
    gbBudget: TGroupBox;
    gbCFO: TGroupBox;
    gbENDepartment: TGroupBox;
    gbServicesFromSide: TGroupBox;
    gbFINExecutor: TGroupBox;
    gbPriconnectionNumber : TGroupBox;
    HTTPRIOENPlanWorkType: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbResponsibilityClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbPriconnectionAgreeNumberClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbPriConnectionNumberClearClick(Sender: TObject);
    procedure spbServicesFromSideClick(Sender: TObject);
    procedure spbENPlanWorkTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      plan: ENPlanWork;
  end;

var
  frmEditENPlanWorkAttributes: TfrmEditENPlanWorkAttributes;



implementation

uses ENConsts, ShowFINExecutorTree, FINExecutorController,
  FINMolController, ShowFINMol, ENDepartment2EPRenController,
   ENDepartmentController, ShowENDepartment, ShowENElement
   , ENElementController, ShowENPlanWorkState, ENPlanWorkStateController
   , ShowENServicesConnection, ENServicesObjectController
   , DMReportsUnit, ShowFINServicesObject, ShowENPlanWorkType, ENPlanWorkTypeController;


{$R *.dfm}

procedure TfrmEditENPlanWorkAttributes.FormShow(Sender: TObject);
var
  TempENDepartment : ENDepartmentControllerSoapPort;
  TempENPlanWorkState : ENPlanWorkStateControllerSoapPort;
  TempENElement : ENElementControllerSoapPort;
  TempENPlanWorkType : ENPlanWorkTypeControllerSoapPort;
  department, budget, responsibility : ENDepartment;
  state : ENPlanWorkState;
  planWorkType : ENPlanWorkType;
  element : ENElementShort;
  control : TControl;
  i : Integer;
begin
  inherited;
  DisableControls([edtCode, edtENElementName, edtInvNumber, edtWorkState, edtENBudgetName
  , edtResponsibility, edtDepartment, edtPriConnectionNumber, edtFINExecutorName, edtServicesFromSide, edtENPlanWorkType]);
  
  {for control in Panel1.Controls do begin
    if (control.ClassType = TGroupBox) and (control.Visible = False) then begin
	    Self.Height := Self.Height - control.Height;
	  end;
  end;}
  for i := 0 to Panel1.ControlCount - 1 do begin
    control := Panel1.Controls[i];
    if (control.ClassType = TGroupBox) and (control.Visible = False) then begin
      Self.Height := Self.Height - control.Height;
    end;
  end;

  if (Assigned(plan)) and (plan.code <> Low(Integer)) then edtCode.Text := IntToStr(plan.code);
  edtPriConnectionNumber.Text := plan.priconnectionNumber;
  
  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
  TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;
  TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
  TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
  
  department := TempENDepartment.getObject(plan.departmentRef.code);
  budget := TempENDepartment.getObject(plan.budgetRef.code);
  responsibility := TempENDepartment.getObject(plan.responsibilityRef.code);
  state := TempENPlanWorkState.getObject(plan.stateRef.code);
  element := TempENElement.getShortObject(plan.elementRef.code);
  planWorkType := TempENPlanWorkType.getObject(plan.typeRef.code);
  
  edtDepartment.Text := department.shortName;
  edtENBudgetName.Text := budget.shortName;
  edtResponsibility.Text := responsibility.shortName;
  edtENPlanWorkType.Text := planWorkType.name;

  if plan.finExecutor <> nil then begin
    edtFINExecutorName.Text := plan.finExecutor.name;
  end;
  
  if(element <> nil) then begin
      edtENElementName.Text := element.objectName;
	    edtInvNumber.Text := element.objectInvNumber;
  end;
  
  edtWorkState.Text := state.name;

  edtServicesFromSide.Text := plan.servicesFSideCnNum;
end;

procedure TfrmEditENPlanWorkAttributes.spbDepartmentClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
           edtDepartment.Text := selectedObj.shortName;
		   if plan.departmentRef = nil then plan.departmentRef := ENDepartmentRef.Create;
		   plan.departmentRef.code := selectedObj.code;
  end);
end;


procedure TfrmEditENPlanWorkAttributes.spbENBudgetClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromListBudgets(procedure(selectedObj : ENDepartmentShort)
  begin
		   edtENBudgetName.Text := selectedObj.shortName;
		   if plan.budgetRef = nil then plan.budgetRef := ENDepartmentRef.Create;
		   plan.budgetRef.code := selectedObj.code;
  end);
end;

procedure TfrmEditENPlanWorkAttributes.spbENElementClick(Sender: TObject);
var
  selectedObj : ENElementShort;
begin
  inherited;
  selectedObj := TfrmENElementShow.chooseFromList();
  if Assigned(selectedObj) then begin
		   edtENElementName.Text := selectedObj.objectName;
		   edtInvNumber.Text := selectedObj.objectInvNumber;
		   if plan.elementRef = nil then plan.elementRef := ENElementRef.Create;
		   plan.elementRef.code := selectedObj.code;
  end;
end;

procedure TfrmEditENPlanWorkAttributes.spbENPlanWorkStateClick(Sender: TObject);
begin
  inherited;
  TfrmENPlanWorkStateShow.chooseFromList(procedure(selectedObj : ENPlanWorkStateShort)
  begin
		   edtWorkState.Text := selectedObj.name;
		   if plan.stateRef = nil then plan.stateRef := ENPlanWorkStateRef.Create;
		   plan.stateRef.code := selectedObj.code;
  end);
end;

procedure TfrmEditENPlanWorkAttributes.spbENPlanWorkTypeClick(Sender: TObject);
begin
  inherited;
  TfrmENPlanWorkTypeShow.chooseFromList(procedure(selectedObj : ENPlanWorkTypeShort)
  begin
		   edtENPlanWorkType.Text := selectedObj.name;
		   if plan.typeRef = nil then plan.typeRef := ENPlanWorkTypeRef.Create;
		   plan.typeRef.code := selectedObj.code;
  end);
end;

procedure TfrmEditENPlanWorkAttributes.spbFINExecutorClick(Sender: TObject);
begin
  inherited;
  TfrmFINExecutorTreeShow.chooseFromList(procedure(selectedObj : FINExecutorShort; node : TTreeNode)
  begin
		         plan.finExecutor :=
                 DMReports.finExecutorShort2finExecutor(selectedObj,
                                                        DMReports.getFullExecutorName(node));

               edtFINExecutorName.Text := plan.finExecutor.name;
		   
  end);
end;

procedure TfrmEditENPlanWorkAttributes.spbPriconnectionAgreeNumberClick(
  Sender: TObject);
begin
  inherited;
  TfrmENServicesConnectionShow.chooseFromListConnection(procedure(selectedObj : ENServicesObjectShort)
  begin
		   edtPriConnectionNumber.Text := selectedObj.contractNumberServices;
		   plan.priconnectionNumber := selectedObj.contractNumberServices;
  end);
end;

procedure TfrmEditENPlanWorkAttributes.spbPriConnectionNumberClearClick(
  Sender: TObject);
begin
  inherited;
  edtPriConnectionNumber.Text := '';
  plan.priconnectionNumber := '';
end;

procedure TfrmEditENPlanWorkAttributes.spbResponsibilityClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromListResponsibility(procedure(selectedObj : ENDepartmentShort)
  begin
		   edtResponsibility.Text := selectedObj.shortName;
		   if plan.responsibilityRef = nil then plan.responsibilityRef := ENDepartmentRef.Create;
		   plan.responsibilityRef.code := selectedObj.code;
  end);
end;

procedure TfrmEditENPlanWorkAttributes.spbServicesFromSideClick(
  Sender: TObject);
var
  f : ENServicesObjectFilter;
begin
  inherited;
  // ≈сли уже был заполнен договор, то фильтруем по нему или посылаем -1,
  // чтобы ничего не выбралось
  f := ENServicesObjectFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  if (edtServicesFromSide.Text <> '') then
    f.contractNumber := edtServicesFromSide.Text
  else
    f.contractNumber := '-1';


  TfrmFINServicesObjectShow.chooseFromListBuying(procedure(selectedObj : ENServicesObjectShort)
  begin
               edtServicesFromSide.Text := selectedObj.contractNumber;
               plan.servicesFSideCnNum := selectedObj.contractNumber;
               plan.servicesFSideFinId := selectedObj.finDocID;
  end, f);
end;

end.


