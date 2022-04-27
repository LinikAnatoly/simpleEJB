unit EditScanCountersFilterForEnWorkOrderBytItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DialogFormUnit,ScanCountersController;

type
  TfrmScanCountersFilterEditForEnWorkOrderBytItem = class(TDialogForm)
    lblMolCode: TLabel;
    lblBuildNumber: TLabel;
    lblInvNumber: TLabel;
    edtMolCode: TEdit;
    edtInvNumber: TEdit;
    edtBuildNumber: TEdit;
    btnCancel: TButton;
    btnOk: TButton;
    chkCounterWithoutAccountPoint: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScanCountersFilterEditForEnWorkOrderBytItem: TfrmScanCountersFilterEditForEnWorkOrderBytItem;
  ScanCountersFilterObj: ScanCountersFilter;


implementation

{$R *.dfm}

uses ShowScanCountersForEnWorkOrderBytItem,Main;

procedure TfrmScanCountersFilterEditForEnWorkOrderBytItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
var condition: String;
begin
  if (ModalResult = mrOk)  then
  begin
     {
      if edtInvNumber.Text<>'' then
        ScanCountersFilter(frmScanCountersShowForEnWorkOrderBytItem.FilterObject).invnumber := edtInvNumber.Text;

      if edtBuildNumber.Text<>'' then
        ScanCountersFilter(frmScanCountersShowForEnWorkOrderBytItem.FilterObject).serialnumber := edtBuildNumber.Text;


      if edtMolCode.Text<>'' then
        ScanCountersFilter(frmScanCountersShowForEnWorkOrderBytItem.FilterObject).mol := edtMolCode.Text;

        // отображение счетчиков которые не под планы
      if chkCounterWithoutAccountPoint.Checked = True then
         ScanCountersFilter(frmScanCountersShowForEnWorkOrderBytItem.FilterObject).conditionSQL:='  SCANCOUNTERS.enestimateitemcode is null ' ;
     }

      condition := ScanCountersFilterObj.conditionSQL;

      ScanCountersFilterObj.invnumber := edtInvNumber.Text;
      ScanCountersFilterObj.serialnumber := edtBuildNumber.Text;
      ScanCountersFilterObj.mol := edtMolCode.Text;

      // отображение счетчиков, которые не под планы
      if chkCounterWithoutAccountPoint.Checked then
        AddCondition(condition, 'SCANCOUNTERS.enestimateitemcode is null');

      ScanCountersFilterObj.conditionSQL := condition;
  end;
end;

end.
