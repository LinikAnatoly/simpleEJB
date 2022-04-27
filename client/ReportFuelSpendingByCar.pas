unit ReportFuelSpendingByCar;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, DateUtils, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmReportFuelSpendingByCar = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDate: TLabel;
    dtpDateStart: TDateTimePicker;
    edtTransportReal: TEdit;
    lblTransportReal: TLabel;
    spbTransportReal: TSpeedButton;
    lblDateFrom: TLabel;
    dtpDateFinal: TDateTimePicker;
    lblDateFinal: TLabel;
    HTTPRIOTKTransportReal: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbTransportRealClick(Sender: TObject);

  private
    { Private declarations }



  public
    { Public declarations }
    transportRealCode : Integer;
    carName : String;

  end;

var
  frmReportFuelSpendingByCar: TfrmReportFuelSpendingByCar;

implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit, FINMolController, ShowFINMol, ShowTKFuelType,
     ShowTKTransportReal, TKTransportRealController;

{$R *.dfm}
 //----------------------------------------------------------------------------

procedure TfrmReportFuelSpendingByCar.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmReportFuelSpendingByCar.btnOkClick(Sender: TObject);
var
args, argNames : arrayOfString;
dateStart, dateFinal : TDate;
reportType : Integer;
transportController : TKTransportRealControllerSoapPort;
tktransportRealObj : TKTransportReal;
begin

  transportController := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;

  if (dtpDateStart.Checked = False) or (dtpDateFinal.Checked = False) then
  begin
      Application.MessageBox(PChar('Задайте період !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  if dtpDateStart.Date > dtpDateFinal.Date then
  begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;


  dateStart := dtpDateStart.Date;
  dateFinal := dtpDateFinal.Date;

  if (transportRealCode = -1) then
  begin
      Application.MessageBox(PChar('Оберіть транспорт !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  tktransportRealObj := transportController.getObject(transportRealCode);

  if(tktransportRealObj.fuelType.code = ENConsts.TKFUELTYPE_DIESEL) then
    reportType := 2
  else
    reportType := 1;

  SetLength(args, 5);
  SetLength(argNames, 5);

  argNames[0] := 'dateStart';
  args[0] := DateToStr(dateStart);

  argNames[1] := 'dateFinal';
  args[1] := DateToStr(dateFinal);

  argNames[2] := 'transportRealCode';
  args[2] := IntToStr(transportRealCode);

  argNames[3] := 'reportType';
  args[3] := IntToStr(reportType);

    argNames[4] := 'carName';
  args[4] := carName;


  makeReport('transport/FuelSpendingByCar', argNames, args, 'xls');

  Self.Close;

end;

procedure TfrmReportFuelSpendingByCar.FormCreate(Sender: TObject);
begin
    transportRealCode := -1;
    carName := 'Невідомо';
end;

procedure TfrmReportFuelSpendingByCar.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtTransportReal]);
  dtpDateStart.Checked := True;
  dtpDateFinal.Checked := True;
  dtpDateFinal.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  dtpDateStart.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
end;

procedure TfrmReportFuelSpendingByCar.spbTransportRealClick(Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   realTransportFilter : TKTransportRealFilter;
begin
  inherited;
   realTransportFilter := TKTransportRealFilter.Create;
   SetNullXSProps(realTransportFilter);
   SetNullIntProps(realTransportFilter);

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal, realTransportFilter);

      with frmTKTransportRealShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               transportRealCode := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTransportReal.Text := GetReturnValue(sgTKTransportReal,4);
               carName := edtTransportReal.Text;
            finally

            end;
        end;
      end;

end;

end.
