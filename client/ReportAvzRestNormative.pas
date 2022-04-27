unit ReportAvzRestNormative;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,DialogFormUnit, Buttons, CheckLst, InvokeRegistry,
  Rio, SOAPHTTPClient;

type
  TfrmReportAvzRestNormative = class(TDialogForm)
    edtcutDate: TDateTimePicker;
    lblcutDate: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label6: TLabel;
    ListBudget: TCheckListBox;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    HTTPRIOTENDepartment: THTTPRIO;
    chkReportDetail: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportAvzRestNormative: TfrmReportAvzRestNormative;

implementation

uses DMReportsUnit, EnergyproController, ENDepartmentController;

{$R *.dfm}

procedure TfrmReportAvzRestNormative.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  sch_str : string;
  strBudget: String;
  i : Integer;
begin

    SetLength(argNames, 5);
    SetLength(args, 5);

    argNames[0] := 'cutDate';
    args[0] := DateToStr(edtcutDate.DateTime);

    strBudget:= '-1';
    For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ' , ' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;

    End;

    argNames[1] := 'strBudget';
    args[1] := strBudget;

    if chkReportDetail.Checked = false then
    reportName := 'material/avz_materials_remainder/avz_materials_remainder_main'
    else
    reportName := 'material/avz_materials_remainder_detail/avz_materials_remainder_main';
    makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmReportAvzRestNormative.FormCreate(Sender: TObject);
begin
  edtcutDate.Date := Date;
end;

procedure TfrmReportAvzRestNormative.FormShow(Sender: TObject);
var
  departmentfilter : ENDepartmentFilter;
  TempTKBudget: ENDepartmentControllerSoapPort;
  ENDepartmentList: ENDepartmentShortList;
  bi: Integer;
begin
  inherited;
    // заполняем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null and code in (select distinct ennormativevolumeavz.budgetrefcode from ennormativevolumeavz) ';



     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     ListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
       begin
         ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
       end;

//     disablecontrols([edtcutDate, edtcutDate , Label6 , ListBudget , SpeedButton1 , SpeedButton2 , Label7 , Label8 , chkReportDetail ]);
    HideControls([edtcutDate, edtcutDate , Label6 , ListBudget , SpeedButton1 , SpeedButton2 , Label7 , Label8 , chkReportDetail ]);

end;

procedure TfrmReportAvzRestNormative.SpeedButton1Click(Sender: TObject);
var
  I : Integer;
begin
     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;
    End;
end;

procedure TfrmReportAvzRestNormative.SpeedButton2Click(Sender: TObject);
var
  I : Integer;
begin
     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;
    End;
end;

end.
