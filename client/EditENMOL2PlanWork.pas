
unit EditENMOL2PlanWork;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMOL2PlanWorkController ;

type
  TfrmENMOL2PlanWorkEdit = class(TDialogForm)

    lblMolName : TLabel;
    edtMolName: TEdit;
    lblMolCode : TLabel;
    edtMolCode: TEdit;


  HTTPRIOENMOL2PlanWork: THTTPRIO;

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
  frmENMOL2PlanWorkEdit: TfrmENMOL2PlanWorkEdit;
  ENMOL2PlanWorkObj: ENMOL2PlanWork;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMOL2PlanWorkController  ;
}
{$R *.dfm}



procedure TfrmENMOL2PlanWorkEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMolName
      ,edtMolCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtMolName.Text := ENMOL2PlanWorkObj.molName; 
    edtMolCode.Text := ENMOL2PlanWorkObj.molCode; 


  end;
end;



procedure TfrmENMOL2PlanWorkEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMolName
      ,edtMolCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENMOL2PlanWork := HTTPRIOENMOL2PlanWork as ENMOL2PlanWorkControllerSoapPort;


     ENMOL2PlanWorkObj.molName := edtMolName.Text; 

     ENMOL2PlanWorkObj.molCode := edtMolCode.Text; 

    if DialogState = dsInsert then
    begin
      ENMOL2PlanWorkObj.code:=low(Integer);
      TempENMOL2PlanWork.add(ENMOL2PlanWorkObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMOL2PlanWork.save(ENMOL2PlanWorkObj);
    end;
  end;
end;


end.