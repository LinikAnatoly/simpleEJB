
unit EditENSubstationType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubstationTypeController ;

type
  TfrmENSubstationTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSubstationType: THTTPRIO;

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
  frmENSubstationTypeEdit: TfrmENSubstationTypeEdit;
  ENSubstationTypeObj: ENSubstationType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSubstationTypeController  ;
}
{$R *.dfm}



procedure TfrmENSubstationTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENSubstationTypeObj.name; 


  end;
end;



procedure TfrmENSubstationTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubstationType: ENSubstationTypeControllerSoapPort;
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
    TempENSubstationType := HTTPRIOENSubstationType as ENSubstationTypeControllerSoapPort;


     ENSubstationTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSubstationTypeObj.code:=low(Integer);
      TempENSubstationType.add(ENSubstationTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSubstationType.save(ENSubstationTypeObj);
    end;
  end;
end;


end.