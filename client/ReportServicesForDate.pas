unit ReportServicesForDate;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient;

type
  TfrmReportServicesForDate = class(TDialogForm)
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtEPRenName: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDate: TLabel;
    edtDateFrom: TDateTimePicker;
    CheckListBox1: TCheckListBox;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOTKVirtualBrigade: THTTPRIO;
    btnClearCleckList: TSpeedButton;
    lblSelectAll: TLabel;
    lblDeselectAll: TLabel;
    SpeedButton1: TSpeedButton;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    cbMetrology: TCheckBox;
    HTTPRIOTKClassificationType: THTTPRIO;
    spbTKClassificationType: TSpeedButton;
    edtTKClassificationTypeName: TEdit;
    lblKarta: TLabel;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure spbTKClassificationTypeClick(Sender: TObject);


  private
    { Private declarations }
    isChecked : Boolean;
    TKClassificationTypeCode : Integer;
    procedure ClearRen();
    procedure UpdateListTKVirtualBrigade();


  public
    { Public declarations }
    renCode: Integer;
    renName: String;
  end;

var
  frmReportServicesForDate: TfrmReportServicesForDate;

implementation
uses ShowENDepartment , ENDepartmentTypeController , ENDepartmentController , ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit, TKVirtualBrigadeController,
  ShowTKClassificationType, EditTKClassificationType,
  TKClassificationTypeController;

{$R *.dfm}
 //----------------------------------------------------------------------------

procedure TfrmReportServicesForDate.ClearRen();
begin
 renCode := 0;
 RenName := '';
 edtEPRenName.Text := RenName;
end;

procedure TfrmReportServicesForDate.UpdateListTKVirtualBrigade();
var
TempVirtualBrigade : TKVirtualBrigadeControllerSoapPort;
virtualBrigadeList : TKVirtualBrigadeShortList;
virtualBrigadeFilter : TKVirtualBrigadeFilter;
i : Integer;
begin

TempVirtualBrigade := HTTPRIOTKVirtualBrigade as TKVirtualBrigadeControllerSoapPort;

virtualBrigadeFilter := TKVirtualBrigadeFilter.Create;

SetNullIntProps(virtualBrigadeFilter);
SetNullXSProps(virtualBrigadeFilter);

virtualBrigadeList := TempVirtualBrigade.getScrollableFilteredList(virtualBrigadeFilter, 0, -1);
CheckListBox1.Items.Clear;

    for i:=0 to High(virtualBrigadeList.list) do
      begin
        CheckListBox1.Items.AddObject(virtualBrigadeList.list[i].nameCompound , TObject( virtualBrigadeList.list[i].code )  );
      end;


end;

// -----------------------------------------------------------------------------
procedure TfrmReportServicesForDate.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportServicesForDate.spbTKClassificationTypeClick(
  Sender: TObject);
var
     frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
begin
   frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
   try
     DisableActions([frmTKClassificationTypeShow.actFilter, frmTKClassificationTypeShow.actNoFilter,
           frmTKClassificationTypeShow.actInsert, frmTKClassificationTypeShow.actEdit,
           frmTKClassificationTypeShow.actDelete]);

     frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);

     // SUPP-18899 отныне тестируем калькуляции на работем сервере
     // источник с тестовыми калькуляциями показываем только юзерам из списка
     if ((HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'energynet') or
         // SUPP-26858     KondratenkoOE
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'KondratenkoOE') or
         // SUPP-26856     asu_3 (Федорчак Наталя Юріївна), PalamarIN, TsaturovaLV
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'asu_3') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'PalamarIN') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'TsaturovaLV') or

         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'ZemlianskayaNF') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'GavrilenkoNV') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'ReznikMV') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'HomkoSO') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'NazarenkoOY') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'PerervaJG') or
         (HTTPRIOTKClassificationType.HTTPWebNode.UserName = 'MihnyukAA') )  then
     frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code in (' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_TEST_CALCULATIONS) + ', ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS_20141201) + ')';
      with frmTKClassificationTypeShow do
        if ShowModal = mrOk then
        begin
            try

               TKClassificationTypeCode := TKClassificationTypeShort(tvDep.Selected.Data).code;
               edtTKClassificationTypeName.Text := TKClassificationTypeShort(tvDep.Selected.Data).kod ;

            except
               on EConvertError do Exit;
            end;


        end;
   finally
      frmTKClassificationTypeShow.Free;
   end;

end;

procedure TfrmReportServicesForDate.spbEPRenClearClick(Sender: TObject);
begin
ClearRen();
end;

procedure TfrmReportServicesForDate.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtEPRenName]);
  UpdateListTKVirtualBrigade;
  end;

procedure TfrmReportServicesForDate.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName, strBrigades : String;
  i : Integer;
begin

  inherited;

  strBrigades := '';
For i:=0 to CheckListBox1.Count -1  do
    Begin
  if  CheckListBox1.Checked[i] then
    if strBrigades <>  '' then
      strBrigades := strBrigades + ' , ' + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) )
    else
           strBrigades := strBrigades + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) ) ;
End;

if ((strBrigades = '')and(cbMetrology.checked=false)) then
begin
  Application.MessageBox('Оберіть хоча б одну бригаду', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if renCode = 0 then
begin
  Application.MessageBox('Оберіть підрозділ', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if not NoBlankValues([edtDateFrom, edtDateTo]) then
begin
  Application.MessageBox('Оберіть дату договору', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;


if cbMetrology.checked then
begin
SetLength(argNames, 4);
SetLength(args, 4);
end
else
begin
SetLength(argNames, 5);
SetLength(args, 5);
end;



if cbMetrology.checked then
begin
argNames[0] := 'dateFrom';
argNames[1] := 'dateTo';
argNames[2] := 'departmentCode';
args[0] := DateToStr(edtDateFrom.date);
args[1] := DateToStr(edtDateTo.date);
args[2] := IntToStr(renCode);
 argNames[3]:= 'tkclassificationtypecodes';
      if trim(edtTKClassificationTypeName.Text) = '' then
        args[3] := ''
        else
        args[3] := edtTKClassificationTypeName.Text;

end
else
begin
argNames[0] := 'dateFrom';
argNames[1] := 'dateTo';
argNames[2] := 'departmentCode';
argNames[3] := 'virtualBrigadeCodes';
args[0] := DateToStr(edtDateFrom.date);
args[1] := DateToStr(edtDateTo.date);
args[2] := IntToStr(renCode);
args[3] := strBrigades;

      argNames[4]:= 'tkclassificationtypecodes';
      if trim(edtTKClassificationTypeName.Text) = '' then
        args[4] := ''
        else
        args[4] := edtTKClassificationTypeName.Text;

end;



  if cbMetrology.checked then
  reportName := 'Services/ReportServicesForDate/ReportServicesMetrForDate'
  else
  reportName := 'Services/ReportServicesForDate/ReportServicesForDate';
  makeReport(reportName, argNames, args, 'xls');

  self.Close;

end;

procedure TfrmReportServicesForDate.FormCreate(Sender: TObject);
begin
ClearRen;

end;

procedure TfrmReportServicesForDate.SpeedButton1Click(Sender: TObject);
  var
  I : Integer;
begin


     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = false then
           CheckListBox1.Checked[i] := true;


    End;

end;


procedure TfrmReportServicesForDate.btnClearCleckListClick(
  Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = True then
           CheckListBox1.Checked[i] := False;
    End;

end;

end.
