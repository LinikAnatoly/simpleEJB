unit ReportTransportLoad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons ,
  InvokeRegistry, Rio, SOAPHTTPClient , ChildFormUnit;

type
  TfrmReportTransportLoad = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    spbTransportDepartmentClear: TSpeedButton;
    spbTransportDepartment: TSpeedButton;
    edtTransportDepartmentName: TEdit;
    lblTransportDepartment: TLabel;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    spbFINExecutorClear: TSpeedButton;
    HTTPRIOTkTransportClassificationController: THTTPRIO;
    cbbTransportClassification: TComboBox;
    Label1: TLabel;
    chkFullYear: TCheckBox;
    chkGraph: TCheckBox;
    chkReportDriversPercentLoad: TCheckBox;
    chkReportDriversLoadDaily: TCheckBox;
    edtMonthGen2: TComboBox;
    lblMonthGen2: TLabel;
    spbEmployeeClear: TSpeedButton;
    edtEmployee: TEdit;
    lblEmployee: TLabel;
    spbEmployee: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbTransportDepartmentClearClick(Sender: TObject);
    procedure spbTransportDepartmentClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbFINExecutorClearClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkFullYearClick(Sender: TObject);
    procedure spbEmployeeClearClick(Sender: TObject);
    procedure spbEmployeeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    transportDepartmentCode : Integer;
    transportDepartmentName : String;
    tabnumber : String;

    fin_departmentCode: String;
    fin_departmentName: String;
    ////
    reportLoadType : Integer; // 1 - transport_load; 2 - drivers_load
    ////

    TransportClassification : Integer;
  end;

var
  frmReportTransportLoad: TfrmReportTransportLoad;

implementation

uses DMReportsUnit , ShowENTransportDepartment , ENTransportDepartmentController, FINExecutorController,
ShowFINExecutorTree , TKTransportClassificationController, ENConsts
, FINWorkerController, ShowFINWorker;

{$R *.dfm}

procedure TfrmReportTransportLoad.FormCreate(Sender: TObject);
begin
 transportDepartmentCode := 0;
 transportDepartmentName := '';
 fin_departmentCode := '';
 fin_departmentName := '';
 tabnumber := '';
end;

procedure TfrmReportTransportLoad.FormShow(Sender: TObject);
var
 TempTKTransportClassificationControllerSoapPort: TKTransportClassificationControllerSoapPort;
 TKTransportClassificationControllerlist: TKTransportClassificationShortList;
 f : TKTransportClassificationFilter;
 i : Integer;
begin
    SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
    SetComboBoxCurrentMonth(edtMonthGen);
    SetComboBoxCurrentMonth(edtMonthGen2);
    TransportClassification:= 0;
    DisableControls([edtEmployee]);

    chkReportDriversPercentLoad.Visible := reportLoadType = 2;
    chkReportDriversLoadDaily.Visible := reportLoadType = 2;
    lblMonthGen2.Visible := reportLoadType = 2;
    edtMonthGen2.Visible := reportLoadType = 2;
    chkReportDriversPercentLoad.Checked := True;
    chkReportDriversLoadDaily.Checked := True;
    if reportLoadType = 2 then begin
      chkFullYear.Caption := 'За період';
    end;

   if reportLoadType = 1 then
   begin
   frmReportTransportLoad.Caption := 'Звіт по завантаженню транспортних засобів у відсотках від нормованого часу';
   HideControls([lblExecuter, edtFINExecutorName, spbFINExecutor, spbFINExecutorClear]);
   HideControls([lblEmployee, edtEmployee, spbEmployee, spbEmployeeClear]);
   DenyBlankValues([edtTransportDepartmentName]);

    HideControls([ Label1 , cbbTransportClassification ] , False);

   end
   else if reportLoadType = 2 then
   begin
   frmReportTransportLoad.Caption := 'Звіт по завантаженню водіїв у відсотках від нормованого часу';
   HideControls([lblTransportDepartment, edtTransportDepartmentName, spbTransportDepartment, spbTransportDepartmentClear]);
      DenyBlankValues([edtFINExecutorName]);
      HideControls([ Label1 , cbbTransportClassification, chkGraph ] );
   end
   else if reportLoadType = 3 then
   begin
   frmReportTransportLoad.Caption := 'Звіт по кількості подорожніх листів по водіям';
   HideControls([lblTransportDepartment, edtTransportDepartmentName, spbTransportDepartment, spbTransportDepartmentClear]);
      DenyBlankValues([edtFINExecutorName]);
      HideControls([ Label1 , cbbTransportClassification ] );
   end;

      if reportLoadType = 1 then
      begin
            cbbTransportClassification.Clear;

            f:= TKTransportClassificationFilter.Create;
            SetNullIntProps(f);

            f.orderBySQL := 'code';

            TempTKTransportClassificationControllerSoapPort := HTTPRIOTkTransportClassificationController as TKTransportClassificationControllerSoapPort;
            TKTransportClassificationControllerlist := TempTKTransportClassificationControllerSoapPort.getScrollableFilteredList(f,0,-1);
            for i:=0 to TKTransportClassificationControllerlist.totalCount-1 do
            begin
              cbbTransportClassification.Items.AddObject(TKTransportClassificationControllerlist.list[i].name, TObject(TKTransportClassificationControllerlist.list[i].code));
            end;

            cbbTransportClassification.DropDownCount := TKTransportClassificationControllerlist.totalCount + 1;

      end;


