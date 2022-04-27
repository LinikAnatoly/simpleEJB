
unit EditENDistanceType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDistanceTypeController ;

type
  TfrmENDistanceTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENDistanceType: THTTPRIO;

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
  frmENDistanceTypeEdit: TfrmENDistanceTypeEdit;
  ENDistanceTypeObj: ENDistanceType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDistanceTypeController  ;
}
{$R *.dfm}



procedure TfrmENDistanceTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENDistanceTypeObj.name; 


  end;
end;



procedure TfrmENDistanceTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDistanceType: ENDistanceTypeControllerSoapPort;
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
    TempENDistanceType := HTTPRIOENDistanceType as ENDistanceTypeControllerSoapPort;


     ENDistanceTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDistanceTypeObj.code:=low(Integer);
      TempENDistanceType.add(ENDistanceTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDistanceType.save(ENDistanceTypeObj);
    end;
  end;
end;


end.