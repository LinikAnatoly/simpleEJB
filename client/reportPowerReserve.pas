unit reportPowerReserve;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DialogFormUnit, Buttons ,ENLine10Controller ,
  ChildFormUnit,	 EnergyproController;

type
  TfrmReportPowerReserve = class(TDialogForm)
    gbDatesRange: TGroupBox;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    dtpDateFrom: TDateTimePicker;
    dtpDateTo: TDateTimePicker;
    gbDatesRange2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDateFrom2: TDateTimePicker;
    dtpDateTo2: TDateTimePicker;
    cbPeriod1: TCheckBox;
    cbPeriod2: TCheckBox;
    lblMessage: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    gbReportFileType: TGroupBox;
    rbXLS: TRadioButton;
    rbPDF: TRadioButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    chkTechTerms: TCheckBox;
    chkWithoutBillng: TCheckBox;
    grpReserv: TGroupBox;
    rbReservOnlyNew: TRadioButton;
    rbReservOnlyExist: TRadioButton;
    rbReservAll: TRadioButton;
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkTechTermsClick(Sender: TObject);
  private
    { Private declarations }
  public
  rencode : Integer;
  renname : String;
    { Public declarations }
  end;

var
  frmReportPowerReserve: TfrmReportPowerReserve;
  ENLine10Obj: ENLine10;

implementation

uses ShowENEPRen;

{$R *.dfm}

procedure TfrmReportPowerReserve.chkTechTermsClick(Sender: TObject);
begin
  chkWithoutBillng.Visible := chkTechTerms.Checked;
end;

procedure TfrmReportPowerReserve.FormShow(Sender: TObject);
begin

  rencode := 0;
  renname := '';
  DisableControls([edtEPRenName]);
end;

procedure TfrmReportPowerReserve.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
               rencode := StrToInt(GetReturnValue(sgEPRen,0));
               renname :=GetReturnValue(sgEPRen,1);
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.
