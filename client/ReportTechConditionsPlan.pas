unit ReportTechConditionsPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, Buttons, StdCtrls, ComCtrls ;

type
  TfrmReportTechConditionsPlan = class(TDialogForm)
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edtYearGen1: TComboBox;
    Label6: TLabel;
    cbStartMonth1: TComboBox;
    lblWorkState: TLabel;
    edtActType: TEdit;
    spbENPlanWorkState: TSpeedButton;
    spbTypeactClear: TSpeedButton;
    CheckBox1: TCheckBox;
    chkDetailingPlanTask: TCheckBox;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateFrom: TDateTimePicker;
    edtDateTo: TDateTimePicker;
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbTypeactClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    renCode: Integer;
    renName: String;
    ActTypeCode : Integer;
  public
    { Public declarations }
    reportvid : Integer;

  end;

var
  frmReportTechConditionsPlan: TfrmReportTechConditionsPlan;

implementation

uses
  ENDepartmentController, ShowENDepartment, ChildFormUnit, DMReportsUnit, EnergyproController,
  ShowENPlanWorkState, ENPlanWorkStateController;

{$R *.dfm}

procedure TfrmReportTechConditionsPlan.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

    SetLength(argNames, 12);
    SetLength(args, 12);

    argNames[0] := 'department';
    args[0] :=  IntToStr(renCode);

    argNames[1] := 'year';
    args[1] :=  edtYearGen1.Text;

    argNames[2] := 'month';
    args[2] :=   IntToStr(cbStartMonth1.ItemIndex + 1);

    argnames[3] := 'ActTypeCode';
    args[3]:=  IntToStr(ActTypeCode);

    reportName := 'TechConditions/CalendarPlan/CalendarPlanMain';

    if reportvid = 2  then
    reportName := 'Project/CalendarPlan';

    if reportvid = 3  then
    reportName := 'Project/CalendarPlanPKD';

    if reportvid = 4  then
    begin
     reportName := 'Project/LoadPersonal/dodat3AX';

     argNames[4] := 'pdate1';
     args[4] :=  '01.'+IntToStr(cbStartMonth1.ItemIndex + 1) + '.'+ edtYearGen1.Text;

     argNames[5] := 'pdate2';
     args[5] :=  '01.'+IntToStr(cbStartMonth1.ItemIndex + 1) + '.'+ edtYearGen1.Text;

     argNames[6] := 'rencode';
     args[6] :=  IntToStr(renCode);

     argNames[7] := 'plankind';
     args[7] :=  '4';

     argNames[8] := 'renname';
     args[8] := renName;

    end;

    argNames[9] := 'DetailingPlanTask';
    if chkDetailingPlanTask.Checked then
    args[9] := '1'
    else
    args[9] := '0';

     if reportvid = 0  then
     begin
       argNames[10] := 'dateStart';
       argNames[11] := 'dateFinal';

       args[10] := DateToStr(edtDateFrom.date);
       args[11] := DateToStr(edtDateTo.date);
     end;


    if CheckBox1.Checked then
    reportName := 'TechConditions/CalendarPlan/CalendarPlanMainSum';


    makeReport(reportName, argNames, args, 'xls');


end;

procedure TfrmReportTechConditionsPlan.FormCreate(Sender: TObject);
begin
    renCode:= 1;

    SetComboBoxCurrentYearWithStart(edtYearGen1, 2009, 2);
    SetComboBoxCurrentMonth(cbStartMonth1);

    ActTypeCode:= 0;



end;

procedure TfrmReportTechConditionsPlan.FormShow(Sender: TObject);
begin
  inherited;
    if reportvid = 2 then
    begin
      frmReportTechConditionsPlan.Caption:= ' Графік виконання робіт з проектування ';
      HideControls([lblWorkState,edtActType  , spbENPlanWorkState  , spbTypeactClear ]);
    end;

    if reportvid = 3 then
    begin
      frmReportTechConditionsPlan.Caption:= ' ПКД, яку розробляють сектори проектування ';
      HideControls([lblWorkState,edtActType  , spbENPlanWorkState  , spbTypeactClear ]);
    end;

    if reportvid = 4 then
    begin
      frmReportTechConditionsPlan.Caption:= ' Завантаження персоналу (проектантів) ';
      HideControls([lblWorkState,edtActType  , spbENPlanWorkState  , spbTypeactClear ]);
    end;

    if reportvid = 0  then
     begin
       HideControls([lblDateFrom , edtDateFrom , lblDateTo , edtDateTo ],false);
        HideControls([ Label2 , edtYearGen1 , Label6 , cbStartMonth1  ],true);
     end;

    renName:= '';
end;

procedure TfrmReportTechConditionsPlan.spbENPlanWorkStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
   f: ENPlanWorkStateFilter;
begin

  f := ENPlanWorkStateFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.conditionSQL := ' enplanworkstate.code in (2 , 3 , 4 )';

   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal , f);
   try
      with frmENPlanWorkStateShow do begin
      DisableActions([ actEdit, actInsert ],DialogState = dsView  );
        if ShowModal = mrOk then
        begin
            try
               edtActType.Text:= GetReturnValue(sgENPlanWorkState,1);
               ActTypeCode:= StrToInt(GetReturnValue(sgENPlanWorkState,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmReportTechConditionsPlan.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 1;
  renName := '';
  edtEPRenName.Text := '';

end;

procedure TfrmReportTechConditionsPlan.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportTechConditionsPlan.spbTypeactClearClick(Sender: TObject);
begin

   ActTypeCode := 0 ;
   edtActType.Text := '' ;
end;

end.
