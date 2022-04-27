unit reportDfExecutionWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs ,DialogFormUnit, Buttons, StdCtrls, ComCtrls, EnergyproController
  , ChildFormUnit;

type
  TFrmExecutionWork = class(TDialogForm)
    lblDateRegistration: TLabel;
    Label1: TLabel;
    edtDateRegistrationFrom: TDateTimePicker;
    edtDateRegistrationTo: TDateTimePicker;
    lblDFDepartmentREN: TLabel;
    edtDFDepartmentREN: TEdit;
    spbDFDepartmentREN: TSpeedButton;
    btnCancel: TButton;
    btnOk: TButton;
    procedure spbDFDepartmentRENClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    departmentcode : Integer;
    departmentname: String;
  end;

var
  FrmExecutionWork: TFrmExecutionWork;

implementation

uses DFDepartmentController, ShowDFDepartment, DMReportsUnit, Globals;

{$R *.dfm}

procedure TFrmExecutionWork.btnOkClick(Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
begin
      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'dateStart';
      args[0] := DateToStr(edtDateRegistrationFrom.Date);

      argNames[1] := 'dateFinal';
      args[1] := DateToStr(edtDateRegistrationTo.Date);

      argNames[2] := 'departmentCode';
      args[2] := IntToStr(departmentCode);

      DMReports.makeReport4DocFlow('taskAll', argNames, args, 'xls');
end;

procedure TFrmExecutionWork.FormShow(Sender: TObject);
begin
   DisableControls([edtDFDepartmentREN]);
   departmentcode := -1;
   departmentname := '';
end;

procedure TFrmExecutionWork.spbDFDepartmentRENClick(Sender: TObject);
var
  frmDFDepartmentShow : TfrmDFDepartmentShow;
  depFilter : DFDepartmentFilter;
begin
  inherited;
  depFilter := DFDepartmentFilter.Create;
  SetNullIntProps(depFilter);
  SetNullXSProps(depFilter);
  depFilter.conditionSQL := 'dfdepartment.isworking = ' + IntToStr(NO) + // ????
      ' and dfdepartment.ccrenname is not null';

  frmDFDepartmentShow := TfrmDFDepartmentShow.Create(Application,fmNormal,depFilter);
  try
    with frmDFDepartmentShow do
      if ShowModal = mrOk then
      begin
        try
          departmentcode := StrToInt(GetReturnValue(sgDFDepartment,0));
          departmentname:=GetReturnValue(sgDFDepartment,2);
          edtDFDepartmentREN.Text := GetReturnValue(sgDFDepartment,2);

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmDFDepartmentShow.Free;
  end;
end;

end.
