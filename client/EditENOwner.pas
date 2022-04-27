
unit EditENOwner;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENOwnerController ;

type
  TfrmENOwnerEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENOwner: THTTPRIO;

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
  frmENOwnerEdit: TfrmENOwnerEdit;
  ENOwnerObj: ENOwner;

implementation


{uses  
    EnergyproController, EnergyproController2, ENOwnerController  ;
}
{$R *.dfm}



procedure TfrmENOwnerEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENOwnerObj.name; 


  end;
end;



procedure TfrmENOwnerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENOwner: ENOwnerControllerSoapPort;
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
    TempENOwner := HTTPRIOENOwner as ENOwnerControllerSoapPort;


     ENOwnerObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENOwnerObj.code:=low(Integer);
      TempENOwner.add(ENOwnerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENOwner.save(ENOwnerObj);
    end;
  end;
end;


end.