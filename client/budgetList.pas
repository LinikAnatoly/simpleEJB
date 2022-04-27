unit budgetList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, Buttons, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient ;

type
  TfrmbudgetList = class(TDialogForm)
    ListBudget: TCheckListBox;
    Label2: TLabel;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    HTTPRIOTENDepartment: THTTPRIO;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmbudgetList: TfrmbudgetList;

implementation

uses
  ENDepartmentController;

{$R *.dfm}

procedure TfrmbudgetList.btnCheckListAllClick(
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

procedure TfrmbudgetList.btnClearCleckListClick(
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

procedure TfrmbudgetList.FormCreate(Sender: TObject);
var
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
  TempTKBudget: ENDepartmentControllerSoapPort;
begin
  inherited;
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

procedure TfrmbudgetList.FormShow(Sender: TObject);
{var
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
  TempTKBudget: ENDepartmentControllerSoapPort;}
begin
    // заполняем список бюджетодержателей

{     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';

     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     ListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
      begin
        ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
      end; }
end;

end.
