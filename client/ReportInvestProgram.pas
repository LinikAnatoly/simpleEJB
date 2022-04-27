unit ReportInvestProgram;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls , DialogFormUnit, ComCtrls ;

type
  TfrmReportInvestProgram = class(TDialogForm)
    lblip: TLabel;
    edtip: TEdit;
    btnspbip: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtInvestProgramGroupsName: TEdit;
    btnInvestProgramGroups: TSpeedButton;
    lbl1: TLabel;
    lblDate: TLabel;
    dtpDateGen: TDateTimePicker;
    procedure btnspbipClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInvestProgramGroupsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ipcode , invgroupRefCode  : Integer;
  end;

var
  frmReportInvestProgram: TfrmReportInvestProgram;

implementation

uses ShowENIP, ChildFormUnit, ShowENInvestProgramGroups,
  ENInvestProgramGroupsController, DMReportsUnit, EnergyproController;

{$R *.dfm}

procedure TfrmReportInvestProgram.btnInvestProgramGroupsClick(Sender: TObject);
var
   frmENInvestProgramGroupsShow : TfrmENInvestProgramGroupsShow;
   f : ENInvestProgramGroupsFilter;
begin
   f := ENInvestProgramGroupsFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal, f);

   try
      with frmENInvestProgramGroupsShow do begin
        if ShowModal = mrOk then
        begin
            try

               invgroupRefCode := StrToInt(GetReturnValue(sgENInvestProgramGroups,0));
               edtInvestProgramGroupsName.Text := GetReturnValue(sgENInvestProgramGroups,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENInvestProgramGroupsShow.Free;
   end;

end;

procedure TfrmReportInvestProgram.btnOkClick(Sender: TObject);
var
argNames, args: ArrayOfString;
  reportName ,  strBudget , strGroupmaterials : String;
  i : integer;
begin
  if ipcode = 0  then
  begin
         ShowMessage('Оберіть Інвест-програму!!! ');
         exit;
  end;
      SetLength(argNames, 10);
      SetLength(args, 10);

      argNames[0] := 'ipcode';
      argNames[2] := 'datereport';
      argNames[3] := 'investProgramGroupCode';


      args[0] := IntToStr(ipcode);
      args[2] := DateToStr(dtpDateGen.date);
      args[3] := IntToStr(invgroupRefCode);

      reportName := 'Invest/InvestProgr/InvestProgrMain';

      makeReport(reportName, argNames, args, 'xlsx');
end;

procedure TfrmReportInvestProgram.btnspbipClick(Sender: TObject);
var
  frmENIPShow: TfrmENIPShow;
begin
  frmENIPShow := TfrmENIPShow.Create(Application, fmNormal);
  try
    with frmENIPShow do
      if ShowModal = mrOk then
      begin
        try
          ipcode := StrToInt(GetReturnValue(sgENIP, 0));
          edtip.Text := GetReturnValue(sgENIP, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENIPShow.Free;
  end;
end;

procedure TfrmReportInvestProgram.FormShow(Sender: TObject);
begin
   DisableControls([edtip , edtInvestProgramGroupsName ]);
end;

end.
