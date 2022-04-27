unit ChangeGeneralParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit, ComCtrls, StdCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient,XSBuiltIns;

type
  TfrmChangeGeneralParam = class(TDialogForm)
    lblperiodOrder: TLabel;
    dtpperiodOrder: TDateTimePicker;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQOrder: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    orderCode : Integer;
  end;

var
  frmChangeGeneralParam: TfrmChangeGeneralParam;

implementation

uses RQOrderController;

{$R *.dfm}

procedure TfrmChangeGeneralParam.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
  TempRQOrder: RQOrderControllerSoapPort;
  orderPeriod : TXSDate;
 begin
    if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
       dtpperiodOrder
     ])  then
  begin
			Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
			Action:=caNone;
  end
  else
  begin
        TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;

      if dtpperiodOrder.checked then
     begin
          orderPeriod := TXSDate.Create;
          orderPeriod.XSToNative(GetXSDate(dtpperiodOrder.DateTime));
     end
     else
          orderPeriod := nil;

      TempRQOrder.changePeriodOrder(orderCode ,orderPeriod);


  end;
 end;

end.
