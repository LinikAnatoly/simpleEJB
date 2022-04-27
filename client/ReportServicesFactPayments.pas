unit ReportServicesFactPayments;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils;

type
  TfrmReportServicesFactPayments = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblDate: TLabel;
    edtDateFrom: TDateTimePicker;
    HTTPRIOTKMaterials: THTTPRIO;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    edtDateTo: TDateTimePicker;
    HTTPRIOTKClassificationType: THTTPRIO;
    spbTKClassificationType: TSpeedButton;
    edtTKClassificationTypeName: TEdit;
    lblKarta: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbTKClassificationTypeClick(Sender: TObject);
  private
    { Private declarations }
   TKClassificationTypeCode : Integer;
  public
    { Public declarations }
  end;

var
  frmReportServicesFactPayments: TfrmReportServicesFactPayments;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit, ShowTKClassificationType,
  EditTKClassificationType, TKClassificationTypeController;

{$R *.dfm}

procedure TfrmReportServicesFactPayments.FormShow(Sender: TObject);
begin
  inherited;

  edtDateTo.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateFrom.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;


  edtDateTo.Checked := true;
  edtDateFrom.Checked := true;

  end;

procedure TfrmReportServicesFactPayments.spbTKClassificationTypeClick(
  Sender: TObject);
var
     frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
begin
   frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
   try
     DisableActions([frmTKClassificationTypeShow.actNoFilter,
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

procedure TfrmReportServicesFactPayments.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;
begin

  inherited;

if edtDateFrom.Checked = false then
begin
   Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateTo.Checked = false then
begin
   Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;

if edtDateFrom.Date > edtDateTo.Date then
begin
  Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
  Exit;
end;


// Установка параметров
SetLength(argNames, 7);
SetLength(args, 7);

argNames[0] := 'dateStart';
args[0] := DateToStr(edtDateFrom.Date);
argNames[1] := 'dateFinal';
args[1] := DateToStr(edtDateTo.Date);


argNames[2]:= 'tkclassificationtypecodes';
      if trim(edtTKClassificationTypeName.Text) = '' then
        args[2] := ''
        else
        args[2] := edtTKClassificationTypeName.Text;


reportName := 'Services/ServicesFactPayments/ServicesFact';

makeReport(reportName, argNames, args, 'xls');

self.Close;

end;

end.
