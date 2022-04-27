unit ReportUMCRest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DialogFormUnit , RQStorageZoneController,
  JvExStdCtrls, JvMemo;

type
  TfrmReportUMCRest = class(TDialogForm)
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
    gb: TGroupBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    cbTypeOpZap: TCheckBox;
    cbTypeNetOpZap: TCheckBox;
    cbTypeTranz: TCheckBox;
    cbTypeAVR: TCheckBox;
    cbTypeRez: TCheckBox;
    cbTypeAZ: TCheckBox;
    cbTypeAVZ: TCheckBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    cbMat: TCheckBox;
    cbMBP: TCheckBox;
    cbMNMA: TCheckBox;
    GroupBox4: TGroupBox;
    cbOS: TCheckBox;
    cbNA: TCheckBox;
    cbCounters: TCheckBox;
    GroupBox6: TGroupBox;
    cbExpl: TCheckBox;
    cbUnexpl: TCheckBox;
    mHelp: TJvMemo;
    GroupBox5: TGroupBox;
    edtMaterialName: TEdit;
    edtCFO: TEdit;
    lblCFO: TLabel;
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
  frmReportUMCRest: TfrmReportUMCRest;


implementation

uses
  EnergyproController, ShowENSpravMol, ChildFormUnit, DMReportsUnit,
  FINMolController, ShowFINMol, EditRQStorage, ShowRQStorage , RQStorageController ,
  ShowENMol, ENMolController, ENConsts, ENMolTypeController,
  ENMolStatusController, ShowRQStorageZone;

{$R *.dfm}

procedure TfrmReportUMCRest.FormCreate(Sender: TObject);
begin
     edtcutDate.Date := Date;
     divcode := '0';
     codedivforfilter := 0;
     codeStorage := 0;
end;

procedure TfrmReportUMCRest.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  sch_str : string;
  matCondition : String;

begin

    SetLength(argNames, 6);
    SetLength(args, 6);

    argNames[0] := 'cutDate';
    args[0] := DateToStr(edtcutDate.DateTime);

    argNames[1] := 'divcode';
    args[1] := StringReplace(edtMOLCode.Text, '*', '%', [rfReplaceAll]);

    argNames[2] := 'TypeUch';
    sch_str := '';
    if cbMat.checked = True then
       sch_str := sch_str + ' (substr(v.bal_sch, 1, 2) = (20)) ';
    if cbMBP.checked = True then
    begin
       if cbUnExpl.Checked then
       begin
          if sch_str <> '' then
             sch_str := sch_str + ' or ';
          sch_str := sch_str + '(substr(v.bal_sch, 1, 2) = (22))';
       end;
       if cbExpl.Checked then
       begin
          if sch_str <> '' then
             sch_str := sch_str + ' or ';
          sch_str := sch_str + '(substr(v.bal_sch, 1, 2) < (10))';
       end;
    end;
    if cbMNMA.checked = True then
    begin
       if cbUnExpl.Checked then
       begin
          if sch_str <> '' then
             sch_str := sch_str + ' or ';
          sch_str := sch_str + '(substr(v.bal_sch, 1, 2) = (15))';
       end;
       if cbExpl.Checked then
       begin
          if sch_str <> '' then
             sch_str := sch_str + ' or ';
          sch_str := sch_str + '(substr(v.bal_sch, 1, 2) = (11))';
       end;
    end;
    if sch_str = '' then
       sch_str := '1 = 2';
    args[2] := sch_str;

    argNames[3] := 'TypeOst';
    sch_str := 'v.rest_purpose_type_id in(-1';
    if cbTypeOpZap.checked = True then
       sch_str := sch_str + ', 0';
    if cbTypeNetOpZap.checked = True then
       sch_str := sch_str + ', 25';
    if cbTypeTranz.checked = True then
       sch_str := sch_str + ', 5';
    if cbTypeRez.checked = True then
       sch_str := sch_str + ', 3';
    if cbTypeAZ.checked = True then
       sch_str := sch_str + ', 1';
    if cbTypeRez.checked = True then
       sch_str := sch_str + ', 66';
    if cbTypeAZ.checked = True then
       sch_str := sch_str + ', 45';
    sch_str := sch_str + ')';
    args[3] := sch_str;

    argNames[4] := 'mat_name';

    // SUPP-18254
    matCondition := '';
    if Length(edtMaterialName.Text) > 0 then
    begin
      matCondition := StringReplace(edtMaterialName.Text, '*', '%', [rfReplaceAll]);
      matCondition := ' and upper(v.mat_name) like upper(''%' + matCondition + '%'')';
    end;
    args[4] := matCondition;

    argNames[5] :=  'frc_code';

    if Length(edtCFO.Text) > 0 then
    begin
       args[5] :=  ' and v.frc_code = ''' + edtCFO.Text + '''';
    end;


    reportName := 'material/UMC_MaterialsRemainder/UMC_MaterialsRemainderMain';
    makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportUMCRest.FormShow(Sender: TObject);
begin
  inherited;
   DisableControls( [edtMolName]);
end;

procedure TfrmReportUMCRest.spbPlanMOLClick(Sender: TObject);
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

procedure TfrmReportUMCRest.spbPlanMOLClearClick(Sender: TObject);
begin
  inherited;
    codedivforfilter := 0;
end;

procedure TfrmReportUMCRest.btnStorageClick(Sender: TObject);
begin
  inherited;
  codeStorage:= 0;
end;

procedure TfrmReportUMCRest.edtMOLCodeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   edtMolName.Clear;
end;

end.
