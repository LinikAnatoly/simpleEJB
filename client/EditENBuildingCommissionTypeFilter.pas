
unit EditENBuildingCommissionTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuildingCommissionTypeController ;

type
  TfrmENBuildingCommissionTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENBuildingCommissionType: THTTPRIO;

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
  frmENBuildingCommissionTypeFilterEdit: TfrmENBuildingCommissionTypeFilterEdit;
  ENBuildingCommissionTypeFilterObj: ENBuildingCommissionTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBuildingCommissionTypeController  ;
}
{$R *.dfm}



procedure TfrmENBuildingCommissionTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENBuildingCommissionTypeObj.name; 


  end;

}

end;



procedure TfrmENBuildingCommissionTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBuildingCommissionTypeFilterObj.name := edtName.Text; 




  end;
end;




end.