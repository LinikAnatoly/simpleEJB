unit ReportFuelDistribution;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  InvokeRegistry, Rio, SOAPHTTPClient, GridHeadersUnit;

type
  TfrmReportFuelDistribution = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtFinMolName: TEdit;
    lblFinMolName: TLabel;
    lblFinMolCode: TLabel;
    edtFinMolCode: TEdit;
    spbPlanMOL: TSpeedButton;
    lblFuelType: TLabel;
    edtFuelType: TEdit;
    spbFuelType: TSpeedButton;
    dtpDateStart: TDateTimePicker;
    dtpDateFinal: TDateTimePicker;
    lblDateFinal: TLabel;
    lblDateFrom: TLabel;
    Label1: TLabel;
    edtENTravelSheet: TEdit;
    spbENTravelSheet: TSpeedButton;
    lblENTravelSheet: TLabel;
    spbENTravelSheetClear: TSpeedButton;
    gpbFuelDistribution: TGroupBox;
    sgFuelDistribution: TAdvStringGrid;
    HTTPRIOENTravelSheetFuel: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbFuelTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENTravelSheetClick(Sender: TObject);
    procedure setlistOfFuelDistribution;
    procedure spbENTravelSheetClearClick(Sender: TObject);

  private
    { Private declarations }



  public
    { Public declarations }
    molCode : String;
    fuelTypeCode : Integer;
    molName : String;
    fuelTypeName : String;
    travelSheetCode : Integer;

  end;

var
  frmReportFuelDistribution: TfrmReportFuelDistribution;

  travelSheetFuelHeaders: array [1..3] of String =
        ( 'Код'
          ,'Марка палива'
          ,'Кількість'
        );

implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit, FINMolController, ShowFINMol, ShowTKFuelType
     , ShowENTravelSheet, ENTravelSheetFuelController, ENTravelSheetController;

{$R *.dfm}
 //----------------------------------------------------------------------------

