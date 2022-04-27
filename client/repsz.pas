unit repsz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmSZ = class(TDialogForm)
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    chkGroupPersonal: TCheckBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblMonthStart: TLabel;
    edtMonthStart: TComboBox;
    lblMonthFinal: TLabel;
    edtMonthFinal: TComboBox;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  renCode : Integer;
  renName : String ;
  depCodes : String;
    { Public declarations }
  end;

var
  frmSZ: TfrmSZ;

implementation

uses ShowENDepartment , ENDepartmentController , EnergyproController , DMReportsUnit ;

{$R *.dfm}

procedure TfrmSZ.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   TempENDepartment: ENDepartmentControllerSoapPort;
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
          TempENDepartment := Self.HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
          depCodes := TempENDepartment.getDepartmentCodesDown(renCode);

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;
procedure TfrmSZ.FormCreate(Sender: TObject);
begin
  inherited;
  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, true);
end;

procedure TfrmSZ.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  depCodes := '';
end;

procedure TfrmSZ.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;

begin

      SetLength(argNames, 9);
      SetLength(args, 9);


      argNames[0] := 'department';
      if depCodes <> '' then
      args[0] := ' and so.departmentrefcode in ( ' + depCodes + ' )'
      else
      args[0] := ' and 1 = 1 ' ;

      argNames[1] := 'ftabnumber';
      if   chkGroupPersonal.Checked then
      args[1] := 'tabnumber'
      else
      args[1] := '1';

      argNames[2] := 'ffio';
      if   chkGroupPersonal.Checked then
      args[2] := 'fio'
      else
      args[2] := '1';

      argNames[3] := 'year';
      args[3] := edtYearGen.Text;

      argNames[4] := 'fdepname';
      if   chkGroupPersonal.Checked then
      args[4] := 'depname'
      else
      args[4] := '1';

      argNames[5] := 'pmonthstart';
      args[5] := IntToStr(edtMonthStart.ItemIndex + 1);

      argNames[6] := 'pmonthend';
      args[6] := IntToStr(edtMonthFinal.ItemIndex + 1 );

      argNames[7] := 'pmonthstartstr';
      args[7] := edtMonthStart.Text;

      argNames[8] := 'pmonthendstr';
      args[8] := edtMonthFinal.Text;



      // reportName := 'SZ/siz_end_period_use';
      reportName := 'SZ/siz_by_sizobject';
      makeReport(reportName , argNames , args , 'xls');



end;

end.
