unit insertContractToLeaseAgreementAndCallCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit, StdCtrls, ComCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient, ExtCtrls, ENServicesObjectController,
  ENServicesContractKindController, ENConsts, ChildFormUnit,
  ENServicesContractTypeController;

type
  TfrmInsertContractToLeaseAgreementAndCallCenter = class(TDialogForm)
    lblNumberContract: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtCodeENSO: TEdit;
    spbLinkedServicesObject: TSpeedButton;
    edtServicesContractNumberENSO: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure spbLinkedServicesObjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInsertContractToLeaseAgreementAndCallCenter: TfrmInsertContractToLeaseAgreementAndCallCenter;

implementation

{$R *.dfm}

uses ShowENServicesRent, EditENServicesRent;

procedure TfrmInsertContractToLeaseAgreementAndCallCenter.FormShow(
  Sender: TObject);
begin
      SetIntStyle(edtCodeENSO);
      DisableControls([edtServicesContractNumberENSO,edtCodeENSO]);
end;

procedure TfrmInsertContractToLeaseAgreementAndCallCenter.spbLinkedServicesObjectClick(
  Sender: TObject);
var
  f : ENServicesObjectFilter;
  frmENServicesRentShow : TfrmENServicesRentShow;
begin

  f := ENServicesObjectFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.contractTypeRef := ENServicesContractTypeRef.Create;
  f.contractTypeRef.code := ENSERVICESOBJECTTYPE_OKSN;

  if (f.contractTypeRef.code = ENSERVICESOBJECTTYPE_OKSN) then
  begin
    frmENServicesRentShow := TfrmENServicesRentShow.Create(Application, fmNormal, f);
    try
    if frmENServicesRentShow.ShowModal = mrOk then
    begin
      try
          edtServicesContractNumberENSO.Text := GetReturnValue(frmENServicesRentShow.sgENServicesObject,1);
          edtCodeENSO.Text := GetReturnValue(frmENServicesRentShow.sgENServicesObject, 0);
          fromCodeServicesObject := StrToInt(edtCodeENSO.Text);
      except
          on EConvertError do Exit;
      end;
    end;
    finally
        frmENServicesRentShow.Free;
        frmENServicesRentShow := nil;
    end;
  end
  else
    ShowMessage('Ошибочка в определении типа договора...');
end;

end.
