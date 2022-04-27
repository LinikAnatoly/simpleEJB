unit ShowIFobsXMLNotImported;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, AdvGrid, Grids, AdvObj, BaseGrid,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmIFobsXMLNotImportedShow = class(TDialogForm)
    sgPaymentGroupInfo: TAdvStringGrid;
    lblSummGroup: TLabel;
    HTTPRIORQPlanPay: THTTPRIO;
    btnOk: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);


  private




  public
    rqPlanPayCode : Integer;

  end;

var
  frmIFobsXMLFileNotImportedShow: TfrmIFobsXMLNotImportedShow;

implementation
uses ChildFormUnit , ENConsts, EnergyproController, DMReportsUnit, GridHeadersUnit
     , RQPlanPayController;

var
        PaymentGroupInfoHeaders: array [1..11] of String =
        (
         'Код rqbill'
        ,'Номер счета EnergyNET'
        ,'Дата счета EnergyNET'
        ,'Сумма по счету (грн. с НДС)'
        ,'р/сч плательщика'
        ,'МФО банка плательщика'
        ,'ОКПО получателя'
        ,'Получатель'
        ,'р/сч получателя'
        ,'МФО банка получателя'
        ,'Назначение платежа'
          );

{$R *.dfm}
 //----------------------------------------------------------------------------



procedure TfrmIFobsXMLNotImportedShow.btnOkClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmIFobsXMLNotImportedShow.FormCreate(Sender: TObject);
begin
  inherited;
  rqPlanPayCode := Low(Integer);
end;

procedure TfrmIFobsXMLNotImportedShow.FormShow(Sender: TObject);
var
  TempRQPlanPay : RQPlanPayControllerSoapPort;
  listForClientBank : IFobsXMLInfoList;
  PInfoLastCount , i , PInfoLastRow : Integer;
  Vamount, toPaySumGroup : Double ;
begin
  inherited;

  sgPaymentGroupInfo.Options := sgPaymentGroupInfo.Options - [goColMoving];

  SetGridHeaders(PaymentGroupInfoHeaders, sgPaymentGroupInfo.ColumnHeaders);
  TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
  listForClientBank := TempRQPlanPay.getListForIFobsXMLFileNotImportedFromProbank(rqPlanPayCode);
  SetGridHeaders(PaymentGroupInfoHeaders, sgPaymentGroupInfo.ColumnHeaders);

  toPaySumGroup := 0;
  PInfoLastCount:=High(listForClientBank.list);
  if PInfoLastCount > -1 then
    sgPaymentGroupInfo.RowCount:=PInfoLastCount+2
  else
    sgPaymentGroupInfo.RowCount:=2;

	 with sgPaymentGroupInfo do
    for i := 0 to PInfoLastCount do
      begin
        Application.ProcessMessages;

        Cells[0,i+1] := listForClientBank.list[i].documentNo; // айди rqbill
        Cells[1,i+1] := listForClientBank.list[i].billNumber;
        Cells[2,i+1] := listForClientBank.list[i].billDate;
           Vamount :=   listForClientBank.list[i].amount / 100;
        Cells[3,i+1] := FloatToStr( Vamount );
         toPaySumGroup := toPaySumGroup + Vamount;

        Cells[4,i+1] := listForClientBank.list[i].accountNo; // наш счет
        Cells[5,i+1] := listForClientBank.list[i].ourBankId; // наш мфо

        Cells[6,i+1] := listForClientBank.list[i].corrIdentifyCode; // окпо контрагента
        Cells[7,i+1] := listForClientBank.list[i].corrSName; // наименование контрагента
        Cells[8,i+1] := listForClientBank.list[i].CorrAccountNo; // счет контрагента в банке
        Cells[9,i+1] := listForClientBank.list[i].corrBankId; // мфо банка  контрагента
        Cells[10,i+1] := listForClientBank.list[i].detailsOfPayment; // назначение платежа



		    PInfoLastRow:=i+1;
        sgPaymentGroupInfo.RowCount:=PInfoLastRow+1;
      end;

   lblSummGroup.Caption := 'Cумма: ' + FloatToStr(toPaySumGroup);


end;

end.
