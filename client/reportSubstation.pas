unit reportSubstation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls ,DialogFormUnit;

type
  TfrmReportSubstatioon = class(TDialogForm)
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   renCode : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportSubstatioon: TfrmReportSubstatioon;

implementation

uses ShowENEPRen, EnergyproController, DMReportsUnit, ChildFormUnit;

{$R *.dfm}

procedure TfrmReportSubstatioon.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
    SetLength(argNames, 1);
    SetLength(args, 1);

    argNames[0] := 'renrefcode';
    args[0] := IntToStr(renCode);

    reportName := 'reportSubstation/substation04';

    makeReport(reportName, argNames, args, 'xls');


end;

procedure TfrmReportSubstatioon.FormCreate(Sender: TObject);
begin
  rencode:= -1;
end;

procedure TfrmReportSubstatioon.FormShow(Sender: TObject);
begin
  DisableControls([edtEPRenName]);
end;

procedure TfrmReportSubstatioon.spbEPRenClick(Sender: TObject);
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
