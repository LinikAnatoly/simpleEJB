
unit EditRQInvoiceItem2ENEstimateItemStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemStatusController ;

type
  TfrmRQInvoiceItem2ENEstimateItemStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQInvoiceItem2ENEstimateItemStatus: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQInvoiceItem2ENEstimateItemStatusEdit: TfrmRQInvoiceItem2ENEstimateItemStatusEdit;
  RQInvoiceItem2ENEstimateItemStatusObj: RQInvoiceItem2ENEstimateItemStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceItem2ENEstimateItemStatusEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQInvoiceItem2ENEstimateItemStatusObj.code);
    edtName.Text := RQInvoiceItem2ENEstimateItemStatusObj.name; 


  end;
end;



procedure TfrmRQInvoiceItem2ENEstimateItemStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQInvoiceItem2ENEstimateItemStatus := HTTPRIORQInvoiceItem2ENEstimateItemStatus as RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;


     RQInvoiceItem2ENEstimateItemStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQInvoiceItem2ENEstimateItemStatusObj.code:=low(Integer);
      TempRQInvoiceItem2ENEstimateItemStatus.add(RQInvoiceItem2ENEstimateItemStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQInvoiceItem2ENEstimateItemStatus.save(RQInvoiceItem2ENEstimateItemStatusObj);
    end;
  end;
end;


end.