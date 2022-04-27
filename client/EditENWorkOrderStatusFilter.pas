
unit EditENWorkOrderStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWorkOrderStatusController ;

type
  TfrmENWorkOrderStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENWorkOrderStatus: THTTPRIO;

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
  frmENWorkOrderStatusFilterEdit: TfrmENWorkOrderStatusFilterEdit;
  ENWorkOrderStatusFilterObj: ENWorkOrderStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWorkOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmENWorkOrderStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENWorkOrderStatusObj.name; 


  end;

}

end;



procedure TfrmENWorkOrderStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWorkOrderStatus: ENWorkOrderStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENWorkOrderStatusFilterObj.name := edtName.Text; 




  end;
end;




end.