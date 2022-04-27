
unit EditRQOrderItem2ENEstimateItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItem2ENEstimateItemController ;

type
  TfrmRQOrderItem2ENEstimateItemEdit = class(TDialogForm)

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
  frmRQOrderItem2ENEstimateItemEdit: TfrmRQOrderItem2ENEstimateItemEdit;
  RQOrderItem2ENEstimateItemObj: RQOrderItem2ENEstimateItem;

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



procedure TfrmRQOrderItem2ENEstimateItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENEstimateItemEstimateItemName
      ,spbENEstimateItemEstimateItem
      ,edtRQOrderItemOrderItemName
      ,spbRQOrderItemOrderItem
       ]);
  end;

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

    //edtENEstimateItemEstimateItemName.Text := RQOrderItem2ENEstimateItemObj.estimateItem.name;
    //edtRQOrderItemOrderItemName.Text := RQOrderItem2ENEstimateItemObj.orderItem.name;

  end;
end;



procedure TfrmRQOrderItem2ENEstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQOrderItem2ENEstimateItem := HTTPRIORQOrderItem2ENEstimateItem as RQOrderItem2ENEstimateItemControllerSoapPort;


     if (RQOrderItem2ENEstimateItemObj.countGen = nil ) then
       RQOrderItem2ENEstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQOrderItem2ENEstimateItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQOrderItem2ENEstimateItemObj.countGen := nil;

    if DialogState = dsInsert then
    begin
      RQOrderItem2ENEstimateItemObj.code:=low(Integer);
      TempRQOrderItem2ENEstimateItem.add(RQOrderItem2ENEstimateItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      SetNullXSProps(RQOrderItem2ENEstimateItemObj.orderItem);
      SetNullXSProps(RQOrderItem2ENEstimateItemObj.estimateItem);
      TempRQOrderItem2ENEstimateItem.save(RQOrderItem2ENEstimateItemObj);
    end;
  end;
end;


procedure TfrmRQOrderItem2ENEstimateItemEdit.spbENEstimateItemEstimateItemClick(Sender : TObject);
var 
   frmENEstimateItemShow: TfrmENEstimateItemShow;
begin
   frmENEstimateItemShow:=TfrmENEstimateItemShow.Create(Application,fmNormal);
   try
      with frmENEstimateItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItem2ENEstimateItemObj.estimateItem = nil then RQOrderItem2ENEstimateItemObj.estimateItem := ENEstimateItem.Create();
               RQOrderItem2ENEstimateItemObj.estimateItem.code := StrToInt(GetReturnValue(sgENEstimateItem,0));
               edtENEstimateItemEstimateItemName.Text:=GetReturnValue(sgENEstimateItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENEstimateItemShow.Free;
   end;
end;



procedure TfrmRQOrderItem2ENEstimateItemEdit.spbRQOrderItemOrderItemClick(Sender : TObject);
var 
   frmRQOrderItemShow: TfrmRQOrderItemShow;
begin
   frmRQOrderItemShow:=TfrmRQOrderItemShow.Create(Application,fmNormal);
   try
      with frmRQOrderItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderItem2ENEstimateItemObj.orderItem = nil then RQOrderItem2ENEstimateItemObj.orderItem := RQOrderItem.Create();
               RQOrderItem2ENEstimateItemObj.orderItem.code := StrToInt(GetReturnValue(sgRQOrderItem,0));
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