
unit EditENMeasurDeviceTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMeasurDeviceTypeController ;

type
  TfrmENMeasurDeviceTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENMeasurDeviceType: THTTPRIO;

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
  frmENMeasurDeviceTypeFilterEdit: TfrmENMeasurDeviceTypeFilterEdit;
  ENMeasurDeviceTypeFilterObj: ENMeasurDeviceTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMeasurDeviceTypeController  ;
}
{$R *.dfm}



procedure TfrmENMeasurDeviceTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENMeasurDeviceTypeObj.name; 


  end;

}

end;



procedure TfrmENMeasurDeviceTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMeasurDeviceType: ENMeasurDeviceTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMeasurDeviceTypeFilterObj.name := edtName.Text; 




  end;
end;




end.