unit PlanFactUseGSM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls ,DialogFormUnit, ExtCtrls;

type
  TfrmPlanFactUseGSM = class(TDialogForm)
    chkActStatus: TCheckBox;
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkshowManagementZbyt: TCheckBox;
    rgPlanKind: TRadioGroup;
    chbObjects: TCheckBox;
    procedure chkActStatusClick(Sender: TObject);
    procedure chbObjectsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanFactUseGSM: TfrmPlanFactUseGSM;

implementation

{$R *.dfm}

procedure TfrmPlanFactUseGSM.chbObjectsClick(Sender: TObject);
begin
  inherited;
   if chbObjects.checked then
      begin
      chkActStatus.Visible := false;
      chkActStatus.Checked := false;
      chkshowManagementZbyt.Visible := false;
      chkshowManagementZbyt.Checked := false;
      end
   else
   begin
   chkActStatus.Visible := true;
   chkshowManagementZbyt.Visible := true;
   end;

end;

procedure TfrmPlanFactUseGSM.chkActStatusClick(Sender: TObject);
begin
   if chkActStatus.Checked then
      chkActStatus.Caption := 'Тільки проведені акти'
   else
      chkActStatus.Caption := 'Акти чорнові, на підпісанні , проведені';

end;

end.
