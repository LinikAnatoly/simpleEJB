
unit EditENWiresItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresItemController ;

type
  TfrmENWiresItemFilterEdit = class(TDialogForm)



  HTTPRIOENWiresItem: THTTPRIO;

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
  frmENWiresItemFilterEdit: TfrmENWiresItemFilterEdit;
  ENWiresItemFilterObj: ENWiresItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWiresItemController  ;
}
{$R *.dfm}



procedure TfrmENWiresItemFilterEdit.FormShow(Sender: TObject);

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



procedure TfrmENWiresItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresItem: ENWiresItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.