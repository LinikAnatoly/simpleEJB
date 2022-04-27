
unit EditRQInvoiceItem2ENEstimateItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemController ;

type
  TfrmRQInvoiceItem2ENEstimateItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;

  lblENEstimateItemEstimateItemName : TLabel;
  edtENEstimateItemEstimateItemName : TEdit;
  spbENEstimateItemEstimateItem : TSpeedButton;
  

  HTTPRIORQInvoiceItem2ENEstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENEstimateItemEstimateItemClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQInvoiceItem2ENEstimateItemEdit: TfrmRQInvoiceItem2ENEstimateItemEdit;
  RQInvoiceItem2ENEstimateItemObj: RQInvoiceItem2ENEstimateItem;

implementation

uses
  ShowENEstimateItem
  ,ENEstimateItemController
;

{uses  
    EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceItem2ENEstimateItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENEstimateItemEstimateItemName
      ,spbENEstimateItemEstimateItem
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQInvoiceItem2ENEstimateItemObj.code);
    if ( RQInvoiceItem2ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQInvoiceItem2ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 

    //edtENEstimateItemEstimateItemName.Text := RQInvoiceItem2ENEstimateItemObj.estimateItem.name;

  end;
end;



procedure TfrmRQInvoiceItem2ENEstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQInvoiceItem2ENEstimateItem := HTTPRIORQInvoiceItem2ENEstimateItem as RQInvoiceItem2ENEstimateItemControllerSoapPort;


     if (RQInvoiceItem2ENEstimateItemObj.countGen = nil ) then
       RQInvoiceItem2ENEstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQInvoiceItem2ENEstimateItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQInvoiceItem2ENEstimateItemObj.countGen := nil;

    if DialogState = dsInsert then
    begin
      RQInvoiceItem2ENEstimateItemObj.code:=low(Integer);
      TempRQInvoiceItem2ENEstimateItem.add(RQInvoiceItem2ENEstimateItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQInvoiceItem2ENEstimateItem.save(RQInvoiceItem2ENEstimateItemObj);
    end;
  end;
end;


procedure TfrmRQInvoiceItem2ENEstimateItemEdit.spbENEstimateItemEstimateItemClick(Sender : TObject);
var 
   frmENEstimateItemShow: TfrmENEstimateItemShow;
begin
   frmENEstimateItemShow:=TfrmENEstimateItemShow.Create(Application,fmNormal);
   try
      with frmENEstimateItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQInvoiceItem2ENEstimateItemObj.estimateItem = nil then RQInvoiceItem2ENEstimateItemObj.estimateItem := ENEstimateItem.Create();
               RQInvoiceItem2ENEstimateItemObj.estimateItem.code := StrToInt(GetReturnValue(sgENEstimateItem,0));
               edtENEstimateItemEstimateItemName.Text:=GetReturnValue(sgENEstimateItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENEstimateItemShow.Free;
   end;
end;



end.