end;

procedure TfrmReportTransportLoad.spbTransportDepartmentClearClick(
  Sender: TObject);
begin
 transportDepartmentCode := 0;
 transportDepartmentName := '';
 edtTransportDepartmentName.Text := '';
end;

procedure TfrmReportTransportLoad.spbTransportDepartmentClick(Sender:TObject);
var
    frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin
        if ShowModal = mrOk then
        begin
          transportDepartmentCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
          transportDepartmentName := GetReturnValue(sgENTransportDepartment,1);
          edtTransportDepartmentName.Text := transportDepartmentName;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;
end;

procedure TfrmReportTransportLoad.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow:TfrmFINExecutorTreeShow;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        ForDriversReport := True; 
        if ShowModal = mrOk then
        begin
            try
              if DMReports.UsesMDAXDataForReport = false then
               fin_departmentCode := IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode)
              else
               fin_departmentCode := FINExecutorShort(tvDep.Selected.Data).axOrgId;

               fin_departmentName := DMReports.getFullExecutorName(tvDep.Selected);
               edtFINExecutorName.Text := fin_departmentName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmReportTransportLoad.spbEmployeeClearClick(Sender: TObject);
begin
  inherited;
  edtEmployee.Text := '';
  Self.tabnumber := '';
end;

procedure TfrmReportTransportLoad.spbEmployeeClick(Sender: TObject);
var
  selectedObj : FINWorkerShort;
begin
  selectedObj := TfrmFINWorkerShow.chooseFromList(nil);
  if Assigned(selectedObj) then begin
    edtEmployee.Text := selectedObj.name;
    Self.tabnumber := selectedObj.tabNumber;
  end;
end;

procedure TfrmReportTransportLoad.spbFINExecutorClearClick(
  Sender: TObject);
begin
  fin_departmentCode := '';
  fin_departmentName := '';
  edtFINExecutorName.Text := '';
end;

procedure TfrmReportTransportLoad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk  then begin
    if chkReportDriversPercentLoad.Visible
      and (not chkReportDriversPercentLoad.Checked)
      and (not chkReportDriversLoadDaily.Checked) then begin
         Application.MessageBox(PChar('Необхідно обрати формування хоча б одного звіту!')
          , PChar('Увага !'), MB_ICONWARNING + MB_OK);
         ModalResult := mrNone;
         Exit;
    end;
    if edtMonthGen2.Visible
      and (edtMonthGen2.ItemIndex < edtMonthGen.ItemIndex) then begin
         Application.MessageBox(PChar('Період повинен бути у хронологічній послідовності!')
          , PChar('Увага !'), MB_ICONWARNING + MB_OK);
         ModalResult := mrNone;
         Exit;
    end;

    end;

  end;
//  if ModalResult = mrOk  then
//    begin
//     if ((reportLoadType = 1) and (transportDepartmentCode = 0)) then
//      begin
//      Application.MessageBox(PChar('Необхідно вибрати Підрозділ!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
//      ModalResult := mrNone;
//      Exit;
//      end;
//
//      if ((reportLoadType = 2) and (fin_departmentCode = '')) then
//      begin
//      Application.MessageBox(PChar('Необхідно вибрати Підрозділ!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
//      ModalResult := mrNone;
//      Exit;
//      end;
//    end;

procedure TfrmReportTransportLoad.chkFullYearClick(Sender: TObject);
begin
  inherited;
    if reportLoadType = 2 then begin
      chkReportDriversPercentLoad.Visible := not chkFullYear.Checked;
      chkReportDriversLoadDaily.Visible := not chkFullYear.Checked;
      lblMonthGen2.Visible := chkFullYear.Checked;
      edtMonthGen2.Visible := chkFullYear.Checked;
      if chkFullYear.Checked then begin
        edtMonthGen.ItemIndex := 0;
        lblMonthGen.Caption := 'Місяць з';
      end else begin
        lblMonthGen.Caption := 'Місяць';
      end;
    end;
end;

end.
