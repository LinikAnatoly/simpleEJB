unit EditScanCountersFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DialogFormUnit,ScanCountersController;

type
  TfrmScanCountersFilterEdit = class(TDialogForm)
    lblMolCode: TLabel;
    lblBuildNumber: TLabel;
    lblInvNumber: TLabel;
    edtMolCode: TEdit;
    edtInvNumber: TEdit;
    edtBuildNumber: TEdit;
    btnCancel: TButton;
    btnOk: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  frmScanCountersFilterEdit: TfrmScanCountersFilterEdit;
  ScanCountersFilterObj: ScanCountersFilter;

implementation

{$R *.dfm}

uses ShowScanCounters,Main, DMReportsUnit, ENSettingsConsts, BaseUtilsUnit, ENConsts;

procedure TfrmScanCountersFilterEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var strAccountsCondition : String;
accounts : TStringList;
begin
if edtInvNumber.Text<>'' then
  ScanCountersFilter(frmScanCountersShow.FilterObject).invnumber := edtInvNumber.Text;

if edtBuildNumber.Text<>'' then
  ScanCountersFilter(frmScanCountersShow.FilterObject).serialnumber := edtBuildNumber.Text;

if edtMolCode.Text<>'' then
  ScanCountersFilter(frmScanCountersShow.FilterObject).mol := edtMolCode.Text;



if budgetCode = ENBUDGET_VRTUVD then
      ScanCountersFilter(frmScanCountersShow.FilterObject).conditionSQL:=' substr(SCANCOUNTERS.kod_mol, 1, 2)='+'''' + copy(molCode,1,2) + ''''+' and substr(SCANCOUNTERS.kod_subsch_b,1,2) ='+''''+'15'+''''+
      ' and nvl(SCANCOUNTERS.is_vrtu,0)=1 '
  else if budgetCode = ENBUDGET_ENERGOSBYT then begin
    strAccountsCondition := DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNTS_FOR_COUNTERS_PUT_IN_SERVICE);

    accounts := TStringList.Create;
    accounts.CommaText := strAccountsCondition;

    strAccountsCondition := BaseUtils.array2String(BaseUtils.transformStringListMakeSingleQuotes(accounts),',');

    ScanCountersFilter(frmScanCountersShow.FilterObject).conditionSQL:=' substr(SCANCOUNTERS.kod_mol, 1, 2)=' + '''' + copy(molCode, 1, 2) + '''' +
    ' and SCANCOUNTERS.kod_subsch_b in (' + strAccountsCondition + ')'+
      ' and nvl(SCANCOUNTERS.is_vrtu,0)<>1 ';
  end;
end;

end.
