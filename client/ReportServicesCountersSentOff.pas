unit ReportServicesCountersSentOff;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmReportServicesCountersSentOff = class(TDialogForm)
    lblMol: TLabel;
    spbMol: TSpeedButton;
    edtMolName: TEdit;
    lblDate: TLabel;
    edtDateFrom: TDateTimePicker;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    cmbIsSentMaterials: TComboBox;
    chbIsSentMaterials: TCheckBox;
    btnCancel: TButton;
    btnOk: TButton;
    HTTPRIOENMol: THTTPRIO;
    edtMolCode: TEdit;
    procedure spbMolClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure chbIsSentMaterialsClick(Sender: TObject);


  private
    { Private declarations }


  public
    { Public declarations }
    molCode: String;
    molName: String;
    isMaterialsSentOff : Integer;
  end;

var
  frmReportServicesCountersSentOff: TfrmReportServicesCountersSentOff;

implementation
uses ShowENDepartment , ENDepartmentTypeController , ENDepartmentController , ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit, TKVirtualBrigadeController
     , FINMolController, ShowFINMol, ENMolController, DateUtils;

{$R *.dfm}
procedure TfrmReportServicesCountersSentOff.FormCreate(Sender: TObject);
begin
  inherited;
  isMaterialsSentOff := -1;
  molCode := '';
  molName := '';
end;

procedure TfrmReportServicesCountersSentOff.FormShow(Sender: TObject);
var
standardMol : String;

molFilter : ENMolFilter;
molList : ENMolShortList;
TempENMol : ENMolControllerSoapPort;

begin
  inherited;
  DisableControls([edtMolCode, edtMolName]);

  edtDateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;

  standardMol := '1814';
  molFilter := ENMolFilter.Create;
  SetNullXSProps(molFilter);
  SetNullIntProps(molFilter);
  molFilter.finCode := standardMol;
  TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
  molList := TempENMol.getScrollableFilteredList(molFilter, 0, -1);
  if(molList.totalCount > 0) then begin
    molCode := molList.list[0].finCode;
    molName := molList.list[0].name;
    edtMolCode.Text := molCode;
    edtMolName.Text := molName;
  end;


end;

procedure TfrmReportServicesCountersSentOff.spbMolClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
 molSel : boolean;

begin
     f := FINMolFilter.Create;
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.state := 1;

     frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

            try

          // оно типа ТУТ отфильтровано ...
          //if length(f.conditionSQL) > 0 then
            frmFINMolShow.isFiltered := true;

          with frmFINMolShow do begin
            DisableActions([ actEdit, actInsert ]);
            if ShowModal = mrOk then
            begin
                try

                   molCode := GetReturnValue(sgFINMol,0);
                   molName := GetReturnValue(sgFINMol,1);
                   edtMolCode.Text := molCode;
                   edtMolName.Text := molName;
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINMolShow.Free;
       end;
end;

procedure TfrmReportServicesCountersSentOff.btnCancelClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmReportServicesCountersSentOff.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, strBrigades : String;
  i : Integer;
begin

inherited;

if (molcode = '') then
begin
  Application.MessageBox('Оберіть МВО', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if not edtDateFrom.Checked then begin
  Application.MessageBox('Оберіть початкову дату', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if not edtDateTo.Checked then begin
  Application.MessageBox('Оберіть кінцеву дату', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

SetLength(argNames, 5);
SetLength(args, 5);

argNames[0] := 'dateStart';
argNames[1] := 'dateFinal';
argNames[2] := 'molcode';
argNames[3] := 'issentmaterials';
argNames[4] := 'molname';
args[0] := DateToStr(edtDateFrom.date);
args[1] := DateToStr(edtDateTo.date);
args[2] := molCode;
if chbIsSentMaterials.Checked then begin
  if cmbIsSentMaterials.ItemIndex = 0 then begin
    isMaterialsSentOff := 1;
  end else begin
    isMaterialsSentOff := 0;
  end;
end else begin
  isMaterialsSentOff := -1;
end;
args[3] := IntToStr(isMaterialsSentOff);
args[4] := molName;

reportName := 'Services/ServicesCountersSentOff';
makeReport(reportName, argNames, args, 'xls');

Self.Close;

end;

procedure TfrmReportServicesCountersSentOff.chbIsSentMaterialsClick(
  Sender: TObject);
begin
  inherited;
  cmbIsSentMaterials.Visible := chbIsSentMaterials.Checked;
end;

end.
