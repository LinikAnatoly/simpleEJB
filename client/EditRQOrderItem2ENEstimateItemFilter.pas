
unit EditRQOrderItem2ENEstimateItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItem2ENEstimateItemController ;

type
  TfrmRQOrderItem2ENEstimateItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;

  lblENEstimateItemEstimateItemName : TLabel;
  edtENEstimateItemEstimateItemName : TEdit;
  spbENEstimateItemEstimateItem : TSpeedButton;
  
  lblRQOrderItemOrderItemName : TLabel;
  edtRQOrderItemOrderItemName : TEdit;
  spbRQOrderItemOrderItem : TSpeedButton;
  

  HTTPRIORQOrderItem2ENEstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENEstimateItemEstimateItemClick(Sender : TObject);
  procedure spbRQOrderItemOrderItemClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQOrderItem2ENEstimateItemFilterEdit: TfrmRQOrderItem2ENEstimateItemFilterEdit;
  RQOrderItem2ENEstimateItemFilterObj: RQOrderItem2ENEstimateItemFilter;

implementation

uses
  ShowENEstimateItem
  ,ENEstimateItemController
  ,ShowRQOrderItem
  ,RQOrderItemController
;

{uses  
    EnergyproController, EnergyproController2, RQOrderItem2ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQOrderItem2ENEstimateItemFilterEdit.FormShow(Sender: TObject);

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

    if ( RQOrderItem2ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQOrderItem2ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 


  end;

}

end;



procedure TfrmRQOrderItem2ENEstimateItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQOrderItem2ENEstimateItemFilterObj.countGen = nil ) then
       RQOrderItem2ENEstimateItemFilterObj.countGen := TXSDecimal.Create;
     RQOrderItem2ENEstimateItemFilterObj.countGen.decimalString := edtCountGen.Text ;




  end;
end;

procedure TfrmRQOrderItem2ENEstimateItemFilterEdit.spbENEstimateItemEstimateItemClick(Sender : TObject);
var 
   frmENEstimateItemShow: TfrmENEstimateItemShow;
begin
   frmENEstimateItemShow:=TfrmENEstimateItemShow.Create(Application,fmNormal);
   try
      with frmENEstimateItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItem2ENEstimateItemFilterObj.estimateItem = nil then RQOrderItem2ENEstimateItemFilterObj.estimateItem := ENEstimateItem.Create();
               RQOrderItem2ENEstimateItemFilterObj.estimateItem.code := StrToInt(GetReturnValue(sgENEstimateItem,0));
               edtENEstimateItemEstimateItemName.Text:=GetReturnValue(sgENEstimateItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENEstimateItemShow.Free;
   end;
end;


procedure TfrmRQOrderItem2ENEstimateItemFilterEdit.spbRQOrderItemOrderItemClick(Sender : TObject);
var 
   frmRQOrderItemShow: TfrmRQOrderItemShow;
begin
   frmRQOrderItemShow:=TfrmRQOrderItemShow.Create(Application,fmNormal);
   try
      with frmRQOrderItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItem2ENEstimateItemFilterObj.orderItem = nil then RQOrderItem2ENEstimateItemFilterObj.orderItem := RQOrderItem.Create();
               RQOrderItem2ENEstimateItemFilterObj.orderItem.code := StrToInt(GetReturnValue(sgRQOrderItem,0));
               edtRQOrderItemOrderItemName.Text:=GetReturnValue(sgRQOrderItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrderItemShow.Free;
   end;
end;





end.