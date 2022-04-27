unit ReportWorkTeamsByDates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, ComCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmReportWorkTeamsByDates = class(TDialogForm)
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartmentClear: TSpeedButton;
    spbDepartment: TSpeedButton;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lblBudgets: TLabel;
    btnChooseBudgets: TButton;
    HTTPRIOENDepartment: THTTPRIO;
    edtBudgets: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnChooseBudgetsClick(Sender: TObject);
  private
    { Private declarations }
  public
    departmentCode : Integer;
    dateStart, dateFinal : TDateTime;
    strBudgetCodes : String;
    { Public declarations }
  end;

var
  frmReportWorkTeamsByDates: TfrmReportWorkTeamsByDates;

implementation

uses ShowENDepartment, ENDepartmentController, budgetList, StrUtils, ENConsts;

{$R *.dfm}

procedure TfrmReportWorkTeamsByDates.btnChooseBudgetsClick(Sender: TObject);
var
  strBudgetNames : String;
  i : Integer;
begin
  inherited;
  frmbudgetList := TfrmbudgetList.Create(Application, dsInsert);
  for i := 0 to frmbudgetList.ListBudget.Count - 1 do begin
    if ContainsText(strBudgetCodes
      , IntToStr(Integer(frmbudgetList.ListBudget.Items.Objects[i]))) then begin
      frmbudgetList.ListBudget.Checked[i] := true;
    end;

  end;
  try
   if frmbudgetList.ShowModal = mrOk then begin
      strBudgetCodes := '';

     /// собираем строку кодов бюджетодержателей
      for i := 0 to frmbudgetList.ListBudget.Count - 1 do
      begin
           if  frmbudgetList.ListBudget.Checked[i] then begin
            if strBudgetCodes <>  '' then
            strBudgetCodes := strBudgetCodes + ',' + IntToStr(Integer(frmbudgetList.ListBudget.Items.Objects[i]))
             else
            strBudgetCodes := strBudgetCodes + IntToStr(Integer(frmbudgetList.ListBudget.Items.Objects[i]));
            if strBudgetNames <>  '' then
              strBudgetNames := strBudgetNames + ',' + frmbudgetList.ListBudget.Items[i]
             else
            strBudgetNames := strBudgetNames + frmbudgetList.ListBudget.Items[i];
           end;
      end;
      edtBudgets.Text := strBudgetNames;
    end;
  finally
    frmbudgetList.Free;
  end;
end;

procedure TfrmReportWorkTeamsByDates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOk then begin
    if edtDateStart.DateTime > edtDateFinal.DateTime then begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності!')
        , PChar('Увага'), MB_ICONWARNING);
        Action := caNone;
        Exit;
    end;
    if Length(Trim(strBudgetCodes)) = 0 then begin
      Application.MessageBox(PChar('Оберіть бюджетотримачів!')
        , PChar('Увага'), MB_ICONWARNING);
        Action := caNone;
        Exit;
    end;

    Self.dateStart := edtDateStart.DateTime;
    Self.dateFinal := edtDateFinal.DateTime
  end;
end;

procedure TfrmReportWorkTeamsByDates.FormCreate(Sender: TObject);
begin
  inherited;
  Self.departmentCode := Low(Integer);
  strBudgetCodes := IntToStr(ENConsts.ENBUDGET_SRM) + ', ' + IntToStr(ENConsts.ENBUDGET_ODG);

end;
procedure TfrmReportWorkTeamsByDates.FormShow(Sender: TObject);
var
  departmentList : ENDepartmentShortList;
  department : ENDepartmentShort;
  departmentFilter : ENDepartmentFilter;
  TempENDepartmentController : ENDepartmentControllerSoapPort;
  strBudgetNames : String;
begin
  DisableControls([edtDepartment, edtBudgets]);
  edtDateStart.DateTime := Now();
  edtDateFinal.DateTime := Now();
  edtDateStart.Checked := true;
  edtDateFinal.Checked := true;
  if Length(strBudgetCodes) > 0 then begin
    TempENDepartmentController := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    departmentFilter := ENDepartmentFilter.Create;
    SetNullXSProps(departmentFilter);
    SetNullIntProps(departmentFilter);
    departmentFilter.conditionSQL := 'ENDEPARTMENT.CODE IN (' + strBudgetCodes + ')';
    departmentList := TempENDepartmentController.getScrollableFilteredList(departmentFilter, 0, -1);
    strBudgetNames := '';
    if departmentList.totalCount > 0 then begin
      for department in departmentList.list do begin
        if Length(strBudgetNames) > 0 then strBudgetNames := strBudgetNames + ', ';
        strBudgetNames := strBudgetNames + '' + department.shortName;
      end;
    end;
    edtBudgets.Text := strBudgetNames;


  end;

end;

procedure TfrmReportWorkTeamsByDates.spbDepartmentClearClick(Sender: TObject);
begin
  Self.departmentCode := Low(Integer);
  Self.edtDepartment.Text := '';
end;

procedure TfrmReportWorkTeamsByDates.spbDepartmentClick(Sender: TObject);
begin
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
           Self.departmentCode := selectedObj.code;
           edtDepartment.Text := selectedObj.shortName;
  end);
end;

end.
