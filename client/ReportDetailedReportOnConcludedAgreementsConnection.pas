unit ReportDetailedReportOnConcludedAgreementsConnection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DateUtils, DMReportsUnit,DialogFormUnit,
  CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, ExtCtrls, ChildFormUnit;

type
  TfrmReportDetailedReportOnConcludedAgreementsConnection = class(TDialogForm)
    lblDateServices: TLabel;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateServicesFrom: TDateTimePicker;
    edtDateServicesTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDateTUFrom: TDateTimePicker;
    edtDateTUTo: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEnpayment2sodate: TLabel;
    lbllEnpayment2sodateFrom: TLabel;
    lbllEnpayment2sodateTo: TLabel;
    lblActIncomeDate: TLabel;
    lblActIncomeDateFrom: TLabel;
    lblActIncomeDateTo: TLabel;
    edtlEnpayment2sodateFrom: TDateTimePicker;
    edtlEnpayment2sodateTo: TDateTimePicker;
    edtActIncomeDateFrom: TDateTimePicker;
    edtActIncomeDateTo: TDateTimePicker;
    cbConnectionKind: TComboBox;
    lblConnectionKind: TLabel;
    lbtMaxdateactRmkbto: TLabel;
    lblStartMaxdateactRmkbto: TLabel;
    dtpStartMaxdateactRmkbto: TDateTimePicker;
    lblsEndMaxdateactRmkb6to: TLabel;
    dtpEndMaxdateactRmkbto: TDateTimePicker;
    lblDepartamentTU: TLabel;
    lblTUServicesPower: TLabel;
    edtTUServicesPowerFrom: TEdit;
    edtTUServicesPowerTo: TEdit;
    lblTUServicesPowerTo: TLabel;
    lblTUServicesPowerFrom: TLabel;
    edtENDepartmentDepartmentName: TEdit;
    spbENDepartmentDepartment: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    dtstartappeal: TDateTimePicker;
    Label6: TLabel;
    dtendappeal: TDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dtpEndFact: TDateTimePicker;
    dtpStartFact: TDateTimePicker;
    lblContractStatus: TLabel;
    cbContractStatus: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENDepartmentDepartmentClick(Sender: TObject);
  private
    { Private declarations }
    departmentCode: Integer;
  public
    { Public declarations }
  end;

var
  frmReportDetailedReportOnConcludedAgreementsConnection: TfrmReportDetailedReportOnConcludedAgreementsConnection;

implementation
uses EnergyproController , ENConsts, ShowENDepartment, ENDepartmentController ;

{$R *.dfm}

