
unit EditENDamageRecoveryStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDamageRecoveryStatusController ;

type
  TfrmENDamageRecoveryStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENDamageRecoveryStatus: THTTPRIO;

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
  frmENDamageRecoveryStatusFilterEdit: TfrmENDamageRecoveryStatusFilterEdit;
  ENDamageRecoveryStatusFilterObj: ENDamageRecoveryStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDamageRecoveryStatusController  ;
}
{$R *.dfm}



procedure TfrmENDamageRecoveryStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENDamageRecoveryStatusObj.name; 


  end;

}

end;



procedure TfrmENDamageRecoveryStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENDamageRecoveryStatus: ENDamageRecoveryStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDamageRecoveryStatusFilterObj.name := edtName.Text; 




  end;
end;




end.