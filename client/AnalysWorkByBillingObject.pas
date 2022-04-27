unit AnalysWorkByBillingObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, ComCtrls , ENPlanWorkController,
  EnergyproController;

type
  TfrmAnalysWorkByBillingObject = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDateFrom: TDateTimePicker;
    Label2: TLabel;
    edtDateTo: TDateTimePicker;
    lblRen: TLabel;
    edtRen: TEdit;
    spbEPRen: TSpeedButton;
    lblAccountNumber: TLabel;
    edtAccountNumber: TEdit;
    rbByt: TRadioButton;
    rbProm: TRadioButton;
    procedure spbEPRenClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode : Integer;
  end;

var
  frmAnalysWorkByBillingObject: TfrmAnalysWorkByBillingObject;

implementation

{$R *.dfm}
uses ShowENEPRen, ChildFormUnit, DMReportsUnit;

procedure TfrmAnalysWorkByBillingObject.FormShow(Sender: TObject);
begin
  DisableControls([edtRen]);
end;

procedure TfrmAnalysWorkByBillingObject.spbEPRenClick(Sender: TObject);
var
  frmENEPRenShow: TfrmENEPRenShow;
  f: EPRenFilter;
begin
  f := EPRenFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  
  f.conditionSQL := 'exists (select * from endepartment2epren d2r where d2r.billingserverip is not null and d2r.renrefcode=epren.code)';

  frmENEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal,f);
  try
    with frmENEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          renCode := StrToInt(GetReturnValue(sgEPRen,0));
          edtRen.Text := GetReturnValue(sgEPRen,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENEPRenShow.Free;
  end;
end;

procedure TfrmAnalysWorkByBillingObject.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
Begin
      if renCode<=0 then
      begin
         ShowMessage('Виберіть РЕМ !');
         edtRen.SetFocus;
         ModalResult:=mrNone;
         Exit;
      end;

      if edtAccountNumber.Text='' then
      begin
         ShowMessage('Вкажіть особових рахунок !');
         edtAccountNumber.SetFocus;
         ModalResult:=mrNone;
         Exit;
      end;

      SetLength(argNames, 5);
      SetLength(args, 5);

      argNames[0] := 'dateFrom';
      args[0] := dateToStr(edtDateFrom.date);

      argNames[1] := 'dateTo';
      args[1] := dateToStr(edtDateTo.date);

      argnames[2] := 'renCode';
      args[2] := IntToStr(renCode);

      argnames[3] := 'isProm';
      if rbProm.Checked then
         args[3] := '1'
      else
         args[3] := '0';

      argnames[4] := 'accountNumber';
      args[4] := edtAccountNumber.Text;

      reportName := 'RepEnergozbyt/ExecutedWorkByObject/workByBillingObject';


    //  makeReport(reportName, argNames, args, 'xls');

    makeReportAuth(reportName, argNames, args, 'xls');

end;

end.
