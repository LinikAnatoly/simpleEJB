
unit EditRQPlanPayItemStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayItemStatusController ;

type
  TfrmRQPlanPayItemStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQPlanPayItemStatus: THTTPRIO;

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
  frmRQPlanPayItemStatusEdit: TfrmRQPlanPayItemStatusEdit;
  RQPlanPayItemStatusObj: RQPlanPayItemStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayItemStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(RQPlanPayItemStatusObj.code);
    edtName.Text := RQPlanPayItemStatusObj.name; 


  end;
end;



procedure TfrmRQPlanPayItemStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort;
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
    TempRQPlanPayItemStatus := HTTPRIORQPlanPayItemStatus as RQPlanPayItemStatusControllerSoapPort;


     RQPlanPayItemStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQPlanPayItemStatusObj.code:=low(Integer);
      TempRQPlanPayItemStatus.add(RQPlanPayItemStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPlanPayItemStatus.save(RQPlanPayItemStatusObj);
    end;
  end;
end;


end.