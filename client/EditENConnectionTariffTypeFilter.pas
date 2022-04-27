
unit EditENConnectionTariffTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionTariffTypeController ;

type
  TfrmENConnectionTariffTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENConnectionTariffType: THTTPRIO;

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
  frmENConnectionTariffTypeFilterEdit: TfrmENConnectionTariffTypeFilterEdit;
  ENConnectionTariffTypeFilterObj: ENConnectionTariffTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionTariffTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionTariffTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENConnectionTariffTypeObj.name; 


  end;

}

end;



procedure TfrmENConnectionTariffTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionTariffType: ENConnectionTariffTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionTariffTypeFilterObj.name := edtName.Text; 




  end;
end;




end.