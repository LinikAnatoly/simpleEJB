
unit EditENDeliveryTime;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryTimeController ;

type
  TfrmENDeliveryTimeEdit = class(TDialogForm)

    lblDeliveryTimePlan : TLabel;
    edtDeliveryTimePlan: TEdit;
    lblDeliveryTimeFact : TLabel;
    edtDeliveryTimeFact: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENDeliveryKindDeliveryKindName : TLabel;
  edtENDeliveryKindDeliveryKindName : TEdit;
  spbENDeliveryKindDeliveryKind : TSpeedButton;
  

  HTTPRIOENDeliveryTime: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    cbDeliveryKind: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDeliveryKindDeliveryKindClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDeliveryTimeEdit: TfrmENDeliveryTimeEdit;
  ENDeliveryTimeObj: ENDeliveryTime;

implementation

uses
  ShowENDeliveryKind
  ,ENDeliveryKindController
;

{uses  
    EnergyproController, EnergyproController2, ENDeliveryTimeController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryTimeEdit.FormShow(Sender: TObject);

begin

  SetFloatStyle([edtDeliveryTimeFact ]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDeliveryTimePlan
      ,edtDeliveryTimeFact
     ]);
   end;

  DisableControls([edtDeliveryTimePlan, cbDeliveryKind]);

  if (DialogState = dsInsert) then
  begin
     edtDeliveryTimePlan.Text := '0';
     cbDeliveryKind.ItemIndex := 1;
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENDeliveryTimeObj.deliveryTimePlan <> nil ) then
       edtDeliveryTimePlan.Text := ENDeliveryTimeObj.deliveryTimePlan.decimalString
    else
       edtDeliveryTimePlan.Text := ''; 
    if ( ENDeliveryTimeObj.deliveryTimeFact <> nil ) then
       edtDeliveryTimeFact.Text := ENDeliveryTimeObj.deliveryTimeFact.decimalString
    else
       edtDeliveryTimeFact.Text := '';

    if ENDeliveryTimeObj.deliveryKind <> nil then
       cbDeliveryKind.ItemIndex := ENDeliveryTimeObj.deliveryKind.code - 1
    else
       cbDeliveryKind.ItemIndex := 0;

    MakeMultiline(edtCommentGen.Lines, ENDeliveryTimeObj.commentGen);

    edtENDeliveryKindDeliveryKindName.Text := ENDeliveryTimeObj.deliveryKind.name;

  end;
end;



procedure TfrmENDeliveryTimeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDeliveryTimePlan
      ,edtDeliveryTimeFact
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;


     if (ENDeliveryTimeObj.deliveryTimePlan = nil ) then
       ENDeliveryTimeObj.deliveryTimePlan := TXSDecimal.Create;
     if edtDeliveryTimePlan.Text <> '' then
       ENDeliveryTimeObj.deliveryTimePlan.decimalString := edtDeliveryTimePlan.Text 
     else
       ENDeliveryTimeObj.deliveryTimePlan := nil;

     if (ENDeliveryTimeObj.deliveryTimeFact = nil ) then
       ENDeliveryTimeObj.deliveryTimeFact := TXSDecimal.Create;
     if edtDeliveryTimeFact.Text <> '' then
       ENDeliveryTimeObj.deliveryTimeFact.decimalString := edtDeliveryTimeFact.Text 
     else
       ENDeliveryTimeObj.deliveryTimeFact := nil;

     ENDeliveryTimeObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENDeliveryTimeObj.code:=low(Integer);
      TempENDeliveryTime.add(ENDeliveryTimeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDeliveryTime.save(ENDeliveryTimeObj);
    end;
  end;
end;


procedure TfrmENDeliveryTimeEdit.spbENDeliveryKindDeliveryKindClick(Sender : TObject);
var 
   frmENDeliveryKindShow: TfrmENDeliveryKindShow;
begin
   frmENDeliveryKindShow:=TfrmENDeliveryKindShow.Create(Application,fmNormal);
   try
      with frmENDeliveryKindShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDeliveryTimeObj.deliveryKind = nil then ENDeliveryTimeObj.deliveryKind := ENDeliveryKind.Create();
               ENDeliveryTimeObj.deliveryKind.code := StrToInt(GetReturnValue(sgENDeliveryKind,0));
               edtENDeliveryKindDeliveryKindName.Text:=GetReturnValue(sgENDeliveryKind,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDeliveryKindShow.Free;
   end;
end;



end.
