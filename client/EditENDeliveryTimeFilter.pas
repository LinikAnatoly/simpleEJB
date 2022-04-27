
unit EditENDeliveryTimeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryTimeController ;

type
  TfrmENDeliveryTimeFilterEdit = class(TDialogForm)

    lblDeliveryTimePlan : TLabel;
    edtDeliveryTimePlan: TEdit;
    lblDeliveryTimeFact : TLabel;
    edtDeliveryTimeFact: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENDeliveryKindDeliveryKindName : TLabel;
  edtENDeliveryKindDeliveryKindName : TEdit;
  spbENDeliveryKindDeliveryKind : TSpeedButton;
  

  HTTPRIOENDeliveryTime: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDeliveryKindDeliveryKindClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDeliveryTimeFilterEdit: TfrmENDeliveryTimeFilterEdit;
  ENDeliveryTimeFilterObj: ENDeliveryTimeFilter;

implementation

uses
  ShowENDeliveryKind
  ,ENDeliveryKindController
;

{uses  
    EnergyproController, EnergyproController2, ENDeliveryTimeController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryTimeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDeliveryTimePlan
      ,edtDeliveryTimeFact
     ]);
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



    edtCommentGen.Text := ENDeliveryTimeObj.commentGen; 


  end;

}

end;



procedure TfrmENDeliveryTimeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENDeliveryTimeFilterObj.deliveryTimePlan = nil ) then
       ENDeliveryTimeFilterObj.deliveryTimePlan := TXSDecimal.Create;
     ENDeliveryTimeFilterObj.deliveryTimePlan.decimalString := edtDeliveryTimePlan.Text ;



     if (ENDeliveryTimeFilterObj.deliveryTimeFact = nil ) then
       ENDeliveryTimeFilterObj.deliveryTimeFact := TXSDecimal.Create;
     ENDeliveryTimeFilterObj.deliveryTimeFact.decimalString := edtDeliveryTimeFact.Text ;



     ENDeliveryTimeFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENDeliveryTimeFilterEdit.spbENDeliveryKindDeliveryKindClick(Sender : TObject);
var 
   frmENDeliveryKindShow: TfrmENDeliveryKindShow;
begin
   frmENDeliveryKindShow:=TfrmENDeliveryKindShow.Create(Application,fmNormal);
   try
      with frmENDeliveryKindShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDeliveryTimeFilterObj.deliveryKind = nil then ENDeliveryTimeFilterObj.deliveryKind := ENDeliveryKind.Create();
               ENDeliveryTimeFilterObj.deliveryKind.code := StrToInt(GetReturnValue(sgENDeliveryKind,0));
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