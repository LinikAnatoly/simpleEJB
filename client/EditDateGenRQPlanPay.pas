unit EditDateGenRQPlanPay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls , DialogFormUnit, InvokeRegistry, Rio,
  SOAPHTTPClient , XSBuiltIns;

type
  TfrmEditDateGenRQPlanPay = class(TDialogForm)
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIORQPlanPay: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    planPayCode : Integer;
  end;

var
  frmEditDateGenRQPlanPay: TfrmEditDateGenRQPlanPay;

implementation

uses RQPlanPayController;

{$R *.dfm}

procedure TfrmEditDateGenRQPlanPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempRQPlanPay: RQPlanPayControllerSoapPort;
    plPayObj: RQPlanPay;
 begin
    if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
       edtDateGen
     ])  then
  begin
			Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
			Action:=caNone;
  end
  else
  begin
     plPayObj := nil;
         TempRQPlanPay := HTTPRIORQPlanPay as RQPlanPayControllerSoapPort;
           try
            plPayObj := TempRQPlanPay.getObject(planPayCode);
             except
          on EConvertError do Exit;
          end;


      if edtDateGen.checked then
     begin
          plPayObj.dateGen := TXSDate.Create;
          plPayObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
          plPayObj.dateGen := nil;



      TempRQPlanPay.EditDateGenRQPlanPay(plPayObj);


  end;
 end;

procedure TfrmEditDateGenRQPlanPay.FormShow(Sender: TObject);
begin
   edtDateGen.DateTime := Date;
end;

end.
