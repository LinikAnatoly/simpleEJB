unit EditNotificationForSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmNotificationForSupplierEdit = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dtpDateFrom: TDateTimePicker;
    dtpDateTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    lblEPRenName: TLabel;
    spbENDepartmentName: TSpeedButton;
    spbENDepartmentClear: TSpeedButton;
    edtENDepartmentName: TEdit;
    Label3: TLabel;
    lblSupplier: TLabel;
    edtSupplier: TEdit;
    spbSupplier: TSpeedButton;
    HTTPRIOENServicesObject: THTTPRIO;
    procedure spbENDepartmentNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbSupplierClick(Sender: TObject);
  private
    { Private declarations }
    departmentCode: Integer;
    supplierCode: Integer;
    function getServicesObjectCode: Integer;
  public
    { Public declarations }
  end;

var
  frmNotificationForSupplierEdit: TfrmNotificationForSupplierEdit;

implementation

uses ShowENDepartment, ENDepartmentController, ChildFormUnit, ENConsts, DateUtils,
  EnergyproController, DMReportsUnit, ShowSupplier, ENServicesObjectController;

{$R *.dfm}

procedure TfrmNotificationForSupplierEdit.spbENDepartmentNameClick(Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.code := 1;

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
  try
    with frmENDepartmentShow do
    begin
 //     DisableActions([ actNoFilter, actEdit, actInsert ]);
      if ShowModal = mrOk then
      begin
          {try
             if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
             ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
             edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
          except
             on EConvertError do Exit;
          end;}
        departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
        edtENDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

procedure TfrmNotificationForSupplierEdit.spbSupplierClick(Sender: TObject);
var frmSupplierShow: TfrmSupplierShow;
begin
  frmSupplierShow := TfrmSupplierShow.Create(Application, fmNormal);
  try
    with frmSupplierShow do
      if ShowModal = mrOk then
      begin
        supplierCode := StrToInt(GetReturnValue(sgSupplier, 0));
        edtSupplier.Text := GetReturnValue(sgSupplier, 1);
      end;
  finally
    frmSupplierShow.Free;
  end;
end;

procedure TfrmNotificationForSupplierEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENDepartmentName, edtSupplier]);
  DenyBlankValues([edtENDepartmentName, edtSupplier]);

  // По дефолту предлагаем сформировать за предыдущий месяц
  dtpDateFrom.Date := DateUtils.StartOfTheMonth(IncMonth(Date, -1));
  dtpDateTo.Date := DateUtils.EndOfTheMonth(IncMonth(Date, -1));
end;

function TfrmNotificationForSupplierEdit.getServicesObjectCode: Integer;
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  Result := LOW_INT;

  if supplierCode <= 0 then
  begin
    if edtSupplier.CanFocus then
      edtSupplier.SetFocus;
    raise Exception.Create('Спочатку оберіть Постачальника!');
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  Result := TempENServicesObject.getServicesObjectCodeForSupplier(supplierCode);
end;

procedure TfrmNotificationForSupplierEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  argNames, args: ArrayOfString;
  servicesObjectCode: Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtSupplier]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
    else begin
      servicesObjectCode := getServicesObjectCode;
      if servicesObjectCode <= 0 then
        raise Exception.Create('NET-4576 Не заданий код договору на відшкодування витрат для постачальника!');

      /////// Parameters
      SetLength(argNames, 6);
      SetLength(args, 6);

      argNames[0] := 'servicesObjectCode';
      args[0] := IntToStr(servicesObjectCode);

      argNames[1] := 'dateStart';
      args[1] := DateToStr(dtpDateFrom.Date);

      argNames[2] := 'dateFinal';
      args[2] := DateToStr(dtpDateTo.Date);

      argNames[3] := 'departmentCode';
      args[3] := IntToStr(departmentCode);

      argNames[4] := 'supplierCode';
      args[4] := IntToStr(supplierCode);

      argNames[5] := 'supplierName';
      args[5] := edtSupplier.Text;
      ///////

      makeReport('Services/4Supplier/notificationForSupplier', argNames, args, 'xls');
    end;
end;

procedure TfrmNotificationForSupplierEdit.FormCreate(Sender: TObject);
begin
  departmentCode := 0;
  supplierCode := LOW_INT;
end;

procedure TfrmNotificationForSupplierEdit.spbENDepartmentClearClick(
  Sender: TObject);
begin
  departmentCode := 0;
  edtENDepartmentName.Text := '';
end;

end.