procedure TfrmReportDetailedReportOnConcludedAgreementsConnection.btnOkClick(
  Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;
  connectionKind : Integer;
begin
      if edtDateServicesFrom.Date > edtDateServicesTo.Date then
      begin
        Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

       if edtDateTUFrom.Date > edtDateTUTo.Date then
      begin
        Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

       if edtlEnpayment2sodateFrom.Date > edtlEnpayment2sodateTo.Date then
      begin
        Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

       if edtActIncomeDateFrom.Date > edtActIncomeDateTo.Date then
      begin
        Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

       if dtpStartFact.Date > dtpEndFact.Date then
      begin
        Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
        Exit;
      end;

      // Установка параметров
      SetLength(argNames, 19);
      SetLength(args, 19);

      argNames[0] := 'start_date_services';
      argNames[1] := 'end_date_services';
      argNames[2] := 'start_date_tu';
      argNames[3] := 'end_date_tu';
      argNames[4] := 'start_enpayment2sodate';
      argNames[5] := 'end_enpayment2sodate';
      argNames[6] := 'start_actIncomeDate';
      argNames[7] := 'end_actIncomeDate';
      argNames[8] := 'connectionKind';
      argNames[9] := 'departmentcode';
      argNames[10] := 'start_maxdateact_rmkbto';
      argNames[11] := 'end_maxdateact_rmkbto';
      argNames[12] := 'tyservicespowerFrom';
      argNames[13] := 'tyservicespowerTo';
      argNames[14] := 'start_appeal';
      argNames[15] := 'end_appeal';
      argNames[16] := 'start_fact';
      argNames[17] := 'end_fact';
      argNames[18] := 'filter_canceled';

      //args[0] := '15.03.2019';

      if edtDateServicesFrom.Checked then
          args[0] := DateToStr(edtDateServicesFrom.date)
      else
          args[0] := '';
      if edtDateServicesTo.Checked then
          args[1] := DateToStr(edtDateServicesTo.date)
      else
          args[1] := '';
      if edtDateTUFrom.Checked then
          args[2] := DateToStr(edtDateTUFrom.date)
      else
          args[2] := '';
      if edtDateTUTo.Checked then
          args[3] := DateToStr(edtDateTUTo.date)
      else
          args[3] := '';
      if edtlEnpayment2sodateFrom.Checked then
          args[4] := DateToStr(edtlEnpayment2sodateFrom.date)
      else
          args[4] := '';
      if edtlEnpayment2sodateTo.Checked then
          args[5] := DateToStr(edtlEnpayment2sodateTo.date)
      else
          args[5] := '';
      if edtActIncomeDateFrom.Checked then
          args[6] := DateToStr(edtActIncomeDateFrom.date)
      else
          args[6] := '';
      if edtActIncomeDateTo.Checked then
          args[7] := DateToStr(edtActIncomeDateTo.date)
      else
          args[7] := '';


          connectionKind := -1;
       case cbConnectionKind.ItemIndex 	of
         1: connectionKind := ENCONNECTIONKIND_UNDEFINED;
         2: connectionKind := ENCONNECTIONKIND_STANDART;
         3: connectionKind := ENCONNECTIONKIND_NO_STANDART;
         4: connectionKind := ENCONNECTIONKIND_NO_STANDART_READY_MADE;
         else connectionKind := -1;
       end;
       args[8] := IntToStr(connectionKind);

       if departmentCode <> -1 then
          args[9] := IntToStr(departmentCode)
       else
           args[9] := '-1';

       if dtpStartMaxdateactRmkbto.Checked then
          args[10] := DateToStr(dtpStartMaxdateactRmkbto.date)
       else
          args[10] := '';
       if dtpEndMaxdateactRmkbto.Checked then
          args[11] := DateToStr(dtpEndMaxdateactRmkbto.date)
       else
          args[11] := '';

       if edtTUServicesPowerFrom.Text <> '' then
          args[12] := edtTUServicesPowerFrom.Text
       else
          args[12] := '-1';
       if edtTUServicesPowerTo.Text <> '' then
          args[13] := edtTUServicesPowerTo.Text
       else
          args[13] := '-1';

          if dtstartappeal.Checked then
          args[14] := DateToStr(dtstartappeal.date)
       else
          args[14] := '';
       if dtendappeal.Checked then
          args[15] := DateToStr(dtendappeal.date)
       else
          args[15] := '';
  //ksl
       if   dtpStartFact.Checked then
          args[16] := DateToStr(dtpStartFact.date)
       else
          args[16] := '';

     if
         dtpEndFact.Checked  then
          args[17] := DateToStr(dtpEndFact.date)
       else
          args[17] := '';

     args[18] := IntToStr(cbContractStatus.ItemIndex);

      reportName := 'Services/ReportServicesAccession/detailedReportOnConcludedAgreementsAccession';
      makeReport(reportName, argNames, args, 'xlsx');
      self.Close;
end;

procedure TfrmReportDetailedReportOnConcludedAgreementsConnection.FormCreate(
  Sender: TObject);
begin
  departmentCode :=-1 ;
end;

procedure TfrmReportDetailedReportOnConcludedAgreementsConnection.FormShow(
  Sender: TObject);
begin
  SetIntStyle(edtTUServicesPowerFrom);
  SetIntStyle(edtTUServicesPowerTo);

  edtDateServicesTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateServicesFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  edtDateTUTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateTUFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  edtlEnpayment2sodateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtlEnpayment2sodateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  edtActIncomeDateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtActIncomeDateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  dtpStartMaxdateactRmkbto.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  dtpEndMaxdateactRmkbto.Date := EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  dtstartappeal.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  dtendappeal.Date := EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));

  edtDateServicesTo.Checked := false;
  edtDateServicesFrom.Checked := false;
  edtDateTUTo.Checked := false;
  edtDateTUFrom.Checked := false;
  edtlEnpayment2sodateTo.Checked := false;
  edtlEnpayment2sodateFrom.Checked := false;
  edtActIncomeDateTo.Checked := false;
  edtActIncomeDateFrom.Checked := false;
  dtpStartMaxdateactRmkbto.Checked := false;
  dtpEndMaxdateactRmkbto.Checked := false;
  dtstartappeal.Checked:= false;
  dtendappeal.Checked:= false;
end;


procedure TfrmReportDetailedReportOnConcludedAgreementsConnection.spbENDepartmentDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application, fmNormal,f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
        if ShowModal = mrOk then
        begin
            try
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

{
var
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENServicesObjectFilterObj.department = nil then ENServicesObjectFilterObj.department := ENDepartment.Create();
               //ENServicesObjectFilterObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;


end.
