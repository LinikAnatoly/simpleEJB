unit repAutoNaryadPytev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons ;

type
  TfrmrepAutoNaryadPytev = class(TDialogForm)
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    cbPlanWorkKind: TComboBox;
    lblENPlanWorkKindKindName: TLabel;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
  renCode : Integer;
  renName : String ;
    { Public declarations }
  end;

var
  frmrepAutoNaryadPytev: TfrmrepAutoNaryadPytev;

implementation

{$R *.dfm}
uses ShowENDepartment ,  ENDepartmentController , ChildFormUnit ,
  DMReportsUnit , EnergyproController ;

procedure TfrmrepAutoNaryadPytev.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   frmENDepartmentShow.isCheckPodr := True;
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

procedure TfrmrepAutoNaryadPytev.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmrepAutoNaryadPytev.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin

      SetLength(argNames, 5);
      SetLength(args, 5);

      argNames[0] := 'pyeargen';
      args[0] := edtYearGen.Text;

      argNames[1] := 'pmonthgen';
      args[1] := IntToStr(edtMonthGen.ItemIndex + 1);


      argNames[2] := 'strdepartment';
      if  renCode = 1 then // если выбрали ’ерсонќблЁнерго то выбираем по всем пдразделени€м
      args[2] := ' and 0 = 0'
      else
      args[2] := ' and epd.code in ( ' + DMReports.getDepartmentCodesDown( renCode ) + ' )' ;


      argNames[3] := 'pkindcode';
      if cbPlanWorkKind.ItemIndex+1 > 0 then
      args[3] := intToStr( cbPlanWorkKind.ItemIndex +1 )
      else
      args[3] := '0';


      reportName := 'Auto/rp_auto_naryad_pytev';


      makeReport(reportName, argNames, args, 'xls');


end;

end.
