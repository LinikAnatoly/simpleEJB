
unit EditRQPlanPayStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayStatusController ;

type
  TfrmRQPlanPayStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQPlanPayStatus: THTTPRIO;

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
  frmRQPlanPayStatusEdit: TfrmRQPlanPayStatusEdit;
  RQPlanPayStatusObj: RQPlanPayStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayStatusController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayStatusEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQPlanPayStatusObj.code);
    edtName.Text := RQPlanPayStatusObj.name; 


  end;
end;



procedure TfrmRQPlanPayStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort;
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
    TempRQPlanPayStatus := HTTPRIORQPlanPayStatus as RQPlanPayStatusControllerSoapPort;


     RQPlanPayStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQPlanPayStatusObj.code:=low(Integer);
      TempRQPlanPayStatus.add(RQPlanPayStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPlanPayStatus.save(RQPlanPayStatusObj);
    end;
  end;
end;


end.