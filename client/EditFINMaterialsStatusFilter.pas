
unit EditFINMaterialsStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMaterialsStatusController ;

type
  TfrmFINMaterialsStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINMaterialsStatus: THTTPRIO;

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
  frmFINMaterialsStatusFilterEdit: TfrmFINMaterialsStatusFilterEdit;
  FINMaterialsStatusFilterObj: FINMaterialsStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMaterialsStatusController  ;
}
{$R *.dfm}



procedure TfrmFINMaterialsStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := FINMaterialsStatusObj.name; 


  end;

}

end;



procedure TfrmFINMaterialsStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINMaterialsStatusFilterObj.name := edtName.Text; 




  end;
end;




end.