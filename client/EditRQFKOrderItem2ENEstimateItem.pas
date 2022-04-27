
unit EditRQFKOrderItem2ENEstimateItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKOrderItem2ENEstimateItemController ;

type
  TfrmRQFKOrderItem2ENEstimateItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblSumWithoutNds : TLabel;
    edtSumWithoutNds: TEdit;

  lblENEstimateItemEstimateItemName : TLabel;
  edtENEstimateItemEstimateItemName : TEdit;
  spbENEstimateItemEstimateItem : TSpeedButton;
  

  HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENEstimateItemEstimateItemClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQFKOrderItem2ENEstimateItemEdit: TfrmRQFKOrderItem2ENEstimateItemEdit;
  RQFKOrderItem2ENEstimateItemObj: RQFKOrderItem2ENEstimateItem;

implementation

uses
  ShowENEstimateItem
  ,ENEstimateItemController
;

{uses  
    EnergyproController, EnergyproController2, RQFKOrderItem2ENEstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQFKOrderItem2ENEstimateItemEdit.FormShow(Sender: TObject);

begin

  HideControls([lblSumWithoutNds, edtSumWithoutNds,
                lblENEstimateItemEstimateItemName, edtENEstimateItemEstimateItemName, spbENEstimateItemEstimateItem
                ]);

  DisableControls([edtCode]);
  SetFloatStyle([edtCountGen]);
  
  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENEstimateItemEstimateItemName
      ,spbENEstimateItemEstimateItem
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtSumWithoutNds
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQFKOrderItem2ENEstimateItemObj.code);
    if ( RQFKOrderItem2ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQFKOrderItem2ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 
    if ( RQFKOrderItem2ENEstimateItemObj.sumWithoutNds <> nil ) then
       edtSumWithoutNds.Text := RQFKOrderItem2ENEstimateItemObj.sumWithoutNds.decimalString
    else
       edtSumWithoutNds.Text := ''; 

    //edtENEstimateItemEstimateItemName.Text := RQFKOrderItem2ENEstimateItemObj.estimateItem. name;

  end;
end;



procedure TfrmRQFKOrderItem2ENEstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
 eCode : Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
     // ,edtSumWithoutNds
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;


     if (RQFKOrderItem2ENEstimateItemObj.countGen = nil ) then
       RQFKOrderItem2ENEstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKOrderItem2ENEstimateItemObj.countGen.decimalString := edtCountGen.Text
     else
       RQFKOrderItem2ENEstimateItemObj.countGen := nil;
{
     if (RQFKOrderItem2ENEstimateItemObj.sumWithoutNds = nil ) then
       RQFKOrderItem2ENEstimateItemObj.sumWithoutNds := TXSDecimal.Create;
     if edtSumWithoutNds.Text <> '' then
       RQFKOrderItem2ENEstimateItemObj.sumWithoutNds.decimalString := edtSumWithoutNds.Text 
     else
       RQFKOrderItem2ENEstimateItemObj.sumWithoutNds := nil;
}

    eCode := RQFKOrderItem2ENEstimateItemObj.estimateItem.code;

    SetNullIntProps(RQFKOrderItem2ENEstimateItemObj.estimateItem);
    SetNullXSProps(RQFKOrderItem2ENEstimateItemObj.estimateItem);
    
    RQFKOrderItem2ENEstimateItemObj.estimateItem.code := eCode;

    if DialogState = dsInsert then
    begin
      RQFKOrderItem2ENEstimateItemObj.code:=low(Integer);
      TempRQFKOrderItem2ENEstimateItem.add(RQFKOrderItem2ENEstimateItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKOrderItem2ENEstimateItem.save(RQFKOrderItem2ENEstimateItemObj);
    end;
  end;
end;


procedure TfrmRQFKOrderItem2ENEstimateItemEdit.spbENEstimateItemEstimateItemClick(Sender : TObject);
var 
   frmENEstimateItemShow: TfrmENEstimateItemShow;
begin
   frmENEstimateItemShow:=TfrmENEstimateItemShow.Create(Application,fmNormal);
   try
      with frmENEstimateItemShow do
        if ShowModal = mrOk then
        begin
            try
               if RQFKOrderItem2ENEstimateItemObj.estimateItem = nil then RQFKOrderItem2ENEstimateItemObj.estimateItem := ENEstimateItem.Create();
               RQFKOrderItem2ENEstimateItemObj.estimateItem.code := StrToInt(GetReturnValue(sgENEstimateItem,0));
               edtENEstimateItemEstimateItemName.Text:=GetReturnValue(sgENEstimateItem,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENEstimateItemShow.Free;
   end;
end;



end.