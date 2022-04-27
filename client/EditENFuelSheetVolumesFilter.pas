
unit EditENFuelSheetVolumesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelSheetVolumesController,
  ExtCtrls ;

type
  TfrmENFuelSheetVolumesFilterEdit = class(TDialogForm)
    lblStartDate : TLabel;
    edtStartDate: TDateTimePicker;
    lblEndDate : TLabel;
    edtEndDate: TDateTimePicker;


  HTTPRIOENFuelSheetVolumes: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblName: TLabel;
    edtName: TEdit;
    lblFuelType: TLabel;
    cbFuelType: TComboBox;
    gbPeriod: TGroupBox;
    lblYear: TLabel;
    lblMonth: TLabel;
    rgDecade: TRadioGroup;
    cbYear: TComboBox;
    cbMonth: TComboBox;
    chbPeriod: TCheckBox;
    chbWholeYear: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chbPeriodClick(Sender: TObject);
    procedure chbWholeYearClick(Sender: TObject);
  

  private
    { Private declarations }
    currentYear: Word;
  public
    { Public declarations }

end;

var
  frmENFuelSheetVolumesFilterEdit: TfrmENFuelSheetVolumesFilterEdit;
  ENFuelSheetVolumesFilterObj: ENFuelSheetVolumesFilter;

implementation

uses DateUtils;

{uses
    EnergyproController, EnergyproController2, ENFuelSheetVolumesController  ;
}

{$R *.dfm}



procedure TfrmENFuelSheetVolumesFilterEdit.FormShow(Sender: TObject);
begin
  // ¬сем пол€м с датами засетим текущую дату
  SetCurrentDate;
  SetComboBoxCurrentYear(cbYear, 1, 1);
  SetComboBoxCurrentMonth(cbMonth);
end;



procedure TfrmENFuelSheetVolumesFilterEdit.chbPeriodClick(Sender: TObject);
begin
  gbPeriod.Visible := chbPeriod.Checked;
end;

procedure TfrmENFuelSheetVolumesFilterEdit.chbWholeYearClick(Sender: TObject);
begin
  HideControls([lblMonth, cbMonth, rgDecade], chbWholeYear.Checked);
end;

procedure TfrmENFuelSheetVolumesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENFuelSheetVolumes: ENFuelSheetVolumesControllerSoapPort;
  year, month, decadeNumber: Integer;
  dateStart, dateEnd: TDateTime;
begin
  if (ModalResult = mrOk)  then
  begin
    ENFuelSheetVolumesFilterObj.name := edtName.Text;

    if cbFuelType.ItemIndex > 0 then
      ENFuelSheetVolumesFilterObj.fuelType := cbFuelType.ItemIndex;

    if chbPeriod.Checked then
    begin
      if (cbYear.ItemIndex = -1) then
      begin
        Application.MessageBox(PChar('¬каж≥ть р≥к!'),PChar('”вага!'),MB_ICONWARNING+MB_OK);
        cbYear.SetFocus;
        Action := caNone;
        Exit;
      end;

      year := cbYear.ItemIndex + (currentYear-1);

      if not chbWholeYear.Checked then
      begin
        if (cbMonth.ItemIndex = -1) then
        begin
          Application.MessageBox(PChar('¬каж≥ть м≥с€ць!'),PChar('”вага!'),MB_ICONWARNING+MB_OK);
          cbMonth.SetFocus;
          Action := caNone;
          Exit;
        end;

        month := cbMonth.ItemIndex + 1;

        if rgDecade.ItemIndex > -1 then
        begin
          decadeNumber := rgDecade.ItemIndex + 1;
          dateStart := getDecadeStart(year, month, decadeNumber);
          dateEnd := getDecadeEnd(year, month, decadeNumber);
        end
        else begin
          dateStart := EncodeDate(year, month, 1);
          dateEnd := EncodeDate(year, month, DaysInMonth(dateStart));
        end;
      end // if not chbWholeYear.Checked
      else begin
        dateStart := EncodeDate(year, 1, 1);
        dateEnd := EncodeDate(year, 12, 31);
      end;

      {
      if ENFuelSheetVolumesFilterObj.startDate = nil then
        ENFuelSheetVolumesFilterObj.startDate := TXSDate.Create;
      ENFuelSheetVolumesFilterObj.startDate.XSToNative(GetXSDate(dateStart));

      if ENFuelSheetVolumesFilterObj.endDate = nil then
        ENFuelSheetVolumesFilterObj.endDate := TXSDate.Create;
      ENFuelSheetVolumesFilterObj.endDate.XSToNative(GetXSDate(dateEnd));
      }

      ENFuelSheetVolumesFilterObj.conditionSQL :=
        'enfuelsheetvolumes.startdate between ' +
          'to_date(''' + DateToStr(dateStart) + ''', ''dd.MM.yyyy'') and ' +
          'to_date(''' + DateToStr(dateEnd) + ''', ''dd.MM.yyyy'')';
    end; // if chbPeriod.Checked

{
     if edtstartDate.checked then
     begin 
       if ENFuelSheetVolumesFilterObj.startDate = nil then
          ENFuelSheetVolumesFilterObj.startDate := TXSDate.Create;
       ENFuelSheetVolumesFilterObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
     end
     else
       ENFuelSheetVolumesFilterObj.startDate := nil;



     if edtendDate.checked then
     begin 
       if ENFuelSheetVolumesFilterObj.endDate = nil then
          ENFuelSheetVolumesFilterObj.endDate := TXSDate.Create;
       ENFuelSheetVolumesFilterObj.endDate.XSToNative(GetXSDate(edtendDate.DateTime));
     end
     else
       ENFuelSheetVolumesFilterObj.endDate := nil;
}

  end;
end;

procedure TfrmENFuelSheetVolumesFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  currentYear := YearOf(Now);
end;

end.