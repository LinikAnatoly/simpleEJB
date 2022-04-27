
unit EditENPlanWorkStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkStatusController ;

type
  TfrmENPlanWorkStatusEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkStatus: THTTPRIO;

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
  frmENPlanWorkStatusEdit: TfrmENPlanWorkStatusEdit;
  ENPlanWorkStatusObj: ENPlanWorkStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkStatusController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkStatusEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPlanWorkStatusObj.name; 


  end;
end;



procedure TfrmENPlanWorkStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkStatus: ENPlanWorkStatusControllerSoapPort;
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
    TempENPlanWorkStatus := HTTPRIOENPlanWorkStatus as ENPlanWorkStatusControllerSoapPort;


     ENPlanWorkStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkStatusObj.code:=low(Integer);
      TempENPlanWorkStatus.add(ENPlanWorkStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkStatus.save(ENPlanWorkStatusObj);
    end;
  end;
end;


end.