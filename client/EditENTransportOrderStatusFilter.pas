
unit EditENTransportOrderStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportOrderStatusController ;

type
  TfrmENTransportOrderStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TMemo;



  HTTPRIOENTransportOrderStatus: THTTPRIO;

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
  frmENTransportOrderStatusFilterEdit: TfrmENTransportOrderStatusFilterEdit;
  ENTransportOrderStatusFilterObj: ENTransportOrderStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmENTransportOrderStatusFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtName.Lines, ENTransportOrderStatusObj.name);


  end;

}

end;



procedure TfrmENTransportOrderStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportOrderStatus: ENTransportOrderStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTransportOrderStatusFilterObj.name := edtName.Text; 




  end;
end;




end.