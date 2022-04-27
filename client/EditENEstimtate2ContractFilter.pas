unit EditENEstimtate2ContractFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, Buttons ;

type
  TfrmENEstimateitem2ContractFilter = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    lblENBudgetName: TLabel;
    edtOrderName: TEdit;
    spbOrder: TSpeedButton;
    spbOrderClear: TSpeedButton;
    chkwithoutBill: TCheckBox;
    procedure spbOrderClick(Sender: TObject);
    procedure spbOrderClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  //  EnEstimateitem2ContractOrderCode : Integer;
  end;

var
  frmENEstimateitem2ContractFilter: TfrmENEstimateitem2ContractFilter;
  EnEstimateitem2ContractOrderCode: Integer;
  withoutBill : Boolean;

implementation

uses EditRQOrderFilter, ShowRQOrder, RQOrderController, RQOrderKindController,
  ENConsts, ChildFormUnit;

{$R *.dfm}

procedure TfrmENEstimateitem2ContractFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
     withoutBill:= chkwithoutBill.Checked;
end;

procedure TfrmENEstimateitem2ContractFilter.FormShow(Sender: TObject);
begin
  inherited;
    DisableControls([edtOrderName]);
    withoutBill:= False;
end;

procedure TfrmENEstimateitem2ContractFilter.spbOrderClearClick(Sender: TObject);
begin
  inherited;
  EnEstimateitem2ContractOrderCode := LOW_INT;
  edtOrderName.Text := '';
end;

procedure TfrmENEstimateitem2ContractFilter.spbOrderClick(Sender: TObject);
var
  frmRQOrderShow: TfrmRQOrderShow;
  f: RQOrderFilter;
begin
  f := RQOrderFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.kindRef := RQOrderKindRef.Create;
  f.kindRef.code := Low(Integer);

  frmRQOrderShow :=TfrmRQOrderShow.Create(Application,fmNormal, f);
  try

    with frmRQOrderShow do
      if ShowModal = mrOk then
      begin
        try
          EnEstimateitem2ContractOrderCode := StrToInt(GetReturnValue(sgRQOrder,0));
          edtOrderName.Text := GetReturnValue(sgRQOrder,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrderShow.Free;
  end;
end;

end.
