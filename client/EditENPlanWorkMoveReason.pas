
unit EditENPlanWorkMoveReason;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkMoveReasonController ;

type
  TfrmENPlanWorkMoveReasonEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkMoveReason: THTTPRIO;

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
  frmENPlanWorkMoveReasonEdit: TfrmENPlanWorkMoveReasonEdit;
  ENPlanWorkMoveReasonObj: ENPlanWorkMoveReason;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkMoveReasonController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkMoveReasonEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPlanWorkMoveReasonObj.name; 


  end;
end;



procedure TfrmENPlanWorkMoveReasonEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkMoveReason: ENPlanWorkMoveReasonControllerSoapPort;
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
    TempENPlanWorkMoveReason := HTTPRIOENPlanWorkMoveReason as ENPlanWorkMoveReasonControllerSoapPort;


     ENPlanWorkMoveReasonObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkMoveReasonObj.code:=low(Integer);
      TempENPlanWorkMoveReason.add(ENPlanWorkMoveReasonObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkMoveReason.save(ENPlanWorkMoveReasonObj);
    end;
  end;
end;


end.