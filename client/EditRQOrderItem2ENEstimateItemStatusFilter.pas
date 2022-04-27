
unit EditRQOrderItem2ENEstimateItemStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItem2ENEstimateItemStatusController ;

type
  TfrmRQOrderItem2ENEstimateItemStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderItem2ENEstimateItemStatus: THTTPRIO;

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
  frmRQOrderItem2ENEstimateItemStatusFilterEdit: TfrmRQOrderItem2ENEstimateItemStatusFilterEdit;
  RQOrderItem2ENEstimateItemStatusFilterObj: RQOrderItem2ENEstimateItemStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderItem2ENEstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQOrderItem2ENEstimateItemStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQOrderItem2ENEstimateItemStatusObj.name; 


  end;

}

end;



procedure TfrmRQOrderItem2ENEstimateItemStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItem2ENEstimateItemStatus: RQOrderItem2ENEstimateItemStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrderItem2ENEstimateItemStatusFilterObj.name := edtName.Text; 




  end;
end;




end.