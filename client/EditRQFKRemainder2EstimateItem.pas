
unit EditRQFKRemainder2EstimateItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQFKRemainder2EstimateItemController ;

type
  TfrmRQFKRemainder2EstimateItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;


  HTTPRIORQFKRemainder2EstimateItem: THTTPRIO;

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
  frmRQFKRemainder2EstimateItemEdit: TfrmRQFKRemainder2EstimateItemEdit;
  RQFKRemainder2EstimateItemObj: RQFKRemainder2EstimateItem;

implementation


{uses  
    EnergyproController, EnergyproController2, RQFKRemainder2EstimateItemController  ;
}
{$R *.dfm}



procedure TfrmRQFKRemainder2EstimateItemEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQFKRemainder2EstimateItemObj.code);
    if ( RQFKRemainder2EstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := RQFKRemainder2EstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 


  end;
end;



procedure TfrmRQFKRemainder2EstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItemControllerSoapPort;
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
    TempRQFKRemainder2EstimateItem := HTTPRIORQFKRemainder2EstimateItem as RQFKRemainder2EstimateItemControllerSoapPort;


     if (RQFKRemainder2EstimateItemObj.countGen = nil ) then
       RQFKRemainder2EstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQFKRemainder2EstimateItemObj.countGen.decimalString := edtCountGen.Text 
     else
       RQFKRemainder2EstimateItemObj.countGen := nil;

    if DialogState = dsInsert then
    begin
      RQFKRemainder2EstimateItemObj.code:=low(Integer);
      TempRQFKRemainder2EstimateItem.add(RQFKRemainder2EstimateItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQFKRemainder2EstimateItem.save(RQFKRemainder2EstimateItemObj);
    end;
  end;
end;


end.