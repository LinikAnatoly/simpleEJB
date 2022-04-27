
unit EditENPlanWorkKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkKindController ;

type
  TfrmENPlanWorkKindEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkKind: THTTPRIO;

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
  frmENPlanWorkKindEdit: TfrmENPlanWorkKindEdit;
  ENPlanWorkKindObj: ENPlanWorkKind;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkKindController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkKindEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPlanWorkKindObj.name; 


  end;
end;



procedure TfrmENPlanWorkKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
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
    TempENPlanWorkKind := HTTPRIOENPlanWorkKind as ENPlanWorkKindControllerSoapPort;


     ENPlanWorkKindObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkKindObj.code:=low(Integer);
      TempENPlanWorkKind.add(ENPlanWorkKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkKind.save(ENPlanWorkKindObj);
    end;
  end;
end;


end.