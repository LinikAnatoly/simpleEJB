unit reportServicesRegistryByPodrSum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, SOAPHTTPClient, InvokeRegistry, Rio,
  DialogFormUnit, ChildFormUnit;

type
  TfrmServicesRegistryByPodrSum = class(TDialogForm)
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    Label2: TLabel;
    HTTPRIOTKClassificationType: THTTPRIO;
    spbTKClassificationType: TSpeedButton;
    edtTKClassificationTypeName: TEdit;
    lblKarta: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtDateStart_repperiod: TDateTimePicker;
    Label4: TLabel;
    edtDateFinal_repperiod: TDateTimePicker;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbTKClassificationTypeClick(Sender: TObject);
  private
    { Private declarations }
    renCode, renName : string;
    TKClassificationTypeCode : Integer;
  public
    { Public declarations }
  end;

var
  frmServicesRegistryByPodrSum: TfrmServicesRegistryByPodrSum;

implementation

uses ENDepartmentController, ShowENDepartment, DMReportsUnit, ENConsts, EnergyproController  ,
  ShowTKClassificationType, TKClassificationTypeController, ENSettingsConsts;

{$R *.dfm}

procedure TfrmServicesRegistryByPodrSum.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
  reportName: String;
begin
 if edtDateStart.date > edtDateFinal.date then
   Begin
     Application.MessageBox(PChar('Початкова дата не може бути більшою за кінцеву дату !!!'), PChar('Увага!'),MB_ICONWARNING);
     ModalResult:= mrNone;
     exit;
   end
 else
  if ((edtDateStart_repperiod.Checked = false ) or (edtDateFinal_repperiod.Checked = false )) then
   Begin
     Application.MessageBox(PChar('Оберіть звітний період !!!'), PChar('Увага!'),MB_ICONWARNING);
     ModalResult:= mrNone;
     exit;
   end
   else
   begin
     SetLength(argNames, 8);
     SetLength(args, 8);

     argNames[0] := 'renCode';
     args[0] := renCode;

     argNames[1] := 'datestart';
     args[1] := DateToStr( edtDateStart.date );

     argNames[2] := 'datefinal';
     args[2] := DateToStr( edtDateFinal.date );



     argNames[3] := 'renName';
     args[3] := renName;

     argNames[4]:= 'tkclassificationtypecodes';
      if trim(edtTKClassificationTypeName.Text) = '' then
        args[4] := ''
        else
        args[4] := edtTKClassificationTypeName.Text;

     argNames[5] := 'datestart_repperiod';
     args[5] := DateToStr( edtDateStart_repperiod.date );

     argNames[6] := 'datefinal_repperiod';
     args[6] := DateToStr( edtDateFinal_repperiod.date );

     reportName := 'Services/servicesRegistryByPodrSum';

     makeReport(reportName , argNames , args , 'xls');

   end;




end;

procedure TfrmServicesRegistryByPodrSum.FormShow(Sender: TObject);
begin
  renCode := '0';
  renName := DMReports.getSettingValueByKey(ENSettingsConsts.COMPANY_SHORTNAME);
end;

procedure TfrmServicesRegistryByPodrSum.spbEPRenClearClick(Sender: TObject);
begin
  renCode := '0';
  renName := DMReports.getSettingValueByKey(ENSettingsConsts.COMPANY_SHORTNAME);
  edtEPRenName.Text := '';
end;

procedure TfrmServicesRegistryByPodrSum.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin
          renCode := IntToStr(ENDepartmentShort(tvDep.Selected.Data).code);
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmServicesRegistryByPodrSum.spbTKClassificationTypeClick(
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

end.
