unit reportServicesRegistryPrint2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, SOAPHTTPClient, InvokeRegistry, Rio,
  DialogFormUnit, ChildFormUnit;

type
  TfrmServicesRegistryPrint2 = class(TDialogForm)
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
    chkOnlyOverdue: TCheckBox;
    chkBuhStatus: TCheckBox;
    chkshow_enservicescontractstts_terminated: TCheckBox;
    chbReplaсeCounter: TCheckBox;
    chkShowInfoCounters: TCheckBox;
    HTTPRIOTKClassificationType: THTTPRIO;
    spbTKClassificationType: TSpeedButton;
    edtTKClassificationTypeName: TEdit;
    lblKarta: TLabel;
    chkServicesWithoutFact: TCheckBox;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chbReplaсeCounterClick(Sender: TObject);
    procedure spbTKClassificationTypeClick(Sender: TObject);
  private
    { Private declarations }
    renCode, renName  : string;
    TKClassificationTypeCode : integer;
  public
    { Public declarations }
  end;

var
  frmServicesRegistryPrint2: TfrmServicesRegistryPrint2;

implementation

uses ENDepartmentController, ShowENDepartment, DMReportsUnit, ENConsts, EnergyproController  ,
  ShowTKClassificationType, TKClassificationTypeController;

{$R *.dfm}

procedure TfrmServicesRegistryPrint2.btnOkClick(Sender: TObject);
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
// else if renCode = '0' then
//   Begin
//     Application.MessageBox(PChar('Оберіть підрозділ !!!'), PChar('Увага!'),MB_ICONWARNING);
//     ModalResult:= mrNone;
//     exit;
//   end
 else
   begin
     SetLength(argNames, 11);
     SetLength(args, 11);

     argNames[0] := 'renCode';
     args[0] := renCode;

     argNames[1] := 'datestart';
     args[1] := DateToStr( edtDateStart.date );

     argNames[2] := 'datefinal';
     args[2] := DateToStr( edtDateFinal.date );

     argNames[3] := 'OnlyOverdue';
     if chkOnlyOverdue.Checked  then
     args[3] := '1'
     else
     args[3] := '0';

     argNames[4] := 'renName';
     args[4] := renName;



     argNames[5] := 'showStatusProveden';
     if chkBuhStatus.Checked then
        args[5] := '0'
     else
        args[5] := '1';


     argNames[6] := 'show_enservicescontractstts_terminated';
     if chkshow_enservicescontractstts_terminated.Checked  then
       args[6] := '1'
     else
       args[6] := '0';


     argnames[7] := 'isOnlyReplaсeCounter';
     if chbReplaсeCounter.Checked then
      args[7]:= '1'
     else
      args[7]:= '0';

     argnames[8] := 'isShowInfoCounters';
     if chkShowInfoCounters.Checked then
      args[8]:= '1'
     else
      args[8]:= '0';

      argNames[9]:= 'tkclassificationtypecodes';
      if trim(edtTKClassificationTypeName.Text) = '' then
        args[9] := ''
        else
        args[9] := edtTKClassificationTypeName.Text;

      argNames[10]:= 'ServicesWithoutFact';
      if chkServicesWithoutFact.Checked = true then
        args[10] := '1'
        else
        args[10] := '0';


     if ((chkShowInfoCounters.Checked = true ) and ( chkShowInfoCounters.Visible = true )) then
      reportName := 'Services/servicesRegistryPrint2DS/servicesRegistryPrint2'
     else
      reportName := 'Services/servicesRegistryPrint2Term';

      makeReport(reportName , argNames , args , 'xls');

   end;




end;

procedure TfrmServicesRegistryPrint2.chbReplaсeCounterClick(Sender: TObject);
begin
  inherited;
    if chbReplaсeCounter.Checked then
       begin
       chkShowInfoCounters.Visible := True;
       chkShowInfoCounters.Checked:= true;
       end
    else
       begin
       chkShowInfoCounters.Visible := false;
       chkShowInfoCounters.Checked:= false ;
       end;
end;

procedure TfrmServicesRegistryPrint2.FormShow(Sender: TObject);
begin
  renCode := '0';
  renName := '';
end;

procedure TfrmServicesRegistryPrint2.spbEPRenClearClick(Sender: TObject);
begin
  renCode := '0';
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmServicesRegistryPrint2.spbEPRenClick(Sender: TObject);
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

procedure TfrmServicesRegistryPrint2.spbTKClassificationTypeClick(
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
