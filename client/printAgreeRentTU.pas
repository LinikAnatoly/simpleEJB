unit printAgreeRentTU;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,XSBuiltIns,
    Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls,  ChildFormUnit, ENConsts,
    EnergyproController , DMReportsUnit, InvokeRegistry, Rio, SOAPHTTPClient,
    Grids, AdvObj, BaseGrid, AdvGrid;

type
    TfrmPrintAgreeRentTU = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtContragent: TMemo;
    Label2: TLabel;
    edtNote: TMemo;
    lblNumber: TLabel;
    edtNumberDoc: TMemo;
    chkOldTU: TCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmPrintAgreeRentTU: TfrmPrintAgreeRentTU;

implementation



{$R *.dfm}


procedure TfrmPrintAgreeRentTU.FormShow(Sender: TObject);
begin
  inherited;
  DenyBlankValues([edtNumberDoc, edtContragent]);
end;


end.
