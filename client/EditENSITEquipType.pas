
unit EditENSITEquipType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITEquipTypeController ;

type
  TfrmENSITEquipTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblDescription : TLabel;
    edtDescription: TEdit;


  HTTPRIOENSITEquipType: THTTPRIO;

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
  frmENSITEquipTypeEdit: TfrmENSITEquipTypeEdit;
  ENSITEquipTypeObj: ENSITEquipType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSITEquipTypeController  ;
}
{$R *.dfm}



procedure TfrmENSITEquipTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtDescription
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENSITEquipTypeObj.name; 
    edtDescription.Text := ENSITEquipTypeObj.description; 


  end;
end;



procedure TfrmENSITEquipTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtDescription
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSITEquipType := HTTPRIOENSITEquipType as ENSITEquipTypeControllerSoapPort;


     ENSITEquipTypeObj.name := edtName.Text; 

     ENSITEquipTypeObj.description := edtDescription.Text; 

    if DialogState = dsInsert then
    begin
      ENSITEquipTypeObj.code:=low(Integer);
      TempENSITEquipType.add(ENSITEquipTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSITEquipType.save(ENSITEquipTypeObj);
    end;
  end;
end;


end.