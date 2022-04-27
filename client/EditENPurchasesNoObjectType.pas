
unit EditENPurchasesNoObjectType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPurchasesNoObjectTypeController ;

type
  TfrmENPurchasesNoObjectTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPurchasesNoObjectType: THTTPRIO;

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
  frmENPurchasesNoObjectTypeEdit: TfrmENPurchasesNoObjectTypeEdit;
  ENPurchasesNoObjectTypeObj: ENPurchasesNoObjectType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPurchasesNoObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENPurchasesNoObjectTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENPurchasesNoObjectTypeObj.code);
    edtName.Text := ENPurchasesNoObjectTypeObj.name; 


  end;
end;



procedure TfrmENPurchasesNoObjectTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
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
    TempENPurchasesNoObjectType := HTTPRIOENPurchasesNoObjectType as ENPurchasesNoObjectTypeControllerSoapPort;


     ENPurchasesNoObjectTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPurchasesNoObjectTypeObj.code:=low(Integer);
      TempENPurchasesNoObjectType.add(ENPurchasesNoObjectTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPurchasesNoObjectType.save(ENPurchasesNoObjectTypeObj);
    end;
  end;
end;


end.