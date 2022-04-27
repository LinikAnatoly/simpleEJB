
unit EditENPurchasesObjectReason;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesObjectReasonController ;

type
  TfrmENPurchasesObjectReasonEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPurchasesObjectReason: THTTPRIO;

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
  frmENPurchasesObjectReasonEdit: TfrmENPurchasesObjectReasonEdit;
  ENPurchasesObjectReasonObj: ENPurchasesObjectReason;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPurchasesObjectReasonController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesObjectReasonEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPurchasesObjectReasonObj.name; 


  end;
end;



procedure TfrmENPurchasesObjectReasonEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesObjectReason: ENPurchasesObjectReasonControllerSoapPort;
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
    TempENPurchasesObjectReason := HTTPRIOENPurchasesObjectReason as ENPurchasesObjectReasonControllerSoapPort;


     ENPurchasesObjectReasonObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPurchasesObjectReasonObj.code:=low(Integer);
      TempENPurchasesObjectReason.add(ENPurchasesObjectReasonObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPurchasesObjectReason.save(ENPurchasesObjectReasonObj);
    end;
  end;
end;


end.