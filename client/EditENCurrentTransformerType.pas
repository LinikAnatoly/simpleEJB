
unit EditENCurrentTransformerType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCurrentTransformerTypeController ;

type
  TfrmENCurrentTransformerTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENCurrentTransformerType: THTTPRIO;

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
  frmENCurrentTransformerTypeEdit: TfrmENCurrentTransformerTypeEdit;
  ENCurrentTransformerTypeObj: ENCurrentTransformerType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCurrentTransformerTypeController  ;
}
{$R *.dfm}



procedure TfrmENCurrentTransformerTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENCurrentTransformerTypeObj.code);
    edtName.Text := ENCurrentTransformerTypeObj.name; 


  end;
end;



procedure TfrmENCurrentTransformerTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCurrentTransformerType: ENCurrentTransformerTypeControllerSoapPort;
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
    TempENCurrentTransformerType := HTTPRIOENCurrentTransformerType as ENCurrentTransformerTypeControllerSoapPort;


     ENCurrentTransformerTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENCurrentTransformerTypeObj.code:=low(Integer);
      TempENCurrentTransformerType.add(ENCurrentTransformerTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCurrentTransformerType.save(ENCurrentTransformerTypeObj);
    end;
  end;
end;


end.