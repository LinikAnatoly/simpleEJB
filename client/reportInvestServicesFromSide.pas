unit reportInvestServicesFromSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, CheckLst,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmreportInvestServicesFromSide = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtDateStart: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;

  end;

var
  frmreportInvestServicesFromSide: TfrmreportInvestServicesFromSide;

implementation

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController ,  ENPlanWorkController,
  ENTransportDepartmentController, ShowENTransportDepartment,
  ShowENPlanWorkState, ShowENPlanWorkType, DMReportsUnit;

{$R *.dfm}

procedure TfrmreportInvestServicesFromSide.spbEPRenClick(Sender: TObject);
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

procedure TfrmreportInvestServicesFromSide.btnOkClick(Sender: TObject);
var
args, argNames : arrayOfString;
dateStart, dateFinal : TDate;
begin

  if (edtDateStart.Checked = False) or (edtDateFinal.Checked = False) then
  begin
      Application.MessageBox(PChar('Задайте період !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  if edtDateStart.Date > edtDateFinal.Date then
  begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  dateStart := edtDateStart.Date;
  dateFinal := edtDateFinal.Date;

  SetLength(args, 2);
  SetLength(argNames, 2);

  argNames[0] := 'dateStart';
  args[0] := DateToStr(dateStart);

  argNames[1] := 'dateFinal';
  args[1] := DateToStr(dateFinal);


  makeReport('Invest/investWithPercent/investWithPercent', argNames, args, 'xls');

  Self.Close;

end;

procedure TfrmreportInvestServicesFromSide.FormCreate(Sender: TObject);
begin
  renCode := 0;
  renName := '';
end;

procedure TfrmreportInvestServicesFromSide.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

end.
