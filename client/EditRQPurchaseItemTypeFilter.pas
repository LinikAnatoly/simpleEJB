
unit EditRQPurchaseItemTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItemTypeController ;

type
  TfrmRQPurchaseItemTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQPurchaseItemType: THTTPRIO;

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
  frmRQPurchaseItemTypeFilterEdit: TfrmRQPurchaseItemTypeFilterEdit;
  RQPurchaseItemTypeFilterObj: RQPurchaseItemTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItemTypeController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItemTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQPurchaseItemTypeObj.name; 


  end;

}

end;



procedure TfrmRQPurchaseItemTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItemType: RQPurchaseItemTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPurchaseItemTypeFilterObj.name := edtName.Text; 




  end;
end;




end.