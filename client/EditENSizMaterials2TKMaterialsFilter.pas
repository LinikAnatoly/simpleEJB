
unit EditENSizMaterials2TKMaterialsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSizMaterials2TKMaterialsController ;

type
  TfrmENSizMaterials2TKMaterialsFilterEdit = class(TDialogForm)



  HTTPRIOENSizMaterials2TKMaterials: THTTPRIO;

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
  frmENSizMaterials2TKMaterialsFilterEdit: TfrmENSizMaterials2TKMaterialsFilterEdit;
  ENSizMaterials2TKMaterialsFilterObj: ENSizMaterials2TKMaterialsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSizMaterials2TKMaterialsController  ;
}
{$R *.dfm}



procedure TfrmENSizMaterials2TKMaterialsFilterEdit.FormShow(Sender: TObject);

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



procedure TfrmENSizMaterials2TKMaterialsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.