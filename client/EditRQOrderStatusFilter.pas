
unit EditRQOrderStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderStatusController ;

type
  TfrmRQOrderStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderStatus: THTTPRIO;

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
  frmRQOrderStatusFilterEdit: TfrmRQOrderStatusFilterEdit;
  RQOrderStatusFilterObj: RQOrderStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderStatusController  ;
}
{$R *.dfm}



procedure TfrmRQOrderStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQOrderStatusObj.name; 


  end;

}

end;



procedure TfrmRQOrderStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderStatus: RQOrderStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrderStatusFilterObj.name := edtName.Text; 




  end;
end;




end.