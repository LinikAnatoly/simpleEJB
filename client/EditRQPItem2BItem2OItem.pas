
unit EditRQPItem2BItem2OItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPItem2BItem2OItemController ;

type
  TfrmRQPItem2BItem2OItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
  frmRQPItem2BItem2OItemEdit: TfrmRQPItem2BItem2OItemEdit;
  RQPItem2BItem2OItemObj: RQPItem2BItem2OItem;

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



procedure TfrmRQPItem2BItem2OItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtRQPayDocItemPayDocItemName
      ,spbRQPayDocItemPayDocItem
      ,edtRQBillItemBillItemName
      ,spbRQBillItemBillItem
      ,edtRQOrderItemOrderItemName
      ,spbRQOrderItemOrderItem
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSummaGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPItem2BItem2OItemObj.code);
    if ( RQPItem2BItem2OItemObj.summaGen <> nil ) then
       edtSummaGen.Text := RQPItem2BItem2OItemObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 

    //edtRQPayDocItemPayDocItemName.Text := RQPItem2BItem2OItemObj.payDocItem.name;
    //edtRQBillItemBillItemName.Text := RQPItem2BItem2OItemObj.billItem.name;
    //edtRQOrderItemOrderItemName.Text := RQPItem2BItem2OItemObj.orderItem.name;

  end;
end;



procedure TfrmRQPItem2BItem2OItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPItem2BItem2OItem: RQPItem2BItem2OItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtSummaGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPItem2BItem2OItem := HTTPRIORQPItem2BItem2OItem as RQPItem2BItem2OItemControllerSoapPort;


     if (RQPItem2BItem2OItemObj.summaGen = nil ) then
       RQPItem2BItem2OItemObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       RQPItem2BItem2OItemObj.summaGen.decimalString := edtSummaGen.Text 
     else
       RQPItem2BItem2OItemObj.summaGen := nil;

    if DialogState = dsInsert then
    begin
      RQPItem2BItem2OItemObj.code:=low(Integer);
      TempRQPItem2BItem2OItem.add(RQPItem2BItem2OItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPItem2BItem2OItem.save(RQPItem2BItem2OItemObj);
    end;
  end;
end;


procedure TfrmRQPItem2BItem2OItemEdit.spbRQPayDocItemPayDocItemClick(Sender : TObject);
var 
   frmRQPayDocItemShow: TfrmRQPayDocItemShow;
begin
   frmRQPayDocItemShow:=TfrmRQPayDocItemShow.Create(Application,fmNormal);
   try
      with frmRQPayDocItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQPItem2BItem2OItemObj.payDocItem = nil then RQPItem2BItem2OItemObj.payDocItem := RQPayDocItem.Create();
               RQPItem2BItem2OItemObj.payDocItem.code := StrToInt(GetReturnValue(sgRQPayDocItem,0));
               edtRQPayDocItemPayDocItemName.Text:=GetReturnValue(sgRQPayDocItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQPayDocItemShow.Free;
   end;
end;



procedure TfrmRQPItem2BItem2OItemEdit.spbRQBillItemBillItemClick(Sender : TObject);
var 
   frmRQBillItemShow: TfrmRQBillItemShow;
begin
   frmRQBillItemShow:=TfrmRQBillItemShow.Create(Application,fmNormal);
   try
      with frmRQBillItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQPItem2BItem2OItemObj.billItem = nil then RQPItem2BItem2OItemObj.billItem := RQBillItem.Create();
               RQPItem2BItem2OItemObj.billItem.code := StrToInt(GetReturnValue(sgRQBillItem,0));
               edtRQBillItemBillItemName.Text:=GetReturnValue(sgRQBillItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQBillItemShow.Free;
   end;
end;



procedure TfrmRQPItem2BItem2OItemEdit.spbRQOrderItemOrderItemClick(Sender : TObject);
var 
   frmRQOrderItemShow: TfrmRQOrderItemShow;
begin
   frmRQOrderItemShow:=TfrmRQOrderItemShow.Create(Application,fmNormal);
   try
      with frmRQOrderItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQPItem2BItem2OItemObj.orderItem = nil then RQPItem2BItem2OItemObj.orderItem := RQOrderItem.Create();
               RQPItem2BItem2OItemObj.orderItem.code := StrToInt(GetReturnValue(sgRQOrderItem,0));
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