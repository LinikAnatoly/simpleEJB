
unit EditENMetrologyDeviceTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyDeviceTypeController ;

type
  TfrmENMetrologyDeviceTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMetrologyDeviceType: THTTPRIO;

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
  frmENMetrologyDeviceTypeFilterEdit: TfrmENMetrologyDeviceTypeFilterEdit;
  ENMetrologyDeviceTypeFilterObj: ENMetrologyDeviceTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMetrologyDeviceTypeController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyDeviceTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENMetrologyDeviceTypeObj.name; 


  end;

}

end;



procedure TfrmENMetrologyDeviceTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyDeviceType: ENMetrologyDeviceTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMetrologyDeviceTypeFilterObj.name := edtName.Text; 




  end;
end;




end.