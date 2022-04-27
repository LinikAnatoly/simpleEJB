unit reportCounterYearUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,DialogFormUnit, ChildFormUnit;

type
  TfrmReportCounterYear = class(TDialogForm)
    Label1: TLabel;
    lblEPRenName1: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtEPRenName1: TEdit;
    spbEPRen1: TSpeedButton;
    Label2: TLabel;
    edtYearGen1: TComboBox;
    cbStartMonth1: TComboBox;
    cbStartMonth: TComboBox;
    Label3: TLabel;
    edtYearGen: TComboBox;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    rbPhasityAll: TRadioButton;
    rbPhasity1: TRadioButton;
    rbPhasity3: TRadioButton;
    rbSmart: TRadioButton;
    rbSmart1: TRadioButton;
    rbSmart3: TRadioButton;
    cbIncludeSmart: TCheckBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRen1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
  end;

var
  frmReportCounterYear: TfrmReportCounterYear;

implementation

uses ShowTKMaterials, EnergyproController, TKMaterialsController,
  DMReportsUnit, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, ENConsts,ShowENEPRen;

{$R *.dfm}

procedure TfrmReportCounterYear.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
    SetLength(argNames, 5);
    SetLength(args, 5);

    argNames[0] := 'yearGen';
    args[0] :=  edtYearGen.Text;

    argNames[1] := 'renCode';
    args[1] := IntToStr(renCode);

    argNames[2] := 'P1';
    args[2] :=  IntToStr(cbStartMonth1.ItemIndex + 1);

    argNames[3] := 'P2';
    args[3] :=  IntToStr(cbStartMonth.ItemIndex + 1);

    argNames[4] := 'P3';
    if  rbPhasityAll.Checked
      then  args[4] :=  IntToStr(0)
    else
    if rbPhasity1.Checked
      then   args[4] :=  IntToStr(1)
    else
    if rbPhasity3.Checked
      then   args[4] :=  IntToStr(3)
    else
    if rbSmart.Checked
      then   args[4] :=  IntToStr(4)
    else
    if rbSmart1.Checked
      then   args[4] :=  IntToStr(41)
    else
    if rbSmart3.Checked
      then   args[4] :=  IntToStr(43)
    else
    args[4] :=  IntToStr(0);

    if cbIncludeSmart.Checked then
      reportName := 'RepEnergozbyt/counters_outcheck_period_smart'
    else reportName := 'RepEnergozbyt/counters_outcheck_period';

    makeReport(reportName, argNames, args, 'xls');


end;

procedure TfrmReportCounterYear.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen1, 2009, 2, true, true);
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, true);
end;

procedure TfrmReportCounterYear.spbEPRen1Click(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               renCode := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

procedure TfrmReportCounterYear.spbEPRenClearClick(Sender: TObject);
begin
   renCode := 0;
   edtEPRenName.Text := '';

end;

procedure TfrmReportCounterYear.spbEPRenClick(Sender: TObject);
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
         // renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

end.
