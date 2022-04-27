
unit EditENRZAObjectType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRZAObjectTypeController ;

type
  TfrmENRZAObjectTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENRZAObjectType: THTTPRIO;

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
  frmENRZAObjectTypeEdit: TfrmENRZAObjectTypeEdit;
  ENRZAObjectTypeObj: ENRZAObjectType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENRZAObjectTypeController  ;
}
{$R *.dfm}



procedure TfrmENRZAObjectTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENRZAObjectTypeObj.name; 


  end;
end;



procedure TfrmENRZAObjectTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRZAObjectType: ENRZAObjectTypeControllerSoapPort;
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
    TempENRZAObjectType := HTTPRIOENRZAObjectType as ENRZAObjectTypeControllerSoapPort;


     ENRZAObjectTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENRZAObjectTypeObj.code:=low(Integer);
      TempENRZAObjectType.add(ENRZAObjectTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRZAObjectType.save(ENRZAObjectTypeObj);
    end;
  end;
end;


end.