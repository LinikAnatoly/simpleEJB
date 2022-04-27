unit ReportSCRest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DialogFormUnit , RQStorageZoneController,
  JvExStdCtrls, JvMemo;

type
  TfrmReportSCRest = class(TDialogForm)
    lblcutDate: TLabel;
    edtcutDate: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtMolName: TEdit;
    Label1: TLabel;
    edtMOLCode: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    cbTypeOpZap: TCheckBox;
    cbTypeRez: TCheckBox;
    GroupBox6: TGroupBox;
    cbExpl: TCheckBox;
    cbUnexpl: TCheckBox;
    mHelp: TJvMemo;
    GroupBox5: TGroupBox;
    edtMaterialName: TEdit;
    GroupBox2: TGroupBox;
    cbCounters: TCheckBox;
    cbStamp: TCheckBox;
    cbZKU: TCheckBox;
    cbIndicator: TCheckBox;
    cbHologram: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure btnStorageClick(Sender: TObject);
    procedure edtMOLCodeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

    { Public declarations }
    divcode : string;
    divname : String;
    codedivforfilter : Integer;
    codeStorage : Integer;
  end;

var
  frmReportSCRest: TfrmReportSCRest;


implementation

uses
  EnergyproController, ShowENSpravMol, ChildFormUnit, DMReportsUnit,
  FINMolController, ShowFINMol, EditRQStorage, ShowRQStorage , RQStorageController ,
  ShowENMol, ENMolController, ENConsts, ENMolTypeController,
  ENMolStatusController, ShowRQStorageZone;

{$R *.dfm}

procedure TfrmReportSCRest.FormCreate(Sender: TObject);
begin
     edtcutDate.Date := Date;
     divcode := '0';
     codedivforfilter := 0;
     codeStorage := 0;
end;

procedure TfrmReportSCRest.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  sch_str : string;
  matCondition : String;
  iszku : string;

begin

    sch_str := '';
    iszku := '';
    matCondition := '';

    SetLength(argNames, 6);
    SetLength(args, 6);

    argNames[0] := 'cutDate';
    args[0] := DateToStr(edtcutDate.DateTime);

    argNames[1] := 'divcode';
    if edtMOLCode.Text <> '' then
       args[1] := ' kod_mol like (' + chr(39) + StringReplace(edtMOLCode.Text, '*', '%', [rfReplaceAll]) + '%' + chr (39) + ') '
    else
       args[1] := ' 1 = 1 ';

    argNames[2] := 'TypeUch';
    sch_str := ' type_object in (-999999';
    iszku := ' and nvl(is_zku, 0) in (0';
       if cbCounters.Checked = true then
          sch_str := sch_str + ', 1';
       if cbZKU.Checked = true then
       begin
          sch_str := sch_str + ', 1';
          iszku := iszku + ', 1';
       end;
       if cbStamp.Checked = true then
          sch_str := sch_str + ', 2';
       if cbIndicator.Checked = true then
          sch_str := sch_str + ', 3';
       if cbHologram.Checked = true then
          sch_str := sch_str + ', 4';
       sch_str := sch_str + ') ';
       iszku := iszku + ') ';
    args[2] := sch_str + iszku;

    argNames[3] := 'TypeOst';
    if ((cbTypeOpZap.Checked = true) and (cbTypeRez.Checked = false)) then
       sch_str := ' nvl(energy_lock, 0) <= 0 ';
    if ((cbTypeOpZap.Checked = false) and (cbTypeRez.Checked = true)) then
       sch_str := ' nvl(energy_lock, 0) > 0 ';
    if ((cbTypeOpZap.Checked = true) and (cbTypeRez.Checked = true)) then
       sch_str := ' 1 = 1 ';
    if ((cbTypeOpZap.Checked = false) and (cbTypeRez.Checked = false)) then
       sch_str := ' 1 = 2 ';
    args[3] := sch_str;

    argNames[4] := 'mat_name';

    matCondition := '';
    if Length(edtMaterialName.Text) > 0 then
    begin
      matCondition := StringReplace(edtMaterialName.Text, '*', '%', [rfReplaceAll]);
      matCondition := ' upper(str_name) like upper(' + chr(39) + '%' + matCondition + '%' + chr(39) + ') ';
    end
    else
       matCondition := ' 1 = 1 ';
    args[4] := matCondition;

    argNames[5] :=  'type_expl';
    if ((cbExpl.Checked = true) and (cbUnExpl.Checked = false)) then
       sch_str := ' kod_subsch_b in (1121, 1128, 0731) ';
    if ((cbExpl.Checked = false) and (cbUnExpl.Checked = true)) then
       sch_str := ' kod_subsch_b not in (1121, 1128, 0731) ';
    if ((cbExpl.Checked = true) and (cbUnExpl.Checked = true)) then
       sch_str := ' 1 = 1 ';
    if ((cbExpl.Checked = false) and (cbUnExpl.Checked = false)) then
       sch_str := ' 1 = 2 ';
    args[5] := sch_str;

    reportName := 'material/SC_MaterialsRemainder/SC_MaterialsRemainderMain';
    makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportSCRest.FormShow(Sender: TObject);
begin
  inherited;
   DisableControls( [edtMolName]);
end;

procedure TfrmReportSCRest.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  i: Integer;

begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtMolCode.Text := GetReturnValue(sgFINMol,0);
               edtMolName.Text := GetReturnValue(sgFINMol,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmReportSCRest.spbPlanMOLClearClick(Sender: TObject);
begin
  inherited;
    codedivforfilter := 0;
end;

procedure TfrmReportSCRest.btnStorageClick(Sender: TObject);
begin
  inherited;
  codeStorage:= 0;
end;

procedure TfrmReportSCRest.edtMOLCodeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   edtMolName.Clear;
end;

end.
