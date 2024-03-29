
unit EditENLoadSwitchDriveTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLoadSwitchDriveTypeController ;

type
  TfrmENLoadSwitchDriveTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENLoadSwitchDriveType: THTTPRIO;

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
  frmENLoadSwitchDriveTypeFilterEdit: TfrmENLoadSwitchDriveTypeFilterEdit;
  ENLoadSwitchDriveTypeFilterObj: ENLoadSwitchDriveTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLoadSwitchDriveTypeController  ;
}
{$R *.dfm}



procedure TfrmENLoadSwitchDriveTypeFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENLoadSwitchDriveTypeObj.name; 


  end;

}

end;



procedure TfrmENLoadSwitchDriveTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLoadSwitchDriveType: ENLoadSwitchDriveTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLoadSwitchDriveTypeFilterObj.name := edtName.Text; 




  end;
end;




end.