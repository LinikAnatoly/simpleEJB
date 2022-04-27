unit EditENPlanWorkCopy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ENPlanWorkController, InvokeRegistry,
  Rio, SOAPHTTPClient;

type
  TfrmENPlanWorkCopyEdit = class(TDialogForm)
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    btnOk: TButton;
    btnCancel: TButton;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    lblENPlanWorkKindKindName: TLabel;
    cbPlanWorkKind: TComboBox;
    HTTPRIOENPlanWork: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    newPlan: ENPlanWork;
  public
    { Public declarations }
    oldPlanCode, newPlanCode: Integer;
  end;

var
  frmENPlanWorkCopyEdit: TfrmENPlanWorkCopyEdit;

implementation

uses ENConsts, ENPlanWorkFormController, ENPlanWorkKindController;

{$R *.dfm}

procedure TfrmENPlanWorkCopyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin
    if cbENPlanWorkFormName.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('ќбер≥ть вид роб≥т (планов≥/позапланов≥) !'), PChar('”вага !'), MB_ICONWARNING);
      cbENPlanWorkFormName.SetFocus;
      Action := caNone;
      Exit;
    end;

    if edtYearGen.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('ќбер≥ть р≥к виконанн€ плану !'), PChar('”вага !'), MB_ICONWARNING);
      edtYearGen.SetFocus;
      Action := caNone;
      Exit;
    end;

    if edtMonthGen.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('ќбер≥ть м≥с€ць виконанн€ плану !'), PChar('”вага !'), MB_ICONWARNING);
      edtMonthGen.SetFocus;
      Action := caNone;
      Exit;
    end;

    if cbPlanWorkKind.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('ќбер≥ть тип плану (р≥чний/м≥с€чний) !'), PChar('”вага !'), MB_ICONWARNING);
      cbPlanWorkKind.SetFocus;
      Action := caNone;
      Exit;
    end;

    if oldPlanCode = LOW_INT then
    begin
      Application.MessageBox(PChar('Ќе знайдено план, з €кого потр≥бно коп≥ювати !'), PChar('”вага !'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    if Application.MessageBox(PChar('¬и д≥йсно бажаЇте скоп≥ювати план ?'),
                              PChar('”вага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    begin
      Action := caNone;
      Exit;
    end;

    newPlan := ENPlanWork.Create;
    SetNullIntProps(newPlan);
    SetNullXSProps(newPlan);

    newPlan.formRef := ENPlanWorkFormRef.Create;
    newPlan.formRef.code := cbENPlanWorkFormName.ItemIndex + 1;

    newPlan.kind := ENPlanWorkKind.Create;
    newPlan.kind.code := cbPlanWorkKind.ItemIndex + 1;

    newPlan.yearGen := edtYearGen.ItemIndex + 2012;
    newPlan.monthGen := edtMonthGen.ItemIndex + 1; 

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    newPlanCode := TempENPlanWork.copyPlanForTemplate(oldPlanCode, newPlan);
  end;
end;

procedure TfrmENPlanWorkCopyEdit.FormCreate(Sender: TObject);
begin
  inherited;
  oldPlanCode := LOW_INT;
  newPlanCode := LOW_INT;
end;

end.
