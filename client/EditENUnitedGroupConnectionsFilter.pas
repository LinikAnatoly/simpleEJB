
unit EditENUnitedGroupConnectionsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENUnitedGroupConnectionsController ;

type
  TfrmENUnitedGroupConnectionsFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblDescription : TLabel;
    edtDescription: TEdit;



  HTTPRIOENUnitedGroupConnections: THTTPRIO;

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
  frmENUnitedGroupConnectionsFilterEdit: TfrmENUnitedGroupConnectionsFilterEdit;
  ENUnitedGroupConnectionsFilterObj: ENUnitedGroupConnectionsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENUnitedGroupConnectionsController  ;
}
{$R *.dfm}



procedure TfrmENUnitedGroupConnectionsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENUnitedGroupConnectionsObj.name; 



    edtDescription.Text := ENUnitedGroupConnectionsObj.description; 


  end;

}

end;



procedure TfrmENUnitedGroupConnectionsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENUnitedGroupConnections: ENUnitedGroupConnectionsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENUnitedGroupConnectionsFilterObj.name := edtName.Text; 



     ENUnitedGroupConnectionsFilterObj.description := edtDescription.Text; 




  end;
end;




end.