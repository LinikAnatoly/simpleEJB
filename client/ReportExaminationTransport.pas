unit ReportExaminationTransport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons , DialogFormUnit, ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient, DateUtils;

type
  TfrmReportExaminationTransport = class(TDialogForm)
    edtTransportDepartmentName: TEdit;
    dtpEndDate: TDateTimePicker;
    dtpStartDate: TDateTimePicker;
    Label4: TLabel;
    lblMonthRaznar: TLabel;
    Label3: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblTransportDepartment: TLabel;
    spbTransportDepartment: TSpeedButton;
    spbClearTransportDepartment: TSpeedButton;
    lblTKTransportType: TLabel;
    lblTKTransportRealCode: TLabel;
    spbTKTransportReal: TSpeedButton;
    spbTKTransportRealClear: TSpeedButton;
    edtTKTransportReal: TEdit;
    HTTPRIOTKTransportReal: THTTPRIO;
    cbTKTransportType: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure spbTransportDepartmentClick(Sender: TObject);
    procedure spbClearTransportDepartmentClick(Sender: TObject);
    procedure spbTKTransportRealClearClick(Sender: TObject);
    procedure spbTKTransportRealClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    transportDepartment : Integer;
    elementCode : Integer;
    elementName : String;
    transportDepartmentCode : Integer;
    fuelTypeCode : Integer;
    tktransportRealCode : Integer;

    procedure setTransportCode(pTransportDepartmentCode : Integer; pTransportDepartmentName : String);
    procedure setDateStart(date : TDate);
    procedure setDateFinal(date : TDate);
  end;

var
  frmReportExaminationTransport: TfrmReportExaminationTransport;

implementation

uses
  ENTransportDepartmentController, ShowENTransportDepartment,
  ShowENDepartment, ENDepartmentController,
  DMReportsUnit, EnergyproController,
  ShowENElement, ENElementController,
  ShowTKFuelType, TKFuelTypeController, TKTransportRealController,
  ShowTKTransportReal;

{$R *.dfm}


procedure TfrmReportExaminationTransport.setTransportCode(pTransportDepartmentCode : Integer; pTransportDepartmentName : String);
begin
  transportDepartmentCode := pTransportDepartmentCode;
  edtTransportDepartmentName.Text := pTransportDepartmentName;
end;

procedure TfrmReportExaminationTransport.setDateStart(date: TDate);
begin
  dtpStartDate.Date := date;
end;

procedure TfrmReportExaminationTransport.setDateFinal(date: TDate);
begin
  dtpEndDate.Date := date;
end;

procedure TfrmReportExaminationTransport.FormClose(Sender: TObject; var Action: TCloseAction);
var
  argNames, args : ArrayOfString;
  reportName : String;
  transportTypeIndex : Integer;
begin
  inherited;

 if (ModalResult = mrOk) then
 begin

    if dtpStartDate.Checked = false then
    begin
      Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if dtpEndDate.Checked = false then
    begin
      Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if dtpStartDate.Date > dtpEndDate.Date then
    begin
      Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if (  ( transportDepartmentCode = -1 ) and (ModalResult = mrOk) ) then
    begin
      Application.MessageBox('Оберіть підрозділ!', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    SetLength(args, 8);
    SetLength(argNames, 8);

    argNames[0] := 'transportDepartmentCode';
    argNames[1] := 'transportDepartmentName';
    argNames[2] := 'transportTypeCode';
    argNames[3] := 'transportTypeName';
    argNames[4] := 'realTransportCode';
    argNames[5] := 'realTransportName';
    argNames[6] := 'dateStart';
    argNames[7] := 'dateFinal';

    // Находим индекс
    transportTypeIndex := -1;
    if cbTKTransportType.ItemIndex >= 0
    then transportTypeIndex := cbTKTransportType.ItemIndex + 1;


    args[0] := IntToStr(transportDepartmentCode);
    args[1] := edtTransportDepartmentName.Text;
    args[2] := IntToStr(transportTypeIndex);
    args[3] := cbTKTransportType.Text;
    args[4] := IntToStr(tktransportRealCode);
    args[5] := edtTKTransportReal.Text;
    args[6] := DateToStr(dtpStartDate.DateTime);
    args[7] := DateToStr(dtpEndDate.DateTime);

    reportName := 'Timetables/ExaminationTransport/ExaminationTransport';

    makeReport(reportName, argNames, args, 'xls');

 end;

end;

procedure TfrmReportExaminationTransport.FormCreate(Sender: TObject);
begin
    transportDepartmentCode := -1;
    tktransportRealCode := -1;

    dtpStartDate.Date := Now;
    dtpStartDate.Checked := true;

    dtpEndDate.Date := Now;
    dtpEndDate.Checked := true;


end;

procedure TfrmReportExaminationTransport.spbTransportDepartmentClick(Sender: TObject);
var
   frmENTransportDepartmentShow : TfrmENTransportDepartmentShow;
begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin

        if ShowModal = mrOk then
        begin
               edtTransportDepartmentName.Text := GetReturnValue(sgENTransportDepartment,1);
               transportDepartmentCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               renName := GetReturnValue(sgENTransportDepartment,1);
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;


procedure TfrmReportExaminationTransport.spbClearTransportDepartmentClick(
  Sender: TObject);
begin
  transportDepartmentCode := -1;
  edtTransportDepartmentName.Text := '';
end;

procedure TfrmReportExaminationTransport.spbTKTransportRealClearClick(Sender: TObject);
begin
  inherited;
  edtTKTransportReal.Text := '';
  tktransportRealCode := -1;
end;

procedure TfrmReportExaminationTransport.spbTKTransportRealClick(Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   TempTKTransportReal: TKTransportRealControllerSoapPort;
   trReal : TKTransportReal;
begin
  frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
          try
      with frmTKTransportRealShow do
      begin
       if ShowModal = mrOk then
      begin
          tktransportRealCode := StrToInt(GetReturnValue(sgTKTransportReal,0));
          edtTKTransportReal.Text := GetReturnValue(sgTKTransportReal,4);
      end;
      end;
      finally
          frmTKTransportRealShow.Free;
        end;
end;

end.
