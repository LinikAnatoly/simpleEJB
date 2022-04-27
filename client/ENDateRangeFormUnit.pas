unit ENDateRangeFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons;

type
  TfrmENDateRange = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dtpDateFrom: TDateTimePicker;
    dtpDateTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENDateRange: TfrmENDateRange;

implementation

{$R *.dfm}

end.
