unit OrderOnMonth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit;

type
  TfrmOrderOnMonth = class(TDialogForm)
    lblYearRaznar: TLabel;
    Label1: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrderOnMonth: TfrmOrderOnMonth;

implementation

{$R *.dfm}

end.
