unit ReportRaznaryadkaHOE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFrmReportRaznaryadkaHOE = class(TDialogForm)
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblYearRaznar: TLabel;
    edtYearRaznar: TComboBox;
    edtMonthRaznar: TComboBox;
    lblMonthRaznar: TLabel;
    lbYearVvod: TLabel;
    edtYearVvod: TComboBox;
    edtMonthVvod: TComboBox;
    lbMonthVvod: TLabel;
    RadioGroup1: TRadioGroup;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    GroupBox1: TGroupBox;
    rbkindhoe: TRadioButton;
    rbkindbudg: TRadioButton;
    Label2: TLabel;
    rborderHoeplan: TRadioButton;
    rborderHoevneplan: TRadioButton;
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
  private
    { Private declarations }
   public
    { Public declarations }
    renCode: Integer;
    renName: String;
    budgetCode: Integer;
    budgetName: String;
  end;

var
  FrmReportRaznaryadkaHOE: TFrmReportRaznaryadkaHOE;

implementation

{$R *.dfm}
uses ENDepartmentController, ENDepartmentTypeController , ShowENDepartment , ENConsts , ChildFormUnit ;

procedure TFrmReportRaznaryadkaHOE.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
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

procedure TFrmReportRaznaryadkaHOE.spbEPRenClick(Sender: TObject);
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

procedure TFrmReportRaznaryadkaHOE.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';


end;

procedure TFrmReportRaznaryadkaHOE.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';

end;

end.
