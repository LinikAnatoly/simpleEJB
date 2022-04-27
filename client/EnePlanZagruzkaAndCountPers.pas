unit EnePlanZagruzkaAndCountPers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit , ComCtrls, InvokeRegistry,
  Rio, SOAPHTTPClient, ExtCtrls, ShowFINExecutorTree;

type
  TfrmEnePlanZagruzkaAndCountPers = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkPlanFactMakeReport: TCheckBox;
    chkIsNotPlan: TCheckBox;
    HTTPRIOFINExecutor: THTTPRIO;
    RadioGroup1: TRadioGroup;
    rbENPLANWORKKIND_YEAR: TRadioButton;
    rbENPLANWORKKIND_CURRENT: TRadioButton;
    lblFINExecutorName: TLabel;
    spbFINExecutor: TSpeedButton;
    spbFINExetutorClear: TSpeedButton;
    edtFINExecutorName: TEdit;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure chkPlanFactMakeReportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbFINExetutorClearClick(Sender: TObject);
  private
    { Private declarations }
    axPodrId: String;
    axPodrName : string;
  public
    { Public declarations }
     renCode: Integer;
     renName: String;
     report_kind : Integer; // 1- Енергозбыт, 2 - Техническая часть
  end;

var
  frmEnePlanZagruzkaAndCountPers: TfrmEnePlanZagruzkaAndCountPers;

implementation

uses
  ShowENDepartment, ENDepartmentController, ChildFormUnit, DMReportsUnit , EnergyproController,
  FINExecutorController, ENConsts;

{$R *.dfm}

procedure TfrmEnePlanZagruzkaAndCountPers.spbEPRenClick(Sender: TObject);
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

procedure TfrmEnePlanZagruzkaAndCountPers.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do
      begin
        DisableActions([actEdit, actInsert]);
        if ShowModal = mrOk then
        begin
            try

              axPodrName := {getFullExecutorName(tvDep.Selected);} FINExecutorShort(tvDep.Selected.Data).name;
//              finExecutorFinCode := InttoStr(FINExecutorShort(tvDep.Selected.Data).finCode);
//              if FINExecutorShort(tvDep.Selected.Data).finCode = LOW_INT then
              axPodrId := FINExecutorShort(tvDep.Selected.Data).axOrgId;


              edtFINExecutorName.Text := DMReports.getFullExecutorName(tvDep.Selected); //finExecutorName;
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmEnePlanZagruzkaAndCountPers.spbFINExetutorClearClick(
  Sender: TObject);
begin
  edtFINExecutorName.Text := '';
  axPodrId := '';
  axPodrName := '';

end;

procedure TfrmEnePlanZagruzkaAndCountPers.spbEPRenClearClick(
  Sender: TObject);
begin
renCode := 0;
renName := '';
edtEPRenName.Text := '';
end;

procedure TfrmEnePlanZagruzkaAndCountPers.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  TempFINExecutor : FINExecutorControllerSoapPort;
begin
      /////// Parameters
      SetLength(argNames, 8);
      SetLength(args, 8);

      argNames[0] := 'yearGen';
      args[0] := edtYearGen.Text;

      argNames[1] := 'departmentCode';
      args[1] := IntToStr(renCode);

      argNames[2] := 'formrefcode';
      if chkPlanFactMakeReport.Checked = False then // если формируем отчет по плану тогда форма плана только плановые учитываем иначе если по факту тогда и плановые и внеплановые
      args[2] := '1'
      else
      args[2] := '0';

      argNames[3] := 'isnotplan';
      if chkIsNotPlan.Checked = False  then
      args[3] := IntToStr(0)
      else
      args[3] := IntToStr(1);

  if report_kind = 1 then
      begin
      if renCode = 482 then
       if DMReports.UsesMDAXDataForReport = false then
         reportName := 'RepEnergozbyt/Human_count/Analize_plan_zbyt_fin_tpHMVE'
       else
         reportName := 'RepEnergozbyt/Human_count/ax_Analize_plan_zbyt_fin_tpHMVE'

      else
       begin
         if DMReports.UsesMDAXDataForReport = false then begin
            reportName := 'RepEnergozbyt/Human_count/Analize_plan_zbyt_fin_tp';
            // выбираем все подразделения исполнители у которых признак в кадрах стоит НВЗ_Е
            TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
            argNames[4] := 'strIdExecutor';
            args[4] := TempFINExecutor.getPodrIdFromKadryByDepartmentCodeNVZ_E(renCode , '31.12.'+edtYearGen.Text );
         end else
         begin
            reportName := 'RepEnergozbyt/Human_count/ax_Analize_plan_zbyt_fin_tp';

         end;
       end;
    end;


      argNames[5] := 'plankindcode';
      if rbENPLANWORKKIND_YEAR.Checked then
      args[5] := '1'
      else if rbENPLANWORKKIND_CURRENT.Checked then
      args[5] := '2'
      else
      args[5] := '0';


      argNames[6] := 'axPodrId';
      args[6] := axPodrId;

      argNames[7] := 'departmentName';
      args[7] := axPodrName;

      // отчет по технарям
      if report_kind = 2 then
      begin

        if renCode = 482 then
           args[1] := '830';
        if DMReports.UsesMDAXDataForReport = false then
         reportName := 'RepEnergozbyt/Human_count/Tech/tech_main'   // в tech_executor.jrxml шифруется какой подотчет вызывать нормативный или факты
        else
         reportName := 'RepEnergozbyt/Human_count/Tech/ax_tech_main';

      end;
      
      makeReport(reportName, argNames, args, 'xls');

    end;

procedure TfrmEnePlanZagruzkaAndCountPers.chkPlanFactMakeReportClick(
  Sender: TObject);
begin
 if chkPlanFactMakeReport.Checked then
 begin
    chkIsNotPlan.Checked := False;
    chkIsNotPlan.Enabled := False;
    chkIsNotPlan.Visible := False;

    RadioGroup1.Visible:= False;
    rbENPLANWORKKIND_YEAR.Visible:=false;
    rbENPLANWORKKIND_CURRENT.Visible:=false;
    rbENPLANWORKKIND_YEAR.Checked:= false;
    rbENPLANWORKKIND_CURRENT.Checked:= false;


 end
 else
 begin
    chkIsNotPlan.Enabled := True;
    chkIsNotPlan.Visible := True;

    RadioGroup1.Visible:= true;
    rbENPLANWORKKIND_YEAR.Visible:=true;
    rbENPLANWORKKIND_CURRENT.Visible:=true;
    rbENPLANWORKKIND_YEAR.Checked:= false;
    rbENPLANWORKKIND_CURRENT.Checked:= false;
 end;

end;
procedure TfrmEnePlanZagruzkaAndCountPers.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  axPodrId:= '';
  axPodrName:= 'АТ "Херсонобленерго"';
  rbENPLANWORKKIND_CURRENT.Checked:= True;
end;

end.

