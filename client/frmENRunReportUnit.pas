unit frmENRunReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InvokeRegistry, Rio, SOAPHTTPClient, StdCtrls, Buttons,DialogFormUnit,ChildFormUnit,
  ExtCtrls, Types,EnergyproController, ComCtrls, XSBuiltIns, DateUtils,
  ENDepartmentController;

type
  TfrmENRunReport = class(TDialogForm)
    HTTPRIOCCRen: THTTPRIO;
    gbDepartment: TGroupBox;
    lblCCRenName: TLabel;
    edtDepartment: TEdit;
    gbDates: TGroupBox;
    gbDate: TGroupBox;
    spbDepartment: TSpeedButton;
    btnPanel: TPanel;
    lblDate: TLabel;
    gbSUM: TGroupBox;
    edtSum: TEdit;
    dtpDate: TDateTimePicker;
    gbSUM2: TGroupBox;
    edtSum1: TEdit;
    edtSum2: TEdit;
    lblSum1: TLabel;
    lblSum2: TLabel;
    lblCheckPeriod: TLabel;
    Label1: TLabel;
    dtpStartDate: TDateTimePicker;
    Label2: TLabel;
    dtpEndDate: TDateTimePicker;
    gbComboBox1: TPanel;
    lblCombBox1: TLabel;
    cBox1: TComboBox;
    HTTPRIOCCWorker: THTTPRIO;
    HTTPRIOReport: THTTPRIO;
    gbTime: TGroupBox;
    Label4: TLabel;
    dtpTime: TDateTimePicker;
    gbTimes: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dtpStartTime: TDateTimePicker;
    dtpEndTime: TDateTimePicker;
    gbCheckBox1: TGroupBox;
    chk1: TCheckBox;
    gbCheckBox2: TGroupBox;
    chk2: TCheckBox;
    gbComboBox2: TPanel;
    lblCombBox2: TLabel;
    cBox2: TComboBox;
    HTTPRIOCCNode: THTTPRIO;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    gbCheckBox3: TGroupBox;
    chk3: TCheckBox;
    gbRoles: TGroupBox;
    rbByt: TRadioButton;
    rbJur: TRadioButton;
    rbHead: TRadioButton;
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPeriodClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    departmentCode: Integer;
    departmentName: string;
  end;

var
  frmENRunReport: TfrmENRunReport;

implementation

uses ShowCCRen, ShowENDepartment, EditENDepartmentFilter;

{$R *.dfm}
procedure TfrmENRunReport.spbDepartmentClick(Sender: TObject);
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
        edtDepartment.Text := departmentName;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

procedure TfrmENRunReport.FormShow(Sender: TObject);
begin
  DisableControls([edtDepartment]);

  dtpDate.Date := date;
  dtpStartDate.Date := date;
  dtpEndDate.Date := date;

  btnPanel.Visible := true;

end;

procedure TfrmENRunReport.btnPeriodClick(Sender: TObject);

begin
;
end;

end.
