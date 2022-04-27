
unit EditENFuelInvResultTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInvResultTypeController ;

type
  TfrmENFuelInvResultTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENFuelInvResultType: THTTPRIO;

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
  frmENFuelInvResultTypeFilterEdit: TfrmENFuelInvResultTypeFilterEdit;
  ENFuelInvResultTypeFilterObj: ENFuelInvResultTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInvResultTypeController  ;
}
{$R *.dfm}



procedure TfrmENFuelInvResultTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENFuelInvResultTypeObj.name; 


  end;

}

end;



procedure TfrmENFuelInvResultTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInvResultType: ENFuelInvResultTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFuelInvResultTypeFilterObj.name := edtName.Text; 




  end;
end;




end.