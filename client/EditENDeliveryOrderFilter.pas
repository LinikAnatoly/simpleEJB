
unit EditENDeliveryOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDeliveryOrderController ;

type
  TfrmENDeliveryOrderFilterEdit = class(TDialogForm)

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENTransportItemTransportOutName : TLabel;
  edtENTransportItemTransportOutName : TEdit;
  spbENTransportItemTransportOut : TSpeedButton;
  

  HTTPRIOENDeliveryOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransportItemTransportOutClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDeliveryOrderFilterEdit: TfrmENDeliveryOrderFilterEdit;
  ENDeliveryOrderFilterObj: ENDeliveryOrderFilter;

implementation

uses
  ShowENTransportItem
  ,ENTransportItemController
;

{uses  
    EnergyproController, EnergyproController2, ENDeliveryOrderController  ;
}
{$R *.dfm}



procedure TfrmENDeliveryOrderFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtCommentGen.Text := ENDeliveryOrderObj.commentGen; 


  end;

}

end;



procedure TfrmENDeliveryOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDeliveryOrder: ENDeliveryOrderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDeliveryOrderFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENDeliveryOrderFilterEdit.spbENTransportItemTransportOutClick(Sender : TObject);
var 
   frmENTransportItemShow: TfrmENTransportItemShow;
begin
   frmENTransportItemShow:=TfrmENTransportItemShow.Create(Application,fmNormal);
   try
      with frmENTransportItemShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDeliveryOrderFilterObj.transportOut = nil then ENDeliveryOrderFilterObj.transportOut := ENTransportItem.Create();
               ENDeliveryOrderFilterObj.transportOut.code := StrToInt(GetReturnValue(sgENTransportItem,0));
               edtENTransportItemTransportOutName.Text:=GetReturnValue(sgENTransportItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransportItemShow.Free;
   end;
end;





end.