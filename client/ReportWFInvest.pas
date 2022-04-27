unit ReportWFInvest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls , DialogFormUnit ;

type
  TfrmReportWFInvest = class(TDialogForm)
    lbladditional: TLabel;
    edtadditional: TEdit;
    btnadditional: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnadditionalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportWFInvest: TfrmReportWFInvest;

implementation

uses EnergyproController, ShowWFAdditionalDetailsType,
  WFAdditionalDetailsTypeController, DMReportsUnit, ChildFormUnit, WFConsts;

{$R *.dfm}

procedure TfrmReportWFInvest.btnadditionalClick(Sender: TObject);
var
   frmWFAdditionalDetailsTypeShow : TfrmWFAdditionalDetailsTypeShow;
   wfADTFilter:  WFAdditionalDetailsTypeFilter;
begin

   wfADTFilter := WFAdditionalDetailsTypeFilter.Create;
   SetNullIntProps(wfADTFilter);
   SetNullXSProps(wfADTFilter);

   wfADTFilter.subsystemcode :=  SUBSYSTEM_INVEST;

   frmWFAdditionalDetailsTypeShow:=TfrmWFAdditionalDetailsTypeShow.Create(Application,fmNormal,wfADTFilter);
   try
      with frmWFAdditionalDetailsTypeShow do begin

        if ShowModal = mrOk then
        begin
            try
               edtadditional.Text := GetReturnValue(sgWFAdditionalDetailsType,1);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmWFAdditionalDetailsTypeShow.Free;
   end;
end;

procedure TfrmReportWFInvest.btnOkClick(Sender: TObject);
var
args ,   argNames : ArrayOfString;
begin
   SetLength(argNames, 2);
   SetLength(args, 2);

   argnames[1] := 'additionalParamIP';
   args[1] :=  edtadditional.Text;

  // makeReport('Histograms/invest/invest_wrapper', ArrayOfString.Create('dummy'), ArrayOfString.Create('dummy'), 'xls');
      makeReport('Histograms/invest/invest_wrapper',argNames, args, 'xls');
end;

procedure TfrmReportWFInvest.FormShow(Sender: TObject);
begin
   DisableControls([edtadditional]);
end;

end.
