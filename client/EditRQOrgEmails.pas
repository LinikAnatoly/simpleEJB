
unit EditRQOrgEmails;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgEmailsController ;

type
  TfrmRQOrgEmailsEdit = class(TDialogForm)
    lblEmail : TLabel;
    edtEmail: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;


  HTTPRIORQOrgEmails: THTTPRIO;

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
  frmRQOrgEmailsEdit: TfrmRQOrgEmailsEdit;
  RQOrgEmailsObj: RQOrgEmails;

implementation

uses ENConsts;


{uses  
    EnergyproController, EnergyproController2, RQOrgEmailsController  ;
}
{$R *.dfm}



procedure TfrmRQOrgEmailsEdit.FormShow(Sender: TObject);
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtEmail]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtEmail.Text := RQOrgEmailsObj.email;
    MakeMultiline(edtCommentGen.Lines, RQOrgEmailsObj.commentGen);
  end;
end;



procedure TfrmRQOrgEmailsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtEmail]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
    Exit;
  end
  else
  begin
    if RQOrgEmailsObj.orgRef = nil then
      raise Exception.Create('Не визначено постачальника!');

    if RQOrgEmailsObj.orgRef.code = LOW_INT then
      raise Exception.Create('Не визначено постачальника!');

    TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;

    RQOrgEmailsObj.email := edtEmail.Text;
    RQOrgEmailsObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      RQOrgEmailsObj.code := Low(Integer);
      TempRQOrgEmails.add(RQOrgEmailsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQOrgEmails.save(RQOrgEmailsObj);
    end;
  end;
end;


end.