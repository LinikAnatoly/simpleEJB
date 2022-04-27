
unit EditENSITEquipStateFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITEquipStateController ;

type
  TfrmENSITEquipStateFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSITEquipState: THTTPRIO;

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
  frmENSITEquipStateFilterEdit: TfrmENSITEquipStateFilterEdit;
  ENSITEquipStateFilterObj: ENSITEquipStateFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSITEquipStateController  ;
}
{$R *.dfm}



procedure TfrmENSITEquipStateFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSITEquipStateObj.name; 


  end;

}

end;



procedure TfrmENSITEquipStateFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITEquipState: ENSITEquipStateControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSITEquipStateFilterObj.name := edtName.Text; 




  end;
end;




end.