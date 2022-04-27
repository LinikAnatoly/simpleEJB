
unit EditENDeliveryKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryKindController ;

type
  TfrmENDeliveryKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDeliveryKind: THTTPRIO;

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
  frmENDeliveryKindFilterEdit: TfrmENDeliveryKindFilterEdit;
  ENDeliveryKindFilterObj: ENDeliveryKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDeliveryKindController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryKindFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDeliveryKindObj.name; 


  end;

}

end;



procedure TfrmENDeliveryKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryKind: ENDeliveryKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDeliveryKindFilterObj.name := edtName.Text; 




  end;
end;




end.