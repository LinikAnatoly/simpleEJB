
unit EditENTiresInstallPlaces;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTiresInstallPlacesController ;

type
  TfrmENTiresInstallPlacesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENTiresInstallPlaces: THTTPRIO;

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
  frmENTiresInstallPlacesEdit: TfrmENTiresInstallPlacesEdit;
  ENTiresInstallPlacesObj: ENTiresInstallPlaces;

implementation


{uses  
    EnergyproController, EnergyproController2, ENTiresInstallPlacesController  ;
}
{$R *.dfm}



procedure TfrmENTiresInstallPlacesEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENTiresInstallPlacesObj.code);
    edtName.Text := ENTiresInstallPlacesObj.name; 


  end;
end;



procedure TfrmENTiresInstallPlacesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
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
    TempENTiresInstallPlaces := HTTPRIOENTiresInstallPlaces as ENTiresInstallPlacesControllerSoapPort;


     ENTiresInstallPlacesObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENTiresInstallPlacesObj.code:=low(Integer);
      TempENTiresInstallPlaces.add(ENTiresInstallPlacesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTiresInstallPlaces.save(ENTiresInstallPlacesObj);
    end;
  end;
end;


end.