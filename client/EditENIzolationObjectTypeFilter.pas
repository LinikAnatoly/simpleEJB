
unit EditENIzolationObjectTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIzolationObjectTypeController ;

type
  TfrmENIzolationObjectTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENIzolationObjectType: THTTPRIO;

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
  frmENIzolationObjectTypeFilterEdit: TfrmENIzolationObjectTypeFilterEdit;
  ENIzolationObjectTypeFilterObj: ENIzolationObjectTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIzolationObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENIzolationObjectTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENIzolationObjectTypeObj.name; 


  end;

}

end;



procedure TfrmENIzolationObjectTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIzolationObjectType: ENIzolationObjectTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENIzolationObjectTypeFilterObj.name := edtName.Text; 




  end;
end;




end.