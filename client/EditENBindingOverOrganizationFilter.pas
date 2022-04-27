
unit EditENBindingOverOrganizationFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBindingOverOrganizationController ;

type
  TfrmENBindingOverOrganizationFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENBindingOverOrganization: THTTPRIO;

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
  frmENBindingOverOrganizationFilterEdit: TfrmENBindingOverOrganizationFilterEdit;
  ENBindingOverOrganizationFilterObj: ENBindingOverOrganizationFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBindingOverOrganizationController  ;
}
{$R *.dfm}



procedure TfrmENBindingOverOrganizationFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENBindingOverOrganizationObj.name; 


  end;

}

end;



procedure TfrmENBindingOverOrganizationFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBindingOverOrganization: ENBindingOverOrganizationControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBindingOverOrganizationFilterObj.name := edtName.Text; 




  end;
end;




end.