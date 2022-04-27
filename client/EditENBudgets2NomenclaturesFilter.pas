
unit EditENBudgets2NomenclaturesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBudgets2NomenclaturesController ;

type
  TfrmENBudgets2NomenclaturesFilterEdit = class(TDialogForm)

    lblNn : TLabel;
    edtNn: TEdit;

    lblMat_name : TLabel;
    edtMat_name: TEdit;



  HTTPRIOENBudgets2Nomenclatures: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENBudgetName: TLabel;
    spbENBudgetChoose: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    edtENBudgetName: TEdit;
    chbNoBudget: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENBudgetChooseClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure chbNoBudgetClick(Sender: TObject);
  

  private
    { Private declarations }
    procedure setBudgetVisibility(visible : Boolean);
  public
    { Public declarations }

end;

var
  frmENBudgets2NomenclaturesFilterEdit: TfrmENBudgets2NomenclaturesFilterEdit;
  ENBudgets2NomenclaturesFilterObj: ENBudgets2NomenclaturesFilter;

implementation


uses ShowENDepartment, ENDepartmentController;
{$R *.dfm}



procedure TfrmENBudgets2NomenclaturesFilterEdit.FormShow(Sender: TObject);

begin
  DisableControls([edtENBudgetName]);
end;

procedure TfrmENBudgets2NomenclaturesFilterEdit.setBudgetVisibility(visible : Boolean);
begin
  lblENBudgetName.Visible := visible;
  edtENBudgetName.Visible := visible;
  spbENBudgetChoose.Visible := visible;
  spbENBudgetClear.Visible := visible;
end;

procedure TfrmENBudgets2NomenclaturesFilterEdit.spbENBudgetChooseClick(
  Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromListBudgets(procedure(selectedObj : ENDepartmentShort)
  begin
    if ENBudgets2NomenclaturesFilterObj.budgetRef = nil then ENBudgets2NomenclaturesFilterObj.budgetRef := ENDepartmentRef.Create();
    ENBudgets2NomenclaturesFilterObj.budgetRef.code := selectedObj.code;
    edtENBudgetName.Text:= selectedObj.shortName;
  end);
end;

procedure TfrmENBudgets2NomenclaturesFilterEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  inherited;
  if ENBudgets2NomenclaturesFilterObj = nil then ENBudgets2NomenclaturesFilterObj := ENBudgets2NomenclaturesFilter.Create;
  ENBudgets2NomenclaturesFilterObj.budgetRef := ENDepartmentRef.Create();
  ENBudgets2NomenclaturesFilterObj.budgetRef.code := Low(Integer);
  edtENBudgetName.Text := '';
end;

procedure TfrmENBudgets2NomenclaturesFilterEdit.chbNoBudgetClick(
  Sender: TObject);
begin
  inherited;
  Self.setBudgetVisibility(not chbNoBudget.Checked);
end;

procedure TfrmENBudgets2NomenclaturesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort;
condition : String;
begin
  if (ModalResult = mrOk)  then
  begin
     ENBudgets2NomenclaturesFilterObj.nn := edtNn.Text;
     ENBudgets2NomenclaturesFilterObj.mat_name := edtMat_name.Text;
     if chbNoBudget.Checked then begin
        spbENBudgetClear.Click;
        AddCondition(condition, 'budgetrefcode is null');
        ENBudgets2NomenclaturesFilterObj.conditionSQL := condition;
     end;
  end;
end;




end.