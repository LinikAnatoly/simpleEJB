unit ReportPhysVolumes;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls;

type
  TfrmReportPhysVolumes = class(TDialogForm)
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtEPRenName: TEdit;
    lblENBudgetName: TLabel;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    edtENBudgetName: TEdit;
    lblENElementName: TLabel;
    spbENElementType: TSpeedButton;
    spbENElementTypeClear: TSpeedButton;
    edtENElementTypeName: TEdit;
    gpbEdtReport: TGroupBox;
    rbYear: TRadioButton;
    rbMonth: TRadioButton;
    rbForm58: TRadioButton;
    rbForm59: TRadioButton;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    gpbEdtActType: TGroupBox;
    rbKR: TRadioButton;
    rbTO: TRadioButton;
    lblEnSubstationTypeName: TLabel;
    spbENSubstationType: TSpeedButton;
    spbENSubstationTypeClear: TSpeedButton;
    edtENSubstationTypeName: TEdit;
    lblQuarterGen: TLabel;
    edtQuarterGen: TComboBox;
    gpbPlanKind: TGroupBox;
    rbPlanAnnual: TRadioButton;
    rbPlanMonthly: TRadioButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbENElementTypeClick(Sender: TObject);
    procedure spbENElementTypeClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure rbYearClick(Sender: TObject);
    procedure spbENSubstationTypeClick(Sender: TObject);
    procedure spbENSubstationTypeClearClick(Sender: TObject);
    procedure rbForm58Click(Sender: TObject);
    procedure rbMonthClick(Sender: TObject);
    procedure rbForm59Click(Sender: TObject);
    procedure rbKRClick(Sender: TObject);
    procedure rbTOClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);

  private
    { Private declarations }
    ReportType: Integer; {Тип отчета}
    procedure ClearBudget();
    procedure ClearRen();
    procedure ClearElementType();
    procedure ClearSubstationType();
    procedure SwitchRen(OnOff: Boolean);
    procedure SwitchGeoDepartment(OnOff: Boolean);
    procedure SwitchElementType(OnOff: Boolean);
    procedure SwitchSubstationType(OnOff: Boolean);
    procedure SwitchActType(OnOff: Boolean);
    procedure SwitchMonthQuarterGen(OnOff: Boolean);
    procedure MonthToQuarter(OnOff: Boolean);
    procedure SwitchPlanWorkKind(OnOff: Boolean);


  public
    { Public declarations }
    IsKR: Boolean;
    renCode: Integer;
    renName: String;
    elementtypeCode: Integer;
    elementtypeName: String;
    budgetCode: Integer;
    budgetName: String;
    substationtypeCode: Integer;
    substationtypeName: String;

    geoDeptCode : Integer;
    geoDeptName : string;

  end;

var
  frmReportPhysVolumes: TfrmReportPhysVolumes;

implementation
uses EnSubstationTypeController, ShowENDepartment , ENDepartmentTypeController , ENDepartmentController , ChildFormUnit , ENConsts
     , ShowENElement, ShowENElementType, ShowENSubstationType, ENElementController , ENElementTypeController, EnergyproController, DMReportsUnit,
  ShowENGeographicDepartment, ENGeographicDepartmentController;

{$R *.dfm}
 //----------------------------------------------------------------------------
 procedure TfrmReportPhysVolumes.ClearBudget();
begin
 budgetCode := 0;
 budgetName := '';
 edtENBudgetName.Text := budgetName;
end;

procedure TfrmReportPhysVolumes.ClearRen();
begin
 renCode := 0;
 RenName := '';
 edtEPRenName.Text := RenName;
end;

procedure TfrmReportPhysVolumes.ClearSubstationType();
begin
    substationtypeCode := 0;
    substationtypeName := '';
    edtENSubstationtypeName.Text := substationtypeName;
end;

procedure TfrmReportPhysVolumes.ClearElementType();
begin
    elementtypeCode := 0;
    elementtypeName := '';
    edtENElementTypeName.Text := elementtypeName;
