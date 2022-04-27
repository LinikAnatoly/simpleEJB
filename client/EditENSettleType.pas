
unit EditENSettleType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSettleTypeController ;

type
  TfrmENSettleTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCoef : TLabel;
    edtCoef: TEdit;


  HTTPRIOENSettleType: THTTPRIO;

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
  frmENSettleTypeEdit: TfrmENSettleTypeEdit;
  ENSettleTypeObj: ENSettleType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSettleTypeController  ;
}
{$R *.dfm}



procedure TfrmENSettleTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtCoef
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSettleTypeObj.code);
    edtName.Text := ENSettleTypeObj.name; 
    if ( ENSettleTypeObj.coef <> nil ) then
       edtCoef.Text := ENSettleTypeObj.coef.decimalString
    else
       edtCoef.Text := '';


  end;
end;



procedure TfrmENSettleTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSettleType: ENSettleTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtCoef
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSettleType := HTTPRIOENSettleType as ENSettleTypeControllerSoapPort;


     ENSettleTypeObj.name := edtName.Text; 

     if (ENSettleTypeObj.coef = nil ) then
       ENSettleTypeObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       ENSettleTypeObj.coef.decimalString := edtCoef.Text 
     else
       ENSettleTypeObj.coef := nil;

    if DialogState = dsInsert then
    begin
      ENSettleTypeObj.code:=low(Integer);
      TempENSettleType.add(ENSettleTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSettleType.save(ENSettleTypeObj);
    end;
  end;
end;


end.