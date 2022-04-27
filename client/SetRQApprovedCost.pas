unit SetRQApprovedCost;

interface

uses
  Buttons, Controls, Classes, StdCtrls, XSBuiltIns,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, RQApprovedCostController;

type
  TfrmSetRQApprovedCost = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtPrice: TEdit;
    lblPrice: TLabel;
    edtPriceVAT: TEdit;
    lblPriceVAT: TLabel;
    lblCountGen: TLabel;
    edtCountGen: TEdit;
    procedure FormShow(Sender: TObject);
    procedure recalcVAT;
    procedure edtPriceChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

  public
    { Public declarations }
    approvedCost : RQApprovedCost;
  end;

var
  frmSetRQApprovedCost: TfrmSetRQApprovedCost;



implementation
uses ChildFormUnit , ENConsts
     , EnergyproController, DMReportsUnit, Math;

{$R *.dfm}

procedure TfrmSetRQApprovedCost.edtPriceChange(Sender: TObject);
begin
  recalcVAT;
end;


procedure TfrmSetRQApprovedCost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  begin
    if NoBlankValues([edtPrice, edtCountGen]) then
    begin
      if (approvedCost.priceWithoutNds = nil) then
        approvedCost.priceWithoutNds := TXSDecimal.Create;
      approvedCost.priceWithoutNds.DecimalString := edtPrice.Text;

      if (approvedCost.countGen = nil) then
        approvedCost.countGen := TXSDecimal.Create;
      approvedCost.countGen.DecimalString := edtCountGen.Text;
    end else
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;
  end;
end;


procedure TfrmSetRQApprovedCost.FormShow(Sender: TObject);
begin
  SetFloatStyle([edtPrice, edtCountGen]);
  DenyBlankValues([edtPrice, edtCountGen]);

  edtCountGen.Text := approvedCost.countGen.DecimalString;

  if ( approvedCost.priceWithoutNds <> nil ) then
    edtPrice.Text := approvedCost.priceWithoutNds.DecimalString
  else
    edtPrice.Text := '';

  edtPrice.SetFocus;

  DisableControls([edtPriceVAT]);
end;

procedure TfrmSetRQApprovedCost.recalcVAT;
var
  priceWithVat : Double;
begin
  try
    priceWithVat := 0;
    priceWithVat := StrToFloat(edtPrice.Text);
  except
    Exit;
  end;
  priceWithVat := priceWithVat + priceWithVat * 0.2;
  edtPriceVat.Text := FormatFloat('0.00', priceWithVat);
end;

end.
