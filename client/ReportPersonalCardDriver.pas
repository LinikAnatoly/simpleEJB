unit ReportPersonalCardDriver;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, Buttons,ChildFormUnit, ComCtrls, DateUtils;

type
  TfrmReportPersonalCardDriver = class(TDialogForm)
    lblENWorkerWorkerFactName: TLabel;
    edtENWorkerWorkerFactName: TEdit;
    spbENWorkerWorkerFact: TSpeedButton;
    spbFINWorkerClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dtpDateFinal: TDateTimePicker;
    lblDateFinal: TLabel;
    dtpDateStart: TDateTimePicker;
    lblPeriod: TLabel;
    lblDateFrom: TLabel;
    procedure spbENWorkerWorkerFactClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportPersonalCardDriver: TfrmReportPersonalCardDriver;
  vtabnumber : String;
  vfio :String;

implementation

uses ShowFINWorker, ENReportsController, EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportPersonalCardDriver.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  var ys,ms,ds,yf,mf,df: Word;
begin



      if dtpDateStart.Checked = false then
      begin
        Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

      if dtpDateFinal.Checked = false then
      begin
        Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

      if dtpDateStart.Date > dtpDateFinal.Date then
      begin
       Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
       Exit;
      end;

      SetLength(argNames, 4);
      SetLength(args, 4);


      argNames[0] := 'dateStart';
      args[0] := DateToStr(dtpDateStart.Date);

      argNames[1] := 'dateFinal';
      args[1] := DateToStr(dtpDateFinal.Date);

      argNames[2] := 'tabnumber';
      args[2] := vtabnumber;

      argNames[3] := 'fio';
      args[3] := vfio;

        reportName := 'transport/PersonalCardDriver';

        makeReport(reportName, argNames, args, 'xls')



end;

procedure TfrmReportPersonalCardDriver.FormShow(Sender: TObject);
begin
  DisableControls([edtENWorkerWorkerFactName]);
  dtpDateFinal.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  dtpDateStart.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

  dtpDateStart.Checked := true;
  dtpDateFinal.Checked := true;

end;

procedure TfrmReportPersonalCardDriver.spbENWorkerWorkerFactClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
  
begin

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   frmFINWorkerShow.isShowCEO := true;
   try
     frmFINWorkerShow.dateGet := GetTXSDateFromTDateTimePicker(dtpDateFinal);

     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin



            try
              edtENWorkerWorkerFactName.Text := GetReturnValue(sgFINWorker,1);
              vtabnumber := GetReturnValue(sgFINWorker,2);
              vfio  := GetReturnValue(sgFINWorker,1);


            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

end.
