unit ReportExaminationTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit, EnergyProController, ChildFormUnit,
  ExtCtrls;

type
  TfrmReportExaminationTP = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblrenName: TLabel;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtEPRenName: TEdit;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblBelonging: TLabel;
    cbBelongingType: TComboBox;
    rgPlanKindCode: TRadioGroup;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
		renName: String;
		type_report : Integer;  // (1- ТП-6-10
														//  2- ПЛ-6-10
														//  3- ПЛ-0,4кВ)
    geoDeptCode : Integer;

  end;

var
  frmReportExaminationTP: TfrmReportExaminationTP;

implementation
uses ShowENDepartment, ENDepartmentController, DMReportsUnit,
  ShowENGeographicDepartment, ENGeographicDepartmentController;
{$R *.dfm}

procedure TfrmReportExaminationTP.btnGeographClearClick(Sender: TObject);
begin
 geoDeptCode := 0;
 edtGeograph.Text := '';

end;

procedure TfrmReportExaminationTP.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  if renCode <> 0 then

   Filter.conditionSQL := ' ENGEOGRAPHICDEPARTMENT.CODE in ( select ee.geodepartmentrefcode ' +
                          ' from engeodep2endepartment ee '+
                          ' where ee.departmentrefcode  = ' + IntToStr(renCode) + ')';



  //Filter.code := 1;
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
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmReportExaminationTP.btnOkClick(Sender: TObject);
var
    ArgNames, args: ArrayOfString;
begin
			SetLength(argNames, 6);
      SetLength(args, 6);
			argNames[0] := 'DepartmentCode';
			argNames[1] := 'YearGen';
			argNames[2] := 'BelongingCode';
			argNames[3] := 'DepartmentName';
      argNames[4] := 'planKindCode'; // SUPP-11241 Добавлен параметр Вид плана
      argNames[5] := 'geoDeptCode';
			args[0] := IntToStr(RenCode);
			args[1] := edtYearGen.Text;
			args[2] := IntToStr(cbBelongingType.ItemIndex);
			args[3] := RenName;
			args[4] := IntToStr(rgPlanKindCode.ItemIndex + 1);
      args[5] := IntToStr(geoDeptCode);

			if type_report = 1 then
			makeReport('Timetables/ExaminationTP', argNames, args, 'xls')
			else if type_report = 2 then
			makeReport('Timetables/ExaminationPL_6_10', argNames, args, 'xls')
			else if type_report = 3 then
			makeReport('Timetables/ExaminationPL_04', argNames, args, 'xls');

      Self.Close;
end;

procedure TfrmReportExaminationTP.FormCreate(Sender: TObject);
begin
  inherited;
  {SUPP-74262}SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, true);
end;

procedure TfrmReportExaminationTP.FormShow(Sender: TObject);
begin
     DisableControls([edtEPRenName , edtGeograph ]);
     renCode := 0;
     geoDeptCode := 0;
end;



procedure TfrmReportExaminationTP.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportExaminationTP.spbEPRenClearClick(Sender: TObject);
begin
 renCode := 0;
 RenName := '';
 edtEPRenName.Text := RenName;
end;

end.
