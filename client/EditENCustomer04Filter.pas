
unit EditENCustomer04Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCustomer04Controller ;

type
  TfrmENCustomer04FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblAddress : TLabel;
    edtAddress: TEdit;

    lblPhone : TLabel;
    edtPhone: TEdit;



  HTTPRIOENCustomer04: THTTPRIO;

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
  frmENCustomer04FilterEdit: TfrmENCustomer04FilterEdit;
  ENCustomer04FilterObj: ENCustomer04Filter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCustomer04Controller  ;
}
{$R *.dfm}



procedure TfrmENCustomer04FilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENCustomer04Obj.name; 



    edtAddress.Text := ENCustomer04Obj.address; 



    edtPhone.Text := ENCustomer04Obj.phone; 


  end;

}

end;



procedure TfrmENCustomer04FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCustomer04: ENCustomer04ControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCustomer04FilterObj.name := edtName.Text; 



     ENCustomer04FilterObj.address := edtAddress.Text; 



     ENCustomer04FilterObj.phone := edtPhone.Text; 




  end;
end;




end.