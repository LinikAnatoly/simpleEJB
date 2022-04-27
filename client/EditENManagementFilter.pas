
unit EditENManagementFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENManagementController ;

type
  TfrmENManagementFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENManagement: THTTPRIO;

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
  frmENManagementFilterEdit: TfrmENManagementFilterEdit;
  ENManagementFilterObj: ENManagementFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENManagementController  ;
}
{$R *.dfm}



procedure TfrmENManagementFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENManagementObj.name; 


  end;

}

end;



procedure TfrmENManagementFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENManagement: ENManagementControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENManagementFilterObj.name := edtName.Text; 




  end;
end;




end.