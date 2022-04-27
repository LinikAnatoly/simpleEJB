unit AddMaterialToAVZOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DialogFormUnit, ChildFormUnit, InvokeRegistry,
  Rio, SOAPHTTPClient;

type
  TfrmAddMaterialToAVZOrderEdit = class(TDialogForm)
    lblMaterial: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    edtCountFact: TEdit;
    lblCountFact: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    lblMeasurement: TLabel;
    lblENDepartmentDepartmentRefName: TLabel;
    lblENDepartmentBudgetRefName: TLabel;
    edtENDepartmentBudgetRefName: TEdit;
    edtENDepartmentDepartmentRefName: TEdit;
    spbENDepartmentDepartmentRef: TSpeedButton;
    spbENDepartmentBudgetRef: TSpeedButton;
    HTTPRIORQOrderItem: THTTPRIO;
    procedure spbMaterialNameClick(Sender: TObject);
    procedure spbENDepartmentDepartmentRefClick(Sender: TObject);
    procedure spbENDepartmentBudgetRefClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    orderCode, materialCode, budgetCode, departmentCode: Integer;
  end;

var
  frmAddMaterialToAVZOrderEdit: TfrmAddMaterialToAVZOrderEdit;

implementation

uses TKMaterialsController, ShowTKMaterials, ShowENDepartment,
  ENDepartmentController, ENDepartmentTypeController, ENConsts, XSBuiltIns,
  RQOrderItemController;

{$R *.dfm}

procedure TfrmAddMaterialToAVZOrderEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  countFact: TXSDecimal;
  fCountFact: Double;
  TempRQOrderItem: RQOrderItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if (not NoBlankValues([edtMaterialName, edtCountFact, edtENDepartmentBudgetRefName, edtENDepartmentDepartmentRefName]))
    then begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
    else begin
      if orderCode = LOW_INT then
        raise Exception.Create('Не заданий код заявки!');

      countFact := TXSDecimal.Create;
      countFact.DecimalString := edtCountFact.Text;

      try
        fCountFact := StrToFloat(countFact.DecimalString);
      except
        on EConvertError do
        begin
          edtCountFact.SetFocus;
          raise Exception.Create('Неприпустиме значення в полі "Кількість"!');
        end;
      end;

      if fCountFact <= 0 then
      begin
        Application.MessageBox(PChar('Кількість не може бути нульовою!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
        edtCountFact.SetFocus;
        Action := caNone;
        Exit;
      end;

      TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
      TempRQOrderItem.addMaterialToAVZOrder(orderCode,
                                            materialCode,
                                            countFact,
                                            budgetCode,
                                            departmentCode);
    end;
end;

procedure TfrmAddMaterialToAVZOrderEdit.FormCreate(Sender: TObject);
begin
  inherited;

  orderCode := LOW_INT;
  materialCode := LOW_INT;
  budgetCode := LOW_INT;
  departmentCode := LOW_INT;
end;

procedure TfrmAddMaterialToAVZOrderEdit.FormShow(Sender: TObject);
begin
  inherited;

  DisableControls([edtMaterialName, edtENDepartmentBudgetRefName, edtENDepartmentDepartmentRefName]);
  SetFloatStyle(edtCountFact);

  DenyBlankValues([edtMaterialName, edtCountFact, edtENDepartmentBudgetRefName, edtENDepartmentDepartmentRefName]);
end;

procedure TfrmAddMaterialToAVZOrderEdit.spbENDepartmentBudgetRefClick(
  Sender: TObject);
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

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal,f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentBudgetRefName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmAddMaterialToAVZOrderEdit.spbENDepartmentDepartmentRefClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               departmentcode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentRefName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmAddMaterialToAVZOrderEdit.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      DenyGroupSelection := true;
      if ShowModal = mrOk then
        try
            begin
            materialCode := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
            edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
            lblMeasurement.Caption := 'од.виміру : '+ TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
            end;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
