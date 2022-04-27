
unit EditENOtherObjectType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENOtherObjectTypeController ;

type
  TfrmENOtherObjectTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENOtherObjectType: THTTPRIO;

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
  frmENOtherObjectTypeEdit: TfrmENOtherObjectTypeEdit;
  ENOtherObjectTypeObj: ENOtherObjectType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENOtherObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENOtherObjectTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENOtherObjectTypeObj.code);
    edtName.Text := ENOtherObjectTypeObj.name; 


  end;
end;



procedure TfrmENOtherObjectTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOtherObjectType: ENOtherObjectTypeControllerSoapPort;
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
    TempENOtherObjectType := HTTPRIOENOtherObjectType as ENOtherObjectTypeControllerSoapPort;


     ENOtherObjectTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENOtherObjectTypeObj.code:=low(Integer);
      TempENOtherObjectType.add(ENOtherObjectTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENOtherObjectType.save(ENOtherObjectTypeObj);
    end;
  end;
end;


end.