procedure TfrmReportFuelDistribution.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmReportFuelDistribution.btnOkClick(Sender: TObject);
var
args, argNames : arrayOfString;
i : Integer;
isChecked : Boolean;
additionalCondition : String; // Дополнительное условие по кодам выдач
begin

  if (dtpDateStart.Checked = False) or (dtpDateFinal.Checked = False) then
  begin
      Application.MessageBox(PChar('Введить період !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  if dtpDateStart.Date > dtpDateFinal.Date then
  begin
      Application.MessageBox(PChar('Дати повинні бути в хронологічній послідовності !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

    if fuelTypeCode = -1 then
  begin
      Application.MessageBox(PChar('Введить тип палива !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  if molCode = '-1' then
  begin
      Application.MessageBox(PChar('Виберіть МВО !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

  for i := 1 to sgFuelDistribution.RowCount - 1 do
  begin
      // Если выделена выдача флажком - то она добавляется в дополнительное условие
      sgFuelDistribution.GetCheckBoxState(1,i,isChecked);
      if isChecked then
      begin
           if Length(additionalCondition) <> 0 then
              additionalCondition := additionalCondition + ', ' + sgFuelDistribution.Cells[0, i]
           else
               additionalCondition := sgFuelDistribution.Cells[0, i];
      end;
  end;

  if(Length(additionalCondition) <> 0) then begin
      additionalCondition := ' and fu.code in (' + additionalCondition + ')';
  end;

  SetLength(args, 7);
  SetLength(argNames, 7);

  argNames[0] := 'molCode';
  args[0] := molCode;

  argNames[1] := 'dateStart';
  args[1] := DateToStr(dtpDateStart.DateTime);

  argNames[2] := 'dateFinal';
  args[2] := DateToStr(dtpDateFinal.DateTime);

  argNames[3] := 'fuelTypeRefCode';
  args[3] := IntToStr(fuelTypeCode);

  argNames[4] := 'fuelTypeName';
  args[4] := fuelTypeName;

  argNames[5] := 'molName';
  args[5] := molName;

  argNames[6] := 'additionalCondition';
  args[6] := additionalCondition;

  makeReport('transport/FuelDistribution', argNames, args, 'xls');

  Self.Close;

end;

procedure TfrmReportFuelDistribution.FormCreate(Sender: TObject);
begin
    molCode := '-1';
    fuelTypeCode := -1;
    molName := 'Невідомо';
    fuelTypeName := 'Невідомо';
    travelSheetCode := -1;
end;

procedure TfrmReportFuelDistribution.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtFinMolName, edtFinMolCode, edtFuelType, edtENTravelSheet]);
  SetGridHeaders(travelSheetFuelHeaders, sgFuelDistribution.ColumnHeaders);
end;

procedure TfrmReportFuelDistribution.spbENTravelSheetClearClick(
  Sender: TObject);
begin
  inherited;
  travelSheetCode := -1;
  edtENTravelSheet.Text := '';
  setlistOfFuelDistribution;
end;

procedure TfrmReportFuelDistribution.spbENTravelSheetClick(Sender: TObject);
var
  travelSheetForm : TfrmENTravelSheetShow;
begin
    travelSheetForm := TfrmENTravelSheetShow.Create(Application,fmNormal);
    try
      with travelSheetForm do begin
        DisableActions([ actEdit, actInsert, actDelete ]);
        if ShowModal = mrOk then
        begin
          edtENTravelSheet.Text := GetReturnValue(sgENTravelSheet,1);
          travelSheetCode := StrToInt(GetReturnValue(sgENTravelSheet,0));
          setlistOfFuelDistribution;
        end;
      end;
      except
        on EConvertError do Exit;
    end;

end;

procedure TfrmReportFuelDistribution.spbFuelTypeClick(Sender: TObject);
var
  fuelTypeForm : TfrmTKFuelTypeShow;
begin
    fuelTypeForm := TfrmTKFuelTypeShow.Create(Application,fmNormal);
    try
      with fuelTypeForm do begin
        DisableActions([ actEdit, actInsert, actDelete ]);
        if ShowModal = mrOk then
        begin
          edtFuelType.Text := GetReturnValue(sgTKFuelType,1);
          fuelTypeName := edtFuelType.Text;
          fuelTypeCode := StrToInt(GetReturnValue(sgTKFuelType,0));
        end;
      end;
      except
        on EConvertError do Exit;
    end;

end;

procedure TfrmReportFuelDistribution.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);

 frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try
      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFinMolCode.Text := GetReturnValue(sgFINMol,0);
               edtFINMolName.Text := GetReturnValue(sgFINMol,1);
               molCode := GetReturnValue(sgFINMol,0);
               molName := edtFINMolName.Text;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmReportFuelDistribution.setlistOfFuelDistribution;
var
 f : ENTravelSheetFuelFilter;
 list : ENTravelSheetFuelShortList;
 travelSheetFuelController : ENTravelSheetFuelControllerSoapPort;
 i : Integer;
begin

    // Очистка грида

    sgFuelDistribution.Clear;
    SetGridHeaders(travelSheetFuelHeaders, sgFuelDistribution.ColumnHeaders);

    if(travelSheetCode = -1) then Exit;

    travelSheetFuelController := HTTPRIOENTravelSheetFuel as ENTravelSheetFuelControllerSoapPort;

    f := ENTravelSheetFuelFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);

    f.travelSheetRef := ENTravelSheetRef.Create;
    f.travelSheetRef.code := travelSheetCode;

    list := travelSheetFuelController.getScrollableFilteredList(f, 0, -1);

    for i := 1 to list.totalCount do
    begin
        sgFuelDistribution.Cells[0, i] := IntToStr(list.list[i-1].code);
        sgFuelDistribution.Cells[1, i] := list.list[i-1].fuelTypeName;
        if list.list[i - 1].countGen = nil then
          sgFuelDistribution.Cells[2, i] := '0'
        else
          sgFuelDistribution.Cells[2, i] := list.list[i-1].countGen.DecimalString;

        sgFuelDistribution.AddCheckBox(1, i, false, false);
        sgFuelDistribution.RowCount:=i+1;
    end;


end;

end.
