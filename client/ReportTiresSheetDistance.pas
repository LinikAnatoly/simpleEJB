unit ReportTiresSheetDistance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmReportTiresSheetDistance = class(TDialogForm)
  lblEPRenName: TLabel;
  edtEPRenName: TEdit;
  spbEPRen: TSpeedButton;
  spbEPRenClear: TSpeedButton;
  HTTPRIOENDepartment: THTTPRIO;
  lblYearGen: TLabel;
  edtYearGen: TComboBox;
  btnOk: TBitBtn;
  btnCancel: TBitBtn;
  procedure spbEPRenClick(Sender: TObject);
  procedure spbEPRenClearClick(Sender: TObject);
  procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  depName : String;
  depCode : String;
  isTires : Boolean;
    { Public declarations }
end;

var
  frmReportTiresSheetDistance : TfrmReportTiresSheetDistance;

implementation

uses ShowENDepartment, ENDepartmentController, EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportTiresSheetDistance.spbEPRenClick(Sender: TObject);
var
   frmENDepartmentShow : TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   TempENDepartment : ENDepartmentControllerSoapPort;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
          TempENDepartment := Self.HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
          depName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := depName;
          depCode := TempENDepartment.getDepartmentCodesDown(ENDepartmentShort(tvDep.Selected.Data).code);
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmReportTiresSheetDistance.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
end;

procedure TfrmReportTiresSheetDistance.spbEPRenClearClick(Sender: TObject);
begin
  depName := '';
  edtEPRenName.Text := '';
  depCode := '';
end;

procedure TfrmReportTiresSheetDistance.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
      SetLength(argNames, 3);
      SetLength(args, 3);

      argNames[0] := 'depCode';
      if depCode <> '' then
        args[0] := ' and tr.departmentrefcode in (' + depCode + ') '
      else args[0] := ' and 1 = 1 ';

      argNames[1] := 'depName';
      if depName <> '' then
        args[1] := depName
      else args[1] := '1';

      argNames[2] := 'year';
      args[2] := edtYearGen.Text;

      if (isTires) then
         reportName := 'AutoTires/AutoTiresSheetDistance'
      else
         reportName := 'Accumulators/AccumulatorsSheetDistance';

      makeReport(reportName, argNames, args, 'xls');
end;

end.
