unit reportlistPlanWithoutBinding2IP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, Buttons, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient ;

type
  TfrmReportlistPlanWithoutBinding2IP = class(TDialogForm)
    ListBudget: TCheckListBox;
    Label2: TLabel;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    HTTPRIOTENDepartment: THTTPRIO;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportlistPlanWithoutBinding2IP: TfrmReportlistPlanWithoutBinding2IP;

implementation

uses
  ENDepartmentController;

{$R *.dfm}

procedure TfrmReportlistPlanWithoutBinding2IP.btnCheckListAllClick(
  Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;


end;

procedure TfrmReportlistPlanWithoutBinding2IP.btnClearCleckListClick(
  Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;


end;

procedure TfrmReportlistPlanWithoutBinding2IP.FormShow(Sender: TObject);
var
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
  TempTKBudget: ENDepartmentControllerSoapPort;
begin
    // заполняем список бюджетодержателей

     SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);

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
