
unit EditRQPurchaseItem2EstimateItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPurchaseItem2EstimateItemController ;

type
  TfrmRQPurchaseItem2EstimateItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCountPurchase : TLabel;
    edtCountPurchase: TEdit;
    lblStatusComment : TLabel;
    edtStatusComment: TMemo;


  HTTPRIORQPurchaseItem2EstimateItem: THTTPRIO;

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
  frmRQPurchaseItem2EstimateItemEdit: TfrmRQPurchaseItem2EstimateItemEdit;
  RQPurchaseItem2EstimateItemObj: RQPurchaseItem2EstimateItem;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPurchaseItem2EstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQPurchaseItem2EstimateItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtCountPurchase
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPurchaseItem2EstimateItemObj.code);
    if ( RQPurchaseItem2EstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPurchaseItem2EstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    if ( RQPurchaseItem2EstimateItemObj.countPurchase <> nil ) then
       edtCountPurchase.Text := RQPurchaseItem2EstimateItemObj.countPurchase.decimalString
    else
       edtCountPurchase.Text := '';
    MakeMultiline(edtStatusComment.Lines, RQPurchaseItem2EstimateItemObj.statusComment);


  end;
end;



procedure TfrmRQPurchaseItem2EstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      ,edtCountPurchase
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPurchaseItem2EstimateItem := HTTPRIORQPurchaseItem2EstimateItem as RQPurchaseItem2EstimateItemControllerSoapPort;


     if (RQPurchaseItem2EstimateItemObj.countGen = nil ) then
       RQPurchaseItem2EstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQPurchaseItem2EstimateItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQPurchaseItem2EstimateItemObj.countGen := nil;

     if (RQPurchaseItem2EstimateItemObj.countPurchase = nil ) then
       RQPurchaseItem2EstimateItemObj.countPurchase := TXSDecimal.Create;
     if edtCountPurchase.Text <> '' then
       RQPurchaseItem2EstimateItemObj.countPurchase.decimalString := edtCountPurchase.Text 
     else
       RQPurchaseItem2EstimateItemObj.countPurchase := nil;

     RQPurchaseItem2EstimateItemObj.statusComment := edtStatusComment.Text; 

    if DialogState = dsInsert then
    begin
      RQPurchaseItem2EstimateItemObj.code:=low(Integer);
      TempRQPurchaseItem2EstimateItem.add(RQPurchaseItem2EstimateItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPurchaseItem2EstimateItem.save(RQPurchaseItem2EstimateItemObj);
    end;
  end;
end;


end.