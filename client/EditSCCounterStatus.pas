
unit EditSCCounterStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCCounterStatusController ;

type
  TfrmSCCounterStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOSCCounterStatus: THTTPRIO;

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
  frmSCCounterStatusEdit: TfrmSCCounterStatusEdit;
  SCCounterStatusObj: SCCounterStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, SCCounterStatusController  ;
}
{$R *.dfm}



procedure TfrmSCCounterStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(SCCounterStatusObj.code);
    edtName.Text := SCCounterStatusObj.name; 


  end;
end;



procedure TfrmSCCounterStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCCounterStatus: SCCounterStatusControllerSoapPort;
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
    TempSCCounterStatus := HTTPRIOSCCounterStatus as SCCounterStatusControllerSoapPort;


     SCCounterStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      SCCounterStatusObj.code:=low(Integer);
      TempSCCounterStatus.add(SCCounterStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCCounterStatus.save(SCCounterStatusObj);
    end;
  end;
end;


end.