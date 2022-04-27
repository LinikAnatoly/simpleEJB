unit reportCounters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ChildFormUnit, Buttons, StdCtrls, ComCtrls;

type
  TfrmReportCounters = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName1: TLabel;
    lblClassAccuracy: TLabel;
    chbWithClassAccuracy: TCheckBox;
    Label1: TLabel;
    chbStart: TCheckBox;
    cbMonthBegin: TComboBox;
    Label5: TLabel;
    edtYearGen1: TComboBox;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbStartMonth: TComboBox;
    edtYearGen: TComboBox;
    Label7: TLabel;
    edtEPRenName1: TEdit;
    spbEPRen1: TSpeedButton;
    cbClassAccuracy: TComboBox;
    cbAll: TCheckBox;
    edtEPRenName: TEdit;
    spbEPRenClear: TSpeedButton;
    spbEPRen: TSpeedButton;
    lblEPRenName: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chbStartClick(Sender: TObject);
    procedure chbWithClassAccuracyClick(Sender: TObject);
    procedure spbEPRen1Click(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
  end;

var
  frmReportCounters: TfrmReportCounters;

  
implementation

uses ShowTKMaterials, EnergyproController, TKMaterialsController,
  DMReportsUnit, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, ENConsts,ShowENEPRen;

{$R *.dfm}


procedure TfrmReportCounters.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

   if (
   (
   ((cbStartMonth.ItemIndex<cbMonthBegin.ItemIndex)and(edtYearGen1.ItemIndex=edtYearGen.ItemIndex))
    or
   (edtYearGen1.ItemIndex>edtYearGen.ItemIndex)
   )

   and(chbStart.Checked)
   ) then
   begin
     showmessage('Невірно вибрана дата початку!');
     exit;
   end;
    if not cbAll.Checked then
    begin
    if chbWithClassAccuracy.Checked then
    begin
    SetLength(argNames, 8);
    SetLength(args, 8);

    argNames[0] := 'yearGen';
    args[0] :=  edtYearGen.Text;

    argNames[1] := 'monthGen';
    args[1] :=  IntToStr(cbStartMonth.ItemIndex + 1);

    argNames[2] := 'renCode';
    args[2] := IntToStr(renCode);

    argNames[3] := 'renName';
    args[3] := renName;

    argNames[4] := 'classAccuracy';
    args[4] := cbClassAccuracy.Text;


    argNames[5] := 'isPeriod';
    if chbStart.Checked then
      args[5] :='1'
    else
      args[5] :='0';

    argNames[6] := 'monthGen1';
    args[6] :=  IntToStr(cbMonthBegin.ItemIndex + 1);

    argNames[7] := 'yearGen1';
    args[7] :=  edtYearGen1.Text;

    reportName := 'RepEnergozbyt/counters_by_accuracy_and_date';
    end;

    if not chbWithClassAccuracy.Checked then
    begin
    SetLength(argNames, 7);
    SetLength(args, 7);

    argNames[0] := 'yearGen';
    args[0] :=  edtYearGen.Text;

    argNames[1] := 'monthGen';
    args[1] :=  IntToStr(cbStartMonth.ItemIndex + 1);

    argNames[2] := 'renCode';
    args[2] := IntToStr(renCode);

    argNames[3] := 'renName';
    args[3] := renName;

    argNames[4] := 'isPeriod';
    if chbStart.Checked then
      args[4] :='1'
    else
      args[4] :='0';

    argNames[5] := 'monthGen1';
    args[5] :=  IntToStr(cbMonthBegin.ItemIndex + 1);

    argNames[6] := 'yearGen1';
    args[6] :=  edtYearGen1.Text;

    reportName := 'RepEnergozbyt/counters_report_by_date';
    end;


    end
    else
    begin

    SetLength(argNames, 7);
    SetLength(args, 7);

    argNames[0] := 'yearGen';
    args[0] :=  edtYearGen.Text;

    argNames[1] := 'monthGen';
    args[1] :=  IntToStr(cbStartMonth.ItemIndex + 1);

    argNames[2] := 'renCode';
    args[2] := IntToStr(renCode);

    argNames[3] := 'renName';
    args[3] := renName;

    argNames[4] := 'isPeriod';
    if chbStart.Checked then
      args[4] :='1'
    else
      args[4] :='0';

    argNames[5] := 'monthGen1';
    args[5] :=  IntToStr(cbMonthBegin.ItemIndex + 1);

    argNames[6] := 'yearGen1';
    args[6] :=  edtYearGen1.Text;

    reportName := 'RepEnergozbyt/counters_report_by_date_all';



      end;
      makeReport(reportName, argNames, args, 'xlsx');

end;



procedure TfrmReportCounters.FormShow(Sender: TObject);
begin
cbMonthBegin.Enabled:=false;
lblClassAccuracy.Enabled:=false;
cbClassAccuracy.Enabled:=false;
    SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 5);
    SetComboBoxCurrentYearWithStart(edtYearGen1, 2009, 5);
    SetComboBoxCurrentMonth(cbMonthBegin);
    SetComboBoxCurrentMonth(cbStartMonth);
    renCode := 0;
end;

procedure TfrmReportCounters.chbStartClick(Sender: TObject);
begin
if chbStart.checked then
cbMonthBegin.Enabled:=true else cbMonthBegin.Enabled:=false;
end;

procedure TfrmReportCounters.chbWithClassAccuracyClick(Sender: TObject);
begin
if chbWithClassAccuracy.Checked then
begin
  lblClassAccuracy.Enabled:=true;
  cbClassAccuracy.Enabled:=true;
end
else
begin
  lblClassAccuracy.Enabled:=false;
  cbClassAccuracy.Enabled:=false;
end;

end;

procedure TfrmReportCounters.spbEPRen1Click(Sender: TObject);
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
               renName:=GetReturnValue(sgEPRen,1);
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;

end;

procedure TfrmReportCounters.spbEPRenClearClick(Sender: TObject);
begin
          renCode := 0;
          renName := '';
          edtEPRenName.Text := '';

end;

procedure TfrmReportCounters.spbEPRenClick(Sender: TObject);
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

end.
