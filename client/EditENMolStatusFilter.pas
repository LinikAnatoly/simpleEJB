
unit EditENMolStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolStatusController ;

type
  TfrmENMolStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENMolStatus: THTTPRIO;

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
  frmENMolStatusFilterEdit: TfrmENMolStatusFilterEdit;
  ENMolStatusFilterObj: ENMolStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolStatusController  ;
}
{$R *.dfm}



procedure TfrmENMolStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENMolStatusObj.name; 


  end;

}

end;



procedure TfrmENMolStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolStatus: ENMolStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMolStatusFilterObj.name := edtName.Text; 




  end;
end;




end.