end;

procedure TfrmReportPhysVolumes.SwitchRen(OnOff: Boolean);
begin
  spbEPRen.Enabled := OnOff;
  spbEPRenClear.Enabled := OnOff;

end;

procedure TfrmReportPhysVolumes.SwitchGeoDepartment(OnOff: Boolean);
begin
  btnGeograph.Enabled := OnOff;
  btnGeographClear.Enabled := OnOff;

end;

procedure TfrmReportPhysVolumes.SwitchSubstationType(OnOff: Boolean);
begin
  spbENSubstationType.Enabled := OnOff;
  spbENSubstationTypeClear.Enabled := OnOff;
end;

procedure TfrmReportPhysVolumes.SwitchPlanWorkKind(OnOff: Boolean);
begin
    if((OnOff = True) and (not gpbPlanKind.Visible)) then
      rbPlanMonthly.Checked := True;
    gpbPlanKind.Visible := OnOff;

end;

procedure TfrmReportPhysVolumes.SwitchElementType(OnOff: Boolean);
begin
  spbENElementType.Enabled := OnOff;
  spbENElementTypeClear.Enabled := OnOff;
end;

procedure TfrmReportPhysVolumes.SwitchActType(OnOff: Boolean);
begin
  rbKR.Enabled := OnOff;
  rbTO.Enabled := OnOff;
end;

procedure TfrmReportPhysVolumes.SwitchMonthQuarterGen(OnOff: Boolean);
begin
  edtMonthGen.Enabled := OnOff;
  edtQuarterGen.Enabled := OnOff;
end;

procedure TfrmReportPhysVolumes.MonthToQuarter(OnOff: Boolean);
begin
if OnOff = true then
begin
  lblMonthGen.Visible := false;
  lblQuarterGen.Visible := true;
  edtMonthGen.Visible := false;
  edtQuarterGen.Visible := true;
end
else
begin
  lblMonthGen.Visible := true;
  lblQuarterGen.Visible := false;
  edtMonthGen.Visible := true;
  edtQuarterGen.Visible := false;
end;
end;



// -----------------------------------------------------------------------------
procedure TfrmReportPhysVolumes.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   Filter : ENDepartmentFilter;
begin
  Filter := ENDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  Filter.code := 1;
  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, Filter);
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

procedure TfrmReportPhysVolumes.spbEPRenClearClick(Sender: TObject);
begin
ClearRen();
end;

procedure TfrmReportPhysVolumes.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   Filter : ENDepartmentFilter;
begin
   Filter := ENDepartmentFilter.Create;
   SetNullIntProps(Filter);
   SetNullXSProps(Filter);
   Filter.typeRef := ENDepartmentTypeRef.Create;
   Filter.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   Filter.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, Filter);
   try

      with frmENDepartmentShow do
      begin
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgetName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmReportPhysVolumes.spbENBudgetClearClick(Sender: TObject);
begin
ClearBudget();
end;

procedure TfrmReportPhysVolumes.spbENElementTypeClick(Sender: TObject);
var
  frmENElementTypeShow: TfrmENElementTypeShow;
  Filter: ENElementTypeFilter;
begin
  Filter := ENElementTypeFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  Filter.orderBySQL := 'code';



  frmENElementTypeShow := TfrmENElementTypeShow.Create(Application,fmNormal, Filter);
  try
  with frmENElementTypeShow do
      if ShowModal = mrOk then
      begin
        try
          elementtypeCode := StrToInt(GetReturnValue(sgENElementType,0));
          elementtypeName := GetReturnValue(sgENElementType,1);
          edtENElementTypeName.Text := elementtypeName;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementTypeShow.Free;
  end;

  ClearSubstationType();
  if elementtypeCode=3 then
  begin
  SwitchSubstationType(true);
  end
  else
  begin
  SwitchSubstationType(false);
  end;

end;

procedure TfrmReportPhysVolumes.spbENElementTypeClearClick(Sender: TObject);
begin
ClearElementType();
SwitchSubstationType(false);
ClearSubstationType();
end;

