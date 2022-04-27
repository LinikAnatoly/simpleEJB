
unit EditENEquipmentStateFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEquipmentStateController ;

type
  TfrmENEquipmentStateFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENEquipmentState: THTTPRIO;

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
  frmENEquipmentStateFilterEdit: TfrmENEquipmentStateFilterEdit;
  ENEquipmentStateFilterObj: ENEquipmentStateFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEquipmentStateController  ;
}
{$R *.dfm}



procedure TfrmENEquipmentStateFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENEquipmentStateObj.name; 


  end;

}

end;



procedure TfrmENEquipmentStateFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEquipmentState: ENEquipmentStateControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENEquipmentStateFilterObj.name := edtName.Text; 




  end;
end;




end.