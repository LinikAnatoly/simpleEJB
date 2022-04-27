unit printAgree4DFEE;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,XSBuiltIns,
    Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls,  ChildFormUnit, ENConsts,
    EnergyproController , DMReportsUnit, InvokeRegistry, Rio, SOAPHTTPClient,
    Grids, AdvObj, BaseGrid, AdvGrid;

type
    TfrmprintAgree4DFEE = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtRights: TMemo;
    Label2: TLabel;
    edtConnectionObj: TMemo;
    lblAdditional: TLabel;
    edtAdd1_1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    edtAdd1_2: TMemo;
    Label5: TLabel;
    edtAdd2: TMemo;
    Label6: TLabel;
    edtAdd3: TMemo;
    Label7: TLabel;
    edtAdd4: TMemo;
    lblNumber: TLabel;
    edtContragentPassport: TMemo;
    lblVoltage: TLabel;
    lblPower: TLabel;
    edtVoltage: TMemo;
    edtI: TMemo;
    Label8: TLabel;
    edtPower: TMemo;
    Label9: TLabel;
    edtPowerRelliability: TMemo;
    Label10: TLabel;
    edtConnectionAddress: TMemo;
    Label11: TLabel;
    edtELPlita: TMemo;
    edtHeating: TMemo;
    edtDocDate: TDateTimePicker;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmprintAgree4DFEE: TfrmprintAgree4DFEE;

implementation



{$R *.dfm}


procedure TfrmprintAgree4DFEE.FormShow(Sender: TObject);
begin
  inherited;
  DenyBlankValues([edtConnectionObj, edtRights]);
end;


end.
