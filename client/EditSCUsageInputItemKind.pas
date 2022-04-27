
unit EditSCUsageInputItemKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemKindController ;

type
  TfrmSCUsageInputItemKindEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOSCUsageInputItemKind: THTTPRIO;

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
  frmSCUsageInputItemKindEdit: TfrmSCUsageInputItemKindEdit;
  SCUsageInputItemKindObj: SCUsageInputItemKind;

implementation


{uses  
    EnergyproController, EnergyproController2, SCUsageInputItemKindController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputItemKindEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(SCUsageInputItemKindObj.code);
    edtName.Text := SCUsageInputItemKindObj.name; 


  end;
end;



procedure TfrmSCUsageInputItemKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
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
    TempSCUsageInputItemKind := HTTPRIOSCUsageInputItemKind as SCUsageInputItemKindControllerSoapPort;


     SCUsageInputItemKindObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      SCUsageInputItemKindObj.code:=low(Integer);
      TempSCUsageInputItemKind.add(SCUsageInputItemKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCUsageInputItemKind.save(SCUsageInputItemKindObj);
    end;
  end;
end;


end.