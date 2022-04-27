unit ENDateRangeWithDepartmentFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons;

type
  TfrmENDateRangeWithDepartment = class(TDialogForm)
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
    procedure spbENDepartmentNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    departmentCode: Integer;
    departmentName: String;
  end;

var
  frmENDateRangeWithDepartment: TfrmENDateRangeWithDepartment;

implementation

uses ShowENDepartment, ENDepartmentController, ChildFormUnit;

{$R *.dfm}

procedure TfrmENDateRangeWithDepartment.spbENDepartmentNameClick(Sender: TObject);
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
        departmentName := ENDepartmentShort(tvDep.Selected.Data).shortName;
        edtENDepartmentName.Text := departmentName;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

procedure TfrmENDateRangeWithDepartment.FormShow(Sender: TObject);
begin
  DisableControls([edtENDepartmentName]);
  DenyBlankValues([edtENDepartmentName]);
end;

procedure TfrmENDateRangeWithDepartment.FormCreate(Sender: TObject);
begin
  departmentCode := 0;
  departmentName := '';
end;

procedure TfrmENDateRangeWithDepartment.spbENDepartmentClearClick(
  Sender: TObject);
begin
  departmentCode := 0;
  departmentName := '';
  edtENDepartmentName.Text := '';
end;

end.
