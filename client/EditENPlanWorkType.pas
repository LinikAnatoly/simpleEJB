
unit EditENPlanWorkType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkTypeController ;

type
  TfrmENPlanWorkTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkType: THTTPRIO;

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
  frmENPlanWorkTypeEdit: TfrmENPlanWorkTypeEdit;
  ENPlanWorkTypeObj: ENPlanWorkType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkTypeController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPlanWorkTypeObj.name; 


  end;
end;



procedure TfrmENPlanWorkTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
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
    TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;


     ENPlanWorkTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkTypeObj.code:=low(Integer);
      TempENPlanWorkType.add(ENPlanWorkTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkType.save(ENPlanWorkTypeObj);
    end;
  end;
end;


end.