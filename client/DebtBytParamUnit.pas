unit DebtBytParamUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,DialogFormUnit, ExtCtrls,ENDepartmentController,ChildFormUnit,
  ComCtrls;

type
  TfrmDebtBytParam = class(TDialogForm)
    cbItog: TCheckBox;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    dtpDate: TDateTimePicker;
    Label2: TLabel;
    edtSum: TEdit;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      renCode: Integer;
    renName: String;
  end;

var
  frmDebtBytParam: TfrmDebtBytParam;

implementation

uses ShowENDepartment;

{$R *.dfm}

procedure TfrmDebtBytParam.FormShow(Sender: TObject);
begin
dtpDate.DateTime:=Date();
end;

procedure TfrmDebtBytParam.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmDebtBytParam.spbEPRenClick(Sender: TObject);
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
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text :=renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

end.
