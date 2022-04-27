
unit EditENServicesContractStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesContractStatusController ;

type
  TfrmENServicesContractStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENServicesContractStatus: THTTPRIO;

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
  frmENServicesContractStatusFilterEdit: TfrmENServicesContractStatusFilterEdit;
  ENServicesContractStatusFilterObj: ENServicesContractStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServicesContractStatusController  ;
}
{$R *.dfm}



procedure TfrmENServicesContractStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENServicesContractStatusObj.name; 


  end;

}

end;



procedure TfrmENServicesContractStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENServicesContractStatusFilterObj.name := edtName.Text; 




  end;
end;




end.