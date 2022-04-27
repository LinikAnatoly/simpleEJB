
unit EditRQPItem2BItem2OItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPItem2BItem2OItemController ;

type
  TfrmRQPItem2BItem2OItemFilterEdit = class(TDialogForm)

    lblSummaGen : TLabel;
    edtSummaGen: TEdit;


  lblRQPayDocItemPayDocItemName : TLabel;
  edtRQPayDocItemPayDocItemName : TEdit;
  spbRQPayDocItemPayDocItem : TSpeedButton;
  
  lblRQBillItemBillItemName : TLabel;
  edtRQBillItemBillItemName : TEdit;
  spbRQBillItemBillItem : TSpeedButton;
  
  lblRQOrderItemOrderItemName : TLabel;
  edtRQOrderItemOrderItemName : TEdit;
  spbRQOrderItemOrderItem : TSpeedButton;
  

  HTTPRIORQPItem2BItem2OItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQPayDocItemPayDocItemClick(Sender : TObject);
  procedure spbRQBillItemBillItemClick(Sender : TObject);
  procedure spbRQOrderItemOrderItemClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQPItem2BItem2OItemFilterEdit: TfrmRQPItem2BItem2OItemFilterEdit;
  RQPItem2BItem2OItemFilterObj: RQPItem2BItem2OItemFilter;

implementation

uses
  ShowRQPayDocItem
  ,RQPayDocItemController
  ,ShowRQBillItem
  ,RQBillItemController
  ,ShowRQOrderItem
  ,RQOrderItemController
;

{uses  
    EnergyproController, EnergyproController2, RQPItem2BItem2OItemController  ;
}
{$R *.dfm}



procedure TfrmRQPItem2BItem2OItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSummaGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQPItem2BItem2OItemObj.summaGen <> nil ) then
       edtSummaGen.Text := RQPItem2BItem2OItemObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 


  end;

}

end;



procedure TfrmRQPItem2BItem2OItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQPItem2BItem2OItemFilterObj.summaGen = nil ) then
       RQPItem2BItem2OItemFilterObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       RQPItem2BItem2OItemFilterObj.summaGen.decimalString := edtSummaGen.Text 
     else
       RQPItem2BItem2OItemFilterObj.summaGen := nil;





  end;
end;

procedure TfrmRQPItem2BItem2OItemFilterEdit.spbRQPayDocItemPayDocItemClick(Sender : TObject);
var 
   frmRQPayDocItemShow: TfrmRQPayDocItemShow;
begin
   frmRQPayDocItemShow:=TfrmRQPayDocItemShow.Create(Application,fmNormal);
   try
      with frmRQPayDocItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQPItem2BItem2OItemFilterObj.payDocItem = nil then RQPItem2BItem2OItemFilterObj.payDocItem := RQPayDocItem.Create();
               RQPItem2BItem2OItemFilterObj.payDocItem.code := StrToInt(GetReturnValue(sgRQPayDocItem,0));
               edtRQPayDocItemPayDocItemName.Text:=GetReturnValue(sgRQPayDocItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQPayDocItemShow.Free;
   end;
end;


procedure TfrmRQPItem2BItem2OItemFilterEdit.spbRQBillItemBillItemClick(Sender : TObject);
var 
   frmRQBillItemShow: TfrmRQBillItemShow;
begin
   frmRQBillItemShow:=TfrmRQBillItemShow.Create(Application,fmNormal);
   try
      with frmRQBillItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQPItem2BItem2OItemFilterObj.billItem = nil then RQPItem2BItem2OItemFilterObj.billItem := RQBillItem.Create();
               RQPItem2BItem2OItemFilterObj.billItem.code := StrToInt(GetReturnValue(sgRQBillItem,0));
               edtRQBillItemBillItemName.Text:=GetReturnValue(sgRQBillItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQBillItemShow.Free;
   end;
end;


procedure TfrmRQPItem2BItem2OItemFilterEdit.spbRQOrderItemOrderItemClick(Sender : TObject);
var 
   frmRQOrderItemShow: TfrmRQOrderItemShow;
begin
   frmRQOrderItemShow:=TfrmRQOrderItemShow.Create(Application,fmNormal);
   try
      with frmRQOrderItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQPItem2BItem2OItemFilterObj.orderItem = nil then RQPItem2BItem2OItemFilterObj.orderItem := RQOrderItem.Create();
               RQPItem2BItem2OItemFilterObj.orderItem.code := StrToInt(GetReturnValue(sgRQOrderItem,0));
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