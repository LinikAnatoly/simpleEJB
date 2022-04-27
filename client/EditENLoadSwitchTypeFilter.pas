
unit EditENLoadSwitchTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLoadSwitchTypeController ;

type
  TfrmENLoadSwitchTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENLoadSwitchType: THTTPRIO;

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
  frmENLoadSwitchTypeFilterEdit: TfrmENLoadSwitchTypeFilterEdit;
  ENLoadSwitchTypeFilterObj: ENLoadSwitchTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLoadSwitchTypeController  ;
}
{$R *.dfm}



procedure TfrmENLoadSwitchTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENLoadSwitchTypeObj.name; 


  end;

}

end;



procedure TfrmENLoadSwitchTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLoadSwitchType: ENLoadSwitchTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLoadSwitchTypeFilterObj.name := edtName.Text; 




  end;
end;




end.