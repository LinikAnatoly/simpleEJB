
unit EditENDisconnectInitiatorFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectInitiatorController ;

type
  TfrmENDisconnectInitiatorFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENDisconnectInitiator: THTTPRIO;

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
  frmENDisconnectInitiatorFilterEdit: TfrmENDisconnectInitiatorFilterEdit;
  ENDisconnectInitiatorFilterObj: ENDisconnectInitiatorFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDisconnectInitiatorController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectInitiatorFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDisconnectInitiatorObj.name; 


  end;

}

end;



procedure TfrmENDisconnectInitiatorFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnectInitiator: ENDisconnectInitiatorControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDisconnectInitiatorFilterObj.name := edtName.Text; 




  end;
end;




end.