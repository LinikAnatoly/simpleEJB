unit EditENDocAttachmentAction;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENDocAttachmentActionController ;

type
  TfrmENDocAttachmentActionEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


    HTTPRIOENDocAttachmentAction: THTTPRIO;

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
  frmENDocAttachmentActionEdit: TfrmENDocAttachmentActionEdit;
  ENDocAttachmentActionObj: ENDocAttachmentAction;

implementation



{$R *.dfm}

procedure TfrmENDocAttachmentActionEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtName
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENDocAttachmentActionObj.code);
    edtName.Text := ENDocAttachmentActionObj.name; 

  end;
end;



procedure TfrmENDocAttachmentActionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttachmentAction: ENDocAttachmentActionControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENDocAttachmentAction := HTTPRIOENDocAttachmentAction as ENDocAttachmentActionControllerSoapPort;

    ENDocAttachmentActionObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENDocAttachmentActionObj.code := Low(Integer);
      TempENDocAttachmentAction.add(ENDocAttachmentActionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDocAttachmentAction.save(ENDocAttachmentActionObj);
    end;
  end;
end;


end.