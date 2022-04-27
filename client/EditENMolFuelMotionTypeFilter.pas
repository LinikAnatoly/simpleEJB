
unit EditENMolFuelMotionTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolFuelMotionTypeController ;

type
  TfrmENMolFuelMotionTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENMolFuelMotionType: THTTPRIO;

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
  frmENMolFuelMotionTypeFilterEdit: TfrmENMolFuelMotionTypeFilterEdit;
  ENMolFuelMotionTypeFilterObj: ENMolFuelMotionTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolFuelMotionTypeController  ;
}
{$R *.dfm}



procedure TfrmENMolFuelMotionTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENMolFuelMotionTypeObj.name; 


  end;

}

end;



procedure TfrmENMolFuelMotionTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolFuelMotionType: ENMolFuelMotionTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMolFuelMotionTypeFilterObj.name := edtName.Text; 




  end;
end;




end.