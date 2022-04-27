unit EditCopyPlanPriconnections;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ENPlanWorkController, InvokeRegistry,
  Rio, SOAPHTTPClient, Buttons;

type
  TfrmCopyPlanPriconnectionsEdit = class(TDialogForm)
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    lblServicesConnections: TLabel;
    Label1: TLabel;
    spbENElement: TSpeedButton;
    edtENElementName: TEdit;
    edtPriconnectionNumber: TEdit;
    spbPriconnectionNumber: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbPriconnectionNumberClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    newPlan: ENPlanWork;
  public
    { Public declarations }
    oldPlanCode, newPlanCode, elementCode, soCode : Integer;
  end;

var
  frmCopyPlanPriconnectionsEdit: TfrmCopyPlanPriconnectionsEdit;

implementation

uses ENConsts, ENPlanWorkFormController, ENPlanWorkKindController,
  ENElementController, ShowENElement, ChildFormUnit, ENServicesObjectController,
  ENServicesContractTypeController, ENServicesContractKindController,
  ShowENServicesConnection;

{$R *.dfm}

procedure TfrmCopyPlanPriconnectionsEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENPlanWork : ENPlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin

    if not NoBlankValues([edtENElementName]) then
    begin
      Application.MessageBox(PChar('Оберіть об''єкт планування!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      edtENElementName.SetFocus;
      Action:=caNone;
      Exit;
    end;

    if not NoBlankValues([edtPriconnectionNumber]) then
    begin
      Application.MessageBox(PChar('Оберіть договір про приєднання!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      edtPriconnectionNumber.SetFocus;
      Action:=caNone;
      Exit;
    end;

    if edtYearGen.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('Оберіть рік виконання плану !'), PChar('Увага !'), MB_ICONWARNING);
      edtYearGen.SetFocus;
      Action := caNone;
      Exit;
    end;

    if edtMonthGen.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('Оберіть місяць виконання плану !'), PChar('Увага !'), MB_ICONWARNING);
      edtMonthGen.SetFocus;
      Action := caNone;
      Exit;
    end;

    if oldPlanCode = LOW_INT then
    begin
      Application.MessageBox(PChar('Не знайдено план, з якого потрібно копіювати !'), PChar('Увага !'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;

    if Application.MessageBox(PChar('Ви дійсно бажаєте скопіювати план ?'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    begin
      Action := caNone;
      Exit;
    end;

    newPlan := ENPlanWork.Create;
    SetNullIntProps(newPlan);
    SetNullXSProps(newPlan);

    newPlan.yearGen := edtYearGen.ItemIndex + 2013;
    newPlan.monthGen := edtMonthGen.ItemIndex + 1;

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    newPlanCode := TempENPlanWork.copyPlanPriconnections(
        oldPlanCode, newPlan.monthGen, newPlan.yearGen, soCode, elementCode);

    if (newPlanCode <> LOW_INT) then
      Application.MessageBox(PChar('Успішно! код плану = ' + IntToStr(newPlanCode)),PChar('Внимание !'),MB_ICONWARNING+MB_OK);

  end;
end;

procedure TfrmCopyPlanPriconnectionsEdit.FormCreate(Sender: TObject);
begin
  inherited;
  oldPlanCode := LOW_INT;
  newPlanCode := LOW_INT;
  elementCode := LOW_INT;
  soCode := LOW_INT;
end;

procedure TfrmCopyPlanPriconnectionsEdit.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtENElementName, edtPriconnectionNumber]);
  DenyBlankValues([edtENElementName, edtPriconnectionNumber]);
end;

procedure TfrmCopyPlanPriconnectionsEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow : TfrmENElementShow;
  f : ENElementFilter;
begin
  inherited;

  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);
  try
  DisableActions([frmENElementShow.actInsert, frmENElementShow.actEdit, frmENElementShow.actDelete]);
    with frmENElementShow do
    if ShowModal = mrOk then
    begin
      try
        elementCode := StrToInt(GetReturnValue(sgENElement,0));
        edtENElementName.Text := GetReturnValue(sgENElement,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementShow.Free;
  end;
end;


procedure TfrmCopyPlanPriconnectionsEdit.spbPriconnectionNumberClick(
  Sender: TObject);
var
  f : ENServicesObjectFilter;
  frmENServicesConnectionShow : TfrmENServicesConnectionShow;
begin
  inherited;

  f := ENServicesObjectFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.contractTypeRef := ENServicesContractTypeRef.Create;
  f.contractTypeRef.code := ENSERVICESOBJECTTYPE_CONNECTION;

  f.contractKindRef := ENServicesContractKindRef.Create;
  f.contractKindRef.code := SERVICES_CONTRACT_KIND_SERVICES;

  frmENServicesConnectionShow := TfrmENServicesConnectionShow.Create(Application, fmNormal, f);
  try
  DisableActions([frmENServicesConnectionShow.actInsert, frmENServicesConnectionShow.actEdit,
    frmENServicesConnectionShow.actDelete]);

    with frmENServicesConnectionShow do
    if ShowModal = mrOk then
    begin
      try
        soCode := StrToInt(GetReturnValue(sgENServicesObject,0));
        edtPriconnectionNumber.Text := GetReturnValue(sgENServicesObject,1) + ', ' + GetReturnValue(sgENServicesObject,5);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENServicesConnectionShow.Free;
  end;
end;


end.
