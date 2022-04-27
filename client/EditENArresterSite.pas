
unit EditENArresterSite;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENArresterSiteController ;

type
  TfrmENArresterSiteEdit = class(TDialogForm)

  lblCode: TLabel;
	edtCode: TEdit;
  lblName: TLabel;
  edtName: TEdit;

  HTTPRIOENArresterSite: THTTPRIO;

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
  frmENArresterSiteEdit: TfrmENArresterSiteEdit;
  ENArresterSiteObj: ENArresterSite;

implementation


{uses  
    EnergyproController, EnergyproController2, ENArresterSiteController  ;
}
{$R *.dfm}



procedure TfrmENArresterSiteEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENArresterSiteObj.code);
    edtName.Text := ENArresterSiteObj.name; 


  end;
end;



procedure TfrmENArresterSiteEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENArresterSite: ENArresterSiteControllerSoapPort;
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
    TempENArresterSite := HTTPRIOENArresterSite as ENArresterSiteControllerSoapPort;


     ENArresterSiteObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENArresterSiteObj.code:=low(Integer);
      TempENArresterSite.add(ENArresterSiteObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENArresterSite.save(ENArresterSiteObj);
    end;
  end;
end;


end.