procedure TfrmReportPhysVolumes.btnGeographClearClick(Sender: TObject);
begin
   geoDeptCode := 0;
   edtGeograph.Text := '';

end;

procedure TfrmReportPhysVolumes.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  if renCode <> 0 then //departmentcode
     Filter.conditionSQL := ' ENGEOGRAPHICDEPARTMENT.CODE in ( select ee.geodepartmentrefcode ' +
                            ' from engeodep2endepartment ee '+
                            ' where ee.departmentrefcode  = ' + IntToStr(renCode) + ')';


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin geoDeptCode := 0; Exit; end;
                end;
                 geoDeptCode := selected.code;
                 geoDeptName := selected.name;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmReportPhysVolumes.btnOkClick(Sender: TObject);
var

  IsReportFormed: Boolean;
  planKindCode : Integer; // SUPP-11241 Код вида плана
  argNamesForm, argsForm: ArrayOfString; {Набор параметров для Форм 58 и 59}
  argNamesMonthly, argsMonthly: ArrayOfString; {Набор параметров для месячных отчетов}
  argNamesAnnual, argsAnnual: ArrayOfString; {Набор параметров для годовых отчетов}

begin

    if rbPlanAnnual.Checked then planKindCode := 1
    else planKindCode := 2;


    IsReportFormed := false;

    SetLength(argNamesForm, 3);
    SetLength(argsForm, 3);

    SetLength(argNamesMonthly,5);
    SetLength(argsMonthly,5);

    SetLength(argNamesAnnual, 5);
    SetLength(argsAnnual, 5);

    argNamesForm[0] := 'QuarterGen';
    argNamesForm[1] := 'YearGen';
    argNamesForm[2] := 'planKindCode';

    argsForm[0] := edtQuarterGen.Text;
    argsForm[1] := edtYearGen.Text;
    argsForm[2] := IntToStr(planKindCode);

    argNamesMonthly[0] := 'DepartmentCode';
    argNamesMonthly[1] := 'MonthGen';
    argNamesMonthly[2] := 'YearGen';
    argNamesMonthly[3] := 'geoDeptCode';
    argNamesMonthly[4] := 'geoDeptName';


    argsMonthly[0] := IntToStr(renCode);
    argsMonthly[1] := IntToStr(edtMonthGen.ItemIndex+1);
    argsMonthly[2] := edtYearGen.Text;
    argsMonthly[3] := IntToStr(geoDeptCode);
    argsMonthly[4] := geoDeptName;

    argNamesAnnual[0] := 'DepartmentCode';
    argNamesAnnual[1] := 'YearGen';
    argNamesAnnual[2] := 'planKindCode';
    argNamesAnnual[3] := 'geoDeptCode';
    argNamesAnnual[4] := 'geoDeptName';

    argsAnnual[0] := IntToStr(renCode);
    argsAnnual[1] := edtYearGen.Text;
    argsAnnual[2] := IntToStr(planKindCode);
    argsAnnual[3] := IntToStr(geoDeptCode);
    argsAnnual[4] := geoDeptName;

  Case budgetCode of
  {Выбор отчета Конец}
  0:
  begin
   MessageDlg('Оберить бюджетотримача', mtError, [mbOK],0);
   Exit;
  end;
   ENBUDGET_SRM:
  begin {Отчеты для СРМ Начало}
    Case ReportType of
    1:
      begin {Річні начало}
        Case elementtypeCode of
        0:
        begin
          MessageDlg('Оберить тип об`єкту', mtError, [mbOK],0);
          Exit;
        end;
        1:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Annual/rep500000001', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          false:
            begin
            makeReport('PhysVolumes/Annual/rep500000002', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          end;
        2:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Annual/rep500000003', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          false:
            begin
            makeReport('PhysVolumes/Annual/rep500000004', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          end;
      3:
        Case substationtypeCode of
        0:
          Case IsKR of
          false:
            begin
            makeReport('PhysVolumes/Annual/rep500000008', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          end;
        1,3,4:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Annual/rep500000005', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          end;
        2:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Annual/rep500000006', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          end;
        75000000:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Annual/rep500000007', argNamesAnnual, argsAnnual, 'xls');
            IsReportFormed := true;
            end;
          end;
        end;
        EN_LINE_CABLE: begin
            Case IsKR of
            true:
              begin
              makeReport('PhysVolumes/Annual/rep1012000005', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            false:
              begin
              makeReport('PhysVolumes/Annual/rep1012000006', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            end;
        end;
      end;
    end; {Річні Конец}
    2:
    begin {Місячні Начало}
    Case elementtypeCode of
      0:
      begin
        MessageDlg('Оберить тип об`єкту', mtError, [mbOK],0);
        Exit;
      end;
      1:
        Case IsKR of
        true:
          begin
          makeReport('PhysVolumes/Monthly/rep500000001', argNamesMonthly, argsMonthly, 'xls');
          IsReportFormed := true;
          end;
        false:
          begin
          makeReport('PhysVolumes/Monthly/rep500000002', argNamesMonthly, argsMonthly, 'xls');
          IsReportFormed := true;
          end;
        end;
      2:
        Case IsKR of
        true:
          begin
          makeReport('PhysVolumes/Monthly/rep500000003', argNamesMonthly, argsMonthly, 'xls');
          IsReportFormed := true;
          end;
        false:
          begin
          makeReport('PhysVolumes/Monthly/rep500000004', argNamesMonthly, argsMonthly, 'xls');
          IsReportFormed := true;
          end;
        end;
      3:
        Case substationtypeCode of
        0:
          Case IsKR of
          false:
            begin
            makeReport('PhysVolumes/Monthly/rep500000008', argNamesMonthly, argsMonthly, 'xls');
            IsReportFormed := true;
            end;
          end;
        1,3,4:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Monthly/rep500000005', argNamesMonthly, argsMonthly, 'xls');
            IsReportFormed := true;
            end;
          end;
        2:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Monthly/rep500000006', argNamesMonthly, argsMonthly, 'xls');
            IsReportFormed := true;
            end;
          end;
        75000000:
          Case IsKR of
          true:
            begin
            makeReport('PhysVolumes/Monthly/rep500000007', argNamesMonthly, argsMonthly, 'xls');
            IsReportFormed := true;
            end;
          end;
        end;
        EN_LINE_CABLE: begin
            Case IsKR of
            true:
              begin
              makeReport('PhysVolumes/Annual/rep1012000005', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            false:
              begin
              makeReport('PhysVolumes/Annual/rep1012000006', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            end;
          end;
      end;
    end; {Місячні Конец}
    3:
    begin {Форма 58 Начало}
      makeReport('PhysVolumes/Form58/Form58KR', argNamesForm, argsForm, 'xls');
      IsReportFormed := true;
    end; {Форма 58 Конец}
    4:
    begin {Форма 59 Начало}
      makeReport('PhysVolumes/Form59/Form59TO', argNamesForm, argsForm, 'xls');
      IsReportFormed := true;
    end; {Форма 59 Конец}
    end;

  end; {Отчеты для СРМ Конец}
  ENBUDGET_SKEM: begin
    Case ReportType of
    1: begin
        Case elementtypeCode of
        0:
          begin
            MessageDlg('Оберить тип об`єкту', mtError, [mbOK],0);
            Exit;
          end;
        EN_LINE_CABLE: begin
            Case IsKR of
            true:
              begin
              makeReport('PhysVolumes/Annual/rep1012000005', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            false:
              begin
              makeReport('PhysVolumes/Annual/rep1012000006', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            end;
          end;
        End;
    end;
    2: begin
        Case elementtypeCode of
        0:
          begin
            MessageDlg('Оберить тип об`єкту', mtError, [mbOK],0);
            Exit;
          end;
        EN_LINE_CABLE: begin
            Case IsKR of
            true:
              begin
              makeReport('PhysVolumes/Monthly/rep1012000005', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            false:
              begin
              makeReport('PhysVolumes/Monthly/rep1012000006', argNamesAnnual, argsAnnual, 'xls');
              IsReportFormed := true;
              end;
            end;
          end;
        End;
    end;
    End;
  end;
  end; {Выбор отчета Конец}

  if IsReportFormed = false then
  begin
  MessageDlg('Для обраних параметрів звіту не існує', mtError, [mbOK],0);
  Exit;
  end
  else
  begin
  Close;
  end;

end;

procedure TfrmReportPhysVolumes.rbYearClick(Sender: TObject);
begin

ReportType := 1;

  SwitchRen(true);
  SwitchGeoDepartment(true);
  SwitchElementType(true);
  SwitchActType(true);
  SwitchMonthQuarterGen(false);

  SwitchPlanWorkKind(true);

end;

procedure TfrmReportPhysVolumes.spbENSubstationTypeClick(Sender: TObject);
var
  frmENSubstationTypeShow: TfrmENSubstationTypeShow;
begin
  frmENSubstationTypeShow := TfrmENSubstationTypeShow.Create(Application,fmNormal);
  try
  with frmENSubstationTypeShow do
      if ShowModal = mrOk then
      begin
        try
          substationtypeCode := StrToInt(GetReturnValue(sgENSubstationType,0));
          substationtypeName := GetReturnValue(sgENSubstationType,1);
          edtENSubstationTypeName.Text := substationtypeName;
        except
          on EConvertError do Exit;
        end;
      end;
  finally
  frmENSubstationTypeShow.Free;
  end;

end;

procedure TfrmReportPhysVolumes.spbENSubstationTypeClearClick(
  Sender: TObject);
begin
  inherited;
ClearSubstationType();
end;

procedure TfrmReportPhysVolumes.rbForm58Click(Sender: TObject);
begin
  inherited;

  ReportType := 3;

  ClearRen();
  SwitchRen(false);
  SwitchGeoDepartment(False);
  ClearElementType();
  SwitchElementType(false);
  ClearSubstationType();
  SwitchSubstationType(false);
  SwitchActType(false);
  MonthToQuarter(true);
  SwitchMonthQuarterGen(true);

SwitchPlanWorkKind(True);
end;

procedure TfrmReportPhysVolumes.rbMonthClick(Sender: TObject);
begin
  inherited;

  ReportType := 2;

  SwitchRen(true);
  SwitchGeoDepartment(true);
  SwitchElementType(true);
  SwitchActType(true);
  MonthToQuarter(false);
  SwitchMonthQuarterGen(true);

SwitchPlanWorkKind(False);

end;

procedure TfrmReportPhysVolumes.rbForm59Click(Sender: TObject);
begin
  inherited;

  ReportType := 4;

  ClearRen();
  SwitchRen(false);
  SwitchGeoDepartment(False);
  ClearElementType();
  SwitchElementType(false);
  ClearSubstationType();
  SwitchSubstationType(false);
  SwitchActType(false);
  MonthToQuarter(true);
  SwitchMonthQuarterGen(true);

SwitchPlanWorkKind(True);
end;



procedure TfrmReportPhysVolumes.rbKRClick(Sender: TObject);
begin
  inherited;
IsKR := True;
end;

procedure TfrmReportPhysVolumes.rbTOClick(Sender: TObject);
begin
  inherited;
IsKR := False;
end;

procedure TfrmReportPhysVolumes.FormShow(Sender: TObject);
begin
  inherited;
  ReportType := 1;

  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);

  rbKR.Checked := true;
  isKR := true;

  SwitchSubstationType(false);

  rbYear.Checked := true;
  SwitchMonthQuarterGen(false);

  MonthToQuarter(false);

  DisableControls([edtGeograph , edtEPRenName, edtENBudgetName, edtENElementTypeName, edtENSubstationTypeName]);

  geoDeptCode := 0;

end;

end.
