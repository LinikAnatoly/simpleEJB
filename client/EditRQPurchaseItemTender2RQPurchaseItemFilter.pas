
unit EditRQPurchaseItemTender2RQPurchaseItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItemTender2RQPurchaseItemController ;

type
  TfrmRQPurchaseItemTender2RQPurchaseItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;



  HTTPRIORQPurchaseItemTender2RQPurchaseItem: THTTPRIO;

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
  frmRQPurchaseItemTender2RQPurchaseItemFilterEdit: TfrmRQPurchaseItemTender2RQPurchaseItemFilterEdit;
  RQPurchaseItemTender2RQPurchaseItemFilterObj: RQPurchaseItemTender2RQPurchaseItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItemTender2RQPurchaseItemController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItemTender2RQPurchaseItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQPurchaseItemTender2RQPurchaseItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPurchaseItemTender2RQPurchaseItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 


  end;

}

end;



procedure TfrmRQPurchaseItemTender2RQPurchaseItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQPurchaseItemTender2RQPurchaseItemFilterObj.countGen = nil ) then
       RQPurchaseItemTender2RQPurchaseItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQPurchaseItemTender2RQPurchaseItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       RQPurchaseItemTender2RQPurchaseItemFilterObj.countGen := nil;





  end;
end;




end.