unit enchangepersonbyt_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs ,DialogFormUnit, StdCtrls, Buttons, ComCtrls ;

type
  Tfrmenchangepersonbyt = class(TDialogForm)
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
  end;

var
  frmenchangepersonbyt: Tfrmenchangepersonbyt;

implementation

uses ShowENDepartment, ENDepartmentController, ENReportsController,
  EnergyproController, DMReportsUnit, ChildFormUnit;



{$R *.dfm}

procedure Tfrmenchangepersonbyt.btnOkClick(Sender: TObject);

var
  argNames, args: ArrayOfString;
  reportName: String;
  renCodes : String;
  var ys,ms,ds,yf,mf,df: Word;
  i : Integer;
  department : ENDepartment;
  depCodes :String;
begin
      SetLength(argNames, 12);
      SetLength(args, 12);

      depCodes := 'select code from endepartment';

      argNames[0] := 'datestart';
      args[0] := DateToStr( edtDateStart.date );

      argNames[1] := 'datefinal';
      args[1] := DateToStr( edtDateFinal.date );

      argNames[2] := 'podrcode';
      args[2] := IntToStr(renCode);

      argNames[3] := 'podrcodes';
      if rencode <> 0 then
      begin
       depCodes := DMReports.getDepartmentCodesDown(renCode);
       args[3] := depCodes;
      end
      else
      args[3] := depCodes;

      argNames[4] := 'podrname';
      if renName ='' then
      args[4] := 'Всі підрозділи'
      else
      args[4] := renName;




       reportName:=  'Zbyt/enchangepersonbyt';
       makeReport(reportName , argNames , args , 'xls');
end;

procedure Tfrmenchangepersonbyt.spbEPRenClearClick(Sender: TObject);
begin
renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure Tfrmenchangepersonbyt.spbEPRenClick(Sender: TObject);
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

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

end.
