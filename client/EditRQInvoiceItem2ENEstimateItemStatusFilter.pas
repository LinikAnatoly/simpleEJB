
unit EditRQInvoiceItem2ENEstimateItemStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemStatusController ;

type
  TfrmRQInvoiceItem2ENEstimateItemStatusFilterEdit = class(TDialogForm)

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
  frmRQInvoiceItem2ENEstimateItemStatusFilterEdit: TfrmRQInvoiceItem2ENEstimateItemStatusFilterEdit;
  RQInvoiceItem2ENEstimateItemStatusFilterObj: RQInvoiceItem2ENEstimateItemStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQInvoiceItem2ENEstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQInvoiceItem2ENEstimateItemStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQInvoiceItem2ENEstimateItemStatusObj.name; 


  end;

}

end;



procedure TfrmRQInvoiceItem2ENEstimateItemStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQInvoiceItem2ENEstimateItemStatus: RQInvoiceItem2ENEstimateItemStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQInvoiceItem2ENEstimateItemStatusFilterObj.name := edtName.Text; 




  end;
end;




end.