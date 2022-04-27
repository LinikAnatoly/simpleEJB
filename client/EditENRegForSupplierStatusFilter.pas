
unit EditENRegForSupplierStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierStatusController ;

type
  TfrmENRegForSupplierStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENRegForSupplierStatus: THTTPRIO;

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
  frmENRegForSupplierStatusFilterEdit: TfrmENRegForSupplierStatusFilterEdit;
  ENRegForSupplierStatusFilterObj: ENRegForSupplierStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierStatusController  ;
}
{$R *.dfm}



procedure TfrmENRegForSupplierStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENRegForSupplierStatusObj.name; 


  end;

}

end;



procedure TfrmENRegForSupplierStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRegForSupplierStatusFilterObj.name := edtName.Text; 




  end;
end;




end.