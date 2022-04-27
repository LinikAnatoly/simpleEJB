
unit EditENDisconnectorDriveTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDisconnectorDriveTypeController ;

type
  TfrmENDisconnectorDriveTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENDisconnectorDriveType: THTTPRIO;

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
  frmENDisconnectorDriveTypeFilterEdit: TfrmENDisconnectorDriveTypeFilterEdit;
  ENDisconnectorDriveTypeFilterObj: ENDisconnectorDriveTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDisconnectorDriveTypeController  ;
}
{$R *.dfm}



procedure TfrmENDisconnectorDriveTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDisconnectorDriveTypeObj.name; 


  end;

}

end;



procedure TfrmENDisconnectorDriveTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDisconnectorDriveType: ENDisconnectorDriveTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDisconnectorDriveTypeFilterObj.name := edtName.Text; 




  end;
end;




end.