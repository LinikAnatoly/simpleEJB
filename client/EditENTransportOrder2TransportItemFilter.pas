
unit EditENTransportOrder2TransportItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportOrder2TransportItemController ;

type
  TfrmENTransportOrder2TransportItemFilterEdit = class(TDialogForm)



  HTTPRIOENTransportOrder2TransportItem: THTTPRIO;

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
  frmENTransportOrder2TransportItemFilterEdit: TfrmENTransportOrder2TransportItemFilterEdit;
  ENTransportOrder2TransportItemFilterObj: ENTransportOrder2TransportItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportOrder2TransportItemController  ;
}
{$R *.dfm}



procedure TfrmENTransportOrder2TransportItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENTransportOrder2TransportItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportOrder2TransportItem: ENTransportOrder2TransportItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.