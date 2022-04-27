
unit EditENDeliveryTimePlan;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryTimePlanController ;

type
  TfrmENDeliveryTimePlanEdit = class(TDialogForm)

    lblDeliveryTimePlan : TLabel;
    edtDeliveryTimePlan: TEdit;
    lblDeliveryTimeFact : TLabel;
    edtDeliveryTimeFact: TEdit;
    lblDeliveryDistance : TLabel;
    edtDeliveryDistance: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;


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
  frmENDeliveryTimePlanEdit: TfrmENDeliveryTimePlanEdit;
  ENDeliveryTimePlanObj: ENDeliveryTimePlan;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDeliveryTimePlanController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryTimePlanEdit.FormShow(Sender: TObject);

begin
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
    MakeMultiline(edtCommentGen.Lines, ENDeliveryTimePlanObj.commentGen);


  end;
end;



procedure TfrmENDeliveryTimePlanEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryTimePlan: ENDeliveryTimePlanControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDeliveryTimePlan
      ,edtDeliveryTimeFact
      ,edtDeliveryDistance
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDeliveryTimePlan := HTTPRIOENDeliveryTimePlan as ENDeliveryTimePlanControllerSoapPort;


     if (ENDeliveryTimePlanObj.deliveryTimePlan = nil ) then
       ENDeliveryTimePlanObj.deliveryTimePlan := TXSDecimal.Create;
     if edtDeliveryTimePlan.Text <> '' then
       ENDeliveryTimePlanObj.deliveryTimePlan.decimalString := edtDeliveryTimePlan.Text 
     else
       ENDeliveryTimePlanObj.deliveryTimePlan := nil;

     if (ENDeliveryTimePlanObj.deliveryTimeFact = nil ) then
       ENDeliveryTimePlanObj.deliveryTimeFact := TXSDecimal.Create;
     if edtDeliveryTimeFact.Text <> '' then
       ENDeliveryTimePlanObj.deliveryTimeFact.decimalString := edtDeliveryTimeFact.Text 
     else
       ENDeliveryTimePlanObj.deliveryTimeFact := nil;

     if (ENDeliveryTimePlanObj.deliveryDistance = nil ) then
       ENDeliveryTimePlanObj.deliveryDistance := TXSDecimal.Create;
     if edtDeliveryDistance.Text <> '' then
       ENDeliveryTimePlanObj.deliveryDistance.decimalString := edtDeliveryDistance.Text 
     else
       ENDeliveryTimePlanObj.deliveryDistance := nil;

     ENDeliveryTimePlanObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENDeliveryTimePlanObj.code:=low(Integer);
      TempENDeliveryTimePlan.add(ENDeliveryTimePlanObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDeliveryTimePlan.save(ENDeliveryTimePlanObj);
    end;
  end;
end;


end.