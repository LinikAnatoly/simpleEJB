
unit EditENPlanWorkState;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkStateController ;

type
  TfrmENPlanWorkStateEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkState: THTTPRIO;

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
  frmENPlanWorkStateEdit: TfrmENPlanWorkStateEdit;
  ENPlanWorkStateObj: ENPlanWorkState;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkStateController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkStateEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPlanWorkStateObj.name; 


  end;
end;



procedure TfrmENPlanWorkStateEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
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
    TempENPlanWorkState := HTTPRIOENPlanWorkState as ENPlanWorkStateControllerSoapPort;


     ENPlanWorkStateObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkStateObj.code:=low(Integer);
      TempENPlanWorkState.add(ENPlanWorkStateObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkState.save(ENPlanWorkStateObj);
    end;
  end;
end;


end.