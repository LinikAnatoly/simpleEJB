
unit EditENPlanCorrectReason;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanCorrectReasonController ;

type
  TfrmENPlanCorrectReasonEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanCorrectReason: THTTPRIO;

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
  frmENPlanCorrectReasonEdit: TfrmENPlanCorrectReasonEdit;
  ENPlanCorrectReasonObj: ENPlanCorrectReason;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanCorrectReasonController  ;
}
{$R *.dfm}



procedure TfrmENPlanCorrectReasonEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPlanCorrectReasonObj.name; 


  end;
end;



procedure TfrmENPlanCorrectReasonEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanCorrectReason: ENPlanCorrectReasonControllerSoapPort;
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
    TempENPlanCorrectReason := HTTPRIOENPlanCorrectReason as ENPlanCorrectReasonControllerSoapPort;


     ENPlanCorrectReasonObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanCorrectReasonObj.code:=low(Integer);
      TempENPlanCorrectReason.add(ENPlanCorrectReasonObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanCorrectReason.save(ENPlanCorrectReasonObj);
    end;
  end;
end;


end.