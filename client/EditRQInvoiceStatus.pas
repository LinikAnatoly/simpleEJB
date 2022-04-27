
unit EditRQInvoiceStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceStatusController ;

type
  TfrmRQInvoiceStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQInvoiceStatus: THTTPRIO;

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
  frmRQInvoiceStatusEdit: TfrmRQInvoiceStatusEdit;
  RQInvoiceStatusObj: RQInvoiceStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQInvoiceStatusController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQInvoiceStatusObj.code);
    edtName.Text := RQInvoiceStatusObj.name; 


  end;
end;



procedure TfrmRQInvoiceStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
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
    TempRQInvoiceStatus := HTTPRIORQInvoiceStatus as RQInvoiceStatusControllerSoapPort;


     RQInvoiceStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQInvoiceStatusObj.code:=low(Integer);
      TempRQInvoiceStatus.add(RQInvoiceStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQInvoiceStatus.save(RQInvoiceStatusObj);
    end;
  end;
end;


end.