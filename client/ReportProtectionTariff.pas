unit ReportProtectionTariff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst , DialogFormUnit, InvokeRegistry, Rio,
  SOAPHTTPClient ;

type
  TfrmReportProtectionTariff = class(TDialogForm)
    ListBudget: TCheckListBox;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    HTTPRIOTENDepartment: THTTPRIO;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    chkShowObject: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportProtectionTariff: TfrmReportProtectionTariff;

implementation

uses ENDepartmentController, EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportProtectionTariff.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;


end;

procedure TfrmReportProtectionTariff.btnClearCleckListClick(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;


end;


procedure TfrmReportProtectionTariff.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName ,  strBudget  , tmpmaskstring : String;
  i : integer;
begin
       /// собираем строку кодов бюджетодержателей
       For i:=0 to ListBudget.Count -1  do
        Begin
           if  ListBudget.Checked[i] then
            if strBudget <>  '' then
               strBudget := strBudget + ' , ' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
             else
               strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;

        End;

      SetLength(argNames, 3);
      SetLength(args, 3);

      argNames[0] := 'yearGen';
      args[0] := edtYearGen.Text;

      argnames[1] := 'budgetstringcode';
      if strBudget <> '' then
        args[1] :=  '  p.budgetrefcode in (  ' + strBudget + ')'
      else
        args[1] := ' 1 = 1 ';

      argnames[2] := 'isShowObject';
      if chkShowObject.Checked then
        args[2] := '1'
      else
        args[2] := '0';


      reportName := 'material/rep_protection_tariff';
      makeReport(reportName, argNames, args, 'xlsx');
end;


procedure TfrmReportProtectionTariff.FormShow(Sender: TObject);
var
  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;

begin
   // заполняем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';



     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     ListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
      begin

        ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
      end;
end;

end.
