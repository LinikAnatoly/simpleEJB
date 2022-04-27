unit reportPlanPurchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, ExtCtrls  , ChildFormUnit ;

type
  TfrmReportPlanPurchase = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    RadioGroup1: TRadioGroup;
    rbPlanPurchase: TRadioButton;
    rbListForAuction: TRadioButton;
    isShowObject: TCheckBox;
    RadioButton1: TRadioButton;
    lblNameItemType: TLabel;
    edtNameItemType: TEdit;
    spbItemType: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure rbPlanPurchaseClick(Sender: TObject);
    procedure rbListForAuctionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbItemTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PlanPurchaseCode : Integer;
    purchaseItemTypeCode : Integer;
  end;

var
  frmReportPlanPurchase: TfrmReportPlanPurchase;

implementation

uses DMReportsUnit, EnergyproController, ShowRQPurchaseItemType;

{$R *.dfm}

procedure TfrmReportPlanPurchase.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

  if (PlanPurchaseCode = low(Integer)) then Exit;
  SetLength(argNames, 5);
  SetLength(args, 5);

  argNames[0] := 'planpurchasecode';
  args[0] := IntToStr(PlanPurchaseCode);

  argNames[1] := 'isShowObject';
  if isShowObject.Checked = true then
  args[1] := '1'
  else if isShowObject.Checked = false  then
  args[1] := '0';

  argNames[2] := 'purchaseItemTypeCode';
  args[2] := IntToStr(purchaseItemTypeCode);


   if rbPlanPurchase.Checked then
  reportName := 'Tender/PlanPurchase/planPurchase'
   else if rbListForAuction.Checked then
  reportName := 'Tender/PlanPurchase/listForAuction';

  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmReportPlanPurchase.FormShow(Sender: TObject);
begin
     rbPlanPurchase.Checked:= true;
     DisableControls([edtNameItemType]);
     purchaseItemTypeCode:= 0;
end;

procedure TfrmReportPlanPurchase.rbListForAuctionClick(Sender: TObject);
begin
   isShowObject.Visible:= true;
   isShowObject.Checked:= true;
end;

procedure TfrmReportPlanPurchase.rbPlanPurchaseClick(Sender: TObject);
begin
  isShowObject.Visible:= false;
  isShowObject.Checked:= false;
end;

procedure TfrmReportPlanPurchase.spbItemTypeClick(Sender: TObject);
var
   frmrqItemTypeShow : TfrmRQPurchaseItemTypeShow;
begin


   frmrqItemTypeShow := TfrmRQPurchaseItemTypeShow.Create(Application, fmNormal);
   try
     with frmrqItemTypeShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           edtNameItemType.Text := GetReturnValue(sgRQPurchaseItemType, 1) ;
           purchaseItemTypeCode := StrToInt( GetReturnValue(sgRQPurchaseItemType, 0) );
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmrqItemTypeShow.Free;
   end;
end;

end.
