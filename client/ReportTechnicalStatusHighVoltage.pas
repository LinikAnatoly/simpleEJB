unit ReportTechnicalStatusHighVoltage;

interface


uses
    Buttons, Controls, Classes, StdCtrls,
    Windows, Messages, SysUtils, Variants, Graphics, Forms,
    Dialogs, DialogFormUnit, ComCtrls, ChildFormUnit;

type
    TfrmReportTechnicalStatusHighVoltage = class(TDialogForm)

    lblVoltageClass: TLabel;
    spbVoltageClass: TSpeedButton;
    spbVoltageClassClear: TSpeedButton;
    edtVoltageClass: TEdit;
    lblSubstation150: TLabel;
    spbSubstation150: TSpeedButton;
    spbSubstation150Clear: TSpeedButton;
    edtSubstation150: TEdit;
    lblENElementName: TLabel;
    spbENElementType: TSpeedButton;
    spbENElementTypeClear: TSpeedButton;
    edtENElementTypeName: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;

    procedure btnOkClick(Sender: TObject);
    procedure spbSubstation150Click(Sender: TObject);
    procedure spbSubstation150ClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENElementTypeClick(Sender: TObject);
    procedure spbENElementTypeClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbVoltageClassClearClick(Sender: TObject);
    procedure spbVoltageClassClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    subcode: Integer;
    voltageclassrefcode: Integer;
    elementtypecode: Integer;
  end;


var
  frmReportTechnicalStatusHighVoltage: TfrmReportTechnicalStatusHighVoltage;


implementation


uses
  ShowENSubstation150
  , ENSubstation150Controller
  , ShowENVoltageClass
  , ENVoltageClassController
  , ShowENElementType
  , ENElementTypeController
  , EnergyproController
  , DMReportsUnit
;


{$R *.dfm}



procedure TfrmReportTechnicalStatusHighVoltage.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: string;
begin
  SetLength(argNames, 3);
  SetLength(args, 3);

  argNames[0] := 'subcode';
  args[0] := IntToStr(subcode);

  argNames[1] := 'voltageclassrefcode';
  args[1] := IntToStr(voltageclassrefcode);

  argNames[2] := 'elementtypecode';
  args[2] := IntToStr(elementtypecode);


  reportName := 'TechnicalStatus/technicalStatusHighVoltageEquipment_main';

  makeReport(reportName, argNames, args, 'xls');
end;


procedure TfrmReportTechnicalStatusHighVoltage.FormCreate(Sender: TObject);
begin
  inherited;
  subcode := -1;
  voltageclassrefcode := -1;
  elementtypecode := -1;
end;


procedure TfrmReportTechnicalStatusHighVoltage.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtSubstation150, edtVoltageClass, edtENElementTypeName]);
end;


procedure TfrmReportTechnicalStatusHighVoltage.spbENElementTypeClearClick(Sender: TObject);
begin
  inherited;
  elementtypecode := -1;
  edtENElementTypeName.Text := '';
end;


procedure TfrmReportTechnicalStatusHighVoltage.spbENElementTypeClick(Sender: TObject);
var
  frmENElementTypeShow: TfrmENElementTypeShow;
  elementTypeFilter: ENElementTypeFilter;
begin
  inherited;
  elementTypeFilter := ENElementTypeFilter.Create;
  SetNullIntProps(elementTypeFilter);
  SetNullXSProps(elementTypeFilter);
  elementTypeFilter.conditionSQL := ' code in (63,64,65,66,71,72,104,105,106,107,101,102,103)';

  frmENElementTypeShow := TfrmENElementTypeShow.Create(Application, fmNormal, elementTypeFilter);
  try
    frmENElementTypeShow.DisableActions([frmENElementTypeShow.actInsert,
                                          frmENElementTypeShow.actEdit,
                                          frmENElementTypeShow.actDelete]);

    with frmENElementTypeShow do
      if ShowModal = mrOk then
      begin
        try
          elementtypecode := StrToInt(GetReturnValue(sgENElementType, 0));
          edtENElementTypeName.Text := GetReturnValue(sgENElementType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementTypeShow.Free;
  end;
end;


procedure TfrmReportTechnicalStatusHighVoltage.spbSubstation150Click(Sender: TObject);
var
  frmENSubstation150Show: TfrmENSubstation150Show;
  subFilter: ENSubstation150Filter;
begin
  inherited;
  subFilter := ENSubstation150Filter.Create;
  SetNullIntProps(subFilter);
  SetNullXSProps(subFilter);

  frmENSubstation150Show := TfrmENSubstation150Show.Create(Application, fmNormal, subFilter);
  try
    frmENSubstation150Show.DisableActions([frmENSubstation150Show.actInsert,
                                          frmENSubstation150Show.actEdit,
                                          frmENSubstation150Show.actDelete]);

    with frmENSubstation150Show do
      if ShowModal = mrOk then
      begin
        try
          subcode := StrToInt(GetReturnValue(sgENSubstation150, 0));
          edtSubstation150.Text := GetReturnValue(sgENSubstation150, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENSubstation150Show.Free;
  end;
end;


procedure TfrmReportTechnicalStatusHighVoltage.spbVoltageClassClearClick(Sender: TObject);
begin
  inherited;
  voltageclassrefcode := -1;
  edtVoltageClass.Text := '';
end;


procedure TfrmReportTechnicalStatusHighVoltage.spbVoltageClassClick(Sender: TObject);
var
  frmENVoltageClassShow: TfrmENVoltageClassShow;
  voltageClassFilter: ENVoltageClassFilter;
begin
  inherited;
  voltageClassFilter := ENVoltageClassFilter.Create;
  SetNullIntProps(voltageClassFilter);
  SetNullXSProps(voltageClassFilter);

  frmENVoltageClassShow := TfrmENVoltageClassShow.Create(Application, fmNormal, voltageClassFilter);
  try
    frmENVoltageClassShow.DisableActions([frmENVoltageClassShow.actInsert,
                                          frmENVoltageClassShow.actEdit,
                                          frmENVoltageClassShow.actDelete,
                                          frmENVoltageClassShow.actFilter,
                                          frmENVoltageClassShow.actNoFilter]);
    with frmENVoltageClassShow do
      if ShowModal = mrOk then
      begin
        try
          voltageclassrefcode := StrToInt(GetReturnValue(sgENVoltageClass, 0));
          edtVoltageClass.Text := GetReturnValue(sgENVoltageClass, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENVoltageClassShow.Free;
  end;
end;


procedure TfrmReportTechnicalStatusHighVoltage.spbSubstation150ClearClick(Sender: TObject);
begin
  inherited;
  subcode := -1;
  edtSubstation150.Text := '';
end;


end.
