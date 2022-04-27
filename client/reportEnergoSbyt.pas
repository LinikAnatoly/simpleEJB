unit reportEnergoSbyt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ChildFormUnit, Buttons, StdCtrls, ComCtrls,
  ExtCtrls;

type
  TfrmReportEnergoSbyt = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    cbStartMonth: TComboBox;
    cbByYear: TCheckBox;
    edtYearGen: TComboBox;
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    rgkindPlan: TRadioGroup;
    rkindPlan1: TRadioButton;
    rkindPlan2: TRadioButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    report : Integer;   // - 1 выбор материала .. 2 - все материалы
    renCode: Integer;
  end;

var
  frmReportEnergoSbyt: TfrmReportEnergoSbyt;
  materialCode : Integer;
  budgetCode : Integer;

  
implementation

uses ShowTKMaterials, EnergyproController, TKMaterialsController,
  DMReportsUnit, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, ENConsts;

{$R *.dfm}


procedure TfrmReportEnergoSbyt.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, true);
end;

procedure TfrmReportEnergoSbyt.FormShow(Sender: TObject);
begin

  //DisableControls([edtMaterialName, edtMaterialText]);

  if report = 1 then
    //DenyBlankValues([edtMaterialName, edtMaterialText])
  else
  begin
    //HideControls([edtMaterialName, edtMaterialText, spbMaterialName, Label1]);
  end;


  DisableControls([edtEPRenName]);
  rencode := -1;

end;

procedure TfrmReportEnergoSbyt.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  edtEPRenName.Text := '';
end;

procedure TfrmReportEnergoSbyt.spbEPRenClick(Sender: TObject);
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
          edtEPRenName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;
procedure TfrmReportEnergoSbyt.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

   if report = 3 then
   begin
      SetLength(argNames, 3);
      SetLength(args, 3);
      argNames[0] := 'yearGen';
      args[0] :=  edtYearGen.Text;

      argNames[1] := 'kindcode';
    if rkindPlan1.Checked then
       args[1] :=  '1'
    else
       args[1] :=  '2';

       argNames[2] := 'departmentCode';
       args[2] := IntToStr(renCode);

       reportName := 'RepEnergozbyt/Analize_plan_zbyt_by_year';
       makeReport(reportName, argNames, args, 'xls');
   end
   else
   begin
    if edtDateStart.Visible  then
     begin
      SetLength(argNames, 1);
      SetLength(args, 1);
      argNames[0] := 'P0';
      args[0] := DateToStr(edtDateStart.Date);
      reportName := 'RepEnergozbyt/Analize_plan_byt_prom';

    end
    else
    begin

    SetLength(argNames, 3);
    SetLength(args, 3);


    argNames[0] := 'yearGen';
    args[0] :=  edtYearGen.Text;

    argNames[1] := 'monthGen';
    args[1] :=  IntToStr(cbStartMonth.ItemIndex + 1);

    argNames[2] := 'strKindPlan'; // определяем с чем будем сравнивать факт - с заданиями годовыми или месячными
    if rkindPlan1.Checked then
       args[2] :=  IntToStr(ENPLANWORKKIND_YEAR) + ',' + IntToStr(ENPLANWORKKIND_FACT)
    else
       args[2] :=  IntToStr(ENPLANWORKKIND_CURRENT) + ',' + IntToStr(ENPLANWORKKIND_FACT) ;



      if cbByYear.Checked then
        reportName := 'RepEnergozbyt/PlanFactEnergosbyt/year_cnt_by_energozbyt'
      else
        reportName := 'RepEnergozbyt/PlanFactEnergosbyt/month_cnt_by_energozbyt';



    end;
    makeReport(reportName, argNames, args, 'xls');

   end;
end;



end.
