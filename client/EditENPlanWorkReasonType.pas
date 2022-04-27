
unit EditENPlanWorkReasonType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkReasonTypeController ;

type
  TfrmENPlanWorkReasonTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkReasonType: THTTPRIO;

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
  frmENPlanWorkReasonTypeEdit: TfrmENPlanWorkReasonTypeEdit;
  ENPlanWorkReasonTypeObj: ENPlanWorkReasonType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkReasonTypeController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkReasonTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENPlanWorkReasonTypeObj.code);
    edtName.Text := ENPlanWorkReasonTypeObj.name; 


  end;
end;



procedure TfrmENPlanWorkReasonTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
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
    TempENPlanWorkReasonType := HTTPRIOENPlanWorkReasonType as ENPlanWorkReasonTypeControllerSoapPort;


     ENPlanWorkReasonTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPlanWorkReasonTypeObj.code:=low(Integer);
      TempENPlanWorkReasonType.add(ENPlanWorkReasonTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanWorkReasonType.save(ENPlanWorkReasonTypeObj);
    end;
  end;
end;


end.