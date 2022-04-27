unit reportActZbyt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons , DialogFormUnit , EnergyproController , DMReportsUnit,
  InvokeRegistry, Rio, SOAPHTTPClient , ENActController , ChildFormUnit , FINMaterialsController,
  CheckLst , DateUtils, ExtCtrls, Menus ;

type
  TfrmreportActZbyt = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    HTTPRIOTENDepartment: THTTPRIO;
    gbDates: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    gbCheckBox1: TGroupBox;
    chkByt: TCheckBox;
    gbCheckBox2: TGroupBox;
    chkProm: TCheckBox;
    gbComboBox1: TPanel;
    lblCombBox1: TLabel;
    cBox1: TComboBox;
    arcList: TCheckListBox;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    actSelectAll: TMenuItem;
    actUnselectAll: TMenuItem;
    actInvert: TMenuItem;
    procedure doReport();
    procedure doSubReport(arcCode: Integer);
    procedure btnOkClick(Sender: TObject);
    procedure cBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSelectAllClick(Sender: TObject);
    procedure actUnselectAllClick(Sender: TObject);
    procedure actInvertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    budgCode: Integer;
    budgName: String;
    elementCode : integer;
    elementName : String;
    ActTypeCode : Integer;
    ActTypeName : String;
    WorkTypeCode : Integer ;
    WorkTypeName : String ;
    NumberActCode : Integer ;

    materialCode : Integer;
    materialName : String;


    finExecutor_name : String;
    finExecutor_finCode : Integer;

    report_vid : Integer; //(1-енергосбіт  2- метрология )

  end;

var
  frmreportActZbyt: TfrmreportActZbyt;

implementation

uses Math , ENDepartmentController, ENDepartmentTypeController , ShowENDepartment ,
 ENConsts , ShowENElement, ENElementController , ENElementTypeController ,
ShowENPlanWorkState , ENPlanWorkStateController , ShowENPlanWorkType , ENPlanWorkTypeController ,
EditENAct, EditENActFilter , ShowENAct  , ShowFINMaterials , ShowTKMaterials, TKMaterialsController ,
ShowFINExecutorTree , FINExecutorController , ENForImplementation;

{$R *.dfm}

procedure TfrmreportActZbyt.actInvertClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to arcList.Items.Count-1 do arcList.Checked[i]:=not arcList.Checked[i];
end;

procedure TfrmreportActZbyt.actSelectAllClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to arcList.Items.Count-1 do arcList.Checked[i]:=True;
end;

procedure TfrmreportActZbyt.actUnselectAllClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to arcList.Items.Count-1 do arcList.Checked[i]:=False;
end;

procedure TfrmreportActZbyt.btnOkClick(Sender: TObject);
begin
  doReport;
end;

procedure TfrmreportActZbyt.cBox1Change(Sender: TObject);
var
  i: Integer;
begin
  if (cBox1.ItemIndex=0) or (cBox1.ItemIndex=2) or (cBox1.ItemIndex=3) then
  begin
     for i := 0 to arcList.Items.Count-1 do arcList.Checked[i]:=False;
     arcList.Enabled:=False;
  end
  else
  begin
     arcList.Enabled:=True;
  end;
end;

procedure TfrmreportActZbyt.doReport();
var
  argNames, args: ArrayOfString;
  reportName: String;
  i: Integer;
begin

      /////// Parameters
      SetLength(argNames, 4);
      SetLength(args, 4);

      argNames[0] := 'dateStart';
      args[0] := DateToStr(dtpStartDate.Date);

      argNames[1] := 'dateEnd';
      args[1] := DateToStr(dtpEndDate.Date);

      argNames[2] := 'includeByt';
      if chkByt.Checked then args[2]:='1' else args[2]:='0';

      argNames[3] := 'includeProm';
      if chkProm.Checked then args[3]:='1' else args[3]:='0';

      if cBox1.ItemIndex = 0 then
      reportName := 'RepEnergozbyt/Acts/act_group_report/group_main'
      else
      if cBox1.ItemIndex = 1 then
      reportName := 'RepEnergozbyt/Acts/act_group_report_new/group_main'
      else
      if cBox1.ItemIndex = 2 then
      reportName := 'RepEnergozbyt/Acts/act_group_report_short/group_main'
      else
      if cBox1.ItemIndex = 3 then
      reportName := 'RepEnergozbyt/Acts/act_group_report_overal/group_main';

      makeReport(reportName, argNames, args, 'xls');

      for i := 0 to arcList.Items.Count-1 do
      begin
          if arcList.Checked[i] then doSubReport(i);
      end;

end;

procedure TfrmreportActZbyt.doSubReport(arcCode: Integer);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

      /////// Parameters
      SetLength(argNames, 6);
      SetLength(args, 6);

      argNames[0] := 'dateStart';
      args[0] := DateToStr(dtpStartDate.Date);

      argNames[1] := 'dateEnd';
      args[1] := DateToStr(dtpEndDate.Date);

      argNames[2] := 'depCode';
      args[2] := IntToStr(0);

      argNames[3] := 'includeByt';
      if chkByt.Checked then args[3]:='1' else args[3]:='0';

      argNames[4] := 'includeProm';
      if chkProm.Checked then args[4]:='1' else args[4]:='0';

      argNames[5] := 'actReportColumnCode';
      args[5]:=IntToStr(arcCode);

      ///////
      reportName := 'RepEnergozbyt/Acts/act_detailed_report/detailed_main';
      makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmreportActZbyt.FormShow(Sender: TObject);
begin
  arcList.Enabled:=(cBox1.ItemIndex<>0);
end;

end.
