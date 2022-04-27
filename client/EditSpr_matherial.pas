
unit EditSpr_matherial;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, Spr_matherialController ;

type
  TfrmSpr_matherialEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOSpr_matherial: THTTPRIO;

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
  frmSpr_matherialEdit: TfrmSpr_matherialEdit;
  Spr_matherialObj: Spr_matherial;

implementation


{uses  
    EnergyproController, EnergyproController2, Spr_matherialController  ;
}
{$R *.dfm}



procedure TfrmSpr_matherialEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := Spr_matherialObj.name; 


  end;
end;



procedure TfrmSpr_matherialEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSpr_matherial: Spr_matherialControllerSoapPort;
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
    TempSpr_matherial := HTTPRIOSpr_matherial as Spr_matherialControllerSoapPort;


     Spr_matherialObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      Spr_matherialObj.code:=low(Integer);
      TempSpr_matherial.add(Spr_matherialObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSpr_matherial.save(Spr_matherialObj);
    end;
  end;
end;


end.