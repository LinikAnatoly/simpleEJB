unit RepPurchases_tmc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit;

type
  TfrmReportPurchases_tmc = class(TDialogForm)
    GroupBox1: TGroupBox;
    edtYearGenStart: TComboBox;
    lblYearGen: TLabel;
    edtMonthGenStart: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGenFinal: TComboBox;
    edtYearGenFinal: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblContract: TLabel;
    edtContract: TEdit;
    spbContract: TSpeedButton;
    spbContractClear: TSpeedButton;
    CheckPr_identid: TCheckBox;
    CheckPr_mat_group: TCheckBox;
    edtMaterialGroup: TEdit;
    spbMaterialGroupClear: TSpeedButton;
    spbMaterialGroup: TSpeedButton;
    lblMaterialGroup: TLabel;
    lblOrg: TLabel;
    edtRQOrgOrgName: TEdit;
    btnOrg: TSpeedButton;
    btndelOrg: TSpeedButton;
    lblMaterial: TLabel;
    edtMaterial: TEdit;
    spbMaterial: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    CheckPr_identid2015: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure spbContractClick(Sender: TObject);
    procedure spbContractClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbMaterialGroupClick(Sender: TObject);
    procedure spbMaterialGroupClearClick(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure btndelOrgClick(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure CheckPr_identidClick(Sender: TObject);
    procedure CheckPr_identid2015Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    contractNumber: Integer;
    materialGroupCode: Integer;
    materialGroupName: String;
    porgcode : Integer;
    materialCode : Integer;
  end;

var
  frmReportPurchases_tmc: TfrmReportPurchases_tmc;

implementation

uses ShowFINServicesObject, ENServicesObjectController, EnergyproController,
  DMReportsUnit, ChildFormUnit, ShowTKMaterials, TKMaterialsController,
  ShowRQOrg, RQOrgController, ENConsts;

{$R *.dfm}

procedure TfrmReportPurchases_tmc.btndelOrgClick(Sender: TObject);
begin
    porgcode := 0;
    edtRQOrgOrgName.Text := '';

end;

procedure TfrmReportPurchases_tmc.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;

begin
    SetLength(argNames, 26);
    SetLength(args, 26);

    argNames[0] := 'yearStart';
    args[0] := edtYearGenStart.Text;

    argNames[1] := 'yearFinal';
    args[1] := edtYearGenFinal.Text;

    argNames[2] := 'monthStart';
    args[2] := inttostr( edtMonthGenStart.ItemIndex+1);

    argNames[3] := 'monthFinal';
    args[3] := inttostr(edtMonthGenFinal.ItemIndex+1);

    argNames[4] := 'contractNumber';
    if contractNumber > 0 then
      args[4] := IntToStr(contractNumber)
    else
      args[4] := IntToStr(0);

    argNames[5] := 'isGroupByIdentid2010';
    if CheckPr_identid.Checked then
      args[5] := '1'
    else
      args[5] := '0';

    argNames[6] := 'isGroupByMaterialGroups';
    if CheckPr_mat_group.Checked then
      args[6] := '1'
    else
      args[6] := '0';

   argNames[7] := 'materialGroupCode';
    if materialGroupCode > 0 then
      args[7] := IntToStr(materialGroupCode)
    else
      args[7] := IntToStr(0);

   argnames[8]:= 'porgcode';
    if porgcode > 0 then
     args[8] := IntTostr(porgcode)
    else
     args[8] := '0';

   argnames[9]:= 'materialCode';
    if materialCode > 0 then
     args[9] := IntTostr(materialCode)
    else
     args[9] := '0';

   argNames[10] := 'isGroupByIdentid2015';
    if CheckPr_identid2015.Checked then
      args[10] := '1'
    else
      args[10] := '0';


     reportName := 'material/PuschasesTMC/Purchases_tmc';
     makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportPurchases_tmc.btnOrgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   org : RQOrg;
   TempRQOrg : RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               porgcode :=   StrToInt(GetReturnValue(sgRQOrg,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;

procedure TfrmReportPurchases_tmc.CheckPr_identid2015Click(Sender: TObject);
begin
  inherited;
   if CheckPr_identid2015.Checked then
      CheckPr_identid.Checked := False;
end;

procedure TfrmReportPurchases_tmc.CheckPr_identidClick(Sender: TObject);
begin
  inherited;
   if CheckPr_identid.Checked then
      CheckPr_identid2015.Checked := False;

end;

procedure TfrmReportPurchases_tmc.FormShow(Sender: TObject);
begin
   SetComboBoxCurrentMonth(edtMonthGenStart);
   SetComboBoxCurrentMonth(edtMonthGenFinal);
   SetComboBoxCurrentYearWithStart(edtYearGenStart,2009,2);
   SetComboBoxCurrentYearWithStart(edtYearGenFinal,2009,2);
end;

procedure TfrmReportPurchases_tmc.spbContractClearClick(Sender: TObject);
begin
  contractNumber := 0;
  edtContract.Text := '';
end;

procedure TfrmReportPurchases_tmc.spbContractClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   f.conditionSQL := ' a.io_flag = ''B''';
   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContract.Text := '¹' + GetReturnValue(sgFINServicesObject, 1);
                contractNumber := StrToInt(GetReturnValue(sgFINServicesObject, 6));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmReportPurchases_tmc.spbMaterialClearClick(Sender: TObject);
begin
   materialCode := 0;
   edtMaterial.Text :=  '';
end;

procedure TfrmReportPurchases_tmc.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin

      DisableActions([actInsert, actEdit, actDelete]);

      if ShowModal = mrOk then
      begin

        try
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterial.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;

        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmReportPurchases_tmc.spbMaterialGroupClearClick(Sender: TObject);
begin
  materialGroupCode := 0;
  materialGroupName := '';
  edtMaterialGroup.Text := '';
end;

procedure TfrmReportPurchases_tmc.spbMaterialGroupClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;

begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin

      DisableActions([actInsert, actEdit, actDelete]);

      if ShowModal = mrOk then
      begin

        try
          materialGroupCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialGroup.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;

        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
