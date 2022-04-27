
unit EditENAirCrossingItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAirCrossingItemController ;

type
  TfrmENAirCrossingItemFilterEdit = class(TDialogForm)



  HTTPRIOENAirCrossingItem: THTTPRIO;

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
  frmENAirCrossingItemFilterEdit: TfrmENAirCrossingItemFilterEdit;
  ENAirCrossingItemFilterObj: ENAirCrossingItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAirCrossingItemController  ;
}
{$R *.dfm}



procedure TfrmENAirCrossingItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENAirCrossingItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.