
unit EditENSite;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSiteController ;

type
  TfrmENSiteEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblSiteaddress : TLabel;
    edtSiteaddress: TEdit;
    lblSitephone : TLabel;
    edtSitephone: TEdit;


  HTTPRIOENSite: THTTPRIO;

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
  frmENSiteEdit: TfrmENSiteEdit;
  ENSiteObj: ENSite;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSiteController  ;
}
{$R *.dfm}



procedure TfrmENSiteEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSiteObj.code);
    edtName.Text := ENSiteObj.name; 
    edtSiteaddress.Text := ENSiteObj.siteaddress; 
    edtSitephone.Text := ENSiteObj.sitephone; 


  end;
end;



procedure TfrmENSiteEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSite: ENSiteControllerSoapPort;
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
    TempENSite := HTTPRIOENSite as ENSiteControllerSoapPort;


     ENSiteObj.name := edtName.Text; 

     ENSiteObj.siteaddress := edtSiteaddress.Text; 

     ENSiteObj.sitephone := edtSitephone.Text; 

    if DialogState = dsInsert then
    begin
      ENSiteObj.code:=low(Integer);
      TempENSite.add(ENSiteObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSite.save(ENSiteObj);
    end;
  end;
end;


end.