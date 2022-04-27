unit EditENActPostingSpecCharacters;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActPostingSpecCharactersController ;

type
  TfrmENActPostingSpecCharactersEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;


    HTTPRIOENActPostingSpecCharacters: THTTPRIO;

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
  frmENActPostingSpecCharactersEdit: TfrmENActPostingSpecCharactersEdit;
  ENActPostingSpecCharactersObj: ENActPostingSpecCharacters;

implementation



{$R *.dfm}

procedure TfrmENActPostingSpecCharactersEdit.FormShow(Sender: TObject);
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
    edtCode.Text := IntToStr(ENActPostingSpecCharactersObj.code);
    edtName.Text := ENActPostingSpecCharactersObj.name; 
    MakeMultiline(edtCommentGen.Lines, ENActPostingSpecCharactersObj.commentGen);

  end;
end;



procedure TfrmENActPostingSpecCharactersEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingSpecCharacters: ENActPostingSpecCharactersControllerSoapPort;
    i: Integer;
const
  CHARS = ['a'..'z', 'A'..'Z'];
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


    for i := 1 to Length(edtName.Text) do
    begin
      if not (edtName.Text[i] in CHARS) then
        raise Exception.Create('Шифр додається тільки англійською!!!');
    end;

    TempENActPostingSpecCharacters := HTTPRIOENActPostingSpecCharacters as ENActPostingSpecCharactersControllerSoapPort;

    ENActPostingSpecCharactersObj.name := edtName.Text; 
    ENActPostingSpecCharactersObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENActPostingSpecCharactersObj.code := Low(Integer);
      TempENActPostingSpecCharacters.add(ENActPostingSpecCharactersObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActPostingSpecCharacters.save(ENActPostingSpecCharactersObj);
    end;
  end;
end;


end.