unit ReportParamSbyt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit, ComCtrls , ENPlanWorkController;

type
  TfrmParamsPlanSbyt = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cbFinExecutors: TCheckBox;
    cbTypePlan: TCheckBox;
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
   // procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
  end;

var
  frmParamsPlanSbyt: TfrmParamsPlanSbyt;

implementation

{$R *.dfm}

uses ShowENDepartment , ENDepartmentController , ChildFormUnit , EnergyproController , DMReportsUnit ;


procedure TfrmParamsPlanSbyt.spbEPRenClearClick(Sender: TObject);
begin
renCode := 0;
renName := '';
edtEPRenName.Text := '';
end;

procedure TfrmParamsPlanSbyt.spbEPRenClick(Sender: TObject);
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
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmParamsPlanSbyt.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
      /////// Parameters
      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'yearGen';
      args[0] := edtYearGen.Text;

      argNames[1] := 'monthGen';
      args[1] := IntToStr(edtMonthGen.ItemIndex + 1);

      argNames[2] := 'departmentCode';
      args[2] := IntToStr(renCode);

      argNames[3] := 'isViewFinExecutor';
      if  cbFinExecutors.Checked then
      args[3] := IntToStr(1)
      else args[3] := IntToStr(0);
      ///////

         if cbFinExecutors.Checked then
           if cbTypePlan.Checked
            then reportName := 'RepEnergozbyt/Analize_plan_zbyt_fin_tp'
            else reportName := 'RepEnergozbyt/Analize_plan_byt_prom_fin'

         else
            if cbTypePlan.Checked
            then reportName := 'RepEnergozbyt/Analize_plan_zbyt_fin_ng_tp'
            else reportName := 'RepEnergozbyt/Analize_plan_byt_prom_fin_ng';

      makeReport(reportName, argNames, args, 'xls');

    end;

procedure TfrmParamsPlanSbyt.FormShow(Sender: TObject);
begin
DisableControls([edtEPRenName]);
DenyBlankValues([edtEPRenName]);
end;

end.
