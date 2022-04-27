
unit EditRQFKOrderItem2EstimateItemStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItem2EstimateItemStatusController ;

type
  TfrmRQFKOrderItem2EstimateItemStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQFKOrderItem2EstimateItemStatus: THTTPRIO;

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
  frmRQFKOrderItem2EstimateItemStatusFilterEdit: TfrmRQFKOrderItem2EstimateItemStatusFilterEdit;
  RQFKOrderItem2EstimateItemStatusFilterObj: RQFKOrderItem2EstimateItemStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKOrderItem2EstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderItem2EstimateItemStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQFKOrderItem2EstimateItemStatusObj.name; 


  end;

}

end;



procedure TfrmRQFKOrderItem2EstimateItemStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQFKOrderItem2EstimateItemStatusFilterObj.name := edtName.Text; 




  end;
end;




end.