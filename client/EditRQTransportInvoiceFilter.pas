
unit EditRQTransportInvoiceFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQTransportInvoiceController ;

type
  TfrmRQTransportInvoiceFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;

    lblNumberProject : TLabel;
    edtNumberProject: TEdit;

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;


  HTTPRIORQTransportInvoice: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQTransportInvoiceFilterEdit: TfrmRQTransportInvoiceFilterEdit;
  RQTransportInvoiceFilterObj: RQTransportInvoiceFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQTransportInvoiceController  ;
}
{$R *.dfm}



procedure TfrmRQTransportInvoiceFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQTransportInvoice: RQTransportInvoiceControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQTransportInvoiceFilterObj.numberDoc := edtNumberDoc.Text; 



     RQTransportInvoiceFilterObj.numberProject := edtNumberProject.Text; 



     if edtdateGen.checked then
     begin 
       if RQTransportInvoiceFilterObj.dateGen = nil then
          RQTransportInvoiceFilterObj.dateGen := TXSDate.Create;
       RQTransportInvoiceFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQTransportInvoiceFilterObj.dateGen := nil;


  end;
end;




end.