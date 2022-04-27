
unit EditENDeliveryTimePlanFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryTimePlanController ;

type
  TfrmENDeliveryTimePlanFilterEdit = class(TDialogForm)

    lblDeliveryTimePlan : TLabel;
    edtDeliveryTimePlan: TEdit;
    lblDeliveryTimeFact : TLabel;
    edtDeliveryTimeFact: TEdit;
    lblDeliveryDistance : TLabel;
    edtDeliveryDistance: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;


  HTTPRIOENDeliveryTimePlan: THTTPRIO;

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
  frmENDeliveryTimePlanFilterEdit: TfrmENDeliveryTimePlanFilterEdit;
  ENDeliveryTimePlanFilterObj: ENDeliveryTimePlanFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDeliveryTimePlanController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryTimePlanFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDeliveryTimePlan
      ,edtDeliveryTimeFact
      ,edtDeliveryDistance
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENDeliveryTimePlanObj.deliveryTimePlan <> nil ) then
       edtDeliveryTimePlan.Text := ENDeliveryTimePlanObj.deliveryTimePlan.decimalString
    else
       edtDeliveryTimePlan.Text := ''; 



    if ( ENDeliveryTimePlanObj.deliveryTimeFact <> nil ) then
       edtDeliveryTimeFact.Text := ENDeliveryTimePlanObj.deliveryTimeFact.decimalString
    else
       edtDeliveryTimeFact.Text := ''; 



    if ( ENDeliveryTimePlanObj.deliveryDistance <> nil ) then
       edtDeliveryDistance.Text := ENDeliveryTimePlanObj.deliveryDistance.decimalString
    else
       edtDeliveryDistance.Text := ''; 



    edtCommentGen.Text := ENDeliveryTimePlanObj.commentGen; 


  end;

}

end;



procedure TfrmENDeliveryTimePlanFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENDeliveryTimePlanFilterObj.deliveryTimePlan = nil ) then
       ENDeliveryTimePlanFilterObj.deliveryTimePlan := TXSDecimal.Create;
     ENDeliveryTimePlanFilterObj.deliveryTimePlan.decimalString := edtDeliveryTimePlan.Text ;



     if (ENDeliveryTimePlanFilterObj.deliveryTimeFact = nil ) then
       ENDeliveryTimePlanFilterObj.deliveryTimeFact := TXSDecimal.Create;
     ENDeliveryTimePlanFilterObj.deliveryTimeFact.decimalString := edtDeliveryTimeFact.Text ;



     if (ENDeliveryTimePlanFilterObj.deliveryDistance = nil ) then
       ENDeliveryTimePlanFilterObj.deliveryDistance := TXSDecimal.Create;
     ENDeliveryTimePlanFilterObj.deliveryDistance.decimalString := edtDeliveryDistance.Text ;



     ENDeliveryTimePlanFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;




end.