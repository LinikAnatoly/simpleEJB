unit reportServicesRegistryPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, SOAPHTTPClient, InvokeRegistry, Rio,
  DialogFormUnit, ChildFormUnit;

type
  TfrmServicesRegistryPrint = class(TDialogForm)
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
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    renCode, renName : string;
  public
    { Public declarations }
  end;

var
  frmServicesRegistryPrint: TfrmServicesRegistryPrint;

implementation

uses ENDepartmentController, ShowENDepartment, DMReportsUnit, ENConsts, EnergyproController  ;

{$R *.dfm}

procedure TfrmServicesRegistryPrint.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
  reportName: String;
begin
 if edtDateStart.date > edtDateFinal.date then
   Begin
     Application.MessageBox(PChar('Початкова дата не може бути більшою за кінцеву дату !!!'), PChar('Увага!'),MB_ICONWARNING);
     ModalResult:= mrNone;
   end
 else
   begin
     SetLength(argNames, 3);
     SetLength(args, 3);

     argNames[0] := 'renCode';
     args[0] := renCode;

     argNames[1] := 'datestart';
     args[1] := DateToStr( edtDateStart.date );

     argNames[2] := 'datefinal';
     args[2] := DateToStr( edtDateFinal.date );

     reportName := 'Services/servicesRegistryPrint';

     makeReport(reportName , argNames , args , 'xls');

   end;




end;

procedure TfrmServicesRegistryPrint.spbEPRenClearClick(Sender: TObject);
begin
  renCode := '';
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmServicesRegistryPrint.spbEPRenClick(Sender: TObject);
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

end.
