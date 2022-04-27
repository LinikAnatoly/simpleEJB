
unit EditENTransportRoute2RQFKOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportRoute2RQFKOrderController ;

type
  TfrmENTransportRoute2RQFKOrderFilterEdit = class(TDialogForm)



  HTTPRIOENTransportRoute2RQFKOrder: THTTPRIO;

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
  frmENTransportRoute2RQFKOrderFilterEdit: TfrmENTransportRoute2RQFKOrderFilterEdit;
  ENTransportRoute2RQFKOrderFilterObj: ENTransportRoute2RQFKOrderFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransportRoute2RQFKOrderController  ;
}
{$R *.dfm}



procedure TfrmENTransportRoute2RQFKOrderFilterEdit.FormShow(Sender: TObject);

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



procedure TfrmENTransportRoute2RQFKOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.