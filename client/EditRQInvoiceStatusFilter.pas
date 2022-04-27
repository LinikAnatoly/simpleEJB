
unit EditRQInvoiceStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceStatusController ;

type
  TfrmRQInvoiceStatusFilterEdit = class(TDialogForm)

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
  frmRQInvoiceStatusFilterEdit: TfrmRQInvoiceStatusFilterEdit;
  RQInvoiceStatusFilterObj: RQInvoiceStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQInvoiceStatusController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceStatusFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQInvoiceStatusObj.name; 


  end;

}

end;



procedure TfrmRQInvoiceStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceStatus: RQInvoiceStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQInvoiceStatusFilterObj.name := edtName.Text; 




  end;
end;




end.