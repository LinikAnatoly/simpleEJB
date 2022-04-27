
unit EditRQBillStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBillStatusController ;

type
  TfrmRQBillStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQBillStatus: THTTPRIO;

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
  frmRQBillStatusFilterEdit: TfrmRQBillStatusFilterEdit;
  RQBillStatusFilterObj: RQBillStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQBillStatusController  ;
}
{$R *.dfm}



procedure TfrmRQBillStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQBillStatusObj.name; 


  end;

}

end;



procedure TfrmRQBillStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBillStatus: RQBillStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQBillStatusFilterObj.name := edtName.Text; 




  end;
end;




end.