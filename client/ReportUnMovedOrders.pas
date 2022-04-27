unit ReportUnMovedOrders;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmReportUnMovedOrders = class(TDialogForm)
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtEPRenName: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    HTTPRIOENDepartment: THTTPRIO;
    dtpEndDate: TDateTimePicker;
    dtpStartDate: TDateTimePicker;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    lblPlanPeriod: TLabel;
    procedure spbEPRenClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);


  private
    { Private declarations }
    procedure ClearRen();




  public
    { Public declarations }
    renCode: Integer;
    renName: String;

  end;

var
  frmReportUnMovedOrders: TfrmReportUnMovedOrders;

implementation
uses
  ShowENDepartment
  , ENDepartmentController
  , ChildFormUnit
  , ENConsts
  , EnergyproController
  , DMReportsUnit;

{$R *.dfm}
 //----------------------------------------------------------------------------


procedure TfrmReportUnMovedOrders.ClearRen();
begin
 renCode := 0;
 RenName := '';
 edtEPRenName.Text := RenName;
end;

// -----------------------------------------------------------------------------
procedure TfrmReportUnMovedOrders.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   Filter : ENDepartmentFilter;
begin
  Filter := ENDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  Filter.code := 1;
  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, Filter);
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

procedure TfrmReportUnMovedOrders.btnOkClick(Sender: TObject);
var
 argNames, args : ArrayOfString;
  reportName : String;
  i : integer;
  strGroupmaterials , strBudget, depCodes : String;
  TempENDepartment : ENDepartmentControllerSoapPort;
begin
  inherited;
  {Определение отчета}
  reportName := 'warehouseMaterialsMovement/unmovedOrders';

  {Установка длины массивов параметров отчетов}
  SetLength(argNames, 4);
  SetLength(args, 4);
  {Установка дат планов}
  argNames[0] := 'startDate';

  if dtpStartDate.Checked then
    args[0] := DateToStr(dtpStartDate.DateTime)
  else
    args[0] := '01.01.0001';

  argNames[1] := 'endDate';

  if dtpEndDate.Checked then
    args[1] := DateToStr(dtpEndDate.DateTime)
  else
    args[1] := '01.01.9999';


     {Проверка подразделения}
      TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      depCodes := TempENDepartment.getDepartmentCodesDown(renCode);

    {Установка подразделения}
    argnames[2]:= 'rencode';
    args[2] := 'array[' + depCodes + ']';


     {Установка параметра для отображения подразделения}
     argnames[3] := 'titlerencode';
     args[3]:= IntToStr(renCode);
    {Формирование отчета}
    makeReport(reportName, argNames, args, 'xls');
end;






procedure TfrmReportUnMovedOrders.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtEPRenName]);
end;

procedure TfrmReportUnMovedOrders.spbEPRenClearClick(Sender: TObject);
begin
  inherited;
  renCode := 0;
  edtEPRenName.Text := '';
end;

end.
