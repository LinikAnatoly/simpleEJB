
unit EditENAccess2Enelement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAccess2EnelementController ;

type
  TfrmENAccess2EnelementEdit = class(TDialogForm)
    lblIsAccess : TLabel;


  HTTPRIOENAccess2Enelement: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    Label1: TLabel;
    edtbuhName: TEdit;
    chkisAccess: TCheckBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAccess2EnelementEdit: TfrmENAccess2EnelementEdit;
  ENAccess2EnelementObj: ENAccess2Enelement;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAccess2EnelementController  ;
}
{$R *.dfm}



procedure TfrmENAccess2EnelementEdit.FormShow(Sender: TObject);

begin
  DisableControls([edtInvNumber, edtName , edtbuhName , edtEPRenName ]);

  if DialogState = dsView then
  begin
     DisableControls([chkisAccess]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      

    if ( ENAccess2EnelementObj.isAccess <> Low(Integer) ) then
     begin
        if ENAccess2EnelementObj.isAccess > 0 then
         chkisAccess.Checked := True
        else
         chkisAccess.Checked := False
      end
     else
      chkisAccess.Checked := False;



  end;
end;



procedure TfrmENAccess2EnelementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAccess2Enelement := HTTPRIOENAccess2Enelement as ENAccess2EnelementControllerSoapPort;



     if chkisAccess.Checked = True then
       ENAccess2EnelementObj.isAccess := 1
     else
       ENAccess2EnelementObj.isAccess := 0;



    if DialogState = dsInsert then
    begin
      ENAccess2EnelementObj.code:=low(Integer);
      TempENAccess2Enelement.add(ENAccess2EnelementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAccess2Enelement.save(ENAccess2EnelementObj);
    end;
  end;
end;


end.