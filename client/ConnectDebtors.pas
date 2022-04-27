unit ConnectDebtors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons , DialogFormUnit;

type
  TfrmConnectDebtors = class(TDialogForm)
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    lblMonthRaznar: TLabel;
    Label1: TLabel;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
		{ Private declarations }
		renCode :Integer;
		renName :String;
  public
    { Public declarations }
  end;

var
  frmConnectDebtors: TfrmConnectDebtors;

implementation

uses
  ShowENDepartment, ENDepartmentController,  ChildFormUnit, 
  DMReportsUnit, EnergyproController;

{$R *.dfm}

procedure TfrmConnectDebtors.FormShow(Sender: TObject);
begin
		dtpStartDate.Date:= date;
		dtpEndDate.Date:= Date;
		renCode := 0;
		renName := '';
end;

procedure TfrmConnectDebtors.spbEPRenClick(Sender: TObject);
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

procedure TfrmConnectDebtors.spbEPRenClearClick(Sender: TObject);
begin
	renCode := 0;
	renName := '';
	edtEPRenName.Text := '';
end;

procedure TfrmConnectDebtors.btnOkClick(Sender: TObject);

	var
	argNames, args : ArrayOfString;
	reportName : String;
begin
		SetLength(argNames, 4);
		SetLength(args, 4);

		argNames[0] := 'pdatestart';
		if not dtpStartDate.Checked then
    args[0] := '01.01.2000'
    else
		args[0] := DateToStr(dtpStartDate.DateTime);

		argNames[1] := 'pdatefinal';
		if not dtpEndDate.Checked then
		args[1] := '01.01.2060'
		else
		args[1] := DateToStr(dtpEndDate.DateTime);


		argNames[2] := 'DepartmentCode';
		args[2]:= IntToStr( renCode);

		argNames[3] := 'DepartmentName';
		args[3]:= renName;

		reportName := 'Timetables/Monitoring';

		makeReport(reportName, argNames, args, 'xls')
		

end;

end.
