
unit EditRQOrderItemTypePay;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderItemTypePayController ;

type
  TfrmRQOrderItemTypePayEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderItemTypePay: THTTPRIO;

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
  frmRQOrderItemTypePayEdit: TfrmRQOrderItemTypePayEdit;
  RQOrderItemTypePayObj: RQOrderItemTypePay;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderItemTypePayController  ;
}
{$R *.dfm}



procedure TfrmRQOrderItemTypePayEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQOrderItemTypePayObj.code);
    edtName.Text := RQOrderItemTypePayObj.name; 


  end;
end;



procedure TfrmRQOrderItemTypePayEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderItemTypePay: RQOrderItemTypePayControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQOrderItemTypePay := HTTPRIORQOrderItemTypePay as RQOrderItemTypePayControllerSoapPort;


     RQOrderItemTypePayObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQOrderItemTypePayObj.code:=low(Integer);
      TempRQOrderItemTypePay.add(RQOrderItemTypePayObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrderItemTypePay.save(RQOrderItemTypePayObj);
    end;
  end;
end;


end.