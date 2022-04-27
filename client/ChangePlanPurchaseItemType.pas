unit ChangePlanPurchaseItemType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , RQPurchaseItemController, DialogFormUnit, StdCtrls, Buttons , ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient ;

type
  TfrmChangePlanPurchaseItemType = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtrqplanpurchaseitemtype: TEdit;
    lblrqplanpurchaseitemtype: TLabel;
    spbedtrqplanpurchaseitemtype: TSpeedButton;
    HTTPRIORQPurchaseItem: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure spbedtrqplanpurchaseitemtypeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangePlanPurchaseItemType: TfrmChangePlanPurchaseItemType;
  RQPurchaseItemObjForChangeType: RQPurchaseItem;

implementation

uses ShowRQPurchaseItemType, RQPurchaseItemTypeController;



{$R *.dfm}

procedure TfrmChangePlanPurchaseItemType.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempRQPurchaseItem: RQPurchaseItemControllerSoapPort;
begin
   TempRQPurchaseItem := HTTPRIORQPurchaseItem as RQPurchaseItemControllerSoapPort;
 if (ModalResult = mrOk) then
  if Application.MessageBox(PChar('¬и д≥йсно бажаЇте зм≥нити тип закуп≥вл≥ ?'),
                    PChar('¬нимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItem.changePurchaseItemType(RQPurchaseItemObjForChangeType );
  end;
end;


procedure TfrmChangePlanPurchaseItemType.FormShow(Sender: TObject);
begin
    DisableControls([edtrqplanpurchaseitemtype]);
end;

procedure TfrmChangePlanPurchaseItemType.spbedtrqplanpurchaseitemtypeClick(
  Sender: TObject);
var
   frmRQPurchaseItemTypeShow: TfrmRQPurchaseItemTypeShow;
begin


   frmRQPurchaseItemTypeShow := TfrmRQPurchaseItemTypeShow.Create(Application, fmNormal);
   try
     DisableActions([frmRQPurchaseItemTypeShow.actInsert,
     frmRQPurchaseItemTypeShow.actEdit,
     frmRQPurchaseItemTypeShow.actDelete]);

     with frmRQPurchaseItemTypeShow do
     begin
       if ShowModal = mrOk then
       begin
         try

           if RQPurchaseItemObjForChangeType.purchaseItemTypeRef = nil
             then RQPurchaseItemObjForChangeType.purchaseItemTypeRef := RQPurchaseItemTypeRef.Create;
           RQPurchaseItemObjForChangeType.purchaseItemTypeRef.code := StrToInt(GetReturnValue(sgRQPurchaseItemType, 0));
           edtrqplanpurchaseitemtype.Text := GetReturnValue(sgRQPurchaseItemType, 1) ;
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmRQPurchaseItemTypeShow.Free;
   end;
end;

end.
