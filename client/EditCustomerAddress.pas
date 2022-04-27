
unit EditCustomerAddress;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObjectController ;

type
  TfrmCustomerAddressEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    lblCustomerMailingAddress: TLabel;
    edtCustomerMailingAddress: TMemo;
    HTTPRIOENServicesObject: THTTPRIO;

  procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmCustomerAddressEdit: TfrmCustomerAddressEdit;
  ENServicesObjectObj: ENServicesObject;

implementation


{uses
    EnergyproController, EnergyproController2, CustomerAddressController  ;
}
{$R *.dfm}



procedure TfrmCustomerAddressEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
 if (ModalResult = mrOk) then
  if not NoBlankValues([
      edtCustomerMailingAddress
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

    ENServicesObjectObj.customerMailingAddress := edtCustomerMailingAddress.Text;
    TempENServicesObject.changeAddress(ENServicesObjectObj);
  end;


end;

procedure TfrmCustomerAddressEdit.FormShow(Sender: TObject);

begin

MakeMultiline(edtCustomerMailingAddress.Lines, ENServicesObjectObj.customerMailingAddress);
end;



end.
