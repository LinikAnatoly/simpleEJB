
unit EditENTransformerType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransformerTypeController ;

type
  TfrmENTransformerTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTransformerType: THTTPRIO;

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
  frmENTransformerTypeEdit: TfrmENTransformerTypeEdit;
  ENTransformerTypeObj: ENTransformerType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTransformerTypeController  ;
}
{$R *.dfm}



procedure TfrmENTransformerTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENTransformerTypeObj.name; 


  end;
end;



procedure TfrmENTransformerTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransformerType: ENTransformerTypeControllerSoapPort;
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
    TempENTransformerType := HTTPRIOENTransformerType as ENTransformerTypeControllerSoapPort;


     ENTransformerTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTransformerTypeObj.code:=low(Integer);
      TempENTransformerType.add(ENTransformerTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransformerType.save(ENTransformerTypeObj);
    end;
  end;
end;


end.