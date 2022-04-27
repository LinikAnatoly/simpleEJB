
unit EditFINMaterialsStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMaterialsStatusController ;

type
  TfrmFINMaterialsStatusEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOFINMaterialsStatus: THTTPRIO;

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
  frmFINMaterialsStatusEdit: TfrmFINMaterialsStatusEdit;
  FINMaterialsStatusObj: FINMaterialsStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMaterialsStatusController  ;
}
{$R *.dfm}



procedure TfrmFINMaterialsStatusEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := FINMaterialsStatusObj.name; 


  end;
end;



procedure TfrmFINMaterialsStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMaterialsStatus: FINMaterialsStatusControllerSoapPort;
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
    TempFINMaterialsStatus := HTTPRIOFINMaterialsStatus as FINMaterialsStatusControllerSoapPort;


     FINMaterialsStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      FINMaterialsStatusObj.code:=low(Integer);
      TempFINMaterialsStatus.add(FINMaterialsStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempFINMaterialsStatus.save(FINMaterialsStatusObj);
    end;
  end;
end;


end.