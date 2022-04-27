
unit EditENBudgets2Nomenclatures;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBudgets2NomenclaturesController ;

type
  TfrmENBudgets2NomenclaturesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNn : TLabel;
    edtNn: TEdit;
    lblMat_name : TLabel;
    edtMat_name: TEdit;


  HTTPRIOENBudgets2Nomenclatures: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudgetChoose: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    spbNomenclatureChoose: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbNomenclatureChooseClick(Sender: TObject);
    procedure spbENBudgetChooseClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
  
  
  private
    procedure setNomenclature;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBudgets2NomenclaturesEdit: TfrmENBudgets2NomenclaturesEdit;
  ENBudgets2NomenclaturesObj: ENBudgets2Nomenclatures;

implementation


uses ShowENDepartment, ShowTmaterial, ENDepartmentController, TmaterialController;
{$R *.dfm}


procedure TfrmENBudgets2NomenclaturesEdit.setNomenclature;
begin
  if ENBudgets2NomenclaturesObj <> nil then begin
    edtNn.Text := ENBudgets2NomenclaturesObj.nn;
    edtMat_name.Text := ENBudgets2NomenclaturesObj.mat_name;
  end else begin
    edtNn.Text := '';
    edtMat_name.Text := '';
  end;
end;


procedure TfrmENBudgets2NomenclaturesEdit.spbENBudgetChooseClick(
  Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromListBudgets(procedure(selectedObj : ENDepartmentShort)
  begin
    if ENBudgets2NomenclaturesObj.budgetRef = nil then ENBudgets2NomenclaturesObj.budgetRef := ENDepartmentRef.Create();
    ENBudgets2NomenclaturesObj.budgetRef.code := selectedObj.code;
    edtENBudgetName.Text:= selectedObj.shortName;
  end);
end;

procedure TfrmENBudgets2NomenclaturesEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  inherited;
  if ENBudgets2NomenclaturesObj = nil then ENBudgets2NomenclaturesObj := ENBudgets2Nomenclatures.Create;
  ENBudgets2NomenclaturesObj.budgetRef := ENDepartmentRef.Create();
  ENBudgets2NomenclaturesObj.budgetRef.code := Low(Integer);
  edtENBudgetName.Text := '';
end;

procedure TfrmENBudgets2NomenclaturesEdit.spbNomenclatureChooseClick(
  Sender: TObject);
begin
  inherited;
  TfrmTmaterialShow.chooseFromList(procedure(selectedObj : TmaterialShort)
  begin
    if ENBudgets2NomenclaturesObj = nil then ENBudgets2NomenclaturesObj := ENBudgets2Nomenclatures.Create;
    ENBudgets2NomenclaturesObj.mat_id := selectedObj.id;
    ENBudgets2NomenclaturesObj.nn := selectedObj.nn;
    ENBudgets2NomenclaturesObj.mat_name := selectedObj.name;
    Self.setNomenclature;
  end);
end;

procedure TfrmENBudgets2NomenclaturesEdit.FormShow(Sender: TObject);
var
  depController : ENDepartmentControllerSoapPort;
  dep : ENDepartment;
begin
  DisableControls([edtCode, edtENBudgetName, edtNn, edtMat_name]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNn
      ,edtMat_name
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBudgets2NomenclaturesObj.code);

      if (ENBudgets2NomenclaturesObj.budgetRef <> nil) and
         (ENBudgets2NomenclaturesObj.budgetRef.code <> Low(Integer)) then begin
        depController := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
        dep := depController.getObject(ENBudgets2NomenclaturesObj.budgetRef.code);
        edtENBudgetName.Text := dep.name;
      end;
  end;

  Self.setNomenclature;

end;



procedure TfrmENBudgets2NomenclaturesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNn
      ,edtMat_name
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBudgets2Nomenclatures := HTTPRIOENBudgets2Nomenclatures as ENBudgets2NomenclaturesControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENBudgets2NomenclaturesObj.code:=low(Integer);
      TempENBudgets2Nomenclatures.add(ENBudgets2NomenclaturesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBudgets2Nomenclatures.save(ENBudgets2NomenclaturesObj);
    end;
  end;
end;


end.