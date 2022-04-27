
unit EditRQFKOrderStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderStatusController ;

type
  TfrmRQFKOrderStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQFKOrderStatus: THTTPRIO;

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
  frmRQFKOrderStatusFilterEdit: TfrmRQFKOrderStatusFilterEdit;
  RQFKOrderStatusFilterObj: RQFKOrderStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQFKOrderStatusObj.name; 


  end;

}

end;



procedure TfrmRQFKOrderStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderStatus: RQFKOrderStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKOrderStatusFilterObj.name := edtName.Text; 




  end;
end;




end.