unit EditENDocAttType2Action;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENDocAttType2ActionController ;

type
  TfrmENDocAttType2ActionEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;


    HTTPRIOENDocAttType2Action: THTTPRIO;

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
  frmENDocAttType2ActionEdit: TfrmENDocAttType2ActionEdit;
  ENDocAttType2ActionObj: ENDocAttType2Action;

implementation



{$R *.dfm}

procedure TfrmENDocAttType2ActionEdit.FormShow(Sender: TObject);
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
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENDocAttType2ActionObj.code);

  end;
end;



procedure TfrmENDocAttType2ActionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDocAttType2Action: ENDocAttType2ActionControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENDocAttType2Action := HTTPRIOENDocAttType2Action as ENDocAttType2ActionControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENDocAttType2ActionObj.code := Low(Integer);
      TempENDocAttType2Action.add(ENDocAttType2ActionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDocAttType2Action.save(ENDocAttType2ActionObj);
    end;
  end;
end;


end.