
unit EditENHighVoltCellSuppliesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHighVoltCellSuppliesController ;

type
  TfrmENHighVoltCellSuppliesFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENHighVoltCellSupplies: THTTPRIO;

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
  frmENHighVoltCellSuppliesFilterEdit: TfrmENHighVoltCellSuppliesFilterEdit;
  ENHighVoltCellSuppliesFilterObj: ENHighVoltCellSuppliesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENHighVoltCellSuppliesController  ;
}
{$R *.dfm}



procedure TfrmENHighVoltCellSuppliesFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENHighVoltCellSuppliesObj.name; 


  end;

}

end;



procedure TfrmENHighVoltCellSuppliesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHighVoltCellSupplies: ENHighVoltCellSuppliesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENHighVoltCellSuppliesFilterObj.name := edtName.Text; 




  end;
end;




end.