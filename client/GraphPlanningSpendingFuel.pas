unit GraphPlanningSpendingFuel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, CheckLst, Buttons;

type
  TfrmGraphPlanningSpendingFuel = class(TDialogForm)
    CheckListBox1: TCheckListBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    edtYearGen: TComboBox;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkPmmIndividually: TCheckBox;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    chkwithRezerv: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     renCode: Integer;
     renName: String;
  end;

var
  frmGraphPlanningSpendingFuel: TfrmGraphPlanningSpendingFuel;

implementation

uses ShowENDepartment, ENDepartmentController, ChildFormUnit,
  EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmGraphPlanningSpendingFuel.BitBtn1Click(Sender: TObject);
var
argNames, args: ArrayOfString;
reportName: String;
i: Integer;
strmanagement: String;
strmanagementname : String;
begin
      /////// Parameters
      SetLength(argNames, 6);
      SetLength(args, 6);

      argnames[0] := 'pyeargen';
      args[0] :=  edtYearGen.Text;

      argnames[1] := 'pmonthgen';
      args[1] :=  IntToStr(edtMonthGen.ItemIndex + 1);


      argnames[2] := 'pmanagementcode';
      strmanagement := '';
      for i := 0 to CheckListBox1.Items.Count - 1 do
        if CheckListBox1.Checked[i] then
        begin
          AddListPos(strmanagement, IntToStr(i + 1));
        end;

       if length(trim(strmanagement)) = 0 then
       begin
          Application.MessageBox(PChar('Оберіть обов`язково дирекцію   !!!'), PChar('Увага!'),MB_ICONWARNING);
          ModalResult:= mrNone;
          Exit;
       end;

      args[2] := strmanagement;

      argnames[3] := 'prencode';
      args[3] := IntToStr(renCode);

      argnames[4] := 'prenname';
      if renCode > 0 then
      args[4] := edtEPRenName.Text
      else
      args[4] := 'ХОЕ';


      argnames[5] := 'withRezerv';
      if chkwithRezerv.Checked = true then
      args[5] := '1'
      else
      args[5] := '0';


      reportName := 'fuel/fuelLimit/fuelLimit';

      makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmGraphPlanningSpendingFuel.btnOkClick(Sender: TObject);
var
argNames, args: ArrayOfString;
  reportName: String;
  i: Integer;
  strmanagement: String;
  strmanagementname : String;
begin
      /////// Parameters
      SetLength(argNames, 6);
      SetLength(args, 6);

      argnames[0] := 'pyeargen';
      args[0] :=  edtYearGen.Text;

      argnames[1] := 'pmonthgen';
      args[1] :=  IntToStr(edtMonthGen.ItemIndex + 1);


      argnames[2] := 'pmanagementcode';
      strmanagement := '';
      for i := 0 to CheckListBox1.Items.Count - 1 do
        if CheckListBox1.Checked[i] then
        begin
          AddListPos(strmanagement, IntToStr(i + 1));
        end;

       if length(trim(strmanagement)) = 0 then
       begin
          Application.MessageBox(PChar('Оберіть обов`язково дирекцію   !!!'), PChar('Увага!'),MB_ICONWARNING);
          ModalResult:= mrNone;
          Exit;
       end;

      args[2] := strmanagement;

      argnames[3] := 'prencode';
      args[3] := IntToStr(renCode);

      argnames[4] := 'prenname';
      if renCode > 0 then
      args[4] := edtEPRenName.Text
      else
      args[4] := 'ХОЕ';


      argnames[5] := 'withRezerv';
      if chkwithRezerv.Checked = true then
      args[5] := '1'
      else
      args[5] := '0';


      if chkPmmIndividually.Checked = false  then
         reportName := 'fuel/fuelTT/graph_benz_dt_notgroup_tt'
      else if chkPmmIndividually.Checked = True then
         reportName := 'fuel/fuelTT/graph_benz_dt_individually_tt';


     // makeReport(reportName, argNames, args, 'xls');
      makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmGraphPlanningSpendingFuel.FormCreate(Sender: TObject);
begin
     CheckListBox1.Checked[0]:= True ;
     CheckListBox1.Checked[1]:= True;
     CheckListBox1.Checked[2]:= True ;
end;

procedure TfrmGraphPlanningSpendingFuel.FormShow(Sender: TObject);
begin
   renCode:= 0;

  SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
  SetComboBoxCurrentMonth(edtMonthGen);
end;

procedure TfrmGraphPlanningSpendingFuel.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmGraphPlanningSpendingFuel.spbEPRenClick(Sender: TObject);
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
