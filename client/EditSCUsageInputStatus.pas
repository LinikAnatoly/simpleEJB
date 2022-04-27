
unit EditSCUsageInputStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputStatusController ;

type
  TfrmSCUsageInputStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOSCUsageInputStatus: THTTPRIO;

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
  frmSCUsageInputStatusEdit: TfrmSCUsageInputStatusEdit;
  SCUsageInputStatusObj: SCUsageInputStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, SCUsageInputStatusController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(SCUsageInputStatusObj.code);
    edtName.Text := SCUsageInputStatusObj.name; 


  end;
end;



procedure TfrmSCUsageInputStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
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
    TempSCUsageInputStatus := HTTPRIOSCUsageInputStatus as SCUsageInputStatusControllerSoapPort;


     SCUsageInputStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      SCUsageInputStatusObj.code:=low(Integer);
      TempSCUsageInputStatus.add(SCUsageInputStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCUsageInputStatus.save(SCUsageInputStatusObj);
    end;
  end;
end;


end.