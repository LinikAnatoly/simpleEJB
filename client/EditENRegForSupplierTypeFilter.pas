
unit EditENRegForSupplierTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierTypeController ;

type
  TfrmENRegForSupplierTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblDescription : TLabel;
    edtDescription: TEdit;



  HTTPRIOENRegForSupplierType: THTTPRIO;

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
  frmENRegForSupplierTypeFilterEdit: TfrmENRegForSupplierTypeFilterEdit;
  ENRegForSupplierTypeFilterObj: ENRegForSupplierTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierTypeController  ;
}
{$R *.dfm}



procedure TfrmENRegForSupplierTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENRegForSupplierTypeObj.name; 



    edtDescription.Text := ENRegForSupplierTypeObj.description; 


  end;

}

end;



procedure TfrmENRegForSupplierTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENRegForSupplierTypeFilterObj.name := edtName.Text; 



     ENRegForSupplierTypeFilterObj.description := edtDescription.Text; 




  end;
end;




end.